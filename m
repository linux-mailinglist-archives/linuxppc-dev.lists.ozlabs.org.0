Return-Path: <linuxppc-dev+bounces-15584-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 96D97D14FC8
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Jan 2026 20:27:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dqj3h2Phmz3cR2;
	Tue, 13 Jan 2026 06:24:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768245840;
	cv=none; b=iJFPk4uITENLxA9X93M8DUuMuCki8bT05Z3RmpuNmx5JXbRy9+jIeRH/+p72kUYaAOInu2fw6BEVf+nSUuSieknMx8cajP3fe9YGj8jPpFXS2gWhFQcZ0hPotWO5HSoTwsI7dj6ELHs9q2X0iZCHlSNAVcEBB+ntB+OCKCUuoFfxoKZYNLe97POt2LcX0sh00bh2pStBr/K47KchuIdPQCy4fQnK9ALW/LgICxfhX4c2oSi325lkRGZUa8y5zmfHoKLVyYeVbHvnx9+S3+aSE5bnlal+nD/tASdiM+NOiB/UeMlHKK59wqCRiiNIOXjAh6k/o2QJ+ib/WjGytjHwxw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768245840; c=relaxed/relaxed;
	bh=EorFE+xpV+RBa9joeaHj/cD2ImfvzWYT1Y7O0LNfVUM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fOlGEynzmM7+CwZvGHxKdbR4mNR4zVrattlqaQFtuHS4rthKqgMzjdI6hh4tE+MEwHRkGljjTOWRql+vIkDemCor2OxzKODaV6EM5GFAbdLEqempsuwwVWN2cJfdjJ6wPGE10MzXaa7sMSvkJWEy4vvULBE5JiLtVsAUhhAppcDjK/CblZzgQE26+9L+ErS9j0y1fhnUiFY8bIBXWvjTm0l1+lME84GPjAIprO9nPiJ1UsrPIrfOwBeKIPPCbG7Xtq+UnHgZlcudksZ7Has3Mb7XXOvF/LFsfZm0L7micbMhxV4Y1QL1yQXaVWW/CEGrkegSiBSrXZHzjevjdR8Z2Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=JCiiPnjj; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=JCiiPnjj;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dqj3g1YD4z3c4r
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Jan 2026 06:23:59 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1455E600B0;
	Mon, 12 Jan 2026 19:23:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CBEEC19422;
	Mon, 12 Jan 2026 19:23:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768245806;
	bh=7nOYA53rVKMBmiYRkvB3gnI+C0K7bNCp4etYWtVMyvo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JCiiPnjjYlBeQyBWozdPIX+saMsvrJDEwgu7dCuRuMYKMU5NfFnoTo81iuxS6B0qC
	 4q4ZiTRDFFYuB+fTDc8vQ7hWs774CWcR8W3dbXQ8aytn4kABvXAzr8WlQXM4JoYxlU
	 XNWFOfSbTaoplp9MJxqnTJGs+xT2bWZCP9kWRafQsQl1E2RSxblIZMnCwsKzl52LYC
	 JxfRuNsSuxOrWYKzYs3O/uIlMM3oEPMZlVtbIXEYyqCiHgdAWTrPudPemkJlwjJo0f
	 dGgAtB1bvdlOrNaCQhrul5JBAgrJ0v5lL8EcwReKQSR6ArkoPVrPXmgyttqLkev26g
	 vZN91kqQejenw==
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
Subject: [PATCH v2 16/35] lib/crypto: sparc/aes: Migrate optimized code into library
Date: Mon, 12 Jan 2026 11:20:14 -0800
Message-ID: <20260112192035.10427-17-ebiggers@kernel.org>
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

Move the SPARC64 AES assembly code into lib/crypto/, wire the key
expansion and single-block en/decryption functions up to the AES library
API, and remove the "aes-sparc64" crypto_cipher algorithm.

The result is that both the AES library and crypto_cipher APIs use the
SPARC64 AES opcodes, whereas previously only crypto_cipher did (and it
wasn't enabled by default, which this commit fixes as well).

Note that some of the functions in the SPARC64 AES assembly code are
still used by the AES mode implementations in
arch/sparc/crypto/aes_glue.c.  For now, just export these functions.
These exports will go away once the AES mode implementations are
migrated to the library as well.  (Trying to split up the assembly file
seemed like much more trouble than it would be worth.)

Acked-by: Ard Biesheuvel <ardb@kernel.org>
Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 arch/sparc/crypto/Kconfig                     |   2 +-
 arch/sparc/crypto/Makefile                    |   2 +-
 arch/sparc/crypto/aes_glue.c                  | 140 +---------------
 include/crypto/aes.h                          |  42 +++++
 lib/crypto/Kconfig                            |   1 +
 lib/crypto/Makefile                           |   1 +
 lib/crypto/sparc/aes.h                        | 149 ++++++++++++++++++
 .../crypto => lib/crypto/sparc}/aes_asm.S     |   0
 8 files changed, 200 insertions(+), 137 deletions(-)
 create mode 100644 lib/crypto/sparc/aes.h
 rename {arch/sparc/crypto => lib/crypto/sparc}/aes_asm.S (100%)

diff --git a/arch/sparc/crypto/Kconfig b/arch/sparc/crypto/Kconfig
index f755da979534..c1932ce46c7f 100644
--- a/arch/sparc/crypto/Kconfig
+++ b/arch/sparc/crypto/Kconfig
@@ -17,13 +17,13 @@ config CRYPTO_DES_SPARC64
 	  Architecture: sparc64
 
 config CRYPTO_AES_SPARC64
 	tristate "Ciphers: AES, modes: ECB, CBC, CTR"
 	depends on SPARC64
+	select CRYPTO_LIB_AES
 	select CRYPTO_SKCIPHER
 	help
-	  Block ciphers: AES cipher algorithms (FIPS-197)
 	  Length-preseving ciphers: AES with ECB, CBC, and CTR modes
 
 	  Architecture: sparc64 using crypto instructions
 
 config CRYPTO_CAMELLIA_SPARC64
diff --git a/arch/sparc/crypto/Makefile b/arch/sparc/crypto/Makefile
index 7b4796842ddd..cdf9f4b3efbb 100644
--- a/arch/sparc/crypto/Makefile
+++ b/arch/sparc/crypto/Makefile
@@ -5,8 +5,8 @@
 
 obj-$(CONFIG_CRYPTO_AES_SPARC64) += aes-sparc64.o
 obj-$(CONFIG_CRYPTO_DES_SPARC64) += des-sparc64.o
 obj-$(CONFIG_CRYPTO_CAMELLIA_SPARC64) += camellia-sparc64.o
 
-aes-sparc64-y := aes_asm.o aes_glue.o
+aes-sparc64-y := aes_glue.o
 des-sparc64-y := des_asm.o des_glue.o
 camellia-sparc64-y := camellia_asm.o camellia_glue.o
diff --git a/arch/sparc/crypto/aes_glue.c b/arch/sparc/crypto/aes_glue.c
index 359f22643b05..661561837415 100644
--- a/arch/sparc/crypto/aes_glue.c
+++ b/arch/sparc/crypto/aes_glue.c
@@ -30,12 +30,10 @@
 #include <asm/opcodes.h>
 #include <asm/pstate.h>
 #include <asm/elf.h>
 
 struct aes_ops {
-	void (*encrypt)(const u64 *key, const u32 *input, u32 *output);
-	void (*decrypt)(const u64 *key, const u32 *input, u32 *output);
 	void (*load_encrypt_keys)(const u64 *key);
 	void (*load_decrypt_keys)(const u64 *key);
 	void (*ecb_encrypt)(const u64 *key, const u64 *input, u64 *output,
 			    unsigned int len);
 	void (*ecb_decrypt)(const u64 *key, const u64 *input, u64 *output,
@@ -53,123 +51,44 @@ struct crypto_sparc64_aes_ctx {
 	u64 key[AES_MAX_KEYLENGTH / sizeof(u64)];
 	u32 key_length;
 	u32 expanded_key_length;
 };
 
-extern void aes_sparc64_encrypt_128(const u64 *key, const u32 *input,
-				    u32 *output);
-extern void aes_sparc64_encrypt_192(const u64 *key, const u32 *input,
-				    u32 *output);
-extern void aes_sparc64_encrypt_256(const u64 *key, const u32 *input,
-				    u32 *output);
-
-extern void aes_sparc64_decrypt_128(const u64 *key, const u32 *input,
-				    u32 *output);
-extern void aes_sparc64_decrypt_192(const u64 *key, const u32 *input,
-				    u32 *output);
-extern void aes_sparc64_decrypt_256(const u64 *key, const u32 *input,
-				    u32 *output);
-
-extern void aes_sparc64_load_encrypt_keys_128(const u64 *key);
-extern void aes_sparc64_load_encrypt_keys_192(const u64 *key);
-extern void aes_sparc64_load_encrypt_keys_256(const u64 *key);
-
-extern void aes_sparc64_load_decrypt_keys_128(const u64 *key);
-extern void aes_sparc64_load_decrypt_keys_192(const u64 *key);
-extern void aes_sparc64_load_decrypt_keys_256(const u64 *key);
-
-extern void aes_sparc64_ecb_encrypt_128(const u64 *key, const u64 *input,
-					u64 *output, unsigned int len);
-extern void aes_sparc64_ecb_encrypt_192(const u64 *key, const u64 *input,
-					u64 *output, unsigned int len);
-extern void aes_sparc64_ecb_encrypt_256(const u64 *key, const u64 *input,
-					u64 *output, unsigned int len);
-
-extern void aes_sparc64_ecb_decrypt_128(const u64 *key, const u64 *input,
-					u64 *output, unsigned int len);
-extern void aes_sparc64_ecb_decrypt_192(const u64 *key, const u64 *input,
-					u64 *output, unsigned int len);
-extern void aes_sparc64_ecb_decrypt_256(const u64 *key, const u64 *input,
-					u64 *output, unsigned int len);
-
-extern void aes_sparc64_cbc_encrypt_128(const u64 *key, const u64 *input,
-					u64 *output, unsigned int len,
-					u64 *iv);
-
-extern void aes_sparc64_cbc_encrypt_192(const u64 *key, const u64 *input,
-					u64 *output, unsigned int len,
-					u64 *iv);
-
-extern void aes_sparc64_cbc_encrypt_256(const u64 *key, const u64 *input,
-					u64 *output, unsigned int len,
-					u64 *iv);
-
-extern void aes_sparc64_cbc_decrypt_128(const u64 *key, const u64 *input,
-					u64 *output, unsigned int len,
-					u64 *iv);
-
-extern void aes_sparc64_cbc_decrypt_192(const u64 *key, const u64 *input,
-					u64 *output, unsigned int len,
-					u64 *iv);
-
-extern void aes_sparc64_cbc_decrypt_256(const u64 *key, const u64 *input,
-					u64 *output, unsigned int len,
-					u64 *iv);
-
-extern void aes_sparc64_ctr_crypt_128(const u64 *key, const u64 *input,
-				      u64 *output, unsigned int len,
-				      u64 *iv);
-extern void aes_sparc64_ctr_crypt_192(const u64 *key, const u64 *input,
-				      u64 *output, unsigned int len,
-				      u64 *iv);
-extern void aes_sparc64_ctr_crypt_256(const u64 *key, const u64 *input,
-				      u64 *output, unsigned int len,
-				      u64 *iv);
-
 static struct aes_ops aes128_ops = {
-	.encrypt		= aes_sparc64_encrypt_128,
-	.decrypt		= aes_sparc64_decrypt_128,
 	.load_encrypt_keys	= aes_sparc64_load_encrypt_keys_128,
 	.load_decrypt_keys	= aes_sparc64_load_decrypt_keys_128,
 	.ecb_encrypt		= aes_sparc64_ecb_encrypt_128,
 	.ecb_decrypt		= aes_sparc64_ecb_decrypt_128,
 	.cbc_encrypt		= aes_sparc64_cbc_encrypt_128,
 	.cbc_decrypt		= aes_sparc64_cbc_decrypt_128,
 	.ctr_crypt		= aes_sparc64_ctr_crypt_128,
 };
 
 static struct aes_ops aes192_ops = {
-	.encrypt		= aes_sparc64_encrypt_192,
-	.decrypt		= aes_sparc64_decrypt_192,
 	.load_encrypt_keys	= aes_sparc64_load_encrypt_keys_192,
 	.load_decrypt_keys	= aes_sparc64_load_decrypt_keys_192,
 	.ecb_encrypt		= aes_sparc64_ecb_encrypt_192,
 	.ecb_decrypt		= aes_sparc64_ecb_decrypt_192,
 	.cbc_encrypt		= aes_sparc64_cbc_encrypt_192,
 	.cbc_decrypt		= aes_sparc64_cbc_decrypt_192,
 	.ctr_crypt		= aes_sparc64_ctr_crypt_192,
 };
 
 static struct aes_ops aes256_ops = {
-	.encrypt		= aes_sparc64_encrypt_256,
-	.decrypt		= aes_sparc64_decrypt_256,
 	.load_encrypt_keys	= aes_sparc64_load_encrypt_keys_256,
 	.load_decrypt_keys	= aes_sparc64_load_decrypt_keys_256,
 	.ecb_encrypt		= aes_sparc64_ecb_encrypt_256,
 	.ecb_decrypt		= aes_sparc64_ecb_decrypt_256,
 	.cbc_encrypt		= aes_sparc64_cbc_encrypt_256,
 	.cbc_decrypt		= aes_sparc64_cbc_decrypt_256,
 	.ctr_crypt		= aes_sparc64_ctr_crypt_256,
 };
 
-extern void aes_sparc64_key_expand(const u32 *in_key, u64 *output_key,
-				   unsigned int key_len);
-
-static int aes_set_key(struct crypto_tfm *tfm, const u8 *in_key,
-		       unsigned int key_len)
+static int aes_set_key_skcipher(struct crypto_skcipher *tfm, const u8 *in_key,
+				unsigned int key_len)
 {
-	struct crypto_sparc64_aes_ctx *ctx = crypto_tfm_ctx(tfm);
+	struct crypto_sparc64_aes_ctx *ctx = crypto_skcipher_ctx(tfm);
 
 	switch (key_len) {
 	case AES_KEYSIZE_128:
 		ctx->expanded_key_length = 0xb0;
 		ctx->ops = &aes128_ops;
@@ -193,30 +112,10 @@ static int aes_set_key(struct crypto_tfm *tfm, const u8 *in_key,
 	ctx->key_length = key_len;
 
 	return 0;
 }
 
-static int aes_set_key_skcipher(struct crypto_skcipher *tfm, const u8 *in_key,
-				unsigned int key_len)
-{
-	return aes_set_key(crypto_skcipher_tfm(tfm), in_key, key_len);
-}
-
-static void crypto_aes_encrypt(struct crypto_tfm *tfm, u8 *dst, const u8 *src)
-{
-	struct crypto_sparc64_aes_ctx *ctx = crypto_tfm_ctx(tfm);
-
-	ctx->ops->encrypt(&ctx->key[0], (const u32 *) src, (u32 *) dst);
-}
-
-static void crypto_aes_decrypt(struct crypto_tfm *tfm, u8 *dst, const u8 *src)
-{
-	struct crypto_sparc64_aes_ctx *ctx = crypto_tfm_ctx(tfm);
-
-	ctx->ops->decrypt(&ctx->key[0], (const u32 *) src, (u32 *) dst);
-}
-
 static int ecb_encrypt(struct skcipher_request *req)
 {
 	struct crypto_skcipher *tfm = crypto_skcipher_reqtfm(req);
 	const struct crypto_sparc64_aes_ctx *ctx = crypto_skcipher_ctx(tfm);
 	struct skcipher_walk walk;
@@ -356,30 +255,10 @@ static int ctr_crypt(struct skcipher_request *req)
 	}
 	fprs_write(0);
 	return err;
 }
 
-static struct crypto_alg cipher_alg = {
-	.cra_name		= "aes",
-	.cra_driver_name	= "aes-sparc64",
-	.cra_priority		= SPARC_CR_OPCODE_PRIORITY,
-	.cra_flags		= CRYPTO_ALG_TYPE_CIPHER,
-	.cra_blocksize		= AES_BLOCK_SIZE,
-	.cra_ctxsize		= sizeof(struct crypto_sparc64_aes_ctx),
-	.cra_alignmask		= 3,
-	.cra_module		= THIS_MODULE,
-	.cra_u	= {
-		.cipher	= {
-			.cia_min_keysize	= AES_MIN_KEY_SIZE,
-			.cia_max_keysize	= AES_MAX_KEY_SIZE,
-			.cia_setkey		= aes_set_key,
-			.cia_encrypt		= crypto_aes_encrypt,
-			.cia_decrypt		= crypto_aes_decrypt
-		}
-	}
-};
-
 static struct skcipher_alg skcipher_algs[] = {
 	{
 		.base.cra_name		= "ecb(aes)",
 		.base.cra_driver_name	= "ecb-aes-sparc64",
 		.base.cra_priority	= SPARC_CR_OPCODE_PRIORITY,
@@ -438,30 +317,21 @@ static bool __init sparc64_has_aes_opcode(void)
 	return true;
 }
 
 static int __init aes_sparc64_mod_init(void)
 {
-	int err;
-
 	if (!sparc64_has_aes_opcode()) {
 		pr_info("sparc64 aes opcodes not available.\n");
 		return -ENODEV;
 	}
 	pr_info("Using sparc64 aes opcodes optimized AES implementation\n");
-	err = crypto_register_alg(&cipher_alg);
-	if (err)
-		return err;
-	err = crypto_register_skciphers(skcipher_algs,
-					ARRAY_SIZE(skcipher_algs));
-	if (err)
-		crypto_unregister_alg(&cipher_alg);
-	return err;
+	return crypto_register_skciphers(skcipher_algs,
+					 ARRAY_SIZE(skcipher_algs));
 }
 
 static void __exit aes_sparc64_mod_fini(void)
 {
-	crypto_unregister_alg(&cipher_alg);
 	crypto_unregister_skciphers(skcipher_algs, ARRAY_SIZE(skcipher_algs));
 }
 
 module_init(aes_sparc64_mod_init);
 module_exit(aes_sparc64_mod_fini);
diff --git a/include/crypto/aes.h b/include/crypto/aes.h
index 19fd99f383fb..4a56aed59973 100644
--- a/include/crypto/aes.h
+++ b/include/crypto/aes.h
@@ -47,10 +47,13 @@ union aes_enckey_arch {
 	 */
 	struct p8_aes_key p8;
 #elif defined(CONFIG_S390)
 	/* Used when the CPU supports CPACF AES for this key's length */
 	u8 raw_key[AES_MAX_KEY_SIZE];
+#elif defined(CONFIG_SPARC64)
+	/* Used when the CPU supports the SPARC64 AES opcodes */
+	u64 sparc_rndkeys[AES_MAX_KEYLENGTH / sizeof(u64)];
 #endif
 #endif /* CONFIG_CRYPTO_LIB_AES_ARCH */
 };
 
 union aes_invkey_arch {
@@ -197,10 +200,49 @@ void aes_p8_xts_encrypt(const u8 *in, u8 *out, size_t len,
 			const struct p8_aes_key *key1,
 			const struct p8_aes_key *key2, u8 *iv);
 void aes_p8_xts_decrypt(const u8 *in, u8 *out, size_t len,
 			const struct p8_aes_key *key1,
 			const struct p8_aes_key *key2, u8 *iv);
+#elif defined(CONFIG_SPARC64)
+void aes_sparc64_key_expand(const u32 *in_key, u64 *output_key,
+			    unsigned int key_len);
+void aes_sparc64_load_encrypt_keys_128(const u64 *key);
+void aes_sparc64_load_encrypt_keys_192(const u64 *key);
+void aes_sparc64_load_encrypt_keys_256(const u64 *key);
+void aes_sparc64_load_decrypt_keys_128(const u64 *key);
+void aes_sparc64_load_decrypt_keys_192(const u64 *key);
+void aes_sparc64_load_decrypt_keys_256(const u64 *key);
+void aes_sparc64_ecb_encrypt_128(const u64 *key, const u64 *input, u64 *output,
+				 unsigned int len);
+void aes_sparc64_ecb_encrypt_192(const u64 *key, const u64 *input, u64 *output,
+				 unsigned int len);
+void aes_sparc64_ecb_encrypt_256(const u64 *key, const u64 *input, u64 *output,
+				 unsigned int len);
+void aes_sparc64_ecb_decrypt_128(const u64 *key, const u64 *input, u64 *output,
+				 unsigned int len);
+void aes_sparc64_ecb_decrypt_192(const u64 *key, const u64 *input, u64 *output,
+				 unsigned int len);
+void aes_sparc64_ecb_decrypt_256(const u64 *key, const u64 *input, u64 *output,
+				 unsigned int len);
+void aes_sparc64_cbc_encrypt_128(const u64 *key, const u64 *input, u64 *output,
+				 unsigned int len, u64 *iv);
+void aes_sparc64_cbc_encrypt_192(const u64 *key, const u64 *input, u64 *output,
+				 unsigned int len, u64 *iv);
+void aes_sparc64_cbc_encrypt_256(const u64 *key, const u64 *input, u64 *output,
+				 unsigned int len, u64 *iv);
+void aes_sparc64_cbc_decrypt_128(const u64 *key, const u64 *input, u64 *output,
+				 unsigned int len, u64 *iv);
+void aes_sparc64_cbc_decrypt_192(const u64 *key, const u64 *input, u64 *output,
+				 unsigned int len, u64 *iv);
+void aes_sparc64_cbc_decrypt_256(const u64 *key, const u64 *input, u64 *output,
+				 unsigned int len, u64 *iv);
+void aes_sparc64_ctr_crypt_128(const u64 *key, const u64 *input, u64 *output,
+			       unsigned int len, u64 *iv);
+void aes_sparc64_ctr_crypt_192(const u64 *key, const u64 *input, u64 *output,
+			       unsigned int len, u64 *iv);
+void aes_sparc64_ctr_crypt_256(const u64 *key, const u64 *input, u64 *output,
+			       unsigned int len, u64 *iv);
 #endif
 
 /**
  * aes_preparekey() - Prepare an AES key for encryption and decryption
  * @key: (output) The key structure to initialize
diff --git a/lib/crypto/Kconfig b/lib/crypto/Kconfig
index 56a9b4f53b0e..920d96e6b498 100644
--- a/lib/crypto/Kconfig
+++ b/lib/crypto/Kconfig
@@ -18,10 +18,11 @@ config CRYPTO_LIB_AES_ARCH
 	default y if ARM64
 	default y if PPC && (SPE || (PPC64 && VSX))
 	default y if RISCV && 64BIT && TOOLCHAIN_HAS_VECTOR_CRYPTO && \
 		     RISCV_EFFICIENT_VECTOR_UNALIGNED_ACCESS
 	default y if S390
+	default y if SPARC64
 
 config CRYPTO_LIB_AESCFB
 	tristate
 	select CRYPTO_LIB_AES
 	select CRYPTO_LIB_UTILS
diff --git a/lib/crypto/Makefile b/lib/crypto/Makefile
index 811b60787dd5..761d52d91f92 100644
--- a/lib/crypto/Makefile
+++ b/lib/crypto/Makefile
@@ -49,10 +49,11 @@ targets += powerpc/aesp8-ppc.S
 OBJECT_FILES_NON_STANDARD_powerpc/aesp8-ppc.o := y
 endif # !CONFIG_SPE
 endif # CONFIG_PPC
 
 libaes-$(CONFIG_RISCV) += riscv/aes-riscv64-zvkned.o
+libaes-$(CONFIG_SPARC) += sparc/aes_asm.o
 endif # CONFIG_CRYPTO_LIB_AES_ARCH
 
 ################################################################################
 
 obj-$(CONFIG_CRYPTO_LIB_AESCFB)			+= libaescfb.o
diff --git a/lib/crypto/sparc/aes.h b/lib/crypto/sparc/aes.h
new file mode 100644
index 000000000000..e354aa507ee0
--- /dev/null
+++ b/lib/crypto/sparc/aes.h
@@ -0,0 +1,149 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * AES accelerated using the sparc64 aes opcodes
+ *
+ * Copyright (C) 2008, Intel Corp.
+ * Copyright (c) 2010, Intel Corporation.
+ * Copyright 2026 Google LLC
+ */
+
+#include <asm/fpumacro.h>
+#include <asm/opcodes.h>
+#include <asm/pstate.h>
+#include <asm/elf.h>
+
+static __ro_after_init DEFINE_STATIC_KEY_FALSE(have_aes_opcodes);
+
+EXPORT_SYMBOL_GPL(aes_sparc64_key_expand);
+EXPORT_SYMBOL_GPL(aes_sparc64_load_encrypt_keys_128);
+EXPORT_SYMBOL_GPL(aes_sparc64_load_encrypt_keys_192);
+EXPORT_SYMBOL_GPL(aes_sparc64_load_encrypt_keys_256);
+EXPORT_SYMBOL_GPL(aes_sparc64_load_decrypt_keys_128);
+EXPORT_SYMBOL_GPL(aes_sparc64_load_decrypt_keys_192);
+EXPORT_SYMBOL_GPL(aes_sparc64_load_decrypt_keys_256);
+EXPORT_SYMBOL_GPL(aes_sparc64_ecb_encrypt_128);
+EXPORT_SYMBOL_GPL(aes_sparc64_ecb_encrypt_192);
+EXPORT_SYMBOL_GPL(aes_sparc64_ecb_encrypt_256);
+EXPORT_SYMBOL_GPL(aes_sparc64_ecb_decrypt_128);
+EXPORT_SYMBOL_GPL(aes_sparc64_ecb_decrypt_192);
+EXPORT_SYMBOL_GPL(aes_sparc64_ecb_decrypt_256);
+EXPORT_SYMBOL_GPL(aes_sparc64_cbc_encrypt_128);
+EXPORT_SYMBOL_GPL(aes_sparc64_cbc_encrypt_192);
+EXPORT_SYMBOL_GPL(aes_sparc64_cbc_encrypt_256);
+EXPORT_SYMBOL_GPL(aes_sparc64_cbc_decrypt_128);
+EXPORT_SYMBOL_GPL(aes_sparc64_cbc_decrypt_192);
+EXPORT_SYMBOL_GPL(aes_sparc64_cbc_decrypt_256);
+EXPORT_SYMBOL_GPL(aes_sparc64_ctr_crypt_128);
+EXPORT_SYMBOL_GPL(aes_sparc64_ctr_crypt_192);
+EXPORT_SYMBOL_GPL(aes_sparc64_ctr_crypt_256);
+
+void aes_sparc64_encrypt_128(const u64 *key, const u32 *input, u32 *output);
+void aes_sparc64_encrypt_192(const u64 *key, const u32 *input, u32 *output);
+void aes_sparc64_encrypt_256(const u64 *key, const u32 *input, u32 *output);
+void aes_sparc64_decrypt_128(const u64 *key, const u32 *input, u32 *output);
+void aes_sparc64_decrypt_192(const u64 *key, const u32 *input, u32 *output);
+void aes_sparc64_decrypt_256(const u64 *key, const u32 *input, u32 *output);
+
+static void aes_preparekey_arch(union aes_enckey_arch *k,
+				union aes_invkey_arch *inv_k,
+				const u8 *in_key, int key_len, int nrounds)
+{
+	if (static_branch_likely(&have_aes_opcodes)) {
+		u32 aligned_key[AES_MAX_KEY_SIZE / 4];
+
+		if (IS_ALIGNED((uintptr_t)in_key, 4)) {
+			aes_sparc64_key_expand((const u32 *)in_key,
+					       k->sparc_rndkeys, key_len);
+		} else {
+			memcpy(aligned_key, in_key, key_len);
+			aes_sparc64_key_expand(aligned_key,
+					       k->sparc_rndkeys, key_len);
+			memzero_explicit(aligned_key, key_len);
+		}
+		/*
+		 * Note that nothing needs to be written to inv_k (if it's
+		 * non-NULL) here, since the SPARC64 assembly code uses
+		 * k->sparc_rndkeys for both encryption and decryption.
+		 */
+	} else {
+		aes_expandkey_generic(k->rndkeys,
+				      inv_k ? inv_k->inv_rndkeys : NULL,
+				      in_key, key_len);
+	}
+}
+
+static void aes_sparc64_encrypt(const struct aes_enckey *key,
+				const u32 *input, u32 *output)
+{
+	if (key->len == AES_KEYSIZE_128)
+		aes_sparc64_encrypt_128(key->k.sparc_rndkeys, input, output);
+	else if (key->len == AES_KEYSIZE_192)
+		aes_sparc64_encrypt_192(key->k.sparc_rndkeys, input, output);
+	else
+		aes_sparc64_encrypt_256(key->k.sparc_rndkeys, input, output);
+}
+
+static void aes_encrypt_arch(const struct aes_enckey *key,
+			     u8 out[AES_BLOCK_SIZE],
+			     const u8 in[AES_BLOCK_SIZE])
+{
+	u32 bounce_buf[AES_BLOCK_SIZE / 4];
+
+	if (static_branch_likely(&have_aes_opcodes)) {
+		if (IS_ALIGNED((uintptr_t)in | (uintptr_t)out, 4)) {
+			aes_sparc64_encrypt(key, (const u32 *)in, (u32 *)out);
+		} else {
+			memcpy(bounce_buf, in, AES_BLOCK_SIZE);
+			aes_sparc64_encrypt(key, bounce_buf, bounce_buf);
+			memcpy(out, bounce_buf, AES_BLOCK_SIZE);
+		}
+	} else {
+		aes_encrypt_generic(key->k.rndkeys, key->nrounds, out, in);
+	}
+}
+
+static void aes_sparc64_decrypt(const struct aes_key *key,
+				const u32 *input, u32 *output)
+{
+	if (key->len == AES_KEYSIZE_128)
+		aes_sparc64_decrypt_128(key->k.sparc_rndkeys, input, output);
+	else if (key->len == AES_KEYSIZE_192)
+		aes_sparc64_decrypt_192(key->k.sparc_rndkeys, input, output);
+	else
+		aes_sparc64_decrypt_256(key->k.sparc_rndkeys, input, output);
+}
+
+static void aes_decrypt_arch(const struct aes_key *key,
+			     u8 out[AES_BLOCK_SIZE],
+			     const u8 in[AES_BLOCK_SIZE])
+{
+	u32 bounce_buf[AES_BLOCK_SIZE / 4];
+
+	if (static_branch_likely(&have_aes_opcodes)) {
+		if (IS_ALIGNED((uintptr_t)in | (uintptr_t)out, 4)) {
+			aes_sparc64_decrypt(key, (const u32 *)in, (u32 *)out);
+		} else {
+			memcpy(bounce_buf, in, AES_BLOCK_SIZE);
+			aes_sparc64_decrypt(key, bounce_buf, bounce_buf);
+			memcpy(out, bounce_buf, AES_BLOCK_SIZE);
+		}
+	} else {
+		aes_decrypt_generic(key->inv_k.inv_rndkeys, key->nrounds,
+				    out, in);
+	}
+}
+
+#define aes_mod_init_arch aes_mod_init_arch
+static void aes_mod_init_arch(void)
+{
+	unsigned long cfr;
+
+	if (!(sparc64_elf_hwcap & HWCAP_SPARC_CRYPTO))
+		return;
+
+	__asm__ __volatile__("rd %%asr26, %0" : "=r" (cfr));
+	if (!(cfr & CFR_AES))
+		return;
+
+	static_branch_enable(&have_aes_opcodes);
+}
diff --git a/arch/sparc/crypto/aes_asm.S b/lib/crypto/sparc/aes_asm.S
similarity index 100%
rename from arch/sparc/crypto/aes_asm.S
rename to lib/crypto/sparc/aes_asm.S
-- 
2.52.0


