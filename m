Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3838B3930E7
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 May 2021 16:27:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FrVX32Rb7z3bnV
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 May 2021 00:27:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.222.43; helo=mail-ua1-f43.google.com;
 envelope-from=geert.uytterhoeven@gmail.com; receiver=<UNKNOWN>)
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com
 [209.85.222.43])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FrVWg3ygrz2yXT
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 May 2021 00:27:10 +1000 (AEST)
Received: by mail-ua1-f43.google.com with SMTP id w28so303359uae.4
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 May 2021 07:27:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cM98qANGM6gq7eFVcE8HDyKOCug9AFSASwSyFw9YbSU=;
 b=jiCgf8Tu9EKT6Aqb6PCw9tU7bccXw6uD/f7Y4TP89MPDqaAt3iKYQ+Hz/xMLl90tsa
 8jAutLipGM5SOLHkAuSPIPM15sDHfSsaqgAZMIOmapifwhhKWwXTzdRbhMk/9uUujD5J
 8tk7KZumf21fKuUBI6bspvAt4poSdl1l74DzrF+nY1zM/FofuSUFVZ5lvIYFchmTNPWh
 2eezLC5SwpKShX0u+SQaUEUw2pQi+a4H3CGRTlFMGqU//RE9cxvyYIr+7kgHlcyr2PLB
 K0QYxhA755qk3yLG9hednWWizttPtdHzfKjdZiKmcNmzEEVp2vRyglQbpvmVp7YYXFhu
 osVQ==
X-Gm-Message-State: AOAM531V9howrNMeX2O5AyZZiDHiJKgxdVve/ABToGVlt9Gqp4mInCAZ
 NYLiYIDYaMh5lxaNUgbwai9+NS5n1tE+eJKmOAU=
X-Google-Smtp-Source: ABdhPJyES3OOZdc3Rm5NIbkZQm2fOdpikY6zvw2E4r08/fVYUQL+sn3/8udU48KybuFSf+RW5DgGz5xYI5whS1QJ9so=
X-Received: by 2002:ab0:3d1:: with SMTP id 75mr1793111uau.106.1622125626361;
 Thu, 27 May 2021 07:27:06 -0700 (PDT)
MIME-Version: 1.0
References: <20210527143047.123611-1-wangkefeng.wang@huawei.com>
In-Reply-To: <20210527143047.123611-1-wangkefeng.wang@huawei.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 27 May 2021 16:26:54 +0200
Message-ID: <CAMuHMdW0uSDEu67CoFr9dMtH_aR8SBfDd5mpZ-SzNSjacjK7VA@mail.gmail.com>
Subject: Re: [PATCH] mm: generalize ZONE_[DMA|DMA32]
To: Kefeng Wang <wangkefeng.wang@huawei.com>
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
Cc: linux-s390 <linux-s390@vger.kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>,
 Will Deacon <will@kernel.org>, Russell King <linux@armlinux.org.uk>,
 Catalin Marinas <catalin.marinas@arm.com>,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 "David S. Miller" <davem@davemloft.net>, Linux MM <linux-mm@kvack.org>,
 linux-m68k <linux-m68k@lists.linux-m68k.org>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, alpha <linux-alpha@vger.kernel.org>,
 sparclinux <sparclinux@vger.kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Richard Henderson <rth@twiddle.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, May 27, 2021 at 4:21 PM Kefeng Wang <wangkefeng.wang@huawei.com> wrote:
> ZONE_[DMA|DMA32] configs have duplicate definitions on platforms
> that subscribe them. Instead, just make them generic options which
> can be selected on applicable platforms.
>
> Also only x86/arm64 architectures could enable both ZONE_DMA and
> ZONE_DMA32 if EXPERT, add ARCH_HAS_ZONE_DMA_SET to make dma zone
> configurable and visible on the two architectures.
>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: Geert Uytterhoeven <geert@linux-m68k.org>
> Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> Cc: "David S. Miller" <davem@davemloft.net>
> Cc: Ingo Molnar <mingo@redhat.com>
> Cc: Borislav Petkov <bp@alien8.de>
> Cc: Palmer Dabbelt <palmer@dabbelt.com>
> Cc: Richard Henderson <rth@twiddle.net>
> Cc: Russell King <linux@armlinux.org.uk>
> Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>

>  arch/m68k/Kconfig                      |  5 +----

Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
