Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3255811A517
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Dec 2019 08:29:44 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47XpTx5X8jzDqTL
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Dec 2019 18:29:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=suse.de
 (client-ip=195.135.220.15; helo=mx1.suse.de; envelope-from=msuchanek@suse.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=suse.de
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47XpSF35XhzDqQj
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Dec 2019 18:28:12 +1100 (AEDT)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id E1E81AE3D;
 Wed, 11 Dec 2019 07:28:07 +0000 (UTC)
Date: Wed, 11 Dec 2019 08:28:06 +0100
From: Michal =?iso-8859-1?Q?Such=E1nek?= <msuchanek@suse.de>
To: Daniel Axtens <dja@axtens.net>
Subject: Re: [PATCH] powerpc/fault: kernel can extend a user process's stack
Message-ID: <20191211072806.GI3986@kitsune.suse.cz>
References: <20191211014337.28128-1-dja@axtens.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191211014337.28128-1-dja@axtens.net>
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
Cc: Tom Lane <tgl@sss.pgh.pa.us>, linuxppc-dev@lists.ozlabs.org,
 Daniel Black <daniel@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Dec 11, 2019 at 12:43:37PM +1100, Daniel Axtens wrote:
> If a process page-faults trying to write beyond the end of its
> stack, we attempt to grow the stack.
> 
> However, if the kernel attempts to write beyond the end of a
> process's stack, it takes a bad fault. This can occur when the
> kernel is trying to set up a signal frame.
> 
> Permit the kernel to grow a process's stack. The same general
> limits as to how and when the stack can be grown apply: the kernel
> code still passes through expand_stack(), so anything that goes
> beyond e.g. the rlimit should still be blocked.
> 
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=205183
Fixes: 14cf11af6cf6 ("powerpc: Merge enough to start building in
arch/powerpc.")
> Reported-by: Tom Lane <tgl@sss.pgh.pa.us>
> Cc: Daniel Black <daniel@linux.ibm.com>
> Signed-off-by: Daniel Axtens <dja@axtens.net>
> ---
>  arch/powerpc/mm/fault.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/arch/powerpc/mm/fault.c b/arch/powerpc/mm/fault.c
> index b5047f9b5dec..00183731ea22 100644
> --- a/arch/powerpc/mm/fault.c
> +++ b/arch/powerpc/mm/fault.c
> @@ -287,7 +287,17 @@ static bool bad_stack_expansion(struct pt_regs *regs, unsigned long address,
>  			if (!res)
>  				return !store_updates_sp(inst);
>  			*must_retry = true;
> +		} else if ((flags & FAULT_FLAG_WRITE) &&
> +			   !(flags & FAULT_FLAG_USER)) {
> +			/*
> +			 * the kernel can also attempt to write beyond the end
> +			 * of a process's stack - for example setting up a
> +			 * signal frame. We assume this is valid, subject to
> +			 * the checks in expand_stack() later.
> +			 */
> +			return false;
>  		}
> +
>  		return true;
>  	}
>  	return false;
> -- 
> 2.20.1
> 
