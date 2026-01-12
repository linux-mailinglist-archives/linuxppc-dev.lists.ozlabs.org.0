Return-Path: <linuxppc-dev+bounces-15564-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3438AD14F07
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Jan 2026 20:24:52 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dqj3941RDz2ywS;
	Tue, 13 Jan 2026 06:23:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768245813;
	cv=none; b=nLI3k6qyyd9O0OgC5D+IMH/ZF+5+ov/VKFQwYpUDmoItkOs0VOK4qCc0nNIK8THxFR968f1V9AZIbKi+12l2ridojLF4d1NRdSALaQcenO0QrSneTwjdA/5apxtO7Wl9VcjlFEqd1Hseq7HKQNpKe+KYaOzJSVnlpDGG5NBMX1HY7pyOS1PRsafmA59XKY0r848u7dY/anv0iWPucO/xFmaJKK2dD6jbtjVMxyCSqVucwGaDXANjDAH9+PggJbHxrodsQj94rqx4z0i13nmOn+kOsycf8F8s9T+s+vcWvDXO/gAYnqpVCsFLyqIMXRTnuYFQCjr+CHlE/b27iPryyA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768245813; c=relaxed/relaxed;
	bh=ICZSjMFk0SjcBFAmmlWUMyBPpemD7Dx+XsaO5ZLfxfk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AoP2WnexkQiVQOkKeAXVIK5WAzgbVMcISwxqCp7S3L7F8hbG+2yJV7JS2palKmfnhQS03YqjCeJwgs4ADKwSxuSe4h9oBzPJ67jbvzMEOMVMfh7+ZyGbZEdt8zG1wy3UmWvJwAj1Ley62Utlr0HaQ3DR83sMh/DWMafKQ92Ed+gOuioWVVYkKlOcZMY+EyNGjvOE/HEKu+T1hxsUcwgX8eClubx3GsIbY6mvJeiFHeptaPzQeWzXV00nOZ2KLX94HyEh3C8aEaco9s4tTumFkSNdyUA0fMgWCZPsTBlvMhNYphH+UWMmmZeuEpOSPfOdDiz2COnWL5Q/8O4oCC+eAw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=DyrNjcdd; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=DyrNjcdd;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dqj385fcYz2yvc
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Jan 2026 06:23:32 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 421E7443B9;
	Mon, 12 Jan 2026 19:23:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2F1FC2BC9E;
	Mon, 12 Jan 2026 19:23:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768245811;
	bh=NltvZkewEHgk0OxV2OlqHClzS++fArO+KBZ7L9kUlbk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DyrNjcdd2UgBnDotjEXY8qII9iGNu1uEWirOyLRGsPUKHPRmLRsgrQYJZfK17EFOT
	 Jjmq4w+utco9K5dko0xzOYNRvHThKn5H4/AzH0lvIa19igg/yEDaSoVVv0SEtNMe+E
	 XSL1UzonfD7FtxVxqTjWkIT9zWnw19PISlMGaCOs9Ro7UEMdlMOZD/wId2NdVT1IqP
	 yD6n1DPoVEl4eDRd4NEovQLTRJa1HSn+1iQ9HkrnviY85iMQyaDiYspDFfsvSgjk77
	 FezNcc7WxWghb/T1QHeymsQNN3jPz/6MgE1q6Al5w6cr8a9181ylkwZWI9A5uMbQuY
	 lQVtTc+2DGfZg==
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
Subject: [PATCH v2 24/35] crypto: arm64/ghash - Use new AES library API
Date: Mon, 12 Jan 2026 11:20:22 -0800
Message-ID: <20260112192035.10427-25-ebiggers@kernel.org>
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
crypto_aes_ctx) to the new ones (which use struct aes_enckey).  This
eliminates the unnecessary computation and caching of the decryption
round keys.  The new AES en/decryption functions are also much faster
and use AES instructions when supported by the CPU.

Note that in addition to the change in the key preparation function and
the key struct type itself, the change in the type of the key struct
results in aes_encrypt() (which is temporarily a type-generic macro)
calling the new encryption function rather than the old one.

Acked-by: Ard Biesheuvel <ardb@kernel.org>
Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 arch/arm64/crypto/ghash-ce-glue.c | 27 +++++++--------------------
 1 file changed, 7 insertions(+), 20 deletions(-)

diff --git a/arch/arm64/crypto/ghash-ce-glue.c b/arch/arm64/crypto/ghash-ce-glue.c
index ef249d06c92c..63bb9e062251 100644
--- a/arch/arm64/crypto/ghash-ce-glue.c
+++ b/arch/arm64/crypto/ghash-ce-glue.c
@@ -38,11 +38,11 @@ struct ghash_key {
 struct arm_ghash_desc_ctx {
 	u64 digest[GHASH_DIGEST_SIZE/sizeof(u64)];
 };
 
 struct gcm_aes_ctx {
-	struct crypto_aes_ctx	aes_key;
+	struct aes_enckey	aes_key;
 	u8			nonce[RFC4106_NONCE_SIZE];
 	struct ghash_key	ghash_key;
 };
 
 asmlinkage void pmull_ghash_update_p64(int blocks, u64 dg[], const char *src,
@@ -184,31 +184,19 @@ static struct shash_alg ghash_alg = {
 	.import			= ghash_import,
 	.descsize		= sizeof(struct arm_ghash_desc_ctx),
 	.statesize		= sizeof(struct ghash_desc_ctx),
 };
 
-static int num_rounds(struct crypto_aes_ctx *ctx)
-{
-	/*
-	 * # of rounds specified by AES:
-	 * 128 bit key		10 rounds
-	 * 192 bit key		12 rounds
-	 * 256 bit key		14 rounds
-	 * => n byte key	=> 6 + (n/4) rounds
-	 */
-	return 6 + ctx->key_length / 4;
-}
-
 static int gcm_aes_setkey(struct crypto_aead *tfm, const u8 *inkey,
 			  unsigned int keylen)
 {
 	struct gcm_aes_ctx *ctx = crypto_aead_ctx(tfm);
 	u8 key[GHASH_BLOCK_SIZE];
 	be128 h;
 	int ret;
 
-	ret = aes_expandkey(&ctx->aes_key, inkey, keylen);
+	ret = aes_prepareenckey(&ctx->aes_key, inkey, keylen);
 	if (ret)
 		return -EINVAL;
 
 	aes_encrypt(&ctx->aes_key, key, (u8[AES_BLOCK_SIZE]){});
 
@@ -294,11 +282,10 @@ static void gcm_calculate_auth_mac(struct aead_request *req, u64 dg[], u32 len)
 
 static int gcm_encrypt(struct aead_request *req, char *iv, int assoclen)
 {
 	struct crypto_aead *aead = crypto_aead_reqtfm(req);
 	struct gcm_aes_ctx *ctx = crypto_aead_ctx(aead);
-	int nrounds = num_rounds(&ctx->aes_key);
 	struct skcipher_walk walk;
 	u8 buf[AES_BLOCK_SIZE];
 	u64 dg[2] = {};
 	be128 lengths;
 	u8 *tag;
@@ -329,12 +316,12 @@ static int gcm_encrypt(struct aead_request *req, char *iv, int assoclen)
 			tag = NULL;
 		}
 
 		scoped_ksimd()
 			pmull_gcm_encrypt(nbytes, dst, src, ctx->ghash_key.h,
-					  dg, iv, ctx->aes_key.key_enc, nrounds,
-					  tag);
+					  dg, iv, ctx->aes_key.k.rndkeys,
+					  ctx->aes_key.nrounds, tag);
 
 		if (unlikely(!nbytes))
 			break;
 
 		if (unlikely(nbytes > 0 && nbytes < AES_BLOCK_SIZE))
@@ -357,11 +344,10 @@ static int gcm_encrypt(struct aead_request *req, char *iv, int assoclen)
 static int gcm_decrypt(struct aead_request *req, char *iv, int assoclen)
 {
 	struct crypto_aead *aead = crypto_aead_reqtfm(req);
 	struct gcm_aes_ctx *ctx = crypto_aead_ctx(aead);
 	unsigned int authsize = crypto_aead_authsize(aead);
-	int nrounds = num_rounds(&ctx->aes_key);
 	struct skcipher_walk walk;
 	u8 otag[AES_BLOCK_SIZE];
 	u8 buf[AES_BLOCK_SIZE];
 	u64 dg[2] = {};
 	be128 lengths;
@@ -399,12 +385,13 @@ static int gcm_decrypt(struct aead_request *req, char *iv, int assoclen)
 		}
 
 		scoped_ksimd()
 			ret = pmull_gcm_decrypt(nbytes, dst, src,
 						ctx->ghash_key.h,
-						dg, iv, ctx->aes_key.key_enc,
-						nrounds, tag, otag, authsize);
+						dg, iv, ctx->aes_key.k.rndkeys,
+						ctx->aes_key.nrounds, tag, otag,
+						authsize);
 
 		if (unlikely(!nbytes))
 			break;
 
 		if (unlikely(nbytes > 0 && nbytes < AES_BLOCK_SIZE))
-- 
2.52.0


