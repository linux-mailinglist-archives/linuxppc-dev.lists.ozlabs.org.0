Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BF92A3A8066
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Jun 2021 15:38:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G48XY2YZMz3gD6
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Jun 2021 23:38:21 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=XAkxYShy;
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
 header.s=casper.20170209 header.b=XAkxYShy; 
 dkim-atps=neutral
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G48Nj0VTZz3cNN
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Jun 2021 23:31:33 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=rADL90S3oRiyRdCFkcJ9oLhZvXcChQZEzORShMtqGjI=; b=XAkxYShyFl3Yvr1dnBp7XvRpkB
 qSquvmmDJ6/T+WVpbxDkhyzGsiibmReOK5vCy8Nh7B9HMQ5Pj8fUJhD7UsXfi69vc1X0dVwkns/PI
 /rrhMP7m44kHM8c8VtorOapnH8Ze4ZTA3OIAavXCEBu3G75QlAsZO1cic4/cgFEaCIX50yfYen1b9
 c57XNXTHy45fTQhu7/8gKpFWTJA3bus8t5RM7TSC+Hxw03tl0waaUrTMlvGa8HOKRYESPiuAGLK+A
 +kKwh6FJokJ3DVkOEvwMVt8/0J/yzKIOvQBxHaK9nBhqL0iqcoigsfH1jRQH0UCw6Ucwp6Si5NM9J
 nCY48npA==;
Received: from [2001:4bb8:19b:fdce:9045:1e63:20f0:ca9] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lt98u-006oLz-5Y; Tue, 15 Jun 2021 13:30:16 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>,
	Thomas Gleixner <tglx@linutronix.de>
Subject: [PATCH 13/18] block: rewrite bio_copy_data_iter to use
 bvec_kmap_local and memcpy_to_bvec
Date: Tue, 15 Jun 2021 15:24:51 +0200
Message-Id: <20210615132456.753241-14-hch@lst.de>
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

Use the proper helpers instead of open coding the copy.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 block/bio.c | 28 ++++++++--------------------
 1 file changed, 8 insertions(+), 20 deletions(-)

diff --git a/block/bio.c b/block/bio.c
index 1d7abdb83a39..c14d2e66c084 100644
--- a/block/bio.c
+++ b/block/bio.c
@@ -1186,27 +1186,15 @@ EXPORT_SYMBOL(bio_advance);
 void bio_copy_data_iter(struct bio *dst, struct bvec_iter *dst_iter,
 			struct bio *src, struct bvec_iter *src_iter)
 {
-	struct bio_vec src_bv, dst_bv;
-	void *src_p, *dst_p;
-	unsigned bytes;
-
 	while (src_iter->bi_size && dst_iter->bi_size) {
-		src_bv = bio_iter_iovec(src, *src_iter);
-		dst_bv = bio_iter_iovec(dst, *dst_iter);
-
-		bytes = min(src_bv.bv_len, dst_bv.bv_len);
-
-		src_p = kmap_atomic(src_bv.bv_page);
-		dst_p = kmap_atomic(dst_bv.bv_page);
-
-		memcpy(dst_p + dst_bv.bv_offset,
-		       src_p + src_bv.bv_offset,
-		       bytes);
-
-		kunmap_atomic(dst_p);
-		kunmap_atomic(src_p);
-
-		flush_dcache_page(dst_bv.bv_page);
+		struct bio_vec src_bv = bio_iter_iovec(src, *src_iter);
+		struct bio_vec dst_bv = bio_iter_iovec(dst, *dst_iter);
+		unsigned int bytes = min(src_bv.bv_len, dst_bv.bv_len);
+		void *src_buf;
+
+		src_buf = bvec_kmap_local(&src_bv);
+		memcpy_to_bvec(&dst_bv, src_buf);
+		kunmap_local(src_buf);
 
 		bio_advance_iter_single(src, src_iter, bytes);
 		bio_advance_iter_single(dst, dst_iter, bytes);
-- 
2.30.2

