Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B7E014362C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Jun 2019 15:01:40 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45PkQT6RnFzDrBG
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Jun 2019 23:01:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="Dy0Qae74"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Pk7n0ZfmzDrKb
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Jun 2019 22:48:52 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 45Pk7h1nFWz9v00N;
 Thu, 13 Jun 2019 14:48:48 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=Dy0Qae74; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id 5zrcCdwVIyAp; Thu, 13 Jun 2019 14:48:48 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 45Pk7h0js1z9tyyY;
 Thu, 13 Jun 2019 14:48:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1560430128; bh=48bCG2FBih9b4lqcwwmGEUUwF3MxrGDZlCtBYkGURQw=;
 h=In-Reply-To:References:From:Subject:To:Cc:Date:From;
 b=Dy0Qae74kWDxgTVBD94oXCDe4f+EhieWJmfnqlGDMvV075Ctftar9r/PFQNK/S/V4
 4IZCVxZhdhspJicETGepox/raLxokW0U4WenOlVw2F+F0JMYMs0R+oiWU49WKTxUlJ
 DlbZYcnyP1eTUmf5TmOa9eGik8LgUx6lDYXTAaAM=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 748E68B8E4;
 Thu, 13 Jun 2019 14:48:49 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id yAMQDT9dkyzE; Thu, 13 Jun 2019 14:48:49 +0200 (CEST)
Received: from po16838vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 3CD2D8B8B9;
 Thu, 13 Jun 2019 14:48:49 +0200 (CEST)
Received: by po16838vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 07A7C68D71; Thu, 13 Jun 2019 12:48:49 +0000 (UTC)
Message-Id: <a588e8d3d0feaa76ee5eace8456447653dde9d48.1560429844.git.christophe.leroy@c-s.fr>
In-Reply-To: <cover.1560429844.git.christophe.leroy@c-s.fr>
References: <cover.1560429844.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH v3 4/4] crypto: talitos - drop icv_ool
To: Herbert Xu <herbert@gondor.apana.org.au>,
 "David S. Miller" <davem@davemloft.net>, horia.geanta@nxp.com
Date: Thu, 13 Jun 2019 12:48:49 +0000 (UTC)
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

icv_ool is not used anymore, drop it.

Fixes: e345177ded17 ("crypto: talitos - fix AEAD processing.")
Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
---
 drivers/crypto/talitos.c | 3 ---
 drivers/crypto/talitos.h | 2 --
 2 files changed, 5 deletions(-)

diff --git a/drivers/crypto/talitos.c b/drivers/crypto/talitos.c
index b2de931de623..03b7a5d28fb0 100644
--- a/drivers/crypto/talitos.c
+++ b/drivers/crypto/talitos.c
@@ -1278,9 +1278,6 @@ static int ipsec_esp(struct talitos_edesc *edesc, struct aead_request *areq,
 				 is_ipsec_esp && !encrypt);
 	tbl_off += ret;
 
-	/* ICV data */
-	edesc->icv_ool = !encrypt;
-
 	if (!encrypt && is_ipsec_esp) {
 		struct talitos_ptr *tbl_ptr = &edesc->link_tbl[tbl_off];
 
diff --git a/drivers/crypto/talitos.h b/drivers/crypto/talitos.h
index 95f78c6d9206..1469b956948a 100644
--- a/drivers/crypto/talitos.h
+++ b/drivers/crypto/talitos.h
@@ -46,7 +46,6 @@ struct talitos_desc {
  * talitos_edesc - s/w-extended descriptor
  * @src_nents: number of segments in input scatterlist
  * @dst_nents: number of segments in output scatterlist
- * @icv_ool: whether ICV is out-of-line
  * @iv_dma: dma address of iv for checking continuity and link table
  * @dma_len: length of dma mapped link_tbl space
  * @dma_link_tbl: bus physical address of link_tbl/buf
@@ -61,7 +60,6 @@ struct talitos_desc {
 struct talitos_edesc {
 	int src_nents;
 	int dst_nents;
-	bool icv_ool;
 	dma_addr_t iv_dma;
 	int dma_len;
 	dma_addr_t dma_link_tbl;
-- 
2.13.3

