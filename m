Return-Path: <linuxppc-dev+bounces-3654-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FEC19DF874
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Dec 2024 02:22:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y1mG91mPVz2yVv;
	Mon,  2 Dec 2024 12:21:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733102497;
	cv=none; b=hdxj5SuZaIRzlxuKK2ntaGvi9egforiOlM1+BbzwpN+LE5Ko+9g6AsdvvdH6Mxx7RrDbFkThH/wg9bt6nsh1lGmQ9UQjDpuiW4QPceGh1fXBDnJAntWwja8Fn+bC9gG1yuXPGqdo9IFwbGfK8lMv1ZnwE93qpBBHxtPG+B0zkiI6mAW4SOWY7RXRw15xOOLIk2ztb5iSu20s7H52ttX5orSAHP7/io0Ct51jL8bWxQNDeTtoLVXY+bWVqkVTG9V+UTvsXyX/8E++V0Jm/I2Jxif7p+WTsblm3z5rHnBMe++f42aj8e1MqRLLJgnMl8tIAEmGzsXxK2AehewKVDrS/g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733102497; c=relaxed/relaxed;
	bh=9tFB8TfKEP60xiMzpLzfqRpM773vx9w0nhuiDeU1G1w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=W51wnY7wIPGMPr3H/cDH9bU4Qzp9tY3tpurnoA7scBivkgAXhPcNso6RK7qdGSfEUQCnNGj68r01AXrhR5xRrdb+uF6eRCtv7vNy6IhiyuHNKPFmM6L+C2PeK8fGjSySWFee9c6PNLAszt6PvNnxU2rgNG6G06VTHPGrHcfurpxgV1pGDYVilnIdgJj2XErEvQf9EFvMRYKYhe7sZBcaFUe1LetqsTxOx4yrLNtqHo2N9ktpl9ZpUiVtLtbeJglt9mjHlk4RYK0Qg0apGywKtL8UmUX7iHY7xCN+LgsobFvaBDVR+SzU5k5HuCaYT3g1qasMBHe+gVpWV1UNSQHyZQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=roh7dYZ4; dkim-atps=neutral; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=roh7dYZ4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y1mG72r3jz2yjJ
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  2 Dec 2024 12:21:35 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id B78D6A40C41;
	Mon,  2 Dec 2024 01:19:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B89D5C4CEE3;
	Mon,  2 Dec 2024 01:21:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733102491;
	bh=Roa4TfbytHbvq/r7iCWK6FxA3fDbBdoTZ7KuKPg5a44=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=roh7dYZ4iWFsclhe2Y89mOu8wnuoGjQcAR1+Yqp75tTFezND4mTYidpeohsGUNC7o
	 fsagCBmyxU519eSbL5WoTr3o8s2XUT6KDVEqSRO0TiRglSvjS3+xGpGBJD92VmjruL
	 1Qj6IJi1ZurQm6gsvaU5jLZgM2DMVdt81PHhgJ7eDw4BnMB22gwcs23Op6tl+86lIg
	 30x3YYeTPp9jG+mdSnyYSS4ZoJ6UdnpudNNuEo6XRR80Lz7p/ZVgATT2VdyPhipc34
	 NPBy5CJr+uP6e+AQ3vhCVozFmOeu3KaQ0OEHGF2uZeOHwH86S1exP/D5COJVvJ88dq
	 gND2gcUcrFqUg==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: linux-arch@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-crypto@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	x86@kernel.org,
	Zhihang Shao <zhihang.shao.iscas@gmail.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	"Martin K. Petersen" <martin.petersen@oracle.com>
Subject: [PATCH v2 06/12] arm64/crc-t10dif: expose CRC-T10DIF function through lib
Date: Sun,  1 Dec 2024 17:20:50 -0800
Message-ID: <20241202012056.209768-7-ebiggers@kernel.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241202012056.209768-1-ebiggers@kernel.org>
References: <20241202012056.209768-1-ebiggers@kernel.org>
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
X-Spam-Status: No, score=-2.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

From: Eric Biggers <ebiggers@google.com>

Move the arm64 CRC-T10DIF assembly code into the lib directory and wire
it up to the library interface.  This allows it to be used without going
through the crypto API.  It remains usable via the crypto API too via
the shash algorithms that use the library interface.  Thus all the
arch-specific "shash" code becomes unnecessary and is removed.

Note: to see the diff from arch/arm64/crypto/crct10dif-ce-glue.c to
arch/arm64/lib/crc-t10dif-glue.c, view this commit with 'git show -M10'.

Reviewed-by: Ard Biesheuvel <ardb@kernel.org>
Reviewed-by: Martin K. Petersen <martin.petersen@oracle.com>
Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 arch/arm64/Kconfig                            |   1 +
 arch/arm64/configs/defconfig                  |   1 -
 arch/arm64/crypto/Kconfig                     |  10 --
 arch/arm64/crypto/Makefile                    |   3 -
 arch/arm64/crypto/crct10dif-ce-glue.c         | 132 ------------------
 arch/arm64/lib/Makefile                       |   3 +
 .../crc-t10dif-core.S}                        |   0
 arch/arm64/lib/crc-t10dif-glue.c              |  81 +++++++++++
 .../testing/selftests/arm64/fp/kernel-test.c  |   3 +-
 9 files changed, 86 insertions(+), 148 deletions(-)
 delete mode 100644 arch/arm64/crypto/crct10dif-ce-glue.c
 rename arch/arm64/{crypto/crct10dif-ce-core.S => lib/crc-t10dif-core.S} (100%)
 create mode 100644 arch/arm64/lib/crc-t10dif-glue.c

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index 71f6310c8240..cbfd357f94a6 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -20,10 +20,11 @@ config ARM64
 	select ARCH_ENABLE_SPLIT_PMD_PTLOCK if PGTABLE_LEVELS > 2
 	select ARCH_ENABLE_THP_MIGRATION if TRANSPARENT_HUGEPAGE
 	select ARCH_HAS_CACHE_LINE_SIZE
 	select ARCH_HAS_CC_PLATFORM
 	select ARCH_HAS_CRC32
+	select ARCH_HAS_CRC_T10DIF if KERNEL_MODE_NEON
 	select ARCH_HAS_CURRENT_STACK_POINTER
 	select ARCH_HAS_DEBUG_VIRTUAL
 	select ARCH_HAS_DEBUG_VM_PGTABLE
 	select ARCH_HAS_DMA_OPS if XEN
 	select ARCH_HAS_DMA_PREP_COHERENT
diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index c62831e61586..9c0d6b93a3c2 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1696,11 +1696,10 @@ CONFIG_CRYPTO_SHA512_ARM64_CE=m
 CONFIG_CRYPTO_SHA3_ARM64=m
 CONFIG_CRYPTO_SM3_ARM64_CE=m
 CONFIG_CRYPTO_AES_ARM64_CE_BLK=y
 CONFIG_CRYPTO_AES_ARM64_BS=m
 CONFIG_CRYPTO_AES_ARM64_CE_CCM=y
-CONFIG_CRYPTO_CRCT10DIF_ARM64_CE=m
 CONFIG_CRYPTO_DEV_SUN8I_CE=m
 CONFIG_CRYPTO_DEV_FSL_CAAM=m
 CONFIG_CRYPTO_DEV_FSL_DPAA2_CAAM=m
 CONFIG_CRYPTO_DEV_QCE=m
 CONFIG_CRYPTO_DEV_QCOM_RNG=m
diff --git a/arch/arm64/crypto/Kconfig b/arch/arm64/crypto/Kconfig
index e7d9bd8e4709..5636ab83f22a 100644
--- a/arch/arm64/crypto/Kconfig
+++ b/arch/arm64/crypto/Kconfig
@@ -310,17 +310,7 @@ config CRYPTO_SM4_ARM64_CE_GCM
 	  Architecture: arm64 using:
 	  - ARMv8 Crypto Extensions
 	  - PMULL (Polynomial Multiply Long) instructions
 	  - NEON (Advanced SIMD) extensions
 
-config CRYPTO_CRCT10DIF_ARM64_CE
-	tristate "CRCT10DIF (PMULL)"
-	depends on KERNEL_MODE_NEON && CRC_T10DIF
-	select CRYPTO_HASH
-	help
-	  CRC16 CRC algorithm used for the T10 (SCSI) Data Integrity Field (DIF)
-
-	  Architecture: arm64 using
-	  - PMULL (Polynomial Multiply Long) instructions
-
 endmenu
 
diff --git a/arch/arm64/crypto/Makefile b/arch/arm64/crypto/Makefile
index fbe64dce66e0..e7139c4768ce 100644
--- a/arch/arm64/crypto/Makefile
+++ b/arch/arm64/crypto/Makefile
@@ -42,13 +42,10 @@ obj-$(CONFIG_CRYPTO_GHASH_ARM64_CE) += ghash-ce.o
 ghash-ce-y := ghash-ce-glue.o ghash-ce-core.o
 
 obj-$(CONFIG_CRYPTO_POLYVAL_ARM64_CE) += polyval-ce.o
 polyval-ce-y := polyval-ce-glue.o polyval-ce-core.o
 
-obj-$(CONFIG_CRYPTO_CRCT10DIF_ARM64_CE) += crct10dif-ce.o
-crct10dif-ce-y := crct10dif-ce-core.o crct10dif-ce-glue.o
-
 obj-$(CONFIG_CRYPTO_AES_ARM64_CE) += aes-ce-cipher.o
 aes-ce-cipher-y := aes-ce-core.o aes-ce-glue.o
 
 obj-$(CONFIG_CRYPTO_AES_ARM64_CE_CCM) += aes-ce-ccm.o
 aes-ce-ccm-y := aes-ce-ccm-glue.o aes-ce-ccm-core.o
diff --git a/arch/arm64/crypto/crct10dif-ce-glue.c b/arch/arm64/crypto/crct10dif-ce-glue.c
deleted file mode 100644
index 08bcbd884395..000000000000
--- a/arch/arm64/crypto/crct10dif-ce-glue.c
+++ /dev/null
@@ -1,132 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*
- * Accelerated CRC-T10DIF using arm64 NEON and Crypto Extensions instructions
- *
- * Copyright (C) 2016 - 2017 Linaro Ltd <ard.biesheuvel@linaro.org>
- */
-
-#include <linux/cpufeature.h>
-#include <linux/crc-t10dif.h>
-#include <linux/init.h>
-#include <linux/kernel.h>
-#include <linux/module.h>
-#include <linux/string.h>
-
-#include <crypto/internal/hash.h>
-#include <crypto/internal/simd.h>
-
-#include <asm/neon.h>
-#include <asm/simd.h>
-
-#define CRC_T10DIF_PMULL_CHUNK_SIZE	16U
-
-asmlinkage void crc_t10dif_pmull_p8(u16 init_crc, const u8 *buf, size_t len,
-				    u8 out[16]);
-asmlinkage u16 crc_t10dif_pmull_p64(u16 init_crc, const u8 *buf, size_t len);
-
-static int crct10dif_init(struct shash_desc *desc)
-{
-	u16 *crc = shash_desc_ctx(desc);
-
-	*crc = 0;
-	return 0;
-}
-
-static int crct10dif_update_pmull_p8(struct shash_desc *desc, const u8 *data,
-			    unsigned int length)
-{
-	u16 *crcp = shash_desc_ctx(desc);
-	u16 crc = *crcp;
-	u8 buf[16];
-
-	if (length > CRC_T10DIF_PMULL_CHUNK_SIZE && crypto_simd_usable()) {
-		kernel_neon_begin();
-		crc_t10dif_pmull_p8(crc, data, length, buf);
-		kernel_neon_end();
-
-		crc = 0;
-		data = buf;
-		length = sizeof(buf);
-	}
-
-	*crcp = crc_t10dif_generic(crc, data, length);
-	return 0;
-}
-
-static int crct10dif_update_pmull_p64(struct shash_desc *desc, const u8 *data,
-			    unsigned int length)
-{
-	u16 *crc = shash_desc_ctx(desc);
-
-	if (length >= CRC_T10DIF_PMULL_CHUNK_SIZE && crypto_simd_usable()) {
-		kernel_neon_begin();
-		*crc = crc_t10dif_pmull_p64(*crc, data, length);
-		kernel_neon_end();
-	} else {
-		*crc = crc_t10dif_generic(*crc, data, length);
-	}
-
-	return 0;
-}
-
-static int crct10dif_final(struct shash_desc *desc, u8 *out)
-{
-	u16 *crc = shash_desc_ctx(desc);
-
-	*(u16 *)out = *crc;
-	return 0;
-}
-
-static struct shash_alg crc_t10dif_alg[] = {{
-	.digestsize		= CRC_T10DIF_DIGEST_SIZE,
-	.init			= crct10dif_init,
-	.update			= crct10dif_update_pmull_p8,
-	.final			= crct10dif_final,
-	.descsize		= CRC_T10DIF_DIGEST_SIZE,
-
-	.base.cra_name		= "crct10dif",
-	.base.cra_driver_name	= "crct10dif-arm64-neon",
-	.base.cra_priority	= 150,
-	.base.cra_blocksize	= CRC_T10DIF_BLOCK_SIZE,
-	.base.cra_module	= THIS_MODULE,
-}, {
-	.digestsize		= CRC_T10DIF_DIGEST_SIZE,
-	.init			= crct10dif_init,
-	.update			= crct10dif_update_pmull_p64,
-	.final			= crct10dif_final,
-	.descsize		= CRC_T10DIF_DIGEST_SIZE,
-
-	.base.cra_name		= "crct10dif",
-	.base.cra_driver_name	= "crct10dif-arm64-ce",
-	.base.cra_priority	= 200,
-	.base.cra_blocksize	= CRC_T10DIF_BLOCK_SIZE,
-	.base.cra_module	= THIS_MODULE,
-}};
-
-static int __init crc_t10dif_mod_init(void)
-{
-	if (cpu_have_named_feature(PMULL))
-		return crypto_register_shashes(crc_t10dif_alg,
-					       ARRAY_SIZE(crc_t10dif_alg));
-	else
-		/* only register the first array element */
-		return crypto_register_shash(crc_t10dif_alg);
-}
-
-static void __exit crc_t10dif_mod_exit(void)
-{
-	if (cpu_have_named_feature(PMULL))
-		crypto_unregister_shashes(crc_t10dif_alg,
-					  ARRAY_SIZE(crc_t10dif_alg));
-	else
-		crypto_unregister_shash(crc_t10dif_alg);
-}
-
-module_cpu_feature_match(ASIMD, crc_t10dif_mod_init);
-module_exit(crc_t10dif_mod_exit);
-
-MODULE_AUTHOR("Ard Biesheuvel <ard.biesheuvel@linaro.org>");
-MODULE_DESCRIPTION("CRC-T10DIF using arm64 NEON and Crypto Extensions");
-MODULE_LICENSE("GPL v2");
-MODULE_ALIAS_CRYPTO("crct10dif");
-MODULE_ALIAS_CRYPTO("crct10dif-arm64-ce");
diff --git a/arch/arm64/lib/Makefile b/arch/arm64/lib/Makefile
index 5fbcf0d56665..4d49dff721a8 100644
--- a/arch/arm64/lib/Makefile
+++ b/arch/arm64/lib/Makefile
@@ -14,10 +14,13 @@ endif
 lib-$(CONFIG_ARCH_HAS_UACCESS_FLUSHCACHE) += uaccess_flushcache.o
 
 obj-$(CONFIG_CRC32_ARCH) += crc32-arm64.o
 crc32-arm64-y := crc32.o crc32-glue.o
 
+obj-$(CONFIG_CRC_T10DIF_ARCH) += crc-t10dif-arm64.o
+crc-t10dif-arm64-y := crc-t10dif-glue.o crc-t10dif-core.o
+
 obj-$(CONFIG_FUNCTION_ERROR_INJECTION) += error-inject.o
 
 obj-$(CONFIG_ARM64_MTE) += mte.o
 
 obj-$(CONFIG_KASAN_SW_TAGS) += kasan_sw_tags.o
diff --git a/arch/arm64/crypto/crct10dif-ce-core.S b/arch/arm64/lib/crc-t10dif-core.S
similarity index 100%
rename from arch/arm64/crypto/crct10dif-ce-core.S
rename to arch/arm64/lib/crc-t10dif-core.S
diff --git a/arch/arm64/lib/crc-t10dif-glue.c b/arch/arm64/lib/crc-t10dif-glue.c
new file mode 100644
index 000000000000..dab7e3796232
--- /dev/null
+++ b/arch/arm64/lib/crc-t10dif-glue.c
@@ -0,0 +1,81 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Accelerated CRC-T10DIF using arm64 NEON and Crypto Extensions instructions
+ *
+ * Copyright (C) 2016 - 2017 Linaro Ltd <ard.biesheuvel@linaro.org>
+ */
+
+#include <linux/cpufeature.h>
+#include <linux/crc-t10dif.h>
+#include <linux/init.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/string.h>
+
+#include <crypto/internal/simd.h>
+
+#include <asm/neon.h>
+#include <asm/simd.h>
+
+static DEFINE_STATIC_KEY_FALSE(have_asimd);
+static DEFINE_STATIC_KEY_FALSE(have_pmull);
+
+#define CRC_T10DIF_PMULL_CHUNK_SIZE	16U
+
+asmlinkage void crc_t10dif_pmull_p8(u16 init_crc, const u8 *buf, size_t len,
+				    u8 out[16]);
+asmlinkage u16 crc_t10dif_pmull_p64(u16 init_crc, const u8 *buf, size_t len);
+
+u16 crc_t10dif_arch(u16 crc, const u8 *data, size_t length)
+{
+	if (length >= CRC_T10DIF_PMULL_CHUNK_SIZE) {
+		if (static_branch_likely(&have_pmull)) {
+			if (crypto_simd_usable()) {
+				kernel_neon_begin();
+				crc = crc_t10dif_pmull_p64(crc, data, length);
+				kernel_neon_end();
+				return crc;
+			}
+		} else if (length > CRC_T10DIF_PMULL_CHUNK_SIZE &&
+			   static_branch_likely(&have_asimd) &&
+			   crypto_simd_usable()) {
+			u8 buf[16];
+
+			kernel_neon_begin();
+			crc_t10dif_pmull_p8(crc, data, length, buf);
+			kernel_neon_end();
+
+			crc = 0;
+			data = buf;
+			length = sizeof(buf);
+		}
+	}
+	return crc_t10dif_generic(crc, data, length);
+}
+EXPORT_SYMBOL(crc_t10dif_arch);
+
+static int __init crc_t10dif_arm64_init(void)
+{
+	if (cpu_have_named_feature(ASIMD)) {
+		static_branch_enable(&have_asimd);
+		if (cpu_have_named_feature(PMULL))
+			static_branch_enable(&have_pmull);
+	}
+	return 0;
+}
+arch_initcall(crc_t10dif_arm64_init);
+
+static void __exit crc_t10dif_arm64_exit(void)
+{
+}
+module_exit(crc_t10dif_arm64_exit);
+
+bool crc_t10dif_is_optimized(void)
+{
+	return static_key_enabled(&have_asimd);
+}
+EXPORT_SYMBOL(crc_t10dif_is_optimized);
+
+MODULE_AUTHOR("Ard Biesheuvel <ard.biesheuvel@linaro.org>");
+MODULE_DESCRIPTION("CRC-T10DIF using arm64 NEON and Crypto Extensions");
+MODULE_LICENSE("GPL v2");
diff --git a/tools/testing/selftests/arm64/fp/kernel-test.c b/tools/testing/selftests/arm64/fp/kernel-test.c
index 859345379044..348e8bef62c7 100644
--- a/tools/testing/selftests/arm64/fp/kernel-test.c
+++ b/tools/testing/selftests/arm64/fp/kernel-test.c
@@ -44,12 +44,11 @@ static void handle_kick_signal(int sig, siginfo_t *info, void *context)
 {
 	sigs++;
 }
 
 static char *drivers[] = {
-	"crct10dif-arm64-ce",
-	/* "crct10dif-arm64-neon", - Same priority as generic */
+	"crct10dif-arm64",
 	"sha1-ce",
 	"sha224-arm64",
 	"sha224-arm64-neon",
 	"sha224-ce",
 	"sha256-arm64",
-- 
2.47.1


