Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D8794372FC
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jun 2019 13:33:28 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45KNny2ZZFzDqhK
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jun 2019 21:33:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="tIR3HCgn"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45KNlx629lzDqbm
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Jun 2019 21:31:40 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 45KNlq4950zB09ZJ;
 Thu,  6 Jun 2019 13:31:35 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=tIR3HCgn; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id Odj_122aIE3k; Thu,  6 Jun 2019 13:31:35 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 45KNlq38Z6zB09ZF;
 Thu,  6 Jun 2019 13:31:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1559820695; bh=bVMoYWyQICOMlL2QkFxnCi9wjRbBPraJGKScL5u/bVE=;
 h=In-Reply-To:References:From:Subject:To:Cc:Date:From;
 b=tIR3HCgnhEFXYKSkZdPCmw/J6nCMvhuOO7RJhBL/av3/YRh+JTc87NeL/Cw1YiPt3
 WjFAdm3IHEgfVplUU3St8WYPQUBbdWavtsNl/jRC90S8LTsHCr4drbRBFBvXFX+0gS
 +zFliIJaoHMWFr0mPg2EK0N1voNsOEx5MOtItvEg=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id AF6118B894;
 Thu,  6 Jun 2019 13:31:36 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 8LQ2xbHuZrdK; Thu,  6 Jun 2019 13:31:36 +0200 (CEST)
Received: from po16838vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 856528B891;
 Thu,  6 Jun 2019 13:31:36 +0200 (CEST)
Received: by po16838vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 6218568CFD; Thu,  6 Jun 2019 11:31:36 +0000 (UTC)
Message-Id: <c8b988faeea463b89e7d9485c9328dc65a909e8e.1559819372.git.christophe.leroy@c-s.fr>
In-Reply-To: <cover.1559819372.git.christophe.leroy@c-s.fr>
References: <cover.1559819372.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH v1 1/5] crypto: talitos - fix ECB and CBC algs ivsize
To: Herbert Xu <herbert@gondor.apana.org.au>,
 "David S. Miller" <davem@davemloft.net>, horia.geanta@nxp.com
Date: Thu,  6 Jun 2019 11:31:36 +0000 (UTC)
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

commit d84cc9c9524e ("crypto: talitos - fix ECB algs ivsize")
wrongly modified CBC algs ivsize instead of ECB aggs ivsize.

This restore the CBC algs original ivsize of removes ECB's ones.

Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
Fixes: d84cc9c9524e ("crypto: talitos - fix ECB algs ivsize")
---
 drivers/crypto/talitos.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/crypto/talitos.c b/drivers/crypto/talitos.c
index 122ec6c85446..3b3e99f1cddb 100644
--- a/drivers/crypto/talitos.c
+++ b/drivers/crypto/talitos.c
@@ -2753,7 +2753,6 @@ static struct talitos_alg_template driver_algs[] = {
 			.cra_ablkcipher = {
 				.min_keysize = AES_MIN_KEY_SIZE,
 				.max_keysize = AES_MAX_KEY_SIZE,
-				.ivsize = AES_BLOCK_SIZE,
 				.setkey = ablkcipher_aes_setkey,
 			}
 		},
@@ -2770,6 +2769,7 @@ static struct talitos_alg_template driver_algs[] = {
 			.cra_ablkcipher = {
 				.min_keysize = AES_MIN_KEY_SIZE,
 				.max_keysize = AES_MAX_KEY_SIZE,
+				.ivsize = AES_BLOCK_SIZE,
 				.setkey = ablkcipher_aes_setkey,
 			}
 		},
@@ -2805,7 +2805,6 @@ static struct talitos_alg_template driver_algs[] = {
 			.cra_ablkcipher = {
 				.min_keysize = DES_KEY_SIZE,
 				.max_keysize = DES_KEY_SIZE,
-				.ivsize = DES_BLOCK_SIZE,
 				.setkey = ablkcipher_des_setkey,
 			}
 		},
@@ -2822,6 +2821,7 @@ static struct talitos_alg_template driver_algs[] = {
 			.cra_ablkcipher = {
 				.min_keysize = DES_KEY_SIZE,
 				.max_keysize = DES_KEY_SIZE,
+				.ivsize = DES_BLOCK_SIZE,
 				.setkey = ablkcipher_des_setkey,
 			}
 		},
@@ -2839,7 +2839,6 @@ static struct talitos_alg_template driver_algs[] = {
 			.cra_ablkcipher = {
 				.min_keysize = DES3_EDE_KEY_SIZE,
 				.max_keysize = DES3_EDE_KEY_SIZE,
-				.ivsize = DES3_EDE_BLOCK_SIZE,
 				.setkey = ablkcipher_des3_setkey,
 			}
 		},
@@ -2857,6 +2856,7 @@ static struct talitos_alg_template driver_algs[] = {
 			.cra_ablkcipher = {
 				.min_keysize = DES3_EDE_KEY_SIZE,
 				.max_keysize = DES3_EDE_KEY_SIZE,
+				.ivsize = DES3_EDE_BLOCK_SIZE,
 				.setkey = ablkcipher_des3_setkey,
 			}
 		},
-- 
2.13.3

