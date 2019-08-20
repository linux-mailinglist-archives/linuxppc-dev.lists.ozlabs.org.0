Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 89A059628C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Aug 2019 16:36:03 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46CYJ029D9zDqVP
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Aug 2019 00:36:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="KyPuUkHb"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46CXfx1DHhzDr4Y
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Aug 2019 00:07:21 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 46CXfs5W4yz9v0Gb;
 Tue, 20 Aug 2019 16:07:17 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=KyPuUkHb; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id zEHvrqKgPkFc; Tue, 20 Aug 2019 16:07:17 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 46CXfs4R5Fz9v0GZ;
 Tue, 20 Aug 2019 16:07:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1566310037; bh=oUO/aDmyjEB3lGKHxHc/AqAaeUwretvJKpCO5WCYLmQ=;
 h=In-Reply-To:References:From:Subject:To:Cc:Date:From;
 b=KyPuUkHbU5g0xV+Iaz7Vjms3iYjgbvbMxhSWW7DqoY8vIH4qADRGUX4gTJUI/61SS
 EBgAbggjUpbYTTCqghFKwDT+TwXvoUmNHCTxnz9XJ8y6+aaOYbiw7eX/YTu/UuBxa4
 us17SNjpODDw45OLdNLWFzlNTWY3Myys2LJ29Orw=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 0403B8B7D0;
 Tue, 20 Aug 2019 16:07:18 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id PFSeScEpjoQU; Tue, 20 Aug 2019 16:07:17 +0200 (CEST)
Received: from pc16032vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 9F6188B7C9;
 Tue, 20 Aug 2019 16:07:17 +0200 (CEST)
Received: by pc16032vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 7E3676B734; Tue, 20 Aug 2019 14:07:17 +0000 (UTC)
Message-Id: <b5c8b02ccefd4ede64c61b53cf64fb5dacb35740.1566309263.git.christophe.leroy@c-s.fr>
In-Reply-To: <cover.1566309262.git.christophe.leroy@c-s.fr>
References: <cover.1566309262.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH v2 09/12] powerpc/mm: Move ioremap functions out of
 pgtable_32/64.c
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 npiggin@gmail.com, hch@lst.de
Date: Tue, 20 Aug 2019 14:07:17 +0000 (UTC)
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

Create ioremap_32.c and ioremap_64.c and move respective ioremap
functions out of pgtable_32.c and pgtable_64.c

In the meantime, fix a few comments and changes a printk() to
pr_warn(). Also fix a few oversplitted lines.

Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
---
 arch/powerpc/mm/Makefile     |   2 +-
 arch/powerpc/mm/ioremap_32.c | 104 +++++++++++++++++++++++++++++++++++
 arch/powerpc/mm/ioremap_64.c | 123 +++++++++++++++++++++++++++++++++++++++++
 arch/powerpc/mm/pgtable_32.c |  99 ---------------------------------
 arch/powerpc/mm/pgtable_64.c | 128 +------------------------------------------
 5 files changed, 229 insertions(+), 227 deletions(-)
 create mode 100644 arch/powerpc/mm/ioremap_32.c
 create mode 100644 arch/powerpc/mm/ioremap_64.c

diff --git a/arch/powerpc/mm/Makefile b/arch/powerpc/mm/Makefile
index 29c682fe9144..5e147986400d 100644
--- a/arch/powerpc/mm/Makefile
+++ b/arch/powerpc/mm/Makefile
@@ -7,7 +7,7 @@ ccflags-$(CONFIG_PPC64)	:= $(NO_MINIMAL_TOC)
 
 obj-y				:= fault.o mem.o pgtable.o mmap.o \
 				   init_$(BITS).o pgtable_$(BITS).o \
-				   pgtable-frag.o ioremap.o \
+				   pgtable-frag.o ioremap.o ioremap_$(BITS).o \
 				   init-common.o mmu_context.o drmem.o
 obj-$(CONFIG_PPC_MMU_NOHASH)	+= nohash/
 obj-$(CONFIG_PPC_BOOK3S_32)	+= book3s32/
diff --git a/arch/powerpc/mm/ioremap_32.c b/arch/powerpc/mm/ioremap_32.c
new file mode 100644
index 000000000000..fb43ba71aa54
--- /dev/null
+++ b/arch/powerpc/mm/ioremap_32.c
@@ -0,0 +1,104 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+
+#include <linux/io.h>
+#include <linux/slab.h>
+#include <linux/vmalloc.h>
+
+#include <mm/mmu_decl.h>
+
+void __iomem *ioremap_wt(phys_addr_t addr, unsigned long size)
+{
+	pgprot_t prot = pgprot_cached_wthru(PAGE_KERNEL);
+
+	return __ioremap_caller(addr, size, prot, __builtin_return_address(0));
+}
+EXPORT_SYMBOL(ioremap_wt);
+
+void __iomem *
+__ioremap_caller(phys_addr_t addr, unsigned long size, pgprot_t prot, void *caller)
+{
+	unsigned long v, i;
+	phys_addr_t p;
+	int err;
+
+	/*
+	 * Choose an address to map it to.
+	 * Once the vmalloc system is running, we use it.
+	 * Before then, we use space going down from IOREMAP_TOP
+	 * (ioremap_bot records where we're up to).
+	 */
+	p = addr & PAGE_MASK;
+	size = PAGE_ALIGN(addr + size) - p;
+
+	/*
+	 * If the address lies within the first 16 MB, assume it's in ISA
+	 * memory space
+	 */
+	if (p < 16 * 1024 * 1024)
+		p += _ISA_MEM_BASE;
+
+#ifndef CONFIG_CRASH_DUMP
+	/*
+	 * Don't allow anybody to remap normal RAM that we're using.
+	 * mem_init() sets high_memory so only do the check after that.
+	 */
+	if (slab_is_available() && p <= virt_to_phys(high_memory - 1) &&
+	    page_is_ram(__phys_to_pfn(p))) {
+		pr_warn("%s(): phys addr 0x%llx is RAM lr %ps\n", __func__,
+			(unsigned long long)p, __builtin_return_address(0));
+		return NULL;
+	}
+#endif
+
+	if (size == 0)
+		return NULL;
+
+	/*
+	 * Is it already mapped?  Perhaps overlapped by a previous
+	 * mapping.
+	 */
+	v = p_block_mapped(p);
+	if (v)
+		goto out;
+
+	if (slab_is_available()) {
+		struct vm_struct *area;
+		area = get_vm_area_caller(size, VM_IOREMAP, caller);
+		if (area == 0)
+			return NULL;
+		area->phys_addr = p;
+		v = (unsigned long)area->addr;
+	} else {
+		v = (ioremap_bot -= size);
+	}
+
+	/*
+	 * Should check if it is a candidate for a BAT mapping
+	 */
+
+	err = 0;
+	for (i = 0; i < size && err == 0; i += PAGE_SIZE)
+		err = map_kernel_page(v + i, p + i, prot);
+	if (err) {
+		if (slab_is_available())
+			vunmap((void *)v);
+		return NULL;
+	}
+
+out:
+	return (void __iomem *)(v + ((unsigned long)addr & ~PAGE_MASK));
+}
+
+void iounmap(volatile void __iomem *addr)
+{
+	/*
+	 * If mapped by BATs then there is nothing to do.
+	 * Calling vfree() generates a benign warning.
+	 */
+	if (v_block_mapped((unsigned long)addr))
+		return;
+
+	if (addr > high_memory && (unsigned long)addr < ioremap_bot)
+		vunmap((void *)(PAGE_MASK & (unsigned long)addr));
+}
+EXPORT_SYMBOL(iounmap);
diff --git a/arch/powerpc/mm/ioremap_64.c b/arch/powerpc/mm/ioremap_64.c
new file mode 100644
index 000000000000..57f3b096143c
--- /dev/null
+++ b/arch/powerpc/mm/ioremap_64.c
@@ -0,0 +1,123 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+
+#include <linux/io.h>
+#include <linux/slab.h>
+#include <linux/vmalloc.h>
+
+int __weak ioremap_range(unsigned long ea, phys_addr_t pa, unsigned long size,
+			 pgprot_t prot, int nid)
+{
+	unsigned long i;
+
+	for (i = 0; i < size; i += PAGE_SIZE) {
+		int err = map_kernel_page(ea + i, pa + i, prot);
+		if (err) {
+			if (slab_is_available())
+				unmap_kernel_range(ea, size);
+			else
+				WARN_ON_ONCE(1); /* Should clean up */
+			return err;
+		}
+	}
+
+	return 0;
+}
+
+/**
+ * Low level function to establish the page tables for an IO mapping
+ */
+void __iomem *__ioremap_at(phys_addr_t pa, void *ea, unsigned long size, pgprot_t prot)
+{
+	/* We don't support the 4K PFN hack with ioremap */
+	if (pgprot_val(prot) & H_PAGE_4K_PFN)
+		return NULL;
+
+	if ((ea + size) >= (void *)IOREMAP_END) {
+		pr_warn("Outside the supported range\n");
+		return NULL;
+	}
+
+	WARN_ON(pa & ~PAGE_MASK);
+	WARN_ON(((unsigned long)ea) & ~PAGE_MASK);
+	WARN_ON(size & ~PAGE_MASK);
+
+	if (ioremap_range((unsigned long)ea, pa, size, prot, NUMA_NO_NODE))
+		return NULL;
+
+	return (void __iomem *)ea;
+}
+EXPORT_SYMBOL(__ioremap_at);
+
+/**
+ * Low level function to tear down the page tables for an IO mapping. This is
+ * used for mappings that are manipulated manually, like partial unmapping of
+ * PCI IOs or ISA space.
+ */
+void __iounmap_at(void *ea, unsigned long size)
+{
+	WARN_ON(((unsigned long)ea) & ~PAGE_MASK);
+	WARN_ON(size & ~PAGE_MASK);
+
+	unmap_kernel_range((unsigned long)ea, size);
+}
+EXPORT_SYMBOL(__iounmap_at);
+
+void __iomem *__ioremap_caller(phys_addr_t addr, unsigned long size,
+			       pgprot_t prot, void *caller)
+{
+	phys_addr_t paligned;
+	void __iomem *ret;
+
+	/*
+	 * Choose an address to map it to. Once the vmalloc system is running,
+	 * we use it. Before that, we map using addresses going up from
+	 * ioremap_bot.  vmalloc will use the addresses from IOREMAP_BASE
+	 * through ioremap_bot.
+	 */
+	paligned = addr & PAGE_MASK;
+	size = PAGE_ALIGN(addr + size) - paligned;
+
+	if (size == 0 || paligned == 0)
+		return NULL;
+
+	if (slab_is_available()) {
+		struct vm_struct *area;
+
+		area = __get_vm_area_caller(size, VM_IOREMAP, ioremap_bot,
+					    IOREMAP_END, caller);
+		if (area == NULL)
+			return NULL;
+
+		area->phys_addr = paligned;
+		ret = __ioremap_at(paligned, area->addr, size, prot);
+	} else {
+		ret = __ioremap_at(paligned, (void *)ioremap_bot, size, prot);
+		if (ret)
+			ioremap_bot += size;
+	}
+
+	if (ret)
+		ret += addr & ~PAGE_MASK;
+	return ret;
+}
+
+/*
+ * Unmap an IO region and remove it from vmalloc'd list.
+ * Access to IO memory should be serialized by driver.
+ */
+void iounmap(volatile void __iomem *token)
+{
+	void *addr;
+
+	if (!slab_is_available())
+		return;
+
+	addr = (void *)((unsigned long __force)PCI_FIX_ADDR(token) & PAGE_MASK);
+
+	if ((unsigned long)addr < ioremap_bot) {
+		pr_warn("Attempt to iounmap early bolted mapping at 0x%p\n", addr);
+		return;
+	}
+	vunmap(addr);
+}
+EXPORT_SYMBOL(iounmap);
diff --git a/arch/powerpc/mm/pgtable_32.c b/arch/powerpc/mm/pgtable_32.c
index daab57c78b22..6223d4c17301 100644
--- a/arch/powerpc/mm/pgtable_32.c
+++ b/arch/powerpc/mm/pgtable_32.c
@@ -27,7 +27,6 @@
 #include <asm/pgtable.h>
 #include <asm/pgalloc.h>
 #include <asm/fixmap.h>
-#include <asm/io.h>
 #include <asm/setup.h>
 #include <asm/sections.h>
 
@@ -35,104 +34,6 @@
 
 extern char etext[], _stext[], _sinittext[], _einittext[];
 
-void __iomem *
-ioremap_wt(phys_addr_t addr, unsigned long size)
-{
-	pgprot_t prot = pgprot_cached_wthru(PAGE_KERNEL);
-
-	return __ioremap_caller(addr, size, prot, __builtin_return_address(0));
-}
-EXPORT_SYMBOL(ioremap_wt);
-
-void __iomem *
-__ioremap_caller(phys_addr_t addr, unsigned long size, pgprot_t prot, void *caller)
-{
-	unsigned long v, i;
-	phys_addr_t p;
-	int err;
-
-	/*
-	 * Choose an address to map it to.
-	 * Once the vmalloc system is running, we use it.
-	 * Before then, we use space going down from IOREMAP_TOP
-	 * (ioremap_bot records where we're up to).
-	 */
-	p = addr & PAGE_MASK;
-	size = PAGE_ALIGN(addr + size) - p;
-
-	/*
-	 * If the address lies within the first 16 MB, assume it's in ISA
-	 * memory space
-	 */
-	if (p < 16*1024*1024)
-		p += _ISA_MEM_BASE;
-
-#ifndef CONFIG_CRASH_DUMP
-	/*
-	 * Don't allow anybody to remap normal RAM that we're using.
-	 * mem_init() sets high_memory so only do the check after that.
-	 */
-	if (slab_is_available() && p <= virt_to_phys(high_memory - 1) &&
-	    page_is_ram(__phys_to_pfn(p))) {
-		pr_warn("%s(): phys addr 0x%llx is RAM lr %ps\n", __func__,
-			(unsigned long long)p, __builtin_return_address(0));
-		return NULL;
-	}
-#endif
-
-	if (size == 0)
-		return NULL;
-
-	/*
-	 * Is it already mapped?  Perhaps overlapped by a previous
-	 * mapping.
-	 */
-	v = p_block_mapped(p);
-	if (v)
-		goto out;
-
-	if (slab_is_available()) {
-		struct vm_struct *area;
-		area = get_vm_area_caller(size, VM_IOREMAP, caller);
-		if (area == 0)
-			return NULL;
-		area->phys_addr = p;
-		v = (unsigned long) area->addr;
-	} else {
-		v = (ioremap_bot -= size);
-	}
-
-	/*
-	 * Should check if it is a candidate for a BAT mapping
-	 */
-
-	err = 0;
-	for (i = 0; i < size && err == 0; i += PAGE_SIZE)
-		err = map_kernel_page(v + i, p + i, prot);
-	if (err) {
-		if (slab_is_available())
-			vunmap((void *)v);
-		return NULL;
-	}
-
-out:
-	return (void __iomem *) (v + ((unsigned long)addr & ~PAGE_MASK));
-}
-
-void iounmap(volatile void __iomem *addr)
-{
-	/*
-	 * If mapped by BATs then there is nothing to do.
-	 * Calling vfree() generates a benign warning.
-	 */
-	if (v_block_mapped((unsigned long)addr))
-		return;
-
-	if (addr > high_memory && (unsigned long) addr < ioremap_bot)
-		vunmap((void *) (PAGE_MASK & (unsigned long)addr));
-}
-EXPORT_SYMBOL(iounmap);
-
 static void __init *early_alloc_pgtable(unsigned long size)
 {
 	void *ptr = memblock_alloc(size, size);
diff --git a/arch/powerpc/mm/pgtable_64.c b/arch/powerpc/mm/pgtable_64.c
index d865e053052d..e78832dce7bb 100644
--- a/arch/powerpc/mm/pgtable_64.c
+++ b/arch/powerpc/mm/pgtable_64.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
 /*
- *  This file contains ioremap and related functions for 64-bit machines.
+ *  This file contains pgtable related functions for 64-bit machines.
  *
  *  Derived from arch/ppc64/mm/init.c
  *    Copyright (C) 1995-1996 Gary Thomas (gdt@linuxppc.org)
@@ -34,7 +34,6 @@
 #include <asm/pgalloc.h>
 #include <asm/page.h>
 #include <asm/prom.h>
-#include <asm/io.h>
 #include <asm/mmu_context.h>
 #include <asm/pgtable.h>
 #include <asm/mmu.h>
@@ -100,131 +99,6 @@ unsigned long __pte_frag_size_shift;
 EXPORT_SYMBOL(__pte_frag_size_shift);
 #endif
 
-int __weak ioremap_range(unsigned long ea, phys_addr_t pa, unsigned long size, pgprot_t prot, int nid)
-{
-	unsigned long i;
-
-	for (i = 0; i < size; i += PAGE_SIZE) {
-		int err = map_kernel_page(ea + i, pa + i, prot);
-		if (err) {
-			if (slab_is_available())
-				unmap_kernel_range(ea, size);
-			else
-				WARN_ON_ONCE(1); /* Should clean up */
-			return err;
-		}
-	}
-
-	return 0;
-}
-
-/**
- * __ioremap_at - Low level function to establish the page tables
- *                for an IO mapping
- */
-void __iomem *__ioremap_at(phys_addr_t pa, void *ea, unsigned long size, pgprot_t prot)
-{
-	/* We don't support the 4K PFN hack with ioremap */
-	if (pgprot_val(prot) & H_PAGE_4K_PFN)
-		return NULL;
-
-	if ((ea + size) >= (void *)IOREMAP_END) {
-		pr_warn("Outside the supported range\n");
-		return NULL;
-	}
-
-	WARN_ON(pa & ~PAGE_MASK);
-	WARN_ON(((unsigned long)ea) & ~PAGE_MASK);
-	WARN_ON(size & ~PAGE_MASK);
-
-	if (ioremap_range((unsigned long)ea, pa, size, prot, NUMA_NO_NODE))
-		return NULL;
-
-	return (void __iomem *)ea;
-}
-
-/**
- * __iounmap_from - Low level function to tear down the page tables
- *                  for an IO mapping. This is used for mappings that
- *                  are manipulated manually, like partial unmapping of
- *                  PCI IOs or ISA space.
- */
-void __iounmap_at(void *ea, unsigned long size)
-{
-	WARN_ON(((unsigned long)ea) & ~PAGE_MASK);
-	WARN_ON(size & ~PAGE_MASK);
-
-	unmap_kernel_range((unsigned long)ea, size);
-}
-
-void __iomem * __ioremap_caller(phys_addr_t addr, unsigned long size,
-				pgprot_t prot, void *caller)
-{
-	phys_addr_t paligned;
-	void __iomem *ret;
-
-	/*
-	 * Choose an address to map it to.
-	 * Once the imalloc system is running, we use it.
-	 * Before that, we map using addresses going
-	 * up from ioremap_bot.  imalloc will use
-	 * the addresses from ioremap_bot through
-	 * IMALLOC_END
-	 * 
-	 */
-	paligned = addr & PAGE_MASK;
-	size = PAGE_ALIGN(addr + size) - paligned;
-
-	if ((size == 0) || (paligned == 0))
-		return NULL;
-
-	if (slab_is_available()) {
-		struct vm_struct *area;
-
-		area = __get_vm_area_caller(size, VM_IOREMAP,
-					    ioremap_bot, IOREMAP_END,
-					    caller);
-		if (area == NULL)
-			return NULL;
-
-		area->phys_addr = paligned;
-		ret = __ioremap_at(paligned, area->addr, size, prot);
-	} else {
-		ret = __ioremap_at(paligned, (void *)ioremap_bot, size, prot);
-		if (ret)
-			ioremap_bot += size;
-	}
-
-	if (ret)
-		ret += addr & ~PAGE_MASK;
-	return ret;
-}
-
-/*  
- * Unmap an IO region and remove it from imalloc'd list.
- * Access to IO memory should be serialized by driver.
- */
-void iounmap(volatile void __iomem *token)
-{
-	void *addr;
-
-	if (!slab_is_available())
-		return;
-	
-	addr = (void *) ((unsigned long __force)
-			 PCI_FIX_ADDR(token) & PAGE_MASK);
-	if ((unsigned long)addr < ioremap_bot) {
-		printk(KERN_WARNING "Attempt to iounmap early bolted mapping"
-		       " at 0x%p\n", addr);
-		return;
-	}
-	vunmap(addr);
-}
-
-EXPORT_SYMBOL(__ioremap_at);
-EXPORT_SYMBOL(iounmap);
-EXPORT_SYMBOL(__iounmap_at);
-
 #ifndef __PAGETABLE_PUD_FOLDED
 /* 4 level page table */
 struct page *pgd_page(pgd_t pgd)
-- 
2.13.3

