Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A513238BEE0
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 May 2021 08:03:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fmbcx4Cdrz3fh5
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 May 2021 16:03:13 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=YGzFfkeT;
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
 header.s=bombadil.20210309 header.b=YGzFfkeT; 
 dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FmbP03GlQz3c2J
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 May 2021 15:52:52 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=7jnr8ceTle2Qd0VyqP041VOVIhcAyz6y4frSXdiy4SE=; b=YGzFfkeTsZ+r+ks1ng7jZJgZw0
 oWWVh5ueWdz+b0zyuc1LeeIbXMA48AjEXnN5dlkedQ52b5P/ywxjzJgt+Z42ZTwUpvJ3Z5a28Z2W5
 Y9lsBUseerK/ijODu6e4Q2Im3W7p1pysfm2n0G0gAJd5fzfQ9zepdVKhe3SWkTFuKpuRuDQZQfXfy
 V5IK5KXFL8ty/6FQb9QLK0L9w2FdPgi1pLSP1v2g63E6dtHqYb9ZQJ6Lx19qDYeLhwcQzH0YBk1iB
 +YoM3imSux+VV1b14TZBgWP5YUGOtJ43ECNG0DH43pd3XsbInIy96P2XurkOg7gG5uZAVW+TAEf1k
 C0xuLLwg==;
Received: from [2001:4bb8:180:5add:4fd7:4137:d2f2:46e6] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
 id 1ljy5K-00GqDg-T5; Fri, 21 May 2021 05:52:35 +0000
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
Subject: [PATCH 23/26] dcssblk: convert to blk_alloc_disk/blk_cleanup_disk
Date: Fri, 21 May 2021 07:51:13 +0200
Message-Id: <20210521055116.1053587-24-hch@lst.de>
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

Convert the dcssblk driver to use the blk_alloc_disk and blk_cleanup_disk
helpers to simplify gendisk and request_queue allocation.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/s390/block/dcssblk.c | 26 ++++++++------------------
 1 file changed, 8 insertions(+), 18 deletions(-)

diff --git a/drivers/s390/block/dcssblk.c b/drivers/s390/block/dcssblk.c
index da33cb4cba28..7faa56399999 100644
--- a/drivers/s390/block/dcssblk.c
+++ b/drivers/s390/block/dcssblk.c
@@ -90,7 +90,6 @@ struct dcssblk_dev_info {
 	int segment_type;
 	unsigned char save_pending;
 	unsigned char is_shared;
-	struct request_queue *dcssblk_queue;
 	int num_of_segments;
 	struct list_head seg_list;
 	struct dax_device *dax_dev;
@@ -429,9 +428,7 @@ dcssblk_shared_store(struct device *dev, struct device_attribute *attr, const ch
 	kill_dax(dev_info->dax_dev);
 	put_dax(dev_info->dax_dev);
 	del_gendisk(dev_info->gd);
-	blk_cleanup_queue(dev_info->dcssblk_queue);
-	dev_info->gd->queue = NULL;
-	put_disk(dev_info->gd);
+	blk_cleanup_disk(dev_info->gd);
 	up_write(&dcssblk_devices_sem);
 
 	if (device_remove_file_self(dev, attr)) {
@@ -644,18 +641,17 @@ dcssblk_add_store(struct device *dev, struct device_attribute *attr, const char
 	dev_info->dev.release = dcssblk_release_segment;
 	dev_info->dev.groups = dcssblk_dev_attr_groups;
 	INIT_LIST_HEAD(&dev_info->lh);
-	dev_info->gd = alloc_disk(DCSSBLK_MINORS_PER_DISK);
+	dev_info->gd = blk_alloc_disk(NUMA_NO_NODE);
 	if (dev_info->gd == NULL) {
 		rc = -ENOMEM;
 		goto seg_list_del;
 	}
 	dev_info->gd->major = dcssblk_major;
+	dev_info->gd->minors = DCSSBLK_MINORS_PER_DISK;
 	dev_info->gd->fops = &dcssblk_devops;
-	dev_info->dcssblk_queue = blk_alloc_queue(NUMA_NO_NODE);
-	dev_info->gd->queue = dev_info->dcssblk_queue;
 	dev_info->gd->private_data = dev_info;
-	blk_queue_logical_block_size(dev_info->dcssblk_queue, 4096);
-	blk_queue_flag_set(QUEUE_FLAG_DAX, dev_info->dcssblk_queue);
+	blk_queue_logical_block_size(dev_info->gd->queue, 4096);
+	blk_queue_flag_set(QUEUE_FLAG_DAX, dev_info->gd->queue);
 
 	seg_byte_size = (dev_info->end - dev_info->start + 1);
 	set_capacity(dev_info->gd, seg_byte_size >> 9); // size in sectors
@@ -719,9 +715,7 @@ dcssblk_add_store(struct device *dev, struct device_attribute *attr, const char
 
 put_dev:
 	list_del(&dev_info->lh);
-	blk_cleanup_queue(dev_info->dcssblk_queue);
-	dev_info->gd->queue = NULL;
-	put_disk(dev_info->gd);
+	blk_cleanup_disk(dev_info->gd);
 	list_for_each_entry(seg_info, &dev_info->seg_list, lh) {
 		segment_unload(seg_info->segment_name);
 	}
@@ -731,9 +725,7 @@ dcssblk_add_store(struct device *dev, struct device_attribute *attr, const char
 dev_list_del:
 	list_del(&dev_info->lh);
 release_gd:
-	blk_cleanup_queue(dev_info->dcssblk_queue);
-	dev_info->gd->queue = NULL;
-	put_disk(dev_info->gd);
+	blk_cleanup_disk(dev_info->gd);
 	up_write(&dcssblk_devices_sem);
 seg_list_del:
 	if (dev_info == NULL)
@@ -801,9 +793,7 @@ dcssblk_remove_store(struct device *dev, struct device_attribute *attr, const ch
 	kill_dax(dev_info->dax_dev);
 	put_dax(dev_info->dax_dev);
 	del_gendisk(dev_info->gd);
-	blk_cleanup_queue(dev_info->dcssblk_queue);
-	dev_info->gd->queue = NULL;
-	put_disk(dev_info->gd);
+	blk_cleanup_disk(dev_info->gd);
 
 	/* unload all related segments */
 	list_for_each_entry(entry, &dev_info->seg_list, lh)
-- 
2.30.2

