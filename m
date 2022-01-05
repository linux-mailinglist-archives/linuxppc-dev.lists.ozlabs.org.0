Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E686485B18
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Jan 2022 22:51:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JTjqj6zzGz3cPY
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jan 2022 08:51:45 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=sent.com header.i=@sent.com header.a=rsa-sha256 header.s=fm2 header.b=zJFe7Ao9;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=I9TcvzqS;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=sent.com (client-ip=66.111.4.230;
 helo=new4-smtp.messagingengine.com; envelope-from=zi.yan@sent.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=sent.com header.i=@sent.com header.a=rsa-sha256
 header.s=fm2 header.b=zJFe7Ao9; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=I9TcvzqS; 
 dkim-atps=neutral
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JTjlw6lBDz2xgb
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Jan 2022 08:48:27 +1100 (AEDT)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id B286B580514;
 Wed,  5 Jan 2022 16:48:24 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Wed, 05 Jan 2022 16:48:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sent.com; h=from
 :to:cc:subject:date:message-id:in-reply-to:references:reply-to
 :mime-version:content-transfer-encoding; s=fm2; bh=F+6ytW8tADp2L
 NXytpAkKv+4a//pcBSmjTaldQvhu2o=; b=zJFe7Ao9MCOK+TZjq/K/TbeuXuhub
 uEMymMtNy7GDdtEO7HZkK2k7I0QJefpyNTc6QIDRv3VbTOQEz0mNoaKnX14u+Qdb
 o2OErLMPr8nbMPNViHntkADNEWvCU58ZNRNcUUUmv7lhKZFOrqn1ybsMWLAGNaxm
 lUcKl2Ja/YD7ICRFcBTTQK5B8G882NbVn06HGziGFLC39Gegp3cWIj7DDkwJ7odw
 C+Q7WHZw32/+23uQlB375cehRMhlM7Ev0KcGrO73+dc0fxhwnorPVP9V7xPUULlD
 Bm5XJPhUX0VfbeXD3jZhrIUp323BLLWatMr3g4u8XfgsAcn1XBlhLyzSw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:reply-to:subject
 :to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=F+6ytW8tADp2LNXytpAkKv+4a//pcBSmjTaldQvhu2o=; b=I9TcvzqS
 Rw1NjBo+afbuM8HtqRLcbw5Y9/BUmNxengQ94iNfi4ETD2oDiTzizNxDWj0LPQ2B
 OfoQMTZ8GfnHobghTSW7URMh5JN5eZgGZ1w1YXl8AjktYUMIuDvEgCbRBWcFvfmk
 0IByqySd67Ky97vYXjeCnQL5mgBwYo6aKzFN7QmZ5aHMGZ6AdspxurgVt+kzf4fz
 5lvpapJNbk7lbPeWTK66P7UyBJJmRF+mSGy4zhtshTg3cFHYh2Mf0BZtzjnCEePw
 eIGV2ZIxnul9Y/lJzUQVQC08PkN8ojSSITPC+8d7mVxj8WOETGsGkuW690Y2Ehkt
 n6DTyTq83VG7/w==
X-ME-Sender: <xms:KBLWYWudW-f_b8lxHrHC0ANfNhVh1kU6W5VuYTCGJeKwxUprJ2lhRw>
 <xme:KBLWYbdECgIoVGkrmS1Ler2I7x_DQeKfKtFS9G2bH723wbLALFLR2jxIMrGlNkkh1
 vYTfON0Z9EmgIU1Ew>
X-ME-Received: <xmr:KBLWYRwEMBrJrMNO3NLltA-ncavGBeJJsfnEQjJC0IqIbEYhrkNm2SwGtWlowtYCB52UGbH5>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrudefjedgieekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfrhgggfestdhqredtredttdenucfhrhhomhepkghiucgj
 rghnuceoiihirdihrghnsehsvghnthdrtghomheqnecuggftrfgrthhtvghrnhepieejue
 dvueduuefhgefhheeiuedvtedvuefgieegveetueeiueehtdegudehfeelnecuvehluhhs
 thgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepiihirdihrghnsehsvg
 hnthdrtghomh
X-ME-Proxy: <xmx:KBLWYRNU1qDmXKct-2LwZuXjSGwzfevVTXIyvqvS_1nUwOXOqxqSdw>
 <xmx:KBLWYW-ikkLLSpKvGvdFTzzd6nt9QY3FeQkAZZEGGVnliys1-pAACQ>
 <xmx:KBLWYZV_mZeFmV6P6ybsv87N65vJ1FwD3zpTdVueHFAhW_SanZr7og>
 <xmx:KBLWYRUuQYynZ-mTXTyZCnQKtoV-i-cxoeAoO2SIlFPDgV2JOnSUmg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 5 Jan 2022 16:48:24 -0500 (EST)
From: Zi Yan <zi.yan@sent.com>
To: David Hildenbrand <david@redhat.com>,
	linux-mm@kvack.org
Subject: [RFC PATCH v3 2/8] mm: compaction: handle non-lru compound pages
 properly in isolate_migratepages_block().
Date: Wed,  5 Jan 2022 16:47:50 -0500
Message-Id: <20220105214756.91065-3-zi.yan@sent.com>
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
2.34.1

