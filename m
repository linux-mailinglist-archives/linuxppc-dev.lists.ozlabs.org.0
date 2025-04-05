Return-Path: <linuxppc-dev+bounces-7468-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E538A7CB63
	for <lists+linuxppc-dev@lfdr.de>; Sat,  5 Apr 2025 20:32:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZVPDm6QZjz2yhV;
	Sun,  6 Apr 2025 04:31:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1743877864;
	cv=none; b=b4E3zZcDrZxBpJS9xZgIIePSGi3GPKVk0I08f1lyjgHeZ4Bok86BJOkF2LuVEMn5sijzPG1tYc90PcfhWDELFVADPtBOKUL2Zz8s0eTj05ZUxY/tqeBbVbi0JiLEFjQ5UmqvDWBp5acB3o5bXqcTcue07br7X+3YJJ8jQ+ypeYJ2uBpKnTZCEkcyv9rRPIT6cDkYEgfdRK0Mly+YsSPPsDhi2yWRt6eDmgEdnNr6xaYWy1G+6cdOeEQOFWoo6Lyq2NAiLFKp1llPOYsxiDvEE/wGIS3t4oJWPfvTGuFqKvn1mXLkv+A9Q+SXPSNnJIjRNQqgCoXLaLwAGu6EQT+q2w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1743877864; c=relaxed/relaxed;
	bh=r46e7dak9DFnm2+mkpQoxOm7+bzKpHfmKNESehoVImI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZGVv6JqEWurIGA4TEIb4mEw3lJrsDCqx7oXx22LRk6OXHZGQUSJOqVFdDs0jl8ZLqUPgHPF5g7U5QxxtmcUErNG6loUfZcD4+rQ2ybxhXRfFnvzlQGF4KhCtm9OHtkCcevPFi8wz8TS/lOSFO0BF1as9A+L9r41xzKt5HT2HWEnKAaHGnptOxH4+fzJCEH4lWMyai/BwgxFdv4l+pns0mx1ybC4NpwKy//i8ua1TxGF8gUA8C6E8aYTMNSQmLl3Uzyk/MBDMIlv3iB+4OSkDX1bkeY3mJHkZvf2DveJiZByogmz6MAo19oRYPvKj6ZKqCUxU7BrY143W5saMT1jN0g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=PQAXJq/n; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=PQAXJq/n;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZVPDg4yPyz2yrY
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  6 Apr 2025 04:30:58 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id DAD0D61164;
	Sat,  5 Apr 2025 18:30:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42FF8C4CEE7;
	Sat,  5 Apr 2025 18:30:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743877856;
	bh=Xwh08sUrwMmQCiHRbYZtr7YEg0mBK+LLgKoP4B4fAZs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PQAXJq/nTIrYXPGSD4Rnn6n3p4oa0uFWpwBny/fE1QMrnfmFAqlzJGqii9u2ExoNG
	 VCxf3BI4IuLWmrth2IQ2UWIgWYqoY8u577ch5z3LTqObfLB4+yYjIJh/iNoPuvTyHY
	 HKNBrhd0s8N4ndBt6e4BIcBy/UBCy2Hs84SVVpDfFKKV2MWLBgW6oThbeLlN1d6cy3
	 cJXJHokTaaCN+H0JLtR7gX603ND3ilHiSKtDygFGgyLfhRn4t2F2xgKehWPgykgrl2
	 3IGvAudA0Tkhuc4zSu/Gf30BqTSHJv8jBAdAAjhgKIHviWwQfAPkcbw43UA3Saj4X9
	 BiFzjf/Mh0KSQ==
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
Subject: [PATCH 8/9] crypto: x86/chacha - remove the skcipher algorithms
Date: Sat,  5 Apr 2025 11:26:08 -0700
Message-ID: <20250405182609.404216-9-ebiggers@kernel.org>
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
X-Spam-Status: No, score=-1.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

From: Eric Biggers <ebiggers@google.com>

Since crypto/chacha.c now registers chacha20-$(ARCH), xchacha20-$(ARCH),
and xchacha12-$(ARCH) skcipher algorithms that use the architecture's
ChaCha and HChaCha library functions, individual architectures no longer
need to do the same.  Therefore, remove the redundant skcipher
algorithms and leave just the library functions.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 arch/x86/crypto/Kconfig       |   9 ---
 arch/x86/crypto/chacha_glue.c | 142 +---------------------------------
 2 files changed, 4 insertions(+), 147 deletions(-)

diff --git a/arch/x86/crypto/Kconfig b/arch/x86/crypto/Kconfig
index 3d948f10c94cd..8cf0a3f55576e 100644
--- a/arch/x86/crypto/Kconfig
+++ b/arch/x86/crypto/Kconfig
@@ -350,22 +350,13 @@ config CRYPTO_ARIA_GFNI_AVX512_X86_64
 	  Processes 64 blocks in parallel.
 
 config CRYPTO_CHACHA20_X86_64
 	tristate
 	depends on X86 && 64BIT
-	select CRYPTO_SKCIPHER
 	select CRYPTO_LIB_CHACHA_GENERIC
 	select CRYPTO_ARCH_HAVE_LIB_CHACHA
 	default CRYPTO_LIB_CHACHA_INTERNAL
-	help
-	  Length-preserving ciphers: ChaCha20, XChaCha20, and XChaCha12
-	  stream cipher algorithms
-
-	  Architecture: x86_64 using:
-	  - SSSE3 (Supplemental SSE3)
-	  - AVX2 (Advanced Vector Extensions 2)
-	  - AVX-512VL (Advanced Vector Extensions-512VL)
 
 config CRYPTO_AEGIS128_AESNI_SSE2
 	tristate "AEAD ciphers: AEGIS-128 (AES-NI/SSE4.1)"
 	depends on X86 && 64BIT
 	select CRYPTO_AEAD
diff --git a/arch/x86/crypto/chacha_glue.c b/arch/x86/crypto/chacha_glue.c
index 83a07b31cdd3a..71ec959caadaa 100644
--- a/arch/x86/crypto/chacha_glue.c
+++ b/arch/x86/crypto/chacha_glue.c
@@ -1,17 +1,14 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
 /*
- * x64 SIMD accelerated ChaCha and XChaCha stream ciphers,
- * including ChaCha20 (RFC7539)
+ * ChaCha and HChaCha functions (x86_64 optimized)
  *
  * Copyright (C) 2015 Martin Willi
  */
 
-#include <crypto/algapi.h>
-#include <crypto/internal/chacha.h>
+#include <crypto/chacha.h>
 #include <crypto/internal/simd.h>
-#include <crypto/internal/skcipher.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/sizes.h>
 #include <asm/simd.h>
 
@@ -152,126 +149,10 @@ void chacha_crypt_arch(u32 *state, u8 *dst, const u8 *src, unsigned int bytes,
 		dst += todo;
 	} while (bytes);
 }
 EXPORT_SYMBOL(chacha_crypt_arch);
 
-static int chacha_simd_stream_xor(struct skcipher_request *req,
-				  const struct chacha_ctx *ctx, const u8 *iv)
-{
-	u32 state[CHACHA_STATE_WORDS] __aligned(8);
-	struct skcipher_walk walk;
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
-		if (!static_branch_likely(&chacha_use_simd) ||
-		    !crypto_simd_usable()) {
-			chacha_crypt_generic(state, walk.dst.virt.addr,
-					     walk.src.virt.addr, nbytes,
-					     ctx->nrounds);
-		} else {
-			kernel_fpu_begin();
-			chacha_dosimd(state, walk.dst.virt.addr,
-				      walk.src.virt.addr, nbytes,
-				      ctx->nrounds);
-			kernel_fpu_end();
-		}
-		err = skcipher_walk_done(&walk, walk.nbytes - nbytes);
-	}
-
-	return err;
-}
-
-static int chacha_simd(struct skcipher_request *req)
-{
-	struct crypto_skcipher *tfm = crypto_skcipher_reqtfm(req);
-	struct chacha_ctx *ctx = crypto_skcipher_ctx(tfm);
-
-	return chacha_simd_stream_xor(req, ctx, req->iv);
-}
-
-static int xchacha_simd(struct skcipher_request *req)
-{
-	struct crypto_skcipher *tfm = crypto_skcipher_reqtfm(req);
-	struct chacha_ctx *ctx = crypto_skcipher_ctx(tfm);
-	u32 state[CHACHA_STATE_WORDS] __aligned(8);
-	struct chacha_ctx subctx;
-	u8 real_iv[16];
-
-	chacha_init(state, ctx->key, req->iv);
-
-	if (req->cryptlen > CHACHA_BLOCK_SIZE && crypto_simd_usable()) {
-		kernel_fpu_begin();
-		hchacha_block_ssse3(state, subctx.key, ctx->nrounds);
-		kernel_fpu_end();
-	} else {
-		hchacha_block_generic(state, subctx.key, ctx->nrounds);
-	}
-	subctx.nrounds = ctx->nrounds;
-
-	memcpy(&real_iv[0], req->iv + 24, 8);
-	memcpy(&real_iv[8], req->iv + 16, 8);
-	return chacha_simd_stream_xor(req, &subctx, real_iv);
-}
-
-static struct skcipher_alg algs[] = {
-	{
-		.base.cra_name		= "chacha20",
-		.base.cra_driver_name	= "chacha20-simd",
-		.base.cra_priority	= 300,
-		.base.cra_blocksize	= 1,
-		.base.cra_ctxsize	= sizeof(struct chacha_ctx),
-		.base.cra_module	= THIS_MODULE,
-
-		.min_keysize		= CHACHA_KEY_SIZE,
-		.max_keysize		= CHACHA_KEY_SIZE,
-		.ivsize			= CHACHA_IV_SIZE,
-		.chunksize		= CHACHA_BLOCK_SIZE,
-		.setkey			= chacha20_setkey,
-		.encrypt		= chacha_simd,
-		.decrypt		= chacha_simd,
-	}, {
-		.base.cra_name		= "xchacha20",
-		.base.cra_driver_name	= "xchacha20-simd",
-		.base.cra_priority	= 300,
-		.base.cra_blocksize	= 1,
-		.base.cra_ctxsize	= sizeof(struct chacha_ctx),
-		.base.cra_module	= THIS_MODULE,
-
-		.min_keysize		= CHACHA_KEY_SIZE,
-		.max_keysize		= CHACHA_KEY_SIZE,
-		.ivsize			= XCHACHA_IV_SIZE,
-		.chunksize		= CHACHA_BLOCK_SIZE,
-		.setkey			= chacha20_setkey,
-		.encrypt		= xchacha_simd,
-		.decrypt		= xchacha_simd,
-	}, {
-		.base.cra_name		= "xchacha12",
-		.base.cra_driver_name	= "xchacha12-simd",
-		.base.cra_priority	= 300,
-		.base.cra_blocksize	= 1,
-		.base.cra_ctxsize	= sizeof(struct chacha_ctx),
-		.base.cra_module	= THIS_MODULE,
-
-		.min_keysize		= CHACHA_KEY_SIZE,
-		.max_keysize		= CHACHA_KEY_SIZE,
-		.ivsize			= XCHACHA_IV_SIZE,
-		.chunksize		= CHACHA_BLOCK_SIZE,
-		.setkey			= chacha12_setkey,
-		.encrypt		= xchacha_simd,
-		.decrypt		= xchacha_simd,
-	},
-};
-
 bool chacha_is_arch_optimized(void)
 {
 	return static_key_enabled(&chacha_use_simd);
 }
 EXPORT_SYMBOL(chacha_is_arch_optimized);
@@ -291,27 +172,12 @@ static int __init chacha_simd_mod_init(void)
 		if (IS_ENABLED(CONFIG_AS_AVX512) &&
 		    boot_cpu_has(X86_FEATURE_AVX512VL) &&
 		    boot_cpu_has(X86_FEATURE_AVX512BW)) /* kmovq */
 			static_branch_enable(&chacha_use_avx512vl);
 	}
-	return IS_REACHABLE(CONFIG_CRYPTO_SKCIPHER) ?
-		crypto_register_skciphers(algs, ARRAY_SIZE(algs)) : 0;
+	return 0;
 }
-
-static void __exit chacha_simd_mod_fini(void)
-{
-	if (IS_REACHABLE(CONFIG_CRYPTO_SKCIPHER) && boot_cpu_has(X86_FEATURE_SSSE3))
-		crypto_unregister_skciphers(algs, ARRAY_SIZE(algs));
-}
-
 arch_initcall(chacha_simd_mod_init);
-module_exit(chacha_simd_mod_fini);
 
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Martin Willi <martin@strongswan.org>");
-MODULE_DESCRIPTION("ChaCha and XChaCha stream ciphers (x64 SIMD accelerated)");
-MODULE_ALIAS_CRYPTO("chacha20");
-MODULE_ALIAS_CRYPTO("chacha20-simd");
-MODULE_ALIAS_CRYPTO("xchacha20");
-MODULE_ALIAS_CRYPTO("xchacha20-simd");
-MODULE_ALIAS_CRYPTO("xchacha12");
-MODULE_ALIAS_CRYPTO("xchacha12-simd");
+MODULE_DESCRIPTION("ChaCha and HChaCha functions (x86_64 optimized)");
-- 
2.49.0


