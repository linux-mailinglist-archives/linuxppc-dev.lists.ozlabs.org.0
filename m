Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C1A13730B
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jun 2019 13:36:29 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45KNsQ46nrzDqfD
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jun 2019 21:36:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="bmchooTJ"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45KNly16mqzDqdL
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Jun 2019 21:31:41 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 45KNlr4wqPzB09ZP;
 Thu,  6 Jun 2019 13:31:36 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=bmchooTJ; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id 02uiVHsYpACb; Thu,  6 Jun 2019 13:31:36 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 45KNlr3skFzB09ZF;
 Thu,  6 Jun 2019 13:31:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1559820696; bh=C807DMn2knPnxoyEdl5erVMcqL7Pg26rgYiktiJfkeo=;
 h=In-Reply-To:References:From:Subject:To:Cc:Date:From;
 b=bmchooTJ3kmi9co7DlYaKcbCEliAkBfomwNM4/LXqtNRc6ISGPVbQ+cC/qDFVO1dT
 VEKPypecEVD+1Ae4mtyzHAdMWVX7gWm1POM1f7xYwMQuA+ElYOtfXjP9Y7sE73lXs5
 EBbyBkD1sPXhSHEl8BsRckyrNHsTYzlqiKnHXVZc=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id C78A18B894;
 Thu,  6 Jun 2019 13:31:37 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id SiytaB2fKX2F; Thu,  6 Jun 2019 13:31:37 +0200 (CEST)
Received: from po16838vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 8645C8B891;
 Thu,  6 Jun 2019 13:31:37 +0200 (CEST)
Received: by po16838vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 687FF68CFD; Thu,  6 Jun 2019 11:31:37 +0000 (UTC)
Message-Id: <108a23c4d2f0803b1302bc00c7321d799e42edc1.1559819372.git.christophe.leroy@c-s.fr>
In-Reply-To: <cover.1559819372.git.christophe.leroy@c-s.fr>
References: <cover.1559819372.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH v1 2/5] crypto: talitos - move struct talitos_edesc into
 talitos.h
To: Herbert Xu <herbert@gondor.apana.org.au>,
 "David S. Miller" <davem@davemloft.net>, horia.geanta@nxp.com
Date: Thu,  6 Jun 2019 11:31:37 +0000 (UTC)
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

Next patch will require struct talitos_edesc to be defined
earlier in talitos.c

This patch moves it into talitos.h so that it can be used
from any place in talitos.c

Fixes: 37b5e8897eb5 ("crypto: talitos - chain in buffered data for ahash on SEC1")
Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
---
 drivers/crypto/talitos.c | 30 ------------------------------
 drivers/crypto/talitos.h | 30 ++++++++++++++++++++++++++++++
 2 files changed, 30 insertions(+), 30 deletions(-)

diff --git a/drivers/crypto/talitos.c b/drivers/crypto/talitos.c
index 3b3e99f1cddb..5b401aec6c84 100644
--- a/drivers/crypto/talitos.c
+++ b/drivers/crypto/talitos.c
@@ -951,36 +951,6 @@ static int aead_des3_setkey(struct crypto_aead *authenc,
 	goto out;
 }
 
-/*
- * talitos_edesc - s/w-extended descriptor
- * @src_nents: number of segments in input scatterlist
- * @dst_nents: number of segments in output scatterlist
- * @icv_ool: whether ICV is out-of-line
- * @iv_dma: dma address of iv for checking continuity and link table
- * @dma_len: length of dma mapped link_tbl space
- * @dma_link_tbl: bus physical address of link_tbl/buf
- * @desc: h/w descriptor
- * @link_tbl: input and output h/w link tables (if {src,dst}_nents > 1) (SEC2)
- * @buf: input and output buffeur (if {src,dst}_nents > 1) (SEC1)
- *
- * if decrypting (with authcheck), or either one of src_nents or dst_nents
- * is greater than 1, an integrity check value is concatenated to the end
- * of link_tbl data
- */
-struct talitos_edesc {
-	int src_nents;
-	int dst_nents;
-	bool icv_ool;
-	dma_addr_t iv_dma;
-	int dma_len;
-	dma_addr_t dma_link_tbl;
-	struct talitos_desc desc;
-	union {
-		struct talitos_ptr link_tbl[0];
-		u8 buf[0];
-	};
-};
-
 static void talitos_sg_unmap(struct device *dev,
 			     struct talitos_edesc *edesc,
 			     struct scatterlist *src,
diff --git a/drivers/crypto/talitos.h b/drivers/crypto/talitos.h
index 32ad4fc679ed..95f78c6d9206 100644
--- a/drivers/crypto/talitos.h
+++ b/drivers/crypto/talitos.h
@@ -42,6 +42,36 @@ struct talitos_desc {
 
 #define TALITOS_DESC_SIZE	(sizeof(struct talitos_desc) - sizeof(__be32))
 
+/*
+ * talitos_edesc - s/w-extended descriptor
+ * @src_nents: number of segments in input scatterlist
+ * @dst_nents: number of segments in output scatterlist
+ * @icv_ool: whether ICV is out-of-line
+ * @iv_dma: dma address of iv for checking continuity and link table
+ * @dma_len: length of dma mapped link_tbl space
+ * @dma_link_tbl: bus physical address of link_tbl/buf
+ * @desc: h/w descriptor
+ * @link_tbl: input and output h/w link tables (if {src,dst}_nents > 1) (SEC2)
+ * @buf: input and output buffeur (if {src,dst}_nents > 1) (SEC1)
+ *
+ * if decrypting (with authcheck), or either one of src_nents or dst_nents
+ * is greater than 1, an integrity check value is concatenated to the end
+ * of link_tbl data
+ */
+struct talitos_edesc {
+	int src_nents;
+	int dst_nents;
+	bool icv_ool;
+	dma_addr_t iv_dma;
+	int dma_len;
+	dma_addr_t dma_link_tbl;
+	struct talitos_desc desc;
+	union {
+		struct talitos_ptr link_tbl[0];
+		u8 buf[0];
+	};
+};
+
 /**
  * talitos_request - descriptor submission request
  * @desc: descriptor pointer (kernel virtual)
-- 
2.13.3

