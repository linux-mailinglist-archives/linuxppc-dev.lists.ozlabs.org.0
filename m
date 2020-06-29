Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5839520DD02
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Jun 2020 22:54:27 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49wfqh57M3zDqdX
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jun 2020 06:54:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=casper.srs.infradead.org (client-ip=2001:8b0:10b:1236::1;
 helo=casper.infradead.org;
 envelope-from=batv+0d14f5278154a06d8b22+6154+infradead.org+hch@casper.srs.infradead.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=infradead.org header.i=@infradead.org
 header.a=rsa-sha256 header.s=casper.20170209 header.b=iqCpFcUP; 
 dkim-atps=neutral
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49wdBf6lhmzDqWX
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Jun 2020 05:40:42 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=k0UqCYguWovFmFEFba5t9PR/0pWK66pXhP3lJia2sr8=; b=iqCpFcUPe8uei0OvFPbjhSxNTT
 c1T6pmYkN8tfj+ZDdjMEXdvIQY7vFCt5slbgsQaKXdo4Kd1gyEg5KFiod7RzsTbOUDePryBejrS+b
 XXFEFR2tyS//dL6Q+58ug6ZB4kvQM0tpJCgXZE/b4COS7LM1KdTQtkcs47fw/V5vIcOdi8w3PIFn6
 izjNKAU43WkDRSoTNfw9en7oWoxgTehMQFpejfnf1wYGPTm70qVHrpZDu9/oE/tePQHfByzG2Fs7z
 mEAYLXz11QRgrumVZmGDa4vtwloca46yusBAa9FT9yxLk6mDaGC/rhZk+gxIjbtgIQ6ZlpbqB1mfC
 lQc4VBXQ==;
Received: from [2001:4bb8:184:76e3:fcca:c8dc:a4bf:12fa] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jpzdk-0004P4-3Q; Mon, 29 Jun 2020 19:40:28 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Subject: [PATCH 19/20] block: shortcut __submit_bio_noacct for blk-mq drivers
Date: Mon, 29 Jun 2020 21:39:46 +0200
Message-Id: <20200629193947.2705954-20-hch@lst.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200629193947.2705954-1-hch@lst.de>
References: <20200629193947.2705954-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
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
Cc: linux-bcache@vger.kernel.org, linux-xtensa@linux-xtensa.org,
 linux-nvdimm@lists.01.org, linux-s390@vger.kernel.org, dm-devel@redhat.com,
 linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-raid@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
 linuxppc-dev@lists.ozlabs.org, drbd-dev@lists.linbit.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

For blk-mq drivers bios can only be inserted for the same queue.  So
bypass the complicated sorting logic in __submit_bio_noacct with
a blk-mq simpler submission helper.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 block/blk-core.c | 50 +++++++++++++++++++++++++++++++++---------------
 1 file changed, 35 insertions(+), 15 deletions(-)

diff --git a/block/blk-core.c b/block/blk-core.c
index b82f48c86e6f7a..46e3c0a37cc377 100644
--- a/block/blk-core.c
+++ b/block/blk-core.c
@@ -1071,20 +1071,6 @@ static noinline_for_stack bool submit_bio_checks(struct bio *bio)
 	return false;
 }
 
-static blk_qc_t do_make_request(struct bio *bio)
-{
-	struct gendisk *disk = bio->bi_disk;
-	blk_qc_t ret = BLK_QC_T_NONE;
-
-	if (blk_crypto_bio_prep(&bio)) {
-		if (!disk->fops->submit_bio)
-			return blk_mq_submit_bio(bio);
-		ret = disk->fops->submit_bio(bio);
-	}
-	blk_queue_exit(disk->queue);
-	return ret;
-}
-
 /*
  * The loop in this function may be a bit non-obvious, and so deserves some
  * explanation:
@@ -1127,7 +1113,11 @@ static blk_qc_t __submit_bio_noacct(struct bio *bio)
 		bio_list_on_stack[1] = bio_list_on_stack[0];
 		bio_list_init(&bio_list_on_stack[0]);
 
-		ret = do_make_request(bio);
+		if (blk_crypto_bio_prep(&bio))
+			ret = bio->bi_disk->fops->submit_bio(bio);
+		else
+			ret = BLK_QC_T_NONE;
+		blk_queue_exit(q);
 
 		/*
 		 * Sort new bios into those for a lower level and those for the
@@ -1153,6 +1143,34 @@ static blk_qc_t __submit_bio_noacct(struct bio *bio)
 	return ret;
 }
 
+static blk_qc_t __submit_bio_noacct_mq(struct bio *bio)
+{
+	struct gendisk *disk = bio->bi_disk;
+	struct bio_list bio_list;
+	blk_qc_t ret = BLK_QC_T_NONE;
+
+	bio_list_init(&bio_list);
+	current->bio_list = &bio_list;
+
+	do {
+		WARN_ON_ONCE(bio->bi_disk != disk);
+
+		if (unlikely(bio_queue_enter(bio) != 0))
+			continue;
+
+		if (!blk_crypto_bio_prep(&bio)) {
+			blk_queue_exit(disk->queue);
+			ret = BLK_QC_T_NONE;
+			continue;
+		}
+
+		ret = blk_mq_submit_bio(bio);
+	} while ((bio = bio_list_pop(&bio_list)));
+
+	current->bio_list = NULL;
+	return ret;
+}
+
 /**
  * submit_bio_noacct - re-submit a bio to the block device layer for I/O
  * @bio:  The bio describing the location in memory and on the device.
@@ -1182,6 +1200,8 @@ blk_qc_t submit_bio_noacct(struct bio *bio)
 		return BLK_QC_T_NONE;
 	}
 
+	if (bio->bi_disk->queue->mq_ops)
+		return __submit_bio_noacct_mq(bio);
 	return __submit_bio_noacct(bio);
 }
 EXPORT_SYMBOL(submit_bio_noacct);
-- 
2.26.2

