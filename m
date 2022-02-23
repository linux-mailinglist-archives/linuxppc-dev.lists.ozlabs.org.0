Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 623E04C1C50
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Feb 2022 20:34:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K3mT65M4Xz3cPd
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Feb 2022 06:34:50 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=NGFREi7R;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::432;
 helo=mail-pf1-x432.google.com; envelope-from=keescook@chromium.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256
 header.s=google header.b=NGFREi7R; dkim-atps=neutral
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com
 [IPv6:2607:f8b0:4864:20::432])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K3mSQ309Kz3bVx
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Feb 2022 06:34:12 +1100 (AEDT)
Received: by mail-pf1-x432.google.com with SMTP id l19so16344307pfu.2
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Feb 2022 11:34:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=Xx/nJWtKVQ2r/ghOXNBRnDRbIE8tV+oqAzOXtwE9kSk=;
 b=NGFREi7RSyhoYdxZH62APfuJu96ZfTSnPYczoNDq3FSnlXjP36rJtsApFddUhDQaxn
 JS2RlR7sDyWXhntPdpagf9gOdxsybBiqrqogzOWijA3Dmev4Mgr/Jtx4HYBTgKBoodfB
 S6dl220f0XV8muWKQAz+uRlRpFqN8095CatAc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Xx/nJWtKVQ2r/ghOXNBRnDRbIE8tV+oqAzOXtwE9kSk=;
 b=2Uv97qDZfSoqivpcpdgryoq66y1ypkBZ8ckSLV450rmN6Bgs+lx2fbWPsu+v5dGKNA
 iOAGL79rNAE2xA3Sz+8NI4KPjdfsKyQNLXo+kN8kNuZU9XZiihC6ZWr8UEmzgS45BFPp
 E7Oa0I9qzcYwmN7CrgP2kKvZf+u+nRyJcBUlOF+vxtx6l9xD9DZx17aPdJarksBGMIZb
 aXLyjZmEMTtkFOHP3IKf/+LmkoTkrTjHQMtRhJ5nqVvyO+H93N1W7mLln/JTFMHVAVcz
 6HROXtZBRbJ2mSEgQyIIjKpEtzmHHXamT72FN/4uZLXt6/zQSJYjuA+47sDTgoKcuJnt
 VBLw==
X-Gm-Message-State: AOAM531AJnq4NdTX0e7JhQKVW790Wz6TP3SGpkG8lcabbRZjWgcy33x+
 95p+VtasiQ2q1zkzt8CAQ066sg==
X-Google-Smtp-Source: ABdhPJxX/URmFtB+GXqYaAMCGSemAGI+Rp5Jz/r2/uASmwJg/jbwKZ3HQtTIl5ed4mWRIOcd7rbayw==
X-Received: by 2002:a63:d306:0:b0:34e:4330:efea with SMTP id
 b6-20020a63d306000000b0034e4330efeamr901399pgg.174.1645644849526; 
 Wed, 23 Feb 2022 11:34:09 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id j12sm297782pfu.79.2022.02.23.11.34.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Feb 2022 11:34:09 -0800 (PST)
Date: Wed, 23 Feb 2022 11:34:08 -0800
From: Kees Cook <keescook@chromium.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH] powerpc/32: Clear volatile regs on syscall exit
Message-ID: <202202231131.08B7EC1@keescook>
References: <28b040bd2357a1879df0ca1b74094323f778a472.1645636285.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <28b040bd2357a1879df0ca1b74094323f778a472.1645636285.git.christophe.leroy@csgroup.eu>
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
Cc: linuxppc-dev@lists.ozlabs.org, Paul Mackerras <paulus@samba.org>,
 linux-kernel@vger.kernel.org
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
> +#endif

I think this should probably be unconditional -- if this is actually
leaking kernel pointers (or data) that's pretty bad. :|

If you really want to leave it build-time selectable, maybe add a new
config that gets "select"ed by CONFIG_ZERO_CALL_USED_REGS?

(And you may want to consider wiping all "unused" registers at syscall
entry as well.)

-Kees

>  1:	lwz	r2,GPR2(r1)
>  	lwz	r1,GPR1(r1)
>  	rfi
> -- 
> 2.34.1
> 

-- 
Kees Cook
