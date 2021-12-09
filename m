Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D4BE46F743
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Dec 2021 00:10:02 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J98rS3Z3Wz3dm9
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Dec 2021 10:10:00 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=sent.com header.i=@sent.com header.a=rsa-sha256 header.s=fm2 header.b=TuuRuLss;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=dTp5YN8n;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=sent.com (client-ip=66.111.4.221;
 helo=new1-smtp.messagingengine.com; envelope-from=zi.yan@sent.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=sent.com header.i=@sent.com header.a=rsa-sha256
 header.s=fm2 header.b=TuuRuLss; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=dTp5YN8n; 
 dkim-atps=neutral
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J98kR4dmJz3bXP
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Dec 2021 10:04:47 +1100 (AEDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id 2ACDE5802C9;
 Thu,  9 Dec 2021 18:04:42 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Thu, 09 Dec 2021 18:04:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sent.com; h=from
 :to:cc:subject:date:message-id:in-reply-to:references:reply-to
 :mime-version:content-transfer-encoding; s=fm2; bh=UTQs1ux+hZ7wP
 wqBSLphwUkfQ6f0lSb5ot+4msaDpHs=; b=TuuRuLssMKg6UBRpj/SlIFAWKPmqa
 s+1erp14Y9Z35RZSebwiDROJcjArV2wRAmJBjjX3uEEbDHV6qChrQcfmMdIFce7i
 szjDQPkGHVOHJLgC3+AY3iqMVelNSYSPa/7FhfSQ3mcx4XFHNKTsbJRMO0YhxZtB
 2jq0UT2K5ZPUJdFqfiwoTcKtsEXjEdwJj6blyVPQ7/n2O2uzXZZJx3knBjJKDKGD
 ln9hIdsuSHCBcVBdHNF4VNWtHRG+0/A3ZZISc3e6on4Njg3oJLUjCfL5bBRPsTqX
 lIZmC4qR835uuOA05xjmm3bIjA5WiH5J8YUFs7c3zwAnWCjvRQa8SwjFg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:reply-to:subject
 :to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=UTQs1ux+hZ7wPwqBSLphwUkfQ6f0lSb5ot+4msaDpHs=; b=dTp5YN8n
 NtGl0Q1FCz+Ay7HWSTl7DdQPolH5VXkIDGCHCA57hz0dFeNaCrC4cnAJJicMQmBA
 JlxuJYU7S4lGdLLK0NXpfSQi2jbck+onVDsYNJEqdwj2wjCwYwvFCSmNrZxyeYut
 Z+gS6VrkBSBcQLTFmdrxoDg0YKkSQH0PpgIgqzQCZ4GU3z5hHriKkalvxe+dJ3ur
 853yQ/qjrRseoiy0mfCXDWJTAF7lse+m8bhYxJs0yfr+oeQJdmUwWI7zSiQDo866
 syGhBzkc8H1QGu5blmZYAwDC71n4xDHHhNIs6Ykc2k33jD3Lg5a68VaJpnYGz6PZ
 kHyXZxRCfwAKWQ==
X-ME-Sender: <xms:iYuyYck0WYFqaCD_WJ4jOvDYi898Fbo7RFveIA_M73YY1bNC0R7yeg>
 <xme:iYuyYb0rqnc7K8ue5vQv3x9rMvRzb5zQAjvLP_nXm9Gl0pxg83zogVESeUXPsYrQ5
 qjqCxNjwYXjt7grcQ>
X-ME-Received: <xmr:iYuyYarFXAZsHAtOn4M6sDjTNLM5rLGrPfqzpZvcpzkqEuHADwiKMhO0aabh45rwzxFGQLUW>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrkedugddtgecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhhrggfgsedtqhertdertddtnecuhfhrohhmpegkihcujggr
 nhcuoeiiihdrhigrnhesshgvnhhtrdgtohhmqeenucggtffrrghtthgvrhhnpeeijeeuvd
 euudeuhfeghfehieeuvdetvdeugfeigeevteeuieeuhedtgeduheefleenucevlhhushht
 vghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpeiiihdrhigrnhesshgvnh
 htrdgtohhm
X-ME-Proxy: <xmx:iYuyYYlRsvjzvKR13_WATPZX6pQGBfVbrzROhdKBN-GTQ-3Q50BO0Q>
 <xmx:iYuyYa2RvU11-ltbh154NTkkUlTTCBgE95K_DCfpMLKeE8P-zWj79w>
 <xmx:iYuyYfsQ-zwAi1n3M7mBT5c7NjKZLkTReI_mo9_VLpbeB7m-LHDQ9w>
 <xmx:iouyYQOyibWXBG_QwhJoKzINkPiUFnGMOJHiezyfZ2RY9ICjW5sGgA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 9 Dec 2021 18:04:41 -0500 (EST)
From: Zi Yan <zi.yan@sent.com>
To: David Hildenbrand <david@redhat.com>,
	linux-mm@kvack.org
Subject: [RFC PATCH v2 6/7] drivers: virtio_mem: use pageblock size as the
 minimum virtio_mem size.
Date: Thu,  9 Dec 2021 18:04:13 -0500
Message-Id: <20211209230414.2766515-7-zi.yan@sent.com>
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

alloc_contig_range() now only needs to be aligned to pageblock_order,
drop virtio_mem size requirement that it needs to be the max of
pageblock_order and MAX_ORDER.

Signed-off-by: Zi Yan <ziy@nvidia.com>
---
 drivers/virtio/virtio_mem.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/virtio/virtio_mem.c b/drivers/virtio/virtio_mem.c
index 96e5a8782769..dab4bce417fd 100644
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

