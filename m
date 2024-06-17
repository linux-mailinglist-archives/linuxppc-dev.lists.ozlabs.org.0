Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 864B490A4BE
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Jun 2024 08:13:00 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=guhcPlS/;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W2fgs2JScz3cRd
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Jun 2024 16:12:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=guhcPlS/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=bombadil.srs.infradead.org (client-ip=2607:7c80:54:3::133; helo=bombadil.infradead.org; envelope-from=batv+625ba2f6da96caf54eae+7603+infradead.org+hch@bombadil.srs.infradead.org; receiver=lists.ozlabs.org)
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W2fXC63Lsz3cTS
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Jun 2024 16:06:19 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=yUS2iT/5Ns+DBWa4sOqPiiTpW5do+ruhfRfUiDEShWo=; b=guhcPlS/XgOuKYq4PA9jwEJ1Mm
	wjGQambf6XhIV/WMxs6kFqYaaHdFwvX6RWdpisscMw/wZ4WZsA+kBdl3+w11wI64QzozuUw29fCzF
	6bcDqzUSjDf9S0c+iNFHOFpOaM4r3xPA7y9i2B22SLB/iHL8jg8OiIaZ5p0BiZ12ZoIHUAP/V5Phy
	CaqhmT48hLkZcOQmzg39tPBxUdTSF6LnbixjqSNUesHltqV6UJpGD66vOEwdq7R391N+2LJtveGqS
	OXm/2K7ni7fxsGeEBERanjYsCQ59EcXOvmPmxbR6wdKf8nAs0DNy0rPkfkuV/Q20bN324P+kRTZvf
	Ns6wRmFQ==;
Received: from [91.187.204.140] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJ5VB-00000009ISa-1G1W;
	Mon, 17 Jun 2024 06:06:01 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Subject: [PATCH 09/26] virtio_blk: remove virtblk_update_cache_mode
Date: Mon, 17 Jun 2024 08:04:36 +0200
Message-ID: <20240617060532.127975-10-hch@lst.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240617060532.127975-1-hch@lst.de>
References: <20240617060532.127975-1-hch@lst.de>
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
Cc: nvdimm@lists.linux.dev, "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, linux-nvme@lists.infradead.org, Song Liu <song@kernel.org>, linux-mtd@lists.infradead.org, Vineeth Vijayan <vneethv@linux.ibm.com>, Alasdair Kergon <agk@redhat.com>, drbd-dev@lists.linbit.com, linux-s390@vger.kernel.org, Bart Van Assche <bvanassche@acm.org>, linux-scsi@vger.kernel.org, Richard Weinberger <richard@nod.at>, Geert Uytterhoeven <geert@linux-m68k.org>, Yu Kuai <yukuai3@huawei.com>, dm-devel@lists.linux.dev, linux-um@lists.infradead.org, Mike Snitzer <snitzer@kernel.org>, Josef Bacik <josef@toxicpanda.com>, nbd@other.debian.org, linux-raid@vger.kernel.org, linux-m68k@lists.linux-m68k.org, Damien Le Moal <dlemoal@kernel.org>, Mikulas Patocka <mpatocka@redhat.com>, Hannes Reinecke <hare@suse.de>, Stefan Hajnoczi <stefanha@redhat.com>, xen-devel@lists.xenproject.org, ceph-devel@vger.kernel.org, Ming Lei <ming.lei@redhat.com>, linux-bcache@vger.kernel.org, linux-block@vger.kernel.org, "Martin K. Petersen" <martin.petersen@oracle.com>, Johannes Thumshirn <johannes.thumshirn@wdc.com>, linux-mmc@vger.kernel.org, Philipp Reisner <philipp.reisner@linbit.com>, =?UTF-8?q?Christoph=20B=C3=B6hmwalder?= <christoph.boehmwalder@linbit.com>, virtualization@lists.linux.dev, Lars Ellenberg <lars.ellenberg@linbit.com>, linuxppc-dev@lists.ozlabs.org, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

virtblk_update_cache_mode boils down to a single call to
blk_queue_write_cache.  Remove it in preparation for moving the cache
control flags into the queue_limits.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Bart Van Assche <bvanassche@acm.org>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Reviewed-by: Damien Le Moal <dlemoal@kernel.org>
Reviewed-by: Hannes Reinecke <hare@suse.de>
Reviewed-by: Johannes Thumshirn <johannes.thumshirn@wdc.com>
---
 drivers/block/virtio_blk.c | 13 +++----------
 1 file changed, 3 insertions(+), 10 deletions(-)

diff --git a/drivers/block/virtio_blk.c b/drivers/block/virtio_blk.c
index 2351f411fa4680..378b241911ca87 100644
--- a/drivers/block/virtio_blk.c
+++ b/drivers/block/virtio_blk.c
@@ -1089,14 +1089,6 @@ static int virtblk_get_cache_mode(struct virtio_device *vdev)
 	return writeback;
 }
 
-static void virtblk_update_cache_mode(struct virtio_device *vdev)
-{
-	u8 writeback = virtblk_get_cache_mode(vdev);
-	struct virtio_blk *vblk = vdev->priv;
-
-	blk_queue_write_cache(vblk->disk->queue, writeback, false);
-}
-
 static const char *const virtblk_cache_types[] = {
 	"write through", "write back"
 };
@@ -1116,7 +1108,7 @@ cache_type_store(struct device *dev, struct device_attribute *attr,
 		return i;
 
 	virtio_cwrite8(vdev, offsetof(struct virtio_blk_config, wce), i);
-	virtblk_update_cache_mode(vdev);
+	blk_queue_write_cache(disk->queue, virtblk_get_cache_mode(vdev), false);
 	return count;
 }
 
@@ -1528,7 +1520,8 @@ static int virtblk_probe(struct virtio_device *vdev)
 	vblk->index = index;
 
 	/* configure queue flush support */
-	virtblk_update_cache_mode(vdev);
+	blk_queue_write_cache(vblk->disk->queue, virtblk_get_cache_mode(vdev),
+			false);
 
 	/* If disk is read-only in the host, the guest should obey */
 	if (virtio_has_feature(vdev, VIRTIO_BLK_F_RO))
-- 
2.43.0

