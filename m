Return-Path: <linuxppc-dev+bounces-15583-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5593FD14FBF
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Jan 2026 20:27:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dqj3g02kfz3btn;
	Tue, 13 Jan 2026 06:23:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768245838;
	cv=none; b=A44xJ1iNk5NvgMi6ujpY2nFZdjuS7olkHcnQevqBJElPPaYiLNReevOL011XI1oJSyFue+t8wxQd3ivC9kiBASJjhNc7AZRkEute6NWqRetpw/tjK+Y9Xg+5c2RX54jj8Fat5P7Ql6Z8GbT8eE1kdhulENdX/cnEzdEUg0oQzu5mpkTMe1Zbccs13BtOQaAnB55FT7twdlwufV7zE2eSBU3P90vC9GSzSzDh61nawZ4Bksn5mZs8DG4avBAqGZnLhKN+oK4n+C2/0oDmUC4issf1utLMc46yf+nScFRSLjayADtfiio0CMJ9ABzF06QGI50sSCymcqa1cIB+fh3fKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768245838; c=relaxed/relaxed;
	bh=SEoENnWUcb8l0Cmsrhzc+Gdxwbk1lpPM3wnRuQBpEso=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=g3OoyDaggmvkvanVMazb2LzWW6zVF/jY6KA+BSBSF1nxexqBCnX5gBtk4XzMm4b9hP29xa2JHMpHmHIfYN3UguF09IzvAAGbCONG8yHqNcCS6+7xwq+XdbEtxDtMKQXsYCR6Nbh9oIb8+9rnsMiA3hrqO7DLGfexR3pGGXyfgvPlZhaFCoNU64V+cpEfFmHeKm7vC60ttVw6SoPJ+/Gtz8NplZcmwi7mm9JtfCuvui8/v5n3iPtmFaGNLTmGXUE3wSchuDG4RjrOlkqTA5s8tWPEJzPnWWIHhSiBwg8G0VeHOEQgXbeDMQR3e5jE44esZbHvXf5bSJpOg5YDEb6/nQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=pqT16Xv5; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=pqT16Xv5;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dqj3d3dF5z3c3H
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Jan 2026 06:23:57 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id CD15040630;
	Mon, 12 Jan 2026 19:23:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4252DC19422;
	Mon, 12 Jan 2026 19:23:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768245805;
	bh=cAzlxjnfetAXICKQEDRHR7jpw8oC/uEaOKgrdLNR7pI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pqT16Xv5y39AtbmZYAgOkHjMWCOa/h4oZZmyTmq0R4g9MqhPim0TUNaaIMF0+v9ze
	 GsnV3fuIps6KEtb87qL3FbYr4EoQRM/M3VAguchs2auk6wcNXGZufbX69abPZcPkE8
	 63X9xxnUfPinp28JVmVSIvjQwFrH2cjGKSUmGsbqcqb6CB9JzwtJWlifgMRYUPfn9x
	 8fadfn9CewGB62+Zhn7oxXxU+VERktjR06ce8npPtrH9id1Uk2Ln4g3wqaDda2OXVU
	 TaY3zHzfmGReU8xSJEBgbYZxPy9gnv3tR6lhLF7/x0I/eXHUD6QwSY9Ux/LB6ZBgIK
	 sYxHbcLk1xb5Q==
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
Subject: [PATCH v2 14/35] lib/crypto: riscv/aes: Migrate optimized code into library
Date: Mon, 12 Jan 2026 11:20:12 -0800
Message-ID: <20260112192035.10427-15-ebiggers@kernel.org>
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Move the aes_encrypt_zvkned() and aes_decrypt_zvkned() assembly
functions into lib/crypto/, wire them up to the AES library API, and
remove the "aes-riscv64-zvkned" crypto_cipher algorithm.

To make this possible, change the prototypes of these functions to
take (rndkeys, key_len) instead of a pointer to crypto_aes_ctx, and
change the RISC-V AES-XTS code to implement tweak encryption using the
AES library instead of directly calling aes_encrypt_zvkned().

The result is that both the AES library and crypto_cipher APIs use
RISC-V's AES instructions, whereas previously only crypto_cipher did
(and it wasn't enabled by default, which this commit fixes as well).

Acked-by: Ard Biesheuvel <ardb@kernel.org>
Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 arch/riscv/crypto/Kconfig              |  2 -
 arch/riscv/crypto/aes-macros.S         | 12 +++-
 arch/riscv/crypto/aes-riscv64-glue.c   | 81 ++-----------------------
 arch/riscv/crypto/aes-riscv64-zvkned.S | 27 ---------
 lib/crypto/Kconfig                     |  2 +
 lib/crypto/Makefile                    |  1 +
 lib/crypto/riscv/aes-riscv64-zvkned.S  | 84 ++++++++++++++++++++++++++
 lib/crypto/riscv/aes.h                 | 63 +++++++++++++++++++
 8 files changed, 166 insertions(+), 106 deletions(-)
 create mode 100644 lib/crypto/riscv/aes-riscv64-zvkned.S
 create mode 100644 lib/crypto/riscv/aes.h

diff --git a/arch/riscv/crypto/Kconfig b/arch/riscv/crypto/Kconfig
index 14c5acb935e9..22d4eaab15f3 100644
--- a/arch/riscv/crypto/Kconfig
+++ b/arch/riscv/crypto/Kconfig
@@ -4,15 +4,13 @@ menu "Accelerated Cryptographic Algorithms for CPU (riscv)"
 
 config CRYPTO_AES_RISCV64
 	tristate "Ciphers: AES, modes: ECB, CBC, CTS, CTR, XTS"
 	depends on 64BIT && TOOLCHAIN_HAS_VECTOR_CRYPTO && \
 		   RISCV_EFFICIENT_VECTOR_UNALIGNED_ACCESS
-	select CRYPTO_ALGAPI
 	select CRYPTO_LIB_AES
 	select CRYPTO_SKCIPHER
 	help
-	  Block cipher: AES cipher algorithms
 	  Length-preserving ciphers: AES with ECB, CBC, CTS, CTR, XTS
 
 	  Architecture: riscv64 using:
 	  - Zvkned vector crypto extension
 	  - Zvbb vector extension (XTS)
diff --git a/arch/riscv/crypto/aes-macros.S b/arch/riscv/crypto/aes-macros.S
index d1a258d04bc7..1384164621a5 100644
--- a/arch/riscv/crypto/aes-macros.S
+++ b/arch/riscv/crypto/aes-macros.S
@@ -49,12 +49,14 @@
 //   - If AES-128, loads round keys into v1-v11 and jumps to \label128.
 //   - If AES-192, loads round keys into v1-v13 and jumps to \label192.
 //   - If AES-256, loads round keys into v1-v15 and continues onwards.
 //
 // Also sets vl=4 and vtype=e32,m1,ta,ma.  Clobbers t0 and t1.
-.macro	aes_begin	keyp, label128, label192
+.macro	aes_begin	keyp, label128, label192, key_len
+.ifb \key_len
 	lwu		t0, 480(\keyp)	// t0 = key length in bytes
+.endif
 	li		t1, 24		// t1 = key length for AES-192
 	vsetivli	zero, 4, e32, m1, ta, ma
 	vle32.v		v1, (\keyp)
 	addi		\keyp, \keyp, 16
 	vle32.v		v2, (\keyp)
@@ -74,16 +76,24 @@
 	vle32.v		v9, (\keyp)
 	addi		\keyp, \keyp, 16
 	vle32.v		v10, (\keyp)
 	addi		\keyp, \keyp, 16
 	vle32.v		v11, (\keyp)
+.ifb \key_len
 	blt		t0, t1, \label128	// If AES-128, goto label128.
+.else
+	blt		\key_len, t1, \label128	// If AES-128, goto label128.
+.endif
 	addi		\keyp, \keyp, 16
 	vle32.v		v12, (\keyp)
 	addi		\keyp, \keyp, 16
 	vle32.v		v13, (\keyp)
+.ifb \key_len
 	beq		t0, t1, \label192	// If AES-192, goto label192.
+.else
+	beq		\key_len, t1, \label192	// If AES-192, goto label192.
+.endif
 	// Else, it's AES-256.
 	addi		\keyp, \keyp, 16
 	vle32.v		v14, (\keyp)
 	addi		\keyp, \keyp, 16
 	vle32.v		v15, (\keyp)
diff --git a/arch/riscv/crypto/aes-riscv64-glue.c b/arch/riscv/crypto/aes-riscv64-glue.c
index f814ee048555..8bbf7f348c23 100644
--- a/arch/riscv/crypto/aes-riscv64-glue.c
+++ b/arch/riscv/crypto/aes-riscv64-glue.c
@@ -1,9 +1,8 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * AES using the RISC-V vector crypto extensions.  Includes the bare block
- * cipher and the ECB, CBC, CBC-CTS, CTR, and XTS modes.
+ * AES modes using the RISC-V vector crypto extensions
  *
  * Copyright (C) 2023 VRULL GmbH
  * Author: Heiko Stuebner <heiko.stuebner@vrull.eu>
  *
  * Copyright (C) 2023 SiFive, Inc.
@@ -13,25 +12,17 @@
  */
 
 #include <asm/simd.h>
 #include <asm/vector.h>
 #include <crypto/aes.h>
-#include <crypto/internal/cipher.h>
 #include <crypto/internal/simd.h>
 #include <crypto/internal/skcipher.h>
 #include <crypto/scatterwalk.h>
 #include <crypto/xts.h>
 #include <linux/linkage.h>
 #include <linux/module.h>
 
-asmlinkage void aes_encrypt_zvkned(const struct crypto_aes_ctx *key,
-				   const u8 in[AES_BLOCK_SIZE],
-				   u8 out[AES_BLOCK_SIZE]);
-asmlinkage void aes_decrypt_zvkned(const struct crypto_aes_ctx *key,
-				   const u8 in[AES_BLOCK_SIZE],
-				   u8 out[AES_BLOCK_SIZE]);
-
 asmlinkage void aes_ecb_encrypt_zvkned(const struct crypto_aes_ctx *key,
 				       const u8 *in, u8 *out, size_t len);
 asmlinkage void aes_ecb_decrypt_zvkned(const struct crypto_aes_ctx *key,
 				       const u8 *in, u8 *out, size_t len);
 
@@ -84,54 +75,18 @@ static int riscv64_aes_setkey(struct crypto_aes_ctx *ctx,
 	 *   struct crypto_aes_ctx and aes_expandkey() everywhere.
 	 */
 	return aes_expandkey(ctx, key, keylen);
 }
 
-static int riscv64_aes_setkey_cipher(struct crypto_tfm *tfm,
-				     const u8 *key, unsigned int keylen)
-{
-	struct crypto_aes_ctx *ctx = crypto_tfm_ctx(tfm);
-
-	return riscv64_aes_setkey(ctx, key, keylen);
-}
-
 static int riscv64_aes_setkey_skcipher(struct crypto_skcipher *tfm,
 				       const u8 *key, unsigned int keylen)
 {
 	struct crypto_aes_ctx *ctx = crypto_skcipher_ctx(tfm);
 
 	return riscv64_aes_setkey(ctx, key, keylen);
 }
 
-/* Bare AES, without a mode of operation */
-
-static void riscv64_aes_encrypt(struct crypto_tfm *tfm, u8 *dst, const u8 *src)
-{
-	const struct crypto_aes_ctx *ctx = crypto_tfm_ctx(tfm);
-
-	if (crypto_simd_usable()) {
-		kernel_vector_begin();
-		aes_encrypt_zvkned(ctx, src, dst);
-		kernel_vector_end();
-	} else {
-		aes_encrypt(ctx, dst, src);
-	}
-}
-
-static void riscv64_aes_decrypt(struct crypto_tfm *tfm, u8 *dst, const u8 *src)
-{
-	const struct crypto_aes_ctx *ctx = crypto_tfm_ctx(tfm);
-
-	if (crypto_simd_usable()) {
-		kernel_vector_begin();
-		aes_decrypt_zvkned(ctx, src, dst);
-		kernel_vector_end();
-	} else {
-		aes_decrypt(ctx, dst, src);
-	}
-}
-
 /* AES-ECB */
 
 static inline int riscv64_aes_ecb_crypt(struct skcipher_request *req, bool enc)
 {
 	struct crypto_skcipher *tfm = crypto_skcipher_reqtfm(req);
@@ -336,21 +291,21 @@ static int riscv64_aes_ctr_crypt(struct skcipher_request *req)
 
 /* AES-XTS */
 
 struct riscv64_aes_xts_ctx {
 	struct crypto_aes_ctx ctx1;
-	struct crypto_aes_ctx ctx2;
+	struct aes_enckey tweak_key;
 };
 
 static int riscv64_aes_xts_setkey(struct crypto_skcipher *tfm, const u8 *key,
 				  unsigned int keylen)
 {
 	struct riscv64_aes_xts_ctx *ctx = crypto_skcipher_ctx(tfm);
 
 	return xts_verify_key(tfm, key, keylen) ?:
 	       riscv64_aes_setkey(&ctx->ctx1, key, keylen / 2) ?:
-	       riscv64_aes_setkey(&ctx->ctx2, key + keylen / 2, keylen / 2);
+	       aes_prepareenckey(&ctx->tweak_key, key + keylen / 2, keylen / 2);
 }
 
 static int riscv64_aes_xts_crypt(struct skcipher_request *req, bool enc)
 {
 	struct crypto_skcipher *tfm = crypto_skcipher_reqtfm(req);
@@ -364,13 +319,11 @@ static int riscv64_aes_xts_crypt(struct skcipher_request *req, bool enc)
 
 	if (req->cryptlen < AES_BLOCK_SIZE)
 		return -EINVAL;
 
 	/* Encrypt the IV with the tweak key to get the first tweak. */
-	kernel_vector_begin();
-	aes_encrypt_zvkned(&ctx->ctx2, req->iv, req->iv);
-	kernel_vector_end();
+	aes_encrypt(&ctx->tweak_key, req->iv, req->iv);
 
 	err = skcipher_walk_virt(&walk, req, false);
 
 	/*
 	 * If the message length isn't divisible by the AES block size and the
@@ -454,27 +407,10 @@ static int riscv64_aes_xts_decrypt(struct skcipher_request *req)
 	return riscv64_aes_xts_crypt(req, false);
 }
 
 /* Algorithm definitions */
 
-static struct crypto_alg riscv64_zvkned_aes_cipher_alg = {
-	.cra_flags = CRYPTO_ALG_TYPE_CIPHER,
-	.cra_blocksize = AES_BLOCK_SIZE,
-	.cra_ctxsize = sizeof(struct crypto_aes_ctx),
-	.cra_priority = 300,
-	.cra_name = "aes",
-	.cra_driver_name = "aes-riscv64-zvkned",
-	.cra_cipher = {
-		.cia_min_keysize = AES_MIN_KEY_SIZE,
-		.cia_max_keysize = AES_MAX_KEY_SIZE,
-		.cia_setkey = riscv64_aes_setkey_cipher,
-		.cia_encrypt = riscv64_aes_encrypt,
-		.cia_decrypt = riscv64_aes_decrypt,
-	},
-	.cra_module = THIS_MODULE,
-};
-
 static struct skcipher_alg riscv64_zvkned_aes_skcipher_algs[] = {
 	{
 		.setkey = riscv64_aes_setkey_skcipher,
 		.encrypt = riscv64_aes_ecb_encrypt,
 		.decrypt = riscv64_aes_ecb_decrypt,
@@ -572,19 +508,15 @@ static int __init riscv64_aes_mod_init(void)
 {
 	int err = -ENODEV;
 
 	if (riscv_isa_extension_available(NULL, ZVKNED) &&
 	    riscv_vector_vlen() >= 128) {
-		err = crypto_register_alg(&riscv64_zvkned_aes_cipher_alg);
-		if (err)
-			return err;
-
 		err = crypto_register_skciphers(
 			riscv64_zvkned_aes_skcipher_algs,
 			ARRAY_SIZE(riscv64_zvkned_aes_skcipher_algs));
 		if (err)
-			goto unregister_zvkned_cipher_alg;
+			return err;
 
 		if (riscv_isa_extension_available(NULL, ZVKB)) {
 			err = crypto_register_skcipher(
 				&riscv64_zvkned_zvkb_aes_skcipher_alg);
 			if (err)
@@ -605,12 +537,10 @@ static int __init riscv64_aes_mod_init(void)
 	if (riscv_isa_extension_available(NULL, ZVKB))
 		crypto_unregister_skcipher(&riscv64_zvkned_zvkb_aes_skcipher_alg);
 unregister_zvkned_skcipher_algs:
 	crypto_unregister_skciphers(riscv64_zvkned_aes_skcipher_algs,
 				    ARRAY_SIZE(riscv64_zvkned_aes_skcipher_algs));
-unregister_zvkned_cipher_alg:
-	crypto_unregister_alg(&riscv64_zvkned_aes_cipher_alg);
 	return err;
 }
 
 static void __exit riscv64_aes_mod_exit(void)
 {
@@ -618,11 +548,10 @@ static void __exit riscv64_aes_mod_exit(void)
 		crypto_unregister_skcipher(&riscv64_zvkned_zvbb_zvkg_aes_skcipher_alg);
 	if (riscv_isa_extension_available(NULL, ZVKB))
 		crypto_unregister_skcipher(&riscv64_zvkned_zvkb_aes_skcipher_alg);
 	crypto_unregister_skciphers(riscv64_zvkned_aes_skcipher_algs,
 				    ARRAY_SIZE(riscv64_zvkned_aes_skcipher_algs));
-	crypto_unregister_alg(&riscv64_zvkned_aes_cipher_alg);
 }
 
 module_init(riscv64_aes_mod_init);
 module_exit(riscv64_aes_mod_exit);
 
diff --git a/arch/riscv/crypto/aes-riscv64-zvkned.S b/arch/riscv/crypto/aes-riscv64-zvkned.S
index 23d063f94ce6..d0fc4581a380 100644
--- a/arch/riscv/crypto/aes-riscv64-zvkned.S
+++ b/arch/riscv/crypto/aes-riscv64-zvkned.S
@@ -54,37 +54,10 @@
 #define INP		a1
 #define OUTP		a2
 #define LEN		a3
 #define IVP		a4
 
-.macro	__aes_crypt_zvkned	enc, keylen
-	vle32.v		v16, (INP)
-	aes_crypt	v16, \enc, \keylen
-	vse32.v		v16, (OUTP)
-	ret
-.endm
-
-.macro	aes_crypt_zvkned	enc
-	aes_begin	KEYP, 128f, 192f
-	__aes_crypt_zvkned	\enc, 256
-128:
-	__aes_crypt_zvkned	\enc, 128
-192:
-	__aes_crypt_zvkned	\enc, 192
-.endm
-
-// void aes_encrypt_zvkned(const struct crypto_aes_ctx *key,
-//			   const u8 in[16], u8 out[16]);
-SYM_FUNC_START(aes_encrypt_zvkned)
-	aes_crypt_zvkned	1
-SYM_FUNC_END(aes_encrypt_zvkned)
-
-// Same prototype and calling convention as the encryption function
-SYM_FUNC_START(aes_decrypt_zvkned)
-	aes_crypt_zvkned	0
-SYM_FUNC_END(aes_decrypt_zvkned)
-
 .macro	__aes_ecb_crypt	enc, keylen
 	srli		t0, LEN, 2
 	// t0 is the remaining length in 32-bit words.  It's a multiple of 4.
 1:
 	vsetvli		t1, t0, e32, m8, ta, ma
diff --git a/lib/crypto/Kconfig b/lib/crypto/Kconfig
index a0f1c105827e..2690b5ffc5ca 100644
--- a/lib/crypto/Kconfig
+++ b/lib/crypto/Kconfig
@@ -15,10 +15,12 @@ config CRYPTO_LIB_AES_ARCH
 	bool
 	depends on CRYPTO_LIB_AES && !UML && !KMSAN
 	default y if ARM
 	default y if ARM64
 	default y if PPC && (SPE || (PPC64 && VSX))
+	default y if RISCV && 64BIT && TOOLCHAIN_HAS_VECTOR_CRYPTO && \
+		     RISCV_EFFICIENT_VECTOR_UNALIGNED_ACCESS
 
 config CRYPTO_LIB_AESCFB
 	tristate
 	select CRYPTO_LIB_AES
 	select CRYPTO_LIB_UTILS
diff --git a/lib/crypto/Makefile b/lib/crypto/Makefile
index 16140616ace8..811b60787dd5 100644
--- a/lib/crypto/Makefile
+++ b/lib/crypto/Makefile
@@ -48,10 +48,11 @@ $(obj)/powerpc/aesp8-ppc.S: $(src)/powerpc/aesp8-ppc.pl FORCE
 targets += powerpc/aesp8-ppc.S
 OBJECT_FILES_NON_STANDARD_powerpc/aesp8-ppc.o := y
 endif # !CONFIG_SPE
 endif # CONFIG_PPC
 
+libaes-$(CONFIG_RISCV) += riscv/aes-riscv64-zvkned.o
 endif # CONFIG_CRYPTO_LIB_AES_ARCH
 
 ################################################################################
 
 obj-$(CONFIG_CRYPTO_LIB_AESCFB)			+= libaescfb.o
diff --git a/lib/crypto/riscv/aes-riscv64-zvkned.S b/lib/crypto/riscv/aes-riscv64-zvkned.S
new file mode 100644
index 000000000000..0d988bc3d37b
--- /dev/null
+++ b/lib/crypto/riscv/aes-riscv64-zvkned.S
@@ -0,0 +1,84 @@
+/* SPDX-License-Identifier: Apache-2.0 OR BSD-2-Clause */
+//
+// This file is dual-licensed, meaning that you can use it under your
+// choice of either of the following two licenses:
+//
+// Copyright 2023 The OpenSSL Project Authors. All Rights Reserved.
+//
+// Licensed under the Apache License 2.0 (the "License"). You can obtain
+// a copy in the file LICENSE in the source distribution or at
+// https://www.openssl.org/source/license.html
+//
+// or
+//
+// Copyright (c) 2023, Christoph Müllner <christoph.muellner@vrull.eu>
+// Copyright (c) 2023, Phoebe Chen <phoebe.chen@sifive.com>
+// Copyright (c) 2023, Jerry Shih <jerry.shih@sifive.com>
+// Copyright 2024 Google LLC
+// All rights reserved.
+//
+// Redistribution and use in source and binary forms, with or without
+// modification, are permitted provided that the following conditions
+// are met:
+// 1. Redistributions of source code must retain the above copyright
+//    notice, this list of conditions and the following disclaimer.
+// 2. Redistributions in binary form must reproduce the above copyright
+//    notice, this list of conditions and the following disclaimer in the
+//    documentation and/or other materials provided with the distribution.
+//
+// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
+// "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
+// LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
+// A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
+// OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
+// SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
+// LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
+// DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
+// THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
+// (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
+// OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
+
+// The generated code of this file depends on the following RISC-V extensions:
+// - RV64I
+// - RISC-V Vector ('V') with VLEN >= 128
+// - RISC-V Vector AES block cipher extension ('Zvkned')
+
+#include <linux/linkage.h>
+
+.text
+.option arch, +zvkned
+
+#include "../../arch/riscv/crypto/aes-macros.S"
+
+#define RNDKEYS		a0
+#define KEY_LEN		a1
+#define OUTP		a2
+#define INP		a3
+
+.macro	__aes_crypt_zvkned	enc, keybits
+	vle32.v		v16, (INP)
+	aes_crypt	v16, \enc, \keybits
+	vse32.v		v16, (OUTP)
+	ret
+.endm
+
+.macro	aes_crypt_zvkned	enc
+	aes_begin	RNDKEYS, 128f, 192f, KEY_LEN
+	__aes_crypt_zvkned	\enc, 256
+128:
+	__aes_crypt_zvkned	\enc, 128
+192:
+	__aes_crypt_zvkned	\enc, 192
+.endm
+
+// void aes_encrypt_zvkned(const u32 rndkeys[], int key_len,
+//			   u8 out[AES_BLOCK_SIZE], const u8 in[AES_BLOCK_SIZE]);
+SYM_FUNC_START(aes_encrypt_zvkned)
+	aes_crypt_zvkned	1
+SYM_FUNC_END(aes_encrypt_zvkned)
+
+// void aes_decrypt_zvkned(const u32 rndkeys[], int key_len,
+//			   u8 out[AES_BLOCK_SIZE], const u8 in[AES_BLOCK_SIZE]);
+SYM_FUNC_START(aes_decrypt_zvkned)
+	aes_crypt_zvkned	0
+SYM_FUNC_END(aes_decrypt_zvkned)
diff --git a/lib/crypto/riscv/aes.h b/lib/crypto/riscv/aes.h
new file mode 100644
index 000000000000..0b26f58faf2b
--- /dev/null
+++ b/lib/crypto/riscv/aes.h
@@ -0,0 +1,63 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2023 VRULL GmbH
+ * Copyright (C) 2023 SiFive, Inc.
+ * Copyright 2024 Google LLC
+ */
+
+#include <asm/simd.h>
+#include <asm/vector.h>
+
+static __ro_after_init DEFINE_STATIC_KEY_FALSE(have_zvkned);
+
+void aes_encrypt_zvkned(const u32 rndkeys[], int key_len,
+			u8 out[AES_BLOCK_SIZE], const u8 in[AES_BLOCK_SIZE]);
+void aes_decrypt_zvkned(const u32 rndkeys[], int key_len,
+			u8 out[AES_BLOCK_SIZE], const u8 in[AES_BLOCK_SIZE]);
+
+static void aes_preparekey_arch(union aes_enckey_arch *k,
+				union aes_invkey_arch *inv_k,
+				const u8 *in_key, int key_len, int nrounds)
+{
+	aes_expandkey_generic(k->rndkeys, inv_k ? inv_k->inv_rndkeys : NULL,
+			      in_key, key_len);
+}
+
+static void aes_encrypt_arch(const struct aes_enckey *key,
+			     u8 out[AES_BLOCK_SIZE],
+			     const u8 in[AES_BLOCK_SIZE])
+{
+	if (static_branch_likely(&have_zvkned) && likely(may_use_simd())) {
+		kernel_vector_begin();
+		aes_encrypt_zvkned(key->k.rndkeys, key->len, out, in);
+		kernel_vector_end();
+	} else {
+		aes_encrypt_generic(key->k.rndkeys, key->nrounds, out, in);
+	}
+}
+
+static void aes_decrypt_arch(const struct aes_key *key,
+			     u8 out[AES_BLOCK_SIZE],
+			     const u8 in[AES_BLOCK_SIZE])
+{
+	/*
+	 * Note that the Zvkned code uses the standard round keys, while the
+	 * fallback uses the inverse round keys.  Thus both must be present.
+	 */
+	if (static_branch_likely(&have_zvkned) && likely(may_use_simd())) {
+		kernel_vector_begin();
+		aes_decrypt_zvkned(key->k.rndkeys, key->len, out, in);
+		kernel_vector_end();
+	} else {
+		aes_decrypt_generic(key->inv_k.inv_rndkeys, key->nrounds,
+				    out, in);
+	}
+}
+
+#define aes_mod_init_arch aes_mod_init_arch
+static void aes_mod_init_arch(void)
+{
+	if (riscv_isa_extension_available(NULL, ZVKNED) &&
+	    riscv_vector_vlen() >= 128)
+		static_branch_enable(&have_zvkned);
+}
-- 
2.52.0


