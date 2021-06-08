Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AD34D39FC14
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Jun 2021 18:10:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FzwFP0vskz3dbB
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Jun 2021 02:10:33 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ZySEe4D5;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=bombadil.srs.infradead.org (client-ip=2607:7c80:54:e::133;
 helo=bombadil.infradead.org;
 envelope-from=batv+20703f0a86d9058a1f86+6498+infradead.org+hch@bombadil.srs.infradead.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=bombadil.20210309 header.b=ZySEe4D5; 
 dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fzw960qVmz3bTb
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Jun 2021 02:06:50 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=HwW7/FcNSPjoRVBBgiBQclHiHBGFA68ApXQNMgI7IuU=; b=ZySEe4D5FHucQqfuf1IfwHVuKW
 WEHowatN5Tz2b3Z9grV/ImybjMv//WEMk+nNaqsU/kHB1CkTwBz9uwV6tqL+NLTC16eFXX4KUjdlm
 KNe+VlkXw296qZipYK9wua0s0mArIUMI5dTf7VnXNQACY7jfkA0ecBfVzsyPgispTyntJziaW50av
 bxo55suRvkOWzp3BY6bVQf82DwObcQ9EC8uIvE37Y8razpBbm9ai7HDfedZaZTWb5CjY0Y0uFMxvS
 xqYCerXgjUgMWiaesg9WqaPvdlFa/PXNUX/k+E9vjO/L20OtCWESv7G+isYWlB5y2kI5cj2BK3k6N
 RoH6CpdA==;
Received: from [2001:4bb8:192:ff5f:74ed:7c4f:a5ee:8dcb] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lqeFQ-009Rge-Pv; Tue, 08 Jun 2021 16:06:37 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Subject: [PATCH 09/16] ps3disk: use memcpy_{from,to}_bvec
Date: Tue,  8 Jun 2021 18:05:56 +0200
Message-Id: <20210608160603.1535935-10-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210608160603.1535935-1-hch@lst.de>
References: <20210608160603.1535935-1-hch@lst.de>
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
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Mike Snitzer <snitzer@redhat.com>, Geoff Levand <geoff@infradead.org>,
 linuxppc-dev@lists.ozlabs.org, linux-mips@vger.kernel.org,
 Dongsheng Yang <dongsheng.yang@easystack.cn>, linux-kernel@vger.kernel.org,
 linux-block@vger.kernel.org, dm-devel@redhat.com,
 Ilya Dryomov <idryomov@gmail.com>, Ira Weiny <ira.weiny@intel.com>,
 ceph-devel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Use the bvec helpers instead of open coding the copy.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/block/ps3disk.c | 19 +++----------------
 1 file changed, 3 insertions(+), 16 deletions(-)

diff --git a/drivers/block/ps3disk.c b/drivers/block/ps3disk.c
index ba3ece56cbb3..f2eb0225814f 100644
--- a/drivers/block/ps3disk.c
+++ b/drivers/block/ps3disk.c
@@ -84,26 +84,13 @@ static void ps3disk_scatter_gather(struct ps3_storage_device *dev,
 	unsigned int offset = 0;
 	struct req_iterator iter;
 	struct bio_vec bvec;
-	unsigned int i = 0;
-	size_t size;
-	void *buf;
 
 	rq_for_each_segment(bvec, req, iter) {
-		unsigned long flags;
-		dev_dbg(&dev->sbd.core, "%s:%u: bio %u: %u sectors from %llu\n",
-			__func__, __LINE__, i, bio_sectors(iter.bio),
-			iter.bio->bi_iter.bi_sector);
-
-		size = bvec.bv_len;
-		buf = bvec_kmap_irq(&bvec, &flags);
 		if (gather)
-			memcpy(dev->bounce_buf+offset, buf, size);
+			memcpy_from_bvec(dev->bounce_buf + offset, &bvec);
 		else
-			memcpy(buf, dev->bounce_buf+offset, size);
-		offset += size;
-		flush_kernel_dcache_page(bvec.bv_page);
-		bvec_kunmap_irq(buf, &flags);
-		i++;
+			memcpy_to_bvec(&bvec, dev->bounce_buf + offset);
+		offset += bvec.bv_len;
 	}
 }
 
-- 
2.30.2

