Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 09C4946F73B
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Dec 2021 00:07:22 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J98nM6tJgz3cmk
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Dec 2021 10:07:19 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=sent.com header.i=@sent.com header.a=rsa-sha256 header.s=fm2 header.b=SiR0oAdy;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=F4mKHmG5;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=sent.com (client-ip=66.111.4.221;
 helo=new1-smtp.messagingengine.com; envelope-from=zi.yan@sent.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=sent.com header.i=@sent.com header.a=rsa-sha256
 header.s=fm2 header.b=SiR0oAdy; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=F4mKHmG5; 
 dkim-atps=neutral
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J98kM4H3Lz2ymt
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Dec 2021 10:04:42 +1100 (AEDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.nyi.internal (Postfix) with ESMTP id B5E7C580256;
 Thu,  9 Dec 2021 18:04:37 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Thu, 09 Dec 2021 18:04:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sent.com; h=from
 :to:cc:subject:date:message-id:in-reply-to:references:reply-to
 :mime-version:content-transfer-encoding; s=fm2; bh=f9pxJP6huj/jq
 chjLk4G5VAUmGYrnQ+YUykdx2M2vNA=; b=SiR0oAdyqiTOzSDOBwhKFdFsWvEGJ
 opw1nHooWbAt+GMTry1tkgoTP2MKMK8SyfAJoWpVGmSRXWVJF11/cmX159tBuhY3
 yWaV/nZsjUlS3aJfEIYNY4x/QMiAqARvmNX0oRCihO5A3PpMHbEGhkHZzjIvfXis
 mXW/YPkfcNuPwhWIHagrcXIW/L59lzgUKpyVmazwQZvQ/EXYzKwoQ9jy7FO8+ovF
 Se2QG+LOMoonkQFGVPpA/kCA2crdi4hDTEAhbCFp2+smcQ36X9HBbJneSZ0JbEEG
 BkSgXJzjtFzNgMCzgIfLzrVVV21suS8Bi+re55IT1spZPVt8fOe0WpjYA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:reply-to:subject
 :to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=f9pxJP6huj/jqchjLk4G5VAUmGYrnQ+YUykdx2M2vNA=; b=F4mKHmG5
 69NlwTkqs6g/DRPuRYl7kJ3oXoIucrXoFv0Es1i1n9gkfHcV16Qz0KKD3oAwDiVO
 NUz7dl4YO8omoel2dXEEfWFlm8zAmnB5/BxWy0mEP44cnAMbnnOd58ee+BtgBUTg
 AdXXrJ0+poUGDIMTQbgcAlYeSuKvBigwcEA/Zwvx2qYVqyqtM4SRNNehWWzbYCwG
 ud9w9GazpC5QN4H85cQiv+zeOPVY4IcCI1KoUYijZgobm4KDicvhqIXtLyRItAcM
 FmrUV8D++iniQjMRiHz5ShAYbOXWQCGEQHdFBIw9P/PscqDZ4BZcUZHIifYuS00O
 eX6E5DNZZRgPoQ==
X-ME-Sender: <xms:hYuyYWT7RDfRPg9mF7cFnVVIVIZeJsspLHnJXuRYtvUb9Z9Y26gIVw>
 <xme:hYuyYbz9YEI3rs3oNVFgd3YQrhrLzqIMDfgc2wjtvo6uOVvDLSRwfen-_kUZoHI2A
 UQw_cN8S2nSuDUM2g>
X-ME-Received: <xmr:hYuyYT1J808NrJiuCRZ-fNTcryBh27NvHP4_EF6y9-hZjqO6x2aKoYbpT8voHFmJU7I6wEW8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrkedugddtfecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhhrggfgsedtqhertdertddtnecuhfhrohhmpegkihcujggr
 nhcuoeiiihdrhigrnhesshgvnhhtrdgtohhmqeenucggtffrrghtthgvrhhnpeekieeule
 dvtdetueejhedtgeehjeelvddttefgieeljeefgefhfedtuefffeelveenucffohhmrghi
 nhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpe
 hmrghilhhfrhhomhepiihirdihrghnsehsvghnthdrtghomh
X-ME-Proxy: <xmx:hYuyYSBpgk26MEBandqg-jDMDDhRkOfpVUHtOJFlIf0IB_J07BnUZA>
 <xmx:hYuyYfhGvRDWUdZA_iqlEKVROFWj4CEuM2ZYT5qx8PL9wTMdQl4Ksw>
 <xmx:hYuyYeqj4CsyQRJ6SN3sHOEZOOS_n9hq6puSyxYZB-lLtHBdP6poXw>
 <xmx:hYuyYYbyISSybAkDt0WY0wXTZkx1RWkESRcGZzvD5KFdgOcw6kV7ww>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 9 Dec 2021 18:04:37 -0500 (EST)
From: Zi Yan <zi.yan@sent.com>
To: David Hildenbrand <david@redhat.com>,
	linux-mm@kvack.org
Subject: [RFC PATCH v2 1/7] mm: page_alloc: avoid merging non-fallbackable
 pageblocks with others.
Date: Thu,  9 Dec 2021 18:04:08 -0500
Message-Id: <20211209230414.2766515-2-zi.yan@sent.com>
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

This is done in addition to MIGRATE_ISOLATE pageblock merge avoidance.
It prepares for the upcoming removal of the MAX_ORDER-1 alignment
requirement for CMA and alloc_contig_range().

MIGRARTE_HIGHATOMIC should not merge with other migratetypes like
MIGRATE_ISOLATE and MIGRARTE_CMA[1], so this commit prevents that too.
Also add MIGRARTE_HIGHATOMIC to fallbacks array for completeness.

[1] https://lore.kernel.org/linux-mm/20211130100853.GP3366@techsingularity.=
net/

Signed-off-by: Zi Yan <ziy@nvidia.com>
---
 include/linux/mmzone.h |  6 ++++++
 mm/page_alloc.c        | 28 ++++++++++++++++++----------
 2 files changed, 24 insertions(+), 10 deletions(-)

diff --git a/include/linux/mmzone.h b/include/linux/mmzone.h
index 58e744b78c2c..b925431b0123 100644
--- a/include/linux/mmzone.h
+++ b/include/linux/mmzone.h
@@ -83,6 +83,12 @@ static inline bool is_migrate_movable(int mt)
 	return is_migrate_cma(mt) || mt =3D=3D MIGRATE_MOVABLE;
 }
=20
+/* See fallbacks[MIGRATE_TYPES][3] in page_alloc.c */
+static inline bool migratetype_has_fallback(int mt)
+{
+	return mt < MIGRATE_PCPTYPES;
+}
+
 #define for_each_migratetype_order(order, type) \
 	for (order =3D 0; order < MAX_ORDER; order++) \
 		for (type =3D 0; type < MIGRATE_TYPES; type++)
diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index edfd6c81af82..107a5f186d3b 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -1041,6 +1041,12 @@ buddy_merge_likely(unsigned long pfn, unsigned long =
buddy_pfn,
 	return page_is_buddy(higher_page, higher_buddy, order + 1);
 }
=20
+static inline bool has_non_fallback_pageblock(struct zone *zone)
+{
+	return has_isolate_pageblock(zone) || zone_cma_pages(zone) !=3D 0 ||
+		zone->nr_reserved_highatomic !=3D 0;
+}
+
 /*
  * Freeing function for a buddy system allocator.
  *
@@ -1116,14 +1122,15 @@ static inline void __free_one_page(struct page *pag=
e,
 	}
 	if (order < MAX_ORDER - 1) {
 		/* If we are here, it means order is >=3D pageblock_order.
-		 * We want to prevent merge between freepages on isolate
-		 * pageblock and normal pageblock. Without this, pageblock
-		 * isolation could cause incorrect freepage or CMA accounting.
+		 * We want to prevent merge between freepages on pageblock
+		 * without fallbacks and normal pageblock. Without this,
+		 * pageblock isolation could cause incorrect freepage or CMA
+		 * accounting or HIGHATOMIC accounting.
 		 *
 		 * We don't want to hit this code for the more frequent
 		 * low-order merging.
 		 */
-		if (unlikely(has_isolate_pageblock(zone))) {
+		if (unlikely(has_non_fallback_pageblock(zone))) {
 			int buddy_mt;
=20
 			buddy_pfn =3D __find_buddy_pfn(pfn, order);
@@ -1131,8 +1138,8 @@ static inline void __free_one_page(struct page *page,
 			buddy_mt =3D get_pageblock_migratetype(buddy);
=20
 			if (migratetype !=3D buddy_mt
-					&& (is_migrate_isolate(migratetype) ||
-						is_migrate_isolate(buddy_mt)))
+					&& (!migratetype_has_fallback(migratetype) ||
+						!migratetype_has_fallback(buddy_mt)))
 				goto done_merging;
 		}
 		max_order =3D order + 1;
@@ -2483,6 +2490,7 @@ static int fallbacks[MIGRATE_TYPES][3] =3D {
 	[MIGRATE_UNMOVABLE]   =3D { MIGRATE_RECLAIMABLE, MIGRATE_MOVABLE,   MIGRA=
TE_TYPES },
 	[MIGRATE_MOVABLE]     =3D { MIGRATE_RECLAIMABLE, MIGRATE_UNMOVABLE, MIGRA=
TE_TYPES },
 	[MIGRATE_RECLAIMABLE] =3D { MIGRATE_UNMOVABLE,   MIGRATE_MOVABLE,   MIGRA=
TE_TYPES },
+	[MIGRATE_HIGHATOMIC] =3D { MIGRATE_TYPES }, /* Never used */
 #ifdef CONFIG_CMA
 	[MIGRATE_CMA]         =3D { MIGRATE_TYPES }, /* Never used */
 #endif
@@ -2794,8 +2802,8 @@ static void reserve_highatomic_pageblock(struct page =
*page, struct zone *zone,
=20
 	/* Yoink! */
 	mt =3D get_pageblock_migratetype(page);
-	if (!is_migrate_highatomic(mt) && !is_migrate_isolate(mt)
-	    && !is_migrate_cma(mt)) {
+	/* Only reserve normal pageblock */
+	if (migratetype_has_fallback(mt)) {
 		zone->nr_reserved_highatomic +=3D pageblock_nr_pages;
 		set_pageblock_migratetype(page, MIGRATE_HIGHATOMIC);
 		move_freepages_block(zone, page, MIGRATE_HIGHATOMIC, NULL);
@@ -3544,8 +3552,8 @@ int __isolate_free_page(struct page *page, unsigned i=
nt order)
 		struct page *endpage =3D page + (1 << order) - 1;
 		for (; page < endpage; page +=3D pageblock_nr_pages) {
 			int mt =3D get_pageblock_migratetype(page);
-			if (!is_migrate_isolate(mt) && !is_migrate_cma(mt)
-			    && !is_migrate_highatomic(mt))
+			/* Only change normal pageblock */
+			if (migratetype_has_fallback(mt))
 				set_pageblock_migratetype(page,
 							  MIGRATE_MOVABLE);
 		}
--=20
2.33.0

