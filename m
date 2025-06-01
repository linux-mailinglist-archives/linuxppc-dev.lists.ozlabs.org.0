Return-Path: <linuxppc-dev+bounces-9059-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A6AB4ACA0CE
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Jun 2025 00:46:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b9XBh0p0Xz2xGv;
	Mon,  2 Jun 2025 08:46:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1748817964;
	cv=none; b=jRSMUR+RNLwp4pLQDe9JxfmiBnTDl9njRpwqUx+3LSK+kmBrrrM3sX7iQs2BIvC84bj+4D22yX6hzpKsK9YptqrF2XZEzkJnFnyu6NW4wOdxTwNmyRjhTjFpGkZG3Xc9GudtqzEyij+Uh8KP/S8ymL0zlw/OHiNGWIQyz+XvTFUiQc4cZetsJUJUjuat2+h+gqG6NwUov6KKQV2FRAmeoZFsASSdCK6IcyS3lpDuR7GA26mXCBtxy3X34pVOoP2J2JFAE+JLIL9TvexImtT7ktjLFpEH8ZHm39Zl0TTTrydV7bvVQhl3gKUEK6wq1L2z9EDhN7bFvKuZfbcddLNGfg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1748817964; c=relaxed/relaxed;
	bh=yjQaUvWExWDsgD5TWLzSH0NgSNgBGVR4Lx1dYwDhL4o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=d7rZWWG8uxOCciAsBO+IMU9F03sx2nEJB39LTNTBqQyJ+xbPU9iGYmzsV47TXv5bo2z+tJpKsvDd8YrXU+tyF7q3+P88m18mv4SZ1KK0mgVeC9P7qIHj7C5MgaZkB7h/ngb99gW/Vr3ucjAntjwuu0udpMQ2zIx1eQ4GxDgSn3Md8QkL9i5Cxk60kcy8mSkoPj81hfuW+aLGqX7Uc/LDOvjAGMhAjXU5Y1gFIqoIlcxhw4PpkP56iaTL7yTJPwX02xCe5nf7dNrtmzZ28JbTToR0KrtBngdNyObTY4QDgkE/5b045g+ApOkxlLLMQcV1Ru60kcX22fJxt5gM0mUB0Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=gQuMmCvJ; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=gQuMmCvJ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b9XBZ6S7Gz2xd4
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  2 Jun 2025 08:45:58 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6A5FB4A8CC;
	Sun,  1 Jun 2025 22:45:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD52BC4AF0B;
	Sun,  1 Jun 2025 22:45:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748817956;
	bh=nj3FLjV0XRklapAo1b/4rm9s4AcmV3Wa+beXZi58AgQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gQuMmCvJpvdry21LC124O06TKecBmc+QGeLcYmJlcVawgJ1lYXH480V5TxG/AuNWw
	 KXwFOUsyTnl3M8hgCtaze/Byag/idw16bQUAoeK2P83pS+sM6KLa59k7IO1fcx28op
	 zdzolOGKz/mDyEQJIyXgjZsUJfdZkZMMCQPVulnUZD75QEiDEc6QnBiQCXoaW15N2h
	 39aHzXNxJK4KZPhhLx4mTUeMCcoPn+ENVuWD0N9APL/V7J5HvxviRomiEVT8CxTkSZ
	 zeU98/4bdMCOBn0D+TpKm1RHJAAJWXrnUpwVKfJo727nURTvQsQMB/Uvf2RuWr0W1K
	 GAVO4dE2gXCjA==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: linux-crypto@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	loongarch@lists.linux.dev,
	linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org,
	x86@kernel.org,
	linux-arch@vger.kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld " <Jason@zx2c4.com>,
	Linus Torvalds <torvalds@linux-foundation.org>
Subject: [PATCH 06/13] lib/crc/arm64: migrate arm64-optimized CRC code into lib/crc/
Date: Sun,  1 Jun 2025 15:44:34 -0700
Message-ID: <20250601224441.778374-7-ebiggers@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250601224441.778374-1-ebiggers@kernel.org>
References: <20250601224441.778374-1-ebiggers@kernel.org>
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

From: Eric Biggers <ebiggers@google.com>

Move the arm64-optimized CRC code from arch/arm64/lib/crc* into its new
location in lib/crc/arm64/, and wire it up in the new way.  For a
detailed explanation of why this change is being made, see the commit
that introduced the new way of integrating arch-specific code into
lib/crc/.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 arch/arm64/Kconfig                            |  2 --
 arch/arm64/lib/Makefile                       |  6 -----
 lib/crc/Kconfig                               |  2 ++
 lib/crc/Makefile                              |  2 ++
 .../lib => lib/crc/arm64}/crc-t10dif-core.S   |  0
 .../crc/arm64/crc-t10dif.h                    | 22 +++----------------
 .../arm64/lib => lib/crc/arm64}/crc32-core.S  |  0
 .../lib/crc32.c => lib/crc/arm64/crc32.h      | 22 ++++++-------------
 8 files changed, 14 insertions(+), 42 deletions(-)
 rename {arch/arm64/lib => lib/crc/arm64}/crc-t10dif-core.S (100%)
 rename arch/arm64/lib/crc-t10dif.c => lib/crc/arm64/crc-t10dif.h (70%)
 rename {arch/arm64/lib => lib/crc/arm64}/crc32-core.S (100%)
 rename arch/arm64/lib/crc32.c => lib/crc/arm64/crc32.h (81%)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index 55fc331af3371..cbeac225903f7 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -19,12 +19,10 @@ config ARM64
 	select ARCH_ENABLE_MEMORY_HOTREMOVE
 	select ARCH_ENABLE_SPLIT_PMD_PTLOCK if PGTABLE_LEVELS > 2
 	select ARCH_ENABLE_THP_MIGRATION if TRANSPARENT_HUGEPAGE
 	select ARCH_HAS_CACHE_LINE_SIZE
 	select ARCH_HAS_CC_PLATFORM
-	select ARCH_HAS_CRC32
-	select ARCH_HAS_CRC_T10DIF if KERNEL_MODE_NEON
 	select ARCH_HAS_CURRENT_STACK_POINTER
 	select ARCH_HAS_DEBUG_VIRTUAL
 	select ARCH_HAS_DEBUG_VM_PGTABLE
 	select ARCH_HAS_DMA_OPS if XEN
 	select ARCH_HAS_DMA_PREP_COHERENT
diff --git a/arch/arm64/lib/Makefile b/arch/arm64/lib/Makefile
index 027bfa9689c6a..9b255d9332479 100644
--- a/arch/arm64/lib/Makefile
+++ b/arch/arm64/lib/Makefile
@@ -14,16 +14,10 @@ CFLAGS_xor-neon.o		+= $(CC_FLAGS_FPU)
 CFLAGS_REMOVE_xor-neon.o	+= $(CC_FLAGS_NO_FPU)
 endif
 
 lib-$(CONFIG_ARCH_HAS_UACCESS_FLUSHCACHE) += uaccess_flushcache.o
 
-obj-$(CONFIG_CRC32_ARCH) += crc32-arm64.o
-crc32-arm64-y := crc32.o crc32-core.o
-
-obj-$(CONFIG_CRC_T10DIF_ARCH) += crc-t10dif-arm64.o
-crc-t10dif-arm64-y := crc-t10dif.o crc-t10dif-core.o
-
 obj-$(CONFIG_FUNCTION_ERROR_INJECTION) += error-inject.o
 
 obj-$(CONFIG_ARM64_MTE) += mte.o
 
 obj-$(CONFIG_KASAN_SW_TAGS) += kasan_sw_tags.o
diff --git a/lib/crc/Kconfig b/lib/crc/Kconfig
index b34a52cdba5d7..663f4dca2bda1 100644
--- a/lib/crc/Kconfig
+++ b/lib/crc/Kconfig
@@ -49,10 +49,11 @@ config ARCH_HAS_CRC_T10DIF
 
 config CRC_T10DIF_ARCH
 	bool
 	depends on CRC_T10DIF && CRC_OPTIMIZATIONS
 	default y if ARM && KERNEL_MODE_NEON
+	default y if ARM64 && KERNEL_MODE_NEON
 
 config CRC32
 	tristate
 	select BITREVERSE
 	help
@@ -61,10 +62,11 @@ config CRC32
 
 config CRC32_ARCH
 	bool
 	depends on CRC32 && CRC_OPTIMIZATIONS
 	default y if ARM && KERNEL_MODE_NEON
+	default y if ARM64
 
 config CRC64
 	tristate
 	help
 	  The CRC64 library functions.  Select this if your module uses any of
diff --git a/lib/crc/Makefile b/lib/crc/Makefile
index 1069edb81a481..822d18b57b432 100644
--- a/lib/crc/Makefile
+++ b/lib/crc/Makefile
@@ -13,16 +13,18 @@ obj-$(CONFIG_CRC_ITU_T) += crc-itu-t.o
 
 obj-$(CONFIG_CRC_T10DIF) += crc-t10dif.o
 crc-t10dif-y := crc-t10dif-main.o
 ifeq ($(CONFIG_CRC_T10DIF_ARCH),y)
 crc-t10dif-$(CONFIG_ARM) += arm/crc-t10dif-core.o
+crc-t10dif-$(CONFIG_ARM64) += arm64/crc-t10dif-core.o
 endif
 
 obj-$(CONFIG_CRC32) += crc32.o
 crc32-y := crc32-main.o
 ifeq ($(CONFIG_CRC32_ARCH),y)
 crc32-$(CONFIG_ARM) += arm/crc32-core.o
+crc32-$(CONFIG_ARM64) += arm64/crc32-core.o
 endif
 
 obj-$(CONFIG_CRC64) += crc64.o
 crc64-y := crc64-main.o
 ifeq ($(CONFIG_CRC64_ARCH),y)
diff --git a/arch/arm64/lib/crc-t10dif-core.S b/lib/crc/arm64/crc-t10dif-core.S
similarity index 100%
rename from arch/arm64/lib/crc-t10dif-core.S
rename to lib/crc/arm64/crc-t10dif-core.S
diff --git a/arch/arm64/lib/crc-t10dif.c b/lib/crc/arm64/crc-t10dif.h
similarity index 70%
rename from arch/arm64/lib/crc-t10dif.c
rename to lib/crc/arm64/crc-t10dif.h
index c2ffe4fdb59d1..c4521a7f1ee9b 100644
--- a/arch/arm64/lib/crc-t10dif.c
+++ b/lib/crc/arm64/crc-t10dif.h
@@ -4,15 +4,10 @@
  *
  * Copyright (C) 2016 - 2017 Linaro Ltd <ard.biesheuvel@linaro.org>
  */
 
 #include <linux/cpufeature.h>
-#include <linux/crc-t10dif.h>
-#include <linux/init.h>
-#include <linux/kernel.h>
-#include <linux/module.h>
-#include <linux/string.h>
 
 #include <crypto/internal/simd.h>
 
 #include <asm/neon.h>
 #include <asm/simd.h>
@@ -24,11 +19,11 @@ static __ro_after_init DEFINE_STATIC_KEY_FALSE(have_pmull);
 
 asmlinkage void crc_t10dif_pmull_p8(u16 init_crc, const u8 *buf, size_t len,
 				    u8 out[16]);
 asmlinkage u16 crc_t10dif_pmull_p64(u16 init_crc, const u8 *buf, size_t len);
 
-u16 crc_t10dif_arch(u16 crc, const u8 *data, size_t length)
+static inline u16 crc_t10dif_arch(u16 crc, const u8 *data, size_t length)
 {
 	if (length >= CRC_T10DIF_PMULL_CHUNK_SIZE) {
 		if (static_branch_likely(&have_pmull)) {
 			if (crypto_simd_usable()) {
 				kernel_neon_begin();
@@ -48,26 +43,15 @@ u16 crc_t10dif_arch(u16 crc, const u8 *data, size_t length)
 			return crc_t10dif_generic(0, buf, sizeof(buf));
 		}
 	}
 	return crc_t10dif_generic(crc, data, length);
 }
-EXPORT_SYMBOL(crc_t10dif_arch);
 
-static int __init crc_t10dif_arm64_init(void)
+#define crc_t10dif_mod_init_arch crc_t10dif_mod_init_arch
+static inline void crc_t10dif_mod_init_arch(void)
 {
 	if (cpu_have_named_feature(ASIMD)) {
 		static_branch_enable(&have_asimd);
 		if (cpu_have_named_feature(PMULL))
 			static_branch_enable(&have_pmull);
 	}
-	return 0;
 }
-subsys_initcall(crc_t10dif_arm64_init);
-
-static void __exit crc_t10dif_arm64_exit(void)
-{
-}
-module_exit(crc_t10dif_arm64_exit);
-
-MODULE_AUTHOR("Ard Biesheuvel <ard.biesheuvel@linaro.org>");
-MODULE_DESCRIPTION("CRC-T10DIF using arm64 NEON and Crypto Extensions");
-MODULE_LICENSE("GPL v2");
diff --git a/arch/arm64/lib/crc32-core.S b/lib/crc/arm64/crc32-core.S
similarity index 100%
rename from arch/arm64/lib/crc32-core.S
rename to lib/crc/arm64/crc32-core.S
diff --git a/arch/arm64/lib/crc32.c b/lib/crc/arm64/crc32.h
similarity index 81%
rename from arch/arm64/lib/crc32.c
rename to lib/crc/arm64/crc32.h
index ed3acd71178f8..98f3b3fcc729a 100644
--- a/arch/arm64/lib/crc32.c
+++ b/lib/crc/arm64/crc32.h
@@ -1,11 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0-only
 
-#include <linux/crc32.h>
-#include <linux/linkage.h>
-#include <linux/module.h>
-
 #include <asm/alternative.h>
 #include <asm/cpufeature.h>
 #include <asm/neon.h>
 #include <asm/simd.h>
 
@@ -20,11 +16,12 @@ asmlinkage u32 crc32_be_arm64(u32 crc, unsigned char const *p, size_t len);
 
 asmlinkage u32 crc32_le_arm64_4way(u32 crc, unsigned char const *p, size_t len);
 asmlinkage u32 crc32c_le_arm64_4way(u32 crc, unsigned char const *p, size_t len);
 asmlinkage u32 crc32_be_arm64_4way(u32 crc, unsigned char const *p, size_t len);
 
-u32 crc32_le_arch(u32 crc, const u8 *p, size_t len)
+#define crc32_le_arch crc32_le_arch
+static inline u32 crc32_le_arch(u32 crc, const u8 *p, size_t len)
 {
 	if (!alternative_has_cap_likely(ARM64_HAS_CRC32))
 		return crc32_le_base(crc, p, len);
 
 	if (len >= min_len && cpu_have_named_feature(PMULL) && crypto_simd_usable()) {
@@ -39,13 +36,13 @@ u32 crc32_le_arch(u32 crc, const u8 *p, size_t len)
 			return crc;
 	}
 
 	return crc32_le_arm64(crc, p, len);
 }
-EXPORT_SYMBOL(crc32_le_arch);
 
-u32 crc32c_arch(u32 crc, const u8 *p, size_t len)
+#define crc32c_arch crc32c_arch
+static inline u32 crc32c_arch(u32 crc, const u8 *p, size_t len)
 {
 	if (!alternative_has_cap_likely(ARM64_HAS_CRC32))
 		return crc32c_base(crc, p, len);
 
 	if (len >= min_len && cpu_have_named_feature(PMULL) && crypto_simd_usable()) {
@@ -60,13 +57,13 @@ u32 crc32c_arch(u32 crc, const u8 *p, size_t len)
 			return crc;
 	}
 
 	return crc32c_le_arm64(crc, p, len);
 }
-EXPORT_SYMBOL(crc32c_arch);
 
-u32 crc32_be_arch(u32 crc, const u8 *p, size_t len)
+#define crc32_be_arch crc32_be_arch
+static inline u32 crc32_be_arch(u32 crc, const u8 *p, size_t len)
 {
 	if (!alternative_has_cap_likely(ARM64_HAS_CRC32))
 		return crc32_be_base(crc, p, len);
 
 	if (len >= min_len && cpu_have_named_feature(PMULL) && crypto_simd_usable()) {
@@ -81,19 +78,14 @@ u32 crc32_be_arch(u32 crc, const u8 *p, size_t len)
 			return crc;
 	}
 
 	return crc32_be_arm64(crc, p, len);
 }
-EXPORT_SYMBOL(crc32_be_arch);
 
-u32 crc32_optimizations(void)
+static inline u32 crc32_optimizations_arch(void)
 {
 	if (alternative_has_cap_likely(ARM64_HAS_CRC32))
 		return CRC32_LE_OPTIMIZATION |
 		       CRC32_BE_OPTIMIZATION |
 		       CRC32C_OPTIMIZATION;
 	return 0;
 }
-EXPORT_SYMBOL(crc32_optimizations);
-
-MODULE_LICENSE("GPL");
-MODULE_DESCRIPTION("arm64-optimized CRC32 functions");
-- 
2.49.0


