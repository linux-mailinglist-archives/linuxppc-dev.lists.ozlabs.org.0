Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 82AD22511D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 May 2019 15:51:23 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 457ccS6rHtzDqM7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 May 2019 23:51:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="t6CTZgwB"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 457cDp3DMgzDqFH
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 May 2019 23:34:18 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 457cDj0nJ3z9v2Xd;
 Tue, 21 May 2019 15:34:13 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=t6CTZgwB; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id hG5eaUQBgAeL; Tue, 21 May 2019 15:34:13 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 457cDh6s29z9v2XY;
 Tue, 21 May 2019 15:34:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1558445652; bh=X7zVZkzYTN4Bnxl5JCO93V9kRHfnwn7UqNQN+g5VEK0=;
 h=In-Reply-To:References:From:Subject:To:Cc:Date:From;
 b=t6CTZgwBdzp8Jd5M1fZ8jjkSwqNcRj/h2e/0VQHkfaomJDDOQ4JComRYCtXR/FxV3
 CL0xFSQUUxlZR2Qa5TW4AcZm53V/GtgFEI3L7BNsJ410+7TIjt71cDeopnwA1oGmv/
 7ufeT40ldmjJVyJW9uXh+A9lQ1Nh8BTm6NMY2vcc=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 570F88B80C;
 Tue, 21 May 2019 15:34:14 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id m-bOd9P1Jgef; Tue, 21 May 2019 15:34:14 +0200 (CEST)
Received: from po16846vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 2D8008B803;
 Tue, 21 May 2019 15:34:14 +0200 (CEST)
Received: by po16846vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id E604268479; Tue, 21 May 2019 13:34:13 +0000 (UTC)
Message-Id: <7f868537c70e525d3f57a4223ef50d7a4d243e0a.1558445259.git.christophe.leroy@c-s.fr>
In-Reply-To: <cover.1558445259.git.christophe.leroy@c-s.fr>
References: <cover.1558445259.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH v1 07/15] crypto: talitos - fix ECB algs ivsize
To: Herbert Xu <herbert@gondor.apana.org.au>,
 "David S. Miller" <davem@davemloft.net>, horia.geanta@nxp.com
Date: Tue, 21 May 2019 13:34:13 +0000 (UTC)
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

ECB's ivsize must be 0.

Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
Fixes: 5e75ae1b3cef ("crypto: talitos - add new crypto modes")
---
 drivers/crypto/talitos.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/crypto/talitos.c b/drivers/crypto/talitos.c
index 1e5410f92166..6f6f34754ad8 100644
--- a/drivers/crypto/talitos.c
+++ b/drivers/crypto/talitos.c
@@ -2809,7 +2809,6 @@ static struct talitos_alg_template driver_algs[] = {
 			.cra_ablkcipher = {
 				.min_keysize = AES_MIN_KEY_SIZE,
 				.max_keysize = AES_MAX_KEY_SIZE,
-				.ivsize = AES_BLOCK_SIZE,
 				.setkey = ablkcipher_aes_setkey,
 			}
 		},
@@ -2862,7 +2861,6 @@ static struct talitos_alg_template driver_algs[] = {
 			.cra_ablkcipher = {
 				.min_keysize = DES_KEY_SIZE,
 				.max_keysize = DES_KEY_SIZE,
-				.ivsize = DES_BLOCK_SIZE,
 				.setkey = ablkcipher_des_setkey,
 			}
 		},
@@ -2897,7 +2895,6 @@ static struct talitos_alg_template driver_algs[] = {
 			.cra_ablkcipher = {
 				.min_keysize = DES3_EDE_KEY_SIZE,
 				.max_keysize = DES3_EDE_KEY_SIZE,
-				.ivsize = DES3_EDE_BLOCK_SIZE,
 				.setkey = ablkcipher_des3_setkey,
 			}
 		},
-- 
2.13.3

