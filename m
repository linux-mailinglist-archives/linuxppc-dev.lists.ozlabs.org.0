Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AEE1390A472
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Jun 2024 08:10:51 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=llkTt4L3;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W2fdN35wwz3cb0
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Jun 2024 16:10:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=llkTt4L3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=bombadil.srs.infradead.org (client-ip=2607:7c80:54:3::133; helo=bombadil.infradead.org; envelope-from=batv+625ba2f6da96caf54eae+7603+infradead.org+hch@bombadil.srs.infradead.org; receiver=lists.ozlabs.org)
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W2fWy1Nd0z3cRs
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Jun 2024 16:06:06 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=EPlnKHc6KVQAGCnJTSwoLIbiGwof+yF2y8+P5dJEJJ0=; b=llkTt4L32bZ6iyFMLz9Re3O+um
	iBesDRlpJplF5nHKNSh9FM0jpEe2/c66MfT8Bt/I1nw3hw6WP3McM1ajYl6Y1akvjTAolpU25D5JY
	zxQH4i7zPokPqm5UkzIl4783o8GnN2m4K/RS5AtmFVCYJcpZ3vZt5g+K47MvjTQm5CtyFVe/fT2ke
	rYC4/lp/vaeglMrAYZeyvuSQ+AfGZLWPNk1KjYLCo1XrUC4Y0ScTkPZVT9290YdJiktz1OhCGdE8A
	9KDp18wzMDrbO5CYMJwbFfExWY8OcnNQBZ7aJNtMQI7HjejZThxD8rHbzNSixEEcMAQtF1g5wpqRb
	QL0nnnug==;
Received: from [91.187.204.140] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJ5V2-00000009IL0-1TcV;
	Mon, 17 Jun 2024 06:05:53 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Subject: [PATCH 06/26] loop: regularize upgrading the block size for direct I/O
Date: Mon, 17 Jun 2024 08:04:33 +0200
Message-ID: <20240617060532.127975-7-hch@lst.de>
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
Cc: nvdimm@lists.linux.dev, "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, linux-nvme@lists.infradead.org, Song Liu <song@kernel.org>, linux-mtd@lists.infradead.org, Vineeth Vijayan <vneethv@linux.ibm.com>, Alasdair Kergon <agk@redhat.com>, drbd-dev@lists.linbit.com, linux-s390@vger.kernel.org, Bart Van Assche <bvanassche@acm.org>, linux-scsi@vger.kernel.org, Richard Weinberger <richard@nod.at>, Geert Uytterhoeven <geert@linux-m68k.org>, Yu Kuai <yukuai3@huawei.com>, dm-devel@lists.linux.dev, linux-um@lists.infradead.org, Mike Snitzer <snitzer@kernel.org>, Josef Bacik <josef@toxicpanda.com>, nbd@other.debian.org, linux-raid@vger.kernel.org, linux-m68k@lists.linux-m68k.org, Mikulas Patocka <mpatocka@redhat.com>, Hannes Reinecke <hare@suse.de>, xen-devel@lists.xenproject.org, ceph-devel@vger.kernel.org, Ming Lei <ming.lei@redhat.com>, linux-bcache@vger.kernel.org, linux-block@vger.kernel.org, "Martin K. Petersen" <martin.petersen@oracle.com>, linux-mmc@vger.kernel.org, Philipp Reisner <philipp.reisner@linbit.com>, =?UTF-8?q?Christoph=20B=C3=B6hmwalder?= <christoph.boehmwalder@linbit.com>, virtualization@lists.linux.dev, Lars Ellenberg <lars.ellenberg@linbit.com>, linuxppc-dev@lists.ozlabs.org, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The LOOP_CONFIGURE path automatically upgrades the block size to that
of the underlying file for O_DIRECT file descriptors, but the
LOOP_SET_BLOCK_SIZE path does not.  Fix this by lifting the code to
pick the block size into common code.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Hannes Reinecke <hare@suse.de>
Reviewed-by: Bart Van Assche <bvanassche@acm.org>
---
 drivers/block/loop.c | 25 +++++++++++++++----------
 1 file changed, 15 insertions(+), 10 deletions(-)

diff --git a/drivers/block/loop.c b/drivers/block/loop.c
index ce197cbea5f434..eea3e4919e356e 100644
--- a/drivers/block/loop.c
+++ b/drivers/block/loop.c
@@ -975,10 +975,24 @@ loop_set_status_from_info(struct loop_device *lo,
 	return 0;
 }
 
+static unsigned short loop_default_blocksize(struct loop_device *lo,
+		struct block_device *backing_bdev)
+{
+	/* In case of direct I/O, match underlying block size */
+	if ((lo->lo_backing_file->f_flags & O_DIRECT) && backing_bdev)
+		return bdev_logical_block_size(backing_bdev);
+	return SECTOR_SIZE;
+}
+
 static int loop_reconfigure_limits(struct loop_device *lo, unsigned short bsize)
 {
+	struct file *file = lo->lo_backing_file;
+	struct inode *inode = file->f_mapping->host;
 	struct queue_limits lim;
 
+	if (!bsize)
+		bsize = loop_default_blocksize(lo, inode->i_sb->s_bdev);
+
 	lim = queue_limits_start_update(lo->lo_queue);
 	lim.logical_block_size = bsize;
 	lim.physical_block_size = bsize;
@@ -997,7 +1011,6 @@ static int loop_configure(struct loop_device *lo, blk_mode_t mode,
 	int error;
 	loff_t size;
 	bool partscan;
-	unsigned short bsize;
 	bool is_loop;
 
 	if (!file)
@@ -1076,15 +1089,7 @@ static int loop_configure(struct loop_device *lo, blk_mode_t mode,
 	if (!(lo->lo_flags & LO_FLAGS_READ_ONLY) && file->f_op->fsync)
 		blk_queue_write_cache(lo->lo_queue, true, false);
 
-	if (config->block_size)
-		bsize = config->block_size;
-	else if ((lo->lo_backing_file->f_flags & O_DIRECT) && inode->i_sb->s_bdev)
-		/* In case of direct I/O, match underlying block size */
-		bsize = bdev_logical_block_size(inode->i_sb->s_bdev);
-	else
-		bsize = 512;
-
-	error = loop_reconfigure_limits(lo, bsize);
+	error = loop_reconfigure_limits(lo, config->block_size);
 	if (WARN_ON_ONCE(error))
 		goto out_unlock;
 
-- 
2.43.0

