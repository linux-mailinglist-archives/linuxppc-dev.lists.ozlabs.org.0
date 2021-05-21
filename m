Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BFE4D38BEB8
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 May 2021 07:54:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FmbRG4lKKz3cl7
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 May 2021 15:54:50 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ERLX+Er9;
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
 header.s=bombadil.20210309 header.b=ERLX+Er9; 
 dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FmbMx6PDyz2yyv
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 May 2021 15:51:57 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=h6/c/pmAVTT50EpYkCB8cars83Aefpk5WatNPBetZlM=; b=ERLX+Er9adUQY5JASpHYlxDt4S
 zWZPt2U/8Qby2Mlefy9E4u7vRehymcjI24z35jNassCKUcOBAZySuvsAVI6cYWNeBPlVIGquPr/PI
 K5me+5J9FtyqqIWFR4a9PhJOiEyKOQaHxv2DXeG90uleKzDgmJgbufQK8ymO4S3v/Yg+A+y57GJY1
 fpf15rMSDLOi29rNlmj8A/blllRngdb+jnDU/o5REeAsVzU7ozsDG8j61Z8ZcFLu3Djm0hdBQS5Hn
 OjRh7qHzrYTv60W1JMPA4tO/Rr7OZ3hjxs/7X4/BuuMG6rR4xxgObPOh9A45ypfw1ZU5hNwUyfirp
 7AUS9Ixg==;
Received: from [2001:4bb8:180:5add:4fd7:4137:d2f2:46e6] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
 id 1ljy4G-00GpxC-Qo; Fri, 21 May 2021 05:51:29 +0000
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
Subject: [PATCH 03/26] block: automatically enable GENHD_FL_EXT_DEVT
Date: Fri, 21 May 2021 07:50:53 +0200
Message-Id: <20210521055116.1053587-4-hch@lst.de>
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

Automatically set the GENHD_FL_EXT_DEVT flag for all disks allocated
without an explicit number of minors.  This is what all new block
drivers should do, so make sure it is the default without boilerplate
code.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 block/genhd.c                    | 2 +-
 block/partitions/core.c          | 4 ----
 drivers/block/n64cart.c          | 2 +-
 drivers/lightnvm/core.c          | 1 -
 drivers/memstick/core/ms_block.c | 1 -
 drivers/nvdimm/blk.c             | 1 -
 drivers/nvdimm/btt.c             | 1 -
 drivers/nvdimm/pmem.c            | 1 -
 drivers/nvme/host/core.c         | 1 -
 drivers/nvme/host/multipath.c    | 1 -
 10 files changed, 2 insertions(+), 13 deletions(-)

diff --git a/block/genhd.c b/block/genhd.c
index 7f9beaeede11..eec266c9318d 100644
--- a/block/genhd.c
+++ b/block/genhd.c
@@ -499,7 +499,6 @@ static void __device_add_disk(struct device *parent, struct gendisk *disk,
 		}
 	} else {
 		WARN_ON(disk->minors);
-		WARN_ON(!(disk->flags & (GENHD_FL_EXT_DEVT | GENHD_FL_HIDDEN)));
 
 		ret = blk_alloc_ext_minor();
 		if (ret < 0) {
@@ -508,6 +507,7 @@ static void __device_add_disk(struct device *parent, struct gendisk *disk,
 		}
 		disk->major = BLOCK_EXT_MAJOR;
 		disk->first_minor = MINOR(ret);
+		disk->flags |= GENHD_FL_EXT_DEVT;
 	}
 
 	disk->flags |= GENHD_FL_UP;
diff --git a/block/partitions/core.c b/block/partitions/core.c
index 504297bdc8bf..ada3e1e66989 100644
--- a/block/partitions/core.c
+++ b/block/partitions/core.c
@@ -326,10 +326,6 @@ static struct block_device *add_partition(struct gendisk *disk, int partno,
 	const char *dname;
 	int err;
 
-	/*
-	 * disk_max_parts() won't be zero, either GENHD_FL_EXT_DEVT is set
-	 * or 'minors' is passed to alloc_disk().
-	 */
 	if (partno >= disk_max_parts(disk))
 		return ERR_PTR(-EINVAL);
 
diff --git a/drivers/block/n64cart.c b/drivers/block/n64cart.c
index 47bdf324e962..3dae4b631dea 100644
--- a/drivers/block/n64cart.c
+++ b/drivers/block/n64cart.c
@@ -141,7 +141,7 @@ static int __init n64cart_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	disk->first_minor = 0;
-	disk->flags = GENHD_FL_NO_PART_SCAN | GENHD_FL_EXT_DEVT;
+	disk->flags = GENHD_FL_NO_PART_SCAN;
 	disk->fops = &n64cart_fops;
 	disk->private_data = &pdev->dev;
 	strcpy(disk->disk_name, "n64cart");
diff --git a/drivers/lightnvm/core.c b/drivers/lightnvm/core.c
index 40a948c08a0b..e7dc539fc0ac 100644
--- a/drivers/lightnvm/core.c
+++ b/drivers/lightnvm/core.c
@@ -383,7 +383,6 @@ static int nvm_create_tgt(struct nvm_dev *dev, struct nvm_ioctl_create *create)
 	}
 
 	strlcpy(tdisk->disk_name, create->tgtname, sizeof(tdisk->disk_name));
-	tdisk->flags = GENHD_FL_EXT_DEVT;
 	tdisk->major = 0;
 	tdisk->first_minor = 0;
 	tdisk->fops = tt->bops;
diff --git a/drivers/memstick/core/ms_block.c b/drivers/memstick/core/ms_block.c
index 8004dd64d09a..0bacf4268f83 100644
--- a/drivers/memstick/core/ms_block.c
+++ b/drivers/memstick/core/ms_block.c
@@ -2136,7 +2136,6 @@ static int msb_init_disk(struct memstick_dev *card)
 	msb->disk->fops = &msb_bdops;
 	msb->disk->private_data = msb;
 	msb->disk->queue = msb->queue;
-	msb->disk->flags |= GENHD_FL_EXT_DEVT;
 
 	capacity = msb->pages_in_block * msb->logical_block_count;
 	capacity *= (msb->page_size / 512);
diff --git a/drivers/nvdimm/blk.c b/drivers/nvdimm/blk.c
index 7b9556291eb1..7ba446d224fb 100644
--- a/drivers/nvdimm/blk.c
+++ b/drivers/nvdimm/blk.c
@@ -267,7 +267,6 @@ static int nsblk_attach_disk(struct nd_namespace_blk *nsblk)
 	disk->first_minor	= 0;
 	disk->fops		= &nd_blk_fops;
 	disk->queue		= q;
-	disk->flags		= GENHD_FL_EXT_DEVT;
 	disk->private_data	= nsblk;
 	nvdimm_namespace_disk_name(&nsblk->common, disk->disk_name);
 
diff --git a/drivers/nvdimm/btt.c b/drivers/nvdimm/btt.c
index 18a267d5073f..1741a7b0b30f 100644
--- a/drivers/nvdimm/btt.c
+++ b/drivers/nvdimm/btt.c
@@ -1537,7 +1537,6 @@ static int btt_blk_init(struct btt *btt)
 	btt->btt_disk->fops = &btt_fops;
 	btt->btt_disk->private_data = btt;
 	btt->btt_disk->queue = btt->btt_queue;
-	btt->btt_disk->flags = GENHD_FL_EXT_DEVT;
 
 	blk_queue_logical_block_size(btt->btt_queue, btt->sector_size);
 	blk_queue_max_hw_sectors(btt->btt_queue, UINT_MAX);
diff --git a/drivers/nvdimm/pmem.c b/drivers/nvdimm/pmem.c
index ed10a8b66068..968b8483c763 100644
--- a/drivers/nvdimm/pmem.c
+++ b/drivers/nvdimm/pmem.c
@@ -477,7 +477,6 @@ static int pmem_attach_disk(struct device *dev,
 
 	disk->fops		= &pmem_fops;
 	disk->queue		= q;
-	disk->flags		= GENHD_FL_EXT_DEVT;
 	disk->private_data	= pmem;
 	nvdimm_namespace_disk_name(ndns, disk->disk_name);
 	set_capacity(disk, (pmem->size - pmem->pfn_pad - pmem->data_offset)
diff --git a/drivers/nvme/host/core.c b/drivers/nvme/host/core.c
index 762125f2905f..24bcae88587a 100644
--- a/drivers/nvme/host/core.c
+++ b/drivers/nvme/host/core.c
@@ -3699,7 +3699,6 @@ static void nvme_alloc_ns(struct nvme_ctrl *ctrl, unsigned nsid,
 	disk->fops = &nvme_bdev_ops;
 	disk->private_data = ns;
 	disk->queue = ns->queue;
-	disk->flags = GENHD_FL_EXT_DEVT;
 	/*
 	 * Without the multipath code enabled, multiple controller per
 	 * subsystems are visible as devices and thus we cannot use the
diff --git a/drivers/nvme/host/multipath.c b/drivers/nvme/host/multipath.c
index f81871c7128a..a5d02f236cca 100644
--- a/drivers/nvme/host/multipath.c
+++ b/drivers/nvme/host/multipath.c
@@ -462,7 +462,6 @@ int nvme_mpath_alloc_disk(struct nvme_ctrl *ctrl, struct nvme_ns_head *head)
 	head->disk->fops = &nvme_ns_head_ops;
 	head->disk->private_data = head;
 	head->disk->queue = q;
-	head->disk->flags = GENHD_FL_EXT_DEVT;
 	sprintf(head->disk->disk_name, "nvme%dn%d",
 			ctrl->subsys->instance, head->instance);
 	return 0;
-- 
2.30.2

