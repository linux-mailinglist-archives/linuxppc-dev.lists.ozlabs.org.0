Return-Path: <linuxppc-dev+bounces-9711-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 58020AE77FB
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Jun 2025 09:12:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bRtJJ5C7nz30Vr;
	Wed, 25 Jun 2025 17:10:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750835440;
	cv=none; b=XEOIAWYOzxv+bLSD/0ym8HlFgwWJJjH3A3oNWTP8m9kHWY9gEaGTDvHvVJDeKgXV9bucsE6O5MX5nAeedTsTkYEk7udXm6KpBLzqVo+J/bAymM0NZotDwiza7xmJa1djr9/TKsEHDVNUVnPOEaDTLhtYPjPEh8eM19T123neg/HL8A/EtsaFpoTG1/AokRm+NwemI42Hec1fvezX3A/5YSDAB/4tIwWm9zYIiCnKxbA97euruXBPalM/+KUd9jAz3HoFWi9IMztH56D7o/DPuklJtMdD0E+1SeDuH3gFXTR3aIE/IWuILHYzych8hyx3LRGWS+Sp/lA1XdCqOzNvzA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750835440; c=relaxed/relaxed;
	bh=cRLckKYzcpvbQ4igWFcE4OoqgMtbgQTQ+yZsxtITOJ8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fClO+mJ0c3ysWmDFtX/ELRqZE2JHk/th7gFN7uGU7/l94ak0uh9DtmWtvKTC4WtKjnKAnIMKyLCqS/FdV42YRbNJxyhukRwcyYSHOlSQNEJd0mSaA1bfT+3tHf6wWSaXXqUfskKqsxIevFGxPwle9lEbCgDYvs4818m9vOxBsYhw5dS1tn9FSXjNKNFTnuG4euCHhyLy1MhAi8acLt3KXB/4IVkHNjVeWaKpINcrf2OQ9qQpJSdtsf8+cfiRKkqxJ7BzvxTbmH/SfMvPY8vG8DOzm1DkglleMn7+8p74H9gwZEheZzcQmlLEJ+syZ4KD8SQ9YhvGma7VcA++XboPjQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ZbThUQxW; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ZbThUQxW;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bRtJ92qs6z2yKq
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Jun 2025 17:10:33 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 28BFD4AFE1;
	Wed, 25 Jun 2025 07:10:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0E01C4CEF2;
	Wed, 25 Jun 2025 07:10:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750835431;
	bh=vTVMfDTYNkNQFPT/9iQj0+X11NXKarZPeSOLstOuCFU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZbThUQxWX+tP9dphO56TG4jAAtKgSlGUWuwSAq9wn0XlYMM9yHLuNj/FSZ8j7t8hD
	 D7q6NQ89uKDlBzT722qAMlWfh3XKX5YNv7VMTWK45OEMYbYc2biKpXB4WSor2ElUp0
	 8SUa29oY18Q+Jypz8M3Uak48S6PzqS8CuWNg4J75ro+/uhFb9xFv4Iz9Q7zTOF9cJX
	 /TIMM7K1rNqFangg9wGedjRiEbUfdeviV7Ltay3kHaoJvr7NrKfxywe9j3fWtVfwmB
	 9MbeOeiFhOnOH8XhjxwRNwm31J5uaTpqyNx7OFhZh2uaLaO5lEtl6pGLwWrtgPz+Rh
	 jZEXKtgrFDJFw==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org,
	x86@kernel.org,
	Eric Biggers <ebiggers@kernel.org>
Subject: [PATCH 08/18] lib/crypto: sha256: Remove sha256_blocks_simd()
Date: Wed, 25 Jun 2025 00:08:09 -0700
Message-ID: <20250625070819.1496119-9-ebiggers@kernel.org>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250625070819.1496119-1-ebiggers@kernel.org>
References: <20250625070819.1496119-1-ebiggers@kernel.org>
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

Instead of having both sha256_blocks_arch() and sha256_blocks_simd(),
instead have just sha256_blocks_arch() which uses the most efficient
implementation that is available in the calling context.

This is simpler, as it reduces the API surface.  It's also safer, since
sha256_blocks_arch() just works in all contexts, including contexts
where the FPU/SIMD/vector registers cannot be used.  This doesn't mean
that SHA-256 computations *should* be done in such contexts, but rather
we should just do the right thing instead of corrupting a random task's
registers.  Eliminating this footgun and simplifying the code is well
worth the very small performance cost of doing the check.

Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 include/crypto/internal/sha2.h |  6 ------
 lib/crypto/Kconfig             |  8 --------
 lib/crypto/arm/Kconfig         |  1 -
 lib/crypto/arm/sha256-armv4.pl | 20 ++++++++++----------
 lib/crypto/arm/sha256.c        | 14 +++++++-------
 lib/crypto/arm64/Kconfig       |  1 -
 lib/crypto/arm64/sha2-armv8.pl |  2 +-
 lib/crypto/arm64/sha256.c      | 14 +++++++-------
 lib/crypto/arm64/sha512.h      |  6 +++---
 lib/crypto/riscv/Kconfig       |  1 -
 lib/crypto/riscv/sha256.c      | 12 +++---------
 lib/crypto/x86/Kconfig         |  1 -
 lib/crypto/x86/sha256.c        | 12 +++---------
 13 files changed, 34 insertions(+), 64 deletions(-)

diff --git a/include/crypto/internal/sha2.h b/include/crypto/internal/sha2.h
index b9bccd3ff57fc..79be22381ef86 100644
--- a/include/crypto/internal/sha2.h
+++ b/include/crypto/internal/sha2.h
@@ -1,11 +1,10 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 
 #ifndef _CRYPTO_INTERNAL_SHA2_H
 #define _CRYPTO_INTERNAL_SHA2_H
 
-#include <crypto/internal/simd.h>
 #include <crypto/sha2.h>
 #include <linux/compiler_attributes.h>
 #include <linux/string.h>
 #include <linux/types.h>
 #include <linux/unaligned.h>
@@ -20,22 +19,17 @@ static inline bool sha256_is_arch_optimized(void)
 #endif
 void sha256_blocks_generic(u32 state[SHA256_STATE_WORDS],
 			   const u8 *data, size_t nblocks);
 void sha256_blocks_arch(u32 state[SHA256_STATE_WORDS],
 			const u8 *data, size_t nblocks);
-void sha256_blocks_simd(u32 state[SHA256_STATE_WORDS],
-			const u8 *data, size_t nblocks);
 
 static inline void sha256_choose_blocks(
 	u32 state[SHA256_STATE_WORDS], const u8 *data, size_t nblocks,
 	bool force_generic, bool force_simd)
 {
 	if (!IS_ENABLED(CONFIG_CRYPTO_ARCH_HAVE_LIB_SHA256) || force_generic)
 		sha256_blocks_generic(state, data, nblocks);
-	else if (IS_ENABLED(CONFIG_CRYPTO_ARCH_HAVE_LIB_SHA256_SIMD) &&
-		 (force_simd || crypto_simd_usable()))
-		sha256_blocks_simd(state, data, nblocks);
 	else
 		sha256_blocks_arch(state, data, nblocks);
 }
 
 static __always_inline void sha256_finup(
diff --git a/lib/crypto/Kconfig b/lib/crypto/Kconfig
index be2d335129401..efc91300ab865 100644
--- a/lib/crypto/Kconfig
+++ b/lib/crypto/Kconfig
@@ -150,18 +150,10 @@ config CRYPTO_ARCH_HAVE_LIB_SHA256
 	bool
 	help
 	  Declares whether the architecture provides an arch-specific
 	  accelerated implementation of the SHA-256 library interface.
 
-config CRYPTO_ARCH_HAVE_LIB_SHA256_SIMD
-	bool
-	help
-	  Declares whether the architecture provides an arch-specific
-	  accelerated implementation of the SHA-256 library interface
-	  that is SIMD-based and therefore not usable in hardirq
-	  context.
-
 config CRYPTO_LIB_SHA256_GENERIC
 	tristate
 	default CRYPTO_LIB_SHA256 if !CRYPTO_ARCH_HAVE_LIB_SHA256
 	help
 	  This symbol can be selected by arch implementations of the SHA-256
diff --git a/lib/crypto/arm/Kconfig b/lib/crypto/arm/Kconfig
index d1ad664f0c674..9f3ff30f40328 100644
--- a/lib/crypto/arm/Kconfig
+++ b/lib/crypto/arm/Kconfig
@@ -26,6 +26,5 @@ config CRYPTO_POLY1305_ARM
 config CRYPTO_SHA256_ARM
 	tristate
 	depends on !CPU_V7M
 	default CRYPTO_LIB_SHA256
 	select CRYPTO_ARCH_HAVE_LIB_SHA256
-	select CRYPTO_ARCH_HAVE_LIB_SHA256_SIMD
diff --git a/lib/crypto/arm/sha256-armv4.pl b/lib/crypto/arm/sha256-armv4.pl
index 8122db7fd5990..f3a2b54efd4ee 100644
--- a/lib/crypto/arm/sha256-armv4.pl
+++ b/lib/crypto/arm/sha256-armv4.pl
@@ -202,22 +202,22 @@ K256:
 .word	0x90befffa,0xa4506ceb,0xbef9a3f7,0xc67178f2
 .size	K256,.-K256
 .word	0				@ terminator
 #if __ARM_MAX_ARCH__>=7 && !defined(__KERNEL__)
 .LOPENSSL_armcap:
-.word	OPENSSL_armcap_P-sha256_blocks_arch
+.word	OPENSSL_armcap_P-sha256_block_data_order
 #endif
 .align	5
 
-.global	sha256_blocks_arch
-.type	sha256_blocks_arch,%function
-sha256_blocks_arch:
-.Lsha256_blocks_arch:
+.global	sha256_block_data_order
+.type	sha256_block_data_order,%function
+sha256_block_data_order:
+.Lsha256_block_data_order:
 #if __ARM_ARCH__<7
-	sub	r3,pc,#8		@ sha256_blocks_arch
+	sub	r3,pc,#8		@ sha256_block_data_order
 #else
-	adr	r3,.Lsha256_blocks_arch
+	adr	r3,.Lsha256_block_data_order
 #endif
 #if __ARM_MAX_ARCH__>=7 && !defined(__KERNEL__)
 	ldr	r12,.LOPENSSL_armcap
 	ldr	r12,[r3,r12]		@ OPENSSL_armcap_P
 	tst	r12,#ARMV8_SHA256
@@ -280,11 +280,11 @@ $code.=<<___;
 	ldmia	sp!,{r4-r11,lr}
 	tst	lr,#1
 	moveq	pc,lr			@ be binary compatible with V4, yet
 	bx	lr			@ interoperable with Thumb ISA:-)
 #endif
-.size	sha256_blocks_arch,.-sha256_blocks_arch
+.size	sha256_block_data_order,.-sha256_block_data_order
 ___
 ######################################################################
 # NEON stuff
 #
 {{{
@@ -468,12 +468,12 @@ $code.=<<___;
 sha256_block_data_order_neon:
 .LNEON:
 	stmdb	sp!,{r4-r12,lr}
 
 	sub	$H,sp,#16*4+16
-	adr	$Ktbl,.Lsha256_blocks_arch
-	sub	$Ktbl,$Ktbl,#.Lsha256_blocks_arch-K256
+	adr	$Ktbl,.Lsha256_block_data_order
+	sub	$Ktbl,$Ktbl,#.Lsha256_block_data_order-K256
 	bic	$H,$H,#15		@ align for 128-bit stores
 	mov	$t2,sp
 	mov	sp,$H			@ alloca
 	add	$len,$inp,$len,lsl#6	@ len to point at the end of inp
 
diff --git a/lib/crypto/arm/sha256.c b/lib/crypto/arm/sha256.c
index 109192e54b0f0..2c9cfdaaa0691 100644
--- a/lib/crypto/arm/sha256.c
+++ b/lib/crypto/arm/sha256.c
@@ -4,40 +4,40 @@
  *
  * Copyright 2025 Google LLC
  */
 #include <asm/neon.h>
 #include <crypto/internal/sha2.h>
+#include <crypto/internal/simd.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 
-asmlinkage void sha256_blocks_arch(u32 state[SHA256_STATE_WORDS],
-				   const u8 *data, size_t nblocks);
-EXPORT_SYMBOL_GPL(sha256_blocks_arch);
+asmlinkage void sha256_block_data_order(u32 state[SHA256_STATE_WORDS],
+					const u8 *data, size_t nblocks);
 asmlinkage void sha256_block_data_order_neon(u32 state[SHA256_STATE_WORDS],
 					     const u8 *data, size_t nblocks);
 asmlinkage void sha256_ce_transform(u32 state[SHA256_STATE_WORDS],
 				    const u8 *data, size_t nblocks);
 
 static __ro_after_init DEFINE_STATIC_KEY_FALSE(have_neon);
 static __ro_after_init DEFINE_STATIC_KEY_FALSE(have_ce);
 
-void sha256_blocks_simd(u32 state[SHA256_STATE_WORDS],
+void sha256_blocks_arch(u32 state[SHA256_STATE_WORDS],
 			const u8 *data, size_t nblocks)
 {
 	if (IS_ENABLED(CONFIG_KERNEL_MODE_NEON) &&
-	    static_branch_likely(&have_neon)) {
+	    static_branch_likely(&have_neon) && crypto_simd_usable()) {
 		kernel_neon_begin();
 		if (static_branch_likely(&have_ce))
 			sha256_ce_transform(state, data, nblocks);
 		else
 			sha256_block_data_order_neon(state, data, nblocks);
 		kernel_neon_end();
 	} else {
-		sha256_blocks_arch(state, data, nblocks);
+		sha256_block_data_order(state, data, nblocks);
 	}
 }
-EXPORT_SYMBOL_GPL(sha256_blocks_simd);
+EXPORT_SYMBOL_GPL(sha256_blocks_arch);
 
 bool sha256_is_arch_optimized(void)
 {
 	/* We always can use at least the ARM scalar implementation. */
 	return true;
diff --git a/lib/crypto/arm64/Kconfig b/lib/crypto/arm64/Kconfig
index 129a7685cb4c1..49e57bfdb5b52 100644
--- a/lib/crypto/arm64/Kconfig
+++ b/lib/crypto/arm64/Kconfig
@@ -15,6 +15,5 @@ config CRYPTO_POLY1305_NEON
 
 config CRYPTO_SHA256_ARM64
 	tristate
 	default CRYPTO_LIB_SHA256
 	select CRYPTO_ARCH_HAVE_LIB_SHA256
-	select CRYPTO_ARCH_HAVE_LIB_SHA256_SIMD
diff --git a/lib/crypto/arm64/sha2-armv8.pl b/lib/crypto/arm64/sha2-armv8.pl
index 4aebd20c498bc..35ec9ae99fe16 100644
--- a/lib/crypto/arm64/sha2-armv8.pl
+++ b/lib/crypto/arm64/sha2-armv8.pl
@@ -93,11 +93,11 @@ if ($output =~ /512/) {
 	@sigma1=(17,19,10);
 	$rounds=64;
 	$reg_t="w";
 }
 
-$func="sha${BITS}_blocks_arch";
+$func="sha${BITS}_block_data_order";
 
 ($ctx,$inp,$num,$Ktbl)=map("x$_",(0..2,30));
 
 @X=map("$reg_t$_",(3..15,0..2));
 @V=($A,$B,$C,$D,$E,$F,$G,$H)=map("$reg_t$_",(20..27));
diff --git a/lib/crypto/arm64/sha256.c b/lib/crypto/arm64/sha256.c
index bcf7a3adc0c46..fb9bff40357be 100644
--- a/lib/crypto/arm64/sha256.c
+++ b/lib/crypto/arm64/sha256.c
@@ -4,29 +4,29 @@
  *
  * Copyright 2025 Google LLC
  */
 #include <asm/neon.h>
 #include <crypto/internal/sha2.h>
+#include <crypto/internal/simd.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 
-asmlinkage void sha256_blocks_arch(u32 state[SHA256_STATE_WORDS],
-				   const u8 *data, size_t nblocks);
-EXPORT_SYMBOL_GPL(sha256_blocks_arch);
+asmlinkage void sha256_block_data_order(u32 state[SHA256_STATE_WORDS],
+					const u8 *data, size_t nblocks);
 asmlinkage void sha256_block_neon(u32 state[SHA256_STATE_WORDS],
 				  const u8 *data, size_t nblocks);
 asmlinkage size_t __sha256_ce_transform(u32 state[SHA256_STATE_WORDS],
 					const u8 *data, size_t nblocks);
 
 static __ro_after_init DEFINE_STATIC_KEY_FALSE(have_neon);
 static __ro_after_init DEFINE_STATIC_KEY_FALSE(have_ce);
 
-void sha256_blocks_simd(u32 state[SHA256_STATE_WORDS],
+void sha256_blocks_arch(u32 state[SHA256_STATE_WORDS],
 			const u8 *data, size_t nblocks)
 {
 	if (IS_ENABLED(CONFIG_KERNEL_MODE_NEON) &&
-	    static_branch_likely(&have_neon)) {
+	    static_branch_likely(&have_neon) && crypto_simd_usable()) {
 		if (static_branch_likely(&have_ce)) {
 			do {
 				size_t rem;
 
 				kernel_neon_begin();
@@ -40,14 +40,14 @@ void sha256_blocks_simd(u32 state[SHA256_STATE_WORDS],
 			kernel_neon_begin();
 			sha256_block_neon(state, data, nblocks);
 			kernel_neon_end();
 		}
 	} else {
-		sha256_blocks_arch(state, data, nblocks);
+		sha256_block_data_order(state, data, nblocks);
 	}
 }
-EXPORT_SYMBOL_GPL(sha256_blocks_simd);
+EXPORT_SYMBOL_GPL(sha256_blocks_arch);
 
 bool sha256_is_arch_optimized(void)
 {
 	/* We always can use at least the ARM64 scalar implementation. */
 	return true;
diff --git a/lib/crypto/arm64/sha512.h b/lib/crypto/arm64/sha512.h
index eae14f9752e0b..6abb40b467f2e 100644
--- a/lib/crypto/arm64/sha512.h
+++ b/lib/crypto/arm64/sha512.h
@@ -9,12 +9,12 @@
 #include <crypto/internal/simd.h>
 #include <linux/cpufeature.h>
 
 static __ro_after_init DEFINE_STATIC_KEY_FALSE(have_sha512_insns);
 
-asmlinkage void sha512_blocks_arch(struct sha512_block_state *state,
-				   const u8 *data, size_t nblocks);
+asmlinkage void sha512_block_data_order(struct sha512_block_state *state,
+					const u8 *data, size_t nblocks);
 asmlinkage size_t __sha512_ce_transform(struct sha512_block_state *state,
 					const u8 *data, size_t nblocks);
 
 static void sha512_blocks(struct sha512_block_state *state,
 			  const u8 *data, size_t nblocks)
@@ -30,11 +30,11 @@ static void sha512_blocks(struct sha512_block_state *state,
 			kernel_neon_end();
 			data += (nblocks - rem) * SHA512_BLOCK_SIZE;
 			nblocks = rem;
 		} while (nblocks);
 	} else {
-		sha512_blocks_arch(state, data, nblocks);
+		sha512_block_data_order(state, data, nblocks);
 	}
 }
 
 #ifdef CONFIG_KERNEL_MODE_NEON
 #define sha512_mod_init_arch sha512_mod_init_arch
diff --git a/lib/crypto/riscv/Kconfig b/lib/crypto/riscv/Kconfig
index 47c99ea97ce2c..c100571feb7e8 100644
--- a/lib/crypto/riscv/Kconfig
+++ b/lib/crypto/riscv/Kconfig
@@ -10,7 +10,6 @@ config CRYPTO_CHACHA_RISCV64
 config CRYPTO_SHA256_RISCV64
 	tristate
 	depends on 64BIT && RISCV_ISA_V && TOOLCHAIN_HAS_VECTOR_CRYPTO
 	default CRYPTO_LIB_SHA256
 	select CRYPTO_ARCH_HAVE_LIB_SHA256
-	select CRYPTO_ARCH_HAVE_LIB_SHA256_SIMD
 	select CRYPTO_LIB_SHA256_GENERIC
diff --git a/lib/crypto/riscv/sha256.c b/lib/crypto/riscv/sha256.c
index 71808397dff4c..aa77349d08f30 100644
--- a/lib/crypto/riscv/sha256.c
+++ b/lib/crypto/riscv/sha256.c
@@ -9,36 +9,30 @@
  * Author: Jerry Shih <jerry.shih@sifive.com>
  */
 
 #include <asm/vector.h>
 #include <crypto/internal/sha2.h>
+#include <crypto/internal/simd.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 
 asmlinkage void sha256_transform_zvknha_or_zvknhb_zvkb(
 	u32 state[SHA256_STATE_WORDS], const u8 *data, size_t nblocks);
 
 static __ro_after_init DEFINE_STATIC_KEY_FALSE(have_extensions);
 
-void sha256_blocks_simd(u32 state[SHA256_STATE_WORDS],
+void sha256_blocks_arch(u32 state[SHA256_STATE_WORDS],
 			const u8 *data, size_t nblocks)
 {
-	if (static_branch_likely(&have_extensions)) {
+	if (static_branch_likely(&have_extensions) && crypto_simd_usable()) {
 		kernel_vector_begin();
 		sha256_transform_zvknha_or_zvknhb_zvkb(state, data, nblocks);
 		kernel_vector_end();
 	} else {
 		sha256_blocks_generic(state, data, nblocks);
 	}
 }
-EXPORT_SYMBOL_GPL(sha256_blocks_simd);
-
-void sha256_blocks_arch(u32 state[SHA256_STATE_WORDS],
-			const u8 *data, size_t nblocks)
-{
-	sha256_blocks_generic(state, data, nblocks);
-}
 EXPORT_SYMBOL_GPL(sha256_blocks_arch);
 
 bool sha256_is_arch_optimized(void)
 {
 	return static_key_enabled(&have_extensions);
diff --git a/lib/crypto/x86/Kconfig b/lib/crypto/x86/Kconfig
index 5e94cdee492c2..e344579db3d85 100644
--- a/lib/crypto/x86/Kconfig
+++ b/lib/crypto/x86/Kconfig
@@ -28,7 +28,6 @@ config CRYPTO_POLY1305_X86_64
 config CRYPTO_SHA256_X86_64
 	tristate
 	depends on 64BIT
 	default CRYPTO_LIB_SHA256
 	select CRYPTO_ARCH_HAVE_LIB_SHA256
-	select CRYPTO_ARCH_HAVE_LIB_SHA256_SIMD
 	select CRYPTO_LIB_SHA256_GENERIC
diff --git a/lib/crypto/x86/sha256.c b/lib/crypto/x86/sha256.c
index 80380f8fdcee4..baba74d7d26f2 100644
--- a/lib/crypto/x86/sha256.c
+++ b/lib/crypto/x86/sha256.c
@@ -4,10 +4,11 @@
  *
  * Copyright 2025 Google LLC
  */
 #include <asm/fpu/api.h>
 #include <crypto/internal/sha2.h>
+#include <crypto/internal/simd.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/static_call.h>
 
 asmlinkage void sha256_transform_ssse3(u32 state[SHA256_STATE_WORDS],
@@ -21,28 +22,21 @@ asmlinkage void sha256_ni_transform(u32 state[SHA256_STATE_WORDS],
 
 static __ro_after_init DEFINE_STATIC_KEY_FALSE(have_sha256_x86);
 
 DEFINE_STATIC_CALL(sha256_blocks_x86, sha256_transform_ssse3);
 
-void sha256_blocks_simd(u32 state[SHA256_STATE_WORDS],
+void sha256_blocks_arch(u32 state[SHA256_STATE_WORDS],
 			const u8 *data, size_t nblocks)
 {
-	if (static_branch_likely(&have_sha256_x86)) {
+	if (static_branch_likely(&have_sha256_x86) && crypto_simd_usable()) {
 		kernel_fpu_begin();
 		static_call(sha256_blocks_x86)(state, data, nblocks);
 		kernel_fpu_end();
 	} else {
 		sha256_blocks_generic(state, data, nblocks);
 	}
 }
-EXPORT_SYMBOL_GPL(sha256_blocks_simd);
-
-void sha256_blocks_arch(u32 state[SHA256_STATE_WORDS],
-			const u8 *data, size_t nblocks)
-{
-	sha256_blocks_generic(state, data, nblocks);
-}
 EXPORT_SYMBOL_GPL(sha256_blocks_arch);
 
 bool sha256_is_arch_optimized(void)
 {
 	return static_key_enabled(&have_sha256_x86);
-- 
2.50.0


