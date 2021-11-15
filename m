Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B7389451320
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Nov 2021 20:48:02 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HtKVS4sgwz3bWC
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Nov 2021 06:48:00 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=sent.com header.i=@sent.com header.a=rsa-sha256 header.s=fm2 header.b=BKmBzgqZ;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=kiuzRyPO;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=sent.com (client-ip=66.111.4.229;
 helo=new3-smtp.messagingengine.com; envelope-from=zi.yan@sent.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=sent.com header.i=@sent.com header.a=rsa-sha256
 header.s=fm2 header.b=BKmBzgqZ; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=kiuzRyPO; 
 dkim-atps=neutral
X-Greylist: delayed 488 seconds by postgrey-1.36 at boromir;
 Tue, 16 Nov 2021 06:46:02 AEDT
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HtKSB19Y4z2y7P
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Nov 2021 06:46:01 +1100 (AEDT)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.nyi.internal (Postfix) with ESMTP id B7C18580602;
 Mon, 15 Nov 2021 14:37:50 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Mon, 15 Nov 2021 14:37:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sent.com; h=from
 :to:cc:subject:date:message-id:in-reply-to:references:reply-to
 :mime-version:content-transfer-encoding; s=fm2; bh=a+9SaU26Y1rPF
 GyS1WzVkAI8ORDjkq5xA8lNQwfmk18=; b=BKmBzgqZxXa0J64ox5NeMlhY+r2yw
 R7bd+SoJsM07Gtya2kdAsY2E43ShHDOPFExljfox3WCyWzjzdDL5p2mrKF5GqpHP
 EObQqiXRjtjWVrsOX6YPkS+EMZ/Dj9HyqVoyNzLOyG790gnrLGvaaLbFAYi45Cv5
 9d4Iysn8ddNcWWzrt9fAG+AGLcuGN0YxSzV+B3GjRSB9+WcSU6ReLQAmMnrc3ivN
 d3wEErrq6pvDWWQPgGkKkxQB6QC0Ox2agMWjFM4eO7PMi5v8RXaVeaRHOCVkLNf7
 lPd2C9zHaqpGhHiT3UjS/hRcPsVLqELMLeKiPpSnTvFVFaMermpNezFUQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:reply-to:subject
 :to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=a+9SaU26Y1rPFGyS1WzVkAI8ORDjkq5xA8lNQwfmk18=; b=kiuzRyPO
 ZvY8tTz378QI6W857EHDaRr/YZqlK7ZoAdCzorKlaow6J3+fsrwydSdhi8+BRTsi
 1pDUppUkgJUqc/kbd4oEcIYHRVOAyr2qyQIP2GLMq5f4579qt5KNqvZCgAVVpChB
 8EwJH6CagIi1WGMi9ueeQRXFlHao/J0GEWi5P9oor4kBww8Szif36j8kilN4m+UV
 yBCrAc3TR743FGxC14RxW7Eb3jwuX3L8AaZt3GGEGmh8gnTyYIigz24PvCSY1e6w
 SoCSHx7TI65v0BeW5vUFh8gkEs7ol37xzFQrfMcNSwH3MOL88eRDQlXukZ9iCxFO
 ybvB29K1ccjjkA==
X-ME-Sender: <xms:DreSYfIJvxvEnKnv0iXTG1ZnHqaExBbS5dNXkEqMEHcBSPwAZHcSXw>
 <xme:DreSYTLEVMKzLfC28MKFRjZfWWLmfwTsYI3T8DD60qsDF_nH2HJBQJuA0hVN36EQl
 ee0MKvlgCsIcUJkPQ>
X-ME-Received: <xmr:DreSYXvN1Bcf2Ojx9gLX1ndEINBNzlIYzFjpOVr5cMjaET2dnTWA3z4J7x4-zRVYWJVIPAnu>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrfedtgddutddtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfrhgggfestdhqredtredttdenucfhrhhomhepkghiucgj
 rghnuceoiihirdihrghnsehsvghnthdrtghomheqnecuggftrfgrthhtvghrnhepieejue
 dvueduuefhgefhheeiuedvtedvuefgieegveetueeiueehtdegudehfeelnecuvehluhhs
 thgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepiihirdihrghnsehsvg
 hnthdrtghomh
X-ME-Proxy: <xmx:DreSYYZrf7Lfn5Vv9aYD6fkO9UoSrAsOc0IMHQAQr_cenSefDMXG1g>
 <xmx:DreSYWbwpgoZtno8I5evDy4BZOmNuGbCTNHZYpJeKYTie26UmV79Yg>
 <xmx:DreSYcCb_hfqQy5bN6Km_KELJY0_KEpCiFxpX9bLUp4NRRMDwlt5ZQ>
 <xmx:DreSYcl5_mYIwYB3XdeySsJ8bS2SjPe0IWRpY4aUTo4U0rsabXItSQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 15 Nov 2021 14:37:49 -0500 (EST)
From: Zi Yan <zi.yan@sent.com>
To: David Hildenbrand <david@redhat.com>,
	linux-mm@kvack.org
Subject: [RFC PATCH 2/3] drivers: virtio_mem: use pageblock size as the
 minimum virtio_mem size.
Date: Mon, 15 Nov 2021 14:37:23 -0500
Message-Id: <20211115193725.737539-3-zi.yan@sent.com>
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

alloc_contig_range() now only needs to be aligned to pageblock_order,
drop virtio_mem size requirement that it needs to be the max of
pageblock_order and MAX_ORDER.

Signed-off-by: Zi Yan <ziy@nvidia.com>
---
 drivers/virtio/virtio_mem.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/virtio/virtio_mem.c b/drivers/virtio/virtio_mem.c
index 0da0af251c73..a0a0994b42e2 100644
--- a/drivers/virtio/virtio_mem.c
+++ b/drivers/virtio/virtio_mem.c
@@ -2436,15 +2436,13 @@ static int virtio_mem_init_hotplug(struct virtio_me=
m *vm)
 				      VIRTIO_MEM_DEFAULT_OFFLINE_THRESHOLD);
=20
 	/*
-	 * We want subblocks to span at least MAX_ORDER_NR_PAGES and
-	 * pageblock_nr_pages pages. This:
+	 * We want subblocks to span at least pageblock_nr_pages pages. This:
 	 * - Simplifies our page onlining code (virtio_mem_online_page_cb)
 	 *   and fake page onlining code (virtio_mem_fake_online).
 	 * - Is required for now for alloc_contig_range() to work reliably -
 	 *   it doesn't properly handle smaller granularity on ZONE_NORMAL.
 	 */
-	sb_size =3D max_t(uint64_t, MAX_ORDER_NR_PAGES,
-			pageblock_nr_pages) * PAGE_SIZE;
+	sb_size =3D pageblock_nr_pages * PAGE_SIZE;
 	sb_size =3D max_t(uint64_t, vm->device_block_size, sb_size);
=20
 	if (sb_size < memory_block_size_bytes() && !force_bbm) {
--=20
2.33.0

