Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B62625146
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 May 2019 15:57:54 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 457clz52SczDqJM
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 May 2019 23:57:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="ticG2/lY"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 457cDr4k3ZzDqFH
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 May 2019 23:34:20 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 457cDm1T9Qz9v2XY;
 Tue, 21 May 2019 15:34:16 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=ticG2/lY; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id dFK9IUwmY9LA; Tue, 21 May 2019 15:34:16 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 457cDm0Ny0z9v2Xf;
 Tue, 21 May 2019 15:34:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1558445656; bh=TWP1VL/ELSGNgIfJBuTbhQmJ3wF1WuIsfR7TTEfE+Ck=;
 h=In-Reply-To:References:From:Subject:To:Cc:Date:From;
 b=ticG2/lYg1espekUAkEJFsXFcLbBLGHJsk0y6ZjFxLJV5QNXHcxLI0Jo9NmWT4pT/
 oZdWkClzWbCeXr0+h/cctB5zw3doknGT5aMeOTG46B/o9PEx0v5/0bpwkmGFxI4FYf
 Ayadr9BiIZk5+enBTdZfCpxlUa2YTy3hTbUV9028=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 723088B803;
 Tue, 21 May 2019 15:34:17 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 6LPi8hhLSWRl; Tue, 21 May 2019 15:34:17 +0200 (CEST)
Received: from po16846vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 2D7AB8B80D;
 Tue, 21 May 2019 15:34:17 +0200 (CEST)
Received: by po16846vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 060A968479; Tue, 21 May 2019 13:34:17 +0000 (UTC)
Message-Id: <bc1520e04d70bf626673999c6d9f5a7386239cd0.1558445259.git.christophe.leroy@c-s.fr>
In-Reply-To: <cover.1558445259.git.christophe.leroy@c-s.fr>
References: <cover.1558445259.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH v1 10/15] crypto: talitos - properly handle split ICV.
To: Herbert Xu <herbert@gondor.apana.org.au>,
 "David S. Miller" <davem@davemloft.net>, horia.geanta@nxp.com
Date: Tue, 21 May 2019 13:34:17 +0000 (UTC)
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

The driver assumes that the ICV is as a single piece in the last
element of the scatterlist. This assumption is wrong.

This patch ensures that the ICV is properly handled regardless of
the scatterlist layout.

Fixes: 9c4a79653b35 ("crypto: talitos - Freescale integrated security engine (SEC) driver")
Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
---
 drivers/crypto/talitos.c | 26 +++++++++++++++-----------
 1 file changed, 15 insertions(+), 11 deletions(-)

diff --git a/drivers/crypto/talitos.c b/drivers/crypto/talitos.c
index e35581d67315..7c8a3a717b91 100644
--- a/drivers/crypto/talitos.c
+++ b/drivers/crypto/talitos.c
@@ -1069,7 +1069,6 @@ static void ipsec_esp_encrypt_done(struct device *dev,
 	unsigned int authsize = crypto_aead_authsize(authenc);
 	unsigned int ivsize = crypto_aead_ivsize(authenc);
 	struct talitos_edesc *edesc;
-	struct scatterlist *sg;
 	void *icvdata;
 
 	edesc = container_of(desc, struct talitos_edesc, desc);
@@ -1083,9 +1082,8 @@ static void ipsec_esp_encrypt_done(struct device *dev,
 		else
 			icvdata = &edesc->link_tbl[edesc->src_nents +
 						   edesc->dst_nents + 2];
-		sg = sg_last(areq->dst, edesc->dst_nents);
-		memcpy((char *)sg_virt(sg) + sg->length - authsize,
-		       icvdata, authsize);
+		sg_pcopy_from_buffer(areq->dst, edesc->dst_nents ? : 1, icvdata,
+				     authsize, areq->assoclen + areq->cryptlen);
 	}
 
 	dma_unmap_single(dev, edesc->iv_dma, ivsize, DMA_TO_DEVICE);
@@ -1103,7 +1101,6 @@ static void ipsec_esp_decrypt_swauth_done(struct device *dev,
 	struct crypto_aead *authenc = crypto_aead_reqtfm(req);
 	unsigned int authsize = crypto_aead_authsize(authenc);
 	struct talitos_edesc *edesc;
-	struct scatterlist *sg;
 	char *oicv, *icv;
 	struct talitos_private *priv = dev_get_drvdata(dev);
 	bool is_sec1 = has_ftr_sec1(priv);
@@ -1113,9 +1110,18 @@ static void ipsec_esp_decrypt_swauth_done(struct device *dev,
 	ipsec_esp_unmap(dev, edesc, req, false);
 
 	if (!err) {
+		char icvdata[SHA512_DIGEST_SIZE];
+		int nents = edesc->dst_nents ? : 1;
+		unsigned int len = req->assoclen + req->cryptlen;
+
 		/* auth check */
-		sg = sg_last(req->dst, edesc->dst_nents ? : 1);
-		icv = (char *)sg_virt(sg) + sg->length - authsize;
+		if (nents > 1) {
+			sg_pcopy_to_buffer(req->dst, nents, icvdata, authsize,
+					   len - authsize);
+			icv = icvdata;
+		} else {
+			icv = (char *)sg_virt(req->dst) + len - authsize;
+		}
 
 		if (edesc->dma_len) {
 			if (is_sec1)
@@ -1537,7 +1543,6 @@ static int aead_decrypt(struct aead_request *req)
 	struct talitos_ctx *ctx = crypto_aead_ctx(authenc);
 	struct talitos_private *priv = dev_get_drvdata(ctx->dev);
 	struct talitos_edesc *edesc;
-	struct scatterlist *sg;
 	void *icvdata;
 
 	/* allocate extended descriptor */
@@ -1571,9 +1576,8 @@ static int aead_decrypt(struct aead_request *req)
 	else
 		icvdata = &edesc->link_tbl[0];
 
-	sg = sg_last(req->src, edesc->src_nents ? : 1);
-
-	memcpy(icvdata, (char *)sg_virt(sg) + sg->length - authsize, authsize);
+	sg_pcopy_to_buffer(req->src, edesc->src_nents ? : 1, icvdata, authsize,
+			   req->assoclen + req->cryptlen - authsize);
 
 	return ipsec_esp(edesc, req, false, ipsec_esp_decrypt_swauth_done);
 }
-- 
2.13.3

