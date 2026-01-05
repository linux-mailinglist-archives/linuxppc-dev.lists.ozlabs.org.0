Return-Path: <linuxppc-dev+bounces-15239-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 83FD5CF1ED0
	for <lists+linuxppc-dev@lfdr.de>; Mon, 05 Jan 2026 06:19:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dl2Z56S9bz3dBD;
	Mon, 05 Jan 2026 16:15:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767590141;
	cv=none; b=POu+4XAPaFkdxvagtFSsNjg4+SXTCly2o4snhtsiIDIJ8L1YQQcZGP0410lZ1a7y/mvYFeZ41XslCF0CXA0fe6bBJ12lXaElOvi23DgGen9ZFH3kd1gMXovViDDTtGWMk74Xb+8VreLf7sUWahsw41uLYDV6ReOE4DuXwMp7gt+B9oKGsSweePW7jFx7/WrFs/IDI5emi60n/CklLFC/K4cGOianEc8ZXwGLfLZKK02Yw/ajKYaNwIDsDaueE4SEb6ezUjZLLfY8deKn30zz1WreOZstwROc0uNlkH23I4DVPUllJWA+Xeak/LUPMtSpKKokyH31AEnmO+96hS7iRg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767590141; c=relaxed/relaxed;
	bh=6Kuh83FJFYjoxamZ+x6Fz4fiu3nOcQTcWxw3V0utHO0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bmXNbwTTIXMN20OQYS73cRwLWLjlVOjLQaUbKXTXNiNRf7A7/evHnJKcVUVX2c5EOse+kWaTmgrokyjXkSJ00U4ib5MGz/tY+dLW2IJU4o99WsIHM+J2Yv+A/S1XfuR7ajAScI++tXfrjRzKdXofjkVc5wqY/P3MhCvcyyLAZJiFcjXzPe+P6iJyQ14QSiRZxw01uyqmz7Y64sUS1DidANXLhnix2kL1CPHm3WSVhmNcRO3rpmgLwxDIof+33HqF0pBwvkMR4gl8dNl9beW7sZJPnBLb3YOacsAo4Yox1Avnvc6Xgq4fOPOjPL23s2wJBgu8TCbrzy9IyljTsnXgmw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=MmsZ/qRf; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=MmsZ/qRf;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dl2Z472Rhz3ccv
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 05 Jan 2026 16:15:40 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1D2656013A;
	Mon,  5 Jan 2026 05:15:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37F03C4AF0B;
	Mon,  5 Jan 2026 05:15:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767590108;
	bh=pLGtNzAKc0LyxTZ2Mcmb/pp64y+CkxfMTXzhOdP/RaU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MmsZ/qRfKLZytMKJmngb3WeBk7WVifeswTA12xXEF/l57Xl/NJSVBbNUA4cwJNMzn
	 bLUBK10x2R3XWrRzzbm2cxC+XGscGowPV2OAkNqiMiKKOyaF1fuMz8/qw6K24KiA6F
	 oKScxEhEiKwjEgeoI3fbB/Jul9LjMFF9xtMKZVYjrpry0t3ykWEUdm4YdcSXX/TJDF
	 tash1gU50u/+Jr6pw6eTTnRaRac3IodBZOVBFYi9A/5AoHratPyMRbPqNuTCUFy+oD
	 UaO7bLexyNyJFhMS0RxR35euAkapgX8ZUlTnTXAYB9aKd7QBrHsFpPrzLnoKmFcU7R
	 i/TXDkuCc/yig==
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
Subject: [PATCH 27/36] crypto: chelsio - Use new AES library API
Date: Sun,  4 Jan 2026 21:13:00 -0800
Message-ID: <20260105051311.1607207-28-ebiggers@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260105051311.1607207-1-ebiggers@kernel.org>
References: <20260105051311.1607207-1-ebiggers@kernel.org>
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

Switch from the old AES library functions (which use struct
crypto_aes_ctx) to the new ones (which use struct aes_key and struct
aes_enckey).  In encryption-only use cases, this eliminates the
unnecessary computation and caching of the decryption round keys.  The
new AES en/decryption functions are also much faster and use AES
instructions when supported by the CPU.

Note: aes_encrypt_new() and aes_decrypt_new() will be renamed to
aes_encrypt() and aes_decrypt(), respectively, once all callers of the
old aes_encrypt() and aes_decrypt() have been updated.

Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 drivers/crypto/chelsio/chcr_algo.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/crypto/chelsio/chcr_algo.c b/drivers/crypto/chelsio/chcr_algo.c
index 22cbc343198a..b6b97088dfc5 100644
--- a/drivers/crypto/chelsio/chcr_algo.c
+++ b/drivers/crypto/chelsio/chcr_algo.c
@@ -1026,11 +1026,11 @@ static int chcr_update_tweak(struct skcipher_request *req, u8 *iv,
 			     u32 isfinal)
 {
 	struct crypto_skcipher *tfm = crypto_skcipher_reqtfm(req);
 	struct ablk_ctx *ablkctx = ABLK_CTX(c_ctx(tfm));
 	struct chcr_skcipher_req_ctx *reqctx = skcipher_request_ctx(req);
-	struct crypto_aes_ctx aes;
+	struct aes_key aes;
 	int ret, i;
 	u8 *key;
 	unsigned int keylen;
 	int round = reqctx->last_req_len / AES_BLOCK_SIZE;
 	int round8 = round / 8;
@@ -1042,24 +1042,24 @@ static int chcr_update_tweak(struct skcipher_request *req, u8 *iv,
 	/* For a 192 bit key remove the padded zeroes which was
 	 * added in chcr_xts_setkey
 	 */
 	if (KEY_CONTEXT_CK_SIZE_G(ntohl(ablkctx->key_ctx_hdr))
 			== CHCR_KEYCTX_CIPHER_KEY_SIZE_192)
-		ret = aes_expandkey(&aes, key, keylen - 8);
+		ret = aes_preparekey(&aes, key, keylen - 8);
 	else
-		ret = aes_expandkey(&aes, key, keylen);
+		ret = aes_preparekey(&aes, key, keylen);
 	if (ret)
 		return ret;
-	aes_encrypt(&aes, iv, iv);
+	aes_encrypt_new(&aes, iv, iv);
 	for (i = 0; i < round8; i++)
 		gf128mul_x8_ble((le128 *)iv, (le128 *)iv);
 
 	for (i = 0; i < (round % 8); i++)
 		gf128mul_x_ble((le128 *)iv, (le128 *)iv);
 
 	if (!isfinal)
-		aes_decrypt(&aes, iv, iv);
+		aes_decrypt_new(&aes, iv, iv);
 
 	memzero_explicit(&aes, sizeof(aes));
 	return 0;
 }
 
@@ -3404,11 +3404,11 @@ static int chcr_gcm_setkey(struct crypto_aead *aead, const u8 *key,
 {
 	struct chcr_aead_ctx *aeadctx = AEAD_CTX(a_ctx(aead));
 	struct chcr_gcm_ctx *gctx = GCM_CTX(aeadctx);
 	unsigned int ck_size;
 	int ret = 0, key_ctx_size = 0;
-	struct crypto_aes_ctx aes;
+	struct aes_enckey aes;
 
 	aeadctx->enckey_len = 0;
 	crypto_aead_clear_flags(aeadctx->sw_cipher, CRYPTO_TFM_REQ_MASK);
 	crypto_aead_set_flags(aeadctx->sw_cipher, crypto_aead_get_flags(aead)
 			      & CRYPTO_TFM_REQ_MASK);
@@ -3442,17 +3442,17 @@ static int chcr_gcm_setkey(struct crypto_aead *aead, const u8 *key,
 						0, 0,
 						key_ctx_size >> 4);
 	/* Calculate the H = CIPH(K, 0 repeated 16 times).
 	 * It will go in key context
 	 */
-	ret = aes_expandkey(&aes, key, keylen);
+	ret = aes_prepareenckey(&aes, key, keylen);
 	if (ret) {
 		aeadctx->enckey_len = 0;
 		goto out;
 	}
 	memset(gctx->ghash_h, 0, AEAD_H_SIZE);
-	aes_encrypt(&aes, gctx->ghash_h, gctx->ghash_h);
+	aes_encrypt_new(&aes, gctx->ghash_h, gctx->ghash_h);
 	memzero_explicit(&aes, sizeof(aes));
 
 out:
 	return ret;
 }
-- 
2.52.0


