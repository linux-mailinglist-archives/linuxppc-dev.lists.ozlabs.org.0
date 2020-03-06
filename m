Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C6DEE17B6FC
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Mar 2020 07:47:57 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48YdV16QQxzDqwf
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Mar 2020 17:47:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=huawei.com (client-ip=45.249.212.35; helo=huawei.com;
 envelope-from=yanaijie@huawei.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=huawei.com
Received: from huawei.com (szxga07-in.huawei.com [45.249.212.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48YdMK4SVqzDqvY
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 Mar 2020 17:42:05 +1100 (AEDT)
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 623B3939C75F342981B3;
 Fri,  6 Mar 2020 14:41:56 +0800 (CST)
Received: from huawei.com (10.175.124.28) by DGGEMS404-HUB.china.huawei.com
 (10.3.19.204) with Microsoft SMTP Server id 14.3.439.0; Fri, 6 Mar 2020
 14:41:49 +0800
From: Jason Yan <yanaijie@huawei.com>
To: <mpe@ellerman.id.au>, <linuxppc-dev@lists.ozlabs.org>,
 <diana.craciun@nxp.com>, <christophe.leroy@c-s.fr>,
 <benh@kernel.crashing.org>, <paulus@samba.org>, <npiggin@gmail.com>,
 <keescook@chromium.org>, <kernel-hardening@lists.openwall.com>,
 <oss@buserror.net>
Subject: [PATCH v4 3/6] powerpc/fsl_booke/64: implement KASLR for fsl_booke64
Date: Fri, 6 Mar 2020 14:40:30 +0800
Message-ID: <20200306064033.3398-4-yanaijie@huawei.com>
X-Mailer: git-send-email 2.17.2
In-Reply-To: <20200306064033.3398-1-yanaijie@huawei.com>
References: <20200306064033.3398-1-yanaijie@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.124.28]
X-CFilter-Loop: Reflected
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
Cc: Jason Yan <yanaijie@huawei.com>, dja@axtens.net,
 linux-kernel@vger.kernel.org, zhaohongjiang@huawei.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The implementation for Freescale BookE64 is similar as BookE32. One
difference is that Freescale BookE64 set up a TLB mapping of 1G during
booting. Another difference is that ppc64 needs the kernel to be
64K-aligned. So we can randomize the kernel in this 1G mapping and make
it 64K-aligned. This can save some code to creat another TLB map at
early boot. The disadvantage is that we only have about 1G/64K = 16384
slots to put the kernel in.

To support secondary cpu boot up, a variable __kaslr_offset was added in
first_256B section. This can help secondary cpu get the kaslr offset
before the 1:1 mapping has been setup.

Signed-off-by: Jason Yan <yanaijie@huawei.com>
Cc: Scott Wood <oss@buserror.net>
Cc: Diana Craciun <diana.craciun@nxp.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Christophe Leroy <christophe.leroy@c-s.fr>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Paul Mackerras <paulus@samba.org>
Cc: Nicholas Piggin <npiggin@gmail.com>
Cc: Kees Cook <keescook@chromium.org>
---
 arch/powerpc/Kconfig                 |  2 +-
 arch/powerpc/kernel/exceptions-64e.S | 10 ++++
 arch/powerpc/kernel/head_64.S        |  6 +++
 arch/powerpc/kernel/setup_64.c       |  3 ++
 arch/powerpc/mm/mmu_decl.h           | 20 ++++----
 arch/powerpc/mm/nohash/kaslr_booke.c | 72 +++++++++++++++++++---------
 6 files changed, 80 insertions(+), 33 deletions(-)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 497b7d0b2d7e..0c76601fdd59 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -564,7 +564,7 @@ config RELOCATABLE
 
 config RANDOMIZE_BASE
 	bool "Randomize the address of the kernel image"
-	depends on (FSL_BOOKE && FLATMEM && PPC32)
+	depends on (PPC_FSL_BOOK3E && FLATMEM)
 	depends on RELOCATABLE
 	help
 	  Randomizes the virtual address at which the kernel image is
diff --git a/arch/powerpc/kernel/exceptions-64e.S b/arch/powerpc/kernel/exceptions-64e.S
index 1b9b174bee86..260cf1f1e71c 100644
--- a/arch/powerpc/kernel/exceptions-64e.S
+++ b/arch/powerpc/kernel/exceptions-64e.S
@@ -1378,6 +1378,7 @@ skpinv:	addi	r6,r6,1				/* Increment */
 1:	mflr	r6
 	addi	r6,r6,(2f - 1b)
 	tovirt(r6,r6)
+	add	r6,r6,r19
 	lis	r7,MSR_KERNEL@h
 	ori	r7,r7,MSR_KERNEL@l
 	mtspr	SPRN_SRR0,r6
@@ -1400,6 +1401,7 @@ skpinv:	addi	r6,r6,1				/* Increment */
 
 	/* We translate LR and return */
 	tovirt(r8,r8)
+	add	r8,r8,r19
 	mtlr	r8
 	blr
 
@@ -1528,6 +1530,7 @@ a2_tlbinit_code_end:
  */
 _GLOBAL(start_initialization_book3e)
 	mflr	r28
+	li	r19, 0
 
 	/* First, we need to setup some initial TLBs to map the kernel
 	 * text, data and bss at PAGE_OFFSET. We don't have a real mode
@@ -1570,6 +1573,12 @@ _GLOBAL(book3e_secondary_core_init)
 	cmplwi	r4,0
 	bne	2f
 
+	li	r19, 0
+#ifdef CONFIG_RANDOMIZE_BASE
+	LOAD_REG_ADDR_PIC(r19, __kaslr_offset)
+	ld	r19,0(r19)
+	rlwinm  r19,r19,0,0,5
+#endif
 	/* Setup TLB for this core */
 	bl	initial_tlb_book3e
 
@@ -1602,6 +1611,7 @@ _GLOBAL(book3e_secondary_core_init)
 	lis	r3,PAGE_OFFSET@highest
 	sldi	r3,r3,32
 	or	r28,r28,r3
+	add	r28,r28,r19
 1:	mtlr	r28
 	blr
 
diff --git a/arch/powerpc/kernel/head_64.S b/arch/powerpc/kernel/head_64.S
index ad79fddb974d..454129a3c259 100644
--- a/arch/powerpc/kernel/head_64.S
+++ b/arch/powerpc/kernel/head_64.S
@@ -104,6 +104,12 @@ __secondary_hold_acknowledge:
 	.8byte	0x0
 
 #ifdef CONFIG_RELOCATABLE
+#ifdef CONFIG_RANDOMIZE_BASE
+	.globl	__kaslr_offset
+__kaslr_offset:
+	.8byte	0x0
+#endif
+
 	/* This flag is set to 1 by a loader if the kernel should run
 	 * at the loaded address instead of the linked address.  This
 	 * is used by kexec-tools to keep the the kdump kernel in the
diff --git a/arch/powerpc/kernel/setup_64.c b/arch/powerpc/kernel/setup_64.c
index e05e6dd67ae6..836e202dfd5b 100644
--- a/arch/powerpc/kernel/setup_64.c
+++ b/arch/powerpc/kernel/setup_64.c
@@ -67,6 +67,7 @@
 #include <asm/kup.h>
 #include <asm/early_ioremap.h>
 
+#include <mm/mmu_decl.h>
 #include "setup.h"
 
 int spinning_secondaries;
@@ -300,6 +301,8 @@ void __init early_setup(unsigned long dt_ptr)
 	/* Enable early debugging if any specified (see udbg.h) */
 	udbg_early_init();
 
+	kaslr_early_init(__va(dt_ptr), 0);
+
 	udbg_printf(" -> %s(), dt_ptr: 0x%lx\n", __func__, dt_ptr);
 
 	/*
diff --git a/arch/powerpc/mm/mmu_decl.h b/arch/powerpc/mm/mmu_decl.h
index 605129b5ccdf..6efbd7fd88a4 100644
--- a/arch/powerpc/mm/mmu_decl.h
+++ b/arch/powerpc/mm/mmu_decl.h
@@ -139,22 +139,16 @@ extern unsigned long calc_cam_sz(unsigned long ram, unsigned long virt,
 extern void adjust_total_lowmem(void);
 extern int switch_to_as1(void);
 extern void restore_to_as0(int esel, int offset, void *dt_ptr, int bootcpu);
+#endif
 void create_kaslr_tlb_entry(int entry, unsigned long virt, phys_addr_t phys);
 extern int is_second_reloc;
-#endif
+extern unsigned long __kaslr_offset;
+extern unsigned int __run_at_load;
 
 void reloc_kernel_entry(void *fdt, long addr);
 extern void loadcam_entry(unsigned int index);
 extern void loadcam_multi(int first_idx, int num, int tmp_idx);
 
-#ifdef CONFIG_RANDOMIZE_BASE
-void kaslr_early_init(void *dt_ptr, phys_addr_t size);
-void kaslr_late_init(void);
-#else
-static inline void kaslr_early_init(void *dt_ptr, phys_addr_t size) {}
-static inline void kaslr_late_init(void) {}
-#endif
-
 struct tlbcam {
 	u32	MAS0;
 	u32	MAS1;
@@ -164,6 +158,14 @@ struct tlbcam {
 };
 #endif
 
+#ifdef CONFIG_RANDOMIZE_BASE
+void kaslr_early_init(void *dt_ptr, phys_addr_t size);
+void kaslr_late_init(void);
+#else
+static inline void kaslr_early_init(void *dt_ptr, phys_addr_t size) {}
+static inline void kaslr_late_init(void) {}
+#endif
+
 #if defined(CONFIG_PPC_BOOK3S_32) || defined(CONFIG_FSL_BOOKE) || defined(CONFIG_PPC_8xx)
 /* 6xx have BATS */
 /* FSL_BOOKE have TLBCAM */
diff --git a/arch/powerpc/mm/nohash/kaslr_booke.c b/arch/powerpc/mm/nohash/kaslr_booke.c
index 6ebff31fefcc..bf60f956dc91 100644
--- a/arch/powerpc/mm/nohash/kaslr_booke.c
+++ b/arch/powerpc/mm/nohash/kaslr_booke.c
@@ -228,10 +228,11 @@ static __init unsigned long get_usable_address(const void *fdt,
 					       unsigned long start,
 					       unsigned long offset)
 {
+	unsigned long unit = IS_ENABLED(CONFIG_PPC32) ? SZ_16K : SZ_64K;
 	unsigned long pa;
 	unsigned long pa_end;
 
-	for (pa = offset; (long)pa > (long)start; pa -= SZ_16K) {
+	for (pa = offset; (long)pa > (long)start; pa -= unit) {
 		pa_end = pa + regions.kernel_size;
 		if (overlaps_region(fdt, pa, pa_end))
 			continue;
@@ -268,24 +269,34 @@ static unsigned long __init kaslr_legal_offset(void *dt_ptr, unsigned long rando
 	unsigned long index;
 	unsigned long offset;
 
-	/*
-	 * Decide which 64M we want to start
-	 * Only use the low 8 bits of the random seed
-	 */
-	index = random & 0xFF;
-	index %= regions.linear_sz / SZ_64M;
-
-	/* Decide offset inside 64M */
-	offset = random % (SZ_64M - regions.kernel_size);
-	offset = round_down(offset, SZ_16K);
+	if (IS_ENABLED(CONFIG_PPC32)) {
+		/*
+		 * Decide which 64M we want to start
+		 * Only use the low 8 bits of the random seed
+		 */
+		index = random & 0xFF;
+		index %= regions.linear_sz / SZ_64M;
+
+		/* Decide offset inside 64M */
+		offset = random % (SZ_64M - regions.kernel_size);
+		offset = round_down(offset, SZ_16K);
+
+		while ((long)index >= 0) {
+			offset = memstart_addr + index * SZ_64M + offset;
+			start = memstart_addr + index * SZ_64M;
+			koffset = get_usable_address(dt_ptr, start, offset);
+			if (koffset)
+				break;
+			index--;
+		}
+	} else {
+		/* Decide kernel offset inside 1G */
+		offset = random % (SZ_1G - regions.kernel_size);
+		offset = round_down(offset, SZ_64K);
 
-	while ((long)index >= 0) {
-		offset = memstart_addr + index * SZ_64M + offset;
-		start = memstart_addr + index * SZ_64M;
+		start = memstart_addr;
+		offset = memstart_addr + offset;
 		koffset = get_usable_address(dt_ptr, start, offset);
-		if (koffset)
-			break;
-		index--;
 	}
 
 	if (koffset != 0)
@@ -325,6 +336,7 @@ static unsigned long __init kaslr_choose_location(void *dt_ptr, phys_addr_t size
 	else
 		pr_warn("KASLR: No safe seed for randomizing the kernel base.\n");
 
+#ifdef CONFIG_PPC32
 	ram = min_t(phys_addr_t, __max_low_memory, size);
 	ram = map_mem_in_cams(ram, CONFIG_LOWMEM_CAM_NUM, true);
 	linear_sz = min_t(unsigned long, ram, SZ_512M);
@@ -332,6 +344,7 @@ static unsigned long __init kaslr_choose_location(void *dt_ptr, phys_addr_t size
 	/* If the linear size is smaller than 64M, do not randmize */
 	if (linear_sz < SZ_64M)
 		return 0;
+#endif
 
 	/* check for a reserved-memory node and record its cell sizes */
 	regions.reserved_mem = fdt_path_offset(dt_ptr, "/reserved-memory");
@@ -365,6 +378,14 @@ notrace void __init kaslr_early_init(void *dt_ptr, phys_addr_t size)
 	unsigned long offset;
 	unsigned long kernel_sz;
 
+	if (IS_ENABLED(CONFIG_PPC64)) {
+		if (__run_at_load == 1)
+			return;
+
+		/* Setup flat device-tree pointer */
+		initial_boot_params = dt_ptr;
+	}
+
 	kernel_sz = (unsigned long)_end - (unsigned long)_stext;
 
 	offset = kaslr_choose_location(dt_ptr, size, kernel_sz);
@@ -374,14 +395,19 @@ notrace void __init kaslr_early_init(void *dt_ptr, phys_addr_t size)
 	kernstart_virt_addr += offset;
 	kernstart_addr += offset;
 
-	is_second_reloc = 1;
+	if (IS_ENABLED(CONFIG_PPC32)) {
+		is_second_reloc = 1;
 
-	if (offset >= SZ_64M) {
-		tlb_virt = round_down(kernstart_virt_addr, SZ_64M);
-		tlb_phys = round_down(kernstart_addr, SZ_64M);
+		if (offset >= SZ_64M) {
+			tlb_virt = round_down(kernstart_virt_addr, SZ_64M);
+			tlb_phys = round_down(kernstart_addr, SZ_64M);
 
-		/* Create kernel map to relocate in */
-		create_kaslr_tlb_entry(1, tlb_virt, tlb_phys);
+			/* Create kernel map to relocate in */
+			create_kaslr_tlb_entry(1, tlb_virt, tlb_phys);
+		}
+	} else {
+		__kaslr_offset = kernstart_virt_addr - KERNELBASE;
+		__run_at_load = 1;
 	}
 
 	/* Copy the kernel to it's new location and run */
-- 
2.17.2

