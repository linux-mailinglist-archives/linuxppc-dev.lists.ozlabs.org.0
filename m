Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DFCCE32D561
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Mar 2021 15:36:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Drthn6b5kz3dSK
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Mar 2021 01:36:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Drtgm6Gbxz30QC
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 Mar 2021 01:35:13 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4Drtgc62BzzB09ZS;
 Thu,  4 Mar 2021 15:35:08 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id DTtRosK72nom; Thu,  4 Mar 2021 15:35:08 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4Drtgc4xSwzB09ZR;
 Thu,  4 Mar 2021 15:35:08 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id BA4FE8B812;
 Thu,  4 Mar 2021 15:35:10 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id ySp8nygo6T9K; Thu,  4 Mar 2021 15:35:10 +0100 (CET)
Received: from po16121vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 46FBF8B80A;
 Thu,  4 Mar 2021 15:35:10 +0100 (CET)
Received: by po16121vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 09FDF674E6; Thu,  4 Mar 2021 14:35:09 +0000 (UTC)
Message-Id: <8dfe1bd2abde26337c1d8c1ad0acfcc82185e0d5.1614868445.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v2 1/4] powerpc: Enable KFENCE for PPC32
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Alexander Potapenko <glider@google.com>, Marco Elver <elver@google.com>,
 Dmitry Vyukov <dvyukov@google.com>
Date: Thu,  4 Mar 2021 14:35:09 +0000 (UTC)
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 kasan-dev@googlegroups.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Add architecture specific implementation details for KFENCE and enable
KFENCE for the ppc32 architecture. In particular, this implements the
required interface in <asm/kfence.h>.

KFENCE requires that attributes for pages from its memory pool can
individually be set. Therefore, force the Read/Write linear map to be
mapped at page granularity.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Acked-by: Marco Elver <elver@google.com>
---
v2: Added debug_pagealloc_enabled_or_kfence()
---
 arch/powerpc/Kconfig              | 13 ++++++------
 arch/powerpc/include/asm/kfence.h | 33 +++++++++++++++++++++++++++++++
 arch/powerpc/mm/book3s32/mmu.c    |  2 +-
 arch/powerpc/mm/fault.c           |  7 ++++++-
 arch/powerpc/mm/init_32.c         |  3 +++
 arch/powerpc/mm/mmu_decl.h        |  5 +++++
 arch/powerpc/mm/nohash/8xx.c      |  4 ++--
 7 files changed, 57 insertions(+), 10 deletions(-)
 create mode 100644 arch/powerpc/include/asm/kfence.h

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 386ae12d8523..d46db0bfb998 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -185,6 +185,7 @@ config PPC
 	select HAVE_ARCH_KASAN			if PPC32 && PPC_PAGE_SHIFT <= 14
 	select HAVE_ARCH_KASAN_VMALLOC		if PPC32 && PPC_PAGE_SHIFT <= 14
 	select HAVE_ARCH_KGDB
+	select HAVE_ARCH_KFENCE			if PPC32
 	select HAVE_ARCH_MMAP_RND_BITS
 	select HAVE_ARCH_MMAP_RND_COMPAT_BITS	if COMPAT
 	select HAVE_ARCH_NVRAM_OPS
@@ -786,7 +787,7 @@ config THREAD_SHIFT
 config DATA_SHIFT_BOOL
 	bool "Set custom data alignment"
 	depends on ADVANCED_OPTIONS
-	depends on STRICT_KERNEL_RWX || DEBUG_PAGEALLOC
+	depends on STRICT_KERNEL_RWX || DEBUG_PAGEALLOC || KFENCE
 	depends on PPC_BOOK3S_32 || (PPC_8xx && !PIN_TLB_DATA && !STRICT_KERNEL_RWX)
 	help
 	  This option allows you to set the kernel data alignment. When
@@ -798,13 +799,13 @@ config DATA_SHIFT_BOOL
 config DATA_SHIFT
 	int "Data shift" if DATA_SHIFT_BOOL
 	default 24 if STRICT_KERNEL_RWX && PPC64
-	range 17 28 if (STRICT_KERNEL_RWX || DEBUG_PAGEALLOC) && PPC_BOOK3S_32
-	range 19 23 if (STRICT_KERNEL_RWX || DEBUG_PAGEALLOC) && PPC_8xx
+	range 17 28 if (STRICT_KERNEL_RWX || DEBUG_PAGEALLOC || KFENCE) && PPC_BOOK3S_32
+	range 19 23 if (STRICT_KERNEL_RWX || DEBUG_PAGEALLOC || KFENCE) && PPC_8xx
 	default 22 if STRICT_KERNEL_RWX && PPC_BOOK3S_32
-	default 18 if DEBUG_PAGEALLOC && PPC_BOOK3S_32
+	default 18 if (DEBUG_PAGEALLOC || KFENCE) && PPC_BOOK3S_32
 	default 23 if STRICT_KERNEL_RWX && PPC_8xx
-	default 23 if DEBUG_PAGEALLOC && PPC_8xx && PIN_TLB_DATA
-	default 19 if DEBUG_PAGEALLOC && PPC_8xx
+	default 23 if (DEBUG_PAGEALLOC || KFENCE) && PPC_8xx && PIN_TLB_DATA
+	default 19 if (DEBUG_PAGEALLOC || KFENCE) && PPC_8xx
 	default PPC_PAGE_SHIFT
 	help
 	  On Book3S 32 (603+), DBATs are used to map kernel text and rodata RO.
diff --git a/arch/powerpc/include/asm/kfence.h b/arch/powerpc/include/asm/kfence.h
new file mode 100644
index 000000000000..a9846b68c6b9
--- /dev/null
+++ b/arch/powerpc/include/asm/kfence.h
@@ -0,0 +1,33 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * powerpc KFENCE support.
+ *
+ * Copyright (C) 2020 CS GROUP France
+ */
+
+#ifndef __ASM_POWERPC_KFENCE_H
+#define __ASM_POWERPC_KFENCE_H
+
+#include <linux/mm.h>
+#include <asm/pgtable.h>
+
+static inline bool arch_kfence_init_pool(void)
+{
+	return true;
+}
+
+static inline bool kfence_protect_page(unsigned long addr, bool protect)
+{
+	pte_t *kpte = virt_to_kpte(addr);
+
+	if (protect) {
+		pte_update(&init_mm, addr, kpte, _PAGE_PRESENT, 0, 0);
+		flush_tlb_kernel_range(addr, addr + PAGE_SIZE);
+	} else {
+		pte_update(&init_mm, addr, kpte, 0, _PAGE_PRESENT, 0);
+	}
+
+	return true;
+}
+
+#endif /* __ASM_POWERPC_KFENCE_H */
diff --git a/arch/powerpc/mm/book3s32/mmu.c b/arch/powerpc/mm/book3s32/mmu.c
index d7eb266a3f7a..a0db398b5c26 100644
--- a/arch/powerpc/mm/book3s32/mmu.c
+++ b/arch/powerpc/mm/book3s32/mmu.c
@@ -162,7 +162,7 @@ unsigned long __init mmu_mapin_ram(unsigned long base, unsigned long top)
 	unsigned long border = (unsigned long)__init_begin - PAGE_OFFSET;
 
 
-	if (debug_pagealloc_enabled() || __map_without_bats) {
+	if (debug_pagealloc_enabled_or_kfence() || __map_without_bats) {
 		pr_debug_once("Read-Write memory mapped without BATs\n");
 		if (base >= border)
 			return base;
diff --git a/arch/powerpc/mm/fault.c b/arch/powerpc/mm/fault.c
index bb368257b55c..bea13682c909 100644
--- a/arch/powerpc/mm/fault.c
+++ b/arch/powerpc/mm/fault.c
@@ -32,6 +32,7 @@
 #include <linux/context_tracking.h>
 #include <linux/hugetlb.h>
 #include <linux/uaccess.h>
+#include <linux/kfence.h>
 
 #include <asm/firmware.h>
 #include <asm/interrupt.h>
@@ -418,8 +419,12 @@ static int ___do_page_fault(struct pt_regs *regs, unsigned long address,
 	 * take a page fault to a kernel address or a page fault to a user
 	 * address outside of dedicated places
 	 */
-	if (unlikely(!is_user && bad_kernel_fault(regs, error_code, address, is_write)))
+	if (unlikely(!is_user && bad_kernel_fault(regs, error_code, address, is_write))) {
+		if (kfence_handle_page_fault(address, is_write, regs))
+			return 0;
+
 		return SIGSEGV;
+	}
 
 	/*
 	 * If we're in an interrupt, have no user context or are running
diff --git a/arch/powerpc/mm/init_32.c b/arch/powerpc/mm/init_32.c
index 02c7db4087cb..3d690be48e84 100644
--- a/arch/powerpc/mm/init_32.c
+++ b/arch/powerpc/mm/init_32.c
@@ -97,6 +97,9 @@ static void __init MMU_setup(void)
 	if (IS_ENABLED(CONFIG_PPC_8xx))
 		return;
 
+	if (IS_ENABLED(CONFIG_KFENCE))
+		__map_without_ltlbs = 1;
+
 	if (debug_pagealloc_enabled())
 		__map_without_ltlbs = 1;
 
diff --git a/arch/powerpc/mm/mmu_decl.h b/arch/powerpc/mm/mmu_decl.h
index 998810e68562..7dac910c0b21 100644
--- a/arch/powerpc/mm/mmu_decl.h
+++ b/arch/powerpc/mm/mmu_decl.h
@@ -185,3 +185,8 @@ void ptdump_check_wx(void);
 #else
 static inline void ptdump_check_wx(void) { }
 #endif
+
+static inline bool debug_pagealloc_enabled_or_kfence(void)
+{
+	return IS_ENABLED(CONFIG_KFENCE) || debug_pagealloc_enabled();
+}
diff --git a/arch/powerpc/mm/nohash/8xx.c b/arch/powerpc/mm/nohash/8xx.c
index 19a3eec1d8c5..71bfdbedacee 100644
--- a/arch/powerpc/mm/nohash/8xx.c
+++ b/arch/powerpc/mm/nohash/8xx.c
@@ -149,7 +149,7 @@ unsigned long __init mmu_mapin_ram(unsigned long base, unsigned long top)
 {
 	unsigned long etext8 = ALIGN(__pa(_etext), SZ_8M);
 	unsigned long sinittext = __pa(_sinittext);
-	bool strict_boundary = strict_kernel_rwx_enabled() || debug_pagealloc_enabled();
+	bool strict_boundary = strict_kernel_rwx_enabled() || debug_pagealloc_enabled_or_kfence();
 	unsigned long boundary = strict_boundary ? sinittext : etext8;
 	unsigned long einittext8 = ALIGN(__pa(_einittext), SZ_8M);
 
@@ -161,7 +161,7 @@ unsigned long __init mmu_mapin_ram(unsigned long base, unsigned long top)
 		return 0;
 
 	mmu_mapin_ram_chunk(0, boundary, PAGE_KERNEL_TEXT, true);
-	if (debug_pagealloc_enabled()) {
+	if (debug_pagealloc_enabled_or_kfence()) {
 		top = boundary;
 	} else {
 		mmu_mapin_ram_chunk(boundary, einittext8, PAGE_KERNEL_TEXT, true);
-- 
2.25.0

