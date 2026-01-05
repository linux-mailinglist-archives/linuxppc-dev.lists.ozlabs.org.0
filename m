Return-Path: <linuxppc-dev+bounces-15234-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C10ECCF1EB5
	for <lists+linuxppc-dev@lfdr.de>; Mon, 05 Jan 2026 06:18:54 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dl2Yt0y0mz3c9r;
	Mon, 05 Jan 2026 16:15:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767590130;
	cv=none; b=E9ekuWEtlTYEaKIBsO2ke6grTmszeqRkjdhOyVwTHcHjSJwrHChA/oUBQKpEvjNuxAo1gopxKj07cFqK11dNt2XbDrjG8AvD+J/wa+TU3d56QOFgcSqb0p/w3ouQnOkmzzgDa7VzKasg/4v4ZcGzq4c7KMBMrl6QeLCBU6rUHLMZpT5a3jhWkf7OoQnpsos7zlXV5uS6xAS7lam7JEPHZIW+o3fdKWdkbrUqKZxedPuMNqspGacuFy3aOlqhyDR9Z/cxfsYIqWvQwhEJpZoTdsftm1yKck/jRgfoL4zpDk/e5MgH+kgz3VXywEdgCFyMkPDncB/JzKMn53eWpv6PlA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767590130; c=relaxed/relaxed;
	bh=1vFpskkvE7yi1CSBx0uhD8mHY4K/cHD4kqGzh0CZLQs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QuCbtK6l2KlcMdlg+djn9MDxbGHfEOyo1xlpecke8VD8gwCW69+DZf7ySRxLKcbXK3rkWJajQalQ6IdrC/vVpr3EO0ZVrqxvyx1c/6xiqNRwCBLrKN5KD/QGW5ryxohG7IY93w39W3Dc7zHxahrS9c5n+DUABu5SL+obpIylzow0dIgqss7NQOlsPKQevZEeYgDau7vjqCFeTswGD6JzlO0xiZdDDHVdUGGzQ7nYxieaaPI++Ohy/Y6+tsknGKQ1grvJojfwFKvoREVEoUtJLve7VnpAkH3JozXKwe+U0UdbYAC3btlQYHlQFoPmYVO5bx0psvWKnGkEKQd+63aC7A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=acifyOuM; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=acifyOuM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dl2Ys27lXz3c4f
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 05 Jan 2026 16:15:29 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B3D4D4432E;
	Mon,  5 Jan 2026 05:14:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11392C19424;
	Mon,  5 Jan 2026 05:14:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767590097;
	bh=YHtCJIQFFdHC7NMz4h3U1SYbX8oaMRF3XLm74aKrthE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=acifyOuMNPZ1+9MCfHthBDX1fIU4pTiB1hFanESbOBHsMwnazd2v6JreTam+jmGtS
	 A79atWQbTo9L7SwmBPLnW1a7tESsYaeMJfXrzHCAPr7Xszi/9tuixz7DU5G7ZoU73l
	 xitBJVPyCKf+iy9+3ZDM2pmB9QoyeW5uVjZYTq5RFvTjFuAUnTKnyKu807vLr7jK4J
	 PcOeJDHLP9RscTN+QrdUmzufpdJYQ573Zqj+1vsEJSmWyaPRYv/H2n/wvLfziPsIJs
	 tr/QBpuABOwcnPaVQeEB6RJqn3Y3N+fRxq3TqozuR89Eu27dYNxUtKHg0YKHAeFir9
	 lRHOLcgLeNoRA==
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
Subject: [PATCH 12/36] lib/crypto: powerpc/aes: Migrate SPE optimized code into library
Date: Sun,  4 Jan 2026 21:12:45 -0800
Message-ID: <20260105051311.1607207-13-ebiggers@kernel.org>
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

Move the PowerPC SPE AES assembly code into lib/crypto/, wire the key
expansion and single-block en/decryption functions up to the AES library
API, and remove the superseded "aes-ppc-spe" crypto_cipher algorithm.

The result is that both the AES library and crypto_cipher APIs are now
optimized with SPE, whereas previously only crypto_cipher was (and
optimizations weren't enabled by default, which this commit fixes too).

Note that many of the functions in the PowerPC SPE assembly code are
still used by the AES mode implementations in arch/powerpc/crypto/.  For
now, just export these functions.  These exports will go away once the
AES modes are migrated to the library as well.  (Trying to split up the
assembly files seemed like much more trouble than it would be worth.)

Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 arch/powerpc/crypto/Kconfig                   |  2 +-
 arch/powerpc/crypto/Makefile                  |  2 +-
 arch/powerpc/crypto/aes-spe-glue.c            | 88 ++-----------------
 include/crypto/aes.h                          | 31 +++++++
 lib/crypto/Kconfig                            |  1 +
 lib/crypto/Makefile                           |  9 ++
 .../crypto/powerpc}/aes-spe-core.S            |  0
 .../crypto/powerpc}/aes-spe-keys.S            |  0
 .../crypto/powerpc}/aes-spe-modes.S           |  0
 .../crypto/powerpc}/aes-spe-regs.h            |  0
 .../crypto/powerpc}/aes-tab-4k.S              |  0
 lib/crypto/powerpc/aes.h                      | 74 ++++++++++++++++
 12 files changed, 122 insertions(+), 85 deletions(-)
 rename {arch/powerpc/crypto => lib/crypto/powerpc}/aes-spe-core.S (100%)
 rename {arch/powerpc/crypto => lib/crypto/powerpc}/aes-spe-keys.S (100%)
 rename {arch/powerpc/crypto => lib/crypto/powerpc}/aes-spe-modes.S (100%)
 rename {arch/powerpc/crypto => lib/crypto/powerpc}/aes-spe-regs.h (100%)
 rename {arch/powerpc/crypto => lib/crypto/powerpc}/aes-tab-4k.S (100%)
 create mode 100644 lib/crypto/powerpc/aes.h

diff --git a/arch/powerpc/crypto/Kconfig b/arch/powerpc/crypto/Kconfig
index 662aed46f9c7..2d056f1fc90f 100644
--- a/arch/powerpc/crypto/Kconfig
+++ b/arch/powerpc/crypto/Kconfig
@@ -3,13 +3,13 @@
 menu "Accelerated Cryptographic Algorithms for CPU (powerpc)"
 
 config CRYPTO_AES_PPC_SPE
 	tristate "Ciphers: AES, modes: ECB/CBC/CTR/XTS (SPE)"
 	depends on SPE
+	select CRYPTO_LIB_AES
 	select CRYPTO_SKCIPHER
 	help
-	  Block ciphers: AES cipher algorithms (FIPS-197)
 	  Length-preserving ciphers: AES with ECB, CBC, CTR, and XTS modes
 
 	  Architecture: powerpc using:
 	  - SPE (Signal Processing Engine) extensions
 
diff --git a/arch/powerpc/crypto/Makefile b/arch/powerpc/crypto/Makefile
index 5960e5300db7..e22310da86b5 100644
--- a/arch/powerpc/crypto/Makefile
+++ b/arch/powerpc/crypto/Makefile
@@ -7,11 +7,11 @@
 
 obj-$(CONFIG_CRYPTO_AES_PPC_SPE) += aes-ppc-spe.o
 obj-$(CONFIG_CRYPTO_AES_GCM_P10) += aes-gcm-p10-crypto.o
 obj-$(CONFIG_CRYPTO_DEV_VMX_ENCRYPT) += vmx-crypto.o
 
-aes-ppc-spe-y := aes-spe-core.o aes-spe-keys.o aes-tab-4k.o aes-spe-modes.o aes-spe-glue.o
+aes-ppc-spe-y := aes-spe-glue.o
 aes-gcm-p10-crypto-y := aes-gcm-p10-glue.o aes-gcm-p10.o ghashp10-ppc.o aesp10-ppc.o
 vmx-crypto-objs := vmx.o aesp8-ppc.o ghashp8-ppc.o aes.o aes_cbc.o aes_ctr.o aes_xts.o ghash.o
 
 ifeq ($(CONFIG_CPU_LITTLE_ENDIAN),y)
 override flavour := linux-ppc64le
diff --git a/arch/powerpc/crypto/aes-spe-glue.c b/arch/powerpc/crypto/aes-spe-glue.c
index efab78a3a8f6..7d2827e65240 100644
--- a/arch/powerpc/crypto/aes-spe-glue.c
+++ b/arch/powerpc/crypto/aes-spe-glue.c
@@ -49,34 +49,10 @@ struct ppc_xts_ctx {
 	u32 key_dec[AES_MAX_KEYLENGTH_U32];
 	u32 key_twk[AES_MAX_KEYLENGTH_U32];
 	u32 rounds;
 };
 
-extern void ppc_encrypt_aes(u8 *out, const u8 *in, u32 *key_enc, u32 rounds);
-extern void ppc_decrypt_aes(u8 *out, const u8 *in, u32 *key_dec, u32 rounds);
-extern void ppc_encrypt_ecb(u8 *out, const u8 *in, u32 *key_enc, u32 rounds,
-			    u32 bytes);
-extern void ppc_decrypt_ecb(u8 *out, const u8 *in, u32 *key_dec, u32 rounds,
-			    u32 bytes);
-extern void ppc_encrypt_cbc(u8 *out, const u8 *in, u32 *key_enc, u32 rounds,
-			    u32 bytes, u8 *iv);
-extern void ppc_decrypt_cbc(u8 *out, const u8 *in, u32 *key_dec, u32 rounds,
-			    u32 bytes, u8 *iv);
-extern void ppc_crypt_ctr  (u8 *out, const u8 *in, u32 *key_enc, u32 rounds,
-			    u32 bytes, u8 *iv);
-extern void ppc_encrypt_xts(u8 *out, const u8 *in, u32 *key_enc, u32 rounds,
-			    u32 bytes, u8 *iv, u32 *key_twk);
-extern void ppc_decrypt_xts(u8 *out, const u8 *in, u32 *key_dec, u32 rounds,
-			    u32 bytes, u8 *iv, u32 *key_twk);
-
-extern void ppc_expand_key_128(u32 *key_enc, const u8 *key);
-extern void ppc_expand_key_192(u32 *key_enc, const u8 *key);
-extern void ppc_expand_key_256(u32 *key_enc, const u8 *key);
-
-extern void ppc_generate_decrypt_key(u32 *key_dec,u32 *key_enc,
-				     unsigned int key_len);
-
 static void spe_begin(void)
 {
 	/* disable preemption and save users SPE registers if required */
 	preempt_disable();
 	enable_kernel_spe();
@@ -87,14 +63,14 @@ static void spe_end(void)
 	disable_kernel_spe();
 	/* reenable preemption */
 	preempt_enable();
 }
 
-static int ppc_aes_setkey(struct crypto_tfm *tfm, const u8 *in_key,
-		unsigned int key_len)
+static int ppc_aes_setkey_skcipher(struct crypto_skcipher *tfm,
+				   const u8 *in_key, unsigned int key_len)
 {
-	struct ppc_aes_ctx *ctx = crypto_tfm_ctx(tfm);
+	struct ppc_aes_ctx *ctx = crypto_skcipher_ctx(tfm);
 
 	switch (key_len) {
 	case AES_KEYSIZE_128:
 		ctx->rounds = 4;
 		ppc_expand_key_128(ctx->key_enc, in_key);
@@ -114,16 +90,10 @@ static int ppc_aes_setkey(struct crypto_tfm *tfm, const u8 *in_key,
 	ppc_generate_decrypt_key(ctx->key_dec, ctx->key_enc, key_len);
 
 	return 0;
 }
 
-static int ppc_aes_setkey_skcipher(struct crypto_skcipher *tfm,
-				   const u8 *in_key, unsigned int key_len)
-{
-	return ppc_aes_setkey(crypto_skcipher_tfm(tfm), in_key, key_len);
-}
-
 static int ppc_xts_setkey(struct crypto_skcipher *tfm, const u8 *in_key,
 		   unsigned int key_len)
 {
 	struct ppc_xts_ctx *ctx = crypto_skcipher_ctx(tfm);
 	int err;
@@ -157,28 +127,10 @@ static int ppc_xts_setkey(struct crypto_skcipher *tfm, const u8 *in_key,
 	ppc_generate_decrypt_key(ctx->key_dec, ctx->key_enc, key_len);
 
 	return 0;
 }
 
-static void ppc_aes_encrypt(struct crypto_tfm *tfm, u8 *out, const u8 *in)
-{
-	struct ppc_aes_ctx *ctx = crypto_tfm_ctx(tfm);
-
-	spe_begin();
-	ppc_encrypt_aes(out, in, ctx->key_enc, ctx->rounds);
-	spe_end();
-}
-
-static void ppc_aes_decrypt(struct crypto_tfm *tfm, u8 *out, const u8 *in)
-{
-	struct ppc_aes_ctx *ctx = crypto_tfm_ctx(tfm);
-
-	spe_begin();
-	ppc_decrypt_aes(out, in, ctx->key_dec, ctx->rounds);
-	spe_end();
-}
-
 static int ppc_ecb_crypt(struct skcipher_request *req, bool enc)
 {
 	struct crypto_skcipher *tfm = crypto_skcipher_reqtfm(req);
 	struct ppc_aes_ctx *ctx = crypto_skcipher_ctx(tfm);
 	struct skcipher_walk walk;
@@ -408,30 +360,10 @@ static int ppc_xts_decrypt(struct skcipher_request *req)
  * This improves IPsec thoughput by another few percent. Additionally we assume
  * that AES context is always aligned to at least 8 bytes because it is created
  * with kmalloc() in the crypto infrastructure
  */
 
-static struct crypto_alg aes_cipher_alg = {
-	.cra_name		=	"aes",
-	.cra_driver_name	=	"aes-ppc-spe",
-	.cra_priority		=	300,
-	.cra_flags		=	CRYPTO_ALG_TYPE_CIPHER,
-	.cra_blocksize		=	AES_BLOCK_SIZE,
-	.cra_ctxsize		=	sizeof(struct ppc_aes_ctx),
-	.cra_alignmask		=	0,
-	.cra_module		=	THIS_MODULE,
-	.cra_u			=	{
-		.cipher = {
-			.cia_min_keysize	=	AES_MIN_KEY_SIZE,
-			.cia_max_keysize	=	AES_MAX_KEY_SIZE,
-			.cia_setkey		=	ppc_aes_setkey,
-			.cia_encrypt		=	ppc_aes_encrypt,
-			.cia_decrypt		=	ppc_aes_decrypt
-		}
-	}
-};
-
 static struct skcipher_alg aes_skcipher_algs[] = {
 	{
 		.base.cra_name		=	"ecb(aes)",
 		.base.cra_driver_name	=	"ecb-ppc-spe",
 		.base.cra_priority	=	300,
@@ -486,26 +418,16 @@ static struct skcipher_alg aes_skcipher_algs[] = {
 	}
 };
 
 static int __init ppc_aes_mod_init(void)
 {
-	int err;
-
-	err = crypto_register_alg(&aes_cipher_alg);
-	if (err)
-		return err;
-
-	err = crypto_register_skciphers(aes_skcipher_algs,
-					ARRAY_SIZE(aes_skcipher_algs));
-	if (err)
-		crypto_unregister_alg(&aes_cipher_alg);
-	return err;
+	return crypto_register_skciphers(aes_skcipher_algs,
+					 ARRAY_SIZE(aes_skcipher_algs));
 }
 
 static void __exit ppc_aes_mod_fini(void)
 {
-	crypto_unregister_alg(&aes_cipher_alg);
 	crypto_unregister_skciphers(aes_skcipher_algs,
 				    ARRAY_SIZE(aes_skcipher_algs));
 }
 
 module_init(ppc_aes_mod_init);
diff --git a/include/crypto/aes.h b/include/crypto/aes.h
index 8a8dd100d8c6..49ce2d1e086e 100644
--- a/include/crypto/aes.h
+++ b/include/crypto/aes.h
@@ -18,14 +18,26 @@
 #define AES_MAX_KEYLENGTH	(15 * 16)
 #define AES_MAX_KEYLENGTH_U32	(AES_MAX_KEYLENGTH / sizeof(u32))
 
 union aes_enckey_arch {
 	u32 rndkeys[AES_MAX_KEYLENGTH_U32];
+#ifdef CONFIG_CRYPTO_LIB_AES_ARCH
+#if defined(CONFIG_PPC) && defined(CONFIG_SPE)
+	/* Used unconditionally (when SPE AES code is enabled in kconfig) */
+	u32 spe_enc_key[AES_MAX_KEYLENGTH_U32] __aligned(8);
+#endif
+#endif /* CONFIG_CRYPTO_LIB_AES_ARCH */
 };
 
 union aes_invkey_arch {
 	u32 inv_rndkeys[AES_MAX_KEYLENGTH_U32];
+#ifdef CONFIG_CRYPTO_LIB_AES_ARCH
+#if defined(CONFIG_PPC) && defined(CONFIG_SPE)
+	/* Used unconditionally (when SPE AES code is enabled in kconfig) */
+	u32 spe_dec_key[AES_MAX_KEYLENGTH_U32] __aligned(8);
+#endif
+#endif /* CONFIG_CRYPTO_LIB_AES_ARCH */
 };
 
 /**
  * struct aes_enckey - An AES key prepared for encryption
  * @len: Key length in bytes: 16 for AES-128, 24 for AES-192, 32 for AES-256.
@@ -122,10 +134,29 @@ int aes_expandkey(struct crypto_aes_ctx *ctx, const u8 *in_key,
  * that code is migrated into lib/crypto/.
  */
 #ifdef CONFIG_ARM64
 int ce_aes_expandkey(struct crypto_aes_ctx *ctx, const u8 *in_key,
 		     unsigned int key_len);
+#elif defined(CONFIG_PPC)
+void ppc_expand_key_128(u32 *key_enc, const u8 *key);
+void ppc_expand_key_192(u32 *key_enc, const u8 *key);
+void ppc_expand_key_256(u32 *key_enc, const u8 *key);
+void ppc_generate_decrypt_key(u32 *key_dec, u32 *key_enc, unsigned int key_len);
+void ppc_encrypt_ecb(u8 *out, const u8 *in, u32 *key_enc, u32 rounds,
+		     u32 bytes);
+void ppc_decrypt_ecb(u8 *out, const u8 *in, u32 *key_dec, u32 rounds,
+		     u32 bytes);
+void ppc_encrypt_cbc(u8 *out, const u8 *in, u32 *key_enc, u32 rounds, u32 bytes,
+		     u8 *iv);
+void ppc_decrypt_cbc(u8 *out, const u8 *in, u32 *key_dec, u32 rounds, u32 bytes,
+		     u8 *iv);
+void ppc_crypt_ctr(u8 *out, const u8 *in, u32 *key_enc, u32 rounds, u32 bytes,
+		   u8 *iv);
+void ppc_encrypt_xts(u8 *out, const u8 *in, u32 *key_enc, u32 rounds, u32 bytes,
+		     u8 *iv, u32 *key_twk);
+void ppc_decrypt_xts(u8 *out, const u8 *in, u32 *key_dec, u32 rounds, u32 bytes,
+		     u8 *iv, u32 *key_twk);
 #endif
 
 /**
  * aes_preparekey() - Prepare an AES key for encryption and decryption
  * @key: (output) The key structure to initialize
diff --git a/lib/crypto/Kconfig b/lib/crypto/Kconfig
index 2c620c004153..50057f534aec 100644
--- a/lib/crypto/Kconfig
+++ b/lib/crypto/Kconfig
@@ -14,10 +14,11 @@ config CRYPTO_LIB_AES
 config CRYPTO_LIB_AES_ARCH
 	bool
 	depends on CRYPTO_LIB_AES && !UML && !KMSAN
 	default y if ARM
 	default y if ARM64
+	default y if PPC && SPE
 
 config CRYPTO_LIB_AESCFB
 	tristate
 	select CRYPTO_LIB_AES
 	select CRYPTO_LIB_UTILS
diff --git a/lib/crypto/Makefile b/lib/crypto/Makefile
index 1b690c63fafb..d68fde004104 100644
--- a/lib/crypto/Makefile
+++ b/lib/crypto/Makefile
@@ -27,10 +27,19 @@ libaes-$(CONFIG_ARM) += arm/aes-cipher-core.o
 ifeq ($(CONFIG_ARM64),y)
 libaes-y += arm64/aes-cipher-core.o
 libaes-$(CONFIG_KERNEL_MODE_NEON) += arm64/aes-ce-core.o
 endif
 
+ifeq ($(CONFIG_PPC),y)
+ifeq ($(CONFIG_SPE),y)
+libaes-y += powerpc/aes-spe-core.o \
+	    powerpc/aes-spe-keys.o \
+	    powerpc/aes-spe-modes.o \
+	    powerpc/aes-tab-4k.o
+endif
+endif # CONFIG_PPC
+
 endif # CONFIG_CRYPTO_LIB_AES_ARCH
 
 ################################################################################
 
 obj-$(CONFIG_CRYPTO_LIB_AESCFB)			+= libaescfb.o
diff --git a/arch/powerpc/crypto/aes-spe-core.S b/lib/crypto/powerpc/aes-spe-core.S
similarity index 100%
rename from arch/powerpc/crypto/aes-spe-core.S
rename to lib/crypto/powerpc/aes-spe-core.S
diff --git a/arch/powerpc/crypto/aes-spe-keys.S b/lib/crypto/powerpc/aes-spe-keys.S
similarity index 100%
rename from arch/powerpc/crypto/aes-spe-keys.S
rename to lib/crypto/powerpc/aes-spe-keys.S
diff --git a/arch/powerpc/crypto/aes-spe-modes.S b/lib/crypto/powerpc/aes-spe-modes.S
similarity index 100%
rename from arch/powerpc/crypto/aes-spe-modes.S
rename to lib/crypto/powerpc/aes-spe-modes.S
diff --git a/arch/powerpc/crypto/aes-spe-regs.h b/lib/crypto/powerpc/aes-spe-regs.h
similarity index 100%
rename from arch/powerpc/crypto/aes-spe-regs.h
rename to lib/crypto/powerpc/aes-spe-regs.h
diff --git a/arch/powerpc/crypto/aes-tab-4k.S b/lib/crypto/powerpc/aes-tab-4k.S
similarity index 100%
rename from arch/powerpc/crypto/aes-tab-4k.S
rename to lib/crypto/powerpc/aes-tab-4k.S
diff --git a/lib/crypto/powerpc/aes.h b/lib/crypto/powerpc/aes.h
new file mode 100644
index 000000000000..cf22020f9050
--- /dev/null
+++ b/lib/crypto/powerpc/aes.h
@@ -0,0 +1,74 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2015 Markus Stockhausen <stockhausen@collogia.de>
+ * Copyright 2026 Google LLC
+ */
+#include <asm/simd.h>
+#include <asm/switch_to.h>
+#include <linux/cpufeature.h>
+#include <linux/jump_label.h>
+#include <linux/preempt.h>
+#include <linux/uaccess.h>
+
+EXPORT_SYMBOL_GPL(ppc_expand_key_128);
+EXPORT_SYMBOL_GPL(ppc_expand_key_192);
+EXPORT_SYMBOL_GPL(ppc_expand_key_256);
+EXPORT_SYMBOL_GPL(ppc_generate_decrypt_key);
+EXPORT_SYMBOL_GPL(ppc_encrypt_ecb);
+EXPORT_SYMBOL_GPL(ppc_decrypt_ecb);
+EXPORT_SYMBOL_GPL(ppc_encrypt_cbc);
+EXPORT_SYMBOL_GPL(ppc_decrypt_cbc);
+EXPORT_SYMBOL_GPL(ppc_crypt_ctr);
+EXPORT_SYMBOL_GPL(ppc_encrypt_xts);
+EXPORT_SYMBOL_GPL(ppc_decrypt_xts);
+
+void ppc_encrypt_aes(u8 *out, const u8 *in, const u32 *key_enc, u32 rounds);
+void ppc_decrypt_aes(u8 *out, const u8 *in, const u32 *key_dec, u32 rounds);
+
+static void spe_begin(void)
+{
+	/* disable preemption and save users SPE registers if required */
+	preempt_disable();
+	enable_kernel_spe();
+}
+
+static void spe_end(void)
+{
+	disable_kernel_spe();
+	/* reenable preemption */
+	preempt_enable();
+}
+
+static void aes_preparekey_arch(union aes_enckey_arch *k,
+				union aes_invkey_arch *inv_k,
+				const u8 *in_key, int key_len, int nrounds)
+{
+	if (key_len == AES_KEYSIZE_128)
+		ppc_expand_key_128(k->spe_enc_key, in_key);
+	else if (key_len == AES_KEYSIZE_192)
+		ppc_expand_key_192(k->spe_enc_key, in_key);
+	else
+		ppc_expand_key_256(k->spe_enc_key, in_key);
+
+	if (inv_k)
+		ppc_generate_decrypt_key(inv_k->spe_dec_key, k->spe_enc_key,
+					 key_len);
+}
+
+static void aes_encrypt_arch(const struct aes_enckey *key,
+			     u8 out[AES_BLOCK_SIZE],
+			     const u8 in[AES_BLOCK_SIZE])
+{
+	spe_begin();
+	ppc_encrypt_aes(out, in, key->k.spe_enc_key, key->nrounds / 2 - 1);
+	spe_end();
+}
+
+static void aes_decrypt_arch(const struct aes_key *key,
+			     u8 out[AES_BLOCK_SIZE],
+			     const u8 in[AES_BLOCK_SIZE])
+{
+	spe_begin();
+	ppc_decrypt_aes(out, in, key->inv_k.spe_dec_key, key->nrounds / 2 - 1);
+	spe_end();
+}
-- 
2.52.0


