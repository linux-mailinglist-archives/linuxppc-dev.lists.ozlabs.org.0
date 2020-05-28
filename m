Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ACC01E5259
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 May 2020 02:51:34 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49XTfW6YDvzDqWx
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 May 2020 10:51:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49XTch0gJ6zDqTx
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 May 2020 10:49:56 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=ii42MUEL; dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 49XTcg4wk1z8t70
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 May 2020 10:49:55 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 49XTcg4rK0z9sSW; Thu, 28 May 2020 10:49:55 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::342;
 helo=mail-ot1-x342.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=ii42MUEL; dkim-atps=neutral
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com
 [IPv6:2607:f8b0:4864:20::342])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 49XTcf6NB3z9sSF
 for <linuxppc-dev@ozlabs.org>; Thu, 28 May 2020 10:49:54 +1000 (AEST)
Received: by mail-ot1-x342.google.com with SMTP id f18so1092098otq.11
 for <linuxppc-dev@ozlabs.org>; Wed, 27 May 2020 17:49:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TofzO6ydC7gPph43udvXGZZHJaoBAy3dfgib6Me30as=;
 b=ii42MUELTysx8DIvy9Bt0CIXRs5NCDF92KiLqK0jakyp59Ug16pKxzY+pkuceaY23J
 eT/PlxjR/8ltenc59ppyeLk+WTrcsqLyXE3LQnV2eGp2Qxy1HfyofD2bRS/DflPWgHqD
 kSen+1ukSIABzjzfaOFq7+lrnq8qUSJH+KHOQ7qgIfxLRl65f8AEIZlJmDd7vI33ckiW
 ZXZtdKuBQFdrtcm7348KMocXwj8YVjut+UJKPytuj/VP0CG4lHP0vkLa5M4v1iybQaBu
 wS3lm0pdmRATz4KULQHEazbsG0dKSJ0UmOkyHvLdNrRNcawVykXW9tY0Qj83+yqN+0sC
 LlJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TofzO6ydC7gPph43udvXGZZHJaoBAy3dfgib6Me30as=;
 b=KBMFzDp2q5n1C39nWFCreH2ULCW6Zdzjsi9S54ryFg0wu18nt5dw6mP9hS8omYsKYH
 4v9YmlZhhS5IjnHFIcDjwXzAvn8JYg41uOgo3s94mYYOeIY52gupXADCxihxko2Da6Z/
 QU9aWa0N5nPMSuc/TaGeyg5pTITkStrWaEfQdyTjiwzngIA26P6M56XXI+Zf6DJ6D6rB
 7a+ijU5Py9JrbmRom4JpoTaBe7m62bf9n324weGkW27vrm/IsXc4Bp4wO20Zjmd30M/v
 VVm3NmhWC1/7DIvCOeCcTXQY+KTHT/U7XCSGA9deldq2WcxUOfUYC+FTa3ip90uuFzoy
 UyzQ==
X-Gm-Message-State: AOAM531C5pwd0NecbivIhUTEKHqTNfGHaSrs8aRgnASseNQOsBWFI4Au
 gsZMrcpSvKhCc8RY5eMpUzxQeOeUE7IKUA9dCdibsgbmxg8=
X-Google-Smtp-Source: ABdhPJwBJ2nFLpDguos82WUzNR2zYUsKseK/+/Cebgk4lFSd+dhGtLnXElWH9qWpp+A0GJJ6FX1FMvfRuhQu2ldJ2rw=
X-Received: by 2002:a05:6830:16cd:: with SMTP id
 l13mr275567otr.28.1590626991353; 
 Wed, 27 May 2020 17:49:51 -0700 (PDT)
MIME-Version: 1.0
References: <20200526063446.2476336-1-mpe@ellerman.id.au>
In-Reply-To: <20200526063446.2476336-1-mpe@ellerman.id.au>
From: Jordan Niethe <jniethe5@gmail.com>
Date: Thu, 28 May 2020 10:49:40 +1000
Message-ID: <CACzsE9oxzdXOip7fnUF8H943FCrdEDqKRaF67YbF_MDguHWEag@mail.gmail.com>
Subject: Re: [PATCH] powerpc/64: Remove unused generic_secondary_thread_init()
To: Michael Ellerman <mpe@ellerman.id.au>
Content-Type: text/plain; charset="UTF-8"
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
Cc: linuxppc-dev@ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, May 26, 2020 at 4:36 PM Michael Ellerman <mpe@ellerman.id.au> wrote:
>
> The last caller was removed in 2014 in commit fb5a515704d7 ("powerpc:
> Remove platforms/wsp and associated pieces").
>
> Once generic_secondary_thread_init() is removed there are no longer
> any uses of book3e_secondary_thread_init() or
> generic_secondary_common_init so remove them too.
>
> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
> ---
>  arch/powerpc/include/asm/smp.h       |  1 -
>  arch/powerpc/kernel/exceptions-64e.S |  4 ----
>  arch/powerpc/kernel/head_64.S        | 18 ------------------
>  3 files changed, 23 deletions(-)
>
> diff --git a/arch/powerpc/include/asm/smp.h b/arch/powerpc/include/asm/smp.h
> index 49a25e2400f2..81a49566ccd8 100644
> --- a/arch/powerpc/include/asm/smp.h
> +++ b/arch/powerpc/include/asm/smp.h
> @@ -243,7 +243,6 @@ extern void arch_send_call_function_ipi_mask(const struct cpumask *mask);
>   * 64-bit but defining them all here doesn't harm
>   */
>  extern void generic_secondary_smp_init(void);
> -extern void generic_secondary_thread_init(void);
>  extern unsigned long __secondary_hold_spinloop;
>  extern unsigned long __secondary_hold_acknowledge;
>  extern char __secondary_hold;
> diff --git a/arch/powerpc/kernel/exceptions-64e.S b/arch/powerpc/kernel/exceptions-64e.S
> index d9ed79415100..9f9e8686798b 100644
> --- a/arch/powerpc/kernel/exceptions-64e.S
> +++ b/arch/powerpc/kernel/exceptions-64e.S
> @@ -1814,10 +1814,6 @@ _GLOBAL(book3e_secondary_core_init)
>  1:     mtlr    r28
>         blr
>
> -_GLOBAL(book3e_secondary_thread_init)
> -       mflr    r28
> -       b       3b
> -
>         .globl init_core_book3e
>  init_core_book3e:
>         /* Establish the interrupt vector base */
> diff --git a/arch/powerpc/kernel/head_64.S b/arch/powerpc/kernel/head_64.S
> index 0e05a9a47a4b..4ae2c18c5fc6 100644
> --- a/arch/powerpc/kernel/head_64.S
> +++ b/arch/powerpc/kernel/head_64.S
> @@ -302,23 +302,6 @@ _GLOBAL(fsl_secondary_thread_init)
>  1:
>  #endif

Nothing directly calls generic_secondary_thread_init() but I think
fsl_secondary_thread_init() which is directly above "falls through"
into it. fsl_secondary_thread_init() still has callers.

>
> -_GLOBAL(generic_secondary_thread_init)
> -       mr      r24,r3
> -
> -       /* turn on 64-bit mode */
> -       bl      enable_64b_mode
> -
> -       /* get a valid TOC pointer, wherever we're mapped at */
> -       bl      relative_toc
> -       tovirt(r2,r2)
> -
> -#ifdef CONFIG_PPC_BOOK3E
> -       /* Book3E initialization */
> -       mr      r3,r24
> -       bl      book3e_secondary_thread_init
> -#endif
> -       b       generic_secondary_common_init
> -
>  /*
>   * On pSeries and most other platforms, secondary processors spin
>   * in the following code.
> @@ -385,7 +368,6 @@ _GLOBAL(generic_secondary_smp_init)
>  20:
>  #endif
>
> -generic_secondary_common_init:
>         /* Set up a paca value for this processor. Since we have the
>          * physical cpu id in r24, we need to search the pacas to find
>          * which logical id maps to our physical one.
> --
> 2.25.1
>
