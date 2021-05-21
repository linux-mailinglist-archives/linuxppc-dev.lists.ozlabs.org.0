Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CD19B38BED1
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 May 2021 08:02:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FmbcJ5zpGz3btT
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 May 2021 16:02:40 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=mGOHmtTF;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=bombadil.srs.infradead.org (client-ip=2607:7c80:54:e::133;
 helo=bombadil.infradead.org;
 envelope-from=batv+940d4f53d1157bf1ee93+6480+infradead.org+hch@bombadil.srs.infradead.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=bombadil.20210309 header.b=mGOHmtTF; 
 dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FmbNx5tYYz3c0B
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 May 2021 15:52:49 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=vwzRrqnpea2JzLkYN/ciWo6bEaO9vjxriaBTWz9O9v0=; b=mGOHmtTFt1HkH5saWkCJ6Krik4
 QCjaoftjpAqMFpQtK2V6/qUxHKbkX7aGYiA+qiiYGE59X9MW0Pavi8s9e+6a+cH8HPor/FKdBZzPd
 6m0LcmO4Z1cYjY2VW1343YLj1exXM0U8lmnrsnIL+00nYG9KArLBL8C1P72j6sExMxykJ/D2HMTnw
 /XnnP3t7fumskLi5zedrgRMHIxccxS2UTPh97p8jn3gpDyC9N64+n8LUAgx1jV3kAZD8xV3X72Hyh
 5N52QRiYKUQZAd/o5Pfw89OzyHoytLJ9yDIkMK3NjRxE8tc/AhBUTYtglscWoMZcNRbS/vclmC7vo
 cxW8fQjg==;
Received: from [2001:4bb8:180:5add:4fd7:4137:d2f2:46e6] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
 id 1ljy5H-00GqDA-1a; Fri, 21 May 2021 05:52:31 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Chris Zankel <chris@zankel.net>, Max Filippov <jcmvbkbc@gmail.com>,
 Philipp Reisner <philipp.reisner@linbit.com>,
 Lars Ellenberg <lars.ellenberg@linbit.com>, Jim Paris <jim@jtan.com>,
 Joshua Morris <josh.h.morris@us.ibm.com>,
 Philip Kelleher <pjk1939@linux.ibm.com>, Minchan Kim <minchan@kernel.org>,
 Nitin Gupta <ngupta@vflare.org>, Matias Bjorling <mb@lightnvm.io>,
 Coly Li <colyli@suse.de>, Mike Snitzer <snitzer@redhat.com>,
 Song Liu <song@kernel.org>, Maxim Levitsky <maximlevitsky@gmail.com>,
 Alex Dubov <oakad@yahoo.com>, Ulf Hansson <ulf.hansson@linaro.org>,
 Dan Williams <dan.j.williams@intel.com>,
 Vishal Verma <vishal.l.verma@intel.com>, Dave Jiang <dave.jiang@intel.com>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>
Subject: [PATCH 22/26] ps3vram: convert to blk_alloc_disk/blk_cleanup_disk
Date: Fri, 21 May 2021 07:51:12 +0200
Message-Id: <20210521055116.1053587-23-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210521055116.1053587-1-hch@lst.de>
References: <20210521055116.1053587-1-hch@lst.de>
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
Cc: linux-bcache@vger.kernel.org, linux-xtensa@linux-xtensa.org,
 linux-raid@vger.kernel.org, nvdimm@lists.linux.dev, linux-s390@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
 linux-nvme@lists.infradead.org, linux-block@vger.kernel.org,
 dm-devel@redhat.com, linuxppc-dev@lists.ozlabs.org, drbd-dev@lists.linbit.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Convert the ps3vram driver to use the blk_alloc_disk and blk_cleanup_disk
helpers to simplify gendisk and request_queue allocation.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/block/ps3vram.c | 31 ++++++++-----------------------
 1 file changed, 8 insertions(+), 23 deletions(-)

diff --git a/drivers/block/ps3vram.c b/drivers/block/ps3vram.c
index 1d738999fb69..7fbf469651c4 100644
--- a/drivers/block/ps3vram.c
+++ b/drivers/block/ps3vram.c
@@ -67,7 +67,6 @@ struct ps3vram_cache {
 };
 
 struct ps3vram_priv {
-	struct request_queue *queue;
 	struct gendisk *gendisk;
 
 	u64 size;
@@ -613,7 +612,6 @@ static int ps3vram_probe(struct ps3_system_bus_device *dev)
 {
 	struct ps3vram_priv *priv;
 	int error, status;
-	struct request_queue *queue;
 	struct gendisk *gendisk;
 	u64 ddr_size, ddr_lpar, ctrl_lpar, info_lpar, reports_lpar,
 	    reports_size, xdr_lpar;
@@ -736,33 +734,23 @@ static int ps3vram_probe(struct ps3_system_bus_device *dev)
 
 	ps3vram_proc_init(dev);
 
-	queue = blk_alloc_queue(NUMA_NO_NODE);
-	if (!queue) {
-		dev_err(&dev->core, "blk_alloc_queue failed\n");
-		error = -ENOMEM;
-		goto out_cache_cleanup;
-	}
-
-	priv->queue = queue;
-	blk_queue_max_segments(queue, BLK_MAX_SEGMENTS);
-	blk_queue_max_segment_size(queue, BLK_MAX_SEGMENT_SIZE);
-	blk_queue_max_hw_sectors(queue, BLK_SAFE_MAX_SECTORS);
-
-	gendisk = alloc_disk(1);
+	gendisk = blk_alloc_disk(NUMA_NO_NODE);
 	if (!gendisk) {
-		dev_err(&dev->core, "alloc_disk failed\n");
+		dev_err(&dev->core, "blk_alloc_disk failed\n");
 		error = -ENOMEM;
-		goto fail_cleanup_queue;
+		goto out_cache_cleanup;
 	}
 
 	priv->gendisk = gendisk;
 	gendisk->major = ps3vram_major;
-	gendisk->first_minor = 0;
+	gendisk->minors = 1;
 	gendisk->fops = &ps3vram_fops;
-	gendisk->queue = queue;
 	gendisk->private_data = dev;
 	strlcpy(gendisk->disk_name, DEVICE_NAME, sizeof(gendisk->disk_name));
 	set_capacity(gendisk, priv->size >> 9);
+	blk_queue_max_segments(gendisk->queue, BLK_MAX_SEGMENTS);
+	blk_queue_max_segment_size(gendisk->queue, BLK_MAX_SEGMENT_SIZE);
+	blk_queue_max_hw_sectors(gendisk->queue, BLK_SAFE_MAX_SECTORS);
 
 	dev_info(&dev->core, "%s: Using %llu MiB of GPU memory\n",
 		 gendisk->disk_name, get_capacity(gendisk) >> 11);
@@ -770,8 +758,6 @@ static int ps3vram_probe(struct ps3_system_bus_device *dev)
 	device_add_disk(&dev->core, gendisk, NULL);
 	return 0;
 
-fail_cleanup_queue:
-	blk_cleanup_queue(queue);
 out_cache_cleanup:
 	remove_proc_entry(DEVICE_NAME, NULL);
 	ps3vram_cache_cleanup(dev);
@@ -802,8 +788,7 @@ static void ps3vram_remove(struct ps3_system_bus_device *dev)
 	struct ps3vram_priv *priv = ps3_system_bus_get_drvdata(dev);
 
 	del_gendisk(priv->gendisk);
-	put_disk(priv->gendisk);
-	blk_cleanup_queue(priv->queue);
+	blk_cleanup_disk(priv->gendisk);
 	remove_proc_entry(DEVICE_NAME, NULL);
 	ps3vram_cache_cleanup(dev);
 	iounmap(priv->reports);
-- 
2.30.2

