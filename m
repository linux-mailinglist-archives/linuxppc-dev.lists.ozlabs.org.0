Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E08D9398294
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Jun 2021 09:05:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fw0RN1BVqz3fGb
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Jun 2021 17:05:36 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=r98dDxDi;
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
 header.s=bombadil.20210309 header.b=r98dDxDi; 
 dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fw0DT2knTz3c3r
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Jun 2021 16:56:09 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=yE8r2l5ezl7YxULOvA5WBGUgnr1EKs2E6TVb/drKQds=; b=r98dDxDiRvwlhNhs3T+1sVCcmx
 9LSO0JAkx53106Z5FUQCYz3et9mT695nE04/mTWwxr/+e0qSYn8Q1H1hjEWJdvuJc3pumGMIBHyUT
 t4W4GpkPuUNrdOHpe0KYFnWLvVAzI+WQwBh+pEi7U6I9KnMAFAlHPJRr4BSXUOn39VZTgNc5w2jvT
 YFMKttfQVUSu/qkAB2YLyqtpsqykpUWPfHXrpKaBY5Lxa/Kceg/Y0XBAcrgpyvG0PgFSkx/IaoPgV
 NvObxijOnNz7w1Y0/FNOweKAbiF8uEg9oHb82XorMJoTWx9Agt4jviXSvoy73IZqfJrU1acBTcolk
 E0JQevww==;
Received: from shol69.static.otenet.gr ([83.235.170.67] helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1loKn1-0026HM-J4; Wed, 02 Jun 2021 06:55:44 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Subject: [PATCH 24/30] sx8: use blk_mq_alloc_disk and blk_cleanup_disk
Date: Wed,  2 Jun 2021 09:53:39 +0300
Message-Id: <20210602065345.355274-25-hch@lst.de>
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
 drivers/block/sx8.c | 23 +++++++----------------
 1 file changed, 7 insertions(+), 16 deletions(-)

diff --git a/drivers/block/sx8.c b/drivers/block/sx8.c
index 2cdf2771f8e8..f01f860b0e62 100644
--- a/drivers/block/sx8.c
+++ b/drivers/block/sx8.c
@@ -1343,32 +1343,25 @@ static int carm_init_disk(struct carm_host *host, unsigned int port_no)
 {
 	struct carm_port *port = &host->port[port_no];
 	struct gendisk *disk;
-	struct request_queue *q;
 
 	port->host = host;
 	port->port_no = port_no;
 
-	disk = alloc_disk(CARM_MINORS_PER_MAJOR);
-	if (!disk)
-		return -ENOMEM;
+	disk = blk_mq_alloc_disk(&host->tag_set, port);
+	if (IS_ERR(disk))
+		return PTR_ERR(disk);
 
 	port->disk = disk;
 	sprintf(disk->disk_name, DRV_NAME "/%u",
 		(unsigned int)host->id * CARM_MAX_PORTS + port_no);
 	disk->major = host->major;
 	disk->first_minor = port_no * CARM_MINORS_PER_MAJOR;
+	disk->minors = CARM_MINORS_PER_MAJOR;
 	disk->fops = &carm_bd_ops;
 	disk->private_data = port;
 
-	q = blk_mq_init_queue(&host->tag_set);
-	if (IS_ERR(q))
-		return PTR_ERR(q);
-
-	blk_queue_max_segments(q, CARM_MAX_REQ_SG);
-	blk_queue_segment_boundary(q, CARM_SG_BOUNDARY);
-
-	q->queuedata = port;
-	disk->queue = q;
+	blk_queue_max_segments(disk->queue, CARM_MAX_REQ_SG);
+	blk_queue_segment_boundary(disk->queue, CARM_SG_BOUNDARY);
 	return 0;
 }
 
@@ -1382,9 +1375,7 @@ static void carm_free_disk(struct carm_host *host, unsigned int port_no)
 
 	if (disk->flags & GENHD_FL_UP)
 		del_gendisk(disk);
-	if (disk->queue)
-		blk_cleanup_queue(disk->queue);
-	put_disk(disk);
+	blk_cleanup_disk(disk);
 }
 
 static int carm_init_shm(struct carm_host *host)
-- 
2.30.2

