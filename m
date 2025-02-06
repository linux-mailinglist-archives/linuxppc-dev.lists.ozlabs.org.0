Return-Path: <linuxppc-dev+bounces-5909-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EA5AFA2B1A4
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Feb 2025 19:52:07 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YpmRn38YRz30Lt;
	Fri,  7 Feb 2025 05:52:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::1049"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1738867925;
	cv=none; b=Bvp8AdQLiYJfWqB64r/Znz5z+NZiee1mhiLv4tFPSxeCIr/Bpv3UlgNdBwHGFSUa95wKlcQSTtP0GccjuhQb/SI6Muvw10MWS5cWirJ9H8kGcr6PQ+Ikdo7uGuWUf2B26LFg0wHMnuEYcRPYI6ESJEjFLi2FcCMz3TJYmoXDns6HVmcU+p/P/14R3nh6NLa/JBrmE9tlGqCe9zmU0vOjcG/+usuovS710GUPCj4bK/z+l9oZ7x8+pEz4NfvjUigXGUiKOI1Gc38naAuR3zghXE6epQnituHMQX0kjalzbK3g0ATzr+Eh7q/aL4TDwDjQMZij1h1sFz0YglgT+b/v/w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1738867925; c=relaxed/relaxed;
	bh=9FHf7X3ntolDh58znF+Bk2cZ6pAkHciPEwA7XP/h9Ew=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=FZbmoMSWSxxZUl4lcScMXSqOFcZY5fMjSbWB6gFLFIcfnrqrvczJIHis/uB7T7Tq89QkE6BWOLg1K+LuCgWwpRp4XaPrLINp/u/c18pErTo/XEJ8rev1J9uNwSr5bjbEajiRdOwZ454oLxi6LoSp03Py6XBQ+oR4/TZTqPodWG1z7SLAtzrRXCEewJKwiDS4xCTBIawCSyhiNbd5EJJAa7L6xtad6DeEr1wqLLwWUOSaDWdEgV+z4rvCOsY1uuJQ0u6u/trSXwNR0SX5wyKxErzozcMG4n55R5QjQmt0AqBtwBeP7D83/LsfWuAvqHDLTWvfHO6MjLTnoDOj+KL42w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=rtr+GrWy; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::1049; helo=mail-pj1-x1049.google.com; envelope-from=30aslzwqkdlewmucxffxcv.tfdczeloggt-uvmczjkj.fqcrsj.fix@flex--fvdl.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--fvdl.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=rtr+GrWy;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--fvdl.bounces.google.com (client-ip=2607:f8b0:4864:20::1049; helo=mail-pj1-x1049.google.com; envelope-from=30aslzwqkdlewmucxffxcv.tfdczeloggt-uvmczjkj.fqcrsj.fix@flex--fvdl.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x1049.google.com (mail-pj1-x1049.google.com [IPv6:2607:f8b0:4864:20::1049])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YpmRl6nlJz2yWr
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Feb 2025 05:52:03 +1100 (AEDT)
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-2f5538a2356so2572307a91.2
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 06 Feb 2025 10:52:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738867920; x=1739472720; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=9FHf7X3ntolDh58znF+Bk2cZ6pAkHciPEwA7XP/h9Ew=;
        b=rtr+GrWyikVNrQtKDW6BqS3hQQxMVS7mvImvwUjfKT0aB46i81nr69UgUW4nEO7l5b
         ET/y/LH+37wq0VbFWLab6ri/qsT6z+yu57HPN4//9rZjiq9pugRbcee2YnWJS9vKuIUi
         P9HC4wtZnEdSPrOVJ9K/Uxwan9A6/NesUaJQiUypMe51hosQKf75P8Vk04zvZakF8lwC
         65+mbnqtVnWRQdmhrb3adYTvUUl8Xzr0Wwa1o10VAAbv8WGTSQFJdmt6dmHcn3B48S1F
         t1lvx1HvLxgOMvN9Joxq7moMrEzNIKfVkw+ZCXXFZ3pki7uf+pTJH7s0A78pyUNQJhfK
         kHIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738867920; x=1739472720;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9FHf7X3ntolDh58znF+Bk2cZ6pAkHciPEwA7XP/h9Ew=;
        b=P2nMh3jSSnhPayinjjJZpsuD+vzMQZamuJVQ08JFGsC6PkoFE/tlUDj1dNrDFQOzWe
         8/VdsaR5mn+W2/QNLrHFiTt17iIFHmQ5yJ8K7fbTKNQLsQjp0fi2+CGQtOTgPnj4qL7K
         VDtX2wiQILkmI7kS2CbqgpEMbgBFCKyp0DkYtfikQ+vuC6OP60gzXaW0tpO2SxOd8z6V
         ak3VGqvg+UISLO9LVG5S60yaz9PEAB8DIlw8z0SelE2xURnPSClLgr93PJR6eJE9cszj
         T1hqIf+bwqZKMbfrCnNkt5d44Qmnnn7FfmigNP4BVOYYDjF2b1Em2+rxJo8bpIy2F3bG
         /mpw==
X-Forwarded-Encrypted: i=1; AJvYcCWxHheHpBnm6b6mFTKruzn4lUidYpZwyD7VlWeC0UqjFiuVoInpqub6PjdJM1TpO8i2YhLNxq4ndE8DUtg=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Ywb9eLIqGws2D5c9v+8Iule2gMthxAMSPi3WcvI6xrytSlMXeri
	ZGO8KmmfBxhC2s0srnd8r6H0VUnXdXG2xyEGRCUeEKpErRSakHpEHRj610w/cvTqtVZjwg==
X-Google-Smtp-Source: AGHT+IF0hEN8V7uU06C9tElOiOiDXvl7WJ62royjKbG+oprlqtroJ24zLedDhZAejMw2Fg4HCqLgipPv
X-Received: from pfej4.prod.google.com ([2002:aa7:8d04:0:b0:725:c7de:e052])
 (user=fvdl job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:4615:b0:72d:35ed:214b
 with SMTP id d2e1a72fcca58-7305d515e41mr566746b3a.24.1738867920500; Thu, 06
 Feb 2025 10:52:00 -0800 (PST)
Date: Thu,  6 Feb 2025 18:51:07 +0000
In-Reply-To: <20250206185109.1210657-1-fvdl@google.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Mime-Version: 1.0
References: <20250206185109.1210657-1-fvdl@google.com>
X-Mailer: git-send-email 2.48.1.502.g6dc24dfdaf-goog
Message-ID: <20250206185109.1210657-28-fvdl@google.com>
Subject: [PATCH v3 27/28] mm/hugetlb: enable bootmem allocation from CMA areas
From: Frank van der Linden <fvdl@google.com>
To: akpm@linux-foundation.org, muchun.song@linux.dev, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Cc: yuzhao@google.com, usamaarif642@gmail.com, joao.m.martins@oracle.com, 
	roman.gushchin@linux.dev, Frank van der Linden <fvdl@google.com>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

If hugetlb_cma_only is enabled, we know that hugetlb pages
can only be allocated from CMA. Now that there is an interface
to do early reservations from a CMA area (returning memblock
memory), it can be used to allocate hugetlb pages from CMA.

This also allows for doing pre-HVO on these pages (if enabled).

Make sure to initialize the page structures and associated data
correctly. Create a flag to signal that a hugetlb page has been
allocated from CMA to make things a little easier.

Some configurations of powerpc have a special hugetlb bootmem
allocator, so introduce a boolean arch_specific_huge_bootmem_alloc
that returns true if such an allocator is present. In that case,
CMA bootmem allocations can't be used, so check that function
before trying.

Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: linuxppc-dev@lists.ozlabs.org
Signed-off-by: Frank van der Linden <fvdl@google.com>
---
 arch/powerpc/include/asm/book3s/64/hugetlb.h |   6 +
 include/linux/hugetlb.h                      |  17 +++
 mm/hugetlb.c                                 | 121 ++++++++++++++-----
 3 files changed, 113 insertions(+), 31 deletions(-)

diff --git a/arch/powerpc/include/asm/book3s/64/hugetlb.h b/arch/powerpc/include/asm/book3s/64/hugetlb.h
index f0bba9c5f9c3..bb786694dd26 100644
--- a/arch/powerpc/include/asm/book3s/64/hugetlb.h
+++ b/arch/powerpc/include/asm/book3s/64/hugetlb.h
@@ -94,4 +94,10 @@ static inline int check_and_get_huge_psize(int shift)
 	return mmu_psize;
 }
 
+#define arch_has_huge_bootmem_alloc arch_has_huge_bootmem_alloc
+
+static inline bool arch_has_huge_bootmem_alloc(void)
+{
+	return (firmware_has_feature(FW_FEATURE_LPAR) && !radix_enabled());
+}
 #endif
diff --git a/include/linux/hugetlb.h b/include/linux/hugetlb.h
index 2512463bca49..6c6546b54934 100644
--- a/include/linux/hugetlb.h
+++ b/include/linux/hugetlb.h
@@ -591,6 +591,7 @@ enum hugetlb_page_flags {
 	HPG_freed,
 	HPG_vmemmap_optimized,
 	HPG_raw_hwp_unreliable,
+	HPG_cma,
 	__NR_HPAGEFLAGS,
 };
 
@@ -650,6 +651,7 @@ HPAGEFLAG(Temporary, temporary)
 HPAGEFLAG(Freed, freed)
 HPAGEFLAG(VmemmapOptimized, vmemmap_optimized)
 HPAGEFLAG(RawHwpUnreliable, raw_hwp_unreliable)
+HPAGEFLAG(Cma, cma)
 
 #ifdef CONFIG_HUGETLB_PAGE
 
@@ -678,14 +680,18 @@ struct hstate {
 	char name[HSTATE_NAME_LEN];
 };
 
+struct cma;
+
 struct huge_bootmem_page {
 	struct list_head list;
 	struct hstate *hstate;
 	unsigned long flags;
+	struct cma *cma;
 };
 
 #define HUGE_BOOTMEM_HVO		0x0001
 #define HUGE_BOOTMEM_ZONES_VALID	0x0002
+#define HUGE_BOOTMEM_CMA		0x0004
 
 bool hugetlb_bootmem_page_zones_valid(int nid, struct huge_bootmem_page *m);
 
@@ -823,6 +829,17 @@ static inline pte_t arch_make_huge_pte(pte_t entry, unsigned int shift,
 }
 #endif
 
+#ifndef arch_has_huge_bootmem_alloc
+/*
+ * Some architectures do their own bootmem allocation, so they can't use
+ * early CMA allocation.
+ */
+static inline bool arch_has_huge_bootmem_alloc(void)
+{
+	return false;
+}
+#endif
+
 static inline struct hstate *folio_hstate(struct folio *folio)
 {
 	VM_BUG_ON_FOLIO(!folio_test_hugetlb(folio), folio);
diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index 24a06d6d3617..737ffd223d45 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -131,8 +131,10 @@ static void hugetlb_free_folio(struct folio *folio)
 #ifdef CONFIG_CMA
 	int nid = folio_nid(folio);
 
-	if (cma_free_folio(hugetlb_cma[nid], folio))
+	if (folio_test_hugetlb_cma(folio)) {
+		WARN_ON_ONCE(!cma_free_folio(hugetlb_cma[nid], folio));
 		return;
+	}
 #endif
 	folio_put(folio);
 }
@@ -1508,6 +1510,9 @@ static struct folio *alloc_gigantic_folio(struct hstate *h, gfp_t gfp_mask,
 					break;
 			}
 		}
+
+		if (folio)
+			folio_set_hugetlb_cma(folio);
 	}
 #endif
 	if (!folio) {
@@ -3174,6 +3179,53 @@ struct folio *alloc_hugetlb_folio(struct vm_area_struct *vma,
 	return ERR_PTR(-ENOSPC);
 }
 
+static bool __init hugetlb_early_cma(struct hstate *h)
+{
+	if (arch_has_huge_bootmem_alloc())
+		return false;
+
+	return (hstate_is_gigantic(h) && hugetlb_cma_only);
+}
+
+static __init void *alloc_bootmem(struct hstate *h, int nid)
+{
+	struct huge_bootmem_page *m;
+	unsigned long flags;
+	struct cma *cma;
+
+#ifdef CONFIG_CMA
+	if (hugetlb_early_cma(h)) {
+		flags = HUGE_BOOTMEM_CMA;
+		cma = hugetlb_cma[nid];
+		m = cma_reserve_early(cma, huge_page_size(h));
+	} else
+#endif
+	{
+		flags = 0;
+		cma = NULL;
+		m = memblock_alloc_try_nid_raw(huge_page_size(h),
+			huge_page_size(h), 0, MEMBLOCK_ALLOC_ACCESSIBLE, nid);
+	}
+
+	if (m) {
+		/*
+		 * Use the beginning of the huge page to store the
+		 * huge_bootmem_page struct (until gather_bootmem
+		 * puts them into the mem_map).
+		 *
+		 * Put them into a private list first because mem_map
+		 * is not up yet.
+		 */
+		INIT_LIST_HEAD(&m->list);
+		list_add(&m->list, &huge_boot_pages[nid]);
+		m->hstate = h;
+		m->flags = flags;
+		m->cma = cma;
+	}
+
+	return m;
+}
+
 int alloc_bootmem_huge_page(struct hstate *h, int nid)
 	__attribute__ ((weak, alias("__alloc_bootmem_huge_page")));
 int __alloc_bootmem_huge_page(struct hstate *h, int nid)
@@ -3183,17 +3235,14 @@ int __alloc_bootmem_huge_page(struct hstate *h, int nid)
 
 	/* do node specific alloc */
 	if (nid != NUMA_NO_NODE) {
-		m = memblock_alloc_try_nid_raw(huge_page_size(h), huge_page_size(h),
-				0, MEMBLOCK_ALLOC_ACCESSIBLE, nid);
+		m = alloc_bootmem(h, node);
 		if (!m)
 			return 0;
 		goto found;
 	}
 	/* allocate from next node when distributing huge pages */
 	for_each_node_mask_to_alloc(&h->next_nid_to_alloc, nr_nodes, node, &node_states[N_ONLINE]) {
-		m = memblock_alloc_try_nid_raw(
-				huge_page_size(h), huge_page_size(h),
-				0, MEMBLOCK_ALLOC_ACCESSIBLE, node);
+		m = alloc_bootmem(h, node);
 		if (m)
 			break;
 	}
@@ -3202,7 +3251,6 @@ int __alloc_bootmem_huge_page(struct hstate *h, int nid)
 		return 0;
 
 found:
-
 	/*
 	 * Only initialize the head struct page in memmap_init_reserved_pages,
 	 * rest of the struct pages will be initialized by the HugeTLB
@@ -3212,18 +3260,6 @@ int __alloc_bootmem_huge_page(struct hstate *h, int nid)
 	 */
 	memblock_reserved_mark_noinit(virt_to_phys((void *)m + PAGE_SIZE),
 		huge_page_size(h) - PAGE_SIZE);
-	/*
-	 * Use the beginning of the huge page to store the
-	 * huge_bootmem_page struct (until gather_bootmem
-	 * puts them into the mem_map).
-	 *
-	 * Put them into a private list first because mem_map
-	 * is not up yet.
-	 */
-	INIT_LIST_HEAD(&m->list);
-	list_add(&m->list, &huge_boot_pages[node]);
-	m->hstate = h;
-	m->flags = 0;
 	return 1;
 }
 
@@ -3264,13 +3300,25 @@ static void __init hugetlb_folio_init_vmemmap(struct folio *folio,
 	prep_compound_head((struct page *)folio, huge_page_order(h));
 }
 
+static bool __init hugetlb_bootmem_page_prehvo(struct huge_bootmem_page *m)
+{
+	return m->flags & HUGE_BOOTMEM_HVO;
+}
+
+static bool __init hugetlb_bootmem_page_earlycma(struct huge_bootmem_page *m)
+{
+	return m->flags & HUGE_BOOTMEM_CMA;
+}
+
 /*
  * memblock-allocated pageblocks might not have the migrate type set
  * if marked with the 'noinit' flag. Set it to the default (MIGRATE_MOVABLE)
- * here.
+ * here, or MIGRATE_CMA if this was a page allocated through an early CMA
+ * reservation.
  *
- * Note that this will not write the page struct, it is ok (and necessary)
- * to do this on vmemmap optimized folios.
+ * In case of vmemmap optimized folios, the tail vmemmap pages are mapped
+ * read-only, but that's ok - for sparse vmemmap this does not write to
+ * the page structure.
  */
 static void __init hugetlb_bootmem_init_migratetype(struct folio *folio,
 							  struct hstate *h)
@@ -3279,9 +3327,13 @@ static void __init hugetlb_bootmem_init_migratetype(struct folio *folio,
 
 	WARN_ON_ONCE(!pageblock_aligned(folio_pfn(folio)));
 
-	for (i = 0; i < nr_pages; i += pageblock_nr_pages)
-		set_pageblock_migratetype(folio_page(folio, i),
+	for (i = 0; i < nr_pages; i += pageblock_nr_pages) {
+		if (folio_test_hugetlb_cma(folio))
+			init_cma_pageblock(folio_page(folio, i));
+		else
+			set_pageblock_migratetype(folio_page(folio, i),
 					  MIGRATE_MOVABLE);
+	}
 }
 
 static void __init prep_and_add_bootmem_folios(struct hstate *h,
@@ -3327,10 +3379,16 @@ bool __init hugetlb_bootmem_page_zones_valid(int nid,
 		return true;
 	}
 
+	if (hugetlb_bootmem_page_earlycma(m)) {
+		valid = cma_validate_zones(m->cma);
+		goto out;
+	}
+
 	start_pfn = virt_to_phys(m) >> PAGE_SHIFT;
 
 	valid = !pfn_range_intersects_zones(nid, start_pfn,
 			pages_per_huge_page(m->hstate));
+out:
 	if (!valid)
 		hstate_boot_nrinvalid[hstate_index(m->hstate)]++;
 
@@ -3359,11 +3417,6 @@ static void __init hugetlb_bootmem_free_invalid_page(int nid, struct page *page,
 	}
 }
 
-static bool __init hugetlb_bootmem_page_prehvo(struct huge_bootmem_page *m)
-{
-	return (m->flags & HUGE_BOOTMEM_HVO);
-}
-
 /*
  * Put bootmem huge pages into the standard lists after mem_map is up.
  * Note: This only applies to gigantic (order > MAX_PAGE_ORDER) pages.
@@ -3413,6 +3466,9 @@ static void __init gather_bootmem_prealloc_node(unsigned long nid)
 			 */
 			folio_set_hugetlb_vmemmap_optimized(folio);
 
+		if (hugetlb_bootmem_page_earlycma(m))
+			folio_set_hugetlb_cma(folio);
+
 		list_add(&folio->lru, &folio_list);
 
 		/*
@@ -3605,8 +3661,11 @@ static void __init hugetlb_hstate_alloc_pages(struct hstate *h)
 {
 	unsigned long allocated;
 
-	/* skip gigantic hugepages allocation if hugetlb_cma enabled */
-	if (hstate_is_gigantic(h) && hugetlb_cma_size) {
+	/*
+	 * Skip gigantic hugepages allocation if early CMA
+	 * reservations are not available.
+	 */
+	if (hstate_is_gigantic(h) && hugetlb_cma_size && !hugetlb_early_cma(h)) {
 		pr_warn_once("HugeTLB: hugetlb_cma is enabled, skip boot time allocation\n");
 		return;
 	}
-- 
2.48.1.502.g6dc24dfdaf-goog


