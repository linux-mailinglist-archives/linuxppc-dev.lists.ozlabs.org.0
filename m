Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B6868451323
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Nov 2021 20:49:22 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HtKX01ZGFz3c88
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Nov 2021 06:49:20 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=sent.com header.i=@sent.com header.a=rsa-sha256 header.s=fm2 header.b=f5N9q/jo;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=E6iLCXin;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=sent.com (client-ip=66.111.4.229;
 helo=new3-smtp.messagingengine.com; envelope-from=zi.yan@sent.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=sent.com header.i=@sent.com header.a=rsa-sha256
 header.s=fm2 header.b=f5N9q/jo; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=E6iLCXin; 
 dkim-atps=neutral
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HtKSB1MWWz2yHS
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Nov 2021 06:46:01 +1100 (AEDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id D79065805D0;
 Mon, 15 Nov 2021 14:37:49 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Mon, 15 Nov 2021 14:37:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sent.com; h=from
 :to:cc:subject:date:message-id:in-reply-to:references:reply-to
 :mime-version:content-transfer-encoding; s=fm2; bh=b61LF7J3wAGCl
 11W+qU1NXarWEj3AKLCfOa7xPZ4iOM=; b=f5N9q/joNEo4MlUz9IPxbktrWNMjy
 Z3/gMQHyPalwLBXAM3498xfhfzUO960lJ3s7ghjhvkrqJrPUbmMslrX8EZQCJUBd
 XTBbQi4S2zCMaWjspD1OTq6NDYPZVSLA1Bouj5+T5bPtFfW2n4479JP6m8XJ9zBN
 FT5nIHMDjyG8d8olwKnrg3HkXJP14JUE2W0JorG13IHJiOCUcSOFps04bKrjqx4z
 Mx0luYODczgR1M5xiy8L4kWWzmCr6j5N0UtIGu7+npebv9dl9JMlHTJNMPoHjYo9
 jo+n4uSHR469CE+CgWHjyR4CGdbSSsSlszA8KnubDOq2A9iRf52iAiyXw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:reply-to:subject
 :to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=b61LF7J3wAGCl11W+qU1NXarWEj3AKLCfOa7xPZ4iOM=; b=E6iLCXin
 dMz3iwMM2D1exKEh8TVObT/1CzhIk2BGHj2ktxfoL6QuLbS4hetYDvcxFUApdav7
 N+uyHCRH/F71PihSzHgXnvMVbdzNRScXqfB7Vm8N7bVGJRVTWzc+e/q6QKE+lJUA
 URWMbgHr1qCAbd1nuqurtOcL6fnKrM0narmNvJsT4IjjS963OUwY9ORXhaiZ+Ohv
 QGc+J9jj6Jn2lQcCj1fyOCRB3G+nx/V+nLJkRG7UXIseaW7zXwOPwSlZRG5wEBnQ
 zdeXycxKcUFwRT0ybzyxAUYb2nf2jtRxD7hMwd3613GH5i/gdlZemZT8bKx8V0pW
 FjhmgPNnbn82Fg==
X-ME-Sender: <xms:DbeSYaIhoNNSOF3qr_fdjOz51O-HUF2s6x8DEnSJAaLr_y7LtvAhOA>
 <xme:DbeSYSL6s76Z629d3P6EmhcNUiHJNWLvI2A4gedNjWWrEA0dIF7cqtEWxHS7WjGxP
 vu9Phr9PE72tltzXw>
X-ME-Received: <xmr:DbeSYatkFPDYLWLUGmI3QzLMY7XXtFdLCd5TyYzEpiyVFqvBNMsNPSfH2ZhCflXkOIRJTnp9>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrfedtgddutddtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfrhgggfestdhqredtredttdenucfhrhhomhepkghiucgj
 rghnuceoiihirdihrghnsehsvghnthdrtghomheqnecuggftrfgrthhtvghrnhepieejue
 dvueduuefhgefhheeiuedvtedvuefgieegveetueeiueehtdegudehfeelnecuvehluhhs
 thgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepiihirdihrghnsehsvg
 hnthdrtghomh
X-ME-Proxy: <xmx:DbeSYfbqp-dvrIVD05t-HdGWFHlB9J7Gz78Naly8gvZMwqbOiTRvnQ>
 <xmx:DbeSYRbTo6rDTd72eJRUHtAaxTa2oAlDtrwXJsyXsPQ24E2iGINh7Q>
 <xmx:DbeSYbBAlQQVCZGU7NQJ-O2KfzaF63G5hXCGmkTosJ3MGAI-IZA7CA>
 <xmx:DbeSYTm1BfYsSe6u4UGAPvjpFycU9Vaq6URNjTWnGuMMLEZfJKVBUw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 15 Nov 2021 14:37:48 -0500 (EST)
From: Zi Yan <zi.yan@sent.com>
To: David Hildenbrand <david@redhat.com>,
	linux-mm@kvack.org
Subject: [RFC PATCH 1/3] mm: cma: alloc_contig_range: use pageblock_order as
 the single alignment.
Date: Mon, 15 Nov 2021 14:37:22 -0500
Message-Id: <20211115193725.737539-2-zi.yan@sent.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211115193725.737539-1-zi.yan@sent.com>
References: <20211115193725.737539-1-zi.yan@sent.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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
Reply-To: Zi Yan <ziy@nvidia.com>
Cc: Robin Murphy <robin.murphy@arm.com>, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, Zi Yan <ziy@nvidia.com>,
 virtualization@lists.linux-foundation.org, linuxppc-dev@lists.ozlabs.org,
 Christoph Hellwig <hch@lst.de>, Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Zi Yan <ziy@nvidia.com>

Pages are grouped in unit of pageblock_order for mobility. cma and
alloc_contig_range() uses pageblock for isolation and migration, so
aligning PFNs to pageblock_order is necessary. But the PFNs used in cma
and alloc_contig_range() were aligned to max(pageblock_order, MAX_ORDER-1).
This makes no difference than aligning only to pageblock_order, since
if pageblock_order > MAX_ORDER, the PFN is pageblock aligned,
otherwise, the PFN is still pageblock aligned. Drop MAX_ORDER alignment
requirement.

When commit 47118af076f6 ("mm: mmzone: MIGRATE_CMA migration type added")
introduced MIGRATE_CMA, __free_one_page() did not prevent merging
freepages on isolate pagelbock and normal pageblock, thus it required
max(pageblock_order, MAX_ORDER-1) alignment. __free_one_page() has
changed and does prevent such merges.

Signed-off-by: Zi Yan <ziy@nvidia.com>
---
 include/linux/mmzone.h  |  5 +----
 kernel/dma/contiguous.c |  2 +-
 mm/cma.c                |  6 ++----
 mm/page_alloc.c         | 12 +++++-------
 4 files changed, 9 insertions(+), 16 deletions(-)

diff --git a/include/linux/mmzone.h b/include/linux/mmzone.h
index 58e744b78c2c..6c61aa41a779 100644
--- a/include/linux/mmzone.h
+++ b/include/linux/mmzone.h
@@ -54,10 +54,7 @@ enum migratetype {
 	 *
 	 * The way to use it is to change migratetype of a range of
 	 * pageblocks to MIGRATE_CMA which can be done by
-	 * __free_pageblock_cma() function.  What is important though
-	 * is that a range of pageblocks must be aligned to
-	 * MAX_ORDER_NR_PAGES should biggest page be bigger than
-	 * a single pageblock.
+	 * __free_pageblock_cma() function.
 	 */
 	MIGRATE_CMA,
 #endif
diff --git a/kernel/dma/contiguous.c b/kernel/dma/contiguous.c
index 3d63d91cba5c..ac35b14b0786 100644
--- a/kernel/dma/contiguous.c
+++ b/kernel/dma/contiguous.c
@@ -399,7 +399,7 @@ static const struct reserved_mem_ops rmem_cma_ops =3D {
=20
 static int __init rmem_cma_setup(struct reserved_mem *rmem)
 {
-	phys_addr_t align =3D PAGE_SIZE << max(MAX_ORDER - 1, pageblock_order);
+	phys_addr_t align =3D PAGE_SIZE << pageblock_order;
 	phys_addr_t mask =3D align - 1;
 	unsigned long node =3D rmem->fdt_node;
 	bool default_cma =3D of_get_flat_dt_prop(node, "linux,cma-default", NULL);
diff --git a/mm/cma.c b/mm/cma.c
index bc9ca8f3c487..d171158bd418 100644
--- a/mm/cma.c
+++ b/mm/cma.c
@@ -180,8 +180,7 @@ int __init cma_init_reserved_mem(phys_addr_t base, phys=
_addr_t size,
 		return -EINVAL;
=20
 	/* ensure minimal alignment required by mm core */
-	alignment =3D PAGE_SIZE <<
-			max_t(unsigned long, MAX_ORDER - 1, pageblock_order);
+	alignment =3D PAGE_SIZE << pageblock_order;
=20
 	/* alignment should be aligned with order_per_bit */
 	if (!IS_ALIGNED(alignment >> PAGE_SHIFT, 1 << order_per_bit))
@@ -268,8 +267,7 @@ int __init cma_declare_contiguous_nid(phys_addr_t base,
 	 * migratetype page by page allocator's buddy algorithm. In the case,
 	 * you couldn't get a contiguous memory, which is not what we want.
 	 */
-	alignment =3D max(alignment,  (phys_addr_t)PAGE_SIZE <<
-			  max_t(unsigned long, MAX_ORDER - 1, pageblock_order));
+	alignment =3D max(alignment,  (phys_addr_t)PAGE_SIZE << pageblock_order);
 	if (fixed && base & (alignment - 1)) {
 		ret =3D -EINVAL;
 		pr_err("Region at %pa must be aligned to %pa bytes\n",
diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index c5952749ad40..5700f5502d59 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -8922,14 +8922,12 @@ struct page *has_unmovable_pages(struct zone *zone,=
 struct page *page,
 #ifdef CONFIG_CONTIG_ALLOC
 static unsigned long pfn_max_align_down(unsigned long pfn)
 {
-	return pfn & ~(max_t(unsigned long, MAX_ORDER_NR_PAGES,
-			     pageblock_nr_pages) - 1);
+	return pfn & ~(pageblock_nr_pages - 1);
 }
=20
 static unsigned long pfn_max_align_up(unsigned long pfn)
 {
-	return ALIGN(pfn, max_t(unsigned long, MAX_ORDER_NR_PAGES,
-				pageblock_nr_pages));
+	return ALIGN(pfn, pageblock_nr_pages);
 }
=20
 #if defined(CONFIG_DYNAMIC_DEBUG) || \
@@ -9022,8 +9020,8 @@ static int __alloc_contig_migrate_range(struct compac=
t_control *cc,
  *			be either of the two.
  * @gfp_mask:	GFP mask to use during compaction
  *
- * The PFN range does not have to be pageblock or MAX_ORDER_NR_PAGES
- * aligned.  The PFN range must belong to a single zone.
+ * The PFN range does not have to be pageblock aligned. The PFN range must
+ * belong to a single zone.
  *
  * The first thing this routine does is attempt to MIGRATE_ISOLATE all
  * pageblocks in the range.  Once isolated, the pageblocks should not
@@ -9099,7 +9097,7 @@ int alloc_contig_range(unsigned long start, unsigned =
long end,
 	ret =3D 0;
=20
 	/*
-	 * Pages from [start, end) are within a MAX_ORDER_NR_PAGES
+	 * Pages from [start, end) are within a pageblock_nr_pages
 	 * aligned blocks that are marked as MIGRATE_ISOLATE.  What's
 	 * more, all pages in [start, end) are free in page allocator.
 	 * What we are going to do is to allocate all pages from
--=20
2.33.0

