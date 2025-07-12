Return-Path: <linuxppc-dev+bounces-10212-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D49FB02DB8
	for <lists+linuxppc-dev@lfdr.de>; Sun, 13 Jul 2025 01:27:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bfl8S6xBtz3bpS;
	Sun, 13 Jul 2025 09:26:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1752362792;
	cv=none; b=ZaczsrtKdd5bBkgsAWiFbAQBhmHfrC0CECJlHS7uZHwgTbKJCTsbaBROJgfMfEobO0x65i1AbPUCmP13Z16D8Vzj7CEDAu7y/4X4zPqvP8iodDRyMwLGSMvckG+Y0eOD7TXX3Ffc1xu2AZ1NWuslg9Pfq/H3P9CJgT9PX5IKc60a/IuI5L4aWhvSn1O8i6x31oRpjrnY9RrEZUPDGj3+0ULaE43Vj6MYZuQkjXspVl26CNsN4mRhOzkJXQ49i/iG6waEFNu2sutXd6pAs+rytsKZ3SM7/4r/uhRF9hhYgg3MOwBnDGIDBd6mu22vwfQFvyiLLfL9ZUbn6e8OwFY5Hg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1752362792; c=relaxed/relaxed;
	bh=HNWWsKh64rxYoYsd5FB4+JxWx9NdtbkvvWlgYyP1j+Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RqzlnlLgweZkx7AIT8bPCLHBUIk2C6jz2uWEHG7Ixcz8ixqD46RjtFv+ukcooeLhqBKtgj0e9MvuBKfjPRsdsgmIKc6vvBu5PJkvrUfKiKdVV7VhCRN+sT615FRBb3VI5e71Njsyw3J8sdHnYkl2m57eIVIgHDE2yae39y1CQ2vu8yXQyQzHO6pCUxFSjzUroh2oaSkvbe89KJn7UNMpHOOKX+AzdtQDOaj8vbvv/bfGaUs8yFJk+yomP0y/U/oBImVxD8KWTIiMUforwrnwfT9NgkP6yk8tNrNSbbKxkRxKtgejZ9DrCWLOy7nAfQmT4p3+ULSrA/YtpAOxPr4qiA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ql03WPlf; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ql03WPlf;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bfl8L3T6yz3bby
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 13 Jul 2025 09:26:26 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A748546CC7;
	Sat, 12 Jul 2025 23:26:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C1C4C4CEF7;
	Sat, 12 Jul 2025 23:26:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752362784;
	bh=7ZRIBZU5x4vLuGnKLqYWd5FSpgoUhoGAtMZsYPpXQZI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ql03WPlfahGzZKJvzjVHpg0MVKVv87jg4wSl6hXWxAStNBs0vKSuNhJLBZoY8lT3v
	 5JD9s4EBAGSslO44R/DSdr8IZL8xST5Ov/Il60WNomC/QH7OXf8WuVlBc+t9f3BDxH
	 XTkmyQqqa2O5DpZXC+IYi1ApggxeJ08yYBDPXzLwps7Q/oOaCWGAenJcMFlX9THEDe
	 cUQ3jYmhk4MotHHTrip9lxdL8x8P2VSXwC7Z6t1cTYdsfsUtvcd6ug3fLIi7HmkOOu
	 gUP6YVxLUNYdVrCjjpvTNpSDXnMmeq42Rp8KpVFpi17210zsJAX5MfRw4j+HAeS/iL
	 wi+5ogv9RDvMA==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org,
	x86@kernel.org,
	Eric Biggers <ebiggers@kernel.org>
Subject: [PATCH 09/26] lib/crypto: mips/sha1: Migrate optimized code into library
Date: Sat, 12 Jul 2025 16:23:00 -0700
Message-ID: <20250712232329.818226-10-ebiggers@kernel.org>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250712232329.818226-1-ebiggers@kernel.org>
References: <20250712232329.818226-1-ebiggers@kernel.org>
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

Instead of exposing the mips-optimized SHA-1 code via mips-specific
crypto_shash algorithms, instead just implement the sha1_blocks()
library function.  This is much simpler, it makes the SHA-1 library
functions be mips-optimized, and it fixes the longstanding issue where
the mips-optimized SHA-1 code was disabled by default.  SHA-1 still
remains available through crypto_shash, but individual architectures no
longer need to handle it.

Note: to see the diff from arch/mips/cavium-octeon/crypto/octeon-sha1.c
to lib/crypto/mips/sha1.h, view this commit with 'git show -M10'.

Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 arch/mips/cavium-octeon/crypto/Makefile      |   1 -
 arch/mips/cavium-octeon/crypto/octeon-sha1.c | 146 -------------------
 arch/mips/configs/cavium_octeon_defconfig    |   1 -
 arch/mips/crypto/Kconfig                     |  10 --
 lib/crypto/Kconfig                           |   1 +
 lib/crypto/mips/sha1.h                       |  81 ++++++++++
 6 files changed, 82 insertions(+), 158 deletions(-)
 delete mode 100644 arch/mips/cavium-octeon/crypto/octeon-sha1.c
 create mode 100644 lib/crypto/mips/sha1.h

diff --git a/arch/mips/cavium-octeon/crypto/Makefile b/arch/mips/cavium-octeon/crypto/Makefile
index db428e4b30bce..83f2f5dd93ccc 100644
--- a/arch/mips/cavium-octeon/crypto/Makefile
+++ b/arch/mips/cavium-octeon/crypto/Makefile
@@ -4,6 +4,5 @@
 #
 
 obj-y += octeon-crypto.o
 
 obj-$(CONFIG_CRYPTO_MD5_OCTEON)		+= octeon-md5.o
-obj-$(CONFIG_CRYPTO_SHA1_OCTEON)	+= octeon-sha1.o
diff --git a/arch/mips/cavium-octeon/crypto/octeon-sha1.c b/arch/mips/cavium-octeon/crypto/octeon-sha1.c
deleted file mode 100644
index e4a369a7764fb..0000000000000
--- a/arch/mips/cavium-octeon/crypto/octeon-sha1.c
+++ /dev/null
@@ -1,146 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-or-later
-/*
- * Cryptographic API.
- *
- * SHA1 Secure Hash Algorithm.
- *
- * Adapted for OCTEON by Aaro Koskinen <aaro.koskinen@iki.fi>.
- *
- * Based on crypto/sha1_generic.c, which is:
- *
- * Copyright (c) Alan Smithee.
- * Copyright (c) Andrew McDonald <andrew@mcdonald.org.uk>
- * Copyright (c) Jean-Francois Dive <jef@linuxbe.org>
- */
-
-#include <asm/octeon/crypto.h>
-#include <asm/octeon/octeon.h>
-#include <crypto/internal/hash.h>
-#include <crypto/sha1.h>
-#include <crypto/sha1_base.h>
-#include <linux/errno.h>
-#include <linux/kernel.h>
-#include <linux/module.h>
-
-/*
- * We pass everything as 64-bit. OCTEON can handle misaligned data.
- */
-
-static void octeon_sha1_store_hash(struct sha1_state *sctx)
-{
-	u64 *hash = (u64 *)sctx->state;
-	union {
-		u32 word[2];
-		u64 dword;
-	} hash_tail = { { sctx->state[4], } };
-
-	write_octeon_64bit_hash_dword(hash[0], 0);
-	write_octeon_64bit_hash_dword(hash[1], 1);
-	write_octeon_64bit_hash_dword(hash_tail.dword, 2);
-	memzero_explicit(&hash_tail.word[0], sizeof(hash_tail.word[0]));
-}
-
-static void octeon_sha1_read_hash(struct sha1_state *sctx)
-{
-	u64 *hash = (u64 *)sctx->state;
-	union {
-		u32 word[2];
-		u64 dword;
-	} hash_tail;
-
-	hash[0]		= read_octeon_64bit_hash_dword(0);
-	hash[1]		= read_octeon_64bit_hash_dword(1);
-	hash_tail.dword	= read_octeon_64bit_hash_dword(2);
-	sctx->state[4]	= hash_tail.word[0];
-	memzero_explicit(&hash_tail.dword, sizeof(hash_tail.dword));
-}
-
-static void octeon_sha1_transform(struct sha1_state *sctx, const u8 *src,
-				  int blocks)
-{
-	do {
-		const u64 *block = (const u64 *)src;
-
-		write_octeon_64bit_block_dword(block[0], 0);
-		write_octeon_64bit_block_dword(block[1], 1);
-		write_octeon_64bit_block_dword(block[2], 2);
-		write_octeon_64bit_block_dword(block[3], 3);
-		write_octeon_64bit_block_dword(block[4], 4);
-		write_octeon_64bit_block_dword(block[5], 5);
-		write_octeon_64bit_block_dword(block[6], 6);
-		octeon_sha1_start(block[7]);
-
-		src += SHA1_BLOCK_SIZE;
-	} while (--blocks);
-}
-
-static int octeon_sha1_update(struct shash_desc *desc, const u8 *data,
-			unsigned int len)
-{
-	struct sha1_state *sctx = shash_desc_ctx(desc);
-	struct octeon_cop2_state state;
-	unsigned long flags;
-	int remain;
-
-	flags = octeon_crypto_enable(&state);
-	octeon_sha1_store_hash(sctx);
-
-	remain = sha1_base_do_update_blocks(desc, data, len,
-					    octeon_sha1_transform);
-
-	octeon_sha1_read_hash(sctx);
-	octeon_crypto_disable(&state, flags);
-	return remain;
-}
-
-static int octeon_sha1_finup(struct shash_desc *desc, const u8 *src,
-			     unsigned int len, u8 *out)
-{
-	struct sha1_state *sctx = shash_desc_ctx(desc);
-	struct octeon_cop2_state state;
-	unsigned long flags;
-
-	flags = octeon_crypto_enable(&state);
-	octeon_sha1_store_hash(sctx);
-
-	sha1_base_do_finup(desc, src, len, octeon_sha1_transform);
-
-	octeon_sha1_read_hash(sctx);
-	octeon_crypto_disable(&state, flags);
-	return sha1_base_finish(desc, out);
-}
-
-static struct shash_alg octeon_sha1_alg = {
-	.digestsize	=	SHA1_DIGEST_SIZE,
-	.init		=	sha1_base_init,
-	.update		=	octeon_sha1_update,
-	.finup		=	octeon_sha1_finup,
-	.descsize	=	SHA1_STATE_SIZE,
-	.base		=	{
-		.cra_name	=	"sha1",
-		.cra_driver_name=	"octeon-sha1",
-		.cra_priority	=	OCTEON_CR_OPCODE_PRIORITY,
-		.cra_flags	=	CRYPTO_AHASH_ALG_BLOCK_ONLY,
-		.cra_blocksize	=	SHA1_BLOCK_SIZE,
-		.cra_module	=	THIS_MODULE,
-	}
-};
-
-static int __init octeon_sha1_mod_init(void)
-{
-	if (!octeon_has_crypto())
-		return -ENOTSUPP;
-	return crypto_register_shash(&octeon_sha1_alg);
-}
-
-static void __exit octeon_sha1_mod_fini(void)
-{
-	crypto_unregister_shash(&octeon_sha1_alg);
-}
-
-module_init(octeon_sha1_mod_init);
-module_exit(octeon_sha1_mod_fini);
-
-MODULE_LICENSE("GPL");
-MODULE_DESCRIPTION("SHA1 Secure Hash Algorithm (OCTEON)");
-MODULE_AUTHOR("Aaro Koskinen <aaro.koskinen@iki.fi>");
diff --git a/arch/mips/configs/cavium_octeon_defconfig b/arch/mips/configs/cavium_octeon_defconfig
index effdfb2bb738b..3f50e1d78894a 100644
--- a/arch/mips/configs/cavium_octeon_defconfig
+++ b/arch/mips/configs/cavium_octeon_defconfig
@@ -154,11 +154,10 @@ CONFIG_NLS_UTF8=y
 CONFIG_SECURITY=y
 CONFIG_SECURITY_NETWORK=y
 CONFIG_CRYPTO_CBC=y
 CONFIG_CRYPTO_HMAC=y
 CONFIG_CRYPTO_MD5_OCTEON=y
-CONFIG_CRYPTO_SHA1_OCTEON=m
 CONFIG_CRYPTO_DES=y
 CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT=y
 CONFIG_DEBUG_FS=y
 CONFIG_MAGIC_SYSRQ=y
 # CONFIG_SCHED_DEBUG is not set
diff --git a/arch/mips/crypto/Kconfig b/arch/mips/crypto/Kconfig
index 51a76a5ee3b16..7b91f4ec65bff 100644
--- a/arch/mips/crypto/Kconfig
+++ b/arch/mips/crypto/Kconfig
@@ -10,16 +10,6 @@ config CRYPTO_MD5_OCTEON
 	help
 	  MD5 message digest algorithm (RFC1321)
 
 	  Architecture: mips OCTEON using crypto instructions, when available
 
-config CRYPTO_SHA1_OCTEON
-	tristate "Hash functions: SHA-1 (OCTEON)"
-	depends on CPU_CAVIUM_OCTEON
-	select CRYPTO_SHA1
-	select CRYPTO_HASH
-	help
-	  SHA-1 secure hash algorithm (FIPS 180)
-
-	  Architecture: mips OCTEON
-
 endmenu
diff --git a/lib/crypto/Kconfig b/lib/crypto/Kconfig
index 189bdae58c812..278ac6a7eca97 100644
--- a/lib/crypto/Kconfig
+++ b/lib/crypto/Kconfig
@@ -146,10 +146,11 @@ config CRYPTO_LIB_SHA1
 config CRYPTO_LIB_SHA1_ARCH
 	bool
 	depends on CRYPTO_LIB_SHA1 && !UML
 	default y if ARM
 	default y if ARM64 && KERNEL_MODE_NEON
+	default y if MIPS && CPU_CAVIUM_OCTEON
 
 config CRYPTO_LIB_SHA256
 	tristate
 	help
 	  Enable the SHA-256 library interface. This interface may be fulfilled
diff --git a/lib/crypto/mips/sha1.h b/lib/crypto/mips/sha1.h
new file mode 100644
index 0000000000000..ba1965002e4a3
--- /dev/null
+++ b/lib/crypto/mips/sha1.h
@@ -0,0 +1,81 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * Cryptographic API.
+ *
+ * SHA1 Secure Hash Algorithm.
+ *
+ * Adapted for OCTEON by Aaro Koskinen <aaro.koskinen@iki.fi>.
+ *
+ * Based on crypto/sha1_generic.c, which is:
+ *
+ * Copyright (c) Alan Smithee.
+ * Copyright (c) Andrew McDonald <andrew@mcdonald.org.uk>
+ * Copyright (c) Jean-Francois Dive <jef@linuxbe.org>
+ */
+
+#include <asm/octeon/crypto.h>
+#include <asm/octeon/octeon.h>
+
+/*
+ * We pass everything as 64-bit. OCTEON can handle misaligned data.
+ */
+
+static void octeon_sha1_store_hash(struct sha1_block_state *state)
+{
+	u64 *hash = (u64 *)&state->h[0];
+	union {
+		u32 word[2];
+		u64 dword;
+	} hash_tail = { { state->h[4], } };
+
+	write_octeon_64bit_hash_dword(hash[0], 0);
+	write_octeon_64bit_hash_dword(hash[1], 1);
+	write_octeon_64bit_hash_dword(hash_tail.dword, 2);
+	memzero_explicit(&hash_tail.word[0], sizeof(hash_tail.word[0]));
+}
+
+static void octeon_sha1_read_hash(struct sha1_block_state *state)
+{
+	u64 *hash = (u64 *)&state->h[0];
+	union {
+		u32 word[2];
+		u64 dword;
+	} hash_tail;
+
+	hash[0]		= read_octeon_64bit_hash_dword(0);
+	hash[1]		= read_octeon_64bit_hash_dword(1);
+	hash_tail.dword	= read_octeon_64bit_hash_dword(2);
+	state->h[4]	= hash_tail.word[0];
+	memzero_explicit(&hash_tail.dword, sizeof(hash_tail.dword));
+}
+
+static void sha1_blocks(struct sha1_block_state *state,
+			const u8 *data, size_t nblocks)
+{
+	struct octeon_cop2_state cop2_state;
+	unsigned long flags;
+
+	if (!octeon_has_crypto())
+		return sha1_blocks_generic(state, data, nblocks);
+
+	flags = octeon_crypto_enable(&cop2_state);
+	octeon_sha1_store_hash(state);
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
+		octeon_sha1_start(block[7]);
+
+		data += SHA1_BLOCK_SIZE;
+	} while (--nblocks);
+
+	octeon_sha1_read_hash(state);
+	octeon_crypto_disable(&cop2_state, flags);
+}
-- 
2.50.1


