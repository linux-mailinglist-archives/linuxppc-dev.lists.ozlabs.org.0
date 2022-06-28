Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4174655E579
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Jun 2022 16:51:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LXSGH1pckz3f6q
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Jun 2022 00:51:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LXSDN1brKz3cj2
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Jun 2022 00:49:40 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4LXSD11fkkz9tV1;
	Tue, 28 Jun 2022 16:49:21 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ThIv8D9eJ7Sb; Tue, 28 Jun 2022 16:49:21 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4LXSCy4y3mz9tV9;
	Tue, 28 Jun 2022 16:49:18 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 8DDA48B765;
	Tue, 28 Jun 2022 16:49:18 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id 0R73OtiY-WK7; Tue, 28 Jun 2022 16:49:18 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.232.132])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 2B8AE8B788;
	Tue, 28 Jun 2022 16:49:18 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 25SEnDlX2928222
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 28 Jun 2022 16:49:13 +0200
Received: (from chleroy@localhost)
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 25SEnDQo2928221;
	Tue, 28 Jun 2022 16:49:13 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Michael Ellerman <mpe@ellerman.id.au>, dja@axtens.net
Subject: [PATCH v1 6/6] powerpc/64e: KASAN Full support for BOOK3E/64
Date: Tue, 28 Jun 2022 16:48:59 +0200
Message-Id: <0bef8beda27baf71e3b9e8b13e620fba6e19499b.1656427701.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <8d6c5859a45935d6e1a336da4dc20be421e8cea7.1656427701.git.christophe.leroy@csgroup.eu>
References: <8d6c5859a45935d6e1a336da4dc20be421e8cea7.1656427701.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1656427736; l=9788; s=20211009; h=from:subject:message-id; bh=Gfb5DiMGf8A/YXE2AuL5mqn+J9pDlEkBdl34V/dhsQU=; b=fnUvlqwkF9jIuOrxJdaVA8KZ7vC48RNYFLcz/Ok/tIibw9YITKvMXo+TsYLg6HhY1pIsX4rfivbQ 5mFT3pCSDfGGrTEiYsA9liRJRzHLJbo2wLIBQu8dEY9yHpN1LrSw
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

We now have memory organised in a way that allows
implementing KASAN.

Unlike book3s/64, book3e always has translation active so the only
thing needed to use KASAN is to setup an early zero shadow mapping
just after setting a stack pointer and before calling early_setup().

The memory layout is now as follows

   +------------------------+  Kernel virtual map end (0xc000200000000000)
   |                        |
   |    16TB of KASAN map   |
   |                        |
   +------------------------+  Kernel KASAN shadow map start
   |                        |
   |    16TB of IO map      |
   |                        |
   +------------------------+  Kernel IO map start
   |                        |
   |    16TB of vmemmap     |
   |                        |
   +------------------------+  Kernel vmemmap start
   |                        |
   |    16TB of vmap        |
   |                        |
   +------------------------+  Kernel virt start (0xc000100000000000)
   |                        |
   |    64TB of linear mem  |
   |                        |
   +------------------------+  Kernel linear (0xc.....)

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/Kconfig                   |   2 +
 arch/powerpc/Kconfig.debug             |   3 +-
 arch/powerpc/include/asm/kasan.h       |  13 ++-
 arch/powerpc/kernel/head_64.S          |   3 +
 arch/powerpc/mm/kasan/Makefile         |   1 +
 arch/powerpc/mm/kasan/init_book3e_64.c | 133 +++++++++++++++++++++++++
 arch/powerpc/mm/kasan/init_book3s_64.c |   2 +
 arch/powerpc/platforms/Kconfig.cputype |   1 -
 8 files changed, 155 insertions(+), 3 deletions(-)
 create mode 100644 arch/powerpc/mm/kasan/init_book3e_64.c

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index c2ce2e60c8f0..92e0cad7752d 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -193,6 +193,7 @@ config PPC
 	select HAVE_ARCH_JUMP_LABEL_RELATIVE
 	select HAVE_ARCH_KASAN			if PPC32 && PPC_PAGE_SHIFT <= 14
 	select HAVE_ARCH_KASAN			if PPC_RADIX_MMU
+	select HAVE_ARCH_KASAN			if PPC_BOOK3E_64
 	select HAVE_ARCH_KASAN_VMALLOC		if HAVE_ARCH_KASAN
 	select HAVE_ARCH_KFENCE			if PPC_BOOK3S_32 || PPC_8xx || 40x
 	select HAVE_ARCH_KGDB
@@ -254,6 +255,7 @@ config PPC
 	select IOMMU_HELPER			if PPC64
 	select IRQ_DOMAIN
 	select IRQ_FORCED_THREADING
+	select KASAN_VMALLOC			if KASAN && MODULES
 	select MMU_GATHER_PAGE_SIZE
 	select MMU_GATHER_RCU_TABLE_FREE
 	select MODULES_USE_ELF_RELA
diff --git a/arch/powerpc/Kconfig.debug b/arch/powerpc/Kconfig.debug
index 9f363c143d86..6a8855d45af7 100644
--- a/arch/powerpc/Kconfig.debug
+++ b/arch/powerpc/Kconfig.debug
@@ -375,4 +375,5 @@ config KASAN_SHADOW_OFFSET
 	hex
 	depends on KASAN
 	default 0xe0000000 if PPC32
-	default 0xa80e000000000000 if PPC64
+	default 0xa80e000000000000 if PPC_BOOK3S_64
+	default 0xa8001c0000000000 if PPC_BOOK3E_64
diff --git a/arch/powerpc/include/asm/kasan.h b/arch/powerpc/include/asm/kasan.h
index a6be4025cba2..92a968202ba7 100644
--- a/arch/powerpc/include/asm/kasan.h
+++ b/arch/powerpc/include/asm/kasan.h
@@ -19,7 +19,7 @@
 
 #define KASAN_SHADOW_SCALE_SHIFT	3
 
-#ifdef CONFIG_MODULES
+#if defined(CONFIG_MODULES) && defined(CONFIG_PPC32)
 #define KASAN_KERN_START	ALIGN_DOWN(PAGE_OFFSET - SZ_256M, SZ_256M)
 #else
 #define KASAN_KERN_START	PAGE_OFFSET
@@ -39,6 +39,17 @@
  * c00e000000000000 << 3 + a80e000000000000 = c00fc00000000000
  */
 #define KASAN_SHADOW_END 0xc00fc00000000000UL
+
+#else
+
+/*
+ * The shadow ends before the highest accessible address
+ * because we don't need a shadow for the shadow.
+ * But it doesn't hurt to have a shadow for the shadow,
+ * keep shadow end aligned eases things.
+ */
+#define KASAN_SHADOW_END 0xc000200000000000UL
+
 #endif
 
 #ifdef CONFIG_KASAN
diff --git a/arch/powerpc/kernel/head_64.S b/arch/powerpc/kernel/head_64.S
index d3eea633d11a..cf2c08902c05 100644
--- a/arch/powerpc/kernel/head_64.S
+++ b/arch/powerpc/kernel/head_64.S
@@ -965,6 +965,9 @@ start_here_multiplatform:
 	 * and SLB setup before we turn on relocation.
 	 */
 
+#ifdef CONFIG_KASAN
+	bl	kasan_early_init
+#endif
 	/* Restore parameters passed from prom_init/kexec */
 	mr	r3,r31
 	LOAD_REG_ADDR(r12, DOTSYM(early_setup))
diff --git a/arch/powerpc/mm/kasan/Makefile b/arch/powerpc/mm/kasan/Makefile
index 4999aadb1867..699eeffd9f55 100644
--- a/arch/powerpc/mm/kasan/Makefile
+++ b/arch/powerpc/mm/kasan/Makefile
@@ -6,3 +6,4 @@ obj-$(CONFIG_PPC32)		+= init_32.o
 obj-$(CONFIG_PPC_8xx)		+= 8xx.o
 obj-$(CONFIG_PPC_BOOK3S_32)	+= book3s_32.o
 obj-$(CONFIG_PPC_BOOK3S_64)	+= init_book3s_64.o
+obj-$(CONFIG_PPC_BOOK3E_64)	+= init_book3e_64.o
diff --git a/arch/powerpc/mm/kasan/init_book3e_64.c b/arch/powerpc/mm/kasan/init_book3e_64.c
new file mode 100644
index 000000000000..11519e88dc6b
--- /dev/null
+++ b/arch/powerpc/mm/kasan/init_book3e_64.c
@@ -0,0 +1,133 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * KASAN for 64-bit Book3e powerpc
+ *
+ * Copyright 2022, Christophe Leroy, CS GROUP France
+ */
+
+#define DISABLE_BRANCH_PROFILING
+
+#include <linux/kasan.h>
+#include <linux/printk.h>
+#include <linux/memblock.h>
+#include <linux/set_memory.h>
+
+#include <asm/pgalloc.h>
+
+static inline bool kasan_pud_table(p4d_t p4d)
+{
+	return p4d_page(p4d) == virt_to_page(lm_alias(kasan_early_shadow_pud));
+}
+
+static inline bool kasan_pmd_table(pud_t pud)
+{
+	return pud_page(pud) == virt_to_page(lm_alias(kasan_early_shadow_pmd));
+}
+
+static inline bool kasan_pte_table(pmd_t pmd)
+{
+	return pmd_page(pmd) == virt_to_page(lm_alias(kasan_early_shadow_pte));
+}
+
+static int __init kasan_map_kernel_page(unsigned long ea, unsigned long pa, pgprot_t prot)
+{
+	pgd_t *pgdp;
+	p4d_t *p4dp;
+	pud_t *pudp;
+	pmd_t *pmdp;
+	pte_t *ptep;
+
+	pgdp = pgd_offset_k(ea);
+	p4dp = p4d_offset(pgdp, ea);
+	if (kasan_pud_table(*p4dp)) {
+		pudp = memblock_alloc(PUD_TABLE_SIZE, PUD_TABLE_SIZE);
+		memcpy(pudp, kasan_early_shadow_pud, PUD_TABLE_SIZE);
+		p4d_populate(&init_mm, p4dp, pudp);
+	}
+	pudp = pud_offset(p4dp, ea);
+	if (kasan_pmd_table(*pudp)) {
+		pmdp = memblock_alloc(PMD_TABLE_SIZE, PMD_TABLE_SIZE);
+		memcpy(pmdp, kasan_early_shadow_pmd, PMD_TABLE_SIZE);
+		pud_populate(&init_mm, pudp, pmdp);
+	}
+	pmdp = pmd_offset(pudp, ea);
+	if (kasan_pte_table(*pmdp)) {
+		ptep = memblock_alloc(PTE_TABLE_SIZE, PTE_TABLE_SIZE);
+		memcpy(ptep, kasan_early_shadow_pte, PTE_TABLE_SIZE);
+		pmd_populate_kernel(&init_mm, pmdp, ptep);
+	}
+	ptep = pte_offset_kernel(pmdp, ea);
+
+	__set_pte_at(&init_mm, ea, ptep, pfn_pte(pa >> PAGE_SHIFT, prot), 0);
+
+	return 0;
+}
+
+static void __init kasan_init_phys_region(void *start, void *end)
+{
+	unsigned long k_start, k_end, k_cur;
+	void *va;
+
+	if (start >= end)
+		return;
+
+	k_start = ALIGN_DOWN((unsigned long)kasan_mem_to_shadow(start), PAGE_SIZE);
+	k_end = ALIGN((unsigned long)kasan_mem_to_shadow(end), PAGE_SIZE);
+
+	va = memblock_alloc(k_end - k_start, PAGE_SIZE);
+	for (k_cur = k_start; k_cur < k_end; k_cur += PAGE_SIZE, va += PAGE_SIZE)
+		kasan_map_kernel_page(k_cur, __pa(va), PAGE_KERNEL);
+}
+
+void __init kasan_early_init(void)
+{
+	int i;
+	unsigned long addr;
+	pgd_t *pgd = pgd_offset_k(KASAN_SHADOW_START);
+	pte_t zero_pte = pfn_pte(virt_to_pfn(kasan_early_shadow_page), PAGE_KERNEL);
+
+	BUILD_BUG_ON(!IS_ALIGNED(KASAN_SHADOW_START, PGDIR_SIZE));
+	BUILD_BUG_ON(!IS_ALIGNED(KASAN_SHADOW_END, PGDIR_SIZE));
+
+	for (i = 0; i < PTRS_PER_PTE; i++)
+		__set_pte_at(&init_mm, (unsigned long)kasan_early_shadow_page,
+			     &kasan_early_shadow_pte[i], zero_pte, 0);
+
+	for (i = 0; i < PTRS_PER_PMD; i++)
+		pmd_populate_kernel(&init_mm, &kasan_early_shadow_pmd[i],
+				    kasan_early_shadow_pte);
+
+	for (i = 0; i < PTRS_PER_PUD; i++)
+		pud_populate(&init_mm, &kasan_early_shadow_pud[i],
+			     kasan_early_shadow_pmd);
+
+	for (addr = KASAN_SHADOW_START; addr != KASAN_SHADOW_END; addr += PGDIR_SIZE)
+		p4d_populate(&init_mm, p4d_offset(pgd++, addr), kasan_early_shadow_pud);
+}
+
+void __init kasan_init(void)
+{
+	phys_addr_t start, end;
+	u64 i;
+	pte_t zero_pte = pfn_pte(virt_to_pfn(kasan_early_shadow_page), PAGE_KERNEL_RO);
+
+	for_each_mem_range(i, &start, &end)
+		kasan_init_phys_region((void *)start, (void *)end);
+
+	if (IS_ENABLED(CONFIG_KASAN_VMALLOC))
+		kasan_remove_zero_shadow((void *)VMALLOC_START, VMALLOC_SIZE);
+
+	for (i = 0; i < PTRS_PER_PTE; i++)
+		__set_pte_at(&init_mm, (unsigned long)kasan_early_shadow_page,
+			     &kasan_early_shadow_pte[i], zero_pte, 0);
+
+	flush_tlb_kernel_range(KASAN_SHADOW_START, KASAN_SHADOW_END);
+
+	memset(kasan_early_shadow_page, 0, PAGE_SIZE);
+
+	/* Enable error messages */
+	init_task.kasan_depth = 0;
+	pr_info("KASAN init done\n");
+}
+
+void __init kasan_late_init(void) { }
diff --git a/arch/powerpc/mm/kasan/init_book3s_64.c b/arch/powerpc/mm/kasan/init_book3s_64.c
index 0da5566d6b84..9300d641cf9a 100644
--- a/arch/powerpc/mm/kasan/init_book3s_64.c
+++ b/arch/powerpc/mm/kasan/init_book3s_64.c
@@ -99,4 +99,6 @@ void __init kasan_init(void)
 	pr_info("KASAN init done\n");
 }
 
+void __init kasan_early_init(void) { }
+
 void __init kasan_late_init(void) { }
diff --git a/arch/powerpc/platforms/Kconfig.cputype b/arch/powerpc/platforms/Kconfig.cputype
index 9e2df4b66478..383ed4fe6013 100644
--- a/arch/powerpc/platforms/Kconfig.cputype
+++ b/arch/powerpc/platforms/Kconfig.cputype
@@ -2,7 +2,6 @@
 config PPC32
 	bool
 	default y if !PPC64
-	select KASAN_VMALLOC if KASAN && MODULES
 
 config PPC64
 	bool "64-bit kernel"
-- 
2.36.1

