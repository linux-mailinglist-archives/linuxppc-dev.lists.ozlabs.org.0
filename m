Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5969D20DCC6
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Jun 2020 22:27:40 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49wfDm0fflzDqQT
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jun 2020 06:27:36 +1000 (AEST)
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
 header.a=rsa-sha256 header.s=casper.20170209 header.b=WT1t+4dh; 
 dkim-atps=neutral
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49wdBK04s1zDqYS
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Jun 2020 05:40:25 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=exuZOIY7BgKMJeAI2DERnA03lWkRAwRLkb/k+JTCs1g=; b=WT1t+4dhbvQAYS7cMRH7K+z6X8
 8S9dlDCGGdy8t9i5FHEUtR45Tz1nNFZwrDxN9dAPbMMw4LS8QLkqmg2niU4THDxwB4usUnwcSjCw8
 sM5rBUcwvVvw9SsnLw6UnPUqaKyN0P7DUpNJrNpctp9ew2jZk3S0zdbY8BqxHS4dakna8FD9KYb7D
 4leMH/EfT+O01FpMgR/BGAvFFrEAeM1Od8ooNfJk/EshIMEiioBsh2BZVML/FhhorFfV3eKbhgxhW
 ozKJXQ+5OduCio4c17L96nOWUKQIuZivWI5qsokVJpt59FWD7OFQURE0Te8q+uEdnAc56GpB1yGDj
 lspZ0VHg==;
Received: from [2001:4bb8:184:76e3:fcca:c8dc:a4bf:12fa] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jpzdR-0004L1-PO; Mon, 29 Jun 2020 19:40:12 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Subject: [PATCH 12/20] block: remove the request_queue argument from
 blk_queue_split
Date: Mon, 29 Jun 2020 21:39:39 +0200
Message-Id: <20200629193947.2705954-13-hch@lst.de>
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

The queue can be trivially derived from the bio, so pass one less
argument.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 block/blk-merge.c             | 21 ++++++++++-----------
 block/blk-mq.c                |  2 +-
 block/blk.h                   |  3 +--
 drivers/block/drbd/drbd_req.c |  2 +-
 drivers/block/pktcdvd.c       |  2 +-
 drivers/block/ps3vram.c       |  2 +-
 drivers/block/rsxx/dev.c      |  2 +-
 drivers/block/umem.c          |  2 +-
 drivers/lightnvm/pblk-init.c  |  4 ++--
 drivers/md/dm.c               |  2 +-
 drivers/md/md.c               |  2 +-
 drivers/nvme/host/multipath.c |  9 ++++-----
 drivers/s390/block/dcssblk.c  |  2 +-
 drivers/s390/block/xpram.c    |  2 +-
 include/linux/blkdev.h        |  2 +-
 15 files changed, 28 insertions(+), 31 deletions(-)

diff --git a/block/blk-merge.c b/block/blk-merge.c
index 9c9fb21584b64e..20fa2290604105 100644
--- a/block/blk-merge.c
+++ b/block/blk-merge.c
@@ -283,20 +283,20 @@ static struct bio *blk_bio_segment_split(struct request_queue *q,
 
 /**
  * __blk_queue_split - split a bio and submit the second half
- * @q:       [in] request queue pointer
  * @bio:     [in, out] bio to be split
  * @nr_segs: [out] number of segments in the first bio
  *
  * Split a bio into two bios, chain the two bios, submit the second half and
  * store a pointer to the first half in *@bio. If the second bio is still too
  * big it will be split by a recursive call to this function. Since this
- * function may allocate a new bio from @q->bio_split, it is the responsibility
- * of the caller to ensure that @q is only released after processing of the
+ * function may allocate a new bio from @bio->bi_disk->queue->bio_split, it is
+ * the responsibility of the caller to ensure that
+ * @bio->bi_disk->queue->bio_split is only released after processing of the
  * split bio has finished.
  */
-void __blk_queue_split(struct request_queue *q, struct bio **bio,
-		unsigned int *nr_segs)
+void __blk_queue_split(struct bio **bio, unsigned int *nr_segs)
 {
+	struct request_queue *q = (*bio)->bi_disk->queue;
 	struct bio *split = NULL;
 
 	switch (bio_op(*bio)) {
@@ -345,20 +345,19 @@ void __blk_queue_split(struct request_queue *q, struct bio **bio,
 
 /**
  * blk_queue_split - split a bio and submit the second half
- * @q:   [in] request queue pointer
  * @bio: [in, out] bio to be split
  *
  * Split a bio into two bios, chains the two bios, submit the second half and
  * store a pointer to the first half in *@bio. Since this function may allocate
- * a new bio from @q->bio_split, it is the responsibility of the caller to
- * ensure that @q is only released after processing of the split bio has
- * finished.
+ * a new bio from @bio->bi_disk->queue->bio_split, it is the responsibility of
+ * the caller to ensure that @bio->bi_disk->queue->bio_split is only released
+ * after processing of the split bio has finished.
  */
-void blk_queue_split(struct request_queue *q, struct bio **bio)
+void blk_queue_split(struct bio **bio)
 {
 	unsigned int nr_segs;
 
-	__blk_queue_split(q, bio, &nr_segs);
+	__blk_queue_split(bio, &nr_segs);
 }
 EXPORT_SYMBOL(blk_queue_split);
 
diff --git a/block/blk-mq.c b/block/blk-mq.c
index 72d3034fe39d87..40b8d8ba894d5e 100644
--- a/block/blk-mq.c
+++ b/block/blk-mq.c
@@ -2086,7 +2086,7 @@ blk_qc_t blk_mq_make_request(struct request_queue *q, struct bio *bio)
 	blk_status_t ret;
 
 	blk_queue_bounce(q, &bio);
-	__blk_queue_split(q, &bio, &nr_segs);
+	__blk_queue_split(&bio, &nr_segs);
 
 	if (!bio_integrity_prep(bio))
 		goto queue_exit;
diff --git a/block/blk.h b/block/blk.h
index 41a50880c94e98..90416cdc40a36a 100644
--- a/block/blk.h
+++ b/block/blk.h
@@ -225,8 +225,7 @@ ssize_t part_timeout_show(struct device *, struct device_attribute *, char *);
 ssize_t part_timeout_store(struct device *, struct device_attribute *,
 				const char *, size_t);
 
-void __blk_queue_split(struct request_queue *q, struct bio **bio,
-		unsigned int *nr_segs);
+void __blk_queue_split(struct bio **bio, unsigned int *nr_segs);
 int ll_back_merge_fn(struct request *req, struct bio *bio,
 		unsigned int nr_segs);
 int ll_front_merge_fn(struct request *req,  struct bio *bio,
diff --git a/drivers/block/drbd/drbd_req.c b/drivers/block/drbd/drbd_req.c
index 3f09b2ab977822..9368680474223a 100644
--- a/drivers/block/drbd/drbd_req.c
+++ b/drivers/block/drbd/drbd_req.c
@@ -1598,7 +1598,7 @@ blk_qc_t drbd_make_request(struct request_queue *q, struct bio *bio)
 	struct drbd_device *device = bio->bi_disk->private_data;
 	unsigned long start_jif;
 
-	blk_queue_split(q, &bio);
+	blk_queue_split(&bio);
 
 	start_jif = jiffies;
 
diff --git a/drivers/block/pktcdvd.c b/drivers/block/pktcdvd.c
index 27a33adc41e487..29b0c62dc86c1f 100644
--- a/drivers/block/pktcdvd.c
+++ b/drivers/block/pktcdvd.c
@@ -2434,7 +2434,7 @@ static blk_qc_t pkt_make_request(struct request_queue *q, struct bio *bio)
 	char b[BDEVNAME_SIZE];
 	struct bio *split;
 
-	blk_queue_split(q, &bio);
+	blk_queue_split(&bio);
 
 	pd = q->queuedata;
 	if (!pd) {
diff --git a/drivers/block/ps3vram.c b/drivers/block/ps3vram.c
index 5a1d1d137c7248..76cc584aa76346 100644
--- a/drivers/block/ps3vram.c
+++ b/drivers/block/ps3vram.c
@@ -593,7 +593,7 @@ static blk_qc_t ps3vram_make_request(struct request_queue *q, struct bio *bio)
 
 	dev_dbg(&dev->core, "%s\n", __func__);
 
-	blk_queue_split(q, &bio);
+	blk_queue_split(&bio);
 
 	spin_lock_irq(&priv->lock);
 	busy = !bio_list_empty(&priv->list);
diff --git a/drivers/block/rsxx/dev.c b/drivers/block/rsxx/dev.c
index 6a4d8d26e32cbd..1d52bc73dd0f82 100644
--- a/drivers/block/rsxx/dev.c
+++ b/drivers/block/rsxx/dev.c
@@ -123,7 +123,7 @@ static blk_qc_t rsxx_make_request(struct request_queue *q, struct bio *bio)
 	struct rsxx_bio_meta *bio_meta;
 	blk_status_t st = BLK_STS_IOERR;
 
-	blk_queue_split(q, &bio);
+	blk_queue_split(&bio);
 
 	might_sleep();
 
diff --git a/drivers/block/umem.c b/drivers/block/umem.c
index 5498f1cf36b3fe..3b89c07f9e9d6e 100644
--- a/drivers/block/umem.c
+++ b/drivers/block/umem.c
@@ -527,7 +527,7 @@ static blk_qc_t mm_make_request(struct request_queue *q, struct bio *bio)
 		 (unsigned long long)bio->bi_iter.bi_sector,
 		 bio->bi_iter.bi_size);
 
-	blk_queue_split(q, &bio);
+	blk_queue_split(&bio);
 
 	spin_lock_irq(&card->lock);
 	*card->biotail = bio;
diff --git a/drivers/lightnvm/pblk-init.c b/drivers/lightnvm/pblk-init.c
index 6e677ff62cc969..7a4a1b7a941d2c 100644
--- a/drivers/lightnvm/pblk-init.c
+++ b/drivers/lightnvm/pblk-init.c
@@ -63,7 +63,7 @@ static blk_qc_t pblk_make_rq(struct request_queue *q, struct bio *bio)
 	 * constraint. Writes can be of arbitrary size.
 	 */
 	if (bio_data_dir(bio) == READ) {
-		blk_queue_split(q, &bio);
+		blk_queue_split(&bio);
 		pblk_submit_read(pblk, bio);
 	} else {
 		/* Prevent deadlock in the case of a modest LUN configuration
@@ -71,7 +71,7 @@ static blk_qc_t pblk_make_rq(struct request_queue *q, struct bio *bio)
 		 * leaves at least 256KB available for user I/O.
 		 */
 		if (pblk_get_secs(bio) > pblk_rl_max_io(&pblk->rl))
-			blk_queue_split(q, &bio);
+			blk_queue_split(&bio);
 
 		pblk_write_to_cache(pblk, bio, PBLK_IOTYPE_USER);
 	}
diff --git a/drivers/md/dm.c b/drivers/md/dm.c
index c8d91f271c272e..5aa7a604f4cbc5 100644
--- a/drivers/md/dm.c
+++ b/drivers/md/dm.c
@@ -1776,7 +1776,7 @@ static blk_qc_t dm_process_bio(struct mapped_device *md,
 	 */
 	if (current->bio_list) {
 		if (is_abnormal_io(bio))
-			blk_queue_split(md->queue, &bio);
+			blk_queue_split(&bio);
 		else
 			dm_queue_split(md, ti, &bio);
 	}
diff --git a/drivers/md/md.c b/drivers/md/md.c
index f567f536b529bd..ff20868e5e1b98 100644
--- a/drivers/md/md.c
+++ b/drivers/md/md.c
@@ -475,7 +475,7 @@ static blk_qc_t md_make_request(struct request_queue *q, struct bio *bio)
 		return BLK_QC_T_NONE;
 	}
 
-	blk_queue_split(q, &bio);
+	blk_queue_split(&bio);
 
 	if (mddev == NULL || mddev->pers == NULL) {
 		bio_io_error(bio);
diff --git a/drivers/nvme/host/multipath.c b/drivers/nvme/host/multipath.c
index da78e499947a9f..5a5205ea570a77 100644
--- a/drivers/nvme/host/multipath.c
+++ b/drivers/nvme/host/multipath.c
@@ -301,12 +301,11 @@ static blk_qc_t nvme_ns_head_make_request(struct request_queue *q,
 	int srcu_idx;
 
 	/*
-	 * The namespace might be going away and the bio might
-	 * be moved to a different queue via blk_steal_bios(),
-	 * so we need to use the bio_split pool from the original
-	 * queue to allocate the bvecs from.
+	 * The namespace might be going away and the bio might be moved to a
+	 * different queue via blk_steal_bios(), so we need to use the bio_split
+	 * pool from the original queue to allocate the bvecs from.
 	 */
-	blk_queue_split(q, &bio);
+	blk_queue_split(&bio);
 
 	srcu_idx = srcu_read_lock(&head->srcu);
 	ns = nvme_find_path(head);
diff --git a/drivers/s390/block/dcssblk.c b/drivers/s390/block/dcssblk.c
index 384edffe5cb4ae..dfe21eb7276021 100644
--- a/drivers/s390/block/dcssblk.c
+++ b/drivers/s390/block/dcssblk.c
@@ -878,7 +878,7 @@ dcssblk_make_request(struct request_queue *q, struct bio *bio)
 	unsigned long source_addr;
 	unsigned long bytes_done;
 
-	blk_queue_split(q, &bio);
+	blk_queue_split(&bio);
 
 	bytes_done = 0;
 	dev_info = bio->bi_disk->private_data;
diff --git a/drivers/s390/block/xpram.c b/drivers/s390/block/xpram.c
index 45a04daec89ed9..5456f0ad5a40a4 100644
--- a/drivers/s390/block/xpram.c
+++ b/drivers/s390/block/xpram.c
@@ -191,7 +191,7 @@ static blk_qc_t xpram_make_request(struct request_queue *q, struct bio *bio)
 	unsigned long page_addr;
 	unsigned long bytes;
 
-	blk_queue_split(q, &bio);
+	blk_queue_split(&bio);
 
 	if ((bio->bi_iter.bi_sector & 7) != 0 ||
 	    (bio->bi_iter.bi_size & 4095) != 0)
diff --git a/include/linux/blkdev.h b/include/linux/blkdev.h
index 15497782c17656..d002defc178934 100644
--- a/include/linux/blkdev.h
+++ b/include/linux/blkdev.h
@@ -871,7 +871,7 @@ extern void blk_rq_unprep_clone(struct request *rq);
 extern blk_status_t blk_insert_cloned_request(struct request_queue *q,
 				     struct request *rq);
 extern int blk_rq_append_bio(struct request *rq, struct bio **bio);
-extern void blk_queue_split(struct request_queue *, struct bio **);
+extern void blk_queue_split(struct bio **);
 extern int scsi_verify_blk_ioctl(struct block_device *, unsigned int);
 extern int scsi_cmd_blk_ioctl(struct block_device *, fmode_t,
 			      unsigned int, void __user *);
-- 
2.26.2

