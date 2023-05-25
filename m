Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E65377106A7
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 May 2023 09:48:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QRgC36Bjpz3fCd
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 May 2023 17:47:59 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=cztDxKeN;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::d33; helo=mail-io1-xd33.google.com; envelope-from=prabhakar.csengg@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=cztDxKeN;
	dkim-atps=neutral
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com [IPv6:2607:f8b0:4864:20::d33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QRgBB5r5Pz3cMl
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 May 2023 17:47:12 +1000 (AEST)
Received: by mail-io1-xd33.google.com with SMTP id ca18e2360f4ac-77483a5a350so48249939f.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 May 2023 00:47:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685000829; x=1687592829;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PnS3KUBRyjQPPwobBxG2JUIPPiM6c8WlbyFpnNuaGkw=;
        b=cztDxKeNSz3B9j9Ph8v/g/b7C1l6YDh3xkeiMpqx9kiaNBOPaDuUisI9iQl/BRQ8Bd
         HWWu0O6PnCMHpm5TaGICNVO8Hu3qE6LuWPNtr9f5pjPi/GWfx9TPCSCwBRq2Ajd8lP8d
         gCLL/Lxyc9D9hg3EI8O8BiTpc04eTYTaT14X0Nvg/9D+Okc3D2hNVnyWwP8InjFmvDFy
         u0vHFdiaHj1VW6mnP4hHlKbtmiLAlmmAv8e9i8KOVCD5yJxctRqLQmDgCw8o1qebnQlJ
         JQMcoIvM7UsfNLGazC2El6ZTSTqdfeh+0HPbKzGdxkRX6akagLCKXlCjWzCKZsROJt4U
         xidQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685000829; x=1687592829;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PnS3KUBRyjQPPwobBxG2JUIPPiM6c8WlbyFpnNuaGkw=;
        b=Qjy09tJCeMiAgG8KnUcjtp9sDurDnKNs6FnfKLIuwN0+0p1MpV+Qtbw8DG+eLYYjjD
         dC19hxHJF10UD6WisvInMc947u6OPZiazgeackWIPMAEg20Yo3a9wUU89sDv1JPnC48A
         GGKJ7aYCg4OFM6KzhmRhsqARNdRRn7YtpGYDifWUreb0wS5eaODHQNSnHwpTwGuhVv2/
         O9/FoWcP92swg050Dj2mTv6IlyDy6uvbl1AM+LOrTAIy6nOEefJWgShG4493ngnPWkUR
         FNlw2gGeEU6pFQ5Q29QNTrDdFKIT9VhkvI04AwWfdk6ZSnfNLbSSY6hUDNEn8zhjOW+y
         Pebw==
X-Gm-Message-State: AC+VfDwQ4q9pKlaPJ1EeEmyKaj78Bl5B2dG4NBKyFVvohOAN3V56gxll
	io9Z9i7obN7ZRuLqcku2Th1Hdfm2KNZMteWqUuY=
X-Google-Smtp-Source: ACHHUZ4oIlEiVAMypWmcT1VzaZ77w0VSE82EWwJ9rvCS5CllEFhR776msnXsd3wVl5j+HJ9KuoDxd0sjRuGsDwnOI1c=
X-Received: by 2002:a5d:818d:0:b0:776:f672:8961 with SMTP id
 u13-20020a5d818d000000b00776f6728961mr86710ion.20.1685000829291; Thu, 25 May
 2023 00:47:09 -0700 (PDT)
MIME-Version: 1.0
References: <20230327121317.4081816-1-arnd@kernel.org>
In-Reply-To: <20230327121317.4081816-1-arnd@kernel.org>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 25 May 2023 08:46:43 +0100
Message-ID: <CA+V-a8sTjDWwmH5HYk6zK8oaPGGM4Qhf-ftGrQzeKmbRFj4g-w@mail.gmail.com>
Subject: Re: [PATCH 00/21] dma-mapping: unify support for cache flushes
To: Arnd Bergmann <arnd@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Rich Felker <dalias@libc.org>, linux-sh@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Linus Walleij <linus.walleij@linaro.org>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, linux-mips@vger.kernel.org, Max Filippov <jcmvbkbc@gmail.com>, Conor Dooley <conor.dooley@microchip.com>, Guo Ren <guoren@kernel.org>, linux-csky@vger.kernel.org, sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org, Will Deacon <will@kernel.org>, Christoph Hellwig <hch@lst.de>, Helge Deller <deller@gmx.de>, Russell King <linux@armlinux.org.uk>, Geert Uytterhoeven <geert@linux-m68k.org>, Vineet Gupta <vgupta@kernel.org>, linux-snps-arc@lists.infradead.org, linux-xtensa@linux-xtensa.org, Arnd Bergmann <arnd@arndb.de>, Brian Cain <bcain@quicinc.com>, Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, linux-m68k@lists.linux-m68k.org, Paul Walmsley <paul.walmsley@sifive.com>, Stafford Horne <shorne@gmail.com>, linux-arm-kernel@lists.infradead.org, Neil Armstrong <neil.armstr
 ong@linaro.org>, Michal Simek <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org, linux-openrisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, Dinh Nguyen <dinguyen@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, linux-hexagon@vger.kernel.org, linux-oxnas@groups.io, Robin Murphy <robin.murphy@arm.com>, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Arnd,

On Mon, Mar 27, 2023 at 1:14=E2=80=AFPM Arnd Bergmann <arnd@kernel.org> wro=
te:
>
> From: Arnd Bergmann <arnd@arndb.de>
>
> After a long discussion about adding SoC specific semantics for when
> to flush caches in drivers/soc/ drivers that we determined to be
> fundamentally flawed[1], I volunteered to try to move that logic into
> architecture-independent code and make all existing architectures do
> the same thing.
>
> As we had determined earlier, the behavior is wildly different across
> architectures, but most of the differences come down to either bugs
> (when required flushes are missing) or extra flushes that are harmless
> but might hurt performance.
>
> I finally found the time to come up with an implementation of this, which
> starts by replacing every outlier with one of the three common options:
>
>  1. architectures without speculative prefetching (hegagon, m68k,
>     openrisc, sh, sparc, and certain armv4 and xtensa implementations)
>     only flush their caches before a DMA, by cleaning write-back caches
>     (if any) before a DMA to the device, and by invalidating the caches
>     before a DMA from a device
>
>  2. arc, microblaze, mips, nios2, sh and later xtensa now follow the
>     normal 32-bit arm model and invalidate their writeback caches
>     again after a DMA from the device, to remove stale cache lines
>     that got prefetched during the DMA. arc, csky and mips used to
>     invalidate buffers also before the bidirectional DMA, but this
>     is now skipped whenever we know it gets invalidated again
>     after the DMA.
>
>  3. parisc, powerpc and riscv already flushed buffers before
>     a DMA_FROM_DEVICE, and these get moved to the arm64 behavior
>     that does the writeback before and invalidate after both
>     DMA_FROM_DEVICE and DMA_BIDIRECTIONAL in order to avoid the
>     problem of accidentally leaking stale data if the DMA does
>     not actually happen[2].
>
> The last patch in the series replaces the architecture specific code
> with a shared version that implements all three based on architecture
> specific parameters that are almost always determined at compile time.
>
> The difference between cases 1. and 2. is hardware specific, while betwee=
n
> 2. and 3. we need to decide which semantics we want, but I explicitly
> avoid this question in my series and leave it to be decided later.
>
> Another difference that I do not address here is what cache invalidation
> does for partical cache lines. On arm32, arm64 and powerpc, a partial
> cache line always gets written back before invalidation in order to
> ensure that data before or after the buffer is not discarded. On all
> other architectures, the assumption is cache lines are never shared
> between DMA buffer and data that is accessed by the CPU. If we end up
> always writing back dirty cache lines before a DMA (option 3 above),
> then this point becomes moot, otherwise we should probably address this
> in a follow-up series to document one behavior or the other and implement
> it consistently.
>
> Please review!
>
>       Arnd
>
> [1] https://lore.kernel.org/all/20221212115505.36770-1-prabhakar.mahadev-=
lad.rj@bp.renesas.com/
> [2] https://lore.kernel.org/all/20220606152150.GA31568@willie-the-truck/
>
> Arnd Bergmann (21):
>   openrisc: dma-mapping: flush bidirectional mappings
>   xtensa: dma-mapping: use normal cache invalidation rules
>   sparc32: flush caches in dma_sync_*for_device
>   microblaze: dma-mapping: skip extra DMA flushes
>   powerpc: dma-mapping: split out cache operation logic
>   powerpc: dma-mapping: minimize for_cpu flushing
>   powerpc: dma-mapping: always clean cache in _for_device() op
>   riscv: dma-mapping: only invalidate after DMA, not flush
>   riscv: dma-mapping: skip invalidation before bidirectional DMA
>   csky: dma-mapping: skip invalidating before DMA from device
>   mips: dma-mapping: skip invalidating before bidirectional DMA
>   mips: dma-mapping: split out cache operation logic
>   arc: dma-mapping: skip invalidating before bidirectional DMA
>   parisc: dma-mapping: use regular flush/invalidate ops
>   ARM: dma-mapping: always invalidate WT caches before DMA
>   ARM: dma-mapping: bring back dmac_{clean,inv}_range
>   ARM: dma-mapping: use arch_sync_dma_for_{device,cpu}() internally
>   ARM: drop SMP support for ARM11MPCore
>   ARM: dma-mapping: use generic form of arch_sync_dma_* helpers
>   ARM: dma-mapping: split out arch_dma_mark_clean() helper
>   dma-mapping: replace custom code with generic implementation
>
Do you plan to send v2 for this series?

Cheers,
Prabhakar

>  arch/arc/mm/dma.c                          |  66 ++------
>  arch/arm/Kconfig                           |   4 +
>  arch/arm/include/asm/cacheflush.h          |  21 +++
>  arch/arm/include/asm/glue-cache.h          |   4 +
>  arch/arm/mach-oxnas/Kconfig                |   4 -
>  arch/arm/mach-oxnas/Makefile               |   1 -
>  arch/arm/mach-oxnas/headsmp.S              |  23 ---
>  arch/arm/mach-oxnas/platsmp.c              |  96 -----------
>  arch/arm/mach-versatile/platsmp-realview.c |   4 -
>  arch/arm/mm/Kconfig                        |  19 ---
>  arch/arm/mm/cache-fa.S                     |   4 +-
>  arch/arm/mm/cache-nop.S                    |   6 +
>  arch/arm/mm/cache-v4.S                     |  13 +-
>  arch/arm/mm/cache-v4wb.S                   |   4 +-
>  arch/arm/mm/cache-v4wt.S                   |  22 ++-
>  arch/arm/mm/cache-v6.S                     |  35 +---
>  arch/arm/mm/cache-v7.S                     |   6 +-
>  arch/arm/mm/cache-v7m.S                    |   4 +-
>  arch/arm/mm/dma-mapping-nommu.c            |  36 ++--
>  arch/arm/mm/dma-mapping.c                  | 181 ++++++++++-----------
>  arch/arm/mm/proc-arm1020.S                 |   4 +-
>  arch/arm/mm/proc-arm1020e.S                |   4 +-
>  arch/arm/mm/proc-arm1022.S                 |   4 +-
>  arch/arm/mm/proc-arm1026.S                 |   4 +-
>  arch/arm/mm/proc-arm920.S                  |   4 +-
>  arch/arm/mm/proc-arm922.S                  |   4 +-
>  arch/arm/mm/proc-arm925.S                  |   4 +-
>  arch/arm/mm/proc-arm926.S                  |   4 +-
>  arch/arm/mm/proc-arm940.S                  |   4 +-
>  arch/arm/mm/proc-arm946.S                  |   4 +-
>  arch/arm/mm/proc-feroceon.S                |   8 +-
>  arch/arm/mm/proc-macros.S                  |   2 +
>  arch/arm/mm/proc-mohawk.S                  |   4 +-
>  arch/arm/mm/proc-xsc3.S                    |   4 +-
>  arch/arm/mm/proc-xscale.S                  |   6 +-
>  arch/arm64/mm/dma-mapping.c                |  28 ++--
>  arch/csky/mm/dma-mapping.c                 |  46 +++---
>  arch/hexagon/kernel/dma.c                  |  44 ++---
>  arch/m68k/kernel/dma.c                     |  43 +++--
>  arch/microblaze/kernel/dma.c               |  38 ++---
>  arch/mips/mm/dma-noncoherent.c             |  75 +++------
>  arch/nios2/mm/dma-mapping.c                |  57 +++----
>  arch/openrisc/kernel/dma.c                 |  62 ++++---
>  arch/parisc/include/asm/cacheflush.h       |   6 +-
>  arch/parisc/kernel/pci-dma.c               |  33 +++-
>  arch/powerpc/mm/dma-noncoherent.c          |  76 +++++----
>  arch/riscv/mm/dma-noncoherent.c            |  51 +++---
>  arch/sh/kernel/dma-coherent.c              |  43 +++--
>  arch/sparc/Kconfig                         |   2 +-
>  arch/sparc/kernel/ioport.c                 |  38 +++--
>  arch/xtensa/Kconfig                        |   1 -
>  arch/xtensa/include/asm/cacheflush.h       |   6 +-
>  arch/xtensa/kernel/pci-dma.c               |  47 +++---
>  include/linux/dma-sync.h                   | 107 ++++++++++++
>  54 files changed, 721 insertions(+), 699 deletions(-)
>  delete mode 100644 arch/arm/mach-oxnas/headsmp.S
>  delete mode 100644 arch/arm/mach-oxnas/platsmp.c
>  create mode 100644 include/linux/dma-sync.h
>
> --
> 2.39.2
>
> Cc: Vineet Gupta <vgupta@kernel.org>
> Cc: Russell King <linux@armlinux.org.uk>
> Cc: Neil Armstrong <neil.armstrong@linaro.org>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: Guo Ren <guoren@kernel.org>
> Cc: Brian Cain <bcain@quicinc.com>
> Cc: Geert Uytterhoeven <geert@linux-m68k.org>
> Cc: Michal Simek <monstr@monstr.eu>
> Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> Cc: Dinh Nguyen <dinguyen@kernel.org>
> Cc: Stafford Horne <shorne@gmail.com>
> Cc: Helge Deller <deller@gmx.de>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
> Cc: Paul Walmsley <paul.walmsley@sifive.com>
> Cc: Palmer Dabbelt <palmer@dabbelt.com>
> Cc: Rich Felker <dalias@libc.org>
> Cc: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
> Cc: "David S. Miller" <davem@davemloft.net>
> Cc: Max Filippov <jcmvbkbc@gmail.com>
> Cc: Christoph Hellwig <hch@lst.de>
> Cc: Robin Murphy <robin.murphy@arm.com>
> Cc: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Cc: Conor Dooley <conor.dooley@microchip.com>
> Cc: linux-snps-arc@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-oxnas@groups.io
> Cc: linux-csky@vger.kernel.org
> Cc: linux-hexagon@vger.kernel.org
> Cc: linux-m68k@lists.linux-m68k.org
> Cc: linux-mips@vger.kernel.org
> Cc: linux-openrisc@vger.kernel.org
> Cc: linux-parisc@vger.kernel.org
> Cc: linuxppc-dev@lists.ozlabs.org
> Cc: linux-riscv@lists.infradead.org
> Cc: linux-sh@vger.kernel.org
> Cc: sparclinux@vger.kernel.org
> Cc: linux-xtensa@linux-xtensa.org
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv
