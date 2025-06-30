Return-Path: <linuxppc-dev+bounces-9930-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 329B1AEE3A2
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Jun 2025 18:10:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bWB1t5hzQz3byF;
	Tue,  1 Jul 2025 02:09:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1751299777;
	cv=none; b=SczE4DRo/h5EpSsgmMKohIs/xRYygs1Jkm/6clTq+8+ipym19trHefPT5gcipH2dHFliiVnrTFQiIiCFGiWEAGEQxXvzB+3ck3BEHBuWLDkdAWT51FEzO+r6KsNqniWS4WbtrB6SlPYh8Kba3LCTjUWL0EWTi3N2WFwls1vdjMnYmQ2nulUPdYg8ASvyRhWe5DSFcT5jywmEOZ5mRGlOYYc034cXgU9UHXi/62oYz6uFXkR5Jrfzmlp7wiOFgsYLpZng982U4iZUCIC6LaFOnGZ61XLIz43ndLNcBxTTCAZA6+XaqOCco5PedUqpc/ANWdaAN0pUf0FpCnZArMAzow==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1751299777; c=relaxed/relaxed;
	bh=rXjPB0WPwaG9yju+uNssZkv+/LOWPyxZXTERkcw7j0E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mhB3+jex5S2A7z6Vzc/F07WwNQcdffFvM9mR65Zo/OPyNdL/sGS1X3VZGYuSjR9WLYrqgo0nRYkt6/j3d7FfwwBPRtreHA8G5OnsH1EPCB8Cl690/7vtk6a4Q89+j36r2+DmFlh+8STm+cKTW1HzzX+AaqjxCJQI/l6bhFKKOJc/iDizb6DWy9Ycvnfeb539ZRm8NSFn2uPs+7bAfy4mC7TWOAVPO0Hz/XGnC9n5lMLAA67cEUr8sWEEuhmNZMmMixXADSnU5Q9tSknK7jLVASVj5QeM8UG230J30BtmW2nzvWOEImaxVs8pBKDxqTR17Y9w1JSrZIcMy9IrraG5Zg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=B4SBkLPs; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=B4SBkLPs;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bWB1j2bS9z3brP
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Jul 2025 02:09:28 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 633F1A53514;
	Mon, 30 Jun 2025 16:09:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB896C4CEF4;
	Mon, 30 Jun 2025 16:09:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751299766;
	bh=qX6erliMaa6ulFNQWAym5UGYaX+QesAVdQAZCq+fGOg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=B4SBkLPsrDtMSle6gshLLQ/m4UzOebXqZJ7GZ8t9HmQa3kgB01qTNAxJ+E+5SI0tE
	 DNGWpFZnQ42KfzK1RPVMUHDevxo25awdKlOgZ5M7V1/kMazAdbvyoeDHw6yEDYBjSb
	 iZaBZ9D+PNTEt33b1OvxfM4ZesS/fBZeiGK025KQUGyFBVXu14Psn7CYuNbWmtzCjQ
	 L6jJO1k4bEMhGecya7uc2MbbpyDHLgiATkvhMXmup1TwqKqZAdBd/RW12OdtAHwxLc
	 Yo87PcBTc0x13h6KFgGAboUadOVjZ6H54Lpvg+8Bq/LQnkASFOe0y18gFsm1pvPLrz
	 mzGLPZzFJjrFA==
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
Subject: [PATCH v2 11/14] lib/crypto: sha256: Remove sha256_is_arch_optimized()
Date: Mon, 30 Jun 2025 09:06:42 -0700
Message-ID: <20250630160645.3198-12-ebiggers@kernel.org>
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

Remove sha256_is_arch_optimized(), since it is no longer used.

Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 arch/mips/cavium-octeon/crypto/octeon-sha256.c | 6 ------
 include/crypto/internal/sha2.h                 | 8 --------
 lib/crypto/arm/sha256.c                        | 7 -------
 lib/crypto/arm64/sha256.c                      | 7 -------
 lib/crypto/powerpc/sha256.c                    | 6 ------
 lib/crypto/riscv/sha256.c                      | 6 ------
 lib/crypto/s390/sha256.c                       | 6 ------
 lib/crypto/sparc/sha256.c                      | 6 ------
 lib/crypto/x86/sha256.c                        | 6 ------
 9 files changed, 58 deletions(-)

diff --git a/arch/mips/cavium-octeon/crypto/octeon-sha256.c b/arch/mips/cavium-octeon/crypto/octeon-sha256.c
index f8664818d04ec..c7c67bdc2bd06 100644
--- a/arch/mips/cavium-octeon/crypto/octeon-sha256.c
+++ b/arch/mips/cavium-octeon/crypto/octeon-sha256.c
@@ -59,14 +59,8 @@ void sha256_blocks_arch(struct sha256_block_state *state,
 	state64[3] = read_octeon_64bit_hash_dword(3);
 	octeon_crypto_disable(&cop2_state, flags);
 }
 EXPORT_SYMBOL_GPL(sha256_blocks_arch);
 
-bool sha256_is_arch_optimized(void)
-{
-	return octeon_has_crypto();
-}
-EXPORT_SYMBOL_GPL(sha256_is_arch_optimized);
-
 MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION("SHA-256 Secure Hash Algorithm (OCTEON)");
 MODULE_AUTHOR("Aaro Koskinen <aaro.koskinen@iki.fi>");
diff --git a/include/crypto/internal/sha2.h b/include/crypto/internal/sha2.h
index f0f455477bbd7..7915a3a46bc86 100644
--- a/include/crypto/internal/sha2.h
+++ b/include/crypto/internal/sha2.h
@@ -7,18 +7,10 @@
 #include <linux/compiler_attributes.h>
 #include <linux/string.h>
 #include <linux/types.h>
 #include <linux/unaligned.h>
 
-#if IS_ENABLED(CONFIG_CRYPTO_ARCH_HAVE_LIB_SHA256)
-bool sha256_is_arch_optimized(void);
-#else
-static inline bool sha256_is_arch_optimized(void)
-{
-	return false;
-}
-#endif
 void sha256_blocks_generic(struct sha256_block_state *state,
 			   const u8 *data, size_t nblocks);
 void sha256_blocks_arch(struct sha256_block_state *state,
 			const u8 *data, size_t nblocks);
 
diff --git a/lib/crypto/arm/sha256.c b/lib/crypto/arm/sha256.c
index 7d90823586952..27181be0aa92e 100644
--- a/lib/crypto/arm/sha256.c
+++ b/lib/crypto/arm/sha256.c
@@ -35,17 +35,10 @@ void sha256_blocks_arch(struct sha256_block_state *state,
 		sha256_block_data_order(state, data, nblocks);
 	}
 }
 EXPORT_SYMBOL_GPL(sha256_blocks_arch);
 
-bool sha256_is_arch_optimized(void)
-{
-	/* We always can use at least the ARM scalar implementation. */
-	return true;
-}
-EXPORT_SYMBOL_GPL(sha256_is_arch_optimized);
-
 static int __init sha256_arm_mod_init(void)
 {
 	if (IS_ENABLED(CONFIG_KERNEL_MODE_NEON) && (elf_hwcap & HWCAP_NEON)) {
 		static_branch_enable(&have_neon);
 		if (elf_hwcap2 & HWCAP2_SHA2)
diff --git a/lib/crypto/arm64/sha256.c b/lib/crypto/arm64/sha256.c
index 609ffb8151987..a5a4982767089 100644
--- a/lib/crypto/arm64/sha256.c
+++ b/lib/crypto/arm64/sha256.c
@@ -45,17 +45,10 @@ void sha256_blocks_arch(struct sha256_block_state *state,
 		sha256_block_data_order(state, data, nblocks);
 	}
 }
 EXPORT_SYMBOL_GPL(sha256_blocks_arch);
 
-bool sha256_is_arch_optimized(void)
-{
-	/* We always can use at least the ARM64 scalar implementation. */
-	return true;
-}
-EXPORT_SYMBOL_GPL(sha256_is_arch_optimized);
-
 static int __init sha256_arm64_mod_init(void)
 {
 	if (IS_ENABLED(CONFIG_KERNEL_MODE_NEON) &&
 	    cpu_have_named_feature(ASIMD)) {
 		static_branch_enable(&have_neon);
diff --git a/lib/crypto/powerpc/sha256.c b/lib/crypto/powerpc/sha256.c
index c3f844ae0aceb..437e587b05754 100644
--- a/lib/crypto/powerpc/sha256.c
+++ b/lib/crypto/powerpc/sha256.c
@@ -58,13 +58,7 @@ void sha256_blocks_arch(struct sha256_block_state *state,
 		nblocks -= unit;
 	} while (nblocks);
 }
 EXPORT_SYMBOL_GPL(sha256_blocks_arch);
 
-bool sha256_is_arch_optimized(void)
-{
-	return true;
-}
-EXPORT_SYMBOL_GPL(sha256_is_arch_optimized);
-
 MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION("SHA-256 Secure Hash Algorithm, SPE optimized");
diff --git a/lib/crypto/riscv/sha256.c b/lib/crypto/riscv/sha256.c
index a2079aa3ae925..01004cb9c6e9e 100644
--- a/lib/crypto/riscv/sha256.c
+++ b/lib/crypto/riscv/sha256.c
@@ -32,16 +32,10 @@ void sha256_blocks_arch(struct sha256_block_state *state,
 		sha256_blocks_generic(state, data, nblocks);
 	}
 }
 EXPORT_SYMBOL_GPL(sha256_blocks_arch);
 
-bool sha256_is_arch_optimized(void)
-{
-	return static_key_enabled(&have_extensions);
-}
-EXPORT_SYMBOL_GPL(sha256_is_arch_optimized);
-
 static int __init riscv64_sha256_mod_init(void)
 {
 	/* Both zvknha and zvknhb provide the SHA-256 instructions. */
 	if ((riscv_isa_extension_available(NULL, ZVKNHA) ||
 	     riscv_isa_extension_available(NULL, ZVKNHB)) &&
diff --git a/lib/crypto/s390/sha256.c b/lib/crypto/s390/sha256.c
index fb565718f7539..6ebfd35a5d44c 100644
--- a/lib/crypto/s390/sha256.c
+++ b/lib/crypto/s390/sha256.c
@@ -21,16 +21,10 @@ void sha256_blocks_arch(struct sha256_block_state *state,
 	else
 		sha256_blocks_generic(state, data, nblocks);
 }
 EXPORT_SYMBOL_GPL(sha256_blocks_arch);
 
-bool sha256_is_arch_optimized(void)
-{
-	return static_key_enabled(&have_cpacf_sha256);
-}
-EXPORT_SYMBOL_GPL(sha256_is_arch_optimized);
-
 static int __init sha256_s390_mod_init(void)
 {
 	if (cpu_have_feature(S390_CPU_FEATURE_MSA) &&
 	    cpacf_query_func(CPACF_KIMD, CPACF_KIMD_SHA_256))
 		static_branch_enable(&have_cpacf_sha256);
diff --git a/lib/crypto/sparc/sha256.c b/lib/crypto/sparc/sha256.c
index 060664b88a6d3..f41c109c1c18d 100644
--- a/lib/crypto/sparc/sha256.c
+++ b/lib/crypto/sparc/sha256.c
@@ -30,16 +30,10 @@ void sha256_blocks_arch(struct sha256_block_state *state,
 	else
 		sha256_blocks_generic(state, data, nblocks);
 }
 EXPORT_SYMBOL_GPL(sha256_blocks_arch);
 
-bool sha256_is_arch_optimized(void)
-{
-	return static_key_enabled(&have_sha256_opcodes);
-}
-EXPORT_SYMBOL_GPL(sha256_is_arch_optimized);
-
 static int __init sha256_sparc64_mod_init(void)
 {
 	unsigned long cfr;
 
 	if (!(sparc64_elf_hwcap & HWCAP_SPARC_CRYPTO))
diff --git a/lib/crypto/x86/sha256.c b/lib/crypto/x86/sha256.c
index cbb45defbefab..9ee38d2b3d572 100644
--- a/lib/crypto/x86/sha256.c
+++ b/lib/crypto/x86/sha256.c
@@ -35,16 +35,10 @@ void sha256_blocks_arch(struct sha256_block_state *state,
 		sha256_blocks_generic(state, data, nblocks);
 	}
 }
 EXPORT_SYMBOL_GPL(sha256_blocks_arch);
 
-bool sha256_is_arch_optimized(void)
-{
-	return static_key_enabled(&have_sha256_x86);
-}
-EXPORT_SYMBOL_GPL(sha256_is_arch_optimized);
-
 static int __init sha256_x86_mod_init(void)
 {
 	if (boot_cpu_has(X86_FEATURE_SHA_NI)) {
 		static_call_update(sha256_blocks_x86, sha256_ni_transform);
 	} else if (cpu_has_xfeatures(XFEATURE_MASK_SSE |
-- 
2.50.0


