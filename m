Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EF2149406E
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Jan 2022 20:11:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JfFcm73CXz3cbt
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Jan 2022 06:11:52 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=sent.com header.i=@sent.com header.a=rsa-sha256 header.s=fm2 header.b=iI0Xifsc;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=ln/IExRu;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=sent.com (client-ip=66.111.4.230;
 helo=new4-smtp.messagingengine.com; envelope-from=zi.yan@sent.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=sent.com header.i=@sent.com header.a=rsa-sha256
 header.s=fm2 header.b=iI0Xifsc; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=ln/IExRu; 
 dkim-atps=neutral
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JfFVq2grMz30LY
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Jan 2022 06:06:43 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id 4B986580730;
 Wed, 19 Jan 2022 14:06:40 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Wed, 19 Jan 2022 14:06:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sent.com; h=from
 :to:cc:subject:date:message-id:in-reply-to:references:reply-to
 :mime-version:content-transfer-encoding; s=fm2; bh=VbnqumJAL4r7o
 PXU1B7/2AqlEeyilMgkB8Z6AdGXQWo=; b=iI0XifscyxRyNU2nNcg0p2IMkEy3e
 1EuyVZfwKTLv+XEo9nCFdk0H5mkwD7i7Aq+gayhI/BlCO24BAgXF5jaHx3S3FQRE
 rxdrdZsc12FBtiE2Dpar0r6YxrhJU+WU6hTXLnsZjClhQ8cTTWFKKq7ea+N9rq6T
 Xh7uK0moTsH4LK4/jK0QbDVdODFQa1o+99M/gn46XI67hUpfY65bcPCyJHv6PHF/
 bGcAwer4Ms9MbJmV2ET/Tw3v54jfWJgP92rHXTF0kbhZEMuiK8LZWVccwfOF9NRx
 Y8wYL2JPLD1mXMtkWQCf9fE74qq7bnrnrOC3VPh40ulPoeJZs3qjZc/dA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:reply-to:subject
 :to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=VbnqumJAL4r7oPXU1B7/2AqlEeyilMgkB8Z6AdGXQWo=; b=ln/IExRu
 IX3Ngu9Srz6FhkcAULotpPuKNYZGxiHzOvW3borqnE/QzdlHZ9Z7R/ZXOULt5zd7
 XgZdpUUIVFX2rj1W7OkdqrhQa5/SfoU/EZFTMye5P5+TmSbriwaBHVWc7xXT8Bd7
 9rbQ4Q0A+UecyD0TADRV1zaCKmgjNeWOE0EuXw9widzTi6YryjkGqp11INm1zwzk
 CvdrBNAUGz0bxozLyW5o9FMi//QVU3lBQAUCFoUQvB4xWcxrHjUzHmn1hmFreVpN
 V7dPt938YbZA1XI5W/flHNeegA98GnbKMOpTdQw5i4iUI92GTwy0mrqC6jT77Gv/
 KSZUvGlhcve8Wg==
X-ME-Sender: <xms:QGHoYbtp_B1wdpMo5t2l9oE7stqZFzq20lCeQ4uCxBMgaZV1F2c9MA>
 <xme:QGHoYcci0XXibWIkEosG1VlR9Rvx_MHnWSEf1IBPA2w39EMp3Ho4N5nk0VBIMoW6u
 1-fMcFG49YaHimOSg>
X-ME-Received: <xmr:QGHoYezwHqjwC8A7_YI1pFVJYTWHfhXWYwjdXWq7D1l2WsX7CQUGIUK_Mt8WTAHKp8M2cak1>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudeigdeivdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhhrggfgsedtqhertdertddtnecuhfhrohhmpegkihcujggr
 nhcuoeiiihdrhigrnhesshgvnhhtrdgtohhmqeenucggtffrrghtthgvrhhnpeeijeeuvd
 euudeuhfeghfehieeuvdetvdeugfeigeevteeuieeuhedtgeduheefleenucevlhhushht
 vghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpeiiihdrhigrnhesshgvnh
 htrdgtohhm
X-ME-Proxy: <xmx:QGHoYaMIFGiyyNjgwRGKm380P0rbj2Frq10NmQVKCCjaPPhbW2Flpw>
 <xmx:QGHoYb_j0dzi9YXmkoNqMy_hu9Ge4gKGK02fSjLO7eZTdA8DYz4a_Q>
 <xmx:QGHoYaUu9q5u7A5e7HgnMDS97TVHUVwdqePaaQYgyTAa3wtxSiJAUg>
 <xmx:QGHoYeUrjpbHQ0fZM8NhK9zLdS_e2FUfjnVkcUw25okDdKH3fWbFAg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 19 Jan 2022 14:06:39 -0500 (EST)
From: Zi Yan <zi.yan@sent.com>
To: David Hildenbrand <david@redhat.com>,
	linux-mm@kvack.org
Subject: [PATCH v4 6/7] drivers: virtio_mem: use pageblock size as the minimum
 virtio_mem size.
Date: Wed, 19 Jan 2022 14:06:22 -0500
Message-Id: <20220119190623.1029355-7-zi.yan@sent.com>
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

alloc_contig_range() now only needs to be aligned to pageblock_order,
drop virtio_mem size requirement that it needs to be the max of
pageblock_order and MAX_ORDER.

Signed-off-by: Zi Yan <ziy@nvidia.com>
---
 drivers/virtio/virtio_mem.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/virtio/virtio_mem.c b/drivers/virtio/virtio_mem.c
index a6a78685cfbe..eafba2119ae3 100644
--- a/drivers/virtio/virtio_mem.c
+++ b/drivers/virtio/virtio_mem.c
@@ -2476,13 +2476,12 @@ static int virtio_mem_init_hotplug(struct virtio_me=
m *vm)
 				      VIRTIO_MEM_DEFAULT_OFFLINE_THRESHOLD);
=20
 	/*
-	 * We want subblocks to span at least MAX_ORDER_NR_PAGES and
-	 * pageblock_nr_pages pages. This:
+	 * We want subblocks to span at least pageblock_nr_pages pages.
+	 * This:
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
2.34.1

