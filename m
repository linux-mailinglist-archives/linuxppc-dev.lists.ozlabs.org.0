Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 305C538BED0
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 May 2021 08:02:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fmbbq17czz3fX1
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 May 2021 16:02:15 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=IhLQ/YsN;
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
 header.s=bombadil.20210309 header.b=IhLQ/YsN; 
 dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FmbNw5Ljxz3c1Z
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 May 2021 15:52:48 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=vGGmPVsg0Hwe3PzyV/3vzWDaoNkxLSJwA2Ye8FU/Xsg=; b=IhLQ/YsNSSUaMfPV9LePQHzZG2
 Iy11LbmI1sSm+9idhhzNqC6Gfvduf0n7DD/sJemhA0c1G6gZtAPG+NgPwB14oKpDsHbFSv6wqBGYD
 z9NlRBYO7hqe4boYDX3qNLCP4SbaTEyoaFArMuKVD/E5z3RyTZPfs0Ksre+VjArTMK0OCsTLRsl3e
 k+gZcg+pC3d86mLa4BbUNZHOAO14SQUeiC907RPGSCiihb8QAhmciozca1qxluSs9Fr70l2NacxpU
 YduJVosXj+jsBg92Mla8olP9CbCdZKujA0wBD8gEQetNm/e7QvJTi8aCRsmG8S2/DYpea4hjHjssP
 FETQIesg==;
Received: from [2001:4bb8:180:5add:4fd7:4137:d2f2:46e6] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
 id 1ljy5C-00GqC1-R7; Fri, 21 May 2021 05:52:27 +0000
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
Subject: [PATCH 21/26] n64cart: convert to blk_alloc_disk
Date: Fri, 21 May 2021 07:51:11 +0200
Message-Id: <20210521055116.1053587-22-hch@lst.de>
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

Convert the n64cart driver to use the blk_alloc_disk helper to simplify
gendisk and request_queue allocation.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/block/n64cart.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/block/n64cart.c b/drivers/block/n64cart.c
index 3dae4b631dea..7b4dd10af9ec 100644
--- a/drivers/block/n64cart.c
+++ b/drivers/block/n64cart.c
@@ -132,14 +132,10 @@ static int __init n64cart_probe(struct platform_device *pdev)
 	if (!reg_base)
 		return -EINVAL;
 
-	disk = alloc_disk(0);
+	disk = blk_alloc_disk(NUMA_NO_NODE);
 	if (!disk)
 		return -ENOMEM;
 
-	disk->queue = blk_alloc_queue(NUMA_NO_NODE);
-	if (!disk->queue)
-		return -ENOMEM;
-
 	disk->first_minor = 0;
 	disk->flags = GENHD_FL_NO_PART_SCAN;
 	disk->fops = &n64cart_fops;
-- 
2.30.2

