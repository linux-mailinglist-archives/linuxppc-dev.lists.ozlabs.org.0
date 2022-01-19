Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 03528494065
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Jan 2022 20:09:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JfFZW6L9Cz3cTg
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Jan 2022 06:09:55 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=sent.com header.i=@sent.com header.a=rsa-sha256 header.s=fm2 header.b=jfEgOdn4;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=a3g6Otxn;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=sent.com (client-ip=66.111.4.230;
 helo=new4-smtp.messagingengine.com; envelope-from=zi.yan@sent.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=sent.com header.i=@sent.com header.a=rsa-sha256
 header.s=fm2 header.b=jfEgOdn4; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=a3g6Otxn; 
 dkim-atps=neutral
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JfFVl3MMQz30Dy
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Jan 2022 06:06:39 +1100 (AEDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.nyi.internal (Postfix) with ESMTP id 41B865806D1;
 Wed, 19 Jan 2022 14:06:36 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Wed, 19 Jan 2022 14:06:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sent.com; h=from
 :to:cc:subject:date:message-id:in-reply-to:references:reply-to
 :mime-version:content-transfer-encoding; s=fm2; bh=q0ih4ZGu7K0TB
 LC0mgUjnHBfPkRQSf5he8QSdlBoNQ4=; b=jfEgOdn4BGr+TuP2w75Wt10+ZOjWZ
 5wtQRYAjlZT1pMOGNZuxExbyYDvzZWs1w/9XgA00oxJjPSD6X72QwLEBnSdgqvUr
 /f3qIXu854rkelt0A7p+dZdTQluXWD6Pw7JERZbv7EnVpvw1fNAt4Qvo3rHqN0xT
 J4wK+o2Dt9VD5dXJM9d1MK4hmLWmLtm/8cKcRb4WA14de3KJN7gPjrGfEnnC5/yC
 NmddZEjk/wbfOQwA1M2N2J7MUhtx2d08+4hFynhkLl5pLNqTCGlyk0hOFMifJ75Y
 VllWlwUXxHTAztlFsZBKheI8JgrnfniDHVg1Ol2soCLoyyEecxkqQK1cg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:reply-to:subject
 :to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=q0ih4ZGu7K0TBLC0mgUjnHBfPkRQSf5he8QSdlBoNQ4=; b=a3g6Otxn
 1P5/QNZvcBTEFQCfKcdFmGDd2DdgRTczVijbu6kDaB9bRBdJreqYjNFHux4rgD+h
 UkF650jU7mJn4rQPHlV0IpnQwab0MwOu9ikwsmVZQkt6K4pX/5zbh2K+MupmP+BW
 0YOhk0bg8/as2lRJFrjtWJECTICLB5yfrzZo36AAtfVJl6C9oqQ+hlp3FIHMpf5T
 d7y+OuUDYH1rlCS4idv3scy0M9yk3mFf2seAksNTTUT5PJDJECJuxyGHjfRB8Y8S
 P3E3MhkFkZGVImgoNE2qI1rcQFzllWnyhFKiRxkzE04QUVBHw27flTX6WPs/A95g
 l/Z0tVucFtM2wA==
X-ME-Sender: <xms:OmHoYYjDt5bJPnaqv8TrL9lkzpt8adtAHjk8msVKyJ_1IZR0Yw4aeQ>
 <xme:OmHoYRCNQL-qjZbdM8WhZIMCoSpQJvqf5D_IV-_ZlyOyr2T5o-H3HgJu6Bi25ECZp
 -l4_pWajbCZChbxXw>
X-ME-Received: <xmr:OmHoYQHIWE9Xxjhz9TwH30OnS3w0tOUXFmwtO-5UaI2nsRSMx3mgGJ51JlsXySAKecLlGewK>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudeigdeivdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhhrggfgsedtqhertdertddtnecuhfhrohhmpegkihcujggr
 nhcuoeiiihdrhigrnhesshgvnhhtrdgtohhmqeenucggtffrrghtthgvrhhnpeekieeule
 dvtdetueejhedtgeehjeelvddttefgieeljeefgefhfedtuefffeelveenucffohhmrghi
 nhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpe
 hmrghilhhfrhhomhepiihirdihrghnsehsvghnthdrtghomh
X-ME-Proxy: <xmx:OmHoYZR6TRDNhb7e-1EHAtHNY7Rkgbip-xe-ddvOHHAPmiG7C_lm-w>
 <xmx:OmHoYVzt0SG_sr589OoAThHOtIIicYY-ANJaP83S8k_6y3LUOZZ3Ug>
 <xmx:OmHoYX5UWRuqvQWLgsOpiG917uBuXvx2MZj5QFLajPT-BXyag8VPaA>
 <xmx:PGHoYYriwSXjN_gf2lpBFBkoVaydd2-D6CEK8xxq5MH56St65-B0cQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 19 Jan 2022 14:06:34 -0500 (EST)
From: Zi Yan <zi.yan@sent.com>
To: David Hildenbrand <david@redhat.com>,
	linux-mm@kvack.org
Subject: [PATCH v4 1/7] mm: page_alloc: avoid merging non-fallbackable
 pageblocks with others.
Date: Wed, 19 Jan 2022 14:06:17 -0500
Message-Id: <20220119190623.1029355-2-zi.yan@sent.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220119190623.1029355-1-zi.yan@sent.com>
References: <20220119190623.1029355-1-zi.yan@sent.com>
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
 include/linux/mmzone.h | 11 +++++++++++
 mm/page_alloc.c        | 37 ++++++++++++++++++++-----------------
 2 files changed, 31 insertions(+), 17 deletions(-)

diff --git a/include/linux/mmzone.h b/include/linux/mmzone.h
index aed44e9b5d89..71b77aab748d 100644
--- a/include/linux/mmzone.h
+++ b/include/linux/mmzone.h
@@ -83,6 +83,17 @@ static inline bool is_migrate_movable(int mt)
 	return is_migrate_cma(mt) || mt =3D=3D MIGRATE_MOVABLE;
 }
=20
+/*
+ * Check whether a migratetype can be merged with another migratetype.
+ *
+ * It is only mergeable when it can fall back to other migratetypes for
+ * allocation. See fallbacks[MIGRATE_TYPES][3] in page_alloc.c.
+ */
+static inline bool migratetype_is_mergeable(int mt)
+{
+	return mt < MIGRATE_PCPTYPES;
+}
+
 #define for_each_migratetype_order(order, type) \
 	for (order =3D 0; order < MAX_ORDER; order++) \
 		for (type =3D 0; type < MIGRATE_TYPES; type++)
diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index 8dd6399bafb5..15de65215c02 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -1117,25 +1117,24 @@ static inline void __free_one_page(struct page *pag=
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
-			int buddy_mt;
+		int buddy_mt;
=20
-			buddy_pfn =3D __find_buddy_pfn(pfn, order);
-			buddy =3D page + (buddy_pfn - pfn);
-			buddy_mt =3D get_pageblock_migratetype(buddy);
+		buddy_pfn =3D __find_buddy_pfn(pfn, order);
+		buddy =3D page + (buddy_pfn - pfn);
+		buddy_mt =3D get_pageblock_migratetype(buddy);
=20
-			if (migratetype !=3D buddy_mt
-					&& (is_migrate_isolate(migratetype) ||
-						is_migrate_isolate(buddy_mt)))
-				goto done_merging;
-		}
+		if (migratetype !=3D buddy_mt
+				&& (!migratetype_is_mergeable(migratetype) ||
+					!migratetype_is_mergeable(buddy_mt)))
+			goto done_merging;
 		max_order =3D order + 1;
 		goto continue_merging;
 	}
@@ -2484,6 +2483,7 @@ static int fallbacks[MIGRATE_TYPES][3] =3D {
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
@@ -2795,8 +2795,8 @@ static void reserve_highatomic_pageblock(struct page =
*page, struct zone *zone,
=20
 	/* Yoink! */
 	mt =3D get_pageblock_migratetype(page);
-	if (!is_migrate_highatomic(mt) && !is_migrate_isolate(mt)
-	    && !is_migrate_cma(mt)) {
+	/* Only reserve normal pageblocks (i.e., they can merge with others) */
+	if (migratetype_is_mergeable(mt)) {
 		zone->nr_reserved_highatomic +=3D pageblock_nr_pages;
 		set_pageblock_migratetype(page, MIGRATE_HIGHATOMIC);
 		move_freepages_block(zone, page, MIGRATE_HIGHATOMIC, NULL);
@@ -3545,8 +3545,11 @@ int __isolate_free_page(struct page *page, unsigned =
int order)
 		struct page *endpage =3D page + (1 << order) - 1;
 		for (; page < endpage; page +=3D pageblock_nr_pages) {
 			int mt =3D get_pageblock_migratetype(page);
-			if (!is_migrate_isolate(mt) && !is_migrate_cma(mt)
-			    && !is_migrate_highatomic(mt))
+			/*
+			 * Only change normal pageblocks (i.e., they can merge
+			 * with others)
+			 */
+			if (migratetype_is_mergeable(mt))
 				set_pageblock_migratetype(page,
 							  MIGRATE_MOVABLE);
 		}
--=20
2.34.1

