Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 748245FDDCF
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Oct 2022 17:58:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MpDht1vLgz3c9W
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Oct 2022 02:58:54 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=K61lr/Wr;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1032; helo=mail-pj1-x1032.google.com; envelope-from=groeck7@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=K61lr/Wr;
	dkim-atps=neutral
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MpDgy6zKhz2yxF
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Oct 2022 02:58:06 +1100 (AEDT)
Received: by mail-pj1-x1032.google.com with SMTP id o17-20020a17090aac1100b0020d98b0c0f4so3944180pjq.4
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Oct 2022 08:58:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=K8IQ/P6hrlePZrHX0EB4n7iTfqA6Os8J2bdLdaQQusM=;
        b=K61lr/WrV32HHujBAbUf9SPVpumLygofUanh/w/n06PBIPRFDFVz/bimiqkebEijJl
         64SSpoohaxAdfoGUlmOGLiO8eeDzvd/4XRu0WtCPk3z145/BFRAQuHDNUF5YjKyTJctq
         3Gbi4xbyRp2JdYLn62P4KcbqwgnL94gX3QgFlVuSOZg7p93k/YpIvomGAkP/XlFToHal
         a6hK7xu/1h0R3/YlQb2kZQsYlwnFGkRdNQ1pE2F844SoZI4YZyA3kA7iWJ8MkUQF3hyX
         yHaqqEizY/Q1CwG1oUjjhQ3s9MI5OcsCzWZbxAAEOQBUHsnNOp7HWWe+PkY0I/YNH9Mr
         152g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K8IQ/P6hrlePZrHX0EB4n7iTfqA6Os8J2bdLdaQQusM=;
        b=qrCPHXQmHSx3dH0T7CUEsr1YaUaK9Is3yJkFIIEjqfaQjkCPYvVaj9o0bKZ0pQo55S
         tvWD86tjO6Al7eRYg7ck/j8+JpgjrsluAHgS5Iwy8SjVpmR/I3nmDCUSdmFpW2AysmpB
         YHBrCIQe+kWOw+4BpmAE7gdbBQqRnvh+V+KK9C2ZMACVbIrl/lyZf9q/kufBTNAd9G9D
         6XYgJ4uyeP+e66JDhG6xOPTgiUPDSjb+P6hOt+Miqfsdx+llOrFleK+I4imX1+ixrDce
         s/8nBzUwedLxa37WLLKARNmxEX0A0CYKAYhn56FAX9JSbqbEuyUhxsPLCcgIcsHGf6ym
         hGpw==
X-Gm-Message-State: ACrzQf12x2uldMbLyS6f0VgCNBsDeFdMSUuJFQ8rd1tQU28KQalIbw8N
	3T93rtlXe4ZI4tmCuX77pw4=
X-Google-Smtp-Source: AMsMyM4xuAno1k8jlQgLmlFMb6n49jUz4fQpcTPxMK3i8WNfYzOHfGAKuJU2KYzeGTjuHP4vGAsXPg==
X-Received: by 2002:a17:90b:4a43:b0:20d:8948:1733 with SMTP id lb3-20020a17090b4a4300b0020d89481733mr11062626pjb.79.1665676684658;
        Thu, 13 Oct 2022 08:58:04 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id y9-20020a17090aca8900b001faafa42a9esm3388942pjt.26.2022.10.13.08.58.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Oct 2022 08:58:04 -0700 (PDT)
Date: Thu, 13 Oct 2022 08:58:03 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH] powerpc/64s/interrupt: Fix lost interrupts when
 returning to soft-masked context
Message-ID: <20221013155803.GA759137@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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
Cc: "Jason A . Donenfeld" <Jason@zx2c4.com>, linuxppc-dev@lists.ozlabs.org, Sachin Sant <sachinp@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Oct 13, 2022 at 04:44:18PM +1000, Nicholas Piggin wrote:
> It's possible for an interrupt returning to an irqs-disabled context to
> lose a pending soft-masked irq because it branches to part of the exit
> code for irqs-enabled contexts, which is meant to clear only the
> PACA_IRQS_HARD_DIS flag from PACAIRQHAPPENED by zeroing the byte. This
> just looks like a simple thinko from a recent commit (if there was no
> hard mask pending, there would be no reason to clear it anyway).
> 
> This also adds comment to the code that actually does need to clear the
> flag.
> 
> Cc: Jason A. Donenfeld <Jason@zx2c4.com>
> Reported-by: Sachin Sant <sachinp@linux.ibm.com>
> Reported-by: Guenter Roeck <linux@roeck-us.net>
> Fixes: e485f6c751e0a ("powerpc/64/interrupt: Fix return to masked context after hard-mask irq becomes pending")
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>

Tested-by: Guenter Roeck <linux@roeck-us.net>

> ---
> I credit Sachin as well because he likely ran into it here,
> 
> https://lists.ozlabs.org/pipermail/linuxppc-dev/2022-March/240971.html
> 
> It was much more difficult to hit on his setup so when I asked him to
> re-test with a later kernel and it didn't reproduce, I thought it
> could have been unrelated. I stared at the patch for ages back then and
> didn't see the bug. I should have known better :(
> 
> I'm pretty confident this is the hang problem. Reproducer is intermittent
> for me, but I did catch it losing pending irqs here using debug code, so
> this certainly is _a_ bug that can explain the symptoms.
> 
> Thanks,
> Nick
> 
>  arch/powerpc/kernel/interrupt_64.S | 15 +++++++++++++--
>  1 file changed, 13 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/powerpc/kernel/interrupt_64.S b/arch/powerpc/kernel/interrupt_64.S
> index 904a5608cbe3..978a173eb339 100644
> --- a/arch/powerpc/kernel/interrupt_64.S
> +++ b/arch/powerpc/kernel/interrupt_64.S
> @@ -538,7 +538,7 @@ _ASM_NOKPROBE_SYMBOL(interrupt_return_\srr\()_kernel)
>  	beq	.Lfast_kernel_interrupt_return_\srr\() // EE already disabled
>  	lbz	r11,PACAIRQHAPPENED(r13)
>  	andi.	r10,r11,PACA_IRQ_MUST_HARD_MASK
> -	beq	1f // No HARD_MASK pending
> +	beq	.Lfast_kernel_interrupt_return_\srr\() // No HARD_MASK pending
>  
>  	/* Must clear MSR_EE from _MSR */
>  #ifdef CONFIG_PPC_BOOK3S
> @@ -555,12 +555,23 @@ _ASM_NOKPROBE_SYMBOL(interrupt_return_\srr\()_kernel)
>  	b	.Lfast_kernel_interrupt_return_\srr\()
>  
>  .Linterrupt_return_\srr\()_soft_enabled:
> +	/*
> +	 * In the soft-enabled case, need to double-check that we have no
> +	 * pending interrupts that might have come in before we reached the
> +	 * restart section of code, and restart the exit so those can be
> +	 * handled.
> +	 *
> +	 * If there are none, it is be possible that the interrupt still
> +	 * has PACA_IRQ_HARD_DIS set, which needs to be cleared for the
> +	 * interrupted context. This clear will not clobber a new pending
> +	 * interrupt coming in, because we're in the restart section, so
> +	 * such would return to the restart location.
> +	 */
>  #ifdef CONFIG_PPC_BOOK3S
>  	lbz	r11,PACAIRQHAPPENED(r13)
>  	andi.	r11,r11,(~PACA_IRQ_HARD_DIS)@l
>  	bne-	interrupt_return_\srr\()_kernel_restart
>  #endif
> -1:
>  	li	r11,0
>  	stb	r11,PACAIRQHAPPENED(r13) // clear the possible HARD_DIS
>  
> -- 
> 2.37.2
> 
