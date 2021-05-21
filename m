Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6094338BEB9
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 May 2021 07:55:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FmbRr1zGKz3c4G
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 May 2021 15:55:20 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=kksAmQHb;
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
 header.s=bombadil.20210309 header.b=kksAmQHb; 
 dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FmbMz2W9Tz2yyv
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 May 2021 15:51:59 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=eOlz1qM9qw/aIGBFa4rzX7SXrGNedyjpAjODm9oW3lQ=; b=kksAmQHbyRFQuQH7kmwyfQu1Vv
 bK5ZSER2Ln0Ily3zW8j2GL6EPIW2K2hTp26Nde3bZMv730R2jiDZRbe+hA87ElpTfHVV9ms36iExc
 1qNHtjU5nrE5iVIm7yb4+nsmxTIezJv/fvhzmiATTwuSIt0ROjxhmXRFohB2/HnVANbrmBinhGomI
 1+sIep9AvXRC8xHaisOZhQI+X5m5gaK8CfeFPrcB8bc+exYy/lJR9nISPUC115SqDsfB90BHTe10J
 Q1Sa0Y04Ek3nn7QYpdDGFbKehhz9NcYifOmBix0jihHrzpRD7AL3hiqKYhcji43iHO+Ivbv229F6c
 gTdnYmzw==;
Received: from [2001:4bb8:180:5add:4fd7:4137:d2f2:46e6] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
 id 1ljy4Q-00GpyP-7l; Fri, 21 May 2021 05:51:38 +0000
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
Subject: [PATCH 06/26] brd: convert to blk_alloc_disk/blk_cleanup_disk
Date: Fri, 21 May 2021 07:50:56 +0200
Message-Id: <20210521055116.1053587-7-hch@lst.de>
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

Convert the brd driver to use the blk_alloc_disk and blk_cleanup_disk
helpers to simplify gendisk and request_queue allocation.  This also
allows to remove the request_queue pointer in struct request_queue,
and to simplify the initialization as blk_cleanup_disk can be called
on any disk returned from blk_alloc_disk.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/block/brd.c | 94 ++++++++++++++++-----------------------------
 1 file changed, 33 insertions(+), 61 deletions(-)

diff --git a/drivers/block/brd.c b/drivers/block/brd.c
index 7562cf30b14e..95694113e38e 100644
--- a/drivers/block/brd.c
+++ b/drivers/block/brd.c
@@ -38,9 +38,7 @@
  * device).
  */
 struct brd_device {
-	int		brd_number;
-
-	struct request_queue	*brd_queue;
+	int			brd_number;
 	struct gendisk		*brd_disk;
 	struct list_head	brd_list;
 
@@ -372,7 +370,7 @@ static LIST_HEAD(brd_devices);
 static DEFINE_MUTEX(brd_devices_mutex);
 static struct dentry *brd_debugfs_dir;
 
-static struct brd_device *brd_alloc(int i)
+static int brd_alloc(int i)
 {
 	struct brd_device *brd;
 	struct gendisk *disk;
@@ -380,64 +378,55 @@ static struct brd_device *brd_alloc(int i)
 
 	brd = kzalloc(sizeof(*brd), GFP_KERNEL);
 	if (!brd)
-		goto out;
+		return -ENOMEM;
 	brd->brd_number		= i;
 	spin_lock_init(&brd->brd_lock);
 	INIT_RADIX_TREE(&brd->brd_pages, GFP_ATOMIC);
 
-	brd->brd_queue = blk_alloc_queue(NUMA_NO_NODE);
-	if (!brd->brd_queue)
-		goto out_free_dev;
-
 	snprintf(buf, DISK_NAME_LEN, "ram%d", i);
 	if (!IS_ERR_OR_NULL(brd_debugfs_dir))
 		debugfs_create_u64(buf, 0444, brd_debugfs_dir,
 				&brd->brd_nr_pages);
 
-	/* This is so fdisk will align partitions on 4k, because of
-	 * direct_access API needing 4k alignment, returning a PFN
-	 * (This is only a problem on very small devices <= 4M,
-	 *  otherwise fdisk will align on 1M. Regardless this call
-	 *  is harmless)
-	 */
-	blk_queue_physical_block_size(brd->brd_queue, PAGE_SIZE);
-	disk = brd->brd_disk = alloc_disk(max_part);
+	disk = brd->brd_disk = blk_alloc_disk(NUMA_NO_NODE);
 	if (!disk)
-		goto out_free_queue;
+		goto out_free_dev;
+
 	disk->major		= RAMDISK_MAJOR;
 	disk->first_minor	= i * max_part;
+	disk->minors		= max_part;
 	disk->fops		= &brd_fops;
 	disk->private_data	= brd;
 	disk->flags		= GENHD_FL_EXT_DEVT;
 	strlcpy(disk->disk_name, buf, DISK_NAME_LEN);
 	set_capacity(disk, rd_size * 2);
+	
+	/*
+	 * This is so fdisk will align partitions on 4k, because of
+	 * direct_access API needing 4k alignment, returning a PFN
+	 * (This is only a problem on very small devices <= 4M,
+	 *  otherwise fdisk will align on 1M. Regardless this call
+	 *  is harmless)
+	 */
+	blk_queue_physical_block_size(disk->queue, PAGE_SIZE);
 
 	/* Tell the block layer that this is not a rotational device */
-	blk_queue_flag_set(QUEUE_FLAG_NONROT, brd->brd_queue);
-	blk_queue_flag_clear(QUEUE_FLAG_ADD_RANDOM, brd->brd_queue);
+	blk_queue_flag_set(QUEUE_FLAG_NONROT, disk->queue);
+	blk_queue_flag_clear(QUEUE_FLAG_ADD_RANDOM, disk->queue);
+	add_disk(disk);
+	list_add_tail(&brd->brd_list, &brd_devices);
 
-	return brd;
+	return 0;
 
-out_free_queue:
-	blk_cleanup_queue(brd->brd_queue);
 out_free_dev:
 	kfree(brd);
-out:
-	return NULL;
-}
-
-static void brd_free(struct brd_device *brd)
-{
-	put_disk(brd->brd_disk);
-	blk_cleanup_queue(brd->brd_queue);
-	brd_free_pages(brd);
-	kfree(brd);
+	return -ENOMEM;
 }
 
 static void brd_probe(dev_t dev)
 {
-	struct brd_device *brd;
 	int i = MINOR(dev) / max_part;
+	struct brd_device *brd;
 
 	mutex_lock(&brd_devices_mutex);
 	list_for_each_entry(brd, &brd_devices, brd_list) {
@@ -445,13 +434,7 @@ static void brd_probe(dev_t dev)
 			goto out_unlock;
 	}
 
-	brd = brd_alloc(i);
-	if (brd) {
-		brd->brd_disk->queue = brd->brd_queue;
-		add_disk(brd->brd_disk);
-		list_add_tail(&brd->brd_list, &brd_devices);
-	}
-
+	brd_alloc(i);
 out_unlock:
 	mutex_unlock(&brd_devices_mutex);
 }
@@ -460,7 +443,9 @@ static void brd_del_one(struct brd_device *brd)
 {
 	list_del(&brd->brd_list);
 	del_gendisk(brd->brd_disk);
-	brd_free(brd);
+	blk_cleanup_disk(brd->brd_disk);
+	brd_free_pages(brd);
+	kfree(brd);
 }
 
 static inline void brd_check_and_reset_par(void)
@@ -485,7 +470,7 @@ static inline void brd_check_and_reset_par(void)
 static int __init brd_init(void)
 {
 	struct brd_device *brd, *next;
-	int i;
+	int err, i;
 
 	/*
 	 * brd module now has a feature to instantiate underlying device
@@ -511,22 +496,11 @@ static int __init brd_init(void)
 
 	mutex_lock(&brd_devices_mutex);
 	for (i = 0; i < rd_nr; i++) {
-		brd = brd_alloc(i);
-		if (!brd)
+		err = brd_alloc(i);
+		if (err)
 			goto out_free;
-		list_add_tail(&brd->brd_list, &brd_devices);
 	}
 
-	/* point of no return */
-
-	list_for_each_entry(brd, &brd_devices, brd_list) {
-		/*
-		 * associate with queue just before adding disk for
-		 * avoiding to mess up failure path
-		 */
-		brd->brd_disk->queue = brd->brd_queue;
-		add_disk(brd->brd_disk);
-	}
 	mutex_unlock(&brd_devices_mutex);
 
 	pr_info("brd: module loaded\n");
@@ -535,15 +509,13 @@ static int __init brd_init(void)
 out_free:
 	debugfs_remove_recursive(brd_debugfs_dir);
 
-	list_for_each_entry_safe(brd, next, &brd_devices, brd_list) {
-		list_del(&brd->brd_list);
-		brd_free(brd);
-	}
+	list_for_each_entry_safe(brd, next, &brd_devices, brd_list)
+		brd_del_one(brd);
 	mutex_unlock(&brd_devices_mutex);
 	unregister_blkdev(RAMDISK_MAJOR, "ramdisk");
 
 	pr_info("brd: module NOT loaded !!!\n");
-	return -ENOMEM;
+	return err;
 }
 
 static void __exit brd_exit(void)
-- 
2.30.2

