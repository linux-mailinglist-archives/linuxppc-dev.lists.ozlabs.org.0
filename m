Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 40B06250F1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 May 2019 15:45:27 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 457cTc4tLKzDqLg
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 May 2019 23:45:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="XIHuLsPd"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 457cDk0zqJzDqJW
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 May 2019 23:34:13 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 457cDb6mhbz9v2XX;
 Tue, 21 May 2019 15:34:07 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=XIHuLsPd; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id YXHpUBfgEOpy; Tue, 21 May 2019 15:34:07 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 457cDb5ktpz9v1nh;
 Tue, 21 May 2019 15:34:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1558445647; bh=Pj8NPn3ToXw4Az2KUmiYsb3YMZGrjiZdUaHQKVpoKcM=;
 h=In-Reply-To:References:From:Subject:To:Cc:Date:From;
 b=XIHuLsPdpLGd6Sq47Czk47Zs4qvMgFIy0gZcy375C4q9XydsfuRzBq2HbQZJSQhqQ
 pa/QHYlfdUVCSEhnpaAhyXnX9uV7TrMWDTwsTA5rKU8UztxDSHp2Io12RG0wcxoSFP
 4/fLH446QJU2kdPYrrM6I5aWxZ6g6v8vdX2rt660=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 3F5C08B80C;
 Tue, 21 May 2019 15:34:09 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 47YGaZkbQ2_P; Tue, 21 May 2019 15:34:09 +0200 (CEST)
Received: from po16846vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id F40448B803;
 Tue, 21 May 2019 15:34:08 +0200 (CEST)
Received: by po16846vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id C7C4C68458; Tue, 21 May 2019 13:34:08 +0000 (UTC)
Message-Id: <1449c1a24e2e06ac6c8c2e1b7f73feedfd51894c.1558445259.git.christophe.leroy@c-s.fr>
In-Reply-To: <cover.1558445259.git.christophe.leroy@c-s.fr>
References: <cover.1558445259.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH v1 02/15] crypto: talitos - rename alternative AEAD algos.
To: Herbert Xu <herbert@gondor.apana.org.au>,
 "David S. Miller" <davem@davemloft.net>, horia.geanta@nxp.com
Date: Tue, 21 May 2019 13:34:08 +0000 (UTC)
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

The talitos driver has two ways to perform AEAD depending on the
HW capability. Some HW support both. It is needed to give them
different names to distingish which one it is for instance when
a test fails.

Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
Fixes: 7405c8d7ff97 ("crypto: talitos - templates for AEAD using HMAC_SNOOP_NO_AFEU")
Cc: stable@vger.kernel.org
---
 drivers/crypto/talitos.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/crypto/talitos.c b/drivers/crypto/talitos.c
index f443cbe7da80..6f8bc6467706 100644
--- a/drivers/crypto/talitos.c
+++ b/drivers/crypto/talitos.c
@@ -2356,7 +2356,7 @@ static struct talitos_alg_template driver_algs[] = {
 			.base = {
 				.cra_name = "authenc(hmac(sha1),cbc(aes))",
 				.cra_driver_name = "authenc-hmac-sha1-"
-						   "cbc-aes-talitos",
+						   "cbc-aes-talitos-hsna",
 				.cra_blocksize = AES_BLOCK_SIZE,
 				.cra_flags = CRYPTO_ALG_ASYNC,
 			},
@@ -2401,7 +2401,7 @@ static struct talitos_alg_template driver_algs[] = {
 				.cra_name = "authenc(hmac(sha1),"
 					    "cbc(des3_ede))",
 				.cra_driver_name = "authenc-hmac-sha1-"
-						   "cbc-3des-talitos",
+						   "cbc-3des-talitos-hsna",
 				.cra_blocksize = DES3_EDE_BLOCK_SIZE,
 				.cra_flags = CRYPTO_ALG_ASYNC,
 			},
@@ -2444,7 +2444,7 @@ static struct talitos_alg_template driver_algs[] = {
 			.base = {
 				.cra_name = "authenc(hmac(sha224),cbc(aes))",
 				.cra_driver_name = "authenc-hmac-sha224-"
-						   "cbc-aes-talitos",
+						   "cbc-aes-talitos-hsna",
 				.cra_blocksize = AES_BLOCK_SIZE,
 				.cra_flags = CRYPTO_ALG_ASYNC,
 			},
@@ -2489,7 +2489,7 @@ static struct talitos_alg_template driver_algs[] = {
 				.cra_name = "authenc(hmac(sha224),"
 					    "cbc(des3_ede))",
 				.cra_driver_name = "authenc-hmac-sha224-"
-						   "cbc-3des-talitos",
+						   "cbc-3des-talitos-hsna",
 				.cra_blocksize = DES3_EDE_BLOCK_SIZE,
 				.cra_flags = CRYPTO_ALG_ASYNC,
 			},
@@ -2532,7 +2532,7 @@ static struct talitos_alg_template driver_algs[] = {
 			.base = {
 				.cra_name = "authenc(hmac(sha256),cbc(aes))",
 				.cra_driver_name = "authenc-hmac-sha256-"
-						   "cbc-aes-talitos",
+						   "cbc-aes-talitos-hsna",
 				.cra_blocksize = AES_BLOCK_SIZE,
 				.cra_flags = CRYPTO_ALG_ASYNC,
 			},
@@ -2577,7 +2577,7 @@ static struct talitos_alg_template driver_algs[] = {
 				.cra_name = "authenc(hmac(sha256),"
 					    "cbc(des3_ede))",
 				.cra_driver_name = "authenc-hmac-sha256-"
-						   "cbc-3des-talitos",
+						   "cbc-3des-talitos-hsna",
 				.cra_blocksize = DES3_EDE_BLOCK_SIZE,
 				.cra_flags = CRYPTO_ALG_ASYNC,
 			},
@@ -2706,7 +2706,7 @@ static struct talitos_alg_template driver_algs[] = {
 			.base = {
 				.cra_name = "authenc(hmac(md5),cbc(aes))",
 				.cra_driver_name = "authenc-hmac-md5-"
-						   "cbc-aes-talitos",
+						   "cbc-aes-talitos-hsna",
 				.cra_blocksize = AES_BLOCK_SIZE,
 				.cra_flags = CRYPTO_ALG_ASYNC,
 			},
@@ -2749,7 +2749,7 @@ static struct talitos_alg_template driver_algs[] = {
 			.base = {
 				.cra_name = "authenc(hmac(md5),cbc(des3_ede))",
 				.cra_driver_name = "authenc-hmac-md5-"
-						   "cbc-3des-talitos",
+						   "cbc-3des-talitos-hsna",
 				.cra_blocksize = DES3_EDE_BLOCK_SIZE,
 				.cra_flags = CRYPTO_ALG_ASYNC,
 			},
-- 
2.13.3

