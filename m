Return-Path: <linuxppc-dev+bounces-9713-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AE02AE7805
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Jun 2025 09:12:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bRtJL4t25z3bkb;
	Wed, 25 Jun 2025 17:10:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750835442;
	cv=none; b=fjKXNrzp4NTRpKfs6m1yBt6YzbOiC5vWjGjZZfAqoByF/y0v8OP0H0BPDgchWm5GPh7X/cFgO7nFe7mNqOZxeBpFn7Ait8wHL+3+NWtnkt5guWwUCkJqehTN9Da9Q6XoWNt+qr628+HqIfFdI8NF1rNm7FZ1lvALtY0F22k1p5ZugpDFhIR377pGYnDBst78L/bI6utbbbS33YpJbIJtgoVsKeYPb5HGaFOeYXecvIGwOyfwiReZ7MQml59PZNq1gNDVODCLobsA6V0iB5DN4UcZl2XpX+tXAtZ0IRf5J1nBFYCvgCEq4dhgXu8u1OdRZhPuCPG3qGHFgGMyf8X6cQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750835442; c=relaxed/relaxed;
	bh=DcSQMx/JcTCKGliMcNZL8jf+v6cWfvSJ9EX6mXXJEHk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aVZAQtzFqfM+2sM1Ftna3fTcPFG0uZFckTXiYnVN7oej6IJ/+ssANWvzY5+q8LRwoiZi88tLil7Xka1Zpb5O9IFtdwzXRMEkAUaUvt64wHb7RzLeg3HRQcfRDGRstGjHAIVbiP8NLjLLVtWrpY5CmyeTKlziY0Bu9emSTIoW5ldxwp63D9cYOl9jNRpDqMybBXJQANzhN32c+u5YxuSjhZEwTLT6G1OKg9ISM5F8T8qk87qRsvr0IazMwNE11OhNou1C6LxJH4z19tedo8lJtYKgxCpeV4IFoWl12y5QXuXBcxo4QA6Ggfenn5+Mm4fGbYA5el7E2ZtTdjkpyL/8Lg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=kyYjW82E; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=kyYjW82E;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bRtJD4qvZz2yPS
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Jun 2025 17:10:36 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B3546627C7;
	Wed, 25 Jun 2025 07:10:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1651AC4CEEE;
	Wed, 25 Jun 2025 07:10:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750835434;
	bh=S+CsVx9dQpCGjijF7e+ZbdDM5QBgscfKC4GdP91vltQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kyYjW82EC/38db+3veMXnZFHE54YSYV+kKjN6MFru4nkzIGgs46VmKUI0bATwPXY4
	 gOrldjdHacg1a2nKYAdSM9e5WzJKF99M+vkA0mtbd+MFOKqNwPSU3aC4UYtBfPgMfB
	 ialFlK523z2IO+ksv6EWAQLoB8sI/sb9SU3yH1kmSvVxjGY1NEerbkRO4S715T8EJR
	 zC2tV9CDuqId2iSscOziziqU7Gve96UZNpI2G3CrpUMmrKS9N8BLz0fTu2HNx+E9tz
	 Nd4Jx1zyC0AtoiXb8STQlrXgmZFEx+ZTv9FZoarslRIPkYei/QBp+yslpmjgACXVM4
	 LOWPa81y+8YLg==
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
Subject: [PATCH 15/18] lib/crypto: sha512: Remove sha256_is_arch_optimized()
Date: Wed, 25 Jun 2025 00:08:16 -0700
Message-ID: <20250625070819.1496119-16-ebiggers@kernel.org>
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
index 51028484ccdc7..f724e6ad03a9f 100644
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


