Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D7089030C7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jun 2024 07:27:39 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=MgJCZXdC;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VyxyJ29BJz3cVN
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jun 2024 15:27:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=MgJCZXdC;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=bombadil.srs.infradead.org (client-ip=2607:7c80:54:3::133; helo=bombadil.infradead.org; envelope-from=batv+2fedbe304aabaf399917+7597+infradead.org+hch@bombadil.srs.infradead.org; receiver=lists.ozlabs.org)
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Vyxnt3SbZz3bfS
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Jun 2024 15:20:18 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=XX8OKzSF4I8HqKWv9CPGPzdF42TlXrJn92mCb7zGUpU=; b=MgJCZXdCXtq5WcrpKLj6n44BMN
	x7as6F25HhuflNiQsl6jB5W6Jl8Cql52H+wX7EAkBatRuj+eJQEWJ77tUg0C3taOh9WTyyJ5Bqsdi
	RXIGXMyVTRoSsh9a4uAfJCaQK5+FHeeQHkBBZE0YZA9FygNVsS+hGq+FQgsOMtLKMq7cOPugwuWbd
	nHgbDPqb89/cUkFHBBzn5P6ypmdPwRtPSnVwTBJUEpsncbavyujHEC5azlnNETobhWGFD7GOTUPkY
	4mvSB/tNstXuD79kJeevqTycR98vtBAfM0kE9ci/1QpnRCn9+ZGtDS5u57IeabqphYzfqjxqKjOQg
	V0F/xAxw==;
Received: from 2a02-8389-2341-5b80-cdb4-8e7d-405d-6b77.cable.dynamic.v6.surfer.at ([2a02:8389:2341:5b80:cdb4:8e7d:405d:6b77] helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGtvO-00000007R2v-03k6;
	Tue, 11 Jun 2024 05:20:02 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Subject: [PATCH 10/26] xen-blkfront: don't disable cache flushes when they fail
Date: Tue, 11 Jun 2024 07:19:10 +0200
Message-ID: <20240611051929.513387-11-hch@lst.de>
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

blkfront always had a robust negotiation protocol for detecting a write
cache.  Stop simply disabling cache flushes when they fail as that is
a grave error.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/block/xen-blkfront.c | 29 +++++++++--------------------
 1 file changed, 9 insertions(+), 20 deletions(-)

diff --git a/drivers/block/xen-blkfront.c b/drivers/block/xen-blkfront.c
index 9b4ec3e4908cce..9794ac2d3299d1 100644
--- a/drivers/block/xen-blkfront.c
+++ b/drivers/block/xen-blkfront.c
@@ -982,18 +982,6 @@ static const char *flush_info(struct blkfront_info *info)
 		return "barrier or flush: disabled;";
 }
 
-static void xlvbd_flush(struct blkfront_info *info)
-{
-	blk_queue_write_cache(info->rq, info->feature_flush ? true : false,
-			      info->feature_fua ? true : false);
-	pr_info("blkfront: %s: %s %s %s %s %s %s %s\n",
-		info->gd->disk_name, flush_info(info),
-		"persistent grants:", info->feature_persistent ?
-		"enabled;" : "disabled;", "indirect descriptors:",
-		info->max_indirect_segments ? "enabled;" : "disabled;",
-		"bounce buffer:", info->bounce ? "enabled" : "disabled;");
-}
-
 static int xen_translate_vdev(int vdevice, int *minor, unsigned int *offset)
 {
 	int major;
@@ -1162,7 +1150,15 @@ static int xlvbd_alloc_gendisk(blkif_sector_t capacity,
 	info->sector_size = sector_size;
 	info->physical_sector_size = physical_sector_size;
 
-	xlvbd_flush(info);
+	blk_queue_write_cache(info->rq, info->feature_flush ? true : false,
+			      info->feature_fua ? true : false);
+
+	pr_info("blkfront: %s: %s %s %s %s %s %s %s\n",
+		info->gd->disk_name, flush_info(info),
+		"persistent grants:", info->feature_persistent ?
+		"enabled;" : "disabled;", "indirect descriptors:",
+		info->max_indirect_segments ? "enabled;" : "disabled;",
+		"bounce buffer:", info->bounce ? "enabled" : "disabled;");
 
 	if (info->vdisk_info & VDISK_READONLY)
 		set_disk_ro(gd, 1);
@@ -1622,13 +1618,6 @@ static irqreturn_t blkif_interrupt(int irq, void *dev_id)
 				       info->gd->disk_name, op_name(bret.operation));
 				blkif_req(req)->error = BLK_STS_NOTSUPP;
 			}
-			if (unlikely(blkif_req(req)->error)) {
-				if (blkif_req(req)->error == BLK_STS_NOTSUPP)
-					blkif_req(req)->error = BLK_STS_OK;
-				info->feature_fua = 0;
-				info->feature_flush = 0;
-				xlvbd_flush(info);
-			}
 			fallthrough;
 		case BLKIF_OP_READ:
 		case BLKIF_OP_WRITE:
-- 
2.43.0

