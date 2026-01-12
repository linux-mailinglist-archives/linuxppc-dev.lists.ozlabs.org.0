Return-Path: <linuxppc-dev+bounces-15581-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C39F6D14FA6
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Jan 2026 20:27:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dqj3c5CXwz3c1g;
	Tue, 13 Jan 2026 06:23:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768245836;
	cv=none; b=in6vm/uiBYezbvroRPp7jYbXFHwXV8P9MQAvKYpKxoSUJxzPx8K6UW+iBT+9Zl2G832jAh1DiYRwZlZa5w+RoY/hHE07erKILaMtAoY356GVGTygHlWQlikcGzZH7bNpoB6dq0vz5J8nZeNd63dID0KsORhmS5BT2Q/4kWQLrtWP1fw6NXj8edWUz8pu53ck8LmkVfZoYw1nQtDfsBNOEXAFUaTsBPhlJx5aUmsmZ1kTVtYyaryinHZYjS1Ar+g7mKFjQ4S9Ve8fIAd7mGcIEdR1xO3UJm5aoNC6vcItwboEmF+ikbbrYy2DrGpe8ENSLWgogjr65ls09RlibibGUg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768245836; c=relaxed/relaxed;
	bh=712mb/9c+K9R8KQ0BWdB5TadCzlE7NUJr9Sg7OGVMi0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Himx3OLh3snXivHubEWyw4scOAm6Xokh51OcKrHW59qqWE9r8yFUKd6N8cKJa/RxMn/T2X+0WzjjP6wb3z/U9uJqtvgBQHixGvK+d+7sxCCjCwuGAR5/SmIvnG636yJGRI2SeyimzUmr3P5AEPj+X38Er1vSpsD6R0GsOya6oPAOPVEPxg8NqpgOcc7jAOWLYM+SgZa5O4frpaEjK9rePjmAX6VBadc/rqODkwHw7Dr7wCAr+JCIjrjIAXMFZfz/jAaE0w5w8G/ilMOWFo4zZUULhkUurvmUgtFa3qf14kIeUIMxjqZZGUshS1AD343lVZ4BCg+kPcsuGxqrJ2pkNQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=tBGhe1lj; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=tBGhe1lj;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dqj3b49Rsz3bx1
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Jan 2026 06:23:55 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id F26EE443FC;
	Mon, 12 Jan 2026 19:23:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CE6AC19425;
	Mon, 12 Jan 2026 19:23:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768245803;
	bh=9CJBW3Yw+l4NE2IObqGq5P1JjpXcxrdOguxNy6LSrR8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tBGhe1ljAN+c+Er3sKN/zTwRVF7hb9QqDW8m8K7K3ARDGvH6dgN10gvZHj6WzRkOt
	 LY0I+kt94+INQwIrUcS7Kvw3KlV0wqAHr3HxHGLBJFwxfNJQjNWCATNuXyIFhB4Bhq
	 DzLMUXcxhkE3u4tlIRJ+JOwTa9ZKgBxkSzW9+dMe6FTMT95gPJfBcd+DotZolpCWOW
	 UZq9XCjpGr+8PrV3aGXtXq+nFA3WqsHTp5qdfQirlxGeEFgz0jPt4wljfCmKUQ0+IL
	 N3/RPB0j0120qz+KlkYKSfdOA623XyhsiFKMUZdsWPGa0o9G3pW868Z+jvRwLRF1rC
	 TzQY9qvPmNkSg==
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
Subject: [PATCH v2 11/35] lib/crypto: arm64/aes: Migrate optimized code into library
Date: Mon, 12 Jan 2026 11:20:09 -0800
Message-ID: <20260112192035.10427-12-ebiggers@kernel.org>
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

Move the ARM64 optimized AES key expansion and single-block AES
en/decryption code into lib/crypto/, wire it up to the AES library API,
and remove the superseded crypto_cipher algorithms.

The result is that both the AES library and crypto_cipher APIs are now
optimized for ARM64, whereas previously only crypto_cipher was (and the
optimizations weren't enabled by default, which this fixes as well).

Note: to see the diff from arch/arm64/crypto/aes-ce-glue.c to
lib/crypto/arm64/aes.h, view this commit with 'git show -M10'.

Acked-by: Ard Biesheuvel <ardb@kernel.org>
Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 arch/arm64/crypto/Kconfig                     |  26 +--
 arch/arm64/crypto/Makefile                    |   6 -
 arch/arm64/crypto/aes-ce-ccm-glue.c           |   2 -
 arch/arm64/crypto/aes-ce-glue.c               | 178 ------------------
 arch/arm64/crypto/aes-ce-setkey.h             |   6 -
 arch/arm64/crypto/aes-cipher-glue.c           |  71 -------
 arch/arm64/crypto/aes-glue.c                  |   2 -
 include/crypto/aes.h                          |  10 +
 lib/crypto/Kconfig                            |   1 +
 lib/crypto/Makefile                           |   5 +
 .../crypto => lib/crypto/arm64}/aes-ce-core.S |   0
 .../crypto/arm64}/aes-cipher-core.S           |   0
 lib/crypto/arm64/aes.h                        | 164 ++++++++++++++++
 13 files changed, 181 insertions(+), 290 deletions(-)
 delete mode 100644 arch/arm64/crypto/aes-ce-glue.c
 delete mode 100644 arch/arm64/crypto/aes-ce-setkey.h
 delete mode 100644 arch/arm64/crypto/aes-cipher-glue.c
 rename {arch/arm64/crypto => lib/crypto/arm64}/aes-ce-core.S (100%)
 rename {arch/arm64/crypto => lib/crypto/arm64}/aes-cipher-core.S (100%)
 create mode 100644 lib/crypto/arm64/aes.h

diff --git a/arch/arm64/crypto/Kconfig b/arch/arm64/crypto/Kconfig
index 4453dff8f0c1..81ed892b3b72 100644
--- a/arch/arm64/crypto/Kconfig
+++ b/arch/arm64/crypto/Kconfig
@@ -35,38 +35,15 @@ config CRYPTO_SM3_ARM64_CE
 	  SM3 (ShangMi 3) secure hash function (OSCCA GM/T 0004-2012)
 
 	  Architecture: arm64 using:
 	  - ARMv8.2 Crypto Extensions
 
-config CRYPTO_AES_ARM64
-	tristate "Ciphers: AES, modes: ECB, CBC, CTR, CTS, XCTR, XTS"
-	select CRYPTO_AES
-	help
-	  Block ciphers: AES cipher algorithms (FIPS-197)
-	  Length-preserving ciphers: AES with ECB, CBC, CTR, CTS,
-	    XCTR, and XTS modes
-	  AEAD cipher: AES with CBC, ESSIV, and SHA-256
-	    for fscrypt and dm-crypt
-
-	  Architecture: arm64
-
-config CRYPTO_AES_ARM64_CE
-	tristate "Ciphers: AES (ARMv8 Crypto Extensions)"
-	depends on KERNEL_MODE_NEON
-	select CRYPTO_ALGAPI
-	select CRYPTO_LIB_AES
-	help
-	  Block ciphers: AES cipher algorithms (FIPS-197)
-
-	  Architecture: arm64 using:
-	  - ARMv8 Crypto Extensions
-
 config CRYPTO_AES_ARM64_CE_BLK
 	tristate "Ciphers: AES, modes: ECB/CBC/CTR/XTS (ARMv8 Crypto Extensions)"
 	depends on KERNEL_MODE_NEON
 	select CRYPTO_SKCIPHER
-	select CRYPTO_AES_ARM64_CE
+	select CRYPTO_LIB_AES
 	select CRYPTO_LIB_SHA256
 	help
 	  Length-preserving ciphers: AES cipher algorithms (FIPS-197)
 	  with block cipher modes:
 	  - ECB (Electronic Codebook) mode (NIST SP800-38A)
@@ -163,11 +140,10 @@ config CRYPTO_SM4_ARM64_NEON_BLK
 
 config CRYPTO_AES_ARM64_CE_CCM
 	tristate "AEAD cipher: AES in CCM mode (ARMv8 Crypto Extensions)"
 	depends on KERNEL_MODE_NEON
 	select CRYPTO_ALGAPI
-	select CRYPTO_AES_ARM64_CE
 	select CRYPTO_AES_ARM64_CE_BLK
 	select CRYPTO_AEAD
 	select CRYPTO_LIB_AES
 	help
 	  AEAD cipher: AES cipher algorithms (FIPS-197) with
diff --git a/arch/arm64/crypto/Makefile b/arch/arm64/crypto/Makefile
index 3ab4b58e5c4c..3574e917bc37 100644
--- a/arch/arm64/crypto/Makefile
+++ b/arch/arm64/crypto/Makefile
@@ -27,22 +27,16 @@ obj-$(CONFIG_CRYPTO_SM4_ARM64_NEON_BLK) += sm4-neon.o
 sm4-neon-y := sm4-neon-glue.o sm4-neon-core.o
 
 obj-$(CONFIG_CRYPTO_GHASH_ARM64_CE) += ghash-ce.o
 ghash-ce-y := ghash-ce-glue.o ghash-ce-core.o
 
-obj-$(CONFIG_CRYPTO_AES_ARM64_CE) += aes-ce-cipher.o
-aes-ce-cipher-y := aes-ce-core.o aes-ce-glue.o
-
 obj-$(CONFIG_CRYPTO_AES_ARM64_CE_CCM) += aes-ce-ccm.o
 aes-ce-ccm-y := aes-ce-ccm-glue.o aes-ce-ccm-core.o
 
 obj-$(CONFIG_CRYPTO_AES_ARM64_CE_BLK) += aes-ce-blk.o
 aes-ce-blk-y := aes-glue-ce.o aes-ce.o
 
 obj-$(CONFIG_CRYPTO_AES_ARM64_NEON_BLK) += aes-neon-blk.o
 aes-neon-blk-y := aes-glue-neon.o aes-neon.o
 
-obj-$(CONFIG_CRYPTO_AES_ARM64) += aes-arm64.o
-aes-arm64-y := aes-cipher-core.o aes-cipher-glue.o
-
 obj-$(CONFIG_CRYPTO_AES_ARM64_BS) += aes-neon-bs.o
 aes-neon-bs-y := aes-neonbs-core.o aes-neonbs-glue.o
diff --git a/arch/arm64/crypto/aes-ce-ccm-glue.c b/arch/arm64/crypto/aes-ce-ccm-glue.c
index c4fd648471f1..db371ac051fc 100644
--- a/arch/arm64/crypto/aes-ce-ccm-glue.c
+++ b/arch/arm64/crypto/aes-ce-ccm-glue.c
@@ -15,12 +15,10 @@
 #include <crypto/internal/skcipher.h>
 #include <linux/module.h>
 
 #include <asm/simd.h>
 
-#include "aes-ce-setkey.h"
-
 MODULE_IMPORT_NS("CRYPTO_INTERNAL");
 
 static int num_rounds(struct crypto_aes_ctx *ctx)
 {
 	/*
diff --git a/arch/arm64/crypto/aes-ce-glue.c b/arch/arm64/crypto/aes-ce-glue.c
deleted file mode 100644
index a4dad370991d..000000000000
--- a/arch/arm64/crypto/aes-ce-glue.c
+++ /dev/null
@@ -1,178 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*
- * aes-ce-cipher.c - core AES cipher using ARMv8 Crypto Extensions
- *
- * Copyright (C) 2013 - 2017 Linaro Ltd <ard.biesheuvel@linaro.org>
- */
-
-#include <asm/neon.h>
-#include <asm/simd.h>
-#include <linux/unaligned.h>
-#include <crypto/aes.h>
-#include <crypto/algapi.h>
-#include <crypto/internal/simd.h>
-#include <linux/cpufeature.h>
-#include <linux/module.h>
-
-#include "aes-ce-setkey.h"
-
-MODULE_DESCRIPTION("Synchronous AES cipher using ARMv8 Crypto Extensions");
-MODULE_AUTHOR("Ard Biesheuvel <ard.biesheuvel@linaro.org>");
-MODULE_LICENSE("GPL v2");
-
-struct aes_block {
-	u8 b[AES_BLOCK_SIZE];
-};
-
-asmlinkage void __aes_ce_encrypt(u32 *rk, u8 *out, const u8 *in, int rounds);
-asmlinkage void __aes_ce_decrypt(u32 *rk, u8 *out, const u8 *in, int rounds);
-
-asmlinkage u32 __aes_ce_sub(u32 l);
-asmlinkage void __aes_ce_invert(struct aes_block *out,
-				const struct aes_block *in);
-
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
-static void aes_cipher_encrypt(struct crypto_tfm *tfm, u8 dst[], u8 const src[])
-{
-	struct crypto_aes_ctx *ctx = crypto_tfm_ctx(tfm);
-
-	if (!crypto_simd_usable()) {
-		aes_encrypt(ctx, dst, src);
-		return;
-	}
-
-	scoped_ksimd()
-		__aes_ce_encrypt(ctx->key_enc, dst, src, num_rounds(ctx));
-}
-
-static void aes_cipher_decrypt(struct crypto_tfm *tfm, u8 dst[], u8 const src[])
-{
-	struct crypto_aes_ctx *ctx = crypto_tfm_ctx(tfm);
-
-	if (!crypto_simd_usable()) {
-		aes_decrypt(ctx, dst, src);
-		return;
-	}
-
-	scoped_ksimd()
-		__aes_ce_decrypt(ctx->key_dec, dst, src, num_rounds(ctx));
-}
-
-int ce_aes_expandkey(struct crypto_aes_ctx *ctx, const u8 *in_key,
-		     unsigned int key_len)
-{
-	/*
-	 * The AES key schedule round constants
-	 */
-	static u8 const rcon[] = {
-		0x01, 0x02, 0x04, 0x08, 0x10, 0x20, 0x40, 0x80, 0x1b, 0x36,
-	};
-
-	u32 kwords = key_len / sizeof(u32);
-	struct aes_block *key_enc, *key_dec;
-	int i, j;
-
-	if (key_len != AES_KEYSIZE_128 &&
-	    key_len != AES_KEYSIZE_192 &&
-	    key_len != AES_KEYSIZE_256)
-		return -EINVAL;
-
-	ctx->key_length = key_len;
-	for (i = 0; i < kwords; i++)
-		ctx->key_enc[i] = get_unaligned_le32(in_key + i * sizeof(u32));
-
-	scoped_ksimd() {
-		for (i = 0; i < sizeof(rcon); i++) {
-			u32 *rki = ctx->key_enc + (i * kwords);
-			u32 *rko = rki + kwords;
-
-			rko[0] = ror32(__aes_ce_sub(rki[kwords - 1]), 8) ^
-				 rcon[i] ^ rki[0];
-			rko[1] = rko[0] ^ rki[1];
-			rko[2] = rko[1] ^ rki[2];
-			rko[3] = rko[2] ^ rki[3];
-
-			if (key_len == AES_KEYSIZE_192) {
-				if (i >= 7)
-					break;
-				rko[4] = rko[3] ^ rki[4];
-				rko[5] = rko[4] ^ rki[5];
-			} else if (key_len == AES_KEYSIZE_256) {
-				if (i >= 6)
-					break;
-				rko[4] = __aes_ce_sub(rko[3]) ^ rki[4];
-				rko[5] = rko[4] ^ rki[5];
-				rko[6] = rko[5] ^ rki[6];
-				rko[7] = rko[6] ^ rki[7];
-			}
-		}
-
-		/*
-		 * Generate the decryption keys for the Equivalent Inverse
-		 * Cipher.  This involves reversing the order of the round
-		 * keys, and applying the Inverse Mix Columns transformation on
-		 * all but the first and the last one.
-		 */
-		key_enc = (struct aes_block *)ctx->key_enc;
-		key_dec = (struct aes_block *)ctx->key_dec;
-		j = num_rounds(ctx);
-
-		key_dec[0] = key_enc[j];
-		for (i = 1, j--; j > 0; i++, j--)
-			__aes_ce_invert(key_dec + i, key_enc + j);
-		key_dec[i] = key_enc[0];
-	}
-
-	return 0;
-}
-EXPORT_SYMBOL(ce_aes_expandkey);
-
-int ce_aes_setkey(struct crypto_tfm *tfm, const u8 *in_key,
-		  unsigned int key_len)
-{
-	struct crypto_aes_ctx *ctx = crypto_tfm_ctx(tfm);
-
-	return ce_aes_expandkey(ctx, in_key, key_len);
-}
-EXPORT_SYMBOL(ce_aes_setkey);
-
-static struct crypto_alg aes_alg = {
-	.cra_name		= "aes",
-	.cra_driver_name	= "aes-ce",
-	.cra_priority		= 250,
-	.cra_flags		= CRYPTO_ALG_TYPE_CIPHER,
-	.cra_blocksize		= AES_BLOCK_SIZE,
-	.cra_ctxsize		= sizeof(struct crypto_aes_ctx),
-	.cra_module		= THIS_MODULE,
-	.cra_cipher = {
-		.cia_min_keysize	= AES_MIN_KEY_SIZE,
-		.cia_max_keysize	= AES_MAX_KEY_SIZE,
-		.cia_setkey		= ce_aes_setkey,
-		.cia_encrypt		= aes_cipher_encrypt,
-		.cia_decrypt		= aes_cipher_decrypt
-	}
-};
-
-static int __init aes_mod_init(void)
-{
-	return crypto_register_alg(&aes_alg);
-}
-
-static void __exit aes_mod_exit(void)
-{
-	crypto_unregister_alg(&aes_alg);
-}
-
-module_cpu_feature_match(AES, aes_mod_init);
-module_exit(aes_mod_exit);
diff --git a/arch/arm64/crypto/aes-ce-setkey.h b/arch/arm64/crypto/aes-ce-setkey.h
deleted file mode 100644
index fd9ecf07d88c..000000000000
--- a/arch/arm64/crypto/aes-ce-setkey.h
+++ /dev/null
@@ -1,6 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-
-int ce_aes_setkey(struct crypto_tfm *tfm, const u8 *in_key,
-		  unsigned int key_len);
-int ce_aes_expandkey(struct crypto_aes_ctx *ctx, const u8 *in_key,
-		     unsigned int key_len);
diff --git a/arch/arm64/crypto/aes-cipher-glue.c b/arch/arm64/crypto/aes-cipher-glue.c
deleted file mode 100644
index 9b27cbac278b..000000000000
--- a/arch/arm64/crypto/aes-cipher-glue.c
+++ /dev/null
@@ -1,71 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*
- * Scalar AES core transform
- *
- * Copyright (C) 2017 Linaro Ltd <ard.biesheuvel@linaro.org>
- */
-
-#include <crypto/aes.h>
-#include <crypto/algapi.h>
-#include <linux/module.h>
-
-asmlinkage void __aes_arm64_encrypt(u32 *rk, u8 *out, const u8 *in, int rounds);
-asmlinkage void __aes_arm64_decrypt(u32 *rk, u8 *out, const u8 *in, int rounds);
-
-static int aes_arm64_setkey(struct crypto_tfm *tfm, const u8 *in_key,
-			    unsigned int key_len)
-{
-	struct crypto_aes_ctx *ctx = crypto_tfm_ctx(tfm);
-
-	return aes_expandkey(ctx, in_key, key_len);
-}
-
-static void aes_arm64_encrypt(struct crypto_tfm *tfm, u8 *out, const u8 *in)
-{
-	struct crypto_aes_ctx *ctx = crypto_tfm_ctx(tfm);
-	int rounds = 6 + ctx->key_length / 4;
-
-	__aes_arm64_encrypt(ctx->key_enc, out, in, rounds);
-}
-
-static void aes_arm64_decrypt(struct crypto_tfm *tfm, u8 *out, const u8 *in)
-{
-	struct crypto_aes_ctx *ctx = crypto_tfm_ctx(tfm);
-	int rounds = 6 + ctx->key_length / 4;
-
-	__aes_arm64_decrypt(ctx->key_dec, out, in, rounds);
-}
-
-static struct crypto_alg aes_alg = {
-	.cra_name			= "aes",
-	.cra_driver_name		= "aes-arm64",
-	.cra_priority			= 200,
-	.cra_flags			= CRYPTO_ALG_TYPE_CIPHER,
-	.cra_blocksize			= AES_BLOCK_SIZE,
-	.cra_ctxsize			= sizeof(struct crypto_aes_ctx),
-	.cra_module			= THIS_MODULE,
-
-	.cra_cipher.cia_min_keysize	= AES_MIN_KEY_SIZE,
-	.cra_cipher.cia_max_keysize	= AES_MAX_KEY_SIZE,
-	.cra_cipher.cia_setkey		= aes_arm64_setkey,
-	.cra_cipher.cia_encrypt		= aes_arm64_encrypt,
-	.cra_cipher.cia_decrypt		= aes_arm64_decrypt
-};
-
-static int __init aes_init(void)
-{
-	return crypto_register_alg(&aes_alg);
-}
-
-static void __exit aes_fini(void)
-{
-	crypto_unregister_alg(&aes_alg);
-}
-
-module_init(aes_init);
-module_exit(aes_fini);
-
-MODULE_DESCRIPTION("Scalar AES cipher for arm64");
-MODULE_AUTHOR("Ard Biesheuvel <ard.biesheuvel@linaro.org>");
-MODULE_LICENSE("GPL v2");
-MODULE_ALIAS_CRYPTO("aes");
diff --git a/arch/arm64/crypto/aes-glue.c b/arch/arm64/crypto/aes-glue.c
index c51d4487e9e9..92f43e1cd097 100644
--- a/arch/arm64/crypto/aes-glue.c
+++ b/arch/arm64/crypto/aes-glue.c
@@ -19,12 +19,10 @@
 #include <linux/string.h>
 
 #include <asm/hwcap.h>
 #include <asm/simd.h>
 
-#include "aes-ce-setkey.h"
-
 #ifdef USE_V8_CRYPTO_EXTENSIONS
 #define MODE			"ce"
 #define PRIO			300
 #define aes_expandkey		ce_aes_expandkey
 #define aes_ecb_encrypt		ce_aes_ecb_encrypt
diff --git a/include/crypto/aes.h b/include/crypto/aes.h
index 66421795cdab..18af1acbde58 100644
--- a/include/crypto/aes.h
+++ b/include/crypto/aes.h
@@ -114,10 +114,20 @@ static inline int aes_check_keylen(size_t keylen)
  * for the initial combination, the second slot for the first round and so on.
  */
 int aes_expandkey(struct crypto_aes_ctx *ctx, const u8 *in_key,
 		  unsigned int key_len);
 
+/*
+ * The following functions are temporarily exported for use by the AES mode
+ * implementations in arch/$(SRCARCH)/crypto/.  These exports will go away when
+ * that code is migrated into lib/crypto/.
+ */
+#ifdef CONFIG_ARM64
+int ce_aes_expandkey(struct crypto_aes_ctx *ctx, const u8 *in_key,
+		     unsigned int key_len);
+#endif
+
 /**
  * aes_preparekey() - Prepare an AES key for encryption and decryption
  * @key: (output) The key structure to initialize
  * @in_key: The raw AES key
  * @key_len: Length of the raw key in bytes.  Should be either AES_KEYSIZE_128,
diff --git a/lib/crypto/Kconfig b/lib/crypto/Kconfig
index 60420b421e04..ead47b2a7db6 100644
--- a/lib/crypto/Kconfig
+++ b/lib/crypto/Kconfig
@@ -13,10 +13,11 @@ config CRYPTO_LIB_AES
 
 config CRYPTO_LIB_AES_ARCH
 	bool
 	depends on CRYPTO_LIB_AES && !UML && !KMSAN
 	default y if ARM
+	default y if ARM64
 
 config CRYPTO_LIB_AESCFB
 	tristate
 	select CRYPTO_LIB_AES
 	select CRYPTO_LIB_UTILS
diff --git a/lib/crypto/Makefile b/lib/crypto/Makefile
index 2f6b0f59eb1b..1b690c63fafb 100644
--- a/lib/crypto/Makefile
+++ b/lib/crypto/Makefile
@@ -22,10 +22,15 @@ libaes-y := aes.o
 ifeq ($(CONFIG_CRYPTO_LIB_AES_ARCH),y)
 CFLAGS_aes.o += -I$(src)/$(SRCARCH)
 
 libaes-$(CONFIG_ARM) += arm/aes-cipher-core.o
 
+ifeq ($(CONFIG_ARM64),y)
+libaes-y += arm64/aes-cipher-core.o
+libaes-$(CONFIG_KERNEL_MODE_NEON) += arm64/aes-ce-core.o
+endif
+
 endif # CONFIG_CRYPTO_LIB_AES_ARCH
 
 ################################################################################
 
 obj-$(CONFIG_CRYPTO_LIB_AESCFB)			+= libaescfb.o
diff --git a/arch/arm64/crypto/aes-ce-core.S b/lib/crypto/arm64/aes-ce-core.S
similarity index 100%
rename from arch/arm64/crypto/aes-ce-core.S
rename to lib/crypto/arm64/aes-ce-core.S
diff --git a/arch/arm64/crypto/aes-cipher-core.S b/lib/crypto/arm64/aes-cipher-core.S
similarity index 100%
rename from arch/arm64/crypto/aes-cipher-core.S
rename to lib/crypto/arm64/aes-cipher-core.S
diff --git a/lib/crypto/arm64/aes.h b/lib/crypto/arm64/aes.h
new file mode 100644
index 000000000000..63eea6271ef9
--- /dev/null
+++ b/lib/crypto/arm64/aes.h
@@ -0,0 +1,164 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * AES block cipher, optimized for ARM64
+ *
+ * Copyright (C) 2013 - 2017 Linaro Ltd <ard.biesheuvel@linaro.org>
+ * Copyright 2026 Google LLC
+ */
+
+#include <asm/neon.h>
+#include <asm/simd.h>
+#include <linux/unaligned.h>
+#include <linux/cpufeature.h>
+
+static __ro_after_init DEFINE_STATIC_KEY_FALSE(have_aes);
+
+struct aes_block {
+	u8 b[AES_BLOCK_SIZE];
+};
+
+asmlinkage void __aes_arm64_encrypt(const u32 rk[], u8 out[AES_BLOCK_SIZE],
+				    const u8 in[AES_BLOCK_SIZE], int rounds);
+asmlinkage void __aes_arm64_decrypt(const u32 inv_rk[], u8 out[AES_BLOCK_SIZE],
+				    const u8 in[AES_BLOCK_SIZE], int rounds);
+asmlinkage void __aes_ce_encrypt(const u32 rk[], u8 out[AES_BLOCK_SIZE],
+				 const u8 in[AES_BLOCK_SIZE], int rounds);
+asmlinkage void __aes_ce_decrypt(const u32 inv_rk[], u8 out[AES_BLOCK_SIZE],
+				 const u8 in[AES_BLOCK_SIZE], int rounds);
+asmlinkage u32 __aes_ce_sub(u32 l);
+asmlinkage void __aes_ce_invert(struct aes_block *out,
+				const struct aes_block *in);
+
+/*
+ * Expand an AES key using the crypto extensions if supported and usable or
+ * generic code otherwise.  The expanded key format is compatible between the
+ * two cases.  The outputs are @rndkeys (required) and @inv_rndkeys (optional).
+ */
+static void aes_expandkey_arm64(u32 rndkeys[], u32 *inv_rndkeys,
+				const u8 *in_key, int key_len, int nrounds)
+{
+	/*
+	 * The AES key schedule round constants
+	 */
+	static u8 const rcon[] = {
+		0x01, 0x02, 0x04, 0x08, 0x10, 0x20, 0x40, 0x80, 0x1b, 0x36,
+	};
+
+	u32 kwords = key_len / sizeof(u32);
+	struct aes_block *key_enc, *key_dec;
+	int i, j;
+
+	if (!IS_ENABLED(CONFIG_KERNEL_MODE_NEON) ||
+	    !static_branch_likely(&have_aes) || unlikely(!may_use_simd())) {
+		aes_expandkey_generic(rndkeys, inv_rndkeys, in_key, key_len);
+		return;
+	}
+
+	for (i = 0; i < kwords; i++)
+		rndkeys[i] = get_unaligned_le32(&in_key[i * sizeof(u32)]);
+
+	scoped_ksimd() {
+		for (i = 0; i < sizeof(rcon); i++) {
+			u32 *rki = &rndkeys[i * kwords];
+			u32 *rko = rki + kwords;
+
+			rko[0] = ror32(__aes_ce_sub(rki[kwords - 1]), 8) ^
+				 rcon[i] ^ rki[0];
+			rko[1] = rko[0] ^ rki[1];
+			rko[2] = rko[1] ^ rki[2];
+			rko[3] = rko[2] ^ rki[3];
+
+			if (key_len == AES_KEYSIZE_192) {
+				if (i >= 7)
+					break;
+				rko[4] = rko[3] ^ rki[4];
+				rko[5] = rko[4] ^ rki[5];
+			} else if (key_len == AES_KEYSIZE_256) {
+				if (i >= 6)
+					break;
+				rko[4] = __aes_ce_sub(rko[3]) ^ rki[4];
+				rko[5] = rko[4] ^ rki[5];
+				rko[6] = rko[5] ^ rki[6];
+				rko[7] = rko[6] ^ rki[7];
+			}
+		}
+
+		/*
+		 * Generate the decryption keys for the Equivalent Inverse
+		 * Cipher.  This involves reversing the order of the round
+		 * keys, and applying the Inverse Mix Columns transformation on
+		 * all but the first and the last one.
+		 */
+		if (inv_rndkeys) {
+			key_enc = (struct aes_block *)rndkeys;
+			key_dec = (struct aes_block *)inv_rndkeys;
+			j = nrounds;
+
+			key_dec[0] = key_enc[j];
+			for (i = 1, j--; j > 0; i++, j--)
+				__aes_ce_invert(key_dec + i, key_enc + j);
+			key_dec[i] = key_enc[0];
+		}
+	}
+}
+
+static void aes_preparekey_arch(union aes_enckey_arch *k,
+				union aes_invkey_arch *inv_k,
+				const u8 *in_key, int key_len, int nrounds)
+{
+	aes_expandkey_arm64(k->rndkeys, inv_k ? inv_k->inv_rndkeys : NULL,
+			    in_key, key_len, nrounds);
+}
+
+/*
+ * This is here temporarily until the remaining AES mode implementations are
+ * migrated from arch/arm64/crypto/ to lib/crypto/arm64/.
+ */
+int ce_aes_expandkey(struct crypto_aes_ctx *ctx, const u8 *in_key,
+		     unsigned int key_len)
+{
+	if (aes_check_keylen(key_len) != 0)
+		return -EINVAL;
+	ctx->key_length = key_len;
+	aes_expandkey_arm64(ctx->key_enc, ctx->key_dec, in_key, key_len,
+			    6 + key_len / 4);
+	return 0;
+}
+EXPORT_SYMBOL(ce_aes_expandkey);
+
+static void aes_encrypt_arch(const struct aes_enckey *key,
+			     u8 out[AES_BLOCK_SIZE],
+			     const u8 in[AES_BLOCK_SIZE])
+{
+	if (IS_ENABLED(CONFIG_KERNEL_MODE_NEON) &&
+	    static_branch_likely(&have_aes) && likely(may_use_simd())) {
+		scoped_ksimd()
+			__aes_ce_encrypt(key->k.rndkeys, out, in, key->nrounds);
+	} else {
+		__aes_arm64_encrypt(key->k.rndkeys, out, in, key->nrounds);
+	}
+}
+
+static void aes_decrypt_arch(const struct aes_key *key,
+			     u8 out[AES_BLOCK_SIZE],
+			     const u8 in[AES_BLOCK_SIZE])
+{
+	if (IS_ENABLED(CONFIG_KERNEL_MODE_NEON) &&
+	    static_branch_likely(&have_aes) && likely(may_use_simd())) {
+		scoped_ksimd()
+			__aes_ce_decrypt(key->inv_k.inv_rndkeys, out, in,
+					 key->nrounds);
+	} else {
+		__aes_arm64_decrypt(key->inv_k.inv_rndkeys, out, in,
+				    key->nrounds);
+	}
+}
+
+#ifdef CONFIG_KERNEL_MODE_NEON
+#define aes_mod_init_arch aes_mod_init_arch
+static void aes_mod_init_arch(void)
+{
+	if (cpu_have_named_feature(AES))
+		static_branch_enable(&have_aes);
+}
+#endif /* CONFIG_KERNEL_MODE_NEON */
-- 
2.52.0


