Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CF3D2855F8A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Feb 2024 11:39:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TbBQY5RXpz86K5
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Feb 2024 21:39:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=ryan.roberts@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TbBHJ2Nglz3vbq
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Feb 2024 21:33:32 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DD6651FB;
	Thu, 15 Feb 2024 02:33:41 -0800 (PST)
Received: from e125769.cambridge.arm.com (e125769.cambridge.arm.com [10.1.196.26])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D373C3F7B4;
	Thu, 15 Feb 2024 02:32:57 -0800 (PST)
From: Ryan Roberts <ryan.roberts@arm.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	James Morse <james.morse@arm.com>,
	Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Matthew Wilcox <willy@infradead.org>,
	Mark Rutland <mark.rutland@arm.com>,
	David Hildenbrand <david@redhat.com>,
	Kefeng Wang <wangkefeng.wang@huawei.com>,
	John Hubbard <jhubbard@nvidia.com>,
	Zi Yan <ziy@nvidia.com>,
	Barry Song <21cnbao@gmail.com>,
	Alistair Popple <apopple@nvidia.com>,
	Yang Shi <shy828301@gmail.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: [PATCH v6 12/18] arm64/mm: Wire up PTE_CONT for user mappings
Date: Thu, 15 Feb 2024 10:31:59 +0000
Message-Id: <20240215103205.2607016-13-ryan.roberts@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240215103205.2607016-1-ryan.roberts@arm.com>
References: <20240215103205.2607016-1-ryan.roberts@arm.com>
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
Cc: Ryan Roberts <ryan.roberts@arm.com>, x86@kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

With the ptep API sufficiently refactored, we can now introduce a new
"contpte" API layer, which transparently manages the PTE_CONT bit for
user mappings.

In this initial implementation, only suitable batches of PTEs, set via
set_ptes(), are mapped with the PTE_CONT bit. Any subsequent
modification of individual PTEs will cause an "unfold" operation to
repaint the contpte block as individual PTEs before performing the
requested operation. While, a modification of a single PTE could cause
the block of PTEs to which it belongs to become eligible for "folding"
into a contpte entry, "folding" is not performed in this initial
implementation due to the costs of checking the requirements are met.
Due to this, contpte mappings will degrade back to normal pte mappings
over time if/when protections are changed. This will be solved in a
future patch.

Since a contpte block only has a single access and dirty bit, the
semantic here changes slightly; when getting a pte (e.g. ptep_get())
that is part of a contpte mapping, the access and dirty information are
pulled from the block (so all ptes in the block return the same
access/dirty info). When changing the access/dirty info on a pte (e.g.
ptep_set_access_flags()) that is part of a contpte mapping, this change
will affect the whole contpte block. This is works fine in practice
since we guarantee that only a single folio is mapped by a contpte
block, and the core-mm tracks access/dirty information per folio.

In order for the public functions, which used to be pure inline, to
continue to be callable by modules, export all the contpte_* symbols
that are now called by those public inline functions.

The feature is enabled/disabled with the ARM64_CONTPTE Kconfig parameter
at build time. It defaults to enabled as long as its dependency,
TRANSPARENT_HUGEPAGE is also enabled. The core-mm depends upon
TRANSPARENT_HUGEPAGE to be able to allocate large folios, so if its not
enabled, then there is no chance of meeting the physical contiguity
requirement for contpte mappings.

Acked-by: Ard Biesheuvel <ardb@kernel.org>
Tested-by: John Hubbard <jhubbard@nvidia.com>
Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
---
 arch/arm64/Kconfig               |   9 +
 arch/arm64/include/asm/pgtable.h | 167 ++++++++++++++++++
 arch/arm64/mm/Makefile           |   1 +
 arch/arm64/mm/contpte.c          | 285 +++++++++++++++++++++++++++++++
 include/linux/efi.h              |   5 +
 5 files changed, 467 insertions(+)
 create mode 100644 arch/arm64/mm/contpte.c

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index e8275a40afbd..5a7ac1f37bdc 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -2229,6 +2229,15 @@ config UNWIND_PATCH_PAC_INTO_SCS
 	select UNWIND_TABLES
 	select DYNAMIC_SCS
 
+config ARM64_CONTPTE
+	bool "Contiguous PTE mappings for user memory" if EXPERT
+	depends on TRANSPARENT_HUGEPAGE
+	default y
+	help
+	  When enabled, user mappings are configured using the PTE contiguous
+	  bit, for any mappings that meet the size and alignment requirements.
+	  This reduces TLB pressure and improves performance.
+
 endmenu # "Kernel Features"
 
 menu "Boot options"
diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
index 7336d40a893a..831099cfc96b 100644
--- a/arch/arm64/include/asm/pgtable.h
+++ b/arch/arm64/include/asm/pgtable.h
@@ -133,6 +133,10 @@ static inline pteval_t __phys_to_pte_val(phys_addr_t phys)
  */
 #define pte_valid_not_user(pte) \
 	((pte_val(pte) & (PTE_VALID | PTE_USER | PTE_UXN)) == (PTE_VALID | PTE_UXN))
+/*
+ * Returns true if the pte is valid and has the contiguous bit set.
+ */
+#define pte_valid_cont(pte)	(pte_valid(pte) && pte_cont(pte))
 /*
  * Could the pte be present in the TLB? We must check mm_tlb_flush_pending
  * so that we don't erroneously return false for pages that have been
@@ -1128,6 +1132,167 @@ extern void ptep_modify_prot_commit(struct vm_area_struct *vma,
 				    unsigned long addr, pte_t *ptep,
 				    pte_t old_pte, pte_t new_pte);
 
+#ifdef CONFIG_ARM64_CONTPTE
+
+/*
+ * The contpte APIs are used to transparently manage the contiguous bit in ptes
+ * where it is possible and makes sense to do so. The PTE_CONT bit is considered
+ * a private implementation detail of the public ptep API (see below).
+ */
+extern void __contpte_try_unfold(struct mm_struct *mm, unsigned long addr,
+				pte_t *ptep, pte_t pte);
+extern pte_t contpte_ptep_get(pte_t *ptep, pte_t orig_pte);
+extern pte_t contpte_ptep_get_lockless(pte_t *orig_ptep);
+extern void contpte_set_ptes(struct mm_struct *mm, unsigned long addr,
+				pte_t *ptep, pte_t pte, unsigned int nr);
+extern int contpte_ptep_test_and_clear_young(struct vm_area_struct *vma,
+				unsigned long addr, pte_t *ptep);
+extern int contpte_ptep_clear_flush_young(struct vm_area_struct *vma,
+				unsigned long addr, pte_t *ptep);
+extern int contpte_ptep_set_access_flags(struct vm_area_struct *vma,
+				unsigned long addr, pte_t *ptep,
+				pte_t entry, int dirty);
+
+static inline void contpte_try_unfold(struct mm_struct *mm, unsigned long addr,
+					pte_t *ptep, pte_t pte)
+{
+	if (unlikely(pte_valid_cont(pte)))
+		__contpte_try_unfold(mm, addr, ptep, pte);
+}
+
+/*
+ * The below functions constitute the public API that arm64 presents to the
+ * core-mm to manipulate PTE entries within their page tables (or at least this
+ * is the subset of the API that arm64 needs to implement). These public
+ * versions will automatically and transparently apply the contiguous bit where
+ * it makes sense to do so. Therefore any users that are contig-aware (e.g.
+ * hugetlb, kernel mapper) should NOT use these APIs, but instead use the
+ * private versions, which are prefixed with double underscore. All of these
+ * APIs except for ptep_get_lockless() are expected to be called with the PTL
+ * held. Although the contiguous bit is considered private to the
+ * implementation, it is deliberately allowed to leak through the getters (e.g.
+ * ptep_get()), back to core code. This is required so that pte_leaf_size() can
+ * provide an accurate size for perf_get_pgtable_size(). But this leakage means
+ * its possible a pte will be passed to a setter with the contiguous bit set, so
+ * we explicitly clear the contiguous bit in those cases to prevent accidentally
+ * setting it in the pgtable.
+ */
+
+#define ptep_get ptep_get
+static inline pte_t ptep_get(pte_t *ptep)
+{
+	pte_t pte = __ptep_get(ptep);
+
+	if (likely(!pte_valid_cont(pte)))
+		return pte;
+
+	return contpte_ptep_get(ptep, pte);
+}
+
+#define ptep_get_lockless ptep_get_lockless
+static inline pte_t ptep_get_lockless(pte_t *ptep)
+{
+	pte_t pte = __ptep_get(ptep);
+
+	if (likely(!pte_valid_cont(pte)))
+		return pte;
+
+	return contpte_ptep_get_lockless(ptep);
+}
+
+static inline void set_pte(pte_t *ptep, pte_t pte)
+{
+	/*
+	 * We don't have the mm or vaddr so cannot unfold contig entries (since
+	 * it requires tlb maintenance). set_pte() is not used in core code, so
+	 * this should never even be called. Regardless do our best to service
+	 * any call and emit a warning if there is any attempt to set a pte on
+	 * top of an existing contig range.
+	 */
+	pte_t orig_pte = __ptep_get(ptep);
+
+	WARN_ON_ONCE(pte_valid_cont(orig_pte));
+	__set_pte(ptep, pte_mknoncont(pte));
+}
+
+#define set_ptes set_ptes
+static inline void set_ptes(struct mm_struct *mm, unsigned long addr,
+				pte_t *ptep, pte_t pte, unsigned int nr)
+{
+	pte = pte_mknoncont(pte);
+
+	if (likely(nr == 1)) {
+		contpte_try_unfold(mm, addr, ptep, __ptep_get(ptep));
+		__set_ptes(mm, addr, ptep, pte, 1);
+	} else {
+		contpte_set_ptes(mm, addr, ptep, pte, nr);
+	}
+}
+
+static inline void pte_clear(struct mm_struct *mm,
+				unsigned long addr, pte_t *ptep)
+{
+	contpte_try_unfold(mm, addr, ptep, __ptep_get(ptep));
+	__pte_clear(mm, addr, ptep);
+}
+
+#define __HAVE_ARCH_PTEP_GET_AND_CLEAR
+static inline pte_t ptep_get_and_clear(struct mm_struct *mm,
+				unsigned long addr, pte_t *ptep)
+{
+	contpte_try_unfold(mm, addr, ptep, __ptep_get(ptep));
+	return __ptep_get_and_clear(mm, addr, ptep);
+}
+
+#define __HAVE_ARCH_PTEP_TEST_AND_CLEAR_YOUNG
+static inline int ptep_test_and_clear_young(struct vm_area_struct *vma,
+				unsigned long addr, pte_t *ptep)
+{
+	pte_t orig_pte = __ptep_get(ptep);
+
+	if (likely(!pte_valid_cont(orig_pte)))
+		return __ptep_test_and_clear_young(vma, addr, ptep);
+
+	return contpte_ptep_test_and_clear_young(vma, addr, ptep);
+}
+
+#define __HAVE_ARCH_PTEP_CLEAR_YOUNG_FLUSH
+static inline int ptep_clear_flush_young(struct vm_area_struct *vma,
+				unsigned long addr, pte_t *ptep)
+{
+	pte_t orig_pte = __ptep_get(ptep);
+
+	if (likely(!pte_valid_cont(orig_pte)))
+		return __ptep_clear_flush_young(vma, addr, ptep);
+
+	return contpte_ptep_clear_flush_young(vma, addr, ptep);
+}
+
+#define __HAVE_ARCH_PTEP_SET_WRPROTECT
+static inline void ptep_set_wrprotect(struct mm_struct *mm,
+				unsigned long addr, pte_t *ptep)
+{
+	contpte_try_unfold(mm, addr, ptep, __ptep_get(ptep));
+	__ptep_set_wrprotect(mm, addr, ptep);
+}
+
+#define __HAVE_ARCH_PTEP_SET_ACCESS_FLAGS
+static inline int ptep_set_access_flags(struct vm_area_struct *vma,
+				unsigned long addr, pte_t *ptep,
+				pte_t entry, int dirty)
+{
+	pte_t orig_pte = __ptep_get(ptep);
+
+	entry = pte_mknoncont(entry);
+
+	if (likely(!pte_valid_cont(orig_pte)))
+		return __ptep_set_access_flags(vma, addr, ptep, entry, dirty);
+
+	return contpte_ptep_set_access_flags(vma, addr, ptep, entry, dirty);
+}
+
+#else /* CONFIG_ARM64_CONTPTE */
+
 #define ptep_get				__ptep_get
 #define set_pte					__set_pte
 #define set_ptes				__set_ptes
@@ -1143,6 +1308,8 @@ extern void ptep_modify_prot_commit(struct vm_area_struct *vma,
 #define __HAVE_ARCH_PTEP_SET_ACCESS_FLAGS
 #define ptep_set_access_flags			__ptep_set_access_flags
 
+#endif /* CONFIG_ARM64_CONTPTE */
+
 #endif /* !__ASSEMBLY__ */
 
 #endif /* __ASM_PGTABLE_H */
diff --git a/arch/arm64/mm/Makefile b/arch/arm64/mm/Makefile
index dbd1bc95967d..60454256945b 100644
--- a/arch/arm64/mm/Makefile
+++ b/arch/arm64/mm/Makefile
@@ -3,6 +3,7 @@ obj-y				:= dma-mapping.o extable.o fault.o init.o \
 				   cache.o copypage.o flush.o \
 				   ioremap.o mmap.o pgd.o mmu.o \
 				   context.o proc.o pageattr.o fixmap.o
+obj-$(CONFIG_ARM64_CONTPTE)	+= contpte.o
 obj-$(CONFIG_HUGETLB_PAGE)	+= hugetlbpage.o
 obj-$(CONFIG_PTDUMP_CORE)	+= ptdump.o
 obj-$(CONFIG_PTDUMP_DEBUGFS)	+= ptdump_debugfs.o
diff --git a/arch/arm64/mm/contpte.c b/arch/arm64/mm/contpte.c
new file mode 100644
index 000000000000..6d7f40667fa2
--- /dev/null
+++ b/arch/arm64/mm/contpte.c
@@ -0,0 +1,285 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2023 ARM Ltd.
+ */
+
+#include <linux/mm.h>
+#include <linux/efi.h>
+#include <linux/export.h>
+#include <asm/tlbflush.h>
+
+static inline bool mm_is_user(struct mm_struct *mm)
+{
+	/*
+	 * Don't attempt to apply the contig bit to kernel mappings, because
+	 * dynamically adding/removing the contig bit can cause page faults.
+	 * These racing faults are ok for user space, since they get serialized
+	 * on the PTL. But kernel mappings can't tolerate faults.
+	 */
+	if (unlikely(mm_is_efi(mm)))
+		return false;
+	return mm != &init_mm;
+}
+
+static inline pte_t *contpte_align_down(pte_t *ptep)
+{
+	return PTR_ALIGN_DOWN(ptep, sizeof(*ptep) * CONT_PTES);
+}
+
+static void contpte_convert(struct mm_struct *mm, unsigned long addr,
+			    pte_t *ptep, pte_t pte)
+{
+	struct vm_area_struct vma = TLB_FLUSH_VMA(mm, 0);
+	unsigned long start_addr;
+	pte_t *start_ptep;
+	int i;
+
+	start_ptep = ptep = contpte_align_down(ptep);
+	start_addr = addr = ALIGN_DOWN(addr, CONT_PTE_SIZE);
+	pte = pfn_pte(ALIGN_DOWN(pte_pfn(pte), CONT_PTES), pte_pgprot(pte));
+
+	for (i = 0; i < CONT_PTES; i++, ptep++, addr += PAGE_SIZE) {
+		pte_t ptent = __ptep_get_and_clear(mm, addr, ptep);
+
+		if (pte_dirty(ptent))
+			pte = pte_mkdirty(pte);
+
+		if (pte_young(ptent))
+			pte = pte_mkyoung(pte);
+	}
+
+	__flush_tlb_range(&vma, start_addr, addr, PAGE_SIZE, true, 3);
+
+	__set_ptes(mm, start_addr, start_ptep, pte, CONT_PTES);
+}
+
+void __contpte_try_unfold(struct mm_struct *mm, unsigned long addr,
+			pte_t *ptep, pte_t pte)
+{
+	/*
+	 * We have already checked that the ptes are contiguous in
+	 * contpte_try_unfold(), so just check that the mm is user space.
+	 */
+	if (!mm_is_user(mm))
+		return;
+
+	pte = pte_mknoncont(pte);
+	contpte_convert(mm, addr, ptep, pte);
+}
+EXPORT_SYMBOL(__contpte_try_unfold);
+
+pte_t contpte_ptep_get(pte_t *ptep, pte_t orig_pte)
+{
+	/*
+	 * Gather access/dirty bits, which may be populated in any of the ptes
+	 * of the contig range. We are guaranteed to be holding the PTL, so any
+	 * contiguous range cannot be unfolded or otherwise modified under our
+	 * feet.
+	 */
+
+	pte_t pte;
+	int i;
+
+	ptep = contpte_align_down(ptep);
+
+	for (i = 0; i < CONT_PTES; i++, ptep++) {
+		pte = __ptep_get(ptep);
+
+		if (pte_dirty(pte))
+			orig_pte = pte_mkdirty(orig_pte);
+
+		if (pte_young(pte))
+			orig_pte = pte_mkyoung(orig_pte);
+	}
+
+	return orig_pte;
+}
+EXPORT_SYMBOL(contpte_ptep_get);
+
+pte_t contpte_ptep_get_lockless(pte_t *orig_ptep)
+{
+	/*
+	 * Gather access/dirty bits, which may be populated in any of the ptes
+	 * of the contig range. We may not be holding the PTL, so any contiguous
+	 * range may be unfolded/modified/refolded under our feet. Therefore we
+	 * ensure we read a _consistent_ contpte range by checking that all ptes
+	 * in the range are valid and have CONT_PTE set, that all pfns are
+	 * contiguous and that all pgprots are the same (ignoring access/dirty).
+	 * If we find a pte that is not consistent, then we must be racing with
+	 * an update so start again. If the target pte does not have CONT_PTE
+	 * set then that is considered consistent on its own because it is not
+	 * part of a contpte range.
+	 */
+
+	pgprot_t orig_prot;
+	unsigned long pfn;
+	pte_t orig_pte;
+	pgprot_t prot;
+	pte_t *ptep;
+	pte_t pte;
+	int i;
+
+retry:
+	orig_pte = __ptep_get(orig_ptep);
+
+	if (!pte_valid_cont(orig_pte))
+		return orig_pte;
+
+	orig_prot = pte_pgprot(pte_mkold(pte_mkclean(orig_pte)));
+	ptep = contpte_align_down(orig_ptep);
+	pfn = pte_pfn(orig_pte) - (orig_ptep - ptep);
+
+	for (i = 0; i < CONT_PTES; i++, ptep++, pfn++) {
+		pte = __ptep_get(ptep);
+		prot = pte_pgprot(pte_mkold(pte_mkclean(pte)));
+
+		if (!pte_valid_cont(pte) ||
+		   pte_pfn(pte) != pfn ||
+		   pgprot_val(prot) != pgprot_val(orig_prot))
+			goto retry;
+
+		if (pte_dirty(pte))
+			orig_pte = pte_mkdirty(orig_pte);
+
+		if (pte_young(pte))
+			orig_pte = pte_mkyoung(orig_pte);
+	}
+
+	return orig_pte;
+}
+EXPORT_SYMBOL(contpte_ptep_get_lockless);
+
+void contpte_set_ptes(struct mm_struct *mm, unsigned long addr,
+					pte_t *ptep, pte_t pte, unsigned int nr)
+{
+	unsigned long next;
+	unsigned long end;
+	unsigned long pfn;
+	pgprot_t prot;
+
+	/*
+	 * The set_ptes() spec guarantees that when nr > 1, the initial state of
+	 * all ptes is not-present. Therefore we never need to unfold or
+	 * otherwise invalidate a range before we set the new ptes.
+	 * contpte_set_ptes() should never be called for nr < 2.
+	 */
+	VM_WARN_ON(nr == 1);
+
+	if (!mm_is_user(mm))
+		return __set_ptes(mm, addr, ptep, pte, nr);
+
+	end = addr + (nr << PAGE_SHIFT);
+	pfn = pte_pfn(pte);
+	prot = pte_pgprot(pte);
+
+	do {
+		next = pte_cont_addr_end(addr, end);
+		nr = (next - addr) >> PAGE_SHIFT;
+		pte = pfn_pte(pfn, prot);
+
+		if (((addr | next | (pfn << PAGE_SHIFT)) & ~CONT_PTE_MASK) == 0)
+			pte = pte_mkcont(pte);
+		else
+			pte = pte_mknoncont(pte);
+
+		__set_ptes(mm, addr, ptep, pte, nr);
+
+		addr = next;
+		ptep += nr;
+		pfn += nr;
+
+	} while (addr != end);
+}
+EXPORT_SYMBOL(contpte_set_ptes);
+
+int contpte_ptep_test_and_clear_young(struct vm_area_struct *vma,
+					unsigned long addr, pte_t *ptep)
+{
+	/*
+	 * ptep_clear_flush_young() technically requires us to clear the access
+	 * flag for a _single_ pte. However, the core-mm code actually tracks
+	 * access/dirty per folio, not per page. And since we only create a
+	 * contig range when the range is covered by a single folio, we can get
+	 * away with clearing young for the whole contig range here, so we avoid
+	 * having to unfold.
+	 */
+
+	int young = 0;
+	int i;
+
+	ptep = contpte_align_down(ptep);
+	addr = ALIGN_DOWN(addr, CONT_PTE_SIZE);
+
+	for (i = 0; i < CONT_PTES; i++, ptep++, addr += PAGE_SIZE)
+		young |= __ptep_test_and_clear_young(vma, addr, ptep);
+
+	return young;
+}
+EXPORT_SYMBOL(contpte_ptep_test_and_clear_young);
+
+int contpte_ptep_clear_flush_young(struct vm_area_struct *vma,
+					unsigned long addr, pte_t *ptep)
+{
+	int young;
+
+	young = contpte_ptep_test_and_clear_young(vma, addr, ptep);
+
+	if (young) {
+		/*
+		 * See comment in __ptep_clear_flush_young(); same rationale for
+		 * eliding the trailing DSB applies here.
+		 */
+		addr = ALIGN_DOWN(addr, CONT_PTE_SIZE);
+		__flush_tlb_range_nosync(vma, addr, addr + CONT_PTE_SIZE,
+					 PAGE_SIZE, true, 3);
+	}
+
+	return young;
+}
+EXPORT_SYMBOL(contpte_ptep_clear_flush_young);
+
+int contpte_ptep_set_access_flags(struct vm_area_struct *vma,
+					unsigned long addr, pte_t *ptep,
+					pte_t entry, int dirty)
+{
+	unsigned long start_addr;
+	pte_t orig_pte;
+	int i;
+
+	/*
+	 * Gather the access/dirty bits for the contiguous range. If nothing has
+	 * changed, its a noop.
+	 */
+	orig_pte = pte_mknoncont(ptep_get(ptep));
+	if (pte_val(orig_pte) == pte_val(entry))
+		return 0;
+
+	/*
+	 * We can fix up access/dirty bits without having to unfold the contig
+	 * range. But if the write bit is changing, we must unfold.
+	 */
+	if (pte_write(orig_pte) == pte_write(entry)) {
+		/*
+		 * For HW access management, we technically only need to update
+		 * the flag on a single pte in the range. But for SW access
+		 * management, we need to update all the ptes to prevent extra
+		 * faults. Avoid per-page tlb flush in __ptep_set_access_flags()
+		 * and instead flush the whole range at the end.
+		 */
+		ptep = contpte_align_down(ptep);
+		start_addr = addr = ALIGN_DOWN(addr, CONT_PTE_SIZE);
+
+		for (i = 0; i < CONT_PTES; i++, ptep++, addr += PAGE_SIZE)
+			__ptep_set_access_flags(vma, addr, ptep, entry, 0);
+
+		if (dirty)
+			__flush_tlb_range(vma, start_addr, addr,
+							PAGE_SIZE, true, 3);
+	} else {
+		__contpte_try_unfold(vma->vm_mm, addr, ptep, orig_pte);
+		__ptep_set_access_flags(vma, addr, ptep, entry, dirty);
+	}
+
+	return 1;
+}
+EXPORT_SYMBOL(contpte_ptep_set_access_flags);
diff --git a/include/linux/efi.h b/include/linux/efi.h
index c74f47711f0b..57da15e7429c 100644
--- a/include/linux/efi.h
+++ b/include/linux/efi.h
@@ -692,6 +692,11 @@ extern struct efi {
 
 extern struct mm_struct efi_mm;
 
+static inline bool mm_is_efi(struct mm_struct *mm)
+{
+	return IS_ENABLED(CONFIG_EFI) && mm == &efi_mm;
+}
+
 static inline int
 efi_guidcmp (efi_guid_t left, efi_guid_t right)
 {
-- 
2.25.1

