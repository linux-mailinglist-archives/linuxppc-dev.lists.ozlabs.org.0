Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FBD6398292
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Jun 2021 09:04:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fw0QK6kPJz3bwS
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Jun 2021 17:04:41 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=njrsDfxS;
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
 header.s=bombadil.20210309 header.b=njrsDfxS; 
 dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fw0DG6Xf7z3c1Z
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Jun 2021 16:55:58 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=KHLITrhMPjuz4XYQlvLuyMQ6jhJjT1OoZPVERAs4yN8=; b=njrsDfxSfC2RA5qwJt2Gy1XMn7
 HMViANxKgA+mZa9oqtDL6Zln6j6l+rAT4dPLT9bnUbXsnsTaUQ0Zo+tgVqDNvAGXnfDkphiwKMj5x
 BrmkF9vTV9DOM9uH60akL46TTYkw9d/OlGWdsEyS5dZeuUHVkR/+D5uY8OBMz1zYKkYBE5WpfvDgG
 ycoy1/m6Ju0fMNbnbjt00eVfjn6eWdVzfPHvduRb/7SIu+tbYbfcP19f/+8wnLJPAKrRAtTgm/q9k
 vpFwkdSuotCuwgIKk3p5rYt00HK0RgsfLoLRKB1ml/qrcqSSpKjUq4ZUl1lZoAhTbkjqikESCazL2
 RLfCWW5Q==;
Received: from shol69.static.otenet.gr ([83.235.170.67] helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1loKms-00269K-Qr; Wed, 02 Jun 2021 06:55:35 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Subject: [PATCH 22/30] rbd: use blk_mq_alloc_disk and blk_cleanup_disk
Date: Wed,  2 Jun 2021 09:53:37 +0300
Message-Id: <20210602065345.355274-23-hch@lst.de>
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
 drivers/block/rbd.c | 52 ++++++++++++++++-----------------------------
 1 file changed, 18 insertions(+), 34 deletions(-)

diff --git a/drivers/block/rbd.c b/drivers/block/rbd.c
index bbb88eb009e0..531d390902dd 100644
--- a/drivers/block/rbd.c
+++ b/drivers/block/rbd.c
@@ -4750,9 +4750,8 @@ static blk_status_t rbd_queue_rq(struct blk_mq_hw_ctx *hctx,
 
 static void rbd_free_disk(struct rbd_device *rbd_dev)
 {
-	blk_cleanup_queue(rbd_dev->disk->queue);
+	blk_cleanup_disk(rbd_dev->disk);
 	blk_mq_free_tag_set(&rbd_dev->tag_set);
-	put_disk(rbd_dev->disk);
 	rbd_dev->disk = NULL;
 }
 
@@ -4922,22 +4921,6 @@ static int rbd_init_disk(struct rbd_device *rbd_dev)
 	    rbd_dev->layout.object_size * rbd_dev->layout.stripe_count;
 	int err;
 
-	/* create gendisk info */
-	disk = alloc_disk(single_major ?
-			  (1 << RBD_SINGLE_MAJOR_PART_SHIFT) :
-			  RBD_MINORS_PER_MAJOR);
-	if (!disk)
-		return -ENOMEM;
-
-	snprintf(disk->disk_name, sizeof(disk->disk_name), RBD_DRV_NAME "%d",
-		 rbd_dev->dev_id);
-	disk->major = rbd_dev->major;
-	disk->first_minor = rbd_dev->minor;
-	if (single_major)
-		disk->flags |= GENHD_FL_EXT_DEVT;
-	disk->fops = &rbd_bd_ops;
-	disk->private_data = rbd_dev;
-
 	memset(&rbd_dev->tag_set, 0, sizeof(rbd_dev->tag_set));
 	rbd_dev->tag_set.ops = &rbd_mq_ops;
 	rbd_dev->tag_set.queue_depth = rbd_dev->opts->queue_depth;
@@ -4948,13 +4931,26 @@ static int rbd_init_disk(struct rbd_device *rbd_dev)
 
 	err = blk_mq_alloc_tag_set(&rbd_dev->tag_set);
 	if (err)
-		goto out_disk;
+		return err;
 
-	q = blk_mq_init_queue(&rbd_dev->tag_set);
-	if (IS_ERR(q)) {
-		err = PTR_ERR(q);
+	disk = blk_mq_alloc_disk(&rbd_dev->tag_set, rbd_dev);
+	if (IS_ERR(disk)) {
+		err = PTR_ERR(disk);
 		goto out_tag_set;
 	}
+	q = disk->queue;
+
+	snprintf(disk->disk_name, sizeof(disk->disk_name), RBD_DRV_NAME "%d",
+		 rbd_dev->dev_id);
+	disk->major = rbd_dev->major;
+	disk->first_minor = rbd_dev->minor;
+	if (single_major) {
+		disk->minors = (1 << RBD_SINGLE_MAJOR_PART_SHIFT);
+		disk->flags |= GENHD_FL_EXT_DEVT;
+	} else {
+		disk->minors = RBD_MINORS_PER_MAJOR;
+	}
+	disk->fops = &rbd_bd_ops;
 
 	blk_queue_flag_set(QUEUE_FLAG_NONROT, q);
 	/* QUEUE_FLAG_ADD_RANDOM is off by default for blk-mq */
@@ -4976,21 +4972,11 @@ static int rbd_init_disk(struct rbd_device *rbd_dev)
 	if (!ceph_test_opt(rbd_dev->rbd_client->client, NOCRC))
 		blk_queue_flag_set(QUEUE_FLAG_STABLE_WRITES, q);
 
-	/*
-	 * disk_release() expects a queue ref from add_disk() and will
-	 * put it.  Hold an extra ref until add_disk() is called.
-	 */
-	WARN_ON(!blk_get_queue(q));
-	disk->queue = q;
-	q->queuedata = rbd_dev;
-
 	rbd_dev->disk = disk;
 
 	return 0;
 out_tag_set:
 	blk_mq_free_tag_set(&rbd_dev->tag_set);
-out_disk:
-	put_disk(disk);
 	return err;
 }
 
@@ -7088,8 +7074,6 @@ static ssize_t do_rbd_add(struct bus_type *bus,
 		goto err_out_image_lock;
 
 	device_add_disk(&rbd_dev->dev, rbd_dev->disk, NULL);
-	/* see rbd_init_disk() */
-	blk_put_queue(rbd_dev->disk->queue);
 
 	spin_lock(&rbd_dev_list_lock);
 	list_add_tail(&rbd_dev->node, &rbd_dev_list);
-- 
2.30.2

