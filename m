Return-Path: <linuxppc-dev+bounces-8049-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C7213A9DFB0
	for <lists+linuxppc-dev@lfdr.de>; Sun, 27 Apr 2025 08:32:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZlcCw1QWNz2yr1;
	Sun, 27 Apr 2025 16:31:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=144.6.53.87
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1745735468;
	cv=none; b=at8780tw7kDtxhlj+VYC4kHV5lx/DZm65zcBQpiFl/iE16i2yp9aavEfRz1PUPIT5amKYHZHryD8INKSQ9CuFR7hQPdkYAaxDla7FLpvz0jbhdDhzC4tIy5FTcT8CqX1AyvZ4SXJWYGrhpIFVZNqbUWH0hBU9D1kQU+dRpxNXZzMfXqAjbE/G/cKjY4oITMqmpWUUYE9Zb3fvDsMYJROD/xFToomToknLqzAZ12sqhHKIrLcPJYmSwHkW5IoRTZ8k8FhsywhZK+ubd3AJhwvjsAhxsySaWw6FWbW62iXq2EzPsuwSaJWEgdacQGFrYR8J+yZ4aIg7INAQOPGp/K72Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1745735468; c=relaxed/relaxed;
	bh=tAp+Yq2oPYdQjefDhIqTpmvZxjMW/FXB4OTXZxlKT5Q=;
	h=Date:Message-Id:In-Reply-To:References:From:Subject:To:Cc; b=kpc6a08lTUta3owKpTO/iHZAGLCFazTRuDOKSqv4lnI95Ocv+FcKUg0bT9g3m6EKbfCUNlbkQyVKFKW7yEh0rhWYwcBQXoJV69NOlT9y+QR/D4MV6E+G5hQFy1iYOB9oBqmWAPvMlLsBUrijlvr99nRIgh9VTyJ7nVrV/Jsds51QYI6OKPcJrcdbQ61IU8qWSIrGsaltls9AQvQfObM78n2CmP6GoQgr8PQ5z8pNtAuivHDa2I13Tv4ljJ+ugyuI8VmqhN42X2GHhcpwnGaN+TgrTJr7ntT+Y/rVa7puUA7M8AbOOXYN/6vD0mkqJCePBjDdZpz7OPbt0EDl1gobKA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au; dkim=pass (2048-bit key; unprotected) header.d=hmeau.com header.i=@hmeau.com header.a=rsa-sha256 header.s=formenos header.b=j0x1ozo5; dkim-atps=neutral; spf=pass (client-ip=144.6.53.87; helo=abb.hmeau.com; envelope-from=herbert@gondor.apana.org.au; receiver=lists.ozlabs.org) smtp.mailfrom=gondor.apana.org.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=hmeau.com header.i=@hmeau.com header.a=rsa-sha256 header.s=formenos header.b=j0x1ozo5;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gondor.apana.org.au (client-ip=144.6.53.87; helo=abb.hmeau.com; envelope-from=herbert@gondor.apana.org.au; receiver=lists.ozlabs.org)
Received: from abb.hmeau.com (abb.hmeau.com [144.6.53.87])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZlcCv3Rdjz2y0B
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 27 Apr 2025 16:31:07 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hmeau.com;
	s=formenos; h=Cc:To:Subject:From:References:In-Reply-To:Message-Id:Date:
	Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=tAp+Yq2oPYdQjefDhIqTpmvZxjMW/FXB4OTXZxlKT5Q=; b=j0x1ozo5aXX5tKUajh3t5zB4hk
	KhCrB0yHNP9tw7hNtXBe+xDjSgH8snPhIFi8/bxhOzIfLd1bn89nu67C4vXQnmim4ELxXjo5Fktw+
	f570JwfmMymmkTE2i4iTmo6Cc1IweJI/DP5g1ZHuQnh+/VsHT2pm1OYE/a0jUqms6bOcUMWFzfCOP
	HYmRKq2+xTQ0/nhW1js4FII6QGFT5Ia9nROL/BatspW5byOjlV06w6CqFBNp6Mt2l8ykFuXLaesia
	5yC/OLoMTR0R/YZW6Eoi4o9v4mGrPJRFo2wdTyfWGfhRhWyCsSu49iGsDbBnmMoE9oZrOXimnEWmX
	epkYXxqg==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1u8vXd-001LWp-0E;
	Sun, 27 Apr 2025 14:31:06 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Sun, 27 Apr 2025 14:31:05 +0800
Date: Sun, 27 Apr 2025 14:31:05 +0800
Message-Id: <05232da6c9a9a3b2a874032e18174b44a3b1284c.1745734678.git.herbert@gondor.apana.org.au>
In-Reply-To: <cover.1745734678.git.herbert@gondor.apana.org.au>
References: <cover.1745734678.git.herbert@gondor.apana.org.au>
From: Herbert Xu <herbert@gondor.apana.org.au>
Subject: [v2 PATCH 10/13] crypto: sparc/sha256 - implement library instead of
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
index e858597de89d..a6ba319c42dc 100644
--- a/arch/sparc/crypto/Kconfig
+++ b/arch/sparc/crypto/Kconfig
@@ -36,16 +36,6 @@ config CRYPTO_SHA1_SPARC64
 
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
diff --git a/arch/sparc/crypto/Makefile b/arch/sparc/crypto/Makefile
index a2d7fca40cb4..701c39edb0d7 100644
--- a/arch/sparc/crypto/Makefile
+++ b/arch/sparc/crypto/Makefile
@@ -4,7 +4,6 @@
 #
 
 obj-$(CONFIG_CRYPTO_SHA1_SPARC64) += sha1-sparc64.o
-obj-$(CONFIG_CRYPTO_SHA256_SPARC64) += sha256-sparc64.o
 obj-$(CONFIG_CRYPTO_SHA512_SPARC64) += sha512-sparc64.o
 obj-$(CONFIG_CRYPTO_MD5_SPARC64) += md5-sparc64.o
 
@@ -13,7 +12,6 @@ obj-$(CONFIG_CRYPTO_DES_SPARC64) += des-sparc64.o
 obj-$(CONFIG_CRYPTO_CAMELLIA_SPARC64) += camellia-sparc64.o
 
 sha1-sparc64-y := sha1_asm.o sha1_glue.o
-sha256-sparc64-y := sha256_asm.o sha256_glue.o
 sha512-sparc64-y := sha512_asm.o sha512_glue.o
 md5-sparc64-y := md5_asm.o md5_glue.o
 
diff --git a/arch/sparc/crypto/sha256_glue.c b/arch/sparc/crypto/sha256_glue.c
deleted file mode 100644
index 25008603a986..000000000000
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
index 5724d0f356eb..98887dc295a1 100644
--- a/arch/sparc/lib/Makefile
+++ b/arch/sparc/lib/Makefile
@@ -4,6 +4,7 @@
 
 asflags-y := -ansi -DST_DIV0=0x02
 
+obj-y                 += crypto/
 lib-$(CONFIG_SPARC32) += ashrdi3.o
 lib-$(CONFIG_SPARC32) += memcpy.o memset.o
 lib-y                 += strlen.o
diff --git a/arch/sparc/lib/crypto/Kconfig b/arch/sparc/lib/crypto/Kconfig
new file mode 100644
index 000000000000..e5c3e4d3dba6
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
index 000000000000..75ee244ad6f7
--- /dev/null
+++ b/arch/sparc/lib/crypto/Makefile
@@ -0,0 +1,4 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+obj-$(CONFIG_CRYPTO_SHA256_SPARC64) += sha256-sparc64.o
+sha256-sparc64-y := sha256.o sha256_asm.o
diff --git a/arch/sparc/lib/crypto/sha256.c b/arch/sparc/lib/crypto/sha256.c
new file mode 100644
index 000000000000..b4fc475dcc40
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
+EXPORT_SYMBOL_GPL(sha256_blocks_arch);
+
+bool sha256_is_arch_optimized(void)
+{
+	return static_key_enabled(&have_sha256_opcodes);
+}
+EXPORT_SYMBOL_GPL(sha256_is_arch_optimized);
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
index 8ce88611e98a..ddcdd3daf31e 100644
--- a/arch/sparc/crypto/sha256_asm.S
+++ b/arch/sparc/lib/crypto/sha256_asm.S
@@ -4,7 +4,7 @@
 #include <asm/visasm.h>
 
 ENTRY(sha256_sparc64_transform)
-	/* %o0 = digest, %o1 = data, %o2 = rounds */
+	/* %o0 = state, %o1 = data, %o2 = nblocks */
 	VISEntryHalf
 	ld	[%o0 + 0x00], %f0
 	ld	[%o0 + 0x04], %f1
diff --git a/lib/crypto/Kconfig b/lib/crypto/Kconfig
index ad0a4705682c..1ec1466108cc 100644
--- a/lib/crypto/Kconfig
+++ b/lib/crypto/Kconfig
@@ -189,6 +189,9 @@ endif
 if S390
 source "arch/s390/lib/crypto/Kconfig"
 endif
+if SPARC
+source "arch/sparc/lib/crypto/Kconfig"
+endif
 if X86
 source "arch/x86/lib/crypto/Kconfig"
 endif
-- 
2.39.5


