Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 18659198C55
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 Mar 2020 08:32:04 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48rzy91cy9zDqWw
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 Mar 2020 17:32:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.a=rsa-sha256
 header.s=mail header.b=mlmBkoCl; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48rzns2JQxzDqsG
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 31 Mar 2020 17:24:49 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 48rznn2YCjz9v0KK;
 Tue, 31 Mar 2020 08:24:45 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=mlmBkoCl; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id f8loIFM11vdN; Tue, 31 Mar 2020 08:24:45 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 48rznm75C6z9v0KC;
 Tue, 31 Mar 2020 08:24:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1585635885; bh=GKkljFPHKr5zqnWLQzEwXUS7sUTZC8JRqVogEtIC6Yg=;
 h=In-Reply-To:References:From:Subject:To:Cc:Date:From;
 b=mlmBkoClea6mbbrakpq+XAZfu9Gfnr60pr2UlqjdjnfUpvKslVKV5zOTsnc0g7mSD
 UeHEVzpFDNGFwU1cNzIfymCwlyNyvLRENmZGEdw91ayb3cwXZRADLdiZ3OOTyw49cx
 pAPeP4ii0x7/u3bU7hmTO8sOcSu/1yeCzTVG6bM8=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 847C98B787;
 Tue, 31 Mar 2020 08:24:45 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id PMfy4sVzP0dE; Tue, 31 Mar 2020 08:24:45 +0200 (CEST)
Received: from pc16570vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 56CC18B784;
 Tue, 31 Mar 2020 08:24:44 +0200 (CEST)
Received: by pc16570vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 52A5D65674; Tue, 31 Mar 2020 06:24:44 +0000 (UTC)
Message-Id: <fa5c9d271a309df099c535b4425c5665a065e605.1585635837.git.christophe.leroy@c-s.fr>
In-Reply-To: <40899eb1b8f10da3706acd06c3d46d2418c8886e.1585635837.git.christophe.leroy@c-s.fr>
References: <40899eb1b8f10da3706acd06c3d46d2418c8886e.1585635837.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH 04/10] powerpc: Remove support for 40x
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Tue, 31 Mar 2020 06:24:44 +0000 (UTC)
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Now that 40x platforms have gone, remove support
for 40x in the core of powerpc arch.

Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
---
 arch/powerpc/Kconfig                         |   8 +-
 arch/powerpc/Kconfig.debug                   |  13 -
 arch/powerpc/Makefile                        |   1 -
 arch/powerpc/include/asm/cache.h             |   2 +-
 arch/powerpc/include/asm/cputable.h          |   7 -
 arch/powerpc/include/asm/irq.h               |   2 +-
 arch/powerpc/include/asm/mmu.h               |   4 -
 arch/powerpc/include/asm/nohash/32/mmu-40x.h |  68 --
 arch/powerpc/include/asm/nohash/32/pgtable.h |   4 +-
 arch/powerpc/include/asm/nohash/32/pte-40x.h | 105 ---
 arch/powerpc/include/asm/nohash/mmu.h        |   5 +-
 arch/powerpc/include/asm/ppc_asm.h           |   4 -
 arch/powerpc/include/asm/reg.h               |  27 +-
 arch/powerpc/include/asm/reg_booke.h         | 154 +---
 arch/powerpc/include/asm/time.h              |  20 -
 arch/powerpc/include/asm/udbg.h              |   1 -
 arch/powerpc/kernel/Makefile                 |   1 -
 arch/powerpc/kernel/asm-offsets.c            |   4 +-
 arch/powerpc/kernel/cputable.c               | 365 --------
 arch/powerpc/kernel/entry_32.S               |  55 +-
 arch/powerpc/kernel/head_32.h                |  30 -
 arch/powerpc/kernel/head_40x.S               | 905 -------------------
 arch/powerpc/kernel/irq.c                    |   2 +-
 arch/powerpc/kernel/kgdb.c                   |   4 +-
 arch/powerpc/kernel/misc_32.S                |  48 -
 arch/powerpc/kernel/setup.h                  |   2 +-
 arch/powerpc/kernel/setup_32.c               |   2 +-
 arch/powerpc/kernel/time.c                   |   2 +-
 arch/powerpc/kernel/traps.c                  |   2 +-
 arch/powerpc/kernel/udbg.c                   |   3 -
 arch/powerpc/kernel/udbg_16550.c             |  23 -
 arch/powerpc/mm/mmu_decl.h                   |   8 +-
 arch/powerpc/mm/nohash/40x.c                 | 154 ----
 arch/powerpc/mm/nohash/Makefile              |   1 -
 arch/powerpc/mm/nohash/tlb_low.S             |  27 +-
 arch/powerpc/platforms/44x/Kconfig           |   3 +-
 arch/powerpc/platforms/4xx/pci.c             | 100 --
 arch/powerpc/platforms/Kconfig.cputype       |   9 +-
 38 files changed, 30 insertions(+), 2145 deletions(-)
 delete mode 100644 arch/powerpc/include/asm/nohash/32/mmu-40x.h
 delete mode 100644 arch/powerpc/include/asm/nohash/32/pte-40x.h
 delete mode 100644 arch/powerpc/kernel/head_40x.S
 delete mode 100644 arch/powerpc/mm/nohash/40x.c

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 497b7d0b2d7e..d84844e07d6e 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -321,7 +321,7 @@ config ARCH_SUSPEND_POSSIBLE
 	def_bool y
 	depends on ADB_PMU || PPC_EFIKA || PPC_LITE5200 || PPC_83xx || \
 		   (PPC_85xx && !PPC_E500MC) || PPC_86xx || PPC_PSERIES \
-		   || 44x || 40x
+		   || 44x
 
 config ARCH_SUSPEND_NONZERO_CPU
 	def_bool y
@@ -352,7 +352,7 @@ config ARCH_SUPPORTS_UPROBES
 
 config PPC_ADV_DEBUG_REGS
 	bool
-	depends on 40x || BOOKE
+	depends on BOOKE
 	default y
 
 config PPC_ADV_DEBUG_IACS
@@ -1023,7 +1023,7 @@ config GENERIC_ISA_DMA
 config PPC_INDIRECT_PCI
 	bool
 	depends on PCI
-	default y if 40x || 44x
+	default y if 44x
 
 config SBUS
 	bool
@@ -1048,7 +1048,7 @@ config FSL_PMC
 config PPC4xx_CPM
 	bool
 	default y
-	depends on SUSPEND && (44x || 40x)
+	depends on SUSPEND && 44x
 	help
 	  PPC4xx Clock Power Management (CPM) support (suspend/resume).
 	  It also enables support for two different idle states (idle-wait
diff --git a/arch/powerpc/Kconfig.debug b/arch/powerpc/Kconfig.debug
index 0b063830eea8..5fe2b5667b42 100644
--- a/arch/powerpc/Kconfig.debug
+++ b/arch/powerpc/Kconfig.debug
@@ -224,14 +224,6 @@ config PPC_EARLY_DEBUG_44x
 	  inbuilt serial port.  If you enable this, ensure you set
 	  PPC_EARLY_DEBUG_44x_PHYSLOW below to suit your target board.
 
-config PPC_EARLY_DEBUG_40x
-	bool "Early serial debugging for IBM/AMCC 40x CPUs"
-	depends on 40x
-	help
-	  Select this to enable early debugging for IBM 40x chips via the
-	  inbuilt serial port. This works on chips with a 16550 compatible
-	  UART. Xilinx chips with uartlite cannot use this option.
-
 config PPC_EARLY_DEBUG_CPM
 	bool "Early serial debugging for Freescale CPM-based serial ports"
 	depends on SERIAL_CPM
@@ -332,11 +324,6 @@ config PPC_EARLY_DEBUG_44x_PHYSHIGH
 	depends on PPC_EARLY_DEBUG_44x
 	default "0x1"
 
-config PPC_EARLY_DEBUG_40x_PHYSADDR
-	hex "Early debug UART physical address"
-	depends on PPC_EARLY_DEBUG_40x
-	default "0xef600300"
-
 config PPC_EARLY_DEBUG_CPM_ADDR
 	hex "CPM UART early debug transmit descriptor address"
 	depends on PPC_EARLY_DEBUG_CPM
diff --git a/arch/powerpc/Makefile b/arch/powerpc/Makefile
index cbe5ca4f0ee5..76e13d1c3fec 100644
--- a/arch/powerpc/Makefile
+++ b/arch/powerpc/Makefile
@@ -267,7 +267,6 @@ KBUILD_CFLAGS += $(cflags-y)
 
 head-y				:= arch/powerpc/kernel/head_$(BITS).o
 head-$(CONFIG_PPC_8xx)		:= arch/powerpc/kernel/head_8xx.o
-head-$(CONFIG_40x)		:= arch/powerpc/kernel/head_40x.o
 head-$(CONFIG_44x)		:= arch/powerpc/kernel/head_44x.o
 head-$(CONFIG_FSL_BOOKE)	:= arch/powerpc/kernel/head_fsl_booke.o
 
diff --git a/arch/powerpc/include/asm/cache.h b/arch/powerpc/include/asm/cache.h
index 72b81015cebe..91a1badacbea 100644
--- a/arch/powerpc/include/asm/cache.h
+++ b/arch/powerpc/include/asm/cache.h
@@ -6,7 +6,7 @@
 
 
 /* bytes per L1 cache line */
-#if defined(CONFIG_PPC_8xx) || defined(CONFIG_403GCX)
+#if defined(CONFIG_PPC_8xx)
 #define L1_CACHE_SHIFT		4
 #define MAX_COPY_PREFETCH	1
 #define IFETCH_ALIGN_SHIFT	2
diff --git a/arch/powerpc/include/asm/cputable.h b/arch/powerpc/include/asm/cputable.h
index 40a4d3c6fd99..5f336925043a 100644
--- a/arch/powerpc/include/asm/cputable.h
+++ b/arch/powerpc/include/asm/cputable.h
@@ -377,7 +377,6 @@ static inline void cpu_feature_keys_init(void) { }
 	    CPU_FTR_COMMON | CPU_FTR_FPU_UNAVAILABLE  | CPU_FTR_NOEXECUTE)
 #define CPU_FTRS_CLASSIC32	(CPU_FTR_COMMON)
 #define CPU_FTRS_8XX	(CPU_FTR_NOEXECUTE)
-#define CPU_FTRS_40X	(CPU_FTR_NODSISRALIGN | CPU_FTR_NOEXECUTE)
 #define CPU_FTRS_44X	(CPU_FTR_NODSISRALIGN | CPU_FTR_NOEXECUTE)
 #define CPU_FTRS_440x6	(CPU_FTR_NODSISRALIGN | CPU_FTR_NOEXECUTE | \
 	    CPU_FTR_INDEXED_DCR)
@@ -516,9 +515,6 @@ enum {
 #ifdef CONFIG_PPC_8xx
 	    CPU_FTRS_8XX |
 #endif
-#ifdef CONFIG_40x
-	    CPU_FTRS_40X |
-#endif
 #ifdef CONFIG_44x
 	    CPU_FTRS_44X | CPU_FTRS_440x6 |
 #endif
@@ -594,9 +590,6 @@ enum {
 #ifdef CONFIG_PPC_8xx
 	    CPU_FTRS_8XX &
 #endif
-#ifdef CONFIG_40x
-	    CPU_FTRS_40X &
-#endif
 #ifdef CONFIG_44x
 	    CPU_FTRS_44X & CPU_FTRS_440x6 &
 #endif
diff --git a/arch/powerpc/include/asm/irq.h b/arch/powerpc/include/asm/irq.h
index 814dfab7e392..7449fb1c4933 100644
--- a/arch/powerpc/include/asm/irq.h
+++ b/arch/powerpc/include/asm/irq.h
@@ -40,7 +40,7 @@ struct pt_regs;
 
 #define __ARCH_HAS_DO_SOFTIRQ
 
-#if defined(CONFIG_BOOKE) || defined(CONFIG_40x)
+#ifdef CONFIG_BOOKE
 /*
  * Per-cpu stacks for handling critical, debug and machine check
  * level interrupts.
diff --git a/arch/powerpc/include/asm/mmu.h b/arch/powerpc/include/asm/mmu.h
index 0699cfeeb8c9..43a1550910f2 100644
--- a/arch/powerpc/include/asm/mmu.h
+++ b/arch/powerpc/include/asm/mmu.h
@@ -16,7 +16,6 @@
  */
 #define MMU_FTR_HPTE_TABLE		ASM_CONST(0x00000001)
 #define MMU_FTR_TYPE_8xx		ASM_CONST(0x00000002)
-#define MMU_FTR_TYPE_40x		ASM_CONST(0x00000004)
 #define MMU_FTR_TYPE_44x		ASM_CONST(0x00000008)
 #define MMU_FTR_TYPE_FSL_E		ASM_CONST(0x00000010)
 #define MMU_FTR_TYPE_47x		ASM_CONST(0x00000020)
@@ -146,9 +145,6 @@ enum {
 #ifdef CONFIG_PPC_8xx
 		MMU_FTR_TYPE_8xx |
 #endif
-#ifdef CONFIG_40x
-		MMU_FTR_TYPE_40x |
-#endif
 #ifdef CONFIG_44x
 		MMU_FTR_TYPE_44x |
 #endif
diff --git a/arch/powerpc/include/asm/nohash/32/mmu-40x.h b/arch/powerpc/include/asm/nohash/32/mmu-40x.h
deleted file mode 100644
index 74f4edb5916e..000000000000
--- a/arch/powerpc/include/asm/nohash/32/mmu-40x.h
+++ /dev/null
@@ -1,68 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-#ifndef _ASM_POWERPC_MMU_40X_H_
-#define _ASM_POWERPC_MMU_40X_H_
-
-/*
- * PPC40x support
- */
-
-#define PPC40X_TLB_SIZE 64
-
-/*
- * TLB entries are defined by a "high" tag portion and a "low" data
- * portion.  On all architectures, the data portion is 32-bits.
- *
- * TLB entries are managed entirely under software control by reading,
- * writing, and searchoing using the 4xx-specific tlbre, tlbwr, and tlbsx
- * instructions.
- */
-
-#define	TLB_LO          1
-#define	TLB_HI          0
-
-#define	TLB_DATA        TLB_LO
-#define	TLB_TAG         TLB_HI
-
-/* Tag portion */
-
-#define TLB_EPN_MASK    0xFFFFFC00      /* Effective Page Number */
-#define TLB_PAGESZ_MASK 0x00000380
-#define TLB_PAGESZ(x)   (((x) & 0x7) << 7)
-#define   PAGESZ_1K		0
-#define   PAGESZ_4K             1
-#define   PAGESZ_16K            2
-#define   PAGESZ_64K            3
-#define   PAGESZ_256K           4
-#define   PAGESZ_1M             5
-#define   PAGESZ_4M             6
-#define   PAGESZ_16M            7
-#define TLB_VALID       0x00000040      /* Entry is valid */
-
-/* Data portion */
-
-#define TLB_RPN_MASK    0xFFFFFC00      /* Real Page Number */
-#define TLB_PERM_MASK   0x00000300
-#define TLB_EX          0x00000200      /* Instruction execution allowed */
-#define TLB_WR          0x00000100      /* Writes permitted */
-#define TLB_ZSEL_MASK   0x000000F0
-#define TLB_ZSEL(x)     (((x) & 0xF) << 4)
-#define TLB_ATTR_MASK   0x0000000F
-#define TLB_W           0x00000008      /* Caching is write-through */
-#define TLB_I           0x00000004      /* Caching is inhibited */
-#define TLB_M           0x00000002      /* Memory is coherent */
-#define TLB_G           0x00000001      /* Memory is guarded from prefetch */
-
-#ifndef __ASSEMBLY__
-
-typedef struct {
-	unsigned int	id;
-	unsigned int	active;
-	unsigned long	vdso_base;
-} mm_context_t;
-
-#endif /* !__ASSEMBLY__ */
-
-#define mmu_virtual_psize	MMU_PAGE_4K
-#define mmu_linear_psize	MMU_PAGE_256M
-
-#endif /* _ASM_POWERPC_MMU_40X_H_ */
diff --git a/arch/powerpc/include/asm/nohash/32/pgtable.h b/arch/powerpc/include/asm/nohash/32/pgtable.h
index b04ba257fddb..97baca06edbb 100644
--- a/arch/powerpc/include/asm/nohash/32/pgtable.h
+++ b/arch/powerpc/include/asm/nohash/32/pgtable.h
@@ -126,9 +126,7 @@ int map_kernel_page(unsigned long va, phys_addr_t pa, pgprot_t prot);
  * (hardware-defined) PowerPC PTE as closely as possible.
  */
 
-#if defined(CONFIG_40x)
-#include <asm/nohash/32/pte-40x.h>
-#elif defined(CONFIG_44x)
+#if defined(CONFIG_44x)
 #include <asm/nohash/32/pte-44x.h>
 #elif defined(CONFIG_FSL_BOOKE) && defined(CONFIG_PTE_64BIT)
 #include <asm/nohash/pte-book3e.h>
diff --git a/arch/powerpc/include/asm/nohash/32/pte-40x.h b/arch/powerpc/include/asm/nohash/32/pte-40x.h
deleted file mode 100644
index 12c6811e344b..000000000000
--- a/arch/powerpc/include/asm/nohash/32/pte-40x.h
+++ /dev/null
@@ -1,105 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-#ifndef _ASM_POWERPC_NOHASH_32_PTE_40x_H
-#define _ASM_POWERPC_NOHASH_32_PTE_40x_H
-#ifdef __KERNEL__
-
-/*
- * At present, all PowerPC 400-class processors share a similar TLB
- * architecture. The instruction and data sides share a unified,
- * 64-entry, fully-associative TLB which is maintained totally under
- * software control. In addition, the instruction side has a
- * hardware-managed, 4-entry, fully-associative TLB which serves as a
- * first level to the shared TLB. These two TLBs are known as the UTLB
- * and ITLB, respectively (see "mmu.h" for definitions).
- *
- * There are several potential gotchas here.  The 40x hardware TLBLO
- * field looks like this:
- *
- * 0  1  2  3  4  ... 18 19 20 21 22 23 24 25 26 27 28 29 30 31
- * RPN.....................  0  0 EX WR ZSEL.......  W  I  M  G
- *
- * Where possible we make the Linux PTE bits match up with this
- *
- * - bits 20 and 21 must be cleared, because we use 4k pages (40x can
- *   support down to 1k pages), this is done in the TLBMiss exception
- *   handler.
- * - We use only zones 0 (for kernel pages) and 1 (for user pages)
- *   of the 16 available.  Bit 24-26 of the TLB are cleared in the TLB
- *   miss handler.  Bit 27 is PAGE_USER, thus selecting the correct
- *   zone.
- * - PRESENT *must* be in the bottom two bits because swap cache
- *   entries use the top 30 bits.  Because 40x doesn't support SMP
- *   anyway, M is irrelevant so we borrow it for PAGE_PRESENT.  Bit 30
- *   is cleared in the TLB miss handler before the TLB entry is loaded.
- * - All other bits of the PTE are loaded into TLBLO without
- *   modification, leaving us only the bits 20, 21, 24, 25, 26, 30 for
- *   software PTE bits.  We actually use bits 21, 24, 25, and
- *   30 respectively for the software bits: ACCESSED, DIRTY, RW, and
- *   PRESENT.
- */
-
-#define	_PAGE_GUARDED	0x001	/* G: page is guarded from prefetch */
-#define _PAGE_PRESENT	0x002	/* software: PTE contains a translation */
-#define	_PAGE_NO_CACHE	0x004	/* I: caching is inhibited */
-#define	_PAGE_WRITETHRU	0x008	/* W: caching is write-through */
-#define	_PAGE_USER	0x010	/* matches one of the zone permission bits */
-#define	_PAGE_SPECIAL	0x020	/* software: Special page */
-#define	_PAGE_RW	0x040	/* software: Writes permitted */
-#define	_PAGE_DIRTY	0x080	/* software: dirty page */
-#define _PAGE_HWWRITE	0x100	/* hardware: Dirty & RW, set in exception */
-#define _PAGE_EXEC	0x200	/* hardware: EX permission */
-#define _PAGE_ACCESSED	0x400	/* software: R: page referenced */
-
-/* No page size encoding in the linux PTE */
-#define _PAGE_PSIZE		0
-
-/* cache related flags non existing on 40x */
-#define _PAGE_COHERENT	0
-
-#define _PAGE_KERNEL_RO		0
-#define _PAGE_KERNEL_ROX	_PAGE_EXEC
-#define _PAGE_KERNEL_RW		(_PAGE_DIRTY | _PAGE_RW | _PAGE_HWWRITE)
-#define _PAGE_KERNEL_RWX	(_PAGE_DIRTY | _PAGE_RW | _PAGE_HWWRITE | _PAGE_EXEC)
-
-#define _PMD_PRESENT	0x400	/* PMD points to page of PTEs */
-#define _PMD_PRESENT_MASK	_PMD_PRESENT
-#define _PMD_BAD	0x802
-#define _PMD_SIZE_4M	0x0c0
-#define _PMD_SIZE_16M	0x0e0
-#define _PMD_USER	0
-
-#define _PTE_NONE_MASK	0
-
-/* Until my rework is finished, 40x still needs atomic PTE updates */
-#define PTE_ATOMIC_UPDATES	1
-
-#define _PAGE_BASE_NC	(_PAGE_PRESENT | _PAGE_ACCESSED)
-#define _PAGE_BASE	(_PAGE_BASE_NC)
-
-/* Permission masks used to generate the __P and __S table */
-#define PAGE_NONE	__pgprot(_PAGE_BASE)
-#define PAGE_SHARED	__pgprot(_PAGE_BASE | _PAGE_USER | _PAGE_RW)
-#define PAGE_SHARED_X	__pgprot(_PAGE_BASE | _PAGE_USER | _PAGE_RW | _PAGE_EXEC)
-#define PAGE_COPY	__pgprot(_PAGE_BASE | _PAGE_USER)
-#define PAGE_COPY_X	__pgprot(_PAGE_BASE | _PAGE_USER | _PAGE_EXEC)
-#define PAGE_READONLY	__pgprot(_PAGE_BASE | _PAGE_USER)
-#define PAGE_READONLY_X	__pgprot(_PAGE_BASE | _PAGE_USER | _PAGE_EXEC)
-
-#ifndef __ASSEMBLY__
-static inline pte_t pte_wrprotect(pte_t pte)
-{
-	return __pte(pte_val(pte) & ~(_PAGE_RW | _PAGE_HWWRITE));
-}
-
-#define pte_wrprotect pte_wrprotect
-
-static inline pte_t pte_mkclean(pte_t pte)
-{
-	return __pte(pte_val(pte) & ~(_PAGE_DIRTY | _PAGE_HWWRITE));
-}
-
-#define pte_mkclean pte_mkclean
-#endif
-
-#endif /* __KERNEL__ */
-#endif /*  _ASM_POWERPC_NOHASH_32_PTE_40x_H */
diff --git a/arch/powerpc/include/asm/nohash/mmu.h b/arch/powerpc/include/asm/nohash/mmu.h
index edc793e5f08f..8b1d252cd6a9 100644
--- a/arch/powerpc/include/asm/nohash/mmu.h
+++ b/arch/powerpc/include/asm/nohash/mmu.h
@@ -2,10 +2,7 @@
 #ifndef _ASM_POWERPC_NOHASH_MMU_H_
 #define _ASM_POWERPC_NOHASH_MMU_H_
 
-#if defined(CONFIG_40x)
-/* 40x-style software loaded TLB */
-#include <asm/nohash/32/mmu-40x.h>
-#elif defined(CONFIG_44x)
+#if defined(CONFIG_44x)
 /* 44x-style software loaded TLB */
 #include <asm/nohash/32/mmu-44x.h>
 #elif defined(CONFIG_PPC_BOOK3E_MMU)
diff --git a/arch/powerpc/include/asm/ppc_asm.h b/arch/powerpc/include/asm/ppc_asm.h
index 6b03dff61a05..4a4345bec441 100644
--- a/arch/powerpc/include/asm/ppc_asm.h
+++ b/arch/powerpc/include/asm/ppc_asm.h
@@ -510,11 +510,7 @@ END_FTR_SECTION_NESTED(CPU_FTR_CELL_TB_BUG, CPU_FTR_CELL_TB_BUG, 96)
 #define MTMSRD(r)	mtmsrd	r
 #define MTMSR_EERI(reg)	mtmsrd	reg,1
 #else
-#ifndef CONFIG_40x
 #define	RFI		rfi
-#else
-#define RFI		rfi; b .	/* Prevent prefetch past rfi */
-#endif
 #define MTMSRD(r)	mtmsr	r
 #define MTMSR_EERI(reg)	mtmsr	reg
 #endif
diff --git a/arch/powerpc/include/asm/reg.h b/arch/powerpc/include/asm/reg.h
index da5cab038e25..daa352e93b4c 100644
--- a/arch/powerpc/include/asm/reg.h
+++ b/arch/powerpc/include/asm/reg.h
@@ -17,9 +17,9 @@
 #include <asm/feature-fixups.h>
 
 /* Pickup Book E specific registers. */
-#if defined(CONFIG_BOOKE) || defined(CONFIG_40x)
+#ifdef CONFIG_BOOKE
 #include <asm/reg_booke.h>
-#endif /* CONFIG_BOOKE || CONFIG_40x */
+#endif
 
 #ifdef CONFIG_FSL_EMB_PERFMON
 #include <asm/reg_fsl_emb.h>
@@ -235,14 +235,10 @@
 
 /* Special Purpose Registers (SPRNs)*/
 
-#ifdef CONFIG_40x
-#define SPRN_PID	0x3B1	/* Process ID */
-#else
 #define SPRN_PID	0x030	/* Process ID */
 #ifdef CONFIG_BOOKE
 #define SPRN_PID0	SPRN_PID/* Process ID Register 0 */
 #endif
-#endif
 
 #define SPRN_CTR	0x009	/* Count Register */
 #define SPRN_DSCR	0x11
@@ -1087,15 +1083,6 @@
  *	- SPRG2 indicator that we are in RTAS
  *	- SPRG4 (603 only) pseudo TLB LRU data
  *
- * 32-bit 40x:
- *	- SPRG0 scratch for exception vectors
- *	- SPRG1 scratch for exception vectors
- *	- SPRG2 scratch for exception vectors
- *	- SPRG4 scratch for exception vectors (not 403)
- *	- SPRG5 scratch for exception vectors (not 403)
- *	- SPRG6 scratch for exception vectors (not 403)
- *	- SPRG7 scratch for exception vectors (not 403)
- *
  * 32-bit 440 and FSL BookE:
  *	- SPRG0 scratch for exception vectors
  *	- SPRG1 scratch for exception vectors (*)
@@ -1187,16 +1174,6 @@
 #define SPRN_SPRG_603_LRU	SPRN_SPRG4
 #endif
 
-#ifdef CONFIG_40x
-#define SPRN_SPRG_SCRATCH0	SPRN_SPRG0
-#define SPRN_SPRG_SCRATCH1	SPRN_SPRG1
-#define SPRN_SPRG_SCRATCH2	SPRN_SPRG2
-#define SPRN_SPRG_SCRATCH3	SPRN_SPRG4
-#define SPRN_SPRG_SCRATCH4	SPRN_SPRG5
-#define SPRN_SPRG_SCRATCH5	SPRN_SPRG6
-#define SPRN_SPRG_SCRATCH6	SPRN_SPRG7
-#endif
-
 #ifdef CONFIG_BOOKE
 #define SPRN_SPRG_RSCRATCH0	SPRN_SPRG0
 #define SPRN_SPRG_WSCRATCH0	SPRN_SPRG0
diff --git a/arch/powerpc/include/asm/reg_booke.h b/arch/powerpc/include/asm/reg_booke.h
index f26fe482fbca..0d772408f34f 100644
--- a/arch/powerpc/include/asm/reg_booke.h
+++ b/arch/powerpc/include/asm/reg_booke.h
@@ -42,9 +42,6 @@
 #define MSR_KERNEL	(MSR_ | MSR_64BIT)
 #define MSR_USER32	(MSR_ | MSR_PR | MSR_EE)
 #define MSR_USER64	(MSR_USER32 | MSR_64BIT)
-#elif defined (CONFIG_40x)
-#define MSR_KERNEL	(MSR_ME|MSR_RI|MSR_IR|MSR_DR|MSR_CE)
-#define MSR_USER	(MSR_KERNEL|MSR_PR|MSR_EE)
 #else
 #define MSR_KERNEL	(MSR_ME|MSR_RI|MSR_CE)
 #define MSR_USER	(MSR_KERNEL|MSR_PR|MSR_EE)
@@ -157,7 +154,6 @@
 #define SPRN_TLB3CFG	0x2B3	/* TLB 3 Config Register */
 #define SPRN_EPR	0x2BE	/* External Proxy Register */
 #define SPRN_CCR1	0x378	/* Core Configuration Register 1 */
-#define SPRN_ZPR	0x3B0	/* Zone Protection Register (40x) */
 #define SPRN_MAS7	0x3B0	/* MMU Assist Register 7 */
 #define SPRN_MMUCR	0x3B2	/* MMU Control Register */
 #define SPRN_CCR0	0x3B3	/* Core Configuration Register 0 */
@@ -166,7 +162,6 @@
 #define SPRN_SGR	0x3B9	/* Storage Guarded Register */
 #define SPRN_DCWR	0x3BA	/* Data Cache Write-thru Register */
 #define SPRN_SLER	0x3BB	/* Little-endian real mode */
-#define SPRN_SU0R	0x3BC	/* "User 0" real mode (40x) */
 #define SPRN_DCMP	0x3D1	/* Data TLB Compare Register */
 #define SPRN_ICDBDR	0x3D3	/* Instruction Cache Debug Data Register */
 #define SPRN_EVPR	0x3D6	/* Exception Vector Prefix Register */
@@ -203,21 +198,6 @@
 #define SPRN_TSR	0x150	/* Timer Status Register */
 #define SPRN_TCR	0x154	/* Timer Control Register */
 #endif /* Book E */
-#ifdef CONFIG_40x
-#define SPRN_DBCR1	0x3BD	/* Debug Control Register 1 */		
-#define SPRN_ESR	0x3D4	/* Exception Syndrome Register */
-#define SPRN_DEAR	0x3D5	/* Data Error Address Register */
-#define SPRN_TSR	0x3D8	/* Timer Status Register */
-#define SPRN_TCR	0x3DA	/* Timer Control Register */
-#define SPRN_SRR2	0x3DE	/* Save/Restore Register 2 */
-#define SPRN_SRR3	0x3DF	/* Save/Restore Register 3 */
-#define SPRN_DBSR	0x3F0	/* Debug Status Register */		
-#define SPRN_DBCR0	0x3F2	/* Debug Control Register 0 */
-#define SPRN_DAC1	0x3F6	/* Data Address Compare 1 */
-#define SPRN_DAC2	0x3F7	/* Data Address Compare 2 */
-#define SPRN_CSRR0	SPRN_SRR2 /* Critical Save and Restore Register 0 */
-#define SPRN_CSRR1	SPRN_SRR3 /* Critical Save and Restore Register 1 */
-#endif
 #define SPRN_HACOP	0x15F	/* Hypervisor Available Coprocessor Register */
 
 /* Bit definitions for CCR1. */
@@ -333,20 +313,6 @@
 #define DBSR_IAC12ATS	0x00000002	/* Instr Address Compare 1/2 Toggle */
 #define DBSR_IAC34ATS	0x00000001	/* Instr Address Compare 3/4 Toggle */
 #endif
-#ifdef CONFIG_40x
-#define DBSR_IC		0x80000000	/* Instruction Completion */
-#define DBSR_BT		0x40000000	/* Branch taken */
-#define DBSR_IRPT	0x20000000	/* Exception Debug Event */
-#define DBSR_TIE	0x10000000	/* Trap Instruction debug Event */
-#define DBSR_IAC1	0x04000000	/* Instruction Address Compare 1 Event */
-#define DBSR_IAC2	0x02000000	/* Instruction Address Compare 2 Event */
-#define DBSR_IAC3	0x00080000	/* Instruction Address Compare 3 Event */
-#define DBSR_IAC4	0x00040000	/* Instruction Address Compare 4 Event */
-#define DBSR_DAC1R	0x01000000	/* Data Address Compare 1 Read Event */
-#define DBSR_DAC1W	0x00800000	/* Data Address Compare 1 Write Event */
-#define DBSR_DAC2R	0x00400000	/* Data Address Compare 2 Read Event */
-#define DBSR_DAC2W	0x00200000	/* Data Address Compare 2 Write Event */
-#endif
 
 /* Bit definitions related to the ESR. */
 #define ESR_MCI		0x80000000	/* Machine Check - Instruction */
@@ -368,69 +334,7 @@
 #define ESR_SPV		0x00000080	/* Signal Processing operation */
 
 /* Bit definitions related to the DBCR0. */
-#if defined(CONFIG_40x)
-#define DBCR0_EDM	0x80000000	/* External Debug Mode */
-#define DBCR0_IDM	0x40000000	/* Internal Debug Mode */
-#define DBCR0_RST	0x30000000	/* all the bits in the RST field */
-#define DBCR0_RST_SYSTEM 0x30000000	/* System Reset */
-#define DBCR0_RST_CHIP	0x20000000	/* Chip Reset */
-#define DBCR0_RST_CORE	0x10000000	/* Core Reset */
-#define DBCR0_RST_NONE	0x00000000	/* No Reset */
-#define DBCR0_IC	0x08000000	/* Instruction Completion */
-#define DBCR0_ICMP	DBCR0_IC
-#define DBCR0_BT	0x04000000	/* Branch Taken */
-#define DBCR0_BRT	DBCR0_BT
-#define DBCR0_EDE	0x02000000	/* Exception Debug Event */
-#define DBCR0_IRPT	DBCR0_EDE
-#define DBCR0_TDE	0x01000000	/* TRAP Debug Event */
-#define DBCR0_IA1	0x00800000	/* Instr Addr compare 1 enable */
-#define DBCR0_IAC1	DBCR0_IA1
-#define DBCR0_IA2	0x00400000	/* Instr Addr compare 2 enable */
-#define DBCR0_IAC2	DBCR0_IA2
-#define DBCR0_IA12	0x00200000	/* Instr Addr 1-2 range enable */
-#define DBCR0_IA12X	0x00100000	/* Instr Addr 1-2 range eXclusive */
-#define DBCR0_IA3	0x00080000	/* Instr Addr compare 3 enable */
-#define DBCR0_IAC3	DBCR0_IA3
-#define DBCR0_IA4	0x00040000	/* Instr Addr compare 4 enable */
-#define DBCR0_IAC4	DBCR0_IA4
-#define DBCR0_IA34	0x00020000	/* Instr Addr 3-4 range Enable */
-#define DBCR0_IA34X	0x00010000	/* Instr Addr 3-4 range eXclusive */
-#define DBCR0_IA12T	0x00008000	/* Instr Addr 1-2 range Toggle */
-#define DBCR0_IA34T	0x00004000	/* Instr Addr 3-4 range Toggle */
-#define DBCR0_FT	0x00000001	/* Freeze Timers on debug event */
-
-#define dbcr_iac_range(task)	((task)->thread.debug.dbcr0)
-#define DBCR_IAC12I	DBCR0_IA12			/* Range Inclusive */
-#define DBCR_IAC12X	(DBCR0_IA12 | DBCR0_IA12X)	/* Range Exclusive */
-#define DBCR_IAC12MODE	(DBCR0_IA12 | DBCR0_IA12X)	/* IAC 1-2 Mode Bits */
-#define DBCR_IAC34I	DBCR0_IA34			/* Range Inclusive */
-#define DBCR_IAC34X	(DBCR0_IA34 | DBCR0_IA34X)	/* Range Exclusive */
-#define DBCR_IAC34MODE	(DBCR0_IA34 | DBCR0_IA34X)	/* IAC 3-4 Mode Bits */
-
-/* Bit definitions related to the DBCR1. */
-#define DBCR1_DAC1R	0x80000000	/* DAC1 Read Debug Event */
-#define DBCR1_DAC2R	0x40000000	/* DAC2 Read Debug Event */
-#define DBCR1_DAC1W	0x20000000	/* DAC1 Write Debug Event */
-#define DBCR1_DAC2W	0x10000000	/* DAC2 Write Debug Event */
-
-#define dbcr_dac(task)	((task)->thread.debug.dbcr1)
-#define DBCR_DAC1R	DBCR1_DAC1R
-#define DBCR_DAC1W	DBCR1_DAC1W
-#define DBCR_DAC2R	DBCR1_DAC2R
-#define DBCR_DAC2W	DBCR1_DAC2W
-
-/*
- * Are there any active Debug Events represented in the
- * Debug Control Registers?
- */
-#define DBCR0_ACTIVE_EVENTS	(DBCR0_ICMP | DBCR0_IAC1 | DBCR0_IAC2 | \
-				 DBCR0_IAC3 | DBCR0_IAC4)
-#define DBCR1_ACTIVE_EVENTS	(DBCR1_DAC1R | DBCR1_DAC2R | \
-				 DBCR1_DAC1W | DBCR1_DAC2W)
-#define DBCR_ACTIVE_EVENTS(dbcr0, dbcr1)  (((dbcr0) & DBCR0_ACTIVE_EVENTS) || \
-					   ((dbcr1) & DBCR1_ACTIVE_EVENTS))
-
-#elif defined(CONFIG_BOOKE)
+#ifdef CONFIG_BOOKE
 #define DBCR0_EDM	0x80000000	/* External Debug Mode */
 #define DBCR0_IDM	0x40000000	/* Internal Debug Mode */
 #define DBCR0_RST	0x30000000	/* all the bits in the RST field */
@@ -531,7 +435,7 @@
 
 #define DBCR_ACTIVE_EVENTS(dbcr0, dbcr1)  (((dbcr0) & DBCR0_ACTIVE_EVENTS) || \
 					   ((dbcr1) & DBCR1_ACTIVE_EVENTS))
-#endif /* #elif defined(CONFIG_BOOKE) */
+#endif /* CONFIG_BOOKE */
 
 /* Bit definitions related to the TCR. */
 #define TCR_WP(x)	(((x)&0x3)<<30)	/* WDT Period */
@@ -663,60 +567,6 @@
 #define EPC_EPID	0x00003fff
 #define EPC_EPID_SHIFT	0
 
-/*
- * The IBM-403 is an even more odd special case, as it is much
- * older than the IBM-405 series.  We put these down here incase someone
- * wishes to support these machines again.
- */
-#ifdef CONFIG_403GCX
-/* Special Purpose Registers (SPRNs)*/
-#define SPRN_TBHU	0x3CC	/* Time Base High User-mode */
-#define SPRN_TBLU	0x3CD	/* Time Base Low User-mode */
-#define SPRN_CDBCR	0x3D7	/* Cache Debug Control Register */
-#define SPRN_TBHI	0x3DC	/* Time Base High */
-#define SPRN_TBLO	0x3DD	/* Time Base Low */
-#define SPRN_DBCR	0x3F2	/* Debug Control Register */
-#define SPRN_PBL1	0x3FC	/* Protection Bound Lower 1 */
-#define SPRN_PBL2	0x3FE	/* Protection Bound Lower 2 */
-#define SPRN_PBU1	0x3FD	/* Protection Bound Upper 1 */
-#define SPRN_PBU2	0x3FF	/* Protection Bound Upper 2 */
-
-
-/* Bit definitions for the DBCR. */
-#define DBCR_EDM	DBCR0_EDM
-#define DBCR_IDM	DBCR0_IDM
-#define DBCR_RST(x)	(((x) & 0x3) << 28)
-#define DBCR_RST_NONE	0
-#define DBCR_RST_CORE	1
-#define DBCR_RST_CHIP	2
-#define DBCR_RST_SYSTEM	3
-#define DBCR_IC		DBCR0_IC	/* Instruction Completion Debug Evnt */
-#define DBCR_BT		DBCR0_BT	/* Branch Taken Debug Event */
-#define DBCR_EDE	DBCR0_EDE	/* Exception Debug Event */
-#define DBCR_TDE	DBCR0_TDE	/* TRAP Debug Event */
-#define DBCR_FER	0x00F80000	/* First Events Remaining Mask */
-#define DBCR_FT		0x00040000	/* Freeze Timers on Debug Event */
-#define DBCR_IA1	0x00020000	/* Instr. Addr. Compare 1 Enable */
-#define DBCR_IA2	0x00010000	/* Instr. Addr. Compare 2 Enable */
-#define DBCR_D1R	0x00008000	/* Data Addr. Compare 1 Read Enable */
-#define DBCR_D1W	0x00004000	/* Data Addr. Compare 1 Write Enable */
-#define DBCR_D1S(x)	(((x) & 0x3) << 12)	/* Data Adrr. Compare 1 Size */
-#define DAC_BYTE	0
-#define DAC_HALF	1
-#define DAC_WORD	2
-#define DAC_QUAD	3
-#define DBCR_D2R	0x00000800	/* Data Addr. Compare 2 Read Enable */
-#define DBCR_D2W	0x00000400	/* Data Addr. Compare 2 Write Enable */
-#define DBCR_D2S(x)	(((x) & 0x3) << 8)	/* Data Addr. Compare 2 Size */
-#define DBCR_SBT	0x00000040	/* Second Branch Taken Debug Event */
-#define DBCR_SED	0x00000020	/* Second Exception Debug Event */
-#define DBCR_STD	0x00000010	/* Second Trap Debug Event */
-#define DBCR_SIA	0x00000008	/* Second IAC Enable */
-#define DBCR_SDA	0x00000004	/* Second DAC Enable */
-#define DBCR_JOI	0x00000002	/* JTAG Serial Outbound Int. Enable */
-#define DBCR_JII	0x00000001	/* JTAG Serial Inbound Int. Enable */
-#endif /* 403GCX */
-
 /* Some 476 specific registers */
 #define SPRN_SSPCR		830
 #define SPRN_USPCR		831
diff --git a/arch/powerpc/include/asm/time.h b/arch/powerpc/include/asm/time.h
index 08dbe3e6831c..94fd37c53e53 100644
--- a/arch/powerpc/include/asm/time.h
+++ b/arch/powerpc/include/asm/time.h
@@ -52,24 +52,12 @@ struct div_result {
 
 static inline unsigned long get_tbl(void)
 {
-#if defined(CONFIG_403GCX)
-	unsigned long tbl;
-	asm volatile("mfspr %0, 0x3dd" : "=r" (tbl));
-	return tbl;
-#else
 	return mftbl();
-#endif
 }
 
 static inline unsigned int get_tbu(void)
 {
-#ifdef CONFIG_403GCX
-	unsigned int tbu;
-	asm volatile("mfspr %0, 0x3dc" : "=r" (tbu));
-	return tbu;
-#else
 	return mftbu();
-#endif
 }
 #endif /* !CONFIG_PPC64 */
 
@@ -141,11 +129,7 @@ static inline void set_tb(unsigned int upper, unsigned int lower)
  */
 static inline u64 get_dec(void)
 {
-#if defined(CONFIG_40x)
-	return (mfspr(SPRN_PIT));
-#else
 	return (mfspr(SPRN_DEC));
-#endif
 }
 
 /*
@@ -155,14 +139,10 @@ static inline u64 get_dec(void)
  */
 static inline void set_dec(u64 val)
 {
-#if defined(CONFIG_40x)
-	mtspr(SPRN_PIT, (u32) val);
-#else
 #ifndef CONFIG_BOOKE
 	--val;
 #endif
 	mtspr(SPRN_DEC, val);
-#endif /* not 40x */
 }
 
 static inline unsigned long tb_ticks_since(unsigned long tstamp)
diff --git a/arch/powerpc/include/asm/udbg.h b/arch/powerpc/include/asm/udbg.h
index 0ea9e70ed78b..e07687fb3b96 100644
--- a/arch/powerpc/include/asm/udbg.h
+++ b/arch/powerpc/include/asm/udbg.h
@@ -45,7 +45,6 @@ extern void __init udbg_init_rtas_console(void);
 extern void __init udbg_init_debug_beat(void);
 extern void __init udbg_init_btext(void);
 extern void __init udbg_init_44x_as1(void);
-extern void __init udbg_init_40x_realmode(void);
 extern void __init udbg_init_cpm(void);
 extern void __init udbg_init_usbgecko(void);
 extern void __init udbg_init_memcons(void);
diff --git a/arch/powerpc/kernel/Makefile b/arch/powerpc/kernel/Makefile
index 78a1b22d4fd8..057e4448e621 100644
--- a/arch/powerpc/kernel/Makefile
+++ b/arch/powerpc/kernel/Makefile
@@ -96,7 +96,6 @@ obj-$(CONFIG_PPC_DOORBELL)	+= dbell.o
 obj-$(CONFIG_JUMP_LABEL)	+= jump_label.o
 
 extra-y				:= head_$(BITS).o
-extra-$(CONFIG_40x)		:= head_40x.o
 extra-$(CONFIG_44x)		:= head_44x.o
 extra-$(CONFIG_FSL_BOOKE)	:= head_fsl_booke.o
 extra-$(CONFIG_PPC_8xx)		:= head_8xx.o
diff --git a/arch/powerpc/kernel/asm-offsets.c b/arch/powerpc/kernel/asm-offsets.c
index fcf24a365fc0..9f92ba40ba8b 100644
--- a/arch/powerpc/kernel/asm-offsets.c
+++ b/arch/powerpc/kernel/asm-offsets.c
@@ -57,7 +57,7 @@
 #endif
 
 #ifdef CONFIG_PPC32
-#if defined(CONFIG_BOOKE) || defined(CONFIG_40x)
+#ifdef CONFIG_BOOKE
 #include "head_booke.h"
 #endif
 #endif
@@ -355,7 +355,7 @@ int main(void)
 #endif
 
 #if defined(CONFIG_PPC32)
-#if defined(CONFIG_BOOKE) || defined(CONFIG_40x)
+#ifdef CONFIG_BOOKE
 	DEFINE(EXC_LVL_SIZE, STACK_EXC_LVL_FRAME_SIZE);
 	DEFINE(MAS0, STACK_INT_FRAME_SIZE+offsetof(struct exception_regs, mas0));
 	/* we overload MMUCR for 44x on MAS0 since they are mutually exclusive */
diff --git a/arch/powerpc/kernel/cputable.c b/arch/powerpc/kernel/cputable.c
index 245be4fafe13..1c2eb64667d2 100644
--- a/arch/powerpc/kernel/cputable.c
+++ b/arch/powerpc/kernel/cputable.c
@@ -1231,371 +1231,6 @@ static struct cpu_spec __initdata cpu_specs[] = {
 		.platform		= "ppc823",
 	},
 #endif /* CONFIG_PPC_8xx */
-#ifdef CONFIG_40x
-	{	/* 403GC */
-		.pvr_mask		= 0xffffff00,
-		.pvr_value		= 0x00200200,
-		.cpu_name		= "403GC",
-		.cpu_features		= CPU_FTRS_40X,
-		.cpu_user_features	= PPC_FEATURE_32 | PPC_FEATURE_HAS_MMU,
-		.mmu_features		= MMU_FTR_TYPE_40x,
-		.icache_bsize		= 16,
-		.dcache_bsize		= 16,
-		.machine_check		= machine_check_4xx,
-		.platform		= "ppc403",
-	},
-	{	/* 403GCX */
-		.pvr_mask		= 0xffffff00,
-		.pvr_value		= 0x00201400,
-		.cpu_name		= "403GCX",
-		.cpu_features		= CPU_FTRS_40X,
-		.cpu_user_features	= PPC_FEATURE_32 |
-		 	PPC_FEATURE_HAS_MMU | PPC_FEATURE_NO_TB,
-		.mmu_features		= MMU_FTR_TYPE_40x,
-		.icache_bsize		= 16,
-		.dcache_bsize		= 16,
-		.machine_check		= machine_check_4xx,
-		.platform		= "ppc403",
-	},
-	{	/* 403G ?? */
-		.pvr_mask		= 0xffff0000,
-		.pvr_value		= 0x00200000,
-		.cpu_name		= "403G ??",
-		.cpu_features		= CPU_FTRS_40X,
-		.cpu_user_features	= PPC_FEATURE_32 | PPC_FEATURE_HAS_MMU,
-		.mmu_features		= MMU_FTR_TYPE_40x,
-		.icache_bsize		= 16,
-		.dcache_bsize		= 16,
-		.machine_check		= machine_check_4xx,
-		.platform		= "ppc403",
-	},
-	{	/* 405GP */
-		.pvr_mask		= 0xffff0000,
-		.pvr_value		= 0x40110000,
-		.cpu_name		= "405GP",
-		.cpu_features		= CPU_FTRS_40X,
-		.cpu_user_features	= PPC_FEATURE_32 |
-			PPC_FEATURE_HAS_MMU | PPC_FEATURE_HAS_4xxMAC,
-		.mmu_features		= MMU_FTR_TYPE_40x,
-		.icache_bsize		= 32,
-		.dcache_bsize		= 32,
-		.machine_check		= machine_check_4xx,
-		.platform		= "ppc405",
-	},
-	{	/* STB 03xxx */
-		.pvr_mask		= 0xffff0000,
-		.pvr_value		= 0x40130000,
-		.cpu_name		= "STB03xxx",
-		.cpu_features		= CPU_FTRS_40X,
-		.cpu_user_features	= PPC_FEATURE_32 |
-			PPC_FEATURE_HAS_MMU | PPC_FEATURE_HAS_4xxMAC,
-		.mmu_features		= MMU_FTR_TYPE_40x,
-		.icache_bsize		= 32,
-		.dcache_bsize		= 32,
-		.machine_check		= machine_check_4xx,
-		.platform		= "ppc405",
-	},
-	{	/* STB 04xxx */
-		.pvr_mask		= 0xffff0000,
-		.pvr_value		= 0x41810000,
-		.cpu_name		= "STB04xxx",
-		.cpu_features		= CPU_FTRS_40X,
-		.cpu_user_features	= PPC_FEATURE_32 |
-			PPC_FEATURE_HAS_MMU | PPC_FEATURE_HAS_4xxMAC,
-		.mmu_features		= MMU_FTR_TYPE_40x,
-		.icache_bsize		= 32,
-		.dcache_bsize		= 32,
-		.machine_check		= machine_check_4xx,
-		.platform		= "ppc405",
-	},
-	{	/* NP405L */
-		.pvr_mask		= 0xffff0000,
-		.pvr_value		= 0x41610000,
-		.cpu_name		= "NP405L",
-		.cpu_features		= CPU_FTRS_40X,
-		.cpu_user_features	= PPC_FEATURE_32 |
-			PPC_FEATURE_HAS_MMU | PPC_FEATURE_HAS_4xxMAC,
-		.mmu_features		= MMU_FTR_TYPE_40x,
-		.icache_bsize		= 32,
-		.dcache_bsize		= 32,
-		.machine_check		= machine_check_4xx,
-		.platform		= "ppc405",
-	},
-	{	/* NP4GS3 */
-		.pvr_mask		= 0xffff0000,
-		.pvr_value		= 0x40B10000,
-		.cpu_name		= "NP4GS3",
-		.cpu_features		= CPU_FTRS_40X,
-		.cpu_user_features	= PPC_FEATURE_32 |
-			PPC_FEATURE_HAS_MMU | PPC_FEATURE_HAS_4xxMAC,
-		.mmu_features		= MMU_FTR_TYPE_40x,
-		.icache_bsize		= 32,
-		.dcache_bsize		= 32,
-		.machine_check		= machine_check_4xx,
-		.platform		= "ppc405",
-	},
-	{   /* NP405H */
-		.pvr_mask		= 0xffff0000,
-		.pvr_value		= 0x41410000,
-		.cpu_name		= "NP405H",
-		.cpu_features		= CPU_FTRS_40X,
-		.cpu_user_features	= PPC_FEATURE_32 |
-			PPC_FEATURE_HAS_MMU | PPC_FEATURE_HAS_4xxMAC,
-		.mmu_features		= MMU_FTR_TYPE_40x,
-		.icache_bsize		= 32,
-		.dcache_bsize		= 32,
-		.machine_check		= machine_check_4xx,
-		.platform		= "ppc405",
-	},
-	{	/* 405GPr */
-		.pvr_mask		= 0xffff0000,
-		.pvr_value		= 0x50910000,
-		.cpu_name		= "405GPr",
-		.cpu_features		= CPU_FTRS_40X,
-		.cpu_user_features	= PPC_FEATURE_32 |
-			PPC_FEATURE_HAS_MMU | PPC_FEATURE_HAS_4xxMAC,
-		.mmu_features		= MMU_FTR_TYPE_40x,
-		.icache_bsize		= 32,
-		.dcache_bsize		= 32,
-		.machine_check		= machine_check_4xx,
-		.platform		= "ppc405",
-	},
-	{   /* STBx25xx */
-		.pvr_mask		= 0xffff0000,
-		.pvr_value		= 0x51510000,
-		.cpu_name		= "STBx25xx",
-		.cpu_features		= CPU_FTRS_40X,
-		.cpu_user_features	= PPC_FEATURE_32 |
-			PPC_FEATURE_HAS_MMU | PPC_FEATURE_HAS_4xxMAC,
-		.mmu_features		= MMU_FTR_TYPE_40x,
-		.icache_bsize		= 32,
-		.dcache_bsize		= 32,
-		.machine_check		= machine_check_4xx,
-		.platform		= "ppc405",
-	},
-	{	/* 405LP */
-		.pvr_mask		= 0xffff0000,
-		.pvr_value		= 0x41F10000,
-		.cpu_name		= "405LP",
-		.cpu_features		= CPU_FTRS_40X,
-		.cpu_user_features	= PPC_FEATURE_32 | PPC_FEATURE_HAS_MMU,
-		.mmu_features		= MMU_FTR_TYPE_40x,
-		.icache_bsize		= 32,
-		.dcache_bsize		= 32,
-		.machine_check		= machine_check_4xx,
-		.platform		= "ppc405",
-	},
-	{	/* Xilinx Virtex-II Pro  */
-		.pvr_mask		= 0xfffff000,
-		.pvr_value		= 0x20010000,
-		.cpu_name		= "Virtex-II Pro",
-		.cpu_features		= CPU_FTRS_40X,
-		.cpu_user_features	= PPC_FEATURE_32 |
-			PPC_FEATURE_HAS_MMU | PPC_FEATURE_HAS_4xxMAC,
-		.mmu_features		= MMU_FTR_TYPE_40x,
-		.icache_bsize		= 32,
-		.dcache_bsize		= 32,
-		.machine_check		= machine_check_4xx,
-		.platform		= "ppc405",
-	},
-	{	/* Xilinx Virtex-4 FX */
-		.pvr_mask		= 0xfffff000,
-		.pvr_value		= 0x20011000,
-		.cpu_name		= "Virtex-4 FX",
-		.cpu_features		= CPU_FTRS_40X,
-		.cpu_user_features	= PPC_FEATURE_32 |
-			PPC_FEATURE_HAS_MMU | PPC_FEATURE_HAS_4xxMAC,
-		.mmu_features		= MMU_FTR_TYPE_40x,
-		.icache_bsize		= 32,
-		.dcache_bsize		= 32,
-		.machine_check		= machine_check_4xx,
-		.platform		= "ppc405",
-	},
-	{	/* 405EP */
-		.pvr_mask		= 0xffff0000,
-		.pvr_value		= 0x51210000,
-		.cpu_name		= "405EP",
-		.cpu_features		= CPU_FTRS_40X,
-		.cpu_user_features	= PPC_FEATURE_32 |
-			PPC_FEATURE_HAS_MMU | PPC_FEATURE_HAS_4xxMAC,
-		.mmu_features		= MMU_FTR_TYPE_40x,
-		.icache_bsize		= 32,
-		.dcache_bsize		= 32,
-		.machine_check		= machine_check_4xx,
-		.platform		= "ppc405",
-	},
-	{	/* 405EX Rev. A/B with Security */
-		.pvr_mask		= 0xffff000f,
-		.pvr_value		= 0x12910007,
-		.cpu_name		= "405EX Rev. A/B",
-		.cpu_features		= CPU_FTRS_40X,
-		.cpu_user_features	= PPC_FEATURE_32 |
-			PPC_FEATURE_HAS_MMU | PPC_FEATURE_HAS_4xxMAC,
-		.mmu_features		= MMU_FTR_TYPE_40x,
-		.icache_bsize		= 32,
-		.dcache_bsize		= 32,
-		.machine_check		= machine_check_4xx,
-		.platform		= "ppc405",
-	},
-	{	/* 405EX Rev. C without Security */
-		.pvr_mask		= 0xffff000f,
-		.pvr_value		= 0x1291000d,
-		.cpu_name		= "405EX Rev. C",
-		.cpu_features		= CPU_FTRS_40X,
-		.cpu_user_features	= PPC_FEATURE_32 |
-			PPC_FEATURE_HAS_MMU | PPC_FEATURE_HAS_4xxMAC,
-		.mmu_features		= MMU_FTR_TYPE_40x,
-		.icache_bsize		= 32,
-		.dcache_bsize		= 32,
-		.machine_check		= machine_check_4xx,
-		.platform		= "ppc405",
-	},
-	{	/* 405EX Rev. C with Security */
-		.pvr_mask		= 0xffff000f,
-		.pvr_value		= 0x1291000f,
-		.cpu_name		= "405EX Rev. C",
-		.cpu_features		= CPU_FTRS_40X,
-		.cpu_user_features	= PPC_FEATURE_32 |
-			PPC_FEATURE_HAS_MMU | PPC_FEATURE_HAS_4xxMAC,
-		.mmu_features		= MMU_FTR_TYPE_40x,
-		.icache_bsize		= 32,
-		.dcache_bsize		= 32,
-		.machine_check		= machine_check_4xx,
-		.platform		= "ppc405",
-	},
-	{	/* 405EX Rev. D without Security */
-		.pvr_mask		= 0xffff000f,
-		.pvr_value		= 0x12910003,
-		.cpu_name		= "405EX Rev. D",
-		.cpu_features		= CPU_FTRS_40X,
-		.cpu_user_features	= PPC_FEATURE_32 |
-			PPC_FEATURE_HAS_MMU | PPC_FEATURE_HAS_4xxMAC,
-		.mmu_features		= MMU_FTR_TYPE_40x,
-		.icache_bsize		= 32,
-		.dcache_bsize		= 32,
-		.machine_check		= machine_check_4xx,
-		.platform		= "ppc405",
-	},
-	{	/* 405EX Rev. D with Security */
-		.pvr_mask		= 0xffff000f,
-		.pvr_value		= 0x12910005,
-		.cpu_name		= "405EX Rev. D",
-		.cpu_features		= CPU_FTRS_40X,
-		.cpu_user_features	= PPC_FEATURE_32 |
-			PPC_FEATURE_HAS_MMU | PPC_FEATURE_HAS_4xxMAC,
-		.mmu_features		= MMU_FTR_TYPE_40x,
-		.icache_bsize		= 32,
-		.dcache_bsize		= 32,
-		.machine_check		= machine_check_4xx,
-		.platform		= "ppc405",
-	},
-	{	/* 405EXr Rev. A/B without Security */
-		.pvr_mask		= 0xffff000f,
-		.pvr_value		= 0x12910001,
-		.cpu_name		= "405EXr Rev. A/B",
-		.cpu_features		= CPU_FTRS_40X,
-		.cpu_user_features	= PPC_FEATURE_32 |
-			PPC_FEATURE_HAS_MMU | PPC_FEATURE_HAS_4xxMAC,
-		.mmu_features		= MMU_FTR_TYPE_40x,
-		.icache_bsize		= 32,
-		.dcache_bsize		= 32,
-		.machine_check		= machine_check_4xx,
-		.platform		= "ppc405",
-	},
-	{	/* 405EXr Rev. C without Security */
-		.pvr_mask		= 0xffff000f,
-		.pvr_value		= 0x12910009,
-		.cpu_name		= "405EXr Rev. C",
-		.cpu_features		= CPU_FTRS_40X,
-		.cpu_user_features	= PPC_FEATURE_32 |
-			PPC_FEATURE_HAS_MMU | PPC_FEATURE_HAS_4xxMAC,
-		.mmu_features		= MMU_FTR_TYPE_40x,
-		.icache_bsize		= 32,
-		.dcache_bsize		= 32,
-		.machine_check		= machine_check_4xx,
-		.platform		= "ppc405",
-	},
-	{	/* 405EXr Rev. C with Security */
-		.pvr_mask		= 0xffff000f,
-		.pvr_value		= 0x1291000b,
-		.cpu_name		= "405EXr Rev. C",
-		.cpu_features		= CPU_FTRS_40X,
-		.cpu_user_features	= PPC_FEATURE_32 |
-			PPC_FEATURE_HAS_MMU | PPC_FEATURE_HAS_4xxMAC,
-		.mmu_features		= MMU_FTR_TYPE_40x,
-		.icache_bsize		= 32,
-		.dcache_bsize		= 32,
-		.machine_check		= machine_check_4xx,
-		.platform		= "ppc405",
-	},
-	{	/* 405EXr Rev. D without Security */
-		.pvr_mask		= 0xffff000f,
-		.pvr_value		= 0x12910000,
-		.cpu_name		= "405EXr Rev. D",
-		.cpu_features		= CPU_FTRS_40X,
-		.cpu_user_features	= PPC_FEATURE_32 |
-			PPC_FEATURE_HAS_MMU | PPC_FEATURE_HAS_4xxMAC,
-		.mmu_features		= MMU_FTR_TYPE_40x,
-		.icache_bsize		= 32,
-		.dcache_bsize		= 32,
-		.machine_check		= machine_check_4xx,
-		.platform		= "ppc405",
-	},
-	{	/* 405EXr Rev. D with Security */
-		.pvr_mask		= 0xffff000f,
-		.pvr_value		= 0x12910002,
-		.cpu_name		= "405EXr Rev. D",
-		.cpu_features		= CPU_FTRS_40X,
-		.cpu_user_features	= PPC_FEATURE_32 |
-			PPC_FEATURE_HAS_MMU | PPC_FEATURE_HAS_4xxMAC,
-		.mmu_features		= MMU_FTR_TYPE_40x,
-		.icache_bsize		= 32,
-		.dcache_bsize		= 32,
-		.machine_check		= machine_check_4xx,
-		.platform		= "ppc405",
-	},
-	{
-		/* 405EZ */
-		.pvr_mask		= 0xffff0000,
-		.pvr_value		= 0x41510000,
-		.cpu_name		= "405EZ",
-		.cpu_features		= CPU_FTRS_40X,
-		.cpu_user_features	= PPC_FEATURE_32 |
-			PPC_FEATURE_HAS_MMU | PPC_FEATURE_HAS_4xxMAC,
-		.mmu_features		= MMU_FTR_TYPE_40x,
-		.icache_bsize		= 32,
-		.dcache_bsize		= 32,
-		.machine_check		= machine_check_4xx,
-		.platform		= "ppc405",
-	},
-	{	/* APM8018X */
-		.pvr_mask		= 0xffff0000,
-		.pvr_value		= 0x7ff11432,
-		.cpu_name		= "APM8018X",
-		.cpu_features		= CPU_FTRS_40X,
-		.cpu_user_features	= PPC_FEATURE_32 |
-			PPC_FEATURE_HAS_MMU | PPC_FEATURE_HAS_4xxMAC,
-		.mmu_features		= MMU_FTR_TYPE_40x,
-		.icache_bsize		= 32,
-		.dcache_bsize		= 32,
-		.machine_check		= machine_check_4xx,
-		.platform		= "ppc405",
-	},
-	{	/* default match */
-		.pvr_mask		= 0x00000000,
-		.pvr_value		= 0x00000000,
-		.cpu_name		= "(generic 40x PPC)",
-		.cpu_features		= CPU_FTRS_40X,
-		.cpu_user_features	= PPC_FEATURE_32 |
-			PPC_FEATURE_HAS_MMU | PPC_FEATURE_HAS_4xxMAC,
-		.mmu_features		= MMU_FTR_TYPE_40x,
-		.icache_bsize		= 32,
-		.dcache_bsize		= 32,
-		.machine_check		= machine_check_4xx,
-		.platform		= "ppc405",
-	}
-
-#endif /* CONFIG_40x */
 #ifdef CONFIG_44x
 	{
 		.pvr_mask		= 0xf0000fff,
diff --git a/arch/powerpc/kernel/entry_32.S b/arch/powerpc/kernel/entry_32.S
index a6371fb8f761..9b193d565a03 100644
--- a/arch/powerpc/kernel/entry_32.S
+++ b/arch/powerpc/kernel/entry_32.S
@@ -96,27 +96,6 @@ crit_transfer_to_handler:
 	/* fall through */
 #endif
 
-#ifdef CONFIG_40x
-	.globl	crit_transfer_to_handler
-crit_transfer_to_handler:
-	lwz	r0,crit_r10@l(0)
-	stw	r0,GPR10(r11)
-	lwz	r0,crit_r11@l(0)
-	stw	r0,GPR11(r11)
-	mfspr	r0,SPRN_SRR0
-	stw	r0,crit_srr0@l(0)
-	mfspr	r0,SPRN_SRR1
-	stw	r0,crit_srr1@l(0)
-
-	/* set the stack limit to the current stack */
-	mfspr	r8,SPRN_SPRG_THREAD
-	lwz	r0,KSP_LIMIT(r8)
-	stw	r0,saved_ksp_limit@l(0)
-	rlwinm	r0,r1,0,0,(31 - THREAD_SHIFT)
-	stw	r0,KSP_LIMIT(r8)
-	/* fall through */
-#endif
-
 /*
  * This code finishes saving the registers to the exception frame
  * and jumps to the appropriate handler for the exception, turning
@@ -145,7 +124,7 @@ transfer_to_handler:
 	addi	r2, r12, -THREAD
 	addi	r11,r1,STACK_FRAME_OVERHEAD
 	stw	r11,PT_REGS(r12)
-#if defined(CONFIG_40x) || defined(CONFIG_BOOKE)
+#ifdef CONFIG_BOOKE
 	/* Check to see if the dbcr0 register is set up to debug.  Use the
 	   internal debug mode bit to do this. */
 	lwz	r12,THREAD_DBCR0(r12)
@@ -155,7 +134,7 @@ transfer_to_handler:
 #ifdef CONFIG_PPC_BOOK3S_32
 	kuep_lock r11, r12
 #endif
-#if defined(CONFIG_40x) || defined(CONFIG_BOOKE)
+#ifdef CONFIG_BOOKE
 	beq+	3f
 	/* From user and task is ptraced - load up global dbcr0 */
 	li	r12,-1			/* clear all pending debug events */
@@ -1083,18 +1062,6 @@ exc_exit_restart_end:
  * time of the critical interrupt.
  *
  */
-#ifdef CONFIG_40x
-#define PPC_40x_TURN_OFF_MSR_DR						    \
-	/* avoid any possible TLB misses here by turning off MSR.DR, we	    \
-	 * assume the instructions here are mapped by a pinned TLB entry */ \
-	li	r10,MSR_IR;						    \
-	mtmsr	r10;							    \
-	isync;								    \
-	tophys(r1, r1);
-#else
-#define PPC_40x_TURN_OFF_MSR_DR
-#endif
-
 #define RET_FROM_EXC_LEVEL(exc_lvl_srr0, exc_lvl_srr1, exc_lvl_rfi)	\
 	REST_NVGPRS(r1);						\
 	lwz	r3,_MSR(r1);						\
@@ -1115,7 +1082,6 @@ exc_exit_restart_end:
 	mtlr	r11;							\
 	lwz	r10,_CCR(r1);						\
 	mtcrf	0xff,r10;						\
-	PPC_40x_TURN_OFF_MSR_DR;					\
 	lwz	r9,_DEAR(r1);						\
 	lwz	r10,_ESR(r1);						\
 	mtspr	SPRN_DEAR,r9;						\
@@ -1167,23 +1133,6 @@ exc_exit_restart_end:
 #define RESTORE_MMU_REGS
 #endif
 
-#ifdef CONFIG_40x
-	.globl	ret_from_crit_exc
-ret_from_crit_exc:
-	mfspr	r9,SPRN_SPRG_THREAD
-	lis	r10,saved_ksp_limit@ha;
-	lwz	r10,saved_ksp_limit@l(r10);
-	tovirt(r9,r9);
-	stw	r10,KSP_LIMIT(r9)
-	lis	r9,crit_srr0@ha;
-	lwz	r9,crit_srr0@l(r9);
-	lis	r10,crit_srr1@ha;
-	lwz	r10,crit_srr1@l(r10);
-	mtspr	SPRN_SRR0,r9;
-	mtspr	SPRN_SRR1,r10;
-	RET_FROM_EXC_LEVEL(SPRN_CSRR0, SPRN_CSRR1, PPC_RFCI)
-#endif /* CONFIG_40x */
-
 #ifdef CONFIG_BOOKE
 	.globl	ret_from_crit_exc
 ret_from_crit_exc:
diff --git a/arch/powerpc/kernel/head_32.h b/arch/powerpc/kernel/head_32.h
index 9abec6cd099c..9e3dbc18cb63 100644
--- a/arch/powerpc/kernel/head_32.h
+++ b/arch/powerpc/kernel/head_32.h
@@ -110,16 +110,12 @@ END_MMU_FTR_SECTION_IFSET(MMU_FTR_HPTE_TABLE)
 	stw	r1,GPR1(r11)
 	stw	r1,0(r11)
 	tovirt_novmstack r1, r11	/* set new kernel sp */
-#ifdef CONFIG_40x
-	rlwinm	r9,r9,0,14,12		/* clear MSR_WE (necessary?) */
-#else
 #ifdef CONFIG_VMAP_STACK
 	li	r10, MSR_KERNEL & ~MSR_IR /* can take exceptions */
 #else
 	li	r10,MSR_KERNEL & ~(MSR_IR|MSR_DR) /* can take exceptions */
 #endif
 	mtmsr	r10			/* (except for mach check in rtas) */
-#endif
 	stw	r0,GPR0(r11)
 	lis	r10,STACK_FRAME_REGS_MARKER@ha /* exception frame marker */
 	addi	r10,r10,STACK_FRAME_REGS_MARKER@l
@@ -160,16 +156,12 @@ END_MMU_FTR_SECTION_IFSET(MMU_FTR_HPTE_TABLE)
 	mfcr	r10
 	rlwinm	r10,r10,0,4,2	/* Clear SO bit in CR */
 	stw	r10,_CCR(r11)		/* save registers */
-#ifdef CONFIG_40x
-	rlwinm	r9,r9,0,14,12		/* clear MSR_WE (necessary?) */
-#else
 #ifdef CONFIG_VMAP_STACK
 	LOAD_REG_IMMEDIATE(r10, MSR_KERNEL & ~MSR_IR) /* can take exceptions */
 #else
 	LOAD_REG_IMMEDIATE(r10, MSR_KERNEL & ~(MSR_IR|MSR_DR)) /* can take exceptions */
 #endif
 	mtmsr	r10			/* (except for mach check in rtas) */
-#endif
 	lis	r10,STACK_FRAME_REGS_MARKER@ha /* exception frame marker */
 	stw	r2,GPR2(r11)
 	addi	r10,r10,STACK_FRAME_REGS_MARKER@l
@@ -183,29 +175,7 @@ END_MMU_FTR_SECTION_IFSET(MMU_FTR_HPTE_TABLE)
 	addi	r11,r1,STACK_FRAME_OVERHEAD
 	addi	r2,r12,-THREAD
 	stw	r11,PT_REGS(r12)
-#if defined(CONFIG_40x)
-	/* Check to see if the dbcr0 register is set up to debug.  Use the
-	   internal debug mode bit to do this. */
-	lwz	r12,THREAD_DBCR0(r12)
-	andis.	r12,r12,DBCR0_IDM@h
-#endif
 	ACCOUNT_CPU_USER_ENTRY(r2, r11, r12)
-#if defined(CONFIG_40x)
-	beq+	3f
-	/* From user and task is ptraced - load up global dbcr0 */
-	li	r12,-1			/* clear all pending debug events */
-	mtspr	SPRN_DBSR,r12
-	lis	r11,global_dbcr0@ha
-	tophys(r11,r11)
-	addi	r11,r11,global_dbcr0@l
-	lwz	r12,0(r11)
-	mtspr	SPRN_DBCR0,r12
-	lwz	r12,4(r11)
-	addi	r12,r12,-1
-	stw	r12,4(r11)
-#endif
-
-3:
 	tovirt_novmstack r2, r2 	/* set r2 to current */
 	lis	r11, transfer_to_syscall@h
 	ori	r11, r11, transfer_to_syscall@l
diff --git a/arch/powerpc/kernel/head_40x.S b/arch/powerpc/kernel/head_40x.S
deleted file mode 100644
index 9bb663977e84..000000000000
--- a/arch/powerpc/kernel/head_40x.S
+++ /dev/null
@@ -1,905 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-or-later */
-/*
- *    Copyright (c) 1995-1996 Gary Thomas <gdt@linuxppc.org>
- *      Initial PowerPC version.
- *    Copyright (c) 1996 Cort Dougan <cort@cs.nmt.edu>
- *      Rewritten for PReP
- *    Copyright (c) 1996 Paul Mackerras <paulus@cs.anu.edu.au>
- *      Low-level exception handers, MMU support, and rewrite.
- *    Copyright (c) 1997 Dan Malek <dmalek@jlc.net>
- *      PowerPC 8xx modifications.
- *    Copyright (c) 1998-1999 TiVo, Inc.
- *      PowerPC 403GCX modifications.
- *    Copyright (c) 1999 Grant Erickson <grant@lcse.umn.edu>
- *      PowerPC 403GCX/405GP modifications.
- *    Copyright 2000 MontaVista Software Inc.
- *	PPC405 modifications
- *      PowerPC 403GCX/405GP modifications.
- * 	Author: MontaVista Software, Inc.
- *         	frank_rowand@mvista.com or source@mvista.com
- * 	   	debbie_chu@mvista.com
- *
- *    Module name: head_4xx.S
- *
- *    Description:
- *      Kernel execution entry point code.
- */
-
-#include <linux/init.h>
-#include <asm/processor.h>
-#include <asm/page.h>
-#include <asm/mmu.h>
-#include <asm/pgtable.h>
-#include <asm/cputable.h>
-#include <asm/thread_info.h>
-#include <asm/ppc_asm.h>
-#include <asm/asm-offsets.h>
-#include <asm/ptrace.h>
-#include <asm/export.h>
-#include <asm/asm-405.h>
-
-#include "head_32.h"
-
-/* As with the other PowerPC ports, it is expected that when code
- * execution begins here, the following registers contain valid, yet
- * optional, information:
- *
- *   r3 - Board info structure pointer (DRAM, frequency, MAC address, etc.)
- *   r4 - Starting address of the init RAM disk
- *   r5 - Ending address of the init RAM disk
- *   r6 - Start of kernel command line string (e.g. "mem=96m")
- *   r7 - End of kernel command line string
- *
- * This is all going to change RSN when we add bi_recs.......  -- Dan
- */
-	__HEAD
-_ENTRY(_stext);
-_ENTRY(_start);
-
-	mr	r31,r3			/* save device tree ptr */
-
-	/* We have to turn on the MMU right away so we get cache modes
-	 * set correctly.
-	 */
-	bl	initial_mmu
-
-/* We now have the lower 16 Meg mapped into TLB entries, and the caches
- * ready to work.
- */
-turn_on_mmu:
-	lis	r0,MSR_KERNEL@h
-	ori	r0,r0,MSR_KERNEL@l
-	mtspr	SPRN_SRR1,r0
-	lis	r0,start_here@h
-	ori	r0,r0,start_here@l
-	mtspr	SPRN_SRR0,r0
-	SYNC
-	rfi				/* enables MMU */
-	b	.			/* prevent prefetch past rfi */
-
-/*
- * This area is used for temporarily saving registers during the
- * critical exception prolog.
- */
-	. = 0xc0
-crit_save:
-_ENTRY(crit_r10)
-	.space	4
-_ENTRY(crit_r11)
-	.space	4
-_ENTRY(crit_srr0)
-	.space	4
-_ENTRY(crit_srr1)
-	.space	4
-_ENTRY(saved_ksp_limit)
-	.space	4
-
-/*
- * Exception prolog for critical exceptions.  This is a little different
- * from the normal exception prolog above since a critical exception
- * can potentially occur at any point during normal exception processing.
- * Thus we cannot use the same SPRG registers as the normal prolog above.
- * Instead we use a couple of words of memory at low physical addresses.
- * This is OK since we don't support SMP on these processors.
- */
-#define CRITICAL_EXCEPTION_PROLOG					     \
-	stw	r10,crit_r10@l(0);	/* save two registers to work with */\
-	stw	r11,crit_r11@l(0);					     \
-	mfcr	r10;			/* save CR in r10 for now	   */\
-	mfspr	r11,SPRN_SRR3;		/* check whether user or kernel    */\
-	andi.	r11,r11,MSR_PR;						     \
-	lis	r11,critirq_ctx@ha;					     \
-	tophys(r11,r11);						     \
-	lwz	r11,critirq_ctx@l(r11);					     \
-	beq	1f;							     \
-	/* COMING FROM USER MODE */					     \
-	mfspr	r11,SPRN_SPRG_THREAD;	/* if from user, start at top of   */\
-	lwz	r11,TASK_STACK-THREAD(r11); /* this thread's kernel stack */\
-1:	addi	r11,r11,THREAD_SIZE-INT_FRAME_SIZE; /* Alloc an excpt frm  */\
-	tophys(r11,r11);						     \
-	stw	r10,_CCR(r11);          /* save various registers	   */\
-	stw	r12,GPR12(r11);						     \
-	stw	r9,GPR9(r11);						     \
-	mflr	r10;							     \
-	stw	r10,_LINK(r11);						     \
-	mfspr	r12,SPRN_DEAR;		/* save DEAR and ESR in the frame  */\
-	stw	r12,_DEAR(r11);		/* since they may have had stuff   */\
-	mfspr	r9,SPRN_ESR;		/* in them at the point where the  */\
-	stw	r9,_ESR(r11);		/* exception was taken		   */\
-	mfspr	r12,SPRN_SRR2;						     \
-	stw	r1,GPR1(r11);						     \
-	mfspr	r9,SPRN_SRR3;						     \
-	stw	r1,0(r11);						     \
-	tovirt(r1,r11);							     \
-	rlwinm	r9,r9,0,14,12;		/* clear MSR_WE (necessary?)	   */\
-	stw	r0,GPR0(r11);						     \
-	lis	r10, STACK_FRAME_REGS_MARKER@ha; /* exception frame marker */\
-	addi	r10, r10, STACK_FRAME_REGS_MARKER@l;			     \
-	stw	r10, 8(r11);						     \
-	SAVE_4GPRS(3, r11);						     \
-	SAVE_2GPRS(7, r11)
-
-	/*
-	 * State at this point:
-	 * r9 saved in stack frame, now saved SRR3 & ~MSR_WE
-	 * r10 saved in crit_r10 and in stack frame, trashed
-	 * r11 saved in crit_r11 and in stack frame,
-	 *	now phys stack/exception frame pointer
-	 * r12 saved in stack frame, now saved SRR2
-	 * CR saved in stack frame, CR0.EQ = !SRR3.PR
-	 * LR, DEAR, ESR in stack frame
-	 * r1 saved in stack frame, now virt stack/excframe pointer
-	 * r0, r3-r8 saved in stack frame
-	 */
-
-/*
- * Exception vectors.
- */
-#define CRITICAL_EXCEPTION(n, label, hdlr)			\
-	START_EXCEPTION(n, label);				\
-	CRITICAL_EXCEPTION_PROLOG;				\
-	addi	r3,r1,STACK_FRAME_OVERHEAD;			\
-	EXC_XFER_TEMPLATE(hdlr, n+2, (MSR_KERNEL & ~(MSR_ME|MSR_DE|MSR_CE)), \
-			  crit_transfer_to_handler, ret_from_crit_exc)
-
-/*
- * 0x0100 - Critical Interrupt Exception
- */
-	CRITICAL_EXCEPTION(0x0100, CriticalInterrupt, unknown_exception)
-
-/*
- * 0x0200 - Machine Check Exception
- */
-	CRITICAL_EXCEPTION(0x0200, MachineCheck, machine_check_exception)
-
-/*
- * 0x0300 - Data Storage Exception
- * This happens for just a few reasons.  U0 set (but we don't do that),
- * or zone protection fault (user violation, write to protected page).
- * If this is just an update of modified status, we do that quickly
- * and exit.  Otherwise, we call heavywight functions to do the work.
- */
-	START_EXCEPTION(0x0300,	DataStorage)
-	mtspr	SPRN_SPRG_SCRATCH0, r10 /* Save some working registers */
-	mtspr	SPRN_SPRG_SCRATCH1, r11
-#ifdef CONFIG_403GCX
-	stw     r12, 0(r0)
-	stw     r9, 4(r0)
-	mfcr    r11
-	mfspr   r12, SPRN_PID
-	stw     r11, 8(r0)
-	stw     r12, 12(r0)
-#else
-	mtspr	SPRN_SPRG_SCRATCH3, r12
-	mtspr	SPRN_SPRG_SCRATCH4, r9
-	mfcr	r11
-	mfspr	r12, SPRN_PID
-	mtspr	SPRN_SPRG_SCRATCH6, r11
-	mtspr	SPRN_SPRG_SCRATCH5, r12
-#endif
-
-	/* First, check if it was a zone fault (which means a user
-	* tried to access a kernel or read-protected page - always
-	* a SEGV).  All other faults here must be stores, so no
-	* need to check ESR_DST as well. */
-	mfspr	r10, SPRN_ESR
-	andis.	r10, r10, ESR_DIZ@h
-	bne	2f
-
-	mfspr	r10, SPRN_DEAR		/* Get faulting address */
-
-	/* If we are faulting a kernel address, we have to use the
-	 * kernel page tables.
-	 */
-	lis	r11, PAGE_OFFSET@h
-	cmplw	r10, r11
-	blt+	3f
-	lis	r11, swapper_pg_dir@h
-	ori	r11, r11, swapper_pg_dir@l
-	li	r9, 0
-	mtspr	SPRN_PID, r9		/* TLB will have 0 TID */
-	b	4f
-
-	/* Get the PGD for the current thread.
-	 */
-3:
-	mfspr	r11,SPRN_SPRG_THREAD
-	lwz	r11,PGDIR(r11)
-4:
-	tophys(r11, r11)
-	rlwimi	r11, r10, 12, 20, 29	/* Create L1 (pgdir/pmd) address */
-	lwz	r11, 0(r11)		/* Get L1 entry */
-	rlwinm.	r12, r11, 0, 0, 19	/* Extract L2 (pte) base address */
-	beq	2f			/* Bail if no table */
-
-	rlwimi	r12, r10, 22, 20, 29	/* Compute PTE address */
-	lwz	r11, 0(r12)		/* Get Linux PTE */
-
-	andi.	r9, r11, _PAGE_RW	/* Is it writeable? */
-	beq	2f			/* Bail if not */
-
-	/* Update 'changed'.
-	*/
-	ori	r11, r11, _PAGE_DIRTY|_PAGE_ACCESSED|_PAGE_HWWRITE
-	stw	r11, 0(r12)		/* Update Linux page table */
-
-	/* Most of the Linux PTE is ready to load into the TLB LO.
-	 * We set ZSEL, where only the LS-bit determines user access.
-	 * We set execute, because we don't have the granularity to
-	 * properly set this at the page level (Linux problem).
-	 * If shared is set, we cause a zero PID->TID load.
-	 * Many of these bits are software only.  Bits we don't set
-	 * here we (properly should) assume have the appropriate value.
-	 */
-	li	r12, 0x0ce2
-	andc	r11, r11, r12		/* Make sure 20, 21 are zero */
-
-	/* find the TLB index that caused the fault.  It has to be here.
-	*/
-	tlbsx	r9, 0, r10
-
-	tlbwe	r11, r9, TLB_DATA		/* Load TLB LO */
-
-	/* Done...restore registers and get out of here.
-	*/
-#ifdef CONFIG_403GCX
-	lwz     r12, 12(r0)
-	lwz     r11, 8(r0)
-	mtspr   SPRN_PID, r12
-	mtcr    r11
-	lwz     r9, 4(r0)
-	lwz     r12, 0(r0)
-#else
-	mfspr	r12, SPRN_SPRG_SCRATCH5
-	mfspr	r11, SPRN_SPRG_SCRATCH6
-	mtspr	SPRN_PID, r12
-	mtcr	r11
-	mfspr	r9, SPRN_SPRG_SCRATCH4
-	mfspr	r12, SPRN_SPRG_SCRATCH3
-#endif
-	mfspr	r11, SPRN_SPRG_SCRATCH1
-	mfspr	r10, SPRN_SPRG_SCRATCH0
-	PPC405_ERR77_SYNC
-	rfi			/* Should sync shadow TLBs */
-	b	.		/* prevent prefetch past rfi */
-
-2:
-	/* The bailout.  Restore registers to pre-exception conditions
-	 * and call the heavyweights to help us out.
-	 */
-#ifdef CONFIG_403GCX
-	lwz     r12, 12(r0)
-	lwz     r11, 8(r0)
-	mtspr   SPRN_PID, r12
-	mtcr    r11
-	lwz     r9, 4(r0)
-	lwz     r12, 0(r0)
-#else
-	mfspr	r12, SPRN_SPRG_SCRATCH5
-	mfspr	r11, SPRN_SPRG_SCRATCH6
-	mtspr	SPRN_PID, r12
-	mtcr	r11
-	mfspr	r9, SPRN_SPRG_SCRATCH4
-	mfspr	r12, SPRN_SPRG_SCRATCH3
-#endif
-	mfspr	r11, SPRN_SPRG_SCRATCH1
-	mfspr	r10, SPRN_SPRG_SCRATCH0
-	b	DataAccess
-
-/*
- * 0x0400 - Instruction Storage Exception
- * This is caused by a fetch from non-execute or guarded pages.
- */
-	START_EXCEPTION(0x0400, InstructionAccess)
-	EXCEPTION_PROLOG
-	mr	r4,r12			/* Pass SRR0 as arg2 */
-	stw	r4, _DEAR(r11)
-	li	r5,0			/* Pass zero as arg3 */
-	EXC_XFER_LITE(0x400, handle_page_fault)
-
-/* 0x0500 - External Interrupt Exception */
-	EXCEPTION(0x0500, HardwareInterrupt, do_IRQ, EXC_XFER_LITE)
-
-/* 0x0600 - Alignment Exception */
-	START_EXCEPTION(0x0600, Alignment)
-	EXCEPTION_PROLOG
-	mfspr	r4,SPRN_DEAR		/* Grab the DEAR and save it */
-	stw	r4,_DEAR(r11)
-	addi	r3,r1,STACK_FRAME_OVERHEAD
-	EXC_XFER_STD(0x600, alignment_exception)
-
-/* 0x0700 - Program Exception */
-	START_EXCEPTION(0x0700, ProgramCheck)
-	EXCEPTION_PROLOG
-	mfspr	r4,SPRN_ESR		/* Grab the ESR and save it */
-	stw	r4,_ESR(r11)
-	addi	r3,r1,STACK_FRAME_OVERHEAD
-	EXC_XFER_STD(0x700, program_check_exception)
-
-	EXCEPTION(0x0800, Trap_08, unknown_exception, EXC_XFER_STD)
-	EXCEPTION(0x0900, Trap_09, unknown_exception, EXC_XFER_STD)
-	EXCEPTION(0x0A00, Trap_0A, unknown_exception, EXC_XFER_STD)
-	EXCEPTION(0x0B00, Trap_0B, unknown_exception, EXC_XFER_STD)
-
-/* 0x0C00 - System Call Exception */
-	START_EXCEPTION(0x0C00,	SystemCall)
-	SYSCALL_ENTRY	0xc00
-
-	EXCEPTION(0x0D00, Trap_0D, unknown_exception, EXC_XFER_STD)
-	EXCEPTION(0x0E00, Trap_0E, unknown_exception, EXC_XFER_STD)
-	EXCEPTION(0x0F00, Trap_0F, unknown_exception, EXC_XFER_STD)
-
-/* 0x1000 - Programmable Interval Timer (PIT) Exception */
-	. = 0x1000
-	b Decrementer
-
-/* 0x1010 - Fixed Interval Timer (FIT) Exception
-*/
-	. = 0x1010
-	b FITException
-
-/* 0x1020 - Watchdog Timer (WDT) Exception
-*/
-	. = 0x1020
-	b WDTException
-
-/* 0x1100 - Data TLB Miss Exception
- * As the name implies, translation is not in the MMU, so search the
- * page tables and fix it.  The only purpose of this function is to
- * load TLB entries from the page table if they exist.
- */
-	START_EXCEPTION(0x1100,	DTLBMiss)
-	mtspr	SPRN_SPRG_SCRATCH0, r10 /* Save some working registers */
-	mtspr	SPRN_SPRG_SCRATCH1, r11
-#ifdef CONFIG_403GCX
-	stw     r12, 0(r0)
-	stw     r9, 4(r0)
-	mfcr    r11
-	mfspr   r12, SPRN_PID
-	stw     r11, 8(r0)
-	stw     r12, 12(r0)
-#else
-	mtspr	SPRN_SPRG_SCRATCH3, r12
-	mtspr	SPRN_SPRG_SCRATCH4, r9
-	mfcr	r11
-	mfspr	r12, SPRN_PID
-	mtspr	SPRN_SPRG_SCRATCH6, r11
-	mtspr	SPRN_SPRG_SCRATCH5, r12
-#endif
-	mfspr	r10, SPRN_DEAR		/* Get faulting address */
-
-	/* If we are faulting a kernel address, we have to use the
-	 * kernel page tables.
-	 */
-	lis	r11, PAGE_OFFSET@h
-	cmplw	r10, r11
-	blt+	3f
-	lis	r11, swapper_pg_dir@h
-	ori	r11, r11, swapper_pg_dir@l
-	li	r9, 0
-	mtspr	SPRN_PID, r9		/* TLB will have 0 TID */
-	b	4f
-
-	/* Get the PGD for the current thread.
-	 */
-3:
-	mfspr	r11,SPRN_SPRG_THREAD
-	lwz	r11,PGDIR(r11)
-4:
-	tophys(r11, r11)
-	rlwimi	r11, r10, 12, 20, 29	/* Create L1 (pgdir/pmd) address */
-	lwz	r12, 0(r11)		/* Get L1 entry */
-	andi.	r9, r12, _PMD_PRESENT	/* Check if it points to a PTE page */
-	beq	2f			/* Bail if no table */
-
-	rlwimi	r12, r10, 22, 20, 29	/* Compute PTE address */
-	lwz	r11, 0(r12)		/* Get Linux PTE */
-	andi.	r9, r11, _PAGE_PRESENT
-	beq	5f
-
-	ori	r11, r11, _PAGE_ACCESSED
-	stw	r11, 0(r12)
-
-	/* Create TLB tag.  This is the faulting address plus a static
-	 * set of bits.  These are size, valid, E, U0.
-	*/
-	li	r12, 0x00c0
-	rlwimi	r10, r12, 0, 20, 31
-
-	b	finish_tlb_load
-
-2:	/* Check for possible large-page pmd entry */
-	rlwinm.	r9, r12, 2, 22, 24
-	beq	5f
-
-	/* Create TLB tag.  This is the faulting address, plus a static
-	 * set of bits (valid, E, U0) plus the size from the PMD.
-	 */
-	ori	r9, r9, 0x40
-	rlwimi	r10, r9, 0, 20, 31
-	mr	r11, r12
-
-	b	finish_tlb_load
-
-5:
-	/* The bailout.  Restore registers to pre-exception conditions
-	 * and call the heavyweights to help us out.
-	 */
-#ifdef CONFIG_403GCX
-	lwz     r12, 12(r0)
-	lwz     r11, 8(r0)
-	mtspr   SPRN_PID, r12
-	mtcr    r11
-	lwz     r9, 4(r0)
-	lwz     r12, 0(r0)
-#else
-	mfspr	r12, SPRN_SPRG_SCRATCH5
-	mfspr	r11, SPRN_SPRG_SCRATCH6
-	mtspr	SPRN_PID, r12
-	mtcr	r11
-	mfspr	r9, SPRN_SPRG_SCRATCH4
-	mfspr	r12, SPRN_SPRG_SCRATCH3
-#endif
-	mfspr	r11, SPRN_SPRG_SCRATCH1
-	mfspr	r10, SPRN_SPRG_SCRATCH0
-	b	DataAccess
-
-/* 0x1200 - Instruction TLB Miss Exception
- * Nearly the same as above, except we get our information from different
- * registers and bailout to a different point.
- */
-	START_EXCEPTION(0x1200,	ITLBMiss)
-	mtspr	SPRN_SPRG_SCRATCH0, r10	 /* Save some working registers */
-	mtspr	SPRN_SPRG_SCRATCH1, r11
-#ifdef CONFIG_403GCX
-	stw     r12, 0(r0)
-	stw     r9, 4(r0)
-	mfcr    r11
-	mfspr   r12, SPRN_PID
-	stw     r11, 8(r0)
-	stw     r12, 12(r0)
-#else
-	mtspr	SPRN_SPRG_SCRATCH3, r12
-	mtspr	SPRN_SPRG_SCRATCH4, r9
-	mfcr	r11
-	mfspr	r12, SPRN_PID
-	mtspr	SPRN_SPRG_SCRATCH6, r11
-	mtspr	SPRN_SPRG_SCRATCH5, r12
-#endif
-	mfspr	r10, SPRN_SRR0		/* Get faulting address */
-
-	/* If we are faulting a kernel address, we have to use the
-	 * kernel page tables.
-	 */
-	lis	r11, PAGE_OFFSET@h
-	cmplw	r10, r11
-	blt+	3f
-	lis	r11, swapper_pg_dir@h
-	ori	r11, r11, swapper_pg_dir@l
-	li	r9, 0
-	mtspr	SPRN_PID, r9		/* TLB will have 0 TID */
-	b	4f
-
-	/* Get the PGD for the current thread.
-	 */
-3:
-	mfspr	r11,SPRN_SPRG_THREAD
-	lwz	r11,PGDIR(r11)
-4:
-	tophys(r11, r11)
-	rlwimi	r11, r10, 12, 20, 29	/* Create L1 (pgdir/pmd) address */
-	lwz	r12, 0(r11)		/* Get L1 entry */
-	andi.	r9, r12, _PMD_PRESENT	/* Check if it points to a PTE page */
-	beq	2f			/* Bail if no table */
-
-	rlwimi	r12, r10, 22, 20, 29	/* Compute PTE address */
-	lwz	r11, 0(r12)		/* Get Linux PTE */
-	andi.	r9, r11, _PAGE_PRESENT
-	beq	5f
-
-	ori	r11, r11, _PAGE_ACCESSED
-	stw	r11, 0(r12)
-
-	/* Create TLB tag.  This is the faulting address plus a static
-	 * set of bits.  These are size, valid, E, U0.
-	*/
-	li	r12, 0x00c0
-	rlwimi	r10, r12, 0, 20, 31
-
-	b	finish_tlb_load
-
-2:	/* Check for possible large-page pmd entry */
-	rlwinm.	r9, r12, 2, 22, 24
-	beq	5f
-
-	/* Create TLB tag.  This is the faulting address, plus a static
-	 * set of bits (valid, E, U0) plus the size from the PMD.
-	 */
-	ori	r9, r9, 0x40
-	rlwimi	r10, r9, 0, 20, 31
-	mr	r11, r12
-
-	b	finish_tlb_load
-
-5:
-	/* The bailout.  Restore registers to pre-exception conditions
-	 * and call the heavyweights to help us out.
-	 */
-#ifdef CONFIG_403GCX
-	lwz     r12, 12(r0)
-	lwz     r11, 8(r0)
-	mtspr   SPRN_PID, r12
-	mtcr    r11
-	lwz     r9, 4(r0)
-	lwz     r12, 0(r0)
-#else
-	mfspr	r12, SPRN_SPRG_SCRATCH5
-	mfspr	r11, SPRN_SPRG_SCRATCH6
-	mtspr	SPRN_PID, r12
-	mtcr	r11
-	mfspr	r9, SPRN_SPRG_SCRATCH4
-	mfspr	r12, SPRN_SPRG_SCRATCH3
-#endif
-	mfspr	r11, SPRN_SPRG_SCRATCH1
-	mfspr	r10, SPRN_SPRG_SCRATCH0
-	b	InstructionAccess
-
-	EXCEPTION(0x1300, Trap_13, unknown_exception, EXC_XFER_STD)
-	EXCEPTION(0x1400, Trap_14, unknown_exception, EXC_XFER_STD)
-	EXCEPTION(0x1500, Trap_15, unknown_exception, EXC_XFER_STD)
-	EXCEPTION(0x1600, Trap_16, unknown_exception, EXC_XFER_STD)
-#ifdef CONFIG_IBM405_ERR51
-	/* 405GP errata 51 */
-	START_EXCEPTION(0x1700, Trap_17)
-	b DTLBMiss
-#else
-	EXCEPTION(0x1700, Trap_17, unknown_exception, EXC_XFER_STD)
-#endif
-	EXCEPTION(0x1800, Trap_18, unknown_exception, EXC_XFER_STD)
-	EXCEPTION(0x1900, Trap_19, unknown_exception, EXC_XFER_STD)
-	EXCEPTION(0x1A00, Trap_1A, unknown_exception, EXC_XFER_STD)
-	EXCEPTION(0x1B00, Trap_1B, unknown_exception, EXC_XFER_STD)
-	EXCEPTION(0x1C00, Trap_1C, unknown_exception, EXC_XFER_STD)
-	EXCEPTION(0x1D00, Trap_1D, unknown_exception, EXC_XFER_STD)
-	EXCEPTION(0x1E00, Trap_1E, unknown_exception, EXC_XFER_STD)
-	EXCEPTION(0x1F00, Trap_1F, unknown_exception, EXC_XFER_STD)
-
-/* Check for a single step debug exception while in an exception
- * handler before state has been saved.  This is to catch the case
- * where an instruction that we are trying to single step causes
- * an exception (eg ITLB/DTLB miss) and thus the first instruction of
- * the exception handler generates a single step debug exception.
- *
- * If we get a debug trap on the first instruction of an exception handler,
- * we reset the MSR_DE in the _exception handler's_ MSR (the debug trap is
- * a critical exception, so we are using SPRN_CSRR1 to manipulate the MSR).
- * The exception handler was handling a non-critical interrupt, so it will
- * save (and later restore) the MSR via SPRN_SRR1, which will still have
- * the MSR_DE bit set.
- */
-	/* 0x2000 - Debug Exception */
-	START_EXCEPTION(0x2000, DebugTrap)
-	CRITICAL_EXCEPTION_PROLOG
-
-	/*
-	 * If this is a single step or branch-taken exception in an
-	 * exception entry sequence, it was probably meant to apply to
-	 * the code where the exception occurred (since exception entry
-	 * doesn't turn off DE automatically).  We simulate the effect
-	 * of turning off DE on entry to an exception handler by turning
-	 * off DE in the SRR3 value and clearing the debug status.
-	 */
-	mfspr	r10,SPRN_DBSR		/* check single-step/branch taken */
-	andis.	r10,r10,DBSR_IC@h
-	beq+	2f
-
-	andi.	r10,r9,MSR_IR|MSR_PR	/* check supervisor + MMU off */
-	beq	1f			/* branch and fix it up */
-
-	mfspr   r10,SPRN_SRR2		/* Faulting instruction address */
-	cmplwi  r10,0x2100
-	bgt+    2f			/* address above exception vectors */
-
-	/* here it looks like we got an inappropriate debug exception. */
-1:	rlwinm	r9,r9,0,~MSR_DE		/* clear DE in the SRR3 value */
-	lis	r10,DBSR_IC@h		/* clear the IC event */
-	mtspr	SPRN_DBSR,r10
-	/* restore state and get out */
-	lwz	r10,_CCR(r11)
-	lwz	r0,GPR0(r11)
-	lwz	r1,GPR1(r11)
-	mtcrf	0x80,r10
-	mtspr	SPRN_SRR2,r12
-	mtspr	SPRN_SRR3,r9
-	lwz	r9,GPR9(r11)
-	lwz	r12,GPR12(r11)
-	lwz	r10,crit_r10@l(0)
-	lwz	r11,crit_r11@l(0)
-	PPC405_ERR77_SYNC
-	rfci
-	b	.
-
-	/* continue normal handling for a critical exception... */
-2:	mfspr	r4,SPRN_DBSR
-	addi	r3,r1,STACK_FRAME_OVERHEAD
-	EXC_XFER_TEMPLATE(DebugException, 0x2002, \
-		(MSR_KERNEL & ~(MSR_ME|MSR_DE|MSR_CE)), \
-		crit_transfer_to_handler, ret_from_crit_exc)
-
-	/* Programmable Interval Timer (PIT) Exception. (from 0x1000) */
-Decrementer:
-	EXCEPTION_PROLOG
-	lis	r0,TSR_PIS@h
-	mtspr	SPRN_TSR,r0		/* Clear the PIT exception */
-	addi	r3,r1,STACK_FRAME_OVERHEAD
-	EXC_XFER_LITE(0x1000, timer_interrupt)
-
-	/* Fixed Interval Timer (FIT) Exception. (from 0x1010) */
-FITException:
-	EXCEPTION_PROLOG
-	addi	r3,r1,STACK_FRAME_OVERHEAD;
-	EXC_XFER_STD(0x1010, unknown_exception)
-
-	/* Watchdog Timer (WDT) Exception. (from 0x1020) */
-WDTException:
-	CRITICAL_EXCEPTION_PROLOG;
-	addi	r3,r1,STACK_FRAME_OVERHEAD;
-	EXC_XFER_TEMPLATE(WatchdogException, 0x1020+2,
-	                  (MSR_KERNEL & ~(MSR_ME|MSR_DE|MSR_CE)),
-			  crit_transfer_to_handler, ret_from_crit_exc)
-
-/*
- * The other Data TLB exceptions bail out to this point
- * if they can't resolve the lightweight TLB fault.
- */
-DataAccess:
-	EXCEPTION_PROLOG
-	mfspr	r5,SPRN_ESR		/* Grab the ESR, save it, pass arg3 */
-	stw	r5,_ESR(r11)
-	mfspr	r4,SPRN_DEAR		/* Grab the DEAR, save it, pass arg2 */
-	stw	r4, _DEAR(r11)
-	EXC_XFER_LITE(0x300, handle_page_fault)
-
-/* Other PowerPC processors, namely those derived from the 6xx-series
- * have vectors from 0x2100 through 0x2F00 defined, but marked as reserved.
- * However, for the 4xx-series processors these are neither defined nor
- * reserved.
- */
-
-	/* Damn, I came up one instruction too many to fit into the
-	 * exception space :-).  Both the instruction and data TLB
-	 * miss get to this point to load the TLB.
-	 * 	r10 - TLB_TAG value
-	 * 	r11 - Linux PTE
-	 *	r12, r9 - available to use
-	 *	PID - loaded with proper value when we get here
-	 *	Upon exit, we reload everything and RFI.
-	 * Actually, it will fit now, but oh well.....a common place
-	 * to load the TLB.
-	 */
-tlb_4xx_index:
-	.long	0
-finish_tlb_load:
-	/* load the next available TLB index.
-	*/
-	lwz	r9, tlb_4xx_index@l(0)
-	addi	r9, r9, 1
-	andi.	r9, r9, (PPC40X_TLB_SIZE-1)
-	stw	r9, tlb_4xx_index@l(0)
-
-6:
-	/*
-	 * Clear out the software-only bits in the PTE to generate the
-	 * TLB_DATA value.  These are the bottom 2 bits of the RPM, the
-	 * top 3 bits of the zone field, and M.
-	 */
-	li	r12, 0x0ce2
-	andc	r11, r11, r12
-
-	tlbwe	r11, r9, TLB_DATA		/* Load TLB LO */
-	tlbwe	r10, r9, TLB_TAG		/* Load TLB HI */
-
-	/* Done...restore registers and get out of here.
-	*/
-#ifdef CONFIG_403GCX
-	lwz     r12, 12(r0)
-	lwz     r11, 8(r0)
-	mtspr   SPRN_PID, r12
-	mtcr    r11
-	lwz     r9, 4(r0)
-	lwz     r12, 0(r0)
-#else
-	mfspr	r12, SPRN_SPRG_SCRATCH5
-	mfspr	r11, SPRN_SPRG_SCRATCH6
-	mtspr	SPRN_PID, r12
-	mtcr	r11
-	mfspr	r9, SPRN_SPRG_SCRATCH4
-	mfspr	r12, SPRN_SPRG_SCRATCH3
-#endif
-	mfspr	r11, SPRN_SPRG_SCRATCH1
-	mfspr	r10, SPRN_SPRG_SCRATCH0
-	PPC405_ERR77_SYNC
-	rfi			/* Should sync shadow TLBs */
-	b	.		/* prevent prefetch past rfi */
-
-/* This is where the main kernel code starts.
- */
-start_here:
-
-	/* ptr to current */
-	lis	r2,init_task@h
-	ori	r2,r2,init_task@l
-
-	/* ptr to phys current thread */
-	tophys(r4,r2)
-	addi	r4,r4,THREAD	/* init task's THREAD */
-	mtspr	SPRN_SPRG_THREAD,r4
-
-	/* stack */
-	lis	r1,init_thread_union@ha
-	addi	r1,r1,init_thread_union@l
-	li	r0,0
-	stwu	r0,THREAD_SIZE-STACK_FRAME_OVERHEAD(r1)
-
-	bl	early_init	/* We have to do this with MMU on */
-
-/*
- * Decide what sort of machine this is and initialize the MMU.
- */
-#ifdef CONFIG_KASAN
-	bl	kasan_early_init
-#endif
-	li	r3,0
-	mr	r4,r31
-	bl	machine_init
-	bl	MMU_init
-
-/* Go back to running unmapped so we can load up new values
- * and change to using our exception vectors.
- * On the 4xx, all we have to do is invalidate the TLB to clear
- * the old 16M byte TLB mappings.
- */
-	lis	r4,2f@h
-	ori	r4,r4,2f@l
-	tophys(r4,r4)
-	lis	r3,(MSR_KERNEL & ~(MSR_IR|MSR_DR))@h
-	ori	r3,r3,(MSR_KERNEL & ~(MSR_IR|MSR_DR))@l
-	mtspr	SPRN_SRR0,r4
-	mtspr	SPRN_SRR1,r3
-	rfi
-	b	.		/* prevent prefetch past rfi */
-
-/* Load up the kernel context */
-2:
-	sync			/* Flush to memory before changing TLB */
-	tlbia
-	isync			/* Flush shadow TLBs */
-
-	/* set up the PTE pointers for the Abatron bdiGDB.
-	*/
-	lis	r6, swapper_pg_dir@h
-	ori	r6, r6, swapper_pg_dir@l
-	lis	r5, abatron_pteptrs@h
-	ori	r5, r5, abatron_pteptrs@l
-	stw	r5, 0xf0(r0)	/* Must match your Abatron config file */
-	tophys(r5,r5)
-	stw	r6, 0(r5)
-
-/* Now turn on the MMU for real! */
-	lis	r4,MSR_KERNEL@h
-	ori	r4,r4,MSR_KERNEL@l
-	lis	r3,start_kernel@h
-	ori	r3,r3,start_kernel@l
-	mtspr	SPRN_SRR0,r3
-	mtspr	SPRN_SRR1,r4
-	rfi			/* enable MMU and jump to start_kernel */
-	b	.		/* prevent prefetch past rfi */
-
-/* Set up the initial MMU state so we can do the first level of
- * kernel initialization.  This maps the first 16 MBytes of memory 1:1
- * virtual to physical and more importantly sets the cache mode.
- */
-initial_mmu:
-	tlbia			/* Invalidate all TLB entries */
-	isync
-
-	/* We should still be executing code at physical address 0x0000xxxx
-	 * at this point. However, start_here is at virtual address
-	 * 0xC000xxxx. So, set up a TLB mapping to cover this once
-	 * translation is enabled.
-	 */
-
-	lis	r3,KERNELBASE@h		/* Load the kernel virtual address */
-	ori	r3,r3,KERNELBASE@l
-	tophys(r4,r3)			/* Load the kernel physical address */
-
-	iccci	r0,r3			/* Invalidate the i-cache before use */
-
-	/* Load the kernel PID.
-	*/
-	li	r0,0
-	mtspr	SPRN_PID,r0
-	sync
-
-	/* Configure and load one entry into TLB slots 63 */
-	clrrwi	r4,r4,10		/* Mask off the real page number */
-	ori	r4,r4,(TLB_WR | TLB_EX)	/* Set the write and execute bits */
-
-	clrrwi	r3,r3,10		/* Mask off the effective page number */
-	ori	r3,r3,(TLB_VALID | TLB_PAGESZ(PAGESZ_16M))
-
-        li      r0,63                    /* TLB slot 63 */
-
-	tlbwe	r4,r0,TLB_DATA		/* Load the data portion of the entry */
-	tlbwe	r3,r0,TLB_TAG		/* Load the tag portion of the entry */
-
-	isync
-
-	/* Establish the exception vector base
-	*/
-	lis	r4,KERNELBASE@h		/* EVPR only uses the high 16-bits */
-	tophys(r0,r4)			/* Use the physical address */
-	mtspr	SPRN_EVPR,r0
-
-	blr
-
-_GLOBAL(abort)
-        mfspr   r13,SPRN_DBCR0
-        oris    r13,r13,DBCR0_RST_SYSTEM@h
-        mtspr   SPRN_DBCR0,r13
-
-_GLOBAL(set_context)
-
-#ifdef CONFIG_BDI_SWITCH
-	/* Context switch the PTE pointer for the Abatron BDI2000.
-	 * The PGDIR is the second parameter.
-	 */
-	lis	r5, abatron_pteptrs@ha
-	stw	r4, abatron_pteptrs@l + 0x4(r5)
-#endif
-	sync
-	mtspr	SPRN_PID,r3
-	isync				/* Need an isync to flush shadow */
-					/* TLBs after changing PID */
-	blr
-
-/* We put a few things here that have to be page-aligned. This stuff
- * goes at the beginning of the data segment, which is page-aligned.
- */
-	.data
-	.align	12
-	.globl	sdata
-sdata:
-	.globl	empty_zero_page
-empty_zero_page:
-	.space	4096
-EXPORT_SYMBOL(empty_zero_page)
-	.globl	swapper_pg_dir
-swapper_pg_dir:
-	.space	PGD_TABLE_SIZE
-
-/* Room for two PTE pointers, usually the kernel and current user pointers
- * to their respective root page table.
- */
-abatron_pteptrs:
-	.space	8
diff --git a/arch/powerpc/kernel/irq.c b/arch/powerpc/kernel/irq.c
index 1bed18b7229e..6ed7886b0781 100644
--- a/arch/powerpc/kernel/irq.c
+++ b/arch/powerpc/kernel/irq.c
@@ -693,7 +693,7 @@ void __init init_IRQ(void)
 		ppc_md.init_IRQ();
 }
 
-#if defined(CONFIG_BOOKE) || defined(CONFIG_40x)
+#ifdef CONFIG_BOOKE
 void   *critirq_ctx[NR_CPUS] __read_mostly;
 void    *dbgirq_ctx[NR_CPUS] __read_mostly;
 void *mcheckirq_ctx[NR_CPUS] __read_mostly;
diff --git a/arch/powerpc/kernel/kgdb.c b/arch/powerpc/kernel/kgdb.c
index 7dd55eb1259d..50a3de7117b7 100644
--- a/arch/powerpc/kernel/kgdb.c
+++ b/arch/powerpc/kernel/kgdb.c
@@ -47,7 +47,7 @@ static struct hard_trap_info
 	{ 0x0800, 0x08 /* SIGFPE */  },		/* fp unavailable */
 	{ 0x0900, 0x0e /* SIGALRM */ },		/* decrementer */
 	{ 0x0c00, 0x14 /* SIGCHLD */ },		/* system call */
-#if defined(CONFIG_40x) || defined(CONFIG_BOOKE)
+#ifdef CONFIG_BOOKE
 	{ 0x2002, 0x05 /* SIGTRAP */ },		/* debug */
 #if defined(CONFIG_FSL_BOOKE)
 	{ 0x2010, 0x08 /* SIGFPE */  },		/* spe unavailable */
@@ -66,7 +66,7 @@ static struct hard_trap_info
 	{ 0x2010, 0x08 /* SIGFPE */  },		/* fp unavailable */
 	{ 0x2020, 0x08 /* SIGFPE */  },		/* ap unavailable */
 #endif
-#else /* ! (defined(CONFIG_40x) || defined(CONFIG_BOOKE)) */
+#else /* !CONFIG_BOOKE */
 	{ 0x0d00, 0x05 /* SIGTRAP */ },		/* single-step */
 #if defined(CONFIG_PPC_8xx)
 	{ 0x1000, 0x04 /* SIGILL */  },		/* software emulation */
diff --git a/arch/powerpc/kernel/misc_32.S b/arch/powerpc/kernel/misc_32.S
index d80212be8698..db5ab092b36b 100644
--- a/arch/powerpc/kernel/misc_32.S
+++ b/arch/powerpc/kernel/misc_32.S
@@ -228,45 +228,6 @@ _GLOBAL(_nmask_and_or_msr)
 	isync
 	blr			/* Done */
 
-#ifdef CONFIG_40x
-
-/*
- * Do an IO access in real mode
- */
-_GLOBAL(real_readb)
-	mfmsr	r7
-	rlwinm	r0,r7,0,~MSR_DR
-	sync
-	mtmsr	r0
-	sync
-	isync
-	lbz	r3,0(r3)
-	sync
-	mtmsr	r7
-	sync
-	isync
-	blr
-
-	/*
- * Do an IO access in real mode
- */
-_GLOBAL(real_writeb)
-	mfmsr	r7
-	rlwinm	r0,r7,0,~MSR_DR
-	sync
-	mtmsr	r0
-	sync
-	isync
-	stb	r3,0(r4)
-	sync
-	mtmsr	r7
-	sync
-	isync
-	blr
-
-#endif /* CONFIG_40x */
-
-
 /*
  * Flush instruction cache.
  * This is a no-op on the 601.
@@ -274,17 +235,8 @@ _GLOBAL(real_writeb)
 #ifndef CONFIG_PPC_8xx
 _GLOBAL(flush_instruction_cache)
 #if defined(CONFIG_4xx)
-#ifdef CONFIG_403GCX
-	li      r3, 512
-	mtctr   r3
-	lis     r4, KERNELBASE@h
-1:	iccci   0, r4
-	addi    r4, r4, 16
-	bdnz    1b
-#else
 	lis	r3, KERNELBASE@h
 	iccci	0,r3
-#endif
 #elif defined(CONFIG_FSL_BOOKE)
 #ifdef CONFIG_E200
 	mfspr   r3,SPRN_L1CSR0
diff --git a/arch/powerpc/kernel/setup.h b/arch/powerpc/kernel/setup.h
index 2ec835574cc9..0054c93b795f 100644
--- a/arch/powerpc/kernel/setup.h
+++ b/arch/powerpc/kernel/setup.h
@@ -35,7 +35,7 @@ void setup_tlb_core_data(void);
 static inline void setup_tlb_core_data(void) { };
 #endif
 
-#if defined(CONFIG_PPC_BOOK3E) || defined(CONFIG_BOOKE) || defined(CONFIG_40x)
+#if defined(CONFIG_PPC_BOOK3E) || defined(CONFIG_BOOKE)
 void exc_lvl_early_init(void);
 #else
 static inline void exc_lvl_early_init(void) { };
diff --git a/arch/powerpc/kernel/setup_32.c b/arch/powerpc/kernel/setup_32.c
index 5b49b26eb154..65f0a6ccecf1 100644
--- a/arch/powerpc/kernel/setup_32.c
+++ b/arch/powerpc/kernel/setup_32.c
@@ -176,7 +176,7 @@ void __init emergency_stack_init(void)
 }
 #endif
 
-#if defined(CONFIG_BOOKE) || defined(CONFIG_40x)
+#ifdef CONFIG_BOOKE
 void __init exc_lvl_early_init(void)
 {
 	unsigned int i, hw_cpu;
diff --git a/arch/powerpc/kernel/time.c b/arch/powerpc/kernel/time.c
index 1168e8b37e30..729db38398c9 100644
--- a/arch/powerpc/kernel/time.c
+++ b/arch/powerpc/kernel/time.c
@@ -782,7 +782,7 @@ static int __init get_freq(char *name, int cells, unsigned long *val)
 
 static void start_cpu_decrementer(void)
 {
-#if defined(CONFIG_BOOKE) || defined(CONFIG_40x)
+#ifdef CONFIG_BOOKE
 	unsigned int tcr;
 
 	/* Clear any pending timer interrupts */
diff --git a/arch/powerpc/kernel/traps.c b/arch/powerpc/kernel/traps.c
index 3fca22276bb1..fe0a0af19017 100644
--- a/arch/powerpc/kernel/traps.c
+++ b/arch/powerpc/kernel/traps.c
@@ -2195,7 +2195,7 @@ void unrecoverable_exception(struct pt_regs *regs)
 }
 NOKPROBE_SYMBOL(unrecoverable_exception);
 
-#if defined(CONFIG_BOOKE_WDT) || defined(CONFIG_40x)
+#ifdef CONFIG_BOOKE_WDT
 /*
  * Default handler for a Watchdog exception,
  * spins until a reboot occurs
diff --git a/arch/powerpc/kernel/udbg.c b/arch/powerpc/kernel/udbg.c
index 01595e8cafe7..d7be60d86e6d 100644
--- a/arch/powerpc/kernel/udbg.c
+++ b/arch/powerpc/kernel/udbg.c
@@ -49,9 +49,6 @@ void __init udbg_early_init(void)
 #elif defined(CONFIG_PPC_EARLY_DEBUG_44x)
 	/* PPC44x debug */
 	udbg_init_44x_as1();
-#elif defined(CONFIG_PPC_EARLY_DEBUG_40x)
-	/* PPC40x debug */
-	udbg_init_40x_realmode();
 #elif defined(CONFIG_PPC_EARLY_DEBUG_CPM)
 	udbg_init_cpm();
 #elif defined(CONFIG_PPC_EARLY_DEBUG_USBGECKO)
diff --git a/arch/powerpc/kernel/udbg_16550.c b/arch/powerpc/kernel/udbg_16550.c
index 9356b60d6030..748b7022713a 100644
--- a/arch/powerpc/kernel/udbg_16550.c
+++ b/arch/powerpc/kernel/udbg_16550.c
@@ -273,26 +273,3 @@ void __init udbg_init_44x_as1(void)
 }
 
 #endif /* CONFIG_PPC_EARLY_DEBUG_44x */
-
-#ifdef CONFIG_PPC_EARLY_DEBUG_40x
-
-static u8 udbg_uart_in_40x(unsigned int reg)
-{
-	return real_readb((void __iomem *)CONFIG_PPC_EARLY_DEBUG_40x_PHYSADDR
-			  + reg);
-}
-
-static void udbg_uart_out_40x(unsigned int reg, u8 val)
-{
-	real_writeb(val, (void __iomem *)CONFIG_PPC_EARLY_DEBUG_40x_PHYSADDR
-		    + reg);
-}
-
-void __init udbg_init_40x_realmode(void)
-{
-	udbg_uart_in = udbg_uart_in_40x;
-	udbg_uart_out = udbg_uart_out_40x;
-	udbg_use_uart();
-}
-
-#endif /* CONFIG_PPC_EARLY_DEBUG_40x */
diff --git a/arch/powerpc/mm/mmu_decl.h b/arch/powerpc/mm/mmu_decl.h
index 7097e07a209a..ac587c5c3109 100644
--- a/arch/powerpc/mm/mmu_decl.h
+++ b/arch/powerpc/mm/mmu_decl.h
@@ -20,9 +20,9 @@
 #include <asm/trace.h>
 
 /*
- * On 40x and 8xx, we directly inline tlbia and tlbivax
+ * On 8xx, we directly inline tlbia
  */
-#if defined(CONFIG_40x) || defined(CONFIG_PPC_8xx)
+#ifdef CONFIG_PPC_8xx
 static inline void _tlbil_all(void)
 {
 	asm volatile ("sync; tlbia; isync" : : : "memory");
@@ -35,7 +35,7 @@ static inline void _tlbil_pid(unsigned int pid)
 }
 #define _tlbil_pid_noind(pid)	_tlbil_pid(pid)
 
-#else /* CONFIG_40x || CONFIG_PPC_8xx */
+#else /* CONFIG_PPC_8xx */
 extern void _tlbil_all(void);
 extern void _tlbil_pid(unsigned int pid);
 #ifdef CONFIG_PPC_BOOK3E
@@ -43,7 +43,7 @@ extern void _tlbil_pid_noind(unsigned int pid);
 #else
 #define _tlbil_pid_noind(pid)	_tlbil_pid(pid)
 #endif
-#endif /* !(CONFIG_40x || CONFIG_PPC_8xx) */
+#endif /* !CONFIG_PPC_8xx */
 
 /*
  * On 8xx, we directly inline tlbie, on others, it's extern
diff --git a/arch/powerpc/mm/nohash/40x.c b/arch/powerpc/mm/nohash/40x.c
deleted file mode 100644
index 82862723ab42..000000000000
--- a/arch/powerpc/mm/nohash/40x.c
+++ /dev/null
@@ -1,154 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-or-later
-/*
- * This file contains the routines for initializing the MMU
- * on the 4xx series of chips.
- *  -- paulus
- *
- *  Derived from arch/ppc/mm/init.c:
- *    Copyright (C) 1995-1996 Gary Thomas (gdt@linuxppc.org)
- *
- *  Modifications by Paul Mackerras (PowerMac) (paulus@cs.anu.edu.au)
- *  and Cort Dougan (PReP) (cort@cs.nmt.edu)
- *    Copyright (C) 1996 Paul Mackerras
- *
- *  Derived from "arch/i386/mm/init.c"
- *    Copyright (C) 1991, 1992, 1993, 1994  Linus Torvalds
- */
-
-#include <linux/signal.h>
-#include <linux/sched.h>
-#include <linux/kernel.h>
-#include <linux/errno.h>
-#include <linux/string.h>
-#include <linux/types.h>
-#include <linux/ptrace.h>
-#include <linux/mman.h>
-#include <linux/mm.h>
-#include <linux/swap.h>
-#include <linux/stddef.h>
-#include <linux/vmalloc.h>
-#include <linux/init.h>
-#include <linux/delay.h>
-#include <linux/highmem.h>
-#include <linux/memblock.h>
-
-#include <asm/pgalloc.h>
-#include <asm/prom.h>
-#include <asm/io.h>
-#include <asm/mmu_context.h>
-#include <asm/pgtable.h>
-#include <asm/mmu.h>
-#include <linux/uaccess.h>
-#include <asm/smp.h>
-#include <asm/bootx.h>
-#include <asm/machdep.h>
-#include <asm/setup.h>
-
-#include <mm/mmu_decl.h>
-
-extern int __map_without_ltlbs;
-/*
- * MMU_init_hw does the chip-specific initialization of the MMU hardware.
- */
-void __init MMU_init_hw(void)
-{
-	/*
-	 * The Zone Protection Register (ZPR) defines how protection will
-	 * be applied to every page which is a member of a given zone. At
-	 * present, we utilize only two of the 4xx's zones.
-	 * The zone index bits (of ZSEL) in the PTE are used for software
-	 * indicators, except the LSB.  For user access, zone 1 is used,
-	 * for kernel access, zone 0 is used.  We set all but zone 1
-	 * to zero, allowing only kernel access as indicated in the PTE.
-	 * For zone 1, we set a 01 binary (a value of 10 will not work)
-	 * to allow user access as indicated in the PTE.  This also allows
-	 * kernel access as indicated in the PTE.
-	 */
-
-        mtspr(SPRN_ZPR, 0x10000000);
-
-	flush_instruction_cache();
-
-	/*
-	 * Set up the real-mode cache parameters for the exception vector
-	 * handlers (which are run in real-mode).
-	 */
-
-        mtspr(SPRN_DCWR, 0x00000000);	/* All caching is write-back */
-
-        /*
-	 * Cache instruction and data space where the exception
-	 * vectors and the kernel live in real-mode.
-	 */
-
-        mtspr(SPRN_DCCR, 0xFFFF0000);	/* 2GByte of data space at 0x0. */
-        mtspr(SPRN_ICCR, 0xFFFF0000);	/* 2GByte of instr. space at 0x0. */
-}
-
-#define LARGE_PAGE_SIZE_16M	(1<<24)
-#define LARGE_PAGE_SIZE_4M	(1<<22)
-
-unsigned long __init mmu_mapin_ram(unsigned long base, unsigned long top)
-{
-	unsigned long v, s, mapped;
-	phys_addr_t p;
-
-	v = KERNELBASE;
-	p = 0;
-	s = total_lowmem;
-
-	if (__map_without_ltlbs)
-		return 0;
-
-	while (s >= LARGE_PAGE_SIZE_16M) {
-		pmd_t *pmdp;
-		unsigned long val = p | _PMD_SIZE_16M | _PAGE_EXEC | _PAGE_HWWRITE;
-
-		pmdp = pmd_ptr_k(v);
-		*pmdp++ = __pmd(val);
-		*pmdp++ = __pmd(val);
-		*pmdp++ = __pmd(val);
-		*pmdp++ = __pmd(val);
-
-		v += LARGE_PAGE_SIZE_16M;
-		p += LARGE_PAGE_SIZE_16M;
-		s -= LARGE_PAGE_SIZE_16M;
-	}
-
-	while (s >= LARGE_PAGE_SIZE_4M) {
-		pmd_t *pmdp;
-		unsigned long val = p | _PMD_SIZE_4M | _PAGE_EXEC | _PAGE_HWWRITE;
-
-		pmdp = pmd_ptr_k(v);
-		*pmdp = __pmd(val);
-
-		v += LARGE_PAGE_SIZE_4M;
-		p += LARGE_PAGE_SIZE_4M;
-		s -= LARGE_PAGE_SIZE_4M;
-	}
-
-	mapped = total_lowmem - s;
-
-	/* If the size of RAM is not an exact power of two, we may not
-	 * have covered RAM in its entirety with 16 and 4 MiB
-	 * pages. Consequently, restrict the top end of RAM currently
-	 * allocable so that calls to the MEMBLOCK to allocate PTEs for "tail"
-	 * coverage with normal-sized pages (or other reasons) do not
-	 * attempt to allocate outside the allowed range.
-	 */
-	memblock_set_current_limit(mapped);
-
-	return mapped;
-}
-
-void setup_initial_memory_limit(phys_addr_t first_memblock_base,
-				phys_addr_t first_memblock_size)
-{
-	/* We don't currently support the first MEMBLOCK not mapping 0
-	 * physical on those processors
-	 */
-	BUG_ON(first_memblock_base != 0);
-
-	/* 40x can only access 16MB at the moment (see head_40x.S) */
-	memblock_set_current_limit(min_t(u64, first_memblock_size, 0x00800000));
-}
diff --git a/arch/powerpc/mm/nohash/Makefile b/arch/powerpc/mm/nohash/Makefile
index 0424f6ce5bd8..eaa6d8938d83 100644
--- a/arch/powerpc/mm/nohash/Makefile
+++ b/arch/powerpc/mm/nohash/Makefile
@@ -4,7 +4,6 @@ ccflags-$(CONFIG_PPC64)	:= $(NO_MINIMAL_TOC)
 
 obj-y				+= mmu_context.o tlb.o tlb_low.o
 obj-$(CONFIG_PPC_BOOK3E_64)  	+= tlb_low_64e.o book3e_pgtable.o
-obj-$(CONFIG_40x)		+= 40x.o
 obj-$(CONFIG_44x)		+= 44x.o
 obj-$(CONFIG_PPC_8xx)		+= 8xx.o
 obj-$(CONFIG_PPC_FSL_BOOK3E)	+= fsl_booke.o
diff --git a/arch/powerpc/mm/nohash/tlb_low.S b/arch/powerpc/mm/nohash/tlb_low.S
index eaeee402f96e..7312cd48640d 100644
--- a/arch/powerpc/mm/nohash/tlb_low.S
+++ b/arch/powerpc/mm/nohash/tlb_low.S
@@ -32,32 +32,7 @@
 #include <asm/asm-compat.h>
 #include <asm/feature-fixups.h>
 
-#if defined(CONFIG_40x)
-
-/*
- * 40x implementation needs only tlbil_va
- */
-_GLOBAL(__tlbil_va)
-	/* We run the search with interrupts disabled because we have to change
-	 * the PID and I don't want to preempt when that happens.
-	 */
-	mfmsr	r5
-	mfspr	r6,SPRN_PID
-	wrteei	0
-	mtspr	SPRN_PID,r4
-	tlbsx.	r3, 0, r3
-	mtspr	SPRN_PID,r6
-	wrtee	r5
-	bne	1f
-	sync
-	/* There are only 64 TLB entries, so r3 < 64, which means bit 25 is
-	 * clear. Since 25 is the V bit in the TLB_TAG, loading this value
-	 * will invalidate the TLB entry. */
-	tlbwe	r3, r3, TLB_TAG
-	isync
-1:	blr
-
-#elif defined(CONFIG_PPC_8xx)
+#if defined(CONFIG_PPC_8xx)
 
 /*
  * Nothing to do for 8xx, everything is inline
diff --git a/arch/powerpc/platforms/44x/Kconfig b/arch/powerpc/platforms/44x/Kconfig
index 25ebe634a661..5163efc362be 100644
--- a/arch/powerpc/platforms/44x/Kconfig
+++ b/arch/powerpc/platforms/44x/Kconfig
@@ -167,8 +167,7 @@ config YOSEMITE
 
 config ISS4xx
 	bool "ISS 4xx Simulator"
-	depends on (44x || 40x)
-	select 405GP if 40x
+	depends on 44x
 	select 440GP if 44x && !PPC_47x
 	select PPC_FPU
 	select OF_RTC
diff --git a/arch/powerpc/platforms/4xx/pci.c b/arch/powerpc/platforms/4xx/pci.c
index e6e2adcc7b64..34233a61314d 100644
--- a/arch/powerpc/platforms/4xx/pci.c
+++ b/arch/powerpc/platforms/4xx/pci.c
@@ -1267,102 +1267,6 @@ static struct ppc4xx_pciex_hwops ppc460sx_pcie_hwops __initdata = {
 
 #endif /* CONFIG_44x */
 
-#ifdef CONFIG_40x
-
-static int __init ppc405ex_pciex_core_init(struct device_node *np)
-{
-	/* Nothing to do, return 2 ports */
-	return 2;
-}
-
-static void ppc405ex_pcie_phy_reset(struct ppc4xx_pciex_port *port)
-{
-	/* Assert the PE0_PHY reset */
-	mtdcri(SDR0, port->sdr_base + PESDRn_RCSSET, 0x01010000);
-	msleep(1);
-
-	/* deassert the PE0_hotreset */
-	if (port->endpoint)
-		mtdcri(SDR0, port->sdr_base + PESDRn_RCSSET, 0x01111000);
-	else
-		mtdcri(SDR0, port->sdr_base + PESDRn_RCSSET, 0x01101000);
-
-	/* poll for phy !reset */
-	/* XXX FIXME add timeout */
-	while (!(mfdcri(SDR0, port->sdr_base + PESDRn_405EX_PHYSTA) & 0x00001000))
-		;
-
-	/* deassert the PE0_gpl_utl_reset */
-	mtdcri(SDR0, port->sdr_base + PESDRn_RCSSET, 0x00101000);
-}
-
-static int __init ppc405ex_pciex_init_port_hw(struct ppc4xx_pciex_port *port)
-{
-	u32 val;
-
-	if (port->endpoint)
-		val = PTYPE_LEGACY_ENDPOINT;
-	else
-		val = PTYPE_ROOT_PORT;
-
-	mtdcri(SDR0, port->sdr_base + PESDRn_DLPSET,
-	       1 << 24 | val << 20 | LNKW_X1 << 12);
-
-	mtdcri(SDR0, port->sdr_base + PESDRn_UTLSET1, 0x00000000);
-	mtdcri(SDR0, port->sdr_base + PESDRn_UTLSET2, 0x01010000);
-	mtdcri(SDR0, port->sdr_base + PESDRn_405EX_PHYSET1, 0x720F0000);
-	mtdcri(SDR0, port->sdr_base + PESDRn_405EX_PHYSET2, 0x70600003);
-
-	/*
-	 * Only reset the PHY when no link is currently established.
-	 * This is for the Atheros PCIe board which has problems to establish
-	 * the link (again) after this PHY reset. All other currently tested
-	 * PCIe boards don't show this problem.
-	 * This has to be re-tested and fixed in a later release!
-	 */
-	val = mfdcri(SDR0, port->sdr_base + PESDRn_LOOP);
-	if (!(val & 0x00001000))
-		ppc405ex_pcie_phy_reset(port);
-
-	dcr_write(port->dcrs, DCRO_PEGPL_CFG, 0x10000000);  /* guarded on */
-
-	port->has_ibpre = 1;
-
-	return ppc4xx_pciex_port_reset_sdr(port);
-}
-
-static int ppc405ex_pciex_init_utl(struct ppc4xx_pciex_port *port)
-{
-	dcr_write(port->dcrs, DCRO_PEGPL_SPECIAL, 0x0);
-
-	/*
-	 * Set buffer allocations and then assert VRB and TXE.
-	 */
-	out_be32(port->utl_base + PEUTL_OUTTR,   0x02000000);
-	out_be32(port->utl_base + PEUTL_INTR,    0x02000000);
-	out_be32(port->utl_base + PEUTL_OPDBSZ,  0x04000000);
-	out_be32(port->utl_base + PEUTL_PBBSZ,   0x21000000);
-	out_be32(port->utl_base + PEUTL_IPHBSZ,  0x02000000);
-	out_be32(port->utl_base + PEUTL_IPDBSZ,  0x04000000);
-	out_be32(port->utl_base + PEUTL_RCIRQEN, 0x00f00000);
-	out_be32(port->utl_base + PEUTL_PCTL,    0x80800066);
-
-	out_be32(port->utl_base + PEUTL_PBCTL,   0x08000000);
-
-	return 0;
-}
-
-static struct ppc4xx_pciex_hwops ppc405ex_pcie_hwops __initdata =
-{
-	.want_sdr	= true,
-	.core_init	= ppc405ex_pciex_core_init,
-	.port_init_hw	= ppc405ex_pciex_init_port_hw,
-	.setup_utl	= ppc405ex_pciex_init_utl,
-	.check_link	= ppc4xx_pciex_check_link_sdr,
-};
-
-#endif /* CONFIG_40x */
-
 #ifdef CONFIG_476FPE
 static int __init ppc_476fpe_pciex_core_init(struct device_node *np)
 {
@@ -1431,10 +1335,6 @@ static int __init ppc4xx_pciex_check_core_init(struct device_node *np)
 	if (of_device_is_compatible(np, "ibm,plb-pciex-apm821xx"))
 		ppc4xx_pciex_hwops = &apm821xx_pcie_hwops;
 #endif /* CONFIG_44x    */
-#ifdef CONFIG_40x
-	if (of_device_is_compatible(np, "ibm,plb-pciex-405ex"))
-		ppc4xx_pciex_hwops = &ppc405ex_pcie_hwops;
-#endif
 #ifdef CONFIG_476FPE
 	if (of_device_is_compatible(np, "ibm,plb-pciex-476fpe")
 		|| of_device_is_compatible(np, "ibm,plb-pciex-476gtr"))
diff --git a/arch/powerpc/platforms/Kconfig.cputype b/arch/powerpc/platforms/Kconfig.cputype
index 0c3c1902135c..1055175cd026 100644
--- a/arch/powerpc/platforms/Kconfig.cputype
+++ b/arch/powerpc/platforms/Kconfig.cputype
@@ -58,13 +58,6 @@ config PPC_8xx
 	select PPC_MM_SLICES if HUGETLB_PAGE
 	select HAVE_ARCH_VMAP_STACK
 
-config 40x
-	bool "AMCC 40x"
-	select PPC_DCR_NATIVE
-	select PPC_UDBG_16550
-	select 4xx_SOC
-	select HAVE_PCI
-
 config 44x
 	bool "AMCC 44x, 46x or 47x"
 	select PPC_DCR_NATIVE
@@ -249,7 +242,7 @@ config FSL_EMB_PERF_EVENT_E500
 
 config 4xx
 	bool
-	depends on 40x || 44x
+	depends on 44x
 	default y
 
 config BOOKE
-- 
2.25.0



