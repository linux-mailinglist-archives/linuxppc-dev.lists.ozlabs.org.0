Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1710790A532
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Jun 2024 08:18:07 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=hOOD1FUE;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W2fnl6HhQz3dBy
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Jun 2024 16:18:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=hOOD1FUE;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=bombadil.srs.infradead.org (client-ip=2607:7c80:54:3::133; helo=bombadil.infradead.org; envelope-from=batv+625ba2f6da96caf54eae+7603+infradead.org+hch@bombadil.srs.infradead.org; receiver=lists.ozlabs.org)
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W2fXh3wKzz3cW4
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Jun 2024 16:06:44 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=IGFuRNJe3zSieqxGyxM6PYAJhOBv/hR1F0ZI4UGAMCk=; b=hOOD1FUEkKABhqQfeW6yEt2Z9t
	1gZluRT8ki+NtUsLsGFCguf4ieQVV25DGxIDtaoF0oOgqPyx30rGJAooHoaEP5p0Tj7WeqkBunq3m
	RkpJhnN7p9TaiO1R/y7mD0hgyqdXhiMvdLv9NnDQbuE8qNW4813zVzamRdIVFk7+ruGsDA3kOSuAI
	DJ0BXWEYRize7AyGdIqI/M2j1wLSQ3h/4XXEeuNpQ+C6goC0Cef7BGa1mi7HxrarciYQth5UZKECl
	S8tvHyXG3+8gOwRcgdvfVVTgT7Stlw3CEzfR585WUfCCyIWxA+56GT15fZU0qnKBDczDisvPBOUMI
	nfyxjK1w==;
Received: from [91.187.204.140] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJ5VY-00000009Ioc-0t7t;
	Mon, 17 Jun 2024 06:06:25 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Subject: [PATCH 16/26] block: move the io_stat flag setting to queue_limits
Date: Mon, 17 Jun 2024 08:04:43 +0200
Message-ID: <20240617060532.127975-17-hch@lst.de>
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

Move the io_stat flag into the queue_limits feature field so that it can
be set atomically with the queue frozen.

Simplify md and dm to set the flag unconditionally instead of avoiding
setting a simple flag for cases where it already is set by other means,
which is a bit pointless.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 block/blk-mq-debugfs.c        |  1 -
 block/blk-mq.c                |  6 +++++-
 block/blk-sysfs.c             |  2 +-
 drivers/md/dm-table.c         | 12 +++++++++---
 drivers/md/dm.c               | 13 +++----------
 drivers/md/md.c               |  5 ++---
 drivers/nvme/host/multipath.c |  2 +-
 include/linux/blkdev.h        |  9 +++++----
 8 files changed, 26 insertions(+), 24 deletions(-)

diff --git a/block/blk-mq-debugfs.c b/block/blk-mq-debugfs.c
index 6b7edb50bfd3fa..cbe99444ed1a54 100644
--- a/block/blk-mq-debugfs.c
+++ b/block/blk-mq-debugfs.c
@@ -84,7 +84,6 @@ static const char *const blk_queue_flag_name[] = {
 	QUEUE_FLAG_NAME(NOMERGES),
 	QUEUE_FLAG_NAME(SAME_COMP),
 	QUEUE_FLAG_NAME(FAIL_IO),
-	QUEUE_FLAG_NAME(IO_STAT),
 	QUEUE_FLAG_NAME(NOXMERGES),
 	QUEUE_FLAG_NAME(SYNCHRONOUS),
 	QUEUE_FLAG_NAME(SAME_FORCE),
diff --git a/block/blk-mq.c b/block/blk-mq.c
index 58b0d6c7cc34d6..cf67dc13f7dd4c 100644
--- a/block/blk-mq.c
+++ b/block/blk-mq.c
@@ -4116,7 +4116,11 @@ struct request_queue *blk_mq_alloc_queue(struct blk_mq_tag_set *set,
 	struct request_queue *q;
 	int ret;
 
-	q = blk_alloc_queue(lim ? lim : &default_lim, set->numa_node);
+	if (!lim)
+		lim = &default_lim;
+	lim->features |= BLK_FEAT_IO_STAT;
+
+	q = blk_alloc_queue(lim, set->numa_node);
 	if (IS_ERR(q))
 		return q;
 	q->queuedata = queuedata;
diff --git a/block/blk-sysfs.c b/block/blk-sysfs.c
index 9174aca3b85526..6f58530fb3c08e 100644
--- a/block/blk-sysfs.c
+++ b/block/blk-sysfs.c
@@ -324,7 +324,7 @@ queue_##name##_store(struct request_queue *q, const char *page, size_t count) \
 
 QUEUE_SYSFS_FEATURE(rotational, BLK_FEAT_ROTATIONAL)
 QUEUE_SYSFS_FEATURE(add_random, BLK_FEAT_ADD_RANDOM)
-QUEUE_SYSFS_BIT_FNS(iostats, IO_STAT, 0);
+QUEUE_SYSFS_FEATURE(iostats, BLK_FEAT_IO_STAT)
 QUEUE_SYSFS_BIT_FNS(stable_writes, STABLE_WRITES, 0);
 #undef QUEUE_SYSFS_BIT_FNS
 
diff --git a/drivers/md/dm-table.c b/drivers/md/dm-table.c
index 0a3838e45affd4..5d5431e531aea9 100644
--- a/drivers/md/dm-table.c
+++ b/drivers/md/dm-table.c
@@ -579,6 +579,12 @@ int dm_split_args(int *argc, char ***argvp, char *input)
 	return 0;
 }
 
+static void dm_set_stacking_limits(struct queue_limits *limits)
+{
+	blk_set_stacking_limits(limits);
+	limits->features |= BLK_FEAT_IO_STAT;
+}
+
 /*
  * Impose necessary and sufficient conditions on a devices's table such
  * that any incoming bio which respects its logical_block_size can be
@@ -617,7 +623,7 @@ static int validate_hardware_logical_block_alignment(struct dm_table *t,
 	for (i = 0; i < t->num_targets; i++) {
 		ti = dm_table_get_target(t, i);
 
-		blk_set_stacking_limits(&ti_limits);
+		dm_set_stacking_limits(&ti_limits);
 
 		/* combine all target devices' limits */
 		if (ti->type->iterate_devices)
@@ -1591,7 +1597,7 @@ int dm_calculate_queue_limits(struct dm_table *t,
 	unsigned int zone_sectors = 0;
 	bool zoned = false;
 
-	blk_set_stacking_limits(limits);
+	dm_set_stacking_limits(limits);
 
 	t->integrity_supported = true;
 	for (unsigned int i = 0; i < t->num_targets; i++) {
@@ -1604,7 +1610,7 @@ int dm_calculate_queue_limits(struct dm_table *t,
 	for (unsigned int i = 0; i < t->num_targets; i++) {
 		struct dm_target *ti = dm_table_get_target(t, i);
 
-		blk_set_stacking_limits(&ti_limits);
+		dm_set_stacking_limits(&ti_limits);
 
 		if (!ti->type->iterate_devices) {
 			/* Set I/O hints portion of queue limits */
diff --git a/drivers/md/dm.c b/drivers/md/dm.c
index 13037d6a6f62a2..8a976cee448bed 100644
--- a/drivers/md/dm.c
+++ b/drivers/md/dm.c
@@ -2386,22 +2386,15 @@ int dm_setup_md_queue(struct mapped_device *md, struct dm_table *t)
 	struct table_device *td;
 	int r;
 
-	switch (type) {
-	case DM_TYPE_REQUEST_BASED:
+	WARN_ON_ONCE(type == DM_TYPE_NONE);
+
+	if (type == DM_TYPE_REQUEST_BASED) {
 		md->disk->fops = &dm_rq_blk_dops;
 		r = dm_mq_init_request_queue(md, t);
 		if (r) {
 			DMERR("Cannot initialize queue for request-based dm mapped device");
 			return r;
 		}
-		break;
-	case DM_TYPE_BIO_BASED:
-	case DM_TYPE_DAX_BIO_BASED:
-		blk_queue_flag_set(QUEUE_FLAG_IO_STAT, md->queue);
-		break;
-	case DM_TYPE_NONE:
-		WARN_ON_ONCE(true);
-		break;
 	}
 
 	r = dm_calculate_queue_limits(t, &limits);
diff --git a/drivers/md/md.c b/drivers/md/md.c
index c23423c51fb7c2..8db0db8d5a27ac 100644
--- a/drivers/md/md.c
+++ b/drivers/md/md.c
@@ -5787,7 +5787,8 @@ struct mddev *md_alloc(dev_t dev, char *name)
 	int unit;
 	int error;
 	struct queue_limits lim = {
-		.features		= BLK_FEAT_WRITE_CACHE | BLK_FEAT_FUA,
+		.features		= BLK_FEAT_WRITE_CACHE | BLK_FEAT_FUA |
+					  BLK_FEAT_IO_STAT,
 	};
 
 	/*
@@ -6152,8 +6153,6 @@ int md_run(struct mddev *mddev)
 	if (!mddev_is_dm(mddev)) {
 		struct request_queue *q = mddev->gendisk->queue;
 
-		blk_queue_flag_set(QUEUE_FLAG_IO_STAT, q);
-
 		/* Set the NOWAIT flags if all underlying devices support it */
 		if (nowait)
 			blk_queue_flag_set(QUEUE_FLAG_NOWAIT, q);
diff --git a/drivers/nvme/host/multipath.c b/drivers/nvme/host/multipath.c
index 58c13304e558e0..eea727cfa9e67d 100644
--- a/drivers/nvme/host/multipath.c
+++ b/drivers/nvme/host/multipath.c
@@ -538,6 +538,7 @@ int nvme_mpath_alloc_disk(struct nvme_ctrl *ctrl, struct nvme_ns_head *head)
 
 	blk_set_stacking_limits(&lim);
 	lim.dma_alignment = 3;
+	lim.features |= BLK_FEAT_IO_STAT;
 	if (head->ids.csi != NVME_CSI_ZNS)
 		lim.max_zone_append_sectors = 0;
 
@@ -550,7 +551,6 @@ int nvme_mpath_alloc_disk(struct nvme_ctrl *ctrl, struct nvme_ns_head *head)
 			ctrl->subsys->instance, head->instance);
 
 	blk_queue_flag_set(QUEUE_FLAG_NOWAIT, head->disk->queue);
-	blk_queue_flag_set(QUEUE_FLAG_IO_STAT, head->disk->queue);
 	/*
 	 * This assumes all controllers that refer to a namespace either
 	 * support poll queues or not.  That is not a strict guarantee,
diff --git a/include/linux/blkdev.h b/include/linux/blkdev.h
index cf1bbf566b2bcd..5fafb2f95fd1a3 100644
--- a/include/linux/blkdev.h
+++ b/include/linux/blkdev.h
@@ -295,6 +295,9 @@ enum {
 
 	/* contributes to the random number pool */
 	BLK_FEAT_ADD_RANDOM			= (1u << 3),
+
+	/* do disk/partitions IO accounting */
+	BLK_FEAT_IO_STAT			= (1u << 4),
 };
 
 /*
@@ -558,7 +561,6 @@ struct request_queue {
 #define QUEUE_FLAG_NOMERGES     3	/* disable merge attempts */
 #define QUEUE_FLAG_SAME_COMP	4	/* complete on same CPU-group */
 #define QUEUE_FLAG_FAIL_IO	5	/* fake timeout */
-#define QUEUE_FLAG_IO_STAT	7	/* do disk/partitions IO accounting */
 #define QUEUE_FLAG_NOXMERGES	9	/* No extended merges */
 #define QUEUE_FLAG_SYNCHRONOUS	11	/* always completes in submit context */
 #define QUEUE_FLAG_SAME_FORCE	12	/* force complete on same CPU */
@@ -577,8 +579,7 @@ struct request_queue {
 #define QUEUE_FLAG_SQ_SCHED     30	/* single queue style io dispatch */
 #define QUEUE_FLAG_SKIP_TAGSET_QUIESCE	31 /* quiesce_tagset skip the queue*/
 
-#define QUEUE_FLAG_MQ_DEFAULT	((1UL << QUEUE_FLAG_IO_STAT) |		\
-				 (1UL << QUEUE_FLAG_SAME_COMP) |	\
+#define QUEUE_FLAG_MQ_DEFAULT	((1UL << QUEUE_FLAG_SAME_COMP) |	\
 				 (1UL << QUEUE_FLAG_NOWAIT))
 
 void blk_queue_flag_set(unsigned int flag, struct request_queue *q);
@@ -592,7 +593,7 @@ bool blk_queue_flag_test_and_set(unsigned int flag, struct request_queue *q);
 #define blk_queue_noxmerges(q)	\
 	test_bit(QUEUE_FLAG_NOXMERGES, &(q)->queue_flags)
 #define blk_queue_nonrot(q)	((q)->limits.features & BLK_FEAT_ROTATIONAL)
-#define blk_queue_io_stat(q)	test_bit(QUEUE_FLAG_IO_STAT, &(q)->queue_flags)
+#define blk_queue_io_stat(q)	((q)->limits.features & BLK_FEAT_IO_STAT)
 #define blk_queue_zone_resetall(q)	\
 	test_bit(QUEUE_FLAG_ZONE_RESETALL, &(q)->queue_flags)
 #define blk_queue_dax(q)	test_bit(QUEUE_FLAG_DAX, &(q)->queue_flags)
-- 
2.43.0

