Return-Path: <linuxppc-dev+bounces-15576-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 18E3ED14F73
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Jan 2026 20:26:28 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dqj3X5YfNz3bn4;
	Tue, 13 Jan 2026 06:23:52 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768245832;
	cv=none; b=LWrPl0HilkEfEHaac80f0m3sION2YFEIDlk4Txew8MGJmymUdeLrGYH1Cno0AQ2wHYco2vR8F5V/sXjot/QRnp9SzfKD2HDICPSccU1z3mlCwr82XYhJWi3CDQ0N57tW4BNm0U4QDBBDbwn4wXo3WuhvL+gL5jSPz1DYfvMOxDGKoBAy/fvbJ48bJn3IfVQM8sfqKr5lmPvuq9Ho/iX95/q2fWeu1Wj4H3aVSfiyfwlDzdpsvWLoghAlrISO9ngBhGTCVTyi0InOO/o8Xaj5lrsfGMDKo0kz2cV+oOPbF0hGjMgibt6shuQG9kHtmm0GgzCjC3NVirV67qzxCP4L3w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768245832; c=relaxed/relaxed;
	bh=iMYU3wC220z6LEubQrDxOC5v0wDwchogTnHuD2Z5JHg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hFDc3kCRiewxlTXSpdILGqf8IT/CI75U7U/fGvHQ53R7FJA7TV6hz0K41VRtTqyDYU3TslhYfokez9cmLqIcB6/lU0vt/ocY45x8LAP8HAEUgyysMxosCGpLJc6LfAt6Np+qZMiXj3Dq0LJNXXADbQutp9L005NsfzUP2O+uKf5KNGz0V9/889ImgJ0yiNM6/v9wdXAaKMWafU17kVDQO4nzdpJg4ydqCklBEWRAQu5j/x1cybSz5DiJTWrftUWLjc6vlLa4OJawxmJR3AvE4PernqM14OH8J69zkRoHTDlTKpItVT0HLBWAbP07Od4faljXsNflcz+3M9F3Vik3sQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=M9YtHnsm; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=M9YtHnsm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dqj3W6by8z3bk1
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Jan 2026 06:23:51 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8B16D44329;
	Mon, 12 Jan 2026 19:23:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09E2AC16AAE;
	Mon, 12 Jan 2026 19:23:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768245799;
	bh=bpasNFXQc6Wz1acJi7F8zoXotEra0E6njU13yRy/Zpo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=M9YtHnsm+ldZf23bnl1+cxTAchjTl4Cd/yzclRF+f4Oj/et0RausQ5Oadm19mXLwg
	 BLQELCVbt4AztqKG1kIDz6Bho14907cqL2oynonqpIr8CEPzPvUqcoXXNw0tRXK2kZ
	 B11s2jXLqUowVR8nlVw1Gjb1kB+QyAmC//kgi7XVs6qrKBgV5041cobEvPE1Lcno4t
	 jqsMu5edutyGGdux6+UrEsMtxmpdBNCNZrdk8kNkz9CJ0vjJcnow0U8B5LkRpIixkX
	 zzsrod/0VLmFRXTNk183p/Umtn+c743dVF1MZu+ug045MuLxptHuyFrrkrgJo+BS65
	 DXTthzlvmNv/Q==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org,
	x86@kernel.org,
	Holger Dengler <dengler@linux.ibm.com>,
	Harald Freudenberger <freude@linux.ibm.com>,
	Eric Biggers <ebiggers@kernel.org>
Subject: [PATCH v2 03/35] crypto: arm/aes-neonbs - Use AES library for single blocks
Date: Mon, 12 Jan 2026 11:20:01 -0800
Message-ID: <20260112192035.10427-4-ebiggers@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260112192035.10427-1-ebiggers@kernel.org>
References: <20260112192035.10427-1-ebiggers@kernel.org>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

aes-neonbs-glue.c calls __aes_arm_encrypt() and __aes_arm_decrypt() to
en/decrypt single blocks for CBC encryption, XTS tweak encryption, and
XTS ciphertext stealing.  In preparation for making the AES library use
this same ARM-optimized single-block AES en/decryption code and making
it an internal implementation detail of the AES library, replace the
calls to these functions with calls to the AES library.

Note that this reduces the size of the aesbs_cbc_ctx and aesbs_xts_ctx
structs, since unnecessary decryption round keys are no longer included.

Acked-by: Ard Biesheuvel <ardb@kernel.org>
Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 arch/arm/crypto/Kconfig           |  1 -
 arch/arm/crypto/aes-neonbs-glue.c | 29 ++++++++++++++++-------------
 2 files changed, 16 insertions(+), 14 deletions(-)

diff --git a/arch/arm/crypto/Kconfig b/arch/arm/crypto/Kconfig
index 3eb5071bea14..167a648a9def 100644
--- a/arch/arm/crypto/Kconfig
+++ b/arch/arm/crypto/Kconfig
@@ -42,11 +42,10 @@ config CRYPTO_AES_ARM
 	  such attacks very difficult.
 
 config CRYPTO_AES_ARM_BS
 	tristate "Ciphers: AES, modes: ECB/CBC/CTR/XTS (bit-sliced NEON)"
 	depends on KERNEL_MODE_NEON
-	select CRYPTO_AES_ARM
 	select CRYPTO_SKCIPHER
 	select CRYPTO_LIB_AES
 	help
 	  Length-preserving ciphers: AES cipher algorithms (FIPS-197)
 	  with block cipher modes:
diff --git a/arch/arm/crypto/aes-neonbs-glue.c b/arch/arm/crypto/aes-neonbs-glue.c
index df5afe601e4a..c49ddafc54f3 100644
--- a/arch/arm/crypto/aes-neonbs-glue.c
+++ b/arch/arm/crypto/aes-neonbs-glue.c
@@ -10,11 +10,10 @@
 #include <crypto/aes.h>
 #include <crypto/internal/skcipher.h>
 #include <crypto/scatterwalk.h>
 #include <crypto/xts.h>
 #include <linux/module.h>
-#include "aes-cipher.h"
 
 MODULE_AUTHOR("Ard Biesheuvel <ard.biesheuvel@linaro.org>");
 MODULE_DESCRIPTION("Bit sliced AES using NEON instructions");
 MODULE_LICENSE("GPL v2");
 
@@ -46,17 +45,17 @@ struct aesbs_ctx {
 	u8	rk[13 * (8 * AES_BLOCK_SIZE) + 32] __aligned(AES_BLOCK_SIZE);
 };
 
 struct aesbs_cbc_ctx {
 	struct aesbs_ctx	key;
-	struct crypto_aes_ctx	fallback;
+	struct aes_enckey	fallback;
 };
 
 struct aesbs_xts_ctx {
 	struct aesbs_ctx	key;
-	struct crypto_aes_ctx	fallback;
-	struct crypto_aes_ctx	tweak_key;
+	struct aes_key		fallback;
+	struct aes_enckey	tweak_key;
 };
 
 static int aesbs_setkey(struct crypto_skcipher *tfm, const u8 *in_key,
 			unsigned int key_len)
 {
@@ -120,18 +119,23 @@ static int aesbs_cbc_setkey(struct crypto_skcipher *tfm, const u8 *in_key,
 			    unsigned int key_len)
 {
 	struct aesbs_cbc_ctx *ctx = crypto_skcipher_ctx(tfm);
 	int err;
 
-	err = aes_expandkey(&ctx->fallback, in_key, key_len);
+	err = aes_prepareenckey(&ctx->fallback, in_key, key_len);
 	if (err)
 		return err;
 
 	ctx->key.rounds = 6 + key_len / 4;
 
+	/*
+	 * Note: this assumes that the arm implementation of the AES library
+	 * stores the standard round keys in k.rndkeys.
+	 */
 	kernel_neon_begin();
-	aesbs_convert_key(ctx->key.rk, ctx->fallback.key_enc, ctx->key.rounds);
+	aesbs_convert_key(ctx->key.rk, ctx->fallback.k.rndkeys,
+			  ctx->key.rounds);
 	kernel_neon_end();
 
 	return 0;
 }
 
@@ -150,12 +154,11 @@ static int cbc_encrypt(struct skcipher_request *req)
 		u8 *dst = walk.dst.virt.addr;
 		u8 *prev = walk.iv;
 
 		do {
 			crypto_xor_cpy(dst, src, prev, AES_BLOCK_SIZE);
-			__aes_arm_encrypt(ctx->fallback.key_enc,
-					  ctx->key.rounds, dst, dst);
+			aes_encrypt(&ctx->fallback, dst, dst);
 			prev = dst;
 			src += AES_BLOCK_SIZE;
 			dst += AES_BLOCK_SIZE;
 			nbytes -= AES_BLOCK_SIZE;
 		} while (nbytes >= AES_BLOCK_SIZE);
@@ -237,14 +240,14 @@ static int aesbs_xts_setkey(struct crypto_skcipher *tfm, const u8 *in_key,
 	err = xts_verify_key(tfm, in_key, key_len);
 	if (err)
 		return err;
 
 	key_len /= 2;
-	err = aes_expandkey(&ctx->fallback, in_key, key_len);
+	err = aes_preparekey(&ctx->fallback, in_key, key_len);
 	if (err)
 		return err;
-	err = aes_expandkey(&ctx->tweak_key, in_key + key_len, key_len);
+	err = aes_prepareenckey(&ctx->tweak_key, in_key + key_len, key_len);
 	if (err)
 		return err;
 
 	return aesbs_setkey(tfm, in_key, key_len);
 }
@@ -277,11 +280,11 @@ static int __xts_crypt(struct skcipher_request *req, bool encrypt,
 
 	err = skcipher_walk_virt(&walk, req, true);
 	if (err)
 		return err;
 
-	__aes_arm_encrypt(ctx->tweak_key.key_enc, rounds, walk.iv, walk.iv);
+	aes_encrypt(&ctx->tweak_key, walk.iv, walk.iv);
 
 	while (walk.nbytes >= AES_BLOCK_SIZE) {
 		unsigned int blocks = walk.nbytes / AES_BLOCK_SIZE;
 		int reorder_last_tweak = !encrypt && tail > 0;
 
@@ -309,13 +312,13 @@ static int __xts_crypt(struct skcipher_request *req, bool encrypt,
 	scatterwalk_map_and_copy(buf, req->src, req->cryptlen, tail, 0);
 
 	crypto_xor(buf, req->iv, AES_BLOCK_SIZE);
 
 	if (encrypt)
-		__aes_arm_encrypt(ctx->fallback.key_enc, rounds, buf, buf);
+		aes_encrypt(&ctx->fallback, buf, buf);
 	else
-		__aes_arm_decrypt(ctx->fallback.key_dec, rounds, buf, buf);
+		aes_decrypt(&ctx->fallback, buf, buf);
 
 	crypto_xor(buf, req->iv, AES_BLOCK_SIZE);
 
 	scatterwalk_map_and_copy(buf, req->dst, req->cryptlen - AES_BLOCK_SIZE,
 				 AES_BLOCK_SIZE + tail, 1);
-- 
2.52.0


