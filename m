Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F4E86B7CA
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Jul 2019 10:01:34 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45pV8W1hd9zDqQw
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Jul 2019 18:01:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=huawei.com
 (client-ip=45.249.212.190; helo=huawei.com; envelope-from=yanaijie@huawei.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=huawei.com
Received: from huawei.com (szxga04-in.huawei.com [45.249.212.190])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45pTtc061dzDqQL
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Jul 2019 17:49:27 +1000 (AEST)
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 01135EDC4AD0670728E9;
 Wed, 17 Jul 2019 15:49:24 +0800 (CST)
Received: from huawei.com (10.175.124.28) by DGGEMS402-HUB.china.huawei.com
 (10.3.19.202) with Microsoft SMTP Server id 14.3.439.0; Wed, 17 Jul 2019
 15:49:16 +0800
From: Jason Yan <yanaijie@huawei.com>
To: <mpe@ellerman.id.au>, <linuxppc-dev@lists.ozlabs.org>,
 <diana.craciun@nxp.com>, <christophe.leroy@c-s.fr>,
 <benh@kernel.crashing.org>, <paulus@samba.org>, <npiggin@gmail.com>,
 <keescook@chromium.org>, <kernel-hardening@lists.openwall.com>
Subject: [RFC PATCH 06/10] powerpc/fsl_booke/32: implement KASLR infrastructure
Date: Wed, 17 Jul 2019 16:06:17 +0800
Message-ID: <20190717080621.40424-7-yanaijie@huawei.com>
X-Mailer: git-send-email 2.17.2
In-Reply-To: <20190717080621.40424-1-yanaijie@huawei.com>
References: <20190717080621.40424-1-yanaijie@huawei.com>
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
Cc: wangkefeng.wang@huawei.com, Jason Yan <yanaijie@huawei.com>,
 linux-kernel@vger.kernel.org, jingxiangfeng@huawei.com,
 thunder.leizhen@huawei.com, fanchengyang@huawei.com, yebin10@huawei.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This patch add support to boot kernel from places other than KERNELBASE.
Since CONFIG_RELOCATABLE has already supported, what we need to do is
map or copy kernel to a proper place and relocate. Freescale Book-E
parts expect lowmem to be mapped by fixed TLB entries(TLB1). The TLB1
entries are not suitable to map the kernel directly in a randomized
region, so we chose to copy the kernel to a proper place and restart to
relocate.

The offset of the kernel was not randomized yet(a fixed 64M is set). We
will randomize it in the next patch.

Signed-off-by: Jason Yan <yanaijie@huawei.com>
Cc: Diana Craciun <diana.craciun@nxp.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Christophe Leroy <christophe.leroy@c-s.fr>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Paul Mackerras <paulus@samba.org>
Cc: Nicholas Piggin <npiggin@gmail.com>
Cc: Kees Cook <keescook@chromium.org>
---
 arch/powerpc/Kconfig                          | 11 +++
 arch/powerpc/kernel/Makefile                  |  1 +
 arch/powerpc/kernel/early_32.c                |  2 +-
 arch/powerpc/kernel/fsl_booke_entry_mapping.S | 13 ++-
 arch/powerpc/kernel/head_fsl_booke.S          | 15 +++-
 arch/powerpc/kernel/kaslr_booke.c             | 83 +++++++++++++++++++
 arch/powerpc/mm/mmu_decl.h                    |  6 ++
 arch/powerpc/mm/nohash/fsl_booke.c            |  7 +-
 8 files changed, 125 insertions(+), 13 deletions(-)
 create mode 100644 arch/powerpc/kernel/kaslr_booke.c

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index f516796dd819..3742df54bdc8 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -547,6 +547,17 @@ config RELOCATABLE
 	  setting can still be useful to bootwrappers that need to know the
 	  load address of the kernel (eg. u-boot/mkimage).
 
+config RANDOMIZE_BASE
+	bool "Randomize the address of the kernel image"
+	depends on (FSL_BOOKE && FLATMEM && PPC32)
+	select RELOCATABLE
+	help
+	  Randomizes the virtual address at which the kernel image is
+	  loaded, as a security feature that deters exploit attempts
+	  relying on knowledge of the location of kernel internals.
+
+	  If unsure, say N.
+
 config RELOCATABLE_TEST
 	bool "Test relocatable kernel"
 	depends on (PPC64 && RELOCATABLE)
diff --git a/arch/powerpc/kernel/Makefile b/arch/powerpc/kernel/Makefile
index 56dfa7a2a6f2..cf87a0921db4 100644
--- a/arch/powerpc/kernel/Makefile
+++ b/arch/powerpc/kernel/Makefile
@@ -105,6 +105,7 @@ extra-$(CONFIG_PPC_8xx)		:= head_8xx.o
 extra-y				+= vmlinux.lds
 
 obj-$(CONFIG_RELOCATABLE)	+= reloc_$(BITS).o
+obj-$(CONFIG_RANDOMIZE_BASE)	+= kaslr_booke.o
 
 obj-$(CONFIG_PPC32)		+= entry_32.o setup_32.o early_32.o
 obj-$(CONFIG_PPC64)		+= dma-iommu.o iommu.o
diff --git a/arch/powerpc/kernel/early_32.c b/arch/powerpc/kernel/early_32.c
index 3482118ffe76..fe8347cdc07d 100644
--- a/arch/powerpc/kernel/early_32.c
+++ b/arch/powerpc/kernel/early_32.c
@@ -32,5 +32,5 @@ notrace unsigned long __init early_init(unsigned long dt_ptr)
 
 	apply_feature_fixups();
 
-	return KERNELBASE + offset;
+	return kimage_vaddr + offset;
 }
diff --git a/arch/powerpc/kernel/fsl_booke_entry_mapping.S b/arch/powerpc/kernel/fsl_booke_entry_mapping.S
index de0980945510..6d2967673ac7 100644
--- a/arch/powerpc/kernel/fsl_booke_entry_mapping.S
+++ b/arch/powerpc/kernel/fsl_booke_entry_mapping.S
@@ -161,17 +161,16 @@ skpinv:	addi	r6,r6,1				/* Increment */
 	lis	r6,(MAS1_VALID|MAS1_IPROT)@h
 	ori	r6,r6,(MAS1_TSIZE(BOOK3E_PAGESZ_64M))@l
 	mtspr	SPRN_MAS1,r6
-	lis	r6,MAS2_VAL(PAGE_OFFSET, BOOK3E_PAGESZ_64M, M_IF_NEEDED)@h
-	ori	r6,r6,MAS2_VAL(PAGE_OFFSET, BOOK3E_PAGESZ_64M, M_IF_NEEDED)@l
-	mtspr	SPRN_MAS2,r6
+	lis     r6,MAS2_EPN_MASK(BOOK3E_PAGESZ_64M)@h
+	ori     r6,r6,MAS2_EPN_MASK(BOOK3E_PAGESZ_64M)@l
+	and     r6,r6,r20
+	ori	r6,r6,M_IF_NEEDED@l
+	mtspr   SPRN_MAS2,r6
 	mtspr	SPRN_MAS3,r8
 	tlbwe
 
 /* 7. Jump to KERNELBASE mapping */
-	lis	r6,(KERNELBASE & ~0xfff)@h
-	ori	r6,r6,(KERNELBASE & ~0xfff)@l
-	rlwinm	r7,r25,0,0x03ffffff
-	add	r6,r7,r6
+	mr	r6,r20
 
 #elif defined(ENTRY_MAPPING_KEXEC_SETUP)
 /*
diff --git a/arch/powerpc/kernel/head_fsl_booke.S b/arch/powerpc/kernel/head_fsl_booke.S
index ce40f96dae20..d34933b0745a 100644
--- a/arch/powerpc/kernel/head_fsl_booke.S
+++ b/arch/powerpc/kernel/head_fsl_booke.S
@@ -155,6 +155,8 @@ _ENTRY(_start);
  */
 
 _ENTRY(__early_start)
+	LOAD_REG_ADDR_PIC(r20, kimage_vaddr)
+	lwz     r20,0(r20)
 
 #define ENTRY_MAPPING_BOOT_SETUP
 #include "fsl_booke_entry_mapping.S"
@@ -277,8 +279,8 @@ set_ivor:
 	ori	r6, r6, swapper_pg_dir@l
 	lis	r5, abatron_pteptrs@h
 	ori	r5, r5, abatron_pteptrs@l
-	lis	r4, KERNELBASE@h
-	ori	r4, r4, KERNELBASE@l
+	lis     r3, kimage_vaddr@ha
+	lwz     r4, kimage_vaddr@l(r3)
 	stw	r5, 0(r4)	/* Save abatron_pteptrs at a fixed location */
 	stw	r6, 0(r5)
 
@@ -1067,7 +1069,14 @@ __secondary_start:
 	mr	r5,r25		/* phys kernel start */
 	rlwinm	r5,r5,0,~0x3ffffff	/* aligned 64M */
 	subf	r4,r5,r4	/* memstart_addr - phys kernel start */
-	li	r5,0		/* no device tree */
+#ifdef CONFIG_RANDOMIZE_BASE
+	lis	r7,KERNELBASE@h
+	ori	r7,r7,KERNELBASE@l
+	cmpw	r20,r7		/* if kimage_vaddr != KERNELBASE, randomized */
+	beq	2f
+	li	r4,0
+#endif
+2:	li	r5,0		/* no device tree */
 	li	r6,0		/* not boot cpu */
 	bl	restore_to_as0
 
diff --git a/arch/powerpc/kernel/kaslr_booke.c b/arch/powerpc/kernel/kaslr_booke.c
new file mode 100644
index 000000000000..72d8e9432048
--- /dev/null
+++ b/arch/powerpc/kernel/kaslr_booke.c
@@ -0,0 +1,83 @@
+/*
+ * Copyright (C) 2019 Jason Yan <yanaijie@huawei.com>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ */
+
+#include <linux/signal.h>
+#include <linux/sched.h>
+#include <linux/kernel.h>
+#include <linux/errno.h>
+#include <linux/string.h>
+#include <linux/types.h>
+#include <linux/ptrace.h>
+#include <linux/mman.h>
+#include <linux/mm.h>
+#include <linux/swap.h>
+#include <linux/stddef.h>
+#include <linux/vmalloc.h>
+#include <linux/init.h>
+#include <linux/delay.h>
+#include <linux/highmem.h>
+#include <linux/memblock.h>
+#include <asm/pgalloc.h>
+#include <asm/prom.h>
+#include <asm/io.h>
+#include <asm/mmu_context.h>
+#include <asm/pgtable.h>
+#include <asm/mmu.h>
+#include <linux/uaccess.h>
+#include <asm/smp.h>
+#include <asm/machdep.h>
+#include <asm/setup.h>
+#include <asm/paca.h>
+#include <mm/mmu_decl.h>
+
+extern int is_second_reloc;
+
+static unsigned long __init kaslr_choose_location(void *dt_ptr, phys_addr_t size,
+					unsigned long kernel_sz)
+{
+	/* return a fixed offset of 64M for now */
+	return 0x4000000;
+}
+
+/*
+ * To see if we need to relocate the kernel to a random offset
+ * void *dt_ptr - address of the device tree
+ * phys_addr_t size - size of the first memory block
+ */
+notrace void __init kaslr_early_init(void *dt_ptr, phys_addr_t size)
+{
+	unsigned long tlb_virt;
+	phys_addr_t tlb_phys;
+	unsigned long offset;
+	unsigned long kernel_sz;
+
+	kernel_sz = (unsigned long)_end - KERNELBASE;
+
+	offset = kaslr_choose_location(dt_ptr, size, kernel_sz);
+
+	if (offset == 0)
+		return;
+
+	kimage_vaddr += offset;
+	kernstart_addr += offset;
+
+	is_second_reloc = 1;
+
+	if (offset >= SZ_64M) {
+		tlb_virt = round_down(kimage_vaddr, SZ_64M);
+		tlb_phys = round_down(kernstart_addr, SZ_64M);
+
+		/* Create kernel map to relocate in */
+		create_tlb_entry(tlb_phys, tlb_virt, 1);
+	}
+
+	/* Copy the kernel to it's new location and run */
+	memcpy((void *)kimage_vaddr, (void *)KERNELBASE, kernel_sz);
+
+	reloc_kernel_entry(dt_ptr, kimage_vaddr);
+}
diff --git a/arch/powerpc/mm/mmu_decl.h b/arch/powerpc/mm/mmu_decl.h
index dae8e9177574..754ae1e69f92 100644
--- a/arch/powerpc/mm/mmu_decl.h
+++ b/arch/powerpc/mm/mmu_decl.h
@@ -148,6 +148,12 @@ extern void reloc_kernel_entry(void *fdt, int addr);
 extern void loadcam_entry(unsigned int index);
 extern void loadcam_multi(int first_idx, int num, int tmp_idx);
 
+#ifdef CONFIG_RANDOMIZE_BASE
+extern void kaslr_early_init(void *dt_ptr, phys_addr_t size);
+#else
+static inline void kaslr_early_init(void *dt_ptr, phys_addr_t size) {}
+#endif
+
 struct tlbcam {
 	u32	MAS0;
 	u32	MAS1;
diff --git a/arch/powerpc/mm/nohash/fsl_booke.c b/arch/powerpc/mm/nohash/fsl_booke.c
index 556e3cd52a35..8d25a8dc965f 100644
--- a/arch/powerpc/mm/nohash/fsl_booke.c
+++ b/arch/powerpc/mm/nohash/fsl_booke.c
@@ -263,7 +263,8 @@ void setup_initial_memory_limit(phys_addr_t first_memblock_base,
 int __initdata is_second_reloc;
 notrace void __init relocate_init(u64 dt_ptr, phys_addr_t start)
 {
-	unsigned long base = KERNELBASE;
+	unsigned long base = kimage_vaddr;
+	phys_addr_t size;
 
 	kernstart_addr = start;
 	if (is_second_reloc) {
@@ -291,7 +292,7 @@ notrace void __init relocate_init(u64 dt_ptr, phys_addr_t start)
 	start &= ~0x3ffffff;
 	base &= ~0x3ffffff;
 	virt_phys_offset = base - start;
-	early_get_first_memblock_info(__va(dt_ptr), NULL);
+	early_get_first_memblock_info(__va(dt_ptr), &size);
 	/*
 	 * We now get the memstart_addr, then we should check if this
 	 * address is the same as what the PAGE_OFFSET map to now. If
@@ -316,6 +317,8 @@ notrace void __init relocate_init(u64 dt_ptr, phys_addr_t start)
 		/* We should never reach here */
 		panic("Relocation error");
 	}
+
+	kaslr_early_init(__va(dt_ptr), size);
 }
 #endif
 #endif
-- 
2.17.2

