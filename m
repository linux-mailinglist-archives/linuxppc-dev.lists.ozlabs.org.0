Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 36CAB39FC27
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Jun 2021 18:13:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FzwJb4CmWz3cGC
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Jun 2021 02:13:19 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=pkj2gwki;
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
 header.s=bombadil.20210309 header.b=pkj2gwki; 
 dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fzw9W4Y8Bz306Y
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Jun 2021 02:07:11 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=TkXSf08FOqBmuFw/ENTFMnI+54X5dnYwOAAHKqJCH8E=; b=pkj2gwkimoVdhfqEChAYFo7k01
 DnDjBy0Vy9d/v40yq3IoyAtXggh26kXheeh7Q6FS/HWWh00L9VMnx3pZTSNuEiIWOQJz53QqfcsNm
 R41he7jPnmOndHMbLi8GzQ2PqR2X7YKUx24DmYFyeV0jtN5cWY3DFgwVTdyQu/j5mvfY/cn5L0lv+
 qwTZ52er/7pZqEAG8sFNOmS+/jQdGymKGMUkboqU4/j+dbP5ihuHIrn6U2L9Zlya2Flw0avFZ5x6P
 cAWC40p3z6yHiYjkHFC0cXtePrK1w6gWMd17X+w27Mh7NnZ4JJhEo9dxBwnyBMj8OE0w8ksR+yJTw
 akNFincA==;
Received: from [2001:4bb8:192:ff5f:74ed:7c4f:a5ee:8dcb] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lqeFk-009Rml-SV; Tue, 08 Jun 2021 16:06:57 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Subject: [PATCH 15/16] block: use bvec_kmap_local in t10_pi_type1_{prepare,
 complete}
Date: Tue,  8 Jun 2021 18:06:02 +0200
Message-Id: <20210608160603.1535935-16-hch@lst.de>
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

Using local kmaps slightly reduces the chances to stray writes, and
the bvec interface cleans up the code a little bit.

Signed-off-by: Christoph Hellwig <hch@lst.de>
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

