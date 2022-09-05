Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 26CBE5ACDF6
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 Sep 2022 10:51:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MLj1f5Dl3z3bkx
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 Sep 2022 18:51:50 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=pN8Q6inI;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::634; helo=mail-pl1-x634.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=pN8Q6inI;
	dkim-atps=neutral
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MLj113p3kz2xfm
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  5 Sep 2022 18:51:16 +1000 (AEST)
Received: by mail-pl1-x634.google.com with SMTP id l3so7860852plb.10
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 05 Sep 2022 01:51:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=6MC7QrpcM4ZR17q1fDRPfM33Q3CLuHMm32GVKvJOXws=;
        b=pN8Q6inIm2LeMopYRNTdncBVQwWXE/o5fb3FQWGRZuGdQk/+CzHdeYL73BtOZjhgob
         KHfLMKHT2nNxiuvqStn2tBG7XAQTnFbm9fNDUOfhTsji9jSx4+wcYe/ws1mi+lB8zvFH
         828aUmu/0I1I7zOQywmRp8ERC02hXkWCPHSbe60Y8LrcPdL3hsV9TaB+1b3XHXzNsAsT
         Iw8MxbqgHArejRi9d+mHhF8oZlZ/E0Vzz4dLI5BFIlnItLjaK6fPQ2D46IJDfLsOOdSd
         oBTr95WkHXtBmaZaiMecqrHAB5xbLXcavhQWiDOk3SLYCnBUvq7Iy1Qe6tACYEhjQJsC
         PNxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=6MC7QrpcM4ZR17q1fDRPfM33Q3CLuHMm32GVKvJOXws=;
        b=LYJ94+MuJGIyYoI5E5xPmhpnJD4z1axPnPHZ1dMI87XvAcpB3Zj0gppu1fxKMZwwPE
         BAW/AG/zvx8eezPdAPKMleoF+nyNF36KyTyBRskFMzgicckj2qgIQYo3fMp3IpHvbba1
         zZ6EaITYoLamMaKtPwN9YW4e4pqQpNbzE1x/mU+ZboyJcZcmFWjgedt8NZC5D1n8PgV8
         yZbeU1heafrytC551RnXmLI9wNPGv1itOtXq8gu4G3MzyNlUo8MRHe0BWDX2dxGZgI1T
         8rFv1dmjPIRSRVpi0C2QGxcVmF8KO2cFla2xZCtqE65eBUlsEe84Jgl1W9z81lZ9Ugb1
         0TbQ==
X-Gm-Message-State: ACgBeo1Pb98dMdeBJ3GTWOGirAgTdX5TeGUem+CF7oH3to4bdtX5kgz6
	AKfFgYm6YNoBLsvGd6O778h7rnas748=
X-Google-Smtp-Source: AA6agR5WlAIwtMGq2U09tD3NTmolPRoQ9NxVlOdMXwmajGcei+hvyVFvRV+FeGTmxyAE9muS3XgrRg==
X-Received: by 2002:a17:90a:1b6e:b0:1f5:1902:af92 with SMTP id q101-20020a17090a1b6e00b001f51902af92mr18943428pjq.238.1662367868403;
        Mon, 05 Sep 2022 01:51:08 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com ([124.170.18.239])
        by smtp.gmail.com with ESMTPSA id m16-20020a63fd50000000b00434760ee36asm630195pgj.16.2022.09.05.01.51.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Sep 2022 01:51:07 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [RFC PATCH] powerpc: ideas to improve page table frag allocator
Date: Mon,  5 Sep 2022 18:50:55 +1000
Message-Id: <20220905085055.2990058-1-npiggin@gmail.com>
X-Mailer: git-send-email 2.37.2
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
Cc: Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The page table fragment allocator is a simple per-mm slab allocator.
It can be quite wasteful of space for small processes, as well as being
expensive to initialise.  It does not do well at NUMA awareness.

This is a quick hack at addressing some of those problems, but it's not
complete. It doesn't support THP because it doesn't deal with the page
table deposit. It has has certain cases where cross-CPU locking could be
increased (but also a reduction in other cases including reduction on
ptl). NUMA still has some corner case issues, but it is improved. So
it's not mergeable yet or necessarily the best way to solve the
problems. Just a quick hack for some testing.

It save 1-2MB on a simple distro boot on a small (4 CPU) system. The
powerpc fork selftests benchmark with --fork performance is improved by
15% on a POWER9 (14.5k/s -> 17k/s). This is just about a worst-case
microbenchmark, but would still be good to fix it.

What would really be nice is if we could avoid writing our own allocator
and use the slab allocator. The problem being we need a page table lock
spinlock associated with the page table, and that must be able to be
derived from the page table pointer, and I don't think slab has anything
that fits the bill.

Thanks,
Nick


diff --git a/arch/powerpc/mm/book3s64/pgtable.c b/arch/powerpc/mm/book3s64/pgtable.c
index 1c0603e57567..22304b7893d3 100644
--- a/arch/powerpc/mm/book3s64/pgtable.c
+++ b/arch/powerpc/mm/book3s64/pgtable.c
@@ -281,94 +281,6 @@ void mmu_partition_table_set_entry(unsigned int lpid, unsigned long dw0,
 }
 EXPORT_SYMBOL_GPL(mmu_partition_table_set_entry);
 
-static pmd_t *get_pmd_from_cache(struct mm_struct *mm)
-{
-	void *pmd_frag, *ret;
-
-	if (PMD_FRAG_NR == 1)
-		return NULL;
-
-	spin_lock(&mm->page_table_lock);
-	ret = mm->context.pmd_frag;
-	if (ret) {
-		pmd_frag = ret + PMD_FRAG_SIZE;
-		/*
-		 * If we have taken up all the fragments mark PTE page NULL
-		 */
-		if (((unsigned long)pmd_frag & ~PAGE_MASK) == 0)
-			pmd_frag = NULL;
-		mm->context.pmd_frag = pmd_frag;
-	}
-	spin_unlock(&mm->page_table_lock);
-	return (pmd_t *)ret;
-}
-
-static pmd_t *__alloc_for_pmdcache(struct mm_struct *mm)
-{
-	void *ret = NULL;
-	struct page *page;
-	gfp_t gfp = GFP_KERNEL_ACCOUNT | __GFP_ZERO;
-
-	if (mm == &init_mm)
-		gfp &= ~__GFP_ACCOUNT;
-	page = alloc_page(gfp);
-	if (!page)
-		return NULL;
-	if (!pgtable_pmd_page_ctor(page)) {
-		__free_pages(page, 0);
-		return NULL;
-	}
-
-	atomic_set(&page->pt_frag_refcount, 1);
-
-	ret = page_address(page);
-	/*
-	 * if we support only one fragment just return the
-	 * allocated page.
-	 */
-	if (PMD_FRAG_NR == 1)
-		return ret;
-
-	spin_lock(&mm->page_table_lock);
-	/*
-	 * If we find pgtable_page set, we return
-	 * the allocated page with single fragment
-	 * count.
-	 */
-	if (likely(!mm->context.pmd_frag)) {
-		atomic_set(&page->pt_frag_refcount, PMD_FRAG_NR);
-		mm->context.pmd_frag = ret + PMD_FRAG_SIZE;
-	}
-	spin_unlock(&mm->page_table_lock);
-
-	return (pmd_t *)ret;
-}
-
-pmd_t *pmd_fragment_alloc(struct mm_struct *mm, unsigned long vmaddr)
-{
-	pmd_t *pmd;
-
-	pmd = get_pmd_from_cache(mm);
-	if (pmd)
-		return pmd;
-
-	return __alloc_for_pmdcache(mm);
-}
-
-void pmd_fragment_free(unsigned long *pmd)
-{
-	struct page *page = virt_to_page(pmd);
-
-	if (PageReserved(page))
-		return free_reserved_page(page);
-
-	BUG_ON(atomic_read(&page->pt_frag_refcount) <= 0);
-	if (atomic_dec_and_test(&page->pt_frag_refcount)) {
-		pgtable_pmd_page_dtor(page);
-		__free_page(page);
-	}
-}
-
 static inline void pgtable_free(void *table, int index)
 {
 	switch (index) {
diff --git a/arch/powerpc/mm/init-common.c b/arch/powerpc/mm/init-common.c
index 119ef491f797..1df1714d5d99 100644
--- a/arch/powerpc/mm/init-common.c
+++ b/arch/powerpc/mm/init-common.c
@@ -150,6 +150,8 @@ void pgtable_cache_add(unsigned int shift)
 }
 EXPORT_SYMBOL_GPL(pgtable_cache_add);	/* used by kvm_hv module */
 
+void pt_frag_init(void);
+
 void pgtable_cache_init(void)
 {
 	pgtable_cache_add(PGD_INDEX_SIZE);
@@ -163,4 +165,6 @@ void pgtable_cache_init(void)
 	 */
 	if (PUD_CACHE_INDEX)
 		pgtable_cache_add(PUD_CACHE_INDEX);
+
+	pt_frag_init();
 }
diff --git a/arch/powerpc/mm/pgtable-frag.c b/arch/powerpc/mm/pgtable-frag.c
index 20652daa1d7e..7e97254fb670 100644
--- a/arch/powerpc/mm/pgtable-frag.c
+++ b/arch/powerpc/mm/pgtable-frag.c
@@ -15,108 +15,317 @@
 #include <asm/tlbflush.h>
 #include <asm/tlb.h>
 
+struct pt_frag {
+	struct page *page;
+	struct list_head list;
+	int cpu;
+	unsigned int nr_free;
+	void *free_ptr;
+	spinlock_t locks[];
+};
+
+struct pt_frag_alloc {
+	/*
+	 * The lock must disable bh because pte frags can be freed by RCU
+	 * when it runs in softirq context.
+	 */
+	spinlock_t lock;
+	size_t nr_free;
+	struct list_head freelist;
+	/* XXX: could make a remote freelist and only that needs locking,
+	 * atomic nr_allocated and the first freer would be responsible
+	 * for putting it on the correct queue
+	 */
+};
+
+static DEFINE_PER_CPU(struct pt_frag_alloc, pte_frag_alloc);
+static DEFINE_PER_CPU(struct pt_frag_alloc, pte_frag_alloc_kernel);
+static DEFINE_PER_CPU(struct pt_frag_alloc, pmd_frag_alloc);
+
 void pte_frag_destroy(void *pte_frag)
 {
-	int count;
-	struct page *page;
+}
 
-	page = virt_to_page(pte_frag);
-	/* drop all the pending references */
-	count = ((unsigned long)pte_frag & ~PAGE_MASK) >> PTE_FRAG_SIZE_SHIFT;
-	/* We allow PTE_FRAG_NR fragments from a PTE page */
-	if (atomic_sub_and_test(PTE_FRAG_NR - count, &page->pt_frag_refcount)) {
-		pgtable_pte_page_dtor(page);
-		__free_page(page);
+void pt_frag_init(void)
+{
+	int cpu;
+
+	for_each_possible_cpu(cpu) {
+		struct pt_frag_alloc *alloc;
+
+		alloc = per_cpu_ptr(&pte_frag_alloc, cpu);
+		spin_lock_init(&alloc->lock);
+		INIT_LIST_HEAD(&alloc->freelist);
+
+		alloc = per_cpu_ptr(&pte_frag_alloc_kernel, cpu);
+		spin_lock_init(&alloc->lock);
+		INIT_LIST_HEAD(&alloc->freelist);
+
+		alloc = per_cpu_ptr(&pmd_frag_alloc, cpu);
+		spin_lock_init(&alloc->lock);
+		INIT_LIST_HEAD(&alloc->freelist);
 	}
 }
 
-static pte_t *get_pte_from_cache(struct mm_struct *mm)
+static unsigned long pte_frag_idx(void *frag)
 {
-	void *pte_frag, *ret;
+	return ((unsigned long)frag & (PAGE_SIZE - 1)) >> PTE_FRAG_SIZE_SHIFT;
+}
 
-	if (PTE_FRAG_NR == 1)
-		return NULL;
+static unsigned long pmd_frag_idx(void *frag)
+{
+	return ((unsigned long)frag & (PAGE_SIZE - 1)) >> PMD_FRAG_SIZE_SHIFT;
+}
 
-	spin_lock(&mm->page_table_lock);
-	ret = pte_frag_get(&mm->context);
-	if (ret) {
-		pte_frag = ret + PTE_FRAG_SIZE;
-		/*
-		 * If we have taken up all the fragments mark PTE page NULL
-		 */
-		if (((unsigned long)pte_frag & ~PAGE_MASK) == 0)
-			pte_frag = NULL;
-		pte_frag_set(&mm->context, pte_frag);
+static void *get_pt_from_cache(struct mm_struct *mm, bool pte, bool kernel)
+{
+	struct pt_frag_alloc *alloc;
+
+	if (pte) {
+		if (kernel)
+			alloc = get_cpu_ptr(&pte_frag_alloc_kernel);
+		else
+			alloc = get_cpu_ptr(&pte_frag_alloc);
+	} else {
+		alloc = get_cpu_ptr(&pmd_frag_alloc);
 	}
-	spin_unlock(&mm->page_table_lock);
-	return (pte_t *)ret;
+
+	spin_lock_bh(&alloc->lock);
+	if (!list_empty(&alloc->freelist)) {
+		struct pt_frag *pt_frag = list_first_entry(&alloc->freelist,
+							struct pt_frag, list);
+		void *frag;
+
+		frag = pt_frag->free_ptr;
+		pt_frag->free_ptr = *((void **)frag);
+		*((void **)frag) = NULL;
+
+		pt_frag->nr_free--;
+		if (pt_frag->nr_free == 0)
+			list_del(&pt_frag->list);
+		alloc->nr_free--;
+		spin_unlock_bh(&alloc->lock);
+		put_cpu_ptr(alloc);
+
+		if (pte)
+			spin_lock_init(&pt_frag->locks[pte_frag_idx(frag)]);
+		else
+			spin_lock_init(&pt_frag->locks[pmd_frag_idx(frag)]);
+
+		return frag;
+	}
+
+	spin_unlock_bh(&alloc->lock);
+	put_cpu_ptr(alloc);
+
+	return NULL;
 }
 
-static pte_t *__alloc_for_ptecache(struct mm_struct *mm, int kernel)
+static void *__alloc_for_ptcache(struct mm_struct *mm, bool pte, bool kernel)
 {
-	void *ret = NULL;
+	size_t frag_size, frag_nr;
+	struct pt_frag_alloc *alloc;
+	void *frag;
 	struct page *page;
+	struct pt_frag *pt_frag;
+	unsigned long i;
+
+	if (pte) {
+		frag_size = PTE_FRAG_SIZE;
+		frag_nr = PTE_FRAG_NR;
+
+		if (!kernel) {
+			page = alloc_page(PGALLOC_GFP | __GFP_ACCOUNT);
+			if (!page)
+				return NULL;
+			if (!pgtable_pte_page_ctor(page)) {
+				__free_page(page);
+				return NULL;
+			}
+		} else {
+			page = alloc_page(PGALLOC_GFP);
+			if (!page)
+				return NULL;
+		}
 
-	if (!kernel) {
-		page = alloc_page(PGALLOC_GFP | __GFP_ACCOUNT);
+	} else {
+		/* This is slightly different from PTE, for some reason */
+		gfp_t gfp = GFP_KERNEL_ACCOUNT | __GFP_ZERO;
+
+		frag_size = PMD_FRAG_SIZE;
+		frag_nr = PMD_FRAG_NR;
+
+		if (kernel)
+			gfp &= ~__GFP_ACCOUNT;
+		page = alloc_page(gfp);
 		if (!page)
 			return NULL;
-		if (!pgtable_pte_page_ctor(page)) {
+		if (!pgtable_pmd_page_ctor(page)) {
 			__free_page(page);
 			return NULL;
 		}
-	} else {
-		page = alloc_page(PGALLOC_GFP);
-		if (!page)
-			return NULL;
 	}
 
-	atomic_set(&page->pt_frag_refcount, 1);
+	pt_frag = kmalloc(sizeof(struct pt_frag) + sizeof(spinlock_t) * frag_nr, GFP_KERNEL);
+	if (!pt_frag) {
+		if (!pte)
+			pgtable_pmd_page_dtor(page);
+		else if (!kernel)
+			pgtable_pte_page_dtor(page);
+		__free_page(page);
+		return NULL;
+	}
 
-	ret = page_address(page);
-	/*
-	 * if we support only one fragment just return the
-	 * allocated page.
-	 */
-	if (PTE_FRAG_NR == 1)
-		return ret;
-	spin_lock(&mm->page_table_lock);
-	/*
-	 * If we find pgtable_page set, we return
-	 * the allocated page with single fragment
-	 * count.
-	 */
-	if (likely(!pte_frag_get(&mm->context))) {
-		atomic_set(&page->pt_frag_refcount, PTE_FRAG_NR);
-		pte_frag_set(&mm->context, ret + PTE_FRAG_SIZE);
+	pt_frag->page = page;
+	pt_frag->nr_free = frag_nr - 1;
+
+	frag = page_address(page);
+
+	for (i = frag_size; i < PAGE_SIZE - frag_size; i += frag_size)
+		*((void **)(frag + i)) = frag + i + frag_size;
+	/* Last one will be NULL */
+
+	pt_frag->free_ptr = frag + frag_size;
+
+	page->pt_frag = pt_frag;
+
+	if (pte) {
+		if (kernel)
+			alloc = get_cpu_ptr(&pte_frag_alloc_kernel);
+		else
+			alloc = get_cpu_ptr(&pte_frag_alloc);
+	} else {
+		alloc = get_cpu_ptr(&pmd_frag_alloc);
 	}
-	spin_unlock(&mm->page_table_lock);
 
-	return (pte_t *)ret;
+	/* XXX: Confirm CPU (or at least node) here */
+
+	pt_frag->cpu = smp_processor_id();
+
+	spin_lock_bh(&alloc->lock);
+	alloc->nr_free += frag_nr - 1;
+	list_add_tail(&pt_frag->list, &alloc->freelist);
+	spin_unlock_bh(&alloc->lock);
+
+	put_cpu_ptr(alloc);
+
+	spin_lock_init(&pt_frag->locks[0]);
+
+	return frag;
 }
 
-pte_t *pte_fragment_alloc(struct mm_struct *mm, int kernel)
+static void *pt_fragment_alloc(struct mm_struct *mm, bool pte, bool kernel)
 {
-	pte_t *pte;
-
-	pte = get_pte_from_cache(mm);
-	if (pte)
-		return pte;
+	void *pt;
 
-	return __alloc_for_ptecache(mm, kernel);
+	pt = get_pt_from_cache(mm, pte, kernel);
+	if (unlikely(!pt))
+		pt = __alloc_for_ptcache(mm, pte, kernel);
+	return pt;
 }
 
-void pte_fragment_free(unsigned long *table, int kernel)
+static void pt_fragment_free(void *frag, bool pte, bool kernel)
 {
-	struct page *page = virt_to_page(table);
+	struct pt_frag_alloc *alloc;
+	struct page *page;
+	struct pt_frag *pt_frag;
+	size_t frag_nr;
+
+	page = virt_to_page(frag);
+	pt_frag = page->pt_frag;
+
+	if (pte) {
+		frag_nr = PTE_FRAG_NR;
+
+		if (unlikely(PageReserved(page)))
+			return free_reserved_page(page);
 
-	if (PageReserved(page))
-		return free_reserved_page(page);
+		if (kernel)
+			alloc = per_cpu_ptr(&pte_frag_alloc_kernel, pt_frag->cpu);
+		else
+			alloc = per_cpu_ptr(&pte_frag_alloc, pt_frag->cpu);
+	} else {
+		frag_nr = PMD_FRAG_NR;
+
+		alloc = per_cpu_ptr(&pmd_frag_alloc, pt_frag->cpu);
+	}
+
+	spin_lock_bh(&alloc->lock);
+
+	if (pt_frag->nr_free == 0)
+		list_add_tail(&pt_frag->list, &alloc->freelist);
+
+	pt_frag->nr_free++;
+
+	*((void **)frag) = pt_frag->free_ptr;
+	pt_frag->free_ptr = frag;
 
-	BUG_ON(atomic_read(&page->pt_frag_refcount) <= 0);
-	if (atomic_dec_and_test(&page->pt_frag_refcount)) {
-		if (!kernel)
+	alloc->nr_free++;
+
+	if (alloc->nr_free >= frag_nr * 2 && pt_frag->nr_free == frag_nr) {
+		list_del(&pt_frag->list);
+		alloc->nr_free -= frag_nr;
+		spin_unlock_bh(&alloc->lock);
+		if (!pte)
+			pgtable_pmd_page_dtor(page);
+		else if (!kernel)
 			pgtable_pte_page_dtor(page);
 		__free_page(page);
+		kfree(pt_frag);
+	} else {
+		spin_unlock_bh(&alloc->lock);
 	}
 }
+
+pte_t *pte_fragment_alloc(struct mm_struct *mm, int kernel)
+{
+	return pt_fragment_alloc(mm, true, !!kernel);
+}
+
+void pte_fragment_free(unsigned long *pte, int kernel)
+{
+	pt_fragment_free(pte, true, !!kernel);
+}
+
+pmd_t *pmd_fragment_alloc(struct mm_struct *mm, unsigned long vmaddr)
+{
+	bool kernel = (mm == &init_mm);
+
+	return pt_fragment_alloc(mm, false, kernel);
+}
+
+void pmd_fragment_free(unsigned long *pmd)
+{
+	pt_fragment_free(pmd, false, false /* XXX? */);
+}
+
+spinlock_t *pte_lockptr(struct mm_struct *mm, pmd_t *pmd)
+{
+	struct page *page;
+	struct pt_frag *pt_frag;
+	void *frag;
+
+	frag = (void *)pmd_page_vaddr(*pmd);
+	page = virt_to_page(frag);
+	pt_frag = page->pt_frag;
+
+	return &pt_frag->locks[pte_frag_idx(frag)];
+}
+
+spinlock_t *pmd_lockptr(struct mm_struct *mm, pmd_t *pmd)
+{
+	struct page *page;
+	struct pt_frag *pt_frag;
+	void *frag;
+
+	frag = (void *)pmd;
+	page = pmd_to_page(pmd);
+	pt_frag = page->pt_frag;
+
+	return &pt_frag->locks[pmd_frag_idx(frag)];
+}
+
+bool ptlock_init(struct page *page)
+{
+	return true;
+}
diff --git a/include/linux/mm.h b/include/linux/mm.h
index cf3d0d673f6b..3bae8d8e25e2 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -2286,6 +2286,10 @@ static inline spinlock_t *ptlock_ptr(struct page *page)
 }
 #endif /* ALLOC_SPLIT_PTLOCKS */
 
+spinlock_t *pte_lockptr(struct mm_struct *mm, pmd_t *pmd);
+bool ptlock_init(struct page *page);
+
+#if 0
 static inline spinlock_t *pte_lockptr(struct mm_struct *mm, pmd_t *pmd)
 {
 	return ptlock_ptr(pmd_page(*pmd));
@@ -2306,6 +2310,7 @@ static inline bool ptlock_init(struct page *page)
 	spin_lock_init(ptlock_ptr(page));
 	return true;
 }
+#endif
 
 #else	/* !USE_SPLIT_PTE_PTLOCKS */
 /*
@@ -2371,16 +2376,19 @@ static inline void pgtable_pte_page_dtor(struct page *page)
 
 #if USE_SPLIT_PMD_PTLOCKS
 
-static struct page *pmd_to_page(pmd_t *pmd)
+static inline struct page *pmd_to_page(pmd_t *pmd)
 {
 	unsigned long mask = ~(PTRS_PER_PMD * sizeof(pmd_t) - 1);
 	return virt_to_page((void *)((unsigned long) pmd & mask));
 }
 
+#if 0
 static inline spinlock_t *pmd_lockptr(struct mm_struct *mm, pmd_t *pmd)
 {
 	return ptlock_ptr(pmd_to_page(pmd));
 }
+#endif
+spinlock_t *pmd_lockptr(struct mm_struct *mm, pmd_t *pmd);
 
 static inline bool pmd_ptlock_init(struct page *page)
 {
diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
index c29ab4c0cd5c..5517bbeeee37 100644
--- a/include/linux/mm_types.h
+++ b/include/linux/mm_types.h
@@ -152,6 +152,7 @@ struct page {
 			unsigned long _pt_pad_2;	/* mapping */
 			union {
 				struct mm_struct *pt_mm; /* x86 pgds only */
+				void *pt_frag; /* powerpc */
 				atomic_t pt_frag_refcount; /* powerpc */
 			};
 #if ALLOC_SPLIT_PTLOCKS
