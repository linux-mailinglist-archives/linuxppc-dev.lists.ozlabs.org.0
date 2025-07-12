Return-Path: <linuxppc-dev+bounces-10210-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C76B0B02DB1
	for <lists+linuxppc-dev@lfdr.de>; Sun, 13 Jul 2025 01:27:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bfl8S39zqz2yPS;
	Sun, 13 Jul 2025 09:26:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c04:e001:324:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1752362792;
	cv=none; b=W9S29YBk8E1TLS4qf/lCv70UNnTKlJTmA8zTs2/hra4iqNmuovMfNxwhcbp85IMXuPj7UoeGLbdyWyFRA6VYg128oFHCB4LXUJXVIAlN5yIiTf0FMrw060Yw3Zpj94C5ll0X2uQVsTkr4QyqMZa2GZmFQcIwS1pm5PtdawWy6s086A5QMaavxS1K2zJF13DVFMDZFRku0eHamQsPkxES4A2jAOykGF/oyAw4JTAGqb6Ok2JlVYZG+0feRo9DCZD776lP95arNBkGLXfRBjfObuKyrgLzIAgPJROFbdIHhDL2dcjfOo9BxNg5wSxuvzKz0Av/HzxsDhr9uPMJLVoNHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1752362792; c=relaxed/relaxed;
	bh=ay5w6LRm3AFo4WG1rmBRYd83SAlRprAdjlcqio3Vvpc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AQ7pcwA0Qk7qs+OTqEmnlfr5v6NX9ZlccstPxlMDXrDHluPx6Q07o2aVgqJjSck/v7k7TnRWzF6AMCo1atWwZGlD1fZAFJLcA/tF0JFXeKV7xFJl64m7Y0g/cRLzZhqhLa0cH0rh9rK/k42Hlmyqe/gIPY1071NCNv+EwB9qy7nF5BIBJDQCgR4eZ5+ptWwXONi7yn82+lbZ4U06pPMwajjueXnRsibU2oZcmBWYRSiNN1PJ6n2P8ikz/ihNkH5FI5kxhVLEhM3xkzgYU7gR+UVFetR3rrx9WmfFVCM6NbIS/vByEFtERvLlOGlONOWw77fd4H5l2eaD1cAH0FAQCA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=bzEoJhD4; dkim-atps=neutral; spf=pass (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=bzEoJhD4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04:e001:324:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bfl8N1BcNz3bkT
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 13 Jul 2025 09:26:27 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B5CC060EDF;
	Sat, 12 Jul 2025 23:26:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B7C7C4CEF6;
	Sat, 12 Jul 2025 23:26:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752362785;
	bh=O3ROQxfRSPV6vROVkg/oM0s+Z5uZgY7MSN9jjvnzA2U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bzEoJhD4SjhvA2rhiEnzCrfcXUKKMCRILhg7dooVVVs3zW0Un0rieindqGFsF0BGG
	 Q7EgYr4QMQHnXsYSPB0/fe/MyUFf6RBM9HvkAuswTjJpZ7mtlGfEN9PJeamWLebZiV
	 w3VzZAiOb7F1CWIGbfwO14/sIx+7loNZPfvir7i7BvosIqnQXqhxS2pu2qRVPblogj
	 bZHFTeyyhZs0HL9fwJjGGlX2G/920Ix2PxX/2OPsBxefdLBGYCJV5vx5Yld6Iz6hmE
	 2BmnLXXKszmrZirlLqoQU2R35mAYNHpcdz5h27AGqZEJM/4Q4jjzDXKH1vDrh8+uLk
	 haaU+vmIEj5VQ==
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
Subject: [PATCH 11/26] lib/crypto: s390/sha1: Migrate optimized code into library
Date: Sat, 12 Jul 2025 16:23:02 -0700
Message-ID: <20250712232329.818226-12-ebiggers@kernel.org>
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

Instead of exposing the s390-optimized SHA-1 code via s390-specific
crypto_shash algorithms, instead just implement the sha1_blocks()
library function.  This is much simpler, it makes the SHA-1 library
functions be s390-optimized, and it fixes the longstanding issue where
the s390-optimized SHA-1 code was disabled by default.  SHA-1 still
remains available through crypto_shash, but individual architectures no
longer need to handle it.

Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 arch/s390/configs/debug_defconfig |   1 -
 arch/s390/configs/defconfig       |   1 -
 arch/s390/crypto/Kconfig          |  10 ---
 arch/s390/crypto/Makefile         |   1 -
 arch/s390/crypto/sha1_s390.c      | 103 ------------------------------
 lib/crypto/Kconfig                |   1 +
 lib/crypto/s390/sha1.h            |  28 ++++++++
 7 files changed, 29 insertions(+), 116 deletions(-)
 delete mode 100644 arch/s390/crypto/sha1_s390.c
 create mode 100644 lib/crypto/s390/sha1.h

diff --git a/arch/s390/configs/debug_defconfig b/arch/s390/configs/debug_defconfig
index ef313c30b375c..a7db7ed287205 100644
--- a/arch/s390/configs/debug_defconfig
+++ b/arch/s390/configs/debug_defconfig
@@ -802,11 +802,10 @@ CONFIG_CRYPTO_ZSTD=m
 CONFIG_CRYPTO_ANSI_CPRNG=m
 CONFIG_CRYPTO_USER_API_HASH=m
 CONFIG_CRYPTO_USER_API_SKCIPHER=m
 CONFIG_CRYPTO_USER_API_RNG=m
 CONFIG_CRYPTO_USER_API_AEAD=m
-CONFIG_CRYPTO_SHA1_S390=m
 CONFIG_CRYPTO_SHA3_256_S390=m
 CONFIG_CRYPTO_SHA3_512_S390=m
 CONFIG_CRYPTO_GHASH_S390=m
 CONFIG_CRYPTO_AES_S390=m
 CONFIG_CRYPTO_DES_S390=m
diff --git a/arch/s390/configs/defconfig b/arch/s390/configs/defconfig
index b6fa341bb03b6..0217ed5616bf4 100644
--- a/arch/s390/configs/defconfig
+++ b/arch/s390/configs/defconfig
@@ -789,11 +789,10 @@ CONFIG_CRYPTO_ANSI_CPRNG=m
 CONFIG_CRYPTO_JITTERENTROPY_OSR=1
 CONFIG_CRYPTO_USER_API_HASH=m
 CONFIG_CRYPTO_USER_API_SKCIPHER=m
 CONFIG_CRYPTO_USER_API_RNG=m
 CONFIG_CRYPTO_USER_API_AEAD=m
-CONFIG_CRYPTO_SHA1_S390=m
 CONFIG_CRYPTO_SHA3_256_S390=m
 CONFIG_CRYPTO_SHA3_512_S390=m
 CONFIG_CRYPTO_GHASH_S390=m
 CONFIG_CRYPTO_AES_S390=m
 CONFIG_CRYPTO_DES_S390=m
diff --git a/arch/s390/crypto/Kconfig b/arch/s390/crypto/Kconfig
index 4557514fbac35..03f73fbd38b62 100644
--- a/arch/s390/crypto/Kconfig
+++ b/arch/s390/crypto/Kconfig
@@ -1,19 +1,9 @@
 # SPDX-License-Identifier: GPL-2.0
 
 menu "Accelerated Cryptographic Algorithms for CPU (s390)"
 
-config CRYPTO_SHA1_S390
-	tristate "Hash functions: SHA-1"
-	select CRYPTO_HASH
-	help
-	  SHA-1 secure hash algorithm (FIPS 180)
-
-	  Architecture: s390
-
-	  It is available as of z990.
-
 config CRYPTO_SHA3_256_S390
 	tristate "Hash functions: SHA3-224 and SHA3-256"
 	select CRYPTO_HASH
 	help
 	  SHA3-224 and SHA3-256 secure hash algorithms (FIPS 202)
diff --git a/arch/s390/crypto/Makefile b/arch/s390/crypto/Makefile
index 473d64c0982af..1e5a1038d4914 100644
--- a/arch/s390/crypto/Makefile
+++ b/arch/s390/crypto/Makefile
@@ -1,11 +1,10 @@
 # SPDX-License-Identifier: GPL-2.0
 #
 # Cryptographic API
 #
 
-obj-$(CONFIG_CRYPTO_SHA1_S390) += sha1_s390.o sha_common.o
 obj-$(CONFIG_CRYPTO_SHA3_256_S390) += sha3_256_s390.o sha_common.o
 obj-$(CONFIG_CRYPTO_SHA3_512_S390) += sha3_512_s390.o sha_common.o
 obj-$(CONFIG_CRYPTO_DES_S390) += des_s390.o
 obj-$(CONFIG_CRYPTO_AES_S390) += aes_s390.o
 obj-$(CONFIG_CRYPTO_PAES_S390) += paes_s390.o
diff --git a/arch/s390/crypto/sha1_s390.c b/arch/s390/crypto/sha1_s390.c
deleted file mode 100644
index d229cbd2ba229..0000000000000
--- a/arch/s390/crypto/sha1_s390.c
+++ /dev/null
@@ -1,103 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0+
-/*
- * Cryptographic API.
- *
- * s390 implementation of the SHA1 Secure Hash Algorithm.
- *
- * Derived from cryptoapi implementation, adapted for in-place
- * scatterlist interface.  Originally based on the public domain
- * implementation written by Steve Reid.
- *
- * s390 Version:
- *   Copyright IBM Corp. 2003, 2007
- *   Author(s): Thomas Spatzier
- *		Jan Glauber (jan.glauber@de.ibm.com)
- *
- * Derived from "crypto/sha1_generic.c"
- *   Copyright (c) Alan Smithee.
- *   Copyright (c) Andrew McDonald <andrew@mcdonald.org.uk>
- *   Copyright (c) Jean-Francois Dive <jef@linuxbe.org>
- */
-#include <asm/cpacf.h>
-#include <crypto/internal/hash.h>
-#include <crypto/sha1.h>
-#include <linux/cpufeature.h>
-#include <linux/kernel.h>
-#include <linux/module.h>
-
-#include "sha.h"
-
-static int s390_sha1_init(struct shash_desc *desc)
-{
-	struct s390_sha_ctx *sctx = shash_desc_ctx(desc);
-
-	sctx->state[0] = SHA1_H0;
-	sctx->state[1] = SHA1_H1;
-	sctx->state[2] = SHA1_H2;
-	sctx->state[3] = SHA1_H3;
-	sctx->state[4] = SHA1_H4;
-	sctx->count = 0;
-	sctx->func = CPACF_KIMD_SHA_1;
-
-	return 0;
-}
-
-static int s390_sha1_export(struct shash_desc *desc, void *out)
-{
-	struct s390_sha_ctx *sctx = shash_desc_ctx(desc);
-	struct sha1_state *octx = out;
-
-	octx->count = sctx->count;
-	memcpy(octx->state, sctx->state, sizeof(octx->state));
-	return 0;
-}
-
-static int s390_sha1_import(struct shash_desc *desc, const void *in)
-{
-	struct s390_sha_ctx *sctx = shash_desc_ctx(desc);
-	const struct sha1_state *ictx = in;
-
-	sctx->count = ictx->count;
-	memcpy(sctx->state, ictx->state, sizeof(ictx->state));
-	sctx->func = CPACF_KIMD_SHA_1;
-	return 0;
-}
-
-static struct shash_alg alg = {
-	.digestsize	=	SHA1_DIGEST_SIZE,
-	.init		=	s390_sha1_init,
-	.update		=	s390_sha_update_blocks,
-	.finup		=	s390_sha_finup,
-	.export		=	s390_sha1_export,
-	.import		=	s390_sha1_import,
-	.descsize	=	S390_SHA_CTX_SIZE,
-	.statesize	=	SHA1_STATE_SIZE,
-	.base		=	{
-		.cra_name	=	"sha1",
-		.cra_driver_name=	"sha1-s390",
-		.cra_priority	=	300,
-		.cra_flags	=	CRYPTO_AHASH_ALG_BLOCK_ONLY |
-					CRYPTO_AHASH_ALG_FINUP_MAX,
-		.cra_blocksize	=	SHA1_BLOCK_SIZE,
-		.cra_module	=	THIS_MODULE,
-	}
-};
-
-static int __init sha1_s390_init(void)
-{
-	if (!cpacf_query_func(CPACF_KIMD, CPACF_KIMD_SHA_1))
-		return -ENODEV;
-	return crypto_register_shash(&alg);
-}
-
-static void __exit sha1_s390_fini(void)
-{
-	crypto_unregister_shash(&alg);
-}
-
-module_cpu_feature_match(S390_CPU_FEATURE_MSA, sha1_s390_init);
-module_exit(sha1_s390_fini);
-
-MODULE_ALIAS_CRYPTO("sha1");
-MODULE_LICENSE("GPL");
-MODULE_DESCRIPTION("SHA1 Secure Hash Algorithm");
diff --git a/lib/crypto/Kconfig b/lib/crypto/Kconfig
index e842f173cadec..2c55b75cea525 100644
--- a/lib/crypto/Kconfig
+++ b/lib/crypto/Kconfig
@@ -148,10 +148,11 @@ config CRYPTO_LIB_SHA1_ARCH
 	depends on CRYPTO_LIB_SHA1 && !UML
 	default y if ARM
 	default y if ARM64 && KERNEL_MODE_NEON
 	default y if MIPS && CPU_CAVIUM_OCTEON
 	default y if PPC
+	default y if S390
 
 config CRYPTO_LIB_SHA256
 	tristate
 	help
 	  Enable the SHA-256 library interface. This interface may be fulfilled
diff --git a/lib/crypto/s390/sha1.h b/lib/crypto/s390/sha1.h
new file mode 100644
index 0000000000000..08bd138e881cc
--- /dev/null
+++ b/lib/crypto/s390/sha1.h
@@ -0,0 +1,28 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * SHA-1 optimized using the CP Assist for Cryptographic Functions (CPACF)
+ *
+ * Copyright 2025 Google LLC
+ */
+#include <asm/cpacf.h>
+#include <linux/cpufeature.h>
+
+static __ro_after_init DEFINE_STATIC_KEY_FALSE(have_cpacf_sha1);
+
+static void sha1_blocks(struct sha1_block_state *state,
+			const u8 *data, size_t nblocks)
+{
+	if (static_branch_likely(&have_cpacf_sha1))
+		cpacf_kimd(CPACF_KIMD_SHA_1, state, data,
+			   nblocks * SHA1_BLOCK_SIZE);
+	else
+		sha1_blocks_generic(state, data, nblocks);
+}
+
+#define sha1_mod_init_arch sha1_mod_init_arch
+static inline void sha1_mod_init_arch(void)
+{
+	if (cpu_have_feature(S390_CPU_FEATURE_MSA) &&
+	    cpacf_query_func(CPACF_KIMD, CPACF_KIMD_SHA_1))
+		static_branch_enable(&have_cpacf_sha1);
+}
-- 
2.50.1


