Return-Path: <linuxppc-dev+bounces-11843-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 32552B4779B
	for <lists+linuxppc-dev@lfdr.de>; Sat,  6 Sep 2025 23:38:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cK64Q0pcnz3d9K;
	Sun,  7 Sep 2025 07:37:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c04:e001:324:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757194630;
	cv=none; b=NShxBuy4tynBmCNn3sAx1fMcZznjVii7ySs1JElen7WuoXiZGM9ugokwSfoSheNigoSJzNcymzjJqN35wswm8za6/syWTx6rsqGS1VwDp2bguKJvGjqrAd48hq9PEXTxk1MAon4bEA4ARqh2zDrZFNz2DEDK5hJWoCLj0lkB7WSKZ9O0H3QFYMTefuBtqaVDcl2sG61jiKRKO4JXEYgSbFJlr3I5UG20TXm/uW5+ed9St5jQrcVVXa8Gqlui0/LsJS1jPzqTH/jCUhCVYdKuXDOXbofIIF1tKw9yqSql0oqMP8eVEx6zgHxoN4pO709Hg8x5GKv15SNpieDxXQy2IA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757194630; c=relaxed/relaxed;
	bh=NBgeXS35IYV6Ht1+tz3fYDTjurfUeCwHWJbFS0ClO84=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Q+gvAnfZvW7q46RER/KZFnjdTqiu0Si7dlG/EmcbgNhZuVXbwdkM2NQ/kCLzjY8uewTqb0hFg+qhlU7sP0YnF6hDVhCkpTmpdJ633qxN0J6TDJeCFATm3quWEo10De0kd8CLarzeV0Gdq/BpfQsgygMGEUCmrfOABgymZmxS5gMZtn4B942uS8HdsJRZwULnRHY/PCz6B+K7ZH6RxCA9UOH4YIHPXe7vLtR7b/0UsRFhNk6JVsR9ui5R93kejDW0uLwpkIxPsA7j+sL8efMakOGt44+DPPe3NAXJLHWfx8blQjLKNuv9TQRp4Dy4nW7mUAiod16s8R0LQ/pKedcGPQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=GtYVRLno; dkim-atps=neutral; spf=pass (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=GtYVRLno;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04:e001:324:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cK64N4Tskz3cnk
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  7 Sep 2025 07:37:08 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B9BF360380;
	Sat,  6 Sep 2025 21:37:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BA3FC4CEF9;
	Sat,  6 Sep 2025 21:37:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757194626;
	bh=+bIpa2SHWGjz5BZD4t6PtYkdTnfFPbx1eSoFdVtI3/c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GtYVRLnoz50D/h9nutxKvfZJddKLQ9I295JEkyKAw12x4rr49PU6HBx69FKw25h8k
	 8VjCwEgmYddYLFIe9CQmtEMpB+iCd1UfBORRs22zvHyv6RRF0fI9sbBHAcNdm1ogKs
	 jY+FTI2KSUR4EyRpGGeWIWuQe9lypDuq07mamn7Q2VzwFmsRNtNth+ZiNK9pf7rRg0
	 vMVLgBm2wHIaD91MAuPTcGWqaq6oywUDjBl3kv4TgleyMME8y0wuTRQWfSuab8N3cL
	 emWMN26TCeW02f97Cnll9NFXsC7KXFyK4KBjTe9Gn+rutUOH9ICqSY8IQOMhIYq2Il
	 jGhoO7DeC5I/g==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	Zhiqi Song <songzhiqi1@huawei.com>,
	Longfang Liu <liulongfang@huawei.com>,
	x86@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	Eric Biggers <ebiggers@kernel.org>
Subject: [PATCH v2 10/12] lib/crypto: curve25519: Consolidate into single module
Date: Sat,  6 Sep 2025 14:35:21 -0700
Message-ID: <20250906213523.84915-11-ebiggers@kernel.org>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250906213523.84915-1-ebiggers@kernel.org>
References: <20250906213523.84915-1-ebiggers@kernel.org>
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

Reorganize the Curve25519 library code:

- Build a single libcurve25519 module, instead of up to three modules:
  libcurve25519, libcurve25519-generic, and an arch-specific module.

- Move the arch-specific Curve25519 code from arch/$(SRCARCH)/crypto/ to
  lib/crypto/$(SRCARCH)/.  Centralize the build rules into
  lib/crypto/Makefile and lib/crypto/Kconfig.

- Include the arch-specific code directly in lib/crypto/curve25519.c via
  a header, rather than using a separate .c file.

- Eliminate the entanglement with CRYPTO.  CRYPTO_LIB_CURVE25519 no
  longer selects CRYPTO, and the arch-specific Curve25519 code no longer
  depends on CRYPTO.

This brings Curve25519 in line with the latest conventions for
lib/crypto/, used by other algorithms.  The exception is that I kept the
generic code in separate translation units for now.  (Some of the
function names collide between the x86 and generic Curve25519 code.  And
the Curve25519 functions are very long anyway, so inlining doesn't
matter as much for Curve25519 as it does for some other algorithms.)

Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 arch/arm/crypto/Kconfig                       | 12 -----
 arch/arm/crypto/Makefile                      |  2 -
 arch/powerpc/crypto/Kconfig                   | 12 -----
 arch/powerpc/crypto/Makefile                  |  2 -
 arch/x86/crypto/Kconfig                       | 12 -----
 arch/x86/crypto/Makefile                      |  5 --
 include/crypto/curve25519.h                   | 10 ----
 lib/crypto/Kconfig                            | 37 +++++---------
 lib/crypto/Makefile                           | 26 +++++++---
 .../crypto/arm}/curve25519-core.S             |  0
 .../crypto/arm/curve25519.h                   | 31 +++---------
 lib/crypto/curve25519-generic.c               | 25 ----------
 lib/crypto/curve25519.c                       | 50 ++++++++++++-------
 .../crypto/powerpc}/curve25519-ppc64le_asm.S  |  0
 .../crypto/powerpc/curve25519.h               | 19 ++-----
 .../crypto/x86/curve25519.h                   | 31 +++---------
 16 files changed, 86 insertions(+), 188 deletions(-)
 rename {arch/arm/crypto => lib/crypto/arm}/curve25519-core.S (100%)
 rename arch/arm/crypto/curve25519-glue.c => lib/crypto/arm/curve25519.h (58%)
 delete mode 100644 lib/crypto/curve25519-generic.c
 rename {arch/powerpc/crypto => lib/crypto/powerpc}/curve25519-ppc64le_asm.S (100%)
 rename arch/powerpc/crypto/curve25519-ppc64le-core.c => lib/crypto/powerpc/curve25519.h (88%)
 rename arch/x86/crypto/curve25519-x86_64.c => lib/crypto/x86/curve25519.h (98%)

diff --git a/arch/arm/crypto/Kconfig b/arch/arm/crypto/Kconfig
index 97718d86f6007..c436eec22d86c 100644
--- a/arch/arm/crypto/Kconfig
+++ b/arch/arm/crypto/Kconfig
@@ -1,21 +1,9 @@
 # SPDX-License-Identifier: GPL-2.0
 
 menu "Accelerated Cryptographic Algorithms for CPU (arm)"
 
-config CRYPTO_CURVE25519_NEON
-	tristate
-	depends on KERNEL_MODE_NEON
-	select CRYPTO_LIB_CURVE25519_GENERIC
-	select CRYPTO_ARCH_HAVE_LIB_CURVE25519
-	default CRYPTO_LIB_CURVE25519_INTERNAL
-	help
-	  Curve25519 algorithm
-
-	  Architecture: arm with
-	  - NEON (Advanced SIMD) extensions
-
 config CRYPTO_GHASH_ARM_CE
 	tristate "Hash functions: GHASH (PMULL/NEON/ARMv8 Crypto Extensions)"
 	depends on KERNEL_MODE_NEON
 	select CRYPTO_AEAD
 	select CRYPTO_HASH
diff --git a/arch/arm/crypto/Makefile b/arch/arm/crypto/Makefile
index 4f23999ae17df..6346a73effc06 100644
--- a/arch/arm/crypto/Makefile
+++ b/arch/arm/crypto/Makefile
@@ -5,17 +5,15 @@
 
 obj-$(CONFIG_CRYPTO_AES_ARM) += aes-arm.o
 obj-$(CONFIG_CRYPTO_AES_ARM_BS) += aes-arm-bs.o
 obj-$(CONFIG_CRYPTO_BLAKE2B_NEON) += blake2b-neon.o
 obj-$(CONFIG_CRYPTO_NHPOLY1305_NEON) += nhpoly1305-neon.o
-obj-$(CONFIG_CRYPTO_CURVE25519_NEON) += curve25519-neon.o
 
 obj-$(CONFIG_CRYPTO_AES_ARM_CE) += aes-arm-ce.o
 obj-$(CONFIG_CRYPTO_GHASH_ARM_CE) += ghash-arm-ce.o
 
 aes-arm-y	:= aes-cipher-core.o aes-cipher-glue.o
 aes-arm-bs-y	:= aes-neonbs-core.o aes-neonbs-glue.o
 blake2b-neon-y  := blake2b-neon-core.o blake2b-neon-glue.o
 aes-arm-ce-y	:= aes-ce-core.o aes-ce-glue.o
 ghash-arm-ce-y	:= ghash-ce-core.o ghash-ce-glue.o
 nhpoly1305-neon-y := nh-neon-core.o nhpoly1305-neon-glue.o
-curve25519-neon-y := curve25519-core.o curve25519-glue.o
diff --git a/arch/powerpc/crypto/Kconfig b/arch/powerpc/crypto/Kconfig
index 6106a219da6af..662aed46f9c79 100644
--- a/arch/powerpc/crypto/Kconfig
+++ b/arch/powerpc/crypto/Kconfig
@@ -1,21 +1,9 @@
 # SPDX-License-Identifier: GPL-2.0
 
 menu "Accelerated Cryptographic Algorithms for CPU (powerpc)"
 
-config CRYPTO_CURVE25519_PPC64
-	tristate
-	depends on PPC64 && CPU_LITTLE_ENDIAN
-	select CRYPTO_LIB_CURVE25519_GENERIC
-	select CRYPTO_ARCH_HAVE_LIB_CURVE25519
-	default CRYPTO_LIB_CURVE25519_INTERNAL
-	help
-	  Curve25519 algorithm
-
-	  Architecture: PowerPC64
-	  - Little-endian
-
 config CRYPTO_AES_PPC_SPE
 	tristate "Ciphers: AES, modes: ECB/CBC/CTR/XTS (SPE)"
 	depends on SPE
 	select CRYPTO_SKCIPHER
 	help
diff --git a/arch/powerpc/crypto/Makefile b/arch/powerpc/crypto/Makefile
index 9eb59dce67f36..5960e5300db71 100644
--- a/arch/powerpc/crypto/Makefile
+++ b/arch/powerpc/crypto/Makefile
@@ -6,16 +6,14 @@
 #
 
 obj-$(CONFIG_CRYPTO_AES_PPC_SPE) += aes-ppc-spe.o
 obj-$(CONFIG_CRYPTO_AES_GCM_P10) += aes-gcm-p10-crypto.o
 obj-$(CONFIG_CRYPTO_DEV_VMX_ENCRYPT) += vmx-crypto.o
-obj-$(CONFIG_CRYPTO_CURVE25519_PPC64) += curve25519-ppc64le.o
 
 aes-ppc-spe-y := aes-spe-core.o aes-spe-keys.o aes-tab-4k.o aes-spe-modes.o aes-spe-glue.o
 aes-gcm-p10-crypto-y := aes-gcm-p10-glue.o aes-gcm-p10.o ghashp10-ppc.o aesp10-ppc.o
 vmx-crypto-objs := vmx.o aesp8-ppc.o ghashp8-ppc.o aes.o aes_cbc.o aes_ctr.o aes_xts.o ghash.o
-curve25519-ppc64le-y := curve25519-ppc64le-core.o curve25519-ppc64le_asm.o
 
 ifeq ($(CONFIG_CPU_LITTLE_ENDIAN),y)
 override flavour := linux-ppc64le
 else
 ifdef CONFIG_PPC64_ELF_ABI_V2
diff --git a/arch/x86/crypto/Kconfig b/arch/x86/crypto/Kconfig
index 6a895a571b00e..d9c6fc78cf332 100644
--- a/arch/x86/crypto/Kconfig
+++ b/arch/x86/crypto/Kconfig
@@ -1,21 +1,9 @@
 # SPDX-License-Identifier: GPL-2.0
 
 menu "Accelerated Cryptographic Algorithms for CPU (x86)"
 
-config CRYPTO_CURVE25519_X86
-	tristate
-	depends on 64BIT
-	select CRYPTO_LIB_CURVE25519_GENERIC
-	select CRYPTO_ARCH_HAVE_LIB_CURVE25519
-	default CRYPTO_LIB_CURVE25519_INTERNAL
-	help
-	  Curve25519 algorithm
-
-	  Architecture: x86_64 using:
-	  - ADX (large integer arithmetic)
-
 config CRYPTO_AES_NI_INTEL
 	tristate "Ciphers: AES, modes: ECB, CBC, CTS, CTR, XCTR, XTS, GCM (AES-NI/VAES)"
 	select CRYPTO_AEAD
 	select CRYPTO_LIB_AES
 	select CRYPTO_LIB_GF128MUL
diff --git a/arch/x86/crypto/Makefile b/arch/x86/crypto/Makefile
index d402963d6b579..dfba7e5e88ea6 100644
--- a/arch/x86/crypto/Makefile
+++ b/arch/x86/crypto/Makefile
@@ -60,12 +60,10 @@ polyval-clmulni-y := polyval-clmulni_asm.o polyval-clmulni_glue.o
 obj-$(CONFIG_CRYPTO_NHPOLY1305_SSE2) += nhpoly1305-sse2.o
 nhpoly1305-sse2-y := nh-sse2-x86_64.o nhpoly1305-sse2-glue.o
 obj-$(CONFIG_CRYPTO_NHPOLY1305_AVX2) += nhpoly1305-avx2.o
 nhpoly1305-avx2-y := nh-avx2-x86_64.o nhpoly1305-avx2-glue.o
 
-obj-$(CONFIG_CRYPTO_CURVE25519_X86) += curve25519-x86_64.o
-
 obj-$(CONFIG_CRYPTO_SM3_AVX_X86_64) += sm3-avx-x86_64.o
 sm3-avx-x86_64-y := sm3-avx-asm_64.o sm3_avx_glue.o
 
 obj-$(CONFIG_CRYPTO_SM4_AESNI_AVX_X86_64) += sm4-aesni-avx-x86_64.o
 sm4-aesni-avx-x86_64-y := sm4-aesni-avx-asm_64.o sm4_aesni_avx_glue.o
@@ -79,8 +77,5 @@ aria-aesni-avx-x86_64-y := aria-aesni-avx-asm_64.o aria_aesni_avx_glue.o
 obj-$(CONFIG_CRYPTO_ARIA_AESNI_AVX2_X86_64) += aria-aesni-avx2-x86_64.o
 aria-aesni-avx2-x86_64-y := aria-aesni-avx2-asm_64.o aria_aesni_avx2_glue.o
 
 obj-$(CONFIG_CRYPTO_ARIA_GFNI_AVX512_X86_64) += aria-gfni-avx512-x86_64.o
 aria-gfni-avx512-x86_64-y := aria-gfni-avx512-asm_64.o aria_gfni_avx512_glue.o
-
-# Disable GCOV in odd or sensitive code
-GCOV_PROFILE_curve25519-x86_64.o := n
diff --git a/include/crypto/curve25519.h b/include/crypto/curve25519.h
index 78aa5f28c847f..db63a5577c004 100644
--- a/include/crypto/curve25519.h
+++ b/include/crypto/curve25519.h
@@ -11,24 +11,14 @@
 
 enum curve25519_lengths {
 	CURVE25519_KEY_SIZE = 32
 };
 
-extern const u8 curve25519_null_point[];
-extern const u8 curve25519_base_point[];
-
 void curve25519_generic(u8 out[CURVE25519_KEY_SIZE],
 			const u8 scalar[CURVE25519_KEY_SIZE],
 			const u8 point[CURVE25519_KEY_SIZE]);
 
-void curve25519_arch(u8 out[CURVE25519_KEY_SIZE],
-		     const u8 scalar[CURVE25519_KEY_SIZE],
-		     const u8 point[CURVE25519_KEY_SIZE]);
-
-void curve25519_base_arch(u8 pub[CURVE25519_KEY_SIZE],
-			  const u8 secret[CURVE25519_KEY_SIZE]);
-
 bool __must_check curve25519(u8 mypublic[CURVE25519_KEY_SIZE],
 			     const u8 secret[CURVE25519_KEY_SIZE],
 			     const u8 basepoint[CURVE25519_KEY_SIZE]);
 
 bool __must_check curve25519_generate_public(u8 pub[CURVE25519_KEY_SIZE],
diff --git a/lib/crypto/Kconfig b/lib/crypto/Kconfig
index 37d85e0c9b979..eea17e36a22be 100644
--- a/lib/crypto/Kconfig
+++ b/lib/crypto/Kconfig
@@ -52,39 +52,28 @@ config CRYPTO_LIB_CHACHA_ARCH
 	default y if PPC64 && CPU_LITTLE_ENDIAN && VSX
 	default y if RISCV && 64BIT && RISCV_ISA_V && TOOLCHAIN_HAS_VECTOR_CRYPTO
 	default y if S390
 	default y if X86_64
 
-config CRYPTO_ARCH_HAVE_LIB_CURVE25519
-	bool
-	help
-	  Declares whether the architecture provides an arch-specific
-	  accelerated implementation of the Curve25519 library interface,
-	  either builtin or as a module.
-
-config CRYPTO_LIB_CURVE25519_GENERIC
+config CRYPTO_LIB_CURVE25519
 	tristate
 	select CRYPTO_LIB_UTILS
 	help
-	  This symbol can be depended upon by arch implementations of the
-	  Curve25519 library interface that require the generic code as a
-	  fallback, e.g., for SIMD implementations. If no arch specific
-	  implementation is enabled, this implementation serves the users
-	  of CRYPTO_LIB_CURVE25519.
+	  The Curve25519 library functions.  Select this if your module uses any
+	  of the functions from <crypto/curve25519.h>.
 
-config CRYPTO_LIB_CURVE25519_INTERNAL
-	tristate
-	select CRYPTO_LIB_CURVE25519_GENERIC if CRYPTO_ARCH_HAVE_LIB_CURVE25519=n
+config CRYPTO_LIB_CURVE25519_ARCH
+	bool
+	depends on CRYPTO_LIB_CURVE25519 && !UML && !KMSAN
+	default y if ARM && KERNEL_MODE_NEON
+	default y if PPC64 && CPU_LITTLE_ENDIAN
+	default y if X86_64
 
-config CRYPTO_LIB_CURVE25519
-	tristate
-	select CRYPTO
-	select CRYPTO_LIB_CURVE25519_INTERNAL
-	help
-	  Enable the Curve25519 library interface. This interface may be
-	  fulfilled by either the generic implementation or an arch-specific
-	  one, if one is available and enabled.
+config CRYPTO_LIB_CURVE25519_GENERIC
+	bool
+	depends on CRYPTO_LIB_CURVE25519
+	default y if !CRYPTO_LIB_CURVE25519_ARCH || ARM || X86_64
 
 config CRYPTO_LIB_DES
 	tristate
 
 config CRYPTO_LIB_MD5
diff --git a/lib/crypto/Makefile b/lib/crypto/Makefile
index 6c3be971ace09..bded351aeacef 100644
--- a/lib/crypto/Makefile
+++ b/lib/crypto/Makefile
@@ -74,21 +74,35 @@ endif # CONFIG_CRYPTO_LIB_CHACHA_ARCH
 
 obj-$(CONFIG_CRYPTO_LIB_CHACHA20POLY1305)	+= libchacha20poly1305.o
 libchacha20poly1305-y				+= chacha20poly1305.o
 libchacha20poly1305-$(CONFIG_CRYPTO_SELFTESTS)	+= chacha20poly1305-selftest.o
 
-obj-$(CONFIG_CRYPTO_LIB_CURVE25519_GENERIC)	+= libcurve25519-generic.o
-libcurve25519-generic-y				:= curve25519-fiat32.o
-libcurve25519-generic-$(CONFIG_ARCH_SUPPORTS_INT128)	:= curve25519-hacl64.o
-libcurve25519-generic-y				+= curve25519-generic.o
+################################################################################
+
+obj-$(CONFIG_CRYPTO_LIB_CURVE25519) += libcurve25519.o
+libcurve25519-y := curve25519.o
+
+# Disable GCOV in odd or sensitive code
+GCOV_PROFILE_curve25519.o := n
+
+ifeq ($(CONFIG_ARCH_SUPPORTS_INT128),y)
+libcurve25519-$(CONFIG_CRYPTO_LIB_CURVE25519_GENERIC) += curve25519-hacl64.o
+else
+libcurve25519-$(CONFIG_CRYPTO_LIB_CURVE25519_GENERIC) += curve25519-fiat32.o
+endif
 # clang versions prior to 18 may blow out the stack with KASAN
 ifeq ($(call clang-min-version, 180000),)
 KASAN_SANITIZE_curve25519-hacl64.o := n
 endif
 
-obj-$(CONFIG_CRYPTO_LIB_CURVE25519)		+= libcurve25519.o
-libcurve25519-y					+= curve25519.o
+ifeq ($(CONFIG_CRYPTO_LIB_CURVE25519_ARCH),y)
+CFLAGS_curve25519.o += -I$(src)/$(SRCARCH)
+libcurve25519-$(CONFIG_ARM) += arm/curve25519-core.o
+libcurve25519-$(CONFIG_PPC) += powerpc/curve25519-ppc64le_asm.o
+endif
+
+################################################################################
 
 obj-$(CONFIG_CRYPTO_LIB_DES)			+= libdes.o
 libdes-y					:= des.o
 
 ################################################################################
diff --git a/arch/arm/crypto/curve25519-core.S b/lib/crypto/arm/curve25519-core.S
similarity index 100%
rename from arch/arm/crypto/curve25519-core.S
rename to lib/crypto/arm/curve25519-core.S
diff --git a/arch/arm/crypto/curve25519-glue.c b/lib/crypto/arm/curve25519.h
similarity index 58%
rename from arch/arm/crypto/curve25519-glue.c
rename to lib/crypto/arm/curve25519.h
index 3076020d8fbeb..f6d66494eb8f8 100644
--- a/arch/arm/crypto/curve25519-glue.c
+++ b/lib/crypto/arm/curve25519.h
@@ -10,53 +10,38 @@
 #include <asm/hwcap.h>
 #include <asm/neon.h>
 #include <asm/simd.h>
 #include <crypto/internal/simd.h>
 #include <linux/types.h>
-#include <linux/module.h>
-#include <linux/init.h>
 #include <linux/jump_label.h>
-#include <crypto/curve25519.h>
 
 asmlinkage void curve25519_neon(u8 mypublic[CURVE25519_KEY_SIZE],
 				const u8 secret[CURVE25519_KEY_SIZE],
 				const u8 basepoint[CURVE25519_KEY_SIZE]);
 
 static __ro_after_init DEFINE_STATIC_KEY_FALSE(have_neon);
 
-void curve25519_arch(u8 out[CURVE25519_KEY_SIZE],
-		     const u8 scalar[CURVE25519_KEY_SIZE],
-		     const u8 point[CURVE25519_KEY_SIZE])
+static void curve25519_arch(u8 out[CURVE25519_KEY_SIZE],
+			    const u8 scalar[CURVE25519_KEY_SIZE],
+			    const u8 point[CURVE25519_KEY_SIZE])
 {
 	if (static_branch_likely(&have_neon) && crypto_simd_usable()) {
 		kernel_neon_begin();
 		curve25519_neon(out, scalar, point);
 		kernel_neon_end();
 	} else {
 		curve25519_generic(out, scalar, point);
 	}
 }
-EXPORT_SYMBOL(curve25519_arch);
 
-void curve25519_base_arch(u8 pub[CURVE25519_KEY_SIZE],
-			  const u8 secret[CURVE25519_KEY_SIZE])
+static void curve25519_base_arch(u8 pub[CURVE25519_KEY_SIZE],
+				 const u8 secret[CURVE25519_KEY_SIZE])
 {
-	return curve25519_arch(pub, secret, curve25519_base_point);
+	curve25519_arch(pub, secret, curve25519_base_point);
 }
-EXPORT_SYMBOL(curve25519_base_arch);
 
-static int __init arm_curve25519_init(void)
+#define curve25519_mod_init_arch curve25519_mod_init_arch
+static void curve25519_mod_init_arch(void)
 {
 	if (elf_hwcap & HWCAP_NEON)
 		static_branch_enable(&have_neon);
-	return 0;
 }
-
-static void __exit arm_curve25519_exit(void)
-{
-}
-
-module_init(arm_curve25519_init);
-module_exit(arm_curve25519_exit);
-
-MODULE_DESCRIPTION("Public key crypto: Curve25519 (NEON-accelerated)");
-MODULE_LICENSE("GPL v2");
diff --git a/lib/crypto/curve25519-generic.c b/lib/crypto/curve25519-generic.c
deleted file mode 100644
index f8aa70c9f5598..0000000000000
--- a/lib/crypto/curve25519-generic.c
+++ /dev/null
@@ -1,25 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0 OR MIT
-/*
- * Copyright (C) 2015-2019 Jason A. Donenfeld <Jason@zx2c4.com>. All Rights Reserved.
- *
- * This is an implementation of the Curve25519 ECDH algorithm, using either
- * a 32-bit implementation or a 64-bit implementation with 128-bit integers,
- * depending on what is supported by the target compiler.
- *
- * Information: https://cr.yp.to/ecdh.html
- */
-
-#include <crypto/curve25519.h>
-#include <linux/export.h>
-#include <linux/module.h>
-
-const u8 curve25519_null_point[CURVE25519_KEY_SIZE] __aligned(32) = { 0 };
-const u8 curve25519_base_point[CURVE25519_KEY_SIZE] __aligned(32) = { 9 };
-
-EXPORT_SYMBOL(curve25519_null_point);
-EXPORT_SYMBOL(curve25519_base_point);
-EXPORT_SYMBOL(curve25519_generic);
-
-MODULE_LICENSE("GPL v2");
-MODULE_DESCRIPTION("Curve25519 scalar multiplication");
-MODULE_AUTHOR("Jason A. Donenfeld <Jason@zx2c4.com>");
diff --git a/lib/crypto/curve25519.c b/lib/crypto/curve25519.c
index 1b786389d714a..01e265dfbcd90 100644
--- a/lib/crypto/curve25519.c
+++ b/lib/crypto/curve25519.c
@@ -1,11 +1,12 @@
 // SPDX-License-Identifier: GPL-2.0 OR MIT
 /*
  * Copyright (C) 2015-2019 Jason A. Donenfeld <Jason@zx2c4.com>. All Rights Reserved.
  *
- * This is an implementation of the Curve25519 ECDH algorithm, using either
- * a 32-bit implementation or a 64-bit implementation with 128-bit integers,
+ * This is an implementation of the Curve25519 ECDH algorithm, using either an
+ * architecture-optimized implementation or a generic implementation. The
+ * generic implementation is either 32-bit, or 64-bit with 128-bit integers,
  * depending on what is supported by the target compiler.
  *
  * Information: https://cr.yp.to/ecdh.html
  */
 
@@ -13,19 +14,36 @@
 #include <crypto/utils.h>
 #include <linux/export.h>
 #include <linux/init.h>
 #include <linux/module.h>
 
+static const u8 curve25519_null_point[CURVE25519_KEY_SIZE] __aligned(32) = { 0 };
+static const u8 curve25519_base_point[CURVE25519_KEY_SIZE] __aligned(32) = { 9 };
+
+#ifdef CONFIG_CRYPTO_LIB_CURVE25519_ARCH
+#include "curve25519.h" /* $(SRCARCH)/curve25519.h */
+#else
+static void curve25519_arch(u8 mypublic[CURVE25519_KEY_SIZE],
+			    const u8 secret[CURVE25519_KEY_SIZE],
+			    const u8 basepoint[CURVE25519_KEY_SIZE])
+{
+	curve25519_generic(mypublic, secret, basepoint);
+}
+
+static void curve25519_base_arch(u8 pub[CURVE25519_KEY_SIZE],
+				 const u8 secret[CURVE25519_KEY_SIZE])
+{
+	curve25519_generic(pub, secret, curve25519_base_point);
+}
+#endif
+
 bool __must_check
 curve25519(u8 mypublic[CURVE25519_KEY_SIZE],
 	   const u8 secret[CURVE25519_KEY_SIZE],
 	   const u8 basepoint[CURVE25519_KEY_SIZE])
 {
-	if (IS_ENABLED(CONFIG_CRYPTO_ARCH_HAVE_LIB_CURVE25519))
-		curve25519_arch(mypublic, secret, basepoint);
-	else
-		curve25519_generic(mypublic, secret, basepoint);
+	curve25519_arch(mypublic, secret, basepoint);
 	return crypto_memneq(mypublic, curve25519_null_point,
 			     CURVE25519_KEY_SIZE);
 }
 EXPORT_SYMBOL(curve25519);
 
@@ -34,29 +52,27 @@ curve25519_generate_public(u8 pub[CURVE25519_KEY_SIZE],
 			   const u8 secret[CURVE25519_KEY_SIZE])
 {
 	if (unlikely(!crypto_memneq(secret, curve25519_null_point,
 				    CURVE25519_KEY_SIZE)))
 		return false;
-
-	if (IS_ENABLED(CONFIG_CRYPTO_ARCH_HAVE_LIB_CURVE25519))
-		curve25519_base_arch(pub, secret);
-	else
-		curve25519_generic(pub, secret, curve25519_base_point);
+	curve25519_base_arch(pub, secret);
 	return crypto_memneq(pub, curve25519_null_point, CURVE25519_KEY_SIZE);
 }
 EXPORT_SYMBOL(curve25519_generate_public);
 
-static int __init curve25519_init(void)
+#ifdef curve25519_mod_init_arch
+static int __init curve25519_mod_init(void)
 {
+	curve25519_mod_init_arch();
 	return 0;
 }
+subsys_initcall(curve25519_mod_init);
 
-static void __exit curve25519_exit(void)
+static void __exit curve25519_mod_exit(void)
 {
 }
-
-module_init(curve25519_init);
-module_exit(curve25519_exit);
+module_exit(curve25519_mod_exit);
+#endif
 
 MODULE_LICENSE("GPL v2");
-MODULE_DESCRIPTION("Curve25519 scalar multiplication");
+MODULE_DESCRIPTION("Curve25519 algorithm");
 MODULE_AUTHOR("Jason A. Donenfeld <Jason@zx2c4.com>");
diff --git a/arch/powerpc/crypto/curve25519-ppc64le_asm.S b/lib/crypto/powerpc/curve25519-ppc64le_asm.S
similarity index 100%
rename from arch/powerpc/crypto/curve25519-ppc64le_asm.S
rename to lib/crypto/powerpc/curve25519-ppc64le_asm.S
diff --git a/arch/powerpc/crypto/curve25519-ppc64le-core.c b/lib/crypto/powerpc/curve25519.h
similarity index 88%
rename from arch/powerpc/crypto/curve25519-ppc64le-core.c
rename to lib/crypto/powerpc/curve25519.h
index 6eb18ee19cad3..dee6234c48e92 100644
--- a/arch/powerpc/crypto/curve25519-ppc64le-core.c
+++ b/lib/crypto/powerpc/curve25519.h
@@ -5,16 +5,13 @@
  * X25519 scalar multiplication with 51 bits limbs for PPC64le.
  *   Based on RFC7748 and AArch64 optimized implementation for X25519
  *     - Algorithm 1 Scalar multiplication of a variable point
  */
 
-#include <crypto/curve25519.h>
-
 #include <linux/types.h>
 #include <linux/jump_label.h>
 #include <linux/kernel.h>
-#include <linux/module.h>
 
 #include <linux/cpufeature.h>
 #include <linux/processor.h>
 
 typedef uint64_t fe51[5];
@@ -173,23 +170,17 @@ static void curve25519_fe51(uint8_t out[32], const uint8_t scalar[32],
 	finv(z2, z2);
 	fmul(x2, x2, z2);
 	fe51_tobytes(out, x2);
 }
 
-void curve25519_arch(u8 mypublic[CURVE25519_KEY_SIZE],
-		     const u8 secret[CURVE25519_KEY_SIZE],
-		     const u8 basepoint[CURVE25519_KEY_SIZE])
+static void curve25519_arch(u8 mypublic[CURVE25519_KEY_SIZE],
+			    const u8 secret[CURVE25519_KEY_SIZE],
+			    const u8 basepoint[CURVE25519_KEY_SIZE])
 {
 	curve25519_fe51(mypublic, secret, basepoint);
 }
-EXPORT_SYMBOL(curve25519_arch);
 
-void curve25519_base_arch(u8 pub[CURVE25519_KEY_SIZE],
-			  const u8 secret[CURVE25519_KEY_SIZE])
+static void curve25519_base_arch(u8 pub[CURVE25519_KEY_SIZE],
+				 const u8 secret[CURVE25519_KEY_SIZE])
 {
 	curve25519_fe51(pub, secret, curve25519_base_point);
 }
-EXPORT_SYMBOL(curve25519_base_arch);
-
-MODULE_DESCRIPTION("PPC64le Curve25519 scalar multiplication with 51 bits limbs");
-MODULE_LICENSE("GPL v2");
-MODULE_AUTHOR("Danny Tsen <dtsen@us.ibm.com>");
diff --git a/arch/x86/crypto/curve25519-x86_64.c b/lib/crypto/x86/curve25519.h
similarity index 98%
rename from arch/x86/crypto/curve25519-x86_64.c
rename to lib/crypto/x86/curve25519.h
index ab91368284a47..5c0b8408852de 100644
--- a/arch/x86/crypto/curve25519-x86_64.c
+++ b/lib/crypto/x86/curve25519.h
@@ -2,17 +2,13 @@
 /*
  * Copyright (C) 2020 Jason A. Donenfeld <Jason@zx2c4.com>. All Rights Reserved.
  * Copyright (c) 2016-2020 INRIA, CMU and Microsoft Corporation
  */
 
-#include <crypto/curve25519.h>
-
-#include <linux/export.h>
 #include <linux/types.h>
 #include <linux/jump_label.h>
 #include <linux/kernel.h>
-#include <linux/module.h>
 
 #include <asm/cpufeature.h>
 #include <asm/processor.h>
 
 static __always_inline u64 eq_mask(u64 a, u64 b)
@@ -1588,43 +1584,30 @@ static void curve25519_ever64_base(u8 *out, const u8 *priv)
 	memzero_explicit(tmp, sizeof(tmp));
 }
 
 static __ro_after_init DEFINE_STATIC_KEY_FALSE(curve25519_use_bmi2_adx);
 
-void curve25519_arch(u8 mypublic[CURVE25519_KEY_SIZE],
-		     const u8 secret[CURVE25519_KEY_SIZE],
-		     const u8 basepoint[CURVE25519_KEY_SIZE])
+static void curve25519_arch(u8 mypublic[CURVE25519_KEY_SIZE],
+			    const u8 secret[CURVE25519_KEY_SIZE],
+			    const u8 basepoint[CURVE25519_KEY_SIZE])
 {
 	if (static_branch_likely(&curve25519_use_bmi2_adx))
 		curve25519_ever64(mypublic, secret, basepoint);
 	else
 		curve25519_generic(mypublic, secret, basepoint);
 }
-EXPORT_SYMBOL(curve25519_arch);
 
-void curve25519_base_arch(u8 pub[CURVE25519_KEY_SIZE],
-			  const u8 secret[CURVE25519_KEY_SIZE])
+static void curve25519_base_arch(u8 pub[CURVE25519_KEY_SIZE],
+				 const u8 secret[CURVE25519_KEY_SIZE])
 {
 	if (static_branch_likely(&curve25519_use_bmi2_adx))
 		curve25519_ever64_base(pub, secret);
 	else
 		curve25519_generic(pub, secret, curve25519_base_point);
 }
-EXPORT_SYMBOL(curve25519_base_arch);
 
-static int __init curve25519_mod_init(void)
+#define curve25519_mod_init_arch curve25519_mod_init_arch
+static void curve25519_mod_init_arch(void)
 {
 	if (boot_cpu_has(X86_FEATURE_BMI2) && boot_cpu_has(X86_FEATURE_ADX))
 		static_branch_enable(&curve25519_use_bmi2_adx);
-	return 0;
-}
-
-static void __exit curve25519_mod_exit(void)
-{
 }
-
-module_init(curve25519_mod_init);
-module_exit(curve25519_mod_exit);
-
-MODULE_DESCRIPTION("Curve25519 algorithm, ADX optimized");
-MODULE_LICENSE("GPL v2");
-MODULE_AUTHOR("Jason A. Donenfeld <Jason@zx2c4.com>");
-- 
2.50.1


