Return-Path: <linuxppc-dev+bounces-15227-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B714CF1E7F
	for <lists+linuxppc-dev@lfdr.de>; Mon, 05 Jan 2026 06:17:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dl2Yh48Zdz30PH;
	Mon, 05 Jan 2026 16:15:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767590120;
	cv=none; b=HhehuMa8Eypn3CfI3q4Z5cgriqmhyGVEcczdDEmSX4gTTGori/NoPBj6FB2HtlQpBqDm902n8jzpiPkoshxlGkDw/+RhRKDAp3ymkWkoDy25Bt928Pbw2RoxrNdEE31od0IS8l4KgAVAfwIS3bSmXFvPcNwwn9SKMVh8EEjXFX4OtN8bNzYyq2d6OIVP6XA9xWT7tk/50dQEKsT4rDW5PhRmUGttBzV+yP30TbOhzMP46wEYeihokjTyO+IFdNpnDSuWprFglYyaBld3bTao0nQYqfipvwoZ8OHw8aZYTi8alAwgJmQfCEs9CyOkwmOa82MF6slQCd78R+npwSVXig==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767590120; c=relaxed/relaxed;
	bh=nXVB4JJubBnORIklA8rxyq9GlIunUPRbV62+fxwWpQ0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=avZ+WYsb+lUrHVGk4qEkjJYyQ57g+NK+a1zMlL91nEtJxRCFuD7kJPZ7nT8dENdc0OVpC0uVwNmRZ/vWHzqaQ7zUArFV6yIr/OXQjRyntAY7n07oePVvyqdvrYuLWPSy3Bp6mbb4xS6yl4RlZzAAcRFDWU1rEPJrFp8HZybOoXVkmGT3BCXXr1SI1LXI0Yb1yP1Ll3wdikOiIU/0pnW/3B/lBsXt8S09CynHtWB1T4crEnPLhcAlbweRWdBz3wg+WdfZCFEGooTIgrZzgvNpnMRKxgZ/fIYQPgkEC7L8ffVTMXyD3sXtKftOLu3j+oMevUpoDMDTBkl65ycS98PuwA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=RVtoy7ZQ; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=RVtoy7ZQ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dl2YZ0Wf2z30RT
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 05 Jan 2026 16:15:14 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B6B024436A;
	Mon,  5 Jan 2026 05:15:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33D10C19425;
	Mon,  5 Jan 2026 05:15:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767590113;
	bh=GDbwir3woPjBVitmEL25MOIVKvd8ieBzlM6MRGrA/+E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RVtoy7ZQUFg8Jzw8Ttz0Hu793dlq4dRcJOMCE3DC876cPxOZI0AXwX23B3DFwTRZD
	 pVTOi71t1nzHRgbviXZD0KZKR67qflJNsc02gx2AZdYyQ3VR3EH8H82+8wIcrWYHqb
	 Bhfy+hbGQk9+ONjzliHdvWbpbuXhuOyHqIsfnSElCQCMwy3lEnx895mPsU2WjO1ECa
	 tSVddV27n6EBGuZLwEDkwu8GoUtRbob/QGx2qAiMMSVidlnjhmu29bvOEFCVDU8mB8
	 nubJvYr+4h9ydqL/ziDDoQ7O9w/hifhTZ5gaUJCKb+PqR5Y8EahbJkEFFoSzYrAkk4
	 D+csKrzyaZ8hQ==
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
Subject: [PATCH 35/36] lib/crypto: aes: Drop "_new" suffix from en/decryption functions
Date: Sun,  4 Jan 2026 21:13:08 -0800
Message-ID: <20260105051311.1607207-36-ebiggers@kernel.org>
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

Now that all callers of aes_encrypt() and aes_decrypt() have been
updated to use aes_encrypt_new() and aes_decrypt_new() instead, and the
original aes_encrypt() and aes_decrypt() have been removed, drop the
"_new" suffix.  This completes the migration to the revised AES API,
which uses a different type for the key argument and is more efficient
when the user only requires the encryption direction of the cipher.

Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 arch/arm/crypto/aes-neonbs-glue.c                |  8 ++++----
 arch/arm/crypto/ghash-ce-glue.c                  |  2 +-
 arch/arm64/crypto/ghash-ce-glue.c                |  2 +-
 arch/riscv/crypto/aes-riscv64-glue.c             |  2 +-
 arch/x86/crypto/aesni-intel_glue.c               |  2 +-
 crypto/aes.c                                     |  4 ++--
 crypto/df_sp80090a.c                             |  2 +-
 drivers/crypto/amcc/crypto4xx_alg.c              |  2 +-
 drivers/crypto/ccp/ccp-crypto-aes-cmac.c         |  2 +-
 drivers/crypto/chelsio/chcr_algo.c               |  6 +++---
 drivers/crypto/inside-secure/safexcel_cipher.c   |  2 +-
 drivers/crypto/inside-secure/safexcel_hash.c     | 16 ++++++++--------
 drivers/crypto/omap-aes-gcm.c                    |  2 +-
 .../chelsio/inline_crypto/ch_ipsec/chcr_ipsec.c  |  2 +-
 .../chelsio/inline_crypto/ch_ktls/chcr_ktls.c    |  2 +-
 .../chelsio/inline_crypto/chtls/chtls_hw.c       |  2 +-
 drivers/net/phy/mscc/mscc_macsec.c               |  2 +-
 drivers/staging/rtl8723bs/core/rtw_security.c    |  8 ++++----
 include/crypto/aes.h                             | 12 ++++++------
 lib/crypto/aes.c                                 | 12 ++++++------
 lib/crypto/aescfb.c                              |  2 +-
 lib/crypto/aesgcm.c                              |  2 +-
 net/bluetooth/smp.c                              |  2 +-
 23 files changed, 49 insertions(+), 49 deletions(-)

diff --git a/arch/arm/crypto/aes-neonbs-glue.c b/arch/arm/crypto/aes-neonbs-glue.c
index f892f281b441..c49ddafc54f3 100644
--- a/arch/arm/crypto/aes-neonbs-glue.c
+++ b/arch/arm/crypto/aes-neonbs-glue.c
@@ -154,11 +154,11 @@ static int cbc_encrypt(struct skcipher_request *req)
 		u8 *dst = walk.dst.virt.addr;
 		u8 *prev = walk.iv;
 
 		do {
 			crypto_xor_cpy(dst, src, prev, AES_BLOCK_SIZE);
-			aes_encrypt_new(&ctx->fallback, dst, dst);
+			aes_encrypt(&ctx->fallback, dst, dst);
 			prev = dst;
 			src += AES_BLOCK_SIZE;
 			dst += AES_BLOCK_SIZE;
 			nbytes -= AES_BLOCK_SIZE;
 		} while (nbytes >= AES_BLOCK_SIZE);
@@ -280,11 +280,11 @@ static int __xts_crypt(struct skcipher_request *req, bool encrypt,
 
 	err = skcipher_walk_virt(&walk, req, true);
 	if (err)
 		return err;
 
-	aes_encrypt_new(&ctx->tweak_key, walk.iv, walk.iv);
+	aes_encrypt(&ctx->tweak_key, walk.iv, walk.iv);
 
 	while (walk.nbytes >= AES_BLOCK_SIZE) {
 		unsigned int blocks = walk.nbytes / AES_BLOCK_SIZE;
 		int reorder_last_tweak = !encrypt && tail > 0;
 
@@ -312,13 +312,13 @@ static int __xts_crypt(struct skcipher_request *req, bool encrypt,
 	scatterwalk_map_and_copy(buf, req->src, req->cryptlen, tail, 0);
 
 	crypto_xor(buf, req->iv, AES_BLOCK_SIZE);
 
 	if (encrypt)
-		aes_encrypt_new(&ctx->fallback, buf, buf);
+		aes_encrypt(&ctx->fallback, buf, buf);
 	else
-		aes_decrypt_new(&ctx->fallback, buf, buf);
+		aes_decrypt(&ctx->fallback, buf, buf);
 
 	crypto_xor(buf, req->iv, AES_BLOCK_SIZE);
 
 	scatterwalk_map_and_copy(buf, req->dst, req->cryptlen - AES_BLOCK_SIZE,
 				 AES_BLOCK_SIZE + tail, 1);
diff --git a/arch/arm/crypto/ghash-ce-glue.c b/arch/arm/crypto/ghash-ce-glue.c
index 9ab03bce352d..454adcc62cc6 100644
--- a/arch/arm/crypto/ghash-ce-glue.c
+++ b/arch/arm/crypto/ghash-ce-glue.c
@@ -210,11 +210,11 @@ static int gcm_aes_setkey(struct crypto_aead *tfm, const u8 *inkey,
 
 	ret = aes_prepareenckey(&aes_key, inkey, keylen);
 	if (ret)
 		return -EINVAL;
 
-	aes_encrypt_new(&aes_key, (u8 *)&k, (u8[AES_BLOCK_SIZE]){});
+	aes_encrypt(&aes_key, (u8 *)&k, (u8[AES_BLOCK_SIZE]){});
 
 	/*
 	 * Note: this assumes that the arm implementation of the AES library
 	 * stores the standard round keys in k.rndkeys.
 	 */
diff --git a/arch/arm64/crypto/ghash-ce-glue.c b/arch/arm64/crypto/ghash-ce-glue.c
index bfd38e485e77..63bb9e062251 100644
--- a/arch/arm64/crypto/ghash-ce-glue.c
+++ b/arch/arm64/crypto/ghash-ce-glue.c
@@ -196,11 +196,11 @@ static int gcm_aes_setkey(struct crypto_aead *tfm, const u8 *inkey,
 
 	ret = aes_prepareenckey(&ctx->aes_key, inkey, keylen);
 	if (ret)
 		return -EINVAL;
 
-	aes_encrypt_new(&ctx->aes_key, key, (u8[AES_BLOCK_SIZE]){});
+	aes_encrypt(&ctx->aes_key, key, (u8[AES_BLOCK_SIZE]){});
 
 	/* needed for the fallback */
 	memcpy(&ctx->ghash_key.k, key, GHASH_BLOCK_SIZE);
 
 	ghash_reflect(ctx->ghash_key.h[0], &ctx->ghash_key.k);
diff --git a/arch/riscv/crypto/aes-riscv64-glue.c b/arch/riscv/crypto/aes-riscv64-glue.c
index e1b8b0d70666..8d6d4338b90b 100644
--- a/arch/riscv/crypto/aes-riscv64-glue.c
+++ b/arch/riscv/crypto/aes-riscv64-glue.c
@@ -320,11 +320,11 @@ static int riscv64_aes_xts_crypt(struct skcipher_request *req, bool enc)
 
 	if (req->cryptlen < AES_BLOCK_SIZE)
 		return -EINVAL;
 
 	/* Encrypt the IV with the tweak key to get the first tweak. */
-	aes_encrypt_new(&ctx->tweak_key, req->iv, req->iv);
+	aes_encrypt(&ctx->tweak_key, req->iv, req->iv);
 
 	err = skcipher_walk_virt(&walk, req, false);
 
 	/*
 	 * If the message length isn't divisible by the AES block size and the
diff --git a/arch/x86/crypto/aesni-intel_glue.c b/arch/x86/crypto/aesni-intel_glue.c
index 5633e50e46a0..e6c38d1d8a92 100644
--- a/arch/x86/crypto/aesni-intel_glue.c
+++ b/arch/x86/crypto/aesni-intel_glue.c
@@ -1211,11 +1211,11 @@ static int gcm_setkey(struct crypto_aead *tfm, const u8 *raw_key,
 		be128 h1 = {};
 		be128 h;
 		int i;
 
 		/* Encrypt the all-zeroes block to get the hash key H^1 */
-		aes_encrypt_new(&key->aes_key, (u8 *)&h1, (u8 *)&h1);
+		aes_encrypt(&key->aes_key, (u8 *)&h1, (u8 *)&h1);
 
 		/* Compute H^1 * x^-1 */
 		h = h1;
 		gf128mul_lle(&h, (const be128 *)x_to_the_minus1);
 
diff --git a/crypto/aes.c b/crypto/aes.c
index 5c3a0b24dbc0..ae8385df0ce5 100644
--- a/crypto/aes.c
+++ b/crypto/aes.c
@@ -21,18 +21,18 @@ static int crypto_aes_setkey(struct crypto_tfm *tfm, const u8 *in_key,
 
 static void crypto_aes_encrypt(struct crypto_tfm *tfm, u8 *out, const u8 *in)
 {
 	const struct aes_key *key = crypto_tfm_ctx(tfm);
 
-	aes_encrypt_new(key, out, in);
+	aes_encrypt(key, out, in);
 }
 
 static void crypto_aes_decrypt(struct crypto_tfm *tfm, u8 *out, const u8 *in)
 {
 	const struct aes_key *key = crypto_tfm_ctx(tfm);
 
-	aes_decrypt_new(key, out, in);
+	aes_decrypt(key, out, in);
 }
 
 static struct crypto_alg alg = {
 	.cra_name = "aes",
 	.cra_driver_name = "aes-lib",
diff --git a/crypto/df_sp80090a.c b/crypto/df_sp80090a.c
index 5686d37ebba2..b8134be6f7ad 100644
--- a/crypto/df_sp80090a.c
+++ b/crypto/df_sp80090a.c
@@ -17,11 +17,11 @@
 static void drbg_kcapi_sym(struct aes_enckey *aeskey, unsigned char *outval,
 			   const struct drbg_string *in, u8 blocklen_bytes)
 {
 	/* there is only component in *in */
 	BUG_ON(in->len < blocklen_bytes);
-	aes_encrypt_new(aeskey, outval, in->buf);
+	aes_encrypt(aeskey, outval, in->buf);
 }
 
 /* BCC function for CTR DRBG as defined in 10.4.3 */
 
 static void drbg_ctr_bcc(struct aes_enckey *aeskey,
diff --git a/drivers/crypto/amcc/crypto4xx_alg.c b/drivers/crypto/amcc/crypto4xx_alg.c
index 1947708334ef..3177dc4f5f7b 100644
--- a/drivers/crypto/amcc/crypto4xx_alg.c
+++ b/drivers/crypto/amcc/crypto4xx_alg.c
@@ -499,11 +499,11 @@ static int crypto4xx_compute_gcm_hash_key_sw(__le32 *hash_start, const u8 *key,
 	if (rc) {
 		pr_err("aes_prepareenckey() failed: %d\n", rc);
 		return rc;
 	}
 
-	aes_encrypt_new(&aes, src, src);
+	aes_encrypt(&aes, src, src);
 	crypto4xx_memcpy_to_le32(hash_start, src, 16);
 	memzero_explicit(&aes, sizeof(aes));
 	return 0;
 }
 
diff --git a/drivers/crypto/ccp/ccp-crypto-aes-cmac.c b/drivers/crypto/ccp/ccp-crypto-aes-cmac.c
index ed5b0f8609f1..71480f7e6f6b 100644
--- a/drivers/crypto/ccp/ccp-crypto-aes-cmac.c
+++ b/drivers/crypto/ccp/ccp-crypto-aes-cmac.c
@@ -288,11 +288,11 @@ static int ccp_aes_cmac_setkey(struct crypto_ahash *tfm, const u8 *key,
 	if (ret)
 		return ret;
 
 	/* Encrypt a block of zeroes - use key area in context */
 	memset(ctx->u.aes.key, 0, sizeof(ctx->u.aes.key));
-	aes_encrypt_new(&aes, ctx->u.aes.key, ctx->u.aes.key);
+	aes_encrypt(&aes, ctx->u.aes.key, ctx->u.aes.key);
 	memzero_explicit(&aes, sizeof(aes));
 
 	/* Generate K1 and K2 */
 	k0_hi = be64_to_cpu(*((__be64 *)ctx->u.aes.key));
 	k0_lo = be64_to_cpu(*((__be64 *)ctx->u.aes.key + 1));
diff --git a/drivers/crypto/chelsio/chcr_algo.c b/drivers/crypto/chelsio/chcr_algo.c
index b6b97088dfc5..6dec42282768 100644
--- a/drivers/crypto/chelsio/chcr_algo.c
+++ b/drivers/crypto/chelsio/chcr_algo.c
@@ -1047,19 +1047,19 @@ static int chcr_update_tweak(struct skcipher_request *req, u8 *iv,
 		ret = aes_preparekey(&aes, key, keylen - 8);
 	else
 		ret = aes_preparekey(&aes, key, keylen);
 	if (ret)
 		return ret;
-	aes_encrypt_new(&aes, iv, iv);
+	aes_encrypt(&aes, iv, iv);
 	for (i = 0; i < round8; i++)
 		gf128mul_x8_ble((le128 *)iv, (le128 *)iv);
 
 	for (i = 0; i < (round % 8); i++)
 		gf128mul_x_ble((le128 *)iv, (le128 *)iv);
 
 	if (!isfinal)
-		aes_decrypt_new(&aes, iv, iv);
+		aes_decrypt(&aes, iv, iv);
 
 	memzero_explicit(&aes, sizeof(aes));
 	return 0;
 }
 
@@ -3448,11 +3448,11 @@ static int chcr_gcm_setkey(struct crypto_aead *aead, const u8 *key,
 	if (ret) {
 		aeadctx->enckey_len = 0;
 		goto out;
 	}
 	memset(gctx->ghash_h, 0, AEAD_H_SIZE);
-	aes_encrypt_new(&aes, gctx->ghash_h, gctx->ghash_h);
+	aes_encrypt(&aes, gctx->ghash_h, gctx->ghash_h);
 	memzero_explicit(&aes, sizeof(aes));
 
 out:
 	return ret;
 }
diff --git a/drivers/crypto/inside-secure/safexcel_cipher.c b/drivers/crypto/inside-secure/safexcel_cipher.c
index eb4e0dc38b7f..27b180057417 100644
--- a/drivers/crypto/inside-secure/safexcel_cipher.c
+++ b/drivers/crypto/inside-secure/safexcel_cipher.c
@@ -2529,11 +2529,11 @@ static int safexcel_aead_gcm_setkey(struct crypto_aead *ctfm, const u8 *key,
 
 	ctx->key_len = len;
 
 	/* Compute hash key by encrypting zeroes with cipher key */
 	memset(hashkey, 0, AES_BLOCK_SIZE);
-	aes_encrypt_new(&aes, (u8 *)hashkey, (u8 *)hashkey);
+	aes_encrypt(&aes, (u8 *)hashkey, (u8 *)hashkey);
 
 	if (priv->flags & EIP197_TRC_CACHE && ctx->base.ctxr_dma) {
 		for (i = 0; i < AES_BLOCK_SIZE / sizeof(u32); i++) {
 			if (be32_to_cpu(ctx->base.ipad.be[i]) != hashkey[i]) {
 				ctx->base.needs_inv = true;
diff --git a/drivers/crypto/inside-secure/safexcel_hash.c b/drivers/crypto/inside-secure/safexcel_hash.c
index dae10d0066d7..e534b7a200cf 100644
--- a/drivers/crypto/inside-secure/safexcel_hash.c
+++ b/drivers/crypto/inside-secure/safexcel_hash.c
@@ -820,11 +820,11 @@ static int safexcel_ahash_final(struct ahash_request *areq)
 
 			/* K3 */
 			result[i] = swab32(ctx->base.ipad.word[i + 4]);
 		}
 		areq->result[0] ^= 0x80;			// 10- padding
-		aes_encrypt_new(ctx->aes, areq->result, areq->result);
+		aes_encrypt(ctx->aes, areq->result, areq->result);
 		return 0;
 	} else if (unlikely(req->hmac &&
 			    (req->len == req->block_sz) &&
 			    !areq->nbytes)) {
 		/*
@@ -1979,16 +1979,16 @@ static int safexcel_xcbcmac_setkey(struct crypto_ahash *tfm, const u8 *key,
 	ret = aes_prepareenckey(ctx->aes, key, len);
 	if (ret)
 		return ret;
 
 	/* precompute the XCBC key material */
-	aes_encrypt_new(ctx->aes, (u8 *)key_tmp + 2 * AES_BLOCK_SIZE,
-			"\x1\x1\x1\x1\x1\x1\x1\x1\x1\x1\x1\x1\x1\x1\x1\x1");
-	aes_encrypt_new(ctx->aes, (u8 *)key_tmp,
-			"\x2\x2\x2\x2\x2\x2\x2\x2\x2\x2\x2\x2\x2\x2\x2\x2");
-	aes_encrypt_new(ctx->aes, (u8 *)key_tmp + AES_BLOCK_SIZE,
-			"\x3\x3\x3\x3\x3\x3\x3\x3\x3\x3\x3\x3\x3\x3\x3\x3");
+	aes_encrypt(ctx->aes, (u8 *)key_tmp + 2 * AES_BLOCK_SIZE,
+		    "\x1\x1\x1\x1\x1\x1\x1\x1\x1\x1\x1\x1\x1\x1\x1\x1");
+	aes_encrypt(ctx->aes, (u8 *)key_tmp,
+		    "\x2\x2\x2\x2\x2\x2\x2\x2\x2\x2\x2\x2\x2\x2\x2\x2");
+	aes_encrypt(ctx->aes, (u8 *)key_tmp + AES_BLOCK_SIZE,
+		    "\x3\x3\x3\x3\x3\x3\x3\x3\x3\x3\x3\x3\x3\x3\x3\x3");
 	for (i = 0; i < 3 * AES_BLOCK_SIZE / sizeof(u32); i++)
 		ctx->base.ipad.word[i] = swab32(key_tmp[i]);
 
 	ret = aes_prepareenckey(ctx->aes,
 				(u8 *)key_tmp + 2 * AES_BLOCK_SIZE,
@@ -2070,11 +2070,11 @@ static int safexcel_cmac_setkey(struct crypto_ahash *tfm, const u8 *key,
 		ctx->base.ipad.word[i + 8] = get_unaligned_be32(&key[4 * i]);
 
 	/* code below borrowed from crypto/cmac.c */
 	/* encrypt the zero block */
 	memset(consts, 0, AES_BLOCK_SIZE);
-	aes_encrypt_new(ctx->aes, (u8 *)consts, (u8 *)consts);
+	aes_encrypt(ctx->aes, (u8 *)consts, (u8 *)consts);
 
 	gfmask = 0x87;
 	_const[0] = be64_to_cpu(consts[1]);
 	_const[1] = be64_to_cpu(consts[0]);
 
diff --git a/drivers/crypto/omap-aes-gcm.c b/drivers/crypto/omap-aes-gcm.c
index efe94a983589..c652f9d0062f 100644
--- a/drivers/crypto/omap-aes-gcm.c
+++ b/drivers/crypto/omap-aes-gcm.c
@@ -175,11 +175,11 @@ static int omap_aes_gcm_copy_buffers(struct omap_aes_dev *dd,
 
 static int do_encrypt_iv(struct aead_request *req, u32 *tag, u32 *iv)
 {
 	struct omap_aes_gcm_ctx *ctx = crypto_aead_ctx(crypto_aead_reqtfm(req));
 
-	aes_encrypt_new(&ctx->akey, (u8 *)tag, (const u8 *)iv);
+	aes_encrypt(&ctx->akey, (u8 *)tag, (const u8 *)iv);
 	return 0;
 }
 
 void omap_aes_gcm_dma_out_callback(void *data)
 {
diff --git a/drivers/net/ethernet/chelsio/inline_crypto/ch_ipsec/chcr_ipsec.c b/drivers/net/ethernet/chelsio/inline_crypto/ch_ipsec/chcr_ipsec.c
index 882d09b2b1a8..074717d4bb16 100644
--- a/drivers/net/ethernet/chelsio/inline_crypto/ch_ipsec/chcr_ipsec.c
+++ b/drivers/net/ethernet/chelsio/inline_crypto/ch_ipsec/chcr_ipsec.c
@@ -208,11 +208,11 @@ static int ch_ipsec_setkey(struct xfrm_state *x,
 	if (ret) {
 		sa_entry->enckey_len = 0;
 		goto out;
 	}
 	memset(ghash_h, 0, AEAD_H_SIZE);
-	aes_encrypt_new(&aes, ghash_h, ghash_h);
+	aes_encrypt(&aes, ghash_h, ghash_h);
 	memzero_explicit(&aes, sizeof(aes));
 
 	memcpy(sa_entry->key + (DIV_ROUND_UP(sa_entry->enckey_len, 16) *
 	       16), ghash_h, AEAD_H_SIZE);
 	sa_entry->kctx_len = ((DIV_ROUND_UP(sa_entry->enckey_len, 16)) << 4) +
diff --git a/drivers/net/ethernet/chelsio/inline_crypto/ch_ktls/chcr_ktls.c b/drivers/net/ethernet/chelsio/inline_crypto/ch_ktls/chcr_ktls.c
index 09c0687f911f..b8ebb56de65e 100644
--- a/drivers/net/ethernet/chelsio/inline_crypto/ch_ktls/chcr_ktls.c
+++ b/drivers/net/ethernet/chelsio/inline_crypto/ch_ktls/chcr_ktls.c
@@ -141,11 +141,11 @@ static int chcr_ktls_save_keys(struct chcr_ktls_info *tx_info,
 	ret = aes_prepareenckey(&aes, key, keylen);
 	if (ret)
 		goto out;
 
 	memset(ghash_h, 0, ghash_size);
-	aes_encrypt_new(&aes, ghash_h, ghash_h);
+	aes_encrypt(&aes, ghash_h, ghash_h);
 	memzero_explicit(&aes, sizeof(aes));
 
 	/* fill the Key context */
 	if (direction == TLS_OFFLOAD_CTX_DIR_TX) {
 		kctx->ctx_hdr = FILL_KEY_CTX_HDR(ck_size,
diff --git a/drivers/net/ethernet/chelsio/inline_crypto/chtls/chtls_hw.c b/drivers/net/ethernet/chelsio/inline_crypto/chtls/chtls_hw.c
index be2b623957c0..d84473ca844d 100644
--- a/drivers/net/ethernet/chelsio/inline_crypto/chtls/chtls_hw.c
+++ b/drivers/net/ethernet/chelsio/inline_crypto/chtls/chtls_hw.c
@@ -294,11 +294,11 @@ static int chtls_key_info(struct chtls_sock *csk,
 	ret = aes_prepareenckey(&aes, key, keylen);
 	if (ret)
 		return ret;
 
 	memset(ghash_h, 0, AEAD_H_SIZE);
-	aes_encrypt_new(&aes, ghash_h, ghash_h);
+	aes_encrypt(&aes, ghash_h, ghash_h);
 	memzero_explicit(&aes, sizeof(aes));
 	csk->tlshws.keylen = key_ctx_size;
 
 	/* Copy the Key context */
 	if (optname == TLS_RX) {
diff --git a/drivers/net/phy/mscc/mscc_macsec.c b/drivers/net/phy/mscc/mscc_macsec.c
index bcb7f5a4a8fd..9a38a29cf397 100644
--- a/drivers/net/phy/mscc/mscc_macsec.c
+++ b/drivers/net/phy/mscc/mscc_macsec.c
@@ -509,11 +509,11 @@ static int vsc8584_macsec_derive_key(const u8 *key, u16 key_len, u8 hkey[16])
 
 	ret = aes_prepareenckey(&aes, key, key_len);
 	if (ret)
 		return ret;
 
-	aes_encrypt_new(&aes, hkey, input);
+	aes_encrypt(&aes, hkey, input);
 	memzero_explicit(&aes, sizeof(aes));
 	return 0;
 }
 
 static int vsc8584_macsec_transformation(struct phy_device *phydev,
diff --git a/drivers/staging/rtl8723bs/core/rtw_security.c b/drivers/staging/rtl8723bs/core/rtw_security.c
index 79825324e70f..8ee5bed252bf 100644
--- a/drivers/staging/rtl8723bs/core/rtw_security.c
+++ b/drivers/staging/rtl8723bs/core/rtw_security.c
@@ -638,11 +638,11 @@ u32 rtw_tkip_decrypt(struct adapter *padapter, u8 *precvframe)
 static void aes128k128d(u8 *key, u8 *data, u8 *ciphertext)
 {
 	struct aes_enckey aes;
 
 	aes_prepareenckey(&aes, key, 16);
-	aes_encrypt_new(&aes, ciphertext, data);
+	aes_encrypt(&aes, ciphertext, data);
 	memzero_explicit(&aes, sizeof(aes));
 }
 
 /************************************************/
 /* construct_mic_iv()                           */
@@ -1434,16 +1434,16 @@ static int omac1_aes_128_vector(u8 *key, size_t num_elem,
 				pos = addr[e];
 				end = pos + len[e];
 			}
 		}
 		if (left > AES_BLOCK_SIZE)
-			aes_encrypt_new(&aes, cbc, cbc);
+			aes_encrypt(&aes, cbc, cbc);
 		left -= AES_BLOCK_SIZE;
 	}
 
 	memset(pad, 0, AES_BLOCK_SIZE);
-	aes_encrypt_new(&aes, pad, pad);
+	aes_encrypt(&aes, pad, pad);
 	gf_mulx(pad);
 
 	if (left || total_len == 0) {
 		for (i = 0; i < left; i++) {
 			cbc[i] ^= *pos++;
@@ -1457,11 +1457,11 @@ static int omac1_aes_128_vector(u8 *key, size_t num_elem,
 		gf_mulx(pad);
 	}
 
 	for (i = 0; i < AES_BLOCK_SIZE; i++)
 		pad[i] ^= cbc[i];
-	aes_encrypt_new(&aes, pad, mac);
+	aes_encrypt(&aes, pad, mac);
 	memzero_explicit(&aes, sizeof(aes));
 	return 0;
 }
 
 /**
diff --git a/include/crypto/aes.h b/include/crypto/aes.h
index 4ce710209da8..30522cc0604c 100644
--- a/include/crypto/aes.h
+++ b/include/crypto/aes.h
@@ -299,31 +299,31 @@ typedef union {
 	const struct aes_enckey *enc_key;
 	const struct aes_key *full_key;
 } aes_encrypt_arg __attribute__ ((__transparent_union__));
 
 /**
- * aes_encrypt_new() - Encrypt a single AES block
+ * aes_encrypt() - Encrypt a single AES block
  * @key: The AES key, as a pointer to either an encryption-only key
  *	 (struct aes_enckey) or a full, bidirectional key (struct aes_key).
  * @out: Buffer to store the ciphertext block
  * @in: Buffer containing the plaintext block
  *
  * Context: Any context.
  */
-void aes_encrypt_new(aes_encrypt_arg key, u8 out[at_least AES_BLOCK_SIZE],
-		     const u8 in[at_least AES_BLOCK_SIZE]);
+void aes_encrypt(aes_encrypt_arg key, u8 out[at_least AES_BLOCK_SIZE],
+		 const u8 in[at_least AES_BLOCK_SIZE]);
 
 /**
- * aes_decrypt_new() - Decrypt a single AES block
+ * aes_decrypt() - Decrypt a single AES block
  * @key: The AES key, previously initialized by aes_preparekey()
  * @out: Buffer to store the plaintext block
  * @in: Buffer containing the ciphertext block
  *
  * Context: Any context.
  */
-void aes_decrypt_new(const struct aes_key *key, u8 out[at_least AES_BLOCK_SIZE],
-		     const u8 in[at_least AES_BLOCK_SIZE]);
+void aes_decrypt(const struct aes_key *key, u8 out[at_least AES_BLOCK_SIZE],
+		 const u8 in[at_least AES_BLOCK_SIZE]);
 
 extern const u8 crypto_aes_sbox[];
 extern const u8 crypto_aes_inv_sbox[];
 extern const u32 __cacheline_aligned aes_enc_tab[256];
 extern const u32 __cacheline_aligned aes_dec_tab[256];
diff --git a/lib/crypto/aes.c b/lib/crypto/aes.c
index f8c67206b850..98ade1758735 100644
--- a/lib/crypto/aes.c
+++ b/lib/crypto/aes.c
@@ -500,23 +500,23 @@ int aes_prepareenckey(struct aes_enckey *key, const u8 *in_key, size_t key_len)
 {
 	return __aes_preparekey(key, NULL, in_key, key_len);
 }
 EXPORT_SYMBOL(aes_prepareenckey);
 
-void aes_encrypt_new(aes_encrypt_arg key, u8 out[AES_BLOCK_SIZE],
-		     const u8 in[AES_BLOCK_SIZE])
+void aes_encrypt(aes_encrypt_arg key, u8 out[AES_BLOCK_SIZE],
+		 const u8 in[AES_BLOCK_SIZE])
 {
 	aes_encrypt_arch(key.enc_key, out, in);
 }
-EXPORT_SYMBOL(aes_encrypt_new);
+EXPORT_SYMBOL(aes_encrypt);
 
-void aes_decrypt_new(const struct aes_key *key, u8 out[AES_BLOCK_SIZE],
-		     const u8 in[AES_BLOCK_SIZE])
+void aes_decrypt(const struct aes_key *key, u8 out[AES_BLOCK_SIZE],
+		 const u8 in[AES_BLOCK_SIZE])
 {
 	aes_decrypt_arch(key, out, in);
 }
-EXPORT_SYMBOL(aes_decrypt_new);
+EXPORT_SYMBOL(aes_decrypt);
 
 #ifdef aes_mod_init_arch
 static int __init aes_mod_init(void)
 {
 	aes_mod_init_arch();
diff --git a/lib/crypto/aescfb.c b/lib/crypto/aescfb.c
index 3149d688c4e0..147e5211728f 100644
--- a/lib/crypto/aescfb.c
+++ b/lib/crypto/aescfb.c
@@ -23,11 +23,11 @@ static void aescfb_encrypt_block(const struct aes_enckey *key, void *dst,
 	 * extent by pulling the entire S-box into the caches before doing any
 	 * substitutions, but this strategy is more effective when running with
 	 * interrupts disabled.
 	 */
 	local_irq_save(flags);
-	aes_encrypt_new(key, dst, src);
+	aes_encrypt(key, dst, src);
 	local_irq_restore(flags);
 }
 
 /**
  * aescfb_encrypt - Perform AES-CFB encryption on a block of data
diff --git a/lib/crypto/aesgcm.c b/lib/crypto/aesgcm.c
index 19106fe008fd..02f5b5f32c76 100644
--- a/lib/crypto/aesgcm.c
+++ b/lib/crypto/aesgcm.c
@@ -24,11 +24,11 @@ static void aesgcm_encrypt_block(const struct aes_enckey *key, void *dst,
 	 * mitigates this risk to some extent by pulling the entire S-box into
 	 * the caches before doing any substitutions, but this strategy is more
 	 * effective when running with interrupts disabled.
 	 */
 	local_irq_save(flags);
-	aes_encrypt_new(key, dst, src);
+	aes_encrypt(key, dst, src);
 	local_irq_restore(flags);
 }
 
 /**
  * aesgcm_expandkey - Expands the AES and GHASH keys for the AES-GCM key
diff --git a/net/bluetooth/smp.c b/net/bluetooth/smp.c
index 69007e510177..bf61e8841535 100644
--- a/net/bluetooth/smp.c
+++ b/net/bluetooth/smp.c
@@ -390,11 +390,11 @@ static int smp_e(const u8 *k, u8 *r)
 	}
 
 	/* Most significant octet of plaintextData corresponds to data[0] */
 	swap_buf(r, data, 16);
 
-	aes_encrypt_new(&aes, data, data);
+	aes_encrypt(&aes, data, data);
 
 	/* Most significant octet of encryptedData corresponds to data[0] */
 	swap_buf(data, r, 16);
 
 	SMP_DBG("r %16phN", r);
-- 
2.52.0


