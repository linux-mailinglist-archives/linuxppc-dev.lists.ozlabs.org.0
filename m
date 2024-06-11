Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CE974903164
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jun 2024 07:39:10 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4T9NMLhZ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VyyCY465Kz3cVk
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jun 2024 15:39:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4T9NMLhZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=bombadil.srs.infradead.org (client-ip=2607:7c80:54:3::133; helo=bombadil.infradead.org; envelope-from=batv+2fedbe304aabaf399917+7597+infradead.org+hch@bombadil.srs.infradead.org; receiver=lists.ozlabs.org)
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Vyxpw3qjbz3cVR
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Jun 2024 15:21:12 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=xY3slEHkiIq7NT2sGuMOxA8hJLcOIj4MfNseHu5TMns=; b=4T9NMLhZ85LGaZsJ9WbdPngt7y
	Lg47NyWbOusFuIcnPlTazNjFjWXkT5yAEsdF2Tng0oqqiQUya3UrgF3lv0cr8mioMxIZ95opUklxw
	3M1OWMNS18z5UDDHYnISdGZR4enIuBTfKqZeh9NEHC/wwn7yQffyG8jZyBMEHv7CUIPTauCM/4A4t
	uZ54Izj2QaXtkwLI0uaSn4JJf/3BR911bsG/t7tsxTYATIA0iybKQ85jYBhiCUPleyeGd+jL60ZaI
	wLfr7z+VuHHqSsgF7BQktz3lOGgIphJl2pF+e1sp4qBMFXL07QcuVEXmkU7DDi+7mFGg/G/7yUWm6
	lSBsjOfg==;
Received: from 2a02-8389-2341-5b80-cdb4-8e7d-405d-6b77.cable.dynamic.v6.surfer.at ([2a02:8389:2341:5b80:cdb4:8e7d:405d:6b77] helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGtwA-00000007RkZ-1jS3;
	Tue, 11 Jun 2024 05:20:58 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Subject: [PATCH 26/26] block: move the bounce flag into the feature field
Date: Tue, 11 Jun 2024 07:19:26 +0200
Message-ID: <20240611051929.513387-27-hch@lst.de>
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

Move the bounce field into the flags field to reclaim a little bit of
space.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 block/blk-settings.c    | 1 -
 block/blk.h             | 2 +-
 drivers/scsi/scsi_lib.c | 2 +-
 include/linux/blkdev.h  | 6 ++++--
 4 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/block/blk-settings.c b/block/blk-settings.c
index 96e07f24bd9aa1..d0e9096f93ca8a 100644
--- a/block/blk-settings.c
+++ b/block/blk-settings.c
@@ -479,7 +479,6 @@ int blk_stack_limits(struct queue_limits *t, struct queue_limits *b,
 					b->max_write_zeroes_sectors);
 	t->max_zone_append_sectors = min(queue_limits_max_zone_append_sectors(t),
 					 queue_limits_max_zone_append_sectors(b));
-	t->bounce = max(t->bounce, b->bounce);
 
 	t->seg_boundary_mask = min_not_zero(t->seg_boundary_mask,
 					    b->seg_boundary_mask);
diff --git a/block/blk.h b/block/blk.h
index 79e8d5d4fe0caf..fa32f7fad5d7e6 100644
--- a/block/blk.h
+++ b/block/blk.h
@@ -394,7 +394,7 @@ struct bio *__blk_queue_bounce(struct bio *bio, struct request_queue *q);
 static inline bool blk_queue_may_bounce(struct request_queue *q)
 {
 	return IS_ENABLED(CONFIG_BOUNCE) &&
-		q->limits.bounce == BLK_BOUNCE_HIGH &&
+		(q->limits.features & BLK_FEAT_BOUNCE_HIGH) &&
 		max_low_pfn >= max_pfn;
 }
 
diff --git a/drivers/scsi/scsi_lib.c b/drivers/scsi/scsi_lib.c
index 54f771ec8cfb5e..e2f7bfb2b9e450 100644
--- a/drivers/scsi/scsi_lib.c
+++ b/drivers/scsi/scsi_lib.c
@@ -1986,7 +1986,7 @@ void scsi_init_limits(struct Scsi_Host *shost, struct queue_limits *lim)
 		shost->dma_alignment, dma_get_cache_alignment() - 1);
 
 	if (shost->no_highmem)
-		lim->bounce = BLK_BOUNCE_HIGH;
+		lim->features |= BLK_FEAT_BOUNCE_HIGH;
 
 	dma_set_seg_boundary(dev, shost->dma_boundary);
 	dma_set_max_seg_size(dev, shost->max_segment_size);
diff --git a/include/linux/blkdev.h b/include/linux/blkdev.h
index d7ad25def6e50b..d1d9787e76ce73 100644
--- a/include/linux/blkdev.h
+++ b/include/linux/blkdev.h
@@ -325,6 +325,9 @@ enum {
 
 	/* skip this queue in blk_mq_(un)quiesce_tagset */
 	BLK_FEAT_SKIP_TAGSET_QUIESCE		= (1u << 13),
+
+	/* bounce all highmem pages */
+	BLK_FEAT_BOUNCE_HIGH			= (1u << 14),
 };
 
 /*
@@ -332,7 +335,7 @@ enum {
  */
 #define BLK_FEAT_INHERIT_MASK \
 	(BLK_FEAT_WRITE_CACHE | BLK_FEAT_FUA | BLK_FEAT_ROTATIONAL | \
-	 BLK_FEAT_STABLE_WRITES | BLK_FEAT_ZONED)
+	 BLK_FEAT_STABLE_WRITES | BLK_FEAT_ZONED | BLK_FEAT_BOUNCE_HIGH)
 
 /* internal flags in queue_limits.flags */
 enum {
@@ -352,7 +355,6 @@ enum blk_bounce {
 struct queue_limits {
 	unsigned int		features;
 	unsigned int		flags;
-	enum blk_bounce		bounce;
 	unsigned long		seg_boundary_mask;
 	unsigned long		virt_boundary_mask;
 
-- 
2.43.0

