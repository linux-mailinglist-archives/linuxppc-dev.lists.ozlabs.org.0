Return-Path: <linuxppc-dev+bounces-9192-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DFF95AD0F5F
	for <lists+linuxppc-dev@lfdr.de>; Sat,  7 Jun 2025 22:08:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bF8P556j0z30DR;
	Sun,  8 Jun 2025 06:07:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1749326857;
	cv=none; b=IVotmdO33NCc0n4+KOzOdhfjmzeVVMGmnlQmDiIdmBmqY1Ybb96vdvJgspeqnwTwx6icaABwu63x6rEvIEoEpttBwcMSMdV0roXyga6nTxeTHtOTHOVamOpzJ5sQDUscEnF9PFLtYKprnKAEYeOVxNfIAKv6ckuvvgS6mdVEgDC8tMUr1SDXZrNKYXVK24dPhYjVbMK/iWP9kdTAOxYG81klYfwMrntU9gkhMHnTfgysZuLUZFy44oBaliOPk+GmBcKP+GWakcmHFkrgn6yJYJ/CauzzBErdf2VPL/D92RbTG7BlczK2NuSeouuhNoE28PjBCT9M+MxqVxCIfBs6OA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1749326857; c=relaxed/relaxed;
	bh=DLqUt5ykU+NewpLqdF7LC2juceSoo6/VlXnuY6rAb5I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hlu+eH7V34Zu0vIuozVUKmWbA03ovc9Hw0wJCR5j+GY5fAwId3U1gGeCBEi/T47hcypeSs8y7lTTOHEAebZT3BOiXeITCEbY2tiEcEV1SLH79GJ7iGEdrNdr+pJ/+LMEKafYjidQxTDh1otmDN9mHvwj9K0NXYFIVbwRLrz++Ynqjawbt3zEKk/UhGt2y0lp4zh3EvPVdfZYQwuOy+Z3tQi9t5KltRNthX4jFCOLSx8a7LTN31/q6llOpYQOg4P39K32F3vONnwlgiIWxWucFc2JWIOwtEeI/oNkW3fnZB3RFG3e+LgixD6CIM5+fmqzl8Wy/jjDVCWAWQttBLRYCg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Chu95TKq; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Chu95TKq;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bF8P061Gfz305n
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  8 Jun 2025 06:07:32 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E903D4ABE6;
	Sat,  7 Jun 2025 20:07:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 718C0C4CEF0;
	Sat,  7 Jun 2025 20:07:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749326850;
	bh=zY3fvpUbE+/4lThsCnGfT2NxFkXv0wD4oYk8K5EmW5s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Chu95TKqPmDS98OhYY5Ac8BbqnX5apkd7PAsCrFcuiOOi6LR+p0TFPzxMjsPY/PBq
	 p/1Jy8JRQ+XCj0wdcVjt+41xJP78UoKVawE5RR2SKK2RzkUBS0W0LJKy7KBBSJohLi
	 Q6faTyM18RMmPfHyck7zmT9eKoGB1seXkb7EhfyczxWRMffU50h4KIAf034eG732E4
	 34vYkNT6nw+3TipBEJ7+fzMGPWM2pbIgR5lSjvU4I5fW4tJV2csqi4G22VpKWVRauo
	 yaHESgRIaOrVsNKdbICEnpBylxlg1NhiNCVLjeKF48QN4yRNzdUD/eZrqQphdsTwTY
	 WpEFv90CsX4/g==
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
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	Linus Torvalds <torvalds@linux-foundation.org>
Subject: [PATCH v2 05/12] lib/crc/loongarch: migrate loongarch-optimized CRC code into lib/crc/
Date: Sat,  7 Jun 2025 13:04:47 -0700
Message-ID: <20250607200454.73587-6-ebiggers@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250607200454.73587-1-ebiggers@kernel.org>
References: <20250607200454.73587-1-ebiggers@kernel.org>
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

Move the loongarch-optimized CRC code from arch/loongarch/lib/crc* into
its new location in lib/crc/loongarch/, and wire it up in the new way.
This new way of organizing the CRC code eliminates the need to
artificially split the code for each CRC variant into separate arch and
generic modules, enabling better inlining and dead code elimination.
For more details, see "lib/crc: prepare for arch-optimized code in
subdirs of lib/crc/".

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 arch/loongarch/Kconfig                        |  1 -
 arch/loongarch/lib/Makefile                   |  2 --
 lib/crc/Kconfig                               |  1 +
 .../crc/loongarch/crc32.h                     | 32 ++++---------------
 4 files changed, 7 insertions(+), 29 deletions(-)
 rename arch/loongarch/lib/crc32-loongarch.c => lib/crc/loongarch/crc32.h (71%)

diff --git a/arch/loongarch/Kconfig b/arch/loongarch/Kconfig
index 1a2cf012b8f2f..1b19893a6bdf0 100644
--- a/arch/loongarch/Kconfig
+++ b/arch/loongarch/Kconfig
@@ -13,11 +13,10 @@ config LOONGARCH
 	select ARCH_ENABLE_MEMORY_HOTPLUG
 	select ARCH_ENABLE_MEMORY_HOTREMOVE
 	select ARCH_ENABLE_THP_MIGRATION if TRANSPARENT_HUGEPAGE
 	select ARCH_HAS_ACPI_TABLE_UPGRADE	if ACPI
 	select ARCH_HAS_CPU_FINALIZE_INIT
-	select ARCH_HAS_CRC32
 	select ARCH_HAS_CURRENT_STACK_POINTER
 	select ARCH_HAS_DEBUG_VM_PGTABLE
 	select ARCH_HAS_FAST_MULTIPLIER
 	select ARCH_HAS_FORTIFY_SOURCE
 	select ARCH_HAS_KCOV
diff --git a/arch/loongarch/lib/Makefile b/arch/loongarch/lib/Makefile
index fae77809048b8..ccea3bbd43531 100644
--- a/arch/loongarch/lib/Makefile
+++ b/arch/loongarch/lib/Makefile
@@ -9,7 +9,5 @@ lib-y	+= delay.o memset.o memcpy.o memmove.o \
 obj-$(CONFIG_ARCH_SUPPORTS_INT128) += tishift.o
 
 obj-$(CONFIG_CPU_HAS_LSX) += xor_simd.o xor_simd_glue.o
 
 obj-$(CONFIG_FUNCTION_ERROR_INJECTION) += error-inject.o
-
-obj-$(CONFIG_CRC32_ARCH) += crc32-loongarch.o
diff --git a/lib/crc/Kconfig b/lib/crc/Kconfig
index 63edb487daff8..c1629f07768f9 100644
--- a/lib/crc/Kconfig
+++ b/lib/crc/Kconfig
@@ -66,10 +66,11 @@ config ARCH_HAS_CRC32
 config CRC32_ARCH
 	bool
 	depends on CRC32 && CRC_OPTIMIZATIONS
 	default y if ARM && KERNEL_MODE_NEON
 	default y if ARM64
+	default y if LOONGARCH
 
 config CRC64
 	tristate
 	help
 	  The CRC64 library functions.  Select this if your module uses any of
diff --git a/arch/loongarch/lib/crc32-loongarch.c b/lib/crc/loongarch/crc32.h
similarity index 71%
rename from arch/loongarch/lib/crc32-loongarch.c
rename to lib/crc/loongarch/crc32.h
index b37cd8537b459..6de5c96594afc 100644
--- a/arch/loongarch/lib/crc32-loongarch.c
+++ b/lib/crc/loongarch/crc32.h
@@ -8,12 +8,10 @@
  * Copyright (C) 2018 MIPS Tech, LLC
  * Copyright (C) 2020-2023 Loongson Technology Corporation Limited
  */
 
 #include <asm/cpu-features.h>
-#include <linux/crc32.h>
-#include <linux/module.h>
 #include <linux/unaligned.h>
 
 #define _CRC32(crc, value, size, type)			\
 do {							\
 	__asm__ __volatile__(				\
@@ -26,11 +24,11 @@ do {							\
 #define CRC32(crc, value, size)		_CRC32(crc, value, size, crc)
 #define CRC32C(crc, value, size)	_CRC32(crc, value, size, crcc)
 
 static __ro_after_init DEFINE_STATIC_KEY_FALSE(have_crc32);
 
-u32 crc32_le_arch(u32 crc, const u8 *p, size_t len)
+static inline u32 crc32_le_arch(u32 crc, const u8 *p, size_t len)
 {
 	if (!static_branch_likely(&have_crc32))
 		return crc32_le_base(crc, p, len);
 
 	while (len >= sizeof(u64)) {
@@ -61,13 +59,12 @@ u32 crc32_le_arch(u32 crc, const u8 *p, size_t len)
 		CRC32(crc, value, b);
 	}
 
 	return crc;
 }
-EXPORT_SYMBOL(crc32_le_arch);
 
-u32 crc32c_arch(u32 crc, const u8 *p, size_t len)
+static inline u32 crc32c_arch(u32 crc, const u8 *p, size_t len)
 {
 	if (!static_branch_likely(&have_crc32))
 		return crc32c_base(crc, p, len);
 
 	while (len >= sizeof(u64)) {
@@ -98,38 +95,21 @@ u32 crc32c_arch(u32 crc, const u8 *p, size_t len)
 		CRC32C(crc, value, b);
 	}
 
 	return crc;
 }
-EXPORT_SYMBOL(crc32c_arch);
 
-u32 crc32_be_arch(u32 crc, const u8 *p, size_t len)
-{
-	return crc32_be_base(crc, p, len);
-}
-EXPORT_SYMBOL(crc32_be_arch);
+#define crc32_be_arch crc32_be_base /* not implemented on this arch */
 
-static int __init crc32_loongarch_init(void)
+#define crc32_mod_init_arch crc32_mod_init_arch
+static inline void crc32_mod_init_arch(void)
 {
 	if (cpu_has_crc32)
 		static_branch_enable(&have_crc32);
-	return 0;
 }
-subsys_initcall(crc32_loongarch_init);
 
-static void __exit crc32_loongarch_exit(void)
-{
-}
-module_exit(crc32_loongarch_exit);
-
-u32 crc32_optimizations(void)
+static inline u32 crc32_optimizations_arch(void)
 {
 	if (static_key_enabled(&have_crc32))
 		return CRC32_LE_OPTIMIZATION | CRC32C_OPTIMIZATION;
 	return 0;
 }
-EXPORT_SYMBOL(crc32_optimizations);
-
-MODULE_AUTHOR("Min Zhou <zhoumin@loongson.cn>");
-MODULE_AUTHOR("Huacai Chen <chenhuacai@loongson.cn>");
-MODULE_DESCRIPTION("CRC32 and CRC32C using LoongArch crc* instructions");
-MODULE_LICENSE("GPL v2");
-- 
2.49.0


