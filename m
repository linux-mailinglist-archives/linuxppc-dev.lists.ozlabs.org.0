Return-Path: <linuxppc-dev+bounces-9064-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 165C8ACA0E3
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Jun 2025 00:47:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b9XBl6Sjxz2yZ6;
	Mon,  2 Jun 2025 08:46:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1748817967;
	cv=none; b=WEC4AtWGpphEoscLkqOJjrJrI3AFUqQW6cYN/5Rw++qjqflHaJwu70xm1oUU5LVIeGez8HfHnAhxgDi6zH1snczBdUJX/RhA0xkt5wYipCx9EaOX3lbTiz6QCaTt81EkB11a1HLatxrLEOPvaizu884k+mE3yeIVvI5epceFHRxBqewo/xp6PvWn2TqhMCC2nHOJpB/b2tEgxdg6noJvweE6q2TK4c1UH262Hc1ajOjBMofI/JM83GWmOLr6Cp0sK1HZqUkM3cJ9/1Mmzk4zUUH6xio0hVfwOBIjO4fiZuAc2QQn7DTSFfo00CG89QjE3GDCUSvwPz/UToTku0HBrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1748817967; c=relaxed/relaxed;
	bh=05zXzcUbsGPXSKJkrgZE/DVrK80fMJi525eJ9cam7IY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LacxhICD8Ev98JkF4vTkXpfDuFQmOrCGREqKeVcKjauJyXf67s5hbHyT4J/cP9RyCB5T8vZafurAVv9BajQF1mv87zmkrGyxcmpxFfCScEce/n3f0cP46TJPpBx5z1cDm5FnXDnUwec3JgB9zCYxEPVpbjfmYtHYCzDX8+hTdxgDn2WOMqqyufob8VyIc7FrK8wm9qNM9I5KuahNnQERCI/YO0LBuTs/qTSmvkUi4HCx898mlFybb6wFfl7OZt0L9bG2XKfrAR1WlOxT+bLVIj8wlaPO+Ie3RoP2Q96PTryS04IEZ5I0d8xJ+egvBKVz6GKBTNB80V2k0XWyF3royA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=QD27px5Y; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=QD27px5Y;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b9XBf4rCDz2yhb
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  2 Jun 2025 08:46:01 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id DF1734A8E9;
	Sun,  1 Jun 2025 22:45:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 515FCC113CF;
	Sun,  1 Jun 2025 22:45:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748817959;
	bh=UTN9XJ3QNZMywLZq7NN5DWhOFROMdgLy2Y339vtWDb8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QD27px5Y0+vwJcrCeIbV55N71S4ZUr2XHWbP/XxCLtPJPhpG3ODiMR1LOk5H8cgoT
	 5YQhq3ncwecKLxMzjM7LwH+dS1eCqaDl8vivncFNmMKvTLkZL9+NwKbTKOhhDZmat8
	 UfMmERij63jXqXkITGzIOYws4XBcJkjANeGRIkfh1Koit5MfKuYDzLs7NwpcPimj5I
	 WSiWiysCjb1r4ccuZQOGBIO9vYxSCCfmC8TlFFSbAHWh4BZeO16c3mCc2RwT3F15ss
	 tWhCmu6DEoGr2sO5Pkw8yp9DkP2dvVlhEoPp/tH97ZmjyC8mvMAPzmBSfkBgpAWUpQ
	 5whbFrzYkW5pQ==
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
Subject: [PATCH 12/13] lib/crc/sparc: migrate sparc-optimized CRC code into lib/crc/
Date: Sun,  1 Jun 2025 15:44:40 -0700
Message-ID: <20250601224441.778374-13-ebiggers@kernel.org>
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

Move the sparc-optimized CRC code from arch/sparc/lib/crc* into its new
location in lib/crc/sparc/, and wire it up in the new way.  For a
detailed explanation of why this change is being made, see the commit
that introduced the new way of integrating arch-specific code into
lib/crc/.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 arch/sparc/Kconfig                            |  1 -
 arch/sparc/lib/Makefile                       |  2 -
 lib/crc/Kconfig                               |  1 +
 lib/crc/Makefile                              |  1 +
 .../lib/crc32.c => lib/crc/sparc/crc32.h      | 40 ++++---------------
 .../sparc/lib => lib/crc/sparc}/crc32c_asm.S  |  0
 6 files changed, 9 insertions(+), 36 deletions(-)
 rename arch/sparc/lib/crc32.c => lib/crc/sparc/crc32.h (62%)
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
index 1ed6e11bef909..c0b36d03b66dc 100644
--- a/lib/crc/Kconfig
+++ b/lib/crc/Kconfig
@@ -70,10 +70,11 @@ config CRC32_ARCH
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
index 1b83262b6987f..37dd4a776d1b4 100644
--- a/lib/crc/Makefile
+++ b/lib/crc/Makefile
@@ -26,10 +26,11 @@ ifeq ($(CONFIG_CRC32_ARCH),y)
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
similarity index 62%
rename from arch/sparc/lib/crc32.c
rename to lib/crc/sparc/crc32.h
index 40d4720a42a1b..43d52e60b2960 100644
--- a/arch/sparc/lib/crc32.c
+++ b/lib/crc/sparc/crc32.h
@@ -8,28 +8,19 @@
  *          Kent Liu <kent.liu@intel.com>
  */
 
 #define pr_fmt(fmt)	KBUILD_MODNAME ": " fmt
 
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
-
 void crc32c_sparc64(u32 *crcp, const u64 *data, size_t len);
 
-u32 crc32c_arch(u32 crc, const u8 *data, size_t len)
+#define crc32c_arch crc32c_arch
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


