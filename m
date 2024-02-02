Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 63B2E846A44
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Feb 2024 09:12:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TR7mt2SPrz3vhS
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Feb 2024 19:12:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=ryan.roberts@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TR7j11HMSz3dSx
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Feb 2024 19:09:24 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9B9861BB0;
	Fri,  2 Feb 2024 00:10:03 -0800 (PST)
Received: from e125769.cambridge.arm.com (e125769.cambridge.arm.com [10.1.196.26])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 936AA3F5A1;
	Fri,  2 Feb 2024 00:09:17 -0800 (PST)
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
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	"Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
	"Naveen N. Rao" <naveen.n.rao@linux.ibm.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: [PATCH v5 17/25] arm64/mm: ptep_get(): New layer to manage contig bit
Date: Fri,  2 Feb 2024 08:07:48 +0000
Message-Id: <20240202080756.1453939-18-ryan.roberts@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240202080756.1453939-1-ryan.roberts@arm.com>
References: <20240202080756.1453939-1-ryan.roberts@arm.com>
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

Create a new layer for the in-table PTE manipulation APIs. For now, The
existing API is prefixed with double underscore to become the
arch-private API and the public API is just a simple wrapper that calls
the private API.

The public API implementation will subsequently be used to transparently
manipulate the contiguous bit where appropriate. But since there are
already some contig-aware users (e.g. hugetlb, kernel mapper), we must
first ensure those users use the private API directly so that the future
contig-bit manipulations in the public API do not interfere with those
existing uses.

arm64 did not previously define an arch-specific ptep_get(), so override
the default version in the arch code, and also define the private
__ptep_get() version. Currently they both do the same thing that the
default version does (READ_ONCE()). Some arch users (hugetlb) were
already using ptep_get() so convert those to the private API. While
other callsites were doing direct READ_ONCE(), so convert those to use
the appropriate (public/private) API too.

Tested-by: John Hubbard <jhubbard@nvidia.com>
Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
---
 arch/arm64/include/asm/pgtable.h | 12 +++++++++---
 arch/arm64/kernel/efi.c          |  2 +-
 arch/arm64/mm/fault.c            |  4 ++--
 arch/arm64/mm/hugetlbpage.c      | 18 +++++++++---------
 arch/arm64/mm/kasan_init.c       |  2 +-
 arch/arm64/mm/mmu.c              | 12 ++++++------
 arch/arm64/mm/pageattr.c         |  4 ++--
 arch/arm64/mm/trans_pgd.c        |  2 +-
 8 files changed, 31 insertions(+), 25 deletions(-)

diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
index fe27a3175618..7dc6b68ee516 100644
--- a/arch/arm64/include/asm/pgtable.h
+++ b/arch/arm64/include/asm/pgtable.h
@@ -276,6 +276,11 @@ static inline void __set_pte(pte_t *ptep, pte_t pte)
 	}
 }
 
+static inline pte_t __ptep_get(pte_t *ptep)
+{
+	return READ_ONCE(*ptep);
+}
+
 extern void __sync_icache_dcache(pte_t pteval);
 bool pgattr_change_is_safe(u64 old, u64 new);
 
@@ -303,7 +308,7 @@ static inline void __check_safe_pte_update(struct mm_struct *mm, pte_t *ptep,
 	if (!IS_ENABLED(CONFIG_DEBUG_VM))
 		return;
 
-	old_pte = READ_ONCE(*ptep);
+	old_pte = __ptep_get(ptep);
 
 	if (!pte_valid(old_pte) || !pte_valid(pte))
 		return;
@@ -905,7 +910,7 @@ static inline int __ptep_test_and_clear_young(struct vm_area_struct *vma,
 {
 	pte_t old_pte, pte;
 
-	pte = READ_ONCE(*ptep);
+	pte = __ptep_get(ptep);
 	do {
 		old_pte = pte;
 		pte = pte_mkold(pte);
@@ -978,7 +983,7 @@ static inline void __ptep_set_wrprotect(struct mm_struct *mm,
 {
 	pte_t old_pte, pte;
 
-	pte = READ_ONCE(*ptep);
+	pte = __ptep_get(ptep);
 	do {
 		old_pte = pte;
 		pte = pte_wrprotect(pte);
@@ -1130,6 +1135,7 @@ void vmemmap_update_pte(unsigned long addr, pte_t *ptep, pte_t pte);
 #define vmemmap_update_pte vmemmap_update_pte
 #endif
 
+#define ptep_get				__ptep_get
 #define set_pte					__set_pte
 #define set_ptes				__set_ptes
 #define pte_clear				__pte_clear
diff --git a/arch/arm64/kernel/efi.c b/arch/arm64/kernel/efi.c
index 44288a12fc6c..9afcc690fe73 100644
--- a/arch/arm64/kernel/efi.c
+++ b/arch/arm64/kernel/efi.c
@@ -103,7 +103,7 @@ static int __init set_permissions(pte_t *ptep, unsigned long addr, void *data)
 {
 	struct set_perm_data *spd = data;
 	const efi_memory_desc_t *md = spd->md;
-	pte_t pte = READ_ONCE(*ptep);
+	pte_t pte = __ptep_get(ptep);
 
 	if (md->attribute & EFI_MEMORY_RO)
 		pte = set_pte_bit(pte, __pgprot(PTE_RDONLY));
diff --git a/arch/arm64/mm/fault.c b/arch/arm64/mm/fault.c
index dbbc06cfb848..892e8cc8983f 100644
--- a/arch/arm64/mm/fault.c
+++ b/arch/arm64/mm/fault.c
@@ -191,7 +191,7 @@ static void show_pte(unsigned long addr)
 		if (!ptep)
 			break;
 
-		pte = READ_ONCE(*ptep);
+		pte = __ptep_get(ptep);
 		pr_cont(", pte=%016llx", pte_val(pte));
 		pte_unmap(ptep);
 	} while(0);
@@ -214,7 +214,7 @@ int __ptep_set_access_flags(struct vm_area_struct *vma,
 			    pte_t entry, int dirty)
 {
 	pteval_t old_pteval, pteval;
-	pte_t pte = READ_ONCE(*ptep);
+	pte_t pte = __ptep_get(ptep);
 
 	if (pte_same(pte, entry))
 		return 0;
diff --git a/arch/arm64/mm/hugetlbpage.c b/arch/arm64/mm/hugetlbpage.c
index 9949b80baac8..c3db949560f9 100644
--- a/arch/arm64/mm/hugetlbpage.c
+++ b/arch/arm64/mm/hugetlbpage.c
@@ -152,14 +152,14 @@ pte_t huge_ptep_get(pte_t *ptep)
 {
 	int ncontig, i;
 	size_t pgsize;
-	pte_t orig_pte = ptep_get(ptep);
+	pte_t orig_pte = __ptep_get(ptep);
 
 	if (!pte_present(orig_pte) || !pte_cont(orig_pte))
 		return orig_pte;
 
 	ncontig = num_contig_ptes(page_size(pte_page(orig_pte)), &pgsize);
 	for (i = 0; i < ncontig; i++, ptep++) {
-		pte_t pte = ptep_get(ptep);
+		pte_t pte = __ptep_get(ptep);
 
 		if (pte_dirty(pte))
 			orig_pte = pte_mkdirty(orig_pte);
@@ -184,7 +184,7 @@ static pte_t get_clear_contig(struct mm_struct *mm,
 			     unsigned long pgsize,
 			     unsigned long ncontig)
 {
-	pte_t orig_pte = ptep_get(ptep);
+	pte_t orig_pte = __ptep_get(ptep);
 	unsigned long i;
 
 	for (i = 0; i < ncontig; i++, addr += pgsize, ptep++) {
@@ -408,7 +408,7 @@ pte_t huge_ptep_get_and_clear(struct mm_struct *mm,
 {
 	int ncontig;
 	size_t pgsize;
-	pte_t orig_pte = ptep_get(ptep);
+	pte_t orig_pte = __ptep_get(ptep);
 
 	if (!pte_cont(orig_pte))
 		return __ptep_get_and_clear(mm, addr, ptep);
@@ -431,11 +431,11 @@ static int __cont_access_flags_changed(pte_t *ptep, pte_t pte, int ncontig)
 {
 	int i;
 
-	if (pte_write(pte) != pte_write(ptep_get(ptep)))
+	if (pte_write(pte) != pte_write(__ptep_get(ptep)))
 		return 1;
 
 	for (i = 0; i < ncontig; i++) {
-		pte_t orig_pte = ptep_get(ptep + i);
+		pte_t orig_pte = __ptep_get(ptep + i);
 
 		if (pte_dirty(pte) != pte_dirty(orig_pte))
 			return 1;
@@ -492,7 +492,7 @@ void huge_ptep_set_wrprotect(struct mm_struct *mm,
 	size_t pgsize;
 	pte_t pte;
 
-	if (!pte_cont(READ_ONCE(*ptep))) {
+	if (!pte_cont(__ptep_get(ptep))) {
 		__ptep_set_wrprotect(mm, addr, ptep);
 		return;
 	}
@@ -517,7 +517,7 @@ pte_t huge_ptep_clear_flush(struct vm_area_struct *vma,
 	size_t pgsize;
 	int ncontig;
 
-	if (!pte_cont(READ_ONCE(*ptep)))
+	if (!pte_cont(__ptep_get(ptep)))
 		return ptep_clear_flush(vma, addr, ptep);
 
 	ncontig = find_num_contig(mm, addr, ptep, &pgsize);
@@ -550,7 +550,7 @@ pte_t huge_ptep_modify_prot_start(struct vm_area_struct *vma, unsigned long addr
 		 * when the permission changes from executable to non-executable
 		 * in cases where cpu is affected with errata #2645198.
 		 */
-		if (pte_user_exec(READ_ONCE(*ptep)))
+		if (pte_user_exec(__ptep_get(ptep)))
 			return huge_ptep_clear_flush(vma, addr, ptep);
 	}
 	return huge_ptep_get_and_clear(vma->vm_mm, addr, ptep);
diff --git a/arch/arm64/mm/kasan_init.c b/arch/arm64/mm/kasan_init.c
index f659bd98c63f..9ee16cfce587 100644
--- a/arch/arm64/mm/kasan_init.c
+++ b/arch/arm64/mm/kasan_init.c
@@ -113,7 +113,7 @@ static void __init kasan_pte_populate(pmd_t *pmdp, unsigned long addr,
 			memset(__va(page_phys), KASAN_SHADOW_INIT, PAGE_SIZE);
 		next = addr + PAGE_SIZE;
 		__set_pte(ptep, pfn_pte(__phys_to_pfn(page_phys), PAGE_KERNEL));
-	} while (ptep++, addr = next, addr != end && pte_none(READ_ONCE(*ptep)));
+	} while (ptep++, addr = next, addr != end && pte_none(__ptep_get(ptep)));
 }
 
 static void __init kasan_pmd_populate(pud_t *pudp, unsigned long addr,
diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
index bcaa5a5d86f8..8c1ab90bb1e5 100644
--- a/arch/arm64/mm/mmu.c
+++ b/arch/arm64/mm/mmu.c
@@ -173,7 +173,7 @@ static void init_pte(pmd_t *pmdp, unsigned long addr, unsigned long end,
 
 	ptep = pte_set_fixmap_offset(pmdp, addr);
 	do {
-		pte_t old_pte = READ_ONCE(*ptep);
+		pte_t old_pte = __ptep_get(ptep);
 
 		__set_pte(ptep, pfn_pte(__phys_to_pfn(phys), prot));
 
@@ -182,7 +182,7 @@ static void init_pte(pmd_t *pmdp, unsigned long addr, unsigned long end,
 		 * only allow updates to the permission attributes.
 		 */
 		BUG_ON(!pgattr_change_is_safe(pte_val(old_pte),
-					      READ_ONCE(pte_val(*ptep))));
+					      pte_val(__ptep_get(ptep))));
 
 		phys += PAGE_SIZE;
 	} while (ptep++, addr += PAGE_SIZE, addr != end);
@@ -854,7 +854,7 @@ static void unmap_hotplug_pte_range(pmd_t *pmdp, unsigned long addr,
 
 	do {
 		ptep = pte_offset_kernel(pmdp, addr);
-		pte = READ_ONCE(*ptep);
+		pte = __ptep_get(ptep);
 		if (pte_none(pte))
 			continue;
 
@@ -987,7 +987,7 @@ static void free_empty_pte_table(pmd_t *pmdp, unsigned long addr,
 
 	do {
 		ptep = pte_offset_kernel(pmdp, addr);
-		pte = READ_ONCE(*ptep);
+		pte = __ptep_get(ptep);
 
 		/*
 		 * This is just a sanity check here which verifies that
@@ -1006,7 +1006,7 @@ static void free_empty_pte_table(pmd_t *pmdp, unsigned long addr,
 	 */
 	ptep = pte_offset_kernel(pmdp, 0UL);
 	for (i = 0; i < PTRS_PER_PTE; i++) {
-		if (!pte_none(READ_ONCE(ptep[i])))
+		if (!pte_none(__ptep_get(&ptep[i])))
 			return;
 	}
 
@@ -1503,7 +1503,7 @@ pte_t ptep_modify_prot_start(struct vm_area_struct *vma, unsigned long addr, pte
 		 * when the permission changes from executable to non-executable
 		 * in cases where cpu is affected with errata #2645198.
 		 */
-		if (pte_user_exec(READ_ONCE(*ptep)))
+		if (pte_user_exec(ptep_get(ptep)))
 			return ptep_clear_flush(vma, addr, ptep);
 	}
 	return ptep_get_and_clear(vma->vm_mm, addr, ptep);
diff --git a/arch/arm64/mm/pageattr.c b/arch/arm64/mm/pageattr.c
index a7996d8edf0a..0c4e3ecf989d 100644
--- a/arch/arm64/mm/pageattr.c
+++ b/arch/arm64/mm/pageattr.c
@@ -36,7 +36,7 @@ bool can_set_direct_map(void)
 static int change_page_range(pte_t *ptep, unsigned long addr, void *data)
 {
 	struct page_change_data *cdata = data;
-	pte_t pte = READ_ONCE(*ptep);
+	pte_t pte = __ptep_get(ptep);
 
 	pte = clear_pte_bit(pte, cdata->clear_mask);
 	pte = set_pte_bit(pte, cdata->set_mask);
@@ -245,5 +245,5 @@ bool kernel_page_present(struct page *page)
 		return true;
 
 	ptep = pte_offset_kernel(pmdp, addr);
-	return pte_valid(READ_ONCE(*ptep));
+	return pte_valid(__ptep_get(ptep));
 }
diff --git a/arch/arm64/mm/trans_pgd.c b/arch/arm64/mm/trans_pgd.c
index 230b607cf881..5139a28130c0 100644
--- a/arch/arm64/mm/trans_pgd.c
+++ b/arch/arm64/mm/trans_pgd.c
@@ -33,7 +33,7 @@ static void *trans_alloc(struct trans_pgd_info *info)
 
 static void _copy_pte(pte_t *dst_ptep, pte_t *src_ptep, unsigned long addr)
 {
-	pte_t pte = READ_ONCE(*src_ptep);
+	pte_t pte = __ptep_get(src_ptep);
 
 	if (pte_valid(pte)) {
 		/*
-- 
2.25.1

