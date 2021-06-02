Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C817398252
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Jun 2021 08:59:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fw0Jc5sRDz3ddB
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Jun 2021 16:59:44 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=wfnn0CGP;
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
 header.s=bombadil.20210309 header.b=wfnn0CGP; 
 dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fw0CH5XXyz30CT
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Jun 2021 16:55:07 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=qi7AU80Oz7hj4K5BUy3Hu3UJMfMiprlsOMq1LlDbVww=; b=wfnn0CGP9teCIUigpA0cLAiCEG
 XaYeXRoQvQOrEfJFcuxKu18rxlCj9kAVnqYvA6ffbosWHxomIXQsSArr+ftwbguMp5SU3M9/bmk0L
 bqzQ8XiTRZ6QBfzP4K/UHsKW47GVQnDBFuGf6p23+3crdLQ2ThNz4kvRi6KgNmbzK/nin+yjIgWxz
 6kQGuIL3DvYz9Jv29HP0rZaCMuA/qvMMWQpgEREhwRn38bXZiX53OXpalBkps4hZhmquoC2R0dNpO
 luUD0oRku7pr6gfgS8FYvxXuSkXea92js4/YEKQkinqriGTLqiSIzKawm91/GTGJJNVz/av0Gu21E
 TAsHH4GQ==;
Received: from shol69.static.otenet.gr ([83.235.170.67] helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1loKm6-0025Ys-7i; Wed, 02 Jun 2021 06:54:47 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Subject: [PATCH 11/30] swim3: use blk_mq_alloc_disk
Date: Wed,  2 Jun 2021 09:53:26 +0300
Message-Id: <20210602065345.355274-12-hch@lst.de>
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

Use the blk_mq_alloc_disk API to simplify the gendisk and request_queue
allocation.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/block/swim3.c | 33 ++++++++++++++-------------------
 1 file changed, 14 insertions(+), 19 deletions(-)

diff --git a/drivers/block/swim3.c b/drivers/block/swim3.c
index a515d0c1d2cb..965af0a3e95b 100644
--- a/drivers/block/swim3.c
+++ b/drivers/block/swim3.c
@@ -1202,30 +1202,27 @@ static int swim3_attach(struct macio_dev *mdev,
 			return rc;
 	}
 
-	disk = alloc_disk(1);
-	if (disk == NULL) {
-		rc = -ENOMEM;
-		goto out_unregister;
-	}
-
 	fs = &floppy_states[floppy_count];
 	memset(fs, 0, sizeof(*fs));
 
-	disk->queue = blk_mq_init_sq_queue(&fs->tag_set, &swim3_mq_ops, 2,
-						BLK_MQ_F_SHOULD_MERGE);
-	if (IS_ERR(disk->queue)) {
-		rc = PTR_ERR(disk->queue);
-		disk->queue = NULL;
-		goto out_put_disk;
+	rc = blk_mq_alloc_sq_tag_set(&fs->tag_set, &swim3_mq_ops, 2,
+			BLK_MQ_F_SHOULD_MERGE);
+	if (rc)
+		goto out_unregister;
+
+	disk = blk_mq_alloc_disk(&fs->tag_set, fs);
+	if (IS_ERR(disk)) {
+		rc = PTR_ERR(disk);
+		goto out_free_tag_set;
 	}
-	disk->queue->queuedata = fs;
 
 	rc = swim3_add_device(mdev, floppy_count);
 	if (rc)
-		goto out_cleanup_queue;
+		goto out_cleanup_disk;
 
 	disk->major = FLOPPY_MAJOR;
 	disk->first_minor = floppy_count;
+	disk->minors = 1;
 	disk->fops = &floppy_fops;
 	disk->private_data = fs;
 	disk->events = DISK_EVENT_MEDIA_CHANGE;
@@ -1237,12 +1234,10 @@ static int swim3_attach(struct macio_dev *mdev,
 	disks[floppy_count++] = disk;
 	return 0;
 
-out_cleanup_queue:
-	blk_cleanup_queue(disk->queue);
-	disk->queue = NULL;
+out_cleanup_disk:
+	blk_cleanup_disk(disk);
+out_free_tag_set:
 	blk_mq_free_tag_set(&fs->tag_set);
-out_put_disk:
-	put_disk(disk);
 out_unregister:
 	if (floppy_count == 0)
 		unregister_blkdev(FLOPPY_MAJOR, "fd");
-- 
2.30.2

