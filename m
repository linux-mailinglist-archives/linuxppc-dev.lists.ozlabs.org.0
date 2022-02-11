Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E65DE4B2AC6
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Feb 2022 17:46:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JwKJC3JNPz3dln
	for <lists+linuxppc-dev@lfdr.de>; Sat, 12 Feb 2022 03:46:19 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=sent.com header.i=@sent.com header.a=rsa-sha256 header.s=fm2 header.b=HhkSZgj0;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=b+HoxZQU;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=sent.com (client-ip=66.111.4.221;
 helo=new1-smtp.messagingengine.com; envelope-from=zi.yan@sent.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=sent.com header.i=@sent.com header.a=rsa-sha256
 header.s=fm2 header.b=HhkSZgj0; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=b+HoxZQU; 
 dkim-atps=neutral
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JwKC54gxZz3bZX
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 12 Feb 2022 03:41:53 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id AB9DA58037C;
 Fri, 11 Feb 2022 11:41:50 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Fri, 11 Feb 2022 11:41:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sent.com; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to
 :reply-to:sender:subject:subject:to:to; s=fm2; bh=ns7zKpm4A9Xmsm
 ZwroT9dHnb6rgarNlTVL3pcGHHu0o=; b=HhkSZgj0d6uRtnT7s5z1WUa0qj27bC
 RPCjKEp+cbL/NNOORX1x08Je1Mb+zbU9hACFgx4vaehD0ZTg5j8N5A60hXkTStCy
 Rv3h+mkhOAeW+uSlBJXL2tBu25fgGR1H036XJbizSq7S+1Jo/kOmWIFe9ke16Omh
 vAU+Ys9UTqbD4kgtyX6RyUKSfEFijWPBxjbxZoDeOHAfCLwr8bNOqW7VSiUScaiP
 UXWhGfveqUGCmzHskSNDQhIqL71z/XsmBtobnRUISr9WbV1hvE7vqWkBckPtwQVR
 uoPFf1TYIIpWKFZQRzNfPhkJGXzXJ9VNr0/BjJVnIcPYaME1mwO8QF4w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=ns7zKpm4A9XmsmZwroT9dHnb6rgarNlTVL3pcGHHu0o=; b=b+HoxZQU
 sEXEVT7xD5fjST3/BM4MLUWPtVa/KKDHkcI8gFADHiFTXKmt7DZXdHdx6ZwYbwoq
 BklXre/vDPSfD0+Qw8Lx0GErCtY2BCkp24uBzza6Gus/TtT4yAVtGCX1SzS/UC2T
 qcKZnMV7l1b0G64riBoSSPoS8aUFV0q+o5zYaC5ZMVpHrU/2P7YqZ4uSGCiaAimf
 4+HJJ/OMddls4LrrNOvGOG90TS3HS1/VoAKDA39nyPDD0EdqJBFZkALEJ3wmGxyC
 6J4gppe20SdY1bb8QZGNwb/Tmk996l331/q91v4f7LAecyWfYMBpua2+7rkiIDCu
 633kilwZzAHD/g==
X-ME-Sender: <xms:zpEGYt8YBMIg8CcaUo7OhFh16T-q410PSZmYmPZAgExWxInlYMMB7g>
 <xme:zpEGYhsNoeGu3IfROXDOMCJCEILTPI5V9eTNzWyjubD6QCdzZbWrTfQxakq2vGPdh
 AhBktCT1ZbLbaz1ug>
X-ME-Received: <xmr:zpEGYrAunTmnZ4Lihw66gtLKSavy8pghJlRaXMkVOx0KAfFo_KSGaByNO17aWuyx_Xc0rHs8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrieefgdeklecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhhrggfgsedtqhertdertddtnecuhfhrohhmpegkihcujggr
 nhcuoeiiihdrhigrnhesshgvnhhtrdgtohhmqeenucggtffrrghtthgvrhhnpeeijeeuvd
 euudeuhfeghfehieeuvdetvdeugfeigeevteeuieeuhedtgeduheefleenucevlhhushht
 vghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpeiiihdrhigrnhesshgvnh
 htrdgtohhm
X-ME-Proxy: <xmx:zpEGYhdtAq80HV6uL94doGOQhiGCJT2kRZQklRM_ncx5859q-xVh0A>
 <xmx:zpEGYiPhgnG7MOILjVrDdUXC1xtgAwIf_oRHvBXUCCQVvnx9y3RXqg>
 <xmx:zpEGYjnqKVITtFlfbkrccG5Yo0EBjtUr5VJw2ePxbh93T4FsYNUNCQ>
 <xmx:zpEGYpn3rhItMIS_FdKpzmOeT8IkC1ap9lgL03qU1_2AM5KWNIB4IA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 11 Feb 2022 11:41:49 -0500 (EST)
From: Zi Yan <zi.yan@sent.com>
To: David Hildenbrand <david@redhat.com>,
	linux-mm@kvack.org
Subject: [PATCH v5 5/6] drivers: virtio_mem: use pageblock size as the minimum
 virtio_mem size.
Date: Fri, 11 Feb 2022 11:41:34 -0500
Message-Id: <20220211164135.1803616-6-zi.yan@sent.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220211164135.1803616-1-zi.yan@sent.com>
References: <20220211164135.1803616-1-zi.yan@sent.com>
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
 drivers/virtio/virtio_mem.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/virtio/virtio_mem.c b/drivers/virtio/virtio_mem.c
index 38becd8d578c..2307e65d18c2 100644
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

