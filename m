Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C119FAE36C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Sep 2019 08:05:56 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46SDzh6nKrzDqRx
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Sep 2019 16:05:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="dGp+kTd8"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46SDxv2HKVzDqPT
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Sep 2019 16:04:18 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 46SDxp5XBpz9twm3;
 Tue, 10 Sep 2019 08:04:14 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=dGp+kTd8; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id 0jE7q2QeiFSq; Tue, 10 Sep 2019 08:04:14 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 46SDxp4Qjkz9twm2;
 Tue, 10 Sep 2019 08:04:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1568095454; bh=gaHQgkUONjgM7e5sTpiG9hKW2wcu3sDKClNiLbQr+G0=;
 h=From:Subject:To:Cc:Date:From;
 b=dGp+kTd8MFb+A6ub88VAvyIgBL+gNtMDiPIk6eBeQK7XvuqYXkCQksKXTLZJuRGGv
 edeH6l45cXSt2adFoPN8yzRPDhWXBeWKHwAsRVmfrBQtrh1EEkm/tOESAVTvLRGsJ0
 5ACi3HRB8g0sQUBfz7t4mc4/f2XitC8NRbON+vAk=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 75ACC8B78E;
 Tue, 10 Sep 2019 08:04:15 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id Ztk9dE8IcFel; Tue, 10 Sep 2019 08:04:15 +0200 (CEST)
Received: from pc16032vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 35A448B754;
 Tue, 10 Sep 2019 08:04:15 +0200 (CEST)
Received: by localhost.localdomain (Postfix, from userid 0)
 id C1E3D6B734; Tue, 10 Sep 2019 06:04:14 +0000 (UTC)
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH] crypto: talitos - fix hash result for VMAP_STACK
To: Herbert Xu <herbert@gondor.apana.org.au>,
 "David S. Miller" <davem@davemloft.net>, Eric Biggers <ebiggers@google.com>
Message-Id: <20190910060414.C1E3D6B734@pc16032vm.idsi0.si.c-s.fr>
Date: Tue, 10 Sep 2019 06:04:14 +0000 (UTC)
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

When VMAP_STACK is selected, stack cannot be DMA-mapped.
Therefore, the hash result has to be DMA-mapped in the request
context and copied into areq->result at completion.

Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
---
 drivers/crypto/talitos.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/crypto/talitos.c b/drivers/crypto/talitos.c
index c9d686a0e805..9bd9ff312e2d 100644
--- a/drivers/crypto/talitos.c
+++ b/drivers/crypto/talitos.c
@@ -1728,6 +1728,7 @@ static void common_nonsnoop_hash_unmap(struct device *dev,
 				       struct ahash_request *areq)
 {
 	struct talitos_ahash_req_ctx *req_ctx = ahash_request_ctx(areq);
+	struct crypto_ahash *tfm = crypto_ahash_reqtfm(areq);
 	struct talitos_private *priv = dev_get_drvdata(dev);
 	bool is_sec1 = has_ftr_sec1(priv);
 	struct talitos_desc *desc = &edesc->desc;
@@ -1738,6 +1739,9 @@ static void common_nonsnoop_hash_unmap(struct device *dev,
 	if (desc->next_desc &&
 	    desc->ptr[5].ptr != desc2->ptr[5].ptr)
 		unmap_single_talitos_ptr(dev, &desc2->ptr[5], DMA_FROM_DEVICE);
+	if (req_ctx->last)
+		memcpy(areq->result, req_ctx->hw_context,
+		       crypto_ahash_digestsize(tfm));
 
 	if (req_ctx->psrc)
 		talitos_sg_unmap(dev, edesc, req_ctx->psrc, NULL, 0, 0);
@@ -1869,7 +1873,7 @@ static int common_nonsnoop_hash(struct talitos_edesc *edesc,
 	if (req_ctx->last)
 		map_single_talitos_ptr(dev, &desc->ptr[5],
 				       crypto_ahash_digestsize(tfm),
-				       areq->result, DMA_FROM_DEVICE);
+				       req_ctx->hw_context, DMA_FROM_DEVICE);
 	else
 		map_single_talitos_ptr_nosync(dev, &desc->ptr[5],
 					      req_ctx->hw_context_size,
-- 
2.13.3

