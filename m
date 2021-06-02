Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 29CBC398293
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Jun 2021 09:05:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fw0Qv3s1rz3ff8
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Jun 2021 17:05:11 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=tt3BlzEv;
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
 header.s=bombadil.20210309 header.b=tt3BlzEv; 
 dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fw0DN2z84z302y
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Jun 2021 16:56:04 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=5mJAZZeO1CtG3mn2Yuq3t9OP/z6HiPXlonifU+Xv8uk=; b=tt3BlzEvyR33jB2X0kDiZ5TSxB
 csELHSnmlT8T6KUWOPDXdz45J2xQyFQU19xaezbdVZgeUVrTi9u9ZPTPO6fqT1nm0qE2v7SVLycE9
 /MOWrjDcC/xYy6qBU13Znm79Ch9jRwtBbUtbfzUmR+I9pRspaNFEvyOXmYvNfXgWZsh0TdBvJLp4s
 /Fr3RVYTz9uY0FffL4ddTLGXqxR4LHnzHncqok0pz2PtYl2ZKi5VfjzMdqvx8SDrYpymOwhWqr6QX
 Z9xSFfPHVSbsRQooQMBqPIpILAv/Gx+wWjK7rLtRMYAMdC9wtpz/a7ziP04g4HcPFPbwAdib7nnbG
 Ptr9BkmA==;
Received: from shol69.static.otenet.gr ([83.235.170.67] helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1loKmx-0026Co-6G; Wed, 02 Jun 2021 06:55:40 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Subject: [PATCH 23/30] rnbd: use blk_mq_alloc_disk and blk_cleanup_disk
Date: Wed,  2 Jun 2021 09:53:38 +0300
Message-Id: <20210602065345.355274-24-hch@lst.de>
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
 drivers/block/rnbd/rnbd-clt.c | 35 ++++++++---------------------------
 1 file changed, 8 insertions(+), 27 deletions(-)

diff --git a/drivers/block/rnbd/rnbd-clt.c b/drivers/block/rnbd/rnbd-clt.c
index c604a402cd5c..f4fa45d24c0b 100644
--- a/drivers/block/rnbd/rnbd-clt.c
+++ b/drivers/block/rnbd/rnbd-clt.c
@@ -1353,18 +1353,6 @@ static void rnbd_init_mq_hw_queues(struct rnbd_clt_dev *dev)
 	}
 }
 
-static int setup_mq_dev(struct rnbd_clt_dev *dev)
-{
-	dev->queue = blk_mq_init_queue(&dev->sess->tag_set);
-	if (IS_ERR(dev->queue)) {
-		rnbd_clt_err(dev, "Initializing multiqueue queue failed, err: %ld\n",
-			      PTR_ERR(dev->queue));
-		return PTR_ERR(dev->queue);
-	}
-	rnbd_init_mq_hw_queues(dev);
-	return 0;
-}
-
 static void setup_request_queue(struct rnbd_clt_dev *dev)
 {
 	blk_queue_logical_block_size(dev->queue, dev->logical_block_size);
@@ -1393,13 +1381,13 @@ static void setup_request_queue(struct rnbd_clt_dev *dev)
 	blk_queue_io_opt(dev->queue, dev->sess->max_io_size);
 	blk_queue_virt_boundary(dev->queue, SZ_4K - 1);
 	blk_queue_write_cache(dev->queue, dev->wc, dev->fua);
-	dev->queue->queuedata = dev;
 }
 
 static void rnbd_clt_setup_gen_disk(struct rnbd_clt_dev *dev, int idx)
 {
 	dev->gd->major		= rnbd_client_major;
 	dev->gd->first_minor	= idx << RNBD_PART_BITS;
+	dev->gd->minors		= 1 << RNBD_PART_BITS;
 	dev->gd->fops		= &rnbd_client_ops;
 	dev->gd->queue		= dev->queue;
 	dev->gd->private_data	= dev;
@@ -1426,24 +1414,18 @@ static void rnbd_clt_setup_gen_disk(struct rnbd_clt_dev *dev, int idx)
 
 static int rnbd_client_setup_device(struct rnbd_clt_dev *dev)
 {
-	int err, idx = dev->clt_device_id;
+	int idx = dev->clt_device_id;
 
 	dev->size = dev->nsectors * dev->logical_block_size;
 
-	err = setup_mq_dev(dev);
-	if (err)
-		return err;
+	dev->gd = blk_mq_alloc_disk(&dev->sess->tag_set, dev);
+	if (IS_ERR(dev->gd))
+		return PTR_ERR(dev->gd);
+	dev->queue = dev->gd->queue;
+	rnbd_init_mq_hw_queues(dev);
 
 	setup_request_queue(dev);
-
-	dev->gd = alloc_disk_node(1 << RNBD_PART_BITS,	NUMA_NO_NODE);
-	if (!dev->gd) {
-		blk_cleanup_queue(dev->queue);
-		return -ENOMEM;
-	}
-
 	rnbd_clt_setup_gen_disk(dev, idx);
-
 	return 0;
 }
 
@@ -1650,8 +1632,7 @@ struct rnbd_clt_dev *rnbd_clt_map_device(const char *sessname,
 static void destroy_gen_disk(struct rnbd_clt_dev *dev)
 {
 	del_gendisk(dev->gd);
-	blk_cleanup_queue(dev->queue);
-	put_disk(dev->gd);
+	blk_cleanup_disk(dev->gd);
 }
 
 static void destroy_sysfs(struct rnbd_clt_dev *dev,
-- 
2.30.2

