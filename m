Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 80A4739826F
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Jun 2021 09:02:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fw0NJ623wz3f87
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Jun 2021 17:02:56 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=re781XvQ;
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
 header.s=bombadil.20210309 header.b=re781XvQ; 
 dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fw0Cv4wfkz3by1
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Jun 2021 16:55:39 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=Ay3+BGPlRqdc0EFLNjvSyNAlCXYv7F/E4ZKoFdkW+qs=; b=re781XvQTLqNz+tW0K+eeLN126
 ZHdsuYJ2Awc6hKt5NXrxWVcF1gLtmPmqrRoYM1HI43jkn7Qf75wWP01UlBu2V2sY61J+OM/Etw42Y
 +/Y9bV0NZSR7XSiaIB3hoA5FplO+Knn8VPNUx84Za0n+grjUeqHa7Ia2Y6hM5luzozyZJ8Is3hs5t
 0f1bIF+gL/yS4tMtIJDr7RZZ0gaHP+N8QcEaL1x8gVuo08fsq6poeekNRuls+ivPNI9U2B65ypj48
 yQjKdXwi7x17Mz91bhzCLHhe29vJAUjBIJ8vYze0d6zCgmUka+cbdrK9DUBsKkhmarGXEPYZxI+5z
 n/v3EyXw==;
Received: from shol69.static.otenet.gr ([83.235.170.67] helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1loKma-0025sw-BW; Wed, 02 Jun 2021 06:55:17 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Subject: [PATCH 18/30] loop: use blk_mq_alloc_disk and blk_cleanup_disk
Date: Wed,  2 Jun 2021 09:53:33 +0300
Message-Id: <20210602065345.355274-19-hch@lst.de>
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
 drivers/block/loop.c | 19 ++++++-------------
 1 file changed, 6 insertions(+), 13 deletions(-)

diff --git a/drivers/block/loop.c b/drivers/block/loop.c
index 95c570f5923f..3f40e673a101 100644
--- a/drivers/block/loop.c
+++ b/drivers/block/loop.c
@@ -2117,12 +2117,12 @@ static int loop_add(struct loop_device **l, int i)
 	if (err)
 		goto out_free_idr;
 
-	lo->lo_queue = blk_mq_init_queue(&lo->tag_set);
-	if (IS_ERR(lo->lo_queue)) {
-		err = PTR_ERR(lo->lo_queue);
+	disk = lo->lo_disk = blk_mq_alloc_disk(&lo->tag_set, lo);
+	if (IS_ERR(disk)) {
+		err = PTR_ERR(disk);
 		goto out_cleanup_tags;
 	}
-	lo->lo_queue->queuedata = lo;
+	lo->lo_queue = lo->lo_disk->queue;
 
 	blk_queue_max_hw_sectors(lo->lo_queue, BLK_DEF_MAX_SECTORS);
 
@@ -2134,11 +2134,6 @@ static int loop_add(struct loop_device **l, int i)
 	 */
 	blk_queue_flag_set(QUEUE_FLAG_NOMERGES, lo->lo_queue);
 
-	err = -ENOMEM;
-	disk = lo->lo_disk = alloc_disk(1 << part_shift);
-	if (!disk)
-		goto out_free_queue;
-
 	/*
 	 * Disable partition scanning by default. The in-kernel partition
 	 * scanning can be requested individually per-device during its
@@ -2166,6 +2161,7 @@ static int loop_add(struct loop_device **l, int i)
 	spin_lock_init(&lo->lo_lock);
 	disk->major		= LOOP_MAJOR;
 	disk->first_minor	= i << part_shift;
+	disk->minors		= 1 << part_shift;
 	disk->fops		= &lo_fops;
 	disk->private_data	= lo;
 	disk->queue		= lo->lo_queue;
@@ -2174,8 +2170,6 @@ static int loop_add(struct loop_device **l, int i)
 	*l = lo;
 	return lo->lo_number;
 
-out_free_queue:
-	blk_cleanup_queue(lo->lo_queue);
 out_cleanup_tags:
 	blk_mq_free_tag_set(&lo->tag_set);
 out_free_idr:
@@ -2189,9 +2183,8 @@ static int loop_add(struct loop_device **l, int i)
 static void loop_remove(struct loop_device *lo)
 {
 	del_gendisk(lo->lo_disk);
-	blk_cleanup_queue(lo->lo_queue);
 	blk_mq_free_tag_set(&lo->tag_set);
-	put_disk(lo->lo_disk);
+	blk_cleanup_disk(lo->lo_disk);
 	mutex_destroy(&lo->lo_mutex);
 	kfree(lo);
 }
-- 
2.30.2

