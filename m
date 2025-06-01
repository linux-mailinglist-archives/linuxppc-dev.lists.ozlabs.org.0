Return-Path: <linuxppc-dev+bounces-9063-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EBF6AACA0E1
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Jun 2025 00:47:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b9XBk23gpz30DP;
	Mon,  2 Jun 2025 08:46:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1748817966;
	cv=none; b=Sp8wLT/MMYEL8WIfhT4tTASPoCOMvW72OSEi13R6VqEhmCQiU+ZeMhbr8d9MWMS9cu7IUgzd7aJWE2V6GY93m3ehDi8CF8aSQ3eGagNiIxkFnVBrW6p0X2Bp9Rzu+DSaDapKHB9m34bZdBqPGdZ1qcicN9VYimOkvzFuky+n9f+LUEZq6QQ+RUOPvPQS2xRObYxb0RJxryN+WuG2TxeaVGr5w9AwMSXZYBKtnF3TqR1C8gpA2KDXZohXK1EWCbVxO5HZauG+almgAOl4qgvSMLrKGt97evzcaVydkb/HAA2JiVmRdcpHSg35AAvOQxBRav/5kJDHReS38BCTWhjc2g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1748817966; c=relaxed/relaxed;
	bh=csNIndt9aENb51+xxDNtIN72MtU29IkPht/ivzKvs2U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=I/5BMUEP4zrOXGrZf08DiJd9f5BcGv+5gRl09IcrySGw9fuw9b+MHzkTMKj/uVvld3zWJhpMtjXn7PSx7WQdsfFZQ5XpT9qbv0BYTZ2tKqnHjJMzrE/lU17fPnKk+NswcCVj9hAT6uRbEuV3cKZAxbYNRkaCShRZjmN6INuTBp0Cp0ag7FErnj7hS/5TY7QbDZkjsHYyDBbndd19a6D4TQeIn5kDbtozeIbKjfAU0GV6IneQHEAEhMCi+4o6VFmoj0Ngeb0lySgLGwE2gfFdyy806T2c2XS3RcMCSz+VNxwF+L8c8CtfQPBWaBG8w8efhWQt9mcPiq4sMPSNa8MTCg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Mdw3TZwa; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Mdw3TZwa;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b9XBd22KRz2yZ6
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  2 Jun 2025 08:46:01 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6CF0B4A8AB;
	Sun,  1 Jun 2025 22:45:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9938C4CEEE;
	Sun,  1 Jun 2025 22:45:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748817959;
	bh=95cP740x9TPPdMrMRbzvOoF5hVV7Q6oui6O4DOa47nw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Mdw3TZwasG6f4rAglr1W91xGPN+a4inpfdi2b0qnvd7sKuMz9nr1Dz+qGvhQhh6gh
	 xPNU9z0LYQsyYV+JMiJan+IzMAWP4ZneVRqL8AzeD7GAv5eAoAOJ83DeAyF1As75RV
	 USJO6+9kwlBew6TXngvXkWDl+9O/NyMuvI9riqJF6IWY+Dg4zSt5U4h80tHCB8I19W
	 4eWjLZ7k/moC2/rWv0ODHhbCnbPubEirpTbZXddZEA5g65ZOi3RgPzzKFT+PE6OXyN
	 wrry2sFGzXhj6iprl7KYKXJ7VY+Im19So2xVHQe8nBBBXsjSaPdriP8g2OPUQWqMxx
	 cilq53LID01vg==
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
Subject: [PATCH 11/13] lib/crc/s390: migrate s390-optimized CRC code into lib/s390/
Date: Sun,  1 Jun 2025 15:44:39 -0700
Message-ID: <20250601224441.778374-12-ebiggers@kernel.org>
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

Move the s390-optimized CRC code from arch/s390/lib/crc* into its new
location in lib/crc/s390/, and wire it up in the new way.  For a
detailed explanation of why this change is being made, see the commit
that introduced the new way of integrating arch-specific code into
lib/crc/.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 arch/s390/Kconfig                             |  1 -
 arch/s390/lib/Makefile                        |  3 ---
 lib/crc/Kconfig                               |  1 +
 lib/crc/Makefile                              |  1 +
 {arch/s390/lib => lib/crc/s390}/crc32-vx.h    |  0
 arch/s390/lib/crc32.c => lib/crc/s390/crc32.h | 19 ++++++-------------
 {arch/s390/lib => lib/crc/s390}/crc32be-vx.c  |  0
 {arch/s390/lib => lib/crc/s390}/crc32le-vx.c  |  0
 8 files changed, 8 insertions(+), 17 deletions(-)
 rename {arch/s390/lib => lib/crc/s390}/crc32-vx.h (100%)
 rename arch/s390/lib/crc32.c => lib/crc/s390/crc32.h (81%)
 rename {arch/s390/lib => lib/crc/s390}/crc32be-vx.c (100%)
 rename {arch/s390/lib => lib/crc/s390}/crc32le-vx.c (100%)

diff --git a/arch/s390/Kconfig b/arch/s390/Kconfig
index 0c16dc443e2f6..22b90f6aa1a09 100644
--- a/arch/s390/Kconfig
+++ b/arch/s390/Kconfig
@@ -73,11 +73,10 @@ config S390
 	select ARCH_CORRECT_STACKTRACE_ON_KRETPROBE
 	select ARCH_ENABLE_MEMORY_HOTPLUG if SPARSEMEM
 	select ARCH_ENABLE_MEMORY_HOTREMOVE
 	select ARCH_ENABLE_SPLIT_PMD_PTLOCK if PGTABLE_LEVELS > 2
 	select ARCH_HAS_CPU_FINALIZE_INIT
-	select ARCH_HAS_CRC32
 	select ARCH_HAS_CURRENT_STACK_POINTER
 	select ARCH_HAS_DEBUG_VIRTUAL
 	select ARCH_HAS_DEBUG_VM_PGTABLE
 	select ARCH_HAS_DEBUG_WX
 	select ARCH_HAS_DEVMEM_IS_ALLOWED
diff --git a/arch/s390/lib/Makefile b/arch/s390/lib/Makefile
index cd35cdbfa8713..7c8583d46eca1 100644
--- a/arch/s390/lib/Makefile
+++ b/arch/s390/lib/Makefile
@@ -23,8 +23,5 @@ obj-$(CONFIG_S390_MODULES_SANITY_TEST) += test_modules.o
 obj-$(CONFIG_S390_MODULES_SANITY_TEST_HELPERS) += test_modules_helpers.o
 
 lib-$(CONFIG_FUNCTION_ERROR_INJECTION) += error-inject.o
 
 obj-$(CONFIG_EXPOLINE_EXTERN) += expoline.o
-
-obj-$(CONFIG_CRC32_ARCH) += crc32-s390.o
-crc32-s390-y := crc32.o crc32le-vx.o crc32be-vx.o
diff --git a/lib/crc/Kconfig b/lib/crc/Kconfig
index 4044e08cb9739..1ed6e11bef909 100644
--- a/lib/crc/Kconfig
+++ b/lib/crc/Kconfig
@@ -69,10 +69,11 @@ config CRC32_ARCH
 	default y if ARM64
 	default y if LOONGARCH
 	default y if MIPS && CPU_MIPSR6
 	default y if PPC64 && ALTIVEC
 	default y if RISCV && RISCV_ISA_ZBC
+	default y if S390
 
 config CRC64
 	tristate
 	help
 	  The CRC64 library functions.  Select this if your module uses any of
diff --git a/lib/crc/Makefile b/lib/crc/Makefile
index e46b35a2ffc04..1b83262b6987f 100644
--- a/lib/crc/Makefile
+++ b/lib/crc/Makefile
@@ -25,10 +25,11 @@ crc32-y := crc32-main.o
 ifeq ($(CONFIG_CRC32_ARCH),y)
 crc32-$(CONFIG_ARM) += arm/crc32-core.o
 crc32-$(CONFIG_ARM64) += arm64/crc32-core.o
 crc32-$(CONFIG_PPC) += powerpc/crc32c-vpmsum_asm.o
 crc32-$(CONFIG_RISCV) += riscv/crc32_lsb.o riscv/crc32_msb.o
+crc32-$(CONFIG_S390) += s390/crc32le-vx.o s390/crc32be-vx.o
 endif
 
 obj-$(CONFIG_CRC64) += crc64.o
 crc64-y := crc64-main.o
 ifeq ($(CONFIG_CRC64_ARCH),y)
diff --git a/arch/s390/lib/crc32-vx.h b/lib/crc/s390/crc32-vx.h
similarity index 100%
rename from arch/s390/lib/crc32-vx.h
rename to lib/crc/s390/crc32-vx.h
diff --git a/arch/s390/lib/crc32.c b/lib/crc/s390/crc32.h
similarity index 81%
rename from arch/s390/lib/crc32.c
rename to lib/crc/s390/crc32.h
index 3c4b344417c11..8dbb07b9ea64c 100644
--- a/arch/s390/lib/crc32.c
+++ b/lib/crc/s390/crc32.h
@@ -3,16 +3,12 @@
  * CRC-32 implemented with the z/Architecture Vector Extension Facility.
  *
  * Copyright IBM Corp. 2015
  * Author(s): Hendrik Brueckner <brueckner@linux.vnet.ibm.com>
  */
-#define KMSG_COMPONENT	"crc32-vx"
-#define pr_fmt(fmt)	KMSG_COMPONENT ": " fmt
 
-#include <linux/module.h>
 #include <linux/cpufeature.h>
-#include <linux/crc32.h>
 #include <asm/fpu.h>
 #include "crc32-vx.h"
 
 #define VX_MIN_LEN		64
 #define VX_ALIGNMENT		16L
@@ -25,11 +21,11 @@
  * on the message buffer, the hardware-accelerated or software implementation
  * is used.   Note that the message buffer is aligned to improve fetch
  * operations of VECTOR LOAD MULTIPLE instructions.
  */
 #define DEFINE_CRC32_VX(___fname, ___crc32_vx, ___crc32_sw)		    \
-	u32 ___fname(u32 crc, const u8 *data, size_t datalen)		    \
+	static inline u32 ___fname(u32 crc, const u8 *data, size_t datalen) \
 	{								    \
 		unsigned long prealign, aligned, remaining;		    \
 		DECLARE_KERNEL_FPU_ONSTACK16(vxstate);			    \
 									    \
 		if (datalen < VX_MIN_LEN + VX_ALIGN_MASK || !cpu_has_vx())  \
@@ -52,26 +48,23 @@
 									    \
 		if (remaining)						    \
 			crc = ___crc32_sw(crc, data + aligned, remaining);  \
 									    \
 		return crc;						    \
-	}								    \
-	EXPORT_SYMBOL(___fname);
+	}
 
+#define crc32_le_arch crc32_le_arch
+#define crc32_be_arch crc32_be_arch
+#define crc32c_arch crc32c_arch
 DEFINE_CRC32_VX(crc32_le_arch, crc32_le_vgfm_16, crc32_le_base)
 DEFINE_CRC32_VX(crc32_be_arch, crc32_be_vgfm_16, crc32_be_base)
 DEFINE_CRC32_VX(crc32c_arch, crc32c_le_vgfm_16, crc32c_base)
 
-u32 crc32_optimizations(void)
+static inline u32 crc32_optimizations_arch(void)
 {
 	if (cpu_has_vx()) {
 		return CRC32_LE_OPTIMIZATION |
 		       CRC32_BE_OPTIMIZATION |
 		       CRC32C_OPTIMIZATION;
 	}
 	return 0;
 }
-EXPORT_SYMBOL(crc32_optimizations);
-
-MODULE_AUTHOR("Hendrik Brueckner <brueckner@linux.vnet.ibm.com>");
-MODULE_DESCRIPTION("CRC-32 algorithms using z/Architecture Vector Extension Facility");
-MODULE_LICENSE("GPL");
diff --git a/arch/s390/lib/crc32be-vx.c b/lib/crc/s390/crc32be-vx.c
similarity index 100%
rename from arch/s390/lib/crc32be-vx.c
rename to lib/crc/s390/crc32be-vx.c
diff --git a/arch/s390/lib/crc32le-vx.c b/lib/crc/s390/crc32le-vx.c
similarity index 100%
rename from arch/s390/lib/crc32le-vx.c
rename to lib/crc/s390/crc32le-vx.c
-- 
2.49.0


