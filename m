Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B008867B7D
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Feb 2024 17:16:10 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=dclg19yy;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tk5MX1XBmz3vjt
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Feb 2024 03:16:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=dclg19yy;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=arnd@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tk5Kz0kcpz3byl
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Feb 2024 03:14:47 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 39033610A3;
	Mon, 26 Feb 2024 16:14:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20479C433A6;
	Mon, 26 Feb 2024 16:14:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708964082;
	bh=Y6bQisNlMKsyiwGTrahyZKKTp5p3U6SDkFSGwdGG0nA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dclg19yy1mByCFXiGg1ZoCgY2CRIajR7i+X3gRizQJQwrFKaiFlrSKBit8AT44VEL
	 6ZrCAR5pKuF2k+mSeLQb+y6JnYIg/WDELhF2T/bWBXFzOGI310tHGWLvaSotfRe+1c
	 m0LAoFqd6ztHe9qczJy1qlFYY4zzh7TrbRxP8W3kjIXb6OEwhKcWIC8SdUTwO3xSmD
	 Ica6lldxd1dL4Wbc2jy0qop8ESNqLdv0MKKDguj0qiKwarfa7+rAIn98CZT6d0NQvp
	 mOI5EYpV9/qNg6Pj6uDQbf6x+NADoXPSKdPEV9mswZHsE3kjY8ha1QIRdks3GDMeJ9
	 jN8Qe6YBNqCIA==
From: Arnd Bergmann <arnd@kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Kees Cook <keescook@chromium.org>,
	Anna-Maria Behnsen <anna-maria@linutronix.de>
Subject: [PATCH 1/4] arch: consolidate existing CONFIG_PAGE_SIZE_*KB definitions
Date: Mon, 26 Feb 2024 17:14:11 +0100
Message-Id: <20240226161414.2316610-2-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240226161414.2316610-1-arnd@kernel.org>
References: <20240226161414.2316610-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: x86@kernel.org, loongarch@lists.linux.dev, Andreas Larsson <andreas@gaisler.com>, Catalin Marinas <catalin.marinas@arm.com>, linux-mips@vger.kernel.org, Max Filippov <jcmvbkbc@gmail.com>, Guo Ren <guoren@kernel.org>, linux-csky@vger.kernel.org, sparclinux@vger.kernel.org, linux-hexagon@vger.kernel.org, linux-riscv@lists.infradead.org, Jan Kiszka <jan.kiszka@siemens.com>, linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, Richard Weinberger <richard@nod.at>, Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>, Russell King <linux@armlinux.org.uk>, Geert Uytterhoeven <geert@linux-m68k.org>, Vineet Gupta <vgupta@kernel.org>, Matt Turner <mattst88@gmail.com>, linux-snps-arc@lists.infradead.org, linux-alpha@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Kieran Bingham <kbingham@kernel.org>, linux-um@lists.infradead.org, linux-m68k@lists.linux-m68k.org, Andy Lutomirski <luto@kernel.org>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, linux-arm-kernel@lists.
 infradead.org, Brian Cain <bcain@quicinc.com>, Michal Simek <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org, linux-openrisc@vger.kernel.org, linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Arnd Bergmann <arnd@arndb.de>

These four architectures define the same Kconfig symbols for configuring
the page size. Move the logic into a common place where it can be shared
with all other architectures.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/Kconfig                      | 58 +++++++++++++++++++++++++++++--
 arch/hexagon/Kconfig              | 25 +++----------
 arch/hexagon/include/asm/page.h   |  6 +---
 arch/loongarch/Kconfig            | 21 ++++-------
 arch/loongarch/include/asm/page.h | 10 +-----
 arch/mips/Kconfig                 | 58 +++----------------------------
 arch/mips/include/asm/page.h      | 16 +--------
 arch/sh/include/asm/page.h        | 13 +------
 arch/sh/mm/Kconfig                | 42 +++++++---------------
 9 files changed, 88 insertions(+), 161 deletions(-)

diff --git a/arch/Kconfig b/arch/Kconfig
index a5af0edd3eb8..237cea01ed9b 100644
--- a/arch/Kconfig
+++ b/arch/Kconfig
@@ -1078,17 +1078,71 @@ config HAVE_ARCH_COMPAT_MMAP_BASES
 	  and vice-versa 32-bit applications to call 64-bit mmap().
 	  Required for applications doing different bitness syscalls.
 
+config HAVE_PAGE_SIZE_4KB
+	bool
+
+config HAVE_PAGE_SIZE_8KB
+	bool
+
+config HAVE_PAGE_SIZE_16KB
+	bool
+
+config HAVE_PAGE_SIZE_32KB
+	bool
+
+config HAVE_PAGE_SIZE_64KB
+	bool
+
+config HAVE_PAGE_SIZE_256KB
+	bool
+
+choice
+	prompt "MMU page size"
+
+config PAGE_SIZE_4KB
+	bool "4KB pages"
+	depends on HAVE_PAGE_SIZE_4KB
+
+config PAGE_SIZE_8KB
+	bool "8KB pages"
+	depends on HAVE_PAGE_SIZE_8KB
+
+config PAGE_SIZE_16KB
+	bool "16KB pages"
+	depends on HAVE_PAGE_SIZE_16KB
+
+config PAGE_SIZE_32KB
+	bool "32KB pages"
+	depends on HAVE_PAGE_SIZE_32KB
+
+config PAGE_SIZE_64KB
+	bool "64KB pages"
+	depends on HAVE_PAGE_SIZE_64KB
+
+config PAGE_SIZE_256KB
+	bool "256KB pages"
+	depends on HAVE_PAGE_SIZE_256KB
+
+endchoice
+
 config PAGE_SIZE_LESS_THAN_64KB
 	def_bool y
-	depends on !ARM64_64K_PAGES
 	depends on !PAGE_SIZE_64KB
-	depends on !PARISC_PAGE_SIZE_64KB
 	depends on PAGE_SIZE_LESS_THAN_256KB
 
 config PAGE_SIZE_LESS_THAN_256KB
 	def_bool y
 	depends on !PAGE_SIZE_256KB
 
+config PAGE_SHIFT
+	int
+	default 12 if PAGE_SIZE_4KB
+	default 13 if PAGE_SIZE_8KB
+	default 14 if PAGE_SIZE_16KB
+	default 15 if PAGE_SIZE_32KB
+	default 16 if PAGE_SIZE_64KB
+	default 18 if PAGE_SIZE_256KB
+
 # This allows to use a set of generic functions to determine mmap base
 # address by giving priority to top-down scheme only if the process
 # is not in legacy mode (compat task, unlimited stack size or
diff --git a/arch/hexagon/Kconfig b/arch/hexagon/Kconfig
index a880ee067d2e..aac46ee1a000 100644
--- a/arch/hexagon/Kconfig
+++ b/arch/hexagon/Kconfig
@@ -8,6 +8,11 @@ config HEXAGON
 	select ARCH_HAS_SYNC_DMA_FOR_DEVICE
 	select ARCH_NO_PREEMPT
 	select DMA_GLOBAL_POOL
+	select FRAME_POINTER
+	select HAVE_PAGE_SIZE_4KB
+	select HAVE_PAGE_SIZE_16KB
+	select HAVE_PAGE_SIZE_64KB
+	select HAVE_PAGE_SIZE_256KB
 	# Other pending projects/to-do items.
 	# select HAVE_REGS_AND_STACK_ACCESS_API
 	# select HAVE_HW_BREAKPOINT if PERF_EVENTS
@@ -120,26 +125,6 @@ config NR_CPUS
 	  This is purely to save memory - each supported CPU adds
 	  approximately eight kilobytes to the kernel image.
 
-choice
-	prompt "Kernel page size"
-	default PAGE_SIZE_4KB
-	help
-	  Changes the default page size; use with caution.
-
-config PAGE_SIZE_4KB
-	bool "4KB"
-
-config PAGE_SIZE_16KB
-	bool "16KB"
-
-config PAGE_SIZE_64KB
-	bool "64KB"
-
-config PAGE_SIZE_256KB
-	bool "256KB"
-
-endchoice
-
 source "kernel/Kconfig.hz"
 
 endmenu
diff --git a/arch/hexagon/include/asm/page.h b/arch/hexagon/include/asm/page.h
index 10f1bc07423c..65c9bac639fa 100644
--- a/arch/hexagon/include/asm/page.h
+++ b/arch/hexagon/include/asm/page.h
@@ -13,27 +13,22 @@
 /*  This is probably not the most graceful way to handle this.  */
 
 #ifdef CONFIG_PAGE_SIZE_4KB
-#define PAGE_SHIFT 12
 #define HEXAGON_L1_PTE_SIZE __HVM_PDE_S_4KB
 #endif
 
 #ifdef CONFIG_PAGE_SIZE_16KB
-#define PAGE_SHIFT 14
 #define HEXAGON_L1_PTE_SIZE __HVM_PDE_S_16KB
 #endif
 
 #ifdef CONFIG_PAGE_SIZE_64KB
-#define PAGE_SHIFT 16
 #define HEXAGON_L1_PTE_SIZE __HVM_PDE_S_64KB
 #endif
 
 #ifdef CONFIG_PAGE_SIZE_256KB
-#define PAGE_SHIFT 18
 #define HEXAGON_L1_PTE_SIZE __HVM_PDE_S_256KB
 #endif
 
 #ifdef CONFIG_PAGE_SIZE_1MB
-#define PAGE_SHIFT 20
 #define HEXAGON_L1_PTE_SIZE __HVM_PDE_S_1MB
 #endif
 
@@ -50,6 +45,7 @@
 #define HVM_HUGEPAGE_SIZE 0x5
 #endif
 
+#define PAGE_SHIFT CONFIG_PAGE_SHIFT
 #define PAGE_SIZE  (1UL << PAGE_SHIFT)
 #define PAGE_MASK  (~((1 << PAGE_SHIFT) - 1))
 
diff --git a/arch/loongarch/Kconfig b/arch/loongarch/Kconfig
index 929f68926b34..b274784c2e26 100644
--- a/arch/loongarch/Kconfig
+++ b/arch/loongarch/Kconfig
@@ -227,15 +227,6 @@ config MACH_LOONGSON64
 config FIX_EARLYCON_MEM
 	def_bool y
 
-config PAGE_SIZE_4KB
-	bool
-
-config PAGE_SIZE_16KB
-	bool
-
-config PAGE_SIZE_64KB
-	bool
-
 config PGTABLE_2LEVEL
 	bool
 
@@ -288,7 +279,7 @@ choice
 
 config 4KB_3LEVEL
 	bool "4KB with 3 levels"
-	select PAGE_SIZE_4KB
+	select HAVE_PAGE_SIZE_4KB
 	select PGTABLE_3LEVEL
 	help
 	  This option selects 4KB page size with 3 level page tables, which
@@ -296,7 +287,7 @@ config 4KB_3LEVEL
 
 config 4KB_4LEVEL
 	bool "4KB with 4 levels"
-	select PAGE_SIZE_4KB
+	select HAVE_PAGE_SIZE_4KB
 	select PGTABLE_4LEVEL
 	help
 	  This option selects 4KB page size with 4 level page tables, which
@@ -304,7 +295,7 @@ config 4KB_4LEVEL
 
 config 16KB_2LEVEL
 	bool "16KB with 2 levels"
-	select PAGE_SIZE_16KB
+	select HAVE_PAGE_SIZE_16KB
 	select PGTABLE_2LEVEL
 	help
 	  This option selects 16KB page size with 2 level page tables, which
@@ -312,7 +303,7 @@ config 16KB_2LEVEL
 
 config 16KB_3LEVEL
 	bool "16KB with 3 levels"
-	select PAGE_SIZE_16KB
+	select HAVE_PAGE_SIZE_16KB
 	select PGTABLE_3LEVEL
 	help
 	  This option selects 16KB page size with 3 level page tables, which
@@ -320,7 +311,7 @@ config 16KB_3LEVEL
 
 config 64KB_2LEVEL
 	bool "64KB with 2 levels"
-	select PAGE_SIZE_64KB
+	select HAVE_PAGE_SIZE_64KB
 	select PGTABLE_2LEVEL
 	help
 	  This option selects 64KB page size with 2 level page tables, which
@@ -328,7 +319,7 @@ config 64KB_2LEVEL
 
 config 64KB_3LEVEL
 	bool "64KB with 3 levels"
-	select PAGE_SIZE_64KB
+	select HAVE_PAGE_SIZE_64KB
 	select PGTABLE_3LEVEL
 	help
 	  This option selects 64KB page size with 3 level page tables, which
diff --git a/arch/loongarch/include/asm/page.h b/arch/loongarch/include/asm/page.h
index 63f137ce82a4..afb6fa16b826 100644
--- a/arch/loongarch/include/asm/page.h
+++ b/arch/loongarch/include/asm/page.h
@@ -11,15 +11,7 @@
 /*
  * PAGE_SHIFT determines the page size
  */
-#ifdef CONFIG_PAGE_SIZE_4KB
-#define PAGE_SHIFT	12
-#endif
-#ifdef CONFIG_PAGE_SIZE_16KB
-#define PAGE_SHIFT	14
-#endif
-#ifdef CONFIG_PAGE_SIZE_64KB
-#define PAGE_SHIFT	16
-#endif
+#define PAGE_SHIFT	CONFIG_PAGE_SHIFT
 #define PAGE_SIZE	(_AC(1, UL) << PAGE_SHIFT)
 #define PAGE_MASK	(~(PAGE_SIZE - 1))
 
diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index 797ae590ebdb..24bac93affee 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -81,6 +81,9 @@ config MIPS
 	select HAVE_LD_DEAD_CODE_DATA_ELIMINATION
 	select HAVE_MOD_ARCH_SPECIFIC
 	select HAVE_NMI
+	select HAVE_PAGE_SIZE_4KB if !CPU_LOONGSON2EF && !CPU_LOONGSON64
+	select HAVE_PAGE_SIZE_16KB if !CPU_R3000
+	select HAVE_PAGE_SIZE_64KB if !CPU_R3000
 	select HAVE_PERF_EVENTS
 	select HAVE_PERF_REGS
 	select HAVE_PERF_USER_STACK_DUMP
@@ -1608,6 +1611,8 @@ config CPU_CAVIUM_OCTEON
 	depends on SYS_HAS_CPU_CAVIUM_OCTEON
 	select CPU_HAS_PREFETCH
 	select CPU_SUPPORTS_64BIT_KERNEL
+	select HAVE_PAGE_SIZE_8KB if !MIPS_VA_BITS_48
+	select HAVE_PAGE_SIZE_32KB if !MIPS_VA_BITS_48
 	select WEAK_ORDERING
 	select CPU_SUPPORTS_HIGHMEM
 	select CPU_SUPPORTS_HUGEPAGES
@@ -2029,59 +2034,6 @@ config ZBOOT_LOAD_ADDRESS
 
 	  This is only used if non-zero.
 
-choice
-	prompt "Kernel page size"
-	default PAGE_SIZE_4KB
-
-config PAGE_SIZE_4KB
-	bool "4kB"
-	depends on !CPU_LOONGSON2EF && !CPU_LOONGSON64
-	help
-	  This option select the standard 4kB Linux page size.  On some
-	  R3000-family processors this is the only available page size.  Using
-	  4kB page size will minimize memory consumption and is therefore
-	  recommended for low memory systems.
-
-config PAGE_SIZE_8KB
-	bool "8kB"
-	depends on CPU_CAVIUM_OCTEON
-	depends on !MIPS_VA_BITS_48
-	help
-	  Using 8kB page size will result in higher performance kernel at
-	  the price of higher memory consumption.  This option is available
-	  only on cnMIPS processors.  Note that you will need a suitable Linux
-	  distribution to support this.
-
-config PAGE_SIZE_16KB
-	bool "16kB"
-	depends on !CPU_R3000
-	help
-	  Using 16kB page size will result in higher performance kernel at
-	  the price of higher memory consumption.  This option is available on
-	  all non-R3000 family processors.  Note that you will need a suitable
-	  Linux distribution to support this.
-
-config PAGE_SIZE_32KB
-	bool "32kB"
-	depends on CPU_CAVIUM_OCTEON
-	depends on !MIPS_VA_BITS_48
-	help
-	  Using 32kB page size will result in higher performance kernel at
-	  the price of higher memory consumption.  This option is available
-	  only on cnMIPS cores.  Note that you will need a suitable Linux
-	  distribution to support this.
-
-config PAGE_SIZE_64KB
-	bool "64kB"
-	depends on !CPU_R3000
-	help
-	  Using 64kB page size will result in higher performance kernel at
-	  the price of higher memory consumption.  This option is available on
-	  all non-R3000 family processor.  Not that at the time of this
-	  writing this option is still high experimental.
-
-endchoice
-
 config ARCH_FORCE_MAX_ORDER
 	int "Maximum zone order"
 	default "13" if MIPS_HUGE_TLB_SUPPORT && PAGE_SIZE_64KB
diff --git a/arch/mips/include/asm/page.h b/arch/mips/include/asm/page.h
index ef9585d96f6b..4609cb0326cf 100644
--- a/arch/mips/include/asm/page.h
+++ b/arch/mips/include/asm/page.h
@@ -17,21 +17,7 @@
 /*
  * PAGE_SHIFT determines the page size
  */
-#ifdef CONFIG_PAGE_SIZE_4KB
-#define PAGE_SHIFT	12
-#endif
-#ifdef CONFIG_PAGE_SIZE_8KB
-#define PAGE_SHIFT	13
-#endif
-#ifdef CONFIG_PAGE_SIZE_16KB
-#define PAGE_SHIFT	14
-#endif
-#ifdef CONFIG_PAGE_SIZE_32KB
-#define PAGE_SHIFT	15
-#endif
-#ifdef CONFIG_PAGE_SIZE_64KB
-#define PAGE_SHIFT	16
-#endif
+#define PAGE_SHIFT	CONFIG_PAGE_SHIFT
 #define PAGE_SIZE	(_AC(1,UL) << PAGE_SHIFT)
 #define PAGE_MASK	(~((1 << PAGE_SHIFT) - 1))
 
diff --git a/arch/sh/include/asm/page.h b/arch/sh/include/asm/page.h
index 62f4b9edcb98..f780b467e75d 100644
--- a/arch/sh/include/asm/page.h
+++ b/arch/sh/include/asm/page.h
@@ -9,18 +9,7 @@
 #include <linux/const.h>
 
 /* PAGE_SHIFT determines the page size */
-#if defined(CONFIG_PAGE_SIZE_4KB)
-# define PAGE_SHIFT	12
-#elif defined(CONFIG_PAGE_SIZE_8KB)
-# define PAGE_SHIFT	13
-#elif defined(CONFIG_PAGE_SIZE_16KB)
-# define PAGE_SHIFT	14
-#elif defined(CONFIG_PAGE_SIZE_64KB)
-# define PAGE_SHIFT	16
-#else
-# error "Bogus kernel page size?"
-#endif
-
+#define PAGE_SHIFT	CONFIG_PAGE_SHIFT
 #define PAGE_SIZE	(_AC(1, UL) << PAGE_SHIFT)
 #define PAGE_MASK	(~(PAGE_SIZE-1))
 #define PTE_MASK	PAGE_MASK
diff --git a/arch/sh/mm/Kconfig b/arch/sh/mm/Kconfig
index 455311d9a5e9..f32a1963ff0c 100644
--- a/arch/sh/mm/Kconfig
+++ b/arch/sh/mm/Kconfig
@@ -4,6 +4,9 @@ menu "Memory management options"
 config MMU
         bool "Support for memory management hardware"
 	depends on !CPU_SH2
+	select HAVE_PAGE_SIZE_4KB
+	select HAVE_PAGE_SIZE_8KB if X2TLB
+	select HAVE_PAGE_SIZE_64KB if CPU_SH4
 	default y
 	help
 	  Some SH processors (such as SH-2/SH-2A) lack an MMU. In order to
@@ -13,6 +16,15 @@ config MMU
 	  turning this off will boot the kernel on these machines with the
 	  MMU implicitly switched off.
 
+config NOMMU
+	def_bool !MMU
+	select HAVE_PAGE_SIZE_4KB
+	select HAVE_PAGE_SIZE_8KB
+	select HAVE_PAGE_SIZE_16KB
+	select HAVE_PAGE_SIZE_64KB
+	help
+	  On MMU-less systems, any of these page sizes can be selected
+
 config PAGE_OFFSET
 	hex
 	default "0x80000000" if MMU
@@ -147,36 +159,6 @@ config HAVE_SRAM_POOL
 	bool
 	select GENERIC_ALLOCATOR
 
-choice
-	prompt "Kernel page size"
-	default PAGE_SIZE_4KB
-
-config PAGE_SIZE_4KB
-	bool "4kB"
-	help
-	  This is the default page size used by all SuperH CPUs.
-
-config PAGE_SIZE_8KB
-	bool "8kB"
-	depends on !MMU || X2TLB
-	help
-	  This enables 8kB pages as supported by SH-X2 and later MMUs.
-
-config PAGE_SIZE_16KB
-	bool "16kB"
-	depends on !MMU
-	help
-	  This enables 16kB pages on MMU-less SH systems.
-
-config PAGE_SIZE_64KB
-	bool "64kB"
-	depends on !MMU || CPU_SH4
-	help
-	  This enables support for 64kB pages, possible on all SH-4
-	  CPUs and later.
-
-endchoice
-
 choice
 	prompt "HugeTLB page size"
 	depends on HUGETLB_PAGE
-- 
2.39.2

