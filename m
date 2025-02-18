Return-Path: <linuxppc-dev+bounces-6325-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5980BA3A51B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Feb 2025 19:17:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Yy76n1b6Qz2yjb;
	Wed, 19 Feb 2025 05:17:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::64a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1739902673;
	cv=none; b=knnpUueNwHjUgixkv1Nxr45yNkd9IxZrINAeP4g7fvn4/W7Z70h5Op3MDrd14PeO6WXW+q+N3Q0K8HjFeyw3w3vHScaVfq2ythxgZn7FwYP+lyDITeAJAaY6ZHtI/98PuPssAM/jQFB+EdsN02gmlVJNa/QybnSvbCX1l13lpz/PFYxXA3l71zbi5ATz4uRC4uW+vVPl21Rt++Ul3lfpqHY6g2OzEWofg7yqyphZY4w7cd1cv4jP53tf3c9uJZScM02qxyBjyW/XuTqirUQeay+K7sRkyayGudVHSF4ZvbSlHZJOz2o91IQ+8rL11OhrnV0uDrIqGhHqrKuywyaU3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1739902673; c=relaxed/relaxed;
	bh=RAaWg9KYrhZaw2brRcaZF018Jxd4YVbeijwcOr2BboU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=EWuISsXtpJiorgMNJq1h7v4d2+Y5Zue7RZhqr1ZfEj1s5WM8+BCvcqD5I3Nqc1pKFHYTsFe6UkwXhkAAa24okRKoDeABQOpTIkQpGQqxSZaqQIfsOLLJC9CJ70phkK2YnzHOdHLSJxZd+mMvNIuULOGRyHSfW8pEFMFte6vXZdZfYgb7Iq1YqFgkZ2onN/Nl/nWWM50pzv6jIJcMXFu5UnIe1UYAxrsSGdC0p/Bes8lBKWnICe42Uvq8YaLpDLYHFBczZ6W75NCeUzfAR4sCTwANFIJ13rvMpkpL82o8xc0ZV6eP9pFgiQrB6S32yltK4jKDkj+Pu+Xc0/7JpQ6GoQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=S8XzPIVs; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::64a; helo=mail-pl1-x64a.google.com; envelope-from=3y860zwqkdiajzhpksskpi.gsqpmry1ttg-hizpmwxw.s3pefw.svk@flex--fvdl.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--fvdl.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=S8XzPIVs;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--fvdl.bounces.google.com (client-ip=2607:f8b0:4864:20::64a; helo=mail-pl1-x64a.google.com; envelope-from=3y860zwqkdiajzhpksskpi.gsqpmry1ttg-hizpmwxw.s3pefw.svk@flex--fvdl.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x64a.google.com (mail-pl1-x64a.google.com [IPv6:2607:f8b0:4864:20::64a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Yy76l6hTWz2yhD
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Feb 2025 05:17:51 +1100 (AEDT)
Received: by mail-pl1-x64a.google.com with SMTP id d9443c01a7336-22126a488d7so56756165ad.2
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Feb 2025 10:17:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1739902668; x=1740507468; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=RAaWg9KYrhZaw2brRcaZF018Jxd4YVbeijwcOr2BboU=;
        b=S8XzPIVstmUtAWQVsizcUqBd5hj5VaPvG1qrGPWihNOYknzEt04uOlradgAuN4TLJ9
         nl6YqL7WMRXKFPTCchTjk/FUj+Ym2bTiffHtFSdgF6eXIDio/dnx6agRkoI3GUCwYtK1
         HCG2VykT4VLZtgyGO/maGBCGbJaneynK+ox1rqAoCbZg68vHypeUq/r+oK/2KuDiJrzF
         SCTqbPo3+mQbOh3OwWTa/UdI4/ohZVCtUf10x99h6sZQ4keA/aijtdfkd26ONzSevMZh
         2Gd8RMuZyE5aU0IddbmWzBjIjyxou2YyxxCXojEiYYsjDe6Znb1EOYsKS7+R5FUJoaOt
         g7xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739902668; x=1740507468;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RAaWg9KYrhZaw2brRcaZF018Jxd4YVbeijwcOr2BboU=;
        b=B4stkKRj+gD0ubluWTvmkcr2kCfubqJ4VblNh2vjOWHm1z7WNTc7tZhbOcWKympVdy
         m8Md0imlLsg6XO4XeLCa6mhCjhn3t1ZpuA1S9TggkI4T2Jb5o63M5dsA0rCEtIfS6rSa
         a+7F0rSjoPoqNoPAzNK0KLqdGpJCm3ZiV+qCXSVV2bv8OyMiur/57YiRYhr8giSC1NRt
         zYso+HLP+Lqq63WaR2dcl7S1yVPsAoguzyANcDvEJ1sCLnioEVKpfFTjm1c+LyX0tCJ6
         61jsJ4Qh+k2TgqsQlf7o3NPKAR4VODtl5pGpu+3zoAvDStxVG+gxqZwO1qUzmsElq24o
         SMhQ==
X-Forwarded-Encrypted: i=1; AJvYcCUHxmGxeWg2Mf21zDNNchHXe6bNjOInpwVzx0j1u3qLfoMzxQDBbu3wBM7WkcxJ4yWqU7q4CZsgxyvA9ME=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwoGyZOLHCWCDUBmqq/9vk4dPg9ZrUaURs0/W60o2neklVQb03M
	TDIlJagT8mnr314U4axQkNLlMoKx8YKg/LovRq8anmEHz5Gblannq7/y9q7om0JeVE9o2w==
X-Google-Smtp-Source: AGHT+IFTowpNXmQaQo2ZlNPe3XcaUbY9NeJGdz1k0h7kWZZVby74hjlLnGRqAtEkQUq9LQ1hBIGCheef
X-Received: from pfaz25.prod.google.com ([2002:aa7:91d9:0:b0:730:7485:6b59])
 (user=fvdl job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:198c:b0:732:2484:e0ce
 with SMTP id d2e1a72fcca58-732618c1cf1mr20924088b3a.17.1739902667774; Tue, 18
 Feb 2025 10:17:47 -0800 (PST)
Date: Tue, 18 Feb 2025 18:16:54 +0000
In-Reply-To: <20250218181656.207178-1-fvdl@google.com>
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
References: <20250218181656.207178-1-fvdl@google.com>
X-Mailer: git-send-email 2.48.1.601.g30ceb7b040-goog
Message-ID: <20250218181656.207178-27-fvdl@google.com>
Subject: [PATCH v4 26/27] mm/hugetlb: enable bootmem allocation from CMA areas
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
2.48.1.601.g30ceb7b040-goog


