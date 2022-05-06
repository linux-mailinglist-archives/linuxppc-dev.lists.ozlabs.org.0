Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A677E51D0CE
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 May 2022 07:38:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KvfW34Nx5z3c9G
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 May 2022 15:38:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.ru (client-ip=107.174.27.60; helo=ozlabs.ru;
 envelope-from=aik@ozlabs.ru; receiver=<UNKNOWN>)
Received: from ozlabs.ru (ozlabs.ru [107.174.27.60])
 by lists.ozlabs.org (Postfix) with ESMTP id 4KvfVY58wnz3bqZ
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 May 2022 15:38:11 +1000 (AEST)
Received: from fstn1-p1.ozlabs.ibm.com. (localhost [IPv6:::1])
 by ozlabs.ru (Postfix) with ESMTP id 0E3E180152;
 Fri,  6 May 2022 01:37:58 -0400 (EDT)
From: Alexey Kardashevskiy <aik@ozlabs.ru>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH kernel v2] KVM: PPC: Book3s: Retire H_PUT_TCE/etc real mode
 handlers
Date: Fri,  6 May 2022 15:37:55 +1000
Message-Id: <20220506053755.3820702-1-aik@ozlabs.ru>
X-Mailer: git-send-email 2.30.2
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>,
 Frederic Barrat <fbarrat@linux.ibm.com>, kvm-ppc@vger.kernel.org,
 Fabiano Rosas <farosas@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

LoPAPR defines guest visible IOMMU with hypercalls to use it -
H_PUT_TCE/etc. Implemented first on POWER7 where hypercalls would trap
in the KVM in the real mode (with MMU off). The problem with the real mode
is some memory is not available and some API usage crashed the host but
enabling MMU was an expensive operation.

The problems with the real mode handlers are:
1. Occasionally these cannot complete the request so the code is
copied+modified to work in the virtual mode, very little is shared;
2. The real mode handlers have to be linked into vmlinux to work;
3. An exception in real mode immediately reboots the machine.

If the small DMA window is used, the real mode handlers bring better
performance. However since POWER8, there has always been a bigger DMA
window which VMs use to map the entire VM memory to avoid calling
H_PUT_TCE. Such 1:1 mapping happens once and uses H_PUT_TCE_INDIRECT
(a bulk version of H_PUT_TCE) which virtual mode handler is even closer
to its real mode version.

On POWER9 hypercalls trap straight to the virtual mode so the real mode
handlers never execute on POWER9 and later CPUs.

So with the current use of the DMA windows and MMU improvements in
POWER9 and later, there is no point in duplicating the code.
The 32bit passed through devices may slow down but we do not have many
of these in practice. For example, with this applied, a 1Gbit ethernet
adapter still demostrates above 800Mbit/s of actual throughput.

This removes the real mode handlers from KVM and related code from
the powernv platform.

This updates the list of implemented hcalls in KVM-HV as the realmode
handlers are removed.

This changes ABI - kvmppc_h_get_tce() moves to the KVM module and
kvmppc_find_table() is static now.

Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
---
Changes:
v2:
* update the list of enabled hcalls as they are removed from .S
---
 arch/powerpc/kvm/Makefile                     |   3 -
 arch/powerpc/include/asm/iommu.h              |   6 +-
 arch/powerpc/include/asm/kvm_ppc.h            |   2 -
 arch/powerpc/include/asm/mmu_context.h        |   5 -
 arch/powerpc/platforms/powernv/pci.h          |   3 +-
 arch/powerpc/kernel/iommu.c                   |   4 +-
 arch/powerpc/kvm/book3s_64_vio.c              |  43 ++
 arch/powerpc/kvm/book3s_64_vio_hv.c           | 672 ------------------
 arch/powerpc/kvm/book3s_hv.c                  |   6 +
 arch/powerpc/mm/book3s64/iommu_api.c          |  68 --
 arch/powerpc/platforms/powernv/pci-ioda-tce.c |   5 +-
 arch/powerpc/platforms/powernv/pci-ioda.c     |  46 +-
 arch/powerpc/platforms/pseries/iommu.c        |   3 +-
 arch/powerpc/kvm/book3s_hv_rmhandlers.S       |  10 -
 14 files changed, 75 insertions(+), 801 deletions(-)
 delete mode 100644 arch/powerpc/kvm/book3s_64_vio_hv.c

diff --git a/arch/powerpc/kvm/Makefile b/arch/powerpc/kvm/Makefile
index 9bdfc8b50899..8e3681a86074 100644
--- a/arch/powerpc/kvm/Makefile
+++ b/arch/powerpc/kvm/Makefile
@@ -37,9 +37,6 @@ kvm-e500mc-objs := \
 	e500_emulate.o
 kvm-objs-$(CONFIG_KVM_E500MC) := $(kvm-e500mc-objs)
 
-kvm-book3s_64-builtin-objs-$(CONFIG_SPAPR_TCE_IOMMU) := \
-	book3s_64_vio_hv.o
-
 kvm-pr-y := \
 	fpu.o \
 	emulate.o \
diff --git a/arch/powerpc/include/asm/iommu.h b/arch/powerpc/include/asm/iommu.h
index d7912b66c874..7e29c73e3dd4 100644
--- a/arch/powerpc/include/asm/iommu.h
+++ b/arch/powerpc/include/asm/iommu.h
@@ -51,13 +51,11 @@ struct iommu_table_ops {
 	int (*xchg_no_kill)(struct iommu_table *tbl,
 			long index,
 			unsigned long *hpa,
-			enum dma_data_direction *direction,
-			bool realmode);
+			enum dma_data_direction *direction);
 
 	void (*tce_kill)(struct iommu_table *tbl,
 			unsigned long index,
-			unsigned long pages,
-			bool realmode);
+			unsigned long pages);
 
 	__be64 *(*useraddrptr)(struct iommu_table *tbl, long index, bool alloc);
 #endif
diff --git a/arch/powerpc/include/asm/kvm_ppc.h b/arch/powerpc/include/asm/kvm_ppc.h
index 838d4cb460b7..44200a27371b 100644
--- a/arch/powerpc/include/asm/kvm_ppc.h
+++ b/arch/powerpc/include/asm/kvm_ppc.h
@@ -177,8 +177,6 @@ extern void kvmppc_setup_partition_table(struct kvm *kvm);
 
 extern long kvm_vm_ioctl_create_spapr_tce(struct kvm *kvm,
 				struct kvm_create_spapr_tce_64 *args);
-extern struct kvmppc_spapr_tce_table *kvmppc_find_table(
-		struct kvm *kvm, unsigned long liobn);
 #define kvmppc_ioba_validate(stt, ioba, npages)                         \
 		(iommu_tce_check_ioba((stt)->page_shift, (stt)->offset, \
 				(stt)->size, (ioba), (npages)) ?        \
diff --git a/arch/powerpc/include/asm/mmu_context.h b/arch/powerpc/include/asm/mmu_context.h
index b8527a74bd4d..3f25bd3e14eb 100644
--- a/arch/powerpc/include/asm/mmu_context.h
+++ b/arch/powerpc/include/asm/mmu_context.h
@@ -34,15 +34,10 @@ extern void mm_iommu_init(struct mm_struct *mm);
 extern void mm_iommu_cleanup(struct mm_struct *mm);
 extern struct mm_iommu_table_group_mem_t *mm_iommu_lookup(struct mm_struct *mm,
 		unsigned long ua, unsigned long size);
-extern struct mm_iommu_table_group_mem_t *mm_iommu_lookup_rm(
-		struct mm_struct *mm, unsigned long ua, unsigned long size);
 extern struct mm_iommu_table_group_mem_t *mm_iommu_get(struct mm_struct *mm,
 		unsigned long ua, unsigned long entries);
 extern long mm_iommu_ua_to_hpa(struct mm_iommu_table_group_mem_t *mem,
 		unsigned long ua, unsigned int pageshift, unsigned long *hpa);
-extern long mm_iommu_ua_to_hpa_rm(struct mm_iommu_table_group_mem_t *mem,
-		unsigned long ua, unsigned int pageshift, unsigned long *hpa);
-extern void mm_iommu_ua_mark_dirty_rm(struct mm_struct *mm, unsigned long ua);
 extern bool mm_iommu_is_devmem(struct mm_struct *mm, unsigned long hpa,
 		unsigned int pageshift, unsigned long *size);
 extern long mm_iommu_mapped_inc(struct mm_iommu_table_group_mem_t *mem);
diff --git a/arch/powerpc/platforms/powernv/pci.h b/arch/powerpc/platforms/powernv/pci.h
index 966a9eb64339..f12643958b8d 100644
--- a/arch/powerpc/platforms/powernv/pci.h
+++ b/arch/powerpc/platforms/powernv/pci.h
@@ -311,8 +311,7 @@ extern int pnv_tce_build(struct iommu_table *tbl, long index, long npages,
 		unsigned long attrs);
 extern void pnv_tce_free(struct iommu_table *tbl, long index, long npages);
 extern int pnv_tce_xchg(struct iommu_table *tbl, long index,
-		unsigned long *hpa, enum dma_data_direction *direction,
-		bool alloc);
+		unsigned long *hpa, enum dma_data_direction *direction);
 extern __be64 *pnv_tce_useraddrptr(struct iommu_table *tbl, long index,
 		bool alloc);
 extern unsigned long pnv_tce_get(struct iommu_table *tbl, long index);
diff --git a/arch/powerpc/kernel/iommu.c b/arch/powerpc/kernel/iommu.c
index 07093b7cdcb9..6e090e87d6e6 100644
--- a/arch/powerpc/kernel/iommu.c
+++ b/arch/powerpc/kernel/iommu.c
@@ -1065,7 +1065,7 @@ extern long iommu_tce_xchg_no_kill(struct mm_struct *mm,
 	long ret;
 	unsigned long size = 0;
 
-	ret = tbl->it_ops->xchg_no_kill(tbl, entry, hpa, direction, false);
+	ret = tbl->it_ops->xchg_no_kill(tbl, entry, hpa, direction);
 	if (!ret && ((*direction == DMA_FROM_DEVICE) ||
 			(*direction == DMA_BIDIRECTIONAL)) &&
 			!mm_iommu_is_devmem(mm, *hpa, tbl->it_page_shift,
@@ -1080,7 +1080,7 @@ void iommu_tce_kill(struct iommu_table *tbl,
 		unsigned long entry, unsigned long pages)
 {
 	if (tbl->it_ops->tce_kill)
-		tbl->it_ops->tce_kill(tbl, entry, pages, false);
+		tbl->it_ops->tce_kill(tbl, entry, pages);
 }
 EXPORT_SYMBOL_GPL(iommu_tce_kill);
 
diff --git a/arch/powerpc/kvm/book3s_64_vio.c b/arch/powerpc/kvm/book3s_64_vio.c
index 85cfa6328222..d6589c4fe889 100644
--- a/arch/powerpc/kvm/book3s_64_vio.c
+++ b/arch/powerpc/kvm/book3s_64_vio.c
@@ -32,6 +32,18 @@
 #include <asm/tce.h>
 #include <asm/mmu_context.h>
 
+static struct kvmppc_spapr_tce_table *kvmppc_find_table(struct kvm *kvm,
+	unsigned long liobn)
+{
+	struct kvmppc_spapr_tce_table *stt;
+
+	list_for_each_entry_lockless(stt, &kvm->arch.spapr_tce_tables, list)
+		if (stt->liobn == liobn)
+			return stt;
+
+	return NULL;
+}
+
 static unsigned long kvmppc_tce_pages(unsigned long iommu_pages)
 {
 	return ALIGN(iommu_pages * sizeof(u64), PAGE_SIZE) / PAGE_SIZE;
@@ -753,3 +765,34 @@ long kvmppc_h_stuff_tce(struct kvm_vcpu *vcpu,
 	return ret;
 }
 EXPORT_SYMBOL_GPL(kvmppc_h_stuff_tce);
+
+long kvmppc_h_get_tce(struct kvm_vcpu *vcpu, unsigned long liobn,
+		      unsigned long ioba)
+{
+	struct kvmppc_spapr_tce_table *stt;
+	long ret;
+	unsigned long idx;
+	struct page *page;
+	u64 *tbl;
+
+	stt = kvmppc_find_table(vcpu->kvm, liobn);
+	if (!stt)
+		return H_TOO_HARD;
+
+	ret = kvmppc_ioba_validate(stt, ioba, 1);
+	if (ret != H_SUCCESS)
+		return ret;
+
+	idx = (ioba >> stt->page_shift) - stt->offset;
+	page = stt->pages[idx / TCES_PER_PAGE];
+	if (!page) {
+		vcpu->arch.regs.gpr[4] = 0;
+		return H_SUCCESS;
+	}
+	tbl = (u64 *)page_address(page);
+
+	vcpu->arch.regs.gpr[4] = tbl[idx % TCES_PER_PAGE];
+
+	return H_SUCCESS;
+}
+EXPORT_SYMBOL_GPL(kvmppc_h_get_tce);
diff --git a/arch/powerpc/kvm/book3s_64_vio_hv.c b/arch/powerpc/kvm/book3s_64_vio_hv.c
deleted file mode 100644
index fdeda6a9cff4..000000000000
--- a/arch/powerpc/kvm/book3s_64_vio_hv.c
+++ /dev/null
@@ -1,672 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*
- *
- * Copyright 2010 Paul Mackerras, IBM Corp. <paulus@au1.ibm.com>
- * Copyright 2011 David Gibson, IBM Corporation <dwg@au1.ibm.com>
- * Copyright 2016 Alexey Kardashevskiy, IBM Corporation <aik@au1.ibm.com>
- */
-
-#include <linux/types.h>
-#include <linux/string.h>
-#include <linux/kvm.h>
-#include <linux/kvm_host.h>
-#include <linux/highmem.h>
-#include <linux/gfp.h>
-#include <linux/slab.h>
-#include <linux/hugetlb.h>
-#include <linux/list.h>
-#include <linux/stringify.h>
-
-#include <asm/kvm_ppc.h>
-#include <asm/kvm_book3s.h>
-#include <asm/book3s/64/mmu-hash.h>
-#include <asm/mmu_context.h>
-#include <asm/hvcall.h>
-#include <asm/synch.h>
-#include <asm/ppc-opcode.h>
-#include <asm/udbg.h>
-#include <asm/iommu.h>
-#include <asm/tce.h>
-#include <asm/pte-walk.h>
-
-#ifdef CONFIG_BUG
-
-#define WARN_ON_ONCE_RM(condition)	({			\
-	static bool __section(".data.unlikely") __warned;	\
-	int __ret_warn_once = !!(condition);			\
-								\
-	if (unlikely(__ret_warn_once && !__warned)) {		\
-		__warned = true;				\
-		pr_err("WARN_ON_ONCE_RM: (%s) at %s:%u\n",	\
-				__stringify(condition),		\
-				__func__, __LINE__);		\
-		dump_stack();					\
-	}							\
-	unlikely(__ret_warn_once);				\
-})
-
-#else
-
-#define WARN_ON_ONCE_RM(condition) ({				\
-	int __ret_warn_on = !!(condition);			\
-	unlikely(__ret_warn_on);				\
-})
-
-#endif
-
-/*
- * Finds a TCE table descriptor by LIOBN.
- *
- * WARNING: This will be called in real or virtual mode on HV KVM and virtual
- *          mode on PR KVM
- */
-struct kvmppc_spapr_tce_table *kvmppc_find_table(struct kvm *kvm,
-		unsigned long liobn)
-{
-	struct kvmppc_spapr_tce_table *stt;
-
-	list_for_each_entry_lockless(stt, &kvm->arch.spapr_tce_tables, list)
-		if (stt->liobn == liobn)
-			return stt;
-
-	return NULL;
-}
-EXPORT_SYMBOL_GPL(kvmppc_find_table);
-
-#ifdef CONFIG_KVM_BOOK3S_HV_POSSIBLE
-static long kvmppc_rm_tce_to_ua(struct kvm *kvm,
-				unsigned long tce, unsigned long *ua)
-{
-	unsigned long gfn = tce >> PAGE_SHIFT;
-	struct kvm_memory_slot *memslot;
-
-	memslot = __gfn_to_memslot(kvm_memslots_raw(kvm), gfn);
-	if (!memslot)
-		return -EINVAL;
-
-	*ua = __gfn_to_hva_memslot(memslot, gfn) |
-		(tce & ~(PAGE_MASK | TCE_PCI_READ | TCE_PCI_WRITE));
-
-	return 0;
-}
-
-/*
- * Validates TCE address.
- * At the moment flags and page mask are validated.
- * As the host kernel does not access those addresses (just puts them
- * to the table and user space is supposed to process them), we can skip
- * checking other things (such as TCE is a guest RAM address or the page
- * was actually allocated).
- */
-static long kvmppc_rm_tce_validate(struct kvmppc_spapr_tce_table *stt,
-		unsigned long tce)
-{
-	unsigned long gpa = tce & ~(TCE_PCI_READ | TCE_PCI_WRITE);
-	enum dma_data_direction dir = iommu_tce_direction(tce);
-	struct kvmppc_spapr_tce_iommu_table *stit;
-	unsigned long ua = 0;
-
-	/* Allow userspace to poison TCE table */
-	if (dir == DMA_NONE)
-		return H_SUCCESS;
-
-	if (iommu_tce_check_gpa(stt->page_shift, gpa))
-		return H_PARAMETER;
-
-	if (kvmppc_rm_tce_to_ua(stt->kvm, tce, &ua))
-		return H_TOO_HARD;
-
-	list_for_each_entry_lockless(stit, &stt->iommu_tables, next) {
-		unsigned long hpa = 0;
-		struct mm_iommu_table_group_mem_t *mem;
-		long shift = stit->tbl->it_page_shift;
-
-		mem = mm_iommu_lookup_rm(stt->kvm->mm, ua, 1ULL << shift);
-		if (!mem)
-			return H_TOO_HARD;
-
-		if (mm_iommu_ua_to_hpa_rm(mem, ua, shift, &hpa))
-			return H_TOO_HARD;
-	}
-
-	return H_SUCCESS;
-}
-
-/* Note on the use of page_address() in real mode,
- *
- * It is safe to use page_address() in real mode on ppc64 because
- * page_address() is always defined as lowmem_page_address()
- * which returns __va(PFN_PHYS(page_to_pfn(page))) which is arithmetic
- * operation and does not access page struct.
- *
- * Theoretically page_address() could be defined different
- * but either WANT_PAGE_VIRTUAL or HASHED_PAGE_VIRTUAL
- * would have to be enabled.
- * WANT_PAGE_VIRTUAL is never enabled on ppc32/ppc64,
- * HASHED_PAGE_VIRTUAL could be enabled for ppc32 only and only
- * if CONFIG_HIGHMEM is defined. As CONFIG_SPARSEMEM_VMEMMAP
- * is not expected to be enabled on ppc32, page_address()
- * is safe for ppc32 as well.
- *
- * WARNING: This will be called in real-mode on HV KVM and virtual
- *          mode on PR KVM
- */
-static u64 *kvmppc_page_address(struct page *page)
-{
-#if defined(HASHED_PAGE_VIRTUAL) || defined(WANT_PAGE_VIRTUAL)
-#error TODO: fix to avoid page_address() here
-#endif
-	return (u64 *) page_address(page);
-}
-
-/*
- * Handles TCE requests for emulated devices.
- * Puts guest TCE values to the table and expects user space to convert them.
- * Cannot fail so kvmppc_rm_tce_validate must be called before it.
- */
-static void kvmppc_rm_tce_put(struct kvmppc_spapr_tce_table *stt,
-		unsigned long idx, unsigned long tce)
-{
-	struct page *page;
-	u64 *tbl;
-
-	idx -= stt->offset;
-	page = stt->pages[idx / TCES_PER_PAGE];
-	/*
-	 * kvmppc_rm_ioba_validate() allows pages not be allocated if TCE is
-	 * being cleared, otherwise it returns H_TOO_HARD and we skip this.
-	 */
-	if (!page) {
-		WARN_ON_ONCE_RM(tce != 0);
-		return;
-	}
-	tbl = kvmppc_page_address(page);
-
-	tbl[idx % TCES_PER_PAGE] = tce;
-}
-
-/*
- * TCEs pages are allocated in kvmppc_rm_tce_put() which won't be able to do so
- * in real mode.
- * Check if kvmppc_rm_tce_put() can succeed in real mode, i.e. a TCEs page is
- * allocated or not required (when clearing a tce entry).
- */
-static long kvmppc_rm_ioba_validate(struct kvmppc_spapr_tce_table *stt,
-		unsigned long ioba, unsigned long npages, bool clearing)
-{
-	unsigned long i, idx, sttpage, sttpages;
-	unsigned long ret = kvmppc_ioba_validate(stt, ioba, npages);
-
-	if (ret)
-		return ret;
-	/*
-	 * clearing==true says kvmppc_rm_tce_put won't be allocating pages
-	 * for empty tces.
-	 */
-	if (clearing)
-		return H_SUCCESS;
-
-	idx = (ioba >> stt->page_shift) - stt->offset;
-	sttpage = idx / TCES_PER_PAGE;
-	sttpages = ALIGN(idx % TCES_PER_PAGE + npages, TCES_PER_PAGE) /
-			TCES_PER_PAGE;
-	for (i = sttpage; i < sttpage + sttpages; ++i)
-		if (!stt->pages[i])
-			return H_TOO_HARD;
-
-	return H_SUCCESS;
-}
-
-static long iommu_tce_xchg_no_kill_rm(struct mm_struct *mm,
-		struct iommu_table *tbl,
-		unsigned long entry, unsigned long *hpa,
-		enum dma_data_direction *direction)
-{
-	long ret;
-
-	ret = tbl->it_ops->xchg_no_kill(tbl, entry, hpa, direction, true);
-
-	if (!ret && ((*direction == DMA_FROM_DEVICE) ||
-				(*direction == DMA_BIDIRECTIONAL))) {
-		__be64 *pua = IOMMU_TABLE_USERSPACE_ENTRY_RO(tbl, entry);
-		/*
-		 * kvmppc_rm_tce_iommu_do_map() updates the UA cache after
-		 * calling this so we still get here a valid UA.
-		 */
-		if (pua && *pua)
-			mm_iommu_ua_mark_dirty_rm(mm, be64_to_cpu(*pua));
-	}
-
-	return ret;
-}
-
-static void iommu_tce_kill_rm(struct iommu_table *tbl,
-		unsigned long entry, unsigned long pages)
-{
-	if (tbl->it_ops->tce_kill)
-		tbl->it_ops->tce_kill(tbl, entry, pages, true);
-}
-
-static void kvmppc_rm_clear_tce(struct kvm *kvm, struct kvmppc_spapr_tce_table *stt,
-		struct iommu_table *tbl, unsigned long entry)
-{
-	unsigned long i;
-	unsigned long subpages = 1ULL << (stt->page_shift - tbl->it_page_shift);
-	unsigned long io_entry = entry << (stt->page_shift - tbl->it_page_shift);
-
-	for (i = 0; i < subpages; ++i) {
-		unsigned long hpa = 0;
-		enum dma_data_direction dir = DMA_NONE;
-
-		iommu_tce_xchg_no_kill_rm(kvm->mm, tbl, io_entry + i, &hpa, &dir);
-	}
-}
-
-static long kvmppc_rm_tce_iommu_mapped_dec(struct kvm *kvm,
-		struct iommu_table *tbl, unsigned long entry)
-{
-	struct mm_iommu_table_group_mem_t *mem = NULL;
-	const unsigned long pgsize = 1ULL << tbl->it_page_shift;
-	__be64 *pua = IOMMU_TABLE_USERSPACE_ENTRY_RO(tbl, entry);
-
-	if (!pua)
-		/* it_userspace allocation might be delayed */
-		return H_TOO_HARD;
-
-	mem = mm_iommu_lookup_rm(kvm->mm, be64_to_cpu(*pua), pgsize);
-	if (!mem)
-		return H_TOO_HARD;
-
-	mm_iommu_mapped_dec(mem);
-
-	*pua = cpu_to_be64(0);
-
-	return H_SUCCESS;
-}
-
-static long kvmppc_rm_tce_iommu_do_unmap(struct kvm *kvm,
-		struct iommu_table *tbl, unsigned long entry)
-{
-	enum dma_data_direction dir = DMA_NONE;
-	unsigned long hpa = 0;
-	long ret;
-
-	if (iommu_tce_xchg_no_kill_rm(kvm->mm, tbl, entry, &hpa, &dir))
-		/*
-		 * real mode xchg can fail if struct page crosses
-		 * a page boundary
-		 */
-		return H_TOO_HARD;
-
-	if (dir == DMA_NONE)
-		return H_SUCCESS;
-
-	ret = kvmppc_rm_tce_iommu_mapped_dec(kvm, tbl, entry);
-	if (ret)
-		iommu_tce_xchg_no_kill_rm(kvm->mm, tbl, entry, &hpa, &dir);
-
-	return ret;
-}
-
-static long kvmppc_rm_tce_iommu_unmap(struct kvm *kvm,
-		struct kvmppc_spapr_tce_table *stt, struct iommu_table *tbl,
-		unsigned long entry)
-{
-	unsigned long i, ret = H_SUCCESS;
-	unsigned long subpages = 1ULL << (stt->page_shift - tbl->it_page_shift);
-	unsigned long io_entry = entry * subpages;
-
-	for (i = 0; i < subpages; ++i) {
-		ret = kvmppc_rm_tce_iommu_do_unmap(kvm, tbl, io_entry + i);
-		if (ret != H_SUCCESS)
-			break;
-	}
-
-	iommu_tce_kill_rm(tbl, io_entry, subpages);
-
-	return ret;
-}
-
-static long kvmppc_rm_tce_iommu_do_map(struct kvm *kvm, struct iommu_table *tbl,
-		unsigned long entry, unsigned long ua,
-		enum dma_data_direction dir)
-{
-	long ret;
-	unsigned long hpa = 0;
-	__be64 *pua = IOMMU_TABLE_USERSPACE_ENTRY_RO(tbl, entry);
-	struct mm_iommu_table_group_mem_t *mem;
-
-	if (!pua)
-		/* it_userspace allocation might be delayed */
-		return H_TOO_HARD;
-
-	mem = mm_iommu_lookup_rm(kvm->mm, ua, 1ULL << tbl->it_page_shift);
-	if (!mem)
-		return H_TOO_HARD;
-
-	if (WARN_ON_ONCE_RM(mm_iommu_ua_to_hpa_rm(mem, ua, tbl->it_page_shift,
-			&hpa)))
-		return H_TOO_HARD;
-
-	if (WARN_ON_ONCE_RM(mm_iommu_mapped_inc(mem)))
-		return H_TOO_HARD;
-
-	ret = iommu_tce_xchg_no_kill_rm(kvm->mm, tbl, entry, &hpa, &dir);
-	if (ret) {
-		mm_iommu_mapped_dec(mem);
-		/*
-		 * real mode xchg can fail if struct page crosses
-		 * a page boundary
-		 */
-		return H_TOO_HARD;
-	}
-
-	if (dir != DMA_NONE)
-		kvmppc_rm_tce_iommu_mapped_dec(kvm, tbl, entry);
-
-	*pua = cpu_to_be64(ua);
-
-	return 0;
-}
-
-static long kvmppc_rm_tce_iommu_map(struct kvm *kvm,
-		struct kvmppc_spapr_tce_table *stt, struct iommu_table *tbl,
-		unsigned long entry, unsigned long ua,
-		enum dma_data_direction dir)
-{
-	unsigned long i, pgoff, ret = H_SUCCESS;
-	unsigned long subpages = 1ULL << (stt->page_shift - tbl->it_page_shift);
-	unsigned long io_entry = entry * subpages;
-
-	for (i = 0, pgoff = 0; i < subpages;
-			++i, pgoff += IOMMU_PAGE_SIZE(tbl)) {
-
-		ret = kvmppc_rm_tce_iommu_do_map(kvm, tbl,
-				io_entry + i, ua + pgoff, dir);
-		if (ret != H_SUCCESS)
-			break;
-	}
-
-	iommu_tce_kill_rm(tbl, io_entry, subpages);
-
-	return ret;
-}
-
-long kvmppc_rm_h_put_tce(struct kvm_vcpu *vcpu, unsigned long liobn,
-		unsigned long ioba, unsigned long tce)
-{
-	struct kvmppc_spapr_tce_table *stt;
-	long ret;
-	struct kvmppc_spapr_tce_iommu_table *stit;
-	unsigned long entry, ua = 0;
-	enum dma_data_direction dir;
-
-	/* udbg_printf("H_PUT_TCE(): liobn=0x%lx ioba=0x%lx, tce=0x%lx\n", */
-	/* 	    liobn, ioba, tce); */
-
-	stt = kvmppc_find_table(vcpu->kvm, liobn);
-	if (!stt)
-		return H_TOO_HARD;
-
-	ret = kvmppc_rm_ioba_validate(stt, ioba, 1, tce == 0);
-	if (ret != H_SUCCESS)
-		return ret;
-
-	ret = kvmppc_rm_tce_validate(stt, tce);
-	if (ret != H_SUCCESS)
-		return ret;
-
-	dir = iommu_tce_direction(tce);
-	if ((dir != DMA_NONE) && kvmppc_rm_tce_to_ua(vcpu->kvm, tce, &ua))
-		return H_PARAMETER;
-
-	entry = ioba >> stt->page_shift;
-
-	list_for_each_entry_lockless(stit, &stt->iommu_tables, next) {
-		if (dir == DMA_NONE)
-			ret = kvmppc_rm_tce_iommu_unmap(vcpu->kvm, stt,
-					stit->tbl, entry);
-		else
-			ret = kvmppc_rm_tce_iommu_map(vcpu->kvm, stt,
-					stit->tbl, entry, ua, dir);
-
-		if (ret != H_SUCCESS) {
-			kvmppc_rm_clear_tce(vcpu->kvm, stt, stit->tbl, entry);
-			return ret;
-		}
-	}
-
-	kvmppc_rm_tce_put(stt, entry, tce);
-
-	return H_SUCCESS;
-}
-
-static long kvmppc_rm_ua_to_hpa(struct kvm_vcpu *vcpu, unsigned long mmu_seq,
-				unsigned long ua, unsigned long *phpa)
-{
-	pte_t *ptep, pte;
-	unsigned shift = 0;
-
-	/*
-	 * Called in real mode with MSR_EE = 0. We are safe here.
-	 * It is ok to do the lookup with arch.pgdir here, because
-	 * we are doing this on secondary cpus and current task there
-	 * is not the hypervisor. Also this is safe against THP in the
-	 * host, because an IPI to primary thread will wait for the secondary
-	 * to exit which will agains result in the below page table walk
-	 * to finish.
-	 */
-	/* an rmap lock won't make it safe. because that just ensure hash
-	 * page table entries are removed with rmap lock held. After that
-	 * mmu notifier returns and we go ahead and removing ptes from Qemu page table.
-	 */
-	ptep = find_kvm_host_pte(vcpu->kvm, mmu_seq, ua, &shift);
-	if (!ptep)
-		return -ENXIO;
-
-	pte = READ_ONCE(*ptep);
-	if (!pte_present(pte))
-		return -ENXIO;
-
-	if (!shift)
-		shift = PAGE_SHIFT;
-
-	/* Avoid handling anything potentially complicated in realmode */
-	if (shift > PAGE_SHIFT)
-		return -EAGAIN;
-
-	if (!pte_young(pte))
-		return -EAGAIN;
-
-	*phpa = (pte_pfn(pte) << PAGE_SHIFT) | (ua & ((1ULL << shift) - 1)) |
-			(ua & ~PAGE_MASK);
-
-	return 0;
-}
-
-long kvmppc_rm_h_put_tce_indirect(struct kvm_vcpu *vcpu,
-		unsigned long liobn, unsigned long ioba,
-		unsigned long tce_list,	unsigned long npages)
-{
-	struct kvm *kvm = vcpu->kvm;
-	struct kvmppc_spapr_tce_table *stt;
-	long i, ret = H_SUCCESS;
-	unsigned long tces, entry, ua = 0;
-	unsigned long mmu_seq;
-	bool prereg = false;
-	struct kvmppc_spapr_tce_iommu_table *stit;
-
-	/*
-	 * used to check for invalidations in progress
-	 */
-	mmu_seq = kvm->mmu_notifier_seq;
-	smp_rmb();
-
-	stt = kvmppc_find_table(vcpu->kvm, liobn);
-	if (!stt)
-		return H_TOO_HARD;
-
-	entry = ioba >> stt->page_shift;
-	/*
-	 * The spec says that the maximum size of the list is 512 TCEs
-	 * so the whole table addressed resides in 4K page
-	 */
-	if (npages > 512)
-		return H_PARAMETER;
-
-	if (tce_list & (SZ_4K - 1))
-		return H_PARAMETER;
-
-	ret = kvmppc_rm_ioba_validate(stt, ioba, npages, false);
-	if (ret != H_SUCCESS)
-		return ret;
-
-	if (mm_iommu_preregistered(vcpu->kvm->mm)) {
-		/*
-		 * We get here if guest memory was pre-registered which
-		 * is normally VFIO case and gpa->hpa translation does not
-		 * depend on hpt.
-		 */
-		struct mm_iommu_table_group_mem_t *mem;
-
-		if (kvmppc_rm_tce_to_ua(vcpu->kvm, tce_list, &ua))
-			return H_TOO_HARD;
-
-		mem = mm_iommu_lookup_rm(vcpu->kvm->mm, ua, IOMMU_PAGE_SIZE_4K);
-		if (mem)
-			prereg = mm_iommu_ua_to_hpa_rm(mem, ua,
-					IOMMU_PAGE_SHIFT_4K, &tces) == 0;
-	}
-
-	if (!prereg) {
-		/*
-		 * This is usually a case of a guest with emulated devices only
-		 * when TCE list is not in preregistered memory.
-		 * We do not require memory to be preregistered in this case
-		 * so lock rmap and do __find_linux_pte_or_hugepte().
-		 */
-		if (kvmppc_rm_tce_to_ua(vcpu->kvm, tce_list, &ua))
-			return H_TOO_HARD;
-
-		arch_spin_lock(&kvm->mmu_lock.rlock.raw_lock);
-		if (kvmppc_rm_ua_to_hpa(vcpu, mmu_seq, ua, &tces)) {
-			ret = H_TOO_HARD;
-			goto unlock_exit;
-		}
-	}
-
-	for (i = 0; i < npages; ++i) {
-		unsigned long tce = be64_to_cpu(((u64 *)tces)[i]);
-
-		ret = kvmppc_rm_tce_validate(stt, tce);
-		if (ret != H_SUCCESS)
-			goto unlock_exit;
-	}
-
-	for (i = 0; i < npages; ++i) {
-		unsigned long tce = be64_to_cpu(((u64 *)tces)[i]);
-
-		ua = 0;
-		if (kvmppc_rm_tce_to_ua(vcpu->kvm, tce, &ua)) {
-			ret = H_PARAMETER;
-			goto unlock_exit;
-		}
-
-		list_for_each_entry_lockless(stit, &stt->iommu_tables, next) {
-			ret = kvmppc_rm_tce_iommu_map(vcpu->kvm, stt,
-					stit->tbl, entry + i, ua,
-					iommu_tce_direction(tce));
-
-			if (ret != H_SUCCESS) {
-				kvmppc_rm_clear_tce(vcpu->kvm, stt, stit->tbl,
-						entry + i);
-				goto unlock_exit;
-			}
-		}
-
-		kvmppc_rm_tce_put(stt, entry + i, tce);
-	}
-
-unlock_exit:
-	if (!prereg)
-		arch_spin_unlock(&kvm->mmu_lock.rlock.raw_lock);
-	return ret;
-}
-
-long kvmppc_rm_h_stuff_tce(struct kvm_vcpu *vcpu,
-		unsigned long liobn, unsigned long ioba,
-		unsigned long tce_value, unsigned long npages)
-{
-	struct kvmppc_spapr_tce_table *stt;
-	long i, ret;
-	struct kvmppc_spapr_tce_iommu_table *stit;
-
-	stt = kvmppc_find_table(vcpu->kvm, liobn);
-	if (!stt)
-		return H_TOO_HARD;
-
-	ret = kvmppc_rm_ioba_validate(stt, ioba, npages, tce_value == 0);
-	if (ret != H_SUCCESS)
-		return ret;
-
-	/* Check permission bits only to allow userspace poison TCE for debug */
-	if (tce_value & (TCE_PCI_WRITE | TCE_PCI_READ))
-		return H_PARAMETER;
-
-	list_for_each_entry_lockless(stit, &stt->iommu_tables, next) {
-		unsigned long entry = ioba >> stt->page_shift;
-
-		for (i = 0; i < npages; ++i) {
-			ret = kvmppc_rm_tce_iommu_unmap(vcpu->kvm, stt,
-					stit->tbl, entry + i);
-
-			if (ret == H_SUCCESS)
-				continue;
-
-			if (ret == H_TOO_HARD)
-				return ret;
-
-			WARN_ON_ONCE_RM(1);
-			kvmppc_rm_clear_tce(vcpu->kvm, stt, stit->tbl, entry + i);
-		}
-	}
-
-	for (i = 0; i < npages; ++i, ioba += (1ULL << stt->page_shift))
-		kvmppc_rm_tce_put(stt, ioba >> stt->page_shift, tce_value);
-
-	return ret;
-}
-
-/* This can be called in either virtual mode or real mode */
-long kvmppc_h_get_tce(struct kvm_vcpu *vcpu, unsigned long liobn,
-		      unsigned long ioba)
-{
-	struct kvmppc_spapr_tce_table *stt;
-	long ret;
-	unsigned long idx;
-	struct page *page;
-	u64 *tbl;
-
-	stt = kvmppc_find_table(vcpu->kvm, liobn);
-	if (!stt)
-		return H_TOO_HARD;
-
-	ret = kvmppc_ioba_validate(stt, ioba, 1);
-	if (ret != H_SUCCESS)
-		return ret;
-
-	idx = (ioba >> stt->page_shift) - stt->offset;
-	page = stt->pages[idx / TCES_PER_PAGE];
-	if (!page) {
-		vcpu->arch.regs.gpr[4] = 0;
-		return H_SUCCESS;
-	}
-	tbl = (u64 *)page_address(page);
-
-	vcpu->arch.regs.gpr[4] = tbl[idx % TCES_PER_PAGE];
-
-	return H_SUCCESS;
-}
-EXPORT_SYMBOL_GPL(kvmppc_h_get_tce);
-
-#endif /* KVM_BOOK3S_HV_POSSIBLE */
diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index 6fa518f6501d..2b8233212204 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -1326,6 +1326,12 @@ static int kvmppc_hcall_impl_hv(unsigned long cmd)
 	case H_CONFER:
 	case H_REGISTER_VPA:
 	case H_SET_MODE:
+#ifdef CONFIG_SPAPR_TCE_IOMMU
+	case H_GET_TCE:
+	case H_PUT_TCE:
+	case H_PUT_TCE_INDIRECT:
+	case H_STUFF_TCE:
+#endif
 	case H_LOGICAL_CI_LOAD:
 	case H_LOGICAL_CI_STORE:
 #ifdef CONFIG_KVM_XICS
diff --git a/arch/powerpc/mm/book3s64/iommu_api.c b/arch/powerpc/mm/book3s64/iommu_api.c
index cd18e94d0843..7fcfba162e0d 100644
--- a/arch/powerpc/mm/book3s64/iommu_api.c
+++ b/arch/powerpc/mm/book3s64/iommu_api.c
@@ -305,24 +305,6 @@ struct mm_iommu_table_group_mem_t *mm_iommu_lookup(struct mm_struct *mm,
 }
 EXPORT_SYMBOL_GPL(mm_iommu_lookup);
 
-struct mm_iommu_table_group_mem_t *mm_iommu_lookup_rm(struct mm_struct *mm,
-		unsigned long ua, unsigned long size)
-{
-	struct mm_iommu_table_group_mem_t *mem, *ret = NULL;
-
-	list_for_each_entry_lockless(mem, &mm->context.iommu_group_mem_list,
-			next) {
-		if ((mem->ua <= ua) &&
-				(ua + size <= mem->ua +
-				 (mem->entries << PAGE_SHIFT))) {
-			ret = mem;
-			break;
-		}
-	}
-
-	return ret;
-}
-
 struct mm_iommu_table_group_mem_t *mm_iommu_get(struct mm_struct *mm,
 		unsigned long ua, unsigned long entries)
 {
@@ -369,56 +351,6 @@ long mm_iommu_ua_to_hpa(struct mm_iommu_table_group_mem_t *mem,
 }
 EXPORT_SYMBOL_GPL(mm_iommu_ua_to_hpa);
 
-long mm_iommu_ua_to_hpa_rm(struct mm_iommu_table_group_mem_t *mem,
-		unsigned long ua, unsigned int pageshift, unsigned long *hpa)
-{
-	const long entry = (ua - mem->ua) >> PAGE_SHIFT;
-	unsigned long *pa;
-
-	if (entry >= mem->entries)
-		return -EFAULT;
-
-	if (pageshift > mem->pageshift)
-		return -EFAULT;
-
-	if (!mem->hpas) {
-		*hpa = mem->dev_hpa + (ua - mem->ua);
-		return 0;
-	}
-
-	pa = (void *) vmalloc_to_phys(&mem->hpas[entry]);
-	if (!pa)
-		return -EFAULT;
-
-	*hpa = (*pa & MM_IOMMU_TABLE_GROUP_PAGE_MASK) | (ua & ~PAGE_MASK);
-
-	return 0;
-}
-
-extern void mm_iommu_ua_mark_dirty_rm(struct mm_struct *mm, unsigned long ua)
-{
-	struct mm_iommu_table_group_mem_t *mem;
-	long entry;
-	void *va;
-	unsigned long *pa;
-
-	mem = mm_iommu_lookup_rm(mm, ua, PAGE_SIZE);
-	if (!mem)
-		return;
-
-	if (mem->dev_hpa != MM_IOMMU_TABLE_INVALID_HPA)
-		return;
-
-	entry = (ua - mem->ua) >> PAGE_SHIFT;
-	va = &mem->hpas[entry];
-
-	pa = (void *) vmalloc_to_phys(va);
-	if (!pa)
-		return;
-
-	*pa |= MM_IOMMU_TABLE_GROUP_PAGE_DIRTY;
-}
-
 bool mm_iommu_is_devmem(struct mm_struct *mm, unsigned long hpa,
 		unsigned int pageshift, unsigned long *size)
 {
diff --git a/arch/powerpc/platforms/powernv/pci-ioda-tce.c b/arch/powerpc/platforms/powernv/pci-ioda-tce.c
index 30551bbd7988..e96324502db0 100644
--- a/arch/powerpc/platforms/powernv/pci-ioda-tce.c
+++ b/arch/powerpc/platforms/powernv/pci-ioda-tce.c
@@ -145,8 +145,7 @@ int pnv_tce_build(struct iommu_table *tbl, long index, long npages,
 
 #ifdef CONFIG_IOMMU_API
 int pnv_tce_xchg(struct iommu_table *tbl, long index,
-		unsigned long *hpa, enum dma_data_direction *direction,
-		bool alloc)
+		unsigned long *hpa, enum dma_data_direction *direction)
 {
 	u64 proto_tce = iommu_direction_to_tce_perm(*direction);
 	unsigned long newtce = *hpa | proto_tce, oldtce;
@@ -164,7 +163,7 @@ int pnv_tce_xchg(struct iommu_table *tbl, long index,
 	}
 
 	if (!ptce) {
-		ptce = pnv_tce(tbl, false, idx, alloc);
+		ptce = pnv_tce(tbl, false, idx, true);
 		if (!ptce)
 			return -ENOMEM;
 	}
diff --git a/arch/powerpc/platforms/powernv/pci-ioda.c b/arch/powerpc/platforms/powernv/pci-ioda.c
index b722ac902269..aef22ee482bc 100644
--- a/arch/powerpc/platforms/powernv/pci-ioda.c
+++ b/arch/powerpc/platforms/powernv/pci-ioda.c
@@ -1267,22 +1267,20 @@ static bool pnv_pci_ioda_iommu_bypass_supported(struct pci_dev *pdev,
 	return false;
 }
 
-static inline __be64 __iomem *pnv_ioda_get_inval_reg(struct pnv_phb *phb,
-						     bool real_mode)
+static inline __be64 __iomem *pnv_ioda_get_inval_reg(struct pnv_phb *phb)
 {
-	return real_mode ? (__be64 __iomem *)(phb->regs_phys + 0x210) :
-		(phb->regs + 0x210);
+	return phb->regs + 0x210;
 }
 
 static void pnv_pci_p7ioc_tce_invalidate(struct iommu_table *tbl,
-		unsigned long index, unsigned long npages, bool rm)
+		unsigned long index, unsigned long npages)
 {
 	struct iommu_table_group_link *tgl = list_first_entry_or_null(
 			&tbl->it_group_list, struct iommu_table_group_link,
 			next);
 	struct pnv_ioda_pe *pe = container_of(tgl->table_group,
 			struct pnv_ioda_pe, table_group);
-	__be64 __iomem *invalidate = pnv_ioda_get_inval_reg(pe->phb, rm);
+	__be64 __iomem *invalidate = pnv_ioda_get_inval_reg(pe->phb);
 	unsigned long start, end, inc;
 
 	start = __pa(((__be64 *)tbl->it_base) + index - tbl->it_offset);
@@ -1297,11 +1295,7 @@ static void pnv_pci_p7ioc_tce_invalidate(struct iommu_table *tbl,
 
         mb(); /* Ensure above stores are visible */
         while (start <= end) {
-		if (rm)
-			__raw_rm_writeq_be(start, invalidate);
-		else
-			__raw_writeq_be(start, invalidate);
-
+		__raw_writeq_be(start, invalidate);
                 start += inc;
         }
 
@@ -1320,7 +1314,7 @@ static int pnv_ioda1_tce_build(struct iommu_table *tbl, long index,
 			attrs);
 
 	if (!ret)
-		pnv_pci_p7ioc_tce_invalidate(tbl, index, npages, false);
+		pnv_pci_p7ioc_tce_invalidate(tbl, index, npages);
 
 	return ret;
 }
@@ -1328,10 +1322,9 @@ static int pnv_ioda1_tce_build(struct iommu_table *tbl, long index,
 #ifdef CONFIG_IOMMU_API
 /* Common for IODA1 and IODA2 */
 static int pnv_ioda_tce_xchg_no_kill(struct iommu_table *tbl, long index,
-		unsigned long *hpa, enum dma_data_direction *direction,
-		bool realmode)
+		unsigned long *hpa, enum dma_data_direction *direction)
 {
-	return pnv_tce_xchg(tbl, index, hpa, direction, !realmode);
+	return pnv_tce_xchg(tbl, index, hpa, direction);
 }
 #endif
 
@@ -1340,7 +1333,7 @@ static void pnv_ioda1_tce_free(struct iommu_table *tbl, long index,
 {
 	pnv_tce_free(tbl, index, npages);
 
-	pnv_pci_p7ioc_tce_invalidate(tbl, index, npages, false);
+	pnv_pci_p7ioc_tce_invalidate(tbl, index, npages);
 }
 
 static struct iommu_table_ops pnv_ioda1_iommu_ops = {
@@ -1361,18 +1354,18 @@ static struct iommu_table_ops pnv_ioda1_iommu_ops = {
 static inline void pnv_pci_phb3_tce_invalidate_pe(struct pnv_ioda_pe *pe)
 {
 	/* 01xb - invalidate TCEs that match the specified PE# */
-	__be64 __iomem *invalidate = pnv_ioda_get_inval_reg(pe->phb, false);
+	__be64 __iomem *invalidate = pnv_ioda_get_inval_reg(pe->phb);
 	unsigned long val = PHB3_TCE_KILL_INVAL_PE | (pe->pe_number & 0xFF);
 
 	mb(); /* Ensure above stores are visible */
 	__raw_writeq_be(val, invalidate);
 }
 
-static void pnv_pci_phb3_tce_invalidate(struct pnv_ioda_pe *pe, bool rm,
+static void pnv_pci_phb3_tce_invalidate(struct pnv_ioda_pe *pe,
 					unsigned shift, unsigned long index,
 					unsigned long npages)
 {
-	__be64 __iomem *invalidate = pnv_ioda_get_inval_reg(pe->phb, rm);
+	__be64 __iomem *invalidate = pnv_ioda_get_inval_reg(pe->phb);
 	unsigned long start, end, inc;
 
 	/* We'll invalidate DMA address in PE scope */
@@ -1387,10 +1380,7 @@ static void pnv_pci_phb3_tce_invalidate(struct pnv_ioda_pe *pe, bool rm,
 	mb();
 
 	while (start <= end) {
-		if (rm)
-			__raw_rm_writeq_be(start, invalidate);
-		else
-			__raw_writeq_be(start, invalidate);
+		__raw_writeq_be(start, invalidate);
 		start += inc;
 	}
 }
@@ -1407,7 +1397,7 @@ static inline void pnv_pci_ioda2_tce_invalidate_pe(struct pnv_ioda_pe *pe)
 }
 
 static void pnv_pci_ioda2_tce_invalidate(struct iommu_table *tbl,
-		unsigned long index, unsigned long npages, bool rm)
+		unsigned long index, unsigned long npages)
 {
 	struct iommu_table_group_link *tgl;
 
@@ -1418,7 +1408,7 @@ static void pnv_pci_ioda2_tce_invalidate(struct iommu_table *tbl,
 		unsigned int shift = tbl->it_page_shift;
 
 		if (phb->model == PNV_PHB_MODEL_PHB3 && phb->regs)
-			pnv_pci_phb3_tce_invalidate(pe, rm, shift,
+			pnv_pci_phb3_tce_invalidate(pe, shift,
 						    index, npages);
 		else
 			opal_pci_tce_kill(phb->opal_id,
@@ -1437,7 +1427,7 @@ static int pnv_ioda2_tce_build(struct iommu_table *tbl, long index,
 			attrs);
 
 	if (!ret)
-		pnv_pci_ioda2_tce_invalidate(tbl, index, npages, false);
+		pnv_pci_ioda2_tce_invalidate(tbl, index, npages);
 
 	return ret;
 }
@@ -1447,7 +1437,7 @@ static void pnv_ioda2_tce_free(struct iommu_table *tbl, long index,
 {
 	pnv_tce_free(tbl, index, npages);
 
-	pnv_pci_ioda2_tce_invalidate(tbl, index, npages, false);
+	pnv_pci_ioda2_tce_invalidate(tbl, index, npages);
 }
 
 static struct iommu_table_ops pnv_ioda2_iommu_ops = {
@@ -2738,7 +2728,7 @@ static void pnv_pci_ioda1_release_pe_dma(struct pnv_ioda_pe *pe)
 	if (rc != OPAL_SUCCESS)
 		return;
 
-	pnv_pci_p7ioc_tce_invalidate(tbl, tbl->it_offset, tbl->it_size, false);
+	pnv_pci_p7ioc_tce_invalidate(tbl, tbl->it_offset, tbl->it_size);
 	if (pe->table_group.group) {
 		iommu_group_put(pe->table_group.group);
 		WARN_ON(pe->table_group.group);
diff --git a/arch/powerpc/platforms/pseries/iommu.c b/arch/powerpc/platforms/pseries/iommu.c
index 4d991cf840d9..309952a552f7 100644
--- a/arch/powerpc/platforms/pseries/iommu.c
+++ b/arch/powerpc/platforms/pseries/iommu.c
@@ -666,8 +666,7 @@ static void pci_dma_bus_setup_pSeries(struct pci_bus *bus)
 
 #ifdef CONFIG_IOMMU_API
 static int tce_exchange_pseries(struct iommu_table *tbl, long index, unsigned
-				long *tce, enum dma_data_direction *direction,
-				bool realmode)
+				long *tce, enum dma_data_direction *direction)
 {
 	long rc;
 	unsigned long ioba = (unsigned long) index << tbl->it_page_shift;
diff --git a/arch/powerpc/kvm/book3s_hv_rmhandlers.S b/arch/powerpc/kvm/book3s_hv_rmhandlers.S
index d185dee26026..44d74bfe05df 100644
--- a/arch/powerpc/kvm/book3s_hv_rmhandlers.S
+++ b/arch/powerpc/kvm/book3s_hv_rmhandlers.S
@@ -1784,13 +1784,8 @@ hcall_real_table:
 	.long	DOTSYM(kvmppc_h_clear_mod) - hcall_real_table
 	.long	DOTSYM(kvmppc_h_clear_ref) - hcall_real_table
 	.long	DOTSYM(kvmppc_h_protect) - hcall_real_table
-#ifdef CONFIG_SPAPR_TCE_IOMMU
-	.long	DOTSYM(kvmppc_h_get_tce) - hcall_real_table
-	.long	DOTSYM(kvmppc_rm_h_put_tce) - hcall_real_table
-#else
 	.long	0		/* 0x1c */
 	.long	0		/* 0x20 */
-#endif
 	.long	0		/* 0x24 - H_SET_SPRG0 */
 	.long	DOTSYM(kvmppc_h_set_dabr) - hcall_real_table
 	.long	DOTSYM(kvmppc_rm_h_page_init) - hcall_real_table
@@ -1868,13 +1863,8 @@ hcall_real_table:
 	.long	0		/* 0x12c */
 	.long	0		/* 0x130 */
 	.long	DOTSYM(kvmppc_h_set_xdabr) - hcall_real_table
-#ifdef CONFIG_SPAPR_TCE_IOMMU
-	.long	DOTSYM(kvmppc_rm_h_stuff_tce) - hcall_real_table
-	.long	DOTSYM(kvmppc_rm_h_put_tce_indirect) - hcall_real_table
-#else
 	.long	0		/* 0x138 */
 	.long	0		/* 0x13c */
-#endif
 	.long	0		/* 0x140 */
 	.long	0		/* 0x144 */
 	.long	0		/* 0x148 */
-- 
2.30.2

