Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 71D064C1D62
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Feb 2022 21:55:02 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K3pFb5ftPz3cRD
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Feb 2022 07:54:59 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=iram.es header.i=@iram.es header.a=rsa-sha256 header.s=DKIM header.b=EDuB3ZsP;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=iram.es
 (client-ip=130.206.19.174; helo=mx02.puc.rediris.es;
 envelope-from=paubert@iram.es; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=iram.es header.i=@iram.es header.a=rsa-sha256
 header.s=DKIM header.b=EDuB3ZsP; dkim-atps=neutral
X-Greylist: delayed 336 seconds by postgrey-1.36 at boromir;
 Thu, 24 Feb 2022 07:54:20 AEDT
Received: from mx02.puc.rediris.es (outbound3sev.lav.puc.rediris.es
 [130.206.19.174])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K3pDr706gz3cFg
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Feb 2022 07:54:20 +1100 (AEDT)
Received: from mta-out03.sim.rediris.es (mta-out03.sim.rediris.es
 [130.206.24.45])
 by mx02.puc.rediris.es  with ESMTP id 21NKmHO5005544-21NKmHO7005544
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Wed, 23 Feb 2022 21:48:17 +0100
Received: from mta-out03.sim.rediris.es (localhost.localdomain [127.0.0.1])
 by mta-out03.sim.rediris.es (Postfix) with ESMTPS id 6237930004B1;
 Wed, 23 Feb 2022 21:48:17 +0100 (CET)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by mta-out03.sim.rediris.es (Postfix) with ESMTP id 4F364306B1F1;
 Wed, 23 Feb 2022 21:48:17 +0100 (CET)
X-Amavis-Modified: Mail body modified (using disclaimer) -
 mta-out03.sim.rediris.es
Received: from mta-out03.sim.rediris.es ([127.0.0.1])
 by localhost (mta-out03.sim.rediris.es [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id SWZS_Scr0pjj; Wed, 23 Feb 2022 21:48:17 +0100 (CET)
Received: from lt-gp.iram.es (haproxy02.sim.rediris.es [130.206.24.70])
 by mta-out03.sim.rediris.es (Postfix) with ESMTPA id 33B8430004B1;
 Wed, 23 Feb 2022 21:48:16 +0100 (CET)
Date: Wed, 23 Feb 2022 21:48:09 +0100
From: Gabriel Paubert <paubert@iram.es>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH] powerpc/32: Clear volatile regs on syscall exit
Message-ID: <YhadiVbwao/p2N7o@lt-gp.iram.es>
References: <28b040bd2357a1879df0ca1b74094323f778a472.1645636285.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <28b040bd2357a1879df0ca1b74094323f778a472.1645636285.git.christophe.leroy@csgroup.eu>
X-FE-Policy-ID: 23:8:0:SYSTEM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; d=iram.es; s=DKIM;
 c=relaxed/relaxed; 
 h=date:from:to:cc:subject:message-id:references:mime-version:content-type;
 bh=bz6Q3MCl84at11A0B3YpTI0E5vC6G8qpl+kHI5iMXXA=;
 b=EDuB3ZsP42vMN0Hn/eWIC0hn2u5caeCWIsjU5g6NFDBpt+ZoFWaW+M6QLurdDP5epHqd1ixNrV18
 P0L9k0KpCQ4UGRA2eAe3kUkafu82cXab5JA5gUZ4d9toOaJMb/V6PqCATIcjL7OdBElWbxSUPG9F
 g8MfNbEvjJqx7/9zaSlXdrAWwl1a+V96yAsgoSnEw3YG6Q7jfEkFxtEQ8eHnQ90G+PGzRdokM6lU
 /baXqEFOXkWYpqTOuLALCmRq8RjbOj0/ilwsXpa+IxkvbhoY5GLmFpYnLfrA3uAEY5qg8m6FxOB9
 SJOUDbTkTo82sUSMAk2nrz2HwnX5zQj4uk+tQA==
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
Cc: Kees Cook <keescook@chromium.org>, linux-kernel@vger.kernel.org,
 Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Feb 23, 2022 at 06:11:36PM +0100, Christophe Leroy wrote:
> Commit a82adfd5c7cb ("hardening: Introduce CONFIG_ZERO_CALL_USED_REGS")
> added zeroing of used registers at function exit.
> 
> At the time being, PPC64 clears volatile registers on syscall exit but
> PPC32 doesn't do it for performance reason.
> 
> Add that clearing in PPC32 syscall exit as well, but only when
> CONFIG_ZERO_CALL_USED_REGS is selected.
> 
> On an 8xx, the null_syscall selftest gives:
> - Without CONFIG_ZERO_CALL_USED_REGS		: 288 cycles
> - With CONFIG_ZERO_CALL_USED_REGS		: 305 cycles
> - With CONFIG_ZERO_CALL_USED_REGS + this patch	: 319 cycles
> 
> Note that (independent of this patch), with pmac32_defconfig,
> vmlinux size is as follows with/without CONFIG_ZERO_CALL_USED_REGS:
> 
>    text	   	data	    bss	    dec	    hex		filename
> 9578869		2525210	 194400	12298479	bba8ef	vmlinux.without
> 10318045	2525210  194400	13037655	c6f057	vmlinux.with
> 
> That is a 7.7% increase on text size, 6.0% on overall size.
> 
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---
>  arch/powerpc/kernel/entry_32.S | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/arch/powerpc/kernel/entry_32.S b/arch/powerpc/kernel/entry_32.S
> index 7748c278d13c..199f23092c02 100644
> --- a/arch/powerpc/kernel/entry_32.S
> +++ b/arch/powerpc/kernel/entry_32.S
> @@ -151,6 +151,21 @@ syscall_exit_finish:
>  	bne	3f
>  	mtcr	r5
>  
> +#ifdef CONFIG_ZERO_CALL_USED_REGS
> +	/* Zero volatile regs that may contain sensitive kernel data */
> +	li	r0,0
> +	li	r4,0
> +	li	r5,0
> +	li	r6,0
> +	li	r7,0
> +	li	r8,0
> +	li	r9,0
> +	li	r10,0
> +	li	r11,0
> +	li	r12,0
> +	mtctr	r0
> +	mtxer	r0

Here, I'm almost sure that on some processors, it would be better to
separate mtctr form mtxer. mtxer is typically very expensive (pipeline
flush) but I don't know what's the best ordering for the average core.

And what about lr? Should it also be cleared?

	Gabriel

> +#endif
>  1:	lwz	r2,GPR2(r1)
>  	lwz	r1,GPR1(r1)
>  	rfi
> -- 
> 2.34.1
> 
 

