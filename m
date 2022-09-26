Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C323E5E995D
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Sep 2022 08:18:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MbXd40sBkz3bWD
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Sep 2022 16:18:32 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=gNVgwGKh;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::431; helo=mail-wr1-x431.google.com; envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=gNVgwGKh;
	dkim-atps=neutral
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MbXcP4BFhz2xGH
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Sep 2022 16:17:56 +1000 (AEST)
Received: by mail-wr1-x431.google.com with SMTP id t7so8500941wrm.10
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 25 Sep 2022 23:17:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=jlwM+RvsHfzPnOSPWpXWpKAkyUG85JDNTcyzhamL6cQ=;
        b=gNVgwGKhKnrZ9GDmD9ORLGcRkimac+0tKrstgsdzW9GlvMguAbGIb3arNu3tleysro
         /6ddD1Go1nRQ8bhb8PL60JSDTMajayW3ej2ce4AOsY4UILgfDujE+lR14T9imns1m5Ex
         pr0sUFRKqFkkuBxOtyhs70Ilgxpza8IKQAhY0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=jlwM+RvsHfzPnOSPWpXWpKAkyUG85JDNTcyzhamL6cQ=;
        b=2H6wI18ajQ3w2e1R+9jlu3NkjHi0anaGI05Qqrcmj7Mx8svPHY1ahlLkV+ImvHE6qM
         FjB/BerXzN28p3qhy4RUsrA1aKrB5BLLkI1v/ozUhfIYFvhpPOv0s3ujhYe1d0GZ5990
         WEIM6ZHqWTOkYVzLiw6jpiM4AbNhuBcrFMUDIbfAnOQsEzRp4YVJvMegeemfJ7lEXGa7
         dccsQ8MVlNvhNyt+sC4H45o/aL1cSZI6iNa3lVk/LVeHjn2Gs1iGuQORoVl+Wm7Plu5N
         ERU6eNdFz4DwVa3gACik3Xupz3639f/4gdZ/9awStZRbV7FOVjB1HkN9jJ9FCl/nCeLK
         y4mQ==
X-Gm-Message-State: ACrzQf2N1ejsW02Q+LbgL+dtZQJKHIo940l81ZMPNKk6DiUhVqXBLZIO
	Umu317xvNoCd9GCpbz0YzdLEZ+eQa1vMtWGUUc7HT0//oAE=
X-Google-Smtp-Source: AMsMyM5PUZI7wfdV9nu+cJZRBxNvQplkZ4l04lbKy9wO/oiQtJCNaiDQ76pJXlserdrxnEZaKMcMyRHGKw76huC/0/E=
X-Received: by 2002:a05:6000:114b:b0:228:ab76:fa00 with SMTP id
 d11-20020a056000114b00b00228ab76fa00mr11834405wrx.628.1664173069900; Sun, 25
 Sep 2022 23:17:49 -0700 (PDT)
MIME-Version: 1.0
References: <20220919052755.800907-1-mpe@ellerman.id.au>
In-Reply-To: <20220919052755.800907-1-mpe@ellerman.id.au>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 26 Sep 2022 06:17:38 +0000
Message-ID: <CACPK8Xd44jVwK11i4MnxpfV=OQMCOLPEJqz80DNPuRNjMQ6ASw@mail.gmail.com>
Subject: Re: [PATCH] powerpc/microwatt: Remove unused early debug code
To: Michael Ellerman <mpe@ellerman.id.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, 
	Paul Mackerras <paulus@ozlabs.org>
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
Cc: lukas.bulwahn@gmail.com, linuxppc-dev@lists.ozlabs.org, andrew.donnellan@au1.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 19 Sept 2022 at 05:28, Michael Ellerman <mpe@ellerman.id.au> wrote:
>
> The original microwatt submission[1] included some early debug code for
> using the Microwatt "potato" UART.

The potato is indeed dead.

>
> The series that was eventually merged switched to using a standard UART,
> and so doesn't need any special early debug handling. But some of the
> original code was merged accidentally under the non-existent
> CONFIG_PPC_EARLY_DEBUG_MICROWATT.

The kconfig never got added, so you're right. Using the "legacy serial
console" must be how we get early console on microwatt? I can't quite
work it out.

May or may not be related to https://github.com/linuxppc/issues/issues/413

>
> Drop the unused code.
>
> 1: https://lore.kernel.org/linuxppc-dev/20200509050340.GD1464954@thinks.paulus.ozlabs.org/
>
> Fixes: 48b545b8018d ("powerpc/microwatt: Use standard 16550 UART for console")
> Reported-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
> ---
>  arch/powerpc/kernel/udbg_16550.c | 39 --------------------------------
>  1 file changed, 39 deletions(-)
>
> diff --git a/arch/powerpc/kernel/udbg_16550.c b/arch/powerpc/kernel/udbg_16550.c
> index d3942de254c6..ddfbc74bf85f 100644
> --- a/arch/powerpc/kernel/udbg_16550.c
> +++ b/arch/powerpc/kernel/udbg_16550.c
> @@ -296,42 +296,3 @@ void __init udbg_init_40x_realmode(void)
>  }
>
>  #endif /* CONFIG_PPC_EARLY_DEBUG_40x */
> -
> -#ifdef CONFIG_PPC_EARLY_DEBUG_MICROWATT
> -
> -#define UDBG_UART_MW_ADDR      ((void __iomem *)0xc0002000)
> -
> -static u8 udbg_uart_in_isa300_rm(unsigned int reg)
> -{
> -       uint64_t msr = mfmsr();
> -       uint8_t  c;
> -
> -       mtmsr(msr & ~(MSR_EE|MSR_DR));
> -       isync();
> -       eieio();
> -       c = __raw_rm_readb(UDBG_UART_MW_ADDR + (reg << 2));
> -       mtmsr(msr);
> -       isync();
> -       return c;
> -}
> -
> -static void udbg_uart_out_isa300_rm(unsigned int reg, u8 val)
> -{
> -       uint64_t msr = mfmsr();
> -
> -       mtmsr(msr & ~(MSR_EE|MSR_DR));
> -       isync();
> -       eieio();
> -       __raw_rm_writeb(val, UDBG_UART_MW_ADDR + (reg << 2));
> -       mtmsr(msr);
> -       isync();
> -}
> -
> -void __init udbg_init_debug_microwatt(void)
> -{
> -       udbg_uart_in = udbg_uart_in_isa300_rm;
> -       udbg_uart_out = udbg_uart_out_isa300_rm;
> -       udbg_use_uart();
> -}
> -
> -#endif /* CONFIG_PPC_EARLY_DEBUG_MICROWATT */
> --
> 2.37.2
>
