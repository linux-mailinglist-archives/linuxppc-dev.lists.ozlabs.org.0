Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EA03620DCD6
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Jun 2020 22:41:33 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49wfXk6sjmzDqd9
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jun 2020 06:41:26 +1000 (AEST)
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
 header.a=rsa-sha256 header.s=casper.20170209 header.b=GYoYDcTp; 
 dkim-atps=neutral
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49wdBT3vCDzDqZF
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Jun 2020 05:40:33 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=jPkynyHJB4Xeb2sT4JdZH3MzupflFkjKln7EF6szAEk=; b=GYoYDcTpvGzoYgA/ga7kPY7krx
 fgzh14ODFDmDKaQ2JwhSbMmAqDAUd1hODQKcYf6SdcwSMxB0o9f+RXcJzkcnwLxb91qCUOTH1/G3L
 0cBSKFnrL/TOwe9ARHDTWTb9cRQjBUYf7DParYFI0qj4wdKdPr8qmIabPAsbgLH1WCUp090Ylf3F6
 z2FGNlAh7AKmymgC2WtW0LtSTffqCifnJam4mdc9gu7osfhF/R1gho5lxt3NoK9URpaCEFmsPLhJh
 wiemYXGuEmz08b4W6F1crlM3PFHIA2DY5g5/Wq8meLeayDff5bqS7N9CLn4PVOtYJt9CTBgFcBkC4
 6Ro4XzYQ==;
Received: from [2001:4bb8:184:76e3:fcca:c8dc:a4bf:12fa] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jpzda-0004Mt-Hn; Mon, 29 Jun 2020 19:40:22 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Subject: [PATCH 16/20] block: move ->make_request_fn to struct
 block_device_operations
Date: Mon, 29 Jun 2020 21:39:43 +0200
Message-Id: <20200629193947.2705954-17-hch@lst.de>
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

The make_request_fn is a little weird in that it sits directly in
struct request_queue instead of an operation vector.  Replace it with
a block_device_operations method called submit_bio (which describes much
better what it does).  Also remove the request_queue argument to it, as
the queue can be derived pretty trivially from the bio.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 Documentation/block/biodoc.rst                |  2 +-
 .../block/writeback_cache_control.rst         |  2 +-
 arch/m68k/emu/nfblock.c                       |  5 +-
 arch/xtensa/platforms/iss/simdisk.c           |  5 +-
 block/blk-cgroup.c                            |  2 +-
 block/blk-core.c                              | 53 +++++++------------
 block/blk-mq.c                                | 10 ++--
 block/blk.h                                   |  2 -
 drivers/block/brd.c                           |  5 +-
 drivers/block/drbd/drbd_int.h                 |  2 +-
 drivers/block/drbd/drbd_main.c                |  9 ++--
 drivers/block/drbd/drbd_req.c                 |  2 +-
 drivers/block/null_blk_main.c                 | 17 ++++--
 drivers/block/pktcdvd.c                       | 11 ++--
 drivers/block/ps3vram.c                       | 15 +++---
 drivers/block/rsxx/dev.c                      |  7 ++-
 drivers/block/umem.c                          |  5 +-
 drivers/block/zram/zram_drv.c                 | 11 ++--
 drivers/lightnvm/core.c                       |  8 +--
 drivers/lightnvm/pblk-init.c                  | 12 +++--
 drivers/md/bcache/request.c                   |  4 +-
 drivers/md/bcache/request.h                   |  4 +-
 drivers/md/bcache/super.c                     | 23 +++++---
 drivers/md/dm.c                               | 23 ++++----
 drivers/md/md.c                               |  5 +-
 drivers/nvdimm/blk.c                          |  5 +-
 drivers/nvdimm/btt.c                          |  5 +-
 drivers/nvdimm/pmem.c                         |  5 +-
 drivers/nvme/host/core.c                      |  1 +
 drivers/nvme/host/multipath.c                 |  5 +-
 drivers/nvme/host/nvme.h                      |  1 +
 drivers/s390/block/dcssblk.c                  |  9 ++--
 drivers/s390/block/xpram.c                    |  6 +--
 include/linux/blk-mq.h                        |  2 +-
 include/linux/blkdev.h                        |  7 +--
 include/linux/lightnvm.h                      |  3 +-
 36 files changed, 153 insertions(+), 140 deletions(-)

diff --git a/Documentation/block/biodoc.rst b/Documentation/block/biodoc.rst
index b964796ec9c780..267384159bf793 100644
--- a/Documentation/block/biodoc.rst
+++ b/Documentation/block/biodoc.rst
@@ -1036,7 +1036,7 @@ Now the generic block layer performs partition-remapping early and thus
 provides drivers with a sector number relative to whole device, rather than
 having to take partition number into account in order to arrive at the true
 sector number. The routine blk_partition_remap() is invoked by
-generic_make_request even before invoking the queue specific make_request_fn,
+generic_make_request even before invoking the queue specific ->submit_bio,
 so the i/o scheduler also gets to operate on whole disk sector numbers. This
 should typically not require changes to block drivers, it just never gets
 to invoke its own partition sector offset calculations since all bios
diff --git a/Documentation/block/writeback_cache_control.rst b/Documentation/block/writeback_cache_control.rst
index 2c752c57c14c62..b208488d0aae85 100644
--- a/Documentation/block/writeback_cache_control.rst
+++ b/Documentation/block/writeback_cache_control.rst
@@ -47,7 +47,7 @@ the Forced Unit Access is implemented.  The REQ_PREFLUSH and REQ_FUA flags
 may both be set on a single bio.
 
 
-Implementation details for make_request_fn based block drivers
+Implementation details for bio based block drivers
 --------------------------------------------------------------
 
 These drivers will always see the REQ_PREFLUSH and REQ_FUA bits as they sit
diff --git a/arch/m68k/emu/nfblock.c b/arch/m68k/emu/nfblock.c
index 87e8b1700acd28..92d26c81244134 100644
--- a/arch/m68k/emu/nfblock.c
+++ b/arch/m68k/emu/nfblock.c
@@ -59,7 +59,7 @@ struct nfhd_device {
 	struct gendisk *disk;
 };
 
-static blk_qc_t nfhd_make_request(struct request_queue *queue, struct bio *bio)
+static blk_qc_t nfhd_submit_bio(struct bio *bio)
 {
 	struct nfhd_device *dev = bio->bi_disk->private_data;
 	struct bio_vec bvec;
@@ -93,6 +93,7 @@ static int nfhd_getgeo(struct block_device *bdev, struct hd_geometry *geo)
 
 static const struct block_device_operations nfhd_ops = {
 	.owner	= THIS_MODULE,
+	.submit_bio = nfhd_submit_bio,
 	.getgeo	= nfhd_getgeo,
 };
 
@@ -118,7 +119,7 @@ static int __init nfhd_init_one(int id, u32 blocks, u32 bsize)
 	dev->bsize = bsize;
 	dev->bshift = ffs(bsize) - 10;
 
-	dev->queue = blk_alloc_queue(nfhd_make_request, NUMA_NO_NODE);
+	dev->queue = blk_alloc_queue(NUMA_NO_NODE);
 	if (dev->queue == NULL)
 		goto free_dev;
 
diff --git a/arch/xtensa/platforms/iss/simdisk.c b/arch/xtensa/platforms/iss/simdisk.c
index 31b5020077a059..5107140dbb7edc 100644
--- a/arch/xtensa/platforms/iss/simdisk.c
+++ b/arch/xtensa/platforms/iss/simdisk.c
@@ -101,7 +101,7 @@ static void simdisk_transfer(struct simdisk *dev, unsigned long sector,
 	spin_unlock(&dev->lock);
 }
 
-static blk_qc_t simdisk_make_request(struct request_queue *q, struct bio *bio)
+static blk_qc_t simdisk_submit_bio(struct bio *bio)
 {
 	struct simdisk *dev = bio->bi_disk->private_data;
 	struct bio_vec bvec;
@@ -144,6 +144,7 @@ static void simdisk_release(struct gendisk *disk, fmode_t mode)
 
 static const struct block_device_operations simdisk_ops = {
 	.owner		= THIS_MODULE,
+	.submit_bio	= simdisk_submit_bio,
 	.open		= simdisk_open,
 	.release	= simdisk_release,
 };
@@ -267,7 +268,7 @@ static int __init simdisk_setup(struct simdisk *dev, int which,
 	spin_lock_init(&dev->lock);
 	dev->users = 0;
 
-	dev->queue = blk_alloc_queue(simdisk_make_request, NUMA_NO_NODE);
+	dev->queue = blk_alloc_queue(NUMA_NO_NODE);
 	if (dev->queue == NULL) {
 		pr_err("blk_alloc_queue failed\n");
 		goto out_alloc_queue;
diff --git a/block/blk-cgroup.c b/block/blk-cgroup.c
index 1ce94afc03bcfd..bc1df69e371c21 100644
--- a/block/blk-cgroup.c
+++ b/block/blk-cgroup.c
@@ -1012,7 +1012,7 @@ static int blkcg_css_online(struct cgroup_subsys_state *css)
  * blkcg_init_queue - initialize blkcg part of request queue
  * @q: request_queue to initialize
  *
- * Called from __blk_alloc_queue(). Responsible for initializing blkcg
+ * Called from blk_alloc_queue(). Responsible for initializing blkcg
  * part of new request_queue @q.
  *
  * RETURNS:
diff --git a/block/blk-core.c b/block/blk-core.c
index 28f60985dc75cc..cb07a726dd7117 100644
--- a/block/blk-core.c
+++ b/block/blk-core.c
@@ -283,7 +283,7 @@ EXPORT_SYMBOL(blk_dump_rq_flags);
  *     A block device may call blk_sync_queue to ensure that any
  *     such activity is cancelled, thus allowing it to release resources
  *     that the callbacks might use. The caller must already have made sure
- *     that its ->make_request_fn will not re-add plugging prior to calling
+ *     that its ->submit_bio will not re-add plugging prior to calling
  *     this function.
  *
  *     This function does not cancel any asynchronous activity arising
@@ -510,7 +510,7 @@ static void blk_timeout_work(struct work_struct *work)
 {
 }
 
-struct request_queue *__blk_alloc_queue(int node_id)
+struct request_queue *blk_alloc_queue(int node_id)
 {
 	struct request_queue *q;
 	int ret;
@@ -575,6 +575,7 @@ struct request_queue *__blk_alloc_queue(int node_id)
 
 	blk_queue_dma_alignment(q, 511);
 	blk_set_default_limits(&q->limits);
+	q->nr_requests = BLKDEV_MAX_RQ;
 
 	return q;
 
@@ -592,21 +593,6 @@ struct request_queue *__blk_alloc_queue(int node_id)
 	kmem_cache_free(blk_requestq_cachep, q);
 	return NULL;
 }
-
-struct request_queue *blk_alloc_queue(make_request_fn make_request, int node_id)
-{
-	struct request_queue *q;
-
-	if (WARN_ON_ONCE(!make_request))
-		return NULL;
-
-	q = __blk_alloc_queue(node_id);
-	if (!q)
-		return NULL;
-	q->make_request_fn = make_request;
-	q->nr_requests = BLKDEV_MAX_RQ;
-	return q;
-}
 EXPORT_SYMBOL(blk_alloc_queue);
 
 /**
@@ -1088,15 +1074,15 @@ generic_make_request_checks(struct bio *bio)
 
 static blk_qc_t do_make_request(struct bio *bio)
 {
-	struct request_queue *q = bio->bi_disk->queue;
+	struct gendisk *disk = bio->bi_disk;
 	blk_qc_t ret = BLK_QC_T_NONE;
 
 	if (blk_crypto_bio_prep(&bio)) {
-		if (!q->make_request_fn)
-			return blk_mq_make_request(q, bio);
-		ret = q->make_request_fn(q, bio);
+		if (!disk->fops->submit_bio)
+			return blk_mq_submit_bio(bio);
+		ret = disk->fops->submit_bio(bio);
 	}
-	blk_queue_exit(q);
+	blk_queue_exit(disk->queue);
 	return ret;
 }
 
@@ -1113,10 +1099,9 @@ blk_qc_t generic_make_request(struct bio *bio)
 {
 	/*
 	 * bio_list_on_stack[0] contains bios submitted by the current
-	 * make_request_fn.
-	 * bio_list_on_stack[1] contains bios that were submitted before
-	 * the current make_request_fn, but that haven't been processed
-	 * yet.
+	 * ->submit_bio.
+	 * bio_list_on_stack[1] contains bios that were submitted before the
+	 * current ->submit_bio_bio, but that haven't been processed yet.
 	 */
 	struct bio_list bio_list_on_stack[2];
 	blk_qc_t ret = BLK_QC_T_NONE;
@@ -1125,10 +1110,10 @@ blk_qc_t generic_make_request(struct bio *bio)
 		goto out;
 
 	/*
-	 * We only want one ->make_request_fn to be active at a time, else
+	 * We only want one ->submit_bio to be active at a time, else
 	 * stack usage with stacked devices could be a problem.  So use
 	 * current->bio_list to keep a list of requests submited by a
-	 * make_request_fn function.  current->bio_list is also used as a
+	 * ->submit_bio method.  current->bio_list is also used as a
 	 * flag to say if generic_make_request is currently active in this
 	 * task or not.  If it is NULL, then no make_request is active.  If
 	 * it is non-NULL, then a make_request is active, and new requests
@@ -1146,12 +1131,12 @@ blk_qc_t generic_make_request(struct bio *bio)
 	 * We pretend that we have just taken it off a longer list, so
 	 * we assign bio_list to a pointer to the bio_list_on_stack,
 	 * thus initialising the bio_list of new bios to be
-	 * added.  ->make_request() may indeed add some more bios
+	 * added.  ->submit_bio() may indeed add some more bios
 	 * through a recursive call to generic_make_request.  If it
 	 * did, we find a non-NULL value in bio_list and re-enter the loop
 	 * from the top.  In this case we really did just take the bio
 	 * of the top of the list (no pretending) and so remove it from
-	 * bio_list, and call into ->make_request() again.
+	 * bio_list, and call into ->submit_bio() again.
 	 */
 	BUG_ON(bio->bi_next);
 	bio_list_init(&bio_list_on_stack[0]);
@@ -1201,9 +1186,9 @@ EXPORT_SYMBOL(generic_make_request);
  */
 blk_qc_t direct_make_request(struct bio *bio)
 {
-	struct request_queue *q = bio->bi_disk->queue;
+	struct gendisk *disk = bio->bi_disk;
 
-	if (WARN_ON_ONCE(q->make_request_fn)) {
+	if (WARN_ON_ONCE(!disk->queue->mq_ops)) {
 		bio_io_error(bio);
 		return BLK_QC_T_NONE;
 	}
@@ -1212,10 +1197,10 @@ blk_qc_t direct_make_request(struct bio *bio)
 	if (unlikely(bio_queue_enter(bio)))
 		return BLK_QC_T_NONE;
 	if (!blk_crypto_bio_prep(&bio)) {
-		blk_queue_exit(q);
+		blk_queue_exit(disk->queue);
 		return BLK_QC_T_NONE;
 	}
-	return blk_mq_make_request(q, bio);
+	return blk_mq_submit_bio(bio);
 }
 EXPORT_SYMBOL_GPL(direct_make_request);
 
diff --git a/block/blk-mq.c b/block/blk-mq.c
index 40b8d8ba894d5e..bb025c1384e9eb 100644
--- a/block/blk-mq.c
+++ b/block/blk-mq.c
@@ -2056,8 +2056,7 @@ static void blk_add_rq_to_plug(struct blk_plug *plug, struct request *rq)
 }
 
 /**
- * blk_mq_make_request - Create and send a request to block device.
- * @q: Request queue pointer.
+ * blk_mq_submit_bio - Create and send a request to block device.
  * @bio: Bio pointer.
  *
  * Builds up a request structure from @q and @bio and send to the device. The
@@ -2071,8 +2070,9 @@ static void blk_add_rq_to_plug(struct blk_plug *plug, struct request *rq)
  *
  * Returns: Request queue cookie.
  */
-blk_qc_t blk_mq_make_request(struct request_queue *q, struct bio *bio)
+blk_qc_t blk_mq_submit_bio(struct bio *bio)
 {
+	struct request_queue *q = bio->bi_disk->queue;
 	const int is_sync = op_is_sync(bio->bi_opf);
 	const int is_flush_fua = op_is_flush(bio->bi_opf);
 	struct blk_mq_alloc_data data = {
@@ -2197,7 +2197,7 @@ blk_qc_t blk_mq_make_request(struct request_queue *q, struct bio *bio)
 	blk_queue_exit(q);
 	return BLK_QC_T_NONE;
 }
-EXPORT_SYMBOL_GPL(blk_mq_make_request); /* only for request based dm */
+EXPORT_SYMBOL_GPL(blk_mq_submit_bio); /* only for request based dm */
 
 void blk_mq_free_rqs(struct blk_mq_tag_set *set, struct blk_mq_tags *tags,
 		     unsigned int hctx_idx)
@@ -2937,7 +2937,7 @@ struct request_queue *blk_mq_init_queue_data(struct blk_mq_tag_set *set,
 {
 	struct request_queue *uninit_q, *q;
 
-	uninit_q = __blk_alloc_queue(set->numa_node);
+	uninit_q = blk_alloc_queue(set->numa_node);
 	if (!uninit_q)
 		return ERR_PTR(-ENOMEM);
 	uninit_q->queuedata = queuedata;
diff --git a/block/blk.h b/block/blk.h
index 90416cdc40a36a..94f7c084f68fc4 100644
--- a/block/blk.h
+++ b/block/blk.h
@@ -424,8 +424,6 @@ static inline void part_nr_sects_write(struct hd_struct *part, sector_t size)
 #endif
 }
 
-struct request_queue *__blk_alloc_queue(int node_id);
-
 int bio_add_hw_page(struct request_queue *q, struct bio *bio,
 		struct page *page, unsigned int len, unsigned int offset,
 		unsigned int max_sectors, bool *same_page);
diff --git a/drivers/block/brd.c b/drivers/block/brd.c
index 2fb25c348d531b..2723a70eb85593 100644
--- a/drivers/block/brd.c
+++ b/drivers/block/brd.c
@@ -282,7 +282,7 @@ static int brd_do_bvec(struct brd_device *brd, struct page *page,
 	return err;
 }
 
-static blk_qc_t brd_make_request(struct request_queue *q, struct bio *bio)
+static blk_qc_t brd_submit_bio(struct bio *bio)
 {
 	struct brd_device *brd = bio->bi_disk->private_data;
 	struct bio_vec bvec;
@@ -330,6 +330,7 @@ static int brd_rw_page(struct block_device *bdev, sector_t sector,
 
 static const struct block_device_operations brd_fops = {
 	.owner =		THIS_MODULE,
+	.submit_bio =		brd_submit_bio,
 	.rw_page =		brd_rw_page,
 };
 
@@ -381,7 +382,7 @@ static struct brd_device *brd_alloc(int i)
 	spin_lock_init(&brd->brd_lock);
 	INIT_RADIX_TREE(&brd->brd_pages, GFP_ATOMIC);
 
-	brd->brd_queue = blk_alloc_queue(brd_make_request, NUMA_NO_NODE);
+	brd->brd_queue = blk_alloc_queue(NUMA_NO_NODE);
 	if (!brd->brd_queue)
 		goto out_free_dev;
 
diff --git a/drivers/block/drbd/drbd_int.h b/drivers/block/drbd/drbd_int.h
index 33d0831c99b613..0327408da79c7a 100644
--- a/drivers/block/drbd/drbd_int.h
+++ b/drivers/block/drbd/drbd_int.h
@@ -1451,7 +1451,7 @@ extern void conn_free_crypto(struct drbd_connection *connection);
 /* drbd_req */
 extern void do_submit(struct work_struct *ws);
 extern void __drbd_make_request(struct drbd_device *, struct bio *, unsigned long);
-extern blk_qc_t drbd_make_request(struct request_queue *q, struct bio *bio);
+extern blk_qc_t drbd_submit_bio(struct bio *bio);
 extern int drbd_read_remote(struct drbd_device *device, struct drbd_request *req);
 extern int is_valid_ar_handle(struct drbd_request *, sector_t);
 
diff --git a/drivers/block/drbd/drbd_main.c b/drivers/block/drbd/drbd_main.c
index 26f4e0aa7393b4..2b05de0896e282 100644
--- a/drivers/block/drbd/drbd_main.c
+++ b/drivers/block/drbd/drbd_main.c
@@ -132,9 +132,10 @@ wait_queue_head_t drbd_pp_wait;
 DEFINE_RATELIMIT_STATE(drbd_ratelimit_state, 5 * HZ, 5);
 
 static const struct block_device_operations drbd_ops = {
-	.owner =   THIS_MODULE,
-	.open =    drbd_open,
-	.release = drbd_release,
+	.owner		= THIS_MODULE,
+	.submit_bio	= drbd_submit_bio,
+	.open		= drbd_open,
+	.release	= drbd_release,
 };
 
 struct bio *bio_alloc_drbd(gfp_t gfp_mask)
@@ -2801,7 +2802,7 @@ enum drbd_ret_code drbd_create_device(struct drbd_config_context *adm_ctx, unsig
 
 	drbd_init_set_defaults(device);
 
-	q = blk_alloc_queue(drbd_make_request, NUMA_NO_NODE);
+	q = blk_alloc_queue(NUMA_NO_NODE);
 	if (!q)
 		goto out_no_q;
 	device->rq_queue = q;
diff --git a/drivers/block/drbd/drbd_req.c b/drivers/block/drbd/drbd_req.c
index 9368680474223a..c7e14c9a6e5f83 100644
--- a/drivers/block/drbd/drbd_req.c
+++ b/drivers/block/drbd/drbd_req.c
@@ -1593,7 +1593,7 @@ void do_submit(struct work_struct *ws)
 	}
 }
 
-blk_qc_t drbd_make_request(struct request_queue *q, struct bio *bio)
+blk_qc_t drbd_submit_bio(struct bio *bio)
 {
 	struct drbd_device *device = bio->bi_disk->private_data;
 	unsigned long start_jif;
diff --git a/drivers/block/null_blk_main.c b/drivers/block/null_blk_main.c
index 93ce0a00b2ae01..907c6858aec0c3 100644
--- a/drivers/block/null_blk_main.c
+++ b/drivers/block/null_blk_main.c
@@ -1388,7 +1388,7 @@ static struct nullb_queue *nullb_to_queue(struct nullb *nullb)
 	return &nullb->queues[index];
 }
 
-static blk_qc_t null_queue_bio(struct request_queue *q, struct bio *bio)
+static blk_qc_t null_submit_bio(struct bio *bio)
 {
 	sector_t sector = bio->bi_iter.bi_sector;
 	sector_t nr_sectors = bio_sectors(bio);
@@ -1575,7 +1575,13 @@ static void null_config_discard(struct nullb *nullb)
 	blk_queue_flag_set(QUEUE_FLAG_DISCARD, nullb->q);
 }
 
-static const struct block_device_operations null_ops = {
+static const struct block_device_operations null_bio_ops = {
+	.owner		= THIS_MODULE,
+	.submit_bio	= null_submit_bio,
+	.report_zones	= null_report_zones,
+};
+
+static const struct block_device_operations null_rq_ops = {
 	.owner		= THIS_MODULE,
 	.report_zones	= null_report_zones,
 };
@@ -1647,7 +1653,10 @@ static int null_gendisk_register(struct nullb *nullb)
 	disk->flags |= GENHD_FL_EXT_DEVT | GENHD_FL_SUPPRESS_PARTITION_INFO;
 	disk->major		= null_major;
 	disk->first_minor	= nullb->index;
-	disk->fops		= &null_ops;
+	if (queue_is_mq(nullb->q))
+		disk->fops		= &null_rq_ops;
+	else
+		disk->fops		= &null_bio_ops;
 	disk->private_data	= nullb;
 	disk->queue		= nullb->q;
 	strncpy(disk->disk_name, nullb->disk_name, DISK_NAME_LEN);
@@ -1792,7 +1801,7 @@ static int null_add_dev(struct nullb_device *dev)
 			goto out_cleanup_tags;
 		}
 	} else if (dev->queue_mode == NULL_Q_BIO) {
-		nullb->q = blk_alloc_queue(null_queue_bio, dev->home_node);
+		nullb->q = blk_alloc_queue(dev->home_node);
 		if (!nullb->q) {
 			rv = -ENOMEM;
 			goto out_cleanup_queues;
diff --git a/drivers/block/pktcdvd.c b/drivers/block/pktcdvd.c
index 29b0c62dc86c1f..5588bd4cd267e8 100644
--- a/drivers/block/pktcdvd.c
+++ b/drivers/block/pktcdvd.c
@@ -36,7 +36,7 @@
  * block device, assembling the pieces to full packets and queuing them to the
  * packet I/O scheduler.
  *
- * At the top layer there is a custom make_request_fn function that forwards
+ * At the top layer there is a custom ->submit_bio function that forwards
  * read requests directly to the iosched queue and puts write requests in the
  * unaligned write queue. A kernel thread performs the necessary read
  * gathering to convert the unaligned writes to aligned writes and then feeds
@@ -2428,7 +2428,7 @@ static void pkt_make_request_write(struct request_queue *q, struct bio *bio)
 	}
 }
 
-static blk_qc_t pkt_make_request(struct request_queue *q, struct bio *bio)
+static blk_qc_t pkt_submit_bio(struct bio *bio)
 {
 	struct pktcdvd_device *pd;
 	char b[BDEVNAME_SIZE];
@@ -2436,7 +2436,7 @@ static blk_qc_t pkt_make_request(struct request_queue *q, struct bio *bio)
 
 	blk_queue_split(&bio);
 
-	pd = q->queuedata;
+	pd = bio->bi_disk->queue->queuedata;
 	if (!pd) {
 		pr_err("%s incorrect request queue\n", bio_devname(bio, b));
 		goto end_io;
@@ -2480,7 +2480,7 @@ static blk_qc_t pkt_make_request(struct request_queue *q, struct bio *bio)
 			split = bio;
 		}
 
-		pkt_make_request_write(q, split);
+		pkt_make_request_write(bio->bi_disk->queue, split);
 	} while (split != bio);
 
 	return BLK_QC_T_NONE;
@@ -2685,6 +2685,7 @@ static char *pkt_devnode(struct gendisk *disk, umode_t *mode)
 
 static const struct block_device_operations pktcdvd_ops = {
 	.owner =		THIS_MODULE,
+	.submit_bio =		pkt_submit_bio,
 	.open =			pkt_open,
 	.release =		pkt_close,
 	.ioctl =		pkt_ioctl,
@@ -2749,7 +2750,7 @@ static int pkt_setup_dev(dev_t dev, dev_t* pkt_dev)
 	disk->flags = GENHD_FL_REMOVABLE;
 	strcpy(disk->disk_name, pd->name);
 	disk->private_data = pd;
-	disk->queue = blk_alloc_queue(pkt_make_request, NUMA_NO_NODE);
+	disk->queue = blk_alloc_queue(NUMA_NO_NODE);
 	if (!disk->queue)
 		goto out_mem2;
 
diff --git a/drivers/block/ps3vram.c b/drivers/block/ps3vram.c
index 76cc584aa76346..1088798c8dd0c9 100644
--- a/drivers/block/ps3vram.c
+++ b/drivers/block/ps3vram.c
@@ -90,12 +90,6 @@ struct ps3vram_priv {
 
 static int ps3vram_major;
 
-
-static const struct block_device_operations ps3vram_fops = {
-	.owner		= THIS_MODULE,
-};
-
-
 #define DMA_NOTIFIER_HANDLE_BASE 0x66604200 /* first DMA notifier handle */
 #define DMA_NOTIFIER_OFFSET_BASE 0x1000     /* first DMA notifier offset */
 #define DMA_NOTIFIER_SIZE        0x40
@@ -585,7 +579,7 @@ static struct bio *ps3vram_do_bio(struct ps3_system_bus_device *dev,
 	return next;
 }
 
-static blk_qc_t ps3vram_make_request(struct request_queue *q, struct bio *bio)
+static blk_qc_t ps3vram_submit_bio(struct bio *bio)
 {
 	struct ps3_system_bus_device *dev = bio->bi_disk->private_data;
 	struct ps3vram_priv *priv = ps3_system_bus_get_drvdata(dev);
@@ -610,6 +604,11 @@ static blk_qc_t ps3vram_make_request(struct request_queue *q, struct bio *bio)
 	return BLK_QC_T_NONE;
 }
 
+static const struct block_device_operations ps3vram_fops = {
+	.owner		= THIS_MODULE,
+	.submit_bio	= ps3vram_submit_bio,
+};
+
 static int ps3vram_probe(struct ps3_system_bus_device *dev)
 {
 	struct ps3vram_priv *priv;
@@ -737,7 +736,7 @@ static int ps3vram_probe(struct ps3_system_bus_device *dev)
 
 	ps3vram_proc_init(dev);
 
-	queue = blk_alloc_queue(ps3vram_make_request, NUMA_NO_NODE);
+	queue = blk_alloc_queue(NUMA_NO_NODE);
 	if (!queue) {
 		dev_err(&dev->core, "blk_alloc_queue failed\n");
 		error = -ENOMEM;
diff --git a/drivers/block/rsxx/dev.c b/drivers/block/rsxx/dev.c
index 1d52bc73dd0f82..edacefff6e355b 100644
--- a/drivers/block/rsxx/dev.c
+++ b/drivers/block/rsxx/dev.c
@@ -50,6 +50,8 @@ struct rsxx_bio_meta {
 
 static struct kmem_cache *bio_meta_pool;
 
+static blk_qc_t rsxx_submit_bio(struct bio *bio);
+
 /*----------------- Block Device Operations -----------------*/
 static int rsxx_blkdev_ioctl(struct block_device *bdev,
 				 fmode_t mode,
@@ -92,6 +94,7 @@ static int rsxx_getgeo(struct block_device *bdev, struct hd_geometry *geo)
 
 static const struct block_device_operations rsxx_fops = {
 	.owner		= THIS_MODULE,
+	.submit_bio	= rsxx_submit_bio,
 	.getgeo		= rsxx_getgeo,
 	.ioctl		= rsxx_blkdev_ioctl,
 };
@@ -117,7 +120,7 @@ static void bio_dma_done_cb(struct rsxx_cardinfo *card,
 	}
 }
 
-static blk_qc_t rsxx_make_request(struct request_queue *q, struct bio *bio)
+static blk_qc_t rsxx_submit_bio(struct bio *bio)
 {
 	struct rsxx_cardinfo *card = bio->bi_disk->private_data;
 	struct rsxx_bio_meta *bio_meta;
@@ -233,7 +236,7 @@ int rsxx_setup_dev(struct rsxx_cardinfo *card)
 		return -ENOMEM;
 	}
 
-	card->queue = blk_alloc_queue(rsxx_make_request, NUMA_NO_NODE);
+	card->queue = blk_alloc_queue(NUMA_NO_NODE);
 	if (!card->queue) {
 		dev_err(CARD_TO_DEV(card), "Failed queue alloc\n");
 		unregister_blkdev(card->major, DRIVER_NAME);
diff --git a/drivers/block/umem.c b/drivers/block/umem.c
index 3b89c07f9e9d6e..2b95d7b33b9186 100644
--- a/drivers/block/umem.c
+++ b/drivers/block/umem.c
@@ -519,7 +519,7 @@ static int mm_check_plugged(struct cardinfo *card)
 	return !!blk_check_plugged(mm_unplug, card, sizeof(struct blk_plug_cb));
 }
 
-static blk_qc_t mm_make_request(struct request_queue *q, struct bio *bio)
+static blk_qc_t mm_submit_bio(struct bio *bio)
 {
 	struct cardinfo *card = bio->bi_disk->private_data;
 
@@ -779,6 +779,7 @@ static int mm_getgeo(struct block_device *bdev, struct hd_geometry *geo)
 
 static const struct block_device_operations mm_fops = {
 	.owner		= THIS_MODULE,
+	.submit_bio	= mm_submit_bio,
 	.getgeo		= mm_getgeo,
 	.revalidate_disk = mm_revalidate,
 };
@@ -886,7 +887,7 @@ static int mm_pci_probe(struct pci_dev *dev, const struct pci_device_id *id)
 	card->biotail = &card->bio;
 	spin_lock_init(&card->lock);
 
-	card->queue = blk_alloc_queue(mm_make_request, NUMA_NO_NODE);
+	card->queue = blk_alloc_queue(NUMA_NO_NODE);
 	if (!card->queue)
 		goto failed_alloc;
 
diff --git a/drivers/block/zram/zram_drv.c b/drivers/block/zram/zram_drv.c
index 0564e3f384089e..f9a57f147ee1e6 100644
--- a/drivers/block/zram/zram_drv.c
+++ b/drivers/block/zram/zram_drv.c
@@ -793,9 +793,9 @@ static void zram_sync_read(struct work_struct *work)
 }
 
 /*
- * Block layer want one ->make_request_fn to be active at a time
- * so if we use chained IO with parent IO in same context,
- * it's a deadlock. To avoid, it, it uses worker thread context.
+ * Block layer want one ->submit_bio to be active at a time, so if we use
+ * chained IO with parent IO in same context, it's a deadlock. To avoid that,
+ * use a worker thread context.
  */
 static int read_from_bdev_sync(struct zram *zram, struct bio_vec *bvec,
 				unsigned long entry, struct bio *bio)
@@ -1584,7 +1584,7 @@ static void __zram_make_request(struct zram *zram, struct bio *bio)
 /*
  * Handler function for all zram I/O requests.
  */
-static blk_qc_t zram_make_request(struct request_queue *queue, struct bio *bio)
+static blk_qc_t zram_submit_bio(struct bio *bio)
 {
 	struct zram *zram = bio->bi_disk->private_data;
 
@@ -1813,6 +1813,7 @@ static int zram_open(struct block_device *bdev, fmode_t mode)
 
 static const struct block_device_operations zram_devops = {
 	.open = zram_open,
+	.submit_bio = zram_submit_bio,
 	.swap_slot_free_notify = zram_slot_free_notify,
 	.rw_page = zram_rw_page,
 	.owner = THIS_MODULE
@@ -1891,7 +1892,7 @@ static int zram_add(void)
 #ifdef CONFIG_ZRAM_WRITEBACK
 	spin_lock_init(&zram->wb_limit_lock);
 #endif
-	queue = blk_alloc_queue(zram_make_request, NUMA_NO_NODE);
+	queue = blk_alloc_queue(NUMA_NO_NODE);
 	if (!queue) {
 		pr_err("Error allocating disk queue for device %d\n",
 			device_id);
diff --git a/drivers/lightnvm/core.c b/drivers/lightnvm/core.c
index db38a68abb6c03..fe78bf0fdce545 100644
--- a/drivers/lightnvm/core.c
+++ b/drivers/lightnvm/core.c
@@ -236,10 +236,6 @@ static struct nvm_tgt_dev *nvm_create_tgt_dev(struct nvm_dev *dev,
 	return tgt_dev;
 }
 
-static const struct block_device_operations nvm_fops = {
-	.owner		= THIS_MODULE,
-};
-
 static struct nvm_tgt_type *__nvm_find_target_type(const char *name)
 {
 	struct nvm_tgt_type *tt;
@@ -380,7 +376,7 @@ static int nvm_create_tgt(struct nvm_dev *dev, struct nvm_ioctl_create *create)
 		goto err_dev;
 	}
 
-	tqueue = blk_alloc_queue(tt->make_rq, dev->q->node);
+	tqueue = blk_alloc_queue(dev->q->node);
 	if (!tqueue) {
 		ret = -ENOMEM;
 		goto err_disk;
@@ -390,7 +386,7 @@ static int nvm_create_tgt(struct nvm_dev *dev, struct nvm_ioctl_create *create)
 	tdisk->flags = GENHD_FL_EXT_DEVT;
 	tdisk->major = 0;
 	tdisk->first_minor = 0;
-	tdisk->fops = &nvm_fops;
+	tdisk->fops = tt->bops;
 	tdisk->queue = tqueue;
 
 	targetdata = tt->init(tgt_dev, tdisk, create->flags);
diff --git a/drivers/lightnvm/pblk-init.c b/drivers/lightnvm/pblk-init.c
index 7a4a1b7a941d2c..b6246f73895cf8 100644
--- a/drivers/lightnvm/pblk-init.c
+++ b/drivers/lightnvm/pblk-init.c
@@ -47,9 +47,9 @@ static struct pblk_global_caches pblk_caches = {
 
 struct bio_set pblk_bio_set;
 
-static blk_qc_t pblk_make_rq(struct request_queue *q, struct bio *bio)
+static blk_qc_t pblk_submit_bio(struct bio *bio)
 {
-	struct pblk *pblk = q->queuedata;
+	struct pblk *pblk = bio->bi_disk->queue->queuedata;
 
 	if (bio_op(bio) == REQ_OP_DISCARD) {
 		pblk_discard(pblk, bio);
@@ -79,6 +79,12 @@ static blk_qc_t pblk_make_rq(struct request_queue *q, struct bio *bio)
 	return BLK_QC_T_NONE;
 }
 
+static const struct block_device_operations pblk_bops = {
+	.owner		= THIS_MODULE,
+	.submit_bio	= pblk_submit_bio,
+};
+
+
 static size_t pblk_trans_map_size(struct pblk *pblk)
 {
 	int entry_size = 8;
@@ -1280,7 +1286,7 @@ static struct nvm_tgt_type tt_pblk = {
 	.name		= "pblk",
 	.version	= {1, 0, 0},
 
-	.make_rq	= pblk_make_rq,
+	.bops		= &pblk_bops,
 	.capacity	= pblk_capacity,
 
 	.init		= pblk_init,
diff --git a/drivers/md/bcache/request.c b/drivers/md/bcache/request.c
index 7acf024e99f351..fc5702b10074d6 100644
--- a/drivers/md/bcache/request.c
+++ b/drivers/md/bcache/request.c
@@ -1158,7 +1158,7 @@ static void quit_max_writeback_rate(struct cache_set *c,
 
 /* Cached devices - read & write stuff */
 
-blk_qc_t cached_dev_make_request(struct request_queue *q, struct bio *bio)
+blk_qc_t cached_dev_submit_bio(struct bio *bio)
 {
 	struct search *s;
 	struct bcache_device *d = bio->bi_disk->private_data;
@@ -1291,7 +1291,7 @@ static void flash_dev_nodata(struct closure *cl)
 	continue_at(cl, search_free, NULL);
 }
 
-blk_qc_t flash_dev_make_request(struct request_queue *q, struct bio *bio)
+blk_qc_t flash_dev_submit_bio(struct bio *bio)
 {
 	struct search *s;
 	struct closure *cl;
diff --git a/drivers/md/bcache/request.h b/drivers/md/bcache/request.h
index bb005c93dd7218..82b38366a95deb 100644
--- a/drivers/md/bcache/request.h
+++ b/drivers/md/bcache/request.h
@@ -37,10 +37,10 @@ unsigned int bch_get_congested(const struct cache_set *c);
 void bch_data_insert(struct closure *cl);
 
 void bch_cached_dev_request_init(struct cached_dev *dc);
-blk_qc_t cached_dev_make_request(struct request_queue *q, struct bio *bio);
+blk_qc_t cached_dev_submit_bio(struct bio *bio);
 
 void bch_flash_dev_request_init(struct bcache_device *d);
-blk_qc_t flash_dev_make_request(struct request_queue *q, struct bio *bio);
+blk_qc_t flash_dev_submit_bio(struct bio *bio);
 
 extern struct kmem_cache *bch_search_cache;
 
diff --git a/drivers/md/bcache/super.c b/drivers/md/bcache/super.c
index 21aa168113d30b..de13f6e916966d 100644
--- a/drivers/md/bcache/super.c
+++ b/drivers/md/bcache/super.c
@@ -680,7 +680,16 @@ static int ioctl_dev(struct block_device *b, fmode_t mode,
 	return d->ioctl(d, mode, cmd, arg);
 }
 
-static const struct block_device_operations bcache_ops = {
+static const struct block_device_operations bcache_cached_ops = {
+	.submit_bio	= cached_dev_submit_bio,
+	.open		= open_dev,
+	.release	= release_dev,
+	.ioctl		= ioctl_dev,
+	.owner		= THIS_MODULE,
+};
+
+static const struct block_device_operations bcache_flash_ops = {
+	.submit_bio	= flash_dev_submit_bio,
 	.open		= open_dev,
 	.release	= release_dev,
 	.ioctl		= ioctl_dev,
@@ -820,8 +829,8 @@ static void bcache_device_free(struct bcache_device *d)
 }
 
 static int bcache_device_init(struct bcache_device *d, unsigned int block_size,
-			      sector_t sectors, make_request_fn make_request_fn,
-			      struct block_device *cached_bdev)
+		sector_t sectors, struct block_device *cached_bdev,
+		const struct block_device_operations *ops)
 {
 	struct request_queue *q;
 	const size_t max_stripes = min_t(size_t, INT_MAX,
@@ -868,10 +877,10 @@ static int bcache_device_init(struct bcache_device *d, unsigned int block_size,
 
 	d->disk->major		= bcache_major;
 	d->disk->first_minor	= idx_to_first_minor(idx);
-	d->disk->fops		= &bcache_ops;
+	d->disk->fops		= ops;
 	d->disk->private_data	= d;
 
-	q = blk_alloc_queue(make_request_fn, NUMA_NO_NODE);
+	q = blk_alloc_queue(NUMA_NO_NODE);
 	if (!q)
 		return -ENOMEM;
 
@@ -1355,7 +1364,7 @@ static int cached_dev_init(struct cached_dev *dc, unsigned int block_size)
 
 	ret = bcache_device_init(&dc->disk, block_size,
 			 dc->bdev->bd_part->nr_sects - dc->sb.data_offset,
-			 cached_dev_make_request, dc->bdev);
+			 dc->bdev, &bcache_cached_ops);
 	if (ret)
 		return ret;
 
@@ -1468,7 +1477,7 @@ static int flash_dev_run(struct cache_set *c, struct uuid_entry *u)
 	kobject_init(&d->kobj, &bch_flash_dev_ktype);
 
 	if (bcache_device_init(d, block_bytes(c), u->sectors,
-			flash_dev_make_request, NULL))
+			NULL, &bcache_flash_ops))
 		goto err;
 
 	bcache_device_attach(d, c, u - c->uuids);
diff --git a/drivers/md/dm.c b/drivers/md/dm.c
index 5aa7a604f4cbc5..5acfaba3700dfc 100644
--- a/drivers/md/dm.c
+++ b/drivers/md/dm.c
@@ -1770,7 +1770,7 @@ static blk_qc_t dm_process_bio(struct mapped_device *md,
 	}
 
 	/*
-	 * If in ->make_request_fn we need to use blk_queue_split(), otherwise
+	 * If in ->queue_bio we need to use blk_queue_split(), otherwise
 	 * queue_limits for abnormal requests (e.g. discard, writesame, etc)
 	 * won't be imposed.
 	 */
@@ -1787,7 +1787,7 @@ static blk_qc_t dm_process_bio(struct mapped_device *md,
 		return __split_and_process_bio(md, map, bio);
 }
 
-static blk_qc_t dm_make_request(struct request_queue *q, struct bio *bio)
+static blk_qc_t dm_submit_bio(struct bio *bio)
 {
 	struct mapped_device *md = bio->bi_disk->private_data;
 	blk_qc_t ret = BLK_QC_T_NONE;
@@ -1798,12 +1798,12 @@ static blk_qc_t dm_make_request(struct request_queue *q, struct bio *bio)
 		/*
 		 * We are called with a live reference on q_usage_counter, but
 		 * that one will be released as soon as we return.  Grab an
-		 * extra one as blk_mq_make_request expects to be able to
-		 * consume a reference (which lives until the request is freed
-		 * in case a request is allocated).
+		 * extra one as blk_mq_submit_bio expects to be able to consume
+		 * a reference (which lives until the request is freed in case a
+		 * request is allocated).
 		 */
-		percpu_ref_get(&q->q_usage_counter);
-		return blk_mq_make_request(q, bio);
+		percpu_ref_get(&bio->bi_disk->queue->q_usage_counter);
+		return blk_mq_submit_bio(bio);
 	}
 
 	map = dm_get_live_table(md, &srcu_idx);
@@ -1988,11 +1988,11 @@ static struct mapped_device *alloc_dev(int minor)
 	spin_lock_init(&md->uevent_lock);
 
 	/*
-	 * default to bio-based required ->make_request_fn until DM
-	 * table is loaded and md->type established. If request-based
-	 * table is loaded: blk-mq will override accordingly.
+	 * default to bio-based until DM table is loaded and md->type
+	 * established. If request-based table is loaded: blk-mq will
+	 * override accordingly.
 	 */
-	md->queue = blk_alloc_queue(dm_make_request, numa_node_id);
+	md->queue = blk_alloc_queue(numa_node_id);
 	if (!md->queue)
 		goto bad;
 
@@ -3232,6 +3232,7 @@ static const struct pr_ops dm_pr_ops = {
 };
 
 static const struct block_device_operations dm_blk_dops = {
+	.submit_bio = dm_submit_bio,
 	.open = dm_blk_open,
 	.release = dm_blk_close,
 	.ioctl = dm_blk_ioctl,
diff --git a/drivers/md/md.c b/drivers/md/md.c
index ff20868e5e1b98..7b7cb49be35114 100644
--- a/drivers/md/md.c
+++ b/drivers/md/md.c
@@ -463,7 +463,7 @@ void md_handle_request(struct mddev *mddev, struct bio *bio)
 }
 EXPORT_SYMBOL(md_handle_request);
 
-static blk_qc_t md_make_request(struct request_queue *q, struct bio *bio)
+static blk_qc_t md_submit_bio(struct bio *bio)
 {
 	const int rw = bio_data_dir(bio);
 	const int sgrp = op_stat_group(bio_op(bio));
@@ -5641,7 +5641,7 @@ static int md_alloc(dev_t dev, char *name)
 		mddev->hold_active = UNTIL_STOP;
 
 	error = -ENOMEM;
-	mddev->queue = blk_alloc_queue(md_make_request, NUMA_NO_NODE);
+	mddev->queue = blk_alloc_queue(NUMA_NO_NODE);
 	if (!mddev->queue)
 		goto abort;
 
@@ -7823,6 +7823,7 @@ static int md_revalidate(struct gendisk *disk)
 static const struct block_device_operations md_fops =
 {
 	.owner		= THIS_MODULE,
+	.submit_bio	= md_submit_bio,
 	.open		= md_open,
 	.release	= md_release,
 	.ioctl		= md_ioctl,
diff --git a/drivers/nvdimm/blk.c b/drivers/nvdimm/blk.c
index 39030a324d7ffe..1f718381a04553 100644
--- a/drivers/nvdimm/blk.c
+++ b/drivers/nvdimm/blk.c
@@ -162,7 +162,7 @@ static int nsblk_do_bvec(struct nd_namespace_blk *nsblk,
 	return err;
 }
 
-static blk_qc_t nd_blk_make_request(struct request_queue *q, struct bio *bio)
+static blk_qc_t nd_blk_submit_bio(struct bio *bio)
 {
 	struct bio_integrity_payload *bip;
 	struct nd_namespace_blk *nsblk = bio->bi_disk->private_data;
@@ -225,6 +225,7 @@ static int nsblk_rw_bytes(struct nd_namespace_common *ndns,
 
 static const struct block_device_operations nd_blk_fops = {
 	.owner = THIS_MODULE,
+	.submit_bio =  nd_blk_submit_bio,
 	.revalidate_disk = nvdimm_revalidate_disk,
 };
 
@@ -250,7 +251,7 @@ static int nsblk_attach_disk(struct nd_namespace_blk *nsblk)
 	internal_nlba = div_u64(nsblk->size, nsblk_internal_lbasize(nsblk));
 	available_disk_size = internal_nlba * nsblk_sector_size(nsblk);
 
-	q = blk_alloc_queue(nd_blk_make_request, NUMA_NO_NODE);
+	q = blk_alloc_queue(NUMA_NO_NODE);
 	if (!q)
 		return -ENOMEM;
 	if (devm_add_action_or_reset(dev, nd_blk_release_queue, q))
diff --git a/drivers/nvdimm/btt.c b/drivers/nvdimm/btt.c
index 48e9d169b6f9ce..412d21d8f64351 100644
--- a/drivers/nvdimm/btt.c
+++ b/drivers/nvdimm/btt.c
@@ -1439,7 +1439,7 @@ static int btt_do_bvec(struct btt *btt, struct bio_integrity_payload *bip,
 	return ret;
 }
 
-static blk_qc_t btt_make_request(struct request_queue *q, struct bio *bio)
+static blk_qc_t btt_submit_bio(struct bio *bio)
 {
 	struct bio_integrity_payload *bip = bio_integrity(bio);
 	struct btt *btt = bio->bi_disk->private_data;
@@ -1512,6 +1512,7 @@ static int btt_getgeo(struct block_device *bd, struct hd_geometry *geo)
 
 static const struct block_device_operations btt_fops = {
 	.owner =		THIS_MODULE,
+	.submit_bio =		btt_submit_bio,
 	.rw_page =		btt_rw_page,
 	.getgeo =		btt_getgeo,
 	.revalidate_disk =	nvdimm_revalidate_disk,
@@ -1523,7 +1524,7 @@ static int btt_blk_init(struct btt *btt)
 	struct nd_namespace_common *ndns = nd_btt->ndns;
 
 	/* create a new disk and request queue for btt */
-	btt->btt_queue = blk_alloc_queue(btt_make_request, NUMA_NO_NODE);
+	btt->btt_queue = blk_alloc_queue(NUMA_NO_NODE);
 	if (!btt->btt_queue)
 		return -ENOMEM;
 
diff --git a/drivers/nvdimm/pmem.c b/drivers/nvdimm/pmem.c
index d25e66fd942dd6..94790e6e0e4ce1 100644
--- a/drivers/nvdimm/pmem.c
+++ b/drivers/nvdimm/pmem.c
@@ -189,7 +189,7 @@ static blk_status_t pmem_do_write(struct pmem_device *pmem,
 	return rc;
 }
 
-static blk_qc_t pmem_make_request(struct request_queue *q, struct bio *bio)
+static blk_qc_t pmem_submit_bio(struct bio *bio)
 {
 	int ret = 0;
 	blk_status_t rc = 0;
@@ -281,6 +281,7 @@ __weak long __pmem_direct_access(struct pmem_device *pmem, pgoff_t pgoff,
 
 static const struct block_device_operations pmem_fops = {
 	.owner =		THIS_MODULE,
+	.submit_bio =		pmem_submit_bio,
 	.rw_page =		pmem_rw_page,
 	.revalidate_disk =	nvdimm_revalidate_disk,
 };
@@ -423,7 +424,7 @@ static int pmem_attach_disk(struct device *dev,
 		return -EBUSY;
 	}
 
-	q = blk_alloc_queue(pmem_make_request, dev_to_node(dev));
+	q = blk_alloc_queue(dev_to_node(dev));
 	if (!q)
 		return -ENOMEM;
 
diff --git a/drivers/nvme/host/core.c b/drivers/nvme/host/core.c
index 6810c8812aed26..5192a024dc1b9c 100644
--- a/drivers/nvme/host/core.c
+++ b/drivers/nvme/host/core.c
@@ -2178,6 +2178,7 @@ static void nvme_ns_head_release(struct gendisk *disk, fmode_t mode)
 
 const struct block_device_operations nvme_ns_head_ops = {
 	.owner		= THIS_MODULE,
+	.submit_bio	= nvme_ns_head_submit_bio,
 	.open		= nvme_ns_head_open,
 	.release	= nvme_ns_head_release,
 	.ioctl		= nvme_ioctl,
diff --git a/drivers/nvme/host/multipath.c b/drivers/nvme/host/multipath.c
index 5a5205ea570a77..89afcf943bf846 100644
--- a/drivers/nvme/host/multipath.c
+++ b/drivers/nvme/host/multipath.c
@@ -291,8 +291,7 @@ static bool nvme_available_path(struct nvme_ns_head *head)
 	return false;
 }
 
-static blk_qc_t nvme_ns_head_make_request(struct request_queue *q,
-		struct bio *bio)
+blk_qc_t nvme_ns_head_submit_bio(struct bio *bio)
 {
 	struct nvme_ns_head *head = bio->bi_disk->private_data;
 	struct device *dev = disk_to_dev(head->disk);
@@ -374,7 +373,7 @@ int nvme_mpath_alloc_disk(struct nvme_ctrl *ctrl, struct nvme_ns_head *head)
 	if (!(ctrl->subsys->cmic & NVME_CTRL_CMIC_MULTI_CTRL) || !multipath)
 		return 0;
 
-	q = blk_alloc_queue(nvme_ns_head_make_request, ctrl->numa_node);
+	q = blk_alloc_queue(ctrl->numa_node);
 	if (!q)
 		goto out;
 	blk_queue_flag_set(QUEUE_FLAG_NONROT, q);
diff --git a/drivers/nvme/host/nvme.h b/drivers/nvme/host/nvme.h
index 61780c38f51fdb..9f2b0e0b455871 100644
--- a/drivers/nvme/host/nvme.h
+++ b/drivers/nvme/host/nvme.h
@@ -586,6 +586,7 @@ void nvme_mpath_stop(struct nvme_ctrl *ctrl);
 bool nvme_mpath_clear_current_path(struct nvme_ns *ns);
 void nvme_mpath_clear_ctrl_paths(struct nvme_ctrl *ctrl);
 struct nvme_ns *nvme_find_path(struct nvme_ns_head *head);
+blk_qc_t nvme_ns_head_submit_bio(struct bio *bio);
 
 static inline void nvme_mpath_check_last_path(struct nvme_ns *ns)
 {
diff --git a/drivers/s390/block/dcssblk.c b/drivers/s390/block/dcssblk.c
index dfe21eb7276021..35666c3537dea9 100644
--- a/drivers/s390/block/dcssblk.c
+++ b/drivers/s390/block/dcssblk.c
@@ -31,8 +31,7 @@
 
 static int dcssblk_open(struct block_device *bdev, fmode_t mode);
 static void dcssblk_release(struct gendisk *disk, fmode_t mode);
-static blk_qc_t dcssblk_make_request(struct request_queue *q,
-						struct bio *bio);
+static blk_qc_t dcssblk_submit_bio(struct bio *bio);
 static long dcssblk_dax_direct_access(struct dax_device *dax_dev, pgoff_t pgoff,
 		long nr_pages, void **kaddr, pfn_t *pfn);
 
@@ -41,6 +40,7 @@ static char dcssblk_segments[DCSSBLK_PARM_LEN] = "\0";
 static int dcssblk_major;
 static const struct block_device_operations dcssblk_devops = {
 	.owner   	= THIS_MODULE,
+	.submit_bio	= dcssblk_submit_bio,
 	.open    	= dcssblk_open,
 	.release 	= dcssblk_release,
 };
@@ -651,8 +651,7 @@ dcssblk_add_store(struct device *dev, struct device_attribute *attr, const char
 	}
 	dev_info->gd->major = dcssblk_major;
 	dev_info->gd->fops = &dcssblk_devops;
-	dev_info->dcssblk_queue =
-		blk_alloc_queue(dcssblk_make_request, NUMA_NO_NODE);
+	dev_info->dcssblk_queue = blk_alloc_queue(NUMA_NO_NODE);
 	dev_info->gd->queue = dev_info->dcssblk_queue;
 	dev_info->gd->private_data = dev_info;
 	blk_queue_logical_block_size(dev_info->dcssblk_queue, 4096);
@@ -868,7 +867,7 @@ dcssblk_release(struct gendisk *disk, fmode_t mode)
 }
 
 static blk_qc_t
-dcssblk_make_request(struct request_queue *q, struct bio *bio)
+dcssblk_submit_bio(struct bio *bio)
 {
 	struct dcssblk_dev_info *dev_info;
 	struct bio_vec bvec;
diff --git a/drivers/s390/block/xpram.c b/drivers/s390/block/xpram.c
index 5456f0ad5a40a4..c2536f7767b366 100644
--- a/drivers/s390/block/xpram.c
+++ b/drivers/s390/block/xpram.c
@@ -182,7 +182,7 @@ static unsigned long xpram_highest_page_index(void)
 /*
  * Block device make request function.
  */
-static blk_qc_t xpram_make_request(struct request_queue *q, struct bio *bio)
+static blk_qc_t xpram_submit_bio(struct bio *bio)
 {
 	xpram_device_t *xdev = bio->bi_disk->private_data;
 	struct bio_vec bvec;
@@ -250,6 +250,7 @@ static int xpram_getgeo(struct block_device *bdev, struct hd_geometry *geo)
 static const struct block_device_operations xpram_devops =
 {
 	.owner	= THIS_MODULE,
+	.submit_bio = xpram_submit_bio,
 	.getgeo	= xpram_getgeo,
 };
 
@@ -343,8 +344,7 @@ static int __init xpram_setup_blkdev(void)
 		xpram_disks[i] = alloc_disk(1);
 		if (!xpram_disks[i])
 			goto out;
-		xpram_queues[i] = blk_alloc_queue(xpram_make_request,
-				NUMA_NO_NODE);
+		xpram_queues[i] = blk_alloc_queue(NUMA_NO_NODE);
 		if (!xpram_queues[i]) {
 			put_disk(xpram_disks[i]);
 			goto out;
diff --git a/include/linux/blk-mq.h b/include/linux/blk-mq.h
index 8986e88a986b14..b2cf11c65b74aa 100644
--- a/include/linux/blk-mq.h
+++ b/include/linux/blk-mq.h
@@ -596,6 +596,6 @@ static inline void blk_mq_cleanup_rq(struct request *rq)
 		rq->q->mq_ops->cleanup_rq(rq);
 }
 
-blk_qc_t blk_mq_make_request(struct request_queue *q, struct bio *bio);
+blk_qc_t blk_mq_submit_bio(struct bio *bio);
 
 #endif
diff --git a/include/linux/blkdev.h b/include/linux/blkdev.h
index d002defc178934..083ffc5bc51b09 100644
--- a/include/linux/blkdev.h
+++ b/include/linux/blkdev.h
@@ -286,8 +286,6 @@ static inline unsigned short req_get_ioprio(struct request *req)
 
 struct blk_queue_ctx;
 
-typedef blk_qc_t (make_request_fn) (struct request_queue *q, struct bio *bio);
-
 struct bio_vec;
 
 enum blk_eh_timer_return {
@@ -398,8 +396,6 @@ struct request_queue {
 	struct blk_queue_stats	*stats;
 	struct rq_qos		*rq_qos;
 
-	make_request_fn		*make_request_fn;
-
 	const struct blk_mq_ops	*mq_ops;
 
 	/* sw queues */
@@ -1162,7 +1158,7 @@ static inline int blk_rq_map_sg(struct request_queue *q, struct request *rq,
 extern void blk_dump_rq_flags(struct request *, char *);
 
 bool __must_check blk_get_queue(struct request_queue *);
-struct request_queue *blk_alloc_queue(make_request_fn make_request, int node_id);
+struct request_queue *blk_alloc_queue(int node_id);
 extern void blk_put_queue(struct request_queue *);
 extern void blk_set_queue_dying(struct request_queue *);
 
@@ -1778,6 +1774,7 @@ static inline void blk_ksm_unregister(struct request_queue *q) { }
 
 
 struct block_device_operations {
+	blk_qc_t (*submit_bio) (struct bio *bio);
 	int (*open) (struct block_device *, fmode_t);
 	void (*release) (struct gendisk *, fmode_t);
 	int (*rw_page)(struct block_device *, sector_t, struct page *, unsigned int);
diff --git a/include/linux/lightnvm.h b/include/linux/lightnvm.h
index ee8ec2e68055af..1db223710b284a 100644
--- a/include/linux/lightnvm.h
+++ b/include/linux/lightnvm.h
@@ -631,7 +631,6 @@ static inline int nvm_next_ppa_in_chk(struct nvm_tgt_dev *dev,
 	return last;
 }
 
-typedef blk_qc_t (nvm_tgt_make_rq_fn)(struct request_queue *, struct bio *);
 typedef sector_t (nvm_tgt_capacity_fn)(void *);
 typedef void *(nvm_tgt_init_fn)(struct nvm_tgt_dev *, struct gendisk *,
 				int flags);
@@ -650,7 +649,7 @@ struct nvm_tgt_type {
 	int flags;
 
 	/* target entry points */
-	nvm_tgt_make_rq_fn *make_rq;
+	const struct block_device_operations *bops;
 	nvm_tgt_capacity_fn *capacity;
 
 	/* module-specific init/teardown */
-- 
2.26.2

