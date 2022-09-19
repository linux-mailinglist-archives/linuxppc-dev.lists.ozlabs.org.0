Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 005945BD332
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Sep 2022 19:05:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MWWKK3QR6z3fpP
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Sep 2022 03:05:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MWWFt42ntz3f1c
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Sep 2022 03:02:58 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4MWWF03LFVz9sl3;
	Mon, 19 Sep 2022 19:02:12 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id s70SnTNnwFAt; Mon, 19 Sep 2022 19:02:12 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4MWWDr5QN7z9sky;
	Mon, 19 Sep 2022 19:02:04 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id A0AAE8B764;
	Mon, 19 Sep 2022 19:02:04 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id l01nvo2-1bmF; Mon, 19 Sep 2022 19:02:04 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.232.8])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 670738B77C;
	Mon, 19 Sep 2022 19:02:04 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 28JH1v5v1549604
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 19 Sep 2022 19:01:58 +0200
Received: (from chleroy@localhost)
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 28JH1vaG1549603;
	Mon, 19 Sep 2022 19:01:57 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>
Subject: [PATCH v2 07/19] powerpc: Remove CONFIG_FSL_BOOKE
Date: Mon, 19 Sep 2022 19:01:31 +0200
Message-Id: <08e3e15594e66d63b9e89c5b4f9c35153913c28f.1663606875.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <828f6a64eeb51ce9abfa1d4e84c521a02fecebb8.1663606875.git.christophe.leroy@csgroup.eu>
References: <828f6a64eeb51ce9abfa1d4e84c521a02fecebb8.1663606875.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1663606899; l=21657; s=20211009; h=from:subject:message-id; bh=Ntn4v8wtrfW+OhnGhuH77o+tJkTUcDhizVIadOp5NjQ=; b=kIRF1pm0p3cE2o3w0wQVIojvORBpZWinmNbm4/G0gsjDkoI1Jq+jO0SahpEk9n3D4ag5YL/tq9l0 J72j9mkFC1En66+1Q7SGNoMTJcznOzIys9tmaT6NJ6o1QGGIc8Qa
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519; pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

PPC_85xx is PPC32 only.
PPC_85xx always selects E500 and is the only PPC32 that
selects E500.
FSL_BOOKE is selected when E500 and PPC32 are selected.

So FSL_BOOKE is redundant with PPC_85xx.

Remove FSL_BOOKE.

And rename four files accordingly.

cpu_setup_fsl_booke.S is not renamed because it is linked to
PPC_FSL_BOOK3E and not to FSL_BOOKE as suggested by its name.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/Kconfig                          | 28 +++++++++----------
 arch/powerpc/Makefile                         |  2 +-
 arch/powerpc/include/asm/kexec.h              |  2 +-
 arch/powerpc/include/asm/nohash/32/pgtable.h  |  6 ++--
 .../nohash/32/{pte-fsl-booke.h => pte-85xx.h} |  6 ++--
 arch/powerpc/include/asm/nohash/tlbflush.h    |  2 +-
 ...e_entry_mapping.S => 85xx_entry_mapping.S} |  0
 arch/powerpc/kernel/Makefile                  |  6 ++--
 .../kernel/{head_fsl_booke.S => head_85xx.S}  |  4 +--
 arch/powerpc/kernel/kgdb.c                    | 12 ++++----
 .../kernel/{swsusp_booke.S => swsusp_85xx.S}  |  0
 arch/powerpc/kernel/traps.c                   |  4 +--
 arch/powerpc/kexec/core_32.c                  |  2 +-
 arch/powerpc/kexec/relocate_32.S              |  4 +--
 arch/powerpc/kvm/booke_interrupts.S           |  4 +--
 arch/powerpc/mm/init_32.c                     |  4 +--
 arch/powerpc/mm/mmu_decl.h                    |  4 +--
 arch/powerpc/mm/nohash/fsl_book3e.c           |  2 +-
 arch/powerpc/mm/nohash/tlb.c                  |  2 +-
 arch/powerpc/mm/nohash/tlb_low.S              |  2 +-
 arch/powerpc/platforms/Kconfig.cputype        | 11 ++------
 21 files changed, 51 insertions(+), 56 deletions(-)
 rename arch/powerpc/include/asm/nohash/32/{pte-fsl-booke.h => pte-85xx.h} (94%)
 rename arch/powerpc/kernel/{fsl_booke_entry_mapping.S => 85xx_entry_mapping.S} (100%)
 rename arch/powerpc/kernel/{head_fsl_booke.S => head_85xx.S} (99%)
 rename arch/powerpc/kernel/{swsusp_booke.S => swsusp_85xx.S} (100%)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index cbe7bb029aec..7fe522b0946b 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -135,7 +135,7 @@ config PPC
 	select ARCH_HAS_SCALED_CPUTIME		if VIRT_CPU_ACCOUNTING_NATIVE && PPC_BOOK3S_64
 	select ARCH_HAS_SET_MEMORY
 	select ARCH_HAS_STRICT_KERNEL_RWX	if (PPC_BOOK3S || PPC_8xx || 40x) && !HIBERNATION
-	select ARCH_HAS_STRICT_KERNEL_RWX	if FSL_BOOKE && !HIBERNATION && !RANDOMIZE_BASE
+	select ARCH_HAS_STRICT_KERNEL_RWX	if PPC_85xx && !HIBERNATION && !RANDOMIZE_BASE
 	select ARCH_HAS_STRICT_MODULE_RWX	if ARCH_HAS_STRICT_KERNEL_RWX
 	select ARCH_HAS_TICK_BROADCAST		if GENERIC_CLOCKEVENTS_BROADCAST
 	select ARCH_HAS_UACCESS_FLUSHCACHE
@@ -548,7 +548,7 @@ config PPC64_SUPPORTS_MEMORY_FAILURE
 
 config KEXEC
 	bool "kexec system call"
-	depends on (PPC_BOOK3S || FSL_BOOKE || (44x && !SMP)) || PPC_BOOK3E
+	depends on (PPC_BOOK3S || PPC_85xx || (44x && !SMP)) || PPC_BOOK3E
 	select KEXEC_CORE
 	help
 	  kexec is a system call that implements the ability to shutdown your
@@ -583,7 +583,7 @@ config ARCH_HAS_KEXEC_PURGATORY
 
 config RELOCATABLE
 	bool "Build a relocatable kernel"
-	depends on PPC64 || (FLATMEM && (44x || FSL_BOOKE))
+	depends on PPC64 || (FLATMEM && (44x || PPC_85xx))
 	select NONSTATIC_KERNEL
 	help
 	  This builds a kernel image that is capable of running at the
@@ -606,7 +606,7 @@ config RELOCATABLE
 
 config RANDOMIZE_BASE
 	bool "Randomize the address of the kernel image"
-	depends on (FSL_BOOKE && FLATMEM && PPC32)
+	depends on (PPC_85xx && FLATMEM && PPC32)
 	depends on RELOCATABLE
 	help
 	  Randomizes the virtual address at which the kernel image is
@@ -625,8 +625,8 @@ config RELOCATABLE_TEST
 
 config CRASH_DUMP
 	bool "Build a dump capture kernel"
-	depends on PPC64 || PPC_BOOK3S_32 || FSL_BOOKE || (44x && !SMP)
-	select RELOCATABLE if PPC64 || 44x || FSL_BOOKE
+	depends on PPC64 || PPC_BOOK3S_32 || PPC_85xx || (44x && !SMP)
+	select RELOCATABLE if PPC64 || 44x || PPC_85xx
 	help
 	  Build a kernel suitable for use as a dump capture kernel.
 	  The same kernel binary can be used as production kernel and dump
@@ -815,7 +815,7 @@ config DATA_SHIFT_BOOL
 	depends on ADVANCED_OPTIONS
 	depends on STRICT_KERNEL_RWX || DEBUG_PAGEALLOC || KFENCE
 	depends on PPC_BOOK3S_32 || (PPC_8xx && !PIN_TLB_DATA && !STRICT_KERNEL_RWX) || \
-		   FSL_BOOKE
+		   PPC_85xx
 	help
 	  This option allows you to set the kernel data alignment. When
 	  RAM is mapped by blocks, the alignment needs to fit the size and
@@ -828,13 +828,13 @@ config DATA_SHIFT
 	default 24 if STRICT_KERNEL_RWX && PPC64
 	range 17 28 if (STRICT_KERNEL_RWX || DEBUG_PAGEALLOC || KFENCE) && PPC_BOOK3S_32
 	range 19 23 if (STRICT_KERNEL_RWX || DEBUG_PAGEALLOC || KFENCE) && PPC_8xx
-	range 20 24 if (STRICT_KERNEL_RWX || DEBUG_PAGEALLOC || KFENCE) && FSL_BOOKE
+	range 20 24 if (STRICT_KERNEL_RWX || DEBUG_PAGEALLOC || KFENCE) && PPC_85xx
 	default 22 if STRICT_KERNEL_RWX && PPC_BOOK3S_32
 	default 18 if (DEBUG_PAGEALLOC || KFENCE) && PPC_BOOK3S_32
 	default 23 if STRICT_KERNEL_RWX && PPC_8xx
 	default 23 if (DEBUG_PAGEALLOC || KFENCE) && PPC_8xx && PIN_TLB_DATA
 	default 19 if (DEBUG_PAGEALLOC || KFENCE) && PPC_8xx
-	default 24 if STRICT_KERNEL_RWX && FSL_BOOKE
+	default 24 if STRICT_KERNEL_RWX && PPC_85xx
 	default PPC_PAGE_SHIFT
 	help
 	  On Book3S 32 (603+), DBATs are used to map kernel text and rodata RO.
@@ -1150,7 +1150,7 @@ config LOWMEM_SIZE
 
 config LOWMEM_CAM_NUM_BOOL
 	bool "Set number of CAMs to use to map low memory"
-	depends on ADVANCED_OPTIONS && FSL_BOOKE
+	depends on ADVANCED_OPTIONS && PPC_85xx
 	help
 	  This option allows you to set the maximum number of CAM slots that
 	  will be used to map low memory.  There are a limited number of slots
@@ -1161,7 +1161,7 @@ config LOWMEM_CAM_NUM_BOOL
 	  Say N here unless you know what you are doing.
 
 config LOWMEM_CAM_NUM
-	depends on FSL_BOOKE
+	depends on PPC_85xx
 	int "Number of CAMs to use to map low memory" if LOWMEM_CAM_NUM_BOOL
 	default 3 if !STRICT_KERNEL_RWX
 	default 9 if DATA_SHIFT >= 24
@@ -1170,7 +1170,7 @@ config LOWMEM_CAM_NUM
 
 config DYNAMIC_MEMSTART
 	bool "Enable page aligned dynamic load address for kernel"
-	depends on ADVANCED_OPTIONS && FLATMEM && (FSL_BOOKE || 44x)
+	depends on ADVANCED_OPTIONS && FLATMEM && (PPC_85xx || 44x)
 	select NONSTATIC_KERNEL
 	help
 	  This option enables the kernel to be loaded at any page aligned
@@ -1219,7 +1219,7 @@ config KERNEL_START
 
 config PHYSICAL_START_BOOL
 	bool "Set physical address where the kernel is loaded"
-	depends on ADVANCED_OPTIONS && FLATMEM && FSL_BOOKE
+	depends on ADVANCED_OPTIONS && FLATMEM && PPC_85xx
 	help
 	  This gives the physical address where the kernel is loaded.
 
@@ -1232,7 +1232,7 @@ config PHYSICAL_START
 
 config PHYSICAL_ALIGN
 	hex
-	default "0x04000000" if FSL_BOOKE
+	default "0x04000000" if PPC_85xx
 	help
 	  This value puts the alignment restrictions on physical address
 	  where kernel is loaded and run from. Kernel is compiled for an
diff --git a/arch/powerpc/Makefile b/arch/powerpc/Makefile
index 02742facf895..f6d477c4aa64 100644
--- a/arch/powerpc/Makefile
+++ b/arch/powerpc/Makefile
@@ -231,7 +231,7 @@ head-$(CONFIG_PPC_BOOK3S_32)	:= arch/powerpc/kernel/head_book3s_32.o
 head-$(CONFIG_PPC_8xx)		:= arch/powerpc/kernel/head_8xx.o
 head-$(CONFIG_40x)		:= arch/powerpc/kernel/head_40x.o
 head-$(CONFIG_44x)		:= arch/powerpc/kernel/head_44x.o
-head-$(CONFIG_FSL_BOOKE)	:= arch/powerpc/kernel/head_fsl_booke.o
+head-$(CONFIG_PPC_85xx)	:= arch/powerpc/kernel/head_85xx.o
 
 head-$(CONFIG_PPC64)		+= arch/powerpc/kernel/entry_64.o
 head-$(CONFIG_PPC_FPU)		+= arch/powerpc/kernel/fpu.o
diff --git a/arch/powerpc/include/asm/kexec.h b/arch/powerpc/include/asm/kexec.h
index f8d122d16af4..a1ddba01e7d1 100644
--- a/arch/powerpc/include/asm/kexec.h
+++ b/arch/powerpc/include/asm/kexec.h
@@ -3,7 +3,7 @@
 #define _ASM_POWERPC_KEXEC_H
 #ifdef __KERNEL__
 
-#if defined(CONFIG_FSL_BOOKE) || defined(CONFIG_44x)
+#if defined(CONFIG_PPC_85xx) || defined(CONFIG_44x)
 
 /*
  * On FSL-BookE we setup a 1:1 mapping which covers the first 2GiB of memory
diff --git a/arch/powerpc/include/asm/nohash/32/pgtable.h b/arch/powerpc/include/asm/nohash/32/pgtable.h
index 9091e4904a6b..197e7552d9f6 100644
--- a/arch/powerpc/include/asm/nohash/32/pgtable.h
+++ b/arch/powerpc/include/asm/nohash/32/pgtable.h
@@ -130,10 +130,10 @@ void unmap_kernel_page(unsigned long va);
 #include <asm/nohash/32/pte-40x.h>
 #elif defined(CONFIG_44x)
 #include <asm/nohash/32/pte-44x.h>
-#elif defined(CONFIG_FSL_BOOKE) && defined(CONFIG_PTE_64BIT)
+#elif defined(CONFIG_PPC_85xx) && defined(CONFIG_PTE_64BIT)
 #include <asm/nohash/pte-book3e.h>
-#elif defined(CONFIG_FSL_BOOKE)
-#include <asm/nohash/32/pte-fsl-booke.h>
+#elif defined(CONFIG_PPC_85xx)
+#include <asm/nohash/32/pte-85xx.h>
 #elif defined(CONFIG_PPC_8xx)
 #include <asm/nohash/32/pte-8xx.h>
 #endif
diff --git a/arch/powerpc/include/asm/nohash/32/pte-fsl-booke.h b/arch/powerpc/include/asm/nohash/32/pte-85xx.h
similarity index 94%
rename from arch/powerpc/include/asm/nohash/32/pte-fsl-booke.h
rename to arch/powerpc/include/asm/nohash/32/pte-85xx.h
index 0fc1bd42bb3e..93fb8e11a3f1 100644
--- a/arch/powerpc/include/asm/nohash/32/pte-fsl-booke.h
+++ b/arch/powerpc/include/asm/nohash/32/pte-85xx.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0 */
-#ifndef _ASM_POWERPC_NOHASH_32_PTE_FSL_BOOKE_H
-#define _ASM_POWERPC_NOHASH_32_PTE_FSL_BOOKE_H
+#ifndef _ASM_POWERPC_NOHASH_32_PTE_85xx_H
+#define _ASM_POWERPC_NOHASH_32_PTE_85xx_H
 #ifdef __KERNEL__
 
 /* PTE bit definitions for Freescale BookE SW loaded TLB MMU based
@@ -71,4 +71,4 @@
 #define PAGE_READONLY_X	__pgprot(_PAGE_BASE | _PAGE_USER | _PAGE_EXEC)
 
 #endif /* __KERNEL__ */
-#endif /*  _ASM_POWERPC_NOHASH_32_PTE_FSL_BOOKE_H */
+#endif /*  _ASM_POWERPC_NOHASH_32_PTE_FSL_85xx_H */
diff --git a/arch/powerpc/include/asm/nohash/tlbflush.h b/arch/powerpc/include/asm/nohash/tlbflush.h
index 698935d4f72d..bdaf34ad41ea 100644
--- a/arch/powerpc/include/asm/nohash/tlbflush.h
+++ b/arch/powerpc/include/asm/nohash/tlbflush.h
@@ -18,7 +18,7 @@
 /*
  * TLB flushing for software loaded TLB chips
  *
- * TODO: (CONFIG_FSL_BOOKE) determine if flush_tlb_range &
+ * TODO: (CONFIG_PPC_85xx) determine if flush_tlb_range &
  * flush_tlb_kernel_range are best implemented as tlbia vs
  * specific tlbie's
  */
diff --git a/arch/powerpc/kernel/fsl_booke_entry_mapping.S b/arch/powerpc/kernel/85xx_entry_mapping.S
similarity index 100%
rename from arch/powerpc/kernel/fsl_booke_entry_mapping.S
rename to arch/powerpc/kernel/85xx_entry_mapping.S
diff --git a/arch/powerpc/kernel/Makefile b/arch/powerpc/kernel/Makefile
index 06d2d1f78f71..4483cae7dc9f 100644
--- a/arch/powerpc/kernel/Makefile
+++ b/arch/powerpc/kernel/Makefile
@@ -106,8 +106,8 @@ endif
 obj-$(CONFIG_PPC_BOOK3S_32)	+= idle_6xx.o l2cr_6xx.o cpu_setup_6xx.o
 obj-$(CONFIG_TAU)		+= tau_6xx.o
 obj-$(CONFIG_HIBERNATION)	+= swsusp.o suspend.o
-ifdef CONFIG_FSL_BOOKE
-obj-$(CONFIG_HIBERNATION)	+= swsusp_booke.o
+ifdef CONFIG_PPC_85xx
+obj-$(CONFIG_HIBERNATION)	+= swsusp_85xx.o
 else
 obj-$(CONFIG_HIBERNATION)	+= swsusp_$(BITS).o
 endif
@@ -122,7 +122,7 @@ extra-$(CONFIG_PPC64)		:= head_64.o
 extra-$(CONFIG_PPC_BOOK3S_32)	:= head_book3s_32.o
 extra-$(CONFIG_40x)		:= head_40x.o
 extra-$(CONFIG_44x)		:= head_44x.o
-extra-$(CONFIG_FSL_BOOKE)	:= head_fsl_booke.o
+extra-$(CONFIG_PPC_85xx)	:= head_85xx.o
 extra-$(CONFIG_PPC_8xx)		:= head_8xx.o
 extra-y				+= vmlinux.lds
 
diff --git a/arch/powerpc/kernel/head_fsl_booke.S b/arch/powerpc/kernel/head_85xx.S
similarity index 99%
rename from arch/powerpc/kernel/head_fsl_booke.S
rename to arch/powerpc/kernel/head_85xx.S
index f0db4f52bc00..48b168b5dc57 100644
--- a/arch/powerpc/kernel/head_fsl_booke.S
+++ b/arch/powerpc/kernel/head_85xx.S
@@ -129,7 +129,7 @@ _GLOBAL(_start);
 
 	/*
 	 * For the second relocation, we already set the right tlb entries
-	 * for the kernel space, so skip the code in fsl_booke_entry_mapping.S
+	 * for the kernel space, so skip the code in 85xx_entry_mapping.S
 	*/
 	cmpwi	r19,1
 	beq	set_ivor
@@ -159,7 +159,7 @@ _GLOBAL(__early_start)
 	lwz     r20,0(r20)
 
 #define ENTRY_MAPPING_BOOT_SETUP
-#include "fsl_booke_entry_mapping.S"
+#include "85xx_entry_mapping.S"
 #undef ENTRY_MAPPING_BOOT_SETUP
 
 set_ivor:
diff --git a/arch/powerpc/kernel/kgdb.c b/arch/powerpc/kernel/kgdb.c
index a20deebf233f..1a1e9995dae3 100644
--- a/arch/powerpc/kernel/kgdb.c
+++ b/arch/powerpc/kernel/kgdb.c
@@ -47,7 +47,7 @@ static struct hard_trap_info
 	{ 0x0c00, 0x14 /* SIGCHLD */ },		/* system call */
 #ifdef CONFIG_BOOKE_OR_40x
 	{ 0x2002, 0x05 /* SIGTRAP */ },		/* debug */
-#if defined(CONFIG_FSL_BOOKE)
+#if defined(CONFIG_PPC_85xx)
 	{ 0x2010, 0x08 /* SIGFPE */  },		/* spe unavailable */
 	{ 0x2020, 0x08 /* SIGFPE */  },		/* spe unavailable */
 	{ 0x2030, 0x08 /* SIGFPE */  },		/* spe fp data */
@@ -57,7 +57,7 @@ static struct hard_trap_info
 	{ 0x2900, 0x08 /* SIGFPE */  },		/* apu unavailable */
 	{ 0x3100, 0x0e /* SIGALRM */ },		/* fixed interval timer */
 	{ 0x3200, 0x02 /* SIGINT */  }, 	/* watchdog */
-#else /* ! CONFIG_FSL_BOOKE */
+#else /* ! CONFIG_PPC_85xx */
 	{ 0x1000, 0x0e /* SIGALRM */ },		/* prog interval timer */
 	{ 0x1010, 0x0e /* SIGALRM */ },		/* fixed interval timer */
 	{ 0x1020, 0x02 /* SIGINT */  }, 	/* watchdog */
@@ -208,7 +208,7 @@ void sleeping_thread_to_gdb_regs(unsigned long *gdb_regs, struct task_struct *p)
 	for (reg = 14; reg < 32; reg++)
 		PACK64(ptr, regs->gpr[reg]);
 
-#ifdef CONFIG_FSL_BOOKE
+#ifdef CONFIG_PPC_85xx
 #ifdef CONFIG_SPE
 	for (reg = 0; reg < 32; reg++)
 		PACK64(ptr, p->thread.evr[reg]);
@@ -234,7 +234,7 @@ void sleeping_thread_to_gdb_regs(unsigned long *gdb_regs, struct task_struct *p)
 #define GDB_SIZEOF_REG sizeof(unsigned long)
 #define GDB_SIZEOF_REG_U32 sizeof(u32)
 
-#ifdef CONFIG_FSL_BOOKE
+#ifdef CONFIG_PPC_85xx
 #define GDB_SIZEOF_FLOAT_REG sizeof(unsigned long)
 #else
 #define GDB_SIZEOF_FLOAT_REG sizeof(u64)
@@ -329,7 +329,7 @@ char *dbg_get_reg(int regno, void *mem, struct pt_regs *regs)
 
 	if (regno >= 32 && regno < 64) {
 		/* FP registers 32 -> 63 */
-#if defined(CONFIG_FSL_BOOKE) && defined(CONFIG_SPE)
+#if defined(CONFIG_PPC_85xx) && defined(CONFIG_SPE)
 		if (current)
 			memcpy(mem, &current->thread.evr[regno-32],
 					dbg_reg_def[regno].size);
@@ -355,7 +355,7 @@ int dbg_set_reg(int regno, void *mem, struct pt_regs *regs)
 
 	if (regno >= 32 && regno < 64) {
 		/* FP registers 32 -> 63 */
-#if defined(CONFIG_FSL_BOOKE) && defined(CONFIG_SPE)
+#if defined(CONFIG_PPC_85xx) && defined(CONFIG_SPE)
 		memcpy(&current->thread.evr[regno-32], mem,
 				dbg_reg_def[regno].size);
 #else
diff --git a/arch/powerpc/kernel/swsusp_booke.S b/arch/powerpc/kernel/swsusp_85xx.S
similarity index 100%
rename from arch/powerpc/kernel/swsusp_booke.S
rename to arch/powerpc/kernel/swsusp_85xx.S
diff --git a/arch/powerpc/kernel/traps.c b/arch/powerpc/kernel/traps.c
index dcf4046f8565..f181c434289e 100644
--- a/arch/powerpc/kernel/traps.c
+++ b/arch/powerpc/kernel/traps.c
@@ -2085,7 +2085,7 @@ DEFINE_INTERRUPT_HANDLER(altivec_assist_exception)
 }
 #endif /* CONFIG_ALTIVEC */
 
-#ifdef CONFIG_FSL_BOOKE
+#ifdef CONFIG_PPC_85xx
 DEFINE_INTERRUPT_HANDLER(CacheLockingException)
 {
 	unsigned long error_code = regs->dsisr;
@@ -2098,7 +2098,7 @@ DEFINE_INTERRUPT_HANDLER(CacheLockingException)
 		_exception(SIGILL, regs, ILL_PRVOPC, regs->nip);
 	return;
 }
-#endif /* CONFIG_FSL_BOOKE */
+#endif /* CONFIG_PPC_85xx */
 
 #ifdef CONFIG_SPE
 DEFINE_INTERRUPT_HANDLER(SPEFloatingPointException)
diff --git a/arch/powerpc/kexec/core_32.c b/arch/powerpc/kexec/core_32.c
index b50aed48d09d..c95f96850c9e 100644
--- a/arch/powerpc/kexec/core_32.c
+++ b/arch/powerpc/kexec/core_32.c
@@ -55,7 +55,7 @@ void default_machine_kexec(struct kimage *image)
 				reboot_code_buffer + KEXEC_CONTROL_PAGE_SIZE);
 	printk(KERN_INFO "Bye!\n");
 
-	if (!IS_ENABLED(CONFIG_FSL_BOOKE) && !IS_ENABLED(CONFIG_44x))
+	if (!IS_ENABLED(CONFIG_PPC_85xx) && !IS_ENABLED(CONFIG_44x))
 		relocate_new_kernel(page_list, reboot_code_buffer_phys, image->start);
 
 	/* now call it */
diff --git a/arch/powerpc/kexec/relocate_32.S b/arch/powerpc/kexec/relocate_32.S
index cf6e52bdf8d8..d9f0dd9b34ff 100644
--- a/arch/powerpc/kexec/relocate_32.S
+++ b/arch/powerpc/kexec/relocate_32.S
@@ -25,14 +25,14 @@ relocate_new_kernel:
 	/* r4 = reboot_code_buffer */
 	/* r5 = start_address      */
 
-#ifdef CONFIG_FSL_BOOKE
+#ifdef CONFIG_PPC_85xx
 
 	mr	r29, r3
 	mr	r30, r4
 	mr	r31, r5
 
 #define ENTRY_MAPPING_KEXEC_SETUP
-#include <kernel/fsl_booke_entry_mapping.S>
+#include <kernel/85xx_entry_mapping.S>
 #undef ENTRY_MAPPING_KEXEC_SETUP
 
 	mr      r3, r29
diff --git a/arch/powerpc/kvm/booke_interrupts.S b/arch/powerpc/kvm/booke_interrupts.S
index 6fa82efe833b..205545d820a1 100644
--- a/arch/powerpc/kvm/booke_interrupts.S
+++ b/arch/powerpc/kvm/booke_interrupts.S
@@ -223,7 +223,7 @@ _GLOBAL(kvmppc_resume_host)
 	lwz	r3, VCPU_HOST_PID(r4)
 	mtspr	SPRN_PID, r3
 
-#ifdef CONFIG_FSL_BOOKE
+#ifdef CONFIG_PPC_85xx
 	/* we cheat and know that Linux doesn't use PID1 which is always 0 */
 	lis	r3, 0
 	mtspr	SPRN_PID1, r3
@@ -406,7 +406,7 @@ lightweight_exit:
 	lwz	r3, VCPU_SHADOW_PID(r4)
 	mtspr	SPRN_PID, r3
 
-#ifdef CONFIG_FSL_BOOKE
+#ifdef CONFIG_PPC_85xx
 	lwz	r3, VCPU_SHADOW_PID1(r4)
 	mtspr	SPRN_PID1, r3
 #endif
diff --git a/arch/powerpc/mm/init_32.c b/arch/powerpc/mm/init_32.c
index 3142d7617412..d4cc3749e621 100644
--- a/arch/powerpc/mm/init_32.c
+++ b/arch/powerpc/mm/init_32.c
@@ -85,12 +85,12 @@ void __init MMU_init(void)
 	total_lowmem = total_memory = memblock_end_of_DRAM() - memstart_addr;
 	lowmem_end_addr = memstart_addr + total_lowmem;
 
-#ifdef CONFIG_FSL_BOOKE
+#ifdef CONFIG_PPC_85xx
 	/* Freescale Book-E parts expect lowmem to be mapped by fixed TLB
 	 * entries, so we need to adjust lowmem to match the amount we can map
 	 * in the fixed entries */
 	adjust_total_lowmem();
-#endif /* CONFIG_FSL_BOOKE */
+#endif /* CONFIG_PPC_85xx */
 
 	if (total_lowmem > __max_low_memory) {
 		total_lowmem = __max_low_memory;
diff --git a/arch/powerpc/mm/mmu_decl.h b/arch/powerpc/mm/mmu_decl.h
index 0e3528aec49e..88805757d0c9 100644
--- a/arch/powerpc/mm/mmu_decl.h
+++ b/arch/powerpc/mm/mmu_decl.h
@@ -146,9 +146,9 @@ struct tlbcam {
 extern struct tlbcam TLBCAM[NUM_TLBCAMS];
 #endif
 
-#if defined(CONFIG_PPC_BOOK3S_32) || defined(CONFIG_FSL_BOOKE) || defined(CONFIG_PPC_8xx)
+#if defined(CONFIG_PPC_BOOK3S_32) || defined(CONFIG_PPC_85xx) || defined(CONFIG_PPC_8xx)
 /* 6xx have BATS */
-/* FSL_BOOKE have TLBCAM */
+/* PPC_85xx have TLBCAM */
 /* 8xx have LTLB */
 phys_addr_t v_block_mapped(unsigned long va);
 unsigned long p_block_mapped(phys_addr_t pa);
diff --git a/arch/powerpc/mm/nohash/fsl_book3e.c b/arch/powerpc/mm/nohash/fsl_book3e.c
index c1ad173de318..40a4e69ae1a9 100644
--- a/arch/powerpc/mm/nohash/fsl_book3e.c
+++ b/arch/powerpc/mm/nohash/fsl_book3e.c
@@ -59,7 +59,7 @@ static struct {
 	phys_addr_t phys;
 } tlbcam_addrs[NUM_TLBCAMS];
 
-#ifdef CONFIG_FSL_BOOKE
+#ifdef CONFIG_PPC_85xx
 /*
  * Return PA for this VA if it is mapped by a CAM, or 0
  */
diff --git a/arch/powerpc/mm/nohash/tlb.c b/arch/powerpc/mm/nohash/tlb.c
index 5e7ccb48b79c..f21896ebdc5a 100644
--- a/arch/powerpc/mm/nohash/tlb.c
+++ b/arch/powerpc/mm/nohash/tlb.c
@@ -130,7 +130,7 @@ struct mmu_psize_def mmu_psize_defs[MMU_PAGE_COUNT] = {
 		.enc	= BOOK3E_PAGESZ_1GB,
 	},
 };
-#endif /* CONFIG_FSL_BOOKE */
+#endif /* CONFIG_PPC_85xx */
 
 static inline int mmu_get_tsize(int psize)
 {
diff --git a/arch/powerpc/mm/nohash/tlb_low.S b/arch/powerpc/mm/nohash/tlb_low.S
index d62b613a0d5d..d378031246ab 100644
--- a/arch/powerpc/mm/nohash/tlb_low.S
+++ b/arch/powerpc/mm/nohash/tlb_low.S
@@ -221,7 +221,7 @@ END_FTR_SECTION_IFSET(CPU_FTR_476_DD2)
 	blr
 #endif /* CONFIG_PPC_47x */
 
-#elif defined(CONFIG_FSL_BOOKE)
+#elif defined(CONFIG_PPC_85xx)
 /*
  * FSL BookE implementations.
  *
diff --git a/arch/powerpc/platforms/Kconfig.cputype b/arch/powerpc/platforms/Kconfig.cputype
index 19fd95a06352..11780074eb23 100644
--- a/arch/powerpc/platforms/Kconfig.cputype
+++ b/arch/powerpc/platforms/Kconfig.cputype
@@ -324,11 +324,6 @@ config BOOKE_OR_40x
 	depends on BOOKE || 40x
 	default y
 
-config FSL_BOOKE
-	bool
-	depends on E500 && PPC32
-	default y
-
 # this is for common code between PPC32 & PPC64 FSL BOOKE
 config PPC_FSL_BOOK3E
 	bool
@@ -337,7 +332,7 @@ config PPC_FSL_BOOK3E
 	select PPC_SMP_MUXED_IPI
 	select PPC_DOORBELL
 	select PPC_KUEP
-	default y if FSL_BOOKE
+	default y if PPC_85xx
 
 config PTE_64BIT
 	bool
@@ -485,7 +480,7 @@ config PPC_MMU_NOHASH
 
 config PPC_BOOK3E_MMU
 	def_bool y
-	depends on FSL_BOOKE || PPC_BOOK3E
+	depends on PPC_85xx || PPC_BOOK3E
 
 config PPC_HAVE_PMU_SUPPORT
 	bool
@@ -508,7 +503,7 @@ config FORCE_SMP
 	select SMP
 
 config SMP
-	depends on PPC_BOOK3S || PPC_BOOK3E || FSL_BOOKE || PPC_47x
+	depends on PPC_BOOK3S || PPC_BOOK3E || PPC_85xx || PPC_47x
 	select GENERIC_IRQ_MIGRATION
 	bool "Symmetric multi-processing support" if !FORCE_SMP
 	help
-- 
2.37.1

