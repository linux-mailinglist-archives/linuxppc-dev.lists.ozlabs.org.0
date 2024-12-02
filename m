Return-Path: <linuxppc-dev+bounces-3669-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id ECFF89E02A4
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Dec 2024 13:59:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y23kd50Bhz2ypx;
	Mon,  2 Dec 2024 23:58:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733144329;
	cv=none; b=IK3JzXQ9Q4qbJFhaJrdwoQhdMDMUT7xKfK9o1np8w6ItGStMcmTHaFPGanzFam019E/+lOhBKNtxUPcwl9GbjoI4IxIQWhFo+pHt13GUJheZPHLl16IJ/cP/KRYLYiFkK4bA2g8l+zP9pCa4dkH/MOLv26W3lAL0tNFhMbZsLR6tvus3xcwVjhvGX/4X9vXNVHeV5hnfuCQn1uTvaD3lFlRmTrK7IlVYTCjVUT9syZf4t8ZIZX8EjVkWZJzsZtMm6VHGZU4ty7YZL+iqdY2OxA69YyrC5OAwJYO3oCT0I1wgn0W7jFA2xBPEv5wEUwlb89FROCCM3MMeP4tlmUL3aQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733144329; c=relaxed/relaxed;
	bh=BDcVjfuXZieBJ7OFGqsXEKMWupL5rjT8Tdv/3NGIh+8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=i2uakF9+X4NpKSYZUXUu0+ydEabt9BBs+7MPhsiTEcw8jlN3GB96vfpEMxcJBQZmndt2QFleRKxmV2EJmssWwHOWpPOpH+tZLYthNdUo1zpC5GJIg3R99C+b4K3QIRfGB9QO4S5Q0Ka1zBouxMC0wk7rBv+66/I7ISWMH41Tz0YaoPCnrSjhWrJcX8PhqoRRv2PFvi34K54tr5zsM2Xr/pfjCBSnVhdhWeNrzycJCrOefg2sZFBlN4ggmIVY6W8oKYIijqi3vOBHuNOI37NAbSlV952QQp6HMx2hr/QgNn6NeNWjihsHFW9NRNQV0jOz7zv1DfDY8NMjeMzLipGaZg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Uj9qAR9a; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Uj9qAR9a; dkim-atps=neutral; spf=pass (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Uj9qAR9a;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Uj9qAR9a;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y23kc4zGbz2xxr
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  2 Dec 2024 23:58:48 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1733144325;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BDcVjfuXZieBJ7OFGqsXEKMWupL5rjT8Tdv/3NGIh+8=;
	b=Uj9qAR9a45nqwB3zkrwXnRobXMvWFKMQC5FhyezTvCeIGs28eiZ+IM6t3PuibLLYFcSQ8u
	mxboFiyFxtTfc/jMXbNUsw4XGkxRcdtdVmBYLV/7gpdTReN2L2a7uA4EKuNKoygSjm74Lj
	ZkkyFa23Nq4c6DvRlTcHQYFZADQdwfw=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1733144325;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BDcVjfuXZieBJ7OFGqsXEKMWupL5rjT8Tdv/3NGIh+8=;
	b=Uj9qAR9a45nqwB3zkrwXnRobXMvWFKMQC5FhyezTvCeIGs28eiZ+IM6t3PuibLLYFcSQ8u
	mxboFiyFxtTfc/jMXbNUsw4XGkxRcdtdVmBYLV/7gpdTReN2L2a7uA4EKuNKoygSjm74Lj
	ZkkyFa23Nq4c6DvRlTcHQYFZADQdwfw=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-609-guoW4AixOXSxWRl1bTT8Hg-1; Mon,
 02 Dec 2024 07:58:42 -0500
X-MC-Unique: guoW4AixOXSxWRl1bTT8Hg-1
X-Mimecast-MFC-AGG-ID: guoW4AixOXSxWRl1bTT8Hg
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 63C71192538B;
	Mon,  2 Dec 2024 12:58:40 +0000 (UTC)
Received: from t14s.cit.tum.de (unknown [10.39.194.150])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id D1A9E1955E98;
	Mon,  2 Dec 2024 12:58:35 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: linux-mm@kvack.org,
	linuxppc-dev@lists.ozlabs.org,
	David Hildenbrand <david@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Oscar Salvador <osalvador@suse.de>,
	Zi Yan <ziy@nvidia.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>
Subject: [PATCH v1 4/6] mm/page_alloc: sort out the alloc_contig_range() gfp flags mess
Date: Mon,  2 Dec 2024 13:58:10 +0100
Message-ID: <20241202125812.561028-5-david@redhat.com>
In-Reply-To: <20241202125812.561028-1-david@redhat.com>
References: <20241202125812.561028-1-david@redhat.com>
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
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40
X-Spam-Status: No, score=-0.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

It's all a bit complicated for alloc_contig_range(). For example, we don't
support many flags, so let's start bailing out on unsupported
ones -- ignoring the placement hints, as we are already given the range
to allocate.

While we currently set cc.gfp_mask, in __alloc_contig_migrate_range() we
simply create yet another GFP mask whereby we ignore the reclaim flags
specify by the caller. That looks very inconsistent.

Let's clean it up, constructing the gfp flags used for
compaction/migration exactly once. Update the documentation of the
gfp_mask parameter for alloc_contig_range() and alloc_contig_pages().

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 mm/page_alloc.c | 48 ++++++++++++++++++++++++++++++++++++++++++++----
 1 file changed, 44 insertions(+), 4 deletions(-)

diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index ce7589a4ec01..54594cc4f650 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -6294,7 +6294,7 @@ static int __alloc_contig_migrate_range(struct compact_control *cc,
 	int ret = 0;
 	struct migration_target_control mtc = {
 		.nid = zone_to_nid(cc->zone),
-		.gfp_mask = GFP_USER | __GFP_MOVABLE | __GFP_RETRY_MAYFAIL,
+		.gfp_mask = cc->gfp_mask,
 		.reason = MR_CONTIG_RANGE,
 	};
 	struct page *page;
@@ -6390,6 +6390,39 @@ static void split_free_pages(struct list_head *list)
 	}
 }
 
+static int __alloc_contig_verify_gfp_mask(gfp_t gfp_mask, gfp_t *gfp_cc_mask)
+{
+	const gfp_t reclaim_mask = __GFP_IO | __GFP_FS | __GFP_RECLAIM;
+	const gfp_t action_mask = __GFP_COMP | __GFP_RETRY_MAYFAIL | __GFP_NOWARN;
+	const gfp_t cc_action_mask = __GFP_RETRY_MAYFAIL | __GFP_NOWARN;
+
+	/*
+	 * We are given the range to allocate; node, mobility and placement
+	 * hints are irrelevant at this point. We'll simply ignore them.
+	 */
+	gfp_mask &= ~(GFP_ZONEMASK | __GFP_RECLAIMABLE | __GFP_WRITE |
+		      __GFP_HARDWALL | __GFP_THISNODE | __GFP_MOVABLE);
+
+	/*
+	 * We only support most reclaim flags (but not NOFAIL/NORETRY), and
+	 * selected action flags.
+	 */
+	if (gfp_mask & ~(reclaim_mask | action_mask))
+		return -EINVAL;
+
+	/*
+	 * Flags to control page compaction/migration/reclaim, to free up our
+	 * page range. Migratable pages are movable, __GFP_MOVABLE is implied
+	 * for them.
+	 *
+	 * Traditionally we always had __GFP_HARDWALL|__GFP_RETRY_MAYFAIL set,
+	 * keep doing that to not degrade callers.
+	 */
+	*gfp_cc_mask = (gfp_mask & (reclaim_mask | cc_action_mask)) |
+			__GFP_HARDWALL | __GFP_MOVABLE | __GFP_RETRY_MAYFAIL;
+	return 0;
+}
+
 /**
  * alloc_contig_range() -- tries to allocate given range of pages
  * @start:	start PFN to allocate
@@ -6398,7 +6431,9 @@ static void split_free_pages(struct list_head *list)
  *			#MIGRATE_MOVABLE or #MIGRATE_CMA).  All pageblocks
  *			in range must have the same migratetype and it must
  *			be either of the two.
- * @gfp_mask:	GFP mask to use during compaction
+ * @gfp_mask:	GFP mask. Node/zone/placement hints are ignored; only some
+ *		action and reclaim modifiers are supported. Reclaim modifiers
+ *		control allocation behavior during compaction/migration/reclaim.
  *
  * The PFN range does not have to be pageblock aligned. The PFN range must
  * belong to a single zone.
@@ -6424,11 +6459,14 @@ int alloc_contig_range_noprof(unsigned long start, unsigned long end,
 		.mode = MIGRATE_SYNC,
 		.ignore_skip_hint = true,
 		.no_set_skip_hint = true,
-		.gfp_mask = current_gfp_context(gfp_mask),
 		.alloc_contig = true,
 	};
 	INIT_LIST_HEAD(&cc.migratepages);
 
+	gfp_mask = current_gfp_context(gfp_mask);
+	if (__alloc_contig_verify_gfp_mask(gfp_mask, (gfp_t *)&cc.gfp_mask))
+		return -EINVAL;
+
 	/*
 	 * What we do here is we mark all pageblocks in range as
 	 * MIGRATE_ISOLATE.  Because pageblock and max order pages may
@@ -6571,7 +6609,9 @@ static bool zone_spans_last_pfn(const struct zone *zone,
 /**
  * alloc_contig_pages() -- tries to find and allocate contiguous range of pages
  * @nr_pages:	Number of contiguous pages to allocate
- * @gfp_mask:	GFP mask to limit search and used during compaction
+ * @gfp_mask:	GFP mask. Node/zone/placement hints limit the search; only some
+ *		action and reclaim modifiers are supported. Reclaim modifiers
+ *		control allocation behavior during compaction/migration/reclaim.
  * @nid:	Target node
  * @nodemask:	Mask for other possible nodes
  *
-- 
2.47.1


