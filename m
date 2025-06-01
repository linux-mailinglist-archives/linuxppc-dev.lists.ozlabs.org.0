Return-Path: <linuxppc-dev+bounces-9066-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CAA1CACA0ED
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Jun 2025 00:47:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b9XBm5MGbz30P3;
	Mon,  2 Jun 2025 08:46:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1748817968;
	cv=none; b=Uh9wBDg3oVhaf4+m0w10Kl7H+K/zxY0c6Da73liGasc1lRV7jthNG9PnHQdJ+F6DY3QD9n/AEqNzgfZB40U2L0Ns3e4gnz9s9auxfnjzg6k4j6VMqS0effkr4vXEqXpbh/9nW4v3qyEnOW/fBNeFj1jqlKBhSgyhjAlsKecjWH6tTM0FAwkx6qWnC1hc9Y/9d7sKta9sNcCqk+IaetZ/KpKacKoZglgko7nw2gQySfgmuDXQVmv9RpHWcZaxCk7/rZXr9sNp65R+/77T4P9SIi+/kd2VqIzWG5sLOCgpdmHiXn9LKFcrvj5zm2JuIQ4bvR0B5HLWaeGQSqKXoVVreA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1748817968; c=relaxed/relaxed;
	bh=9D0B6f0igqikye6VdWEf1EaWtiZp5SjqsoI5m9pE/g0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nNM6Hi5xRYijTvKOpRdKqPunO/TzeJIUrSF0pcyv9bPJ4xX3aaNuHpHfn9rldnN9dsYwz32ZvORCJlLGGoSdXOKfhKgBzOHbL3sx3iiNwgB6pk//BjM2X1rn8eG2KOsPjJifsAOGDMzOG7MmvqWTWeWhJ4T/X84GAdR2FJya124ZiEw7t7lR32H3Ek2XMS96U8WWskPfPr23dtcVPoVnhTXBMX/EzbCHOPDVT1lLYJ8IukujzdGjbuurzqJwrxYF17rudGlRTfieZbTwqFuaU6Y+n2sZe08EjiX0gtS/mG42fVZ1MuGkdcYLcl1vEcmvlVYt6AgaNQ/NVo1EEiU8+g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=IBTRtWHj; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=IBTRtWHj;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b9XBd6nx8z2xH9
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  2 Jun 2025 08:46:01 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id DD38A61165;
	Sun,  1 Jun 2025 22:45:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E2A3C4CEE7;
	Sun,  1 Jun 2025 22:45:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748817958;
	bh=bR2IghF04qIfhGMxr7Z+GJfdUQx5LDT1V3vKPSH6Ff4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=IBTRtWHjJ+jupFNO5g3cD6rMnOkFHFGZEMgzNOQ70Q8P8oHYwGGfZUtLjvyOYSiUH
	 i7F2k/afwYgujvklX7H3sBOkqdbEigqlSrolUXN9v5cZ20fMYzKz+4BPXLJh05KOlv
	 Lwl3NZBBcJArPhpitLTXLQcgY0kYIVL5vTxMKoHYr8gpH6ddjOA86+p2iaLEcVMNLu
	 u4zEv21rLTdRnWQM9lijRqZ8BUfa+4S4kyFoIzQ5DqUWMOoqYptStpb+fJAzPqBJqU
	 +yzl6RyX+gtETuNHxzn4wBaoVnvmKElnDhwDkePobv4PTgLbyjf+0m9A39mPF5QDMP
	 zurRH1JGaUr4g==
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
Subject: [PATCH 10/13] lib/crc/riscv: migrate riscv-optimized CRC code into lib/crc/
Date: Sun,  1 Jun 2025 15:44:38 -0700
Message-ID: <20250601224441.778374-11-ebiggers@kernel.org>
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

Move the riscv-optimized CRC code from arch/riscv/lib/crc* into its new
location in lib/crc/riscv/, and wire it up in the new way.  For a
detailed explanation of why this change is being made, see the commit
that introduced the new way of integrating arch-specific code into
lib/crc/.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 arch/riscv/Kconfig                            |  3 ---
 arch/riscv/lib/Makefile                       |  6 ------
 lib/crc/Kconfig                               |  3 +++
 lib/crc/Makefile                              |  3 +++
 .../lib => lib/crc/riscv}/crc-clmul-consts.h  |  0
 .../crc/riscv}/crc-clmul-template.h           |  0
 {arch/riscv/lib => lib/crc/riscv}/crc-clmul.h |  0
 .../crc/riscv/crc-t10dif.h                    |  8 +-------
 {arch/riscv/lib => lib/crc/riscv}/crc16_msb.c |  0
 .../lib/crc32.c => lib/crc/riscv/crc32.h      | 20 +++++++------------
 {arch/riscv/lib => lib/crc/riscv}/crc32_lsb.c |  0
 {arch/riscv/lib => lib/crc/riscv}/crc32_msb.c |  0
 .../lib/crc64.c => lib/crc/riscv/crc64.h      | 11 ++--------
 {arch/riscv/lib => lib/crc/riscv}/crc64_lsb.c |  0
 {arch/riscv/lib => lib/crc/riscv}/crc64_msb.c |  0
 15 files changed, 16 insertions(+), 38 deletions(-)
 rename {arch/riscv/lib => lib/crc/riscv}/crc-clmul-consts.h (100%)
 rename {arch/riscv/lib => lib/crc/riscv}/crc-clmul-template.h (100%)
 rename {arch/riscv/lib => lib/crc/riscv}/crc-clmul.h (100%)
 rename arch/riscv/lib/crc-t10dif.c => lib/crc/riscv/crc-t10dif.h (62%)
 rename {arch/riscv/lib => lib/crc/riscv}/crc16_msb.c (100%)
 rename arch/riscv/lib/crc32.c => lib/crc/riscv/crc32.h (66%)
 rename {arch/riscv/lib => lib/crc/riscv}/crc32_lsb.c (100%)
 rename {arch/riscv/lib => lib/crc/riscv}/crc32_msb.c (100%)
 rename arch/riscv/lib/crc64.c => lib/crc/riscv/crc64.h (65%)
 rename {arch/riscv/lib => lib/crc/riscv}/crc64_lsb.c (100%)
 rename {arch/riscv/lib => lib/crc/riscv}/crc64_msb.c (100%)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index bbec87b793099..b533d9e5086a9 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -22,13 +22,10 @@ config RISCV
 	select ARCH_ENABLE_MEMORY_HOTPLUG if SPARSEMEM_VMEMMAP
 	select ARCH_ENABLE_MEMORY_HOTREMOVE if MEMORY_HOTPLUG
 	select ARCH_ENABLE_SPLIT_PMD_PTLOCK if PGTABLE_LEVELS > 2
 	select ARCH_ENABLE_THP_MIGRATION if TRANSPARENT_HUGEPAGE
 	select ARCH_HAS_BINFMT_FLAT
-	select ARCH_HAS_CRC32 if RISCV_ISA_ZBC
-	select ARCH_HAS_CRC64 if 64BIT && RISCV_ISA_ZBC
-	select ARCH_HAS_CRC_T10DIF if RISCV_ISA_ZBC
 	select ARCH_HAS_CURRENT_STACK_POINTER
 	select ARCH_HAS_DEBUG_VIRTUAL if MMU
 	select ARCH_HAS_DEBUG_VM_PGTABLE
 	select ARCH_HAS_DEBUG_WX
 	select ARCH_HAS_FAST_MULTIPLIER
diff --git a/arch/riscv/lib/Makefile b/arch/riscv/lib/Makefile
index 0baec92d2f55b..a4f4b48ed3a47 100644
--- a/arch/riscv/lib/Makefile
+++ b/arch/riscv/lib/Makefile
@@ -14,14 +14,8 @@ ifeq ($(CONFIG_MMU), y)
 lib-$(CONFIG_RISCV_ISA_V)	+= uaccess_vector.o
 endif
 lib-$(CONFIG_MMU)	+= uaccess.o
 lib-$(CONFIG_64BIT)	+= tishift.o
 lib-$(CONFIG_RISCV_ISA_ZICBOZ)	+= clear_page.o
-obj-$(CONFIG_CRC32_ARCH)	+= crc32-riscv.o
-crc32-riscv-y := crc32.o crc32_msb.o crc32_lsb.o
-obj-$(CONFIG_CRC64_ARCH) += crc64-riscv.o
-crc64-riscv-y := crc64.o crc64_msb.o crc64_lsb.o
-obj-$(CONFIG_CRC_T10DIF_ARCH)	+= crc-t10dif-riscv.o
-crc-t10dif-riscv-y := crc-t10dif.o crc16_msb.o
 obj-$(CONFIG_FUNCTION_ERROR_INJECTION) += error-inject.o
 lib-$(CONFIG_RISCV_ISA_V)	+= xor.o
 lib-$(CONFIG_RISCV_ISA_V)	+= riscv_v_helpers.o
diff --git a/lib/crc/Kconfig b/lib/crc/Kconfig
index 06611610e478f..4044e08cb9739 100644
--- a/lib/crc/Kconfig
+++ b/lib/crc/Kconfig
@@ -51,10 +51,11 @@ config CRC_T10DIF_ARCH
 	bool
 	depends on CRC_T10DIF && CRC_OPTIMIZATIONS
 	default y if ARM && KERNEL_MODE_NEON
 	default y if ARM64 && KERNEL_MODE_NEON
 	default y if PPC64 && ALTIVEC
+	default y if RISCV && RISCV_ISA_ZBC
 
 config CRC32
 	tristate
 	select BITREVERSE
 	help
@@ -67,20 +68,22 @@ config CRC32_ARCH
 	default y if ARM && KERNEL_MODE_NEON
 	default y if ARM64
 	default y if LOONGARCH
 	default y if MIPS && CPU_MIPSR6
 	default y if PPC64 && ALTIVEC
+	default y if RISCV && RISCV_ISA_ZBC
 
 config CRC64
 	tristate
 	help
 	  The CRC64 library functions.  Select this if your module uses any of
 	  the functions from <linux/crc64.h>.
 
 config CRC64_ARCH
 	bool
 	depends on CRC64 && CRC_OPTIMIZATIONS
+	default y if RISCV && RISCV_ISA_ZBC && 64BIT
 
 config CRC_OPTIMIZATIONS
 	bool "Enable optimized CRC implementations" if EXPERT
 	default y
 	help
diff --git a/lib/crc/Makefile b/lib/crc/Makefile
index f9109b71c1264..e46b35a2ffc04 100644
--- a/lib/crc/Makefile
+++ b/lib/crc/Makefile
@@ -15,23 +15,26 @@ obj-$(CONFIG_CRC_T10DIF) += crc-t10dif.o
 crc-t10dif-y := crc-t10dif-main.o
 ifeq ($(CONFIG_CRC_T10DIF_ARCH),y)
 crc-t10dif-$(CONFIG_ARM) += arm/crc-t10dif-core.o
 crc-t10dif-$(CONFIG_ARM64) += arm64/crc-t10dif-core.o
 crc-t10dif-$(CONFIG_PPC) += powerpc/crct10dif-vpmsum_asm.o
+crc-t10dif-$(CONFIG_RISCV) += riscv/crc16_msb.o
 endif
 
 obj-$(CONFIG_CRC32) += crc32.o
 crc32-y := crc32-main.o
 ifeq ($(CONFIG_CRC32_ARCH),y)
 crc32-$(CONFIG_ARM) += arm/crc32-core.o
 crc32-$(CONFIG_ARM64) += arm64/crc32-core.o
 crc32-$(CONFIG_PPC) += powerpc/crc32c-vpmsum_asm.o
+crc32-$(CONFIG_RISCV) += riscv/crc32_lsb.o riscv/crc32_msb.o
 endif
 
 obj-$(CONFIG_CRC64) += crc64.o
 crc64-y := crc64-main.o
 ifeq ($(CONFIG_CRC64_ARCH),y)
+crc64-$(CONFIG_RISCV) += riscv/crc64_lsb.o riscv/crc64_msb.o
 endif
 
 obj-y += tests/
 
 hostprogs := gen_crc32table gen_crc64table
diff --git a/arch/riscv/lib/crc-clmul-consts.h b/lib/crc/riscv/crc-clmul-consts.h
similarity index 100%
rename from arch/riscv/lib/crc-clmul-consts.h
rename to lib/crc/riscv/crc-clmul-consts.h
diff --git a/arch/riscv/lib/crc-clmul-template.h b/lib/crc/riscv/crc-clmul-template.h
similarity index 100%
rename from arch/riscv/lib/crc-clmul-template.h
rename to lib/crc/riscv/crc-clmul-template.h
diff --git a/arch/riscv/lib/crc-clmul.h b/lib/crc/riscv/crc-clmul.h
similarity index 100%
rename from arch/riscv/lib/crc-clmul.h
rename to lib/crc/riscv/crc-clmul.h
diff --git a/arch/riscv/lib/crc-t10dif.c b/lib/crc/riscv/crc-t10dif.h
similarity index 62%
rename from arch/riscv/lib/crc-t10dif.c
rename to lib/crc/riscv/crc-t10dif.h
index e6b0051ccd86c..cd6136cbfda1c 100644
--- a/arch/riscv/lib/crc-t10dif.c
+++ b/lib/crc/riscv/crc-t10dif.h
@@ -5,20 +5,14 @@
  * Copyright 2025 Google LLC
  */
 
 #include <asm/hwcap.h>
 #include <asm/alternative-macros.h>
-#include <linux/crc-t10dif.h>
-#include <linux/module.h>
 
 #include "crc-clmul.h"
 
-u16 crc_t10dif_arch(u16 crc, const u8 *p, size_t len)
+static inline u16 crc_t10dif_arch(u16 crc, const u8 *p, size_t len)
 {
 	if (riscv_has_extension_likely(RISCV_ISA_EXT_ZBC))
 		return crc16_msb_clmul(crc, p, len, &crc16_msb_0x8bb7_consts);
 	return crc_t10dif_generic(crc, p, len);
 }
-EXPORT_SYMBOL(crc_t10dif_arch);
-
-MODULE_DESCRIPTION("RISC-V optimized CRC-T10DIF function");
-MODULE_LICENSE("GPL");
diff --git a/arch/riscv/lib/crc16_msb.c b/lib/crc/riscv/crc16_msb.c
similarity index 100%
rename from arch/riscv/lib/crc16_msb.c
rename to lib/crc/riscv/crc16_msb.c
diff --git a/arch/riscv/lib/crc32.c b/lib/crc/riscv/crc32.h
similarity index 66%
rename from arch/riscv/lib/crc32.c
rename to lib/crc/riscv/crc32.h
index a3188b7d9c403..08c33357d25cd 100644
--- a/arch/riscv/lib/crc32.c
+++ b/lib/crc/riscv/crc32.h
@@ -5,49 +5,43 @@
  * Copyright 2025 Google LLC
  */
 
 #include <asm/hwcap.h>
 #include <asm/alternative-macros.h>
-#include <linux/crc32.h>
-#include <linux/module.h>
 
 #include "crc-clmul.h"
 
-u32 crc32_le_arch(u32 crc, const u8 *p, size_t len)
+#define crc32_le_arch crc32_le_arch
+static inline u32 crc32_le_arch(u32 crc, const u8 *p, size_t len)
 {
 	if (riscv_has_extension_likely(RISCV_ISA_EXT_ZBC))
 		return crc32_lsb_clmul(crc, p, len,
 				       &crc32_lsb_0xedb88320_consts);
 	return crc32_le_base(crc, p, len);
 }
-EXPORT_SYMBOL(crc32_le_arch);
 
-u32 crc32_be_arch(u32 crc, const u8 *p, size_t len)
+#define crc32_be_arch crc32_be_arch
+static inline u32 crc32_be_arch(u32 crc, const u8 *p, size_t len)
 {
 	if (riscv_has_extension_likely(RISCV_ISA_EXT_ZBC))
 		return crc32_msb_clmul(crc, p, len,
 				       &crc32_msb_0x04c11db7_consts);
 	return crc32_be_base(crc, p, len);
 }
-EXPORT_SYMBOL(crc32_be_arch);
 
-u32 crc32c_arch(u32 crc, const u8 *p, size_t len)
+#define crc32c_arch crc32c_arch
+static inline u32 crc32c_arch(u32 crc, const u8 *p, size_t len)
 {
 	if (riscv_has_extension_likely(RISCV_ISA_EXT_ZBC))
 		return crc32_lsb_clmul(crc, p, len,
 				       &crc32_lsb_0x82f63b78_consts);
 	return crc32c_base(crc, p, len);
 }
-EXPORT_SYMBOL(crc32c_arch);
 
-u32 crc32_optimizations(void)
+static inline u32 crc32_optimizations_arch(void)
 {
 	if (riscv_has_extension_likely(RISCV_ISA_EXT_ZBC))
 		return CRC32_LE_OPTIMIZATION |
 		       CRC32_BE_OPTIMIZATION |
 		       CRC32C_OPTIMIZATION;
 	return 0;
 }
-EXPORT_SYMBOL(crc32_optimizations);
-
-MODULE_DESCRIPTION("RISC-V optimized CRC32 functions");
-MODULE_LICENSE("GPL");
diff --git a/arch/riscv/lib/crc32_lsb.c b/lib/crc/riscv/crc32_lsb.c
similarity index 100%
rename from arch/riscv/lib/crc32_lsb.c
rename to lib/crc/riscv/crc32_lsb.c
diff --git a/arch/riscv/lib/crc32_msb.c b/lib/crc/riscv/crc32_msb.c
similarity index 100%
rename from arch/riscv/lib/crc32_msb.c
rename to lib/crc/riscv/crc32_msb.c
diff --git a/arch/riscv/lib/crc64.c b/lib/crc/riscv/crc64.h
similarity index 65%
rename from arch/riscv/lib/crc64.c
rename to lib/crc/riscv/crc64.h
index f0015a27836a4..a1b7873fde579 100644
--- a/arch/riscv/lib/crc64.c
+++ b/lib/crc/riscv/crc64.h
@@ -5,30 +5,23 @@
  * Copyright 2025 Google LLC
  */
 
 #include <asm/hwcap.h>
 #include <asm/alternative-macros.h>
-#include <linux/crc64.h>
-#include <linux/module.h>
 
 #include "crc-clmul.h"
 
-u64 crc64_be_arch(u64 crc, const u8 *p, size_t len)
+static inline u64 crc64_be_arch(u64 crc, const u8 *p, size_t len)
 {
 	if (riscv_has_extension_likely(RISCV_ISA_EXT_ZBC))
 		return crc64_msb_clmul(crc, p, len,
 				       &crc64_msb_0x42f0e1eba9ea3693_consts);
 	return crc64_be_generic(crc, p, len);
 }
-EXPORT_SYMBOL(crc64_be_arch);
 
-u64 crc64_nvme_arch(u64 crc, const u8 *p, size_t len)
+static inline u64 crc64_nvme_arch(u64 crc, const u8 *p, size_t len)
 {
 	if (riscv_has_extension_likely(RISCV_ISA_EXT_ZBC))
 		return crc64_lsb_clmul(crc, p, len,
 				       &crc64_lsb_0x9a6c9329ac4bc9b5_consts);
 	return crc64_nvme_generic(crc, p, len);
 }
-EXPORT_SYMBOL(crc64_nvme_arch);
-
-MODULE_DESCRIPTION("RISC-V optimized CRC64 functions");
-MODULE_LICENSE("GPL");
diff --git a/arch/riscv/lib/crc64_lsb.c b/lib/crc/riscv/crc64_lsb.c
similarity index 100%
rename from arch/riscv/lib/crc64_lsb.c
rename to lib/crc/riscv/crc64_lsb.c
diff --git a/arch/riscv/lib/crc64_msb.c b/lib/crc/riscv/crc64_msb.c
similarity index 100%
rename from arch/riscv/lib/crc64_msb.c
rename to lib/crc/riscv/crc64_msb.c
-- 
2.49.0


