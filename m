Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 703905931FD
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Aug 2022 17:34:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M5yxZ3skGz3062
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Aug 2022 01:34:10 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=RMNhZ+bZ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=guoren@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=RMNhZ+bZ;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M5ywp623Hz2xGg
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Aug 2022 01:33:30 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 97E26B80F63
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Aug 2022 15:33:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 499C2C433D7
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Aug 2022 15:33:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1660577605;
	bh=eg6Mjuv+GvBECgFNV3pn4xr0PACvd5NzIIajYUixH0o=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=RMNhZ+bZxwO40ELvgpo/JZCLlHAaYFVQZ7t/9N0SI8SUNk3LvrB64d1EY5Qlyt1FF
	 m3+wNET/yihu2hydsi3AvV7Yo1e2R4bhxWi63Vv7YRA5k6/8uzAOuu3Vvs9CSlydWg
	 5h5sKyU/9zL9Orr9FQ9Z8IYzkW3FlnmfBvhyofJRV3jK8c76lr/+hOdDKbPRG7X1By
	 0Xhp1pOrtmLZVbMNwdjK8G1b/o+JAFiYnlFPoJzocENwUYvxjjKKuB391d2s/WOtgZ
	 MMTw2suISwq3LO0KEUVaXa4seAxWYdnSm1KKS+O39o6tVZVYaau6Ot8p9uFahQOoD2
	 Ok9ZCe/aMXy3g==
Received: by mail-oi1-f181.google.com with SMTP id u9so8912867oiv.12
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Aug 2022 08:33:25 -0700 (PDT)
X-Gm-Message-State: ACgBeo3yoH8pnf5z4oCHM8qYftQQz/bFvruLF1h6+BQ3GgHNSbYPemzc
	QxX3uUqOm6LAWBpGluOARViaabWJ/1CHqbmLxrg=
X-Google-Smtp-Source: AA6agR5f3AlJjuJ0QakW8cqmd+7bOFPEh3ZbYFBJe7kH/N+2/ZG4CpmG1iG+6Ae2bTU0A0WQUQLgh9tCfo3bJiv88cs=
X-Received: by 2002:a05:6808:2028:b0:344:246d:2bed with SMTP id
 q40-20020a056808202800b00344246d2bedmr4523306oiw.19.1660577594163; Mon, 15
 Aug 2022 08:33:14 -0700 (PDT)
MIME-Version: 1.0
References: <20220815143959.1511278-1-zi.yan@sent.com>
In-Reply-To: <20220815143959.1511278-1-zi.yan@sent.com>
From: Guo Ren <guoren@kernel.org>
Date: Mon, 15 Aug 2022 23:33:02 +0800
X-Gmail-Original-Message-ID: <CAJF2gTRm38LEZVVu9VgfHiD-QL85zA7GO4SkVZULBWPgE5TnDA@mail.gmail.com>
Message-ID: <CAJF2gTRm38LEZVVu9VgfHiD-QL85zA7GO4SkVZULBWPgE5TnDA@mail.gmail.com>
Subject: Re: [PATCH] arch: mm: rename FORCE_MAX_ZONEORDER to ARCH_FORCE_MAX_ORDER
To: Zi Yan <ziy@nvidia.com>
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
Cc: James Houghton <jthoughton@google.com>, linux-ia64@vger.kernel.org, David Hildenbrand <david@redhat.com>, Catalin Marinas <catalin.marinas@arm.com>, Yang Shi <shy828301@gmail.com>, linux-mips@vger.kernel.org, linux-mm@kvack.org, sparclinux@vger.kernel.org, Ley Foon Tan <ley.foon.tan@intel.com>, Yoshinori Sato <ysato@users.sourceforge.jp>, linux-sh@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>, Matthew Wilcox <willy@infradead.org>, Mike Rapoport <rppt@linux.ibm.com>, Geert Uytterhoeven <geert@linux-m68k.org>, NXP Linux Team <linux-imx@nxp.com>, David Rientjes <rientjes@google.com>, linux-snps-arc@lists.infradead.org, Huacai Chen <chenhuacai@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Chris Zankel <chris@zankel.net>, John Hubbard <jhubbard@nvidia.com>, linux-xtensa@linux-xtensa.org, linuxppc-dev@lists.ozlabs.org, linux-m68k@lists.linux-m68k.org, linux-csky@vger.kernel.org, loongarch@lists.linux.dev, Vlastimil Babka <vbabka@suse.cz>, linux-arm-kernel@lists.infradead.org,
  Qin Jian <qinjian@cqplus1.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Taichi Sugaya <sugaya.taichi@socionext.com>, Vineet Gupta <vgupta@synopsys.com>, linux-kernel@vger.kernel.org, Dinh Nguyen <dinguyen@kernel.org>, "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>, Andrew Morton <akpm@linux-foundation.org>, linux-oxnas@groups.io, Shawn Guo <shawnguo@kernel.org>, "David S. Miller" <davem@davemloft.net>, Mike Rapoport <rppt@kernel.org>, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

For csky part

Acked-by: Guo Ren <guoren@kernel.org>

On Mon, Aug 15, 2022 at 10:40 PM Zi Yan <zi.yan@sent.com> wrote:
>
> From: Zi Yan <ziy@nvidia.com>
>
> This Kconfig option is used by individual arch to set its desired
> MAX_ORDER. Rename it to reflect its actual use.
>
> Acked-by: Mike Rapoport <rppt@linux.ibm.com>
> Signed-off-by: Zi Yan <ziy@nvidia.com>
> Cc: Vineet Gupta <vgupta@synopsys.com>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: Taichi Sugaya <sugaya.taichi@socionext.com>
> Cc: Neil Armstrong <narmstrong@baylibre.com>
> Cc: Qin Jian <qinjian@cqplus1.com>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Guo Ren <guoren@kernel.org>
> Cc: Huacai Chen <chenhuacai@kernel.org>
> Cc: Geert Uytterhoeven <geert@linux-m68k.org>
> Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> Cc: Dinh Nguyen <dinguyen@kernel.org>
> Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
> Cc: Yoshinori Sato <ysato@users.sourceforge.jp>
> Cc: "David S. Miller" <davem@davemloft.net>
> Cc: Chris Zankel <chris@zankel.net>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Ley Foon Tan <ley.foon.tan@intel.com>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: NXP Linux Team <linux-imx@nxp.com>
> Cc: linux-snps-arc@lists.infradead.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-oxnas@groups.io
> Cc: linux-csky@vger.kernel.org
> Cc: linux-ia64@vger.kernel.org
> Cc: loongarch@lists.linux.dev
> Cc: linux-m68k@lists.linux-m68k.org
> Cc: linux-mips@vger.kernel.org
> Cc: linuxppc-dev@lists.ozlabs.org
> Cc: linux-sh@vger.kernel.org
> Cc: sparclinux@vger.kernel.org
> Cc: linux-xtensa@linux-xtensa.org
> Cc: linux-mm@kvack.org
> Cc: linux-kernel@vger.kernel.org
> ---
>  arch/arc/Kconfig                             | 2 +-
>  arch/arm/Kconfig                             | 2 +-
>  arch/arm/configs/imx_v6_v7_defconfig         | 2 +-
>  arch/arm/configs/milbeaut_m10v_defconfig     | 2 +-
>  arch/arm/configs/oxnas_v6_defconfig          | 2 +-
>  arch/arm/configs/pxa_defconfig               | 2 +-
>  arch/arm/configs/sama7_defconfig             | 2 +-
>  arch/arm/configs/sp7021_defconfig            | 2 +-
>  arch/arm64/Kconfig                           | 2 +-
>  arch/csky/Kconfig                            | 2 +-
>  arch/ia64/Kconfig                            | 2 +-
>  arch/ia64/include/asm/sparsemem.h            | 6 +++---
>  arch/loongarch/Kconfig                       | 2 +-
>  arch/m68k/Kconfig.cpu                        | 2 +-
>  arch/mips/Kconfig                            | 2 +-
>  arch/nios2/Kconfig                           | 2 +-
>  arch/powerpc/Kconfig                         | 2 +-
>  arch/powerpc/configs/85xx/ge_imp3a_defconfig | 2 +-
>  arch/powerpc/configs/fsl-emb-nonhw.config    | 2 +-
>  arch/sh/configs/ecovec24_defconfig           | 2 +-
>  arch/sh/mm/Kconfig                           | 2 +-
>  arch/sparc/Kconfig                           | 2 +-
>  arch/xtensa/Kconfig                          | 2 +-
>  include/linux/mmzone.h                       | 4 ++--
>  24 files changed, 27 insertions(+), 27 deletions(-)
>
> diff --git a/arch/arc/Kconfig b/arch/arc/Kconfig
> index 9e3653253ef2..d9a13ccf89a3 100644
> --- a/arch/arc/Kconfig
> +++ b/arch/arc/Kconfig
> @@ -554,7 +554,7 @@ config ARC_BUILTIN_DTB_NAME
>
>  endmenu         # "ARC Architecture Configuration"
>
> -config FORCE_MAX_ZONEORDER
> +config ARCH_FORCE_MAX_ORDER
>         int "Maximum zone order"
>         default "12" if ARC_HUGEPAGE_16M
>         default "11"
> diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
> index 87badeae3181..e6c8ee56ac52 100644
> --- a/arch/arm/Kconfig
> +++ b/arch/arm/Kconfig
> @@ -1434,7 +1434,7 @@ config ARM_MODULE_PLTS
>           Disabling this is usually safe for small single-platform
>           configurations. If unsure, say y.
>
> -config FORCE_MAX_ZONEORDER
> +config ARCH_FORCE_MAX_ORDER
>         int "Maximum zone order"
>         default "12" if SOC_AM33XX
>         default "9" if SA1111
> diff --git a/arch/arm/configs/imx_v6_v7_defconfig b/arch/arm/configs/imx_v6_v7_defconfig
> index 01012537a9b9..fb283059daa0 100644
> --- a/arch/arm/configs/imx_v6_v7_defconfig
> +++ b/arch/arm/configs/imx_v6_v7_defconfig
> @@ -31,7 +31,7 @@ CONFIG_SOC_VF610=y
>  CONFIG_SMP=y
>  CONFIG_ARM_PSCI=y
>  CONFIG_HIGHMEM=y
> -CONFIG_FORCE_MAX_ZONEORDER=14
> +CONFIG_ARCH_FORCE_MAX_ORDER=14
>  CONFIG_CMDLINE="noinitrd console=ttymxc0,115200"
>  CONFIG_KEXEC=y
>  CONFIG_CPU_FREQ=y
> diff --git a/arch/arm/configs/milbeaut_m10v_defconfig b/arch/arm/configs/milbeaut_m10v_defconfig
> index 58810e98de3d..8620061e19a8 100644
> --- a/arch/arm/configs/milbeaut_m10v_defconfig
> +++ b/arch/arm/configs/milbeaut_m10v_defconfig
> @@ -26,7 +26,7 @@ CONFIG_THUMB2_KERNEL=y
>  # CONFIG_THUMB2_AVOID_R_ARM_THM_JUMP11 is not set
>  # CONFIG_ARM_PATCH_IDIV is not set
>  CONFIG_HIGHMEM=y
> -CONFIG_FORCE_MAX_ZONEORDER=12
> +CONFIG_ARCH_FORCE_MAX_ORDER=12
>  CONFIG_SECCOMP=y
>  CONFIG_KEXEC=y
>  CONFIG_EFI=y
> diff --git a/arch/arm/configs/oxnas_v6_defconfig b/arch/arm/configs/oxnas_v6_defconfig
> index 600f78b363dd..5c163a9d1429 100644
> --- a/arch/arm/configs/oxnas_v6_defconfig
> +++ b/arch/arm/configs/oxnas_v6_defconfig
> @@ -12,7 +12,7 @@ CONFIG_ARCH_OXNAS=y
>  CONFIG_MACH_OX820=y
>  CONFIG_SMP=y
>  CONFIG_NR_CPUS=16
> -CONFIG_FORCE_MAX_ZONEORDER=12
> +CONFIG_ARCH_FORCE_MAX_ORDER=12
>  CONFIG_SECCOMP=y
>  CONFIG_ARM_APPENDED_DTB=y
>  CONFIG_ARM_ATAG_DTB_COMPAT=y
> diff --git a/arch/arm/configs/pxa_defconfig b/arch/arm/configs/pxa_defconfig
> index 104a45722799..ce3f4ed50498 100644
> --- a/arch/arm/configs/pxa_defconfig
> +++ b/arch/arm/configs/pxa_defconfig
> @@ -21,7 +21,7 @@ CONFIG_MACH_AKITA=y
>  CONFIG_MACH_BORZOI=y
>  CONFIG_PXA_SYSTEMS_CPLDS=y
>  CONFIG_AEABI=y
> -CONFIG_FORCE_MAX_ZONEORDER=9
> +CONFIG_ARCH_FORCE_MAX_ORDER=9
>  CONFIG_CMDLINE="root=/dev/ram0 ro"
>  CONFIG_KEXEC=y
>  CONFIG_CPU_FREQ=y
> diff --git a/arch/arm/configs/sama7_defconfig b/arch/arm/configs/sama7_defconfig
> index 0384030d8b25..8b2cf6ddd568 100644
> --- a/arch/arm/configs/sama7_defconfig
> +++ b/arch/arm/configs/sama7_defconfig
> @@ -19,7 +19,7 @@ CONFIG_ATMEL_CLOCKSOURCE_TCB=y
>  # CONFIG_CACHE_L2X0 is not set
>  # CONFIG_ARM_PATCH_IDIV is not set
>  # CONFIG_CPU_SW_DOMAIN_PAN is not set
> -CONFIG_FORCE_MAX_ZONEORDER=15
> +CONFIG_ARCH_FORCE_MAX_ORDER=15
>  CONFIG_UACCESS_WITH_MEMCPY=y
>  # CONFIG_ATAGS is not set
>  CONFIG_CMDLINE="console=ttyS0,115200 earlyprintk ignore_loglevel"
> diff --git a/arch/arm/configs/sp7021_defconfig b/arch/arm/configs/sp7021_defconfig
> index 703b9aaa40f0..151ca8c47373 100644
> --- a/arch/arm/configs/sp7021_defconfig
> +++ b/arch/arm/configs/sp7021_defconfig
> @@ -18,7 +18,7 @@ CONFIG_ARCH_SUNPLUS=y
>  # CONFIG_VDSO is not set
>  CONFIG_SMP=y
>  CONFIG_THUMB2_KERNEL=y
> -CONFIG_FORCE_MAX_ZONEORDER=12
> +CONFIG_ARCH_FORCE_MAX_ORDER=12
>  CONFIG_VFP=y
>  CONFIG_NEON=y
>  CONFIG_MODULES=y
> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> index 571cc234d0b3..c6fcd8746f60 100644
> --- a/arch/arm64/Kconfig
> +++ b/arch/arm64/Kconfig
> @@ -1401,7 +1401,7 @@ config XEN
>         help
>           Say Y if you want to run Linux in a Virtual Machine on Xen on ARM64.
>
> -config FORCE_MAX_ZONEORDER
> +config ARCH_FORCE_MAX_ORDER
>         int
>         default "14" if ARM64_64K_PAGES
>         default "12" if ARM64_16K_PAGES
> diff --git a/arch/csky/Kconfig b/arch/csky/Kconfig
> index 3cbc2dc62baf..adee6ab36862 100644
> --- a/arch/csky/Kconfig
> +++ b/arch/csky/Kconfig
> @@ -332,7 +332,7 @@ config HIGHMEM
>         select KMAP_LOCAL
>         default y
>
> -config FORCE_MAX_ZONEORDER
> +config ARCH_FORCE_MAX_ORDER
>         int "Maximum zone order"
>         default "11"
>
> diff --git a/arch/ia64/Kconfig b/arch/ia64/Kconfig
> index 26ac8ea15a9e..c6e06cdc738f 100644
> --- a/arch/ia64/Kconfig
> +++ b/arch/ia64/Kconfig
> @@ -200,7 +200,7 @@ config IA64_CYCLONE
>           Say Y here to enable support for IBM EXA Cyclone time source.
>           If you're unsure, answer N.
>
> -config FORCE_MAX_ZONEORDER
> +config ARCH_FORCE_MAX_ORDER
>         int "MAX_ORDER (11 - 17)"  if !HUGETLB_PAGE
>         range 11 17  if !HUGETLB_PAGE
>         default "17" if HUGETLB_PAGE
> diff --git a/arch/ia64/include/asm/sparsemem.h b/arch/ia64/include/asm/sparsemem.h
> index 42ed5248fae9..84e8ce387b69 100644
> --- a/arch/ia64/include/asm/sparsemem.h
> +++ b/arch/ia64/include/asm/sparsemem.h
> @@ -11,10 +11,10 @@
>
>  #define SECTION_SIZE_BITS      (30)
>  #define MAX_PHYSMEM_BITS       (50)
> -#ifdef CONFIG_FORCE_MAX_ZONEORDER
> -#if ((CONFIG_FORCE_MAX_ZONEORDER - 1 + PAGE_SHIFT) > SECTION_SIZE_BITS)
> +#ifdef CONFIG_ARCH_FORCE_MAX_ORDER
> +#if ((CONFIG_ARCH_FORCE_MAX_ORDER - 1 + PAGE_SHIFT) > SECTION_SIZE_BITS)
>  #undef SECTION_SIZE_BITS
> -#define SECTION_SIZE_BITS (CONFIG_FORCE_MAX_ZONEORDER - 1 + PAGE_SHIFT)
> +#define SECTION_SIZE_BITS (CONFIG_ARCH_FORCE_MAX_ORDER - 1 + PAGE_SHIFT)
>  #endif
>  #endif
>
> diff --git a/arch/loongarch/Kconfig b/arch/loongarch/Kconfig
> index 4abc9a28aba4..b5b19eea0e3e 100644
> --- a/arch/loongarch/Kconfig
> +++ b/arch/loongarch/Kconfig
> @@ -369,7 +369,7 @@ config NODES_SHIFT
>         default "6"
>         depends on NUMA
>
> -config FORCE_MAX_ZONEORDER
> +config ARCH_FORCE_MAX_ORDER
>         int "Maximum zone order"
>         range 14 64 if PAGE_SIZE_64KB
>         default "14" if PAGE_SIZE_64KB
> diff --git a/arch/m68k/Kconfig.cpu b/arch/m68k/Kconfig.cpu
> index e0e9e31339c1..3b2f39508524 100644
> --- a/arch/m68k/Kconfig.cpu
> +++ b/arch/m68k/Kconfig.cpu
> @@ -399,7 +399,7 @@ config SINGLE_MEMORY_CHUNK
>           order" to save memory that could be wasted for unused memory map.
>           Say N if not sure.
>
> -config FORCE_MAX_ZONEORDER
> +config ARCH_FORCE_MAX_ORDER
>         int "Maximum zone order" if ADVANCED
>         depends on !SINGLE_MEMORY_CHUNK
>         default "11"
> diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
> index ec21f8999249..70d28976a40d 100644
> --- a/arch/mips/Kconfig
> +++ b/arch/mips/Kconfig
> @@ -2140,7 +2140,7 @@ config PAGE_SIZE_64KB
>
>  endchoice
>
> -config FORCE_MAX_ZONEORDER
> +config ARCH_FORCE_MAX_ORDER
>         int "Maximum zone order"
>         range 14 64 if MIPS_HUGE_TLB_SUPPORT && PAGE_SIZE_64KB
>         default "14" if MIPS_HUGE_TLB_SUPPORT && PAGE_SIZE_64KB
> diff --git a/arch/nios2/Kconfig b/arch/nios2/Kconfig
> index 4167f1eb4cd8..a582f72104f3 100644
> --- a/arch/nios2/Kconfig
> +++ b/arch/nios2/Kconfig
> @@ -44,7 +44,7 @@ menu "Kernel features"
>
>  source "kernel/Kconfig.hz"
>
> -config FORCE_MAX_ZONEORDER
> +config ARCH_FORCE_MAX_ORDER
>         int "Maximum zone order"
>         range 9 20
>         default "11"
> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
> index 4c466acdc70d..39d71d7701bd 100644
> --- a/arch/powerpc/Kconfig
> +++ b/arch/powerpc/Kconfig
> @@ -845,7 +845,7 @@ config DATA_SHIFT
>           in that case. If PIN_TLB is selected, it must be aligned to 8M as
>           8M pages will be pinned.
>
> -config FORCE_MAX_ZONEORDER
> +config ARCH_FORCE_MAX_ORDER
>         int "Maximum zone order"
>         range 8 9 if PPC64 && PPC_64K_PAGES
>         default "9" if PPC64 && PPC_64K_PAGES
> diff --git a/arch/powerpc/configs/85xx/ge_imp3a_defconfig b/arch/powerpc/configs/85xx/ge_imp3a_defconfig
> index f29c166998af..e7672c186325 100644
> --- a/arch/powerpc/configs/85xx/ge_imp3a_defconfig
> +++ b/arch/powerpc/configs/85xx/ge_imp3a_defconfig
> @@ -30,7 +30,7 @@ CONFIG_PREEMPT=y
>  # CONFIG_CORE_DUMP_DEFAULT_ELF_HEADERS is not set
>  CONFIG_BINFMT_MISC=m
>  CONFIG_MATH_EMULATION=y
> -CONFIG_FORCE_MAX_ZONEORDER=17
> +CONFIG_ARCH_FORCE_MAX_ORDER=17
>  CONFIG_PCI=y
>  CONFIG_PCIEPORTBUS=y
>  CONFIG_PCI_MSI=y
> diff --git a/arch/powerpc/configs/fsl-emb-nonhw.config b/arch/powerpc/configs/fsl-emb-nonhw.config
> index f14c6dbd7346..ab8a8c4530d9 100644
> --- a/arch/powerpc/configs/fsl-emb-nonhw.config
> +++ b/arch/powerpc/configs/fsl-emb-nonhw.config
> @@ -41,7 +41,7 @@ CONFIG_FIXED_PHY=y
>  CONFIG_FONT_8x16=y
>  CONFIG_FONT_8x8=y
>  CONFIG_FONTS=y
> -CONFIG_FORCE_MAX_ZONEORDER=13
> +CONFIG_ARCH_FORCE_MAX_ORDER=13
>  CONFIG_FRAMEBUFFER_CONSOLE=y
>  CONFIG_FRAME_WARN=1024
>  CONFIG_FTL=y
> diff --git a/arch/sh/configs/ecovec24_defconfig b/arch/sh/configs/ecovec24_defconfig
> index e699e2e04128..b52e14ccb450 100644
> --- a/arch/sh/configs/ecovec24_defconfig
> +++ b/arch/sh/configs/ecovec24_defconfig
> @@ -8,7 +8,7 @@ CONFIG_MODULES=y
>  CONFIG_MODULE_UNLOAD=y
>  # CONFIG_BLK_DEV_BSG is not set
>  CONFIG_CPU_SUBTYPE_SH7724=y
> -CONFIG_FORCE_MAX_ZONEORDER=12
> +CONFIG_ARCH_FORCE_MAX_ORDER=12
>  CONFIG_MEMORY_SIZE=0x10000000
>  CONFIG_FLATMEM_MANUAL=y
>  CONFIG_SH_ECOVEC=y
> diff --git a/arch/sh/mm/Kconfig b/arch/sh/mm/Kconfig
> index ba569cfb4368..411fdc0901f7 100644
> --- a/arch/sh/mm/Kconfig
> +++ b/arch/sh/mm/Kconfig
> @@ -18,7 +18,7 @@ config PAGE_OFFSET
>         default "0x80000000" if MMU
>         default "0x00000000"
>
> -config FORCE_MAX_ZONEORDER
> +config ARCH_FORCE_MAX_ORDER
>         int "Maximum zone order"
>         range 9 64 if PAGE_SIZE_16KB
>         default "9" if PAGE_SIZE_16KB
> diff --git a/arch/sparc/Kconfig b/arch/sparc/Kconfig
> index 1c852bb530ec..4d3d1af90d52 100644
> --- a/arch/sparc/Kconfig
> +++ b/arch/sparc/Kconfig
> @@ -269,7 +269,7 @@ config ARCH_SPARSEMEM_ENABLE
>  config ARCH_SPARSEMEM_DEFAULT
>         def_bool y if SPARC64
>
> -config FORCE_MAX_ZONEORDER
> +config ARCH_FORCE_MAX_ORDER
>         int "Maximum zone order"
>         default "13"
>         help
> diff --git a/arch/xtensa/Kconfig b/arch/xtensa/Kconfig
> index 12ac277282ba..bcb0c5d2abc2 100644
> --- a/arch/xtensa/Kconfig
> +++ b/arch/xtensa/Kconfig
> @@ -771,7 +771,7 @@ config HIGHMEM
>
>           If unsure, say Y.
>
> -config FORCE_MAX_ZONEORDER
> +config ARCH_FORCE_MAX_ORDER
>         int "Maximum zone order"
>         default "11"
>         help
> diff --git a/include/linux/mmzone.h b/include/linux/mmzone.h
> index 025754b0bc09..fd61347b4b1f 100644
> --- a/include/linux/mmzone.h
> +++ b/include/linux/mmzone.h
> @@ -24,10 +24,10 @@
>  #include <asm/page.h>
>
>  /* Free memory management - zoned buddy allocator.  */
> -#ifndef CONFIG_FORCE_MAX_ZONEORDER
> +#ifndef CONFIG_ARCH_FORCE_MAX_ORDER
>  #define MAX_ORDER 11
>  #else
> -#define MAX_ORDER CONFIG_FORCE_MAX_ZONEORDER
> +#define MAX_ORDER CONFIG_ARCH_FORCE_MAX_ORDER
>  #endif
>  #define MAX_ORDER_NR_PAGES (1 << (MAX_ORDER - 1))
>
> --
> 2.35.1
>


-- 
Best Regards
 Guo Ren
