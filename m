Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E0E4D3982A3
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Jun 2021 09:06:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fw0Sv1V6Hz2xvc
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Jun 2021 17:06:55 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=uyZhEjeE;
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
 header.s=bombadil.20210309 header.b=uyZhEjeE; 
 dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fw0Df74Z6z3c5l
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Jun 2021 16:56:18 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=t0ZfpA7/b1tuSB9Qdmm+6Pkt4GtuM/+pFYP7xY239G0=; b=uyZhEjeEW990KkF+Rai7xjxEUV
 5bWN+uUzqHopzatrtAIE4foiriDdqCyVhGFR6vrU02JeY+SQh7ATWFUZXA3UpyDJcgDYSDLhQXP9V
 RbuXa4k+DVNm7KNjqg4cbdIBM1Va/6aZbjJtQTnqImkNPJ0qKqmBir0MJFXK6gK5PvPfEwCxj1xmD
 dJgu840EtdLj1HHThtV37MaOh3u42wXScgCL7y9GVONAhUdX9SrS6vntka8Pn6bww45YDmPKVYARg
 M/UkenAPSpkgf5JK1kNXiSwoq6fWJ8kR9bHE+sA5X31QgA+XlZSlp6YoKzXnGG50xif3YpnMjuZQG
 qCj5Hh3A==;
Received: from shol69.static.otenet.gr ([83.235.170.67] helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1loKnE-0026TF-Pp; Wed, 02 Jun 2021 06:55:57 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Subject: [PATCH 27/30] scm_blk: use blk_mq_alloc_disk and blk_cleanup_disk
Date: Wed,  2 Jun 2021 09:53:42 +0300
Message-Id: <20210602065345.355274-28-hch@lst.de>
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
 drivers/s390/block/scm_blk.c | 21 ++++++---------------
 1 file changed, 6 insertions(+), 15 deletions(-)

diff --git a/drivers/s390/block/scm_blk.c b/drivers/s390/block/scm_blk.c
index a4f6f2e62b1d..88cba6212ee2 100644
--- a/drivers/s390/block/scm_blk.c
+++ b/drivers/s390/block/scm_blk.c
@@ -462,12 +462,12 @@ int scm_blk_dev_setup(struct scm_blk_dev *bdev, struct scm_device *scmdev)
 	if (ret)
 		goto out;
 
-	rq = blk_mq_init_queue(&bdev->tag_set);
-	if (IS_ERR(rq)) {
-		ret = PTR_ERR(rq);
+	bdev->gendisk = blk_mq_alloc_disk(&bdev->tag_set, scmdev);
+	if (IS_ERR(bdev->gendisk)) {
+		ret = PTR_ERR(bdev->gendisk);
 		goto out_tag;
 	}
-	bdev->rq = rq;
+	rq = bdev->rq = bdev->gendisk->queue;
 	nr_max_blk = min(scmdev->nr_max_block,
 			 (unsigned int) (PAGE_SIZE / sizeof(struct aidaw)));
 
@@ -477,17 +477,11 @@ int scm_blk_dev_setup(struct scm_blk_dev *bdev, struct scm_device *scmdev)
 	blk_queue_flag_set(QUEUE_FLAG_NONROT, rq);
 	blk_queue_flag_clear(QUEUE_FLAG_ADD_RANDOM, rq);
 
-	bdev->gendisk = alloc_disk(SCM_NR_PARTS);
-	if (!bdev->gendisk) {
-		ret = -ENOMEM;
-		goto out_queue;
-	}
-	rq->queuedata = scmdev;
 	bdev->gendisk->private_data = scmdev;
 	bdev->gendisk->fops = &scm_blk_devops;
-	bdev->gendisk->queue = rq;
 	bdev->gendisk->major = scm_major;
 	bdev->gendisk->first_minor = devindex * SCM_NR_PARTS;
+	bdev->gendisk->minors = SCM_NR_PARTS;
 
 	len = snprintf(bdev->gendisk->disk_name, DISK_NAME_LEN, "scm");
 	if (devindex > 25) {
@@ -504,8 +498,6 @@ int scm_blk_dev_setup(struct scm_blk_dev *bdev, struct scm_device *scmdev)
 	device_add_disk(&scmdev->dev, bdev->gendisk, NULL);
 	return 0;
 
-out_queue:
-	blk_cleanup_queue(rq);
 out_tag:
 	blk_mq_free_tag_set(&bdev->tag_set);
 out:
@@ -516,9 +508,8 @@ int scm_blk_dev_setup(struct scm_blk_dev *bdev, struct scm_device *scmdev)
 void scm_blk_dev_cleanup(struct scm_blk_dev *bdev)
 {
 	del_gendisk(bdev->gendisk);
-	blk_cleanup_queue(bdev->gendisk->queue);
+	blk_cleanup_disk(bdev->gendisk);
 	blk_mq_free_tag_set(&bdev->tag_set);
-	put_disk(bdev->gendisk);
 }
 
 void scm_blk_set_available(struct scm_blk_dev *bdev)
-- 
2.30.2

