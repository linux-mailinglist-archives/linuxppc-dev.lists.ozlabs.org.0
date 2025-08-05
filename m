Return-Path: <linuxppc-dev+bounces-10677-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E4A5BB1BC97
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Aug 2025 00:30:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bxSmQ2qPWz3bnr;
	Wed,  6 Aug 2025 08:30:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1754433014;
	cv=none; b=hunoynor+kishN+PcMDPiDvRF2zw21E7E+JsCkO/f8ZcGNaTpg3yeDz1mb+8yL7ueWdZN9lqAnqGCPpUMakrxdmLt44S0C4t58lD4k8sys5gFWiGnhzxtb11BjGS7LcWe0ax2Z0P03ZmHawijN9BJRV6PfhLyjNKIgjx+C1Z5Xo1kfr6nhcvPsr5DiYS6RGfHKLvaj1KNxucC+1Sn9a3XNlnAQgPRQSV0awdSy2QC5XXQwh+3X9uZW17MjKypmwoxCNfZBeYM/SBf3NyQmGXsA2VRrSC1VvxywCoa1P+YvT4KvJctPvt8PYK/VqkSI5UOwzikDQPz/Viva2TDnrn6w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1754433014; c=relaxed/relaxed;
	bh=usAtsDrQi367KGRyVfjeSC0A7DK4Rq0WSjgvF2sO/2w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cg6Rs2Pukvm858wj5MUs9TMnRaeq/+uiSebn2CHNDYSaYiOnpZxP69E+CZhPjP429+Fb0mp0G6EBgCkc9Z5NxOrREZNvN/0DHjZsgumDEvKceDXiJeq9k/1dFMFCXwhCRvLRGRU5pQzaxMh/szhsJgu8ChAzUG5vzH0s9i4jf9DQHAuBsnIpzOGQBVpuBHy5iyaZ2jo8jxqxDMET2qEA9mY6mYF5WzhsfC3sbytGuBs4/AjQ+eb2A9Ff61zRhy5vv49oYI5bp5GJXKZo4ypU/JACtNRjZvLwR8S0RCr3pj/TRRKZyzGt6iD0GuVcOWCuOhHfIwuY9mqmrrvOT8Ixzw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=GIw3YkHO; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=GIw3YkHO;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bxSmL5xdTz2xRs
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 Aug 2025 08:30:10 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0164945D1B;
	Tue,  5 Aug 2025 22:30:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60EE6C4CEF9;
	Tue,  5 Aug 2025 22:30:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754433007;
	bh=3SMCk1Bp8W8VsXMpjpu/X2NPIu92XHe+tlWFsAdpQtI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GIw3YkHONYpD1eXEpedG7ATsTUxQYVXVR02vcIsAeAOLImaIlMQ9oBFrQpmsFJFNH
	 Bqc8VGenm/IJJsFZ0YjiMKdjdRnGKHr0izqc4N+xJ/5WCgJvzb9oZ6tGVYJreBoT18
	 3mJh7KsqMJLerKOnSXBvM21CU4pTxy8UfmrYfV5c2kbEQ6u0jUcE1LVqunopuXHIBX
	 N7fnQUx2jPOi35GqjmQA0h4871BJYVvAW9I4gLYmc2nBjdZOj0Zyx5chqKgrUuR248
	 vSBsCpuQBrfqY8DpG17iBace67se7Dw7kW3SQCBJ9m7zYy4ZKuHBOva98cuyIMW844
	 YkCPcDuKFn56Q==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	sparclinux@vger.kernel.org,
	Eric Biggers <ebiggers@kernel.org>
Subject: [PATCH v2 2/7] lib/crypto: mips/md5: Migrate optimized code into library
Date: Tue,  5 Aug 2025 15:28:50 -0700
Message-ID: <20250805222855.10362-3-ebiggers@kernel.org>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250805222855.10362-1-ebiggers@kernel.org>
References: <20250805222855.10362-1-ebiggers@kernel.org>
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
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Instead of exposing the mips-optimized MD5 code via mips-specific
crypto_shash algorithms, instead just implement the md5_blocks() library
function.  This is much simpler, it makes the MD5 library functions be
mips-optimized, and it fixes the longstanding issue where the
mips-optimized MD5 code was disabled by default.  MD5 still remains
available through crypto_shash, but individual architectures no longer
need to handle it.

Note: to see the diff from arch/mips/cavium-octeon/crypto/octeon-md5.c
to lib/crypto/mips/md5.h, view this commit with 'git show -M10'.

Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 arch/mips/cavium-octeon/crypto/Makefile     |   2 -
 arch/mips/cavium-octeon/crypto/octeon-md5.c | 214 --------------------
 arch/mips/configs/cavium_octeon_defconfig   |   1 -
 arch/mips/crypto/Kconfig                    |  10 -
 lib/crypto/Kconfig                          |   1 +
 lib/crypto/mips/md5.h                       |  65 ++++++
 6 files changed, 66 insertions(+), 227 deletions(-)
 delete mode 100644 arch/mips/cavium-octeon/crypto/octeon-md5.c
 create mode 100644 lib/crypto/mips/md5.h

diff --git a/arch/mips/cavium-octeon/crypto/Makefile b/arch/mips/cavium-octeon/crypto/Makefile
index 83f2f5dd93ccc..b7d03e8a03187 100644
--- a/arch/mips/cavium-octeon/crypto/Makefile
+++ b/arch/mips/cavium-octeon/crypto/Makefile
@@ -2,7 +2,5 @@
 #
 # OCTEON-specific crypto modules.
 #
 
 obj-y += octeon-crypto.o
-
-obj-$(CONFIG_CRYPTO_MD5_OCTEON)		+= octeon-md5.o
diff --git a/arch/mips/cavium-octeon/crypto/octeon-md5.c b/arch/mips/cavium-octeon/crypto/octeon-md5.c
deleted file mode 100644
index a8ce831e2cebd..0000000000000
--- a/arch/mips/cavium-octeon/crypto/octeon-md5.c
+++ /dev/null
@@ -1,214 +0,0 @@
-/*
- * Cryptographic API.
- *
- * MD5 Message Digest Algorithm (RFC1321).
- *
- * Adapted for OCTEON by Aaro Koskinen <aaro.koskinen@iki.fi>.
- *
- * Based on crypto/md5.c, which is:
- *
- * Derived from cryptoapi implementation, originally based on the
- * public domain implementation written by Colin Plumb in 1993.
- *
- * Copyright (c) Cryptoapi developers.
- * Copyright (c) 2002 James Morris <jmorris@intercode.com.au>
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms of the GNU General Public License as published by the Free
- * Software Foundation; either version 2 of the License, or (at your option)
- * any later version.
- */
-
-#include <asm/octeon/crypto.h>
-#include <asm/octeon/octeon.h>
-#include <crypto/internal/hash.h>
-#include <crypto/md5.h>
-#include <linux/kernel.h>
-#include <linux/module.h>
-#include <linux/string.h>
-#include <linux/unaligned.h>
-
-struct octeon_md5_state {
-	__le32 hash[MD5_HASH_WORDS];
-	u64 byte_count;
-};
-
-/*
- * We pass everything as 64-bit. OCTEON can handle misaligned data.
- */
-
-static void octeon_md5_store_hash(struct octeon_md5_state *ctx)
-{
-	u64 *hash = (u64 *)ctx->hash;
-
-	write_octeon_64bit_hash_dword(hash[0], 0);
-	write_octeon_64bit_hash_dword(hash[1], 1);
-}
-
-static void octeon_md5_read_hash(struct octeon_md5_state *ctx)
-{
-	u64 *hash = (u64 *)ctx->hash;
-
-	hash[0] = read_octeon_64bit_hash_dword(0);
-	hash[1] = read_octeon_64bit_hash_dword(1);
-}
-
-static void octeon_md5_transform(const void *_block)
-{
-	const u64 *block = _block;
-
-	write_octeon_64bit_block_dword(block[0], 0);
-	write_octeon_64bit_block_dword(block[1], 1);
-	write_octeon_64bit_block_dword(block[2], 2);
-	write_octeon_64bit_block_dword(block[3], 3);
-	write_octeon_64bit_block_dword(block[4], 4);
-	write_octeon_64bit_block_dword(block[5], 5);
-	write_octeon_64bit_block_dword(block[6], 6);
-	octeon_md5_start(block[7]);
-}
-
-static int octeon_md5_init(struct shash_desc *desc)
-{
-	struct octeon_md5_state *mctx = shash_desc_ctx(desc);
-
-	mctx->hash[0] = cpu_to_le32(MD5_H0);
-	mctx->hash[1] = cpu_to_le32(MD5_H1);
-	mctx->hash[2] = cpu_to_le32(MD5_H2);
-	mctx->hash[3] = cpu_to_le32(MD5_H3);
-	mctx->byte_count = 0;
-
-	return 0;
-}
-
-static int octeon_md5_update(struct shash_desc *desc, const u8 *data,
-			     unsigned int len)
-{
-	struct octeon_md5_state *mctx = shash_desc_ctx(desc);
-	struct octeon_cop2_state state;
-	unsigned long flags;
-
-	mctx->byte_count += len;
-	flags = octeon_crypto_enable(&state);
-	octeon_md5_store_hash(mctx);
-
-	do {
-		octeon_md5_transform(data);
-		data += MD5_HMAC_BLOCK_SIZE;
-		len -= MD5_HMAC_BLOCK_SIZE;
-	} while (len >= MD5_HMAC_BLOCK_SIZE);
-
-	octeon_md5_read_hash(mctx);
-	octeon_crypto_disable(&state, flags);
-	mctx->byte_count -= len;
-	return len;
-}
-
-static int octeon_md5_finup(struct shash_desc *desc, const u8 *src,
-			    unsigned int offset, u8 *out)
-{
-	struct octeon_md5_state *mctx = shash_desc_ctx(desc);
-	int padding = 56 - (offset + 1);
-	struct octeon_cop2_state state;
-	u32 block[MD5_BLOCK_WORDS];
-	unsigned long flags;
-	char *p;
-
-	p = memcpy(block, src, offset);
-	p += offset;
-	*p++ = 0x80;
-
-	flags = octeon_crypto_enable(&state);
-	octeon_md5_store_hash(mctx);
-
-	if (padding < 0) {
-		memset(p, 0x00, padding + sizeof(u64));
-		octeon_md5_transform(block);
-		p = (char *)block;
-		padding = 56;
-	}
-
-	memset(p, 0, padding);
-	mctx->byte_count += offset;
-	block[14] = mctx->byte_count << 3;
-	block[15] = mctx->byte_count >> 29;
-	cpu_to_le32_array(block + 14, 2);
-	octeon_md5_transform(block);
-
-	octeon_md5_read_hash(mctx);
-	octeon_crypto_disable(&state, flags);
-
-	memzero_explicit(block, sizeof(block));
-	memcpy(out, mctx->hash, sizeof(mctx->hash));
-
-	return 0;
-}
-
-static int octeon_md5_export(struct shash_desc *desc, void *out)
-{
-	struct octeon_md5_state *ctx = shash_desc_ctx(desc);
-	union {
-		u8 *u8;
-		u32 *u32;
-		u64 *u64;
-	} p = { .u8 = out };
-	int i;
-
-	for (i = 0; i < MD5_HASH_WORDS; i++)
-		put_unaligned(le32_to_cpu(ctx->hash[i]), p.u32++);
-	put_unaligned(ctx->byte_count, p.u64);
-	return 0;
-}
-
-static int octeon_md5_import(struct shash_desc *desc, const void *in)
-{
-	struct octeon_md5_state *ctx = shash_desc_ctx(desc);
-	union {
-		const u8 *u8;
-		const u32 *u32;
-		const u64 *u64;
-	} p = { .u8 = in };
-	int i;
-
-	for (i = 0; i < MD5_HASH_WORDS; i++)
-		ctx->hash[i] = cpu_to_le32(get_unaligned(p.u32++));
-	ctx->byte_count = get_unaligned(p.u64);
-	return 0;
-}
-
-static struct shash_alg alg = {
-	.digestsize	=	MD5_DIGEST_SIZE,
-	.init		=	octeon_md5_init,
-	.update		=	octeon_md5_update,
-	.finup		=	octeon_md5_finup,
-	.export		=	octeon_md5_export,
-	.import		=	octeon_md5_import,
-	.statesize	=	MD5_STATE_SIZE,
-	.descsize	=	sizeof(struct octeon_md5_state),
-	.base		=	{
-		.cra_name	=	"md5",
-		.cra_driver_name=	"octeon-md5",
-		.cra_priority	=	OCTEON_CR_OPCODE_PRIORITY,
-		.cra_flags	=	CRYPTO_AHASH_ALG_BLOCK_ONLY,
-		.cra_blocksize	=	MD5_HMAC_BLOCK_SIZE,
-		.cra_module	=	THIS_MODULE,
-	}
-};
-
-static int __init md5_mod_init(void)
-{
-	if (!octeon_has_crypto())
-		return -ENOTSUPP;
-	return crypto_register_shash(&alg);
-}
-
-static void __exit md5_mod_fini(void)
-{
-	crypto_unregister_shash(&alg);
-}
-
-module_init(md5_mod_init);
-module_exit(md5_mod_fini);
-
-MODULE_LICENSE("GPL");
-MODULE_DESCRIPTION("MD5 Message Digest Algorithm (OCTEON)");
-MODULE_AUTHOR("Aaro Koskinen <aaro.koskinen@iki.fi>");
diff --git a/arch/mips/configs/cavium_octeon_defconfig b/arch/mips/configs/cavium_octeon_defconfig
index 3f50e1d78894a..68c363366bceb 100644
--- a/arch/mips/configs/cavium_octeon_defconfig
+++ b/arch/mips/configs/cavium_octeon_defconfig
@@ -153,11 +153,10 @@ CONFIG_NLS_ISO8859_1=y
 CONFIG_NLS_UTF8=y
 CONFIG_SECURITY=y
 CONFIG_SECURITY_NETWORK=y
 CONFIG_CRYPTO_CBC=y
 CONFIG_CRYPTO_HMAC=y
-CONFIG_CRYPTO_MD5_OCTEON=y
 CONFIG_CRYPTO_DES=y
 CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT=y
 CONFIG_DEBUG_FS=y
 CONFIG_MAGIC_SYSRQ=y
 # CONFIG_SCHED_DEBUG is not set
diff --git a/arch/mips/crypto/Kconfig b/arch/mips/crypto/Kconfig
index 7b91f4ec65bff..6a5bd5074867e 100644
--- a/arch/mips/crypto/Kconfig
+++ b/arch/mips/crypto/Kconfig
@@ -1,15 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0
 
 menu "Accelerated Cryptographic Algorithms for CPU (mips)"
 
-config CRYPTO_MD5_OCTEON
-	tristate "Digests: MD5 (OCTEON)"
-	depends on CPU_CAVIUM_OCTEON
-	select CRYPTO_MD5
-	select CRYPTO_HASH
-	help
-	  MD5 message digest algorithm (RFC1321)
-
-	  Architecture: mips OCTEON using crypto instructions, when available
-
 endmenu
diff --git a/lib/crypto/Kconfig b/lib/crypto/Kconfig
index 8ccb5b794b76a..fe2910c25f0ba 100644
--- a/lib/crypto/Kconfig
+++ b/lib/crypto/Kconfig
@@ -108,10 +108,11 @@ config CRYPTO_LIB_MD5
 	  uses any of the functions from <crypto/md5.h>.
 
 config CRYPTO_LIB_MD5_ARCH
 	bool
 	depends on CRYPTO_LIB_MD5 && !UML
+	default y if MIPS && CPU_CAVIUM_OCTEON
 
 config CRYPTO_LIB_POLY1305_RSIZE
 	int
 	default 2 if MIPS
 	default 11 if X86_64
diff --git a/lib/crypto/mips/md5.h b/lib/crypto/mips/md5.h
new file mode 100644
index 0000000000000..e08e28aeffa46
--- /dev/null
+++ b/lib/crypto/mips/md5.h
@@ -0,0 +1,65 @@
+/*
+ * Cryptographic API.
+ *
+ * MD5 Message Digest Algorithm (RFC1321).
+ *
+ * Adapted for OCTEON by Aaro Koskinen <aaro.koskinen@iki.fi>.
+ *
+ * Based on crypto/md5.c, which is:
+ *
+ * Derived from cryptoapi implementation, originally based on the
+ * public domain implementation written by Colin Plumb in 1993.
+ *
+ * Copyright (c) Cryptoapi developers.
+ * Copyright (c) 2002 James Morris <jmorris@intercode.com.au>
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms of the GNU General Public License as published by the Free
+ * Software Foundation; either version 2 of the License, or (at your option)
+ * any later version.
+ */
+
+#include <asm/octeon/crypto.h>
+#include <asm/octeon/octeon.h>
+
+/*
+ * We pass everything as 64-bit. OCTEON can handle misaligned data.
+ */
+
+static void md5_blocks(struct md5_block_state *state,
+		       const u8 *data, size_t nblocks)
+{
+	struct octeon_cop2_state cop2_state;
+	u64 *state64 = (u64 *)state;
+	unsigned long flags;
+
+	if (!octeon_has_crypto())
+		return md5_blocks_generic(state, data, nblocks);
+
+	cpu_to_le32_array(state->h, ARRAY_SIZE(state->h));
+
+	flags = octeon_crypto_enable(&cop2_state);
+	write_octeon_64bit_hash_dword(state64[0], 0);
+	write_octeon_64bit_hash_dword(state64[1], 1);
+
+	do {
+		const u64 *block = (const u64 *)data;
+
+		write_octeon_64bit_block_dword(block[0], 0);
+		write_octeon_64bit_block_dword(block[1], 1);
+		write_octeon_64bit_block_dword(block[2], 2);
+		write_octeon_64bit_block_dword(block[3], 3);
+		write_octeon_64bit_block_dword(block[4], 4);
+		write_octeon_64bit_block_dword(block[5], 5);
+		write_octeon_64bit_block_dword(block[6], 6);
+		octeon_md5_start(block[7]);
+
+		data += MD5_BLOCK_SIZE;
+	} while (--nblocks);
+
+	state64[0] = read_octeon_64bit_hash_dword(0);
+	state64[1] = read_octeon_64bit_hash_dword(1);
+	octeon_crypto_disable(&cop2_state, flags);
+
+	le32_to_cpu_array(state->h, ARRAY_SIZE(state->h));
+}
-- 
2.50.1


