Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A9F1920DD06
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Jun 2020 22:58:38 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49wfwW5Gk8zDqM7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jun 2020 06:58:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=casper.srs.infradead.org (client-ip=2001:8b0:10b:1236::1;
 helo=casper.infradead.org;
 envelope-from=batv+0d14f5278154a06d8b22+6154+infradead.org+hch@casper.srs.infradead.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=infradead.org header.i=@infradead.org
 header.a=rsa-sha256 header.s=casper.20170209 header.b=ClUIhM5P; 
 dkim-atps=neutral
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49wdBg3VH9zDqZL
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Jun 2020 05:40:43 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=+VUsfxrjDzYG99zFj0wkRp/eNVFFwqpSgTudJApaDRc=; b=ClUIhM5P87fWnhwG77qgv4ShjY
 DPdnO0m4b9MJ04nN4PqcbgI0z5SMxykwgpOVMEcT/XLrgTjSoYwjFRVP06FH1yuM/uIfExa6QQWwY
 TQT6gkp11h03zqvfmWXNVCto7YurF9/Uh2Hd2KxOXwdmmM+i9XbPkIyYkUkRYpkL3ZAN8ZpsQyn/C
 I4zB805yEcbYIgxQtYH5hZNqLK7OYOBdn+9jy+pDoAUgHxN3V4miNikHoirBFpOL5dCLn6nb/+L+G
 2Pjw4B+QypXWc4s9A5PbOHPIJwjWWl86mWmyIDuqSxeKvB8P01EbSaLvMNZf10ps9jlCd1W7PjTRN
 hzGI6NLg==;
Received: from [2001:4bb8:184:76e3:fcca:c8dc:a4bf:12fa] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jpzdm-0004Pf-Ph; Mon, 29 Jun 2020 19:40:31 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Subject: [PATCH 20/20] block: remove direct_make_request
Date: Mon, 29 Jun 2020 21:39:47 +0200
Message-Id: <20200629193947.2705954-21-hch@lst.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200629193947.2705954-1-hch@lst.de>
References: <20200629193947.2705954-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
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
 linux-nvdimm@lists.01.org, linux-s390@vger.kernel.org, dm-devel@redhat.com,
 linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-raid@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
 linuxppc-dev@lists.ozlabs.org, drbd-dev@lists.linbit.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Now that submit_bio_noacct has a decent blk-mq fast path there is no
more need for this bypass.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 block/blk-core.c              | 28 ----------------------------
 drivers/md/dm.c               |  5 +----
 drivers/nvme/host/multipath.c |  2 +-
 include/linux/blkdev.h        |  1 -
 4 files changed, 2 insertions(+), 34 deletions(-)

diff --git a/block/blk-core.c b/block/blk-core.c
index 46e3c0a37cc377..f127d83c4fafa5 100644
--- a/block/blk-core.c
+++ b/block/blk-core.c
@@ -1206,34 +1206,6 @@ blk_qc_t submit_bio_noacct(struct bio *bio)
 }
 EXPORT_SYMBOL(submit_bio_noacct);
 
-/**
- * direct_make_request - hand a buffer directly to its device driver for I/O
- * @bio:  The bio describing the location in memory and on the device.
- *
- * This function behaves like submit_bio_noacct(), but does not protect
- * against recursion.  Must only be used if the called driver is known
- * to be blk-mq based.
- */
-blk_qc_t direct_make_request(struct bio *bio)
-{
-	struct gendisk *disk = bio->bi_disk;
-
-	if (WARN_ON_ONCE(!disk->queue->mq_ops)) {
-		bio_io_error(bio);
-		return BLK_QC_T_NONE;
-	}
-	if (!submit_bio_checks(bio))
-		return BLK_QC_T_NONE;
-	if (unlikely(bio_queue_enter(bio)))
-		return BLK_QC_T_NONE;
-	if (!blk_crypto_bio_prep(&bio)) {
-		blk_queue_exit(disk->queue);
-		return BLK_QC_T_NONE;
-	}
-	return blk_mq_submit_bio(bio);
-}
-EXPORT_SYMBOL_GPL(direct_make_request);
-
 /**
  * submit_bio - submit a bio to the block device layer for I/O
  * @bio: The &struct bio which describes the I/O
diff --git a/drivers/md/dm.c b/drivers/md/dm.c
index b32b539dbace56..2cb33896198c4c 100644
--- a/drivers/md/dm.c
+++ b/drivers/md/dm.c
@@ -1302,10 +1302,7 @@ static blk_qc_t __map_bio(struct dm_target_io *tio)
 		/* the bio has been remapped so dispatch it */
 		trace_block_bio_remap(clone->bi_disk->queue, clone,
 				      bio_dev(io->orig_bio), sector);
-		if (md->type == DM_TYPE_NVME_BIO_BASED)
-			ret = direct_make_request(clone);
-		else
-			ret = submit_bio_noacct(clone);
+		ret = submit_bio_noacct(clone);
 		break;
 	case DM_MAPIO_KILL:
 		free_tio(tio);
diff --git a/drivers/nvme/host/multipath.c b/drivers/nvme/host/multipath.c
index f07fa47c251d9d..a986ac52c4cc7f 100644
--- a/drivers/nvme/host/multipath.c
+++ b/drivers/nvme/host/multipath.c
@@ -314,7 +314,7 @@ blk_qc_t nvme_ns_head_submit_bio(struct bio *bio)
 		trace_block_bio_remap(bio->bi_disk->queue, bio,
 				      disk_devt(ns->head->disk),
 				      bio->bi_iter.bi_sector);
-		ret = direct_make_request(bio);
+		ret = submit_bio_noacct(bio);
 	} else if (nvme_available_path(head)) {
 		dev_warn_ratelimited(dev, "no usable path - requeuing I/O\n");
 
diff --git a/include/linux/blkdev.h b/include/linux/blkdev.h
index b73cfa6a5141df..1cc913ffdbe21e 100644
--- a/include/linux/blkdev.h
+++ b/include/linux/blkdev.h
@@ -853,7 +853,6 @@ static inline void rq_flush_dcache_pages(struct request *rq)
 extern int blk_register_queue(struct gendisk *disk);
 extern void blk_unregister_queue(struct gendisk *disk);
 blk_qc_t submit_bio_noacct(struct bio *bio);
-extern blk_qc_t direct_make_request(struct bio *bio);
 extern void blk_rq_init(struct request_queue *q, struct request *rq);
 extern void blk_put_request(struct request *);
 extern struct request *blk_get_request(struct request_queue *, unsigned int op,
-- 
2.26.2

