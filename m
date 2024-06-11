Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D50999030FC
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jun 2024 07:29:07 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=tqeyL4qA;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vyy005WNYz3cZ2
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jun 2024 15:29:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=tqeyL4qA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=bombadil.srs.infradead.org (client-ip=2607:7c80:54:3::133; helo=bombadil.infradead.org; envelope-from=batv+2fedbe304aabaf399917+7597+infradead.org+hch@bombadil.srs.infradead.org; receiver=lists.ozlabs.org)
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Vyxny1JD6z3cBN
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Jun 2024 15:20:22 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=d3AwxBu+VkFli34awimWaaFVvEWHaqxKTv0UwQ9CRyc=; b=tqeyL4qAQR7OhvjRw/yA9bfsYL
	N7xOcD+7T+hDGiHjgbYtqeGtHZOfnb7lkqTfhINRoXm8Ee/FCoElOSL9s5+c7xym/wAGYkkCCfTnf
	qnZh6UX/gAl/6P74rJ/m8SqAil023LUZcv7Cr265hYsCU/L9dwK5YaQOsXptA+e34hFEY+D4fsWNP
	I/TkliZmU6+cRQG+O7IAEegj9IsAiU1oLp5bK5FUQVjUzc+yLZkVwnddnikR9Tnjh2lQ+tABeLqD6
	BTy061IMVJym4Pxy6W2dcyfJp0bugTmVuat/LwZBLmMMQuWFCsrfBogivxrNR625W3HQo2OxmIK95
	Gt3RlwjA==;
Received: from 2a02-8389-2341-5b80-cdb4-8e7d-405d-6b77.cable.dynamic.v6.surfer.at ([2a02:8389:2341:5b80:cdb4:8e7d:405d:6b77] helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGtvT-00000007R7j-1fbd;
	Tue, 11 Jun 2024 05:20:07 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Subject: [PATCH 12/26] block: remove blk_flush_policy
Date: Tue, 11 Jun 2024 07:19:12 +0200
Message-ID: <20240611051929.513387-13-hch@lst.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240611051929.513387-1-hch@lst.de>
References: <20240611051929.513387-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
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
Cc: nvdimm@lists.linux.dev, "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, linux-nvme@lists.infradead.org, Song Liu <song@kernel.org>, linux-mtd@lists.infradead.org, Vineeth Vijayan <vneethv@linux.ibm.com>, Alasdair Kergon <agk@redhat.com>, drbd-dev@lists.linbit.com, linux-s390@vger.kernel.org, linux-scsi@vger.kernel.org, Richard Weinberger <richard@nod.at>, Geert Uytterhoeven <geert@linux-m68k.org>, Yu Kuai <yukuai3@huawei.com>, dm-devel@lists.linux.dev, linux-um@lists.infradead.org, Mike Snitzer <snitzer@kernel.org>, Josef Bacik <josef@toxicpanda.com>, nbd@other.debian.org, linux-raid@vger.kernel.org, linux-m68k@lists.linux-m68k.org, Mikulas Patocka <mpatocka@redhat.com>, xen-devel@lists.xenproject.org, ceph-devel@vger.kernel.org, Ming Lei <ming.lei@redhat.com>, linux-bcache@vger.kernel.org, linux-block@vger.kernel.org, "Martin K. Petersen" <martin.petersen@oracle.com>, linux-mmc@vger.kernel.org, Philipp Reisner <philipp.reisner@linbit.com>, =?UTF-8?q?Christoph=20B=C3=B6hmwalder?= <christoph.boehmwalder@linbit.com>, virtualization@lists.linux.dev, Lars Ellenberg <lars.ellenberg@linbit.com>, linuxppc-dev@lists.ozlabs.org, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Fold blk_flush_policy into the only caller to prepare for pending changes
to it.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 block/blk-flush.c | 33 +++++++++++++++------------------
 1 file changed, 15 insertions(+), 18 deletions(-)

diff --git a/block/blk-flush.c b/block/blk-flush.c
index c17cf8ed8113db..2234f8b3fc05f2 100644
--- a/block/blk-flush.c
+++ b/block/blk-flush.c
@@ -100,23 +100,6 @@ blk_get_flush_queue(struct request_queue *q, struct blk_mq_ctx *ctx)
 	return blk_mq_map_queue(q, REQ_OP_FLUSH, ctx)->fq;
 }
 
-static unsigned int blk_flush_policy(unsigned long fflags, struct request *rq)
-{
-	unsigned int policy = 0;
-
-	if (blk_rq_sectors(rq))
-		policy |= REQ_FSEQ_DATA;
-
-	if (fflags & (1UL << QUEUE_FLAG_WC)) {
-		if (rq->cmd_flags & REQ_PREFLUSH)
-			policy |= REQ_FSEQ_PREFLUSH;
-		if (!(fflags & (1UL << QUEUE_FLAG_FUA)) &&
-		    (rq->cmd_flags & REQ_FUA))
-			policy |= REQ_FSEQ_POSTFLUSH;
-	}
-	return policy;
-}
-
 static unsigned int blk_flush_cur_seq(struct request *rq)
 {
 	return 1 << ffz(rq->flush.seq);
@@ -399,12 +382,26 @@ bool blk_insert_flush(struct request *rq)
 {
 	struct request_queue *q = rq->q;
 	unsigned long fflags = q->queue_flags;	/* may change, cache */
-	unsigned int policy = blk_flush_policy(fflags, rq);
 	struct blk_flush_queue *fq = blk_get_flush_queue(q, rq->mq_ctx);
+	unsigned int policy = 0;
 
 	/* FLUSH/FUA request must never be merged */
 	WARN_ON_ONCE(rq->bio != rq->biotail);
 
+	if (blk_rq_sectors(rq))
+		policy |= REQ_FSEQ_DATA;
+
+	/*
+	 * Check which flushes we need to sequence for this operation.
+	 */
+	if (fflags & (1UL << QUEUE_FLAG_WC)) {
+		if (rq->cmd_flags & REQ_PREFLUSH)
+			policy |= REQ_FSEQ_PREFLUSH;
+		if (!(fflags & (1UL << QUEUE_FLAG_FUA)) &&
+		    (rq->cmd_flags & REQ_FUA))
+			policy |= REQ_FSEQ_POSTFLUSH;
+	}
+
 	/*
 	 * @policy now records what operations need to be done.  Adjust
 	 * REQ_PREFLUSH and FUA for the driver.
-- 
2.43.0

