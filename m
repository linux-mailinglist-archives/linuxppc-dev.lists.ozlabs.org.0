Return-Path: <linuxppc-dev+bounces-5608-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B6375A201C5
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Jan 2025 00:37:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YhlG91yRbz2yMD;
	Tue, 28 Jan 2025 10:37:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::1049"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1738020191;
	cv=none; b=oLKT8mOdSUidH42Xic49q+0g4hQbGWvXEAwWspHDX2QbF1sqJ1RgphDEfUSkYmeV2Q0vb8XBxAklmm+rLHSwvV7nSaZBwbxCkOryV5AQwpkXQw6sLXbqcLCHVKk3Bic6N9G8WtmbZCbLM49nuW26ygCji1ybfn8j/CyYBF2jef1d+loceYhcjMdfLvxAMyhALRasKjIAHfNg2cT4cMHGIaaJrb8jxi+N94t9SPc5PTXzjc+F7GHv9aMmMxc1xZb2ENIKuuz4n+R9Ree6Hz0KmVa0j9Aws0gaXden8dZxYoM2v/MrGO8/vcCAb9RGk1ocXWsoAs7RB577XSxRTsvmVg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1738020191; c=relaxed/relaxed;
	bh=Gm3hQSpmhBarlZRgBgM0zsWbfOG8zObqZGHewKZCOZk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=duei0S3Sav9eLLqs4Vdw0Cik9GktauI3wE2FW3Nn6x6raj3nq1igDo6VqbYLGL1HreZKkO6001AY9kVtGq/Cp89OgKPPcUBh5Tg/LMEFINkiAUSfrDlVFpFq6GD+YYhJ24lx2ee0NQWUJ7FaCoXp2ImlW2aBK+5ioiqdH3Yd90YqonueqFeA1RWASHCFYNWWkMthq1m8BCKlYRvJ0RlS0xNqeRTfuj50SUGhxnw1SQdYOe/N4Kv3Widna7eSqfMLNOFPjoCBRKPbkyvDPw/hbClvLjHa/EUCu3hiddpbnad5TlWnwBm5Q6VCvJJ58jOI7kbVqU29gHJZ4cUCpkJebA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=N4dkOzoM; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::1049; helo=mail-pj1-x1049.google.com; envelope-from=3whwyzwqkdckkaiqlttlqj.htrqnszcuuh-ijaqnxyx.teqfgx.twl@flex--fvdl.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--fvdl.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=N4dkOzoM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--fvdl.bounces.google.com (client-ip=2607:f8b0:4864:20::1049; helo=mail-pj1-x1049.google.com; envelope-from=3whwyzwqkdckkaiqlttlqj.htrqnszcuuh-ijaqnxyx.teqfgx.twl@flex--fvdl.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x1049.google.com (mail-pj1-x1049.google.com [IPv6:2607:f8b0:4864:20::1049])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Yhkx95xYRz2yDS
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Jan 2025 10:23:09 +1100 (AEDT)
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-2ef6ef9ba3fso10043116a91.2
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Jan 2025 15:23:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738020186; x=1738624986; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Gm3hQSpmhBarlZRgBgM0zsWbfOG8zObqZGHewKZCOZk=;
        b=N4dkOzoMzHRz63RWsh5uBJB7MHCs8vYDFT777NSvBeakFahIjnOOSQKoJaOlou6Sxr
         Tr2BkFZENpmSVSse5xoHd2RwTuW8kS1YjbQWOhH2btHNaIYYHXy/nFaWkvui28FykHjB
         0PJNiO32NyjBzkA0nGtzyebvx4Vfe7b2mU0mjf73no7QFFsL9eXwoSyyvOjIsJw/G4lY
         95aszhXARqCGIDykZiBy0sMcaO3EATfgair5m62Z3Aq1vQSy3oFCMFgyjMXDWIaKpYAO
         70/gvRyhFHD8M9hM4MhZIGlGGg5HpraZovBXlpqdvTzgfyIk1osGGYwTc0EiC3AWOFhV
         fbjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738020186; x=1738624986;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Gm3hQSpmhBarlZRgBgM0zsWbfOG8zObqZGHewKZCOZk=;
        b=oZ90UmXBBb88m14Mfolq4IUOQyphDRZQJeVGbCYAGRPPYIPPqdtDQSIjX31M7g6klY
         zfqmOKvMu2O+077I6SoGuvp9kI+XsUabQs2lhTsFd9dr5+8B90uvVxJ9PmnuHoKbF+Qb
         wBunx583DSCwSptGjcXtWKrhHNua3DNKEgqizw+scK1t5a7YHVCdMtsY6PNwws5Dkt24
         1xD/PVVbPh9OHFEIPorVypWkZN12In0MiSXpeplIIPZop0zoDGY2uiv+taR9T5y1+SoJ
         zK1328wbYQ1R9oUf6YtnJPaAgMW6gJSpURRU6G2T8Tp7pzuVe5awJKtrw/C6/ON8YeEz
         +oYg==
X-Forwarded-Encrypted: i=1; AJvYcCXvZunkyWhaXdEQkhktWNwoN7g+dzD8X0oOrheNF+6nOz2zCRUEWga03uTuPvQGq+3RDis+kOnhfvwJVL0=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxnJVR7SXUNWZaS1eT7LZuasmQhccX1Qq/Wdrq3WBZ/r0EjHbh6
	+qpSfncd38kOFnFt31EBYq4Kg3dpT3XC+zNTpB4alXoQiOpS2Y3nVPh1YjDFDYhDOk1AIA==
X-Google-Smtp-Source: AGHT+IH19j30fP8A5nC7LbdjLhXfAefG5JdyL9TVfOVI+iunswaOnTqgk5DlFd7Zc5gd2cUKDhngrEFu
X-Received: from pfbjo40.prod.google.com ([2002:a05:6a00:90a8:b0:728:e508:8a48])
 (user=fvdl job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:2917:b0:725:b201:2362
 with SMTP id d2e1a72fcca58-72dafa409b5mr61127310b3a.11.1738020186643; Mon, 27
 Jan 2025 15:23:06 -0800 (PST)
Date: Mon, 27 Jan 2025 23:22:07 +0000
In-Reply-To: <20250127232207.3888640-1-fvdl@google.com>
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
References: <20250127232207.3888640-1-fvdl@google.com>
X-Mailer: git-send-email 2.48.1.262.g85cc9f2d1e-goog
Message-ID: <20250127232207.3888640-28-fvdl@google.com>
Subject: [PATCH 27/27] mm/hugetlb: enable bootmem allocation from CMA areas
From: Frank van der Linden <fvdl@google.com>
To: akpm@linux-foundation.org, muchun.song@linux.dev, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Cc: yuzhao@google.com, usama.arif@bytedance.com, joao.m.martins@oracle.com, 
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
 arch/powerpc/mm/hugetlbpage.c |   5 ++
 include/linux/hugetlb.h       |   7 ++
 mm/hugetlb.c                  | 135 +++++++++++++++++++++++++---------
 3 files changed, 114 insertions(+), 33 deletions(-)

diff --git a/arch/powerpc/mm/hugetlbpage.c b/arch/powerpc/mm/hugetlbpage.c
index d3c1b749dcfc..e53e4b4c8ef6 100644
--- a/arch/powerpc/mm/hugetlbpage.c
+++ b/arch/powerpc/mm/hugetlbpage.c
@@ -121,6 +121,11 @@ bool __init hugetlb_node_alloc_supported(void)
 {
 	return false;
 }
+
+bool __init arch_specific_huge_bootmem_alloc(struct hstate *h)
+{
+	return (firmware_has_feature(FW_FEATURE_LPAR) && !radix_enabled());
+}
 #endif
 
 
diff --git a/include/linux/hugetlb.h b/include/linux/hugetlb.h
index 2512463bca49..bca3052fb175 100644
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
 
@@ -711,6 +717,7 @@ bool __init hugetlb_node_alloc_supported(void);
 
 void __init hugetlb_add_hstate(unsigned order);
 bool __init arch_hugetlb_valid_size(unsigned long size);
+bool __init arch_specific_huge_bootmem_alloc(struct hstate *h);
 struct hstate *size_to_hstate(unsigned long size);
 
 #ifndef HUGE_MAX_HSTATE
diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index 32ebde9039e2..183e8d0c2fb4 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -61,7 +61,7 @@ static struct cma *hugetlb_cma[MAX_NUMNODES];
 static unsigned long hugetlb_cma_size_in_node[MAX_NUMNODES] __initdata;
 #endif
 static bool hugetlb_cma_only;
-static unsigned long hugetlb_cma_size __initdata;
+static unsigned long hugetlb_cma_size;
 
 __initdata struct list_head huge_boot_pages[MAX_NUMNODES];
 __initdata unsigned long hstate_boot_nrinvalid[HUGE_MAX_HSTATE];
@@ -132,8 +132,10 @@ static void hugetlb_free_folio(struct folio *folio)
 #ifdef CONFIG_CMA
 	int nid = folio_nid(folio);
 
-	if (cma_free_folio(hugetlb_cma[nid], folio))
+	if (folio_test_hugetlb_cma(folio)) {
+		WARN_ON(!cma_free_folio(hugetlb_cma[nid], folio));
 		return;
+	}
 #endif
 	folio_put(folio);
 }
@@ -1509,6 +1511,9 @@ static struct folio *alloc_gigantic_folio(struct hstate *h, gfp_t gfp_mask,
 					break;
 			}
 		}
+
+		if (folio)
+			folio_set_hugetlb_cma(folio);
 	}
 #endif
 	if (!folio) {
@@ -3175,6 +3180,63 @@ struct folio *alloc_hugetlb_folio(struct vm_area_struct *vma,
 	return ERR_PTR(-ENOSPC);
 }
 
+/*
+ * Some architectures do their own bootmem allocation, so they can't use
+ * early CMA allocation. So, allow for this function to be redefined.
+ */
+bool __init __attribute((weak))
+arch_specific_huge_bootmem_alloc(struct hstate *h)
+{
+	return false;
+}
+
+static bool __init hugetlb_early_cma(struct hstate *h)
+{
+	if (arch_specific_huge_bootmem_alloc(h))
+		return false;
+
+	return (hstate_is_gigantic(h) && hugetlb_cma_size && hugetlb_cma_only);
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
@@ -3184,17 +3246,14 @@ int __alloc_bootmem_huge_page(struct hstate *h, int nid)
 
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
@@ -3203,7 +3262,6 @@ int __alloc_bootmem_huge_page(struct hstate *h, int nid)
 		return 0;
 
 found:
-
 	/*
 	 * Only initialize the head struct page in memmap_init_reserved_pages,
 	 * rest of the struct pages will be initialized by the HugeTLB
@@ -3213,18 +3271,6 @@ int __alloc_bootmem_huge_page(struct hstate *h, int nid)
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
 
@@ -3265,13 +3311,25 @@ static void __init hugetlb_folio_init_vmemmap(struct folio *folio,
 	prep_compound_head((struct page *)folio, huge_page_order(h));
 }
 
+static bool __init hugetlb_bootmem_page_prehvo(struct huge_bootmem_page *m)
+{
+	return (m->flags & HUGE_BOOTMEM_HVO);
+}
+
+static bool __init hugetlb_bootmem_page_earlycma(struct huge_bootmem_page *m)
+{
+	return (m->flags & HUGE_BOOTMEM_CMA);
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
@@ -3280,9 +3338,13 @@ static void __init hugetlb_bootmem_init_migratetype(struct folio *folio,
 
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
@@ -3319,7 +3381,7 @@ bool __init hugetlb_bootmem_page_zones_valid(int nid,
 					     struct huge_bootmem_page *m)
 {
 	unsigned long start_pfn;
-	bool valid;
+	bool valid = false;
 
 	if (m->flags & HUGE_BOOTMEM_ZONES_VALID) {
 		/*
@@ -3328,10 +3390,16 @@ bool __init hugetlb_bootmem_page_zones_valid(int nid,
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
 
@@ -3360,11 +3428,6 @@ static void __init hugetlb_bootmem_free_invalid_page(int nid, struct page *page,
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
@@ -3414,6 +3477,9 @@ static void __init gather_bootmem_prealloc_node(unsigned long nid)
 			 */
 			folio_set_hugetlb_vmemmap_optimized(folio);
 
+		if (hugetlb_bootmem_page_earlycma(m))
+			folio_set_hugetlb_cma(folio);
+
 		list_add(&folio->lru, &folio_list);
 
 		/*
@@ -3606,8 +3672,11 @@ static void __init hugetlb_hstate_alloc_pages(struct hstate *h)
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
2.48.1.262.g85cc9f2d1e-goog


