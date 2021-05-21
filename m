Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3120738BEA6
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 May 2021 07:53:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FmbPt199Wz302c
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 May 2021 15:53:38 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=VQHH4gc8;
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
 header.s=bombadil.20210309 header.b=VQHH4gc8; 
 dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FmbMv1BqHz2yxx
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 May 2021 15:51:52 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=vrlb3gpQ3AYuNPBe0/RrPeHNlWaUD2yiPPU9OkXw7SA=; b=VQHH4gc8hGbhrYI2cy69ffXSDw
 oYi4GpD7bbQjpNMBTtJ8H9VWdXRHozJga5WXgc+9I+NN8vamOZmNK8lS+l0UT65h5rNf9NOpp13V1
 4QW/UNF3EXrAbDo7ddmrGYPkPd1cSg4hFC+kF64Z5p75U6OB0xSvA0RA+NY/1GAY+F6pkw9zs//Sk
 zuR8KWVZ7sREZnzaV0cRQLytTYXotXfjDgYFhL8LG2gme3KttVFeM+XHyiptWcjFGI1D2zp5HtJUr
 ILl0ngtiAnyd8HBFksjcytYqjrZ5HvQXpfvczpCNHtsGFTbWzmCQdtltW/wUx6BwPF4Z59m7YLR10
 v0V40Ilw==;
Received: from [2001:4bb8:180:5add:4fd7:4137:d2f2:46e6] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
 id 1ljy4D-00Gpwy-OY; Fri, 21 May 2021 05:51:26 +0000
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
Subject: [PATCH 02/26] block: move the DISK_MAX_PARTS sanity check into
 __device_add_disk
Date: Fri, 21 May 2021 07:50:52 +0200
Message-Id: <20210521055116.1053587-3-hch@lst.de>
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

Keep this together with the first place that actually looks at
->minors and prepare for not passing a minors argument to
alloc_disk.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 block/genhd.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/block/genhd.c b/block/genhd.c
index 2c00bc3261d9..7f9beaeede11 100644
--- a/block/genhd.c
+++ b/block/genhd.c
@@ -491,6 +491,12 @@ static void __device_add_disk(struct device *parent, struct gendisk *disk,
 	 */
 	if (disk->major) {
 		WARN_ON(!disk->minors);
+
+		if (disk->minors > DISK_MAX_PARTS) {
+			pr_err("block: can't allocate more than %d partitions\n",
+				DISK_MAX_PARTS);
+			disk->minors = DISK_MAX_PARTS;
+		}
 	} else {
 		WARN_ON(disk->minors);
 		WARN_ON(!(disk->flags & (GENHD_FL_EXT_DEVT | GENHD_FL_HIDDEN)));
@@ -1264,13 +1270,6 @@ struct gendisk *__alloc_disk_node(int minors, int node_id)
 {
 	struct gendisk *disk;
 
-	if (minors > DISK_MAX_PARTS) {
-		printk(KERN_ERR
-			"block: can't allocate more than %d partitions\n",
-			DISK_MAX_PARTS);
-		minors = DISK_MAX_PARTS;
-	}
-
 	disk = kzalloc_node(sizeof(struct gendisk), GFP_KERNEL, node_id);
 	if (!disk)
 		return NULL;
-- 
2.30.2

