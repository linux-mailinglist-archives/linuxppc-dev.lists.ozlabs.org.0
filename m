Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id ED173485B0D
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Jan 2022 22:50:28 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JTjpB6MLzz3bZN
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jan 2022 08:50:26 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=sent.com header.i=@sent.com header.a=rsa-sha256 header.s=fm2 header.b=Gnw5kDEv;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=AEIybQwU;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=sent.com (client-ip=66.111.4.230;
 helo=new4-smtp.messagingengine.com; envelope-from=zi.yan@sent.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=sent.com header.i=@sent.com header.a=rsa-sha256
 header.s=fm2 header.b=Gnw5kDEv; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=AEIybQwU; 
 dkim-atps=neutral
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JTjlw6hlYz2xYQ
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Jan 2022 08:48:27 +1100 (AEDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id 82E62580516;
 Wed,  5 Jan 2022 16:48:25 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Wed, 05 Jan 2022 16:48:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sent.com; h=from
 :to:cc:subject:date:message-id:in-reply-to:references:reply-to
 :mime-version:content-transfer-encoding; s=fm2; bh=pLhfLGipzI8++
 qIYMIVnkD5rDV8QoVpF5W3LR+3/IwA=; b=Gnw5kDEvRJbOmlvoEvQ4vpKG7S8SK
 j1uu9JA2H2vtlHmY099jZo9uhUqNplL221UZxxWi+kHEMyPceoZkdK2p7+Tx3hze
 GMvmLX15SjHzUzKPoJC+pamMGxn73Tui3GMN+JAO5QTamS5hCjQ8dBhpcXXHjQG9
 Myz+ZVi8CB6lYahF5KghMzqj1aDHAj05t5Ub8VuHPGI+Hm2n6zveQGMe7MG/sHOJ
 vj9NG7hfG8ue3GU6uoDuNLBvY5MQXtPIOUjzLxW8yYfZ3DCBhZnMMntbBcuer2Ko
 BkaWE4NqlvBkEKtNV5dymaUNWqZBZSy1mb2x0cZyBeSYF2+iy7PjoxtKw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:reply-to:subject
 :to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=pLhfLGipzI8++qIYMIVnkD5rDV8QoVpF5W3LR+3/IwA=; b=AEIybQwU
 Bc1S4r9mo8e/ZMtEZcXVTF6muGnmR9mczNKkfx5ZlTQPpJs4piw9GhQkuFHUFjGM
 yNQ1nU/dsySLhoLyiFzdNy8bQaqc2HT0vSOQNqYd4+N0o5UWBInRVpGOw/oiNKS0
 lmFkv5kU3BZTCm/osmv0mkgFBzh0m3pmkbMLMUcHuOh7dxWwoNKMazib8+2Mq1K2
 UM+mpLiLDibOWX5C7oMRIZSbTojBAtkWPJ/at9ESR8huXzTBFzHMWcH/98q5WvAP
 X6Iahi7RbyxXhocqm5DWjf04XK0Xr/kX2mzTsbKmbd41fBtSDUgwzaeQGxUAhTsA
 NJ0myAio5iyJ+A==
X-ME-Sender: <xms:KRLWYXgJbYYomj09YaKZvJffXG3--n1E19sF9rW04i4EsGDhZOLatg>
 <xme:KRLWYUD0hEVqOYh_O1a6Rbb1C3sMVJvWKQ_tzmNzRVE5Exmw1M53AJFwFHe0blaMy
 8f7qHEox9H5c2d1Cw>
X-ME-Received: <xmr:KRLWYXHXba88Nt0fqWBicghRi_AGs-v9IOKVKJblSdPpgHJRU-KbmUFbFQk4eU2VwLuVcKJ2>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrudefjedgieekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfrhgggfestdhqredtredttdenucfhrhhomhepkghiucgj
 rghnuceoiihirdihrghnsehsvghnthdrtghomheqnecuggftrfgrthhtvghrnhepieejue
 dvueduuefhgefhheeiuedvtedvuefgieegveetueeiueehtdegudehfeelnecuvehluhhs
 thgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepiihirdihrghnsehsvg
 hnthdrtghomh
X-ME-Proxy: <xmx:KRLWYUStY0C_yNp3tnXJg3h-VZlU3vlqaZI9NfCcDMZKj-HqA6OBsA>
 <xmx:KRLWYUyiD-cGy-aT2pFUZUoguosb-4450_lqWtS2mMa-Mqw-DvvTdw>
 <xmx:KRLWYa7-bnQSHbm8b1coARXyZRnyOmoJmGcFg6bzebrso1OKTgDFcA>
 <xmx:KRLWYfr0NFMz910K1mT81YWcSwpmDW8BBw2N18y7MOfApSsbK3ospg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 5 Jan 2022 16:48:24 -0500 (EST)
From: Zi Yan <zi.yan@sent.com>
To: David Hildenbrand <david@redhat.com>,
	linux-mm@kvack.org
Subject: [RFC PATCH v3 3/8] mm: migrate: allocate the right size of non
 hugetlb or THP compound pages.
Date: Wed,  5 Jan 2022 16:47:51 -0500
Message-Id: <20220105214756.91065-4-zi.yan@sent.com>
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

alloc_migration_target() is used by alloc_contig_range() and non-LRU
movable compound pages can be migrated. Current code does not allocate the
right page size for such pages. Check THP precisely using
is_transparent_huge() and add allocation support for non-LRU compound
pages.

Signed-off-by: Zi Yan <ziy@nvidia.com>
---
 mm/migrate.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/mm/migrate.c b/mm/migrate.c
index c7da064b4781..b1851ffb8576 100644
--- a/mm/migrate.c
+++ b/mm/migrate.c
@@ -1546,9 +1546,7 @@ struct page *alloc_migration_target(struct page *page=
, unsigned long private)
=20
 		gfp_mask =3D htlb_modify_alloc_mask(h, gfp_mask);
 		return alloc_huge_page_nodemask(h, nid, mtc->nmask, gfp_mask);
-	}
-
-	if (PageTransHuge(page)) {
+	} else if (is_transparent_hugepage(page)) {
 		/*
 		 * clear __GFP_RECLAIM to make the migration callback
 		 * consistent with regular THP allocations.
@@ -1556,14 +1554,19 @@ struct page *alloc_migration_target(struct page *pa=
ge, unsigned long private)
 		gfp_mask &=3D ~__GFP_RECLAIM;
 		gfp_mask |=3D GFP_TRANSHUGE;
 		order =3D HPAGE_PMD_ORDER;
+	} else if (PageCompound(page)) {
+		/* for non-LRU movable compound pages */
+		gfp_mask |=3D __GFP_COMP;
+		order =3D compound_order(page);
 	}
+
 	zidx =3D zone_idx(page_zone(page));
 	if (is_highmem_idx(zidx) || zidx =3D=3D ZONE_MOVABLE)
 		gfp_mask |=3D __GFP_HIGHMEM;
=20
 	new_page =3D __alloc_pages(gfp_mask, order, nid, mtc->nmask);
=20
-	if (new_page && PageTransHuge(new_page))
+	if (new_page && is_transparent_hugepage(page))
 		prep_transhuge_page(new_page);
=20
 	return new_page;
--=20
2.34.1

