Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 77F9790A3CC
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Jun 2024 08:06:41 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=H7sPQj5u;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W2fXZ1bn6z3cWN
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Jun 2024 16:06:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=bombadil.srs.infradead.org (client-ip=2607:7c80:54:3::133; helo=bombadil.infradead.org; envelope-from=batv+625ba2f6da96caf54eae+7603+infradead.org+hch@bombadil.srs.infradead.org; receiver=lists.ozlabs.org)
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W2fWg4WW1z30TF
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Jun 2024 16:05:50 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=qPBJslfqWjz6ccntprxT8r9b8bc2Nh8I2X0y5YXiLrY=; b=H7sPQj5uSpQ8xoiZtGJBid1xZu
	if6mAqA0Jfn3igEw6WdszQJfz5gH3lyZMnstvAzV3P6serQmkAQyiADHD9wWOOPOF9HP4DBW1GR2g
	jgbtirHJj+0wShDJc2fQyh1RCasnfNjxJOqpGUt9TfDBEEIsM7YbcF1ehsywJSRiXEtWqa5IAPivq
	Whnv97Fge0UeW/m//VhN8O0fP1mMPRjqdJRnrVxH4yr4HWBwZjknPZIFb7Mpe61CRsUHpOZfdP1no
	4LhjEos8Iy6NCRKQSI8NlGYeodCulXCzsT3f2+L1F9TfNW2bq7y/erGTZtNK0CymRxBgerAU8FCd5
	7vMi+W6Q==;
Received: from [91.187.204.140] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJ5Un-00000009IBT-13tu;
	Mon, 17 Jun 2024 06:05:37 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Subject: [PATCH 01/26] xen-blkfront: don't disable cache flushes when they fail
Date: Mon, 17 Jun 2024 08:04:28 +0200
Message-ID: <20240617060532.127975-2-hch@lst.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240617060532.127975-1-hch@lst.de>
References: <20240617060532.127975-1-hch@lst.de>
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

blkfront always had a robust negotiation protocol for detecting a write
cache.  Stop simply disabling cache flushes in the block layer as the
flags handling is moving to the atomic queue limits API that needs
user context to freeze the queue for that.  Instead handle the case
of the feature flags cleared inside of blkfront.  This removes old
debug code to check for such a mismatch which was previously impossible
to hit, including the check for passthrough requests that blkfront
never used to start with.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/block/xen-blkfront.c | 44 +++++++++++++++++++-----------------
 1 file changed, 23 insertions(+), 21 deletions(-)

diff --git a/drivers/block/xen-blkfront.c b/drivers/block/xen-blkfront.c
index 9b4ec3e4908cce..851b03844edd13 100644
--- a/drivers/block/xen-blkfront.c
+++ b/drivers/block/xen-blkfront.c
@@ -788,6 +788,11 @@ static int blkif_queue_rw_req(struct request *req, struct blkfront_ring_info *ri
 			 * A barrier request a superset of FUA, so we can
 			 * implement it the same way.  (It's also a FLUSH+FUA,
 			 * since it is guaranteed ordered WRT previous writes.)
+			 *
+			 * Note that can end up here with a FUA write and the
+			 * flags cleared.  This happens when the flag was
+			 * run-time disabled after a failing I/O, and we'll
+			 * simplify submit it as a normal write.
 			 */
 			if (info->feature_flush && info->feature_fua)
 				ring_req->operation =
@@ -795,8 +800,6 @@ static int blkif_queue_rw_req(struct request *req, struct blkfront_ring_info *ri
 			else if (info->feature_flush)
 				ring_req->operation =
 					BLKIF_OP_FLUSH_DISKCACHE;
-			else
-				ring_req->operation = 0;
 		}
 		ring_req->u.rw.nr_segments = num_grant;
 		if (unlikely(require_extra_req)) {
@@ -887,16 +890,6 @@ static inline void flush_requests(struct blkfront_ring_info *rinfo)
 		notify_remote_via_irq(rinfo->irq);
 }
 
-static inline bool blkif_request_flush_invalid(struct request *req,
-					       struct blkfront_info *info)
-{
-	return (blk_rq_is_passthrough(req) ||
-		((req_op(req) == REQ_OP_FLUSH) &&
-		 !info->feature_flush) ||
-		((req->cmd_flags & REQ_FUA) &&
-		 !info->feature_fua));
-}
-
 static blk_status_t blkif_queue_rq(struct blk_mq_hw_ctx *hctx,
 			  const struct blk_mq_queue_data *qd)
 {
@@ -908,12 +901,22 @@ static blk_status_t blkif_queue_rq(struct blk_mq_hw_ctx *hctx,
 	rinfo = get_rinfo(info, qid);
 	blk_mq_start_request(qd->rq);
 	spin_lock_irqsave(&rinfo->ring_lock, flags);
-	if (RING_FULL(&rinfo->ring))
-		goto out_busy;
 
-	if (blkif_request_flush_invalid(qd->rq, rinfo->dev_info))
-		goto out_err;
+	/*
+	 * Check if the backend actually supports flushes.
+	 *
+	 * While the block layer won't send us flushes if we don't claim to
+	 * support them, the Xen protocol allows the backend to revoke support
+	 * at any time.  That is of course a really bad idea and dangerous, but
+	 * has been allowed for 10+ years.  In that case we simply clear the
+	 * flags, and directly return here for an empty flush and ignore the
+	 * FUA flag later on.
+	 */
+	if (unlikely(req_op(qd->rq) == REQ_OP_FLUSH && !info->feature_flush))
+		goto complete;
 
+	if (RING_FULL(&rinfo->ring))
+		goto out_busy;
 	if (blkif_queue_request(qd->rq, rinfo))
 		goto out_busy;
 
@@ -921,14 +924,14 @@ static blk_status_t blkif_queue_rq(struct blk_mq_hw_ctx *hctx,
 	spin_unlock_irqrestore(&rinfo->ring_lock, flags);
 	return BLK_STS_OK;
 
-out_err:
-	spin_unlock_irqrestore(&rinfo->ring_lock, flags);
-	return BLK_STS_IOERR;
-
 out_busy:
 	blk_mq_stop_hw_queue(hctx);
 	spin_unlock_irqrestore(&rinfo->ring_lock, flags);
 	return BLK_STS_DEV_RESOURCE;
+complete:
+	spin_unlock_irqrestore(&rinfo->ring_lock, flags);
+	blk_mq_end_request(qd->rq, BLK_STS_OK);
+	return BLK_STS_OK;
 }
 
 static void blkif_complete_rq(struct request *rq)
@@ -1627,7 +1630,6 @@ static irqreturn_t blkif_interrupt(int irq, void *dev_id)
 					blkif_req(req)->error = BLK_STS_OK;
 				info->feature_fua = 0;
 				info->feature_flush = 0;
-				xlvbd_flush(info);
 			}
 			fallthrough;
 		case BLKIF_OP_READ:
-- 
2.43.0

