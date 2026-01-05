Return-Path: <linuxppc-dev+bounces-15222-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 191BBCF1E4F
	for <lists+linuxppc-dev@lfdr.de>; Mon, 05 Jan 2026 06:16:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dl2Yb4Zc7z30Vj;
	Mon, 05 Jan 2026 16:15:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767590115;
	cv=none; b=St4R08JY1+p/aoEtGHahLePTcK6wg7U7iKc4Q6NBf2MA+fB3ZExncelMn97W75dKUfgh+x1FfHwogQ1Z1YIk0iyiY8o2vG6BKWFXSs/VqO+FpzpuD3uOa2lzVM/HtD/hQYvLFCqiMJRw1ZFXaSwyijZpm1qKkvlmfsz9CIVUvxMBbteFTy04T0NUb9mvsOMqnMakb83Nz3uOyCq26yiZuKJy102A3E0y5Ui1h7JdPLbLPb7EG+cV6S2RcKSa9B8HNzspYYwX/yFZVvJiqtuA+1qzRZnwIh5R6XB9V9s+NeKRcBuVqpLSwRRN99pFtdf+fQyXh2rv/HFHW2r/HYV23Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767590115; c=relaxed/relaxed;
	bh=yqDPj7Ofqs6+uuplXahNC64oSZnKslaRYOqdnLLZlQ4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UY+qf/XB/oHO5g6kiolj9KzUpWAkApziNxqow9PP9pNwc6p0j4veHS4dVAmLH5szZY9LPrEFTp1ftjrZrQb/36QHZWnwtljy/8Ija3W6RW8GGSeOCyBVS9czATmf0psS5oTCUeUZUqChNTnMOHVNESRhjis/XtGZ2h++95Twl1wLszOCQ/QguEUEM3Qmqn07bf8J0tkBBPvofqo0zuuvsghNPmw/74rJxoyCzPyCLREGQFYw7vU4+ZrwphMyiPvkAygJbf3KpZTLFBgA63XwFTQU/VkkL78lqCtp+pLfP1A3cBhvN9lpci853nLaFkkSrnNtR4gMtUBcuyPhrprihQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Rmly392a; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Rmly392a;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dl2YV0CPpz2yvF
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 05 Jan 2026 16:15:09 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id CDD2B4430E;
	Mon,  5 Jan 2026 05:15:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F442C4AF09;
	Mon,  5 Jan 2026 05:15:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767590106;
	bh=X2y6JmsAPpKxGvYBZWX3/Sy84iagH93kp9gxdC5t9Go=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Rmly392a977vLVI0kfIty/rm8OhHHS/k5IDBLd9WUUdJDGUZk77qfzuOUZOwqSYu0
	 +ILUM5sQMAanzj4L78EzSjqCPf2HbWVRLYRZqzVH7Cbp9jqwmY6YFz5sK0ZEtElr9u
	 lS8cI0RrtadOm8Rz0A/pLiOBP71fBx2HYzL6NRrvOjx09dXoh5lV+UA3n9zI9RJgC5
	 E+d33a+vjyQ0RncbIGufV5ni6Frma+umzTnzXfF9wggbwtWr2tyzfNce83TUAEC1sJ
	 HWFMoH7PJKLC4UJAJZrbQppx0tXeDO2LY9c/RAgt/1mvYY0OIen/I21GHPWpt/BLRK
	 Hh9X0ljtBlWDA==
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
Subject: [PATCH 24/36] crypto: arm64/ghash - Use new AES library API
Date: Sun,  4 Jan 2026 21:12:57 -0800
Message-ID: <20260105051311.1607207-25-ebiggers@kernel.org>
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
crypto_aes_ctx) to the new ones (which use struct aes_enckey).  This
eliminates the unnecessary computation and caching of the decryption
round keys.  The new AES en/decryption functions are also much faster
and use AES instructions when supported by the CPU.

Note: aes_encrypt_new() will be renamed to aes_encrypt() once all
callers of the old aes_encrypt() have been updated.

Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 arch/arm64/crypto/ghash-ce-glue.c | 29 ++++++++---------------------
 1 file changed, 8 insertions(+), 21 deletions(-)

diff --git a/arch/arm64/crypto/ghash-ce-glue.c b/arch/arm64/crypto/ghash-ce-glue.c
index ef249d06c92c..bfd38e485e77 100644
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
@@ -184,35 +184,23 @@ static struct shash_alg ghash_alg = {
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
 
-	aes_encrypt(&ctx->aes_key, key, (u8[AES_BLOCK_SIZE]){});
+	aes_encrypt_new(&ctx->aes_key, key, (u8[AES_BLOCK_SIZE]){});
 
 	/* needed for the fallback */
 	memcpy(&ctx->ghash_key.k, key, GHASH_BLOCK_SIZE);
 
 	ghash_reflect(ctx->ghash_key.h[0], &ctx->ghash_key.k);
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


