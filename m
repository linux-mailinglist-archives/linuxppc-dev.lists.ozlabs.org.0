Return-Path: <linuxppc-dev+bounces-8044-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A5ACBA9DF9F
	for <lists+linuxppc-dev@lfdr.de>; Sun, 27 Apr 2025 08:31:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZlcCh24s7z3057;
	Sun, 27 Apr 2025 16:30:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=144.6.53.87
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1745735456;
	cv=none; b=J3WQmBbJyqqjVwpmLE8g8WAFtK16Uo7zA93mWrHGMNXrSVW73NZKNooCGLDsxC/oOtMdXykhxkC18RkvR5WTj/hzT39Qy8lnd/zPonl/kNRY9ydb9g+AUe/UZcezHZOvGSz5YjhPOhnCha0ru1g7vK8OazvjUDqG99RMeHvSfbEddcjCCEFMMYW28X8rBkGnvfX+vIrnAFeiwQPZSxKmOvkvz8kAIHYAiwodlxukAl0nzwL7p1ecrO/r8ETUs/56un99MVwY8MCZeM6r47ayvEu+JEA25Q9bGvRc0rJ8PcMH3n/fcnU8n2k3RhRnbUiFmLszyCys6HjtQ/4C92G0fg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1745735456; c=relaxed/relaxed;
	bh=rP+NZJSdMAUCrhmpmgiLvCOP7Z+FVOqs5gTXtI8IpWU=;
	h=Date:Message-Id:In-Reply-To:References:From:Subject:To:Cc; b=hOPrkeNfO6MxOpG8J8vRKTciYiAeTibYCfoy96a+Yy+o8KnAH+/QTbjyNrOFCwxEi0jziPBFXVLpFx6dh52lq2W9ZAFRBNC/toQtwjJfJ54HjokZrVIV7BWFBv2ROzD98Dm2PFPViARwAs89yoIUqKv+IgYMDVvb1ahataDxPNoLffy2OPnJa6dKcaakUSJevaU2fFAtYml0mcw7nEPtPtBh/fN9p0K5w5Gs/mGtKTfViYJpeUpR/x2a6/XESKZIQbncJumJevN0ATRpur+2d7aVOpEVtLEduqcPV4O99cKORT/XoIEedSSYR7zye2O+dkphxpnCB7IsWQQw5dRPtw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au; dkim=pass (2048-bit key; unprotected) header.d=hmeau.com header.i=@hmeau.com header.a=rsa-sha256 header.s=formenos header.b=pwhukHUJ; dkim-atps=neutral; spf=pass (client-ip=144.6.53.87; helo=abb.hmeau.com; envelope-from=herbert@gondor.apana.org.au; receiver=lists.ozlabs.org) smtp.mailfrom=gondor.apana.org.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=hmeau.com header.i=@hmeau.com header.a=rsa-sha256 header.s=formenos header.b=pwhukHUJ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gondor.apana.org.au (client-ip=144.6.53.87; helo=abb.hmeau.com; envelope-from=herbert@gondor.apana.org.au; receiver=lists.ozlabs.org)
Received: from abb.hmeau.com (abb.hmeau.com [144.6.53.87])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZlcCg5hMHz2y0B
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 27 Apr 2025 16:30:55 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hmeau.com;
	s=formenos; h=Cc:To:Subject:From:References:In-Reply-To:Message-Id:Date:
	Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=rP+NZJSdMAUCrhmpmgiLvCOP7Z+FVOqs5gTXtI8IpWU=; b=pwhukHUJkptVYhk/7mJ/wQy1SE
	ulrhnazPKrgrGSMvq/xnNHtH8aCk7R9kBOErlOtsdOkboxZvYdOzK+2EFFhVgN/SBxH8NtogqwhTr
	vFwwAxgkrbkOhdpJWnivNzQjAMKp2XxBTtQk0SMbzwpW9hv7igOSWzJysOCBaDXYa1BJhIuhqc6hm
	F+dJBOAlzGlExJ1XfHXx/BF+LUkmi/vDSOEBLFYJCjVU3AUORqHRown7MHDW7Rftl3ZN7MoHjpUsH
	M5iPNcaoAiRhr3w7uYP+ct+kpWrHQGtX2c39KRGQORcGTtMBe1IbAmB/1PsDmST+4ITgsJ5i1SAZj
	S6+TmzOw==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1u8vXR-001LVY-1E;
	Sun, 27 Apr 2025 14:30:54 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Sun, 27 Apr 2025 14:30:53 +0800
Date: Sun, 27 Apr 2025 14:30:53 +0800
Message-Id: <df59c55070d5ea79f6c6c8c60ad155ec223b8fab.1745734678.git.herbert@gondor.apana.org.au>
In-Reply-To: <cover.1745734678.git.herbert@gondor.apana.org.au>
References: <cover.1745734678.git.herbert@gondor.apana.org.au>
From: Herbert Xu <herbert@gondor.apana.org.au>
Subject: [v2 PATCH 05/13] crypto: mips/sha256 - implement library instead of
 shash
To: Linux Crypto Mailing List <linux-crypto@vger.kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, sparclinux@vger.kernel.org, linux-s390@vger.kernel.org, x86@kernel.org, Ard Biesheuvel <ardb@kernel.org>, "Jason A . Donenfeld " <Jason@zx2c4.com>, Linus Torvalds <torvalds@linux-foundation.org>
X-Spam-Status: No, score=0.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
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

From: Eric Biggers <ebiggers@google.com>

Instead of providing crypto_shash algorithms for the arch-optimized
SHA-256 code, instead implement the SHA-256 library.  This is much
simpler, it makes the SHA-256 library functions be arch-optimized, and
it fixes the longstanding issue where the arch-optimized SHA-256 was
disabled by default.  SHA-256 still remains available through
crypto_shash, but individual architectures no longer need to handle it.

Signed-off-by: Eric Biggers <ebiggers@google.com>
Signed-off-by: Herbert Xu <herbert@gondor.apana.org.au>
---
 arch/mips/cavium-octeon/Kconfig               |   6 +
 .../mips/cavium-octeon/crypto/octeon-sha256.c | 139 ++++--------------
 arch/mips/configs/cavium_octeon_defconfig     |   1 -
 arch/mips/crypto/Kconfig                      |  10 --
 4 files changed, 35 insertions(+), 121 deletions(-)

diff --git a/arch/mips/cavium-octeon/Kconfig b/arch/mips/cavium-octeon/Kconfig
index 450e979ef5d9..11f4aa6e80e9 100644
--- a/arch/mips/cavium-octeon/Kconfig
+++ b/arch/mips/cavium-octeon/Kconfig
@@ -23,6 +23,12 @@ config CAVIUM_OCTEON_CVMSEG_SIZE
 	  legally range is from zero to 54 cache blocks (i.e. CVMSEG LM is
 	  between zero and 6192 bytes).
 
+config CRYPTO_SHA256_OCTEON
+	tristate
+	default CRYPTO_LIB_SHA256
+	select CRYPTO_ARCH_HAVE_LIB_SHA256
+	select CRYPTO_LIB_SHA256_GENERIC
+
 endif # CPU_CAVIUM_OCTEON
 
 if CAVIUM_OCTEON_SOC
diff --git a/arch/mips/cavium-octeon/crypto/octeon-sha256.c b/arch/mips/cavium-octeon/crypto/octeon-sha256.c
index 8e85ea65387c..f93faaf1f4af 100644
--- a/arch/mips/cavium-octeon/crypto/octeon-sha256.c
+++ b/arch/mips/cavium-octeon/crypto/octeon-sha256.c
@@ -1,8 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
 /*
- * Cryptographic API.
- *
- * SHA-224 and SHA-256 Secure Hash Algorithm.
+ * SHA-256 Secure Hash Algorithm.
  *
  * Adapted for OCTEON by Aaro Koskinen <aaro.koskinen@iki.fi>.
  *
@@ -15,9 +13,7 @@
  */
 
 #include <asm/octeon/octeon.h>
-#include <crypto/internal/hash.h>
-#include <crypto/sha2.h>
-#include <crypto/sha256_base.h>
+#include <crypto/internal/sha2.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 
@@ -27,31 +23,24 @@
  * We pass everything as 64-bit. OCTEON can handle misaligned data.
  */
 
-static void octeon_sha256_store_hash(struct crypto_sha256_state *sctx)
+void sha256_blocks_arch(u32 state[SHA256_STATE_WORDS],
+			const u8 *data, size_t nblocks)
 {
-	u64 *hash = (u64 *)sctx->state;
+	struct octeon_cop2_state cop2_state;
+	u64 *state64 = (u64 *)state;
+	unsigned long flags;
 
-	write_octeon_64bit_hash_dword(hash[0], 0);
-	write_octeon_64bit_hash_dword(hash[1], 1);
-	write_octeon_64bit_hash_dword(hash[2], 2);
-	write_octeon_64bit_hash_dword(hash[3], 3);
-}
+	if (!octeon_has_crypto())
+		return sha256_blocks_generic(state, data, nblocks);
 
-static void octeon_sha256_read_hash(struct crypto_sha256_state *sctx)
-{
-	u64 *hash = (u64 *)sctx->state;
+	flags = octeon_crypto_enable(&cop2_state);
+	write_octeon_64bit_hash_dword(state64[0], 0);
+	write_octeon_64bit_hash_dword(state64[1], 1);
+	write_octeon_64bit_hash_dword(state64[2], 2);
+	write_octeon_64bit_hash_dword(state64[3], 3);
 
-	hash[0] = read_octeon_64bit_hash_dword(0);
-	hash[1] = read_octeon_64bit_hash_dword(1);
-	hash[2] = read_octeon_64bit_hash_dword(2);
-	hash[3] = read_octeon_64bit_hash_dword(3);
-}
-
-static void octeon_sha256_transform(struct crypto_sha256_state *sctx,
-				    const u8 *src, int blocks)
-{
 	do {
-		const u64 *block = (const u64 *)src;
+		const u64 *block = (const u64 *)data;
 
 		write_octeon_64bit_block_dword(block[0], 0);
 		write_octeon_64bit_block_dword(block[1], 1);
@@ -62,93 +51,23 @@ static void octeon_sha256_transform(struct crypto_sha256_state *sctx,
 		write_octeon_64bit_block_dword(block[6], 6);
 		octeon_sha256_start(block[7]);
 
-		src += SHA256_BLOCK_SIZE;
-	} while (--blocks);
-}
+		data += SHA256_BLOCK_SIZE;
+	} while (--nblocks);
 
-static int octeon_sha256_update(struct shash_desc *desc, const u8 *data,
-				unsigned int len)
+	state64[0] = read_octeon_64bit_hash_dword(0);
+	state64[1] = read_octeon_64bit_hash_dword(1);
+	state64[2] = read_octeon_64bit_hash_dword(2);
+	state64[3] = read_octeon_64bit_hash_dword(3);
+	octeon_crypto_disable(&cop2_state, flags);
+}
+EXPORT_SYMBOL_GPL(sha256_blocks_arch);
+
+bool sha256_is_arch_optimized(void)
 {
-	struct crypto_sha256_state *sctx = shash_desc_ctx(desc);
-	struct octeon_cop2_state state;
-	unsigned long flags;
-	int remain;
-
-	flags = octeon_crypto_enable(&state);
-	octeon_sha256_store_hash(sctx);
-
-	remain = sha256_base_do_update_blocks(desc, data, len,
-					      octeon_sha256_transform);
-
-	octeon_sha256_read_hash(sctx);
-	octeon_crypto_disable(&state, flags);
-	return remain;
+	return octeon_has_crypto();
 }
-
-static int octeon_sha256_finup(struct shash_desc *desc, const u8 *src,
-			       unsigned int len, u8 *out)
-{
-	struct crypto_sha256_state *sctx = shash_desc_ctx(desc);
-	struct octeon_cop2_state state;
-	unsigned long flags;
-
-	flags = octeon_crypto_enable(&state);
-	octeon_sha256_store_hash(sctx);
-
-	sha256_base_do_finup(desc, src, len, octeon_sha256_transform);
-
-	octeon_sha256_read_hash(sctx);
-	octeon_crypto_disable(&state, flags);
-	return sha256_base_finish(desc, out);
-}
-
-static struct shash_alg octeon_sha256_algs[2] = { {
-	.digestsize	=	SHA256_DIGEST_SIZE,
-	.init		=	sha256_base_init,
-	.update		=	octeon_sha256_update,
-	.finup		=	octeon_sha256_finup,
-	.descsize	=	sizeof(struct crypto_sha256_state),
-	.base		=	{
-		.cra_name	=	"sha256",
-		.cra_driver_name=	"octeon-sha256",
-		.cra_priority	=	OCTEON_CR_OPCODE_PRIORITY,
-		.cra_flags	=	CRYPTO_AHASH_ALG_BLOCK_ONLY,
-		.cra_blocksize	=	SHA256_BLOCK_SIZE,
-		.cra_module	=	THIS_MODULE,
-	}
-}, {
-	.digestsize	=	SHA224_DIGEST_SIZE,
-	.init		=	sha224_base_init,
-	.update		=	octeon_sha256_update,
-	.finup		=	octeon_sha256_finup,
-	.descsize	=	sizeof(struct crypto_sha256_state),
-	.base		=	{
-		.cra_name	=	"sha224",
-		.cra_driver_name=	"octeon-sha224",
-		.cra_priority	=	OCTEON_CR_OPCODE_PRIORITY,
-		.cra_flags	=	CRYPTO_AHASH_ALG_BLOCK_ONLY,
-		.cra_blocksize	=	SHA224_BLOCK_SIZE,
-		.cra_module	=	THIS_MODULE,
-	}
-} };
-
-static int __init octeon_sha256_mod_init(void)
-{
-	if (!octeon_has_crypto())
-		return -ENOTSUPP;
-	return crypto_register_shashes(octeon_sha256_algs,
-				       ARRAY_SIZE(octeon_sha256_algs));
-}
-
-static void __exit octeon_sha256_mod_fini(void)
-{
-	crypto_unregister_shashes(octeon_sha256_algs,
-				  ARRAY_SIZE(octeon_sha256_algs));
-}
-
-module_init(octeon_sha256_mod_init);
-module_exit(octeon_sha256_mod_fini);
+EXPORT_SYMBOL_GPL(sha256_is_arch_optimized);
 
 MODULE_LICENSE("GPL");
-MODULE_DESCRIPTION("SHA-224 and SHA-256 Secure Hash Algorithm (OCTEON)");
+MODULE_DESCRIPTION("SHA-256 Secure Hash Algorithm (OCTEON)");
 MODULE_AUTHOR("Aaro Koskinen <aaro.koskinen@iki.fi>");
diff --git a/arch/mips/configs/cavium_octeon_defconfig b/arch/mips/configs/cavium_octeon_defconfig
index f523ee6f25bf..88ae0aa85364 100644
--- a/arch/mips/configs/cavium_octeon_defconfig
+++ b/arch/mips/configs/cavium_octeon_defconfig
@@ -157,7 +157,6 @@ CONFIG_CRYPTO_CBC=y
 CONFIG_CRYPTO_HMAC=y
 CONFIG_CRYPTO_MD5_OCTEON=y
 CONFIG_CRYPTO_SHA1_OCTEON=m
-CONFIG_CRYPTO_SHA256_OCTEON=m
 CONFIG_CRYPTO_SHA512_OCTEON=m
 CONFIG_CRYPTO_DES=y
 CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT=y
diff --git a/arch/mips/crypto/Kconfig b/arch/mips/crypto/Kconfig
index 9db1fd6d9f0e..6bf073ae7613 100644
--- a/arch/mips/crypto/Kconfig
+++ b/arch/mips/crypto/Kconfig
@@ -22,16 +22,6 @@ config CRYPTO_SHA1_OCTEON
 
 	  Architecture: mips OCTEON
 
-config CRYPTO_SHA256_OCTEON
-	tristate "Hash functions: SHA-224 and SHA-256 (OCTEON)"
-	depends on CPU_CAVIUM_OCTEON
-	select CRYPTO_SHA256
-	select CRYPTO_HASH
-	help
-	  SHA-224 and SHA-256 secure hash algorithms (FIPS 180)
-
-	  Architecture: mips OCTEON using crypto instructions, when available
-
 config CRYPTO_SHA512_OCTEON
 	tristate "Hash functions: SHA-384 and SHA-512 (OCTEON)"
 	depends on CPU_CAVIUM_OCTEON
-- 
2.39.5


