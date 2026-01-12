Return-Path: <linuxppc-dev+bounces-15561-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DE6DD14EE9
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Jan 2026 20:24:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dqj366cY9z2yrX;
	Tue, 13 Jan 2026 06:23:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768245810;
	cv=none; b=M7uBXOSn99Uz8H0vFV1okec+jLZ2f845DfLtDsfn9GtIqcYauwUO9z7CfL2t1qy26V1VoD65TlX5IUy+m/lBqHZCg/79r5/mc4Y/+X/FiMB9yPYScjq2NqH43ks2QP5RHD/zNErWDj5ncgezPAEvU8PlElWP+aVjgK5Z8CrN0oM/Vi5odFxQDtqsg6aIZh8mG2URAu4BUFOjQdYCDyeA35nJxxXLVY2lWIWBbUMlCbhuM5NXDRetYIOAw1L9zQYcxFWC6AjTPakzofWZtR59pqCUqlTo2/A/JiZKoYbKZykqVMNXpgK5XrCawTJMWXw+taOhWCV8Iqj7Ny+RfqN3TQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768245810; c=relaxed/relaxed;
	bh=L+EnRH1g2DxHBBymUf+q3bVJCfNZw4HDZebKbbj/uZY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kHWjfysKcL0QgITSVvcK+3f4bX7+W3kZSH4BiusZJjSeAT/buYHNgvgVCaoLqepLCuUsXU7uudIXBOIHvxsVogx8l+IeLLdqzC2p/Mi9BS6JMbSVglKSaOyhGAFjrnoUgcFKLL0P5rxeAH5dk7h1SfT/mRGcoZzMvydAINLw7HFL2NJaMhY3F/4vHKQDEEZtG79bC+gx7ASt1xJ5BCSXbYgct0n5A3SRYBxTJ/QpoXj8rSS1GvodWebHLnAZy0v/uFuA6RtvVDD1m5xNDgmmzSguhv9x+VgDdouoj3OJR8KopCaulS0B+JHgaga1Xo/FKXrtZUFoML5BgX6aYVevGw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Ay5G6LzS; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Ay5G6LzS;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dqj360Q4hz2yr8
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Jan 2026 06:23:30 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 27288600AE;
	Mon, 12 Jan 2026 19:23:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71A7BC19425;
	Mon, 12 Jan 2026 19:23:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768245807;
	bh=m1HqAVYYLBo37842YK27RA2eN4A4DCl4kda+cKOalmc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Ay5G6LzS0TepQWECrnd1UNKNmhVN/JTshHR0wmsfP1OOwI9u5AkJPDr76FOgjudMY
	 vKnapPZ1SOj8AKvDkmjmOz5gTyaAXlgGMlNLCthjfeE9DhA8eMKmoryyXWNHTX+1CT
	 orreVCnr/AQnxb2HQJB/iqv645l5YeXsXDgadecfs3ivkHoNvGMndAOcFI195nanVo
	 CGrCFEe4YlJacesB5s1MsW4ZwYjhmU+q/5DO9sVVx9jxlyLuFi3MFd+YbSbh7s95fJ
	 W/W7Gz0DuLaczz0BJ3a4KaPIx5ivLQZVYl/STh8a/adzozevdl7kFIMdE7/jDkugIJ
	 g+9KWBsLktsMQ==
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
Subject: [PATCH v2 18/35] crypto: x86/aes - Remove the superseded AES-NI crypto_cipher
Date: Mon, 12 Jan 2026 11:20:16 -0800
Message-ID: <20260112192035.10427-19-ebiggers@kernel.org>
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

Remove the "aes-aesni" crypto_cipher algorithm and the code specific to
its implementation.  It is no longer necessary because the AES library
is now optimized with x86 AES-NI, and crypto/aes.c exposes the AES
library via the crypto_cipher API.

Acked-by: Ard Biesheuvel <ardb@kernel.org>
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


