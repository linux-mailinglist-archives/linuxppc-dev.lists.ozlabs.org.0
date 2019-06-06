Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CE3F37320
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jun 2019 13:41:11 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45KNyr481PzDqRk
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jun 2019 21:41:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="s8SV6TPa"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45KNm23GxGzDqdL
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Jun 2019 21:31:46 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 45KNlv59S7zB09ZT;
 Thu,  6 Jun 2019 13:31:39 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=s8SV6TPa; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id LDyzcTRL0Pw3; Thu,  6 Jun 2019 13:31:39 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 45KNlv47SgzB09ZF;
 Thu,  6 Jun 2019 13:31:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1559820699; bh=qIFQKb1N1ogct12r5N11IyeBAwzBADP2oCf+gxBp0T4=;
 h=In-Reply-To:References:From:Subject:To:Cc:Date:From;
 b=s8SV6TPaEgaJ3fs8aE/PfEZpUKWX6GQFed9TV6rdiwpF0svv46OQH5qWTYysAW93f
 wamkF8kCxBmx36XB/AzzzJNSFYF1S3tEe4Fh6Sc4td/YpwPOrUQMGcuihl25rhDlc2
 nxVqzriH6THsN3uiJ2ckbD48alHYmymrXXe42l5g=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id D183C8B894;
 Thu,  6 Jun 2019 13:31:40 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id C7IcPtaUiVJW; Thu,  6 Jun 2019 13:31:40 +0200 (CEST)
Received: from po16838vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 9F5838B891;
 Thu,  6 Jun 2019 13:31:40 +0200 (CEST)
Received: by po16838vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 7B3C568CFD; Thu,  6 Jun 2019 11:31:40 +0000 (UTC)
Message-Id: <a8d43c4414fc4fc3442f185b304ca9f659e6bfbb.1559819372.git.christophe.leroy@c-s.fr>
In-Reply-To: <cover.1559819372.git.christophe.leroy@c-s.fr>
References: <cover.1559819372.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH v1 5/5] crypto: talitos - drop icv_ool
To: Herbert Xu <herbert@gondor.apana.org.au>,
 "David S. Miller" <davem@davemloft.net>, horia.geanta@nxp.com
Date: Thu,  6 Jun 2019 11:31:40 +0000 (UTC)
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

Fixes: 9cc87bc3613b ("crypto: talitos - fix AEAD processing")
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

