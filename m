Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B4A1485B19
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Jan 2022 22:52:28 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JTjrV1g5Kz3cjt
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jan 2022 08:52:26 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=sent.com header.i=@sent.com header.a=rsa-sha256 header.s=fm2 header.b=YzFUupbO;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=GdqAoGtO;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=sent.com (client-ip=66.111.4.230;
 helo=new4-smtp.messagingengine.com; envelope-from=zi.yan@sent.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=sent.com header.i=@sent.com header.a=rsa-sha256
 header.s=fm2 header.b=YzFUupbO; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=GdqAoGtO; 
 dkim-atps=neutral
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JTjm111mmz2xYQ
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Jan 2022 08:48:33 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id B93E1580565;
 Wed,  5 Jan 2022 16:48:27 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Wed, 05 Jan 2022 16:48:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sent.com; h=from
 :to:cc:subject:date:message-id:in-reply-to:references:reply-to
 :mime-version:content-transfer-encoding; s=fm2; bh=cdqW9WkR9DiZi
 1wR67hfIXu60iQ9l4qjc+vr1lXC0xM=; b=YzFUupbOB0mt3rO5G0b92O16rBLLK
 hRO1PcYzYgQFEzEHWizWsOe1vicVABwqhoHyAFiPb2rBhKP9ENunSSLLxXR2LOqL
 w4G/dvr0VvF9Wi8ocsZ3WCwk1hWCjoRALIrsXYOT2NcdAyDPXaaPaL2Il0R7CYMT
 iAUgh9u6HRpE7fX2sShq3A81ezaOag/v8XsqGvaQqNx8WqPjgOXabPv5vHAtmbLc
 ZByizcysMtdU3kPJY5iTYZOLgWRB7E1jaRcM2txtfyKO+bK2SMYzfm4gNwFj7nmB
 KJ5bZ1GGgH0RuE5fRBa5K0YVVk1Rt/NA4m50Ur6E40t2BqJ0/PmHI5iyQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:reply-to:subject
 :to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=cdqW9WkR9DiZi1wR67hfIXu60iQ9l4qjc+vr1lXC0xM=; b=GdqAoGtO
 xU/Ega15jpW53pP7JWCIiLIS+MSEkLp1y/6DIHhkoX6f5mdHYjhpIY6/B7kFJAYU
 MJjbSQ6qd6BTwCSgzj68oBNGCMsXnQIemUzlghy28uS0PpaeDwrkLO0xQ7M02ePq
 s26YNSmGBdNYE79yhlXZh5K8Az9DedUHScDL3d30e9hKGw9MEEGYR7W9xXOtwwQY
 0sqA4PJVWq4O5+CaBlP4PYKFbzYfkWd56S1Yh+hKTCTUGxK9YK0L9V65KWZloKPd
 2lFAkT+4M7HOS1BRvJ6AZdAnuUnm9snqSPFIU1xAvLjpCQei2ncVNWqvIzUYYvhO
 bXTjpr0jzSFAaw==
X-ME-Sender: <xms:KxLWYeVi70G8cFHEe0ryGDz94SmqZHelF0KyRXrntydyw0BX81Tqnw>
 <xme:KxLWYan12C6Lmasq5Frb1ENTjzqWUhnTCRtH3u78D7nIXgu6rC4W_u6P6VIVCRTmD
 _jc_Ao1Dfcfh-2-Kw>
X-ME-Received: <xmr:KxLWYSbHQtzjGeD_5dB9OWO8nbNbv6XcK1Y5vAETtMQhNePJKEJoOismpX4QX8d8lfZ0jVXp>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrudefjedgieekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfrhgggfestdhqredtredttdenucfhrhhomhepkghiucgj
 rghnuceoiihirdihrghnsehsvghnthdrtghomheqnecuggftrfgrthhtvghrnhepieejue
 dvueduuefhgefhheeiuedvtedvuefgieegveetueeiueehtdegudehfeelnecuvehluhhs
 thgvrhfuihiivgepvdenucfrrghrrghmpehmrghilhhfrhhomhepiihirdihrghnsehsvg
 hnthdrtghomh
X-ME-Proxy: <xmx:KxLWYVVbRpca-v4_wHX47cZo_IFvLRMYfz5p4K1uYwCsXOGnvSqgRg>
 <xmx:KxLWYYkFo8Nk0cMoWuBtDbiQYYaKM8Lo1yrDviU8PgQP8cdWEWO15g>
 <xmx:KxLWYacNlSwKyy1zv45GCgTDbKweDYoWOYe1u_zN9_0-dEjqXf5xHg>
 <xmx:KxLWYT-W3jfulxasxcXhIrpr0-_F9W2MNrocJP6aDGb-o7veCylbSg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 5 Jan 2022 16:48:26 -0500 (EST)
From: Zi Yan <zi.yan@sent.com>
To: David Hildenbrand <david@redhat.com>,
	linux-mm@kvack.org
Subject: [RFC PATCH v3 6/8] mm: cma: use pageblock_order as the single
 alignment
Date: Wed,  5 Jan 2022 16:47:54 -0500
Message-Id: <20220105214756.91065-7-zi.yan@sent.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220105214756.91065-1-zi.yan@sent.com>
References: <20220105214756.91065-1-zi.yan@sent.com>
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
index 0aa549653e4e..d28a02a893d6 100644
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
index faee7637740a..63d76f436ed1 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -9013,8 +9013,8 @@ static inline void split_free_page_into_pageblocks(st=
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
@@ -9130,7 +9130,7 @@ int alloc_contig_range(unsigned long start, unsigned =
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
2.34.1

