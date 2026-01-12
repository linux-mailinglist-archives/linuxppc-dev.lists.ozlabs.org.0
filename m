Return-Path: <linuxppc-dev+bounces-15580-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 74AA2D14F9D
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Jan 2026 20:26:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dqj3b5Y7Hz3bxM;
	Tue, 13 Jan 2026 06:23:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768245835;
	cv=none; b=O4hJG9lQdmAGhDCHkQUsddgAHZfJcNmKiHYwQQrDWuqMtIioZxnX2ZW6KaaeJSr5b2CSamXUv+q0Y71XhpuEk7/9BUtw6/YxUqjLMVN76iAJrQ4tY45Qupr192Ksup5TYg8MbNLk/v4kv4xWnFy88OAU1os1DQIl2bFe5jqNIogHCBUBheJktdaKSAc1H2j4+7RtnDK5H3qhhsEAxxO7QSPyGvcENg+qeOerPJC5/DKzLpIycPJPmvYhKnFrZ31uPa9y3Bl3Mh2brR8fc3f3KfQha4HmnQZlTC5fx+6t9LiX3swKwwViUy8hmsU/kXmD7RFfaq9Ug1uCciwenurk/A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768245835; c=relaxed/relaxed;
	bh=y/Th55q5dVBMST0fTWaQzI7Ofl3ngmKKCydJxKi9Iyw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mjDnNB0agXiSnid3kkzM3SfOH+ItuzJRSMVFka38rTYpqmerem3FOaVgeyA0pix+KBGDZV1lYiPPyy8VViNV95ndlvOqjgXIGZdgd5djLbxshnPjEN7+eJOgsQCX4M8YmS9e+058IkLoVER3eMu1QhH7TrFXpw/cis+YTt7Y4X4DVg+Hi3fDaLZl/pmwJF1RAVeqvkiIywls+rG+QmW1Mh8ttd3bmjXhlpkj02X56oSeWcz6RVGYAh2Q69K9hcAH9Bosw8XzQYQuxxW8GYMTOcIWwAgf2rc76rZ+xmmziThgXu8H1u9o1UD7jndJ2oTPN+qMmxp6BGSIBa9fsQNP3Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=T6XOwGdA; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=T6XOwGdA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dqj3Z6wNtz2xKx
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Jan 2026 06:23:54 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 66BFD44397;
	Mon, 12 Jan 2026 19:23:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D96D0C2BCB3;
	Mon, 12 Jan 2026 19:23:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768245803;
	bh=FwXk6qzmED9IHMLKZVvaNSrqXpAJP04gsJRrHuxtscM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=T6XOwGdAbWoGHdHy+Y4BgnWKCcYrOmC+y4OkpFDwJHFGKhq9i+qfmsRVaKApbVbcW
	 rh3VKOapM+pB17ZRCYk4BN2kCtxJxlNpJ9VtBnCfWPS0vR9yQKcyfopOxw04RqG0I2
	 TfLQVKOHklQ93owDHFohw/vnbBgF33b6vrbGJ1C0Akz4/0w9p6HM1Wqk3bMsUw/2e/
	 fzF4o3OGHNySbleeGl558Y8e52GQFBkgNHg3i+fEHkhogebMieLuokzcV511aMIaF7
	 uwKXYMs9UCM+PmrgG1tZh4/uvbqo+/MIPGA/p5mYTpMIDxEi49aztNEkC+cz+WDs8c
	 poqbqDIfaPnSQ==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org,
	x86@kernel.org,
	Holger Dengler <dengler@linux.ibm.com>,
	Harald Freudenberger <freude@linux.ibm.com>,
	Eric Biggers <ebiggers@kernel.org>
Subject: [PATCH v2 10/35] lib/crypto: arm/aes: Migrate optimized code into library
Date: Mon, 12 Jan 2026 11:20:08 -0800
Message-ID: <20260112192035.10427-11-ebiggers@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260112192035.10427-1-ebiggers@kernel.org>
References: <20260112192035.10427-1-ebiggers@kernel.org>
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
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Move the ARM optimized single-block AES en/decryption code into
lib/crypto/, wire it up to the AES library API, and remove the
superseded "aes-arm" crypto_cipher algorithm.

The result is that both the AES library and crypto_cipher APIs are now
optimized for ARM, whereas previously only crypto_cipher was (and the
optimizations weren't enabled by default, which this fixes as well).

Acked-by: Ard Biesheuvel <ardb@kernel.org>
Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 arch/arm/configs/milbeaut_m10v_defconfig      |  1 -
 arch/arm/configs/multi_v7_defconfig           |  2 +-
 arch/arm/configs/omap2plus_defconfig          |  2 +-
 arch/arm/configs/pxa_defconfig                |  2 +-
 arch/arm/crypto/Kconfig                       | 18 -----
 arch/arm/crypto/Makefile                      |  2 -
 arch/arm/crypto/aes-cipher-glue.c             | 77 -------------------
 arch/arm/crypto/aes-cipher.h                  | 13 ----
 lib/crypto/Kconfig                            |  1 +
 lib/crypto/Makefile                           |  3 +
 .../crypto/arm}/aes-cipher-core.S             |  0
 lib/crypto/arm/aes.h                          | 56 ++++++++++++++
 12 files changed, 63 insertions(+), 114 deletions(-)
 delete mode 100644 arch/arm/crypto/aes-cipher-glue.c
 delete mode 100644 arch/arm/crypto/aes-cipher.h
 rename {arch/arm/crypto => lib/crypto/arm}/aes-cipher-core.S (100%)
 create mode 100644 lib/crypto/arm/aes.h

diff --git a/arch/arm/configs/milbeaut_m10v_defconfig b/arch/arm/configs/milbeaut_m10v_defconfig
index a2995eb390c6..77b69d672d40 100644
--- a/arch/arm/configs/milbeaut_m10v_defconfig
+++ b/arch/arm/configs/milbeaut_m10v_defconfig
@@ -96,11 +96,10 @@ CONFIG_KEYS=y
 CONFIG_CRYPTO_SELFTESTS=y
 # CONFIG_CRYPTO_ECHAINIV is not set
 CONFIG_CRYPTO_AES=y
 CONFIG_CRYPTO_SEQIV=m
 CONFIG_CRYPTO_GHASH_ARM_CE=m
-CONFIG_CRYPTO_AES_ARM=m
 CONFIG_CRYPTO_AES_ARM_BS=m
 CONFIG_CRYPTO_AES_ARM_CE=m
 # CONFIG_CRYPTO_HW is not set
 CONFIG_DMA_CMA=y
 CONFIG_CMA_SIZE_MBYTES=64
diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index 7f1fa9dd88c9..b6d3e20926bb 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -1284,11 +1284,11 @@ CONFIG_CRYPTO_USER=m
 CONFIG_CRYPTO_USER_API_HASH=m
 CONFIG_CRYPTO_USER_API_SKCIPHER=m
 CONFIG_CRYPTO_USER_API_RNG=m
 CONFIG_CRYPTO_USER_API_AEAD=m
 CONFIG_CRYPTO_GHASH_ARM_CE=m
-CONFIG_CRYPTO_AES_ARM=m
+CONFIG_CRYPTO_AES=m
 CONFIG_CRYPTO_AES_ARM_BS=m
 CONFIG_CRYPTO_AES_ARM_CE=m
 CONFIG_CRYPTO_DEV_SUN4I_SS=m
 CONFIG_CRYPTO_DEV_FSL_CAAM=m
 CONFIG_CRYPTO_DEV_EXYNOS_RNG=m
diff --git a/arch/arm/configs/omap2plus_defconfig b/arch/arm/configs/omap2plus_defconfig
index 4e53c331cd84..0464f6552169 100644
--- a/arch/arm/configs/omap2plus_defconfig
+++ b/arch/arm/configs/omap2plus_defconfig
@@ -704,11 +704,11 @@ CONFIG_ROOT_NFS=y
 CONFIG_NLS_CODEPAGE_437=y
 CONFIG_NLS_ISO8859_1=y
 CONFIG_SECURITY=y
 CONFIG_CRYPTO_MICHAEL_MIC=y
 CONFIG_CRYPTO_GHASH_ARM_CE=m
-CONFIG_CRYPTO_AES_ARM=m
+CONFIG_CRYPTO_AES=m
 CONFIG_CRYPTO_AES_ARM_BS=m
 CONFIG_CRYPTO_DEV_OMAP=m
 CONFIG_CRYPTO_DEV_OMAP_SHAM=m
 CONFIG_CRYPTO_DEV_OMAP_AES=m
 CONFIG_CRYPTO_DEV_OMAP_DES=m
diff --git a/arch/arm/configs/pxa_defconfig b/arch/arm/configs/pxa_defconfig
index 3ea189f1f42f..eacd08fd87ad 100644
--- a/arch/arm/configs/pxa_defconfig
+++ b/arch/arm/configs/pxa_defconfig
@@ -655,11 +655,11 @@ CONFIG_CRYPTO_TGR192=m
 CONFIG_CRYPTO_WP512=m
 CONFIG_CRYPTO_ANUBIS=m
 CONFIG_CRYPTO_XCBC=m
 CONFIG_CRYPTO_DEFLATE=y
 CONFIG_CRYPTO_LZO=y
-CONFIG_CRYPTO_AES_ARM=m
+CONFIG_CRYPTO_AES=m
 CONFIG_FONTS=y
 CONFIG_FONT_8x8=y
 CONFIG_FONT_8x16=y
 CONFIG_FONT_6x11=y
 CONFIG_FONT_MINI_4x6=y
diff --git a/arch/arm/crypto/Kconfig b/arch/arm/crypto/Kconfig
index 167a648a9def..b9c28c818b7c 100644
--- a/arch/arm/crypto/Kconfig
+++ b/arch/arm/crypto/Kconfig
@@ -21,28 +21,10 @@ config CRYPTO_GHASH_ARM_CE
 	  Use an implementation of GHASH (used by the GCM AEAD chaining mode)
 	  that uses the 64x64 to 128 bit polynomial multiplication (vmull.p64)
 	  that is part of the ARMv8 Crypto Extensions, or a slower variant that
 	  uses the vmull.p8 instruction that is part of the basic NEON ISA.
 
-config CRYPTO_AES_ARM
-	tristate "Ciphers: AES"
-	select CRYPTO_ALGAPI
-	select CRYPTO_AES
-	help
-	  Block ciphers: AES cipher algorithms (FIPS-197)
-
-	  Architecture: arm
-
-	  On ARM processors without the Crypto Extensions, this is the
-	  fastest AES implementation for single blocks.  For multiple
-	  blocks, the NEON bit-sliced implementation is usually faster.
-
-	  This implementation may be vulnerable to cache timing attacks,
-	  since it uses lookup tables.  However, as countermeasures it
-	  disables IRQs and preloads the tables; it is hoped this makes
-	  such attacks very difficult.
-
 config CRYPTO_AES_ARM_BS
 	tristate "Ciphers: AES, modes: ECB/CBC/CTR/XTS (bit-sliced NEON)"
 	depends on KERNEL_MODE_NEON
 	select CRYPTO_SKCIPHER
 	select CRYPTO_LIB_AES
diff --git a/arch/arm/crypto/Makefile b/arch/arm/crypto/Makefile
index d6683e9d4992..e73099e120b3 100644
--- a/arch/arm/crypto/Makefile
+++ b/arch/arm/crypto/Makefile
@@ -1,15 +1,13 @@
 # SPDX-License-Identifier: GPL-2.0
 #
 # Arch-specific CryptoAPI modules.
 #
 
-obj-$(CONFIG_CRYPTO_AES_ARM) += aes-arm.o
 obj-$(CONFIG_CRYPTO_AES_ARM_BS) += aes-arm-bs.o
 
 obj-$(CONFIG_CRYPTO_AES_ARM_CE) += aes-arm-ce.o
 obj-$(CONFIG_CRYPTO_GHASH_ARM_CE) += ghash-arm-ce.o
 
-aes-arm-y	:= aes-cipher-core.o aes-cipher-glue.o
 aes-arm-bs-y	:= aes-neonbs-core.o aes-neonbs-glue.o
 aes-arm-ce-y	:= aes-ce-core.o aes-ce-glue.o
 ghash-arm-ce-y	:= ghash-ce-core.o ghash-ce-glue.o
diff --git a/arch/arm/crypto/aes-cipher-glue.c b/arch/arm/crypto/aes-cipher-glue.c
deleted file mode 100644
index f302db808cd3..000000000000
--- a/arch/arm/crypto/aes-cipher-glue.c
+++ /dev/null
@@ -1,77 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*
- * Scalar AES core transform
- *
- * Copyright (C) 2017 Linaro Ltd.
- * Author: Ard Biesheuvel <ard.biesheuvel@linaro.org>
- */
-
-#include <crypto/aes.h>
-#include <crypto/algapi.h>
-#include <linux/module.h>
-#include "aes-cipher.h"
-
-EXPORT_SYMBOL_GPL(__aes_arm_encrypt);
-EXPORT_SYMBOL_GPL(__aes_arm_decrypt);
-
-static int aes_arm_setkey(struct crypto_tfm *tfm, const u8 *in_key,
-			  unsigned int key_len)
-{
-	struct crypto_aes_ctx *ctx = crypto_tfm_ctx(tfm);
-
-	return aes_expandkey(ctx, in_key, key_len);
-}
-
-static void aes_arm_encrypt(struct crypto_tfm *tfm, u8 *out, const u8 *in)
-{
-	struct crypto_aes_ctx *ctx = crypto_tfm_ctx(tfm);
-	int rounds = 6 + ctx->key_length / 4;
-
-	__aes_arm_encrypt(ctx->key_enc, rounds, in, out);
-}
-
-static void aes_arm_decrypt(struct crypto_tfm *tfm, u8 *out, const u8 *in)
-{
-	struct crypto_aes_ctx *ctx = crypto_tfm_ctx(tfm);
-	int rounds = 6 + ctx->key_length / 4;
-
-	__aes_arm_decrypt(ctx->key_dec, rounds, in, out);
-}
-
-static struct crypto_alg aes_alg = {
-	.cra_name			= "aes",
-	.cra_driver_name		= "aes-arm",
-	.cra_priority			= 200,
-	.cra_flags			= CRYPTO_ALG_TYPE_CIPHER,
-	.cra_blocksize			= AES_BLOCK_SIZE,
-	.cra_ctxsize			= sizeof(struct crypto_aes_ctx),
-	.cra_module			= THIS_MODULE,
-
-	.cra_cipher.cia_min_keysize	= AES_MIN_KEY_SIZE,
-	.cra_cipher.cia_max_keysize	= AES_MAX_KEY_SIZE,
-	.cra_cipher.cia_setkey		= aes_arm_setkey,
-	.cra_cipher.cia_encrypt		= aes_arm_encrypt,
-	.cra_cipher.cia_decrypt		= aes_arm_decrypt,
-
-#ifndef CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS
-	.cra_alignmask			= 3,
-#endif
-};
-
-static int __init aes_init(void)
-{
-	return crypto_register_alg(&aes_alg);
-}
-
-static void __exit aes_fini(void)
-{
-	crypto_unregister_alg(&aes_alg);
-}
-
-module_init(aes_init);
-module_exit(aes_fini);
-
-MODULE_DESCRIPTION("Scalar AES cipher for ARM");
-MODULE_AUTHOR("Ard Biesheuvel <ard.biesheuvel@linaro.org>");
-MODULE_LICENSE("GPL v2");
-MODULE_ALIAS_CRYPTO("aes");
diff --git a/arch/arm/crypto/aes-cipher.h b/arch/arm/crypto/aes-cipher.h
deleted file mode 100644
index d5db2b87eb69..000000000000
--- a/arch/arm/crypto/aes-cipher.h
+++ /dev/null
@@ -1,13 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-#ifndef ARM_CRYPTO_AES_CIPHER_H
-#define ARM_CRYPTO_AES_CIPHER_H
-
-#include <linux/linkage.h>
-#include <linux/types.h>
-
-asmlinkage void __aes_arm_encrypt(const u32 rk[], int rounds,
-				  const u8 *in, u8 *out);
-asmlinkage void __aes_arm_decrypt(const u32 rk[], int rounds,
-				  const u8 *in, u8 *out);
-
-#endif /* ARM_CRYPTO_AES_CIPHER_H */
diff --git a/lib/crypto/Kconfig b/lib/crypto/Kconfig
index 4efad77daa24..60420b421e04 100644
--- a/lib/crypto/Kconfig
+++ b/lib/crypto/Kconfig
@@ -12,10 +12,11 @@ config CRYPTO_LIB_AES
 	tristate
 
 config CRYPTO_LIB_AES_ARCH
 	bool
 	depends on CRYPTO_LIB_AES && !UML && !KMSAN
+	default y if ARM
 
 config CRYPTO_LIB_AESCFB
 	tristate
 	select CRYPTO_LIB_AES
 	select CRYPTO_LIB_UTILS
diff --git a/lib/crypto/Makefile b/lib/crypto/Makefile
index 01193b3f47ba..2f6b0f59eb1b 100644
--- a/lib/crypto/Makefile
+++ b/lib/crypto/Makefile
@@ -19,10 +19,13 @@ libcryptoutils-y				:= memneq.o utils.o
 
 obj-$(CONFIG_CRYPTO_LIB_AES) += libaes.o
 libaes-y := aes.o
 ifeq ($(CONFIG_CRYPTO_LIB_AES_ARCH),y)
 CFLAGS_aes.o += -I$(src)/$(SRCARCH)
+
+libaes-$(CONFIG_ARM) += arm/aes-cipher-core.o
+
 endif # CONFIG_CRYPTO_LIB_AES_ARCH
 
 ################################################################################
 
 obj-$(CONFIG_CRYPTO_LIB_AESCFB)			+= libaescfb.o
diff --git a/arch/arm/crypto/aes-cipher-core.S b/lib/crypto/arm/aes-cipher-core.S
similarity index 100%
rename from arch/arm/crypto/aes-cipher-core.S
rename to lib/crypto/arm/aes-cipher-core.S
diff --git a/lib/crypto/arm/aes.h b/lib/crypto/arm/aes.h
new file mode 100644
index 000000000000..1dd7dfa657bb
--- /dev/null
+++ b/lib/crypto/arm/aes.h
@@ -0,0 +1,56 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * AES block cipher, optimized for ARM
+ *
+ * Copyright (C) 2017 Linaro Ltd.
+ * Copyright 2026 Google LLC
+ */
+
+asmlinkage void __aes_arm_encrypt(const u32 rk[], int rounds,
+				  const u8 in[AES_BLOCK_SIZE],
+				  u8 out[AES_BLOCK_SIZE]);
+asmlinkage void __aes_arm_decrypt(const u32 inv_rk[], int rounds,
+				  const u8 in[AES_BLOCK_SIZE],
+				  u8 out[AES_BLOCK_SIZE]);
+
+static void aes_preparekey_arch(union aes_enckey_arch *k,
+				union aes_invkey_arch *inv_k,
+				const u8 *in_key, int key_len, int nrounds)
+{
+	aes_expandkey_generic(k->rndkeys, inv_k ? inv_k->inv_rndkeys : NULL,
+			      in_key, key_len);
+}
+
+static void aes_encrypt_arch(const struct aes_enckey *key,
+			     u8 out[AES_BLOCK_SIZE],
+			     const u8 in[AES_BLOCK_SIZE])
+{
+	if (!IS_ENABLED(CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS) &&
+	    !IS_ALIGNED((uintptr_t)out | (uintptr_t)in, 4)) {
+		u8 bounce_buf[AES_BLOCK_SIZE] __aligned(4);
+
+		memcpy(bounce_buf, in, AES_BLOCK_SIZE);
+		__aes_arm_encrypt(key->k.rndkeys, key->nrounds, bounce_buf,
+				  bounce_buf);
+		memcpy(out, bounce_buf, AES_BLOCK_SIZE);
+		return;
+	}
+	__aes_arm_encrypt(key->k.rndkeys, key->nrounds, in, out);
+}
+
+static void aes_decrypt_arch(const struct aes_key *key,
+			     u8 out[AES_BLOCK_SIZE],
+			     const u8 in[AES_BLOCK_SIZE])
+{
+	if (!IS_ENABLED(CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS) &&
+	    !IS_ALIGNED((uintptr_t)out | (uintptr_t)in, 4)) {
+		u8 bounce_buf[AES_BLOCK_SIZE] __aligned(4);
+
+		memcpy(bounce_buf, in, AES_BLOCK_SIZE);
+		__aes_arm_decrypt(key->inv_k.inv_rndkeys, key->nrounds,
+				  bounce_buf, bounce_buf);
+		memcpy(out, bounce_buf, AES_BLOCK_SIZE);
+		return;
+	}
+	__aes_arm_decrypt(key->inv_k.inv_rndkeys, key->nrounds, in, out);
+}
-- 
2.52.0


