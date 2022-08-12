Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C1ABF5911B8
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Aug 2022 15:50:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M44nk53fcz3bly
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Aug 2022 23:50:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.160.176; helo=mail-qt1-f176.google.com; envelope-from=geert.uytterhoeven@gmail.com; receiver=<UNKNOWN>)
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M44nJ2yrMz2xmn
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Aug 2022 23:50:27 +1000 (AEST)
Received: by mail-qt1-f176.google.com with SMTP id cb8so802761qtb.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Aug 2022 06:50:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=d7r3RnctDfwx/VdWd1r6qoq8F6MrjhkzcAY+2hCxdkY=;
        b=shI4dl7K3/QUGnbB7Bry1to01LvSdYiRPyM8/HAB+o5mXQ+dH69oFCq2dYFkVQiW/c
         Gzpw7OedSwBYKihhjRtnYCxdgiTDUZ+0ESEekE0W4icuS962HtNLl5xSXnECR/i3tdmP
         Vs5dtvxJJF6rULr3CVW5DMDVFUwCxJPWpe0td0qH3AczlkCEWg1qOp/1U33HMZNxNuya
         JxsR+9sCcadneCDszUeWXyuNC+qGJAAipyTfzWylHs2V1Th7rys+iG8STwW+eum9Fvox
         ITPyu25YLutxTN3n0HiImlLuzT3PxknfAmy0v+b1GfUZdPuueEr0NjCNHzeTyIqnTQY6
         AnlA==
X-Gm-Message-State: ACgBeo3gRiY0VgTFYaEtwtjrt5YXE4zeLQJePafwzSbGLbvBz1jzuqkR
	h54/vG3i/KudSw/sTW49Oj/FhicOylr0IA==
X-Google-Smtp-Source: AA6agR4janSW+QElxfnnCkgccVu5fBuEQ3AanVH6rEFl2CjVh5913T4PNkVD3FJ2n0hJ3M7r0vrrNg==
X-Received: by 2002:ac8:5f0c:0:b0:31f:44f1:48cc with SMTP id x12-20020ac85f0c000000b0031f44f148ccmr3605532qta.640.1660312224273;
        Fri, 12 Aug 2022 06:50:24 -0700 (PDT)
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com. [209.85.219.177])
        by smtp.gmail.com with ESMTPSA id q6-20020a05620a0d8600b006b8cf08d37bsm1789293qkl.130.2022.08.12.06.50.21
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Aug 2022 06:50:22 -0700 (PDT)
Received: by mail-yb1-f177.google.com with SMTP id 21so1578202ybf.4
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Aug 2022 06:50:21 -0700 (PDT)
X-Received: by 2002:a25:6890:0:b0:684:2c5c:1bd8 with SMTP id
 d138-20020a256890000000b006842c5c1bd8mr850130ybc.604.1660312221067; Fri, 12
 Aug 2022 06:50:21 -0700 (PDT)
MIME-Version: 1.0
References: <20220706143521.459565-1-Jason@zx2c4.com> <20220708004032.733426-1-Jason@zx2c4.com>
In-Reply-To: <20220708004032.733426-1-Jason@zx2c4.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 12 Aug 2022 15:50:09 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXnF+ArtzgVH+rEKXgcujrwW2nfyMwaKB9UYf-GC3OT_w@mail.gmail.com>
Message-ID: <CAMuHMdXnF+ArtzgVH+rEKXgcujrwW2nfyMwaKB9UYf-GC3OT_w@mail.gmail.com>
Subject: Re: [PATCH v5] random: remove CONFIG_ARCH_RANDOM
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
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
Cc: linux-s390 <linux-s390@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, Will Deacon <will@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Catalin Marinas <catalin.marinas@arm.com>, Heiko Carstens <hca@linux.ibm.com>, the arch/x86 maintainers <x86@kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>, Alexander Gordeev <agordeev@linux.ibm.com>, Borislav Petkov <bp@suse.de>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Thomas Gleixner <tglx@linutronix.de>, Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Jason,

On Fri, Jul 8, 2022 at 2:44 AM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
> When RDRAND was introduced, there was much discussion on whether it
> should be trusted and how the kernel should handle that. Initially, two
> mechanisms cropped up, CONFIG_ARCH_RANDOM, a compile time switch, and
> "nordrand", a boot-time switch.
>
> Later the thinking evolved. With a properly designed RNG, using RDRAND
> values alone won't harm anything, even if the outputs are malicious.
> Rather, the issue is whether those values are being *trusted* to be good
> or not. And so a new set of options were introduced as the real
> ones that people use -- CONFIG_RANDOM_TRUST_CPU and "random.trust_cpu".
> With these options, RDRAND is used, but it's not always credited. So in
> the worst case, it does nothing, and in the best case, maybe it helps.
>
> Along the way, CONFIG_ARCH_RANDOM's meaning got sort of pulled into the
> center and became something certain platforms force-select.
>
> The old options don't really help with much, and it's a bit odd to have
> special handling for these instructions when the kernel can deal fine
> with the existence or untrusted existence or broken existence or
> non-existence of that CPU capability.
>
> Simplify the situation by removing CONFIG_ARCH_RANDOM and using the
> ordinary asm-generic fallback pattern instead, keeping the two options
> that are actually used. For now it leaves "nordrand" for now, as the
> removal of that will take a different route.
>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Alexander Gordeev <agordeev@linux.ibm.com>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: H. Peter Anvin <hpa@zytor.com>
> Acked-by: Borislav Petkov <bp@suse.de>
> Acked-by: Heiko Carstens <hca@linux.ibm.com>
> Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>

Thanks for your patch, which is now commit 9592eef7c16ec5fb ("random:
remove CONFIG_ARCH_RANDOM") upstream.

> --- a/drivers/char/Kconfig
> +++ b/drivers/char/Kconfig
> @@ -431,7 +431,6 @@ config ADI
>  config RANDOM_TRUST_CPU
>         bool "Initialize RNG using CPU RNG instructions"
>         default y
> -       depends on ARCH_RANDOM
>         help
>           Initialize the RNG using random numbers supplied by the CPU's
>           RNG instructions (e.g. RDRAND), if supported and available. These

This change means everyone configuring a kernel will be asked this
question, even when configuring for an architecture that does not
support RNG instructions.

Perhaps this question should be hidden behind EXPERT?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
