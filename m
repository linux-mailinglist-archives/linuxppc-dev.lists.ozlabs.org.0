Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DEE544C0B1E
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Feb 2022 05:32:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K3NSD1Jb7z3bZd
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Feb 2022 15:32:44 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=sent.com header.i=@sent.com header.a=rsa-sha256 header.s=fm2 header.b=loroW7MK;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=R4aMF6ON;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=sent.com (client-ip=66.111.4.224;
 helo=new2-smtp.messagingengine.com; envelope-from=zi.yan@sent.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=sent.com header.i=@sent.com header.a=rsa-sha256
 header.s=fm2 header.b=loroW7MK; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=R4aMF6ON; 
 dkim-atps=neutral
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K3NQ24bGXz3bPP
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Feb 2022 15:30:50 +1100 (AEDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id 18511580137;
 Tue, 22 Feb 2022 23:30:49 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Tue, 22 Feb 2022 23:30:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sent.com; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to
 :reply-to:sender:subject:subject:to:to; s=fm2; bh=AfFDHj1c96/TKE
 7TOTCl/a+qq6hQy8alpItolvHSm/8=; b=loroW7MKBg/4JLVLHXMyTJwf0my9rK
 OvhbebnI3I0jYeSfHnVR+xWdKDDBgGTlKqG0ToyousjhFJo3aQyDGAgwFpa0NmO4
 4+u8bxfOr1eqGhzLVk82L+OOPDLWPPvZ5u/6sSlD6lhytqtrj3nFYIC4lChVtThC
 Be+gvrI76BJ+YyeUnIC0siPLBduxPUOoS/8jXW4pVIqj7S8ZhRfrG2dufqWn438o
 4rscDaib/zQuGVnCBFY0HPWu2K3latDoS8Ac+jHOcKfQixpOGtyX5cJ8SCY1MAV8
 mbw2U3jUeEdpGG9PTYLo7YM9YgBrfeSI1NSduMNvezDxLc/9aNihcTJw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=AfFDHj1c96/TKE7TOTCl/a+qq6hQy8alpItolvHSm/8=; b=R4aMF6ON
 Vlc3etrYS96dvAL/WToZ49N9W1jJAY2pT6fGZd29fPfEfl5V563F3yvHeaLG1NzU
 XpKdMwYwekuZ9YO9T04qHKAqkiCa4Qk38LSAJsyPCANdLuVR+XtMzKXzPn2IyW+9
 ks16ehPM/gMyFNZev4ECkRw2YLv65yRsOOMPRTA8mG9osBjHux7BM8lP0gT+D5TO
 yIup2BWS6C7T4FeLXP9JubZ9sJ2AUyuZmbyA5qpyXyfBpgwXPVHkI30Rp0wjelni
 I2aiI8lJZVivXdPp3n8EC9ROkuHPTwCn2N3h9smi9OhJkZja0kQ8MEKv6u0dqRvh
 n4OTv8XWikHaXA==
X-ME-Sender: <xms:eLgVYkAi33MZLe2zHyto2r5Ay-v3h9OSANLpOR3uwopGSdUEu5ZJ6A>
 <xme:eLgVYmgxvSkIeZnnH0c1XbCkTOovx-NZ3RWYfzWWRnGFmnMhevZLl3XMTJENyRWlf
 81AWT6HSpjtKdqm6g>
X-ME-Received: <xmr:eLgVYnnRMXM5CxmfFmcDwBcROzt2VOdu_M0XcYytR-B0t-B5VPQJyTkzhe9RMHwvY_dgGFLs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrkeelgdejudcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhhrggfgsedtqhertdertddtnecuhfhrohhmpegkihcujggr
 nhcuoeiiihdrhigrnhesshgvnhhtrdgtohhmqeenucggtffrrghtthgvrhhnpeeijeeuvd
 euudeuhfeghfehieeuvdetvdeugfeigeevteeuieeuhedtgeduheefleenucevlhhushht
 vghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpeiiihdrhigrnhesshgvnh
 htrdgtohhm
X-ME-Proxy: <xmx:eLgVYqxS2Bz3WA58WJTxKvt_-GBI_I-y7jD8oHKDQf5QtesCl5Qyqg>
 <xmx:eLgVYpR_NT2MUYN0ToUtzkSr9X1a4YdewihXq9nLDX3BHQAwoO4sdw>
 <xmx:eLgVYlbmvJWin1DPrSFP6XooqawzUwpLPunehXu5tQmag_YTlQC38w>
 <xmx:ebgVYiiC5VXsXmfwDM8dpIFZDNHzX8eLI8U3fo3xcB49iggVaMZTrw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 22 Feb 2022 23:30:48 -0500 (EST)
From: Zi Yan <zi.yan@sent.com>
To: David Hildenbrand <david@redhat.com>,
	linux-mm@kvack.org
Subject: [PATCH v6 4/5] mm: cma: use pageblock_order as the single alignment
Date: Tue, 22 Feb 2022 23:30:36 -0500
Message-Id: <20220223043037.715205-5-zi.yan@sent.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220223043037.715205-1-zi.yan@sent.com>
References: <20220223043037.715205-1-zi.yan@sent.com>
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
 Oscar Salvador <osalvador@suse.de>, Robin Murphy <robin.murphy@arm.com>,
 linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 Mike Rapoport <rppt@kernel.org>, Eric Ren <renzhengeek@gmail.com>,
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
 include/linux/cma.h    | 4 ++--
 include/linux/mmzone.h | 5 +----
 mm/page_alloc.c        | 4 ++--
 3 files changed, 5 insertions(+), 8 deletions(-)

diff --git a/include/linux/cma.h b/include/linux/cma.h
index 90fd742fd1ef..22fa94231dfe 100644
--- a/include/linux/cma.h
+++ b/include/linux/cma.h
@@ -21,11 +21,11 @@
 #define CMA_MAX_NAME 64
=20
 /*
- * TODO: once the buddy -- especially pageblock merging and alloc_contig_r=
ange()
+ *  the buddy -- especially pageblock merging and alloc_contig_range()
  * -- can deal with only some pageblocks of a higher-order page being
  *  MIGRATE_CMA, we can use pageblock_nr_pages.
  */
-#define CMA_MIN_ALIGNMENT_PAGES MAX_ORDER_NR_PAGES
+#define CMA_MIN_ALIGNMENT_PAGES pageblock_nr_pages
 #define CMA_MIN_ALIGNMENT_BYTES (PAGE_SIZE * CMA_MIN_ALIGNMENT_PAGES)
=20
 struct cma;
diff --git a/include/linux/mmzone.h b/include/linux/mmzone.h
index 3fff6deca2c0..da38c8436493 100644
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
diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index 038e044c5a80..90281e33e20a 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -9077,8 +9077,8 @@ int __alloc_contig_migrate_range(struct compact_contr=
ol *cc,
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
--=20
2.34.1

