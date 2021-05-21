Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0106C38BEC4
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 May 2021 07:58:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FmbWN6yBjz3dvH
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 May 2021 15:58:24 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=FP2W445o;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=bombadil.srs.infradead.org (client-ip=2607:7c80:54:e::133;
 helo=bombadil.infradead.org;
 envelope-from=batv+940d4f53d1157bf1ee93+6480+infradead.org+hch@bombadil.srs.infradead.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=bombadil.20210309 header.b=FP2W445o; 
 dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FmbNM3v11z3btB
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 May 2021 15:52:19 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=4szuJYmR11pD2G4fH+QS+nxV5W8Ptmu52A+D0MN3nXg=; b=FP2W445ofVpl9uQMnmJieRiFy+
 QSv42mqlYEUVOOs+asx3KXcv0geXkpNMKZYXZAXP5p2y5+O45wO/WtFx3rDgToiWABOEyDIVtpmjr
 nAetv60YXcfz7h3701O7QfQp/Bh4cTEotj4KGj86xIr/Lve1UUvC0q2IezjSHzTn2KDLMeiOuXjg6
 +Iw/b/oJzQZCMYctV7ZGw1Y/0OMW33VtBV8Dy8/TxvYxqHcuMiKyU0A8q93uIeEgKcBHabIySrOrl
 cCkjZfAGYIJjd+8jz6ouAlw4OTY1qfClEpJxeB07hWIxuyvo4rDSuofjhAY5KzCvn1EOjHXQWVmcd
 uR3swFoA==;
Received: from [2001:4bb8:180:5add:4fd7:4137:d2f2:46e6] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
 id 1ljy4l-00Gq2r-6Q; Fri, 21 May 2021 05:51:59 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Chris Zankel <chris@zankel.net>, Max Filippov <jcmvbkbc@gmail.com>,
 Philipp Reisner <philipp.reisner@linbit.com>,
 Lars Ellenberg <lars.ellenberg@linbit.com>, Jim Paris <jim@jtan.com>,
 Joshua Morris <josh.h.morris@us.ibm.com>,
 Philip Kelleher <pjk1939@linux.ibm.com>, Minchan Kim <minchan@kernel.org>,
 Nitin Gupta <ngupta@vflare.org>, Matias Bjorling <mb@lightnvm.io>,
 Coly Li <colyli@suse.de>, Mike Snitzer <snitzer@redhat.com>,
 Song Liu <song@kernel.org>, Maxim Levitsky <maximlevitsky@gmail.com>,
 Alex Dubov <oakad@yahoo.com>, Ulf Hansson <ulf.hansson@linaro.org>,
 Dan Williams <dan.j.williams@intel.com>,
 Vishal Verma <vishal.l.verma@intel.com>, Dave Jiang <dave.jiang@intel.com>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>
Subject: [PATCH 13/26] dm: convert to blk_alloc_disk/blk_cleanup_disk
Date: Fri, 21 May 2021 07:51:03 +0200
Message-Id: <20210521055116.1053587-14-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210521055116.1053587-1-hch@lst.de>
References: <20210521055116.1053587-1-hch@lst.de>
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
Cc: linux-bcache@vger.kernel.org, linux-xtensa@linux-xtensa.org,
 linux-raid@vger.kernel.org, nvdimm@lists.linux.dev, linux-s390@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
 linux-nvme@lists.infradead.org, linux-block@vger.kernel.org,
 dm-devel@redhat.com, linuxppc-dev@lists.ozlabs.org, drbd-dev@lists.linbit.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Convert the dm driver to use the blk_alloc_disk and blk_cleanup_disk
helpers to simplify gendisk and request_queue allocation.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/md/dm.c | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/drivers/md/dm.c b/drivers/md/dm.c
index ca2aedd8ee7d..3c7c2d257018 100644
--- a/drivers/md/dm.c
+++ b/drivers/md/dm.c
@@ -1801,13 +1801,13 @@ static void cleanup_mapped_device(struct mapped_device *md)
 		md->disk->private_data = NULL;
 		spin_unlock(&_minor_lock);
 		del_gendisk(md->disk);
-		put_disk(md->disk);
 	}
 
-	if (md->queue) {
+	if (md->queue)
 		dm_queue_destroy_keyslot_manager(md->queue);
-		blk_cleanup_queue(md->queue);
-	}
+
+	if (md->disk)
+		blk_cleanup_disk(md->disk);
 
 	cleanup_srcu_struct(&md->io_barrier);
 
@@ -1869,13 +1869,10 @@ static struct mapped_device *alloc_dev(int minor)
 	 * established. If request-based table is loaded: blk-mq will
 	 * override accordingly.
 	 */
-	md->queue = blk_alloc_queue(numa_node_id);
-	if (!md->queue)
-		goto bad;
-
-	md->disk = alloc_disk_node(1, md->numa_node_id);
+	md->disk = blk_alloc_disk(md->numa_node_id);
 	if (!md->disk)
 		goto bad;
+	md->queue = md->disk->queue;
 
 	init_waitqueue_head(&md->wait);
 	INIT_WORK(&md->work, dm_wq_work);
@@ -1888,6 +1885,7 @@ static struct mapped_device *alloc_dev(int minor)
 
 	md->disk->major = _major;
 	md->disk->first_minor = minor;
+	md->disk->minors = 1;
 	md->disk->fops = &dm_blk_dops;
 	md->disk->queue = md->queue;
 	md->disk->private_data = md;
-- 
2.30.2

