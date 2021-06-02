Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 46A9C39829B
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Jun 2021 09:06:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fw0SR3kNdz3fyH
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Jun 2021 17:06:31 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=CHpdvSdD;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=bombadil.srs.infradead.org (client-ip=2607:7c80:54:e::133;
 helo=bombadil.infradead.org;
 envelope-from=batv+e38fb55258da4e18a096+6492+infradead.org+hch@bombadil.srs.infradead.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=bombadil.20210309 header.b=CHpdvSdD; 
 dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fw0Dc0L2Sz3c5V
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Jun 2021 16:56:16 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=3eCT5ADUsi1wXGQC5ROk8G/iPsdy5HF5nCZ/CzuEH9g=; b=CHpdvSdDQx2S7VBfw36yFJIOKW
 u3raTq1dP6Gu10/PJ+IzNfdJsTGDfodiKpWnXSrAPsiiXAil4FixRR4LHQx/r2/2WajLehYqseurF
 +SXOVenwMIEvShMpPI3TV0igiPSTDc1jus2MS134mkHJE4fSKWXJgTMpWUETOWUQR+sQvpcZNrvGr
 ImONWbqeM3vG4waS2LyqljTVK2xihrO+4vFy94tUR5AZHm4zAb5VJXdTbeKyJ5b1ZyVapnUITJgc0
 rAK1o1WbLZZ2lIkx0tqU86DqYL3xaSap2ZyjXquU1Hz/pJyGXKGtlKYDaGKwU57VNJwF/m1NojREe
 Jk3wMbUQ==;
Received: from shol69.static.otenet.gr ([83.235.170.67] helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1loKnA-0026PT-6J; Wed, 02 Jun 2021 06:55:53 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Subject: [PATCH 26/30] ubi: use blk_mq_alloc_disk and blk_cleanup_disk
Date: Wed,  2 Jun 2021 09:53:41 +0300
Message-Id: <20210602065345.355274-27-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210602065345.355274-1-hch@lst.de>
References: <20210602065345.355274-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
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
Cc: Justin Sanders <justin@coraid.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Mike Snitzer <snitzer@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, virtualization@lists.linux-foundation.org,
 dm-devel@redhat.com, "Md. Haris Iqbal" <haris.iqbal@ionos.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Jack Wang <jinpu.wang@ionos.com>,
 Tim Waugh <tim@cyberelk.net>, linux-s390@vger.kernel.org,
 Alex Dubov <oakad@yahoo.com>, Richard Weinberger <richard@nod.at>,
 Christian Borntraeger <borntraeger@de.ibm.com>, xen-devel@lists.xenproject.org,
 Ilya Dryomov <idryomov@gmail.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Heiko Carstens <hca@linux.ibm.com>, Josef Bacik <josef@toxicpanda.com>,
 Denis Efremov <efremov@linux.com>, nbd@other.debian.org,
 linux-block@vger.kernel.org, ceph-devel@vger.kernel.org,
 Maxim Levitsky <maximlevitsky@gmail.com>, Geoff Levand <geoff@infradead.org>,
 linux-mmc@vger.kernel.org, linux-mtd@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Use blk_mq_alloc_disk and blk_cleanup_disk to simplify the gendisk and
request_queue allocation.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/mtd/ubi/block.c | 68 ++++++++++++++++++-----------------------
 1 file changed, 29 insertions(+), 39 deletions(-)

diff --git a/drivers/mtd/ubi/block.c b/drivers/mtd/ubi/block.c
index e1a2ae21dfd3..e003b4b44ffa 100644
--- a/drivers/mtd/ubi/block.c
+++ b/drivers/mtd/ubi/block.c
@@ -394,53 +394,46 @@ int ubiblock_create(struct ubi_volume_info *vi)
 	dev->vol_id = vi->vol_id;
 	dev->leb_size = vi->usable_leb_size;
 
+	dev->tag_set.ops = &ubiblock_mq_ops;
+	dev->tag_set.queue_depth = 64;
+	dev->tag_set.numa_node = NUMA_NO_NODE;
+	dev->tag_set.flags = BLK_MQ_F_SHOULD_MERGE;
+	dev->tag_set.cmd_size = sizeof(struct ubiblock_pdu);
+	dev->tag_set.driver_data = dev;
+	dev->tag_set.nr_hw_queues = 1;
+
+	ret = blk_mq_alloc_tag_set(&dev->tag_set);
+	if (ret) {
+		dev_err(disk_to_dev(dev->gd), "blk_mq_alloc_tag_set failed");
+		goto out_free_dev;;
+	}
+
+
 	/* Initialize the gendisk of this ubiblock device */
-	gd = alloc_disk(1);
-	if (!gd) {
-		pr_err("UBI: block: alloc_disk failed\n");
-		ret = -ENODEV;
-		goto out_free_dev;
+	gd = blk_mq_alloc_disk(&dev->tag_set, dev);
+	if (IS_ERR(gd)) {
+		ret = PTR_ERR(gd);
+		goto out_free_tags;
 	}
 
 	gd->fops = &ubiblock_ops;
 	gd->major = ubiblock_major;
+	gd->minors = 1;
 	gd->first_minor = idr_alloc(&ubiblock_minor_idr, dev, 0, 0, GFP_KERNEL);
 	if (gd->first_minor < 0) {
 		dev_err(disk_to_dev(gd),
 			"block: dynamic minor allocation failed");
 		ret = -ENODEV;
-		goto out_put_disk;
+		goto out_cleanup_disk;
 	}
 	gd->private_data = dev;
 	sprintf(gd->disk_name, "ubiblock%d_%d", dev->ubi_num, dev->vol_id);
 	set_capacity(gd, disk_capacity);
 	dev->gd = gd;
 
-	dev->tag_set.ops = &ubiblock_mq_ops;
-	dev->tag_set.queue_depth = 64;
-	dev->tag_set.numa_node = NUMA_NO_NODE;
-	dev->tag_set.flags = BLK_MQ_F_SHOULD_MERGE;
-	dev->tag_set.cmd_size = sizeof(struct ubiblock_pdu);
-	dev->tag_set.driver_data = dev;
-	dev->tag_set.nr_hw_queues = 1;
-
-	ret = blk_mq_alloc_tag_set(&dev->tag_set);
-	if (ret) {
-		dev_err(disk_to_dev(dev->gd), "blk_mq_alloc_tag_set failed");
-		goto out_remove_minor;
-	}
-
-	dev->rq = blk_mq_init_queue(&dev->tag_set);
-	if (IS_ERR(dev->rq)) {
-		dev_err(disk_to_dev(gd), "blk_mq_init_queue failed");
-		ret = PTR_ERR(dev->rq);
-		goto out_free_tags;
-	}
+	dev->rq = gd->queue;
 	blk_queue_max_segments(dev->rq, UBI_MAX_SG_COUNT);
 
-	dev->rq->queuedata = dev;
-	dev->gd->queue = dev->rq;
-
 	/*
 	 * Create one workqueue per volume (per registered block device).
 	 * Rembember workqueues are cheap, they're not threads.
@@ -448,7 +441,7 @@ int ubiblock_create(struct ubi_volume_info *vi)
 	dev->wq = alloc_workqueue("%s", 0, 0, gd->disk_name);
 	if (!dev->wq) {
 		ret = -ENOMEM;
-		goto out_free_queue;
+		goto out_remove_minor;
 	}
 
 	list_add_tail(&dev->list, &ubiblock_devices);
@@ -460,14 +453,12 @@ int ubiblock_create(struct ubi_volume_info *vi)
 	mutex_unlock(&devices_mutex);
 	return 0;
 
-out_free_queue:
-	blk_cleanup_queue(dev->rq);
-out_free_tags:
-	blk_mq_free_tag_set(&dev->tag_set);
 out_remove_minor:
 	idr_remove(&ubiblock_minor_idr, gd->first_minor);
-out_put_disk:
-	put_disk(dev->gd);
+out_cleanup_disk:
+	blk_cleanup_disk(dev->gd);
+out_free_tags:
+	blk_mq_free_tag_set(&dev->tag_set);
 out_free_dev:
 	kfree(dev);
 out_unlock:
@@ -483,11 +474,10 @@ static void ubiblock_cleanup(struct ubiblock *dev)
 	/* Flush pending work */
 	destroy_workqueue(dev->wq);
 	/* Finally destroy the blk queue */
-	blk_cleanup_queue(dev->rq);
-	blk_mq_free_tag_set(&dev->tag_set);
 	dev_info(disk_to_dev(dev->gd), "released");
+	blk_cleanup_disk(dev->gd);
+	blk_mq_free_tag_set(&dev->tag_set);
 	idr_remove(&ubiblock_minor_idr, dev->gd->first_minor);
-	put_disk(dev->gd);
 }
 
 int ubiblock_remove(struct ubi_volume_info *vi)
-- 
2.30.2

