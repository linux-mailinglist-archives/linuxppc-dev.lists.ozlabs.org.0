Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 08C762FD8FE
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Jan 2021 20:02:17 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DLZdZ6b9SzDqbq
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Jan 2021 06:02:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DLZXM1T6zzDqR6
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Jan 2021 05:57:33 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4DLZX54r44z9tybl;
 Wed, 20 Jan 2021 19:57:25 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id spdC_h7kWmvk; Wed, 20 Jan 2021 19:57:25 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4DLZX53xvZz9tybZ;
 Wed, 20 Jan 2021 19:57:25 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 76BAF8B7F8;
 Wed, 20 Jan 2021 19:57:25 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 0BLiNn7tEHnH; Wed, 20 Jan 2021 19:57:25 +0100 (CET)
Received: from po16121vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 16A798B7F2;
 Wed, 20 Jan 2021 19:57:25 +0100 (CET)
Received: by po16121vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id D92D866A56; Wed, 20 Jan 2021 18:57:24 +0000 (UTC)
Message-Id: <4b7a870573f485b9fea496b13c9b02d86dd97314.1611169001.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH 1/2] crypto: talitos - Work around SEC6 ERRATA (AES-CTR mode
 data size error)
To: Herbert Xu <herbert@gondor.apana.org.au>,
 "David S. Miller" <davem@davemloft.net>
Date: Wed, 20 Jan 2021 18:57:24 +0000 (UTC)
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

Talitos Security Engine AESU considers any input
data size that is not a multiple of 16 bytes to be an error.
This is not a problem in general, except for Counter mode
that is a stream cipher and can have an input of any size.

Test Manager for ctr(aes) fails on 4th test vector which has
a length of 499 while all previous vectors which have a 16 bytes
multiple length succeed.

As suggested by Freescale, round up the input data length to the
nearest 16 bytes.

Fixes: 5e75ae1b3cef ("crypto: talitos - add new crypto modes")
Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 drivers/crypto/talitos.c | 28 ++++++++++++++++------------
 drivers/crypto/talitos.h |  1 +
 2 files changed, 17 insertions(+), 12 deletions(-)

diff --git a/drivers/crypto/talitos.c b/drivers/crypto/talitos.c
index 4fd85f31630a..b656983c1ef4 100644
--- a/drivers/crypto/talitos.c
+++ b/drivers/crypto/talitos.c
@@ -1093,11 +1093,12 @@ static void ipsec_esp_decrypt_hwauth_done(struct device *dev,
  */
 static int sg_to_link_tbl_offset(struct scatterlist *sg, int sg_count,
 				 unsigned int offset, int datalen, int elen,
-				 struct talitos_ptr *link_tbl_ptr)
+				 struct talitos_ptr *link_tbl_ptr, int align)
 {
 	int n_sg = elen ? sg_count + 1 : sg_count;
 	int count = 0;
 	int cryptlen = datalen + elen;
+	int padding = ALIGN(cryptlen, align) - cryptlen;
 
 	while (cryptlen && sg && n_sg--) {
 		unsigned int len = sg_dma_len(sg);
@@ -1121,7 +1122,7 @@ static int sg_to_link_tbl_offset(struct scatterlist *sg, int sg_count,
 			offset += datalen;
 		}
 		to_talitos_ptr(link_tbl_ptr + count,
-			       sg_dma_address(sg) + offset, len, 0);
+			       sg_dma_address(sg) + offset, sg_next(sg) ? len : len + padding, 0);
 		to_talitos_ptr_ext_set(link_tbl_ptr + count, 0, 0);
 		count++;
 		cryptlen -= len;
@@ -1144,10 +1145,11 @@ static int talitos_sg_map_ext(struct device *dev, struct scatterlist *src,
 			      unsigned int len, struct talitos_edesc *edesc,
 			      struct talitos_ptr *ptr, int sg_count,
 			      unsigned int offset, int tbl_off, int elen,
-			      bool force)
+			      bool force, int align)
 {
 	struct talitos_private *priv = dev_get_drvdata(dev);
 	bool is_sec1 = has_ftr_sec1(priv);
+	int aligned_len = ALIGN(len, align);
 
 	if (!src) {
 		to_talitos_ptr(ptr, 0, 0, is_sec1);
@@ -1155,22 +1157,22 @@ static int talitos_sg_map_ext(struct device *dev, struct scatterlist *src,
 	}
 	to_talitos_ptr_ext_set(ptr, elen, is_sec1);
 	if (sg_count == 1 && !force) {
-		to_talitos_ptr(ptr, sg_dma_address(src) + offset, len, is_sec1);
+		to_talitos_ptr(ptr, sg_dma_address(src) + offset, aligned_len, is_sec1);
 		return sg_count;
 	}
 	if (is_sec1) {
-		to_talitos_ptr(ptr, edesc->dma_link_tbl + offset, len, is_sec1);
+		to_talitos_ptr(ptr, edesc->dma_link_tbl + offset, aligned_len, is_sec1);
 		return sg_count;
 	}
 	sg_count = sg_to_link_tbl_offset(src, sg_count, offset, len, elen,
-					 &edesc->link_tbl[tbl_off]);
+					 &edesc->link_tbl[tbl_off], align);
 	if (sg_count == 1 && !force) {
 		/* Only one segment now, so no link tbl needed*/
 		copy_talitos_ptr(ptr, &edesc->link_tbl[tbl_off], is_sec1);
 		return sg_count;
 	}
 	to_talitos_ptr(ptr, edesc->dma_link_tbl +
-			    tbl_off * sizeof(struct talitos_ptr), len, is_sec1);
+			    tbl_off * sizeof(struct talitos_ptr), aligned_len, is_sec1);
 	to_talitos_ptr_ext_or(ptr, DESC_PTR_LNKTBL_JUMP, is_sec1);
 
 	return sg_count;
@@ -1182,7 +1184,7 @@ static int talitos_sg_map(struct device *dev, struct scatterlist *src,
 			  unsigned int offset, int tbl_off)
 {
 	return talitos_sg_map_ext(dev, src, len, edesc, ptr, sg_count, offset,
-				  tbl_off, 0, false);
+				  tbl_off, 0, false, 1);
 }
 
 /*
@@ -1251,7 +1253,7 @@ static int ipsec_esp(struct talitos_edesc *edesc, struct aead_request *areq,
 
 	ret = talitos_sg_map_ext(dev, areq->src, cryptlen, edesc, &desc->ptr[4],
 				 sg_count, areq->assoclen, tbl_off, elen,
-				 false);
+				 false, 1);
 
 	if (ret > 1) {
 		tbl_off += ret;
@@ -1271,7 +1273,7 @@ static int ipsec_esp(struct talitos_edesc *edesc, struct aead_request *areq,
 		elen = 0;
 	ret = talitos_sg_map_ext(dev, areq->dst, cryptlen, edesc, &desc->ptr[5],
 				 sg_count, areq->assoclen, tbl_off, elen,
-				 is_ipsec_esp && !encrypt);
+				 is_ipsec_esp && !encrypt, 1);
 	tbl_off += ret;
 
 	if (!encrypt && is_ipsec_esp) {
@@ -1577,6 +1579,8 @@ static int common_nonsnoop(struct talitos_edesc *edesc,
 	bool sync_needed = false;
 	struct talitos_private *priv = dev_get_drvdata(dev);
 	bool is_sec1 = has_ftr_sec1(priv);
+	bool is_ctr = (desc->hdr & DESC_HDR_SEL0_MASK) == DESC_HDR_SEL0_AESU &&
+		      (desc->hdr & DESC_HDR_MODE0_AESU_MASK) == DESC_HDR_MODE0_AESU_CTR;
 
 	/* first DWORD empty */
 
@@ -1597,8 +1601,8 @@ static int common_nonsnoop(struct talitos_edesc *edesc,
 	/*
 	 * cipher in
 	 */
-	sg_count = talitos_sg_map(dev, areq->src, cryptlen, edesc,
-				  &desc->ptr[3], sg_count, 0, 0);
+	sg_count = talitos_sg_map_ext(dev, areq->src, cryptlen, edesc, &desc->ptr[3],
+				      sg_count, 0, 0, 0, false, is_ctr ? 16 : 1);
 	if (sg_count > 1)
 		sync_needed = true;
 
diff --git a/drivers/crypto/talitos.h b/drivers/crypto/talitos.h
index 1469b956948a..32825119e880 100644
--- a/drivers/crypto/talitos.h
+++ b/drivers/crypto/talitos.h
@@ -344,6 +344,7 @@ static inline bool has_ftr_sec1(struct talitos_private *priv)
 
 /* primary execution unit mode (MODE0) and derivatives */
 #define	DESC_HDR_MODE0_ENCRYPT		cpu_to_be32(0x00100000)
+#define	DESC_HDR_MODE0_AESU_MASK	cpu_to_be32(0x00600000)
 #define	DESC_HDR_MODE0_AESU_CBC		cpu_to_be32(0x00200000)
 #define	DESC_HDR_MODE0_AESU_CTR		cpu_to_be32(0x00600000)
 #define	DESC_HDR_MODE0_DEU_CBC		cpu_to_be32(0x00400000)
-- 
2.25.0

