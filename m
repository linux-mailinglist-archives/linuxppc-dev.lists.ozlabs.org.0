Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 405A65FF2B7
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Oct 2022 19:06:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mpt7p0Rnlz3dqc
	for <lists+linuxppc-dev@lfdr.de>; Sat, 15 Oct 2022 04:05:58 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=lO0IO2nF;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::532; helo=mail-pg1-x532.google.com; envelope-from=groeck7@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=lO0IO2nF;
	dkim-atps=neutral
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com [IPv6:2607:f8b0:4864:20::532])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mpt6r33qHz2xH8
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 15 Oct 2022 04:05:08 +1100 (AEDT)
Received: by mail-pg1-x532.google.com with SMTP id s196so3519584pgs.3
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Oct 2022 10:05:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QTVLMW3O4S9ePwfixNp0V3MFD3JIeXifN6/TzOA1ypE=;
        b=lO0IO2nFqYv2H/Tyu2tDml6J2U0j8V3zHxMcoIuJwFIhViOTNYvEIIAGqrSsndolQx
         XN1E1xpAngZIAXoBCfOX+2BF0o4rfAfeqlb6thwtQq+TosyT2lrCA4eu7TWWnZ0ZjKpN
         jw082S5OokiXq3JHtXeiIM363fvj3YBCpH7f0E9UNqk7GJdkzGcLOGinGmY/M+Kqy9BY
         Jceii4HQAd0pj9wAKTYK7a15k6/U39XUVfbeqGwNPbNnagyQjGpVEPMWy6BDgoW4Mh+X
         LWy4BRyUB5ohRsIWSgfTWynbbSsC1sx9A005vY2CU4S5WCXwg92gnG4rCEYSjgDElBsN
         Svyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QTVLMW3O4S9ePwfixNp0V3MFD3JIeXifN6/TzOA1ypE=;
        b=HrtimFly/eYWUH80DcAbawbTWyyC/11y0YS+Czt5Z95/CGM9e+fk1hWpcver4WSa8r
         qMqT268yJtqrqLrdk1oBkrXGbnA/miZiW9pwdrgjebEopkVxjSgOD+rtH41iDz39rAVX
         8I506Bucdr7UDhn9UHy0ZuDxRhfkJ8Sy933Yzk9xpA6MMjRELKpCMD0SMqjaDm/Tab37
         dAxYNw+zkLEEbqz626gsXfeWkmwgUO7nAaG+SEvsgXAVpPOTzrtYhL7wcEdLyvLcLRVw
         GYvdmOef8DmXpMDUFxnffMbcmrPhmNoE1dfCmQ7CjzaKs1wPDBbum97I+o0mRP4IkKPQ
         5pCQ==
X-Gm-Message-State: ACrzQf3WNnjoDF2z5R9HdLGfBYkladT7NwfuNNNfEZwyAvIUQrvl3OOF
	XCVAOKZDcd5KLPto8Jfb68Y=
X-Google-Smtp-Source: AMsMyM4RJfHwdu8yJHH9tTPj+jfdGgNzZU5dY94OT9kqnIzfGqlgVDu6mhgWCoFrYBvGiec1QZ+bHg==
X-Received: by 2002:a63:4a41:0:b0:452:bab5:156a with SMTP id j1-20020a634a41000000b00452bab5156amr5387557pgl.486.1665767106384;
        Fri, 14 Oct 2022 10:05:06 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id n30-20020aa7985e000000b00562a36c0b32sm1975693pfq.119.2022.10.14.10.05.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Oct 2022 10:05:05 -0700 (PDT)
Date: Fri, 14 Oct 2022 10:05:05 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH] powerpc/64s/interrupt: Fix lost interrupts when
 returning to soft-masked context
Message-ID: <20221014170505.GA380484@roeck-us.net>
References: <20221013064418.1311104-1-npiggin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221013064418.1311104-1-npiggin@gmail.com>
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

I thought I sent this before, but I am not sure if it got lost
since I don't see it in the powerpc patchwork.

Tested-by: Guenter Roeck <linux@roeck-us.net>

Guenter

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
