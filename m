Return-Path: <linuxppc-dev+bounces-8040-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BB65A9DF8D
	for <lists+linuxppc-dev@lfdr.de>; Sun, 27 Apr 2025 08:31:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZlcCZ1NTMz2yRn;
	Sun, 27 Apr 2025 16:30:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=144.6.53.87
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1745735450;
	cv=none; b=mlxXxpozXgWsVxY+NGMb0Gi4Mz9tvMly6b4traz/FAmdZgd8Sckr2gGTJ5rjrnrQM+n2DfmXxXPtyC73RldvnpZ2mxRMJ0Ngbeo5i8vdplx1u9FV4pnKcd2ix02lxt5tTmM4CN/f7WD4U6rkIqlGJu5lGHjDwknwYH5AKc//8PO65Dn4xASYru6n6E6wufm4RAFLNsqhliVHUCFKd0VPn+ynRM2seFUqHK6UynhRLAuiAp8VmI7wxIKI7mwKEWBGPORKPFSHBW1/23bgpvlg0sMs2b62VnZfTQ6COQCt1FRG/5TyLbSyiTFG142PXn8V5pBcd1MmwcmLAlPvuru92A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1745735450; c=relaxed/relaxed;
	bh=t3Tq0UhVKH4n4BMltF0AUrpU/0iBA7WNaW08HDNAOn0=;
	h=Date:Message-Id:In-Reply-To:References:From:Subject:To:Cc; b=eZUWLyp6BFblhKB3NgnTaKN8zxahOy7ybGgOdfaUKAl7039xsKnlCmCxkPv0XddxH+RXZpAr8D/kyUN7TfxumIT+HM0aXpHKnfXzcofdHcGvQfUP23DguYH6TMm2xFfBxC2ukN8CDiQTaH4pDjvRSiKyrgtXUa4sMwumb39WM33J8YkL05kVa7yZwFFd4S8oD94BhVQoBvK4cCvoYy7riaZwt/Zo2p7hzSJBYVUfuH4YzCk0VG74z4WJ4lkNfhLEtQJ0MW/B1PsAdl1MGEzNAkAFLh4V4BTmKGh6ywz2sGwDJMym7zNeEDdnBjnxesFWtRhIDo5Rvr9tpxYkX8lPuA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au; dkim=pass (2048-bit key; unprotected) header.d=hmeau.com header.i=@hmeau.com header.a=rsa-sha256 header.s=formenos header.b=f4OG3z0D; dkim-atps=neutral; spf=pass (client-ip=144.6.53.87; helo=abb.hmeau.com; envelope-from=herbert@gondor.apana.org.au; receiver=lists.ozlabs.org) smtp.mailfrom=gondor.apana.org.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=hmeau.com header.i=@hmeau.com header.a=rsa-sha256 header.s=formenos header.b=f4OG3z0D;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gondor.apana.org.au (client-ip=144.6.53.87; helo=abb.hmeau.com; envelope-from=herbert@gondor.apana.org.au; receiver=lists.ozlabs.org)
Received: from abb.hmeau.com (abb.hmeau.com [144.6.53.87])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZlcCW09qcz2y0B
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 27 Apr 2025 16:30:46 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hmeau.com;
	s=formenos; h=Cc:To:Subject:From:References:In-Reply-To:Message-Id:Date:
	Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=t3Tq0UhVKH4n4BMltF0AUrpU/0iBA7WNaW08HDNAOn0=; b=f4OG3z0DkjmRhh+5ayIDnnedsm
	sYjf2xoovBhVsRL3e/FCyq0bBFQtZmOXH0dKNw+YZw6h8tuPonGr/JbGXJAQgYYKYv9bgp4D+4oM7
	DIh70QAII12XoRfS4jXeAVNyknFj/XgrHtc6exZr1uhqNr4YXLiKUO74fsR63mkzIDn80NyWI4++y
	UFIApdDW5bozLxGR1+MexbiDcv8rxJaS2z/xX5tU+Hyl1e90aP8lneLYjLct6WRoCZ1N99AnEGfyl
	0BYXNeTJYBBEdcyspEuBupQVSaojUsHtWBjnHhsShva/fRhLhDEQ2Y/h34RsMWKG+CAitt5MLIV7P
	YBT7KkjQ==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1u8vXI-001LUY-0h;
	Sun, 27 Apr 2025 14:30:45 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Sun, 27 Apr 2025 14:30:44 +0800
Date: Sun, 27 Apr 2025 14:30:44 +0800
Message-Id: <ba675334e4a024fa21b38d13aefbe32866eccc3c.1745734678.git.herbert@gondor.apana.org.au>
In-Reply-To: <cover.1745734678.git.herbert@gondor.apana.org.au>
References: <cover.1745734678.git.herbert@gondor.apana.org.au>
From: Herbert Xu <herbert@gondor.apana.org.au>
Subject: [v2 PATCH 01/13] crypto: sha256 - support arch-optimized lib and
 expose through shash
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

As has been done for various other algorithms, rework the design of the
SHA-256 library to support arch-optimized implementations, and make
crypto/sha256.c expose both generic and arch-optimized shash algorithms
that wrap the library functions.

This allows users of the SHA-256 library functions to take advantage of
the arch-optimized code, and this makes it much simpler to integrate
SHA-256 for each architecture.

Note that sha256_base.h is not used in the new design.  It will be
removed once all the architecture-specific code has been updated.

Signed-off-by: Eric Biggers <ebiggers@google.com>

Expose the blocks interface and use that for shash.  Add a direct
entry point for the SIMD blocks functions so that the decision to
use SIMD or not occurs in the generic code.

Split the libsha256 module into two so that the arch sha256 module
can invoke the generic block function without creating a cycle.
Rejig the purgatory sha256 setup to make this work.

Co-developed-by: Herbert Xu <herbert@gondor.apana.org.au>
Signed-off-by: Herbert Xu <herbert@gondor.apana.org.au>
---
 arch/x86/purgatory/Makefile    |   3 -
 arch/x86/purgatory/sha256.c    |  15 +++
 crypto/Kconfig                 |   1 +
 crypto/Makefile                |   3 +-
 crypto/sha256.c                | 198 +++++++++++++++++++++++++++++++++
 crypto/sha256_generic.c        | 102 -----------------
 include/crypto/internal/sha2.h |  75 +++++++++++++
 include/crypto/sha2.h          |  15 +--
 include/crypto/sha256_base.h   |   9 +-
 lib/crypto/Kconfig             |  27 +++++
 lib/crypto/Makefile            |   1 +
 lib/crypto/sha256-generic.c    | 139 +++++++++++++++++++++++
 lib/crypto/sha256.c            | 144 +++++-------------------
 13 files changed, 494 insertions(+), 238 deletions(-)
 create mode 100644 arch/x86/purgatory/sha256.c
 create mode 100644 crypto/sha256.c
 delete mode 100644 crypto/sha256_generic.c
 create mode 100644 include/crypto/internal/sha2.h
 create mode 100644 lib/crypto/sha256-generic.c

diff --git a/arch/x86/purgatory/Makefile b/arch/x86/purgatory/Makefile
index ebdfd7b84feb..95cd396173f4 100644
--- a/arch/x86/purgatory/Makefile
+++ b/arch/x86/purgatory/Makefile
@@ -8,9 +8,6 @@ PURGATORY_OBJS = $(addprefix $(obj)/,$(purgatory-y))
 $(obj)/string.o: $(srctree)/arch/x86/boot/compressed/string.c FORCE
 	$(call if_changed_rule,cc_o_c)
 
-$(obj)/sha256.o: $(srctree)/lib/crypto/sha256.c FORCE
-	$(call if_changed_rule,cc_o_c)
-
 CFLAGS_sha256.o := -D__DISABLE_EXPORTS -D__NO_FORTIFY
 
 # When profile-guided optimization is enabled, llvm emits two different
diff --git a/arch/x86/purgatory/sha256.c b/arch/x86/purgatory/sha256.c
new file mode 100644
index 000000000000..43c00bbe8c93
--- /dev/null
+++ b/arch/x86/purgatory/sha256.c
@@ -0,0 +1,15 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * SHA-256, as specified in
+ * http://csrc.nist.gov/groups/STM/cavp/documents/shs/sha256-384-512.pdf
+ *
+ * SHA-256 code by Jean-Luc Cooke <jlcooke@certainkey.com>.
+ *
+ * Copyright (c) Jean-Luc Cooke <jlcooke@certainkey.com>
+ * Copyright (c) Andrew McDonald <andrew@mcdonald.org.uk>
+ * Copyright (c) 2002 James Morris <jmorris@intercode.com.au>
+ * Copyright (c) 2014 Red Hat Inc.
+ */
+
+#include "../../../lib/crypto/sha256-generic.c"
+#include "../../../lib/crypto/sha256.c"
diff --git a/crypto/Kconfig b/crypto/Kconfig
index 3cb5563dc4ab..7bfad077f308 100644
--- a/crypto/Kconfig
+++ b/crypto/Kconfig
@@ -982,6 +982,7 @@ config CRYPTO_SHA256
 	tristate "SHA-224 and SHA-256"
 	select CRYPTO_HASH
 	select CRYPTO_LIB_SHA256
+	select CRYPTO_LIB_SHA256_GENERIC
 	help
 	  SHA-224 and SHA-256 secure hash algorithms (FIPS 180, ISO/IEC 10118-3)
 
diff --git a/crypto/Makefile b/crypto/Makefile
index 587bc74b6d74..84f6911dc9ba 100644
--- a/crypto/Makefile
+++ b/crypto/Makefile
@@ -76,7 +76,8 @@ obj-$(CONFIG_CRYPTO_MD4) += md4.o
 obj-$(CONFIG_CRYPTO_MD5) += md5.o
 obj-$(CONFIG_CRYPTO_RMD160) += rmd160.o
 obj-$(CONFIG_CRYPTO_SHA1) += sha1_generic.o
-obj-$(CONFIG_CRYPTO_SHA256) += sha256_generic.o
+obj-$(CONFIG_CRYPTO_SHA256) += sha256.o
+CFLAGS_sha256.o += -DARCH=$(ARCH)
 obj-$(CONFIG_CRYPTO_SHA512) += sha512_generic.o
 obj-$(CONFIG_CRYPTO_SHA3) += sha3_generic.o
 obj-$(CONFIG_CRYPTO_SM3_GENERIC) += sm3_generic.o
diff --git a/crypto/sha256.c b/crypto/sha256.c
new file mode 100644
index 000000000000..78c8c78a6ec6
--- /dev/null
+++ b/crypto/sha256.c
@@ -0,0 +1,198 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Crypto API wrapper for the SHA-256 and SHA-224 library functions
+ *
+ * Copyright (c) Jean-Luc Cooke <jlcooke@certainkey.com>
+ * Copyright (c) Andrew McDonald <andrew@mcdonald.org.uk>
+ * Copyright (c) 2002 James Morris <jmorris@intercode.com.au>
+ * SHA224 Support Copyright 2007 Intel Corporation <jonathan.lynch@intel.com>
+ */
+#include <crypto/internal/hash.h>
+#include <crypto/internal/sha2.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+
+const u8 sha224_zero_message_hash[SHA224_DIGEST_SIZE] = {
+	0xd1, 0x4a, 0x02, 0x8c, 0x2a, 0x3a, 0x2b, 0xc9, 0x47,
+	0x61, 0x02, 0xbb, 0x28, 0x82, 0x34, 0xc4, 0x15, 0xa2,
+	0xb0, 0x1f, 0x82, 0x8e, 0xa6, 0x2a, 0xc5, 0xb3, 0xe4,
+	0x2f
+};
+EXPORT_SYMBOL_GPL(sha224_zero_message_hash);
+
+const u8 sha256_zero_message_hash[SHA256_DIGEST_SIZE] = {
+	0xe3, 0xb0, 0xc4, 0x42, 0x98, 0xfc, 0x1c, 0x14,
+	0x9a, 0xfb, 0xf4, 0xc8, 0x99, 0x6f, 0xb9, 0x24,
+	0x27, 0xae, 0x41, 0xe4, 0x64, 0x9b, 0x93, 0x4c,
+	0xa4, 0x95, 0x99, 0x1b, 0x78, 0x52, 0xb8, 0x55
+};
+EXPORT_SYMBOL_GPL(sha256_zero_message_hash);
+
+static int crypto_sha256_init(struct shash_desc *desc)
+{
+	sha256_init(shash_desc_ctx(desc));
+	return 0;
+}
+
+static int crypto_sha256_update_generic(struct shash_desc *desc, const u8 *data,
+					unsigned int len)
+{
+	struct crypto_sha256_state *sctx = shash_desc_ctx(desc);
+	int remain = len - round_down(len, SHA256_BLOCK_SIZE);
+
+	sctx->count += len - remain;
+	sha256_blocks_generic(sctx->state, data, len / SHA256_BLOCK_SIZE);
+	return remain;
+}
+
+static int __maybe_unused crypto_sha256_update_arch(
+	struct shash_desc *desc, const u8 *data, unsigned int len)
+{
+	struct crypto_sha256_state *sctx = shash_desc_ctx(desc);
+	int remain = len - round_down(len, SHA256_BLOCK_SIZE);
+
+	sctx->count += len - remain;
+	sha256_choose_blocks(sctx->state, data, len / SHA256_BLOCK_SIZE,
+			     false, true);
+	return remain;
+}
+
+static int crypto_sha256_finup_generic(struct shash_desc *desc, const u8 *data,
+				       unsigned int len, u8 *out)
+{
+	struct crypto_sha256_state *sctx = shash_desc_ctx(desc);
+	int remain = len;
+
+	if (remain >= SHA256_BLOCK_SIZE)
+		remain = crypto_sha256_update_generic(desc, data, remain);
+	sha256_finup(sctx, data + len - remain, remain, out,
+		     crypto_shash_digestsize(desc->tfm), true, false);
+	return 0;
+}
+
+static int __maybe_unused crypto_sha256_finup_arch(
+	struct shash_desc *desc, const u8 *data, unsigned int len, u8 *out)
+{
+	struct crypto_sha256_state *sctx = shash_desc_ctx(desc);
+	int remain = len;
+
+	if (remain >= SHA256_BLOCK_SIZE)
+		remain = crypto_sha256_update_arch(desc, data, remain);
+	sha256_finup(sctx, data + len - remain, remain, out,
+		     crypto_shash_digestsize(desc->tfm), false, true);
+	return 0;
+}
+
+static int crypto_sha256_digest_generic(struct shash_desc *desc, const u8 *data,
+					unsigned int len, u8 *out)
+{
+	crypto_sha256_init(desc);
+	return crypto_sha256_finup_generic(desc, data, len, out);
+}
+
+static int __maybe_unused crypto_sha256_digest_arch(
+	struct shash_desc *desc, const u8 *data, unsigned int len, u8 *out)
+{
+	crypto_sha256_init(desc);
+	return crypto_sha256_finup_arch(desc, data, len, out);
+}
+
+static int crypto_sha224_init(struct shash_desc *desc)
+{
+	sha224_init(shash_desc_ctx(desc));
+	return 0;
+}
+
+static struct shash_alg algs[] = {
+	{
+		.base.cra_name		= "sha256",
+		.base.cra_driver_name	= "sha256-generic",
+		.base.cra_priority	= 100,
+		.base.cra_flags		= CRYPTO_AHASH_ALG_BLOCK_ONLY |
+					  CRYPTO_AHASH_ALG_FINUP_MAX,
+		.base.cra_blocksize	= SHA256_BLOCK_SIZE,
+		.base.cra_module	= THIS_MODULE,
+		.digestsize		= SHA256_DIGEST_SIZE,
+		.init			= crypto_sha256_init,
+		.update			= crypto_sha256_update_generic,
+		.finup			= crypto_sha256_finup_generic,
+		.digest			= crypto_sha256_digest_generic,
+		.descsize		= sizeof(struct crypto_sha256_state),
+	},
+	{
+		.base.cra_name		= "sha224",
+		.base.cra_driver_name	= "sha224-generic",
+		.base.cra_priority	= 100,
+		.base.cra_flags		= CRYPTO_AHASH_ALG_BLOCK_ONLY |
+					  CRYPTO_AHASH_ALG_FINUP_MAX,
+		.base.cra_blocksize	= SHA224_BLOCK_SIZE,
+		.base.cra_module	= THIS_MODULE,
+		.digestsize		= SHA224_DIGEST_SIZE,
+		.init			= crypto_sha224_init,
+		.update			= crypto_sha256_update_generic,
+		.finup			= crypto_sha256_finup_generic,
+		.descsize		= sizeof(struct crypto_sha256_state),
+	},
+#ifdef CONFIG_CRYPTO_ARCH_HAVE_LIB_SHA256
+	{
+		.base.cra_name		= "sha256",
+		.base.cra_driver_name	= "sha256-" __stringify(ARCH),
+		.base.cra_priority	= 300,
+		.base.cra_flags		= CRYPTO_AHASH_ALG_BLOCK_ONLY |
+					  CRYPTO_AHASH_ALG_FINUP_MAX,
+		.base.cra_blocksize	= SHA256_BLOCK_SIZE,
+		.base.cra_module	= THIS_MODULE,
+		.digestsize		= SHA256_DIGEST_SIZE,
+		.init			= crypto_sha256_init,
+		.update			= crypto_sha256_update_arch,
+		.finup			= crypto_sha256_finup_arch,
+		.digest			= crypto_sha256_digest_arch,
+		.descsize		= sizeof(struct crypto_sha256_state),
+	},
+	{
+		.base.cra_name		= "sha224",
+		.base.cra_driver_name	= "sha224-" __stringify(ARCH),
+		.base.cra_priority	= 300,
+		.base.cra_flags		= CRYPTO_AHASH_ALG_BLOCK_ONLY |
+					  CRYPTO_AHASH_ALG_FINUP_MAX,
+		.base.cra_blocksize	= SHA224_BLOCK_SIZE,
+		.base.cra_module	= THIS_MODULE,
+		.digestsize		= SHA224_DIGEST_SIZE,
+		.init			= crypto_sha224_init,
+		.update			= crypto_sha256_update_arch,
+		.finup			= crypto_sha256_finup_arch,
+		.descsize		= sizeof(struct crypto_sha256_state),
+	},
+#endif
+};
+
+static unsigned int num_algs;
+
+static int __init crypto_sha256_mod_init(void)
+{
+	/* register the arch flavours only if they differ from generic */
+	num_algs = ARRAY_SIZE(algs);
+	if (IS_ENABLED(CONFIG_CRYPTO_ARCH_HAVE_LIB_SHA256)) {
+		BUILD_BUG_ON(ARRAY_SIZE(algs) % 2 != 0);
+		if (!sha256_is_arch_optimized())
+			num_algs /= 2;
+	}
+	return crypto_register_shashes(algs, num_algs);
+}
+subsys_initcall(crypto_sha256_mod_init);
+
+static void __exit crypto_sha256_mod_exit(void)
+{
+	crypto_unregister_shashes(algs, num_algs);
+}
+module_exit(crypto_sha256_mod_exit);
+
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("Crypto API wrapper for the SHA-256 and SHA-224 library functions");
+
+MODULE_ALIAS_CRYPTO("sha256");
+MODULE_ALIAS_CRYPTO("sha256-generic");
+MODULE_ALIAS_CRYPTO("sha256-" __stringify(ARCH));
+MODULE_ALIAS_CRYPTO("sha224");
+MODULE_ALIAS_CRYPTO("sha224-generic");
+MODULE_ALIAS_CRYPTO("sha224-" __stringify(ARCH));
diff --git a/crypto/sha256_generic.c b/crypto/sha256_generic.c
deleted file mode 100644
index 05084e5bbaec..000000000000
--- a/crypto/sha256_generic.c
+++ /dev/null
@@ -1,102 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-or-later
-/*
- * Crypto API wrapper for the generic SHA256 code from lib/crypto/sha256.c
- *
- * Copyright (c) Jean-Luc Cooke <jlcooke@certainkey.com>
- * Copyright (c) Andrew McDonald <andrew@mcdonald.org.uk>
- * Copyright (c) 2002 James Morris <jmorris@intercode.com.au>
- * SHA224 Support Copyright 2007 Intel Corporation <jonathan.lynch@intel.com>
- */
-#include <crypto/internal/hash.h>
-#include <crypto/sha2.h>
-#include <crypto/sha256_base.h>
-#include <linux/kernel.h>
-#include <linux/module.h>
-
-const u8 sha224_zero_message_hash[SHA224_DIGEST_SIZE] = {
-	0xd1, 0x4a, 0x02, 0x8c, 0x2a, 0x3a, 0x2b, 0xc9, 0x47,
-	0x61, 0x02, 0xbb, 0x28, 0x82, 0x34, 0xc4, 0x15, 0xa2,
-	0xb0, 0x1f, 0x82, 0x8e, 0xa6, 0x2a, 0xc5, 0xb3, 0xe4,
-	0x2f
-};
-EXPORT_SYMBOL_GPL(sha224_zero_message_hash);
-
-const u8 sha256_zero_message_hash[SHA256_DIGEST_SIZE] = {
-	0xe3, 0xb0, 0xc4, 0x42, 0x98, 0xfc, 0x1c, 0x14,
-	0x9a, 0xfb, 0xf4, 0xc8, 0x99, 0x6f, 0xb9, 0x24,
-	0x27, 0xae, 0x41, 0xe4, 0x64, 0x9b, 0x93, 0x4c,
-	0xa4, 0x95, 0x99, 0x1b, 0x78, 0x52, 0xb8, 0x55
-};
-EXPORT_SYMBOL_GPL(sha256_zero_message_hash);
-
-static void sha256_block(struct crypto_sha256_state *sctx, const u8 *input,
-			 int blocks)
-{
-	sha256_transform_blocks(sctx, input, blocks);
-}
-
-static int crypto_sha256_update(struct shash_desc *desc, const u8 *data,
-				unsigned int len)
-{
-	return sha256_base_do_update_blocks(desc, data, len, sha256_block);
-}
-
-static int crypto_sha256_finup(struct shash_desc *desc, const u8 *data,
-			       unsigned int len, u8 *hash)
-{
-	sha256_base_do_finup(desc, data, len, sha256_block);
-	return sha256_base_finish(desc, hash);
-}
-
-static struct shash_alg sha256_algs[2] = { {
-	.digestsize	=	SHA256_DIGEST_SIZE,
-	.init		=	sha256_base_init,
-	.update		=	crypto_sha256_update,
-	.finup		=	crypto_sha256_finup,
-	.descsize	=	sizeof(struct crypto_sha256_state),
-	.base		=	{
-		.cra_name	=	"sha256",
-		.cra_driver_name=	"sha256-generic",
-		.cra_priority	=	100,
-		.cra_flags	=	CRYPTO_AHASH_ALG_BLOCK_ONLY |
-					CRYPTO_AHASH_ALG_FINUP_MAX,
-		.cra_blocksize	=	SHA256_BLOCK_SIZE,
-		.cra_module	=	THIS_MODULE,
-	}
-}, {
-	.digestsize	=	SHA224_DIGEST_SIZE,
-	.init		=	sha224_base_init,
-	.update		=	crypto_sha256_update,
-	.finup		=	crypto_sha256_finup,
-	.descsize	=	sizeof(struct crypto_sha256_state),
-	.base		=	{
-		.cra_name	=	"sha224",
-		.cra_driver_name=	"sha224-generic",
-		.cra_priority	=	100,
-		.cra_flags	=	CRYPTO_AHASH_ALG_BLOCK_ONLY |
-					CRYPTO_AHASH_ALG_FINUP_MAX,
-		.cra_blocksize	=	SHA224_BLOCK_SIZE,
-		.cra_module	=	THIS_MODULE,
-	}
-} };
-
-static int __init sha256_generic_mod_init(void)
-{
-	return crypto_register_shashes(sha256_algs, ARRAY_SIZE(sha256_algs));
-}
-
-static void __exit sha256_generic_mod_fini(void)
-{
-	crypto_unregister_shashes(sha256_algs, ARRAY_SIZE(sha256_algs));
-}
-
-subsys_initcall(sha256_generic_mod_init);
-module_exit(sha256_generic_mod_fini);
-
-MODULE_LICENSE("GPL");
-MODULE_DESCRIPTION("SHA-224 and SHA-256 Secure Hash Algorithm");
-
-MODULE_ALIAS_CRYPTO("sha224");
-MODULE_ALIAS_CRYPTO("sha224-generic");
-MODULE_ALIAS_CRYPTO("sha256");
-MODULE_ALIAS_CRYPTO("sha256-generic");
diff --git a/include/crypto/internal/sha2.h b/include/crypto/internal/sha2.h
new file mode 100644
index 000000000000..09f622c2ae7d
--- /dev/null
+++ b/include/crypto/internal/sha2.h
@@ -0,0 +1,75 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#ifndef _CRYPTO_INTERNAL_SHA2_H
+#define _CRYPTO_INTERNAL_SHA2_H
+
+#include <crypto/internal/simd.h>
+#include <crypto/sha2.h>
+#include <linux/string.h>
+#include <linux/types.h>
+#include <linux/unaligned.h>
+
+void sha256_update_generic(struct sha256_state *sctx,
+			   const u8 *data, size_t len);
+void sha256_final_generic(struct sha256_state *sctx,
+			  u8 out[SHA256_DIGEST_SIZE]);
+void sha224_final_generic(struct sha256_state *sctx,
+			  u8 out[SHA224_DIGEST_SIZE]);
+
+#if IS_ENABLED(CONFIG_CRYPTO_ARCH_HAVE_LIB_SHA256)
+bool sha256_is_arch_optimized(void);
+#else
+static inline bool sha256_is_arch_optimized(void)
+{
+	return false;
+}
+#endif
+void sha256_blocks_generic(u32 state[SHA256_STATE_WORDS],
+			   const u8 *data, size_t nblocks);
+void sha256_blocks_arch(u32 state[SHA256_STATE_WORDS],
+			const u8 *data, size_t nblocks);
+void sha256_blocks_simd(u32 state[SHA256_STATE_WORDS],
+			const u8 *data, size_t nblocks);
+
+static inline void sha256_choose_blocks(
+	u32 state[SHA256_STATE_WORDS], const u8 *data, size_t nblocks,
+	bool force_generic, bool force_simd)
+{
+	if (!IS_ENABLED(CONFIG_CRYPTO_ARCH_HAVE_LIB_SHA256) || force_generic)
+		sha256_blocks_generic(state, data, nblocks);
+	else if (IS_ENABLED(CONFIG_CRYPTO_ARCH_HAVE_LIB_SHA256_SIMD) &&
+		 (force_simd || crypto_simd_usable()))
+		sha256_blocks_simd(state, data, nblocks);
+	else
+		sha256_blocks_arch(state, data, nblocks);
+}
+
+static __always_inline void sha256_finup(
+	struct crypto_sha256_state *sctx, const u8 *src, unsigned int len,
+	u8 *out, size_t digest_size, bool force_generic,
+	bool force_simd)
+{
+	unsigned int bit_offset = SHA256_BLOCK_SIZE / 8 - 1;
+	union {
+		__be64 b64[SHA256_BLOCK_SIZE / 4];
+		u8 u8[SHA256_BLOCK_SIZE * 2];
+	} block = {};
+	int blocks, i;
+
+	sctx->count += len;
+	if (len >= bit_offset * 8)
+		bit_offset += SHA256_BLOCK_SIZE / 8;
+	blocks = (bit_offset + 1) * 8 / SHA256_BLOCK_SIZE;
+	memcpy(&block, src, len);
+	block.u8[len] = 0x80;
+	block.b64[bit_offset] = cpu_to_be64(sctx->count << 3);
+	sha256_choose_blocks(sctx->state, block.u8, blocks, force_generic,
+			     force_simd);
+	memzero_explicit(&block, sizeof(block));
+
+	for (i = 0; i < digest_size; i += 4)
+		put_unaligned_be32(sctx->state[i / 4], out + i);
+
+}
+
+#endif /* _CRYPTO_INTERNAL_SHA2_H */
diff --git a/include/crypto/sha2.h b/include/crypto/sha2.h
index f873c2207b1e..9a56286d736d 100644
--- a/include/crypto/sha2.h
+++ b/include/crypto/sha2.h
@@ -13,6 +13,7 @@
 
 #define SHA256_DIGEST_SIZE      32
 #define SHA256_BLOCK_SIZE       64
+#define SHA256_STATE_WORDS      8
 
 #define SHA384_DIGEST_SIZE      48
 #define SHA384_BLOCK_SIZE       128
@@ -66,7 +67,7 @@ extern const u8 sha384_zero_message_hash[SHA384_DIGEST_SIZE];
 extern const u8 sha512_zero_message_hash[SHA512_DIGEST_SIZE];
 
 struct crypto_sha256_state {
-	u32 state[SHA256_DIGEST_SIZE / 4];
+	u32 state[SHA256_STATE_WORDS];
 	u64 count;
 };
 
@@ -74,7 +75,7 @@ struct sha256_state {
 	union {
 		struct crypto_sha256_state ctx;
 		struct {
-			u32 state[SHA256_DIGEST_SIZE / 4];
+			u32 state[SHA256_STATE_WORDS];
 			u64 count;
 		};
 	};
@@ -87,16 +88,6 @@ struct sha512_state {
 	u8 buf[SHA512_BLOCK_SIZE];
 };
 
-/*
- * Stand-alone implementation of the SHA256 algorithm. It is designed to
- * have as little dependencies as possible so it can be used in the
- * kexec_file purgatory. In other cases you should generally use the
- * hash APIs from include/crypto/hash.h. Especially when hashing large
- * amounts of data as those APIs may be hw-accelerated.
- *
- * For details see lib/crypto/sha256.c
- */
-
 static inline void sha256_init(struct sha256_state *sctx)
 {
 	sctx->state[0] = SHA256_H0;
diff --git a/include/crypto/sha256_base.h b/include/crypto/sha256_base.h
index 9f284bed5a51..804361731a7a 100644
--- a/include/crypto/sha256_base.h
+++ b/include/crypto/sha256_base.h
@@ -10,7 +10,7 @@
 
 #include <crypto/internal/blockhash.h>
 #include <crypto/internal/hash.h>
-#include <crypto/sha2.h>
+#include <crypto/internal/sha2.h>
 #include <linux/math.h>
 #include <linux/string.h>
 #include <linux/types.h>
@@ -142,7 +142,10 @@ static inline int sha256_base_finish(struct shash_desc *desc, u8 *out)
 	return __sha256_base_finish(sctx->state, out, digest_size);
 }
 
-void sha256_transform_blocks(struct crypto_sha256_state *sst,
-			     const u8 *input, int blocks);
+static inline void sha256_transform_blocks(struct crypto_sha256_state *sst,
+					   const u8 *input, int blocks)
+{
+	sha256_blocks_generic(sst->state, input, blocks);
+}
 
 #endif /* _CRYPTO_SHA256_BASE_H */
diff --git a/lib/crypto/Kconfig b/lib/crypto/Kconfig
index af2368799579..ad0a4705682c 100644
--- a/lib/crypto/Kconfig
+++ b/lib/crypto/Kconfig
@@ -139,6 +139,33 @@ config CRYPTO_LIB_SHA1
 
 config CRYPTO_LIB_SHA256
 	tristate
+	help
+	  Enable the SHA-256 library interface. This interface may be fulfilled
+	  by either the generic implementation or an arch-specific one, if one
+	  is available and enabled.
+
+config CRYPTO_ARCH_HAVE_LIB_SHA256
+	bool
+	help
+	  Declares whether the architecture provides an arch-specific
+	  accelerated implementation of the SHA-256 library interface.
+
+config CRYPTO_ARCH_HAVE_LIB_SHA256_SIMD
+	bool
+	help
+	  Declares whether the architecture provides an arch-specific
+	  accelerated implementation of the SHA-256 library interface
+	  that is SIMD-based and therefore not usable in hardirq
+	  context.
+
+config CRYPTO_LIB_SHA256_GENERIC
+	tristate
+	default CRYPTO_LIB_SHA256 if !CRYPTO_ARCH_HAVE_LIB_SHA256
+	help
+	  This symbol can be selected by arch implementations of the SHA-256
+	  library interface that require the generic code as a fallback, e.g.,
+	  for SIMD implementations. If no arch specific implementation is
+	  enabled, this implementation serves the users of CRYPTO_LIB_SHA256.
 
 config CRYPTO_LIB_SM3
 	tristate
diff --git a/lib/crypto/Makefile b/lib/crypto/Makefile
index 4dd62bc5bee3..6ed728e7f432 100644
--- a/lib/crypto/Makefile
+++ b/lib/crypto/Makefile
@@ -50,6 +50,7 @@ libsha1-y					:= sha1.o
 
 obj-$(CONFIG_CRYPTO_LIB_SHA256)			+= libsha256.o
 libsha256-y					:= sha256.o
+obj-$(CONFIG_CRYPTO_LIB_SHA256_GENERIC)		+= sha256-generic.o
 
 ifneq ($(CONFIG_CRYPTO_MANAGER_DISABLE_TESTS),y)
 libblake2s-y					+= blake2s-selftest.o
diff --git a/lib/crypto/sha256-generic.c b/lib/crypto/sha256-generic.c
new file mode 100644
index 000000000000..018d652e62f7
--- /dev/null
+++ b/lib/crypto/sha256-generic.c
@@ -0,0 +1,139 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * SHA-256, as specified in
+ * http://csrc.nist.gov/groups/STM/cavp/documents/shs/sha256-384-512.pdf
+ *
+ * SHA-256 code by Jean-Luc Cooke <jlcooke@certainkey.com>.
+ *
+ * Copyright (c) Jean-Luc Cooke <jlcooke@certainkey.com>
+ * Copyright (c) Andrew McDonald <andrew@mcdonald.org.uk>
+ * Copyright (c) 2002 James Morris <jmorris@intercode.com.au>
+ * Copyright (c) 2014 Red Hat Inc.
+ */
+
+#include <crypto/internal/sha2.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/string.h>
+#include <linux/unaligned.h>
+
+static const u32 SHA256_K[] = {
+	0x428a2f98, 0x71374491, 0xb5c0fbcf, 0xe9b5dba5,
+	0x3956c25b, 0x59f111f1, 0x923f82a4, 0xab1c5ed5,
+	0xd807aa98, 0x12835b01, 0x243185be, 0x550c7dc3,
+	0x72be5d74, 0x80deb1fe, 0x9bdc06a7, 0xc19bf174,
+	0xe49b69c1, 0xefbe4786, 0x0fc19dc6, 0x240ca1cc,
+	0x2de92c6f, 0x4a7484aa, 0x5cb0a9dc, 0x76f988da,
+	0x983e5152, 0xa831c66d, 0xb00327c8, 0xbf597fc7,
+	0xc6e00bf3, 0xd5a79147, 0x06ca6351, 0x14292967,
+	0x27b70a85, 0x2e1b2138, 0x4d2c6dfc, 0x53380d13,
+	0x650a7354, 0x766a0abb, 0x81c2c92e, 0x92722c85,
+	0xa2bfe8a1, 0xa81a664b, 0xc24b8b70, 0xc76c51a3,
+	0xd192e819, 0xd6990624, 0xf40e3585, 0x106aa070,
+	0x19a4c116, 0x1e376c08, 0x2748774c, 0x34b0bcb5,
+	0x391c0cb3, 0x4ed8aa4a, 0x5b9cca4f, 0x682e6ff3,
+	0x748f82ee, 0x78a5636f, 0x84c87814, 0x8cc70208,
+	0x90befffa, 0xa4506ceb, 0xbef9a3f7, 0xc67178f2,
+};
+
+static inline u32 Ch(u32 x, u32 y, u32 z)
+{
+	return z ^ (x & (y ^ z));
+}
+
+static inline u32 Maj(u32 x, u32 y, u32 z)
+{
+	return (x & y) | (z & (x | y));
+}
+
+#define e0(x)       (ror32(x, 2) ^ ror32(x, 13) ^ ror32(x, 22))
+#define e1(x)       (ror32(x, 6) ^ ror32(x, 11) ^ ror32(x, 25))
+#define s0(x)       (ror32(x, 7) ^ ror32(x, 18) ^ (x >> 3))
+#define s1(x)       (ror32(x, 17) ^ ror32(x, 19) ^ (x >> 10))
+
+static inline void LOAD_OP(int I, u32 *W, const u8 *input)
+{
+	W[I] = get_unaligned_be32((__u32 *)input + I);
+}
+
+static inline void BLEND_OP(int I, u32 *W)
+{
+	W[I] = s1(W[I-2]) + W[I-7] + s0(W[I-15]) + W[I-16];
+}
+
+#define SHA256_ROUND(i, a, b, c, d, e, f, g, h) do {		\
+	u32 t1, t2;						\
+	t1 = h + e1(e) + Ch(e, f, g) + SHA256_K[i] + W[i];	\
+	t2 = e0(a) + Maj(a, b, c);				\
+	d += t1;						\
+	h = t1 + t2;						\
+} while (0)
+
+static void sha256_block_generic(u32 state[SHA256_STATE_WORDS],
+				 const u8 *input, u32 W[64])
+{
+	u32 a, b, c, d, e, f, g, h;
+	int i;
+
+	/* load the input */
+	for (i = 0; i < 16; i += 8) {
+		LOAD_OP(i + 0, W, input);
+		LOAD_OP(i + 1, W, input);
+		LOAD_OP(i + 2, W, input);
+		LOAD_OP(i + 3, W, input);
+		LOAD_OP(i + 4, W, input);
+		LOAD_OP(i + 5, W, input);
+		LOAD_OP(i + 6, W, input);
+		LOAD_OP(i + 7, W, input);
+	}
+
+	/* now blend */
+	for (i = 16; i < 64; i += 8) {
+		BLEND_OP(i + 0, W);
+		BLEND_OP(i + 1, W);
+		BLEND_OP(i + 2, W);
+		BLEND_OP(i + 3, W);
+		BLEND_OP(i + 4, W);
+		BLEND_OP(i + 5, W);
+		BLEND_OP(i + 6, W);
+		BLEND_OP(i + 7, W);
+	}
+
+	/* load the state into our registers */
+	a = state[0];  b = state[1];  c = state[2];  d = state[3];
+	e = state[4];  f = state[5];  g = state[6];  h = state[7];
+
+	/* now iterate */
+	for (i = 0; i < 64; i += 8) {
+		SHA256_ROUND(i + 0, a, b, c, d, e, f, g, h);
+		SHA256_ROUND(i + 1, h, a, b, c, d, e, f, g);
+		SHA256_ROUND(i + 2, g, h, a, b, c, d, e, f);
+		SHA256_ROUND(i + 3, f, g, h, a, b, c, d, e);
+		SHA256_ROUND(i + 4, e, f, g, h, a, b, c, d);
+		SHA256_ROUND(i + 5, d, e, f, g, h, a, b, c);
+		SHA256_ROUND(i + 6, c, d, e, f, g, h, a, b);
+		SHA256_ROUND(i + 7, b, c, d, e, f, g, h, a);
+	}
+
+	state[0] += a; state[1] += b; state[2] += c; state[3] += d;
+	state[4] += e; state[5] += f; state[6] += g; state[7] += h;
+}
+
+void sha256_blocks_generic(u32 state[SHA256_STATE_WORDS],
+			   const u8 *data, size_t nblocks)
+{
+	u32 W[64];
+
+	do {
+		sha256_block_generic(state, data, W);
+		data += SHA256_BLOCK_SIZE;
+	} while (--nblocks);
+
+	memzero_explicit(W, sizeof(W));
+}
+EXPORT_SYMBOL_GPL(sha256_blocks_generic);
+
+#ifndef __DISABLE_EXPORTS
+MODULE_DESCRIPTION("SHA-256 generic implementation");
+MODULE_LICENSE("GPL");
+#endif
diff --git a/lib/crypto/sha256.c b/lib/crypto/sha256.c
index a89bab377de1..d2bd9fdb8571 100644
--- a/lib/crypto/sha256.c
+++ b/lib/crypto/sha256.c
@@ -11,148 +11,58 @@
  * Copyright (c) 2014 Red Hat Inc.
  */
 
-#include <linux/unaligned.h>
-#include <crypto/sha256_base.h>
+#include <crypto/internal/blockhash.h>
+#include <crypto/internal/sha2.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/string.h>
 
-static const u32 SHA256_K[] = {
-	0x428a2f98, 0x71374491, 0xb5c0fbcf, 0xe9b5dba5,
-	0x3956c25b, 0x59f111f1, 0x923f82a4, 0xab1c5ed5,
-	0xd807aa98, 0x12835b01, 0x243185be, 0x550c7dc3,
-	0x72be5d74, 0x80deb1fe, 0x9bdc06a7, 0xc19bf174,
-	0xe49b69c1, 0xefbe4786, 0x0fc19dc6, 0x240ca1cc,
-	0x2de92c6f, 0x4a7484aa, 0x5cb0a9dc, 0x76f988da,
-	0x983e5152, 0xa831c66d, 0xb00327c8, 0xbf597fc7,
-	0xc6e00bf3, 0xd5a79147, 0x06ca6351, 0x14292967,
-	0x27b70a85, 0x2e1b2138, 0x4d2c6dfc, 0x53380d13,
-	0x650a7354, 0x766a0abb, 0x81c2c92e, 0x92722c85,
-	0xa2bfe8a1, 0xa81a664b, 0xc24b8b70, 0xc76c51a3,
-	0xd192e819, 0xd6990624, 0xf40e3585, 0x106aa070,
-	0x19a4c116, 0x1e376c08, 0x2748774c, 0x34b0bcb5,
-	0x391c0cb3, 0x4ed8aa4a, 0x5b9cca4f, 0x682e6ff3,
-	0x748f82ee, 0x78a5636f, 0x84c87814, 0x8cc70208,
-	0x90befffa, 0xa4506ceb, 0xbef9a3f7, 0xc67178f2,
-};
-
-static inline u32 Ch(u32 x, u32 y, u32 z)
+static inline bool sha256_force_generic(void)
 {
-	return z ^ (x & (y ^ z));
+#ifdef __DISABLE_EXPORTS
+	return true;
+#else
+	return false;
+#endif
 }
 
-static inline u32 Maj(u32 x, u32 y, u32 z)
+static inline void sha256_blocks(u32 state[SHA256_STATE_WORDS], const u8 *data,
+				 size_t nblocks)
 {
-	return (x & y) | (z & (x | y));
+	sha256_choose_blocks(state, data, nblocks,
+			     sha256_force_generic(), false);
 }
 
-#define e0(x)       (ror32(x, 2) ^ ror32(x, 13) ^ ror32(x, 22))
-#define e1(x)       (ror32(x, 6) ^ ror32(x, 11) ^ ror32(x, 25))
-#define s0(x)       (ror32(x, 7) ^ ror32(x, 18) ^ (x >> 3))
-#define s1(x)       (ror32(x, 17) ^ ror32(x, 19) ^ (x >> 10))
-
-static inline void LOAD_OP(int I, u32 *W, const u8 *input)
-{
-	W[I] = get_unaligned_be32((__u32 *)input + I);
-}
-
-static inline void BLEND_OP(int I, u32 *W)
-{
-	W[I] = s1(W[I-2]) + W[I-7] + s0(W[I-15]) + W[I-16];
-}
-
-#define SHA256_ROUND(i, a, b, c, d, e, f, g, h) do {		\
-	u32 t1, t2;						\
-	t1 = h + e1(e) + Ch(e, f, g) + SHA256_K[i] + W[i];	\
-	t2 = e0(a) + Maj(a, b, c);				\
-	d += t1;						\
-	h = t1 + t2;						\
-} while (0)
-
-static void sha256_transform(u32 *state, const u8 *input, u32 *W)
-{
-	u32 a, b, c, d, e, f, g, h;
-	int i;
-
-	/* load the input */
-	for (i = 0; i < 16; i += 8) {
-		LOAD_OP(i + 0, W, input);
-		LOAD_OP(i + 1, W, input);
-		LOAD_OP(i + 2, W, input);
-		LOAD_OP(i + 3, W, input);
-		LOAD_OP(i + 4, W, input);
-		LOAD_OP(i + 5, W, input);
-		LOAD_OP(i + 6, W, input);
-		LOAD_OP(i + 7, W, input);
-	}
-
-	/* now blend */
-	for (i = 16; i < 64; i += 8) {
-		BLEND_OP(i + 0, W);
-		BLEND_OP(i + 1, W);
-		BLEND_OP(i + 2, W);
-		BLEND_OP(i + 3, W);
-		BLEND_OP(i + 4, W);
-		BLEND_OP(i + 5, W);
-		BLEND_OP(i + 6, W);
-		BLEND_OP(i + 7, W);
-	}
-
-	/* load the state into our registers */
-	a = state[0];  b = state[1];  c = state[2];  d = state[3];
-	e = state[4];  f = state[5];  g = state[6];  h = state[7];
-
-	/* now iterate */
-	for (i = 0; i < 64; i += 8) {
-		SHA256_ROUND(i + 0, a, b, c, d, e, f, g, h);
-		SHA256_ROUND(i + 1, h, a, b, c, d, e, f, g);
-		SHA256_ROUND(i + 2, g, h, a, b, c, d, e, f);
-		SHA256_ROUND(i + 3, f, g, h, a, b, c, d, e);
-		SHA256_ROUND(i + 4, e, f, g, h, a, b, c, d);
-		SHA256_ROUND(i + 5, d, e, f, g, h, a, b, c);
-		SHA256_ROUND(i + 6, c, d, e, f, g, h, a, b);
-		SHA256_ROUND(i + 7, b, c, d, e, f, g, h, a);
-	}
-
-	state[0] += a; state[1] += b; state[2] += c; state[3] += d;
-	state[4] += e; state[5] += f; state[6] += g; state[7] += h;
-}
-
-void sha256_transform_blocks(struct crypto_sha256_state *sst,
-			     const u8 *input, int blocks)
-{
-	u32 W[64];
-
-	do {
-		sha256_transform(sst->state, input, W);
-		input += SHA256_BLOCK_SIZE;
-	} while (--blocks);
-
-	memzero_explicit(W, sizeof(W));
-}
-EXPORT_SYMBOL_GPL(sha256_transform_blocks);
-
 void sha256_update(struct sha256_state *sctx, const u8 *data, unsigned int len)
 {
-	lib_sha256_base_do_update(sctx, data, len, sha256_transform_blocks);
+	size_t partial = sctx->count % SHA256_BLOCK_SIZE;
+
+	sctx->count += len;
+	BLOCK_HASH_UPDATE_BLOCKS(sha256_blocks, sctx->ctx.state, data, len,
+				 SHA256_BLOCK_SIZE, sctx->buf, partial);
 }
 EXPORT_SYMBOL(sha256_update);
 
-static void __sha256_final(struct sha256_state *sctx, u8 *out, int digest_size)
+static void __sha256_final(struct sha256_state *sctx, u8 *out,
+			   size_t digest_size)
 {
-	lib_sha256_base_do_finalize(sctx, sha256_transform_blocks);
-	lib_sha256_base_finish(sctx, out, digest_size);
+	unsigned int len = sctx->count % SHA256_BLOCK_SIZE;
+
+	sctx->count -= len;
+	sha256_finup(&sctx->ctx, sctx->buf, len, out, digest_size,
+		     sha256_force_generic(), false);
+	memzero_explicit(sctx, sizeof(*sctx));
 }
 
 void sha256_final(struct sha256_state *sctx, u8 *out)
 {
-	__sha256_final(sctx, out, 32);
+	__sha256_final(sctx, out, SHA256_DIGEST_SIZE);
 }
 EXPORT_SYMBOL(sha256_final);
 
 void sha224_final(struct sha256_state *sctx, u8 *out)
 {
-	__sha256_final(sctx, out, 28);
+	__sha256_final(sctx, out, SHA224_DIGEST_SIZE);
 }
 EXPORT_SYMBOL(sha224_final);
 
-- 
2.39.5


