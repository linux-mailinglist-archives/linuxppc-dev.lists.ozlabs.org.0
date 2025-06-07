Return-Path: <linuxppc-dev+bounces-9199-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E363AD0F7D
	for <lists+linuxppc-dev@lfdr.de>; Sat,  7 Jun 2025 22:08:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bF8PB59Cyz30T8;
	Sun,  8 Jun 2025 06:07:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1749326862;
	cv=none; b=O0rj19ozotFCtR59vugGPZk+r60Qo9k7rtZMwCFLlUDZtTbxxeykvWTDjifCsT/hTK61KQ1Vkm83YaZ19tGaIluQnzBiXmESlEOgk7Qmff4O9OsA+fagNZfRlab3x+rPUSnIB/IaMAsne8HxjN0qzW8NDt8KCByo23kCO5jK6YmB4e50magQFzICGbSOTbXAoDcBRUE02VQxNxn2aKZOqS1/F6iCMKmQoo4mpI2ClOtszhwH7vMmC6XBgDvikbNOrQ4+146YWWV29lf3J71eXcr+6CQe1a8P0v7IqkxyAjvubZBzGTskSiD5qHMkKWNXREUyFQ8KST+Iso++qsaVCg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1749326862; c=relaxed/relaxed;
	bh=lT6lykBU1a393ZoI2CBtFWwNSxAoKk1VK4CBFYQSRwM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gKrwLVfQnBPo17A9NBRqAPRsfr52E64tyMhlGJnKRCatXwXAqQfDk30IkDvq5UTfT3BL9ECWVl8fpiHkd1TB9TT/2Tn6UIB4KynCeHPF5t6j6dNGqHGPhWGTo9Klmdrvd0XLU2Up3kurRBptUjfjNYvbCaI4Jyo61lNQb+4LYuwun91rTtV0NT7P0lRpoIRsfWF1fTbMQN/wOMkF8uDfhStdQBoqibdEO6WeoxZYVTHPT2CCNZaMUmJM/oml7R5I4q58rv9FDRlCnbLPVW8uYFoI6aTMxIvGng47+8qHJXSSnghuWZ7R96dydBd32F7b/ffCgW3G2ikklcRoQfwjeQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Hf6I+Ges; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Hf6I+Ges;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bF8P46PV4z30BG
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  8 Jun 2025 06:07:35 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9571E40BCF;
	Sat,  7 Jun 2025 20:07:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10C30C4CEE4;
	Sat,  7 Jun 2025 20:07:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749326853;
	bh=ml00Eu6L3MCivT8VcjfT2RgfiZJS9znV2CRfUv6dB7E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Hf6I+GessssiRha4MpA6RFI+58URioJcA8hkf18voXD1e9otmRrh6ut6f37cDXBp+
	 t02pRBAP/ZlXisnR/Q2kSIylUzzyohdF4xc+dYSaCvPizsqHiblpXpH3M/AcB4DwZm
	 1gsBgk8eLNYcmlAGFZLxK2WApGsMmbHKpUBzmx0pNNo3RVKGFzhTcZ7ZCx//ZzZdDI
	 hLEhV+ur56mvrGVIPD3EuNCPvrKW9CQHIaAhExDe1uBKmjOUWdJvccInA7Py7CALlr
	 ISUzxfUqOE8bsLzp6szFM0WEjwnQYDirYRxe83hqmv+e8gbpJV65fpLADWeNNXS6YC
	 lNZw0bHLVTzlA==
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
Subject: [PATCH v2 10/12] lib/crc/sparc: migrate sparc-optimized CRC code into lib/crc/
Date: Sat,  7 Jun 2025 13:04:52 -0700
Message-ID: <20250607200454.73587-11-ebiggers@kernel.org>
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

Move the sparc-optimized CRC code from arch/sparc/lib/crc* into its new
location in lib/crc/sparc/, and wire it up in the new way.  This new way
of organizing the CRC code eliminates the need to artificially split the
code for each CRC variant into separate arch and generic modules,
enabling better inlining and dead code elimination.  For more details,
see "lib/crc: prepare for arch-optimized code in subdirs of lib/crc/".

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 arch/sparc/Kconfig                            |  1 -
 arch/sparc/lib/Makefile                       |  2 -
 lib/crc/Kconfig                               |  1 +
 lib/crc/Makefile                              |  1 +
 .../lib/crc32.c => lib/crc/sparc/crc32.h      | 42 ++++---------------
 .../sparc/lib => lib/crc/sparc}/crc32c_asm.S  |  0
 6 files changed, 10 insertions(+), 37 deletions(-)
 rename arch/sparc/lib/crc32.c => lib/crc/sparc/crc32.h (60%)
 rename {arch/sparc/lib => lib/crc/sparc}/crc32c_asm.S (100%)

diff --git a/arch/sparc/Kconfig b/arch/sparc/Kconfig
index 0f88123925a4f..dcfdb7f1dae97 100644
--- a/arch/sparc/Kconfig
+++ b/arch/sparc/Kconfig
@@ -108,11 +108,10 @@ config SPARC64
 	select ARCH_HAS_GIGANTIC_PAGE
 	select HAVE_SOFTIRQ_ON_OWN_STACK
 	select HAVE_SETUP_PER_CPU_AREA
 	select NEED_PER_CPU_EMBED_FIRST_CHUNK
 	select NEED_PER_CPU_PAGE_FIRST_CHUNK
-	select ARCH_HAS_CRC32
 
 config ARCH_PROC_KCORE_TEXT
 	def_bool y
 
 config CPU_BIG_ENDIAN
diff --git a/arch/sparc/lib/Makefile b/arch/sparc/lib/Makefile
index 5cf9781d68b40..2d6c3c5352734 100644
--- a/arch/sparc/lib/Makefile
+++ b/arch/sparc/lib/Makefile
@@ -52,7 +52,5 @@ lib-$(CONFIG_SPARC64) += copy_in_user.o memmove.o
 lib-$(CONFIG_SPARC64) += mcount.o ipcsum.o xor.o hweight.o ffs.o
 
 obj-$(CONFIG_SPARC64) += iomap.o
 obj-$(CONFIG_SPARC32) += atomic32.o
 obj-$(CONFIG_SPARC64) += PeeCeeI.o
-obj-$(CONFIG_CRC32_ARCH) += crc32-sparc.o
-crc32-sparc-y := crc32.o crc32c_asm.o
diff --git a/lib/crc/Kconfig b/lib/crc/Kconfig
index 1b69a8bef4a85..af4fa857a81f8 100644
--- a/lib/crc/Kconfig
+++ b/lib/crc/Kconfig
@@ -73,10 +73,11 @@ config CRC32_ARCH
 	default y if LOONGARCH
 	default y if MIPS && CPU_MIPSR6
 	default y if PPC64 && ALTIVEC
 	default y if RISCV && RISCV_ISA_ZBC
 	default y if S390
+	default y if SPARC64
 
 config CRC64
 	tristate
 	help
 	  The CRC64 library functions.  Select this if your module uses any of
diff --git a/lib/crc/Makefile b/lib/crc/Makefile
index bec58266251f8..81e176db0947c 100644
--- a/lib/crc/Makefile
+++ b/lib/crc/Makefile
@@ -26,10 +26,11 @@ CFLAGS_crc32-main.o += -I$(src)/$(SRCARCH)
 crc32-$(CONFIG_ARM) += arm/crc32-core.o
 crc32-$(CONFIG_ARM64) += arm64/crc32-core.o
 crc32-$(CONFIG_PPC) += powerpc/crc32c-vpmsum_asm.o
 crc32-$(CONFIG_RISCV) += riscv/crc32_lsb.o riscv/crc32_msb.o
 crc32-$(CONFIG_S390) += s390/crc32le-vx.o s390/crc32be-vx.o
+crc32-$(CONFIG_SPARC) += sparc/crc32c_asm.o
 endif
 
 obj-$(CONFIG_CRC64) += crc64.o
 crc64-y := crc64-main.o
 ifeq ($(CONFIG_CRC64_ARCH),y)
diff --git a/arch/sparc/lib/crc32.c b/lib/crc/sparc/crc32.h
similarity index 60%
rename from arch/sparc/lib/crc32.c
rename to lib/crc/sparc/crc32.h
index 40d4720a42a1b..60f2765ac0157 100644
--- a/arch/sparc/lib/crc32.c
+++ b/lib/crc/sparc/crc32.h
@@ -6,30 +6,21 @@
  * Copyright (C) 2008 Intel Corporation
  * Authors: Austin Zhang <austin_zhang@linux.intel.com>
  *          Kent Liu <kent.liu@intel.com>
  */
 
-#define pr_fmt(fmt)	KBUILD_MODNAME ": " fmt
-
-#include <linux/init.h>
-#include <linux/module.h>
-#include <linux/kernel.h>
-#include <linux/crc32.h>
 #include <asm/pstate.h>
 #include <asm/elf.h>
 
 static __ro_after_init DEFINE_STATIC_KEY_FALSE(have_crc32c_opcode);
 
-u32 crc32_le_arch(u32 crc, const u8 *data, size_t len)
-{
-	return crc32_le_base(crc, data, len);
-}
-EXPORT_SYMBOL(crc32_le_arch);
+#define crc32_le_arch crc32_le_base /* not implemented on this arch */
+#define crc32_be_arch crc32_be_base /* not implemented on this arch */
 
 void crc32c_sparc64(u32 *crcp, const u64 *data, size_t len);
 
-u32 crc32c_arch(u32 crc, const u8 *data, size_t len)
+static inline u32 crc32c_arch(u32 crc, const u8 *data, size_t len)
 {
 	size_t n = -(uintptr_t)data & 7;
 
 	if (!static_branch_likely(&have_crc32c_opcode))
 		return crc32c_base(crc, data, len);
@@ -49,45 +40,28 @@ u32 crc32c_arch(u32 crc, const u8 *data, size_t len)
 	}
 	if (len)
 		crc = crc32c_base(crc, data, len);
 	return crc;
 }
-EXPORT_SYMBOL(crc32c_arch);
-
-u32 crc32_be_arch(u32 crc, const u8 *data, size_t len)
-{
-	return crc32_be_base(crc, data, len);
-}
-EXPORT_SYMBOL(crc32_be_arch);
 
-static int __init crc32_sparc_init(void)
+#define crc32_mod_init_arch crc32_mod_init_arch
+static inline void crc32_mod_init_arch(void)
 {
 	unsigned long cfr;
 
 	if (!(sparc64_elf_hwcap & HWCAP_SPARC_CRYPTO))
-		return 0;
+		return;
 
 	__asm__ __volatile__("rd %%asr26, %0" : "=r" (cfr));
 	if (!(cfr & CFR_CRC32C))
-		return 0;
+		return;
 
 	static_branch_enable(&have_crc32c_opcode);
 	pr_info("Using sparc64 crc32c opcode optimized CRC32C implementation\n");
-	return 0;
 }
-subsys_initcall(crc32_sparc_init);
 
-static void __exit crc32_sparc_exit(void)
-{
-}
-module_exit(crc32_sparc_exit);
-
-u32 crc32_optimizations(void)
+static inline u32 crc32_optimizations_arch(void)
 {
 	if (static_key_enabled(&have_crc32c_opcode))
 		return CRC32C_OPTIMIZATION;
 	return 0;
 }
-EXPORT_SYMBOL(crc32_optimizations);
-
-MODULE_LICENSE("GPL");
-MODULE_DESCRIPTION("CRC32c (Castagnoli), sparc64 crc32c opcode accelerated");
diff --git a/arch/sparc/lib/crc32c_asm.S b/lib/crc/sparc/crc32c_asm.S
similarity index 100%
rename from arch/sparc/lib/crc32c_asm.S
rename to lib/crc/sparc/crc32c_asm.S
-- 
2.49.0


