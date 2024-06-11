Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 71B3090310C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jun 2024 07:29:48 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=SFYY1p1V;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vyy0n2yrtz3dBG
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jun 2024 15:29:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=SFYY1p1V;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=bombadil.srs.infradead.org (client-ip=2607:7c80:54:3::133; helo=bombadil.infradead.org; envelope-from=batv+2fedbe304aabaf399917+7597+infradead.org+hch@bombadil.srs.infradead.org; receiver=lists.ozlabs.org)
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Vyxp34MHBz3cQm
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Jun 2024 15:20:27 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=IeK7FyZt6F6r9MKiKXHz3ErZlJd+DXOuD4iE/bLLwPM=; b=SFYY1p1VEU2QFDmwsE8obKVNl1
	js8QdtV2CbsI4FAsUKO7KHuzdYowBLFjVTf0TfykJ2AcxevyE8jQhoWv6ULdXamwrcPTm4eWXnVYN
	F7U2fhqvoZCczzW+2mPj3w8C3vpxToTyJ23VAHaEc76VRwnAwYf3HhpChxBioXSq+LMP7LHxpbai8
	ix+K7so3J+1BkZwPnb9Xk8WDJy/JBpdCCfZVi11ZLO+eb25zlsqZoAbXo93asXGyR4QQHb/pWgZAl
	bkIKq2FGF7ntzXFLLtWojtrGjtAIzF1irVgLdAjniuvRxH5zxM8GL2KlYKJFstZKJnmRGmkSGWPTx
	3X0654tA==;
Received: from 2a02-8389-2341-5b80-cdb4-8e7d-405d-6b77.cable.dynamic.v6.surfer.at ([2a02:8389:2341:5b80:cdb4:8e7d:405d:6b77] helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGtvW-00000007RAW-1CJA;
	Tue, 11 Jun 2024 05:20:11 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Subject: [PATCH 13/26] block: move cache control settings out of queue->flags
Date: Tue, 11 Jun 2024 07:19:13 +0200
Message-ID: <20240611051929.513387-14-hch@lst.de>
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

Move the cache control settings into the queue_limits so that they
can be set atomically and all I/O is frozen when changing the
flags.

Add new features and flags field for the driver set flags, and internal
(usually sysfs-controlled) flags in the block layer.  Note that we'll
eventually remove enough field from queue_limits to bring it back to the
previous size.

The disable flag is inverted compared to the previous meaning, which
means it now survives a rescan, similar to the max_sectors and
max_discard_sectors user limits.

The FLUSH and FUA flags are now inherited by blk_stack_limits, which
simplified the code in dm a lot, but also causes a slight behavior
change in that dm-switch and dm-unstripe now advertise a write cache
despite setting num_flush_bios to 0.  The I/O path will handle this
gracefully, but as far as I can tell the lack of num_flush_bios
and thus flush support is a pre-existing data integrity bug in those
targets that really needs fixing, after which a non-zero num_flush_bios
should be required in dm for targets that map to underlying devices.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 .../block/writeback_cache_control.rst         | 67 +++++++++++--------
 arch/um/drivers/ubd_kern.c                    |  2 +-
 block/blk-core.c                              |  2 +-
 block/blk-flush.c                             |  9 ++-
 block/blk-mq-debugfs.c                        |  2 -
 block/blk-settings.c                          | 29 ++------
 block/blk-sysfs.c                             | 29 +++++---
 block/blk-wbt.c                               |  4 +-
 drivers/block/drbd/drbd_main.c                |  2 +-
 drivers/block/loop.c                          |  9 +--
 drivers/block/nbd.c                           | 14 ++--
 drivers/block/null_blk/main.c                 | 12 ++--
 drivers/block/ps3disk.c                       |  7 +-
 drivers/block/rnbd/rnbd-clt.c                 | 10 +--
 drivers/block/ublk_drv.c                      |  8 ++-
 drivers/block/virtio_blk.c                    | 20 ++++--
 drivers/block/xen-blkfront.c                  |  9 ++-
 drivers/md/bcache/super.c                     |  7 +-
 drivers/md/dm-table.c                         | 39 +++--------
 drivers/md/md.c                               |  8 ++-
 drivers/mmc/core/block.c                      | 42 ++++++------
 drivers/mmc/core/queue.c                      | 12 ++--
 drivers/mmc/core/queue.h                      |  3 +-
 drivers/mtd/mtd_blkdevs.c                     |  5 +-
 drivers/nvdimm/pmem.c                         |  4 +-
 drivers/nvme/host/core.c                      |  7 +-
 drivers/nvme/host/multipath.c                 |  6 --
 drivers/scsi/sd.c                             | 28 +++++---
 include/linux/blkdev.h                        | 38 +++++++++--
 29 files changed, 227 insertions(+), 207 deletions(-)

diff --git a/Documentation/block/writeback_cache_control.rst b/Documentation/block/writeback_cache_control.rst
index b208488d0aae85..9cfe27f90253c7 100644
--- a/Documentation/block/writeback_cache_control.rst
+++ b/Documentation/block/writeback_cache_control.rst
@@ -46,41 +46,50 @@ worry if the underlying devices need any explicit cache flushing and how
 the Forced Unit Access is implemented.  The REQ_PREFLUSH and REQ_FUA flags
 may both be set on a single bio.
 
+Feature settings for block drivers
+----------------------------------
 
-Implementation details for bio based block drivers
---------------------------------------------------------------
+For devices that do not support volatile write caches there is no driver
+support required, the block layer completes empty REQ_PREFLUSH requests before
+entering the driver and strips off the REQ_PREFLUSH and REQ_FUA bits from
+requests that have a payload.
 
-These drivers will always see the REQ_PREFLUSH and REQ_FUA bits as they sit
-directly below the submit_bio interface.  For remapping drivers the REQ_FUA
-bits need to be propagated to underlying devices, and a global flush needs
-to be implemented for bios with the REQ_PREFLUSH bit set.  For real device
-drivers that do not have a volatile cache the REQ_PREFLUSH and REQ_FUA bits
-on non-empty bios can simply be ignored, and REQ_PREFLUSH requests without
-data can be completed successfully without doing any work.  Drivers for
-devices with volatile caches need to implement the support for these
-flags themselves without any help from the block layer.
+For devices with volatile write caches the driver needs to tell the block layer
+that it supports flushing caches by setting the
 
+   BLK_FEAT_WRITE_CACHE
 
-Implementation details for request_fn based block drivers
----------------------------------------------------------
+flag in the queue_limits feature field.  For devices that also support the FUA
+bit the block layer needs to be told to pass on the REQ_FUA bit by also setting
+the
 
-For devices that do not support volatile write caches there is no driver
-support required, the block layer completes empty REQ_PREFLUSH requests before
-entering the driver and strips off the REQ_PREFLUSH and REQ_FUA bits from
-requests that have a payload.  For devices with volatile write caches the
-driver needs to tell the block layer that it supports flushing caches by
-doing::
+   BLK_FEAT_FUA
+
+flag in the features field of the queue_limits structure.
+
+Implementation details for bio based block drivers
+--------------------------------------------------
+
+For bio based drivers the REQ_PREFLUSH and REQ_FUA bit are simplify passed on
+to the driver if the drivers sets the BLK_FEAT_WRITE_CACHE flag and the drivers
+needs to handle them.
+
+*NOTE*: The REQ_FUA bit also gets passed on when the BLK_FEAT_FUA flags is
+_not_ set.  Any bio based driver that sets BLK_FEAT_WRITE_CACHE also needs to
+handle REQ_FUA.
 
-	blk_queue_write_cache(sdkp->disk->queue, true, false);
+For remapping drivers the REQ_FUA bits need to be propagated to underlying
+devices, and a global flush needs to be implemented for bios with the
+REQ_PREFLUSH bit set.
 
-and handle empty REQ_OP_FLUSH requests in its prep_fn/request_fn.  Note that
-REQ_PREFLUSH requests with a payload are automatically turned into a sequence
-of an empty REQ_OP_FLUSH request followed by the actual write by the block
-layer.  For devices that also support the FUA bit the block layer needs
-to be told to pass through the REQ_FUA bit using::
+Implementation details for blk-mq drivers
+-----------------------------------------
 
-	blk_queue_write_cache(sdkp->disk->queue, true, true);
+When the BLK_FEAT_WRITE_CACHE flag is set, REQ_OP_WRITE | REQ_PREFLUSH requests
+with a payload are automatically turned into a sequence of a REQ_OP_FLUSH
+request followed by the actual write by the block layer.
 
-and the driver must handle write requests that have the REQ_FUA bit set
-in prep_fn/request_fn.  If the FUA bit is not natively supported the block
-layer turns it into an empty REQ_OP_FLUSH request after the actual write.
+When the BLK_FEA_FUA flags is set, the REQ_FUA bit simplify passed on for the
+REQ_OP_WRITE request, else a REQ_OP_FLUSH request is sent by the block layer
+after the completion of the write request for bio submissions with the REQ_FUA
+bit set.
diff --git a/arch/um/drivers/ubd_kern.c b/arch/um/drivers/ubd_kern.c
index cdcb75a68989dd..19e01691ea0ea7 100644
--- a/arch/um/drivers/ubd_kern.c
+++ b/arch/um/drivers/ubd_kern.c
@@ -835,6 +835,7 @@ static int ubd_add(int n, char **error_out)
 	struct queue_limits lim = {
 		.max_segments		= MAX_SG,
 		.seg_boundary_mask	= PAGE_SIZE - 1,
+		.features		= BLK_FEAT_WRITE_CACHE,
 	};
 	struct gendisk *disk;
 	int err = 0;
@@ -882,7 +883,6 @@ static int ubd_add(int n, char **error_out)
 	}
 
 	blk_queue_flag_set(QUEUE_FLAG_NONROT, disk->queue);
-	blk_queue_write_cache(disk->queue, true, false);
 	disk->major = UBD_MAJOR;
 	disk->first_minor = n << UBD_SHIFT;
 	disk->minors = 1 << UBD_SHIFT;
diff --git a/block/blk-core.c b/block/blk-core.c
index 82c3ae22d76d88..2b45a4df9a1aa1 100644
--- a/block/blk-core.c
+++ b/block/blk-core.c
@@ -782,7 +782,7 @@ void submit_bio_noacct(struct bio *bio)
 		if (WARN_ON_ONCE(bio_op(bio) != REQ_OP_WRITE &&
 				 bio_op(bio) != REQ_OP_ZONE_APPEND))
 			goto end_io;
-		if (!test_bit(QUEUE_FLAG_WC, &q->queue_flags)) {
+		if (!bdev_write_cache(bdev)) {
 			bio->bi_opf &= ~(REQ_PREFLUSH | REQ_FUA);
 			if (!bio_sectors(bio)) {
 				status = BLK_STS_OK;
diff --git a/block/blk-flush.c b/block/blk-flush.c
index 2234f8b3fc05f2..30b9d5033a2b85 100644
--- a/block/blk-flush.c
+++ b/block/blk-flush.c
@@ -381,8 +381,8 @@ static void blk_rq_init_flush(struct request *rq)
 bool blk_insert_flush(struct request *rq)
 {
 	struct request_queue *q = rq->q;
-	unsigned long fflags = q->queue_flags;	/* may change, cache */
 	struct blk_flush_queue *fq = blk_get_flush_queue(q, rq->mq_ctx);
+	bool supports_fua = q->limits.features & BLK_FEAT_FUA;
 	unsigned int policy = 0;
 
 	/* FLUSH/FUA request must never be merged */
@@ -394,11 +394,10 @@ bool blk_insert_flush(struct request *rq)
 	/*
 	 * Check which flushes we need to sequence for this operation.
 	 */
-	if (fflags & (1UL << QUEUE_FLAG_WC)) {
+	if (blk_queue_write_cache(q)) {
 		if (rq->cmd_flags & REQ_PREFLUSH)
 			policy |= REQ_FSEQ_PREFLUSH;
-		if (!(fflags & (1UL << QUEUE_FLAG_FUA)) &&
-		    (rq->cmd_flags & REQ_FUA))
+		if ((rq->cmd_flags & REQ_FUA) && !supports_fua)
 			policy |= REQ_FSEQ_POSTFLUSH;
 	}
 
@@ -407,7 +406,7 @@ bool blk_insert_flush(struct request *rq)
 	 * REQ_PREFLUSH and FUA for the driver.
 	 */
 	rq->cmd_flags &= ~REQ_PREFLUSH;
-	if (!(fflags & (1UL << QUEUE_FLAG_FUA)))
+	if (!supports_fua)
 		rq->cmd_flags &= ~REQ_FUA;
 
 	/*
diff --git a/block/blk-mq-debugfs.c b/block/blk-mq-debugfs.c
index 770c0c2b72faaa..e8b9db7c30c455 100644
--- a/block/blk-mq-debugfs.c
+++ b/block/blk-mq-debugfs.c
@@ -93,8 +93,6 @@ static const char *const blk_queue_flag_name[] = {
 	QUEUE_FLAG_NAME(INIT_DONE),
 	QUEUE_FLAG_NAME(STABLE_WRITES),
 	QUEUE_FLAG_NAME(POLL),
-	QUEUE_FLAG_NAME(WC),
-	QUEUE_FLAG_NAME(FUA),
 	QUEUE_FLAG_NAME(DAX),
 	QUEUE_FLAG_NAME(STATS),
 	QUEUE_FLAG_NAME(REGISTERED),
diff --git a/block/blk-settings.c b/block/blk-settings.c
index f11c8676eb4c67..536ee202fcdccb 100644
--- a/block/blk-settings.c
+++ b/block/blk-settings.c
@@ -261,6 +261,9 @@ static int blk_validate_limits(struct queue_limits *lim)
 		lim->misaligned = 0;
 	}
 
+	if (!(lim->features & BLK_FEAT_WRITE_CACHE))
+		lim->features &= ~BLK_FEAT_FUA;
+
 	err = blk_validate_integrity_limits(lim);
 	if (err)
 		return err;
@@ -454,6 +457,8 @@ int blk_stack_limits(struct queue_limits *t, struct queue_limits *b,
 {
 	unsigned int top, bottom, alignment, ret = 0;
 
+	t->features |= (b->features & BLK_FEAT_INHERIT_MASK);
+
 	t->max_sectors = min_not_zero(t->max_sectors, b->max_sectors);
 	t->max_user_sectors = min_not_zero(t->max_user_sectors,
 			b->max_user_sectors);
@@ -711,30 +716,6 @@ void blk_set_queue_depth(struct request_queue *q, unsigned int depth)
 }
 EXPORT_SYMBOL(blk_set_queue_depth);
 
-/**
- * blk_queue_write_cache - configure queue's write cache
- * @q:		the request queue for the device
- * @wc:		write back cache on or off
- * @fua:	device supports FUA writes, if true
- *
- * Tell the block layer about the write cache of @q.
- */
-void blk_queue_write_cache(struct request_queue *q, bool wc, bool fua)
-{
-	if (wc) {
-		blk_queue_flag_set(QUEUE_FLAG_HW_WC, q);
-		blk_queue_flag_set(QUEUE_FLAG_WC, q);
-	} else {
-		blk_queue_flag_clear(QUEUE_FLAG_HW_WC, q);
-		blk_queue_flag_clear(QUEUE_FLAG_WC, q);
-	}
-	if (fua)
-		blk_queue_flag_set(QUEUE_FLAG_FUA, q);
-	else
-		blk_queue_flag_clear(QUEUE_FLAG_FUA, q);
-}
-EXPORT_SYMBOL_GPL(blk_queue_write_cache);
-
 int bdev_alignment_offset(struct block_device *bdev)
 {
 	struct request_queue *q = bdev_get_queue(bdev);
diff --git a/block/blk-sysfs.c b/block/blk-sysfs.c
index 5c787965b7d09e..4f524c1d5e08bd 100644
--- a/block/blk-sysfs.c
+++ b/block/blk-sysfs.c
@@ -423,32 +423,41 @@ static ssize_t queue_io_timeout_store(struct request_queue *q, const char *page,
 
 static ssize_t queue_wc_show(struct request_queue *q, char *page)
 {
-	if (test_bit(QUEUE_FLAG_WC, &q->queue_flags))
-		return sprintf(page, "write back\n");
-
-	return sprintf(page, "write through\n");
+	if (q->limits.features & BLK_FLAGS_WRITE_CACHE_DISABLED)
+		return sprintf(page, "write through\n");
+	return sprintf(page, "write back\n");
 }
 
 static ssize_t queue_wc_store(struct request_queue *q, const char *page,
 			      size_t count)
 {
+	struct queue_limits lim;
+	bool disable;
+	int err;
+
 	if (!strncmp(page, "write back", 10)) {
-		if (!test_bit(QUEUE_FLAG_HW_WC, &q->queue_flags))
-			return -EINVAL;
-		blk_queue_flag_set(QUEUE_FLAG_WC, q);
+		disable = false;
 	} else if (!strncmp(page, "write through", 13) ||
-		 !strncmp(page, "none", 4)) {
-		blk_queue_flag_clear(QUEUE_FLAG_WC, q);
+		   !strncmp(page, "none", 4)) {
+		disable = true;
 	} else {
 		return -EINVAL;
 	}
 
+	lim = queue_limits_start_update(q);
+	if (disable)
+		lim.flags |= BLK_FLAGS_WRITE_CACHE_DISABLED;
+	else
+		lim.flags &= ~BLK_FLAGS_WRITE_CACHE_DISABLED;
+	err = queue_limits_commit_update(q, &lim);
+	if (err)
+		return err;
 	return count;
 }
 
 static ssize_t queue_fua_show(struct request_queue *q, char *page)
 {
-	return sprintf(page, "%u\n", test_bit(QUEUE_FLAG_FUA, &q->queue_flags));
+	return sprintf(page, "%u\n", !!(q->limits.features & BLK_FEAT_FUA));
 }
 
 static ssize_t queue_dax_show(struct request_queue *q, char *page)
diff --git a/block/blk-wbt.c b/block/blk-wbt.c
index 64472134dd26df..1a5e4b049ecd1d 100644
--- a/block/blk-wbt.c
+++ b/block/blk-wbt.c
@@ -206,8 +206,8 @@ static void wbt_rqw_done(struct rq_wb *rwb, struct rq_wait *rqw,
 	 */
 	if (wb_acct & WBT_DISCARD)
 		limit = rwb->wb_background;
-	else if (test_bit(QUEUE_FLAG_WC, &rwb->rqos.disk->queue->queue_flags) &&
-	         !wb_recent_wait(rwb))
+	else if (blk_queue_write_cache(rwb->rqos.disk->queue) &&
+		 !wb_recent_wait(rwb))
 		limit = 0;
 	else
 		limit = rwb->wb_normal;
diff --git a/drivers/block/drbd/drbd_main.c b/drivers/block/drbd/drbd_main.c
index 113b441d4d3670..bf42a46781fa21 100644
--- a/drivers/block/drbd/drbd_main.c
+++ b/drivers/block/drbd/drbd_main.c
@@ -2697,6 +2697,7 @@ enum drbd_ret_code drbd_create_device(struct drbd_config_context *adm_ctx, unsig
 		 * connect.
 		 */
 		.max_hw_sectors		= DRBD_MAX_BIO_SIZE_SAFE >> 8,
+		.features		= BLK_FEAT_WRITE_CACHE | BLK_FEAT_FUA,
 	};
 
 	device = minor_to_device(minor);
@@ -2736,7 +2737,6 @@ enum drbd_ret_code drbd_create_device(struct drbd_config_context *adm_ctx, unsig
 	disk->private_data = device;
 
 	blk_queue_flag_set(QUEUE_FLAG_STABLE_WRITES, disk->queue);
-	blk_queue_write_cache(disk->queue, true, true);
 
 	device->md_io.page = alloc_page(GFP_KERNEL);
 	if (!device->md_io.page)
diff --git a/drivers/block/loop.c b/drivers/block/loop.c
index 2c4a5eb3a6a7f9..0b23fdc4e2edcc 100644
--- a/drivers/block/loop.c
+++ b/drivers/block/loop.c
@@ -985,6 +985,9 @@ static int loop_reconfigure_limits(struct loop_device *lo, unsigned short bsize)
 	lim.logical_block_size = bsize;
 	lim.physical_block_size = bsize;
 	lim.io_min = bsize;
+	lim.features &= ~BLK_FEAT_WRITE_CACHE;
+	if (file->f_op->fsync && !(lo->lo_flags & LO_FLAGS_READ_ONLY))
+		lim.features |= BLK_FEAT_WRITE_CACHE;
 	if (!backing_bdev || bdev_nonrot(backing_bdev))
 		blk_queue_flag_set(QUEUE_FLAG_NONROT, lo->lo_queue);
 	else
@@ -1078,9 +1081,6 @@ static int loop_configure(struct loop_device *lo, blk_mode_t mode,
 	lo->old_gfp_mask = mapping_gfp_mask(mapping);
 	mapping_set_gfp_mask(mapping, lo->old_gfp_mask & ~(__GFP_IO|__GFP_FS));
 
-	if (!(lo->lo_flags & LO_FLAGS_READ_ONLY) && file->f_op->fsync)
-		blk_queue_write_cache(lo->lo_queue, true, false);
-
 	error = loop_reconfigure_limits(lo, config->block_size);
 	if (WARN_ON_ONCE(error))
 		goto out_unlock;
@@ -1131,9 +1131,6 @@ static void __loop_clr_fd(struct loop_device *lo, bool release)
 	struct file *filp;
 	gfp_t gfp = lo->old_gfp_mask;
 
-	if (test_bit(QUEUE_FLAG_WC, &lo->lo_queue->queue_flags))
-		blk_queue_write_cache(lo->lo_queue, false, false);
-
 	/*
 	 * Freeze the request queue when unbinding on a live file descriptor and
 	 * thus an open device.  When called from ->release we are guaranteed
diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
index 44b8c671921e5c..cb1c86a6a3fb9d 100644
--- a/drivers/block/nbd.c
+++ b/drivers/block/nbd.c
@@ -342,12 +342,14 @@ static int __nbd_set_size(struct nbd_device *nbd, loff_t bytesize,
 		lim.max_hw_discard_sectors = UINT_MAX;
 	else
 		lim.max_hw_discard_sectors = 0;
-	if (!(nbd->config->flags & NBD_FLAG_SEND_FLUSH))
-		blk_queue_write_cache(nbd->disk->queue, false, false);
-	else if (nbd->config->flags & NBD_FLAG_SEND_FUA)
-		blk_queue_write_cache(nbd->disk->queue, true, true);
-	else
-		blk_queue_write_cache(nbd->disk->queue, true, false);
+	if (!(nbd->config->flags & NBD_FLAG_SEND_FLUSH)) {
+		lim.features &= ~(BLK_FEAT_WRITE_CACHE | BLK_FEAT_FUA);
+	} else if (nbd->config->flags & NBD_FLAG_SEND_FUA) {
+		lim.features |= BLK_FEAT_WRITE_CACHE | BLK_FEAT_FUA;
+	} else {
+		lim.features |= BLK_FEAT_WRITE_CACHE;
+		lim.features &= ~BLK_FEAT_FUA;
+	}
 	lim.logical_block_size = blksize;
 	lim.physical_block_size = blksize;
 	error = queue_limits_commit_update(nbd->disk->queue, &lim);
diff --git a/drivers/block/null_blk/main.c b/drivers/block/null_blk/main.c
index 631dca2e4e8442..73e4aecf5bb492 100644
--- a/drivers/block/null_blk/main.c
+++ b/drivers/block/null_blk/main.c
@@ -1928,6 +1928,13 @@ static int null_add_dev(struct nullb_device *dev)
 			goto out_cleanup_tags;
 	}
 
+	if (dev->cache_size > 0) {
+		set_bit(NULLB_DEV_FL_CACHE, &nullb->dev->flags);
+		lim.features |= BLK_FEAT_WRITE_CACHE;
+		if (dev->fua)
+			lim.features |= BLK_FEAT_FUA;
+	}
+
 	nullb->disk = blk_mq_alloc_disk(nullb->tag_set, &lim, nullb);
 	if (IS_ERR(nullb->disk)) {
 		rv = PTR_ERR(nullb->disk);
@@ -1940,11 +1947,6 @@ static int null_add_dev(struct nullb_device *dev)
 		nullb_setup_bwtimer(nullb);
 	}
 
-	if (dev->cache_size > 0) {
-		set_bit(NULLB_DEV_FL_CACHE, &nullb->dev->flags);
-		blk_queue_write_cache(nullb->q, true, dev->fua);
-	}
-
 	nullb->q->queuedata = nullb;
 	blk_queue_flag_set(QUEUE_FLAG_NONROT, nullb->q);
 
diff --git a/drivers/block/ps3disk.c b/drivers/block/ps3disk.c
index b810ac0a5c4b97..8b73cf459b5937 100644
--- a/drivers/block/ps3disk.c
+++ b/drivers/block/ps3disk.c
@@ -388,9 +388,8 @@ static int ps3disk_probe(struct ps3_system_bus_device *_dev)
 		.max_segments		= -1,
 		.max_segment_size	= dev->bounce_size,
 		.dma_alignment		= dev->blk_size - 1,
+		.features		= BLK_FEAT_WRITE_CACHE,
 	};
-
-	struct request_queue *queue;
 	struct gendisk *gendisk;
 
 	if (dev->blk_size < 512) {
@@ -447,10 +446,6 @@ static int ps3disk_probe(struct ps3_system_bus_device *_dev)
 		goto fail_free_tag_set;
 	}
 
-	queue = gendisk->queue;
-
-	blk_queue_write_cache(queue, true, false);
-
 	priv->gendisk = gendisk;
 	gendisk->major = ps3disk_major;
 	gendisk->first_minor = devidx * PS3DISK_MINORS;
diff --git a/drivers/block/rnbd/rnbd-clt.c b/drivers/block/rnbd/rnbd-clt.c
index b7ffe03c61606d..02c4b173182719 100644
--- a/drivers/block/rnbd/rnbd-clt.c
+++ b/drivers/block/rnbd/rnbd-clt.c
@@ -1389,6 +1389,12 @@ static int rnbd_client_setup_device(struct rnbd_clt_dev *dev,
 			le32_to_cpu(rsp->max_discard_sectors);
 	}
 
+	if (rsp->cache_policy & RNBD_WRITEBACK) {
+		lim.features |= BLK_FEAT_WRITE_CACHE;
+		if (rsp->cache_policy & RNBD_FUA)
+			lim.features |= BLK_FEAT_FUA;
+	}
+
 	dev->gd = blk_mq_alloc_disk(&dev->sess->tag_set, &lim, dev);
 	if (IS_ERR(dev->gd))
 		return PTR_ERR(dev->gd);
@@ -1397,10 +1403,6 @@ static int rnbd_client_setup_device(struct rnbd_clt_dev *dev,
 
 	blk_queue_flag_set(QUEUE_FLAG_SAME_COMP, dev->queue);
 	blk_queue_flag_set(QUEUE_FLAG_SAME_FORCE, dev->queue);
-	blk_queue_write_cache(dev->queue,
-			      !!(rsp->cache_policy & RNBD_WRITEBACK),
-			      !!(rsp->cache_policy & RNBD_FUA));
-
 	return rnbd_clt_setup_gen_disk(dev, rsp, idx);
 }
 
diff --git a/drivers/block/ublk_drv.c b/drivers/block/ublk_drv.c
index 4e159948c912c2..e45c65c1848d31 100644
--- a/drivers/block/ublk_drv.c
+++ b/drivers/block/ublk_drv.c
@@ -487,8 +487,6 @@ static void ublk_dev_param_basic_apply(struct ublk_device *ub)
 	struct request_queue *q = ub->ub_disk->queue;
 	const struct ublk_param_basic *p = &ub->params.basic;
 
-	blk_queue_write_cache(q, p->attrs & UBLK_ATTR_VOLATILE_CACHE,
-			p->attrs & UBLK_ATTR_FUA);
 	if (p->attrs & UBLK_ATTR_ROTATIONAL)
 		blk_queue_flag_clear(QUEUE_FLAG_NONROT, q);
 	else
@@ -2210,6 +2208,12 @@ static int ublk_ctrl_start_dev(struct ublk_device *ub, struct io_uring_cmd *cmd)
 		lim.max_zone_append_sectors = p->max_zone_append_sectors;
 	}
 
+	if (ub->params.basic.attrs & UBLK_ATTR_VOLATILE_CACHE) {
+		lim.features |= BLK_FEAT_WRITE_CACHE;
+		if (ub->params.basic.attrs & UBLK_ATTR_FUA)
+			lim.features |= BLK_FEAT_FUA;
+	}
+
 	if (wait_for_completion_interruptible(&ub->completion) != 0)
 		return -EINTR;
 
diff --git a/drivers/block/virtio_blk.c b/drivers/block/virtio_blk.c
index 378b241911ca87..b1a3c293528519 100644
--- a/drivers/block/virtio_blk.c
+++ b/drivers/block/virtio_blk.c
@@ -1100,6 +1100,7 @@ cache_type_store(struct device *dev, struct device_attribute *attr,
 	struct gendisk *disk = dev_to_disk(dev);
 	struct virtio_blk *vblk = disk->private_data;
 	struct virtio_device *vdev = vblk->vdev;
+	struct queue_limits lim;
 	int i;
 
 	BUG_ON(!virtio_has_feature(vblk->vdev, VIRTIO_BLK_F_CONFIG_WCE));
@@ -1108,7 +1109,17 @@ cache_type_store(struct device *dev, struct device_attribute *attr,
 		return i;
 
 	virtio_cwrite8(vdev, offsetof(struct virtio_blk_config, wce), i);
-	blk_queue_write_cache(disk->queue, virtblk_get_cache_mode(vdev), false);
+
+	lim = queue_limits_start_update(disk->queue);
+	if (virtblk_get_cache_mode(vdev))
+		lim.features |= BLK_FEAT_WRITE_CACHE;
+	else
+		lim.features &= ~BLK_FEAT_WRITE_CACHE;
+	blk_mq_freeze_queue(disk->queue);
+	i = queue_limits_commit_update(disk->queue, &lim);
+	blk_mq_unfreeze_queue(disk->queue);
+	if (i)
+		return i;
 	return count;
 }
 
@@ -1504,6 +1515,9 @@ static int virtblk_probe(struct virtio_device *vdev)
 	if (err)
 		goto out_free_tags;
 
+	if (virtblk_get_cache_mode(vdev))
+		lim.features |= BLK_FEAT_WRITE_CACHE;
+
 	vblk->disk = blk_mq_alloc_disk(&vblk->tag_set, &lim, vblk);
 	if (IS_ERR(vblk->disk)) {
 		err = PTR_ERR(vblk->disk);
@@ -1519,10 +1533,6 @@ static int virtblk_probe(struct virtio_device *vdev)
 	vblk->disk->fops = &virtblk_fops;
 	vblk->index = index;
 
-	/* configure queue flush support */
-	blk_queue_write_cache(vblk->disk->queue, virtblk_get_cache_mode(vdev),
-			false);
-
 	/* If disk is read-only in the host, the guest should obey */
 	if (virtio_has_feature(vdev, VIRTIO_BLK_F_RO))
 		set_disk_ro(vblk->disk, 1);
diff --git a/drivers/block/xen-blkfront.c b/drivers/block/xen-blkfront.c
index 9794ac2d3299d1..de38e025769b14 100644
--- a/drivers/block/xen-blkfront.c
+++ b/drivers/block/xen-blkfront.c
@@ -956,6 +956,12 @@ static void blkif_set_queue_limits(const struct blkfront_info *info,
 			lim->max_secure_erase_sectors = UINT_MAX;
 	}
 
+	if (info->feature_flush) {
+		lim->features |= BLK_FEAT_WRITE_CACHE;
+		if (info->feature_fua)
+			lim->features |= BLK_FEAT_FUA;
+	}
+
 	/* Hard sector size and max sectors impersonate the equiv. hardware. */
 	lim->logical_block_size = info->sector_size;
 	lim->physical_block_size = info->physical_sector_size;
@@ -1150,9 +1156,6 @@ static int xlvbd_alloc_gendisk(blkif_sector_t capacity,
 	info->sector_size = sector_size;
 	info->physical_sector_size = physical_sector_size;
 
-	blk_queue_write_cache(info->rq, info->feature_flush ? true : false,
-			      info->feature_fua ? true : false);
-
 	pr_info("blkfront: %s: %s %s %s %s %s %s %s\n",
 		info->gd->disk_name, flush_info(info),
 		"persistent grants:", info->feature_persistent ?
diff --git a/drivers/md/bcache/super.c b/drivers/md/bcache/super.c
index 4d11fc664cb0b8..cb6595c8b5514e 100644
--- a/drivers/md/bcache/super.c
+++ b/drivers/md/bcache/super.c
@@ -897,7 +897,6 @@ static int bcache_device_init(struct bcache_device *d, unsigned int block_size,
 		sector_t sectors, struct block_device *cached_bdev,
 		const struct block_device_operations *ops)
 {
-	struct request_queue *q;
 	const size_t max_stripes = min_t(size_t, INT_MAX,
 					 SIZE_MAX / sizeof(atomic_t));
 	struct queue_limits lim = {
@@ -909,6 +908,7 @@ static int bcache_device_init(struct bcache_device *d, unsigned int block_size,
 		.io_min			= block_size,
 		.logical_block_size	= block_size,
 		.physical_block_size	= block_size,
+		.features		= BLK_FEAT_WRITE_CACHE | BLK_FEAT_FUA,
 	};
 	uint64_t n;
 	int idx;
@@ -975,12 +975,7 @@ static int bcache_device_init(struct bcache_device *d, unsigned int block_size,
 	d->disk->fops		= ops;
 	d->disk->private_data	= d;
 
-	q = d->disk->queue;
-
 	blk_queue_flag_set(QUEUE_FLAG_NONROT, d->disk->queue);
-
-	blk_queue_write_cache(q, true, true);
-
 	return 0;
 
 out_bioset_exit:
diff --git a/drivers/md/dm-table.c b/drivers/md/dm-table.c
index fd789eeb62d943..fbe125d55e25b4 100644
--- a/drivers/md/dm-table.c
+++ b/drivers/md/dm-table.c
@@ -1686,34 +1686,16 @@ int dm_calculate_queue_limits(struct dm_table *t,
 	return validate_hardware_logical_block_alignment(t, limits);
 }
 
-static int device_flush_capable(struct dm_target *ti, struct dm_dev *dev,
-				sector_t start, sector_t len, void *data)
-{
-	unsigned long flush = (unsigned long) data;
-	struct request_queue *q = bdev_get_queue(dev->bdev);
-
-	return (q->queue_flags & flush);
-}
-
-static bool dm_table_supports_flush(struct dm_table *t, unsigned long flush)
+/*
+ * Check if an target requires flush support even if none of the underlying
+ * devices need it (e.g. to persist target-specific metadata).
+ */
+static bool dm_table_supports_flush(struct dm_table *t)
 {
-	/*
-	 * Require at least one underlying device to support flushes.
-	 * t->devices includes internal dm devices such as mirror logs
-	 * so we need to use iterate_devices here, which targets
-	 * supporting flushes must provide.
-	 */
 	for (unsigned int i = 0; i < t->num_targets; i++) {
 		struct dm_target *ti = dm_table_get_target(t, i);
 
-		if (!ti->num_flush_bios)
-			continue;
-
-		if (ti->flush_supported)
-			return true;
-
-		if (ti->type->iterate_devices &&
-		    ti->type->iterate_devices(ti, device_flush_capable, (void *) flush))
+		if (ti->num_flush_bios && ti->flush_supported)
 			return true;
 	}
 
@@ -1855,7 +1837,6 @@ static int device_requires_stable_pages(struct dm_target *ti,
 int dm_table_set_restrictions(struct dm_table *t, struct request_queue *q,
 			      struct queue_limits *limits)
 {
-	bool wc = false, fua = false;
 	int r;
 
 	if (dm_table_supports_nowait(t))
@@ -1876,12 +1857,8 @@ int dm_table_set_restrictions(struct dm_table *t, struct request_queue *q,
 	if (!dm_table_supports_secure_erase(t))
 		limits->max_secure_erase_sectors = 0;
 
-	if (dm_table_supports_flush(t, (1UL << QUEUE_FLAG_WC))) {
-		wc = true;
-		if (dm_table_supports_flush(t, (1UL << QUEUE_FLAG_FUA)))
-			fua = true;
-	}
-	blk_queue_write_cache(q, wc, fua);
+	if (dm_table_supports_flush(t))
+		limits->features |= BLK_FEAT_WRITE_CACHE | BLK_FEAT_FUA;
 
 	if (dm_table_supports_dax(t, device_not_dax_capable)) {
 		blk_queue_flag_set(QUEUE_FLAG_DAX, q);
diff --git a/drivers/md/md.c b/drivers/md/md.c
index 67ece2cd725f50..2f4c5d1755d857 100644
--- a/drivers/md/md.c
+++ b/drivers/md/md.c
@@ -5785,7 +5785,10 @@ struct mddev *md_alloc(dev_t dev, char *name)
 	int partitioned;
 	int shift;
 	int unit;
-	int error ;
+	int error;
+	struct queue_limits lim = {
+		.features		= BLK_FEAT_WRITE_CACHE | BLK_FEAT_FUA,
+	};
 
 	/*
 	 * Wait for any previous instance of this device to be completely
@@ -5825,7 +5828,7 @@ struct mddev *md_alloc(dev_t dev, char *name)
 		 */
 		mddev->hold_active = UNTIL_STOP;
 
-	disk = blk_alloc_disk(NULL, NUMA_NO_NODE);
+	disk = blk_alloc_disk(&lim, NUMA_NO_NODE);
 	if (IS_ERR(disk)) {
 		error = PTR_ERR(disk);
 		goto out_free_mddev;
@@ -5843,7 +5846,6 @@ struct mddev *md_alloc(dev_t dev, char *name)
 	disk->fops = &md_fops;
 	disk->private_data = mddev;
 
-	blk_queue_write_cache(disk->queue, true, true);
 	disk->events |= DISK_EVENT_MEDIA_CHANGE;
 	mddev->gendisk = disk;
 	error = add_disk(disk);
diff --git a/drivers/mmc/core/block.c b/drivers/mmc/core/block.c
index 367509b5b6466c..2c9963248fcbd6 100644
--- a/drivers/mmc/core/block.c
+++ b/drivers/mmc/core/block.c
@@ -2466,8 +2466,7 @@ static struct mmc_blk_data *mmc_blk_alloc_req(struct mmc_card *card,
 	struct mmc_blk_data *md;
 	int devidx, ret;
 	char cap_str[10];
-	bool cache_enabled = false;
-	bool fua_enabled = false;
+	unsigned int features = 0;
 
 	devidx = ida_alloc_max(&mmc_blk_ida, max_devices - 1, GFP_KERNEL);
 	if (devidx < 0) {
@@ -2499,7 +2498,24 @@ static struct mmc_blk_data *mmc_blk_alloc_req(struct mmc_card *card,
 	 */
 	md->read_only = mmc_blk_readonly(card);
 
-	md->disk = mmc_init_queue(&md->queue, card);
+	if (mmc_host_cmd23(card->host)) {
+		if ((mmc_card_mmc(card) &&
+		     card->csd.mmca_vsn >= CSD_SPEC_VER_3) ||
+		    (mmc_card_sd(card) &&
+		     card->scr.cmds & SD_SCR_CMD23_SUPPORT))
+			md->flags |= MMC_BLK_CMD23;
+	}
+
+	if (md->flags & MMC_BLK_CMD23 &&
+	    ((card->ext_csd.rel_param & EXT_CSD_WR_REL_PARAM_EN) ||
+	     card->ext_csd.rel_sectors)) {
+		md->flags |= MMC_BLK_REL_WR;
+		features |= (BLK_FEAT_WRITE_CACHE | BLK_FEAT_FUA);
+	} else if (mmc_cache_enabled(card->host)) {
+		features |= BLK_FEAT_WRITE_CACHE;
+	}
+
+	md->disk = mmc_init_queue(&md->queue, card, features);
 	if (IS_ERR(md->disk)) {
 		ret = PTR_ERR(md->disk);
 		goto err_kfree;
@@ -2539,26 +2555,6 @@ static struct mmc_blk_data *mmc_blk_alloc_req(struct mmc_card *card,
 
 	set_capacity(md->disk, size);
 
-	if (mmc_host_cmd23(card->host)) {
-		if ((mmc_card_mmc(card) &&
-		     card->csd.mmca_vsn >= CSD_SPEC_VER_3) ||
-		    (mmc_card_sd(card) &&
-		     card->scr.cmds & SD_SCR_CMD23_SUPPORT))
-			md->flags |= MMC_BLK_CMD23;
-	}
-
-	if (md->flags & MMC_BLK_CMD23 &&
-	    ((card->ext_csd.rel_param & EXT_CSD_WR_REL_PARAM_EN) ||
-	     card->ext_csd.rel_sectors)) {
-		md->flags |= MMC_BLK_REL_WR;
-		fua_enabled = true;
-		cache_enabled = true;
-	}
-	if (mmc_cache_enabled(card->host))
-		cache_enabled  = true;
-
-	blk_queue_write_cache(md->queue.queue, cache_enabled, fua_enabled);
-
 	string_get_size((u64)size, 512, STRING_UNITS_2,
 			cap_str, sizeof(cap_str));
 	pr_info("%s: %s %s %s%s\n",
diff --git a/drivers/mmc/core/queue.c b/drivers/mmc/core/queue.c
index 241cdc2b2a2a3b..97ff993d31570c 100644
--- a/drivers/mmc/core/queue.c
+++ b/drivers/mmc/core/queue.c
@@ -344,10 +344,12 @@ static const struct blk_mq_ops mmc_mq_ops = {
 };
 
 static struct gendisk *mmc_alloc_disk(struct mmc_queue *mq,
-		struct mmc_card *card)
+		struct mmc_card *card, unsigned int features)
 {
 	struct mmc_host *host = card->host;
-	struct queue_limits lim = { };
+	struct queue_limits lim = {
+		.features		= features,
+	};
 	struct gendisk *disk;
 
 	if (mmc_can_erase(card))
@@ -413,10 +415,12 @@ static inline bool mmc_merge_capable(struct mmc_host *host)
  * mmc_init_queue - initialise a queue structure.
  * @mq: mmc queue
  * @card: mmc card to attach this queue
+ * @features: block layer features (BLK_FEAT_*)
  *
  * Initialise a MMC card request queue.
  */
-struct gendisk *mmc_init_queue(struct mmc_queue *mq, struct mmc_card *card)
+struct gendisk *mmc_init_queue(struct mmc_queue *mq, struct mmc_card *card,
+		unsigned int features)
 {
 	struct mmc_host *host = card->host;
 	struct gendisk *disk;
@@ -460,7 +464,7 @@ struct gendisk *mmc_init_queue(struct mmc_queue *mq, struct mmc_card *card)
 		return ERR_PTR(ret);
 		
 
-	disk = mmc_alloc_disk(mq, card);
+	disk = mmc_alloc_disk(mq, card, features);
 	if (IS_ERR(disk))
 		blk_mq_free_tag_set(&mq->tag_set);
 	return disk;
diff --git a/drivers/mmc/core/queue.h b/drivers/mmc/core/queue.h
index 9ade3bcbb714e4..1498840a4ea008 100644
--- a/drivers/mmc/core/queue.h
+++ b/drivers/mmc/core/queue.h
@@ -94,7 +94,8 @@ struct mmc_queue {
 	struct work_struct	complete_work;
 };
 
-struct gendisk *mmc_init_queue(struct mmc_queue *mq, struct mmc_card *card);
+struct gendisk *mmc_init_queue(struct mmc_queue *mq, struct mmc_card *card,
+		unsigned int features);
 extern void mmc_cleanup_queue(struct mmc_queue *);
 extern void mmc_queue_suspend(struct mmc_queue *);
 extern void mmc_queue_resume(struct mmc_queue *);
diff --git a/drivers/mtd/mtd_blkdevs.c b/drivers/mtd/mtd_blkdevs.c
index 3caa0717d46c01..1b9f57f231e8be 100644
--- a/drivers/mtd/mtd_blkdevs.c
+++ b/drivers/mtd/mtd_blkdevs.c
@@ -336,6 +336,8 @@ int add_mtd_blktrans_dev(struct mtd_blktrans_dev *new)
 	lim.logical_block_size = tr->blksize;
 	if (tr->discard)
 		lim.max_hw_discard_sectors = UINT_MAX;
+	if (tr->flush)
+		lim.features |= BLK_FEAT_WRITE_CACHE;
 
 	/* Create gendisk */
 	gd = blk_mq_alloc_disk(new->tag_set, &lim, new);
@@ -373,9 +375,6 @@ int add_mtd_blktrans_dev(struct mtd_blktrans_dev *new)
 	spin_lock_init(&new->queue_lock);
 	INIT_LIST_HEAD(&new->rq_list);
 
-	if (tr->flush)
-		blk_queue_write_cache(new->rq, true, false);
-
 	blk_queue_flag_set(QUEUE_FLAG_NONROT, new->rq);
 	blk_queue_flag_clear(QUEUE_FLAG_ADD_RANDOM, new->rq);
 
diff --git a/drivers/nvdimm/pmem.c b/drivers/nvdimm/pmem.c
index 598fe2e89bda45..aff818469c114c 100644
--- a/drivers/nvdimm/pmem.c
+++ b/drivers/nvdimm/pmem.c
@@ -455,6 +455,7 @@ static int pmem_attach_disk(struct device *dev,
 		.logical_block_size	= pmem_sector_size(ndns),
 		.physical_block_size	= PAGE_SIZE,
 		.max_hw_sectors		= UINT_MAX,
+		.features		= BLK_FEAT_WRITE_CACHE,
 	};
 	int nid = dev_to_node(dev), fua;
 	struct resource *res = &nsio->res;
@@ -495,6 +496,8 @@ static int pmem_attach_disk(struct device *dev,
 		dev_warn(dev, "unable to guarantee persistence of writes\n");
 		fua = 0;
 	}
+	if (fua)
+		lim.features |= BLK_FEAT_FUA;
 
 	if (!devm_request_mem_region(dev, res->start, resource_size(res),
 				dev_name(&ndns->dev))) {
@@ -543,7 +546,6 @@ static int pmem_attach_disk(struct device *dev,
 	}
 	pmem->virt_addr = addr;
 
-	blk_queue_write_cache(q, true, fua);
 	blk_queue_flag_set(QUEUE_FLAG_NONROT, q);
 	blk_queue_flag_set(QUEUE_FLAG_SYNCHRONOUS, q);
 	if (pmem->pfn_flags & PFN_MAP)
diff --git a/drivers/nvme/host/core.c b/drivers/nvme/host/core.c
index 5a673fa5cb2612..9fc5e36fe2e55e 100644
--- a/drivers/nvme/host/core.c
+++ b/drivers/nvme/host/core.c
@@ -2056,7 +2056,6 @@ static int nvme_update_ns_info_generic(struct nvme_ns *ns,
 static int nvme_update_ns_info_block(struct nvme_ns *ns,
 		struct nvme_ns_info *info)
 {
-	bool vwc = ns->ctrl->vwc & NVME_CTRL_VWC_PRESENT;
 	struct queue_limits lim;
 	struct nvme_id_ns_nvm *nvm = NULL;
 	struct nvme_zone_info zi = {};
@@ -2106,6 +2105,11 @@ static int nvme_update_ns_info_block(struct nvme_ns *ns,
 	    ns->head->ids.csi == NVME_CSI_ZNS)
 		nvme_update_zone_info(ns, &lim, &zi);
 
+	if (ns->ctrl->vwc & NVME_CTRL_VWC_PRESENT)
+		lim.features |= BLK_FEAT_WRITE_CACHE | BLK_FEAT_FUA;
+	else
+		lim.features &= ~(BLK_FEAT_WRITE_CACHE | BLK_FEAT_FUA);
+
 	/*
 	 * Register a metadata profile for PI, or the plain non-integrity NVMe
 	 * metadata masquerading as Type 0 if supported, otherwise reject block
@@ -2132,7 +2136,6 @@ static int nvme_update_ns_info_block(struct nvme_ns *ns,
 	if ((id->dlfeat & 0x7) == 0x1 && (id->dlfeat & (1 << 3)))
 		ns->head->features |= NVME_NS_DEAC;
 	set_disk_ro(ns->disk, nvme_ns_is_readonly(ns, info));
-	blk_queue_write_cache(ns->disk->queue, vwc, vwc);
 	set_bit(NVME_NS_READY, &ns->flags);
 	blk_mq_unfreeze_queue(ns->disk->queue);
 
diff --git a/drivers/nvme/host/multipath.c b/drivers/nvme/host/multipath.c
index 12c59db02539e5..3d0e23a0a4ddd8 100644
--- a/drivers/nvme/host/multipath.c
+++ b/drivers/nvme/host/multipath.c
@@ -521,7 +521,6 @@ static void nvme_requeue_work(struct work_struct *work)
 int nvme_mpath_alloc_disk(struct nvme_ctrl *ctrl, struct nvme_ns_head *head)
 {
 	struct queue_limits lim;
-	bool vwc = false;
 
 	mutex_init(&head->lock);
 	bio_list_init(&head->requeue_list);
@@ -562,11 +561,6 @@ int nvme_mpath_alloc_disk(struct nvme_ctrl *ctrl, struct nvme_ns_head *head)
 	if (ctrl->tagset->nr_maps > HCTX_TYPE_POLL &&
 	    ctrl->tagset->map[HCTX_TYPE_POLL].nr_queues)
 		blk_queue_flag_set(QUEUE_FLAG_POLL, head->disk->queue);
-
-	/* we need to propagate up the VMC settings */
-	if (ctrl->vwc & NVME_CTRL_VWC_PRESENT)
-		vwc = true;
-	blk_queue_write_cache(head->disk->queue, vwc, vwc);
 	return 0;
 }
 
diff --git a/drivers/scsi/sd.c b/drivers/scsi/sd.c
index 5bfed61c70db8f..8764ea14c9b881 100644
--- a/drivers/scsi/sd.c
+++ b/drivers/scsi/sd.c
@@ -120,17 +120,18 @@ static const char *sd_cache_types[] = {
 	"write back, no read (daft)"
 };
 
-static void sd_set_flush_flag(struct scsi_disk *sdkp)
+static void sd_set_flush_flag(struct scsi_disk *sdkp,
+		struct queue_limits *lim)
 {
-	bool wc = false, fua = false;
-
 	if (sdkp->WCE) {
-		wc = true;
+		lim->features |= BLK_FEAT_WRITE_CACHE;
 		if (sdkp->DPOFUA)
-			fua = true;
+			lim->features |= BLK_FEAT_FUA;
+		else
+			lim->features &= ~BLK_FEAT_FUA;
+	} else {
+		lim->features &= ~(BLK_FEAT_WRITE_CACHE | BLK_FEAT_FUA);
 	}
-
-	blk_queue_write_cache(sdkp->disk->queue, wc, fua);
 }
 
 static ssize_t
@@ -168,9 +169,18 @@ cache_type_store(struct device *dev, struct device_attribute *attr,
 	wce = (ct & 0x02) && !sdkp->write_prot ? 1 : 0;
 
 	if (sdkp->cache_override) {
+		struct queue_limits lim;
+
 		sdkp->WCE = wce;
 		sdkp->RCD = rcd;
-		sd_set_flush_flag(sdkp);
+
+		lim = queue_limits_start_update(sdkp->disk->queue);
+		sd_set_flush_flag(sdkp, &lim);
+		blk_mq_freeze_queue(sdkp->disk->queue);
+		ret = queue_limits_commit_update(sdkp->disk->queue, &lim);
+		blk_mq_unfreeze_queue(sdkp->disk->queue);
+		if (ret)
+			return ret;
 		return count;
 	}
 
@@ -3659,7 +3669,7 @@ static int sd_revalidate_disk(struct gendisk *disk)
 	 * We now have all cache related info, determine how we deal
 	 * with flush requests.
 	 */
-	sd_set_flush_flag(sdkp);
+	sd_set_flush_flag(sdkp, &lim);
 
 	/* Initial block count limit based on CDB TRANSFER LENGTH field size. */
 	dev_max = sdp->use_16_for_rw ? SD_MAX_XFER_BLOCKS : SD_DEF_XFER_BLOCKS;
diff --git a/include/linux/blkdev.h b/include/linux/blkdev.h
index c792d4d81e5fcc..4e8931a2c76b07 100644
--- a/include/linux/blkdev.h
+++ b/include/linux/blkdev.h
@@ -282,6 +282,28 @@ static inline bool blk_op_is_passthrough(blk_opf_t op)
 	return op == REQ_OP_DRV_IN || op == REQ_OP_DRV_OUT;
 }
 
+/* flags set by the driver in queue_limits.features */
+enum {
+	/* supports a a volatile write cache */
+	BLK_FEAT_WRITE_CACHE			= (1u << 0),
+
+	/* supports passing on the FUA bit */
+	BLK_FEAT_FUA				= (1u << 1),
+};
+
+/*
+ * Flags automatically inherited when stacking limits.
+ */
+#define BLK_FEAT_INHERIT_MASK \
+	(BLK_FEAT_WRITE_CACHE | BLK_FEAT_FUA)
+
+
+/* internal flags in queue_limits.flags */
+enum {
+	/* do not send FLUSH or FUA command despite advertised write cache */
+	BLK_FLAGS_WRITE_CACHE_DISABLED		= (1u << 31),
+};
+
 /*
  * BLK_BOUNCE_NONE:	never bounce (default)
  * BLK_BOUNCE_HIGH:	bounce all highmem pages
@@ -292,6 +314,8 @@ enum blk_bounce {
 };
 
 struct queue_limits {
+	unsigned int		features;
+	unsigned int		flags;
 	enum blk_bounce		bounce;
 	unsigned long		seg_boundary_mask;
 	unsigned long		virt_boundary_mask;
@@ -536,12 +560,9 @@ struct request_queue {
 #define QUEUE_FLAG_ADD_RANDOM	10	/* Contributes to random pool */
 #define QUEUE_FLAG_SYNCHRONOUS	11	/* always completes in submit context */
 #define QUEUE_FLAG_SAME_FORCE	12	/* force complete on same CPU */
-#define QUEUE_FLAG_HW_WC	13	/* Write back caching supported */
 #define QUEUE_FLAG_INIT_DONE	14	/* queue is initialized */
 #define QUEUE_FLAG_STABLE_WRITES 15	/* don't modify blks until WB is done */
 #define QUEUE_FLAG_POLL		16	/* IO polling enabled if set */
-#define QUEUE_FLAG_WC		17	/* Write back caching */
-#define QUEUE_FLAG_FUA		18	/* device supports FUA writes */
 #define QUEUE_FLAG_DAX		19	/* device supports DAX */
 #define QUEUE_FLAG_STATS	20	/* track IO start and completion times */
 #define QUEUE_FLAG_REGISTERED	22	/* queue has been registered to a disk */
@@ -951,7 +972,6 @@ void queue_limits_stack_bdev(struct queue_limits *t, struct block_device *bdev,
 		sector_t offset, const char *pfx);
 extern void blk_queue_update_dma_pad(struct request_queue *, unsigned int);
 extern void blk_queue_rq_timeout(struct request_queue *, unsigned int);
-extern void blk_queue_write_cache(struct request_queue *q, bool enabled, bool fua);
 
 struct blk_independent_access_ranges *
 disk_alloc_independent_access_ranges(struct gendisk *disk, int nr_ia_ranges);
@@ -1305,14 +1325,20 @@ static inline bool bdev_stable_writes(struct block_device *bdev)
 	return test_bit(QUEUE_FLAG_STABLE_WRITES, &q->queue_flags);
 }
 
+static inline bool blk_queue_write_cache(struct request_queue *q)
+{
+	return (q->limits.features & BLK_FEAT_WRITE_CACHE) &&
+		(q->limits.flags & BLK_FLAGS_WRITE_CACHE_DISABLED);
+}
+
 static inline bool bdev_write_cache(struct block_device *bdev)
 {
-	return test_bit(QUEUE_FLAG_WC, &bdev_get_queue(bdev)->queue_flags);
+	return blk_queue_write_cache(bdev_get_queue(bdev));
 }
 
 static inline bool bdev_fua(struct block_device *bdev)
 {
-	return test_bit(QUEUE_FLAG_FUA, &bdev_get_queue(bdev)->queue_flags);
+	return bdev_get_queue(bdev)->limits.features & BLK_FEAT_FUA;
 }
 
 static inline bool bdev_nowait(struct block_device *bdev)
-- 
2.43.0

