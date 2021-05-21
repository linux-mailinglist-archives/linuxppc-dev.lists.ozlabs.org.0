Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BD86238BEB4
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 May 2021 07:54:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FmbQp5bfPz308F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 May 2021 15:54:26 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=hQ935sAL;
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
 header.s=bombadil.20210309 header.b=hQ935sAL; 
 dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FmbMx2lSyz2yyv
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 May 2021 15:51:57 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=9gxzUTksSCPmzNu3uikLvND31EJ5aydX0p4jRS3yWUM=; b=hQ935sAL5428xOK5g3d57WQyEz
 nh68qg6eMmErNuHz/MRa0ELXgEszKLPVM31ef3SugWspRAaNYnPTPGax6lAf9hW5umji1yI9L0r9q
 zqB9wajpkl4QOrF5LKPCE5QHEs3C8NFjfTJoLe1kqUzFDFr5Wkf1bzleebN141ybNQ7ct85qIw46U
 SZWrAsyFjKaGWQagXOdQM2MsN5rkD0C9nKWtwK8XCfXJh6IfaHEW/ltD4Rgh6KNlYzOMlOn3j1x0U
 I4AtrUAheMMI1zVQMhZG72WLBfzFTPQS89jlunzjjceu3/rS5fqmFLNZ2NCs6uRTOpVd4bqw95DTy
 QjJuMyyA==;
Received: from [2001:4bb8:180:5add:4fd7:4137:d2f2:46e6] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
 id 1ljy4N-00Gpy6-5p; Fri, 21 May 2021 05:51:35 +0000
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
Subject: [PATCH 05/26] block: add blk_alloc_disk and blk_cleanup_disk APIs
Date: Fri, 21 May 2021 07:50:55 +0200
Message-Id: <20210521055116.1053587-6-hch@lst.de>
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

Add two new APIs to allocate and free a gendisk including the
request_queue for use with BIO based drivers.  This is to avoid
boilerplate code in drivers.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 block/genhd.c         | 35 +++++++++++++++++++++++++++++++++++
 include/linux/genhd.h | 22 ++++++++++++++++++++++
 2 files changed, 57 insertions(+)

diff --git a/block/genhd.c b/block/genhd.c
index e4974af3d729..6d4ce962866d 100644
--- a/block/genhd.c
+++ b/block/genhd.c
@@ -1302,6 +1302,25 @@ struct gendisk *__alloc_disk_node(int minors, int node_id)
 }
 EXPORT_SYMBOL(__alloc_disk_node);
 
+struct gendisk *__blk_alloc_disk(int node)
+{
+	struct request_queue *q;
+	struct gendisk *disk;
+
+	q = blk_alloc_queue(node);
+	if (!q)
+		return NULL;
+
+	disk = __alloc_disk_node(0, node);
+	if (!disk) {
+		blk_cleanup_queue(q);
+		return NULL;
+	}
+	disk->queue = q;
+	return disk;
+}
+EXPORT_SYMBOL(__blk_alloc_disk);
+
 /**
  * put_disk - decrements the gendisk refcount
  * @disk: the struct gendisk to decrement the refcount for
@@ -1319,6 +1338,22 @@ void put_disk(struct gendisk *disk)
 }
 EXPORT_SYMBOL(put_disk);
 
+/**
+ * blk_cleanup_disk - shutdown a gendisk allocated by blk_alloc_disk
+ * @disk: gendisk to shutdown
+ *
+ * Mark the queue hanging off @disk DYING, drain all pending requests, then mark
+ * the queue DEAD, destroy and put it and the gendisk structure.
+ *
+ * Context: can sleep
+ */
+void blk_cleanup_disk(struct gendisk *disk)
+{
+	blk_cleanup_queue(disk->queue);
+	put_disk(disk);
+}
+EXPORT_SYMBOL(blk_cleanup_disk);
+
 static void set_disk_ro_uevent(struct gendisk *gd, int ro)
 {
 	char event[] = "DISK_RO=1";
diff --git a/include/linux/genhd.h b/include/linux/genhd.h
index a5443f0b139d..03aa12730634 100644
--- a/include/linux/genhd.h
+++ b/include/linux/genhd.h
@@ -278,6 +278,28 @@ extern void put_disk(struct gendisk *disk);
 
 #define alloc_disk(minors) alloc_disk_node(minors, NUMA_NO_NODE)
 
+/**
+ * blk_alloc_disk - allocate a gendisk structure
+ * @node_id: numa node to allocate on
+ *
+ * Allocate and pre-initialize a gendisk structure for use with BIO based
+ * drivers.
+ *
+ * Context: can sleep
+ */
+#define blk_alloc_disk(node_id)						\
+({									\
+	struct gendisk *__disk = __blk_alloc_disk(node_id);		\
+	static struct lock_class_key __key;				\
+									\
+	if (__disk)							\
+		lockdep_init_map(&__disk->lockdep_map,			\
+			"(bio completion)", &__key, 0);			\
+	__disk;								\
+})
+struct gendisk *__blk_alloc_disk(int node);
+void blk_cleanup_disk(struct gendisk *disk);
+
 int __register_blkdev(unsigned int major, const char *name,
 		void (*probe)(dev_t devt));
 #define register_blkdev(major, name) \
-- 
2.30.2

