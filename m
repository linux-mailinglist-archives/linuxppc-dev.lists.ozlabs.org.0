Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 720FC3A80AF
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Jun 2021 15:39:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G48Z40tFSz3dgG
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Jun 2021 23:39:40 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=N4Kpqras;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=casper.srs.infradead.org (client-ip=2001:8b0:10b:1236::1;
 helo=casper.infradead.org;
 envelope-from=batv+01b1093948f83d17b939+6505+infradead.org+hch@casper.srs.infradead.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=casper.20170209 header.b=N4Kpqras; 
 dkim-atps=neutral
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G48QD245nz3f3y
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Jun 2021 23:32:52 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=YPtwLUw8PRAicYLQ1GdhSCihX8di0cio1kNet5uOMPc=; b=N4KpqrasiZK2eUA6ugnp8O0mRP
 YqrAAtYCEOld1CdrqazF0Zs6zFfrFQmZ8iFSRkQ6z+3q+Ym0UikedZA0yfVihTFkcboWn82l+keTk
 PaGQJOydY8xs8JdbjqpcsQjYXeAluZ/ATE5Na0pZoNXk6rsShx9vv5MRo8z1gvMGjEeyw+If3uUgC
 DKZ69DrTTVSF6HtafaJB9XYDsHxoxXqwX6xfBnmz44I824EBhrisKN1uDs6XEc3yxTllqhx2h83vG
 TAJLynC8N9bTqSZLDrkUtbpP65WMKdHhQ/ke3wiR00wrOde0Rn9GwiL5Vcg9JK/wokRG3AfO5juGm
 1dbCvDkg==;
Received: from [2001:4bb8:19b:fdce:9045:1e63:20f0:ca9] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lt99u-006oV9-Uk; Tue, 15 Jun 2021 13:31:25 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>,
	Thomas Gleixner <tglx@linutronix.de>
Subject: [PATCH 16/18] block: use memcpy_from_bvec in __blk_queue_bounce
Date: Tue, 15 Jun 2021 15:24:54 +0200
Message-Id: <20210615132456.753241-17-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210615132456.753241-1-hch@lst.de>
References: <20210615132456.753241-1-hch@lst.de>
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
 Mike Snitzer <snitzer@redhat.com>, Geoff Levand <geoff@infradead.org>,
 linuxppc-dev@lists.ozlabs.org, linux-mips@vger.kernel.org,
 Dongsheng Yang <dongsheng.yang@easystack.cn>, linux-kernel@vger.kernel.org,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 dm-devel@redhat.com, Ilya Dryomov <idryomov@gmail.com>,
 Ira Weiny <ira.weiny@intel.com>, ceph-devel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Rewrite the actual bounce buffering loop in __blk_queue_bounce to that
the memcpy_to_bvec helper can be used to perform the data copies.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 block/bounce.c | 19 +++++++------------
 1 file changed, 7 insertions(+), 12 deletions(-)

diff --git a/block/bounce.c b/block/bounce.c
index 7e9e666c04dc..05fc7148489d 100644
--- a/block/bounce.c
+++ b/block/bounce.c
@@ -239,24 +239,19 @@ void __blk_queue_bounce(struct request_queue *q, struct bio **bio_orig)
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
 
 		if (rw == WRITE) {
-			char *vto, *vfrom;
-
-			flush_dcache_page(page);
-
-			vto = page_address(to->bv_page) + to->bv_offset;
-			vfrom = kmap_atomic(page) + to->bv_offset;
-			memcpy(vto, vfrom, to->bv_len);
-			kunmap_atomic(vfrom);
+			flush_dcache_page(to->bv_page);
+			memcpy_from_bvec(page_address(bounce_page), to);
 		}
+		to->bv_page = bounce_page;
 	}
 
 	trace_block_bio_bounce(*bio_orig);
-- 
2.30.2

