Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 76CD546F73E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Dec 2021 00:08:43 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J98px2dYhz3dff
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Dec 2021 10:08:41 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=sent.com header.i=@sent.com header.a=rsa-sha256 header.s=fm2 header.b=MG7YC+pU;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=MdMLTKav;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=sent.com (client-ip=66.111.4.221;
 helo=new1-smtp.messagingengine.com; envelope-from=zi.yan@sent.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=sent.com header.i=@sent.com header.a=rsa-sha256
 header.s=fm2 header.b=MG7YC+pU; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=MdMLTKav; 
 dkim-atps=neutral
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J98kR4Y7Cz2yjS
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Dec 2021 10:04:47 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id 0578A58026D;
 Thu,  9 Dec 2021 18:04:41 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Thu, 09 Dec 2021 18:04:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sent.com; h=from
 :to:cc:subject:date:message-id:in-reply-to:references:reply-to
 :mime-version:content-transfer-encoding; s=fm2; bh=7cyN4s0xVwQyR
 GJ0Fc+VVqgj+iUolX1sZzd0E92fEJY=; b=MG7YC+pU3dCSJPziDOQc190Xhgyek
 yz8KXK/RBv9WfhZnU/loKYoXkW6pITbpEMn/iVBkABFTEDINHVicLejE5F5cwGdZ
 tNoJAjYeAuRe6H/zbgUJxE2Q6zp/hXAZyAcXS+t48EYoFuyFqelT+4DSMj1VzuyR
 rPjxld8Byq28+NnQe8pCkRrzbrVA848WP0Z40Q3TMV7zBBMkoUZbLCdvC96iMsqw
 RSOhnPux8hlkqwb/UnLjSTdnDd1bLUF5ZDPaqixJVmunDfLKQ6zHHcL2HaPAeLot
 ceUEIuJDVTVfWiPfxgvctRIpJ8dqBSvXkxBZ44jmv5PAanE0qCA+/IHFA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:reply-to:subject
 :to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=7cyN4s0xVwQyRGJ0Fc+VVqgj+iUolX1sZzd0E92fEJY=; b=MdMLTKav
 488WWiYXMVbpTmasmlkq2si3G1H/7u5RP3uEs67z606CkpRFJgdWeiFglie42wDA
 hdxSUzbt4HfI4OZVhtBjNAIt0H1FLKV4BBZq7yC/exMTzwMFFWF3relfDpdIiWgi
 AqWLPM3wws0KiDslZq7YXu1jMM9LRdXViZKgfXNtV5hNvSCjQNZ4UO7nT8BzIgtS
 esJ2bsJ2KTkygLzYnPphZRjvJGdKEOMKQ+EnEaKftK5AZbhhqTRM1NrBSUrZolsk
 GejfYEtd5swYNfMzGHbVqQfT2aH4wbZThpZEjZvrcO/67vsHd76LwTAOYOy/YXYU
 nVZf0UJSxORcSQ==
X-ME-Sender: <xms:iIuyYYFG_FFzLFHtxM4D-Qnx6ybGDUgDuMfaGUxXhCl79qDHQBuj4Q>
 <xme:iIuyYRUHpLQwK8klf7AEqIkgc2MaNxaX0e_jcsxQ6FXcy4njAmkmxUBG8etk6q0up
 iVRB8tYwwiVRleksA>
X-ME-Received: <xmr:iIuyYSI68PyOikJyn2kxWLBNX4Pb2QXau-FksY5jqh-akYsYiOmTF6VPJkjhXHwJ-ZLQc36Y>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrkedugddtgecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhhrggfgsedtqhertdertddtnecuhfhrohhmpegkihcujggr
 nhcuoeiiihdrhigrnhesshgvnhhtrdgtohhmqeenucggtffrrghtthgvrhhnpeeijeeuvd
 euudeuhfeghfehieeuvdetvdeugfeigeevteeuieeuhedtgeduheefleenucevlhhushht
 vghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpeiiihdrhigrnhesshgvnh
 htrdgtohhm
X-ME-Proxy: <xmx:iIuyYaG4vt5Ka_CfmXGe_rmIvEXwaEX6c4baG3ld2f1SLCQswFn0qQ>
 <xmx:iIuyYeUGxT9EnreIQvKd6qiYOWRv7x1S7dwtZgp6qa_QdnGq4U8H6A>
 <xmx:iIuyYdNJGJ1MXcHVnTpzGBRfgzcD5yn169wI0riD4FAbkm5FqHG27Q>
 <xmx:iIuyYfvj5dWQqn83Yovg9fhaUhBp6nMgG1-4-6xKdXrhkcKcOWP0Vg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 9 Dec 2021 18:04:40 -0500 (EST)
From: Zi Yan <zi.yan@sent.com>
To: David Hildenbrand <david@redhat.com>,
	linux-mm@kvack.org
Subject: [RFC PATCH v2 5/7] mm: cma: use pageblock_order as the single
 alignment
Date: Thu,  9 Dec 2021 18:04:12 -0500
Message-Id: <20211209230414.2766515-6-zi.yan@sent.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211209230414.2766515-1-zi.yan@sent.com>
References: <20211209230414.2766515-1-zi.yan@sent.com>
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
Cc: Mel Gorman <mgorman@techsingularity.net>, Zi Yan <ziy@nvidia.com>,
 Robin Murphy <robin.murphy@arm.com>, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, Eric Ren <renzhengeek@gmail.com>,
 virtualization@lists.linux-foundation.org, linuxppc-dev@lists.ozlabs.org,
 Christoph Hellwig <hch@lst.de>, Vlastimil Babka <vbabka@suse.cz>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Zi Yan <ziy@nvidia.com>

Now alloc_contig_range() works at pageblock granularity. Change CMA
allocation, which uses alloc_contig_range(), to use pageblock_order
alignment.

Signed-off-by: Zi Yan <ziy@nvidia.com>
---
 include/linux/mmzone.h  | 5 +----
 kernel/dma/contiguous.c | 2 +-
 mm/cma.c                | 6 ++----
 mm/page_alloc.c         | 6 +++---
 4 files changed, 7 insertions(+), 12 deletions(-)

diff --git a/include/linux/mmzone.h b/include/linux/mmzone.h
index b925431b0123..71830af35745 100644
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
index 5ffbeb1b7512..3317f2064105 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -9127,8 +9127,8 @@ static inline void split_free_page_into_pageblocks(st=
ruct page *free_page,
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
@@ -9243,7 +9243,7 @@ int alloc_contig_range(unsigned long start, unsigned =
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

