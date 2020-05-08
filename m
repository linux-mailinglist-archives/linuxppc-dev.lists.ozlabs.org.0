Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 02B3B1CB5C0
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 May 2020 19:22:58 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49Jcbg2243zDrBB
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 May 2020 03:22:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=bombadil.srs.infradead.org (client-ip=2607:7c80:54:e::133;
 helo=bombadil.infradead.org;
 envelope-from=batv+ade674efe42abf9194a0+6102+infradead.org+hch@bombadil.srs.infradead.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=infradead.org header.i=@infradead.org
 header.a=rsa-sha256 header.s=bombadil.20170209 header.b=pWId5DxI; 
 dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49Jb6l6tZvzDqdl
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  9 May 2020 02:16:15 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=+Yv7C4jWhNdI5E7GDESk/+lrv1mE06qtLyi6ilmMLLY=; b=pWId5DxIEtBm9Nf0k8N070gCl6
 rkH5BRP1mzZwaakcYgsq8xK46fNXt3mXqwGxDCICzFKzl+Z47yC9p2tm1g4fzmWMdM///1Fpnxxdc
 dxpYIh5MxiEKCcGT87F9/ugi5LnknMTbIFOr/nJRf0iThPSnRbTXKMn51g9c2Xez5GarT+vD9P7Ak
 eUEWL0mIXwL17SNv/XTZUucc5oIZVnAkGEGBXnO1Mb+NnTzjuhKA4/lGOmVT4+3YknsXWSUxBRg3Z
 A0vzLDAjfS2ryjq0rbU6cf+DSLkR9wrwUCvXLnS+mddUZs2+K42avBd19dI9dUmSr3yYujVmP1MAb
 uwkA76nQ==;
Received: from [2001:4bb8:180:9d3f:90d7:9df8:7cd:3504] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jX5fT-0004qF-GE; Fri, 08 May 2020 16:16:08 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Subject: [PATCH 15/15] nvdimm/pmem: stop using ->queuedata
Date: Fri,  8 May 2020 18:15:17 +0200
Message-Id: <20200508161517.252308-16-hch@lst.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200508161517.252308-1-hch@lst.de>
References: <20200508161517.252308-1-hch@lst.de>
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
 linux-raid@vger.kernel.org,
 Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>,
 linux-nvdimm@lists.01.org, Geoff Levand <geoff@infradead.org>,
 linux-kernel@vger.kernel.org, Jim Paris <jim@jtan.com>,
 linux-block@vger.kernel.org, Minchan Kim <minchan@kernel.org>,
 linux-m68k@lists.linux-m68k.org, Philip Kelleher <pjk1939@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org, Joshua Morris <josh.h.morris@us.ibm.com>,
 Nitin Gupta <ngupta@vflare.org>, drbd-dev@lists.linbit.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/nvdimm/pmem.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/nvdimm/pmem.c b/drivers/nvdimm/pmem.c
index 2df6994acf836..f8dc5941215bf 100644
--- a/drivers/nvdimm/pmem.c
+++ b/drivers/nvdimm/pmem.c
@@ -196,7 +196,7 @@ static blk_qc_t pmem_make_request(struct request_queue *q, struct bio *bio)
 	unsigned long start;
 	struct bio_vec bvec;
 	struct bvec_iter iter;
-	struct pmem_device *pmem = q->queuedata;
+	struct pmem_device *pmem = bio->bi_disk->private_data;
 	struct nd_region *nd_region = to_region(pmem);
 
 	if (bio->bi_opf & REQ_PREFLUSH)
@@ -231,7 +231,7 @@ static blk_qc_t pmem_make_request(struct request_queue *q, struct bio *bio)
 static int pmem_rw_page(struct block_device *bdev, sector_t sector,
 		       struct page *page, unsigned int op)
 {
-	struct pmem_device *pmem = bdev->bd_queue->queuedata;
+	struct pmem_device *pmem = bdev->bd_disk->private_data;
 	blk_status_t rc;
 
 	if (op_is_write(op))
@@ -464,7 +464,6 @@ static int pmem_attach_disk(struct device *dev,
 	blk_queue_flag_set(QUEUE_FLAG_NONROT, q);
 	if (pmem->pfn_flags & PFN_MAP)
 		blk_queue_flag_set(QUEUE_FLAG_DAX, q);
-	q->queuedata = pmem;
 
 	disk = alloc_disk_node(0, nid);
 	if (!disk)
@@ -474,6 +473,7 @@ static int pmem_attach_disk(struct device *dev,
 	disk->fops		= &pmem_fops;
 	disk->queue		= q;
 	disk->flags		= GENHD_FL_EXT_DEVT;
+	disk->private_data	= pmem;
 	disk->queue->backing_dev_info->capabilities |= BDI_CAP_SYNCHRONOUS_IO;
 	nvdimm_namespace_disk_name(ndns, disk->disk_name);
 	set_capacity(disk, (pmem->size - pmem->pfn_pad - pmem->data_offset)
-- 
2.26.2

