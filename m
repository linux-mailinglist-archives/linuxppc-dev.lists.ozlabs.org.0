Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 756D7903155
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jun 2024 07:37:49 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=GCSo6txV;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VyyB06b7Pz3cTF
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jun 2024 15:37:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=GCSo6txV;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=bombadil.srs.infradead.org (client-ip=2607:7c80:54:3::133; helo=bombadil.infradead.org; envelope-from=batv+2fedbe304aabaf399917+7597+infradead.org+hch@bombadil.srs.infradead.org; receiver=lists.ozlabs.org)
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Vyxpr5g07z3cQq
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Jun 2024 15:21:08 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=29U87g0UHkeYya05OUe00vczhbUtZ3UGETb+Z6Ht4RY=; b=GCSo6txVa5cYxZtp+tehNyFXpj
	7a0UzoIrHi3enEZSKL7o3EsXwmQZvVmrhYIFbumaGvp0YEB55dp84N66m+2E/5oDp+RoJV3Z0Z3b7
	7sx/ZtrwG9PDjeKwz7QEiP8S1yrPfa3GfzN7CBiLaPYwc2xvGnc/gPxGtFfKj6+v9f8sceyyWiH85
	oMRjZuDPcDqHsADK3eb89Cn6DY7/k1rjiwqjTFXlxGLpvfV7YRNk3O0R8k4nZVa9gpk8S4FDTe9us
	laMjQuuhp3M/5BexMgm9l2Var8w7BGjDv7Z5eRI3ogIypg2iVUumTp9GXdvQNtvL0MNNMEpr4RKMh
	lkoGGvyQ==;
Received: from 2a02-8389-2341-5b80-cdb4-8e7d-405d-6b77.cable.dynamic.v6.surfer.at ([2a02:8389:2341:5b80:cdb4:8e7d:405d:6b77] helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGtw7-00000007Riw-3tq0;
	Tue, 11 Jun 2024 05:20:48 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Subject: [PATCH 25/26] block: move the skip_tagset_quiesce flag to queue_limits
Date: Tue, 11 Jun 2024 07:19:25 +0200
Message-ID: <20240611051929.513387-26-hch@lst.de>
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

Move the skip_tagset_quiesce flag into the queue_limits feature field so
that it can be set atomically and all I/O is frozen when changing the
flag.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 block/blk-mq-debugfs.c   | 1 -
 drivers/nvme/host/core.c | 8 +++++---
 include/linux/blkdev.h   | 6 ++++--
 3 files changed, 9 insertions(+), 6 deletions(-)

diff --git a/block/blk-mq-debugfs.c b/block/blk-mq-debugfs.c
index 8b5a68861c119b..344f9e503bdb32 100644
--- a/block/blk-mq-debugfs.c
+++ b/block/blk-mq-debugfs.c
@@ -93,7 +93,6 @@ static const char *const blk_queue_flag_name[] = {
 	QUEUE_FLAG_NAME(RQ_ALLOC_TIME),
 	QUEUE_FLAG_NAME(HCTX_ACTIVE),
 	QUEUE_FLAG_NAME(SQ_SCHED),
-	QUEUE_FLAG_NAME(SKIP_TAGSET_QUIESCE),
 };
 #undef QUEUE_FLAG_NAME
 
diff --git a/drivers/nvme/host/core.c b/drivers/nvme/host/core.c
index 31e752e8d632cd..bf410d10b12006 100644
--- a/drivers/nvme/host/core.c
+++ b/drivers/nvme/host/core.c
@@ -4489,13 +4489,15 @@ int nvme_alloc_io_tag_set(struct nvme_ctrl *ctrl, struct blk_mq_tag_set *set,
 		return ret;
 
 	if (ctrl->ops->flags & NVME_F_FABRICS) {
-		ctrl->connect_q = blk_mq_alloc_queue(set, NULL, NULL);
+		struct queue_limits lim = {
+			.features	= BLK_FEAT_SKIP_TAGSET_QUIESCE,
+		};
+
+		ctrl->connect_q = blk_mq_alloc_queue(set, &lim, NULL);
         	if (IS_ERR(ctrl->connect_q)) {
 			ret = PTR_ERR(ctrl->connect_q);
 			goto out_free_tag_set;
 		}
-		blk_queue_flag_set(QUEUE_FLAG_SKIP_TAGSET_QUIESCE,
-				   ctrl->connect_q);
 	}
 
 	ctrl->tagset = set;
diff --git a/include/linux/blkdev.h b/include/linux/blkdev.h
index cc4f6e64e8e3f5..d7ad25def6e50b 100644
--- a/include/linux/blkdev.h
+++ b/include/linux/blkdev.h
@@ -322,6 +322,9 @@ enum {
 
 	/* supports PCI(e) p2p requests */
 	BLK_FEAT_PCI_P2PDMA			= (1u << 12),
+
+	/* skip this queue in blk_mq_(un)quiesce_tagset */
+	BLK_FEAT_SKIP_TAGSET_QUIESCE		= (1u << 13),
 };
 
 /*
@@ -594,7 +597,6 @@ struct request_queue {
 #define QUEUE_FLAG_RQ_ALLOC_TIME 27	/* record rq->alloc_time_ns */
 #define QUEUE_FLAG_HCTX_ACTIVE	28	/* at least one blk-mq hctx is active */
 #define QUEUE_FLAG_SQ_SCHED     30	/* single queue style io dispatch */
-#define QUEUE_FLAG_SKIP_TAGSET_QUIESCE	31 /* quiesce_tagset skip the queue*/
 
 #define QUEUE_FLAG_MQ_DEFAULT	(1UL << QUEUE_FLAG_SAME_COMP)
 
@@ -629,7 +631,7 @@ bool blk_queue_flag_test_and_set(unsigned int flag, struct request_queue *q);
 #define blk_queue_registered(q)	test_bit(QUEUE_FLAG_REGISTERED, &(q)->queue_flags)
 #define blk_queue_sq_sched(q)	test_bit(QUEUE_FLAG_SQ_SCHED, &(q)->queue_flags)
 #define blk_queue_skip_tagset_quiesce(q) \
-	test_bit(QUEUE_FLAG_SKIP_TAGSET_QUIESCE, &(q)->queue_flags)
+	((q)->limits.features & BLK_FEAT_SKIP_TAGSET_QUIESCE)
 
 extern void blk_set_pm_only(struct request_queue *q);
 extern void blk_clear_pm_only(struct request_queue *q);
-- 
2.43.0

