Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 399102107EE
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Jul 2020 11:23:12 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49xbP94FxwzDqc3
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Jul 2020 19:23:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=casper.srs.infradead.org (client-ip=2001:8b0:10b:1236::1;
 helo=casper.infradead.org;
 envelope-from=batv+501e1de201b53739768b+6156+infradead.org+hch@casper.srs.infradead.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=casper.20170209 header.b=vfpo6dKX; 
 dkim-atps=neutral
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49xZtZ0VvkzDqpq
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 Jul 2020 19:00:04 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=mXzFKc+c1347jb3Dn9ppL+M5YgGcOuGfnfqDijAsZ3Y=; b=vfpo6dKX6pcfkXojO7MEBdP8I+
 86AaePADZXUJsTBKwuUgnpCIP5Z0XAZQGW6c/Kb9F/JPuY9WyJ3Rl/BaIzYlOubo09Ei7FzSnqQI0
 gfCEMoloEjs6P3LEQnwVlzRHhUGadgcFRuv65T0aKFTLTXDZaxWyzGyBQkhXiSfyB+vRqn/1Jc5k2
 zTH1Kh5OVuZJjkBVSpDk9P2/NeNvS/14c0tl9qqr7KZlHRN3w6sOvy5/jKp8AvIrsjxMcqV3gxYja
 FugjR0mjktszsGn1XDTbj9LDx0mg0iBf25yLxb9OisE3KCivktdJc3E9LZFZgcvuzMqVbMum3MmEs
 upxKYJvw==;
Received: from [2001:4bb8:184:76e3:ea38:596b:3e9e:422a] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jqYau-00087W-24; Wed, 01 Jul 2020 08:59:52 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Subject: [PATCH 02/20] simdisk: stop using ->queuedata
Date: Wed,  1 Jul 2020 10:59:29 +0200
Message-Id: <20200701085947.3354405-3-hch@lst.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200701085947.3354405-1-hch@lst.de>
References: <20200701085947.3354405-1-hch@lst.de>
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

Instead of setting up the queuedata as well just use one private data
field.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 arch/xtensa/platforms/iss/simdisk.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/arch/xtensa/platforms/iss/simdisk.c b/arch/xtensa/platforms/iss/simdisk.c
index 49322b66cda931..31b5020077a059 100644
--- a/arch/xtensa/platforms/iss/simdisk.c
+++ b/arch/xtensa/platforms/iss/simdisk.c
@@ -103,7 +103,7 @@ static void simdisk_transfer(struct simdisk *dev, unsigned long sector,
 
 static blk_qc_t simdisk_make_request(struct request_queue *q, struct bio *bio)
 {
-	struct simdisk *dev = q->queuedata;
+	struct simdisk *dev = bio->bi_disk->private_data;
 	struct bio_vec bvec;
 	struct bvec_iter iter;
 	sector_t sector = bio->bi_iter.bi_sector;
@@ -273,8 +273,6 @@ static int __init simdisk_setup(struct simdisk *dev, int which,
 		goto out_alloc_queue;
 	}
 
-	dev->queue->queuedata = dev;
-
 	dev->gd = alloc_disk(SIMDISK_MINORS);
 	if (dev->gd == NULL) {
 		pr_err("alloc_disk failed\n");
-- 
2.26.2

