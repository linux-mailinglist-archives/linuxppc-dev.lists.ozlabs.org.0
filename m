Return-Path: <linuxppc-dev+bounces-8120-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BBD2A9F687
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Apr 2025 19:02:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZmV9X20KSz30VZ;
	Tue, 29 Apr 2025 03:02:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1745859727;
	cv=none; b=j2j0ne1qSlV6IM01odIdbqrdE/p9sQjOhdY9gS12r2eL9IgF8d8aHbdo4FLyQN8AJ7BdJsUcgBeSGDUF8Z1ONjU3eQxgYMB62kkNM56jihPA3fZ/UQIXtWuPxA2usASVPdQTt/tTKuRO206IBxYTwoGdAwmUo+RwfcLi22VzvnP3PuGQk5Y6HN6hzplVqNtyYFFOLBD2ASgPVRogIWjAoVmsq1atv2deT1NPPxzhIcpfY34Kv7CtddI3ZXZXM9Pmbu2cXJohEL9ERT8kqQAaET4bdPfxt8XfoKOElllaTreDHe/DJkwexqrkIlXP6iD85SE+LzVJSdD/p7gwOs6ffg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1745859727; c=relaxed/relaxed;
	bh=Vo4jp6uMZ8Pk9Uyc9eVeVa3zNKhd14f7qLLrRb+qvyA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iB+Ghv2sDvD4SfnG3AnSmGYWKz2h8Qz6evI4lYlyDgCXVUyzHo7gkpNEtLhGscYUS0m8h5H0LygKhUkpCoGe/TpSd8lGx4xbkmF4p1i0vP/e5jNoWHq+sih4gsL0codq7glM9kGDQUKogknJp/AiH6aOm0Efipu91ymVdPfCN16AO7UwNAAXrQvBYh8AK1koxESzF5kZbaYl5+374tClPULqdPBqScgKXPoEDnghh7dz/TOGW96vlHkn3NQI+JJXP9eEnqoO1tQNJWqnHD3XUP69J5ZlfbdPDzmllsKRQ4eXvdmfAdjCzz4HbsQY1iELWf79j4+/QTrBYqrOVP55jg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=K9IaxG1k; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=K9IaxG1k;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZmV9S0hl0z30Qk
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Apr 2025 03:02:03 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E91674AAB6;
	Mon, 28 Apr 2025 17:01:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8475FC4CEEC;
	Mon, 28 Apr 2025 17:02:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745859721;
	bh=bGsC0u7uweX344w5/PsMWDq9aDk+1xpB1l7zPJURYiE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=K9IaxG1kmgfeXBRFAZUK98sqqexTepfBNDHlvFzpoKRktJpITIbU10s7ldQXT/H7K
	 GlSbT/zwT21TLN230f6jsKjxvU4ImNHdGqP1+eGwVtRVUPfrNQKogP6bVULrwgcL9d
	 2yHnbhLH+xcle9+yyUpzi3W9NJU06aHJNDlUwX5e0UCSyk83IMWyX9TjYY9RZBPsuM
	 QNUzypUmvCfgjvfQ19Y9k+OhttXV3XCauARPyxpFq2eLc9uIb4H7m++KJDwFKWRPbF
	 7jmXkt1rL7MyE4JbrWKTJxtsfvoO35f8lXj6pSe5CDU2c5k+ZxMJZZRDUP2JIAsvGC
	 Hlj1CnykMMAqQ==
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
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	Linus Torvalds <torvalds@linux-foundation.org>
Subject: [PATCH v4 05/13] crypto: mips/sha256 - implement library instead of shash
Date: Mon, 28 Apr 2025 10:00:30 -0700
Message-ID: <20250428170040.423825-6-ebiggers@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250428170040.423825-1-ebiggers@kernel.org>
References: <20250428170040.423825-1-ebiggers@kernel.org>
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


