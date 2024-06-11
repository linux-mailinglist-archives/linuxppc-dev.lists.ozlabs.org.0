Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B040090315F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jun 2024 07:38:30 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=f1hZ2SuH;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VyyBn0hCyz3cTD
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jun 2024 15:38:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=f1hZ2SuH;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=bombadil.srs.infradead.org (client-ip=2607:7c80:54:3::133; helo=bombadil.infradead.org; envelope-from=batv+2fedbe304aabaf399917+7597+infradead.org+hch@bombadil.srs.infradead.org; receiver=lists.ozlabs.org)
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Vyxpw0Byjz3cT2
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Jun 2024 15:21:12 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=MPwremY8Q7NX1Ef8RTwP3wepSQ5hhCHGmRWL/QC9GrI=; b=f1hZ2SuHKaMYNYDlKddtsMrEj4
	HhJ0iwXM6G2h13fzU48w2Wp1cg9nk2YZ6gpAuUou9ff1GYduJZ0WfzXf3shKgk6wyYrmmiGL51jtj
	XbNogudD9e403EfmIZRu+cHyfIbgFlIIY5jXRlKtfcYVvelaQBaiB5rariZryMc+5ShP0wImrZGUf
	HwPzDYeZDkEqyQ9JjhzMhbUEJgoB0ykUCUe71NZZ4iM8X9lzH0xXrhhtc3ukr1Zq2/qge7T4ojgtC
	PPW5bNUe9scd9Xqt6YR7LEPh7UJ5/vAECPRKTcBRuA2XxgnZmYKTh8weAU8h6E46qMGktD9WSYAY8
	XOMueOlQ==;
Received: from 2a02-8389-2341-5b80-cdb4-8e7d-405d-6b77.cable.dynamic.v6.surfer.at ([2a02:8389:2341:5b80:cdb4:8e7d:405d:6b77] helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGtw4-00000007Rfx-3Hsc;
	Tue, 11 Jun 2024 05:20:45 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Subject: [PATCH 24/26] block: move the pci_p2pdma flag to queue_limits
Date: Tue, 11 Jun 2024 07:19:24 +0200
Message-ID: <20240611051929.513387-25-hch@lst.de>
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

Move the pci_p2pdma flag into the queue_limits feature field so that it
can be set atomically and all I/O is frozen when changing the flag.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 block/blk-mq-debugfs.c   | 1 -
 drivers/nvme/host/core.c | 8 +++-----
 include/linux/blkdev.h   | 7 ++++---
 3 files changed, 7 insertions(+), 9 deletions(-)

diff --git a/block/blk-mq-debugfs.c b/block/blk-mq-debugfs.c
index f2fd72f4414ae8..8b5a68861c119b 100644
--- a/block/blk-mq-debugfs.c
+++ b/block/blk-mq-debugfs.c
@@ -90,7 +90,6 @@ static const char *const blk_queue_flag_name[] = {
 	QUEUE_FLAG_NAME(STATS),
 	QUEUE_FLAG_NAME(REGISTERED),
 	QUEUE_FLAG_NAME(QUIESCED),
-	QUEUE_FLAG_NAME(PCI_P2PDMA),
 	QUEUE_FLAG_NAME(RQ_ALLOC_TIME),
 	QUEUE_FLAG_NAME(HCTX_ACTIVE),
 	QUEUE_FLAG_NAME(SQ_SCHED),
diff --git a/drivers/nvme/host/core.c b/drivers/nvme/host/core.c
index 5ecf762d7c8837..31e752e8d632cd 100644
--- a/drivers/nvme/host/core.c
+++ b/drivers/nvme/host/core.c
@@ -3735,6 +3735,9 @@ static void nvme_alloc_ns(struct nvme_ctrl *ctrl, struct nvme_ns_info *info)
 
 	if (ctrl->opts && ctrl->opts->data_digest)
 		lim.features |= BLK_FEAT_STABLE_WRITES;
+	if (ctrl->ops->supports_pci_p2pdma &&
+	    ctrl->ops->supports_pci_p2pdma(ctrl))
+		lim.features |= BLK_FEAT_PCI_P2PDMA;
 
 	disk = blk_mq_alloc_disk(ctrl->tagset, &lim, ns);
 	if (IS_ERR(disk))
@@ -3744,11 +3747,6 @@ static void nvme_alloc_ns(struct nvme_ctrl *ctrl, struct nvme_ns_info *info)
 
 	ns->disk = disk;
 	ns->queue = disk->queue;
-
-	if (ctrl->ops->supports_pci_p2pdma &&
-	    ctrl->ops->supports_pci_p2pdma(ctrl))
-		blk_queue_flag_set(QUEUE_FLAG_PCI_P2PDMA, ns->queue);
-
 	ns->ctrl = ctrl;
 	kref_init(&ns->kref);
 
diff --git a/include/linux/blkdev.h b/include/linux/blkdev.h
index ffb7a42871b4ed..cc4f6e64e8e3f5 100644
--- a/include/linux/blkdev.h
+++ b/include/linux/blkdev.h
@@ -319,6 +319,9 @@ enum {
 
 	/* supports Zone Reset All */
 	BLK_FEAT_ZONE_RESETALL			= (1u << 11),
+
+	/* supports PCI(e) p2p requests */
+	BLK_FEAT_PCI_P2PDMA			= (1u << 12),
 };
 
 /*
@@ -588,7 +591,6 @@ struct request_queue {
 #define QUEUE_FLAG_STATS	20	/* track IO start and completion times */
 #define QUEUE_FLAG_REGISTERED	22	/* queue has been registered to a disk */
 #define QUEUE_FLAG_QUIESCED	24	/* queue has been quiesced */
-#define QUEUE_FLAG_PCI_P2PDMA	25	/* device supports PCI p2p requests */
 #define QUEUE_FLAG_RQ_ALLOC_TIME 27	/* record rq->alloc_time_ns */
 #define QUEUE_FLAG_HCTX_ACTIVE	28	/* at least one blk-mq hctx is active */
 #define QUEUE_FLAG_SQ_SCHED     30	/* single queue style io dispatch */
@@ -611,8 +613,7 @@ bool blk_queue_flag_test_and_set(unsigned int flag, struct request_queue *q);
 #define blk_queue_zone_resetall(q)	\
 	((q)->limits.features & BLK_FEAT_ZONE_RESETALL)
 #define blk_queue_dax(q)	((q)->limits.features & BLK_FEAT_DAX)
-#define blk_queue_pci_p2pdma(q)	\
-	test_bit(QUEUE_FLAG_PCI_P2PDMA, &(q)->queue_flags)
+#define blk_queue_pci_p2pdma(q)	((q)->limits.features & BLK_FEAT_PCI_P2PDMA)
 #ifdef CONFIG_BLK_RQ_ALLOC_TIME
 #define blk_queue_rq_alloc_time(q)	\
 	test_bit(QUEUE_FLAG_RQ_ALLOC_TIME, &(q)->queue_flags)
-- 
2.43.0

