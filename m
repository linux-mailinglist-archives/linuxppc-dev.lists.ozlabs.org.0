Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AC50046F733
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Dec 2021 00:05:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J98l545RMz3cR0
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Dec 2021 10:05:21 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=sent.com header.i=@sent.com header.a=rsa-sha256 header.s=fm2 header.b=g+PDsS02;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=eCoL+zNN;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=sent.com (client-ip=66.111.4.221;
 helo=new1-smtp.messagingengine.com; envelope-from=zi.yan@sent.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=sent.com header.i=@sent.com header.a=rsa-sha256
 header.s=fm2 header.b=g+PDsS02; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=eCoL+zNN; 
 dkim-atps=neutral
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J98kM4DgFz2yP5
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Dec 2021 10:04:42 +1100 (AEDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.nyi.internal (Postfix) with ESMTP id 69DEC580257;
 Thu,  9 Dec 2021 18:04:38 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Thu, 09 Dec 2021 18:04:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sent.com; h=from
 :to:cc:subject:date:message-id:in-reply-to:references:reply-to
 :mime-version:content-transfer-encoding; s=fm2; bh=y4otJIL1EgX6a
 ObpjvB92P7uYIVdj2sVeaHJNkCjjuY=; b=g+PDsS02y4+JveF/46j/0PLyhWMLO
 L/R1KjghmfnnQHTnqIM/5mZ0nvWeLeL/KCYbYkZkWNrcDtNnh5ZQY1PxhOOGTtlU
 Q4rGINDxGytfy/wPqRglLvPlfDPrEkByi/iTGk/mOeGdFQx3lMqQ2apddFrZCWuI
 1YXqW7nCtbkXJvDMRqrQa5/5/v/KJbRuAbqHArHLXtoYO+x53tBVazlWuT5AGdcD
 h9QhX4r4r4JncerMMdjtyc+ThqUhWZYuoQeYjOvGqk02yyhFp7KdXGrha77sHeO3
 reB1Y4ionbXhXYZJYfWIvlTPyexGRZET6UHMShnj1VERUDkZcUux8cAgQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:reply-to:subject
 :to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=y4otJIL1EgX6aObpjvB92P7uYIVdj2sVeaHJNkCjjuY=; b=eCoL+zNN
 UA/BxX4nhZ3kc/QdU1C/nfYJs5qMlOVZvb38K20KDs88RniGUUZBd/7JCFEfMjot
 jo9tenB5M5EbEb38FbPuSkjVvthw3sC7+NP9b3X8DA2/LP9BAbFf1gXtBRgqPKFK
 iqjzrXkS3GrpBpFoEhpQ3ZIdqbat82NQS2RHNjW1f0hcCu7QS1ChN5t2u+0nu65z
 v19mQczkSg3wZxq6ulkf7X56/bfb8mnW/3ayxANqHq1hmDdNDpLi+74B2PjGYkiI
 tU6OZmTO3tk7cjo8QGp/X4oQMSLVUFVCiQUB7jX8W+6zM1WuOGHorWZtOlu1BEc4
 vcj883fkVHOquQ==
X-ME-Sender: <xms:houyYQHjJX9StgPUOKcMNCXWVCj2jFYBwgaUReut2c_Zd0DPoJoDZg>
 <xme:houyYZWp9pe8d-gywMH_MFlb0NgBQ-044w_6AKQj_XLlCiqMCRX4m6EFweFp768bU
 c3zyc639YwCAwtAQw>
X-ME-Received: <xmr:houyYaJqHtOBQtXHsfPsnHi9ZH_dMeuKGXl3BdT77Ga8wgCRz1mG1KCUo8_pNvKifv4wC3Ra>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrkedugddtfecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhhrggfgsedtqhertdertddtnecuhfhrohhmpegkihcujggr
 nhcuoeiiihdrhigrnhesshgvnhhtrdgtohhmqeenucggtffrrghtthgvrhhnpeeijeeuvd
 euudeuhfeghfehieeuvdetvdeugfeigeevteeuieeuhedtgeduheefleenucevlhhushht
 vghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpeiiihdrhigrnhesshgvnh
 htrdgtohhm
X-ME-Proxy: <xmx:houyYSFf_EUZi7a7rdBRW-8BtBrw51wIV28fTa7sEI5-ienR2b9BYA>
 <xmx:houyYWXrmxZwinR_Dj9o4ndGpNXXxuZUiKEzmRKShqz8vJ-N7MsCDg>
 <xmx:houyYVOU4s16PfCFZCtFAgKLI3E4kx7SfrgtrRf_PFyek9IoUrCKyw>
 <xmx:houyYXu8lYiplwQusfJaXp0KrLu2FZ8TBlLef0O5FsDEtDRcCKsAWA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 9 Dec 2021 18:04:37 -0500 (EST)
From: Zi Yan <zi.yan@sent.com>
To: David Hildenbrand <david@redhat.com>,
	linux-mm@kvack.org
Subject: [RFC PATCH v2 2/7] mm: compaction: handle non-lru compound pages
 properly in isolate_migratepages_block().
Date: Thu,  9 Dec 2021 18:04:09 -0500
Message-Id: <20211209230414.2766515-3-zi.yan@sent.com>
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

In isolate_migratepages_block(), a !PageLRU tail page can be encountered
when the page is larger than a pageblock. Use compound head page for the
checks inside and skip the entire compound page when isolation succeeds.

Signed-off-by: Zi Yan <ziy@nvidia.com>
---
 mm/compaction.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/mm/compaction.c b/mm/compaction.c
index b4e94cda3019..ad9053fbbe06 100644
--- a/mm/compaction.c
+++ b/mm/compaction.c
@@ -979,19 +979,23 @@ isolate_migratepages_block(struct compact_control *cc=
, unsigned long low_pfn,
 		 * Skip any other type of page
 		 */
 		if (!PageLRU(page)) {
+			struct page *head =3D compound_head(page);
 			/*
 			 * __PageMovable can return false positive so we need
 			 * to verify it under page_lock.
 			 */
-			if (unlikely(__PageMovable(page)) &&
-					!PageIsolated(page)) {
+			if (unlikely(__PageMovable(head)) &&
+					!PageIsolated(head)) {
 				if (locked) {
 					unlock_page_lruvec_irqrestore(locked, flags);
 					locked =3D NULL;
 				}
=20
-				if (!isolate_movable_page(page, isolate_mode))
+				if (!isolate_movable_page(head, isolate_mode)) {
+					low_pfn +=3D (1 << compound_order(head)) - 1 - (page - head);
+					page =3D head;
 					goto isolate_success;
+				}
 			}
=20
 			goto isolate_fail;
--=20
2.33.0

