Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EA8B66A617F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Feb 2023 22:38:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PR9jY5Mtlz30QD
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Mar 2023 08:38:57 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=fec0F/Xo;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org; envelope-from=willy@infradead.org; receiver=<UNKNOWN>)
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PR9hV5hRcz2yPD
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 Mar 2023 08:38:02 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=M4ny1muYlvcClbRg5WQTO/Vts3FXL6q850CUXICG6ck=; b=fec0F/XoUT3otKNoa22zMoIuPS
	DzAVFaFnpuH/ZtFlnUThyhqIp+LsdaPcVYQx2l4U3pjAwSgpF2HPhIbxnToJIE9npYCR/L8Mm9U4D
	2MOCixX3GL8mOkX/T1gfi/6aMdWXhFHxscKh4u+uammQk0R5wNdC4WGxWJp+FO97pGAAQe0MQOMDf
	iGoIW9d86Ac63VneTen8KNqkRrnFeU5BWszsYjhEwR1YPY8+EvMfg6tM4b5/z51myppBtmqHAPmmZ
	QpsUdJjeHS9QzwJYjQ94SNhBdFsSIzCKYzY+2zXcVhble+NLp+Kl/i7d1GyB54072AKtith2exzBV
	T8g1DiDw==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pX7fJ-0018pk-Cl; Tue, 28 Feb 2023 21:37:41 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: linux-mm@kvack.org,
	linux-arch@vger.kernel.org
Subject: [PATCH v3 19/34] powerpc: Implement the new page table range API
Date: Tue, 28 Feb 2023 21:37:22 +0000
Message-Id: <20230228213738.272178-20-willy@infradead.org>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20230228213738.272178-1-willy@infradead.org>
References: <20230228213738.272178-1-willy@infradead.org>
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
Cc: "Matthew Wilcox \(Oracle\)" <willy@infradead.org>, linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Add set_ptes(), update_mmu_cache_range() and flush_dcache_folio().
Change the PG_arch_1 (aka PG_dcache_dirty) flag from being per-page to
per-folio.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Nicholas Piggin <npiggin@gmail.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: linuxppc-dev@lists.ozlabs.org
---
 arch/powerpc/include/asm/book3s/pgtable.h | 10 +----
 arch/powerpc/include/asm/cacheflush.h     | 14 +++++--
 arch/powerpc/include/asm/kvm_ppc.h        | 10 ++---
 arch/powerpc/include/asm/nohash/pgtable.h | 13 ++----
 arch/powerpc/include/asm/pgtable.h        |  6 +++
 arch/powerpc/mm/book3s64/hash_utils.c     | 11 ++---
 arch/powerpc/mm/cacheflush.c              | 40 ++++++------------
 arch/powerpc/mm/nohash/e500_hugetlbpage.c |  3 +-
 arch/powerpc/mm/pgtable.c                 | 51 +++++++++++++----------
 9 files changed, 77 insertions(+), 81 deletions(-)

diff --git a/arch/powerpc/include/asm/book3s/pgtable.h b/arch/powerpc/include/asm/book3s/pgtable.h
index d18b748ea3ae..c2ef811505b0 100644
--- a/arch/powerpc/include/asm/book3s/pgtable.h
+++ b/arch/powerpc/include/asm/book3s/pgtable.h
@@ -9,13 +9,6 @@
 #endif
 
 #ifndef __ASSEMBLY__
-/* Insert a PTE, top-level function is out of line. It uses an inline
- * low level function in the respective pgtable-* files
- */
-extern void set_pte_at(struct mm_struct *mm, unsigned long addr, pte_t *ptep,
-		       pte_t pte);
-
-
 #define __HAVE_ARCH_PTEP_SET_ACCESS_FLAGS
 extern int ptep_set_access_flags(struct vm_area_struct *vma, unsigned long address,
 				 pte_t *ptep, pte_t entry, int dirty);
@@ -36,7 +29,8 @@ void __update_mmu_cache(struct vm_area_struct *vma, unsigned long address, pte_t
  * corresponding HPTE into the hash table ahead of time, instead of
  * waiting for the inevitable extra hash-table miss exception.
  */
-static inline void update_mmu_cache(struct vm_area_struct *vma, unsigned long address, pte_t *ptep)
+static inline void update_mmu_cache_range(struct vm_area_struct *vma,
+		unsigned long address, pte_t *ptep, unsigned int nr)
 {
 	if (IS_ENABLED(CONFIG_PPC32) && !mmu_has_feature(MMU_FTR_HPTE_TABLE))
 		return;
diff --git a/arch/powerpc/include/asm/cacheflush.h b/arch/powerpc/include/asm/cacheflush.h
index 7564dd4fd12b..ef7d2de33b89 100644
--- a/arch/powerpc/include/asm/cacheflush.h
+++ b/arch/powerpc/include/asm/cacheflush.h
@@ -35,13 +35,19 @@ static inline void flush_cache_vmap(unsigned long start, unsigned long end)
  * It just marks the page as not i-cache clean.  We do the i-cache
  * flush later when the page is given to a user process, if necessary.
  */
-static inline void flush_dcache_page(struct page *page)
+static inline void flush_dcache_folio(struct folio *folio)
 {
 	if (cpu_has_feature(CPU_FTR_COHERENT_ICACHE))
 		return;
 	/* avoid an atomic op if possible */
-	if (test_bit(PG_dcache_clean, &page->flags))
-		clear_bit(PG_dcache_clean, &page->flags);
+	if (test_bit(PG_dcache_clean, &folio->flags))
+		clear_bit(PG_dcache_clean, &folio->flags);
+}
+#define flush_dcache_folio flush_dcache_folio
+
+static inline void flush_dcache_page(struct page *page)
+{
+	flush_dcache_folio(page_folio(page));
 }
 
 void flush_icache_range(unsigned long start, unsigned long stop);
@@ -51,7 +57,7 @@ void flush_icache_user_page(struct vm_area_struct *vma, struct page *page,
 		unsigned long addr, int len);
 #define flush_icache_user_page flush_icache_user_page
 
-void flush_dcache_icache_page(struct page *page);
+void flush_dcache_icache_folio(struct folio *folio);
 
 /**
  * flush_dcache_range(): Write any modified data cache blocks out to memory and
diff --git a/arch/powerpc/include/asm/kvm_ppc.h b/arch/powerpc/include/asm/kvm_ppc.h
index 6bef23d6d0e3..e91dd8e88bb7 100644
--- a/arch/powerpc/include/asm/kvm_ppc.h
+++ b/arch/powerpc/include/asm/kvm_ppc.h
@@ -868,7 +868,7 @@ void kvmppc_init_lpid(unsigned long nr_lpids);
 
 static inline void kvmppc_mmu_flush_icache(kvm_pfn_t pfn)
 {
-	struct page *page;
+	struct folio *folio;
 	/*
 	 * We can only access pages that the kernel maps
 	 * as memory. Bail out for unmapped ones.
@@ -877,10 +877,10 @@ static inline void kvmppc_mmu_flush_icache(kvm_pfn_t pfn)
 		return;
 
 	/* Clear i-cache for new pages */
-	page = pfn_to_page(pfn);
-	if (!test_bit(PG_dcache_clean, &page->flags)) {
-		flush_dcache_icache_page(page);
-		set_bit(PG_dcache_clean, &page->flags);
+	folio = page_folio(pfn_to_page(pfn));
+	if (!test_bit(PG_dcache_clean, &folio->flags)) {
+		flush_dcache_icache_folio(folio);
+		set_bit(PG_dcache_clean, &folio->flags);
 	}
 }
 
diff --git a/arch/powerpc/include/asm/nohash/pgtable.h b/arch/powerpc/include/asm/nohash/pgtable.h
index a6caaaab6f92..69a7dd47a9f0 100644
--- a/arch/powerpc/include/asm/nohash/pgtable.h
+++ b/arch/powerpc/include/asm/nohash/pgtable.h
@@ -166,12 +166,6 @@ static inline pte_t pte_swp_clear_exclusive(pte_t pte)
 	return __pte(pte_val(pte) & ~_PAGE_SWP_EXCLUSIVE);
 }
 
-/* Insert a PTE, top-level function is out of line. It uses an inline
- * low level function in the respective pgtable-* files
- */
-extern void set_pte_at(struct mm_struct *mm, unsigned long addr, pte_t *ptep,
-		       pte_t pte);
-
 /* This low level function performs the actual PTE insertion
  * Setting the PTE depends on the MMU type and other factors. It's
  * an horrible mess that I'm not going to try to clean up now but
@@ -282,10 +276,11 @@ static inline int pud_huge(pud_t pud)
  * for the page which has just been mapped in.
  */
 #if defined(CONFIG_PPC_E500) && defined(CONFIG_HUGETLB_PAGE)
-void update_mmu_cache(struct vm_area_struct *vma, unsigned long address, pte_t *ptep);
+void update_mmu_cache_range(struct vm_area_struct *vma, unsigned long address,
+		pte_t *ptep, unsigned int nr);
 #else
-static inline
-void update_mmu_cache(struct vm_area_struct *vma, unsigned long address, pte_t *ptep) {}
+static inline void update_mmu_cache(struct vm_area_struct *vma,
+		unsigned long address, pte_t *ptep, unsigned int nr) {}
 #endif
 
 #endif /* __ASSEMBLY__ */
diff --git a/arch/powerpc/include/asm/pgtable.h b/arch/powerpc/include/asm/pgtable.h
index 9972626ddaf6..bf1263ff7e67 100644
--- a/arch/powerpc/include/asm/pgtable.h
+++ b/arch/powerpc/include/asm/pgtable.h
@@ -41,6 +41,12 @@ struct mm_struct;
 
 #ifndef __ASSEMBLY__
 
+void set_ptes(struct mm_struct *mm, unsigned long addr, pte_t *ptep,
+		pte_t pte, unsigned int nr);
+#define set_pte_at(mm, addr, ptep, pte) set_ptes(mm, addr, ptep, pte, 1)
+#define update_mmu_cache(vma, addr, ptep) \
+	update_mmu_cache_range(vma, addr, ptep, 1);
+
 #ifndef MAX_PTRS_PER_PGD
 #define MAX_PTRS_PER_PGD PTRS_PER_PGD
 #endif
diff --git a/arch/powerpc/mm/book3s64/hash_utils.c b/arch/powerpc/mm/book3s64/hash_utils.c
index fedffe3ae136..ad2afa08e62e 100644
--- a/arch/powerpc/mm/book3s64/hash_utils.c
+++ b/arch/powerpc/mm/book3s64/hash_utils.c
@@ -1307,18 +1307,19 @@ void hash__early_init_mmu_secondary(void)
  */
 unsigned int hash_page_do_lazy_icache(unsigned int pp, pte_t pte, int trap)
 {
-	struct page *page;
+	struct folio *folio;
 
 	if (!pfn_valid(pte_pfn(pte)))
 		return pp;
 
-	page = pte_page(pte);
+	folio = page_folio(pte_page(pte));
 
 	/* page is dirty */
-	if (!test_bit(PG_dcache_clean, &page->flags) && !PageReserved(page)) {
+	if (!test_bit(PG_dcache_clean, &folio->flags) &&
+	    !folio_test_reserved(folio)) {
 		if (trap == INTERRUPT_INST_STORAGE) {
-			flush_dcache_icache_page(page);
-			set_bit(PG_dcache_clean, &page->flags);
+			flush_dcache_icache_folio(folio);
+			set_bit(PG_dcache_clean, &folio->flags);
 		} else
 			pp |= HPTE_R_N;
 	}
diff --git a/arch/powerpc/mm/cacheflush.c b/arch/powerpc/mm/cacheflush.c
index 0e9b4879c0f9..8760d2223abe 100644
--- a/arch/powerpc/mm/cacheflush.c
+++ b/arch/powerpc/mm/cacheflush.c
@@ -148,44 +148,30 @@ static void __flush_dcache_icache(void *p)
 	invalidate_icache_range(addr, addr + PAGE_SIZE);
 }
 
-static void flush_dcache_icache_hugepage(struct page *page)
+void flush_dcache_icache_folio(struct folio *folio)
 {
-	int i;
-	int nr = compound_nr(page);
+	unsigned int i, nr = folio_nr_pages(folio);
 
-	if (!PageHighMem(page)) {
+	if (flush_coherent_icache())
+		return;
+
+	if (!folio_test_highmem(folio)) {
+		void *addr = folio_address(folio);
 		for (i = 0; i < nr; i++)
-			__flush_dcache_icache(lowmem_page_address(page + i));
-	} else {
+			__flush_dcache_icache(addr + i * PAGE_SIZE);
+	} else if (IS_ENABLED(CONFIG_BOOKE) || sizeof(phys_addr_t) > sizeof(void *)) {
 		for (i = 0; i < nr; i++) {
-			void *start = kmap_local_page(page + i);
+			void *start = kmap_local_folio(folio, i * PAGE_SIZE);
 
 			__flush_dcache_icache(start);
 			kunmap_local(start);
 		}
-	}
-}
-
-void flush_dcache_icache_page(struct page *page)
-{
-	if (flush_coherent_icache())
-		return;
-
-	if (PageCompound(page))
-		return flush_dcache_icache_hugepage(page);
-
-	if (!PageHighMem(page)) {
-		__flush_dcache_icache(lowmem_page_address(page));
-	} else if (IS_ENABLED(CONFIG_BOOKE) || sizeof(phys_addr_t) > sizeof(void *)) {
-		void *start = kmap_local_page(page);
-
-		__flush_dcache_icache(start);
-		kunmap_local(start);
 	} else {
-		flush_dcache_icache_phys(page_to_phys(page));
+		unsigned long pfn = folio_pfn(folio);
+		for (i = 0; i < nr; i++)
+			flush_dcache_icache_phys((pfn + i) * PAGE_SIZE);
 	}
 }
-EXPORT_SYMBOL(flush_dcache_icache_page);
 
 void clear_user_page(void *page, unsigned long vaddr, struct page *pg)
 {
diff --git a/arch/powerpc/mm/nohash/e500_hugetlbpage.c b/arch/powerpc/mm/nohash/e500_hugetlbpage.c
index 58c8d9849cb1..f3cb91107a47 100644
--- a/arch/powerpc/mm/nohash/e500_hugetlbpage.c
+++ b/arch/powerpc/mm/nohash/e500_hugetlbpage.c
@@ -178,7 +178,8 @@ book3e_hugetlb_preload(struct vm_area_struct *vma, unsigned long ea, pte_t pte)
  *
  * This must always be called with the pte lock held.
  */
-void update_mmu_cache(struct vm_area_struct *vma, unsigned long address, pte_t *ptep)
+void update_mmu_cache(struct vm_area_struct *vma, unsigned long address,
+		pte_t *ptep, unsigned int nr)
 {
 	if (is_vm_hugetlb_page(vma))
 		book3e_hugetlb_preload(vma, address, *ptep);
diff --git a/arch/powerpc/mm/pgtable.c b/arch/powerpc/mm/pgtable.c
index cb2dcdb18f8e..b3c7b874a7a2 100644
--- a/arch/powerpc/mm/pgtable.c
+++ b/arch/powerpc/mm/pgtable.c
@@ -58,7 +58,7 @@ static inline int pte_looks_normal(pte_t pte)
 	return 0;
 }
 
-static struct page *maybe_pte_to_page(pte_t pte)
+static struct folio *maybe_pte_to_folio(pte_t pte)
 {
 	unsigned long pfn = pte_pfn(pte);
 	struct page *page;
@@ -68,7 +68,7 @@ static struct page *maybe_pte_to_page(pte_t pte)
 	page = pfn_to_page(pfn);
 	if (PageReserved(page))
 		return NULL;
-	return page;
+	return page_folio(page);
 }
 
 #ifdef CONFIG_PPC_BOOK3S
@@ -84,12 +84,12 @@ static pte_t set_pte_filter_hash(pte_t pte)
 	pte = __pte(pte_val(pte) & ~_PAGE_HPTEFLAGS);
 	if (pte_looks_normal(pte) && !(cpu_has_feature(CPU_FTR_COHERENT_ICACHE) ||
 				       cpu_has_feature(CPU_FTR_NOEXECUTE))) {
-		struct page *pg = maybe_pte_to_page(pte);
-		if (!pg)
+		struct folio *folio = maybe_pte_to_folio(pte);
+		if (!folio)
 			return pte;
-		if (!test_bit(PG_dcache_clean, &pg->flags)) {
-			flush_dcache_icache_page(pg);
-			set_bit(PG_dcache_clean, &pg->flags);
+		if (!test_bit(PG_dcache_clean, &folio->flags)) {
+			flush_dcache_icache_folio(folio);
+			set_bit(PG_dcache_clean, &folio->flags);
 		}
 	}
 	return pte;
@@ -107,7 +107,7 @@ static pte_t set_pte_filter_hash(pte_t pte) { return pte; }
  */
 static inline pte_t set_pte_filter(pte_t pte)
 {
-	struct page *pg;
+	struct folio *folio;
 
 	if (radix_enabled())
 		return pte;
@@ -120,18 +120,18 @@ static inline pte_t set_pte_filter(pte_t pte)
 		return pte;
 
 	/* If you set _PAGE_EXEC on weird pages you're on your own */
-	pg = maybe_pte_to_page(pte);
-	if (unlikely(!pg))
+	folio = maybe_pte_to_folio(pte);
+	if (unlikely(!folio))
 		return pte;
 
 	/* If the page clean, we move on */
-	if (test_bit(PG_dcache_clean, &pg->flags))
+	if (test_bit(PG_dcache_clean, &folio->flags))
 		return pte;
 
 	/* If it's an exec fault, we flush the cache and make it clean */
 	if (is_exec_fault()) {
-		flush_dcache_icache_page(pg);
-		set_bit(PG_dcache_clean, &pg->flags);
+		flush_dcache_icache_folio(folio);
+		set_bit(PG_dcache_clean, &folio->flags);
 		return pte;
 	}
 
@@ -142,7 +142,7 @@ static inline pte_t set_pte_filter(pte_t pte)
 static pte_t set_access_flags_filter(pte_t pte, struct vm_area_struct *vma,
 				     int dirty)
 {
-	struct page *pg;
+	struct folio *folio;
 
 	if (IS_ENABLED(CONFIG_PPC_BOOK3S_64))
 		return pte;
@@ -168,17 +168,17 @@ static pte_t set_access_flags_filter(pte_t pte, struct vm_area_struct *vma,
 #endif /* CONFIG_DEBUG_VM */
 
 	/* If you set _PAGE_EXEC on weird pages you're on your own */
-	pg = maybe_pte_to_page(pte);
-	if (unlikely(!pg))
+	folio = maybe_pte_to_folio(pte);
+	if (unlikely(!folio))
 		goto bail;
 
 	/* If the page is already clean, we move on */
-	if (test_bit(PG_dcache_clean, &pg->flags))
+	if (test_bit(PG_dcache_clean, &folio->flags))
 		goto bail;
 
 	/* Clean the page and set PG_dcache_clean */
-	flush_dcache_icache_page(pg);
-	set_bit(PG_dcache_clean, &pg->flags);
+	flush_dcache_icache_folio(folio);
+	set_bit(PG_dcache_clean, &folio->flags);
 
  bail:
 	return pte_mkexec(pte);
@@ -187,8 +187,8 @@ static pte_t set_access_flags_filter(pte_t pte, struct vm_area_struct *vma,
 /*
  * set_pte stores a linux PTE into the linux page table.
  */
-void set_pte_at(struct mm_struct *mm, unsigned long addr, pte_t *ptep,
-		pte_t pte)
+void set_ptes(struct mm_struct *mm, unsigned long addr, pte_t *ptep,
+		pte_t pte, unsigned int nr)
 {
 	/*
 	 * Make sure hardware valid bit is not set. We don't do
@@ -203,7 +203,14 @@ void set_pte_at(struct mm_struct *mm, unsigned long addr, pte_t *ptep,
 	pte = set_pte_filter(pte);
 
 	/* Perform the setting of the PTE */
-	__set_pte_at(mm, addr, ptep, pte, 0);
+	for (;;) {
+		__set_pte_at(mm, addr, ptep, pte, 0);
+		if (--nr == 0)
+			break;
+		ptep++;
+		pte = __pte(pte_val(pte) + PAGE_SIZE);
+		addr += PAGE_SIZE;
+	}
 }
 
 void unmap_kernel_page(unsigned long va)
-- 
2.39.1

