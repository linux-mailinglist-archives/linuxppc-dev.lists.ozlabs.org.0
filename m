Return-Path: <linuxppc-dev+bounces-9934-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DB27AEE3A8
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Jun 2025 18:11:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bWB1x6Cvsz3bnm;
	Tue,  1 Jul 2025 02:09:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1751299779;
	cv=none; b=PZ+X5kWqazcX4nxgHfqFH3Zj/e92yozdQDriupA3AMmQjK+sJrWfqmkQlpeIWpyv+/tVKiVa5/wGE4EXsfTOwOYno0x0mM3otSfzaQQ4tJ1YDz+XapN2I8UgdY37q38GWFMeZ2+nBA/WWp5oeprkoCNwr51JZd+lRq/0t24xnfw4skPa9lNzyiAT5W1uB/fcpE67D7xDOvWe3MhzLlgQzkupBq9FsE8zASgA/RoKQLA1lkE4FyatBvs3PkjJrjm8FH9jevs92ZO423To5yuZSEmwQbJiv6tc61ZOqNqueow4xF6ZQVLi2ugH/YyRI8HrOqG9bicU3x+H4ku6h0l+EA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1751299779; c=relaxed/relaxed;
	bh=JBnRl7fUVp0yCDmf0d1C7agevk9hbjOrSIYPFtYuvNI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Y4tG4kFaDHkMbKKfFD5mhHUJpTi7tJjqWh3N16Sz85dpNsay5tIKydNBFYR4lmAq6WaF49lK2flCmDSzjmn00Cf3AVq7EHWshIgcCt30MpxlIyGKSxL3ZqkvVLVkYpR+5snPsCBJ83gwH7ff4PS1Fu17RD3RVgIY2VVsjUWbeg2SQEY8rJJNl1vgtcRC0soWgHfTdk1bYuTL/Ad146Vy//sjskysFYMYKT3bao+t7zVbO4UKvI8RxiFWVUqMzWhKLPcMAFp9mYl46o1FteAyyDKhatrP8HEEH4kIBOE0v6QtZAx1SPAIBH9RikUgNArw7NMq2ps+0F3JnV+iwmazog==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=oCX/wVQE; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=oCX/wVQE;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bWB1j21sXz30W9
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Jul 2025 02:09:29 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 10089A4F86A;
	Mon, 30 Jun 2025 16:09:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55D48C4CEF1;
	Mon, 30 Jun 2025 16:09:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751299766;
	bh=QiYyLutagD8A5z6IJuPXgJxVQLKoG/45Zf+JXR4NhJI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=oCX/wVQEI9G/g7jkSqgfRIbh5coTDmzCNlKYIlheOCCgD0lDQ40pwvjbMQNR6NdvO
	 nQXR15VaDBjSPGDm/2uG0J8t7VqicNpBejNS6Yn+4Vc4pt5oLfNOed3wxZTai11Gqc
	 H2kh6a7Xc+aItvguXmeL/wiUBPoxgmK/XtgIUL27l5SSURJxgeAuK4FKi8Z/O4/zFk
	 E1cyjYzFCZ7qg7NU0lKr0+cXuYDDPSDLmuqW1lHJvx0XKIWYbsL31MS/A0NWWzHcW8
	 GM3FcuiQJ6uklz3byOfH5k33U+wY7+RHmlOTDSYVy/zzNs11F5jxXvS2wErYdIApn4
	 ExyAvQdaQGZHw==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org,
	x86@kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	Eric Biggers <ebiggers@kernel.org>
Subject: [PATCH v2 12/14] lib/crypto: sha256: Consolidate into single module
Date: Mon, 30 Jun 2025 09:06:43 -0700
Message-ID: <20250630160645.3198-13-ebiggers@kernel.org>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250630160645.3198-1-ebiggers@kernel.org>
References: <20250630160645.3198-1-ebiggers@kernel.org>
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
X-Spam-Status: No, score=-5.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Consolidate the CPU-based SHA-256 code into a single module, following
what I did with SHA-512:

- Each arch now provides a header file lib/crypto/$(SRCARCH)/sha256.h,
  replacing lib/crypto/$(SRCARCH)/sha256.c.  The header defines
  sha256_blocks() and optionally sha256_mod_init_arch().  It is included
  by lib/crypto/sha256.c, and thus the code gets built into the single
  libsha256 module, with proper inlining and dead code elimination.

- sha256_blocks_generic() is moved from lib/crypto/sha256-generic.c into
  lib/crypto/sha256.c.  It's now a static function marked with
  __maybe_unused, so the compiler automatically eliminates it in any
  cases where it's not used.

- Whether arch-optimized SHA-256 is buildable is now controlled
  centrally by lib/crypto/Kconfig instead of by
  lib/crypto/$(SRCARCH)/Kconfig.  The conditions for enabling it remain
  the same as before, and it remains enabled by default.

- Any additional arch-specific translation units for the optimized
  SHA-256 code (such as assembly files) are now compiled by
  lib/crypto/Makefile instead of lib/crypto/$(SRCARCH)/Makefile.

Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 arch/mips/cavium-octeon/Kconfig               |   6 -
 arch/mips/cavium-octeon/crypto/Makefile       |   1 -
 include/crypto/internal/sha2.h                |  52 ------
 lib/crypto/Kconfig                            |  26 ++-
 lib/crypto/Makefile                           |  39 ++++-
 lib/crypto/arm/Kconfig                        |   6 -
 lib/crypto/arm/Makefile                       |   8 +-
 lib/crypto/arm/{sha256.c => sha256.h}         |  27 +---
 lib/crypto/arm64/Kconfig                      |   5 -
 lib/crypto/arm64/Makefile                     |   9 +-
 lib/crypto/arm64/{sha256.c => sha256.h}       |  29 ++--
 .../crypto/mips/sha256.h                      |  14 +-
 lib/crypto/powerpc/Kconfig                    |   6 -
 lib/crypto/powerpc/Makefile                   |   3 -
 lib/crypto/powerpc/{sha256.c => sha256.h}     |  13 +-
 lib/crypto/riscv/Kconfig                      |   7 -
 lib/crypto/riscv/Makefile                     |   3 -
 lib/crypto/riscv/{sha256.c => sha256.h}       |  24 +--
 lib/crypto/s390/Kconfig                       |   6 -
 lib/crypto/s390/Makefile                      |   3 -
 lib/crypto/s390/{sha256.c => sha256.h}        |  23 +--
 lib/crypto/sha256-generic.c                   | 150 ------------------
 lib/crypto/sha256.c                           | 146 +++++++++++++++--
 lib/crypto/sparc/Kconfig                      |   8 -
 lib/crypto/sparc/Makefile                     |   4 -
 lib/crypto/sparc/{sha256.c => sha256.h}       |  29 +---
 lib/crypto/x86/Kconfig                        |   7 -
 lib/crypto/x86/Makefile                       |   3 -
 lib/crypto/x86/{sha256.c => sha256.h}         |  29 +---
 29 files changed, 226 insertions(+), 460 deletions(-)
 delete mode 100644 include/crypto/internal/sha2.h
 rename lib/crypto/arm/{sha256.c => sha256.h} (64%)
 rename lib/crypto/arm64/{sha256.c => sha256.h} (67%)
 rename arch/mips/cavium-octeon/crypto/octeon-sha256.c => lib/crypto/mips/sha256.h (80%)
 rename lib/crypto/powerpc/{sha256.c => sha256.h} (80%)
 rename lib/crypto/riscv/{sha256.c => sha256.h} (63%)
 rename lib/crypto/s390/{sha256.c => sha256.h} (50%)
 delete mode 100644 lib/crypto/sha256-generic.c
 delete mode 100644 lib/crypto/sparc/Kconfig
 delete mode 100644 lib/crypto/sparc/Makefile
 rename lib/crypto/sparc/{sha256.c => sha256.h} (62%)
 rename lib/crypto/x86/{sha256.c => sha256.h} (70%)

diff --git a/arch/mips/cavium-octeon/Kconfig b/arch/mips/cavium-octeon/Kconfig
index 11f4aa6e80e9b..450e979ef5d93 100644
--- a/arch/mips/cavium-octeon/Kconfig
+++ b/arch/mips/cavium-octeon/Kconfig
@@ -21,16 +21,10 @@ config CAVIUM_OCTEON_CVMSEG_SIZE
 	  local memory; the larger CVMSEG is, the smaller the cache is.
 	  This selects the size of CVMSEG LM, which is in cache blocks. The
 	  legally range is from zero to 54 cache blocks (i.e. CVMSEG LM is
 	  between zero and 6192 bytes).
 
-config CRYPTO_SHA256_OCTEON
-	tristate
-	default CRYPTO_LIB_SHA256
-	select CRYPTO_ARCH_HAVE_LIB_SHA256
-	select CRYPTO_LIB_SHA256_GENERIC
-
 endif # CPU_CAVIUM_OCTEON
 
 if CAVIUM_OCTEON_SOC
 
 config CAVIUM_OCTEON_LOCK_L2
diff --git a/arch/mips/cavium-octeon/crypto/Makefile b/arch/mips/cavium-octeon/crypto/Makefile
index 168b19ef7ce89..db428e4b30bce 100644
--- a/arch/mips/cavium-octeon/crypto/Makefile
+++ b/arch/mips/cavium-octeon/crypto/Makefile
@@ -5,6 +5,5 @@
 
 obj-y += octeon-crypto.o
 
 obj-$(CONFIG_CRYPTO_MD5_OCTEON)		+= octeon-md5.o
 obj-$(CONFIG_CRYPTO_SHA1_OCTEON)	+= octeon-sha1.o
-obj-$(CONFIG_CRYPTO_SHA256_OCTEON)	+= octeon-sha256.o
diff --git a/include/crypto/internal/sha2.h b/include/crypto/internal/sha2.h
deleted file mode 100644
index 7915a3a46bc86..0000000000000
--- a/include/crypto/internal/sha2.h
+++ /dev/null
@@ -1,52 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-
-#ifndef _CRYPTO_INTERNAL_SHA2_H
-#define _CRYPTO_INTERNAL_SHA2_H
-
-#include <crypto/sha2.h>
-#include <linux/compiler_attributes.h>
-#include <linux/string.h>
-#include <linux/types.h>
-#include <linux/unaligned.h>
-
-void sha256_blocks_generic(struct sha256_block_state *state,
-			   const u8 *data, size_t nblocks);
-void sha256_blocks_arch(struct sha256_block_state *state,
-			const u8 *data, size_t nblocks);
-
-static __always_inline void sha256_choose_blocks(
-	u32 state[SHA256_STATE_WORDS], const u8 *data, size_t nblocks,
-	bool force_generic, bool force_simd)
-{
-	if (!IS_ENABLED(CONFIG_CRYPTO_ARCH_HAVE_LIB_SHA256) || force_generic)
-		sha256_blocks_generic((struct sha256_block_state *)state, data, nblocks);
-	else
-		sha256_blocks_arch((struct sha256_block_state *)state, data, nblocks);
-}
-
-static __always_inline void sha256_finup(
-	struct crypto_sha256_state *sctx, u8 buf[SHA256_BLOCK_SIZE],
-	size_t len, u8 out[SHA256_DIGEST_SIZE], size_t digest_size,
-	bool force_generic, bool force_simd)
-{
-	const size_t bit_offset = SHA256_BLOCK_SIZE - 8;
-	__be64 *bits = (__be64 *)&buf[bit_offset];
-	int i;
-
-	buf[len++] = 0x80;
-	if (len > bit_offset) {
-		memset(&buf[len], 0, SHA256_BLOCK_SIZE - len);
-		sha256_choose_blocks(sctx->state, buf, 1, force_generic,
-				     force_simd);
-		len = 0;
-	}
-
-	memset(&buf[len], 0, bit_offset - len);
-	*bits = cpu_to_be64(sctx->count << 3);
-	sha256_choose_blocks(sctx->state, buf, 1, force_generic, force_simd);
-
-	for (i = 0; i < digest_size; i += 4)
-		put_unaligned_be32(sctx->state[i / 4], out + i);
-}
-
-#endif /* _CRYPTO_INTERNAL_SHA2_H */
diff --git a/lib/crypto/Kconfig b/lib/crypto/Kconfig
index 9bd740475a898..3305c69085816 100644
--- a/lib/crypto/Kconfig
+++ b/lib/crypto/Kconfig
@@ -142,24 +142,21 @@ config CRYPTO_LIB_SHA256
 	help
 	  Enable the SHA-256 library interface. This interface may be fulfilled
 	  by either the generic implementation or an arch-specific one, if one
 	  is available and enabled.
 
-config CRYPTO_ARCH_HAVE_LIB_SHA256
+config CRYPTO_LIB_SHA256_ARCH
 	bool
-	help
-	  Declares whether the architecture provides an arch-specific
-	  accelerated implementation of the SHA-256 library interface.
-
-config CRYPTO_LIB_SHA256_GENERIC
-	tristate
-	default CRYPTO_LIB_SHA256 if !CRYPTO_ARCH_HAVE_LIB_SHA256
-	help
-	  This symbol can be selected by arch implementations of the SHA-256
-	  library interface that require the generic code as a fallback, e.g.,
-	  for SIMD implementations. If no arch specific implementation is
-	  enabled, this implementation serves the users of CRYPTO_LIB_SHA256.
+	depends on CRYPTO_LIB_SHA256 && !UML
+	default y if ARM && !CPU_V7M
+	default y if ARM64
+	default y if MIPS && CPU_CAVIUM_OCTEON
+	default y if PPC && SPE
+	default y if RISCV && 64BIT && RISCV_ISA_V && TOOLCHAIN_HAS_VECTOR_CRYPTO
+	default y if S390
+	default y if SPARC64
+	default y if X86_64
 
 config CRYPTO_LIB_SHA512
 	tristate
 	help
 	  The SHA-384, SHA-512, HMAC-SHA384, and HMAC-SHA512 library functions.
@@ -197,13 +194,10 @@ if RISCV
 source "lib/crypto/riscv/Kconfig"
 endif
 if S390
 source "lib/crypto/s390/Kconfig"
 endif
-if SPARC
-source "lib/crypto/sparc/Kconfig"
-endif
 if X86
 source "lib/crypto/x86/Kconfig"
 endif
 endif
 
diff --git a/lib/crypto/Makefile b/lib/crypto/Makefile
index 5823137fa5a8c..a887bf103bf05 100644
--- a/lib/crypto/Makefile
+++ b/lib/crypto/Makefile
@@ -64,15 +64,43 @@ libpoly1305-generic-$(CONFIG_ARCH_SUPPORTS_INT128) := poly1305-donna64.o
 libpoly1305-generic-y				+= poly1305-generic.o
 
 obj-$(CONFIG_CRYPTO_LIB_SHA1)			+= libsha1.o
 libsha1-y					:= sha1.o
 
-obj-$(CONFIG_CRYPTO_LIB_SHA256)			+= libsha256.o
-libsha256-y					:= sha256.o
+################################################################################
 
-obj-$(CONFIG_CRYPTO_LIB_SHA256_GENERIC)		+= libsha256-generic.o
-libsha256-generic-y				:= sha256-generic.o
+obj-$(CONFIG_CRYPTO_LIB_SHA256) += libsha256.o
+libsha256-y := sha256.o
+ifeq ($(CONFIG_CRYPTO_LIB_SHA256_ARCH),y)
+CFLAGS_sha256.o += -I$(src)/$(SRCARCH)
+
+ifeq ($(CONFIG_ARM),y)
+libsha256-y += arm/sha256-ce.o arm/sha256-core.o
+$(obj)/arm/sha256-core.S: $(src)/arm/sha256-armv4.pl
+	$(call cmd,perlasm)
+clean-files += arm/sha256-core.S
+AFLAGS_arm/sha256-core.o += $(aflags-thumb2-y)
+endif
+
+ifeq ($(CONFIG_ARM64),y)
+libsha256-y += arm64/sha256-core.o
+$(obj)/arm64/sha256-core.S: $(src)/arm64/sha2-armv8.pl
+	$(call cmd,perlasm_with_args)
+clean-files += arm64/sha256-core.S
+libsha256-$(CONFIG_KERNEL_MODE_NEON) += arm64/sha256-ce.o
+endif
+
+libsha256-$(CONFIG_PPC) += powerpc/sha256-spe-asm.o
+libsha256-$(CONFIG_RISCV) += riscv/sha256-riscv64-zvknha_or_zvknhb-zvkb.o
+libsha256-$(CONFIG_SPARC) += sparc/sha256_asm.o
+libsha256-$(CONFIG_X86) += x86/sha256-ssse3-asm.o \
+			   x86/sha256-avx-asm.o \
+			   x86/sha256-avx2-asm.o \
+			   x86/sha256-ni-asm.o
+endif # CONFIG_CRYPTO_LIB_SHA256_ARCH
+
+################################################################################
 
 obj-$(CONFIG_CRYPTO_LIB_SHA512) += libsha512.o
 libsha512-y := sha512.o
 ifeq ($(CONFIG_CRYPTO_LIB_SHA512_ARCH),y)
 CFLAGS_sha512.o += -I$(src)/$(SRCARCH)
@@ -98,10 +126,12 @@ libsha512-$(CONFIG_SPARC) += sparc/sha512_asm.o
 libsha512-$(CONFIG_X86) += x86/sha512-ssse3-asm.o \
 			   x86/sha512-avx-asm.o \
 			   x86/sha512-avx2-asm.o
 endif # CONFIG_CRYPTO_LIB_SHA512_ARCH
 
+################################################################################
+
 obj-$(CONFIG_MPILIB) += mpi/
 
 obj-$(CONFIG_CRYPTO_SELFTESTS_FULL)		+= simd.o
 
 obj-$(CONFIG_CRYPTO_LIB_SM3)			+= libsm3.o
@@ -111,7 +141,6 @@ obj-$(CONFIG_ARM) += arm/
 obj-$(CONFIG_ARM64) += arm64/
 obj-$(CONFIG_MIPS) += mips/
 obj-$(CONFIG_PPC) += powerpc/
 obj-$(CONFIG_RISCV) += riscv/
 obj-$(CONFIG_S390) += s390/
-obj-$(CONFIG_SPARC) += sparc/
 obj-$(CONFIG_X86) += x86/
diff --git a/lib/crypto/arm/Kconfig b/lib/crypto/arm/Kconfig
index 9f3ff30f40328..e8444fd0aae30 100644
--- a/lib/crypto/arm/Kconfig
+++ b/lib/crypto/arm/Kconfig
@@ -20,11 +20,5 @@ config CRYPTO_CHACHA20_NEON
 
 config CRYPTO_POLY1305_ARM
 	tristate
 	default CRYPTO_LIB_POLY1305
 	select CRYPTO_ARCH_HAVE_LIB_POLY1305
-
-config CRYPTO_SHA256_ARM
-	tristate
-	depends on !CPU_V7M
-	default CRYPTO_LIB_SHA256
-	select CRYPTO_ARCH_HAVE_LIB_SHA256
diff --git a/lib/crypto/arm/Makefile b/lib/crypto/arm/Makefile
index 431f77c3ff6fd..4c042a4c77ed6 100644
--- a/lib/crypto/arm/Makefile
+++ b/lib/crypto/arm/Makefile
@@ -8,25 +8,19 @@ chacha-neon-y := chacha-scalar-core.o chacha-glue.o
 chacha-neon-$(CONFIG_KERNEL_MODE_NEON) += chacha-neon-core.o
 
 obj-$(CONFIG_CRYPTO_POLY1305_ARM) += poly1305-arm.o
 poly1305-arm-y := poly1305-core.o poly1305-glue.o
 
-obj-$(CONFIG_CRYPTO_SHA256_ARM) += sha256-arm.o
-sha256-arm-y := sha256.o sha256-core.o
-sha256-arm-$(CONFIG_KERNEL_MODE_NEON) += sha256-ce.o
-
 quiet_cmd_perl = PERL    $@
       cmd_perl = $(PERL) $(<) > $(@)
 
 $(obj)/%-core.S: $(src)/%-armv4.pl
 	$(call cmd,perl)
 
-clean-files += poly1305-core.S sha256-core.S
+clean-files += poly1305-core.S
 
 aflags-thumb2-$(CONFIG_THUMB2_KERNEL)  := -U__thumb2__ -D__thumb2__=1
 
 # massage the perlasm code a bit so we only get the NEON routine if we need it
 poly1305-aflags-$(CONFIG_CPU_V7) := -U__LINUX_ARM_ARCH__ -D__LINUX_ARM_ARCH__=5
 poly1305-aflags-$(CONFIG_KERNEL_MODE_NEON) := -U__LINUX_ARM_ARCH__ -D__LINUX_ARM_ARCH__=7
 AFLAGS_poly1305-core.o += $(poly1305-aflags-y) $(aflags-thumb2-y)
-
-AFLAGS_sha256-core.o += $(aflags-thumb2-y)
diff --git a/lib/crypto/arm/sha256.c b/lib/crypto/arm/sha256.h
similarity index 64%
rename from lib/crypto/arm/sha256.c
rename to lib/crypto/arm/sha256.h
index 27181be0aa92e..da75cbdc51d41 100644
--- a/lib/crypto/arm/sha256.c
+++ b/lib/crypto/arm/sha256.h
@@ -1,16 +1,13 @@
-// SPDX-License-Identifier: GPL-2.0-or-later
+/* SPDX-License-Identifier: GPL-2.0-or-later */
 /*
  * SHA-256 optimized for ARM
  *
  * Copyright 2025 Google LLC
  */
 #include <asm/neon.h>
-#include <crypto/internal/sha2.h>
 #include <crypto/internal/simd.h>
-#include <linux/kernel.h>
-#include <linux/module.h>
 
 asmlinkage void sha256_block_data_order(struct sha256_block_state *state,
 					const u8 *data, size_t nblocks);
 asmlinkage void sha256_block_data_order_neon(struct sha256_block_state *state,
 					     const u8 *data, size_t nblocks);
@@ -18,12 +15,12 @@ asmlinkage void sha256_ce_transform(struct sha256_block_state *state,
 				    const u8 *data, size_t nblocks);
 
 static __ro_after_init DEFINE_STATIC_KEY_FALSE(have_neon);
 static __ro_after_init DEFINE_STATIC_KEY_FALSE(have_ce);
 
-void sha256_blocks_arch(struct sha256_block_state *state,
-			const u8 *data, size_t nblocks)
+static void sha256_blocks(struct sha256_block_state *state,
+			  const u8 *data, size_t nblocks)
 {
 	if (IS_ENABLED(CONFIG_KERNEL_MODE_NEON) &&
 	    static_branch_likely(&have_neon) && crypto_simd_usable()) {
 		kernel_neon_begin();
 		if (static_branch_likely(&have_ce))
@@ -33,25 +30,17 @@ void sha256_blocks_arch(struct sha256_block_state *state,
 		kernel_neon_end();
 	} else {
 		sha256_block_data_order(state, data, nblocks);
 	}
 }
-EXPORT_SYMBOL_GPL(sha256_blocks_arch);
 
-static int __init sha256_arm_mod_init(void)
+#ifdef CONFIG_KERNEL_MODE_NEON
+#define sha256_mod_init_arch sha256_mod_init_arch
+static inline void sha256_mod_init_arch(void)
 {
-	if (IS_ENABLED(CONFIG_KERNEL_MODE_NEON) && (elf_hwcap & HWCAP_NEON)) {
+	if (elf_hwcap & HWCAP_NEON) {
 		static_branch_enable(&have_neon);
 		if (elf_hwcap2 & HWCAP2_SHA2)
 			static_branch_enable(&have_ce);
 	}
-	return 0;
 }
-subsys_initcall(sha256_arm_mod_init);
-
-static void __exit sha256_arm_mod_exit(void)
-{
-}
-module_exit(sha256_arm_mod_exit);
-
-MODULE_LICENSE("GPL");
-MODULE_DESCRIPTION("SHA-256 optimized for ARM");
+#endif /* CONFIG_KERNEL_MODE_NEON */
diff --git a/lib/crypto/arm64/Kconfig b/lib/crypto/arm64/Kconfig
index 49e57bfdb5b52..0b903ef524d85 100644
--- a/lib/crypto/arm64/Kconfig
+++ b/lib/crypto/arm64/Kconfig
@@ -10,10 +10,5 @@ config CRYPTO_CHACHA20_NEON
 config CRYPTO_POLY1305_NEON
 	tristate
 	depends on KERNEL_MODE_NEON
 	default CRYPTO_LIB_POLY1305
 	select CRYPTO_ARCH_HAVE_LIB_POLY1305
-
-config CRYPTO_SHA256_ARM64
-	tristate
-	default CRYPTO_LIB_SHA256
-	select CRYPTO_ARCH_HAVE_LIB_SHA256
diff --git a/lib/crypto/arm64/Makefile b/lib/crypto/arm64/Makefile
index 946c099037117..6207088397a73 100644
--- a/lib/crypto/arm64/Makefile
+++ b/lib/crypto/arm64/Makefile
@@ -6,19 +6,12 @@ chacha-neon-y := chacha-neon-core.o chacha-neon-glue.o
 obj-$(CONFIG_CRYPTO_POLY1305_NEON) += poly1305-neon.o
 poly1305-neon-y := poly1305-core.o poly1305-glue.o
 AFLAGS_poly1305-core.o += -Dpoly1305_init=poly1305_block_init_arch
 AFLAGS_poly1305-core.o += -Dpoly1305_emit=poly1305_emit_arch
 
-obj-$(CONFIG_CRYPTO_SHA256_ARM64) += sha256-arm64.o
-sha256-arm64-y := sha256.o sha256-core.o
-sha256-arm64-$(CONFIG_KERNEL_MODE_NEON) += sha256-ce.o
-
 quiet_cmd_perlasm = PERLASM $@
       cmd_perlasm = $(PERL) $(<) void $(@)
 
 $(obj)/%-core.S: $(src)/%-armv8.pl
 	$(call cmd,perlasm)
 
-$(obj)/sha256-core.S: $(src)/sha2-armv8.pl
-	$(call cmd,perlasm)
-
-clean-files += poly1305-core.S sha256-core.S
+clean-files += poly1305-core.S
diff --git a/lib/crypto/arm64/sha256.c b/lib/crypto/arm64/sha256.h
similarity index 67%
rename from lib/crypto/arm64/sha256.c
rename to lib/crypto/arm64/sha256.h
index a5a4982767089..a211966c124a9 100644
--- a/lib/crypto/arm64/sha256.c
+++ b/lib/crypto/arm64/sha256.h
@@ -1,16 +1,14 @@
-// SPDX-License-Identifier: GPL-2.0-or-later
+/* SPDX-License-Identifier: GPL-2.0-or-later */
 /*
  * SHA-256 optimized for ARM64
  *
  * Copyright 2025 Google LLC
  */
 #include <asm/neon.h>
-#include <crypto/internal/sha2.h>
 #include <crypto/internal/simd.h>
-#include <linux/kernel.h>
-#include <linux/module.h>
+#include <linux/cpufeature.h>
 
 asmlinkage void sha256_block_data_order(struct sha256_block_state *state,
 					const u8 *data, size_t nblocks);
 asmlinkage void sha256_block_neon(struct sha256_block_state *state,
 				  const u8 *data, size_t nblocks);
@@ -18,12 +16,12 @@ asmlinkage size_t __sha256_ce_transform(struct sha256_block_state *state,
 					const u8 *data, size_t nblocks);
 
 static __ro_after_init DEFINE_STATIC_KEY_FALSE(have_neon);
 static __ro_after_init DEFINE_STATIC_KEY_FALSE(have_ce);
 
-void sha256_blocks_arch(struct sha256_block_state *state,
-			const u8 *data, size_t nblocks)
+static void sha256_blocks(struct sha256_block_state *state,
+			  const u8 *data, size_t nblocks)
 {
 	if (IS_ENABLED(CONFIG_KERNEL_MODE_NEON) &&
 	    static_branch_likely(&have_neon) && crypto_simd_usable()) {
 		if (static_branch_likely(&have_ce)) {
 			do {
@@ -43,26 +41,17 @@ void sha256_blocks_arch(struct sha256_block_state *state,
 		}
 	} else {
 		sha256_block_data_order(state, data, nblocks);
 	}
 }
-EXPORT_SYMBOL_GPL(sha256_blocks_arch);
 
-static int __init sha256_arm64_mod_init(void)
+#ifdef CONFIG_KERNEL_MODE_NEON
+#define sha256_mod_init_arch sha256_mod_init_arch
+static inline void sha256_mod_init_arch(void)
 {
-	if (IS_ENABLED(CONFIG_KERNEL_MODE_NEON) &&
-	    cpu_have_named_feature(ASIMD)) {
+	if (cpu_have_named_feature(ASIMD)) {
 		static_branch_enable(&have_neon);
 		if (cpu_have_named_feature(SHA2))
 			static_branch_enable(&have_ce);
 	}
-	return 0;
 }
-subsys_initcall(sha256_arm64_mod_init);
-
-static void __exit sha256_arm64_mod_exit(void)
-{
-}
-module_exit(sha256_arm64_mod_exit);
-
-MODULE_LICENSE("GPL");
-MODULE_DESCRIPTION("SHA-256 optimized for ARM64");
+#endif /* CONFIG_KERNEL_MODE_NEON */
diff --git a/arch/mips/cavium-octeon/crypto/octeon-sha256.c b/lib/crypto/mips/sha256.h
similarity index 80%
rename from arch/mips/cavium-octeon/crypto/octeon-sha256.c
rename to lib/crypto/mips/sha256.h
index c7c67bdc2bd06..ccccfd131634b 100644
--- a/arch/mips/cavium-octeon/crypto/octeon-sha256.c
+++ b/lib/crypto/mips/sha256.h
@@ -1,6 +1,6 @@
-// SPDX-License-Identifier: GPL-2.0-or-later
+/* SPDX-License-Identifier: GPL-2.0-or-later */
 /*
  * SHA-256 Secure Hash Algorithm.
  *
  * Adapted for OCTEON by Aaro Koskinen <aaro.koskinen@iki.fi>.
  *
@@ -12,20 +12,17 @@
  * SHA224 Support Copyright 2007 Intel Corporation <jonathan.lynch@intel.com>
  */
 
 #include <asm/octeon/crypto.h>
 #include <asm/octeon/octeon.h>
-#include <crypto/internal/sha2.h>
-#include <linux/kernel.h>
-#include <linux/module.h>
 
 /*
  * We pass everything as 64-bit. OCTEON can handle misaligned data.
  */
 
-void sha256_blocks_arch(struct sha256_block_state *state,
-			const u8 *data, size_t nblocks)
+static void sha256_blocks(struct sha256_block_state *state,
+			  const u8 *data, size_t nblocks)
 {
 	struct octeon_cop2_state cop2_state;
 	u64 *state64 = (u64 *)state;
 	unsigned long flags;
 
@@ -57,10 +54,5 @@ void sha256_blocks_arch(struct sha256_block_state *state,
 	state64[1] = read_octeon_64bit_hash_dword(1);
 	state64[2] = read_octeon_64bit_hash_dword(2);
 	state64[3] = read_octeon_64bit_hash_dword(3);
 	octeon_crypto_disable(&cop2_state, flags);
 }
-EXPORT_SYMBOL_GPL(sha256_blocks_arch);
-
-MODULE_LICENSE("GPL");
-MODULE_DESCRIPTION("SHA-256 Secure Hash Algorithm (OCTEON)");
-MODULE_AUTHOR("Aaro Koskinen <aaro.koskinen@iki.fi>");
diff --git a/lib/crypto/powerpc/Kconfig b/lib/crypto/powerpc/Kconfig
index 3f9e1bbd9905b..2eaeb7665a6a0 100644
--- a/lib/crypto/powerpc/Kconfig
+++ b/lib/crypto/powerpc/Kconfig
@@ -12,11 +12,5 @@ config CRYPTO_POLY1305_P10
 	depends on PPC64 && CPU_LITTLE_ENDIAN && VSX
 	depends on BROKEN # Needs to be fixed to work in softirq context
 	default CRYPTO_LIB_POLY1305
 	select CRYPTO_ARCH_HAVE_LIB_POLY1305
 	select CRYPTO_LIB_POLY1305_GENERIC
-
-config CRYPTO_SHA256_PPC_SPE
-	tristate
-	depends on SPE
-	default CRYPTO_LIB_SHA256
-	select CRYPTO_ARCH_HAVE_LIB_SHA256
diff --git a/lib/crypto/powerpc/Makefile b/lib/crypto/powerpc/Makefile
index 27f231f8e334a..5709ae14258a0 100644
--- a/lib/crypto/powerpc/Makefile
+++ b/lib/crypto/powerpc/Makefile
@@ -3,8 +3,5 @@
 obj-$(CONFIG_CRYPTO_CHACHA20_P10) += chacha-p10-crypto.o
 chacha-p10-crypto-y := chacha-p10-glue.o chacha-p10le-8x.o
 
 obj-$(CONFIG_CRYPTO_POLY1305_P10) += poly1305-p10-crypto.o
 poly1305-p10-crypto-y := poly1305-p10-glue.o poly1305-p10le_64.o
-
-obj-$(CONFIG_CRYPTO_SHA256_PPC_SPE) += sha256-ppc-spe.o
-sha256-ppc-spe-y := sha256.o sha256-spe-asm.o
diff --git a/lib/crypto/powerpc/sha256.c b/lib/crypto/powerpc/sha256.h
similarity index 80%
rename from lib/crypto/powerpc/sha256.c
rename to lib/crypto/powerpc/sha256.h
index 437e587b05754..d923698de5745 100644
--- a/lib/crypto/powerpc/sha256.c
+++ b/lib/crypto/powerpc/sha256.h
@@ -1,19 +1,16 @@
-// SPDX-License-Identifier: GPL-2.0-or-later
+/* SPDX-License-Identifier: GPL-2.0-or-later */
 /*
  * SHA-256 Secure Hash Algorithm, SPE optimized
  *
  * Based on generic implementation. The assembler module takes care
  * about the SPE registers so it can run from interrupt context.
  *
  * Copyright (c) 2015 Markus Stockhausen <stockhausen@collogia.de>
  */
 
 #include <asm/switch_to.h>
-#include <crypto/internal/sha2.h>
-#include <linux/kernel.h>
-#include <linux/module.h>
 #include <linux/preempt.h>
 
 /*
  * MAX_BYTES defines the number of bytes that are allowed to be processed
  * between preempt_disable() and preempt_enable(). SHA256 takes ~2,000
@@ -40,12 +37,12 @@ static void spe_end(void)
 	disable_kernel_spe();
 	/* reenable preemption */
 	preempt_enable();
 }
 
-void sha256_blocks_arch(struct sha256_block_state *state,
-			const u8 *data, size_t nblocks)
+static void sha256_blocks(struct sha256_block_state *state,
+			  const u8 *data, size_t nblocks)
 {
 	do {
 		/* cut input data into smaller blocks */
 		u32 unit = min_t(size_t, nblocks,
 				 MAX_BYTES / SHA256_BLOCK_SIZE);
@@ -56,9 +53,5 @@ void sha256_blocks_arch(struct sha256_block_state *state,
 
 		data += unit * SHA256_BLOCK_SIZE;
 		nblocks -= unit;
 	} while (nblocks);
 }
-EXPORT_SYMBOL_GPL(sha256_blocks_arch);
-
-MODULE_LICENSE("GPL");
-MODULE_DESCRIPTION("SHA-256 Secure Hash Algorithm, SPE optimized");
diff --git a/lib/crypto/riscv/Kconfig b/lib/crypto/riscv/Kconfig
index c100571feb7e8..bc7a43f33eb3a 100644
--- a/lib/crypto/riscv/Kconfig
+++ b/lib/crypto/riscv/Kconfig
@@ -4,12 +4,5 @@ config CRYPTO_CHACHA_RISCV64
 	tristate
 	depends on 64BIT && RISCV_ISA_V && TOOLCHAIN_HAS_VECTOR_CRYPTO
 	default CRYPTO_LIB_CHACHA
 	select CRYPTO_ARCH_HAVE_LIB_CHACHA
 	select CRYPTO_LIB_CHACHA_GENERIC
-
-config CRYPTO_SHA256_RISCV64
-	tristate
-	depends on 64BIT && RISCV_ISA_V && TOOLCHAIN_HAS_VECTOR_CRYPTO
-	default CRYPTO_LIB_SHA256
-	select CRYPTO_ARCH_HAVE_LIB_SHA256
-	select CRYPTO_LIB_SHA256_GENERIC
diff --git a/lib/crypto/riscv/Makefile b/lib/crypto/riscv/Makefile
index b7cb877a2c07e..e27b78f317fc8 100644
--- a/lib/crypto/riscv/Makefile
+++ b/lib/crypto/riscv/Makefile
@@ -1,7 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0-only
 
 obj-$(CONFIG_CRYPTO_CHACHA_RISCV64) += chacha-riscv64.o
 chacha-riscv64-y := chacha-riscv64-glue.o chacha-riscv64-zvkb.o
-
-obj-$(CONFIG_CRYPTO_SHA256_RISCV64) += sha256-riscv64.o
-sha256-riscv64-y := sha256.o sha256-riscv64-zvknha_or_zvknhb-zvkb.o
diff --git a/lib/crypto/riscv/sha256.c b/lib/crypto/riscv/sha256.h
similarity index 63%
rename from lib/crypto/riscv/sha256.c
rename to lib/crypto/riscv/sha256.h
index 01004cb9c6e9e..c0f79c18f1199 100644
--- a/lib/crypto/riscv/sha256.c
+++ b/lib/crypto/riscv/sha256.h
@@ -1,6 +1,6 @@
-// SPDX-License-Identifier: GPL-2.0-or-later
+/* SPDX-License-Identifier: GPL-2.0-or-later */
 /*
  * SHA-256 (RISC-V accelerated)
  *
  * Copyright (C) 2022 VRULL GmbH
  * Author: Heiko Stuebner <heiko.stuebner@vrull.eu>
@@ -8,49 +8,35 @@
  * Copyright (C) 2023 SiFive, Inc.
  * Author: Jerry Shih <jerry.shih@sifive.com>
  */
 
 #include <asm/vector.h>
-#include <crypto/internal/sha2.h>
 #include <crypto/internal/simd.h>
-#include <linux/kernel.h>
-#include <linux/module.h>
 
 asmlinkage void
 sha256_transform_zvknha_or_zvknhb_zvkb(struct sha256_block_state *state,
 				       const u8 *data, size_t nblocks);
 
 static __ro_after_init DEFINE_STATIC_KEY_FALSE(have_extensions);
 
-void sha256_blocks_arch(struct sha256_block_state *state,
-			const u8 *data, size_t nblocks)
+static void sha256_blocks(struct sha256_block_state *state,
+			  const u8 *data, size_t nblocks)
 {
 	if (static_branch_likely(&have_extensions) && crypto_simd_usable()) {
 		kernel_vector_begin();
 		sha256_transform_zvknha_or_zvknhb_zvkb(state, data, nblocks);
 		kernel_vector_end();
 	} else {
 		sha256_blocks_generic(state, data, nblocks);
 	}
 }
-EXPORT_SYMBOL_GPL(sha256_blocks_arch);
 
-static int __init riscv64_sha256_mod_init(void)
+#define sha256_mod_init_arch sha256_mod_init_arch
+static inline void sha256_mod_init_arch(void)
 {
 	/* Both zvknha and zvknhb provide the SHA-256 instructions. */
 	if ((riscv_isa_extension_available(NULL, ZVKNHA) ||
 	     riscv_isa_extension_available(NULL, ZVKNHB)) &&
 	    riscv_isa_extension_available(NULL, ZVKB) &&
 	    riscv_vector_vlen() >= 128)
 		static_branch_enable(&have_extensions);
-	return 0;
 }
-subsys_initcall(riscv64_sha256_mod_init);
-
-static void __exit riscv64_sha256_mod_exit(void)
-{
-}
-module_exit(riscv64_sha256_mod_exit);
-
-MODULE_DESCRIPTION("SHA-256 (RISC-V accelerated)");
-MODULE_AUTHOR("Heiko Stuebner <heiko.stuebner@vrull.eu>");
-MODULE_LICENSE("GPL");
diff --git a/lib/crypto/s390/Kconfig b/lib/crypto/s390/Kconfig
index e3f855ef43934..069b355fe51aa 100644
--- a/lib/crypto/s390/Kconfig
+++ b/lib/crypto/s390/Kconfig
@@ -3,11 +3,5 @@
 config CRYPTO_CHACHA_S390
 	tristate
 	default CRYPTO_LIB_CHACHA
 	select CRYPTO_LIB_CHACHA_GENERIC
 	select CRYPTO_ARCH_HAVE_LIB_CHACHA
-
-config CRYPTO_SHA256_S390
-	tristate
-	default CRYPTO_LIB_SHA256
-	select CRYPTO_ARCH_HAVE_LIB_SHA256
-	select CRYPTO_LIB_SHA256_GENERIC
diff --git a/lib/crypto/s390/Makefile b/lib/crypto/s390/Makefile
index 5df30f1e79307..06c2cf77178ef 100644
--- a/lib/crypto/s390/Makefile
+++ b/lib/crypto/s390/Makefile
@@ -1,7 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0-only
 
 obj-$(CONFIG_CRYPTO_CHACHA_S390) += chacha_s390.o
 chacha_s390-y := chacha-glue.o chacha-s390.o
-
-obj-$(CONFIG_CRYPTO_SHA256_S390) += sha256-s390.o
-sha256-s390-y := sha256.o
diff --git a/lib/crypto/s390/sha256.c b/lib/crypto/s390/sha256.h
similarity index 50%
rename from lib/crypto/s390/sha256.c
rename to lib/crypto/s390/sha256.h
index 6ebfd35a5d44c..70a81cbc06b2c 100644
--- a/lib/crypto/s390/sha256.c
+++ b/lib/crypto/s390/sha256.h
@@ -1,41 +1,28 @@
-// SPDX-License-Identifier: GPL-2.0-or-later
+/* SPDX-License-Identifier: GPL-2.0-or-later */
 /*
  * SHA-256 optimized using the CP Assist for Cryptographic Functions (CPACF)
  *
  * Copyright 2025 Google LLC
  */
 #include <asm/cpacf.h>
-#include <crypto/internal/sha2.h>
 #include <linux/cpufeature.h>
-#include <linux/kernel.h>
-#include <linux/module.h>
 
 static __ro_after_init DEFINE_STATIC_KEY_FALSE(have_cpacf_sha256);
 
-void sha256_blocks_arch(struct sha256_block_state *state,
-			const u8 *data, size_t nblocks)
+static void sha256_blocks(struct sha256_block_state *state,
+			  const u8 *data, size_t nblocks)
 {
 	if (static_branch_likely(&have_cpacf_sha256))
 		cpacf_kimd(CPACF_KIMD_SHA_256, state, data,
 			   nblocks * SHA256_BLOCK_SIZE);
 	else
 		sha256_blocks_generic(state, data, nblocks);
 }
-EXPORT_SYMBOL_GPL(sha256_blocks_arch);
 
-static int __init sha256_s390_mod_init(void)
+#define sha256_mod_init_arch sha256_mod_init_arch
+static inline void sha256_mod_init_arch(void)
 {
 	if (cpu_have_feature(S390_CPU_FEATURE_MSA) &&
 	    cpacf_query_func(CPACF_KIMD, CPACF_KIMD_SHA_256))
 		static_branch_enable(&have_cpacf_sha256);
-	return 0;
 }
-subsys_initcall(sha256_s390_mod_init);
-
-static void __exit sha256_s390_mod_exit(void)
-{
-}
-module_exit(sha256_s390_mod_exit);
-
-MODULE_LICENSE("GPL");
-MODULE_DESCRIPTION("SHA-256 using the CP Assist for Cryptographic Functions (CPACF)");
diff --git a/lib/crypto/sha256-generic.c b/lib/crypto/sha256-generic.c
deleted file mode 100644
index 99f904033c261..0000000000000
--- a/lib/crypto/sha256-generic.c
+++ /dev/null
@@ -1,150 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-or-later
-/*
- * SHA-256, as specified in
- * http://csrc.nist.gov/groups/STM/cavp/documents/shs/sha256-384-512.pdf
- *
- * SHA-256 code by Jean-Luc Cooke <jlcooke@certainkey.com>.
- *
- * Copyright (c) Jean-Luc Cooke <jlcooke@certainkey.com>
- * Copyright (c) Andrew McDonald <andrew@mcdonald.org.uk>
- * Copyright (c) 2002 James Morris <jmorris@intercode.com.au>
- * Copyright (c) 2014 Red Hat Inc.
- */
-
-#include <crypto/internal/sha2.h>
-#include <linux/export.h>
-#include <linux/kernel.h>
-#include <linux/module.h>
-#include <linux/string.h>
-#include <linux/unaligned.h>
-
-static const u32 SHA256_K[] = {
-	0x428a2f98, 0x71374491, 0xb5c0fbcf, 0xe9b5dba5,
-	0x3956c25b, 0x59f111f1, 0x923f82a4, 0xab1c5ed5,
-	0xd807aa98, 0x12835b01, 0x243185be, 0x550c7dc3,
-	0x72be5d74, 0x80deb1fe, 0x9bdc06a7, 0xc19bf174,
-	0xe49b69c1, 0xefbe4786, 0x0fc19dc6, 0x240ca1cc,
-	0x2de92c6f, 0x4a7484aa, 0x5cb0a9dc, 0x76f988da,
-	0x983e5152, 0xa831c66d, 0xb00327c8, 0xbf597fc7,
-	0xc6e00bf3, 0xd5a79147, 0x06ca6351, 0x14292967,
-	0x27b70a85, 0x2e1b2138, 0x4d2c6dfc, 0x53380d13,
-	0x650a7354, 0x766a0abb, 0x81c2c92e, 0x92722c85,
-	0xa2bfe8a1, 0xa81a664b, 0xc24b8b70, 0xc76c51a3,
-	0xd192e819, 0xd6990624, 0xf40e3585, 0x106aa070,
-	0x19a4c116, 0x1e376c08, 0x2748774c, 0x34b0bcb5,
-	0x391c0cb3, 0x4ed8aa4a, 0x5b9cca4f, 0x682e6ff3,
-	0x748f82ee, 0x78a5636f, 0x84c87814, 0x8cc70208,
-	0x90befffa, 0xa4506ceb, 0xbef9a3f7, 0xc67178f2,
-};
-
-static inline u32 Ch(u32 x, u32 y, u32 z)
-{
-	return z ^ (x & (y ^ z));
-}
-
-static inline u32 Maj(u32 x, u32 y, u32 z)
-{
-	return (x & y) | (z & (x | y));
-}
-
-#define e0(x)       (ror32(x, 2) ^ ror32(x, 13) ^ ror32(x, 22))
-#define e1(x)       (ror32(x, 6) ^ ror32(x, 11) ^ ror32(x, 25))
-#define s0(x)       (ror32(x, 7) ^ ror32(x, 18) ^ (x >> 3))
-#define s1(x)       (ror32(x, 17) ^ ror32(x, 19) ^ (x >> 10))
-
-static inline void LOAD_OP(int I, u32 *W, const u8 *input)
-{
-	W[I] = get_unaligned_be32((__u32 *)input + I);
-}
-
-static inline void BLEND_OP(int I, u32 *W)
-{
-	W[I] = s1(W[I-2]) + W[I-7] + s0(W[I-15]) + W[I-16];
-}
-
-#define SHA256_ROUND(i, a, b, c, d, e, f, g, h) do {		\
-	u32 t1, t2;						\
-	t1 = h + e1(e) + Ch(e, f, g) + SHA256_K[i] + W[i];	\
-	t2 = e0(a) + Maj(a, b, c);				\
-	d += t1;						\
-	h = t1 + t2;						\
-} while (0)
-
-static void sha256_block_generic(struct sha256_block_state *state,
-				 const u8 *input, u32 W[64])
-{
-	u32 a, b, c, d, e, f, g, h;
-	int i;
-
-	/* load the input */
-	for (i = 0; i < 16; i += 8) {
-		LOAD_OP(i + 0, W, input);
-		LOAD_OP(i + 1, W, input);
-		LOAD_OP(i + 2, W, input);
-		LOAD_OP(i + 3, W, input);
-		LOAD_OP(i + 4, W, input);
-		LOAD_OP(i + 5, W, input);
-		LOAD_OP(i + 6, W, input);
-		LOAD_OP(i + 7, W, input);
-	}
-
-	/* now blend */
-	for (i = 16; i < 64; i += 8) {
-		BLEND_OP(i + 0, W);
-		BLEND_OP(i + 1, W);
-		BLEND_OP(i + 2, W);
-		BLEND_OP(i + 3, W);
-		BLEND_OP(i + 4, W);
-		BLEND_OP(i + 5, W);
-		BLEND_OP(i + 6, W);
-		BLEND_OP(i + 7, W);
-	}
-
-	/* load the state into our registers */
-	a = state->h[0];
-	b = state->h[1];
-	c = state->h[2];
-	d = state->h[3];
-	e = state->h[4];
-	f = state->h[5];
-	g = state->h[6];
-	h = state->h[7];
-
-	/* now iterate */
-	for (i = 0; i < 64; i += 8) {
-		SHA256_ROUND(i + 0, a, b, c, d, e, f, g, h);
-		SHA256_ROUND(i + 1, h, a, b, c, d, e, f, g);
-		SHA256_ROUND(i + 2, g, h, a, b, c, d, e, f);
-		SHA256_ROUND(i + 3, f, g, h, a, b, c, d, e);
-		SHA256_ROUND(i + 4, e, f, g, h, a, b, c, d);
-		SHA256_ROUND(i + 5, d, e, f, g, h, a, b, c);
-		SHA256_ROUND(i + 6, c, d, e, f, g, h, a, b);
-		SHA256_ROUND(i + 7, b, c, d, e, f, g, h, a);
-	}
-
-	state->h[0] += a;
-	state->h[1] += b;
-	state->h[2] += c;
-	state->h[3] += d;
-	state->h[4] += e;
-	state->h[5] += f;
-	state->h[6] += g;
-	state->h[7] += h;
-}
-
-void sha256_blocks_generic(struct sha256_block_state *state,
-			   const u8 *data, size_t nblocks)
-{
-	u32 W[64];
-
-	do {
-		sha256_block_generic(state, data, W);
-		data += SHA256_BLOCK_SIZE;
-	} while (--nblocks);
-
-	memzero_explicit(W, sizeof(W));
-}
-EXPORT_SYMBOL_GPL(sha256_blocks_generic);
-
-MODULE_DESCRIPTION("SHA-256 Algorithm (generic implementation)");
-MODULE_LICENSE("GPL");
diff --git a/lib/crypto/sha256.c b/lib/crypto/sha256.c
index 12b4b59052c4a..68936d5cd7745 100644
--- a/lib/crypto/sha256.c
+++ b/lib/crypto/sha256.c
@@ -4,19 +4,21 @@
  *
  * Copyright (c) Jean-Luc Cooke <jlcooke@certainkey.com>
  * Copyright (c) Andrew McDonald <andrew@mcdonald.org.uk>
  * Copyright (c) 2002 James Morris <jmorris@intercode.com.au>
  * Copyright (c) 2014 Red Hat Inc.
+ * Copyright 2025 Google LLC
  */
 
 #include <crypto/hmac.h>
 #include <crypto/internal/blockhash.h>
-#include <crypto/internal/sha2.h>
+#include <crypto/sha2.h>
 #include <linux/export.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/string.h>
+#include <linux/unaligned.h>
 #include <linux/wordpart.h>
 
 static const struct sha256_block_state sha224_iv = {
 	.h = {
 		SHA224_H0, SHA224_H1, SHA224_H2, SHA224_H3,
@@ -29,30 +31,132 @@ static const struct sha256_block_state sha256_iv = {
 		SHA256_H0, SHA256_H1, SHA256_H2, SHA256_H3,
 		SHA256_H4, SHA256_H5, SHA256_H6, SHA256_H7,
 	},
 };
 
-/*
- * If __DISABLE_EXPORTS is defined, then this file is being compiled for a
- * pre-boot environment.  In that case, ignore the kconfig options, pull the
- * generic code into the same translation unit, and use that only.
- */
-#ifdef __DISABLE_EXPORTS
-#include "sha256-generic.c"
-#endif
+static const u32 sha256_K[64] = {
+	0x428a2f98, 0x71374491, 0xb5c0fbcf, 0xe9b5dba5, 0x3956c25b, 0x59f111f1,
+	0x923f82a4, 0xab1c5ed5, 0xd807aa98, 0x12835b01, 0x243185be, 0x550c7dc3,
+	0x72be5d74, 0x80deb1fe, 0x9bdc06a7, 0xc19bf174, 0xe49b69c1, 0xefbe4786,
+	0x0fc19dc6, 0x240ca1cc, 0x2de92c6f, 0x4a7484aa, 0x5cb0a9dc, 0x76f988da,
+	0x983e5152, 0xa831c66d, 0xb00327c8, 0xbf597fc7, 0xc6e00bf3, 0xd5a79147,
+	0x06ca6351, 0x14292967, 0x27b70a85, 0x2e1b2138, 0x4d2c6dfc, 0x53380d13,
+	0x650a7354, 0x766a0abb, 0x81c2c92e, 0x92722c85, 0xa2bfe8a1, 0xa81a664b,
+	0xc24b8b70, 0xc76c51a3, 0xd192e819, 0xd6990624, 0xf40e3585, 0x106aa070,
+	0x19a4c116, 0x1e376c08, 0x2748774c, 0x34b0bcb5, 0x391c0cb3, 0x4ed8aa4a,
+	0x5b9cca4f, 0x682e6ff3, 0x748f82ee, 0x78a5636f, 0x84c87814, 0x8cc70208,
+	0x90befffa, 0xa4506ceb, 0xbef9a3f7, 0xc67178f2,
+};
+
+#define Ch(x, y, z) ((z) ^ ((x) & ((y) ^ (z))))
+#define Maj(x, y, z) (((x) & (y)) | ((z) & ((x) | (y))))
+#define e0(x) (ror32((x), 2) ^ ror32((x), 13) ^ ror32((x), 22))
+#define e1(x) (ror32((x), 6) ^ ror32((x), 11) ^ ror32((x), 25))
+#define s0(x) (ror32((x), 7) ^ ror32((x), 18) ^ ((x) >> 3))
+#define s1(x) (ror32((x), 17) ^ ror32((x), 19) ^ ((x) >> 10))
+
+static inline void LOAD_OP(int I, u32 *W, const u8 *input)
+{
+	W[I] = get_unaligned_be32((__u32 *)input + I);
+}
+
+static inline void BLEND_OP(int I, u32 *W)
+{
+	W[I] = s1(W[I - 2]) + W[I - 7] + s0(W[I - 15]) + W[I - 16];
+}
 
-static inline bool sha256_purgatory(void)
+#define SHA256_ROUND(i, a, b, c, d, e, f, g, h)                    \
+	do {                                                       \
+		u32 t1, t2;                                        \
+		t1 = h + e1(e) + Ch(e, f, g) + sha256_K[i] + W[i]; \
+		t2 = e0(a) + Maj(a, b, c);                         \
+		d += t1;                                           \
+		h = t1 + t2;                                       \
+	} while (0)
+
+static void sha256_block_generic(struct sha256_block_state *state,
+				 const u8 *input, u32 W[64])
 {
-	return __is_defined(__DISABLE_EXPORTS);
+	u32 a, b, c, d, e, f, g, h;
+	int i;
+
+	/* load the input */
+	for (i = 0; i < 16; i += 8) {
+		LOAD_OP(i + 0, W, input);
+		LOAD_OP(i + 1, W, input);
+		LOAD_OP(i + 2, W, input);
+		LOAD_OP(i + 3, W, input);
+		LOAD_OP(i + 4, W, input);
+		LOAD_OP(i + 5, W, input);
+		LOAD_OP(i + 6, W, input);
+		LOAD_OP(i + 7, W, input);
+	}
+
+	/* now blend */
+	for (i = 16; i < 64; i += 8) {
+		BLEND_OP(i + 0, W);
+		BLEND_OP(i + 1, W);
+		BLEND_OP(i + 2, W);
+		BLEND_OP(i + 3, W);
+		BLEND_OP(i + 4, W);
+		BLEND_OP(i + 5, W);
+		BLEND_OP(i + 6, W);
+		BLEND_OP(i + 7, W);
+	}
+
+	/* load the state into our registers */
+	a = state->h[0];
+	b = state->h[1];
+	c = state->h[2];
+	d = state->h[3];
+	e = state->h[4];
+	f = state->h[5];
+	g = state->h[6];
+	h = state->h[7];
+
+	/* now iterate */
+	for (i = 0; i < 64; i += 8) {
+		SHA256_ROUND(i + 0, a, b, c, d, e, f, g, h);
+		SHA256_ROUND(i + 1, h, a, b, c, d, e, f, g);
+		SHA256_ROUND(i + 2, g, h, a, b, c, d, e, f);
+		SHA256_ROUND(i + 3, f, g, h, a, b, c, d, e);
+		SHA256_ROUND(i + 4, e, f, g, h, a, b, c, d);
+		SHA256_ROUND(i + 5, d, e, f, g, h, a, b, c);
+		SHA256_ROUND(i + 6, c, d, e, f, g, h, a, b);
+		SHA256_ROUND(i + 7, b, c, d, e, f, g, h, a);
+	}
+
+	state->h[0] += a;
+	state->h[1] += b;
+	state->h[2] += c;
+	state->h[3] += d;
+	state->h[4] += e;
+	state->h[5] += f;
+	state->h[6] += g;
+	state->h[7] += h;
 }
 
-static inline void sha256_blocks(struct sha256_block_state *state,
-				 const u8 *data, size_t nblocks)
+static void __maybe_unused
+sha256_blocks_generic(struct sha256_block_state *state,
+		      const u8 *data, size_t nblocks)
 {
-	sha256_choose_blocks(state->h, data, nblocks, sha256_purgatory(), false);
+	u32 W[64];
+
+	do {
+		sha256_block_generic(state, data, W);
+		data += SHA256_BLOCK_SIZE;
+	} while (--nblocks);
+
+	memzero_explicit(W, sizeof(W));
 }
 
+#if defined(CONFIG_CRYPTO_LIB_SHA256_ARCH) && !defined(__DISABLE_EXPORTS)
+#include "sha256.h" /* $(SRCARCH)/sha256.h */
+#else
+#define sha256_blocks sha256_blocks_generic
+#endif
+
 static void __sha256_init(struct __sha256_ctx *ctx,
 			  const struct sha256_block_state *iv,
 			  u64 initial_bytecount)
 {
 	ctx->state = *iv;
@@ -271,7 +375,21 @@ void hmac_sha256_usingrawkey(const u8 *raw_key, size_t raw_key_len,
 	memzero_explicit(&key, sizeof(key));
 }
 EXPORT_SYMBOL_GPL(hmac_sha256_usingrawkey);
 #endif /* !__DISABLE_EXPORTS */
 
+#ifdef sha256_mod_init_arch
+static int __init sha256_mod_init(void)
+{
+	sha256_mod_init_arch();
+	return 0;
+}
+subsys_initcall(sha256_mod_init);
+
+static void __exit sha256_mod_exit(void)
+{
+}
+module_exit(sha256_mod_exit);
+#endif
+
 MODULE_DESCRIPTION("SHA-224, SHA-256, HMAC-SHA224, and HMAC-SHA256 library functions");
 MODULE_LICENSE("GPL");
diff --git a/lib/crypto/sparc/Kconfig b/lib/crypto/sparc/Kconfig
deleted file mode 100644
index e5c3e4d3dba62..0000000000000
--- a/lib/crypto/sparc/Kconfig
+++ /dev/null
@@ -1,8 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0-only
-
-config CRYPTO_SHA256_SPARC64
-	tristate
-	depends on SPARC64
-	default CRYPTO_LIB_SHA256
-	select CRYPTO_ARCH_HAVE_LIB_SHA256
-	select CRYPTO_LIB_SHA256_GENERIC
diff --git a/lib/crypto/sparc/Makefile b/lib/crypto/sparc/Makefile
deleted file mode 100644
index 75ee244ad6f79..0000000000000
--- a/lib/crypto/sparc/Makefile
+++ /dev/null
@@ -1,4 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0-only
-
-obj-$(CONFIG_CRYPTO_SHA256_SPARC64) += sha256-sparc64.o
-sha256-sparc64-y := sha256.o sha256_asm.o
diff --git a/lib/crypto/sparc/sha256.c b/lib/crypto/sparc/sha256.h
similarity index 62%
rename from lib/crypto/sparc/sha256.c
rename to lib/crypto/sparc/sha256.h
index f41c109c1c18d..1d10108eb1954 100644
--- a/lib/crypto/sparc/sha256.c
+++ b/lib/crypto/sparc/sha256.h
@@ -1,58 +1,43 @@
-// SPDX-License-Identifier: GPL-2.0-only
+/* SPDX-License-Identifier: GPL-2.0-only */
 /*
  * SHA-256 accelerated using the sparc64 sha256 opcodes
  *
  * Copyright (c) Jean-Luc Cooke <jlcooke@certainkey.com>
  * Copyright (c) Andrew McDonald <andrew@mcdonald.org.uk>
  * Copyright (c) 2002 James Morris <jmorris@intercode.com.au>
  * SHA224 Support Copyright 2007 Intel Corporation <jonathan.lynch@intel.com>
  */
 
-#define pr_fmt(fmt)	KBUILD_MODNAME ": " fmt
-
 #include <asm/elf.h>
 #include <asm/opcodes.h>
 #include <asm/pstate.h>
-#include <crypto/internal/sha2.h>
-#include <linux/kernel.h>
-#include <linux/module.h>
 
 static __ro_after_init DEFINE_STATIC_KEY_FALSE(have_sha256_opcodes);
 
 asmlinkage void sha256_sparc64_transform(struct sha256_block_state *state,
 					 const u8 *data, size_t nblocks);
 
-void sha256_blocks_arch(struct sha256_block_state *state,
-			const u8 *data, size_t nblocks)
+static void sha256_blocks(struct sha256_block_state *state,
+			  const u8 *data, size_t nblocks)
 {
 	if (static_branch_likely(&have_sha256_opcodes))
 		sha256_sparc64_transform(state, data, nblocks);
 	else
 		sha256_blocks_generic(state, data, nblocks);
 }
-EXPORT_SYMBOL_GPL(sha256_blocks_arch);
 
-static int __init sha256_sparc64_mod_init(void)
+#define sha256_mod_init_arch sha256_mod_init_arch
+static inline void sha256_mod_init_arch(void)
 {
 	unsigned long cfr;
 
 	if (!(sparc64_elf_hwcap & HWCAP_SPARC_CRYPTO))
-		return 0;
+		return;
 
 	__asm__ __volatile__("rd %%asr26, %0" : "=r" (cfr));
 	if (!(cfr & CFR_SHA256))
-		return 0;
+		return;
 
 	static_branch_enable(&have_sha256_opcodes);
 	pr_info("Using sparc64 sha256 opcode optimized SHA-256/SHA-224 implementation\n");
-	return 0;
 }
-subsys_initcall(sha256_sparc64_mod_init);
-
-static void __exit sha256_sparc64_mod_exit(void)
-{
-}
-module_exit(sha256_sparc64_mod_exit);
-
-MODULE_LICENSE("GPL");
-MODULE_DESCRIPTION("SHA-256 accelerated using the sparc64 sha256 opcodes");
diff --git a/lib/crypto/x86/Kconfig b/lib/crypto/x86/Kconfig
index e344579db3d85..546fe2afe0b51 100644
--- a/lib/crypto/x86/Kconfig
+++ b/lib/crypto/x86/Kconfig
@@ -22,12 +22,5 @@ config CRYPTO_CHACHA20_X86_64
 config CRYPTO_POLY1305_X86_64
 	tristate
 	depends on 64BIT
 	default CRYPTO_LIB_POLY1305
 	select CRYPTO_ARCH_HAVE_LIB_POLY1305
-
-config CRYPTO_SHA256_X86_64
-	tristate
-	depends on 64BIT
-	default CRYPTO_LIB_SHA256
-	select CRYPTO_ARCH_HAVE_LIB_SHA256
-	select CRYPTO_LIB_SHA256_GENERIC
diff --git a/lib/crypto/x86/Makefile b/lib/crypto/x86/Makefile
index abceca3d31c01..c2ff8c5f1046e 100644
--- a/lib/crypto/x86/Makefile
+++ b/lib/crypto/x86/Makefile
@@ -8,13 +8,10 @@ chacha-x86_64-y := chacha-avx2-x86_64.o chacha-ssse3-x86_64.o chacha-avx512vl-x8
 
 obj-$(CONFIG_CRYPTO_POLY1305_X86_64) += poly1305-x86_64.o
 poly1305-x86_64-y := poly1305-x86_64-cryptogams.o poly1305_glue.o
 targets += poly1305-x86_64-cryptogams.S
 
-obj-$(CONFIG_CRYPTO_SHA256_X86_64) += sha256-x86_64.o
-sha256-x86_64-y := sha256.o sha256-ssse3-asm.o sha256-avx-asm.o sha256-avx2-asm.o sha256-ni-asm.o
-
 quiet_cmd_perlasm = PERLASM $@
       cmd_perlasm = $(PERL) $< > $@
 
 $(obj)/%.S: $(src)/%.pl FORCE
 	$(call if_changed,perlasm)
diff --git a/lib/crypto/x86/sha256.c b/lib/crypto/x86/sha256.h
similarity index 70%
rename from lib/crypto/x86/sha256.c
rename to lib/crypto/x86/sha256.h
index 9ee38d2b3d572..3b5456c222ba6 100644
--- a/lib/crypto/x86/sha256.c
+++ b/lib/crypto/x86/sha256.h
@@ -1,16 +1,13 @@
-// SPDX-License-Identifier: GPL-2.0-or-later
+/* SPDX-License-Identifier: GPL-2.0-or-later */
 /*
  * SHA-256 optimized for x86_64
  *
  * Copyright 2025 Google LLC
  */
 #include <asm/fpu/api.h>
-#include <crypto/internal/sha2.h>
 #include <crypto/internal/simd.h>
-#include <linux/kernel.h>
-#include <linux/module.h>
 #include <linux/static_call.h>
 
 asmlinkage void sha256_transform_ssse3(struct sha256_block_state *state,
 				       const u8 *data, size_t nblocks);
 asmlinkage void sha256_transform_avx(struct sha256_block_state *state,
@@ -22,47 +19,37 @@ asmlinkage void sha256_ni_transform(struct sha256_block_state *state,
 
 static __ro_after_init DEFINE_STATIC_KEY_FALSE(have_sha256_x86);
 
 DEFINE_STATIC_CALL(sha256_blocks_x86, sha256_transform_ssse3);
 
-void sha256_blocks_arch(struct sha256_block_state *state,
-			const u8 *data, size_t nblocks)
+static void sha256_blocks(struct sha256_block_state *state,
+			  const u8 *data, size_t nblocks)
 {
 	if (static_branch_likely(&have_sha256_x86) && crypto_simd_usable()) {
 		kernel_fpu_begin();
 		static_call(sha256_blocks_x86)(state, data, nblocks);
 		kernel_fpu_end();
 	} else {
 		sha256_blocks_generic(state, data, nblocks);
 	}
 }
-EXPORT_SYMBOL_GPL(sha256_blocks_arch);
 
-static int __init sha256_x86_mod_init(void)
+#define sha256_mod_init_arch sha256_mod_init_arch
+static inline void sha256_mod_init_arch(void)
 {
 	if (boot_cpu_has(X86_FEATURE_SHA_NI)) {
 		static_call_update(sha256_blocks_x86, sha256_ni_transform);
-	} else if (cpu_has_xfeatures(XFEATURE_MASK_SSE |
-				     XFEATURE_MASK_YMM, NULL) &&
+	} else if (cpu_has_xfeatures(XFEATURE_MASK_SSE | XFEATURE_MASK_YMM,
+				     NULL) &&
 		   boot_cpu_has(X86_FEATURE_AVX)) {
 		if (boot_cpu_has(X86_FEATURE_AVX2) &&
 		    boot_cpu_has(X86_FEATURE_BMI2))
 			static_call_update(sha256_blocks_x86,
 					   sha256_transform_rorx);
 		else
 			static_call_update(sha256_blocks_x86,
 					   sha256_transform_avx);
 	} else if (!boot_cpu_has(X86_FEATURE_SSSE3)) {
-		return 0;
+		return;
 	}
 	static_branch_enable(&have_sha256_x86);
-	return 0;
 }
-subsys_initcall(sha256_x86_mod_init);
-
-static void __exit sha256_x86_mod_exit(void)
-{
-}
-module_exit(sha256_x86_mod_exit);
-
-MODULE_LICENSE("GPL");
-MODULE_DESCRIPTION("SHA-256 optimized for x86_64");
-- 
2.50.0


