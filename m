Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C50A398247
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Jun 2021 08:58:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fw0Gg045dz3cX2
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Jun 2021 16:58:03 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=JAbKOuEt;
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
 header.s=bombadil.20210309 header.b=JAbKOuEt; 
 dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fw0Bv33wzz307N
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Jun 2021 16:54:47 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=KlBRFDn8CKBuz4Jtw5oxvJwFPJCrn3leZL7f/TB5v/I=; b=JAbKOuEt/ZwlI1Cb8jU8PIVTi0
 rWrP2Q0oyjZ1qHxdn5YfZWmZGCE1OX7t/Z5qHClzdMNkXAAV2MvEk5MtF+zy9GIwLRfySkORmJitv
 hBUNmjxZRc5StQgvgrScxkKXoprJTIDdzdZyS8U/8FI6Ub7l742n47gp+1BOs+WlJvaHsKwHFkDWB
 xBui56bbOzKQ99aHIVAIpMOWuKdRjPxfD/L6mOHl825ZMYqNbqTRQR2bdCKOIAofpqO2q95xIdQCk
 qchgx4WVGIXqbErN5FqxXen4FaqChWEu053VwmNbr8IDVXg22x1cC2laSwL86K80z+bhdU0MJo1y9
 XRk5+uaA==;
Received: from shol69.static.otenet.gr ([83.235.170.67] helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1loKln-0025P8-FW; Wed, 02 Jun 2021 06:54:28 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Subject: [PATCH 07/30] ms_block: use blk_mq_alloc_disk
Date: Wed,  2 Jun 2021 09:53:22 +0300
Message-Id: <20210602065345.355274-8-hch@lst.de>
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
 drivers/memstick/core/ms_block.c | 25 ++++++++++---------------
 1 file changed, 10 insertions(+), 15 deletions(-)

diff --git a/drivers/memstick/core/ms_block.c b/drivers/memstick/core/ms_block.c
index 0bacf4268f83..dac258d12aca 100644
--- a/drivers/memstick/core/ms_block.c
+++ b/drivers/memstick/core/ms_block.c
@@ -2110,21 +2110,17 @@ static int msb_init_disk(struct memstick_dev *card)
 	if (msb->disk_id  < 0)
 		return msb->disk_id;
 
-	msb->disk = alloc_disk(0);
-	if (!msb->disk) {
-		rc = -ENOMEM;
+	rc = blk_mq_alloc_sq_tag_set(&msb->tag_set, &msb_mq_ops, 2,
+				     BLK_MQ_F_SHOULD_MERGE);
+	if (rc)
 		goto out_release_id;
-	}
 
-	msb->queue = blk_mq_init_sq_queue(&msb->tag_set, &msb_mq_ops, 2,
-						BLK_MQ_F_SHOULD_MERGE);
-	if (IS_ERR(msb->queue)) {
-		rc = PTR_ERR(msb->queue);
-		msb->queue = NULL;
-		goto out_put_disk;
+	msb->disk = blk_mq_alloc_disk(&msb->tag_set, card);
+	if (IS_ERR(msb->disk)) {
+		rc = PTR_ERR(msb->disk);
+		goto out_free_tag_set;
 	}
-
-	msb->queue->queuedata = card;
+	msb->queue = msb->disk->queue;
 
 	blk_queue_max_hw_sectors(msb->queue, MS_BLOCK_MAX_PAGES);
 	blk_queue_max_segments(msb->queue, MS_BLOCK_MAX_SEGS);
@@ -2135,7 +2131,6 @@ static int msb_init_disk(struct memstick_dev *card)
 	sprintf(msb->disk->disk_name, "msblk%d", msb->disk_id);
 	msb->disk->fops = &msb_bdops;
 	msb->disk->private_data = msb;
-	msb->disk->queue = msb->queue;
 
 	capacity = msb->pages_in_block * msb->logical_block_count;
 	capacity *= (msb->page_size / 512);
@@ -2155,8 +2150,8 @@ static int msb_init_disk(struct memstick_dev *card)
 	dbg("Disk added");
 	return 0;
 
-out_put_disk:
-	put_disk(msb->disk);
+out_free_tag_set:
+	blk_mq_free_tag_set(&msb->tag_set);
 out_release_id:
 	mutex_lock(&msb_disk_lock);
 	idr_remove(&msb_disk_idr, msb->disk_id);
-- 
2.30.2

