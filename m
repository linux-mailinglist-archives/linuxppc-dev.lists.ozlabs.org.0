Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 56985494062
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Jan 2022 20:08:37 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JfFXz1lcxz3cVt
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Jan 2022 06:08:35 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=sent.com header.i=@sent.com header.a=rsa-sha256 header.s=fm2 header.b=uIf7nzNs;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=RbfMHHvF;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=sent.com (client-ip=66.111.4.230;
 helo=new4-smtp.messagingengine.com; envelope-from=zi.yan@sent.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=sent.com header.i=@sent.com header.a=rsa-sha256
 header.s=fm2 header.b=uIf7nzNs; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=RbfMHHvF; 
 dkim-atps=neutral
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JfFVl5MfDz30KH
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Jan 2022 06:06:39 +1100 (AEDT)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.nyi.internal (Postfix) with ESMTP id 6AA0D580726;
 Wed, 19 Jan 2022 14:06:37 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Wed, 19 Jan 2022 14:06:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sent.com; h=from
 :to:cc:subject:date:message-id:in-reply-to:references:reply-to
 :mime-version:content-transfer-encoding; s=fm2; bh=Hn66oL30Zi6g6
 GLNLl2f2H2PZx9SgKqzr8HZm/YIRtU=; b=uIf7nzNsXkkqBiG0M/gSgF3jCPAuF
 KIrJjg0Dg8MPqEZti0o9bsBj8h5ZmSqDQTCtYQcMV/cPXN9dYZ9rEBweIIO1sQHT
 KlOvJMLMZsH3rfWtly/Udsqcop+hcQ+qLO+Hv/nGDQXR7BcdZO1Npq3tDpF7b940
 a+XAYRQQ0p2ZiXFiR9cOoMJlKydnMQLyOz4Wx0S2eSsRbaY5TNbhMY2Dn7Ii3NWb
 SwuvnUyIMmoOgFh2PPNXqBO9vRwHhuprCku472rSK5a+bYUrnURQkqvZiMcdnqG+
 d71fDs3oB6oBewhGcnisUMFzD14bE+b+lCh8YhSqDUZz5Rn+RETAghdtQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:reply-to:subject
 :to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=Hn66oL30Zi6g6GLNLl2f2H2PZx9SgKqzr8HZm/YIRtU=; b=RbfMHHvF
 /wKHEWVf45vWaEWXG5ACqe+JdA0V0yVh/+Wz4L30I7Q/tiCddeE6EEgP6upOuXtf
 iKHFKVEileiSmbAo40Ym73zu3hhoedGMpOBbZhaFk8LZiSRq5DAEZjOjuRn2yyIW
 t59sn7P0HdvBnTnlK9rwgav56mLNAXFdHD5fKQXB0orLQTNl1Dr3nJFD8ZG2aZHJ
 ARQBFcCj2OlieAcEi6pD2dknf3w6jfl4Zo0PeTHZO2pRrsAW5Mg9GDFvaNhIk7k3
 RAQ1ZHIor1hzJMx9nsMiSgXYJ4RcvfsTefQ9+RTt0anVGR2LGk+wrFN7tEXf14S+
 tCCQhf1mncRK7g==
X-ME-Sender: <xms:PWHoYe5eeoxI47xIoYWUEKusZjTmmWKJOHTGRhyj8J4Ld2EYn4tsaQ>
 <xme:PWHoYX5bwvAvTgjZWhMXz7K2Jz36kCT-1koC_1ueRncf1B_3hAgRVGbuSxdA_K0CZ
 ilShUVljFMj1fHZgg>
X-ME-Received: <xmr:PWHoYdeAfLRfAsc6gn2b3NjEKUCYASqU5HZeyprDSYhULs9BZLm_zpmwBICWsu6btdU8VR9U>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudeigdeivdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhhrggfgsedtqhertdertddtnecuhfhrohhmpegkihcujggr
 nhcuoeiiihdrhigrnhesshgvnhhtrdgtohhmqeenucggtffrrghtthgvrhhnpeeijeeuvd
 euudeuhfeghfehieeuvdetvdeugfeigeevteeuieeuhedtgeduheefleenucevlhhushht
 vghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpeiiihdrhigrnhesshgvnh
 htrdgtohhm
X-ME-Proxy: <xmx:PWHoYbJx2zEV4dncR3jjk8tBWuKEKPJUPrOP1lCVP98OgGRXHKUwPQ>
 <xmx:PWHoYSIZ8cpwtl4cZTBpfEX__CPrQZgJUaG1ZV4IbSGh7d7XaC1Uxg>
 <xmx:PWHoYczbei3u-jifgY1EEaooelisGREhdQgZWyolJYBZeI3O-PmPSg>
 <xmx:PWHoYUAMBeOVwIEogAEmzWIbx_1UPqfGRbRpvokKq_R_gBKWpwkrxQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 19 Jan 2022 14:06:36 -0500 (EST)
From: Zi Yan <zi.yan@sent.com>
To: David Hildenbrand <david@redhat.com>,
	linux-mm@kvack.org
Subject: [PATCH v4 3/7] mm: page_isolation: check specified range for
 unmovable pages
Date: Wed, 19 Jan 2022 14:06:19 -0500
Message-Id: <20220119190623.1029355-4-zi.yan@sent.com>
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

Enable set_migratetype_isolate() to check specified sub-range for
unmovable pages during isolation. Page isolation is done
at max(MAX_ORDER_NR_PAEGS, pageblock_nr_pages) granularity, but not all
pages within that granularity are intended to be isolated. For example,
alloc_contig_range(), which uses page isolation, allows ranges without
alignment. This commit makes unmovable page check only look for
interesting pages, so that page isolation can succeed for any
non-overlapping ranges.

Signed-off-by: Zi Yan <ziy@nvidia.com>
---
 include/linux/page-isolation.h |  1 +
 mm/memory_hotplug.c            | 12 +++++++-
 mm/page_alloc.c                |  2 +-
 mm/page_isolation.c            | 53 +++++++++++++++++++++-------------
 4 files changed, 46 insertions(+), 22 deletions(-)

diff --git a/include/linux/page-isolation.h b/include/linux/page-isolation.h
index e14eddf6741a..a4d2687ed4e6 100644
--- a/include/linux/page-isolation.h
+++ b/include/linux/page-isolation.h
@@ -42,6 +42,7 @@ int move_freepages_block(struct zone *zone, struct page *=
page,
  */
 int
 start_isolate_page_range(unsigned long start_pfn, unsigned long end_pfn,
+			 unsigned long isolate_start, unsigned long isolate_end,
 			 unsigned migratetype, int flags);
=20
 /*
diff --git a/mm/memory_hotplug.c b/mm/memory_hotplug.c
index 0139b77c51d5..5db84c3fa882 100644
--- a/mm/memory_hotplug.c
+++ b/mm/memory_hotplug.c
@@ -1901,8 +1901,18 @@ int __ref offline_pages(unsigned long start_pfn, uns=
igned long nr_pages,
 	zone_pcp_disable(zone);
 	lru_cache_disable();
=20
-	/* set above range as isolated */
+	/*
+	 * set above range as isolated
+	 *
+	 * start_pfn and end_pfn are the same as isolate_start and isolate_end,
+	 * because start_pfn and end_pfn are already PAGES_PER_SECTION
+	 * (>=3D MAX_ORDER_NR_PAGES) aligned; if start_pfn is
+	 * pageblock_nr_pages aligned in memmap_on_memory case, there is no
+	 * need to isolate pages before start_pfn, since they are used by
+	 * memmap thus not user visible.
+	 */
 	ret =3D start_isolate_page_range(start_pfn, end_pfn,
+				       start_pfn, end_pfn,
 				       MIGRATE_MOVABLE,
 				       MEMORY_OFFLINE | REPORT_FAILURE);
 	if (ret) {
diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index 1d812268c2a9..812cf557b20f 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -9016,7 +9016,7 @@ int alloc_contig_range(unsigned long start, unsigned =
long end,
 	 * put back to page allocator so that buddy can use them.
 	 */
=20
-	ret =3D start_isolate_page_range(pfn_max_align_down(start),
+	ret =3D start_isolate_page_range(start, end, pfn_max_align_down(start),
 				       pfn_max_align_up(end), migratetype, 0);
 	if (ret)
 		return ret;
diff --git a/mm/page_isolation.c b/mm/page_isolation.c
index 6c841274bf46..d17ad9a7d4bf 100644
--- a/mm/page_isolation.c
+++ b/mm/page_isolation.c
@@ -16,7 +16,8 @@
 #include <trace/events/page_isolation.h>
=20
 /*
- * This function checks whether pageblock includes unmovable pages or not.
+ * This function checks whether pageblock within [start_pfn, end_pfn) incl=
udes
+ * unmovable pages or not.
  *
  * PageLRU check without isolation or lru_lock could race so that
  * MIGRATE_MOVABLE block might include unmovable pages. And __PageMovable
@@ -29,11 +30,14 @@
  *
  */
 static struct page *has_unmovable_pages(struct zone *zone, struct page *pa=
ge,
-				 int migratetype, int flags)
+				 int migratetype, int flags,
+				 unsigned long start_pfn, unsigned long end_pfn)
 {
-	unsigned long iter =3D 0;
-	unsigned long pfn =3D page_to_pfn(page);
-	unsigned long offset =3D pfn % pageblock_nr_pages;
+	unsigned long first_pfn =3D max(page_to_pfn(page), start_pfn);
+	unsigned long pfn =3D first_pfn;
+	unsigned long last_pfn =3D min(ALIGN(pfn + 1, pageblock_nr_pages), end_pf=
n);
+
+	page =3D pfn_to_page(pfn);
=20
 	if (is_migrate_cma_page(page)) {
 		/*
@@ -47,8 +51,8 @@ static struct page *has_unmovable_pages(struct zone *zone=
, struct page *page,
 		return page;
 	}
=20
-	for (; iter < pageblock_nr_pages - offset; iter++) {
-		page =3D pfn_to_page(pfn + iter);
+	for (pfn =3D first_pfn; pfn < last_pfn; pfn++) {
+		page =3D pfn_to_page(pfn);
=20
 		/*
 		 * Both, bootmem allocations and memory holes are marked
@@ -85,7 +89,7 @@ static struct page *has_unmovable_pages(struct zone *zone=
, struct page *page,
 			}
=20
 			skip_pages =3D compound_nr(head) - (page - head);
-			iter +=3D skip_pages - 1;
+			pfn +=3D skip_pages - 1;
 			continue;
 		}
=20
@@ -97,7 +101,7 @@ static struct page *has_unmovable_pages(struct zone *zon=
e, struct page *page,
 		 */
 		if (!page_ref_count(page)) {
 			if (PageBuddy(page))
-				iter +=3D (1 << buddy_order(page)) - 1;
+				pfn +=3D (1 << buddy_order(page)) - 1;
 			continue;
 		}
=20
@@ -134,7 +138,13 @@ static struct page *has_unmovable_pages(struct zone *z=
one, struct page *page,
 	return NULL;
 }
=20
-static int set_migratetype_isolate(struct page *page, int migratetype, int=
 isol_flags)
+/*
+ * This function set pageblock migratetype to isolate if no unmovable page=
 is
+ * present in [start_pfn, end_pfn). The pageblock must be within
+ * [start_pfn, end_pfn).
+ */
+static int set_migratetype_isolate(struct page *page, int migratetype, int=
 isol_flags,
+			unsigned long start_pfn, unsigned long end_pfn)
 {
 	struct zone *zone =3D page_zone(page);
 	struct page *unmovable;
@@ -156,7 +166,7 @@ static int set_migratetype_isolate(struct page *page, i=
nt migratetype, int isol_
 	 * FIXME: Now, memory hotplug doesn't call shrink_slab() by itself.
 	 * We just check MOVABLE pages.
 	 */
-	unmovable =3D has_unmovable_pages(zone, page, migratetype, isol_flags);
+	unmovable =3D has_unmovable_pages(zone, page, migratetype, isol_flags, st=
art_pfn, end_pfn);
 	if (!unmovable) {
 		unsigned long nr_pages;
 		int mt =3D get_pageblock_migratetype(page);
@@ -265,8 +275,12 @@ __first_valid_page(unsigned long pfn, unsigned long nr=
_pages)
 /**
  * start_isolate_page_range() - make page-allocation-type of range of page=
s to
  * be MIGRATE_ISOLATE.
- * @start_pfn:		The lower PFN of the range to be isolated.
- * @end_pfn:		The upper PFN of the range to be isolated.
+ * @start_pfn:		The lower PFN of the range to be checked for
+ *			possibility of isolation.
+ * @end_pfn:		The upper PFN of the range to be checked for
+ *			possibility of isolation.
+ * @isolate_start:		The lower PFN of the range to be isolated.
+ * @isolate_end:		The upper PFN of the range to be isolated.
  *			start_pfn/end_pfn must be aligned to pageblock_order.
  * @migratetype:	Migrate type to set in error recovery.
  * @flags:		The following flags are allowed (they can be combined in
@@ -304,20 +318,19 @@ __first_valid_page(unsigned long pfn, unsigned long n=
r_pages)
  * Return: 0 on success and -EBUSY if any part of range cannot be isolated.
  */
 int start_isolate_page_range(unsigned long start_pfn, unsigned long end_pf=
n,
+			     unsigned long isolate_start, unsigned long isolate_end,
 			     unsigned migratetype, int flags)
 {
 	unsigned long pfn;
 	struct page *page;
=20
-	BUG_ON(!IS_ALIGNED(start_pfn, pageblock_nr_pages));
-	BUG_ON(!IS_ALIGNED(end_pfn, pageblock_nr_pages));
-
-	for (pfn =3D start_pfn;
-	     pfn < end_pfn;
+	for (pfn =3D isolate_start;
+	     pfn < isolate_end;
 	     pfn +=3D pageblock_nr_pages) {
 		page =3D __first_valid_page(pfn, pageblock_nr_pages);
-		if (page && set_migratetype_isolate(page, migratetype, flags)) {
-			undo_isolate_page_range(start_pfn, pfn, migratetype);
+		if (page && set_migratetype_isolate(page, migratetype, flags,
+					start_pfn, end_pfn)) {
+			undo_isolate_page_range(isolate_start, pfn, migratetype);
 			return -EBUSY;
 		}
 	}
--=20
2.34.1

