Return-Path: <linuxppc-dev+bounces-6580-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 42EECA4A198
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Feb 2025 19:30:39 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z4Gwq3L7Xz3btk;
	Sat,  1 Mar 2025 05:30:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::104a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1740767435;
	cv=none; b=R7NxV4yLhgJWJdl2IW+FGxx3ftjvVEhMbHBGTBnskrVJz+PZG6CoPYLiH+NMAQrFGrEUvy0EKKuHwahM2RgRm6HlgwxhyP8iPNUsYLrgU5m3FxLspN41IKvV7IHDKwHp03u5jmFxBiVKoznynVHPNhcfZWPTTUwx1vnIanuvcT5SkD1TeVmyCTvYKGFzXhzBDdci1wB0xhRB+Z9iAx11k5fOQwhMNbFTaDu8y3mQ7UmkB8TcxQrCrtMnxUuuLk2uwM7TYsOTdZvSxzCAmPfbMcxXOKjC091aoBQNxlX7FKiZgTjseHl1EjeWGPUJIjmlk8zwHhsZLz3/iG4FRMbfZw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1740767435; c=relaxed/relaxed;
	bh=TMe19yWV86sRu83AfjzN0OeG5+sON+m39CVh+mgprHg=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Bu2fHLtx5z+YzLx3DjrFmEvi2Ii+GpL2Ha8ICjHdvrZjKCaG0rIHlcwdm+jMZ1Nrpygg1fBDLHMtNkLRRhbaMijqbpwWfs6FJeTC1NI+Auv812BXXj0WyCuqz/Cm1+A1rgUkRMunr0RhWZKcdsfe0Er7a1o54cYdjxMZ7kRTvbQK9PxRqIesf6PoXtv0exzRld7BDpByxNw5FOSHWQabk8wWCSfHcVA8V53Uoua+RAq00U+JDF1uWdwUR8qSE3xqL6W2Ju3UUu7w4cFB44mC3y4jtHrlglGe2ldSRxH1M8x3t80KjLj1FYRd2ehUfHuADs5STdRV2VBBQzO/Pf69Rw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=qZ8pOle5; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::104a; helo=mail-pj1-x104a.google.com; envelope-from=3xgdczwqkdbu0gy619916z.x97638fiaax-yzg63ded.9k6vwd.9c1@flex--fvdl.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--fvdl.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=qZ8pOle5;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--fvdl.bounces.google.com (client-ip=2607:f8b0:4864:20::104a; helo=mail-pj1-x104a.google.com; envelope-from=3xgdczwqkdbu0gy619916z.x97638fiaax-yzg63ded.9k6vwd.9c1@flex--fvdl.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x104a.google.com (mail-pj1-x104a.google.com [IPv6:2607:f8b0:4864:20::104a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Z4Gwn59Rcz30gC
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  1 Mar 2025 05:30:32 +1100 (AEDT)
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-2fea8e4a655so6940629a91.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Feb 2025 10:30:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1740767431; x=1741372231; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=TMe19yWV86sRu83AfjzN0OeG5+sON+m39CVh+mgprHg=;
        b=qZ8pOle5wRXG0rAv/sfnX4KosunE8ftWZm79YRd5If7FgfYx+xJiw8RvlHj9xacMQM
         4aqFo8W+mU/xdN5zNyGC3tm62VS9UiJj7ujjkxIMaW/ahBwgiWdSLZn6Tz1J0Re4LxDI
         VXXBPgypoc2cwmJdzilkrxHgpfb6xz/UUSB6YFaQutrh5I1eWR/jiyyW6e6QPNsOewWN
         fOPseHH8dw7IuX5z0iF5k9XvAJ5aCbsVp6o2aSVC0IF+mro8NNbwi+zRqZGGxaB1rvZX
         E4r6wGID18ucE/PdujHFmX5FeDAG2PKb0B37BAIDmD3weMkx0Qu4XvxQwFdvUyuhHpQD
         SeDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740767431; x=1741372231;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TMe19yWV86sRu83AfjzN0OeG5+sON+m39CVh+mgprHg=;
        b=FnGB5imznlVsYsD294ZMu+zCxaxjYLN64uyEZozxq+VFkWWIGIpZLAgcqVmKoy3yj9
         dQmE06JENCW1L4YrcY1NfHHP6/TAss0i5z2eO7JIfT/kg+O99y744mChI7IgGS3MwyFR
         1jfn/jscwSgSOuzg2HZ8ijZHuxv2EJiler2ZlDZkTI7NAV0XTECrbAdCJMQz+lXP2V2M
         r1GtN4gT+XwpQtH9xm/fykx2J2G5Y6WTe6/QUmr3gEgUSDvmAX2fSqAzIRhewi8+c5cm
         8qXeCC4Sf48YzREA7mfuoNlB5F1pEkGhSmYPonK/Uus8ZoejWkauUzGEbZ+JKJuT5sNO
         yBpQ==
X-Forwarded-Encrypted: i=1; AJvYcCXmN1SVmA5eYkvxAwM6i9YYnEjJLhjxFyO1Q9brKhXXnkz1ETKCHNlLpbc0jtNNNVkRv4Xn4JiuChxdKrg=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwrrvO5PC+2we1fFX6z7kgqBNV7sj7dOLpLxucAezTCYrkjlv5w
	tQlBGZctcSA8RKePaeb31WXadyaUGwOPE2zIEhWFWlgVpWOazABaI1iMVtE0O3+XfHnuqg==
X-Google-Smtp-Source: AGHT+IFdDufRUVuOA2NiFtFscHtFYi1z0zZ+G49tzlylohpjZ77dDf1/vb2nPMiEU/5Q5ipJa4U2fDbm
X-Received: from pjbsr16.prod.google.com ([2002:a17:90b:4e90:b0:2fa:2891:e310])
 (user=fvdl job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:3d0a:b0:2f6:be57:49d2
 with SMTP id 98e67ed59e1d1-2febab7459bmr8199787a91.17.1740767430763; Fri, 28
 Feb 2025 10:30:30 -0800 (PST)
Date: Fri, 28 Feb 2025 18:29:27 +0000
In-Reply-To: <20250228182928.2645936-1-fvdl@google.com>
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
References: <20250228182928.2645936-1-fvdl@google.com>
X-Mailer: git-send-email 2.48.1.711.g2feabab25a-goog
Message-ID: <20250228182928.2645936-27-fvdl@google.com>
Subject: [PATCH v5 26/27] mm/hugetlb: enable bootmem allocation from CMA areas
From: Frank van der Linden <fvdl@google.com>
To: akpm@linux-foundation.org, muchun.song@linux.dev, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Cc: yuzhao@google.com, usamaarif642@gmail.com, joao.m.martins@oracle.com, 
	roman.gushchin@linux.dev, ziy@nvidia.com, david@redhat.com, 
	Frank van der Linden <fvdl@google.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org
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
 include/linux/hugetlb.h                      |  17 ++
 mm/hugetlb.c                                 | 168 ++++++++++++++-----
 3 files changed, 152 insertions(+), 39 deletions(-)

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
index 0b483c466656..664ccaaa717a 100644
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
@@ -3174,6 +3179,86 @@ struct folio *alloc_hugetlb_folio(struct vm_area_struct *vma,
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
+static __init void *alloc_bootmem(struct hstate *h, int nid, bool node_exact)
+{
+	struct huge_bootmem_page *m;
+	unsigned long flags;
+	struct cma *cma;
+	int listnode = nid;
+
+#ifdef CONFIG_CMA
+	if (hugetlb_early_cma(h)) {
+		flags = HUGE_BOOTMEM_CMA;
+		cma = hugetlb_cma[nid];
+		m = cma_reserve_early(cma, huge_page_size(h));
+		if (!m) {
+			int node;
+
+			if (node_exact)
+				return NULL;
+			for_each_online_node(node) {
+				cma = hugetlb_cma[node];
+				if (!cma || node == nid)
+					continue;
+				m = cma_reserve_early(cma, huge_page_size(h));
+				if (m) {
+					listnode = node;
+					break;
+				}
+			}
+		}
+	} else
+#endif
+	{
+		flags = 0;
+		cma = NULL;
+		if (node_exact)
+			m = memblock_alloc_exact_nid_raw(huge_page_size(h),
+				huge_page_size(h), 0,
+				MEMBLOCK_ALLOC_ACCESSIBLE, nid);
+		else {
+			m = memblock_alloc_try_nid_raw(huge_page_size(h),
+				huge_page_size(h), 0,
+				MEMBLOCK_ALLOC_ACCESSIBLE, nid);
+			/*
+			 * For pre-HVO to work correctly, pages need to be on
+			 * the list for the node they were actually allocated
+			 * from. That node may be different in the case of
+			 * fallback by memblock_alloc_try_nid_raw. So,
+			 * extract the actual node first.
+			 */
+			if (m)
+				listnode = early_pfn_to_nid(PHYS_PFN(virt_to_phys(m)));
+		}
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
+		list_add(&m->list, &huge_boot_pages[listnode]);
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
@@ -3183,22 +3268,15 @@ int __alloc_bootmem_huge_page(struct hstate *h, int nid)
 
 	/* do node specific alloc */
 	if (nid != NUMA_NO_NODE) {
-		m = memblock_alloc_exact_nid_raw(huge_page_size(h), huge_page_size(h),
-				0, MEMBLOCK_ALLOC_ACCESSIBLE, nid);
+		m = alloc_bootmem(h, node, true);
 		if (!m)
 			return 0;
 		goto found;
 	}
+
 	/* allocate from next node when distributing huge pages */
 	for_each_node_mask_to_alloc(&h->next_nid_to_alloc, nr_nodes, node, &node_states[N_ONLINE]) {
-		m = memblock_alloc_try_nid_raw(
-				huge_page_size(h), huge_page_size(h),
-				0, MEMBLOCK_ALLOC_ACCESSIBLE, node);
-		/*
-		 * Use the beginning of the huge page to store the
-		 * huge_bootmem_page struct (until gather_bootmem
-		 * puts them into the mem_map).
-		 */
+		m = alloc_bootmem(h, node, false);
 		if (!m)
 			return 0;
 		goto found;
@@ -3216,21 +3294,6 @@ int __alloc_bootmem_huge_page(struct hstate *h, int nid)
 	memblock_reserved_mark_noinit(virt_to_phys((void *)m + PAGE_SIZE),
 		huge_page_size(h) - PAGE_SIZE);
 
-	/*
-	 * Put them into a private list first because mem_map is not up yet.
-	 *
-	 * For pre-HVO to work correctly, pages need to be on the list for
-	 * the node they were actually allocated from. That node may be
-	 * different in the case of fallback by memblock_alloc_try_nid_raw.
-	 * So, extract the actual node first.
-	 */
-	if (nid == NUMA_NO_NODE)
-		node = early_pfn_to_nid(PHYS_PFN(virt_to_phys(m)));
-
-	INIT_LIST_HEAD(&m->list);
-	list_add(&m->list, &huge_boot_pages[node]);
-	m->hstate = h;
-	m->flags = 0;
 	return 1;
 }
 
@@ -3271,13 +3334,25 @@ static void __init hugetlb_folio_init_vmemmap(struct folio *folio,
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
@@ -3286,9 +3361,13 @@ static void __init hugetlb_bootmem_init_migratetype(struct folio *folio,
 
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
@@ -3334,10 +3413,16 @@ bool __init hugetlb_bootmem_page_zones_valid(int nid,
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
 
@@ -3366,11 +3451,6 @@ static void __init hugetlb_bootmem_free_invalid_page(int nid, struct page *page,
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
@@ -3420,14 +3500,21 @@ static void __init gather_bootmem_prealloc_node(unsigned long nid)
 			 */
 			folio_set_hugetlb_vmemmap_optimized(folio);
 
+		if (hugetlb_bootmem_page_earlycma(m))
+			folio_set_hugetlb_cma(folio);
+
 		list_add(&folio->lru, &folio_list);
 
 		/*
 		 * We need to restore the 'stolen' pages to totalram_pages
 		 * in order to fix confusing memory reports from free(1) and
 		 * other side-effects, like CommitLimit going negative.
+		 *
+		 * For CMA pages, this is done in init_cma_pageblock
+		 * (via hugetlb_bootmem_init_migratetype), so skip it here.
 		 */
-		adjust_managed_page_count(page, pages_per_huge_page(h));
+		if (!folio_test_hugetlb_cma(folio))
+			adjust_managed_page_count(page, pages_per_huge_page(h));
 		cond_resched();
 	}
 
@@ -3612,8 +3699,11 @@ static void __init hugetlb_hstate_alloc_pages(struct hstate *h)
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
2.48.1.711.g2feabab25a-goog


