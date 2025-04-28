Return-Path: <linuxppc-dev+bounces-8072-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 78CC8A9E771
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Apr 2025 07:17:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZmBXH2LZtz2yrL;
	Mon, 28 Apr 2025 15:17:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=144.6.53.87
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1745817439;
	cv=none; b=UNAloh+WbvalgX5/sCfATwz6xZjsn7v3Ge2DwcLHR59j59TqGwgWe+0rsbmO/oqRvmXezjOiCJ2Kl1hBLhLugYU6VVNKIU3IVh9gyOpi31pyBmS/JCFagJxbt/3zciER8eGfIrAdxZy9hCjRZkrdh06kDRc6Aiu9S81rSXAidEx8p47iZ4kzpSyMDaU7aJNH2W6G9x96lKyJew4C4bOFy6zlFzeAW70EbDYIK27k2QemtneHZUC2WlyinK79duZJr4Soc3BTRiygLpL+UK9LBcX2eMh3Ns3FluPbEK4RwZMP+ijRECpzrnz2kce+M+OS/GNJZXvPn53Ue9izPEfKMw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1745817439; c=relaxed/relaxed;
	bh=yIpcE3DcMWrfSX+Dke3Gf+/LT4mjSrvIFI40rk+L1CU=;
	h=Date:Message-Id:In-Reply-To:References:From:Subject:To:Cc; b=j3gWcN9cRPRLajL6lKWDJYOT3t06oO9ITaC3/9O8ehyujtoRJKcsVHjoK5HYIQO7w5ea1ly/FOJhq8wDnPMSQwaNihQacgc1u6Zg1JoA4nigwiNNcpBm+9S80MF7oZAO9CWdVNmJqFnsNVu0/sqEYKsAgTy+oyR2gUIRgaw+RvwizMYYd4GCUgOOvr3Dt7r3fuTQoDK5tcKeb9/PrBmg7XpYyQLtak+VOVgDrINDetLh/i9H1WdNpqIX+TlOzjAHLXxfFD91KNhFNLCQC+No6gY9Jc5tE94EQl5n1SaLWdkEWW22dxURWYv+sgrPEsoIDWiY3dL/qyIeEnzeW4QCkA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au; dkim=pass (2048-bit key; unprotected) header.d=hmeau.com header.i=@hmeau.com header.a=rsa-sha256 header.s=formenos header.b=L8DA271r; dkim-atps=neutral; spf=pass (client-ip=144.6.53.87; helo=abb.hmeau.com; envelope-from=herbert@gondor.apana.org.au; receiver=lists.ozlabs.org) smtp.mailfrom=gondor.apana.org.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=hmeau.com header.i=@hmeau.com header.a=rsa-sha256 header.s=formenos header.b=L8DA271r;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gondor.apana.org.au (client-ip=144.6.53.87; helo=abb.hmeau.com; envelope-from=herbert@gondor.apana.org.au; receiver=lists.ozlabs.org)
Received: from abb.hmeau.com (abb.hmeau.com [144.6.53.87])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZmBXG3yGlz2yrg
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Apr 2025 15:17:18 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hmeau.com;
	s=formenos; h=Cc:To:Subject:From:References:In-Reply-To:Message-Id:Date:
	Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=yIpcE3DcMWrfSX+Dke3Gf+/LT4mjSrvIFI40rk+L1CU=; b=L8DA271rlA9ODfm2tQ+zsduYDJ
	P/hltP9nCQRaHnmCbUyklXhV2mfaNE+ECylRXxATuuKHTNIym4pNMIg1jXdVHIoh5RqilgDeY/8FO
	nR9G6h8IkC/hiMrmqsjJZRrB+mho4JMGh8J3qkiCDo874Tft/aymddhu5x81+xbRfIAnDtV+dttuO
	LEhnteeXmn3AvtkRt6hSkCeEUPKQYiVrMlhPd84DqWjPPYW19YElvfIV6l/GA6rjRllHHXxqMJYul
	+wLilaMWsAlx5j9XoUx7xWsqemyQWgc1iVYvLC8F/EPQoHO07hdkfQmN7lAZRmVzJAwTNgfkYc9go
	jxNIWqww==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1u9Grj-001WSG-2s;
	Mon, 28 Apr 2025 13:17:16 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Mon, 28 Apr 2025 13:17:15 +0800
Date: Mon, 28 Apr 2025 13:17:15 +0800
Message-Id: <22c9cc9da86762c7ab0b399f24478c92cc64bee5.1745816372.git.herbert@gondor.apana.org.au>
In-Reply-To: <cover.1745816372.git.herbert@gondor.apana.org.au>
References: <cover.1745816372.git.herbert@gondor.apana.org.au>
From: Herbert Xu <herbert@gondor.apana.org.au>
Subject: [v3 PATCH 06/13] crypto: powerpc/sha256 - implement library instead
 of shash
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
 arch/powerpc/crypto/Kconfig                   |  11 --
 arch/powerpc/crypto/Makefile                  |   2 -
 arch/powerpc/crypto/sha256-spe-glue.c         | 128 ------------------
 arch/powerpc/lib/crypto/Kconfig               |   6 +
 arch/powerpc/lib/crypto/Makefile              |   3 +
 .../powerpc/{ => lib}/crypto/sha256-spe-asm.S |   0
 arch/powerpc/lib/crypto/sha256.c              |  70 ++++++++++
 7 files changed, 79 insertions(+), 141 deletions(-)
 delete mode 100644 arch/powerpc/crypto/sha256-spe-glue.c
 rename arch/powerpc/{ => lib}/crypto/sha256-spe-asm.S (100%)
 create mode 100644 arch/powerpc/lib/crypto/sha256.c

diff --git a/arch/powerpc/crypto/Kconfig b/arch/powerpc/crypto/Kconfig
index 4bf7b01228e7..caaa359f4742 100644
--- a/arch/powerpc/crypto/Kconfig
+++ b/arch/powerpc/crypto/Kconfig
@@ -39,17 +39,6 @@ config CRYPTO_SHA1_PPC_SPE
 	  Architecture: powerpc using
 	  - SPE (Signal Processing Engine) extensions
 
-config CRYPTO_SHA256_PPC_SPE
-	tristate "Hash functions: SHA-224 and SHA-256 (SPE)"
-	depends on SPE
-	select CRYPTO_SHA256
-	select CRYPTO_HASH
-	help
-	  SHA-224 and SHA-256 secure hash algorithms (FIPS 180)
-
-	  Architecture: powerpc using
-	  - SPE (Signal Processing Engine) extensions
-
 config CRYPTO_AES_PPC_SPE
 	tristate "Ciphers: AES, modes: ECB/CBC/CTR/XTS (SPE)"
 	depends on SPE
diff --git a/arch/powerpc/crypto/Makefile b/arch/powerpc/crypto/Makefile
index f13aec8a1833..8c2936ae466f 100644
--- a/arch/powerpc/crypto/Makefile
+++ b/arch/powerpc/crypto/Makefile
@@ -9,7 +9,6 @@ obj-$(CONFIG_CRYPTO_AES_PPC_SPE) += aes-ppc-spe.o
 obj-$(CONFIG_CRYPTO_MD5_PPC) += md5-ppc.o
 obj-$(CONFIG_CRYPTO_SHA1_PPC) += sha1-powerpc.o
 obj-$(CONFIG_CRYPTO_SHA1_PPC_SPE) += sha1-ppc-spe.o
-obj-$(CONFIG_CRYPTO_SHA256_PPC_SPE) += sha256-ppc-spe.o
 obj-$(CONFIG_CRYPTO_AES_GCM_P10) += aes-gcm-p10-crypto.o
 obj-$(CONFIG_CRYPTO_DEV_VMX_ENCRYPT) += vmx-crypto.o
 obj-$(CONFIG_CRYPTO_CURVE25519_PPC64) += curve25519-ppc64le.o
@@ -18,7 +17,6 @@ aes-ppc-spe-y := aes-spe-core.o aes-spe-keys.o aes-tab-4k.o aes-spe-modes.o aes-
 md5-ppc-y := md5-asm.o md5-glue.o
 sha1-powerpc-y := sha1-powerpc-asm.o sha1.o
 sha1-ppc-spe-y := sha1-spe-asm.o sha1-spe-glue.o
-sha256-ppc-spe-y := sha256-spe-asm.o sha256-spe-glue.o
 aes-gcm-p10-crypto-y := aes-gcm-p10-glue.o aes-gcm-p10.o ghashp10-ppc.o aesp10-ppc.o
 vmx-crypto-objs := vmx.o aesp8-ppc.o ghashp8-ppc.o aes.o aes_cbc.o aes_ctr.o aes_xts.o ghash.o
 curve25519-ppc64le-y := curve25519-ppc64le-core.o curve25519-ppc64le_asm.o
diff --git a/arch/powerpc/crypto/sha256-spe-glue.c b/arch/powerpc/crypto/sha256-spe-glue.c
deleted file mode 100644
index 42c76bf8062d..000000000000
--- a/arch/powerpc/crypto/sha256-spe-glue.c
+++ /dev/null
@@ -1,128 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-or-later
-/*
- * Glue code for SHA-256 implementation for SPE instructions (PPC)
- *
- * Based on generic implementation. The assembler module takes care 
- * about the SPE registers so it can run from interrupt context.
- *
- * Copyright (c) 2015 Markus Stockhausen <stockhausen@collogia.de>
- */
-
-#include <asm/switch_to.h>
-#include <crypto/internal/hash.h>
-#include <crypto/sha2.h>
-#include <crypto/sha256_base.h>
-#include <linux/kernel.h>
-#include <linux/module.h>
-#include <linux/preempt.h>
-
-/*
- * MAX_BYTES defines the number of bytes that are allowed to be processed
- * between preempt_disable() and preempt_enable(). SHA256 takes ~2,000
- * operations per 64 bytes. e500 cores can issue two arithmetic instructions
- * per clock cycle using one 32/64 bit unit (SU1) and one 32 bit unit (SU2).
- * Thus 1KB of input data will need an estimated maximum of 18,000 cycles.
- * Headroom for cache misses included. Even with the low end model clocked
- * at 667 MHz this equals to a critical time window of less than 27us.
- *
- */
-#define MAX_BYTES 1024
-
-extern void ppc_spe_sha256_transform(u32 *state, const u8 *src, u32 blocks);
-
-static void spe_begin(void)
-{
-	/* We just start SPE operations and will save SPE registers later. */
-	preempt_disable();
-	enable_kernel_spe();
-}
-
-static void spe_end(void)
-{
-	disable_kernel_spe();
-	/* reenable preemption */
-	preempt_enable();
-}
-
-static void ppc_spe_sha256_block(struct crypto_sha256_state *sctx,
-				 const u8 *src, int blocks)
-{
-	do {
-		/* cut input data into smaller blocks */
-		int unit = min(blocks, MAX_BYTES / SHA256_BLOCK_SIZE);
-
-		spe_begin();
-		ppc_spe_sha256_transform(sctx->state, src, unit);
-		spe_end();
-
-		src += unit * SHA256_BLOCK_SIZE;
-		blocks -= unit;
-	} while (blocks);
-}
-
-static int ppc_spe_sha256_update(struct shash_desc *desc, const u8 *data,
-			unsigned int len)
-{
-	return sha256_base_do_update_blocks(desc, data, len,
-					    ppc_spe_sha256_block);
-}
-
-static int ppc_spe_sha256_finup(struct shash_desc *desc, const u8 *src,
-				unsigned int len, u8 *out)
-{
-	sha256_base_do_finup(desc, src, len, ppc_spe_sha256_block);
-	return sha256_base_finish(desc, out);
-}
-
-static struct shash_alg algs[2] = { {
-	.digestsize	=	SHA256_DIGEST_SIZE,
-	.init		=	sha256_base_init,
-	.update		=	ppc_spe_sha256_update,
-	.finup		=	ppc_spe_sha256_finup,
-	.descsize	=	sizeof(struct crypto_sha256_state),
-	.base		=	{
-		.cra_name	=	"sha256",
-		.cra_driver_name=	"sha256-ppc-spe",
-		.cra_priority	=	300,
-		.cra_flags	=	CRYPTO_AHASH_ALG_BLOCK_ONLY |
-					CRYPTO_AHASH_ALG_FINUP_MAX,
-		.cra_blocksize	=	SHA256_BLOCK_SIZE,
-		.cra_module	=	THIS_MODULE,
-	}
-}, {
-	.digestsize	=	SHA224_DIGEST_SIZE,
-	.init		=	sha224_base_init,
-	.update		=	ppc_spe_sha256_update,
-	.finup		=	ppc_spe_sha256_finup,
-	.descsize	=	sizeof(struct crypto_sha256_state),
-	.base		=	{
-		.cra_name	=	"sha224",
-		.cra_driver_name=	"sha224-ppc-spe",
-		.cra_priority	=	300,
-		.cra_flags	=	CRYPTO_AHASH_ALG_BLOCK_ONLY |
-					CRYPTO_AHASH_ALG_FINUP_MAX,
-		.cra_blocksize	=	SHA224_BLOCK_SIZE,
-		.cra_module	=	THIS_MODULE,
-	}
-} };
-
-static int __init ppc_spe_sha256_mod_init(void)
-{
-	return crypto_register_shashes(algs, ARRAY_SIZE(algs));
-}
-
-static void __exit ppc_spe_sha256_mod_fini(void)
-{
-	crypto_unregister_shashes(algs, ARRAY_SIZE(algs));
-}
-
-module_init(ppc_spe_sha256_mod_init);
-module_exit(ppc_spe_sha256_mod_fini);
-
-MODULE_LICENSE("GPL");
-MODULE_DESCRIPTION("SHA-224 and SHA-256 Secure Hash Algorithm, SPE optimized");
-
-MODULE_ALIAS_CRYPTO("sha224");
-MODULE_ALIAS_CRYPTO("sha224-ppc-spe");
-MODULE_ALIAS_CRYPTO("sha256");
-MODULE_ALIAS_CRYPTO("sha256-ppc-spe");
diff --git a/arch/powerpc/lib/crypto/Kconfig b/arch/powerpc/lib/crypto/Kconfig
index bf6d0ab22c27..ffa541ad6d5d 100644
--- a/arch/powerpc/lib/crypto/Kconfig
+++ b/arch/powerpc/lib/crypto/Kconfig
@@ -13,3 +13,9 @@ config CRYPTO_POLY1305_P10
 	default CRYPTO_LIB_POLY1305
 	select CRYPTO_ARCH_HAVE_LIB_POLY1305
 	select CRYPTO_LIB_POLY1305_GENERIC
+
+config CRYPTO_SHA256_PPC_SPE
+	tristate
+	depends on SPE
+	default CRYPTO_LIB_SHA256
+	select CRYPTO_ARCH_HAVE_LIB_SHA256
diff --git a/arch/powerpc/lib/crypto/Makefile b/arch/powerpc/lib/crypto/Makefile
index 5709ae14258a..27f231f8e334 100644
--- a/arch/powerpc/lib/crypto/Makefile
+++ b/arch/powerpc/lib/crypto/Makefile
@@ -5,3 +5,6 @@ chacha-p10-crypto-y := chacha-p10-glue.o chacha-p10le-8x.o
 
 obj-$(CONFIG_CRYPTO_POLY1305_P10) += poly1305-p10-crypto.o
 poly1305-p10-crypto-y := poly1305-p10-glue.o poly1305-p10le_64.o
+
+obj-$(CONFIG_CRYPTO_SHA256_PPC_SPE) += sha256-ppc-spe.o
+sha256-ppc-spe-y := sha256.o sha256-spe-asm.o
diff --git a/arch/powerpc/crypto/sha256-spe-asm.S b/arch/powerpc/lib/crypto/sha256-spe-asm.S
similarity index 100%
rename from arch/powerpc/crypto/sha256-spe-asm.S
rename to arch/powerpc/lib/crypto/sha256-spe-asm.S
diff --git a/arch/powerpc/lib/crypto/sha256.c b/arch/powerpc/lib/crypto/sha256.c
new file mode 100644
index 000000000000..6b0f079587eb
--- /dev/null
+++ b/arch/powerpc/lib/crypto/sha256.c
@@ -0,0 +1,70 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * SHA-256 Secure Hash Algorithm, SPE optimized
+ *
+ * Based on generic implementation. The assembler module takes care
+ * about the SPE registers so it can run from interrupt context.
+ *
+ * Copyright (c) 2015 Markus Stockhausen <stockhausen@collogia.de>
+ */
+
+#include <asm/switch_to.h>
+#include <crypto/internal/sha2.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/preempt.h>
+
+/*
+ * MAX_BYTES defines the number of bytes that are allowed to be processed
+ * between preempt_disable() and preempt_enable(). SHA256 takes ~2,000
+ * operations per 64 bytes. e500 cores can issue two arithmetic instructions
+ * per clock cycle using one 32/64 bit unit (SU1) and one 32 bit unit (SU2).
+ * Thus 1KB of input data will need an estimated maximum of 18,000 cycles.
+ * Headroom for cache misses included. Even with the low end model clocked
+ * at 667 MHz this equals to a critical time window of less than 27us.
+ *
+ */
+#define MAX_BYTES 1024
+
+extern void ppc_spe_sha256_transform(u32 *state, const u8 *src, u32 blocks);
+
+static void spe_begin(void)
+{
+	/* We just start SPE operations and will save SPE registers later. */
+	preempt_disable();
+	enable_kernel_spe();
+}
+
+static void spe_end(void)
+{
+	disable_kernel_spe();
+	/* reenable preemption */
+	preempt_enable();
+}
+
+void sha256_blocks_arch(u32 state[SHA256_STATE_WORDS],
+			const u8 *data, size_t nblocks)
+{
+	do {
+		/* cut input data into smaller blocks */
+		u32 unit = min_t(size_t, nblocks,
+				 MAX_BYTES / SHA256_BLOCK_SIZE);
+
+		spe_begin();
+		ppc_spe_sha256_transform(state, data, unit);
+		spe_end();
+
+		data += unit * SHA256_BLOCK_SIZE;
+		nblocks -= unit;
+	} while (nblocks);
+}
+EXPORT_SYMBOL_GPL(sha256_blocks_arch);
+
+bool sha256_is_arch_optimized(void)
+{
+	return true;
+}
+EXPORT_SYMBOL_GPL(sha256_is_arch_optimized);
+
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("SHA-256 Secure Hash Algorithm, SPE optimized");
-- 
2.39.5


