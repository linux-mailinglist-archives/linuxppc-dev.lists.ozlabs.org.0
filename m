Return-Path: <linuxppc-dev+bounces-8013-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 27C1DA9D89E
	for <lists+linuxppc-dev@lfdr.de>; Sat, 26 Apr 2025 08:52:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Zl0kF2QcFz2ySV;
	Sat, 26 Apr 2025 16:51:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:4641:c500::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1745650309;
	cv=none; b=QOrRRxE0nHIvTAJ78bz2MN95POqIl5LrP9rUpjuqihQu5cdcjI7Pu4TYzOGaZnqAEB6x0p6Vr3boX8ZmBJa7v6Y9N2MyfpgPM6Bs0Mc9fmh3+NbjxVrd482dAyywmAxj++hmiVoqC0P4Njs+ZQNQS8GQgYYdSIC33s9HYtYBZhCV3jOgPMcZWiuw4K0PGZzVyEg9XePDR+SdCo1m3t7hTjx8+4xzMp94CE06Sc8jHP7XkqieQv5ZftJ2ewG7dFqag7h7VvFjsKSoU1z38oFaaGaiip/27wGZmiXBxeX+WAAqGXb9goOHr+IDY24A1vN7jf1ofPsCubEvUa8MfNvB0w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1745650309; c=relaxed/relaxed;
	bh=Vo4jp6uMZ8Pk9Uyc9eVeVa3zNKhd14f7qLLrRb+qvyA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=c5ObaY73bmLmynJH4rklSg2WXyZN9vnk+gCbocPjr5wIrBUqTUVJw/+W5yDBouHtAInd5dA0f7umQBWub1T/VzhhOo8Not01tYrWP6GQatQkXXdi4HZFzui2b3z9r2MCxfiK43qRFf+X7lzv6kwu/eHrg1/ZaA2G/omfv1znzCTe677J1zdcZZOyIr6+4mdN7Bj03gzS5RDVx7L592crxzD8WpiTuF3NSl5DdqwjlqlwhfMLxCP8ua4PhpwagZac3ExrQVEZ2pGTbIqcmV/6ez3Zutybq1wdmWxksdny1QIXgDxZhDseRZvEbPfCgJi1tLY/Shq9+hZk4M6YMgGwWQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=hw8SYKNS; dkim-atps=neutral; spf=pass (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=hw8SYKNS;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Zl0k86gCYz2xlM
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 26 Apr 2025 16:51:44 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 61D3B5C2978;
	Sat, 26 Apr 2025 06:49:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C811CC4CEE9;
	Sat, 26 Apr 2025 06:51:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745650302;
	bh=bGsC0u7uweX344w5/PsMWDq9aDk+1xpB1l7zPJURYiE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hw8SYKNS3BoLfBRN0OGD9sHZ5XNJQLQUfs0LubQ355rGxYHrZU4Cirrjz3MasvQ04
	 zLRIfUTngq11B1CwicntnLhD3d+Lzzyx3oERrREVpk4pEOxyrceSt0WXY8JmuXiz8a
	 5MVg/mfX1RBtqwu19TtAAMiMbRGyH5xxFSi16pARgPEoE36Fy6hsSpt/fKEXV17oa8
	 KuOG3gvw2sAppOFEWa7IXZwyrrpXRX+POUa09nEI142kLyVo6k+Hh2ex+j+4ANaHEt
	 EHs4yqsqxjkSDuEYpF06nxs4bFq1a42SpB2+M8lTkuspDJXVut0qDCp86xSBBfoiCh
	 6MiujfrchnF/g==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	sparclinux@vger.kernel.org,
	linux-s390@vger.kernel.org,
	x86@kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld " <Jason@zx2c4.com>,
	Linus Torvalds <torvalds@linux-foundation.org>
Subject: [PATCH 05/13] crypto: mips/sha256 - implement library instead of shash
Date: Fri, 25 Apr 2025 23:50:31 -0700
Message-ID: <20250426065041.1551914-6-ebiggers@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250426065041.1551914-1-ebiggers@kernel.org>
References: <20250426065041.1551914-1-ebiggers@kernel.org>
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
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

From: Eric Biggers <ebiggers@google.com>

Instead of providing crypto_shash algorithms for the arch-optimized
SHA-256 code, instead implement the SHA-256 library.  This is much
simpler, it makes the SHA-256 library functions be arch-optimized, and
it fixes the longstanding issue where the arch-optimized SHA-256 was
disabled by default.  SHA-256 still remains available through
crypto_shash, but individual architectures no longer need to handle it.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 arch/mips/cavium-octeon/Kconfig               |   6 +
 .../mips/cavium-octeon/crypto/octeon-sha256.c | 135 ++++--------------
 arch/mips/configs/cavium_octeon_defconfig     |   1 -
 arch/mips/crypto/Kconfig                      |  10 --
 4 files changed, 33 insertions(+), 119 deletions(-)

diff --git a/arch/mips/cavium-octeon/Kconfig b/arch/mips/cavium-octeon/Kconfig
index 450e979ef5d93..11f4aa6e80e9b 100644
--- a/arch/mips/cavium-octeon/Kconfig
+++ b/arch/mips/cavium-octeon/Kconfig
@@ -21,10 +21,16 @@ config CAVIUM_OCTEON_CVMSEG_SIZE
 	  local memory; the larger CVMSEG is, the smaller the cache is.
 	  This selects the size of CVMSEG LM, which is in cache blocks. The
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
 
 config CAVIUM_OCTEON_LOCK_L2
diff --git a/arch/mips/cavium-octeon/crypto/octeon-sha256.c b/arch/mips/cavium-octeon/crypto/octeon-sha256.c
index 8e85ea65387c8..f169054852bcb 100644
--- a/arch/mips/cavium-octeon/crypto/octeon-sha256.c
+++ b/arch/mips/cavium-octeon/crypto/octeon-sha256.c
@@ -1,10 +1,8 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
 /*
- * Cryptographic API.
- *
- * SHA-224 and SHA-256 Secure Hash Algorithm.
+ * SHA-256 Secure Hash Algorithm.
  *
  * Adapted for OCTEON by Aaro Koskinen <aaro.koskinen@iki.fi>.
  *
  * Based on crypto/sha256_generic.c, which is:
  *
@@ -13,142 +11,63 @@
  * Copyright (c) 2002 James Morris <jmorris@intercode.com.au>
  * SHA224 Support Copyright 2007 Intel Corporation <jonathan.lynch@intel.com>
  */
 
 #include <asm/octeon/octeon.h>
-#include <crypto/internal/hash.h>
-#include <crypto/sha2.h>
-#include <crypto/sha256_base.h>
+#include <crypto/internal/sha2.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 
 #include "octeon-crypto.h"
 
 /*
  * We pass everything as 64-bit. OCTEON can handle misaligned data.
  */
 
-static void octeon_sha256_store_hash(struct crypto_sha256_state *sctx)
+void sha256_blocks_arch(u32 state[SHA256_STATE_WORDS],
+			const u8 *data, size_t nblocks)
 {
-	u64 *hash = (u64 *)sctx->state;
-
-	write_octeon_64bit_hash_dword(hash[0], 0);
-	write_octeon_64bit_hash_dword(hash[1], 1);
-	write_octeon_64bit_hash_dword(hash[2], 2);
-	write_octeon_64bit_hash_dword(hash[3], 3);
-}
+	struct octeon_cop2_state cop2_state;
+	u64 *state64 = (u64 *)state;
+	unsigned long flags;
 
-static void octeon_sha256_read_hash(struct crypto_sha256_state *sctx)
-{
-	u64 *hash = (u64 *)sctx->state;
+	if (!octeon_has_crypto())
+		return sha256_blocks_generic(state, data, nblocks);
 
-	hash[0] = read_octeon_64bit_hash_dword(0);
-	hash[1] = read_octeon_64bit_hash_dword(1);
-	hash[2] = read_octeon_64bit_hash_dword(2);
-	hash[3] = read_octeon_64bit_hash_dword(3);
-}
+	flags = octeon_crypto_enable(&cop2_state);
+	write_octeon_64bit_hash_dword(state64[0], 0);
+	write_octeon_64bit_hash_dword(state64[1], 1);
+	write_octeon_64bit_hash_dword(state64[2], 2);
+	write_octeon_64bit_hash_dword(state64[3], 3);
 
-static void octeon_sha256_transform(struct crypto_sha256_state *sctx,
-				    const u8 *src, int blocks)
-{
 	do {
-		const u64 *block = (const u64 *)src;
+		const u64 *block = (const u64 *)data;
 
 		write_octeon_64bit_block_dword(block[0], 0);
 		write_octeon_64bit_block_dword(block[1], 1);
 		write_octeon_64bit_block_dword(block[2], 2);
 		write_octeon_64bit_block_dword(block[3], 3);
 		write_octeon_64bit_block_dword(block[4], 4);
 		write_octeon_64bit_block_dword(block[5], 5);
 		write_octeon_64bit_block_dword(block[6], 6);
 		octeon_sha256_start(block[7]);
 
-		src += SHA256_BLOCK_SIZE;
-	} while (--blocks);
-}
-
-static int octeon_sha256_update(struct shash_desc *desc, const u8 *data,
-				unsigned int len)
-{
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
+		data += SHA256_BLOCK_SIZE;
+	} while (--nblocks);
 
-	octeon_sha256_read_hash(sctx);
-	octeon_crypto_disable(&state, flags);
-	return remain;
+	state64[0] = read_octeon_64bit_hash_dword(0);
+	state64[1] = read_octeon_64bit_hash_dword(1);
+	state64[2] = read_octeon_64bit_hash_dword(2);
+	state64[3] = read_octeon_64bit_hash_dword(3);
+	octeon_crypto_disable(&cop2_state, flags);
 }
+EXPORT_SYMBOL(sha256_blocks_arch);
 
-static int octeon_sha256_finup(struct shash_desc *desc, const u8 *src,
-			       unsigned int len, u8 *out)
+bool sha256_is_arch_optimized(void)
 {
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
+	return octeon_has_crypto();
 }
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
+EXPORT_SYMBOL(sha256_is_arch_optimized);
 
 MODULE_LICENSE("GPL");
-MODULE_DESCRIPTION("SHA-224 and SHA-256 Secure Hash Algorithm (OCTEON)");
+MODULE_DESCRIPTION("SHA-256 Secure Hash Algorithm (OCTEON)");
 MODULE_AUTHOR("Aaro Koskinen <aaro.koskinen@iki.fi>");
diff --git a/arch/mips/configs/cavium_octeon_defconfig b/arch/mips/configs/cavium_octeon_defconfig
index f523ee6f25bfe..88ae0aa85364b 100644
--- a/arch/mips/configs/cavium_octeon_defconfig
+++ b/arch/mips/configs/cavium_octeon_defconfig
@@ -155,11 +155,10 @@ CONFIG_SECURITY=y
 CONFIG_SECURITY_NETWORK=y
 CONFIG_CRYPTO_CBC=y
 CONFIG_CRYPTO_HMAC=y
 CONFIG_CRYPTO_MD5_OCTEON=y
 CONFIG_CRYPTO_SHA1_OCTEON=m
-CONFIG_CRYPTO_SHA256_OCTEON=m
 CONFIG_CRYPTO_SHA512_OCTEON=m
 CONFIG_CRYPTO_DES=y
 CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT=y
 CONFIG_DEBUG_FS=y
 CONFIG_MAGIC_SYSRQ=y
diff --git a/arch/mips/crypto/Kconfig b/arch/mips/crypto/Kconfig
index 9db1fd6d9f0e0..6bf073ae7613f 100644
--- a/arch/mips/crypto/Kconfig
+++ b/arch/mips/crypto/Kconfig
@@ -20,20 +20,10 @@ config CRYPTO_SHA1_OCTEON
 	help
 	  SHA-1 secure hash algorithm (FIPS 180)
 
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
 	select CRYPTO_SHA512
 	select CRYPTO_HASH
-- 
2.49.0


