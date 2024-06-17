Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C8A9390A55D
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Jun 2024 08:22:25 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=NJZCojfZ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W2ftk4Ylxz3dWb
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Jun 2024 16:22:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=NJZCojfZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=bombadil.srs.infradead.org (client-ip=2607:7c80:54:3::133; helo=bombadil.infradead.org; envelope-from=batv+625ba2f6da96caf54eae+7603+infradead.org+hch@bombadil.srs.infradead.org; receiver=lists.ozlabs.org)
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W2fY16ysjz3cVw
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Jun 2024 16:07:01 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=j3/q6++/T0UiysNKT6ebBR3awbgnCQMkBzrPFvHZKQg=; b=NJZCojfZFjIHjdeThEB5UEO5Nk
	QNC7VhBPWkRcqgkZKxl1pMve2IPbjVKHCTiWE0oKqZkGQr382Hsf+pdh3k2aOSBzxX8pT1Od1LR0p
	ULQFxibinwOrILLy4a8KYEfVWq/uqIsJQzmH/PwZ78+6OG82/CKXLijYXDFRpJ8c0KYO0YwHgQ9La
	K6+cfGf+zXrSVcf79qtnNY1fK2RQPhSPeFvB9iVrCfamm6IUC5lHWTbx3xeT4q/cfnpVGmpwMJfhK
	UzcfgZYbTigV2cdi9g61aNGRbJgATnWpjl0PbssfRrhfVySkFp+s2qp339sm8xlTjxogm8On27Zy6
	FTsiRxhA==;
Received: from [91.187.204.140] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJ5Vs-00000009J7N-36FO;
	Mon, 17 Jun 2024 06:06:45 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Subject: [PATCH 22/26] block: move the zoned flag into the features field
Date: Mon, 17 Jun 2024 08:04:49 +0200
Message-ID: <20240617060532.127975-23-hch@lst.de>
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

Move the zoned flags into the features field to reclaim a little
bit of space.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Damien Le Moal <dlemoal@kernel.org>
---
 block/blk-settings.c           |  5 ++---
 drivers/block/null_blk/zoned.c |  2 +-
 drivers/block/ublk_drv.c       |  2 +-
 drivers/block/virtio_blk.c     |  5 +++--
 drivers/md/dm-table.c          | 11 ++++++-----
 drivers/md/dm-zone.c           |  2 +-
 drivers/md/dm-zoned-target.c   |  2 +-
 drivers/nvme/host/zns.c        |  2 +-
 drivers/scsi/sd_zbc.c          |  2 +-
 include/linux/blkdev.h         |  9 ++++++---
 10 files changed, 23 insertions(+), 19 deletions(-)

diff --git a/block/blk-settings.c b/block/blk-settings.c
index 026ba68d829856..96e07f24bd9aa1 100644
--- a/block/blk-settings.c
+++ b/block/blk-settings.c
@@ -68,7 +68,7 @@ static void blk_apply_bdi_limits(struct backing_dev_info *bdi,
 
 static int blk_validate_zoned_limits(struct queue_limits *lim)
 {
-	if (!lim->zoned) {
+	if (!(lim->features & BLK_FEAT_ZONED)) {
 		if (WARN_ON_ONCE(lim->max_open_zones) ||
 		    WARN_ON_ONCE(lim->max_active_zones) ||
 		    WARN_ON_ONCE(lim->zone_write_granularity) ||
@@ -602,8 +602,7 @@ int blk_stack_limits(struct queue_limits *t, struct queue_limits *b,
 						   b->max_secure_erase_sectors);
 	t->zone_write_granularity = max(t->zone_write_granularity,
 					b->zone_write_granularity);
-	t->zoned = max(t->zoned, b->zoned);
-	if (!t->zoned) {
+	if (!(t->features & BLK_FEAT_ZONED)) {
 		t->zone_write_granularity = 0;
 		t->max_zone_append_sectors = 0;
 	}
diff --git a/drivers/block/null_blk/zoned.c b/drivers/block/null_blk/zoned.c
index f118d304f31080..ca8e739e76b981 100644
--- a/drivers/block/null_blk/zoned.c
+++ b/drivers/block/null_blk/zoned.c
@@ -158,7 +158,7 @@ int null_init_zoned_dev(struct nullb_device *dev,
 		sector += dev->zone_size_sects;
 	}
 
-	lim->zoned = true;
+	lim->features |= BLK_FEAT_ZONED;
 	lim->chunk_sectors = dev->zone_size_sects;
 	lim->max_zone_append_sectors = dev->zone_append_max_sectors;
 	lim->max_open_zones = dev->zone_max_open;
diff --git a/drivers/block/ublk_drv.c b/drivers/block/ublk_drv.c
index 4fcde099935868..69c16018cbb19a 100644
--- a/drivers/block/ublk_drv.c
+++ b/drivers/block/ublk_drv.c
@@ -2196,7 +2196,7 @@ static int ublk_ctrl_start_dev(struct ublk_device *ub, struct io_uring_cmd *cmd)
 		if (!IS_ENABLED(CONFIG_BLK_DEV_ZONED))
 			return -EOPNOTSUPP;
 
-		lim.zoned = true;
+		lim.features |= BLK_FEAT_ZONED;
 		lim.max_active_zones = p->max_active_zones;
 		lim.max_open_zones =  p->max_open_zones;
 		lim.max_zone_append_sectors = p->max_zone_append_sectors;
diff --git a/drivers/block/virtio_blk.c b/drivers/block/virtio_blk.c
index 13a2f24f176628..cea45b296f8bec 100644
--- a/drivers/block/virtio_blk.c
+++ b/drivers/block/virtio_blk.c
@@ -728,7 +728,7 @@ static int virtblk_read_zoned_limits(struct virtio_blk *vblk,
 
 	dev_dbg(&vdev->dev, "probing host-managed zoned device\n");
 
-	lim->zoned = true;
+	lim->features |= BLK_FEAT_ZONED;
 
 	virtio_cread(vdev, struct virtio_blk_config,
 		     zoned.max_open_zones, &v);
@@ -1546,7 +1546,8 @@ static int virtblk_probe(struct virtio_device *vdev)
 	 * All steps that follow use the VQs therefore they need to be
 	 * placed after the virtio_device_ready() call above.
 	 */
-	if (IS_ENABLED(CONFIG_BLK_DEV_ZONED) && lim.zoned) {
+	if (IS_ENABLED(CONFIG_BLK_DEV_ZONED) &&
+	    (lim.features & BLK_FEAT_ZONED)) {
 		blk_queue_flag_set(QUEUE_FLAG_ZONE_RESETALL, vblk->disk->queue);
 		err = blk_revalidate_disk_zones(vblk->disk);
 		if (err)
diff --git a/drivers/md/dm-table.c b/drivers/md/dm-table.c
index ca1f136575cff4..df6313c3fe6ba4 100644
--- a/drivers/md/dm-table.c
+++ b/drivers/md/dm-table.c
@@ -1605,12 +1605,12 @@ int dm_calculate_queue_limits(struct dm_table *t,
 		ti->type->iterate_devices(ti, dm_set_device_limits,
 					  &ti_limits);
 
-		if (!zoned && ti_limits.zoned) {
+		if (!zoned && (ti_limits.features & BLK_FEAT_ZONED)) {
 			/*
 			 * After stacking all limits, validate all devices
 			 * in table support this zoned model and zone sectors.
 			 */
-			zoned = ti_limits.zoned;
+			zoned = (ti_limits.features & BLK_FEAT_ZONED);
 			zone_sectors = ti_limits.chunk_sectors;
 		}
 
@@ -1658,12 +1658,12 @@ int dm_calculate_queue_limits(struct dm_table *t,
 	 *   zoned model on host-managed zoned block devices.
 	 * BUT...
 	 */
-	if (limits->zoned) {
+	if (limits->features & BLK_FEAT_ZONED) {
 		/*
 		 * ...IF the above limits stacking determined a zoned model
 		 * validate that all of the table's devices conform to it.
 		 */
-		zoned = limits->zoned;
+		zoned = limits->features & BLK_FEAT_ZONED;
 		zone_sectors = limits->chunk_sectors;
 	}
 	if (validate_hardware_zoned(t, zoned, zone_sectors))
@@ -1834,7 +1834,8 @@ int dm_table_set_restrictions(struct dm_table *t, struct request_queue *q,
 	 * For a zoned target, setup the zones related queue attributes
 	 * and resources necessary for zone append emulation if necessary.
 	 */
-	if (IS_ENABLED(CONFIG_BLK_DEV_ZONED) && limits->zoned) {
+	if (IS_ENABLED(CONFIG_BLK_DEV_ZONED) &&
+	    (limits->features & limits->features & BLK_FEAT_ZONED)) {
 		r = dm_set_zones_restrictions(t, q, limits);
 		if (r)
 			return r;
diff --git a/drivers/md/dm-zone.c b/drivers/md/dm-zone.c
index 5d66d916730efa..88d313229b43ff 100644
--- a/drivers/md/dm-zone.c
+++ b/drivers/md/dm-zone.c
@@ -263,7 +263,7 @@ int dm_set_zones_restrictions(struct dm_table *t, struct request_queue *q,
 	if (nr_conv_zones >= ret) {
 		lim->max_open_zones = 0;
 		lim->max_active_zones = 0;
-		lim->zoned = false;
+		lim->features &= ~BLK_FEAT_ZONED;
 		clear_bit(DMF_EMULATE_ZONE_APPEND, &md->flags);
 		disk->nr_zones = 0;
 		return 0;
diff --git a/drivers/md/dm-zoned-target.c b/drivers/md/dm-zoned-target.c
index 12236e6f46f39c..cd0ee144973f9f 100644
--- a/drivers/md/dm-zoned-target.c
+++ b/drivers/md/dm-zoned-target.c
@@ -1009,7 +1009,7 @@ static void dmz_io_hints(struct dm_target *ti, struct queue_limits *limits)
 	limits->max_sectors = chunk_sectors;
 
 	/* We are exposing a drive-managed zoned block device */
-	limits->zoned = false;
+	limits->features &= ~BLK_FEAT_ZONED;
 }
 
 /*
diff --git a/drivers/nvme/host/zns.c b/drivers/nvme/host/zns.c
index 77aa0f440a6d2a..06f2417aa50de7 100644
--- a/drivers/nvme/host/zns.c
+++ b/drivers/nvme/host/zns.c
@@ -108,7 +108,7 @@ int nvme_query_zone_info(struct nvme_ns *ns, unsigned lbaf,
 void nvme_update_zone_info(struct nvme_ns *ns, struct queue_limits *lim,
 		struct nvme_zone_info *zi)
 {
-	lim->zoned = 1;
+	lim->features |= BLK_FEAT_ZONED;
 	lim->max_open_zones = zi->max_open_zones;
 	lim->max_active_zones = zi->max_active_zones;
 	lim->max_zone_append_sectors = ns->ctrl->max_zone_append;
diff --git a/drivers/scsi/sd_zbc.c b/drivers/scsi/sd_zbc.c
index 360ec980499529..d3f84665946ec4 100644
--- a/drivers/scsi/sd_zbc.c
+++ b/drivers/scsi/sd_zbc.c
@@ -601,7 +601,7 @@ int sd_zbc_read_zones(struct scsi_disk *sdkp, struct queue_limits *lim,
 	if (sdkp->device->type != TYPE_ZBC)
 		return 0;
 
-	lim->zoned = true;
+	lim->features |= BLK_FEAT_ZONED;
 
 	/*
 	 * Per ZBC and ZAC specifications, writes in sequential write required
diff --git a/include/linux/blkdev.h b/include/linux/blkdev.h
index cd27b66cbacc00..bdc30c1fb1b57b 100644
--- a/include/linux/blkdev.h
+++ b/include/linux/blkdev.h
@@ -313,6 +313,9 @@ enum {
 
 	/* supports I/O polling */
 	BLK_FEAT_POLL				= (1u << 9),
+
+	/* is a zoned device */
+	BLK_FEAT_ZONED				= (1u << 10),
 };
 
 /*
@@ -320,7 +323,7 @@ enum {
  */
 #define BLK_FEAT_INHERIT_MASK \
 	(BLK_FEAT_WRITE_CACHE | BLK_FEAT_FUA | BLK_FEAT_ROTATIONAL | \
-	 BLK_FEAT_STABLE_WRITES)
+	 BLK_FEAT_STABLE_WRITES | BLK_FEAT_ZONED)
 
 /* internal flags in queue_limits.flags */
 enum {
@@ -372,7 +375,6 @@ struct queue_limits {
 	unsigned char		misaligned;
 	unsigned char		discard_misaligned;
 	unsigned char		raid_partial_stripes_expensive;
-	bool			zoned;
 	unsigned int		max_open_zones;
 	unsigned int		max_active_zones;
 
@@ -654,7 +656,8 @@ static inline enum rpm_status queue_rpm_status(struct request_queue *q)
 
 static inline bool blk_queue_is_zoned(struct request_queue *q)
 {
-	return IS_ENABLED(CONFIG_BLK_DEV_ZONED) && q->limits.zoned;
+	return IS_ENABLED(CONFIG_BLK_DEV_ZONED) &&
+		(q->limits.features & BLK_FEAT_ZONED);
 }
 
 #ifdef CONFIG_BLK_DEV_ZONED
-- 
2.43.0

