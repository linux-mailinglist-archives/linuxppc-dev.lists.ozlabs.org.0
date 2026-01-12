Return-Path: <linuxppc-dev+bounces-15567-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EB87D14F22
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Jan 2026 20:25:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dqj3C1LKgz30RN;
	Tue, 13 Jan 2026 06:23:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768245815;
	cv=none; b=EktVG+hFVzJbDCU8oyS40dhFG1X54BVYZkTvsE/ErbeW2QqYUTVzsP7LOiv7+zPrCSUhpveuxLhIg5DstYqVsh6Js+kPg7KVkEqCpIytrr1j5xvX53z2c2o6mgbzWCGQAsWB+OlOn6Q0PXWmei90VpuLderzl3X6tKhZ6Rd+YMZAPzuA1OgYVkOw/ueiGnwy2Ra8mzGElps/kweMuAD0j/H3a5A84c9i5MxU0QueF0eDcOpYp6GNIpKy4z8LFP+ELSV4SZB2tNM8fS/02vmFtBYiJph2yWDsdPyxBMZaZ3t0KdPM62IIg0VkTUUDHBTpmDSYgQsMveItVxp663tPRg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768245815; c=relaxed/relaxed;
	bh=KIl5K2qYYK8RvfpjTbcuRVSN10jgiRWA5zJEwMngV24=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JYxN5H2cLBKTx6u2WmVGrMmGwxF0uhKSaYAGhNctXBmZXtEm562IM6XGr30fAuxuuzLkvR6pvHL6eqeTn9yPl8UoZGm1OSqRLejdEKI7vkiPZEO9Tn1m0GQ+QifUyH4KrmRSO0hR8EFw6C3avy2qdhOiPfwbDz2oHwyn7TneHRRLbRHm1Rx+TGYVkeeajK/1IVGmPPHBzbPglKW65w1xhdKMGHDMKuJnh8/qrwiUWEUOg5zqwwktI5rpkE8Hb1ortMSFkpNSc3idFkOGZ+l0rAYDXfimMfnakKOdzU5qHoORConpxOY18wLopBUnATSA5ukXrrPtqnwedoJlPW9Ohw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=PymYATdt; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=PymYATdt;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dqj3B3SnWz30Ff
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Jan 2026 06:23:34 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id ED3F84438E;
	Mon, 12 Jan 2026 19:23:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BE59C19425;
	Mon, 12 Jan 2026 19:23:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768245812;
	bh=7I4DcEvD7P+NyOF/LOh0qFaXJ6PJTspoaqEhJ+gX51o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PymYATdtVCGHtK+IbBx3OFqORWyLECLJGtun3Jj0HzhwQUnp5PEQ2Z9S9x88kkdko
	 jUXgwbgKhfLYl9+rn22YpJ6nMXJhRWGUZMMOnLkD1ttB7pCshIL8f6DatUASbcIJPh
	 w3dt6U3TeqjuUwc+5wzfDRo2vDDVv1aQI42Oz6rzi6v2VG4qwgWSOEOiyhxKhUsghP
	 qepcFLhDk7/7wRQCfEOZKxibmYmQeA/7sqB6KT5TTszT3MkOnTULUKSQI5UqSvt8mP
	 juZKyxZVaIqSygbpdRTz8OnZqX0J+Gxb55kqte5mEeQyVUsERKFlNqc/04wqru1f7+
	 pC3yvHkPsxIVQ==
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
Subject: [PATCH v2 27/35] crypto: chelsio - Use new AES library API
Date: Mon, 12 Jan 2026 11:20:25 -0800
Message-ID: <20260112192035.10427-28-ebiggers@kernel.org>
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

Switch from the old AES library functions (which use struct
crypto_aes_ctx) to the new ones (which use struct aes_key and struct
aes_enckey).  In encryption-only use cases, this eliminates the
unnecessary computation and caching of the decryption round keys.  The
new AES en/decryption functions are also much faster and use AES
instructions when supported by the CPU.

Note that in addition to the change in the key preparation function and
the key struct type itself, the change in the type of the key struct
results in aes_encrypt() (which is temporarily a type-generic macro)
calling the new encryption function rather than the old one.  Likewise
for decryption.

Acked-by: Ard Biesheuvel <ardb@kernel.org>
Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 drivers/crypto/chelsio/chcr_algo.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/crypto/chelsio/chcr_algo.c b/drivers/crypto/chelsio/chcr_algo.c
index 22cbc343198a..6dec42282768 100644
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
@@ -1042,13 +1042,13 @@ static int chcr_update_tweak(struct skcipher_request *req, u8 *iv,
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
 	aes_encrypt(&aes, iv, iv);
 	for (i = 0; i < round8; i++)
 		gf128mul_x8_ble((le128 *)iv, (le128 *)iv);
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
@@ -3442,11 +3442,11 @@ static int chcr_gcm_setkey(struct crypto_aead *aead, const u8 *key,
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
-- 
2.52.0


