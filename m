Return-Path: <linuxppc-dev+bounces-15217-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 75A0ECF1E33
	for <lists+linuxppc-dev@lfdr.de>; Mon, 05 Jan 2026 06:16:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dl2YX1sCkz2yyy;
	Mon, 05 Jan 2026 16:15:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767590112;
	cv=none; b=Bo1iwZnEE66jIJ4b9OxJkajiuRLICadEdHGATGuA+TlKfHA/fqaXQFzpi9s0+P1pk/bSoDYi4KFVbErtORscQc40kzaRblcTWOaLFSNsvmc7/hr+4BFj3ZHe7lpWVDA0QjzOInrJ7kSzAZuFgYuoJOlHx6i8tTnMCUmuJfTl26vJPqKXDi4se1PxcO4zzq8xu6TnHaB/NTgRAKp0cLUT1+iTKASg5fQZiUKVgfxj4en7ZpUb5Z0bCcb3ieCa3RKHDNn63WSONZrx6tZ5OTRP8NM55VQQ8Kpt+K90lJRrXG66Y5xLS+9wXohkiGDGVGGW7J4kyTsniN66onUYZQnSzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767590112; c=relaxed/relaxed;
	bh=gA9Ebb2llqnpWdu46MPsF7FWY5KxVMVavXiY4Pn302Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MvWGrjQxOvZNb3wGhVddjXR1Tm8JBYkv6oYP5VZfymeraOdG5misIuOzEQJXt7bEkHVhT1UT1GClIjJQN18vidFAwYYNIs4LRanKt8PwMv7fO9VKnUwzq2TYMmpPv6vMcdjuwK9AtDJ0lUNVvV+CAKI34XXEVX/rhIZfOE182Ymq0P4rfpDYzFhfeg6zq3N82JG945i54Ss4s1k+i2fGMKqTXqNhbkfgHHCTZYI3UqHwd2hYW2F+dHxoWCxRbM4ly5vrlQsA16UNRMLcfOt9AojvAd1P0bEOQVOgJzfK0w1v7xbxS6E6KXk5ojgKdVXydb7EoSBhk681sOQzvsBC8A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=CdFQXBRR; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=CdFQXBRR;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dl2YR6Fq8z2yrZ
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 05 Jan 2026 16:15:07 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D2DEA44315;
	Mon,  5 Jan 2026 05:15:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D35ECC2BCB1;
	Mon,  5 Jan 2026 05:15:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767590102;
	bh=hJC9DSn5UYENY36JqLwojxw3h+UBaQgfoLRRAZMtsK4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CdFQXBRRFdl+EMlqiCVNkNbaGKA/Qkt5IHNn8GMj5jkLVVMlSr34WOdhrJk37bWOm
	 JoSzZqeqQIdKOlIIXojh2hhZD7I+3OEPs4Kkd0jTyHrXhJ5H3uwbaREhqZtGPZTnuh
	 QLUgEORHsIG4u7+Gx5wu1Y/2wAeBG0aVFjqJmK7qjCAj322AxOG6xQDtqcFp8rhrVF
	 Y1RG6/QNOb3tT6ao+LVdrDNmGFoKzRN46JWUWezG3hsUx22aTi1zoHyKtrVCLKQ5CA
	 5wph2RCuDkwBu4Z9lOcuu6Sjr/aXV+jKQ1j3NeHgtenzPdesv0/P85zeX1s1e420DZ
	 z2yyazlPAXgNw==
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
Subject: [PATCH 18/36] crypto: x86/aes - Remove the superseded AES-NI crypto_cipher
Date: Sun,  4 Jan 2026 21:12:51 -0800
Message-ID: <20260105051311.1607207-19-ebiggers@kernel.org>
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

Remove the "aes-aesni" crypto_cipher algorithm and the code specific to
its implementation.  It is no longer necessary because the AES library
is now optimized with x86 AES-NI, and crypto/aes.c exposes the AES
library via the crypto_cipher API.

Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 arch/x86/crypto/Kconfig            |  2 -
 arch/x86/crypto/aesni-intel_asm.S  | 25 ------------
 arch/x86/crypto/aesni-intel_glue.c | 62 +-----------------------------
 3 files changed, 1 insertion(+), 88 deletions(-)

diff --git a/arch/x86/crypto/Kconfig b/arch/x86/crypto/Kconfig
index ebb0838eaf30..7fb2319a0916 100644
--- a/arch/x86/crypto/Kconfig
+++ b/arch/x86/crypto/Kconfig
@@ -5,14 +5,12 @@ menu "Accelerated Cryptographic Algorithms for CPU (x86)"
 config CRYPTO_AES_NI_INTEL
 	tristate "Ciphers: AES, modes: ECB, CBC, CTS, CTR, XCTR, XTS, GCM (AES-NI/VAES)"
 	select CRYPTO_AEAD
 	select CRYPTO_LIB_AES
 	select CRYPTO_LIB_GF128MUL
-	select CRYPTO_ALGAPI
 	select CRYPTO_SKCIPHER
 	help
-	  Block cipher: AES cipher algorithms
 	  AEAD cipher: AES with GCM
 	  Length-preserving ciphers: AES with ECB, CBC, CTS, CTR, XCTR, XTS
 
 	  Architecture: x86 (32-bit and 64-bit) using:
 	  - AES-NI (AES new instructions)
diff --git a/arch/x86/crypto/aesni-intel_asm.S b/arch/x86/crypto/aesni-intel_asm.S
index b37881bb9f15..6abe5e38a6d7 100644
--- a/arch/x86/crypto/aesni-intel_asm.S
+++ b/arch/x86/crypto/aesni-intel_asm.S
@@ -434,35 +434,10 @@ SYM_FUNC_START_LOCAL(_aesni_enc4)
 	aesenclast KEY, STATE3
 	aesenclast KEY, STATE4
 	RET
 SYM_FUNC_END(_aesni_enc4)
 
-/*
- * void aesni_dec (const void *ctx, u8 *dst, const u8 *src)
- */
-SYM_FUNC_START(aesni_dec)
-	FRAME_BEGIN
-#ifndef __x86_64__
-	pushl KEYP
-	pushl KLEN
-	movl (FRAME_OFFSET+12)(%esp), KEYP	# ctx
-	movl (FRAME_OFFSET+16)(%esp), OUTP	# dst
-	movl (FRAME_OFFSET+20)(%esp), INP	# src
-#endif
-	mov 480(KEYP), KLEN		# key length
-	add $240, KEYP
-	movups (INP), STATE		# input
-	call _aesni_dec1
-	movups STATE, (OUTP)		#output
-#ifndef __x86_64__
-	popl KLEN
-	popl KEYP
-#endif
-	FRAME_END
-	RET
-SYM_FUNC_END(aesni_dec)
-
 /*
  * _aesni_dec1:		internal ABI
  * input:
  *	KEYP:		key struct pointer
  *	KLEN:		key length
diff --git a/arch/x86/crypto/aesni-intel_glue.c b/arch/x86/crypto/aesni-intel_glue.c
index 48405e02d6e4..453e0e890041 100644
--- a/arch/x86/crypto/aesni-intel_glue.c
+++ b/arch/x86/crypto/aesni-intel_glue.c
@@ -58,11 +58,10 @@ static inline void *aes_align_addr(void *addr)
 }
 
 asmlinkage void aesni_set_key(struct crypto_aes_ctx *ctx, const u8 *in_key,
 			      unsigned int key_len);
 asmlinkage void aesni_enc(const void *ctx, u8 *out, const u8 *in);
-asmlinkage void aesni_dec(const void *ctx, u8 *out, const u8 *in);
 asmlinkage void aesni_ecb_enc(struct crypto_aes_ctx *ctx, u8 *out,
 			      const u8 *in, unsigned int len);
 asmlinkage void aesni_ecb_dec(struct crypto_aes_ctx *ctx, u8 *out,
 			      const u8 *in, unsigned int len);
 asmlinkage void aesni_cbc_enc(struct crypto_aes_ctx *ctx, u8 *out,
@@ -111,43 +110,10 @@ static int aes_set_key_common(struct crypto_aes_ctx *ctx,
 	aesni_set_key(ctx, in_key, key_len);
 	kernel_fpu_end();
 	return 0;
 }
 
-static int aes_set_key(struct crypto_tfm *tfm, const u8 *in_key,
-		       unsigned int key_len)
-{
-	return aes_set_key_common(aes_ctx(crypto_tfm_ctx(tfm)), in_key,
-				  key_len);
-}
-
-static void aesni_encrypt(struct crypto_tfm *tfm, u8 *dst, const u8 *src)
-{
-	struct crypto_aes_ctx *ctx = aes_ctx(crypto_tfm_ctx(tfm));
-
-	if (!crypto_simd_usable()) {
-		aes_encrypt(ctx, dst, src);
-	} else {
-		kernel_fpu_begin();
-		aesni_enc(ctx, dst, src);
-		kernel_fpu_end();
-	}
-}
-
-static void aesni_decrypt(struct crypto_tfm *tfm, u8 *dst, const u8 *src)
-{
-	struct crypto_aes_ctx *ctx = aes_ctx(crypto_tfm_ctx(tfm));
-
-	if (!crypto_simd_usable()) {
-		aes_decrypt(ctx, dst, src);
-	} else {
-		kernel_fpu_begin();
-		aesni_dec(ctx, dst, src);
-		kernel_fpu_end();
-	}
-}
-
 static int aesni_skcipher_setkey(struct crypto_skcipher *tfm, const u8 *key,
 			         unsigned int len)
 {
 	return aes_set_key_common(aes_ctx(crypto_skcipher_ctx(tfm)), key, len);
 }
@@ -542,29 +508,10 @@ static int xts_encrypt_aesni(struct skcipher_request *req)
 static int xts_decrypt_aesni(struct skcipher_request *req)
 {
 	return xts_crypt(req, aesni_xts_encrypt_iv, aesni_xts_decrypt);
 }
 
-static struct crypto_alg aesni_cipher_alg = {
-	.cra_name		= "aes",
-	.cra_driver_name	= "aes-aesni",
-	.cra_priority		= 300,
-	.cra_flags		= CRYPTO_ALG_TYPE_CIPHER,
-	.cra_blocksize		= AES_BLOCK_SIZE,
-	.cra_ctxsize		= CRYPTO_AES_CTX_SIZE,
-	.cra_module		= THIS_MODULE,
-	.cra_u	= {
-		.cipher	= {
-			.cia_min_keysize	= AES_MIN_KEY_SIZE,
-			.cia_max_keysize	= AES_MAX_KEY_SIZE,
-			.cia_setkey		= aes_set_key,
-			.cia_encrypt		= aesni_encrypt,
-			.cia_decrypt		= aesni_decrypt
-		}
-	}
-};
-
 static struct skcipher_alg aesni_skciphers[] = {
 	{
 		.base = {
 			.cra_name		= "ecb(aes)",
 			.cra_driver_name	= "ecb-aes-aesni",
@@ -1687,18 +1634,14 @@ static int __init aesni_init(void)
 	int err;
 
 	if (!x86_match_cpu(aesni_cpu_id))
 		return -ENODEV;
 
-	err = crypto_register_alg(&aesni_cipher_alg);
-	if (err)
-		return err;
-
 	err = crypto_register_skciphers(aesni_skciphers,
 					ARRAY_SIZE(aesni_skciphers));
 	if (err)
-		goto unregister_cipher;
+		return err;
 
 	err = crypto_register_aeads(aes_gcm_algs_aesni,
 				    ARRAY_SIZE(aes_gcm_algs_aesni));
 	if (err)
 		goto unregister_skciphers;
@@ -1714,22 +1657,19 @@ static int __init aesni_init(void)
 	crypto_unregister_aeads(aes_gcm_algs_aesni,
 				ARRAY_SIZE(aes_gcm_algs_aesni));
 unregister_skciphers:
 	crypto_unregister_skciphers(aesni_skciphers,
 				    ARRAY_SIZE(aesni_skciphers));
-unregister_cipher:
-	crypto_unregister_alg(&aesni_cipher_alg);
 	return err;
 }
 
 static void __exit aesni_exit(void)
 {
 	crypto_unregister_aeads(aes_gcm_algs_aesni,
 				ARRAY_SIZE(aes_gcm_algs_aesni));
 	crypto_unregister_skciphers(aesni_skciphers,
 				    ARRAY_SIZE(aesni_skciphers));
-	crypto_unregister_alg(&aesni_cipher_alg);
 	unregister_avx_algs();
 }
 
 module_init(aesni_init);
 module_exit(aesni_exit);
-- 
2.52.0


