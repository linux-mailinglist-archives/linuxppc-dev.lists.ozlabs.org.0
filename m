Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A623398241
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Jun 2021 08:57:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fw0GB3VDQz3cTH
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Jun 2021 16:57:38 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=U/MbBupm;
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
 header.s=bombadil.20210309 header.b=U/MbBupm; 
 dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fw0Bp51vzz3063
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Jun 2021 16:54:42 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=BVgbkrgI5w8hw6EfzYARLfGWi6Kh9lFpzsXZ419HK1w=; b=U/MbBupmxlqb75y1PHkCyebynQ
 Rt4fL6fa+WzCejYcSifBRXJN9ka135vcRGgG8l7nbiWMw0RO1zAmvQeHG1EB4hkdZrMO1+8e6kT24
 CCFvZVn7hwrTPmSO8fpiW0WjG8kLUcuJo4czgl1Ug2/VWcJs1QWpkGaOQJlwRiQFMiTkkEzvrxwXC
 /fDjwhFDYriH71KkRIgFNetz9g9Hzp0uZkvRppj4VHGBAA/bVFhYgYPuSMVLVDyrW+QDFj6Zc5Hbr
 orlbN/emDladETPZOn+hbjRC0uB/M6eGxSnx/UmBiIxbqX/2NW/f466ciE4Zata7/KUdQ0LnF4eAy
 LoIgT7+A==;
Received: from shol69.static.otenet.gr ([83.235.170.67] helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1loKlg-0025NX-RE; Wed, 02 Jun 2021 06:54:21 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Subject: [PATCH 06/30] pf: use blk_mq_alloc_disk
Date: Wed,  2 Jun 2021 09:53:21 +0300
Message-Id: <20210602065345.355274-7-hch@lst.de>
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
 drivers/block/paride/pf.c | 18 +++++++-----------
 1 file changed, 7 insertions(+), 11 deletions(-)

diff --git a/drivers/block/paride/pf.c b/drivers/block/paride/pf.c
index bb09f21ce21a..d5b9c88ba76f 100644
--- a/drivers/block/paride/pf.c
+++ b/drivers/block/paride/pf.c
@@ -294,20 +294,17 @@ static void __init pf_init_units(void)
 	for (unit = 0, pf = units; unit < PF_UNITS; unit++, pf++) {
 		struct gendisk *disk;
 
-		disk = alloc_disk(1);
-		if (!disk)
+		if (blk_mq_alloc_sq_tag_set(&pf->tag_set, &pf_mq_ops, 1,
+				BLK_MQ_F_SHOULD_MERGE))
 			continue;
 
-		disk->queue = blk_mq_init_sq_queue(&pf->tag_set, &pf_mq_ops,
-							1, BLK_MQ_F_SHOULD_MERGE);
-		if (IS_ERR(disk->queue)) {
-			disk->queue = NULL;
-			put_disk(disk);
+		disk = blk_mq_alloc_disk(&pf->tag_set, pf);
+		if (IS_ERR(disk)) {
+			blk_mq_free_tag_set(&pf->tag_set);
 			continue;
 		}
 
 		INIT_LIST_HEAD(&pf->rq_list);
-		disk->queue->queuedata = pf;
 		blk_queue_max_segments(disk->queue, cluster);
 		blk_queue_bounce_limit(disk->queue, BLK_BOUNCE_HIGH);
 		pf->disk = disk;
@@ -318,6 +315,7 @@ static void __init pf_init_units(void)
 		snprintf(pf->name, PF_NAMELEN, "%s%d", name, unit);
 		disk->major = major;
 		disk->first_minor = unit;
+		disk->minors = 1;
 		strcpy(disk->disk_name, pf->name);
 		disk->fops = &pf_fops;
 		disk->events = DISK_EVENT_MEDIA_CHANGE;
@@ -766,10 +764,8 @@ static int pf_detect(void)
 	for (pf = units, unit = 0; unit < PF_UNITS; pf++, unit++) {
 		if (!pf->disk)
 			continue;
-		blk_cleanup_queue(pf->disk->queue);
-		pf->disk->queue = NULL;
+		blk_cleanup_disk(pf->disk);
 		blk_mq_free_tag_set(&pf->tag_set);
-		put_disk(pf->disk);
 	}
 	pi_unregister_driver(par_drv);
 	return -1;
-- 
2.30.2

