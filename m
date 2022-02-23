Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E4A14C0B24
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Feb 2022 05:34:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K3NVV3TP1z3bVY
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Feb 2022 15:34:42 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=sent.com header.i=@sent.com header.a=rsa-sha256 header.s=fm2 header.b=OvJS9MBw;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=QQvfRN3w;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=sent.com (client-ip=66.111.4.224;
 helo=new2-smtp.messagingengine.com; envelope-from=zi.yan@sent.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=sent.com header.i=@sent.com header.a=rsa-sha256
 header.s=fm2 header.b=OvJS9MBw; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=QQvfRN3w; 
 dkim-atps=neutral
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K3NQ64NfZz3bP4
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Feb 2022 15:30:54 +1100 (AEDT)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.nyi.internal (Postfix) with ESMTP id E68F7580151;
 Tue, 22 Feb 2022 23:30:49 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Tue, 22 Feb 2022 23:30:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sent.com; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to
 :reply-to:sender:subject:subject:to:to; s=fm2; bh=EW0q3DKsqq85t3
 6Mhl5XwyP6zYfcE0gyy04nLECgLok=; b=OvJS9MBw0ak9QSpdlP0SjZT4EbTlVg
 G957KqEariXB87msO6UEXK8rXWBNRiPEu8WQJtJhslcx5XbwmNwSj3g3yHIcD3Aa
 SXiPHwpFb9ZgkYzgwvFBvEml0kMAqhy4E9+2zq6+vi+84oAzkthnmjNYuJQvkkn3
 NvFUSmz6hDV3JJJ/ZumtEv+VUUgQpHWpllbYbuOSSKSGMHKg/USS+2Gk+fz7X8bI
 U/ERaWqu7MWOyHGgT7DwKGWmA4vtyGUeJiWMOrwCTh4+jisPnnkxbBVin85fUNea
 udm6VtqSbdnaaffHtdOQ/X2JowEj6fIe6V17/71xEMwF6xKyGL7fUOdQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=EW0q3DKsqq85t36Mhl5XwyP6zYfcE0gyy04nLECgLok=; b=QQvfRN3w
 vMMnMOJfAC8ZY+rjIyJbgTJjBhTpPhCYy90nbh3dYxs8/uZ6tuSzkBIGf4/x0vP5
 h6P/BKfhvldynl22wSwYvr/jJhB0Oj1gfbn2dv85xVGT0THw00i/Yb+ZW08YEtZD
 SylhU/7swIv5Xpg1J9U+wYuAMU4ISXpTUJJLGf9nEfvU68RBOCylLg7vWlESVm6O
 /pv6gyEJguWkNqbwAqQaTD2H17LYwzISaEX8/JsZFDYvcjRF9y2MyAjK3Ohvfwmp
 ROwTD+y/D+k1wO3Ca5vLJJskVHGgGB4uJuPwU1yVayCIqmrf6wG2Z/N+vrtWHYkC
 kMaHkBXEgB4Qmg==
X-ME-Sender: <xms:ebgVYrJ4ulT1rRejF-PBu9amo-MxXNhUbsVqtw7ain1W8mUD58c-NA>
 <xme:ebgVYvJr44MKSnAMIpfiFXrgh2SAnUbxdILzJb1_a8PBvyfIOlDuTvbaFqhkAf9J7
 0QUS0ul53vLMFTvfQ>
X-ME-Received: <xmr:ebgVYju6SNG5wG97wpYPtCi_ac0X3RGv8KZHIVFAuAZJON7ognS8SMc9XbZ2L2hWHeMKdajw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrkeelgdejudcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhhrggfgsedtqhertdertddtnecuhfhrohhmpegkihcujggr
 nhcuoeiiihdrhigrnhesshgvnhhtrdgtohhmqeenucggtffrrghtthgvrhhnpeeijeeuvd
 euudeuhfeghfehieeuvdetvdeugfeigeevteeuieeuhedtgeduheefleenucevlhhushht
 vghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpeiiihdrhigrnhesshgvnh
 htrdgtohhm
X-ME-Proxy: <xmx:ebgVYka5j5CFpx65WA7YkbyC4MicIWPpBuOfY6VBkCLl3oxKxg5CZg>
 <xmx:ebgVYiaLcmpM7HJmJ_-H90HXOnxzCK4ajyZGKggtrmU_EpQHSNW_bw>
 <xmx:ebgVYoD_t_cAY9j91YpfqwQPi4RLTQ3GIsRpGMeyU5h7eBCnrG1gRw>
 <xmx:ebgVYnLK_DN2ZYxxBsbKhrUuS3SRjebwvZKdMzoMrfnalSiIoXwspw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 22 Feb 2022 23:30:49 -0500 (EST)
From: Zi Yan <zi.yan@sent.com>
To: David Hildenbrand <david@redhat.com>,
	linux-mm@kvack.org
Subject: [PATCH v6 5/5] drivers: virtio_mem: use pageblock size as the minimum
 virtio_mem size.
Date: Tue, 22 Feb 2022 23:30:37 -0500
Message-Id: <20220223043037.715205-6-zi.yan@sent.com>
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

alloc_contig_range() now only needs to be aligned to pageblock_order,
drop virtio_mem size requirement that it needs to be the max of
pageblock_order and MAX_ORDER.

Signed-off-by: Zi Yan <ziy@nvidia.com>
---
 drivers/virtio/virtio_mem.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/virtio/virtio_mem.c b/drivers/virtio/virtio_mem.c
index e7d6b679596d..e07486f01999 100644
--- a/drivers/virtio/virtio_mem.c
+++ b/drivers/virtio/virtio_mem.c
@@ -2476,10 +2476,10 @@ static int virtio_mem_init_hotplug(struct virtio_me=
m *vm)
 				      VIRTIO_MEM_DEFAULT_OFFLINE_THRESHOLD);
=20
 	/*
-	 * TODO: once alloc_contig_range() works reliably with pageblock
-	 * granularity on ZONE_NORMAL, use pageblock_nr_pages instead.
+	 * alloc_contig_range() works reliably with pageblock
+	 * granularity on ZONE_NORMAL, use pageblock_nr_pages.
 	 */
-	sb_size =3D PAGE_SIZE * MAX_ORDER_NR_PAGES;
+	sb_size =3D PAGE_SIZE * pageblock_nr_pages;
 	sb_size =3D max_t(uint64_t, vm->device_block_size, sb_size);
=20
 	if (sb_size < memory_block_size_bytes() && !force_bbm) {
--=20
2.34.1

