Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1544026DBD8
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Sep 2020 14:43:58 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bsc8q1wF6zDqJl
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Sep 2020 22:43:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=suse.de
 (client-ip=195.135.220.15; helo=mx2.suse.de; envelope-from=msuchanek@suse.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=suse.de
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bsbds4hpXzDqNP
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Sep 2020 22:20:33 +1000 (AEST)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 401ACACBF;
 Thu, 17 Sep 2020 12:21:03 +0000 (UTC)
Date: Thu, 17 Sep 2020 14:20:28 +0200
From: Michal =?iso-8859-1?Q?Such=E1nek?= <msuchanek@suse.de>
To: Ganesh Goudar <ganeshgr@linux.ibm.com>
Subject: Re: [PATCH 1/3] powerpc/mce: remove nmi_enter/exit from real mode
 handler
Message-ID: <20200917122028.GP29778@kitsune.suse.cz>
References: <20200916172228.83271-1-ganeshgr@linux.ibm.com>
 <20200916172228.83271-2-ganeshgr@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200916172228.83271-2-ganeshgr@linux.ibm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com, mahesh@linux.vnet.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello,

On Wed, Sep 16, 2020 at 10:52:26PM +0530, Ganesh Goudar wrote:
> Use of nmi_enter/exit in real mode handler causes the kernel to panic
> and reboot on injecting slb mutihit on pseries machine running in hash
> mmu mode, As these calls try to accesses memory outside RMO region in
> real mode handler where translation is disabled.
> 
> Add check to not to use these calls on pseries machine running in hash
> mmu mode.
> 
> Fixes: 116ac378bb3f ("powerpc/64s: machine check interrupt update NMI accounting")
> Signed-off-by: Ganesh Goudar <ganeshgr@linux.ibm.com>
> ---
>  arch/powerpc/kernel/mce.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/powerpc/kernel/mce.c b/arch/powerpc/kernel/mce.c
> index ada59f6c4298..1d42fe0f5f9c 100644
> --- a/arch/powerpc/kernel/mce.c
> +++ b/arch/powerpc/kernel/mce.c
> @@ -591,10 +591,15 @@ EXPORT_SYMBOL_GPL(machine_check_print_event_info);
>  long notrace machine_check_early(struct pt_regs *regs)
>  {
>  	long handled = 0;
> -	bool nested = in_nmi();
> +	bool nested;
> +	bool is_pseries_hpt_guest;
>  	u8 ftrace_enabled = this_cpu_get_ftrace_enabled();
>  
>  	this_cpu_set_ftrace_enabled(0);
> +	is_pseries_hpt_guest = machine_is(pseries) &&
> +			       mmu_has_feature(MMU_FTR_HPTE_TABLE);
> +	/* Do not use nmi_enter/exit for pseries hpte guest */
> +	nested = is_pseries_hpt_guest ? true : in_nmi();
As pointed out already in another comment nesting is supported natively
since 69ea03b56ed2c7189ccd0b5910ad39f3cad1df21. You can simply do
nmi_enter and nmi_exit unconditionally - or only based on
is_pseries_hpt_guest.

The other question is what is the value of calling nmi_enter here at
all. It crashes in one case, we simply skip it for that case, and we are
good. Maybe we could skip it altogether?

Thanks

Michal
