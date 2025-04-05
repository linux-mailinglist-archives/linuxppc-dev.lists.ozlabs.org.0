Return-Path: <linuxppc-dev+bounces-7461-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 02FA8A7CB46
	for <lists+linuxppc-dev@lfdr.de>; Sat,  5 Apr 2025 20:31:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZVPDf6j5Cz2yqd;
	Sun,  6 Apr 2025 04:30:58 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=139.178.84.217
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1743877858;
	cv=none; b=GEFG4OQhkC7+jcuJLcU+xrbtzPVJUNnSX8nG8iJss/fFCgaIEvSZM2aeN0x6qxMh74MILKQnMDyn0Rh//d3rTx94KK5rbMu6utHvmVivqMftswuSHi4rHXXlEVsu1B2Hm0xcJGU5ge7Od0/M+2FE2Rp3lFMZvPG47GtDt2esJcBi+dkzmAGRGQOLIokRYYHlUhNA4KwmP+u5powZFFYICiUGQMvDslxGRtVW95Dnu/Fjws7C8J/14PfYFmZHKnvTnpBUmA/YbGcc74KrtI3TUi24s+tav7jaG8I0r0IkQcvbOkW/1+F28zAdUvJ7a30INCVHQuvjkOhYjpxf5k05JA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1743877858; c=relaxed/relaxed;
	bh=+WlwStlSnfC5NEPsQH1uCIJTnt3x1QBzvDJxtvkfY/g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NZoGX+6EmxkJWmyOHNMKEJaEba1t4efY68buXjlvAWH2CFo9Tpv0Vb08MnHx3JSfPI8+hPBcMYyLxwbZaKVO2jISHuZXi+r/F8H/p2ivKhbdgkAmlllrk2QGll8yQ1b9wUK1bxcCQgNOehybOv77Puz4kzKLTxHTRS3Wc2Do32zLKUnoQIqEQ2a72JxKn0VQR0ARhIxr5hI1KaR/ilptnW1kvPLuALdxJe2jabsH/FoDPOzZVQSePO2HZbBg5ipZqMeQfkSIxaCfzvBOiMKZxB/qJoZPzT+Yicm6zzwTlA66sl7ebBRIXE+Vrx5wMTf/k8tBqZWKkYXtETSNzyb1IQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=noIpjDqD; dkim-atps=neutral; spf=pass (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=noIpjDqD;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZVPDd1Rccz2ygY
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  6 Apr 2025 04:30:56 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 57AF25C4D7F;
	Sat,  5 Apr 2025 18:28:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D58B1C4CEEF;
	Sat,  5 Apr 2025 18:30:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743877854;
	bh=D2tEpsWY4w41zyO9mRm9ESpTHuZZsTPd3X8yjRIpe0o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=noIpjDqDhLDBABGCHVNmQQ2h8BWnwAxFDtsOFcoFKNxk0gyPU/LOtpq2nCtr4ctXY
	 rLdYf4hSIAxZF6Iqma5VDA29gdV75qEAO6DNobzim4h40VZuxABxPTSuy5qA6Z3+Gi
	 u26LT6Ped85xCa7E/CXxXYKJBJwJOgJFErvUIjCa3oK7MJJORBbuNgyXVI9UQPMHsg
	 OPlyHfm80Opu0kXqVxLNVQVCqi7H4A9CleAyNUQMgvbWkvw+/Mm6dsTtqoDPdCmmQB
	 I9dD9wvAB3/58AU88Te4T5KoSY/LAsgJwh/SXU8JPoTFI8l0knVbL2yEPMYIN21zZv
	 bsDJbKSaBKKIw==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	x86@kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld " <Jason@zx2c4.com>,
	Linus Torvalds <torvalds@linux-foundation.org>
Subject: [PATCH 3/9] crypto: arm/chacha - remove the redundant skcipher algorithms
Date: Sat,  5 Apr 2025 11:26:03 -0700
Message-ID: <20250405182609.404216-4-ebiggers@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250405182609.404216-1-ebiggers@kernel.org>
References: <20250405182609.404216-1-ebiggers@kernel.org>
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
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-6.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

From: Eric Biggers <ebiggers@google.com>

Since crypto/chacha.c now registers chacha20-$(ARCH), xchacha20-$(ARCH),
and xchacha12-$(ARCH) skcipher algorithms that use the architecture's
ChaCha and HChaCha library functions, individual architectures no longer
need to do the same.  Therefore, remove the redundant skcipher
algorithms and leave just the library functions.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 arch/arm/crypto/Kconfig            |   7 -
 arch/arm/crypto/chacha-glue.c      | 242 +----------------------------
 arch/arm/crypto/chacha-neon-core.S |   2 +-
 3 files changed, 7 insertions(+), 244 deletions(-)

diff --git a/arch/arm/crypto/Kconfig b/arch/arm/crypto/Kconfig
index 23e4ea067ddbb..624c4c8c5296a 100644
--- a/arch/arm/crypto/Kconfig
+++ b/arch/arm/crypto/Kconfig
@@ -214,17 +214,10 @@ config CRYPTO_AES_ARM_CE
 	  Architecture: arm using:
 	  - ARMv8 Crypto Extensions
 
 config CRYPTO_CHACHA20_NEON
 	tristate
-	select CRYPTO_SKCIPHER
 	select CRYPTO_ARCH_HAVE_LIB_CHACHA
 	default CRYPTO_LIB_CHACHA_INTERNAL
-	help
-	  Length-preserving ciphers: ChaCha20, XChaCha20, and XChaCha12
-	  stream cipher algorithms
-
-	  Architecture: arm using:
-	  - NEON (Advanced SIMD) extensions
 
 endmenu
 
diff --git a/arch/arm/crypto/chacha-glue.c b/arch/arm/crypto/chacha-glue.c
index e1cb34d317712..3a5c75c95d43b 100644
--- a/arch/arm/crypto/chacha-glue.c
+++ b/arch/arm/crypto/chacha-glue.c
@@ -1,18 +1,15 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
- * ARM NEON accelerated ChaCha and XChaCha stream ciphers,
- * including ChaCha20 (RFC7539)
+ * ChaCha and HChaCha functions (ARM optimized)
  *
  * Copyright (C) 2016-2019 Linaro, Ltd. <ard.biesheuvel@linaro.org>
  * Copyright (C) 2015 Martin Willi
  */
 
-#include <crypto/algapi.h>
-#include <crypto/internal/chacha.h>
+#include <crypto/chacha.h>
 #include <crypto/internal/simd.h>
-#include <crypto/internal/skcipher.h>
 #include <linux/jump_label.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 
 #include <asm/cputype.h>
@@ -98,262 +95,35 @@ void chacha_crypt_arch(u32 *state, u8 *dst, const u8 *src, unsigned int bytes,
 		dst += todo;
 	} while (bytes);
 }
 EXPORT_SYMBOL(chacha_crypt_arch);
 
-static int chacha_stream_xor(struct skcipher_request *req,
-			     const struct chacha_ctx *ctx, const u8 *iv,
-			     bool neon)
-{
-	struct skcipher_walk walk;
-	u32 state[16];
-	int err;
-
-	err = skcipher_walk_virt(&walk, req, false);
-
-	chacha_init(state, ctx->key, iv);
-
-	while (walk.nbytes > 0) {
-		unsigned int nbytes = walk.nbytes;
-
-		if (nbytes < walk.total)
-			nbytes = round_down(nbytes, walk.stride);
-
-		if (!IS_ENABLED(CONFIG_KERNEL_MODE_NEON) || !neon) {
-			chacha_doarm(walk.dst.virt.addr, walk.src.virt.addr,
-				     nbytes, state, ctx->nrounds);
-			state[12] += DIV_ROUND_UP(nbytes, CHACHA_BLOCK_SIZE);
-		} else {
-			kernel_neon_begin();
-			chacha_doneon(state, walk.dst.virt.addr,
-				      walk.src.virt.addr, nbytes, ctx->nrounds);
-			kernel_neon_end();
-		}
-		err = skcipher_walk_done(&walk, walk.nbytes - nbytes);
-	}
-
-	return err;
-}
-
-static int do_chacha(struct skcipher_request *req, bool neon)
-{
-	struct crypto_skcipher *tfm = crypto_skcipher_reqtfm(req);
-	struct chacha_ctx *ctx = crypto_skcipher_ctx(tfm);
-
-	return chacha_stream_xor(req, ctx, req->iv, neon);
-}
-
-static int chacha_arm(struct skcipher_request *req)
-{
-	return do_chacha(req, false);
-}
-
-static int chacha_neon(struct skcipher_request *req)
-{
-	return do_chacha(req, neon_usable());
-}
-
-static int do_xchacha(struct skcipher_request *req, bool neon)
-{
-	struct crypto_skcipher *tfm = crypto_skcipher_reqtfm(req);
-	struct chacha_ctx *ctx = crypto_skcipher_ctx(tfm);
-	struct chacha_ctx subctx;
-	u32 state[16];
-	u8 real_iv[16];
-
-	chacha_init(state, ctx->key, req->iv);
-
-	if (!IS_ENABLED(CONFIG_KERNEL_MODE_NEON) || !neon) {
-		hchacha_block_arm(state, subctx.key, ctx->nrounds);
-	} else {
-		kernel_neon_begin();
-		hchacha_block_neon(state, subctx.key, ctx->nrounds);
-		kernel_neon_end();
-	}
-	subctx.nrounds = ctx->nrounds;
-
-	memcpy(&real_iv[0], req->iv + 24, 8);
-	memcpy(&real_iv[8], req->iv + 16, 8);
-	return chacha_stream_xor(req, &subctx, real_iv, neon);
-}
-
-static int xchacha_arm(struct skcipher_request *req)
-{
-	return do_xchacha(req, false);
-}
-
-static int xchacha_neon(struct skcipher_request *req)
-{
-	return do_xchacha(req, neon_usable());
-}
-
-static struct skcipher_alg arm_algs[] = {
-	{
-		.base.cra_name		= "chacha20",
-		.base.cra_driver_name	= "chacha20-arm",
-		.base.cra_priority	= 200,
-		.base.cra_blocksize	= 1,
-		.base.cra_ctxsize	= sizeof(struct chacha_ctx),
-		.base.cra_module	= THIS_MODULE,
-
-		.min_keysize		= CHACHA_KEY_SIZE,
-		.max_keysize		= CHACHA_KEY_SIZE,
-		.ivsize			= CHACHA_IV_SIZE,
-		.chunksize		= CHACHA_BLOCK_SIZE,
-		.setkey			= chacha20_setkey,
-		.encrypt		= chacha_arm,
-		.decrypt		= chacha_arm,
-	}, {
-		.base.cra_name		= "xchacha20",
-		.base.cra_driver_name	= "xchacha20-arm",
-		.base.cra_priority	= 200,
-		.base.cra_blocksize	= 1,
-		.base.cra_ctxsize	= sizeof(struct chacha_ctx),
-		.base.cra_module	= THIS_MODULE,
-
-		.min_keysize		= CHACHA_KEY_SIZE,
-		.max_keysize		= CHACHA_KEY_SIZE,
-		.ivsize			= XCHACHA_IV_SIZE,
-		.chunksize		= CHACHA_BLOCK_SIZE,
-		.setkey			= chacha20_setkey,
-		.encrypt		= xchacha_arm,
-		.decrypt		= xchacha_arm,
-	}, {
-		.base.cra_name		= "xchacha12",
-		.base.cra_driver_name	= "xchacha12-arm",
-		.base.cra_priority	= 200,
-		.base.cra_blocksize	= 1,
-		.base.cra_ctxsize	= sizeof(struct chacha_ctx),
-		.base.cra_module	= THIS_MODULE,
-
-		.min_keysize		= CHACHA_KEY_SIZE,
-		.max_keysize		= CHACHA_KEY_SIZE,
-		.ivsize			= XCHACHA_IV_SIZE,
-		.chunksize		= CHACHA_BLOCK_SIZE,
-		.setkey			= chacha12_setkey,
-		.encrypt		= xchacha_arm,
-		.decrypt		= xchacha_arm,
-	},
-};
-
-static struct skcipher_alg neon_algs[] = {
-	{
-		.base.cra_name		= "chacha20",
-		.base.cra_driver_name	= "chacha20-neon",
-		.base.cra_priority	= 300,
-		.base.cra_blocksize	= 1,
-		.base.cra_ctxsize	= sizeof(struct chacha_ctx),
-		.base.cra_module	= THIS_MODULE,
-
-		.min_keysize		= CHACHA_KEY_SIZE,
-		.max_keysize		= CHACHA_KEY_SIZE,
-		.ivsize			= CHACHA_IV_SIZE,
-		.chunksize		= CHACHA_BLOCK_SIZE,
-		.walksize		= 4 * CHACHA_BLOCK_SIZE,
-		.setkey			= chacha20_setkey,
-		.encrypt		= chacha_neon,
-		.decrypt		= chacha_neon,
-	}, {
-		.base.cra_name		= "xchacha20",
-		.base.cra_driver_name	= "xchacha20-neon",
-		.base.cra_priority	= 300,
-		.base.cra_blocksize	= 1,
-		.base.cra_ctxsize	= sizeof(struct chacha_ctx),
-		.base.cra_module	= THIS_MODULE,
-
-		.min_keysize		= CHACHA_KEY_SIZE,
-		.max_keysize		= CHACHA_KEY_SIZE,
-		.ivsize			= XCHACHA_IV_SIZE,
-		.chunksize		= CHACHA_BLOCK_SIZE,
-		.walksize		= 4 * CHACHA_BLOCK_SIZE,
-		.setkey			= chacha20_setkey,
-		.encrypt		= xchacha_neon,
-		.decrypt		= xchacha_neon,
-	}, {
-		.base.cra_name		= "xchacha12",
-		.base.cra_driver_name	= "xchacha12-neon",
-		.base.cra_priority	= 300,
-		.base.cra_blocksize	= 1,
-		.base.cra_ctxsize	= sizeof(struct chacha_ctx),
-		.base.cra_module	= THIS_MODULE,
-
-		.min_keysize		= CHACHA_KEY_SIZE,
-		.max_keysize		= CHACHA_KEY_SIZE,
-		.ivsize			= XCHACHA_IV_SIZE,
-		.chunksize		= CHACHA_BLOCK_SIZE,
-		.walksize		= 4 * CHACHA_BLOCK_SIZE,
-		.setkey			= chacha12_setkey,
-		.encrypt		= xchacha_neon,
-		.decrypt		= xchacha_neon,
-	}
-};
-
 bool chacha_is_arch_optimized(void)
 {
 	/* We always can use at least the ARM scalar implementation. */
 	return true;
 }
 EXPORT_SYMBOL(chacha_is_arch_optimized);
 
-static int __init chacha_simd_mod_init(void)
+static int __init chacha_arm_mod_init(void)
 {
-	int err = 0;
-
-	if (IS_REACHABLE(CONFIG_CRYPTO_SKCIPHER)) {
-		err = crypto_register_skciphers(arm_algs, ARRAY_SIZE(arm_algs));
-		if (err)
-			return err;
-	}
-
 	if (IS_ENABLED(CONFIG_KERNEL_MODE_NEON) && (elf_hwcap & HWCAP_NEON)) {
-		int i;
-
 		switch (read_cpuid_part()) {
 		case ARM_CPU_PART_CORTEX_A7:
 		case ARM_CPU_PART_CORTEX_A5:
 			/*
 			 * The Cortex-A7 and Cortex-A5 do not perform well with
 			 * the NEON implementation but do incredibly with the
 			 * scalar one and use less power.
 			 */
-			for (i = 0; i < ARRAY_SIZE(neon_algs); i++)
-				neon_algs[i].base.cra_priority = 0;
 			break;
 		default:
 			static_branch_enable(&use_neon);
 		}
-
-		if (IS_REACHABLE(CONFIG_CRYPTO_SKCIPHER)) {
-			err = crypto_register_skciphers(neon_algs, ARRAY_SIZE(neon_algs));
-			if (err)
-				crypto_unregister_skciphers(arm_algs, ARRAY_SIZE(arm_algs));
-		}
 	}
-	return err;
+	return 0;
 }
+arch_initcall(chacha_arm_mod_init);
 
-static void __exit chacha_simd_mod_fini(void)
-{
-	if (IS_REACHABLE(CONFIG_CRYPTO_SKCIPHER)) {
-		crypto_unregister_skciphers(arm_algs, ARRAY_SIZE(arm_algs));
-		if (IS_ENABLED(CONFIG_KERNEL_MODE_NEON) && (elf_hwcap & HWCAP_NEON))
-			crypto_unregister_skciphers(neon_algs, ARRAY_SIZE(neon_algs));
-	}
-}
-
-arch_initcall(chacha_simd_mod_init);
-module_exit(chacha_simd_mod_fini);
-
-MODULE_DESCRIPTION("ChaCha and XChaCha stream ciphers (scalar and NEON accelerated)");
+MODULE_DESCRIPTION("ChaCha and HChaCha functions (ARM optimized)");
 MODULE_AUTHOR("Ard Biesheuvel <ard.biesheuvel@linaro.org>");
 MODULE_LICENSE("GPL v2");
-MODULE_ALIAS_CRYPTO("chacha20");
-MODULE_ALIAS_CRYPTO("chacha20-arm");
-MODULE_ALIAS_CRYPTO("xchacha20");
-MODULE_ALIAS_CRYPTO("xchacha20-arm");
-MODULE_ALIAS_CRYPTO("xchacha12");
-MODULE_ALIAS_CRYPTO("xchacha12-arm");
-#ifdef CONFIG_KERNEL_MODE_NEON
-MODULE_ALIAS_CRYPTO("chacha20-neon");
-MODULE_ALIAS_CRYPTO("xchacha20-neon");
-MODULE_ALIAS_CRYPTO("xchacha12-neon");
-#endif
diff --git a/arch/arm/crypto/chacha-neon-core.S b/arch/arm/crypto/chacha-neon-core.S
index 13d12f672656b..ddd62b6294a57 100644
--- a/arch/arm/crypto/chacha-neon-core.S
+++ b/arch/arm/crypto/chacha-neon-core.S
@@ -1,7 +1,7 @@
 /*
- * ChaCha/XChaCha NEON helper functions
+ * ChaCha/HChaCha NEON helper functions
  *
  * Copyright (C) 2016 Linaro, Ltd. <ard.biesheuvel@linaro.org>
  *
  * This program is free software; you can redistribute it and/or modify
  * it under the terms of the GNU General Public License version 2 as
-- 
2.49.0


