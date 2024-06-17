Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 70FFB90A558
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Jun 2024 08:21:45 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Mw/amKwi;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W2fsy1sStz3dWV
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Jun 2024 16:21:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Mw/amKwi;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=bombadil.srs.infradead.org (client-ip=2607:7c80:54:3::133; helo=bombadil.infradead.org; envelope-from=batv+625ba2f6da96caf54eae+7603+infradead.org+hch@bombadil.srs.infradead.org; receiver=lists.ozlabs.org)
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W2fXy0Fy2z3cR3
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Jun 2024 16:06:58 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=XDMmYQEhqfxG2aJiRL/4ZYDAujH/dkiKXCLXQktKzVU=; b=Mw/amKwikts8mPqEzitq6S7gSt
	SqUiszPIuksF9x0en8yoe/G92F4AAVDiQml0cDIv/Bs4SWaYMa4ZjPmLHxhxZmae04xvteiFICg4q
	uFeMrOx1jCTsbVi93WFy17asl+ugvr0swUM7/onpistyMzuFHwhr67Tb4gAPx3xZEJxWeOFbhkyy0
	eDdqkSIQYDTyAvjjOdDfDOhG8hJrCetKbzdTk8hn5jTMBtvclvfbmsu6urUsWKk5lUJVNpJTt4bTA
	4t55FwPr4cOtwfysvFUJ3BFhJ4GHXOkytdQUNpzS2Mlt39fBxfePUyoTnd9rZjlIih0sPH3kMopQ8
	Hp4NGWUw==;
Received: from [91.187.204.140] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJ5Vp-00000009J4S-1rbZ;
	Mon, 17 Jun 2024 06:06:42 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Subject: [PATCH 21/26] block: move the poll flag to queue_limits
Date: Mon, 17 Jun 2024 08:04:48 +0200
Message-ID: <20240617060532.127975-22-hch@lst.de>
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
Cc: nvdimm@lists.linux.dev, "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, linux-nvme@lists.infradead.org, Song Liu <song@kernel.org>, linux-mtd@lists.infradead.org, Vineeth Vijayan <vneethv@linux.ibm.com>, Alasdair Kergon <agk@redhat.com>, drbd-dev@lists.linbit.com, linux-s390@vger.kernel.org, linux-scsi@vger.kernel.org, Richard Weinberger <richard@nod.at>, Geert Uytterhoeven <geert@linux-m68k.org>, Yu Kuai <yukuai3@huawei.com>, dm-devel@lists.linux.dev, linux-um@lists.infradead.org, Mike Snitzer <snitzer@kernel.org>, Josef Bacik <josef@toxicpanda.com>, nbd@other.debian.org, linux-raid@vger.kernel.org, linux-m68k@lists.linux-m68k.org, Damien Le Moal <dlemoal@kernel.org>, Mikulas Patocka <mpatocka@redhat.com>, xen-devel@lists.xenproject.org, ceph-devel@vger.kernel.org, Ming Lei <ming.lei@redhat.com>, linux-bcache@vger.kernel.org, linux-block@vger.kernel.org, "Martin K. Petersen" <martin.petersen@oracle.com>, linux-mmc@vger.kernel.org, Philipp Reisner <philipp.reisner@linbit.com>, =?UTF-8?q?Christoph=20B=C3=B6hmwalder?= <christoph.boehmwalder@linbit.com>, virtualization@lists.linux.dev, Lars Ellenberg <lars.ellenberg@linbit.com>, linuxppc-dev@lists.ozlabs.org, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Move the poll flag into the queue_limits feature field so that it can
be set atomically with the queue frozen.

Stacking drivers are simplified in that they now can simply set the
flag, and blk_stack_limits will clear it when the features is not
supported by any of the underlying devices.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Damien Le Moal <dlemoal@kernel.org>
---
 block/blk-core.c              |  5 ++--
 block/blk-mq-debugfs.c        |  1 -
 block/blk-mq.c                | 31 +++++++++++---------
 block/blk-settings.c          | 10 ++++---
 block/blk-sysfs.c             |  4 +--
 drivers/md/dm-table.c         | 54 +++++++++--------------------------
 drivers/nvme/host/multipath.c | 12 +-------
 include/linux/blkdev.h        |  4 ++-
 8 files changed, 45 insertions(+), 76 deletions(-)

diff --git a/block/blk-core.c b/block/blk-core.c
index 2b45a4df9a1aa1..8d9fbd353fc7fc 100644
--- a/block/blk-core.c
+++ b/block/blk-core.c
@@ -791,7 +791,7 @@ void submit_bio_noacct(struct bio *bio)
 		}
 	}
 
-	if (!test_bit(QUEUE_FLAG_POLL, &q->queue_flags))
+	if (!(q->limits.features & BLK_FEAT_POLL))
 		bio_clear_polled(bio);
 
 	switch (bio_op(bio)) {
@@ -915,8 +915,7 @@ int bio_poll(struct bio *bio, struct io_comp_batch *iob, unsigned int flags)
 		return 0;
 
 	q = bdev_get_queue(bdev);
-	if (cookie == BLK_QC_T_NONE ||
-	    !test_bit(QUEUE_FLAG_POLL, &q->queue_flags))
+	if (cookie == BLK_QC_T_NONE || !(q->limits.features & BLK_FEAT_POLL))
 		return 0;
 
 	blk_flush_plug(current->plug, false);
diff --git a/block/blk-mq-debugfs.c b/block/blk-mq-debugfs.c
index f4fa820251ce83..3a21527913840d 100644
--- a/block/blk-mq-debugfs.c
+++ b/block/blk-mq-debugfs.c
@@ -87,7 +87,6 @@ static const char *const blk_queue_flag_name[] = {
 	QUEUE_FLAG_NAME(NOXMERGES),
 	QUEUE_FLAG_NAME(SAME_FORCE),
 	QUEUE_FLAG_NAME(INIT_DONE),
-	QUEUE_FLAG_NAME(POLL),
 	QUEUE_FLAG_NAME(STATS),
 	QUEUE_FLAG_NAME(REGISTERED),
 	QUEUE_FLAG_NAME(QUIESCED),
diff --git a/block/blk-mq.c b/block/blk-mq.c
index 43235acc87505f..e2b9710ddc5ad1 100644
--- a/block/blk-mq.c
+++ b/block/blk-mq.c
@@ -4109,6 +4109,12 @@ void blk_mq_release(struct request_queue *q)
 	blk_mq_sysfs_deinit(q);
 }
 
+static bool blk_mq_can_poll(struct blk_mq_tag_set *set)
+{
+	return set->nr_maps > HCTX_TYPE_POLL &&
+		set->map[HCTX_TYPE_POLL].nr_queues;
+}
+
 struct request_queue *blk_mq_alloc_queue(struct blk_mq_tag_set *set,
 		struct queue_limits *lim, void *queuedata)
 {
@@ -4119,6 +4125,8 @@ struct request_queue *blk_mq_alloc_queue(struct blk_mq_tag_set *set,
 	if (!lim)
 		lim = &default_lim;
 	lim->features |= BLK_FEAT_IO_STAT | BLK_FEAT_NOWAIT;
+	if (blk_mq_can_poll(set))
+		lim->features |= BLK_FEAT_POLL;
 
 	q = blk_alloc_queue(lim, set->numa_node);
 	if (IS_ERR(q))
@@ -4273,17 +4281,6 @@ static void blk_mq_realloc_hw_ctxs(struct blk_mq_tag_set *set,
 	mutex_unlock(&q->sysfs_lock);
 }
 
-static void blk_mq_update_poll_flag(struct request_queue *q)
-{
-	struct blk_mq_tag_set *set = q->tag_set;
-
-	if (set->nr_maps > HCTX_TYPE_POLL &&
-	    set->map[HCTX_TYPE_POLL].nr_queues)
-		blk_queue_flag_set(QUEUE_FLAG_POLL, q);
-	else
-		blk_queue_flag_clear(QUEUE_FLAG_POLL, q);
-}
-
 int blk_mq_init_allocated_queue(struct blk_mq_tag_set *set,
 		struct request_queue *q)
 {
@@ -4311,7 +4308,6 @@ int blk_mq_init_allocated_queue(struct blk_mq_tag_set *set,
 	q->tag_set = set;
 
 	q->queue_flags |= QUEUE_FLAG_MQ_DEFAULT;
-	blk_mq_update_poll_flag(q);
 
 	INIT_DELAYED_WORK(&q->requeue_work, blk_mq_requeue_work);
 	INIT_LIST_HEAD(&q->flush_list);
@@ -4798,8 +4794,10 @@ static void __blk_mq_update_nr_hw_queues(struct blk_mq_tag_set *set,
 fallback:
 	blk_mq_update_queue_map(set);
 	list_for_each_entry(q, &set->tag_list, tag_set_list) {
+		struct queue_limits lim;
+
 		blk_mq_realloc_hw_ctxs(set, q);
-		blk_mq_update_poll_flag(q);
+
 		if (q->nr_hw_queues != set->nr_hw_queues) {
 			int i = prev_nr_hw_queues;
 
@@ -4811,6 +4809,13 @@ static void __blk_mq_update_nr_hw_queues(struct blk_mq_tag_set *set,
 			set->nr_hw_queues = prev_nr_hw_queues;
 			goto fallback;
 		}
+		lim = queue_limits_start_update(q);
+		if (blk_mq_can_poll(set))
+			lim.features |= BLK_FEAT_POLL;
+		else
+			lim.features &= ~BLK_FEAT_POLL;
+		if (queue_limits_commit_update(q, &lim) < 0)
+			pr_warn("updating the poll flag failed\n");
 		blk_mq_map_swqueue(q);
 	}
 
diff --git a/block/blk-settings.c b/block/blk-settings.c
index bf4622c19b5c09..026ba68d829856 100644
--- a/block/blk-settings.c
+++ b/block/blk-settings.c
@@ -460,13 +460,15 @@ int blk_stack_limits(struct queue_limits *t, struct queue_limits *b,
 	t->features |= (b->features & BLK_FEAT_INHERIT_MASK);
 
 	/*
-	 * BLK_FEAT_NOWAIT needs to be supported both by the stacking driver
-	 * and all underlying devices.  The stacking driver sets the flag
-	 * before stacking the limits, and this will clear the flag if any
-	 * of the underlying devices does not support it.
+	 * BLK_FEAT_NOWAIT and BLK_FEAT_POLL need to be supported both by the
+	 * stacking driver and all underlying devices.  The stacking driver sets
+	 * the flags before stacking the limits, and this will clear the flags
+	 * if any of the underlying devices does not support it.
 	 */
 	if (!(b->features & BLK_FEAT_NOWAIT))
 		t->features &= ~BLK_FEAT_NOWAIT;
+	if (!(b->features & BLK_FEAT_POLL))
+		t->features &= ~BLK_FEAT_POLL;
 
 	t->max_sectors = min_not_zero(t->max_sectors, b->max_sectors);
 	t->max_user_sectors = min_not_zero(t->max_user_sectors,
diff --git a/block/blk-sysfs.c b/block/blk-sysfs.c
index cde525724831ef..da4e96d686f91e 100644
--- a/block/blk-sysfs.c
+++ b/block/blk-sysfs.c
@@ -394,13 +394,13 @@ static ssize_t queue_poll_delay_store(struct request_queue *q, const char *page,
 
 static ssize_t queue_poll_show(struct request_queue *q, char *page)
 {
-	return queue_var_show(test_bit(QUEUE_FLAG_POLL, &q->queue_flags), page);
+	return queue_var_show(q->limits.features & BLK_FEAT_POLL, page);
 }
 
 static ssize_t queue_poll_store(struct request_queue *q, const char *page,
 				size_t count)
 {
-	if (!test_bit(QUEUE_FLAG_POLL, &q->queue_flags))
+	if (!(q->limits.features & BLK_FEAT_POLL))
 		return -EINVAL;
 	pr_info_ratelimited("writes to the poll attribute are ignored.\n");
 	pr_info_ratelimited("please use driver specific parameters instead.\n");
diff --git a/drivers/md/dm-table.c b/drivers/md/dm-table.c
index e44697037e86f4..ca1f136575cff4 100644
--- a/drivers/md/dm-table.c
+++ b/drivers/md/dm-table.c
@@ -582,7 +582,7 @@ int dm_split_args(int *argc, char ***argvp, char *input)
 static void dm_set_stacking_limits(struct queue_limits *limits)
 {
 	blk_set_stacking_limits(limits);
-	limits->features |= BLK_FEAT_IO_STAT | BLK_FEAT_NOWAIT;
+	limits->features |= BLK_FEAT_IO_STAT | BLK_FEAT_NOWAIT | BLK_FEAT_POLL;
 }
 
 /*
@@ -1024,14 +1024,13 @@ bool dm_table_request_based(struct dm_table *t)
 	return __table_type_request_based(dm_table_get_type(t));
 }
 
-static bool dm_table_supports_poll(struct dm_table *t);
-
 static int dm_table_alloc_md_mempools(struct dm_table *t, struct mapped_device *md)
 {
 	enum dm_queue_mode type = dm_table_get_type(t);
 	unsigned int per_io_data_size = 0, front_pad, io_front_pad;
 	unsigned int min_pool_size = 0, pool_size;
 	struct dm_md_mempools *pools;
+	unsigned int bioset_flags = 0;
 
 	if (unlikely(type == DM_TYPE_NONE)) {
 		DMERR("no table type is set, can't allocate mempools");
@@ -1048,6 +1047,9 @@ static int dm_table_alloc_md_mempools(struct dm_table *t, struct mapped_device *
 		goto init_bs;
 	}
 
+	if (md->queue->limits.features & BLK_FEAT_POLL)
+		bioset_flags |= BIOSET_PERCPU_CACHE;
+
 	for (unsigned int i = 0; i < t->num_targets; i++) {
 		struct dm_target *ti = dm_table_get_target(t, i);
 
@@ -1060,8 +1062,7 @@ static int dm_table_alloc_md_mempools(struct dm_table *t, struct mapped_device *
 
 	io_front_pad = roundup(per_io_data_size,
 		__alignof__(struct dm_io)) + DM_IO_BIO_OFFSET;
-	if (bioset_init(&pools->io_bs, pool_size, io_front_pad,
-			dm_table_supports_poll(t) ? BIOSET_PERCPU_CACHE : 0))
+	if (bioset_init(&pools->io_bs, pool_size, io_front_pad, bioset_flags))
 		goto out_free_pools;
 	if (t->integrity_supported &&
 	    bioset_integrity_create(&pools->io_bs, pool_size))
@@ -1404,14 +1405,6 @@ struct dm_target *dm_table_find_target(struct dm_table *t, sector_t sector)
 	return &t->targets[(KEYS_PER_NODE * n) + k];
 }
 
-static int device_not_poll_capable(struct dm_target *ti, struct dm_dev *dev,
-				   sector_t start, sector_t len, void *data)
-{
-	struct request_queue *q = bdev_get_queue(dev->bdev);
-
-	return !test_bit(QUEUE_FLAG_POLL, &q->queue_flags);
-}
-
 /*
  * type->iterate_devices() should be called when the sanity check needs to
  * iterate and check all underlying data devices. iterate_devices() will
@@ -1459,19 +1452,6 @@ static int count_device(struct dm_target *ti, struct dm_dev *dev,
 	return 0;
 }
 
-static bool dm_table_supports_poll(struct dm_table *t)
-{
-	for (unsigned int i = 0; i < t->num_targets; i++) {
-		struct dm_target *ti = dm_table_get_target(t, i);
-
-		if (!ti->type->iterate_devices ||
-		    ti->type->iterate_devices(ti, device_not_poll_capable, NULL))
-			return false;
-	}
-
-	return true;
-}
-
 /*
  * Check whether a table has no data devices attached using each
  * target's iterate_devices method.
@@ -1817,6 +1797,13 @@ int dm_table_set_restrictions(struct dm_table *t, struct request_queue *q,
 	if (!dm_table_supports_nowait(t))
 		limits->features &= ~BLK_FEAT_NOWAIT;
 
+	/*
+	 * The current polling impementation does not support request based
+	 * stacking.
+	 */
+	if (!__table_type_bio_based(t->type))
+		limits->features &= ~BLK_FEAT_POLL;
+
 	if (!dm_table_supports_discards(t)) {
 		limits->max_hw_discard_sectors = 0;
 		limits->discard_granularity = 0;
@@ -1858,21 +1845,6 @@ int dm_table_set_restrictions(struct dm_table *t, struct request_queue *q,
 		return r;
 
 	dm_update_crypto_profile(q, t);
-
-	/*
-	 * Check for request-based device is left to
-	 * dm_mq_init_request_queue()->blk_mq_init_allocated_queue().
-	 *
-	 * For bio-based device, only set QUEUE_FLAG_POLL when all
-	 * underlying devices supporting polling.
-	 */
-	if (__table_type_bio_based(t->type)) {
-		if (dm_table_supports_poll(t))
-			blk_queue_flag_set(QUEUE_FLAG_POLL, q);
-		else
-			blk_queue_flag_clear(QUEUE_FLAG_POLL, q);
-	}
-
 	return 0;
 }
 
diff --git a/drivers/nvme/host/multipath.c b/drivers/nvme/host/multipath.c
index 61a162c9cf4e6c..4933194d00e592 100644
--- a/drivers/nvme/host/multipath.c
+++ b/drivers/nvme/host/multipath.c
@@ -538,7 +538,7 @@ int nvme_mpath_alloc_disk(struct nvme_ctrl *ctrl, struct nvme_ns_head *head)
 
 	blk_set_stacking_limits(&lim);
 	lim.dma_alignment = 3;
-	lim.features |= BLK_FEAT_IO_STAT | BLK_FEAT_NOWAIT;
+	lim.features |= BLK_FEAT_IO_STAT | BLK_FEAT_NOWAIT | BLK_FEAT_POLL;
 	if (head->ids.csi != NVME_CSI_ZNS)
 		lim.max_zone_append_sectors = 0;
 
@@ -549,16 +549,6 @@ int nvme_mpath_alloc_disk(struct nvme_ctrl *ctrl, struct nvme_ns_head *head)
 	head->disk->private_data = head;
 	sprintf(head->disk->disk_name, "nvme%dn%d",
 			ctrl->subsys->instance, head->instance);
-
-	/*
-	 * This assumes all controllers that refer to a namespace either
-	 * support poll queues or not.  That is not a strict guarantee,
-	 * but if the assumption is wrong the effect is only suboptimal
-	 * performance but not correctness problem.
-	 */
-	if (ctrl->tagset->nr_maps > HCTX_TYPE_POLL &&
-	    ctrl->tagset->map[HCTX_TYPE_POLL].nr_queues)
-		blk_queue_flag_set(QUEUE_FLAG_POLL, head->disk->queue);
 	return 0;
 }
 
diff --git a/include/linux/blkdev.h b/include/linux/blkdev.h
index 7022e06a3dd9a3..cd27b66cbacc00 100644
--- a/include/linux/blkdev.h
+++ b/include/linux/blkdev.h
@@ -310,6 +310,9 @@ enum {
 
 	/* supports DAX */
 	BLK_FEAT_DAX				= (1u << 8),
+
+	/* supports I/O polling */
+	BLK_FEAT_POLL				= (1u << 9),
 };
 
 /*
@@ -577,7 +580,6 @@ struct request_queue {
 #define QUEUE_FLAG_NOXMERGES	9	/* No extended merges */
 #define QUEUE_FLAG_SAME_FORCE	12	/* force complete on same CPU */
 #define QUEUE_FLAG_INIT_DONE	14	/* queue is initialized */
-#define QUEUE_FLAG_POLL		16	/* IO polling enabled if set */
 #define QUEUE_FLAG_STATS	20	/* track IO start and completion times */
 #define QUEUE_FLAG_REGISTERED	22	/* queue has been registered to a disk */
 #define QUEUE_FLAG_QUIESCED	24	/* queue has been quiesced */
-- 
2.43.0

