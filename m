Return-Path: <linuxppc-dev+bounces-15213-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B823CF1E0F
	for <lists+linuxppc-dev@lfdr.de>; Mon, 05 Jan 2026 06:15:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dl2YS4061z2yth;
	Mon, 05 Jan 2026 16:15:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767590108;
	cv=none; b=UFROIBHCR1c/9U867Q+M6S5bhJibWHTW2S0XQ371DPwkgIHR451Xd4jI2hBaLR2oNh1jsX80RS7Hhapz4GGl9ASMCjucL4hSblyaI/tN/yLDPBrpQc7cnnY9rNQNgwoL1wIH22oBmP9MX89QY/Je4MVIRqYBCx1pB5lVQhRkXeguCBN80RQfoqhAx8rDLI4OM/ybKQ6SRH8SC6cjyEaYeO0v9jTBXC5AK1P7GykpOfUJv3tB0RMeIxRg0W3Jn5JOjdqRjrgjbPxUP8LeP+cJx9beHYssrvPzvLzZ52Lcm6ZwhuopXtqcQV/hcs4W6LglBHReqgcak5tRdU6pEiZp+A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767590108; c=relaxed/relaxed;
	bh=tuK34opV1Ote3vP8QGAIzIsFlL70xUzv3wrx2g1vtcg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=n6rTMeaOifSlYCZ2jyQk0Hhk807KkI311rMNyIhwQVaLeuu/UL8hbAlD89KU7DTw2eU1cjgi/8Nd5N+NdjFWNnxOff59V4jmxvqIfuZwH/Cx49GVsvNhSdfhv3p8YtO0KYlTSGag/Nysb60j+vmP6xJ5JSMgDsK9Lqz7gxbmR8jc5NB4iQ53MxFnqH4R2plwlAEg8PG2adeRnah1NZ7DKX0zA/88ld10DsgLIWLQztDKCbWGhL8rMW4TLw181GVtMR6Z5NeLqwlS+ofW5hLZ8UIngSMwtyfNoIB2DgaVm1GpJVg4nlrat4kddn8OuNAiD3of+MgTIIpBVvSjThfbjA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=XP1s+QHy; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=XP1s+QHy;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dl2YM3bCKz2ynH
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 05 Jan 2026 16:15:03 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 14C3444132;
	Mon,  5 Jan 2026 05:15:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F57AC2BCB4;
	Mon,  5 Jan 2026 05:14:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767590099;
	bh=Ex0H8ISIthDShtIvVaBJkYiTcDBWiMsSye3cm4tsqBU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=XP1s+QHyWyjK9jZ6XaeZu0IQewiHlJsO2VY5jWwPI8+ay/84q4cK2BbiquewIHs/D
	 9qIdccQYD2Fg9n5Iydp4wdnkizaCQ3glr5UTXfnysuVJCn35WUWxpDUFkU+/hcTMMM
	 CiYrYWO6Y06L2eT/uD4hyUzkS1JzLjAm5/BA2Yh2LJQdeWYfXHjobY4gRd769JpOMi
	 Elft86km3SlurlN/ulm3Bv50hNL1uQWLDGlMtwh9+2rgmBSOooSeDD1p3AdGyhSY8I
	 1WEbYZ0AWTFlEvJyFhz0WTJPmSDnHHCzuVcjgtqHKbgADkDdWgvZuZ/3riGWn+fFpU
	 kPlHzVS3OhlXg==
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
Subject: [PATCH 15/36] lib/crypto: s390/aes: Migrate optimized code into library
Date: Sun,  4 Jan 2026 21:12:48 -0800
Message-ID: <20260105051311.1607207-16-ebiggers@kernel.org>
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

Implement aes_preparekey_arch(), aes_encrypt_arch(), and
aes_decrypt_arch() using the CPACF AES instructions.

Then, remove the superseded "aes-s390" crypto_cipher.

The result is that both the AES library and crypto_cipher APIs use the
CPACF AES instructions, whereas previously only crypto_cipher did (and
it wasn't enabled by default, which this commit fixes as well).

Note that this preserves the optimization where the AES key is stored in
raw form rather than expanded form.  CPACF just takes the raw key.

Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 arch/s390/crypto/Kconfig    |   2 -
 arch/s390/crypto/aes_s390.c | 113 ------------------------------------
 include/crypto/aes.h        |   3 +
 lib/crypto/Kconfig          |   1 +
 lib/crypto/s390/aes.h       | 106 +++++++++++++++++++++++++++++++++
 5 files changed, 110 insertions(+), 115 deletions(-)
 create mode 100644 lib/crypto/s390/aes.h

diff --git a/arch/s390/crypto/Kconfig b/arch/s390/crypto/Kconfig
index f838ca055f6d..79a2d0034258 100644
--- a/arch/s390/crypto/Kconfig
+++ b/arch/s390/crypto/Kconfig
@@ -12,14 +12,12 @@ config CRYPTO_GHASH_S390
 
 	  It is available as of z196.
 
 config CRYPTO_AES_S390
 	tristate "Ciphers: AES, modes: ECB, CBC, CTR, XTS, GCM"
-	select CRYPTO_ALGAPI
 	select CRYPTO_SKCIPHER
 	help
-	  Block cipher: AES cipher algorithms (FIPS 197)
 	  AEAD cipher: AES with GCM
 	  Length-preserving ciphers: AES with ECB, CBC, XTS, and CTR modes
 
 	  Architecture: s390
 
diff --git a/arch/s390/crypto/aes_s390.c b/arch/s390/crypto/aes_s390.c
index d0a295435680..62edc66d5478 100644
--- a/arch/s390/crypto/aes_s390.c
+++ b/arch/s390/crypto/aes_s390.c
@@ -18,11 +18,10 @@
 
 #include <crypto/aes.h>
 #include <crypto/algapi.h>
 #include <crypto/ghash.h>
 #include <crypto/internal/aead.h>
-#include <crypto/internal/cipher.h>
 #include <crypto/internal/skcipher.h>
 #include <crypto/scatterwalk.h>
 #include <linux/err.h>
 #include <linux/module.h>
 #include <linux/cpufeature.h>
@@ -43,11 +42,10 @@ struct s390_aes_ctx {
 	u8 key[AES_MAX_KEY_SIZE];
 	int key_len;
 	unsigned long fc;
 	union {
 		struct crypto_skcipher *skcipher;
-		struct crypto_cipher *cip;
 	} fallback;
 };
 
 struct s390_xts_ctx {
 	union {
@@ -70,113 +68,10 @@ struct gcm_sg_walk {
 	unsigned int buf_bytes;
 	u8 *ptr;
 	unsigned int nbytes;
 };
 
-static int setkey_fallback_cip(struct crypto_tfm *tfm, const u8 *in_key,
-		unsigned int key_len)
-{
-	struct s390_aes_ctx *sctx = crypto_tfm_ctx(tfm);
-
-	sctx->fallback.cip->base.crt_flags &= ~CRYPTO_TFM_REQ_MASK;
-	sctx->fallback.cip->base.crt_flags |= (tfm->crt_flags &
-			CRYPTO_TFM_REQ_MASK);
-
-	return crypto_cipher_setkey(sctx->fallback.cip, in_key, key_len);
-}
-
-static int aes_set_key(struct crypto_tfm *tfm, const u8 *in_key,
-		       unsigned int key_len)
-{
-	struct s390_aes_ctx *sctx = crypto_tfm_ctx(tfm);
-	unsigned long fc;
-
-	/* Pick the correct function code based on the key length */
-	fc = (key_len == 16) ? CPACF_KM_AES_128 :
-	     (key_len == 24) ? CPACF_KM_AES_192 :
-	     (key_len == 32) ? CPACF_KM_AES_256 : 0;
-
-	/* Check if the function code is available */
-	sctx->fc = (fc && cpacf_test_func(&km_functions, fc)) ? fc : 0;
-	if (!sctx->fc)
-		return setkey_fallback_cip(tfm, in_key, key_len);
-
-	sctx->key_len = key_len;
-	memcpy(sctx->key, in_key, key_len);
-	return 0;
-}
-
-static void crypto_aes_encrypt(struct crypto_tfm *tfm, u8 *out, const u8 *in)
-{
-	struct s390_aes_ctx *sctx = crypto_tfm_ctx(tfm);
-
-	if (unlikely(!sctx->fc)) {
-		crypto_cipher_encrypt_one(sctx->fallback.cip, out, in);
-		return;
-	}
-	cpacf_km(sctx->fc, &sctx->key, out, in, AES_BLOCK_SIZE);
-}
-
-static void crypto_aes_decrypt(struct crypto_tfm *tfm, u8 *out, const u8 *in)
-{
-	struct s390_aes_ctx *sctx = crypto_tfm_ctx(tfm);
-
-	if (unlikely(!sctx->fc)) {
-		crypto_cipher_decrypt_one(sctx->fallback.cip, out, in);
-		return;
-	}
-	cpacf_km(sctx->fc | CPACF_DECRYPT,
-		 &sctx->key, out, in, AES_BLOCK_SIZE);
-}
-
-static int fallback_init_cip(struct crypto_tfm *tfm)
-{
-	const char *name = tfm->__crt_alg->cra_name;
-	struct s390_aes_ctx *sctx = crypto_tfm_ctx(tfm);
-
-	sctx->fallback.cip = crypto_alloc_cipher(name, 0,
-						 CRYPTO_ALG_NEED_FALLBACK);
-
-	if (IS_ERR(sctx->fallback.cip)) {
-		pr_err("Allocating AES fallback algorithm %s failed\n",
-		       name);
-		return PTR_ERR(sctx->fallback.cip);
-	}
-
-	return 0;
-}
-
-static void fallback_exit_cip(struct crypto_tfm *tfm)
-{
-	struct s390_aes_ctx *sctx = crypto_tfm_ctx(tfm);
-
-	crypto_free_cipher(sctx->fallback.cip);
-	sctx->fallback.cip = NULL;
-}
-
-static struct crypto_alg aes_alg = {
-	.cra_name		=	"aes",
-	.cra_driver_name	=	"aes-s390",
-	.cra_priority		=	300,
-	.cra_flags		=	CRYPTO_ALG_TYPE_CIPHER |
-					CRYPTO_ALG_NEED_FALLBACK,
-	.cra_blocksize		=	AES_BLOCK_SIZE,
-	.cra_ctxsize		=	sizeof(struct s390_aes_ctx),
-	.cra_module		=	THIS_MODULE,
-	.cra_init               =       fallback_init_cip,
-	.cra_exit               =       fallback_exit_cip,
-	.cra_u			=	{
-		.cipher = {
-			.cia_min_keysize	=	AES_MIN_KEY_SIZE,
-			.cia_max_keysize	=	AES_MAX_KEY_SIZE,
-			.cia_setkey		=	aes_set_key,
-			.cia_encrypt		=	crypto_aes_encrypt,
-			.cia_decrypt		=	crypto_aes_decrypt,
-		}
-	}
-};
-
 static int setkey_fallback_skcipher(struct crypto_skcipher *tfm, const u8 *key,
 				    unsigned int len)
 {
 	struct s390_aes_ctx *sctx = crypto_skcipher_ctx(tfm);
 
@@ -1047,11 +942,10 @@ static struct aead_alg gcm_aes_aead = {
 		.cra_driver_name	= "gcm-aes-s390",
 		.cra_module		= THIS_MODULE,
 	},
 };
 
-static struct crypto_alg *aes_s390_alg;
 static struct skcipher_alg *aes_s390_skcipher_algs[5];
 static int aes_s390_skciphers_num;
 static struct aead_alg *aes_s390_aead_alg;
 
 static int aes_s390_register_skcipher(struct skcipher_alg *alg)
@@ -1064,12 +958,10 @@ static int aes_s390_register_skcipher(struct skcipher_alg *alg)
 	return ret;
 }
 
 static void aes_s390_fini(void)
 {
-	if (aes_s390_alg)
-		crypto_unregister_alg(aes_s390_alg);
 	while (aes_s390_skciphers_num--)
 		crypto_unregister_skcipher(aes_s390_skcipher_algs[aes_s390_skciphers_num]);
 	if (ctrblk)
 		free_page((unsigned long) ctrblk);
 
@@ -1088,14 +980,10 @@ static int __init aes_s390_init(void)
 	cpacf_query(CPACF_KMA, &kma_functions);
 
 	if (cpacf_test_func(&km_functions, CPACF_KM_AES_128) ||
 	    cpacf_test_func(&km_functions, CPACF_KM_AES_192) ||
 	    cpacf_test_func(&km_functions, CPACF_KM_AES_256)) {
-		ret = crypto_register_alg(&aes_alg);
-		if (ret)
-			goto out_err;
-		aes_s390_alg = &aes_alg;
 		ret = aes_s390_register_skcipher(&ecb_aes_alg);
 		if (ret)
 			goto out_err;
 	}
 
@@ -1154,6 +1042,5 @@ module_exit(aes_s390_fini);
 
 MODULE_ALIAS_CRYPTO("aes-all");
 
 MODULE_DESCRIPTION("Rijndael (AES) Cipher Algorithm");
 MODULE_LICENSE("GPL");
-MODULE_IMPORT_NS("CRYPTO_INTERNAL");
diff --git a/include/crypto/aes.h b/include/crypto/aes.h
index e6082b7c6443..b91eb49cbffc 100644
--- a/include/crypto/aes.h
+++ b/include/crypto/aes.h
@@ -44,10 +44,13 @@ union aes_enckey_arch {
 	 * when that code is usable at key preparation time.  Otherwise they
 	 * fall back to rndkeys.  In the latter case, p8.nrounds (which doesn't
 	 * overlap rndkeys) is set to 0 to differentiate the two formats.
 	 */
 	struct p8_aes_key p8;
+#elif defined(CONFIG_S390)
+	/* Used when the CPU supports CPACF AES for this key's length */
+	u8 raw_key[AES_MAX_KEY_SIZE];
 #endif
 #endif /* CONFIG_CRYPTO_LIB_AES_ARCH */
 };
 
 union aes_invkey_arch {
diff --git a/lib/crypto/Kconfig b/lib/crypto/Kconfig
index a8c0b02a4fb0..b672f0145793 100644
--- a/lib/crypto/Kconfig
+++ b/lib/crypto/Kconfig
@@ -17,10 +17,11 @@ config CRYPTO_LIB_AES_ARCH
 	default y if ARM
 	default y if ARM64
 	default y if PPC && (SPE || (PPC64 && VSX))
 	default y if RISCV && 64BIT && TOOLCHAIN_HAS_VECTOR_CRYPTO && \
 		     RISCV_EFFICIENT_VECTOR_UNALIGNED_ACCESS
+	default y if S390
 
 config CRYPTO_LIB_AESCFB
 	tristate
 	select CRYPTO_LIB_AES
 	select CRYPTO_LIB_UTILS
diff --git a/lib/crypto/s390/aes.h b/lib/crypto/s390/aes.h
new file mode 100644
index 000000000000..5466f6ecbce7
--- /dev/null
+++ b/lib/crypto/s390/aes.h
@@ -0,0 +1,106 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * AES optimized using the CP Assist for Cryptographic Functions (CPACF)
+ *
+ * Copyright 2026 Google LLC
+ */
+#include <asm/cpacf.h>
+#include <linux/cpufeature.h>
+
+static __ro_after_init DEFINE_STATIC_KEY_FALSE(have_cpacf_aes128);
+static __ro_after_init DEFINE_STATIC_KEY_FALSE(have_cpacf_aes192);
+static __ro_after_init DEFINE_STATIC_KEY_FALSE(have_cpacf_aes256);
+
+/*
+ * When the CPU supports CPACF AES for the requested key length, we need only
+ * save a copy of the raw AES key, as that's what the CPACF instructions need.
+ *
+ * When unsupported, fall back to the generic key expansion and en/decryption.
+ */
+static void aes_preparekey_arch(union aes_enckey_arch *k,
+				union aes_invkey_arch *inv_k,
+				const u8 *in_key, int key_len, int nrounds)
+{
+	if (key_len == AES_KEYSIZE_128) {
+		if (static_branch_likely(&have_cpacf_aes128)) {
+			memcpy(k->raw_key, in_key, AES_KEYSIZE_128);
+			return;
+		}
+	} else if (key_len == AES_KEYSIZE_192) {
+		if (static_branch_likely(&have_cpacf_aes192)) {
+			memcpy(k->raw_key, in_key, AES_KEYSIZE_192);
+			return;
+		}
+	} else {
+		if (static_branch_likely(&have_cpacf_aes256)) {
+			memcpy(k->raw_key, in_key, AES_KEYSIZE_256);
+			return;
+		}
+	}
+	aes_expandkey_generic(k->rndkeys, inv_k ? inv_k->inv_rndkeys : NULL,
+			      in_key, key_len);
+}
+
+static inline bool aes_crypt_s390(const struct aes_enckey *key,
+				  u8 out[AES_BLOCK_SIZE],
+				  const u8 in[AES_BLOCK_SIZE], int decrypt)
+{
+	if (key->len == AES_KEYSIZE_128) {
+		if (static_branch_likely(&have_cpacf_aes128)) {
+			cpacf_km(CPACF_KM_AES_128 | decrypt,
+				 (void *)key->k.raw_key, out, in,
+				 AES_BLOCK_SIZE);
+			return true;
+		}
+	} else if (key->len == AES_KEYSIZE_192) {
+		if (static_branch_likely(&have_cpacf_aes192)) {
+			cpacf_km(CPACF_KM_AES_192 | decrypt,
+				 (void *)key->k.raw_key, out, in,
+				 AES_BLOCK_SIZE);
+			return true;
+		}
+	} else {
+		if (static_branch_likely(&have_cpacf_aes256)) {
+			cpacf_km(CPACF_KM_AES_256 | decrypt,
+				 (void *)key->k.raw_key, out, in,
+				 AES_BLOCK_SIZE);
+			return true;
+		}
+	}
+	return false;
+}
+
+static void aes_encrypt_arch(const struct aes_enckey *key,
+			     u8 out[AES_BLOCK_SIZE],
+			     const u8 in[AES_BLOCK_SIZE])
+{
+	if (likely(aes_crypt_s390(key, out, in, 0)))
+		return;
+	aes_encrypt_generic(key->k.rndkeys, key->nrounds, out, in);
+}
+
+static void aes_decrypt_arch(const struct aes_key *key,
+			     u8 out[AES_BLOCK_SIZE],
+			     const u8 in[AES_BLOCK_SIZE])
+{
+	if (likely(aes_crypt_s390((const struct aes_enckey *)key, out, in,
+				  CPACF_DECRYPT)))
+		return;
+	aes_decrypt_generic(key->inv_k.inv_rndkeys, key->nrounds, out, in);
+}
+
+#define aes_mod_init_arch aes_mod_init_arch
+static void aes_mod_init_arch(void)
+{
+	if (cpu_have_feature(S390_CPU_FEATURE_MSA)) {
+		cpacf_mask_t km_functions;
+
+		cpacf_query(CPACF_KM, &km_functions);
+		if (cpacf_test_func(&km_functions, CPACF_KM_AES_128))
+			static_branch_enable(&have_cpacf_aes128);
+		if (cpacf_test_func(&km_functions, CPACF_KM_AES_192))
+			static_branch_enable(&have_cpacf_aes192);
+		if (cpacf_test_func(&km_functions, CPACF_KM_AES_256))
+			static_branch_enable(&have_cpacf_aes256);
+	}
+}
-- 
2.52.0


