Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DC7A35886F
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Apr 2021 17:30:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FGQFg0MWXz3bvl
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Apr 2021 01:30:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FGQFK0rd0z2y6F
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Apr 2021 01:30:28 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4FGQFD3Wrwz9txf3;
 Thu,  8 Apr 2021 17:30:24 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id oIT1fmuhsLP7; Thu,  8 Apr 2021 17:30:24 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4FGQFD1Xmxz9txf2;
 Thu,  8 Apr 2021 17:30:24 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id C51D38B7D1;
 Thu,  8 Apr 2021 17:30:25 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id DiUpoiiZRlMH; Thu,  8 Apr 2021 17:30:25 +0200 (CEST)
Received: from po16121vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 41CBF8B7D4;
 Thu,  8 Apr 2021 17:30:25 +0200 (CEST)
Received: by po16121vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 0151E679BA; Thu,  8 Apr 2021 15:30:24 +0000 (UTC)
Message-Id: <7bf6f1600acad146e541a4e220940062f2e5b03d.1617895813.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v2 1/9] powerpc/mem: Move cache flushing functions into
 mm/cacheflush.c
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Thu,  8 Apr 2021 15:30:24 +0000 (UTC)
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

Cache flushing functions are in the middle of completely
unrelated stuff in mm/mem.c

Create a dedicated mm/cacheflush.c for those functions.

Also cleanup the list of included headers.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/mm/Makefile     |   3 +-
 arch/powerpc/mm/cacheflush.c | 255 +++++++++++++++++++++++++++++++
 arch/powerpc/mm/mem.c        | 281 -----------------------------------
 3 files changed, 257 insertions(+), 282 deletions(-)
 create mode 100644 arch/powerpc/mm/cacheflush.c

diff --git a/arch/powerpc/mm/Makefile b/arch/powerpc/mm/Makefile
index 3b4e9e4e25ea..c3df3a8501d4 100644
--- a/arch/powerpc/mm/Makefile
+++ b/arch/powerpc/mm/Makefile
@@ -8,7 +8,8 @@ ccflags-$(CONFIG_PPC64)	:= $(NO_MINIMAL_TOC)
 obj-y				:= fault.o mem.o pgtable.o mmap.o maccess.o \
 				   init_$(BITS).o pgtable_$(BITS).o \
 				   pgtable-frag.o ioremap.o ioremap_$(BITS).o \
-				   init-common.o mmu_context.o drmem.o
+				   init-common.o mmu_context.o drmem.o \
+				   cacheflush.o
 obj-$(CONFIG_PPC_MMU_NOHASH)	+= nohash/
 obj-$(CONFIG_PPC_BOOK3S_32)	+= book3s32/
 obj-$(CONFIG_PPC_BOOK3S_64)	+= book3s64/
diff --git a/arch/powerpc/mm/cacheflush.c b/arch/powerpc/mm/cacheflush.c
new file mode 100644
index 000000000000..40613d2fda37
--- /dev/null
+++ b/arch/powerpc/mm/cacheflush.c
@@ -0,0 +1,255 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+
+#include <linux/highmem.h>
+#include <linux/kprobes.h>
+
+/**
+ * flush_coherent_icache() - if a CPU has a coherent icache, flush it
+ * @addr: The base address to use (can be any valid address, the whole cache will be flushed)
+ * Return true if the cache was flushed, false otherwise
+ */
+static inline bool flush_coherent_icache(unsigned long addr)
+{
+	/*
+	 * For a snooping icache, we still need a dummy icbi to purge all the
+	 * prefetched instructions from the ifetch buffers. We also need a sync
+	 * before the icbi to order the the actual stores to memory that might
+	 * have modified instructions with the icbi.
+	 */
+	if (cpu_has_feature(CPU_FTR_COHERENT_ICACHE)) {
+		mb(); /* sync */
+		allow_read_from_user((const void __user *)addr, L1_CACHE_BYTES);
+		icbi((void *)addr);
+		prevent_read_from_user((const void __user *)addr, L1_CACHE_BYTES);
+		mb(); /* sync */
+		isync();
+		return true;
+	}
+
+	return false;
+}
+
+/**
+ * invalidate_icache_range() - Flush the icache by issuing icbi across an address range
+ * @start: the start address
+ * @stop: the stop address (exclusive)
+ */
+static void invalidate_icache_range(unsigned long start, unsigned long stop)
+{
+	unsigned long shift = l1_icache_shift();
+	unsigned long bytes = l1_icache_bytes();
+	char *addr = (char *)(start & ~(bytes - 1));
+	unsigned long size = stop - (unsigned long)addr + (bytes - 1);
+	unsigned long i;
+
+	for (i = 0; i < size >> shift; i++, addr += bytes)
+		icbi(addr);
+
+	mb(); /* sync */
+	isync();
+}
+
+/**
+ * flush_icache_range: Write any modified data cache blocks out to memory
+ * and invalidate the corresponding blocks in the instruction cache
+ *
+ * Generic code will call this after writing memory, before executing from it.
+ *
+ * @start: the start address
+ * @stop: the stop address (exclusive)
+ */
+void flush_icache_range(unsigned long start, unsigned long stop)
+{
+	if (flush_coherent_icache(start))
+		return;
+
+	clean_dcache_range(start, stop);
+
+	if (IS_ENABLED(CONFIG_44x)) {
+		/*
+		 * Flash invalidate on 44x because we are passed kmapped
+		 * addresses and this doesn't work for userspace pages due to
+		 * the virtually tagged icache.
+		 */
+		iccci((void *)start);
+		mb(); /* sync */
+		isync();
+	} else
+		invalidate_icache_range(start, stop);
+}
+EXPORT_SYMBOL(flush_icache_range);
+
+#if !defined(CONFIG_PPC_8xx) && !defined(CONFIG_PPC64)
+/**
+ * flush_dcache_icache_phys() - Flush a page by it's physical address
+ * @physaddr: the physical address of the page
+ */
+static void flush_dcache_icache_phys(unsigned long physaddr)
+{
+	unsigned long bytes = l1_dcache_bytes();
+	unsigned long nb = PAGE_SIZE / bytes;
+	unsigned long addr = physaddr & PAGE_MASK;
+	unsigned long msr, msr0;
+	unsigned long loop1 = addr, loop2 = addr;
+
+	msr0 = mfmsr();
+	msr = msr0 & ~MSR_DR;
+	/*
+	 * This must remain as ASM to prevent potential memory accesses
+	 * while the data MMU is disabled
+	 */
+	asm volatile(
+		"   mtctr %2;\n"
+		"   mtmsr %3;\n"
+		"   isync;\n"
+		"0: dcbst   0, %0;\n"
+		"   addi    %0, %0, %4;\n"
+		"   bdnz    0b;\n"
+		"   sync;\n"
+		"   mtctr %2;\n"
+		"1: icbi    0, %1;\n"
+		"   addi    %1, %1, %4;\n"
+		"   bdnz    1b;\n"
+		"   sync;\n"
+		"   mtmsr %5;\n"
+		"   isync;\n"
+		: "+&r" (loop1), "+&r" (loop2)
+		: "r" (nb), "r" (msr), "i" (bytes), "r" (msr0)
+		: "ctr", "memory");
+}
+NOKPROBE_SYMBOL(flush_dcache_icache_phys)
+#endif // !defined(CONFIG_PPC_8xx) && !defined(CONFIG_PPC64)
+
+/*
+ * This is called when a page has been modified by the kernel.
+ * It just marks the page as not i-cache clean.  We do the i-cache
+ * flush later when the page is given to a user process, if necessary.
+ */
+void flush_dcache_page(struct page *page)
+{
+	if (cpu_has_feature(CPU_FTR_COHERENT_ICACHE))
+		return;
+	/* avoid an atomic op if possible */
+	if (test_bit(PG_dcache_clean, &page->flags))
+		clear_bit(PG_dcache_clean, &page->flags);
+}
+EXPORT_SYMBOL(flush_dcache_page);
+
+static void flush_dcache_icache_hugepage(struct page *page)
+{
+	int i;
+	void *start;
+
+	BUG_ON(!PageCompound(page));
+
+	for (i = 0; i < compound_nr(page); i++) {
+		if (!PageHighMem(page)) {
+			__flush_dcache_icache(page_address(page+i));
+		} else {
+			start = kmap_atomic(page+i);
+			__flush_dcache_icache(start);
+			kunmap_atomic(start);
+		}
+	}
+}
+
+void flush_dcache_icache_page(struct page *page)
+{
+
+	if (PageCompound(page))
+		return flush_dcache_icache_hugepage(page);
+
+#if defined(CONFIG_PPC_8xx) || defined(CONFIG_PPC64)
+	/* On 8xx there is no need to kmap since highmem is not supported */
+	__flush_dcache_icache(page_address(page));
+#else
+	if (IS_ENABLED(CONFIG_BOOKE) || sizeof(phys_addr_t) > sizeof(void *)) {
+		void *start = kmap_atomic(page);
+		__flush_dcache_icache(start);
+		kunmap_atomic(start);
+	} else {
+		unsigned long addr = page_to_pfn(page) << PAGE_SHIFT;
+
+		if (flush_coherent_icache(addr))
+			return;
+		flush_dcache_icache_phys(addr);
+	}
+#endif
+}
+EXPORT_SYMBOL(flush_dcache_icache_page);
+
+/**
+ * __flush_dcache_icache(): Flush a particular page from the data cache to RAM.
+ * Note: this is necessary because the instruction cache does *not*
+ * snoop from the data cache.
+ *
+ * @page: the address of the page to flush
+ */
+void __flush_dcache_icache(void *p)
+{
+	unsigned long addr = (unsigned long)p;
+
+	if (flush_coherent_icache(addr))
+		return;
+
+	clean_dcache_range(addr, addr + PAGE_SIZE);
+
+	/*
+	 * We don't flush the icache on 44x. Those have a virtual icache and we
+	 * don't have access to the virtual address here (it's not the page
+	 * vaddr but where it's mapped in user space). The flushing of the
+	 * icache on these is handled elsewhere, when a change in the address
+	 * space occurs, before returning to user space.
+	 */
+
+	if (mmu_has_feature(MMU_FTR_TYPE_44x))
+		return;
+
+	invalidate_icache_range(addr, addr + PAGE_SIZE);
+}
+
+void clear_user_page(void *page, unsigned long vaddr, struct page *pg)
+{
+	clear_page(page);
+
+	/*
+	 * We shouldn't have to do this, but some versions of glibc
+	 * require it (ld.so assumes zero filled pages are icache clean)
+	 * - Anton
+	 */
+	flush_dcache_page(pg);
+}
+EXPORT_SYMBOL(clear_user_page);
+
+void copy_user_page(void *vto, void *vfrom, unsigned long vaddr,
+		    struct page *pg)
+{
+	copy_page(vto, vfrom);
+
+	/*
+	 * We should be able to use the following optimisation, however
+	 * there are two problems.
+	 * Firstly a bug in some versions of binutils meant PLT sections
+	 * were not marked executable.
+	 * Secondly the first word in the GOT section is blrl, used
+	 * to establish the GOT address. Until recently the GOT was
+	 * not marked executable.
+	 * - Anton
+	 */
+#if 0
+	if (!vma->vm_file && ((vma->vm_flags & VM_EXEC) == 0))
+		return;
+#endif
+
+	flush_dcache_page(pg);
+}
+
+void flush_icache_user_page(struct vm_area_struct *vma, struct page *page,
+			     unsigned long addr, int len)
+{
+	unsigned long maddr;
+
+	maddr = (unsigned long) kmap(page) + (addr & ~PAGE_MASK);
+	flush_icache_range(maddr, maddr + len);
+	kunmap(page);
+}
diff --git a/arch/powerpc/mm/mem.c b/arch/powerpc/mm/mem.c
index 7a59a5c9aa5d..6564b4d81324 100644
--- a/arch/powerpc/mm/mem.c
+++ b/arch/powerpc/mm/mem.c
@@ -12,45 +12,15 @@
  *    Copyright (C) 1991, 1992, 1993, 1994  Linus Torvalds
  */
 
-#include <linux/export.h>
-#include <linux/sched.h>
-#include <linux/kernel.h>
-#include <linux/errno.h>
-#include <linux/string.h>
-#include <linux/gfp.h>
-#include <linux/types.h>
-#include <linux/mm.h>
-#include <linux/stddef.h>
-#include <linux/init.h>
 #include <linux/memblock.h>
 #include <linux/highmem.h>
-#include <linux/initrd.h>
-#include <linux/pagemap.h>
 #include <linux/suspend.h>
-#include <linux/hugetlb.h>
-#include <linux/slab.h>
-#include <linux/vmalloc.h>
-#include <linux/memremap.h>
 #include <linux/dma-direct.h>
-#include <linux/kprobes.h>
 
-#include <asm/prom.h>
-#include <asm/io.h>
-#include <asm/mmu_context.h>
-#include <asm/mmu.h>
-#include <asm/smp.h>
 #include <asm/machdep.h>
-#include <asm/btext.h>
-#include <asm/tlb.h>
-#include <asm/sections.h>
-#include <asm/sparsemem.h>
-#include <asm/vdso.h>
-#include <asm/fixmap.h>
-#include <asm/swiotlb.h>
 #include <asm/rtas.h>
 #include <asm/kasan.h>
 #include <asm/svm.h>
-#include <asm/mmzone.h>
 
 #include <mm/mmu_decl.h>
 
@@ -340,257 +310,6 @@ void free_initmem(void)
 	free_initmem_default(POISON_FREE_INITMEM);
 }
 
-/**
- * flush_coherent_icache() - if a CPU has a coherent icache, flush it
- * @addr: The base address to use (can be any valid address, the whole cache will be flushed)
- * Return true if the cache was flushed, false otherwise
- */
-static inline bool flush_coherent_icache(unsigned long addr)
-{
-	/*
-	 * For a snooping icache, we still need a dummy icbi to purge all the
-	 * prefetched instructions from the ifetch buffers. We also need a sync
-	 * before the icbi to order the the actual stores to memory that might
-	 * have modified instructions with the icbi.
-	 */
-	if (cpu_has_feature(CPU_FTR_COHERENT_ICACHE)) {
-		mb(); /* sync */
-		allow_read_from_user((const void __user *)addr, L1_CACHE_BYTES);
-		icbi((void *)addr);
-		prevent_read_from_user((const void __user *)addr, L1_CACHE_BYTES);
-		mb(); /* sync */
-		isync();
-		return true;
-	}
-
-	return false;
-}
-
-/**
- * invalidate_icache_range() - Flush the icache by issuing icbi across an address range
- * @start: the start address
- * @stop: the stop address (exclusive)
- */
-static void invalidate_icache_range(unsigned long start, unsigned long stop)
-{
-	unsigned long shift = l1_icache_shift();
-	unsigned long bytes = l1_icache_bytes();
-	char *addr = (char *)(start & ~(bytes - 1));
-	unsigned long size = stop - (unsigned long)addr + (bytes - 1);
-	unsigned long i;
-
-	for (i = 0; i < size >> shift; i++, addr += bytes)
-		icbi(addr);
-
-	mb(); /* sync */
-	isync();
-}
-
-/**
- * flush_icache_range: Write any modified data cache blocks out to memory
- * and invalidate the corresponding blocks in the instruction cache
- *
- * Generic code will call this after writing memory, before executing from it.
- *
- * @start: the start address
- * @stop: the stop address (exclusive)
- */
-void flush_icache_range(unsigned long start, unsigned long stop)
-{
-	if (flush_coherent_icache(start))
-		return;
-
-	clean_dcache_range(start, stop);
-
-	if (IS_ENABLED(CONFIG_44x)) {
-		/*
-		 * Flash invalidate on 44x because we are passed kmapped
-		 * addresses and this doesn't work for userspace pages due to
-		 * the virtually tagged icache.
-		 */
-		iccci((void *)start);
-		mb(); /* sync */
-		isync();
-	} else
-		invalidate_icache_range(start, stop);
-}
-EXPORT_SYMBOL(flush_icache_range);
-
-#if !defined(CONFIG_PPC_8xx) && !defined(CONFIG_PPC64)
-/**
- * flush_dcache_icache_phys() - Flush a page by it's physical address
- * @physaddr: the physical address of the page
- */
-static void flush_dcache_icache_phys(unsigned long physaddr)
-{
-	unsigned long bytes = l1_dcache_bytes();
-	unsigned long nb = PAGE_SIZE / bytes;
-	unsigned long addr = physaddr & PAGE_MASK;
-	unsigned long msr, msr0;
-	unsigned long loop1 = addr, loop2 = addr;
-
-	msr0 = mfmsr();
-	msr = msr0 & ~MSR_DR;
-	/*
-	 * This must remain as ASM to prevent potential memory accesses
-	 * while the data MMU is disabled
-	 */
-	asm volatile(
-		"   mtctr %2;\n"
-		"   mtmsr %3;\n"
-		"   isync;\n"
-		"0: dcbst   0, %0;\n"
-		"   addi    %0, %0, %4;\n"
-		"   bdnz    0b;\n"
-		"   sync;\n"
-		"   mtctr %2;\n"
-		"1: icbi    0, %1;\n"
-		"   addi    %1, %1, %4;\n"
-		"   bdnz    1b;\n"
-		"   sync;\n"
-		"   mtmsr %5;\n"
-		"   isync;\n"
-		: "+&r" (loop1), "+&r" (loop2)
-		: "r" (nb), "r" (msr), "i" (bytes), "r" (msr0)
-		: "ctr", "memory");
-}
-NOKPROBE_SYMBOL(flush_dcache_icache_phys)
-#endif // !defined(CONFIG_PPC_8xx) && !defined(CONFIG_PPC64)
-
-/*
- * This is called when a page has been modified by the kernel.
- * It just marks the page as not i-cache clean.  We do the i-cache
- * flush later when the page is given to a user process, if necessary.
- */
-void flush_dcache_page(struct page *page)
-{
-	if (cpu_has_feature(CPU_FTR_COHERENT_ICACHE))
-		return;
-	/* avoid an atomic op if possible */
-	if (test_bit(PG_dcache_clean, &page->flags))
-		clear_bit(PG_dcache_clean, &page->flags);
-}
-EXPORT_SYMBOL(flush_dcache_page);
-
-static void flush_dcache_icache_hugepage(struct page *page)
-{
-	int i;
-	void *start;
-
-	BUG_ON(!PageCompound(page));
-
-	for (i = 0; i < compound_nr(page); i++) {
-		if (!PageHighMem(page)) {
-			__flush_dcache_icache(page_address(page+i));
-		} else {
-			start = kmap_atomic(page+i);
-			__flush_dcache_icache(start);
-			kunmap_atomic(start);
-		}
-	}
-}
-
-void flush_dcache_icache_page(struct page *page)
-{
-
-	if (PageCompound(page))
-		return flush_dcache_icache_hugepage(page);
-
-#if defined(CONFIG_PPC_8xx) || defined(CONFIG_PPC64)
-	/* On 8xx there is no need to kmap since highmem is not supported */
-	__flush_dcache_icache(page_address(page));
-#else
-	if (IS_ENABLED(CONFIG_BOOKE) || sizeof(phys_addr_t) > sizeof(void *)) {
-		void *start = kmap_atomic(page);
-		__flush_dcache_icache(start);
-		kunmap_atomic(start);
-	} else {
-		unsigned long addr = page_to_pfn(page) << PAGE_SHIFT;
-
-		if (flush_coherent_icache(addr))
-			return;
-		flush_dcache_icache_phys(addr);
-	}
-#endif
-}
-EXPORT_SYMBOL(flush_dcache_icache_page);
-
-/**
- * __flush_dcache_icache(): Flush a particular page from the data cache to RAM.
- * Note: this is necessary because the instruction cache does *not*
- * snoop from the data cache.
- *
- * @page: the address of the page to flush
- */
-void __flush_dcache_icache(void *p)
-{
-	unsigned long addr = (unsigned long)p;
-
-	if (flush_coherent_icache(addr))
-		return;
-
-	clean_dcache_range(addr, addr + PAGE_SIZE);
-
-	/*
-	 * We don't flush the icache on 44x. Those have a virtual icache and we
-	 * don't have access to the virtual address here (it's not the page
-	 * vaddr but where it's mapped in user space). The flushing of the
-	 * icache on these is handled elsewhere, when a change in the address
-	 * space occurs, before returning to user space.
-	 */
-
-	if (mmu_has_feature(MMU_FTR_TYPE_44x))
-		return;
-
-	invalidate_icache_range(addr, addr + PAGE_SIZE);
-}
-
-void clear_user_page(void *page, unsigned long vaddr, struct page *pg)
-{
-	clear_page(page);
-
-	/*
-	 * We shouldn't have to do this, but some versions of glibc
-	 * require it (ld.so assumes zero filled pages are icache clean)
-	 * - Anton
-	 */
-	flush_dcache_page(pg);
-}
-EXPORT_SYMBOL(clear_user_page);
-
-void copy_user_page(void *vto, void *vfrom, unsigned long vaddr,
-		    struct page *pg)
-{
-	copy_page(vto, vfrom);
-
-	/*
-	 * We should be able to use the following optimisation, however
-	 * there are two problems.
-	 * Firstly a bug in some versions of binutils meant PLT sections
-	 * were not marked executable.
-	 * Secondly the first word in the GOT section is blrl, used
-	 * to establish the GOT address. Until recently the GOT was
-	 * not marked executable.
-	 * - Anton
-	 */
-#if 0
-	if (!vma->vm_file && ((vma->vm_flags & VM_EXEC) == 0))
-		return;
-#endif
-
-	flush_dcache_page(pg);
-}
-
-void flush_icache_user_page(struct vm_area_struct *vma, struct page *page,
-			     unsigned long addr, int len)
-{
-	unsigned long maddr;
-
-	maddr = (unsigned long) kmap(page) + (addr & ~PAGE_MASK);
-	flush_icache_range(maddr, maddr + len);
-	kunmap(page);
-}
-
 /*
  * System memory should not be in /proc/iomem but various tools expect it
  * (eg kdump).
-- 
2.25.0

