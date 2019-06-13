Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0653943621
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Jun 2019 14:59:07 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45PkMX1RWGzDrQN
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Jun 2019 22:59:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="HMGyp7Nm"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Pk7m3JGHzDrK4
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Jun 2019 22:48:51 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 45Pk7f2ylZz9v00L;
 Thu, 13 Jun 2019 14:48:46 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=HMGyp7Nm; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id P8LMU0zZneC0; Thu, 13 Jun 2019 14:48:46 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 45Pk7f1rwkz9v00K;
 Thu, 13 Jun 2019 14:48:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1560430126; bh=WTnbopClslBb8Jk624zDqBFNV7dRkmXEATs9AKYR/Zg=;
 h=In-Reply-To:References:From:Subject:To:Cc:Date:From;
 b=HMGyp7NmgGQmJjCIVSUig8O6O9PLRxDanxgaGfS9BokC3FAb99RHdHSAuc8QPbsMZ
 JPzxHzsfK8yWyC7dXGWYICFkzKsVL1Jvd800WSjAH/9pzDMrSAN1CoCcOwtxqO8rD7
 pnLFB0/tjd8uJOPS4o9zIHSUb0HXp+aKPBlvsr1g=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 9D4DF8B8E9;
 Thu, 13 Jun 2019 14:48:47 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id Aqupc4gV3vDf; Thu, 13 Jun 2019 14:48:47 +0200 (CEST)
Received: from po16838vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 2E32E8B8E5;
 Thu, 13 Jun 2019 14:48:47 +0200 (CEST)
Received: by po16838vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id ECF8968D71; Thu, 13 Jun 2019 12:48:46 +0000 (UTC)
Message-Id: <732ca0ff440bf4cd589d844cfda71d96efd500f5.1560429844.git.christophe.leroy@c-s.fr>
In-Reply-To: <cover.1560429844.git.christophe.leroy@c-s.fr>
References: <cover.1560429844.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH v3 2/4] crypto: talitos - fix hash on SEC1.
To: Herbert Xu <herbert@gondor.apana.org.au>,
 "David S. Miller" <davem@davemloft.net>, horia.geanta@nxp.com
Date: Thu, 13 Jun 2019 12:48:46 +0000 (UTC)
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-crypto@vger.kernel.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On SEC1, hash provides wrong result when performing hashing in several
steps with input data SG list has more than one element. This was
detected with CONFIG_CRYPTO_MANAGER_EXTRA_TESTS:

[   44.185947] alg: hash: md5-talitos test failed (wrong result) on test vector 6, cfg="random: may_sleep use_finup src_divs=[<reimport>25.88%@+8063, <flush>24.19%@+9588, 28.63%@+16333, <reimport>4.60%@+6756, 16.70%@+16281] dst_divs=[71.61%@alignmask+16361, 14.36%@+7756, 14.3%@+"
[   44.325122] alg: hash: sha1-talitos test failed (wrong result) on test vector 3, cfg="random: inplace use_final src_divs=[<flush,nosimd>16.56%@+16378, <reimport>52.0%@+16329, 21.42%@alignmask+16380, 10.2%@alignmask+16380] iv_offset=39"
[   44.493500] alg: hash: sha224-talitos test failed (wrong result) on test vector 4, cfg="random: use_final nosimd src_divs=[<reimport>52.27%@+7401, <reimport>17.34%@+16285, <flush>17.71%@+26, 12.68%@+10644] iv_offset=43"
[   44.673262] alg: hash: sha256-talitos test failed (wrong result) on test vector 4, cfg="random: may_sleep use_finup src_divs=[<reimport>60.6%@+12790, 17.86%@+1329, <reimport>12.64%@alignmask+16300, 8.29%@+15, 0.40%@+13506, <reimport>0.51%@+16322, <reimport>0.24%@+16339] dst_divs"

This is due to two issues:
- We have an overlap between the buffer used for copying the input
data (SEC1 doesn't do scatter/gather) and the chained descriptor.
- Data copy is wrong when the previous hash left less than one
blocksize of data to hash, implying a complement of the previous
block with a few bytes from the new request.

Fix it by:
- Moving the second descriptor after the buffer, as moving the buffer
after the descriptor would make it more complex for other cipher
operations (AEAD, ABLKCIPHER)
- Rebuiding a new data SG list without the bytes taken from the new
request to complete the previous one.

Preceding patch ("crypto: talitos - move struct talitos_edesc into
talitos.h") as required for this change to build properly.

Fixes: 37b5e8897eb5 ("crypto: talitos - chain in buffered data for ahash on SEC1")
Cc: stable@vger.kernel.org
Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
---
 drivers/crypto/talitos.c | 63 ++++++++++++++++++++++++++++++------------------
 1 file changed, 40 insertions(+), 23 deletions(-)

diff --git a/drivers/crypto/talitos.c b/drivers/crypto/talitos.c
index 5b401aec6c84..4f03baef952b 100644
--- a/drivers/crypto/talitos.c
+++ b/drivers/crypto/talitos.c
@@ -336,15 +336,18 @@ static void flush_channel(struct device *dev, int ch, int error, int reset_ch)
 	tail = priv->chan[ch].tail;
 	while (priv->chan[ch].fifo[tail].desc) {
 		__be32 hdr;
+		struct talitos_edesc *edesc;
 
 		request = &priv->chan[ch].fifo[tail];
+		edesc = container_of(request->desc, struct talitos_edesc, desc);
 
 		/* descriptors with their done bits set don't get the error */
 		rmb();
 		if (!is_sec1)
 			hdr = request->desc->hdr;
 		else if (request->desc->next_desc)
-			hdr = (request->desc + 1)->hdr1;
+			hdr = ((struct talitos_desc *)
+			       (edesc->buf + edesc->dma_len))->hdr1;
 		else
 			hdr = request->desc->hdr1;
 
@@ -476,8 +479,14 @@ static u32 current_desc_hdr(struct device *dev, int ch)
 		}
 	}
 
-	if (priv->chan[ch].fifo[iter].desc->next_desc == cur_desc)
-		return (priv->chan[ch].fifo[iter].desc + 1)->hdr;
+	if (priv->chan[ch].fifo[iter].desc->next_desc == cur_desc) {
+		struct talitos_edesc *edesc;
+
+		edesc = container_of(priv->chan[ch].fifo[iter].desc,
+				     struct talitos_edesc, desc);
+		return ((struct talitos_desc *)
+			(edesc->buf + edesc->dma_len))->hdr;
+	}
 
 	return priv->chan[ch].fifo[iter].desc->hdr;
 }
@@ -1402,15 +1411,11 @@ static struct talitos_edesc *talitos_edesc_alloc(struct device *dev,
 	edesc->dst_nents = dst_nents;
 	edesc->iv_dma = iv_dma;
 	edesc->dma_len = dma_len;
-	if (dma_len) {
-		void *addr = &edesc->link_tbl[0];
-
-		if (is_sec1 && !dst)
-			addr += sizeof(struct talitos_desc);
-		edesc->dma_link_tbl = dma_map_single(dev, addr,
+	if (dma_len)
+		edesc->dma_link_tbl = dma_map_single(dev, &edesc->link_tbl[0],
 						     edesc->dma_len,
 						     DMA_BIDIRECTIONAL);
-	}
+
 	return edesc;
 }
 
@@ -1722,14 +1727,16 @@ static void common_nonsnoop_hash_unmap(struct device *dev,
 	struct talitos_private *priv = dev_get_drvdata(dev);
 	bool is_sec1 = has_ftr_sec1(priv);
 	struct talitos_desc *desc = &edesc->desc;
-	struct talitos_desc *desc2 = desc + 1;
+	struct talitos_desc *desc2 = (struct talitos_desc *)
+				     (edesc->buf + edesc->dma_len);
 
 	unmap_single_talitos_ptr(dev, &edesc->desc.ptr[5], DMA_FROM_DEVICE);
 	if (desc->next_desc &&
 	    desc->ptr[5].ptr != desc2->ptr[5].ptr)
 		unmap_single_talitos_ptr(dev, &desc2->ptr[5], DMA_FROM_DEVICE);
 
-	talitos_sg_unmap(dev, edesc, req_ctx->psrc, NULL, 0, 0);
+	if (req_ctx->psrc)
+		talitos_sg_unmap(dev, edesc, req_ctx->psrc, NULL, 0, 0);
 
 	/* When using hashctx-in, must unmap it. */
 	if (from_talitos_ptr_len(&edesc->desc.ptr[1], is_sec1))
@@ -1796,7 +1803,6 @@ static void talitos_handle_buggy_hash(struct talitos_ctx *ctx,
 
 static int common_nonsnoop_hash(struct talitos_edesc *edesc,
 				struct ahash_request *areq, unsigned int length,
-				unsigned int offset,
 				void (*callback) (struct device *dev,
 						  struct talitos_desc *desc,
 						  void *context, int error))
@@ -1835,9 +1841,7 @@ static int common_nonsnoop_hash(struct talitos_edesc *edesc,
 
 	sg_count = edesc->src_nents ?: 1;
 	if (is_sec1 && sg_count > 1)
-		sg_pcopy_to_buffer(req_ctx->psrc, sg_count,
-				   edesc->buf + sizeof(struct talitos_desc),
-				   length, req_ctx->nbuf);
+		sg_copy_to_buffer(req_ctx->psrc, sg_count, edesc->buf, length);
 	else if (length)
 		sg_count = dma_map_sg(dev, req_ctx->psrc, sg_count,
 				      DMA_TO_DEVICE);
@@ -1850,7 +1854,7 @@ static int common_nonsnoop_hash(struct talitos_edesc *edesc,
 				       DMA_TO_DEVICE);
 	} else {
 		sg_count = talitos_sg_map(dev, req_ctx->psrc, length, edesc,
-					  &desc->ptr[3], sg_count, offset, 0);
+					  &desc->ptr[3], sg_count, 0, 0);
 		if (sg_count > 1)
 			sync_needed = true;
 	}
@@ -1874,7 +1878,8 @@ static int common_nonsnoop_hash(struct talitos_edesc *edesc,
 		talitos_handle_buggy_hash(ctx, edesc, &desc->ptr[3]);
 
 	if (is_sec1 && req_ctx->nbuf && length) {
-		struct talitos_desc *desc2 = desc + 1;
+		struct talitos_desc *desc2 = (struct talitos_desc *)
+					     (edesc->buf + edesc->dma_len);
 		dma_addr_t next_desc;
 
 		memset(desc2, 0, sizeof(*desc2));
@@ -1895,7 +1900,7 @@ static int common_nonsnoop_hash(struct talitos_edesc *edesc,
 						      DMA_TO_DEVICE);
 		copy_talitos_ptr(&desc2->ptr[2], &desc->ptr[2], is_sec1);
 		sg_count = talitos_sg_map(dev, req_ctx->psrc, length, edesc,
-					  &desc2->ptr[3], sg_count, offset, 0);
+					  &desc2->ptr[3], sg_count, 0, 0);
 		if (sg_count > 1)
 			sync_needed = true;
 		copy_talitos_ptr(&desc2->ptr[5], &desc->ptr[5], is_sec1);
@@ -2006,7 +2011,6 @@ static int ahash_process_req(struct ahash_request *areq, unsigned int nbytes)
 	struct device *dev = ctx->dev;
 	struct talitos_private *priv = dev_get_drvdata(dev);
 	bool is_sec1 = has_ftr_sec1(priv);
-	int offset = 0;
 	u8 *ctx_buf = req_ctx->buf[req_ctx->buf_idx];
 
 	if (!req_ctx->last && (nbytes + req_ctx->nbuf <= blocksize)) {
@@ -2046,6 +2050,9 @@ static int ahash_process_req(struct ahash_request *areq, unsigned int nbytes)
 			sg_chain(req_ctx->bufsl, 2, areq->src);
 		req_ctx->psrc = req_ctx->bufsl;
 	} else if (is_sec1 && req_ctx->nbuf && req_ctx->nbuf < blocksize) {
+		int offset;
+		struct scatterlist *sg;
+
 		if (nbytes_to_hash > blocksize)
 			offset = blocksize - req_ctx->nbuf;
 		else
@@ -2058,7 +2065,18 @@ static int ahash_process_req(struct ahash_request *areq, unsigned int nbytes)
 		sg_copy_to_buffer(areq->src, nents,
 				  ctx_buf + req_ctx->nbuf, offset);
 		req_ctx->nbuf += offset;
-		req_ctx->psrc = areq->src;
+		for (sg = areq->src; sg && offset >= sg->length;
+		     offset -= sg->length, sg = sg_next(sg))
+			;
+		if (offset) {
+			sg_init_table(req_ctx->bufsl, 2);
+			sg_set_buf(req_ctx->bufsl, sg_virt(sg) + offset,
+				   sg->length - offset);
+			sg_chain(req_ctx->bufsl, 2, sg_next(sg));
+			req_ctx->psrc = req_ctx->bufsl;
+		} else {
+			req_ctx->psrc = sg;
+		}
 	} else
 		req_ctx->psrc = areq->src;
 
@@ -2098,8 +2116,7 @@ static int ahash_process_req(struct ahash_request *areq, unsigned int nbytes)
 	if (ctx->keylen && (req_ctx->first || req_ctx->last))
 		edesc->desc.hdr |= DESC_HDR_MODE0_MDEU_HMAC;
 
-	return common_nonsnoop_hash(edesc, areq, nbytes_to_hash, offset,
-				    ahash_done);
+	return common_nonsnoop_hash(edesc, areq, nbytes_to_hash, ahash_done);
 }
 
 static int ahash_update(struct ahash_request *areq)
-- 
2.13.3

