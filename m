Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 177B41CB56A
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 May 2020 19:11:09 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49JcL16cfqzDr2K
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 May 2020 03:11:05 +1000 (AEST)
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
 header.a=rsa-sha256 header.s=bombadil.20170209 header.b=BxJHu15I; 
 dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49Jb6f69V5zDqY0
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  9 May 2020 02:16:10 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=xqUmHHy02koBEfSFWiUuHH2Y6nKAt/nZw4u/FVTv6zk=; b=BxJHu15IRW004JkxZY/KyYHUej
 74WLt+f/xjeWE/ehYrxDrBGRkkA//dnglHTvVOgtDoQzzOQKY1dyKm9LHMP9Eb4fGadhIpgkIojYI
 eUfKgVHrl9kbrdlcLpUqFRRrfnuJtQpdCIZOhmcoS+uShMnTu3r0x49dNbVwuLCKdArfz18AzF3RP
 cMF64rqnSdOmJClYev0alieJ13GC0i+TG8Fll/eotlYw7azmblEgoldOFuS3A1QUypcphrVGe4QCM
 Pu8SNC///ni4n5Z91Bl8/8JHT/Tow1csQjCnGXVp4YKgmxEo6KAjYrayvew3Qyg7WLowVbYI96tnF
 5JHSr8DA==;
Received: from [2001:4bb8:180:9d3f:90d7:9df8:7cd:3504] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jX5fP-0004p9-Aa; Fri, 08 May 2020 16:16:03 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Subject: [PATCH 14/15] nvdimm/btt: stop using ->queuedata
Date: Fri,  8 May 2020 18:15:16 +0200
Message-Id: <20200508161517.252308-15-hch@lst.de>
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
 drivers/nvdimm/btt.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/nvdimm/btt.c b/drivers/nvdimm/btt.c
index 3b09419218d6f..eca3e48fefda1 100644
--- a/drivers/nvdimm/btt.c
+++ b/drivers/nvdimm/btt.c
@@ -1442,7 +1442,7 @@ static int btt_do_bvec(struct btt *btt, struct bio_integrity_payload *bip,
 static blk_qc_t btt_make_request(struct request_queue *q, struct bio *bio)
 {
 	struct bio_integrity_payload *bip = bio_integrity(bio);
-	struct btt *btt = q->queuedata;
+	struct btt *btt = bio->bi_disk->private_data;
 	struct bvec_iter iter;
 	unsigned long start;
 	struct bio_vec bvec;
@@ -1543,7 +1543,6 @@ static int btt_blk_init(struct btt *btt)
 	blk_queue_logical_block_size(btt->btt_queue, btt->sector_size);
 	blk_queue_max_hw_sectors(btt->btt_queue, UINT_MAX);
 	blk_queue_flag_set(QUEUE_FLAG_NONROT, btt->btt_queue);
-	btt->btt_queue->queuedata = btt;
 
 	if (btt_meta_size(btt)) {
 		int rc = nd_integrity_init(btt->btt_disk, btt_meta_size(btt));
-- 
2.26.2

