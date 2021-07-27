Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CFCC73D6F61
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Jul 2021 08:23:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GYmvp5Xbzz307L
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Jul 2021 16:23:50 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=rB4aXs6k;
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
 header.s=casper.20170209 header.b=rB4aXs6k; 
 dkim-atps=neutral
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GYmvM3DfHz2yLN
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Jul 2021 16:23:27 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=vmvZKiV3C2XvXhBo3odP7QZ8M49Bz7heYP4acVMveO0=; b=rB4aXs6kU2Q+PtSQs2knqMBjSc
 p8rWaTRGFeB4arxqMQaA3FBTZRkCYwV9mHVUhkZrMbzGktmTiyyTWLbcJHLPZ3ySAe11OFiG7yNXk
 YOMARZlXWZ8axC2fHl0cIzJYc22xSMNXBfV2ZN+Dca082+wqVVhaeKUzAdR2/cbN/f/SWXOuJYDrJ
 /OEtsEEv6+0w2RsYVT6/EHa4KmD63/h0jcYg5CEBmQVF/rMqEKsQUkbTT49LGSA5oCgrd2cSQ9VvA
 FhWo2cQaO9l0TboYZcZPt8qYIE9C9nPpiYJNPutgSA4T0NmhzPFloJcEJnqAOvvlPvAzb4+O0Jb7M
 9GqGHBIw==;
Received: from [2001:4bb8:184:87c5:b7fb:1299:a9e5:ff56] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m8GR0-00Ejhc-IJ; Tue, 27 Jul 2021 06:19:36 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>,
	Thomas Gleixner <tglx@linutronix.de>
Subject: [PATCH 14/15] block: use bvec_kmap_local in t10_pi_type1_{prepare,
 complete}
Date: Tue, 27 Jul 2021 07:56:45 +0200
Message-Id: <20210727055646.118787-15-hch@lst.de>
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

Using local kmaps slightly reduces the chances to stray writes, and
the bvec interface cleans up the code a little bit.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Martin K. Petersen <martin.petersen@oracle.com>
---
 block/t10-pi.c | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/block/t10-pi.c b/block/t10-pi.c
index d910534b3a41..00c203b2a921 100644
--- a/block/t10-pi.c
+++ b/block/t10-pi.c
@@ -147,11 +147,10 @@ static void t10_pi_type1_prepare(struct request *rq)
 			break;
 
 		bip_for_each_vec(iv, bip, iter) {
-			void *p, *pmap;
 			unsigned int j;
+			void *p;
 
-			pmap = kmap_atomic(iv.bv_page);
-			p = pmap + iv.bv_offset;
+			p = bvec_kmap_local(&iv);
 			for (j = 0; j < iv.bv_len; j += tuple_sz) {
 				struct t10_pi_tuple *pi = p;
 
@@ -161,8 +160,7 @@ static void t10_pi_type1_prepare(struct request *rq)
 				ref_tag++;
 				p += tuple_sz;
 			}
-
-			kunmap_atomic(pmap);
+			kunmap_local(p);
 		}
 
 		bip->bip_flags |= BIP_MAPPED_INTEGRITY;
@@ -195,11 +193,10 @@ static void t10_pi_type1_complete(struct request *rq, unsigned int nr_bytes)
 		struct bvec_iter iter;
 
 		bip_for_each_vec(iv, bip, iter) {
-			void *p, *pmap;
 			unsigned int j;
+			void *p;
 
-			pmap = kmap_atomic(iv.bv_page);
-			p = pmap + iv.bv_offset;
+			p = bvec_kmap_local(&iv);
 			for (j = 0; j < iv.bv_len && intervals; j += tuple_sz) {
 				struct t10_pi_tuple *pi = p;
 
@@ -210,8 +207,7 @@ static void t10_pi_type1_complete(struct request *rq, unsigned int nr_bytes)
 				intervals--;
 				p += tuple_sz;
 			}
-
-			kunmap_atomic(pmap);
+			kunmap_local(p);
 		}
 	}
 }
-- 
2.30.2

