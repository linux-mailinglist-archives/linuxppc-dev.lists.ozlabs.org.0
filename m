Return-Path: <linuxppc-dev+bounces-8127-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E6F35A9F6A7
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Apr 2025 19:03:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZmV9l1cfdz3bgr;
	Tue, 29 Apr 2025 03:02:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=139.178.84.217
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1745859732;
	cv=none; b=MshCWaur0EdyNfk5fTmR+Be5l7if0EhfUjJ35n9ZnZItmDDQMkVE7y9C1Y8Q7THJndttSczannlww7LO8Avh+bLpx02siv6wlNC/uJHraoEOnxUihEsd6AagaMR6Db7DzCAKB64LcmfGow3YI4BEssJaJ62sX2SQhnAnURStjBDMqu9vahspHidm30jN22QeiQtVkUMcTWa1eJeRtkTgwro2kL7UUQwUjQE/ETBYe1ec3H7U6JYMFVG/0KQoUKHWs4t4UN9Yxpe4WdVHl4aVG4zfuBR+EgNDLEVWLNaSSQnu4Qs/P85GqYc+uiFEuDga7NdgZ2Cz6O5zJyz+zbZLSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1745859732; c=relaxed/relaxed;
	bh=2sQ+p3+QrymWT8nnLjQCGwjWQ/0HSVRiTj7uvtZXqco=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NYc9pCptzdk9JhJZw+XM8Cal7Nxbv7ZVNn37iTKw4fQTkOiLpq/Jum8HPZ9CJHv1l0ruYlkFLte8kwFJAOkHNkxUu+7hjyqL8agAAHvIutt0gdN4tDNGbftKOMKJjY+B8nXK8w41BZoStWm+AYqfvYaaYFaUW82DwkBTNksY3+FDqKltcxsEylSF4gqeOACzejRJ7ANBY18LSpsI2VQQsiKcIY03yOylWM8++4VvRa+V9aI1+Kv9RsmM7nfZjjHs7D6q2b8S30q4D+wjzhY0yb5Nl7Gv9JOSYB91JQ30GNwT3RaYtyBaXaXd/pqN9CNbichSv5NBmMGGEwmFpU6r9g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=nWs3ffHS; dkim-atps=neutral; spf=pass (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=nWs3ffHS;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZmV9W1cx0z30VR
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Apr 2025 03:02:06 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id AA02E5C5C9E;
	Mon, 28 Apr 2025 16:59:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D1CAC4CEF1;
	Mon, 28 Apr 2025 17:02:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745859724;
	bh=EyLlHErF32h0yhzCTHHerfcTZv7f2HWfwZtPUgAb89A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nWs3ffHSwLFiJ+nJXf3tiPeNBseY3x1B+ENVAeoD3EdVbkOt6GHfVwDET7Nims8/3
	 LRO/AnB8eumBIYl1IrG/isEe8YzvvIuuZlDBaFtm9TZl2IxtKWh1EI8vmuUlKRjM2l
	 8ZxLBvupIrvKm0qqI1HQStsBzJw0hQ7TAaj3tOH5WniveJt2Na6wiXuDwvlJeCwfSi
	 OyDuS/19REKeKjFBsAv6Y0pLf6V5kHC7DubjM4pd7VvW2uzEcwbG/vnmCcmtLox90K
	 4OxyWmlbzmDjS8gS6kcq/SKtHVnoETrb2NJ19qgsrbu+LMQAw9dfhPQeA0JPVwiiv+
	 MD6xxLga7JX6Q==
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
Subject: [PATCH v4 10/13] crypto: sparc/sha256 - implement library instead of shash
Date: Mon, 28 Apr 2025 10:00:35 -0700
Message-ID: <20250428170040.423825-11-ebiggers@kernel.org>
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
X-Spam-Status: No, score=-6.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
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
 arch/sparc/crypto/Kconfig                |  10 --
 arch/sparc/crypto/Makefile               |   2 -
 arch/sparc/crypto/sha256_glue.c          | 128 -----------------------
 arch/sparc/lib/Makefile                  |   1 +
 arch/sparc/lib/crypto/Kconfig            |   8 ++
 arch/sparc/lib/crypto/Makefile           |   4 +
 arch/sparc/lib/crypto/sha256.c           |  64 ++++++++++++
 arch/sparc/{ => lib}/crypto/sha256_asm.S |   2 +-
 lib/crypto/Kconfig                       |   3 +
 9 files changed, 81 insertions(+), 141 deletions(-)
 delete mode 100644 arch/sparc/crypto/sha256_glue.c
 create mode 100644 arch/sparc/lib/crypto/Kconfig
 create mode 100644 arch/sparc/lib/crypto/Makefile
 create mode 100644 arch/sparc/lib/crypto/sha256.c
 rename arch/sparc/{ => lib}/crypto/sha256_asm.S (96%)

diff --git a/arch/sparc/crypto/Kconfig b/arch/sparc/crypto/Kconfig
index e858597de89db..a6ba319c42dce 100644
--- a/arch/sparc/crypto/Kconfig
+++ b/arch/sparc/crypto/Kconfig
@@ -34,20 +34,10 @@ config CRYPTO_SHA1_SPARC64
 	help
 	  SHA-1 secure hash algorithm (FIPS 180)
 
 	  Architecture: sparc64
 
-config CRYPTO_SHA256_SPARC64
-	tristate "Hash functions: SHA-224 and SHA-256"
-	depends on SPARC64
-	select CRYPTO_SHA256
-	select CRYPTO_HASH
-	help
-	  SHA-224 and SHA-256 secure hash algorithms (FIPS 180)
-
-	  Architecture: sparc64 using crypto instructions, when available
-
 config CRYPTO_SHA512_SPARC64
 	tristate "Hash functions: SHA-384 and SHA-512"
 	depends on SPARC64
 	select CRYPTO_SHA512
 	select CRYPTO_HASH
diff --git a/arch/sparc/crypto/Makefile b/arch/sparc/crypto/Makefile
index a2d7fca40cb4b..701c39edb0d73 100644
--- a/arch/sparc/crypto/Makefile
+++ b/arch/sparc/crypto/Makefile
@@ -2,20 +2,18 @@
 #
 # Arch-specific CryptoAPI modules.
 #
 
 obj-$(CONFIG_CRYPTO_SHA1_SPARC64) += sha1-sparc64.o
-obj-$(CONFIG_CRYPTO_SHA256_SPARC64) += sha256-sparc64.o
 obj-$(CONFIG_CRYPTO_SHA512_SPARC64) += sha512-sparc64.o
 obj-$(CONFIG_CRYPTO_MD5_SPARC64) += md5-sparc64.o
 
 obj-$(CONFIG_CRYPTO_AES_SPARC64) += aes-sparc64.o
 obj-$(CONFIG_CRYPTO_DES_SPARC64) += des-sparc64.o
 obj-$(CONFIG_CRYPTO_CAMELLIA_SPARC64) += camellia-sparc64.o
 
 sha1-sparc64-y := sha1_asm.o sha1_glue.o
-sha256-sparc64-y := sha256_asm.o sha256_glue.o
 sha512-sparc64-y := sha512_asm.o sha512_glue.o
 md5-sparc64-y := md5_asm.o md5_glue.o
 
 aes-sparc64-y := aes_asm.o aes_glue.o
 des-sparc64-y := des_asm.o des_glue.o
diff --git a/arch/sparc/crypto/sha256_glue.c b/arch/sparc/crypto/sha256_glue.c
deleted file mode 100644
index 25008603a9868..0000000000000
--- a/arch/sparc/crypto/sha256_glue.c
+++ /dev/null
@@ -1,128 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/* Glue code for SHA256 hashing optimized for sparc64 crypto opcodes.
- *
- * This is based largely upon crypto/sha256_generic.c
- *
- * Copyright (c) Jean-Luc Cooke <jlcooke@certainkey.com>
- * Copyright (c) Andrew McDonald <andrew@mcdonald.org.uk>
- * Copyright (c) 2002 James Morris <jmorris@intercode.com.au>
- * SHA224 Support Copyright 2007 Intel Corporation <jonathan.lynch@intel.com>
- */
-
-#define pr_fmt(fmt)	KBUILD_MODNAME ": " fmt
-
-#include <asm/elf.h>
-#include <asm/opcodes.h>
-#include <asm/pstate.h>
-#include <crypto/internal/hash.h>
-#include <crypto/sha2.h>
-#include <crypto/sha256_base.h>
-#include <linux/kernel.h>
-#include <linux/module.h>
-
-asmlinkage void sha256_sparc64_transform(u32 *digest, const char *data,
-					 unsigned int rounds);
-
-static void sha256_block(struct crypto_sha256_state *sctx, const u8 *src,
-			 int blocks)
-{
-	sha256_sparc64_transform(sctx->state, src, blocks);
-}
-
-static int sha256_sparc64_update(struct shash_desc *desc, const u8 *data,
-				 unsigned int len)
-{
-	return sha256_base_do_update_blocks(desc, data, len, sha256_block);
-}
-
-static int sha256_sparc64_finup(struct shash_desc *desc, const u8 *src,
-				unsigned int len, u8 *out)
-{
-	sha256_base_do_finup(desc, src, len, sha256_block);
-	return sha256_base_finish(desc, out);
-}
-
-static struct shash_alg sha256_alg = {
-	.digestsize	=	SHA256_DIGEST_SIZE,
-	.init		=	sha256_base_init,
-	.update		=	sha256_sparc64_update,
-	.finup		=	sha256_sparc64_finup,
-	.descsize	=	sizeof(struct crypto_sha256_state),
-	.base		=	{
-		.cra_name	=	"sha256",
-		.cra_driver_name=	"sha256-sparc64",
-		.cra_priority	=	SPARC_CR_OPCODE_PRIORITY,
-		.cra_flags	=	CRYPTO_AHASH_ALG_BLOCK_ONLY |
-					CRYPTO_AHASH_ALG_FINUP_MAX,
-		.cra_blocksize	=	SHA256_BLOCK_SIZE,
-		.cra_module	=	THIS_MODULE,
-	}
-};
-
-static struct shash_alg sha224_alg = {
-	.digestsize	=	SHA224_DIGEST_SIZE,
-	.init		=	sha224_base_init,
-	.update		=	sha256_sparc64_update,
-	.finup		=	sha256_sparc64_finup,
-	.descsize	=	sizeof(struct crypto_sha256_state),
-	.base		=	{
-		.cra_name	=	"sha224",
-		.cra_driver_name=	"sha224-sparc64",
-		.cra_priority	=	SPARC_CR_OPCODE_PRIORITY,
-		.cra_flags	=	CRYPTO_AHASH_ALG_BLOCK_ONLY |
-					CRYPTO_AHASH_ALG_FINUP_MAX,
-		.cra_blocksize	=	SHA224_BLOCK_SIZE,
-		.cra_module	=	THIS_MODULE,
-	}
-};
-
-static bool __init sparc64_has_sha256_opcode(void)
-{
-	unsigned long cfr;
-
-	if (!(sparc64_elf_hwcap & HWCAP_SPARC_CRYPTO))
-		return false;
-
-	__asm__ __volatile__("rd %%asr26, %0" : "=r" (cfr));
-	if (!(cfr & CFR_SHA256))
-		return false;
-
-	return true;
-}
-
-static int __init sha256_sparc64_mod_init(void)
-{
-	if (sparc64_has_sha256_opcode()) {
-		int ret = crypto_register_shash(&sha224_alg);
-		if (ret < 0)
-			return ret;
-
-		ret = crypto_register_shash(&sha256_alg);
-		if (ret < 0) {
-			crypto_unregister_shash(&sha224_alg);
-			return ret;
-		}
-
-		pr_info("Using sparc64 sha256 opcode optimized SHA-256/SHA-224 implementation\n");
-		return 0;
-	}
-	pr_info("sparc64 sha256 opcode not available.\n");
-	return -ENODEV;
-}
-
-static void __exit sha256_sparc64_mod_fini(void)
-{
-	crypto_unregister_shash(&sha224_alg);
-	crypto_unregister_shash(&sha256_alg);
-}
-
-module_init(sha256_sparc64_mod_init);
-module_exit(sha256_sparc64_mod_fini);
-
-MODULE_LICENSE("GPL");
-MODULE_DESCRIPTION("SHA-224 and SHA-256 Secure Hash Algorithm, sparc64 sha256 opcode accelerated");
-
-MODULE_ALIAS_CRYPTO("sha224");
-MODULE_ALIAS_CRYPTO("sha256");
-
-#include "crop_devid.c"
diff --git a/arch/sparc/lib/Makefile b/arch/sparc/lib/Makefile
index 5724d0f356eb5..98887dc295a1e 100644
--- a/arch/sparc/lib/Makefile
+++ b/arch/sparc/lib/Makefile
@@ -2,10 +2,11 @@
 # Makefile for Sparc library files..
 #
 
 asflags-y := -ansi -DST_DIV0=0x02
 
+obj-y                 += crypto/
 lib-$(CONFIG_SPARC32) += ashrdi3.o
 lib-$(CONFIG_SPARC32) += memcpy.o memset.o
 lib-y                 += strlen.o
 lib-y                 += checksum_$(BITS).o
 lib-$(CONFIG_SPARC32) += blockops.o
diff --git a/arch/sparc/lib/crypto/Kconfig b/arch/sparc/lib/crypto/Kconfig
new file mode 100644
index 0000000000000..e5c3e4d3dba62
--- /dev/null
+++ b/arch/sparc/lib/crypto/Kconfig
@@ -0,0 +1,8 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+config CRYPTO_SHA256_SPARC64
+	tristate
+	depends on SPARC64
+	default CRYPTO_LIB_SHA256
+	select CRYPTO_ARCH_HAVE_LIB_SHA256
+	select CRYPTO_LIB_SHA256_GENERIC
diff --git a/arch/sparc/lib/crypto/Makefile b/arch/sparc/lib/crypto/Makefile
new file mode 100644
index 0000000000000..75ee244ad6f79
--- /dev/null
+++ b/arch/sparc/lib/crypto/Makefile
@@ -0,0 +1,4 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+obj-$(CONFIG_CRYPTO_SHA256_SPARC64) += sha256-sparc64.o
+sha256-sparc64-y := sha256.o sha256_asm.o
diff --git a/arch/sparc/lib/crypto/sha256.c b/arch/sparc/lib/crypto/sha256.c
new file mode 100644
index 0000000000000..6f118a23d210a
--- /dev/null
+++ b/arch/sparc/lib/crypto/sha256.c
@@ -0,0 +1,64 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * SHA-256 accelerated using the sparc64 sha256 opcodes
+ *
+ * Copyright (c) Jean-Luc Cooke <jlcooke@certainkey.com>
+ * Copyright (c) Andrew McDonald <andrew@mcdonald.org.uk>
+ * Copyright (c) 2002 James Morris <jmorris@intercode.com.au>
+ * SHA224 Support Copyright 2007 Intel Corporation <jonathan.lynch@intel.com>
+ */
+
+#define pr_fmt(fmt)	KBUILD_MODNAME ": " fmt
+
+#include <asm/elf.h>
+#include <asm/opcodes.h>
+#include <asm/pstate.h>
+#include <crypto/internal/sha2.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+
+static __ro_after_init DEFINE_STATIC_KEY_FALSE(have_sha256_opcodes);
+
+asmlinkage void sha256_sparc64_transform(u32 state[SHA256_STATE_WORDS],
+					 const u8 *data, size_t nblocks);
+
+void sha256_blocks_arch(u32 state[SHA256_STATE_WORDS],
+			const u8 *data, size_t nblocks)
+{
+	if (static_branch_likely(&have_sha256_opcodes))
+		sha256_sparc64_transform(state, data, nblocks);
+	else
+		sha256_blocks_generic(state, data, nblocks);
+}
+EXPORT_SYMBOL(sha256_blocks_arch);
+
+bool sha256_is_arch_optimized(void)
+{
+	return static_key_enabled(&have_sha256_opcodes);
+}
+EXPORT_SYMBOL(sha256_is_arch_optimized);
+
+static int __init sha256_sparc64_mod_init(void)
+{
+	unsigned long cfr;
+
+	if (!(sparc64_elf_hwcap & HWCAP_SPARC_CRYPTO))
+		return 0;
+
+	__asm__ __volatile__("rd %%asr26, %0" : "=r" (cfr));
+	if (!(cfr & CFR_SHA256))
+		return 0;
+
+	static_branch_enable(&have_sha256_opcodes);
+	pr_info("Using sparc64 sha256 opcode optimized SHA-256/SHA-224 implementation\n");
+	return 0;
+}
+arch_initcall(sha256_sparc64_mod_init);
+
+static void __exit sha256_sparc64_mod_exit(void)
+{
+}
+module_exit(sha256_sparc64_mod_exit);
+
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("SHA-256 accelerated using the sparc64 sha256 opcodes");
diff --git a/arch/sparc/crypto/sha256_asm.S b/arch/sparc/lib/crypto/sha256_asm.S
similarity index 96%
rename from arch/sparc/crypto/sha256_asm.S
rename to arch/sparc/lib/crypto/sha256_asm.S
index 8ce88611e98ad..ddcdd3daf31e3 100644
--- a/arch/sparc/crypto/sha256_asm.S
+++ b/arch/sparc/lib/crypto/sha256_asm.S
@@ -2,11 +2,11 @@
 #include <linux/linkage.h>
 #include <asm/opcodes.h>
 #include <asm/visasm.h>
 
 ENTRY(sha256_sparc64_transform)
-	/* %o0 = digest, %o1 = data, %o2 = rounds */
+	/* %o0 = state, %o1 = data, %o2 = nblocks */
 	VISEntryHalf
 	ld	[%o0 + 0x00], %f0
 	ld	[%o0 + 0x04], %f1
 	ld	[%o0 + 0x08], %f2
 	ld	[%o0 + 0x0c], %f3
diff --git a/lib/crypto/Kconfig b/lib/crypto/Kconfig
index 7fe678047939b..6319358b38c20 100644
--- a/lib/crypto/Kconfig
+++ b/lib/crypto/Kconfig
@@ -179,10 +179,13 @@ if RISCV
 source "arch/riscv/lib/crypto/Kconfig"
 endif
 if S390
 source "arch/s390/lib/crypto/Kconfig"
 endif
+if SPARC
+source "arch/sparc/lib/crypto/Kconfig"
+endif
 if X86
 source "arch/x86/lib/crypto/Kconfig"
 endif
 endif
 
-- 
2.49.0


