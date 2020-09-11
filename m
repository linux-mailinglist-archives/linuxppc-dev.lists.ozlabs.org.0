Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 596A4265C53
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Sep 2020 11:17:31 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BnqsN6VZWzDqq5
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Sep 2020 19:17:28 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BnqqR2YxMzDqTd
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Sep 2020 19:15:47 +1000 (AEST)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 2EE61ABEA;
 Fri, 11 Sep 2020 09:15:59 +0000 (UTC)
Date: Fri, 11 Sep 2020 11:15:42 +0200
From: Michal =?iso-8859-1?Q?Such=E1nek?= <msuchanek@suse.de>
To: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: Re: [PATCH] powerpc/traps: fix recoverability of machine check
 handling on book3s/32
Message-ID: <20200911091542.GE29521@kitsune.suse.cz>
References: <1c804764d38fb084b420b12ca13e8c1b2dea075e.1548166189.git.christophe.leroy@c-s.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1c804764d38fb084b420b12ca13e8c1b2dea075e.1548166189.git.christophe.leroy@c-s.fr>
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
Cc: linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>,
 Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello,

does this logic apply to "Unrecoverable System Reset" as well?

Thanks

Michal

On Tue, Jan 22, 2019 at 02:11:24PM +0000, Christophe Leroy wrote:
> Looks like book3s/32 doesn't set RI on machine check, so
> checking RI before calling die() will always be fatal
> allthought this is not an issue in most cases.
> 
> Fixes: b96672dd840f ("powerpc: Machine check interrupt is a non-maskable interrupt")
> Fixes: daf00ae71dad ("powerpc/traps: restore recoverability of machine_check interrupts")
> Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
> Cc: stable@vger.kernel.org
> ---
>  arch/powerpc/kernel/traps.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/powerpc/kernel/traps.c b/arch/powerpc/kernel/traps.c
> index 64936b60d521..c740f8bfccc9 100644
> --- a/arch/powerpc/kernel/traps.c
> +++ b/arch/powerpc/kernel/traps.c
> @@ -763,15 +763,15 @@ void machine_check_exception(struct pt_regs *regs)
>  	if (check_io_access(regs))
>  		goto bail;
>  
> -	/* Must die if the interrupt is not recoverable */
> -	if (!(regs->msr & MSR_RI))
> -		nmi_panic(regs, "Unrecoverable Machine check");
> -
>  	if (!nested)
>  		nmi_exit();
>  
>  	die("Machine check", regs, SIGBUS);
>  
> +	/* Must die if the interrupt is not recoverable */
> +	if (!(regs->msr & MSR_RI))
> +		nmi_panic(regs, "Unrecoverable Machine check");
> +
>  	return;
>  
>  bail:
> -- 
> 2.13.3
> 
