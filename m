Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CD4F25150
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 May 2019 16:00:30 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 457cpz5SpJzDqJQ
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 May 2019 00:00:27 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="wDmkV30Z"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 457cDr5b2SzDqJk
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 May 2019 23:34:20 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 457cDm01ylz9v2Xb;
 Tue, 21 May 2019 15:34:16 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=wDmkV30Z; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id K3dGGqH2eHck; Tue, 21 May 2019 15:34:15 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 457cDl65YDz9v2XY;
 Tue, 21 May 2019 15:34:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1558445655; bh=zYNSnTdBI2zlv+nNU1YJCYKZt0d8+sVXOHJ4QyhBzhk=;
 h=In-Reply-To:References:From:Subject:To:Cc:Date:From;
 b=wDmkV30Z25a7KCNIbqmuyroCCzdpnZqFNkvTW/i3AeXvb+NsDzUq8rXvfPNtj9jzE
 6Rk9nqBL9MU2u3aKtT6fTX2ydZApXMH5EjAh5DWifgCnqnGnUHFuI/Eos07/ktc1ct
 noZH3G9x2fjWRzJjbM2ddga97ma8EuYAxSmtrtGs=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 47A368B80E;
 Tue, 21 May 2019 15:34:17 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id X8v_1FalQceD; Tue, 21 May 2019 15:34:17 +0200 (CEST)
Received: from po16846vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 210998B803;
 Tue, 21 May 2019 15:34:17 +0200 (CEST)
Received: by po16846vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id DF3A868458; Tue, 21 May 2019 13:34:12 +0000 (UTC)
Message-Id: <a276c80d100ab95f14878c052d93a232a527b86d.1558445259.git.christophe.leroy@c-s.fr>
In-Reply-To: <cover.1558445259.git.christophe.leroy@c-s.fr>
References: <cover.1558445259.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH v1 06/15] crypto: talitos - check data blocksize in ablkcipher.
To: Herbert Xu <herbert@gondor.apana.org.au>,
 "David S. Miller" <davem@davemloft.net>, horia.geanta@nxp.com
Date: Tue, 21 May 2019 13:34:12 +0000 (UTC)
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

When data size is not a multiple of the alg's block size,
the SEC generates an error interrupt and dumps the registers.
And for NULL size, the SEC does just nothing and the interrupt
is awaited forever.

This patch ensures the data size is correct before submitting
the request to the SEC engine.

Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
Fixes: 4de9d0b547b9 ("crypto: talitos - Add ablkcipher algorithms")
---
 drivers/crypto/talitos.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/crypto/talitos.c b/drivers/crypto/talitos.c
index 8b9a529f1b66..1e5410f92166 100644
--- a/drivers/crypto/talitos.c
+++ b/drivers/crypto/talitos.c
@@ -1756,6 +1756,14 @@ static int ablkcipher_encrypt(struct ablkcipher_request *areq)
 	struct crypto_ablkcipher *cipher = crypto_ablkcipher_reqtfm(areq);
 	struct talitos_ctx *ctx = crypto_ablkcipher_ctx(cipher);
 	struct talitos_edesc *edesc;
+	unsigned int blocksize =
+			crypto_tfm_alg_blocksize(crypto_ablkcipher_tfm(cipher));
+
+	if (!areq->nbytes)
+		return 0;
+
+	if (areq->nbytes % blocksize)
+		return -EINVAL;
 
 	/* allocate extended descriptor */
 	edesc = ablkcipher_edesc_alloc(areq, true);
@@ -1773,6 +1781,14 @@ static int ablkcipher_decrypt(struct ablkcipher_request *areq)
 	struct crypto_ablkcipher *cipher = crypto_ablkcipher_reqtfm(areq);
 	struct talitos_ctx *ctx = crypto_ablkcipher_ctx(cipher);
 	struct talitos_edesc *edesc;
+	unsigned int blocksize =
+			crypto_tfm_alg_blocksize(crypto_ablkcipher_tfm(cipher));
+
+	if (!areq->nbytes)
+		return 0;
+
+	if (areq->nbytes % blocksize)
+		return -EINVAL;
 
 	/* allocate extended descriptor */
 	edesc = ablkcipher_edesc_alloc(areq, false);
-- 
2.13.3

