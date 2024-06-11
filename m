Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C51D7903092
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jun 2024 07:25:38 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Ki2bJ+c1;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vyxvz5PXBz3cnv
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jun 2024 15:25:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Ki2bJ+c1;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=bombadil.srs.infradead.org (client-ip=2607:7c80:54:3::133; helo=bombadil.infradead.org; envelope-from=batv+2fedbe304aabaf399917+7597+infradead.org+hch@bombadil.srs.infradead.org; receiver=lists.ozlabs.org)
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Vyxng4K1Cz3cGC
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Jun 2024 15:20:07 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=rkSQ+6nZApqoAfrjo6q+Wq9Ws51k8by9JfSQNhUShHI=; b=Ki2bJ+c1QdcY5HPLBtBOGK1wy/
	Q9aJI78KWVLLTM5bn/EHpuvmHBU1C6sHSCaz91uiphE8Z9XZb4wA6Z9/B4venlxYIjbipq5bq5ghm
	BkzL4kj4cd9KDP78OrmjzOjuqsJKThI/tpWzKzlobFrOA7RjkUXMQ7VDaowU7CCJwPP44T5LppJkk
	lpvt9qNjIE/gUVreXqbK4kl5Ybt76uIrx0PbUPDOSxfiuZoXgDuak4EadqaXl00yP4T0+Rszn/XLp
	1aJwQOVF0wGakOipCvBGudj4WytD8/RAkq+/mJDhpHGOfXqKz8BCgAd9vJ4nk27dOpXX9s68LMdDs
	jBqpOuCg==;
Received: from 2a02-8389-2341-5b80-cdb4-8e7d-405d-6b77.cable.dynamic.v6.surfer.at ([2a02:8389:2341:5b80:cdb4:8e7d:405d:6b77] helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGtvF-00000007Qwk-2PPi;
	Tue, 11 Jun 2024 05:19:54 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Subject: [PATCH 07/26] loop: fold loop_update_rotational into loop_reconfigure_limits
Date: Tue, 11 Jun 2024 07:19:07 +0200
Message-ID: <20240611051929.513387-8-hch@lst.de>
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

This prepares for moving the rotational flag into the queue_limits and
also fixes it for the case where the loop device is backed by a block
device.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/block/loop.c | 23 ++++-------------------
 1 file changed, 4 insertions(+), 19 deletions(-)

diff --git a/drivers/block/loop.c b/drivers/block/loop.c
index d7cf6bbbfb1b86..2c4a5eb3a6a7f9 100644
--- a/drivers/block/loop.c
+++ b/drivers/block/loop.c
@@ -916,24 +916,6 @@ static void loop_free_idle_workers_timer(struct timer_list *timer)
 	return loop_free_idle_workers(lo, false);
 }
 
-static void loop_update_rotational(struct loop_device *lo)
-{
-	struct file *file = lo->lo_backing_file;
-	struct inode *file_inode = file->f_mapping->host;
-	struct block_device *file_bdev = file_inode->i_sb->s_bdev;
-	struct request_queue *q = lo->lo_queue;
-	bool nonrot = true;
-
-	/* not all filesystems (e.g. tmpfs) have a sb->s_bdev */
-	if (file_bdev)
-		nonrot = bdev_nonrot(file_bdev);
-
-	if (nonrot)
-		blk_queue_flag_set(QUEUE_FLAG_NONROT, q);
-	else
-		blk_queue_flag_clear(QUEUE_FLAG_NONROT, q);
-}
-
 /**
  * loop_set_status_from_info - configure device from loop_info
  * @lo: struct loop_device to configure
@@ -1003,6 +985,10 @@ static int loop_reconfigure_limits(struct loop_device *lo, unsigned short bsize)
 	lim.logical_block_size = bsize;
 	lim.physical_block_size = bsize;
 	lim.io_min = bsize;
+	if (!backing_bdev || bdev_nonrot(backing_bdev))
+		blk_queue_flag_set(QUEUE_FLAG_NONROT, lo->lo_queue);
+	else
+		blk_queue_flag_clear(QUEUE_FLAG_NONROT, lo->lo_queue);
 	loop_config_discard(lo, &lim);
 	return queue_limits_commit_update(lo->lo_queue, &lim);
 }
@@ -1099,7 +1085,6 @@ static int loop_configure(struct loop_device *lo, blk_mode_t mode,
 	if (WARN_ON_ONCE(error))
 		goto out_unlock;
 
-	loop_update_rotational(lo);
 	loop_update_dio(lo);
 	loop_sysfs_init(lo);
 
-- 
2.43.0

