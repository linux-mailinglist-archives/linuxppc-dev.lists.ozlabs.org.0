Return-Path: <linuxppc-dev+bounces-3653-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D90FC9DF86D
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Dec 2024 02:21:52 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y1mG74lVHz2yjg;
	Mon,  2 Dec 2024 12:21:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733102495;
	cv=none; b=ji02XgVR3scZtXjbLT5uQI5d6SkCokVwxZclP4XzVaYgosRDZKoXCNrs6mCILYch2icVZtScLZ9mWBqRMzqsRVGKeW+2Waasft8H+OWjDK3uhZ6v5NgG6QjBgYp6Zgb7FVa3QFA6mfjr8iGqrANRj8GCrUKhHQnrYJwKTFL1ayxE0AGQ6AucROOZ3Q+zhBUJoNnEodtnKIAuTMsBTiIvwVRS/2lCtjAgEoV3pYRB1exNxA09+vH5FIUVukGMeLsZIVUbsNcsuleR0c1FFzNjdcw9ppzjJBU14rSXOnq82NsvX5GryejLtnkrJkC9dVOWiJF7dCQ10UbAVhtEUqd2bg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733102495; c=relaxed/relaxed;
	bh=+Hb1XHT7BCneC2tQ+Uq4AVpJcszwbm8PjcuOmwmtm3E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=V3oufLoKzZCmpiltQLKgddllsHShkR7gTRSqZGrY3/87yWzjqdZ9VAzJ3b4EzMy74+aR6KaEPPMfxlTC4CBt3DcVrVRjRCkBN8OTlu9ij2gfWiV531dzyXxpFsIdK774QJbcNyAiD5Z77FnKBVayy5YPWgiwBFWZ/XfsiJBYVB+PdSPxUvFlWF1XBHZmbm9HgcGJOcEOpkVVS6D/v6VDB8w851eoEDSBjACBdyd1x6Pg62XGyUh3t3/gGJlMK8NASInrahD1A63Gl78M3laNq1JNAgQAMsUoSkTEJ/9EOvDd9LNOMDoYgnRLwZiIb+FSItUrs7FSt6kgS/KG77pAMA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=TdVZm53z; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=TdVZm53z;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y1mG45Snjz2yWK
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  2 Dec 2024 12:21:32 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id E1063A40C12;
	Mon,  2 Dec 2024 01:19:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E405EC4CECF;
	Mon,  2 Dec 2024 01:21:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733102490;
	bh=ISfyNvdNpbkV2arizMvQq4uuyReubir2d48UPRuYgKY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TdVZm53zic6CXInecLInLx9MwZ3dHDWGCNOa8JMD1chwSFgAiZVrp5PnkAsXYpq77
	 WnZXEbiSoqhArWNxH+ZuHKwG9KD0P5fdpsIb/qFvlEmW4x8M7WFB/9Fsf0egD2ybhD
	 NSxdIG6XSOZ8UTQq144zpskZSXnTAwb8zlTVSy09VY+xOCq/+IDslS8v0nGPElhgYD
	 5/4cOALmUU8+bICIZZLjYtaPrhtu6PjdpQubG8EEvbgPuutp3p2xb9vauAZtqJhdn3
	 TSdMLLHe7qsQ+soXNNIunYGiHAscwKsHl/kCnY6MJXSwZGthZhWttt5HIr04zrKxvL
	 P4kxOQLxxEWsA==
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
Subject: [PATCH v2 04/12] x86/crc-t10dif: expose CRC-T10DIF function through lib
Date: Sun,  1 Dec 2024 17:20:48 -0800
Message-ID: <20241202012056.209768-5-ebiggers@kernel.org>
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

Move the x86 CRC-T10DIF assembly code into the lib directory and wire it
up to the library interface.  This allows it to be used without going
through the crypto API.  It remains usable via the crypto API too via
the shash algorithms that use the library interface.  Thus all the
arch-specific "shash" code becomes unnecessary and is removed.

Reviewed-by: Ard Biesheuvel <ardb@kernel.org>
Reviewed-by: Martin K. Petersen <martin.petersen@oracle.com>
Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 arch/x86/Kconfig                              |   1 +
 arch/x86/crypto/Kconfig                       |  10 --
 arch/x86/crypto/Makefile                      |   3 -
 arch/x86/crypto/crct10dif-pclmul_glue.c       | 143 ------------------
 arch/x86/lib/Makefile                         |   3 +
 arch/x86/lib/crc-t10dif-glue.c                |  51 +++++++
 .../{crypto => lib}/crct10dif-pcl-asm_64.S    |   0
 7 files changed, 55 insertions(+), 156 deletions(-)
 delete mode 100644 arch/x86/crypto/crct10dif-pclmul_glue.c
 create mode 100644 arch/x86/lib/crc-t10dif-glue.c
 rename arch/x86/{crypto => lib}/crct10dif-pcl-asm_64.S (100%)

diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index 4f4fc67fbce7..65f8478fe7a9 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -75,10 +75,11 @@ config X86
 	select ARCH_HAS_CACHE_LINE_SIZE
 	select ARCH_HAS_CPU_CACHE_INVALIDATE_MEMREGION
 	select ARCH_HAS_CPU_FINALIZE_INIT
 	select ARCH_HAS_CPU_PASID		if IOMMU_SVA
 	select ARCH_HAS_CRC32
+	select ARCH_HAS_CRC_T10DIF		if X86_64
 	select ARCH_HAS_CURRENT_STACK_POINTER
 	select ARCH_HAS_DEBUG_VIRTUAL
 	select ARCH_HAS_DEBUG_VM_PGTABLE	if !X86_PAE
 	select ARCH_HAS_DEVMEM_IS_ALLOWED
 	select ARCH_HAS_DMA_OPS			if GART_IOMMU || XEN
diff --git a/arch/x86/crypto/Kconfig b/arch/x86/crypto/Kconfig
index ba9a7e73cd08..4757bf922075 100644
--- a/arch/x86/crypto/Kconfig
+++ b/arch/x86/crypto/Kconfig
@@ -490,16 +490,6 @@ config CRYPTO_GHASH_CLMUL_NI_INTEL
 	  GCM GHASH hash function (NIST SP800-38D)
 
 	  Architecture: x86_64 using:
 	  - CLMUL-NI (carry-less multiplication new instructions)
 
-config CRYPTO_CRCT10DIF_PCLMUL
-	tristate "CRCT10DIF (PCLMULQDQ)"
-	depends on X86 && 64BIT && CRC_T10DIF
-	select CRYPTO_HASH
-	help
-	  CRC16 CRC algorithm used for the T10 (SCSI) Data Integrity Field (DIF)
-
-	  Architecture: x86_64 using:
-	  - PCLMULQDQ (carry-less multiplication)
-
 endmenu
diff --git a/arch/x86/crypto/Makefile b/arch/x86/crypto/Makefile
index 030b925ca4e2..07b00bfca64b 100644
--- a/arch/x86/crypto/Makefile
+++ b/arch/x86/crypto/Makefile
@@ -73,13 +73,10 @@ obj-$(CONFIG_CRYPTO_GHASH_CLMUL_NI_INTEL) += ghash-clmulni-intel.o
 ghash-clmulni-intel-y := ghash-clmulni-intel_asm.o ghash-clmulni-intel_glue.o
 
 obj-$(CONFIG_CRYPTO_POLYVAL_CLMUL_NI) += polyval-clmulni.o
 polyval-clmulni-y := polyval-clmulni_asm.o polyval-clmulni_glue.o
 
-obj-$(CONFIG_CRYPTO_CRCT10DIF_PCLMUL) += crct10dif-pclmul.o
-crct10dif-pclmul-y := crct10dif-pcl-asm_64.o crct10dif-pclmul_glue.o
-
 obj-$(CONFIG_CRYPTO_POLY1305_X86_64) += poly1305-x86_64.o
 poly1305-x86_64-y := poly1305-x86_64-cryptogams.o poly1305_glue.o
 targets += poly1305-x86_64-cryptogams.S
 
 obj-$(CONFIG_CRYPTO_NHPOLY1305_SSE2) += nhpoly1305-sse2.o
diff --git a/arch/x86/crypto/crct10dif-pclmul_glue.c b/arch/x86/crypto/crct10dif-pclmul_glue.c
deleted file mode 100644
index 71291d5af9f4..000000000000
--- a/arch/x86/crypto/crct10dif-pclmul_glue.c
+++ /dev/null
@@ -1,143 +0,0 @@
-/*
- * Cryptographic API.
- *
- * T10 Data Integrity Field CRC16 Crypto Transform using PCLMULQDQ Instructions
- *
- * Copyright (C) 2013 Intel Corporation
- * Author: Tim Chen <tim.c.chen@linux.intel.com>
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms of the GNU General Public License as published by the Free
- * Software Foundation; either version 2 of the License, or (at your option)
- * any later version.
- *
- * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
- * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
- * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
- * NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS
- * BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN
- * ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
- * CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
- * SOFTWARE.
- *
- */
-
-#include <linux/types.h>
-#include <linux/module.h>
-#include <linux/crc-t10dif.h>
-#include <crypto/internal/hash.h>
-#include <crypto/internal/simd.h>
-#include <linux/init.h>
-#include <linux/string.h>
-#include <linux/kernel.h>
-#include <asm/cpufeatures.h>
-#include <asm/cpu_device_id.h>
-#include <asm/simd.h>
-
-asmlinkage u16 crc_t10dif_pcl(u16 init_crc, const u8 *buf, size_t len);
-
-struct chksum_desc_ctx {
-	__u16 crc;
-};
-
-static int chksum_init(struct shash_desc *desc)
-{
-	struct chksum_desc_ctx *ctx = shash_desc_ctx(desc);
-
-	ctx->crc = 0;
-
-	return 0;
-}
-
-static int chksum_update(struct shash_desc *desc, const u8 *data,
-			 unsigned int length)
-{
-	struct chksum_desc_ctx *ctx = shash_desc_ctx(desc);
-
-	if (length >= 16 && crypto_simd_usable()) {
-		kernel_fpu_begin();
-		ctx->crc = crc_t10dif_pcl(ctx->crc, data, length);
-		kernel_fpu_end();
-	} else
-		ctx->crc = crc_t10dif_generic(ctx->crc, data, length);
-	return 0;
-}
-
-static int chksum_final(struct shash_desc *desc, u8 *out)
-{
-	struct chksum_desc_ctx *ctx = shash_desc_ctx(desc);
-
-	*(__u16 *)out = ctx->crc;
-	return 0;
-}
-
-static int __chksum_finup(__u16 crc, const u8 *data, unsigned int len, u8 *out)
-{
-	if (len >= 16 && crypto_simd_usable()) {
-		kernel_fpu_begin();
-		*(__u16 *)out = crc_t10dif_pcl(crc, data, len);
-		kernel_fpu_end();
-	} else
-		*(__u16 *)out = crc_t10dif_generic(crc, data, len);
-	return 0;
-}
-
-static int chksum_finup(struct shash_desc *desc, const u8 *data,
-			unsigned int len, u8 *out)
-{
-	struct chksum_desc_ctx *ctx = shash_desc_ctx(desc);
-
-	return __chksum_finup(ctx->crc, data, len, out);
-}
-
-static int chksum_digest(struct shash_desc *desc, const u8 *data,
-			 unsigned int length, u8 *out)
-{
-	return __chksum_finup(0, data, length, out);
-}
-
-static struct shash_alg alg = {
-	.digestsize		=	CRC_T10DIF_DIGEST_SIZE,
-	.init		=	chksum_init,
-	.update		=	chksum_update,
-	.final		=	chksum_final,
-	.finup		=	chksum_finup,
-	.digest		=	chksum_digest,
-	.descsize		=	sizeof(struct chksum_desc_ctx),
-	.base			=	{
-		.cra_name		=	"crct10dif",
-		.cra_driver_name	=	"crct10dif-pclmul",
-		.cra_priority		=	200,
-		.cra_blocksize		=	CRC_T10DIF_BLOCK_SIZE,
-		.cra_module		=	THIS_MODULE,
-	}
-};
-
-static const struct x86_cpu_id crct10dif_cpu_id[] = {
-	X86_MATCH_FEATURE(X86_FEATURE_PCLMULQDQ, NULL),
-	{}
-};
-MODULE_DEVICE_TABLE(x86cpu, crct10dif_cpu_id);
-
-static int __init crct10dif_intel_mod_init(void)
-{
-	if (!x86_match_cpu(crct10dif_cpu_id))
-		return -ENODEV;
-
-	return crypto_register_shash(&alg);
-}
-
-static void __exit crct10dif_intel_mod_fini(void)
-{
-	crypto_unregister_shash(&alg);
-}
-
-module_init(crct10dif_intel_mod_init);
-module_exit(crct10dif_intel_mod_fini);
-
-MODULE_AUTHOR("Tim Chen <tim.c.chen@linux.intel.com>");
-MODULE_DESCRIPTION("T10 DIF CRC calculation accelerated with PCLMULQDQ.");
-MODULE_LICENSE("GPL");
-
-MODULE_ALIAS_CRYPTO("crct10dif");
-MODULE_ALIAS_CRYPTO("crct10dif-pclmul");
diff --git a/arch/x86/lib/Makefile b/arch/x86/lib/Makefile
index 17510da06c9f..8a59c61624c2 100644
--- a/arch/x86/lib/Makefile
+++ b/arch/x86/lib/Makefile
@@ -40,10 +40,13 @@ lib-$(CONFIG_MITIGATION_RETPOLINE) += retpoline.o
 
 obj-$(CONFIG_CRC32_ARCH) += crc32-x86.o
 crc32-x86-y := crc32-glue.o crc32-pclmul.o
 crc32-x86-$(CONFIG_64BIT) += crc32c-3way.o
 
+obj-$(CONFIG_CRC_T10DIF_ARCH) += crc-t10dif-x86.o
+crc-t10dif-x86-y := crc-t10dif-glue.o crct10dif-pcl-asm_64.o
+
 obj-y += msr.o msr-reg.o msr-reg-export.o hweight.o
 obj-y += iomem.o
 
 ifeq ($(CONFIG_X86_32),y)
         obj-y += atomic64_32.o
diff --git a/arch/x86/lib/crc-t10dif-glue.c b/arch/x86/lib/crc-t10dif-glue.c
new file mode 100644
index 000000000000..13f07ddc9122
--- /dev/null
+++ b/arch/x86/lib/crc-t10dif-glue.c
@@ -0,0 +1,51 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * CRC-T10DIF using PCLMULQDQ instructions
+ *
+ * Copyright 2024 Google LLC
+ */
+
+#include <asm/cpufeatures.h>
+#include <asm/simd.h>
+#include <crypto/internal/simd.h>
+#include <linux/crc-t10dif.h>
+#include <linux/module.h>
+
+static DEFINE_STATIC_KEY_FALSE(have_pclmulqdq);
+
+asmlinkage u16 crc_t10dif_pcl(u16 init_crc, const u8 *buf, size_t len);
+
+u16 crc_t10dif_arch(u16 crc, const u8 *p, size_t len)
+{
+	if (len >= 16 &&
+	    static_key_enabled(&have_pclmulqdq) && crypto_simd_usable()) {
+		kernel_fpu_begin();
+		crc = crc_t10dif_pcl(crc, p, len);
+		kernel_fpu_end();
+		return crc;
+	}
+	return crc_t10dif_generic(crc, p, len);
+}
+EXPORT_SYMBOL(crc_t10dif_arch);
+
+static int __init crc_t10dif_x86_init(void)
+{
+	if (boot_cpu_has(X86_FEATURE_PCLMULQDQ))
+		static_branch_enable(&have_pclmulqdq);
+	return 0;
+}
+arch_initcall(crc_t10dif_x86_init);
+
+static void __exit crc_t10dif_x86_exit(void)
+{
+}
+module_exit(crc_t10dif_x86_exit);
+
+bool crc_t10dif_is_optimized(void)
+{
+	return static_key_enabled(&have_pclmulqdq);
+}
+EXPORT_SYMBOL(crc_t10dif_is_optimized);
+
+MODULE_DESCRIPTION("CRC-T10DIF using PCLMULQDQ instructions");
+MODULE_LICENSE("GPL");
diff --git a/arch/x86/crypto/crct10dif-pcl-asm_64.S b/arch/x86/lib/crct10dif-pcl-asm_64.S
similarity index 100%
rename from arch/x86/crypto/crct10dif-pcl-asm_64.S
rename to arch/x86/lib/crct10dif-pcl-asm_64.S
-- 
2.47.1


