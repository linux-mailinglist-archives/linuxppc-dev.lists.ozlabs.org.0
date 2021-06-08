Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DE5339FC1D
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Jun 2021 18:12:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FzwHj6xcsz3c9B
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Jun 2021 02:12:33 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=b4Ja1PJt;
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
 header.s=bombadil.20210309 header.b=b4Ja1PJt; 
 dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fzw9Q5hMhz3049
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Jun 2021 02:07:06 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=MyECqL7omrkh9N+zg6dzXAPF0qAslqNXJGlcR34EKvY=; b=b4Ja1PJtReL64inLe6q6cCHK2j
 QtsAsUGVqoXMk0uXRjtZKKxZ1KcDPFQ/2E3g7QVHWcya9I0qbV0cZ5SR6kwGsWdFU8pVgJkrBquar
 YxBxkAuHdDeCnhSV/aNvk9DoZDnXfzyOxprW2nqGWTXUdNdrJMmEsIP+Zgda00i5siUaPwCB1GzQY
 HGZo+IiuzOhYzTOjOzinhBZg2wu3GuX+/uVu52zf3xUxqxm/RYdi7Poxkf3mu42ry3kQqBBfvOmgt
 D9NnR40fuODEKp23cRsjGb3lOrICZfro2Zap+kPgitNZaEtEcqM5SUhVJZcVvRhvUJJ9BFQIZlJAi
 Ex1/l4NQ==;
Received: from [2001:4bb8:192:ff5f:74ed:7c4f:a5ee:8dcb] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lqeFh-009RlV-DI; Tue, 08 Jun 2021 16:06:54 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Subject: [PATCH 14/16] block: use memcpy_from_bvec in __blk_queue_bounce
Date: Tue,  8 Jun 2021 18:06:01 +0200
Message-Id: <20210608160603.1535935-15-hch@lst.de>
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

Rewrite the actual bounce buffering loop in __blk_queue_bounce to that
the memcpy_to_bvec helper can be used to perform the data copies.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 block/bounce.c | 21 +++++++--------------
 1 file changed, 7 insertions(+), 14 deletions(-)

diff --git a/block/bounce.c b/block/bounce.c
index a2fc6326b6c9..b5ad09e07bcf 100644
--- a/block/bounce.c
+++ b/block/bounce.c
@@ -243,24 +243,17 @@ void __blk_queue_bounce(struct request_queue *q, struct bio **bio_orig)
 	 * because the 'bio' is single-page bvec.
 	 */
 	for (i = 0, to = bio->bi_io_vec; i < bio->bi_vcnt; to++, i++) {
-		struct page *page = to->bv_page;
+		struct page *bounce_page;
 
-		if (!PageHighMem(page))
+		if (!PageHighMem(to->bv_page))
 			continue;
 
-		to->bv_page = mempool_alloc(&page_pool, GFP_NOIO);
-		inc_zone_page_state(to->bv_page, NR_BOUNCE);
+		bounce_page = mempool_alloc(&page_pool, GFP_NOIO);
+		inc_zone_page_state(bounce_page, NR_BOUNCE);
 
-		if (rw == WRITE) {
-			char *vto, *vfrom;
-
-			flush_dcache_page(page);
-
-			vto = page_address(to->bv_page) + to->bv_offset;
-			vfrom = kmap_atomic(page) + to->bv_offset;
-			memcpy(vto, vfrom, to->bv_len);
-			kunmap_atomic(vfrom);
-		}
+		if (rw == WRITE)
+			memcpy_from_bvec(page_address(bounce_page), to);
+		to->bv_page = bounce_page;
 	}
 
 	trace_block_bio_bounce(*bio_orig);
-- 
2.30.2

