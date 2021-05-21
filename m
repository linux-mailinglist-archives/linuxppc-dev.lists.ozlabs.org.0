Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DB4738BEAD
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 May 2021 07:54:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FmbQL6dzpz3byS
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 May 2021 15:54:02 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=xq9A9Z8e;
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
 header.s=bombadil.20210309 header.b=xq9A9Z8e; 
 dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FmbMw5JnNz300C
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 May 2021 15:51:56 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=1KdYzfXqf/AERVzTv9z5UW/YMYv05Ana4DxpCQVjBTA=; b=xq9A9Z8erGEHVAGm0y4W1ssW4B
 bb/K9MUHbMuoVGNlfX9cJCB14iacwKSwXk7TdvCpIx2RxxICboV5tmPE4X/N9SZq5B4dzwR/5N/Fy
 N8DTXkQ+12tJv83iu+WgSF6sZJFAldFQ0/6VETpIPNgv5mQuK/C7Ku8InIiAIj86nkVr5QzS88P3O
 QfkTjhwZz9jT+G8mbiPnuWamP+iJ2j1NKF53nRqZ/I/4rjpt2kep8q5iwHsBl3rPvXHX0RZCEq31O
 2aH4CE8oZZ+ivSh8MVwEJEMnmnARX7PDrb47eGLTaD7dDzvMN71vZxbD8VJkcoTnpS1yrvC7YAnxS
 9MpO4XSg==;
Received: from [2001:4bb8:180:5add:4fd7:4137:d2f2:46e6] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
 id 1ljy4K-00Gpxo-3Z; Fri, 21 May 2021 05:51:32 +0000
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
Subject: [PATCH 04/26] block: add a flag to make put_disk on partially
 initalized disks safer
Date: Fri, 21 May 2021 07:50:54 +0200
Message-Id: <20210521055116.1053587-5-hch@lst.de>
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

Add a flag to indicate that __device_add_disk did grab a queue reference
so that disk_release only drops it if we actually had it.  This sort
out one of the major pitfals with partially initialized gendisk that
a lot of drivers did get wrong or still do.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 block/genhd.c         | 7 +++++--
 include/linux/genhd.h | 1 +
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/block/genhd.c b/block/genhd.c
index eec266c9318d..e4974af3d729 100644
--- a/block/genhd.c
+++ b/block/genhd.c
@@ -541,7 +541,10 @@ static void __device_add_disk(struct device *parent, struct gendisk *disk,
 	 * Take an extra ref on queue which will be put on disk_release()
 	 * so that it sticks around as long as @disk is there.
 	 */
-	WARN_ON_ONCE(!blk_get_queue(disk->queue));
+	if (blk_get_queue(disk->queue))
+		set_bit(GD_QUEUE_REF, &disk->state);
+	else
+		WARN_ON_ONCE(1);
 
 	disk_add_events(disk);
 	blk_integrity_add(disk);
@@ -1116,7 +1119,7 @@ static void disk_release(struct device *dev)
 	kfree(disk->random);
 	xa_destroy(&disk->part_tbl);
 	bdput(disk->part0);
-	if (disk->queue)
+	if (test_bit(GD_QUEUE_REF, &disk->state) && disk->queue)
 		blk_put_queue(disk->queue);
 	kfree(disk);
 }
diff --git a/include/linux/genhd.h b/include/linux/genhd.h
index 7e9660ea967d..a5443f0b139d 100644
--- a/include/linux/genhd.h
+++ b/include/linux/genhd.h
@@ -153,6 +153,7 @@ struct gendisk {
 	unsigned long state;
 #define GD_NEED_PART_SCAN		0
 #define GD_READ_ONLY			1
+#define GD_QUEUE_REF			2
 	struct kobject *slave_dir;
 
 	struct timer_rand_state *random;
-- 
2.30.2

