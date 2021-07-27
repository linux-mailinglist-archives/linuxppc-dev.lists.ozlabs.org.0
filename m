Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D7843D6ED0
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Jul 2021 08:10:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GYmc70vT0z3bhg
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Jul 2021 16:10:15 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=YElztzLh;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=casper.srs.infradead.org (client-ip=2001:8b0:10b:1236::1;
 helo=casper.infradead.org;
 envelope-from=batv+120c431586dc67e47307+6547+infradead.org+hch@casper.srs.infradead.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=casper.20170209 header.b=YElztzLh; 
 dkim-atps=neutral
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GYmbd0Q09z2xl9
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Jul 2021 16:09:49 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=cNxTcG8XdnUuoOVixjLVY8XjmYtYsiM+b+iVbGfjzMo=; b=YElztzLh9bPWVL4V+uU9bkDpMk
 NzLXuxXX8mqkPiEdB2lVQLf3TV5qJiqowOEHrhhlM06Y91t6eaziCzTqxX42qQ+8cb1d8ZXTRaikg
 YF5bKQT+bE2YjfM1cjolnhAs+dTL9vFk6NqmTNFE5uy2JYG8dRJQvDpF3Je4y8fhZ+4UaW9tikYHy
 WY55ceDWlHcUJgaRiSXsKjeyGORzyQs4tFpWjixBwSlsLjNevh7FbpN0Wxj9UdkAEILekZHJ2A5iP
 zcPxLvMPLFrlCZ5qfJamSbDvM83tqLmnBQ/axtL8y/k+21PGCIp8eSw58kmzmrTHns4GfaGKtsH6k
 qWoYyuyg==;
Received: from [2001:4bb8:184:87c5:b7fb:1299:a9e5:ff56] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m8GD4-00Einn-II; Tue, 27 Jul 2021 06:05:39 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>,
	Thomas Gleixner <tglx@linutronix.de>
Subject: [PATCH 06/15] rbd: use memzero_bvec
Date: Tue, 27 Jul 2021 07:56:37 +0200
Message-Id: <20210727055646.118787-7-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210727055646.118787-1-hch@lst.de>
References: <20210727055646.118787-1-hch@lst.de>
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
Cc: linux-arch@vger.kernel.org, linux-block@vger.kernel.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 "Martin K . Petersen" <martin.petersen@oracle.com>,
 Mike Snitzer <snitzer@redhat.com>, Geoff Levand <geoff@infradead.org>,
 linuxppc-dev@lists.ozlabs.org, ceph-devel@vger.kernel.org,
 linux-mips@vger.kernel.org, Dongsheng Yang <dongsheng.yang@easystack.cn>,
 linux-kernel@vger.kernel.org,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 dm-devel@redhat.com, Andrew Morton <akpm@linux-foundation.org>,
 Ira Weiny <ira.weiny@intel.com>, Ilya Dryomov <idryomov@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Use memzero_bvec instead of reimplementing it.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Acked-by: Ilya Dryomov <idryomov@gmail.com>
Reviewed-by: Martin K. Petersen <martin.petersen@oracle.com>
Reviewed-by: Ira Weiny <ira.weiny@intel.com>
---
 drivers/block/rbd.c | 15 ++-------------
 1 file changed, 2 insertions(+), 13 deletions(-)

diff --git a/drivers/block/rbd.c b/drivers/block/rbd.c
index 90b947c96402..6d596c2c2cd6 100644
--- a/drivers/block/rbd.c
+++ b/drivers/block/rbd.c
@@ -1219,24 +1219,13 @@ static void rbd_dev_mapping_clear(struct rbd_device *rbd_dev)
 	rbd_dev->mapping.size = 0;
 }
 
-static void zero_bvec(struct bio_vec *bv)
-{
-	void *buf;
-	unsigned long flags;
-
-	buf = bvec_kmap_irq(bv, &flags);
-	memset(buf, 0, bv->bv_len);
-	flush_dcache_page(bv->bv_page);
-	bvec_kunmap_irq(buf, &flags);
-}
-
 static void zero_bios(struct ceph_bio_iter *bio_pos, u32 off, u32 bytes)
 {
 	struct ceph_bio_iter it = *bio_pos;
 
 	ceph_bio_iter_advance(&it, off);
 	ceph_bio_iter_advance_step(&it, bytes, ({
-		zero_bvec(&bv);
+		memzero_bvec(&bv);
 	}));
 }
 
@@ -1246,7 +1235,7 @@ static void zero_bvecs(struct ceph_bvec_iter *bvec_pos, u32 off, u32 bytes)
 
 	ceph_bvec_iter_advance(&it, off);
 	ceph_bvec_iter_advance_step(&it, bytes, ({
-		zero_bvec(&bv);
+		memzero_bvec(&bv);
 	}));
 }
 
-- 
2.30.2

