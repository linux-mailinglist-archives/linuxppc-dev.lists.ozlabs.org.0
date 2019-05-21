Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 377AD25188
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 May 2019 16:09:06 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 457d0v4lt2zDqBv
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 May 2019 00:09:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="c7MnmKsD"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 457cDt5pSVzDqJM
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 May 2019 23:34:22 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 457cDp2bxCz9v2Xc;
 Tue, 21 May 2019 15:34:18 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=c7MnmKsD; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id EU8y27qbYh-c; Tue, 21 May 2019 15:34:18 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 457cDp1PSjz9v2Xf;
 Tue, 21 May 2019 15:34:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1558445658; bh=Z/LrS9uBz8cAH8XeJEQhr+cfjzFQ2UDkFf390TslgWY=;
 h=In-Reply-To:References:From:Subject:To:Cc:Date:From;
 b=c7MnmKsDrdjVpMan59Kk48OIJiIUAPPAPfqwY0gSmogeDghrONvGFtV5Hvi3YUIbv
 KcZIf23TLBSyuvJLvokWb5zw4yvF7NF023txiwuEi1sHMemSWirxi0HpFOmmrdQ1TO
 5bMpoxt63Sa9KnhhgnP4UQtbaqZT3FoOodOA52js=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id A37928B80D;
 Tue, 21 May 2019 15:34:19 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id dBK73kWQ-bNw; Tue, 21 May 2019 15:34:19 +0200 (CEST)
Received: from po16846vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 4E0A48B803;
 Tue, 21 May 2019 15:34:19 +0200 (CEST)
Received: by po16846vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 12F0068458; Tue, 21 May 2019 13:34:19 +0000 (UTC)
Message-Id: <479ef10c07beceac38cd3c94bae4b9332759c091.1558445259.git.christophe.leroy@c-s.fr>
In-Reply-To: <cover.1558445259.git.christophe.leroy@c-s.fr>
References: <cover.1558445259.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH v1 12/15] crypto: talitos - fix AEAD processing.
To: Herbert Xu <herbert@gondor.apana.org.au>,
 "David S. Miller" <davem@davemloft.net>, horia.geanta@nxp.com
Date: Tue, 21 May 2019 13:34:19 +0000 (UTC)
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

This driver is working well in 'simple cases', but as soon as
more exotic SG lists are provided (dst different from src,
auth part not in a single SG fragment, ...) there are
wrong results, overruns, etc ...

This patch cleans up the AEAD processing by:
- Simplifying the location of 'out of line' ICV
- Never using 'out of line' ICV on encryp
- Always using 'out of line' ICV on decrypt
- Forcing the generation of a SG table on decrypt

Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
Fixes: aeb4c132f33d ("crypto: talitos - Convert to new AEAD interface")
---
 drivers/crypto/talitos.c | 158 ++++++++++++++++-------------------------------
 drivers/crypto/talitos.h |   2 +-
 2 files changed, 55 insertions(+), 105 deletions(-)

diff --git a/drivers/crypto/talitos.c b/drivers/crypto/talitos.c
index 750b0159e654..12917fd54bcb 100644
--- a/drivers/crypto/talitos.c
+++ b/drivers/crypto/talitos.c
@@ -1040,8 +1040,8 @@ static void ipsec_esp_unmap(struct device *dev,
 					 DMA_FROM_DEVICE);
 	unmap_single_talitos_ptr(dev, civ_ptr, DMA_TO_DEVICE);
 
-	talitos_sg_unmap(dev, edesc, areq->src, areq->dst, cryptlen,
-			 areq->assoclen);
+	talitos_sg_unmap(dev, edesc, areq->src, areq->dst,
+			 cryptlen + authsize, areq->assoclen);
 
 	if (edesc->dma_len)
 		dma_unmap_single(dev, edesc->dma_link_tbl, edesc->dma_len,
@@ -1062,30 +1062,15 @@ static void ipsec_esp_encrypt_done(struct device *dev,
 				   struct talitos_desc *desc, void *context,
 				   int err)
 {
-	struct talitos_private *priv = dev_get_drvdata(dev);
-	bool is_sec1 = has_ftr_sec1(priv);
 	struct aead_request *areq = context;
 	struct crypto_aead *authenc = crypto_aead_reqtfm(areq);
-	unsigned int authsize = crypto_aead_authsize(authenc);
 	unsigned int ivsize = crypto_aead_ivsize(authenc);
 	struct talitos_edesc *edesc;
-	void *icvdata;
 
 	edesc = container_of(desc, struct talitos_edesc, desc);
 
 	ipsec_esp_unmap(dev, edesc, areq, true);
 
-	/* copy the generated ICV to dst */
-	if (edesc->icv_ool) {
-		if (is_sec1)
-			icvdata = edesc->buf + areq->assoclen + areq->cryptlen;
-		else
-			icvdata = &edesc->link_tbl[edesc->src_nents +
-						   edesc->dst_nents + 2];
-		sg_pcopy_from_buffer(areq->dst, edesc->dst_nents ? : 1, icvdata,
-				     authsize, areq->assoclen + areq->cryptlen);
-	}
-
 	dma_unmap_single(dev, edesc->iv_dma, ivsize, DMA_TO_DEVICE);
 
 	kfree(edesc);
@@ -1102,39 +1087,15 @@ static void ipsec_esp_decrypt_swauth_done(struct device *dev,
 	unsigned int authsize = crypto_aead_authsize(authenc);
 	struct talitos_edesc *edesc;
 	char *oicv, *icv;
-	struct talitos_private *priv = dev_get_drvdata(dev);
-	bool is_sec1 = has_ftr_sec1(priv);
 
 	edesc = container_of(desc, struct talitos_edesc, desc);
 
 	ipsec_esp_unmap(dev, edesc, req, false);
 
 	if (!err) {
-		char icvdata[SHA512_DIGEST_SIZE];
-		int nents = edesc->dst_nents ? : 1;
-		unsigned int len = req->assoclen + req->cryptlen;
-
 		/* auth check */
-		if (nents > 1) {
-			sg_pcopy_to_buffer(req->dst, nents, icvdata, authsize,
-					   len - authsize);
-			icv = icvdata;
-		} else {
-			icv = (char *)sg_virt(req->dst) + len - authsize;
-		}
-
-		if (edesc->dma_len) {
-			if (is_sec1)
-				oicv = (char *)&edesc->dma_link_tbl +
-					       req->assoclen + req->cryptlen;
-			else
-				oicv = (char *)
-				       &edesc->link_tbl[edesc->src_nents +
-							edesc->dst_nents + 2];
-			if (edesc->icv_ool)
-				icv = oicv + authsize;
-		} else
-			oicv = (char *)&edesc->link_tbl[0];
+		oicv = edesc->buf + edesc->dma_len;
+		icv = oicv - authsize;
 
 		err = crypto_memneq(oicv, icv, authsize) ? -EBADMSG : 0;
 	}
@@ -1170,11 +1131,12 @@ static void ipsec_esp_decrypt_hwauth_done(struct device *dev,
  * stop at cryptlen bytes
  */
 static int sg_to_link_tbl_offset(struct scatterlist *sg, int sg_count,
-				 unsigned int offset, int cryptlen,
+				 unsigned int offset, int datalen, int elen,
 				 struct talitos_ptr *link_tbl_ptr)
 {
-	int n_sg = sg_count;
+	int n_sg = elen ? sg_count + 1 : sg_count;
 	int count = 0;
+	int cryptlen = datalen + elen;
 
 	while (cryptlen && sg && n_sg--) {
 		unsigned int len = sg_dma_len(sg);
@@ -1189,11 +1151,20 @@ static int sg_to_link_tbl_offset(struct scatterlist *sg, int sg_count,
 		if (len > cryptlen)
 			len = cryptlen;
 
+		if (datalen > 0 && len > datalen) {
+			to_talitos_ptr(link_tbl_ptr + count,
+				       sg_dma_address(sg) + offset, datalen, 0);
+			to_talitos_ptr_ext_set(link_tbl_ptr + count, 0, 0);
+			count++;
+			len -= datalen;
+			offset += datalen;
+		}
 		to_talitos_ptr(link_tbl_ptr + count,
 			       sg_dma_address(sg) + offset, len, 0);
 		to_talitos_ptr_ext_set(link_tbl_ptr + count, 0, 0);
 		count++;
 		cryptlen -= len;
+		datalen -= len;
 		offset = 0;
 
 next:
@@ -1203,7 +1174,7 @@ static int sg_to_link_tbl_offset(struct scatterlist *sg, int sg_count,
 	/* tag end of link table */
 	if (count > 0)
 		to_talitos_ptr_ext_set(link_tbl_ptr + count - 1,
-				       DESC_PTR_LNKTBL_RETURN, 0);
+				       DESC_PTR_LNKTBL_RET, 0);
 
 	return count;
 }
@@ -1211,7 +1182,8 @@ static int sg_to_link_tbl_offset(struct scatterlist *sg, int sg_count,
 static int talitos_sg_map_ext(struct device *dev, struct scatterlist *src,
 			      unsigned int len, struct talitos_edesc *edesc,
 			      struct talitos_ptr *ptr, int sg_count,
-			      unsigned int offset, int tbl_off, int elen)
+			      unsigned int offset, int tbl_off, int elen,
+			      bool force)
 {
 	struct talitos_private *priv = dev_get_drvdata(dev);
 	bool is_sec1 = has_ftr_sec1(priv);
@@ -1221,7 +1193,7 @@ static int talitos_sg_map_ext(struct device *dev, struct scatterlist *src,
 		return 1;
 	}
 	to_talitos_ptr_ext_set(ptr, elen, is_sec1);
-	if (sg_count == 1) {
+	if (sg_count == 1 && !force) {
 		to_talitos_ptr(ptr, sg_dma_address(src) + offset, len, is_sec1);
 		return sg_count;
 	}
@@ -1229,9 +1201,9 @@ static int talitos_sg_map_ext(struct device *dev, struct scatterlist *src,
 		to_talitos_ptr(ptr, edesc->dma_link_tbl + offset, len, is_sec1);
 		return sg_count;
 	}
-	sg_count = sg_to_link_tbl_offset(src, sg_count, offset, len + elen,
+	sg_count = sg_to_link_tbl_offset(src, sg_count, offset, len, elen,
 					 &edesc->link_tbl[tbl_off]);
-	if (sg_count == 1) {
+	if (sg_count == 1 && !force) {
 		/* Only one segment now, so no link tbl needed*/
 		copy_talitos_ptr(ptr, &edesc->link_tbl[tbl_off], is_sec1);
 		return sg_count;
@@ -1249,7 +1221,7 @@ static int talitos_sg_map(struct device *dev, struct scatterlist *src,
 			  unsigned int offset, int tbl_off)
 {
 	return talitos_sg_map_ext(dev, src, len, edesc, ptr, sg_count, offset,
-				  tbl_off, 0);
+				  tbl_off, 0, false);
 }
 
 /*
@@ -1277,6 +1249,7 @@ static int ipsec_esp(struct talitos_edesc *edesc, struct aead_request *areq,
 	bool is_ipsec_esp = desc->hdr & DESC_HDR_TYPE_IPSEC_ESP;
 	struct talitos_ptr *civ_ptr = &desc->ptr[is_ipsec_esp ? 2 : 3];
 	struct talitos_ptr *ckey_ptr = &desc->ptr[is_ipsec_esp ? 3 : 2];
+	dma_addr_t dma_icv = edesc->dma_link_tbl + edesc->dma_len - authsize;
 
 	/* hmac key */
 	to_talitos_ptr(&desc->ptr[0], ctx->dma_key, ctx->authkeylen, is_sec1);
@@ -1316,7 +1289,8 @@ static int ipsec_esp(struct talitos_edesc *edesc, struct aead_request *areq,
 		elen = authsize;
 
 	ret = talitos_sg_map_ext(dev, areq->src, cryptlen, edesc, &desc->ptr[4],
-				 sg_count, areq->assoclen, tbl_off, elen);
+				 sg_count, areq->assoclen, tbl_off, elen,
+				 false);
 
 	if (ret > 1) {
 		tbl_off += ret;
@@ -1330,55 +1304,35 @@ static int ipsec_esp(struct talitos_edesc *edesc, struct aead_request *areq,
 			dma_map_sg(dev, areq->dst, sg_count, DMA_FROM_DEVICE);
 	}
 
-	ret = talitos_sg_map(dev, areq->dst, cryptlen, edesc, &desc->ptr[5],
-			     sg_count, areq->assoclen, tbl_off);
-
-	if (is_ipsec_esp)
-		to_talitos_ptr_ext_or(&desc->ptr[5], authsize, is_sec1);
+	if (is_ipsec_esp && encrypt)
+		elen = authsize;
+	else
+		elen = 0;
+	ret = talitos_sg_map_ext(dev, areq->dst, cryptlen, edesc, &desc->ptr[5],
+				 sg_count, areq->assoclen, tbl_off, elen,
+				 is_ipsec_esp && !encrypt);
+	tbl_off += ret;
 
 	/* ICV data */
-	if (ret > 1) {
-		tbl_off += ret;
-		edesc->icv_ool = true;
-		sync_needed = true;
+	edesc->icv_ool = !encrypt;
 
-		if (is_ipsec_esp) {
-			struct talitos_ptr *tbl_ptr = &edesc->link_tbl[tbl_off];
-			int offset = (edesc->src_nents + edesc->dst_nents + 2) *
-				     sizeof(struct talitos_ptr) + authsize;
+	if (!encrypt && is_ipsec_esp) {
+		struct talitos_ptr *tbl_ptr = &edesc->link_tbl[tbl_off];
 
-			/* Add an entry to the link table for ICV data */
-			to_talitos_ptr_ext_set(tbl_ptr - 1, 0, is_sec1);
-			to_talitos_ptr_ext_set(tbl_ptr, DESC_PTR_LNKTBL_RETURN,
-					       is_sec1);
+		/* Add an entry to the link table for ICV data */
+		to_talitos_ptr_ext_set(tbl_ptr - 1, 0, is_sec1);
+		to_talitos_ptr_ext_set(tbl_ptr, DESC_PTR_LNKTBL_RET, is_sec1);
 
-			/* icv data follows link tables */
-			to_talitos_ptr(tbl_ptr, edesc->dma_link_tbl + offset,
-				       authsize, is_sec1);
-		} else {
-			dma_addr_t addr = edesc->dma_link_tbl;
-
-			if (is_sec1)
-				addr += areq->assoclen + cryptlen;
-			else
-				addr += sizeof(struct talitos_ptr) * tbl_off;
-
-			to_talitos_ptr(&desc->ptr[6], addr, authsize, is_sec1);
-		}
+		/* icv data follows link tables */
+		to_talitos_ptr(tbl_ptr, dma_icv, authsize, is_sec1);
+		to_talitos_ptr_ext_or(&desc->ptr[5], authsize, is_sec1);
+		sync_needed = true;
+	} else if (!encrypt) {
+		to_talitos_ptr(&desc->ptr[6], dma_icv, authsize, is_sec1);
+		sync_needed = true;
 	} else if (!is_ipsec_esp) {
-		ret = talitos_sg_map(dev, areq->dst, authsize, edesc,
-				     &desc->ptr[6], sg_count, areq->assoclen +
-							      cryptlen,
-				     tbl_off);
-		if (ret > 1) {
-			tbl_off += ret;
-			edesc->icv_ool = true;
-			sync_needed = true;
-		} else {
-			edesc->icv_ool = false;
-		}
-	} else {
-		edesc->icv_ool = false;
+		talitos_sg_map(dev, areq->dst, authsize, edesc, &desc->ptr[6],
+			       sg_count, areq->assoclen + cryptlen, tbl_off);
 	}
 
 	/* iv out */
@@ -1461,18 +1415,18 @@ static struct talitos_edesc *talitos_edesc_alloc(struct device *dev,
 	 * and space for two sets of ICVs (stashed and generated)
 	 */
 	alloc_len = sizeof(struct talitos_edesc);
-	if (src_nents || dst_nents) {
+	if (src_nents || dst_nents || !encrypt) {
 		if (is_sec1)
 			dma_len = (src_nents ? src_len : 0) +
-				  (dst_nents ? dst_len : 0);
+				  (dst_nents ? dst_len : 0) + authsize;
 		else
 			dma_len = (src_nents + dst_nents + 2) *
-				  sizeof(struct talitos_ptr) + authsize * 2;
+				  sizeof(struct talitos_ptr) + authsize;
 		alloc_len += dma_len;
 	} else {
 		dma_len = 0;
-		alloc_len += icv_stashing ? authsize : 0;
 	}
+	alloc_len += icv_stashing ? authsize : 0;
 
 	/* if its a ahash, add space for a second desc next to the first one */
 	if (is_sec1 && !dst)
@@ -1570,11 +1524,7 @@ static int aead_decrypt(struct aead_request *req)
 	edesc->desc.hdr = ctx->desc_hdr_template | DESC_HDR_DIR_INBOUND;
 
 	/* stash incoming ICV for later cmp with ICV generated by the h/w */
-	if (edesc->dma_len)
-		icvdata = (char *)&edesc->link_tbl[edesc->src_nents +
-						   edesc->dst_nents + 2];
-	else
-		icvdata = &edesc->link_tbl[0];
+	icvdata = edesc->buf + edesc->dma_len;
 
 	sg_pcopy_to_buffer(req->src, edesc->src_nents ? : 1, icvdata, authsize,
 			   req->assoclen + req->cryptlen - authsize);
diff --git a/drivers/crypto/talitos.h b/drivers/crypto/talitos.h
index a65a63e0d6c1..dbedd0956c8a 100644
--- a/drivers/crypto/talitos.h
+++ b/drivers/crypto/talitos.h
@@ -412,5 +412,5 @@ static inline bool has_ftr_sec1(struct talitos_private *priv)
 
 /* link table extent field bits */
 #define DESC_PTR_LNKTBL_JUMP			0x80
-#define DESC_PTR_LNKTBL_RETURN			0x02
+#define DESC_PTR_LNKTBL_RET			0x02
 #define DESC_PTR_LNKTBL_NEXT			0x01
-- 
2.13.3

