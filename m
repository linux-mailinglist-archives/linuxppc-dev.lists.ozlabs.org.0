Return-Path: <linuxppc-dev+bounces-10218-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 668F6B02DD6
	for <lists+linuxppc-dev@lfdr.de>; Sun, 13 Jul 2025 01:28:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bfl8Z2xtTz3bn4;
	Sun, 13 Jul 2025 09:26:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:4641:c500::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1752362798;
	cv=none; b=DjYXanh8hC1aS9qHvy9NHQgkf642bxQYuTUwXqjReZfi83QAWbwOnzEnfW8q/cuxAfT00OUa8EEjWBuF2NoDAcCB24/ROuGwPLlP85JMbBLU9txUM1fMrt2CfdFVZZS9l2fCDVbHpLzeoxcNQn3y31QW6jvt0K5jSzRfASRkeGKwQPvzQWkvlVzWNUaEcvCRvcesq4Lfk3kfLchquCVEIT/4HXgfJbatl1yaNNl0YcyG9rNlUEb968DfxjJ/QpW65WKiBx0Yc+vN31IYkOrfVqP6iIkmPDXxxX4uXewgtthqjjZkINNiZHXzKZ2a7UbPmSezJxWykbQT/U10Yuhvfg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1752362798; c=relaxed/relaxed;
	bh=j6a8OqfztNQTVyQoSmQlb2BhP/FOfjb/ScMebHrbUwg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Fjd9y/qtndyLL0tnwClTUZyPlx1usDtrov1bciK65nSvr/06T+qFlZWU8vXrlRUn5cXaxNQ3qnPS9yij5le/9uzkhsV5ElWJTjrE76mHsEdsJi2uDOsiZt2qJmPM7mQOtBWLUpyv6WqpXaOvghGfn9VJpq1I8rh3fyyASoXqiKIUde+LC6b9Q3jUcuIh4RZrpSvA2bbJGVyXlMGOfghc5T3o3Kt952Q8z79OvpzmAp8ZIo60rLl+1VMCirNG1HKTTPL1KpOHdeOLDWBqFm3GEjcOuwn0rs5YEdE3HPZlHAq+NQczteL3GGGV36NlAHKMubJxW8UUxJO8J4+4BHojWQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=CbF5yfXh; dkim-atps=neutral; spf=pass (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=CbF5yfXh;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bfl8P4Q8sz3bV6
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 13 Jul 2025 09:26:28 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B7D1A5C557E;
	Sat, 12 Jul 2025 23:26:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B235C4CEF5;
	Sat, 12 Jul 2025 23:26:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752362786;
	bh=SPZChn54e0x1BPD7Cx0ngiSiHMegWn4xMaHKEKQ8lCU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CbF5yfXhHCPwFCl1Aj5K7Wgk2SBbDM2WfVLW1eTPqq2c9DntFa1SRnHJa8Z+quOlm
	 sjhK1lqAmAHpZAdWXsWuMkjhL73vs0bmGY+OMblmG81Eo4Ynm/sEKhTRN5t7hwcokm
	 2EtWV+/wbfnGQWQouMQy459/x2nXoGmXARst9VxMwJLrUcYUUIebI5KlvmxcVAwIVB
	 1j3joqn+++kkM9FIQWqfg2bPtu3B+jdWA9BRyWgjFIkYPSjxX2i+6LCf25lzJulBfK
	 ypHjOXv64A1uKvIsnVEc8E4n4z8XmdpDhrHdOQVENmrQcTe5hJJZD2mqR2eogiRIXb
	 sqeaCAY05kiqA==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org,
	x86@kernel.org,
	Eric Biggers <ebiggers@kernel.org>
Subject: [PATCH 13/26] lib/crypto: x86/sha1: Migrate optimized code into library
Date: Sat, 12 Jul 2025 16:23:04 -0700
Message-ID: <20250712232329.818226-14-ebiggers@kernel.org>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250712232329.818226-1-ebiggers@kernel.org>
References: <20250712232329.818226-1-ebiggers@kernel.org>
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

Instead of exposing the x86-optimized SHA-1 code via x86-specific
crypto_shash algorithms, instead just implement the sha1_blocks()
library function.  This is much simpler, it makes the SHA-1 library
functions be x86-optimized, and it fixes the longstanding issue where
the x86-optimized SHA-1 code was disabled by default.  SHA-1 still
remains available through crypto_shash, but individual architectures no
longer need to handle it.

Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 arch/x86/crypto/Kconfig                       |  14 -
 arch/x86/crypto/Makefile                      |   3 -
 arch/x86/crypto/sha1_ssse3_glue.c             | 324 ------------------
 lib/crypto/Kconfig                            |   1 +
 lib/crypto/Makefile                           |   3 +
 .../crypto/x86/sha1-avx2-asm.S                |   7 +-
 .../crypto/x86/sha1-ni-asm.S                  |  23 +-
 .../crypto/x86/sha1-ssse3-and-avx.S           |  13 +-
 lib/crypto/x86/sha1.h                         |  75 ++++
 9 files changed, 95 insertions(+), 368 deletions(-)
 delete mode 100644 arch/x86/crypto/sha1_ssse3_glue.c
 rename arch/x86/crypto/sha1_avx2_x86_64_asm.S => lib/crypto/x86/sha1-avx2-asm.S (98%)
 rename arch/x86/crypto/sha1_ni_asm.S => lib/crypto/x86/sha1-ni-asm.S (90%)
 rename arch/x86/crypto/sha1_ssse3_asm.S => lib/crypto/x86/sha1-ssse3-and-avx.S (97%)
 create mode 100644 lib/crypto/x86/sha1.h

diff --git a/arch/x86/crypto/Kconfig b/arch/x86/crypto/Kconfig
index eb641a300154e..94016c60561e2 100644
--- a/arch/x86/crypto/Kconfig
+++ b/arch/x86/crypto/Kconfig
@@ -374,24 +374,10 @@ config CRYPTO_POLYVAL_CLMUL_NI
 	  POLYVAL hash function for HCTR2
 
 	  Architecture: x86_64 using:
 	  - CLMUL-NI (carry-less multiplication new instructions)
 
-config CRYPTO_SHA1_SSSE3
-	tristate "Hash functions: SHA-1 (SSSE3/AVX/AVX2/SHA-NI)"
-	depends on 64BIT
-	select CRYPTO_SHA1
-	select CRYPTO_HASH
-	help
-	  SHA-1 secure hash algorithm (FIPS 180)
-
-	  Architecture: x86_64 using:
-	  - SSSE3 (Supplemental SSE3)
-	  - AVX (Advanced Vector Extensions)
-	  - AVX2 (Advanced Vector Extensions 2)
-	  - SHA-NI (SHA Extensions New Instructions)
-
 config CRYPTO_SM3_AVX_X86_64
 	tristate "Hash functions: SM3 (AVX)"
 	depends on 64BIT
 	select CRYPTO_HASH
 	select CRYPTO_LIB_SM3
diff --git a/arch/x86/crypto/Makefile b/arch/x86/crypto/Makefile
index d31348be83704..d402963d6b579 100644
--- a/arch/x86/crypto/Makefile
+++ b/arch/x86/crypto/Makefile
@@ -49,13 +49,10 @@ aesni-intel-$(CONFIG_64BIT) += aes-ctr-avx-x86_64.o \
 			       aes-xts-avx-x86_64.o
 ifeq ($(CONFIG_AS_VAES)$(CONFIG_AS_VPCLMULQDQ),yy)
 aesni-intel-$(CONFIG_64BIT) += aes-gcm-avx10-x86_64.o
 endif
 
-obj-$(CONFIG_CRYPTO_SHA1_SSSE3) += sha1-ssse3.o
-sha1-ssse3-y := sha1_avx2_x86_64_asm.o sha1_ssse3_asm.o sha1_ni_asm.o sha1_ssse3_glue.o
-
 obj-$(CONFIG_CRYPTO_GHASH_CLMUL_NI_INTEL) += ghash-clmulni-intel.o
 ghash-clmulni-intel-y := ghash-clmulni-intel_asm.o ghash-clmulni-intel_glue.o
 
 obj-$(CONFIG_CRYPTO_POLYVAL_CLMUL_NI) += polyval-clmulni.o
 polyval-clmulni-y := polyval-clmulni_asm.o polyval-clmulni_glue.o
diff --git a/arch/x86/crypto/sha1_ssse3_glue.c b/arch/x86/crypto/sha1_ssse3_glue.c
deleted file mode 100644
index 826579a7473c4..0000000000000
--- a/arch/x86/crypto/sha1_ssse3_glue.c
+++ /dev/null
@@ -1,324 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-or-later
-/*
- * Cryptographic API.
- *
- * Glue code for the SHA1 Secure Hash Algorithm assembler implementations
- * using SSSE3, AVX, AVX2, and SHA-NI instructions.
- *
- * This file is based on sha1_generic.c
- *
- * Copyright (c) Alan Smithee.
- * Copyright (c) Andrew McDonald <andrew@mcdonald.org.uk>
- * Copyright (c) Jean-Francois Dive <jef@linuxbe.org>
- * Copyright (c) Mathias Krause <minipli@googlemail.com>
- * Copyright (c) Chandramouli Narayanan <mouli@linux.intel.com>
- */
-
-#define pr_fmt(fmt)	KBUILD_MODNAME ": " fmt
-
-#include <asm/cpu_device_id.h>
-#include <asm/simd.h>
-#include <crypto/internal/hash.h>
-#include <crypto/sha1.h>
-#include <crypto/sha1_base.h>
-#include <linux/errno.h>
-#include <linux/kernel.h>
-#include <linux/module.h>
-
-static const struct x86_cpu_id module_cpu_ids[] = {
-	X86_MATCH_FEATURE(X86_FEATURE_SHA_NI, NULL),
-	X86_MATCH_FEATURE(X86_FEATURE_AVX2, NULL),
-	X86_MATCH_FEATURE(X86_FEATURE_AVX, NULL),
-	X86_MATCH_FEATURE(X86_FEATURE_SSSE3, NULL),
-	{}
-};
-MODULE_DEVICE_TABLE(x86cpu, module_cpu_ids);
-
-static inline int sha1_update_x86(struct shash_desc *desc, const u8 *data,
-			      unsigned int len, sha1_block_fn *sha1_xform)
-{
-	int remain;
-
-	/*
-	 * Make sure struct sha1_state begins directly with the SHA1
-	 * 160-bit internal state, as this is what the asm functions expect.
-	 */
-	BUILD_BUG_ON(offsetof(struct sha1_state, state) != 0);
-
-	kernel_fpu_begin();
-	remain = sha1_base_do_update_blocks(desc, data, len, sha1_xform);
-	kernel_fpu_end();
-
-	return remain;
-}
-
-static inline int sha1_finup(struct shash_desc *desc, const u8 *data,
-			     unsigned int len, u8 *out,
-			     sha1_block_fn *sha1_xform)
-{
-	kernel_fpu_begin();
-	sha1_base_do_finup(desc, data, len, sha1_xform);
-	kernel_fpu_end();
-
-	return sha1_base_finish(desc, out);
-}
-
-asmlinkage void sha1_transform_ssse3(struct sha1_state *state,
-				     const u8 *data, int blocks);
-
-static int sha1_ssse3_update(struct shash_desc *desc, const u8 *data,
-			     unsigned int len)
-{
-	return sha1_update_x86(desc, data, len, sha1_transform_ssse3);
-}
-
-static int sha1_ssse3_finup(struct shash_desc *desc, const u8 *data,
-			      unsigned int len, u8 *out)
-{
-	return sha1_finup(desc, data, len, out, sha1_transform_ssse3);
-}
-
-static struct shash_alg sha1_ssse3_alg = {
-	.digestsize	=	SHA1_DIGEST_SIZE,
-	.init		=	sha1_base_init,
-	.update		=	sha1_ssse3_update,
-	.finup		=	sha1_ssse3_finup,
-	.descsize	=	SHA1_STATE_SIZE,
-	.base		=	{
-		.cra_name	=	"sha1",
-		.cra_driver_name =	"sha1-ssse3",
-		.cra_priority	=	150,
-		.cra_flags	=	CRYPTO_AHASH_ALG_BLOCK_ONLY,
-		.cra_blocksize	=	SHA1_BLOCK_SIZE,
-		.cra_module	=	THIS_MODULE,
-	}
-};
-
-static int register_sha1_ssse3(void)
-{
-	if (boot_cpu_has(X86_FEATURE_SSSE3))
-		return crypto_register_shash(&sha1_ssse3_alg);
-	return 0;
-}
-
-static void unregister_sha1_ssse3(void)
-{
-	if (boot_cpu_has(X86_FEATURE_SSSE3))
-		crypto_unregister_shash(&sha1_ssse3_alg);
-}
-
-asmlinkage void sha1_transform_avx(struct sha1_state *state,
-				   const u8 *data, int blocks);
-
-static int sha1_avx_update(struct shash_desc *desc, const u8 *data,
-			     unsigned int len)
-{
-	return sha1_update_x86(desc, data, len, sha1_transform_avx);
-}
-
-static int sha1_avx_finup(struct shash_desc *desc, const u8 *data,
-			      unsigned int len, u8 *out)
-{
-	return sha1_finup(desc, data, len, out, sha1_transform_avx);
-}
-
-static struct shash_alg sha1_avx_alg = {
-	.digestsize	=	SHA1_DIGEST_SIZE,
-	.init		=	sha1_base_init,
-	.update		=	sha1_avx_update,
-	.finup		=	sha1_avx_finup,
-	.descsize	=	SHA1_STATE_SIZE,
-	.base		=	{
-		.cra_name	=	"sha1",
-		.cra_driver_name =	"sha1-avx",
-		.cra_priority	=	160,
-		.cra_flags	=	CRYPTO_AHASH_ALG_BLOCK_ONLY,
-		.cra_blocksize	=	SHA1_BLOCK_SIZE,
-		.cra_module	=	THIS_MODULE,
-	}
-};
-
-static bool avx_usable(void)
-{
-	if (!cpu_has_xfeatures(XFEATURE_MASK_SSE | XFEATURE_MASK_YMM, NULL)) {
-		if (boot_cpu_has(X86_FEATURE_AVX))
-			pr_info("AVX detected but unusable.\n");
-		return false;
-	}
-
-	return true;
-}
-
-static int register_sha1_avx(void)
-{
-	if (avx_usable())
-		return crypto_register_shash(&sha1_avx_alg);
-	return 0;
-}
-
-static void unregister_sha1_avx(void)
-{
-	if (avx_usable())
-		crypto_unregister_shash(&sha1_avx_alg);
-}
-
-#define SHA1_AVX2_BLOCK_OPTSIZE	4	/* optimal 4*64 bytes of SHA1 blocks */
-
-asmlinkage void sha1_transform_avx2(struct sha1_state *state,
-				    const u8 *data, int blocks);
-
-static bool avx2_usable(void)
-{
-	if (avx_usable() && boot_cpu_has(X86_FEATURE_AVX2)
-		&& boot_cpu_has(X86_FEATURE_BMI1)
-		&& boot_cpu_has(X86_FEATURE_BMI2))
-		return true;
-
-	return false;
-}
-
-static inline void sha1_apply_transform_avx2(struct sha1_state *state,
-					     const u8 *data, int blocks)
-{
-	/* Select the optimal transform based on data block size */
-	if (blocks >= SHA1_AVX2_BLOCK_OPTSIZE)
-		sha1_transform_avx2(state, data, blocks);
-	else
-		sha1_transform_avx(state, data, blocks);
-}
-
-static int sha1_avx2_update(struct shash_desc *desc, const u8 *data,
-			     unsigned int len)
-{
-	return sha1_update_x86(desc, data, len, sha1_apply_transform_avx2);
-}
-
-static int sha1_avx2_finup(struct shash_desc *desc, const u8 *data,
-			      unsigned int len, u8 *out)
-{
-	return sha1_finup(desc, data, len, out, sha1_apply_transform_avx2);
-}
-
-static struct shash_alg sha1_avx2_alg = {
-	.digestsize	=	SHA1_DIGEST_SIZE,
-	.init		=	sha1_base_init,
-	.update		=	sha1_avx2_update,
-	.finup		=	sha1_avx2_finup,
-	.descsize	=	SHA1_STATE_SIZE,
-	.base		=	{
-		.cra_name	=	"sha1",
-		.cra_driver_name =	"sha1-avx2",
-		.cra_priority	=	170,
-		.cra_flags	=	CRYPTO_AHASH_ALG_BLOCK_ONLY,
-		.cra_blocksize	=	SHA1_BLOCK_SIZE,
-		.cra_module	=	THIS_MODULE,
-	}
-};
-
-static int register_sha1_avx2(void)
-{
-	if (avx2_usable())
-		return crypto_register_shash(&sha1_avx2_alg);
-	return 0;
-}
-
-static void unregister_sha1_avx2(void)
-{
-	if (avx2_usable())
-		crypto_unregister_shash(&sha1_avx2_alg);
-}
-
-asmlinkage void sha1_ni_transform(struct sha1_state *digest, const u8 *data,
-				  int rounds);
-
-static int sha1_ni_update(struct shash_desc *desc, const u8 *data,
-			     unsigned int len)
-{
-	return sha1_update_x86(desc, data, len, sha1_ni_transform);
-}
-
-static int sha1_ni_finup(struct shash_desc *desc, const u8 *data,
-			      unsigned int len, u8 *out)
-{
-	return sha1_finup(desc, data, len, out, sha1_ni_transform);
-}
-
-static struct shash_alg sha1_ni_alg = {
-	.digestsize	=	SHA1_DIGEST_SIZE,
-	.init		=	sha1_base_init,
-	.update		=	sha1_ni_update,
-	.finup		=	sha1_ni_finup,
-	.descsize	=	SHA1_STATE_SIZE,
-	.base		=	{
-		.cra_name	=	"sha1",
-		.cra_driver_name =	"sha1-ni",
-		.cra_priority	=	250,
-		.cra_flags	=	CRYPTO_AHASH_ALG_BLOCK_ONLY,
-		.cra_blocksize	=	SHA1_BLOCK_SIZE,
-		.cra_module	=	THIS_MODULE,
-	}
-};
-
-static int register_sha1_ni(void)
-{
-	if (boot_cpu_has(X86_FEATURE_SHA_NI))
-		return crypto_register_shash(&sha1_ni_alg);
-	return 0;
-}
-
-static void unregister_sha1_ni(void)
-{
-	if (boot_cpu_has(X86_FEATURE_SHA_NI))
-		crypto_unregister_shash(&sha1_ni_alg);
-}
-
-static int __init sha1_ssse3_mod_init(void)
-{
-	if (!x86_match_cpu(module_cpu_ids))
-		return -ENODEV;
-
-	if (register_sha1_ssse3())
-		goto fail;
-
-	if (register_sha1_avx()) {
-		unregister_sha1_ssse3();
-		goto fail;
-	}
-
-	if (register_sha1_avx2()) {
-		unregister_sha1_avx();
-		unregister_sha1_ssse3();
-		goto fail;
-	}
-
-	if (register_sha1_ni()) {
-		unregister_sha1_avx2();
-		unregister_sha1_avx();
-		unregister_sha1_ssse3();
-		goto fail;
-	}
-
-	return 0;
-fail:
-	return -ENODEV;
-}
-
-static void __exit sha1_ssse3_mod_fini(void)
-{
-	unregister_sha1_ni();
-	unregister_sha1_avx2();
-	unregister_sha1_avx();
-	unregister_sha1_ssse3();
-}
-
-module_init(sha1_ssse3_mod_init);
-module_exit(sha1_ssse3_mod_fini);
-
-MODULE_LICENSE("GPL");
-MODULE_DESCRIPTION("SHA1 Secure Hash Algorithm, Supplemental SSE3 accelerated");
-
-MODULE_ALIAS_CRYPTO("sha1");
-MODULE_ALIAS_CRYPTO("sha1-ssse3");
-MODULE_ALIAS_CRYPTO("sha1-avx");
-MODULE_ALIAS_CRYPTO("sha1-avx2");
-MODULE_ALIAS_CRYPTO("sha1-ni");
diff --git a/lib/crypto/Kconfig b/lib/crypto/Kconfig
index 3405789bebbe6..c2b65b6a9bb6f 100644
--- a/lib/crypto/Kconfig
+++ b/lib/crypto/Kconfig
@@ -150,10 +150,11 @@ config CRYPTO_LIB_SHA1_ARCH
 	default y if ARM64 && KERNEL_MODE_NEON
 	default y if MIPS && CPU_CAVIUM_OCTEON
 	default y if PPC
 	default y if S390
 	default y if SPARC64
+	default y if X86_64
 
 config CRYPTO_LIB_SHA256
 	tristate
 	help
 	  Enable the SHA-256 library interface. This interface may be fulfilled
diff --git a/lib/crypto/Makefile b/lib/crypto/Makefile
index 6e49e00b4a0a2..e4151be2ebd44 100644
--- a/lib/crypto/Makefile
+++ b/lib/crypto/Makefile
@@ -82,10 +82,13 @@ libsha1-$(CONFIG_ARM64) += arm64/sha1-ce-core.o
 ifeq ($(CONFIG_PPC),y)
 libsha1-y += powerpc/sha1-powerpc-asm.o
 libsha1-$(CONFIG_SPE) += powerpc/sha1-spe-asm.o
 endif
 libsha1-$(CONFIG_SPARC) += sparc/sha1_asm.o
+libsha1-$(CONFIG_X86) += x86/sha1-ssse3-and-avx.o \
+			 x86/sha1-avx2-asm.o \
+			 x86/sha1-ni-asm.o
 endif # CONFIG_CRYPTO_LIB_SHA1_ARCH
 
 ################################################################################
 
 obj-$(CONFIG_CRYPTO_LIB_SHA256) += libsha256.o
diff --git a/arch/x86/crypto/sha1_avx2_x86_64_asm.S b/lib/crypto/x86/sha1-avx2-asm.S
similarity index 98%
rename from arch/x86/crypto/sha1_avx2_x86_64_asm.S
rename to lib/crypto/x86/sha1-avx2-asm.S
index 4b49bdc952658..91b2dc6db179f 100644
--- a/arch/x86/crypto/sha1_avx2_x86_64_asm.S
+++ b/lib/crypto/x86/sha1-avx2-asm.S
@@ -60,15 +60,12 @@
  *
  *This implementation is based on the previous SSSE3 release:
  *Visit http://software.intel.com/en-us/articles/
  *and refer to improving-the-performance-of-the-secure-hash-algorithm-1/
  *
- *Updates 20-byte SHA-1 record at start of 'state', from 'input', for
- *even number of 'blocks' consecutive 64-byte blocks.
- *
- *extern "C" void sha1_transform_avx2(
- *	struct sha1_state *state, const u8* input, int blocks );
+ * void sha1_transform_avx2(struct sha1_block_state *state,
+ *			    const u8 *data, size_t nblocks);
  */
 
 #include <linux/linkage.h>
 
 #define	CTX	%rdi	/* arg1 */
diff --git a/arch/x86/crypto/sha1_ni_asm.S b/lib/crypto/x86/sha1-ni-asm.S
similarity index 90%
rename from arch/x86/crypto/sha1_ni_asm.S
rename to lib/crypto/x86/sha1-ni-asm.S
index cade913d48822..3989b0642ff5f 100644
--- a/arch/x86/crypto/sha1_ni_asm.S
+++ b/lib/crypto/x86/sha1-ni-asm.S
@@ -52,11 +52,10 @@
  * OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
  *
  */
 
 #include <linux/linkage.h>
-#include <linux/cfi_types.h>
 
 #define DIGEST_PTR	%rdi	/* 1st arg */
 #define DATA_PTR	%rsi	/* 2nd arg */
 #define NUM_BLKS	%rdx	/* 3rd arg */
 
@@ -72,30 +71,26 @@
 #define MSG3		%xmm6
 #define SHUF_MASK	%xmm7
 
 
 /*
- * Intel SHA Extensions optimized implementation of a SHA-1 update function
+ * Intel SHA Extensions optimized implementation of a SHA-1 block function
  *
- * The function takes a pointer to the current hash values, a pointer to the
- * input data, and a number of 64 byte blocks to process.  Once all blocks have
- * been processed, the digest pointer is  updated with the resulting hash value.
- * The function only processes complete blocks, there is no functionality to
- * store partial blocks. All message padding and hash value initialization must
- * be done outside the update function.
+ * This function takes a pointer to the current SHA-1 state, a pointer to the
+ * input data, and the number of 64-byte blocks to process.  Once all blocks
+ * have been processed, the state is updated with the new state.  This function
+ * only processes complete blocks.  State initialization, buffering of partial
+ * blocks, and digest finalization are expected to be handled elsewhere.
  *
  * The indented lines in the loop are instructions related to rounds processing.
  * The non-indented lines are instructions related to the message schedule.
  *
- * void sha1_ni_transform(uint32_t *digest, const void *data,
-		uint32_t numBlocks)
- * digest : pointer to digest
- * data: pointer to input data
- * numBlocks: Number of blocks to process
+ * void sha1_ni_transform(struct sha1_block_state *state,
+ *			  const u8 *data, size_t nblocks)
  */
 .text
-SYM_TYPED_FUNC_START(sha1_ni_transform)
+SYM_FUNC_START(sha1_ni_transform)
 	push		%rbp
 	mov		%rsp, %rbp
 	sub		$FRAME_SIZE, %rsp
 	and		$~0xF, %rsp
 
diff --git a/arch/x86/crypto/sha1_ssse3_asm.S b/lib/crypto/x86/sha1-ssse3-and-avx.S
similarity index 97%
rename from arch/x86/crypto/sha1_ssse3_asm.S
rename to lib/crypto/x86/sha1-ssse3-and-avx.S
index f54988c80eb40..78b48cb09c5b9 100644
--- a/arch/x86/crypto/sha1_ssse3_asm.S
+++ b/lib/crypto/x86/sha1-ssse3-and-avx.S
@@ -23,11 +23,10 @@
  * Converted to AT&T syntax and adapted for inclusion in the Linux kernel:
  *   Author: Mathias Krause <minipli@googlemail.com>
  */
 
 #include <linux/linkage.h>
-#include <linux/cfi_types.h>
 
 #define CTX	%rdi	// arg1
 #define BUF	%rsi	// arg2
 #define CNT	%rdx	// arg3
 
@@ -66,11 +65,11 @@
 /*
  * This macro implements the SHA-1 function's body for single 64-byte block
  * param: function's name
  */
 .macro SHA1_VECTOR_ASM  name
-	SYM_TYPED_FUNC_START(\name)
+	SYM_FUNC_START(\name)
 
 	push	%rbx
 	push	%r12
 	push	%rbp
 	mov	%rsp, %rbp
@@ -459,14 +458,12 @@ W_PRECALC_SSSE3
 .endm
 
 /*
  * SSSE3 optimized implementation:
  *
- * extern "C" void sha1_transform_ssse3(struct sha1_state *state,
- *					const u8 *data, int blocks);
- *
- * Note that struct sha1_state is assumed to begin with u32 state[5].
+ * void sha1_transform_ssse3(struct sha1_block_state *state,
+ *			     const u8 *data, size_t nblocks);
  */
 SHA1_VECTOR_ASM     sha1_transform_ssse3
 
 .macro W_PRECALC_AVX
 
@@ -546,9 +543,9 @@ W_PRECALC_AVX
 	vmovdqu	\a,\b
 .endm
 
 
 /* AVX optimized implementation:
- *  extern "C" void sha1_transform_avx(struct sha1_state *state,
- *				       const u8 *data, int blocks);
+ * void sha1_transform_avx(struct sha1_block_state *state,
+ *			   const u8 *data, size_t nblocks);
  */
 SHA1_VECTOR_ASM     sha1_transform_avx
diff --git a/lib/crypto/x86/sha1.h b/lib/crypto/x86/sha1.h
new file mode 100644
index 0000000000000..a26b85950003e
--- /dev/null
+++ b/lib/crypto/x86/sha1.h
@@ -0,0 +1,75 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * SHA-1 optimized for x86_64
+ *
+ * Copyright 2025 Google LLC
+ */
+#include <asm/fpu/api.h>
+#include <crypto/internal/simd.h>
+#include <linux/static_call.h>
+
+DEFINE_STATIC_CALL(sha1_blocks_x86, sha1_blocks_generic);
+
+#define DEFINE_X86_SHA1_FN(c_fn, asm_fn)                           \
+	asmlinkage void asm_fn(struct sha1_block_state *state,     \
+			       const u8 *data, size_t nblocks);    \
+	static void c_fn(struct sha1_block_state *state,           \
+			 const u8 *data, size_t nblocks)           \
+	{                                                          \
+		if (likely(irq_fpu_usable())) {                    \
+			kernel_fpu_begin();                        \
+			asm_fn(state, data, nblocks);              \
+			kernel_fpu_end();                          \
+		} else {                                           \
+			sha1_blocks_generic(state, data, nblocks); \
+		}                                                  \
+	}
+
+DEFINE_X86_SHA1_FN(sha1_blocks_ssse3, sha1_transform_ssse3);
+DEFINE_X86_SHA1_FN(sha1_blocks_avx, sha1_transform_avx);
+DEFINE_X86_SHA1_FN(sha1_blocks_ni, sha1_ni_transform);
+
+#define SHA1_AVX2_BLOCK_OPTSIZE 4 /* optimal 4*64 bytes of SHA1 blocks */
+
+asmlinkage void sha1_transform_avx2(struct sha1_block_state *state,
+				    const u8 *data, size_t nblocks);
+static void sha1_blocks_avx2(struct sha1_block_state *state,
+			     const u8 *data, size_t nblocks)
+{
+	if (likely(irq_fpu_usable())) {
+		kernel_fpu_begin();
+		/* Select the optimal transform based on the number of blocks */
+		if (nblocks >= SHA1_AVX2_BLOCK_OPTSIZE)
+			sha1_transform_avx2(state, data, nblocks);
+		else
+			sha1_transform_avx(state, data, nblocks);
+		kernel_fpu_end();
+	} else {
+		sha1_blocks_generic(state, data, nblocks);
+	}
+}
+
+static void sha1_blocks(struct sha1_block_state *state,
+			  const u8 *data, size_t nblocks)
+{
+	static_call(sha1_blocks_x86)(state, data, nblocks);
+}
+
+#define sha1_mod_init_arch sha1_mod_init_arch
+static inline void sha1_mod_init_arch(void)
+{
+	if (boot_cpu_has(X86_FEATURE_SHA_NI)) {
+		static_call_update(sha1_blocks_x86, sha1_blocks_ni);
+	} else if (cpu_has_xfeatures(XFEATURE_MASK_SSE | XFEATURE_MASK_YMM,
+				     NULL) &&
+		   boot_cpu_has(X86_FEATURE_AVX)) {
+		if (boot_cpu_has(X86_FEATURE_AVX2) &&
+		    boot_cpu_has(X86_FEATURE_BMI1) &&
+		    boot_cpu_has(X86_FEATURE_BMI2))
+			static_call_update(sha1_blocks_x86, sha1_blocks_avx2);
+		else
+			static_call_update(sha1_blocks_x86, sha1_blocks_avx);
+	} else if (boot_cpu_has(X86_FEATURE_SSSE3)) {
+		static_call_update(sha1_blocks_x86, sha1_blocks_ssse3);
+	}
+}
-- 
2.50.1


