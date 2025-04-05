Return-Path: <linuxppc-dev+bounces-7464-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DD0E1A7CB54
	for <lists+linuxppc-dev@lfdr.de>; Sat,  5 Apr 2025 20:31:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZVPDk4WnGz2yvv;
	Sun,  6 Apr 2025 04:31:02 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=139.178.84.217
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1743877862;
	cv=none; b=BgPVfw3jN4f09clU3aUdNL/Yhf2UUlzqKNbuGVWgi1X8TFb/0bUg8UZgrXgOINU9vhZIeqcvn9u03qDgcK2klRYI6GbN8ViYdDZYsSJw4AbkHUztaBI1L+E7mq9M8wPurEA3CoJpkWVNtFwzXxPTZB2xCSmQBPjoJGmqYoFprT3g747Y3lHdWveVDcFfMyc5wahuNwjMzM8nBvE1lOtf7GwG4fNAXBFdPEcBBfXHl3Ql2+e6Js9puZ43spl8Rn1M6YZ3x7OjepLND8m9FkvBbeqfzsbXD2uxn9wLHNDN3r89BwCrm1mK6ErDEvu2MzVap0m2h6pAX0jdILbLldNzXw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1743877862; c=relaxed/relaxed;
	bh=WzivNS10NrpISCk5PJ1p/U97/3gZKzHxjSqukklIY2g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UEk9MNDO/y1/tLCZo/eDzvk6Ufqjj8mclYpkH7JDBhGbrWpgOD3PORjq5GjT0KIdNKUhlszLdCdVUBT0SjHLLvQOOYAe8QrjflD312Pmvm3JwsK05RZU59syX/Br3/lc6ZQLTzFkSyKq+cULMAs7HgLQux0kIB1ZY6ceAYQMwN1ultlKSd6hAn+xqY8YnMGpGBQqh/wULVUycU/2oGyfZwIODdigjtyA4gYVk0zIl+ddD/pJCWv2DPXCDxqxSCsWqyAy4mEy3iEvZZydf3vvHqKNqSAtTYag4b7DiVWahI5X1A9KGClnqmt1NoxoW/2VPKy/+cq+NKPpc6nYz8k+Ng==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=BMvkeX7P; dkim-atps=neutral; spf=pass (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=BMvkeX7P;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZVPDd2pC7z2yn9
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  6 Apr 2025 04:30:57 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4DDE45C4D95;
	Sat,  5 Apr 2025 18:28:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC72FC4CEE4;
	Sat,  5 Apr 2025 18:30:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743877855;
	bh=3GecDYJPP+f/otGdToWIa9TB2f+in47vXsMRPZd3kDo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BMvkeX7PDVea3p39UTaGrF7AVBRn2MBPChS6OFi6ciRP0KDkF+rJawry/gPZGS2bo
	 kSnVQBXr669M4rcIWxd+LCz6OGQ6eqBMUF6SrycfjCv9AajLSUPLCfMApP4PVQB6BY
	 BCtfS7MzDpRRM0oxD0s5frAPm8YZx8Q0dfuwUWekYJaQPMfkO/bWdv8o9Kkm772t+I
	 rxLq5WBMke1+sdyDTXtkWqynjbBAaId1V5cQvdL3Vll9/u6CVRAAKb8w3NmLb6CPZv
	 Aj/VU9CLMWXaFtbR0F06zN2W4xfw/eecvkTamGE9xGSRM+MoJEkfsE8u2L0QyGZAbe
	 npBiy5Aho48zg==
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
Subject: [PATCH 5/9] crypto: mips/chacha - remove the skcipher algorithms
Date: Sat,  5 Apr 2025 11:26:05 -0700
Message-ID: <20250405182609.404216-6-ebiggers@kernel.org>
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
 arch/mips/crypto/Kconfig       |   6 --
 arch/mips/crypto/chacha-glue.c | 131 +--------------------------------
 2 files changed, 3 insertions(+), 134 deletions(-)

diff --git a/arch/mips/crypto/Kconfig b/arch/mips/crypto/Kconfig
index 545fc0e12422d..0189686de3a12 100644
--- a/arch/mips/crypto/Kconfig
+++ b/arch/mips/crypto/Kconfig
@@ -54,15 +54,9 @@ config CRYPTO_SHA512_OCTEON
 	  Architecture: mips OCTEON using crypto instructions, when available
 
 config CRYPTO_CHACHA_MIPS
 	tristate
 	depends on CPU_MIPS32_R2
-	select CRYPTO_SKCIPHER
 	select CRYPTO_ARCH_HAVE_LIB_CHACHA
 	default CRYPTO_LIB_CHACHA_INTERNAL
-	help
-	  Length-preserving ciphers: ChaCha20, XChaCha20, and XChaCha12
-	  stream cipher algorithms
-
-	  Architecture: MIPS32r2
 
 endmenu
diff --git a/arch/mips/crypto/chacha-glue.c b/arch/mips/crypto/chacha-glue.c
index 64ccaeaeaa1e1..334ecb29fb8fa 100644
--- a/arch/mips/crypto/chacha-glue.c
+++ b/arch/mips/crypto/chacha-glue.c
@@ -1,152 +1,27 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
- * MIPS accelerated ChaCha and XChaCha stream ciphers,
- * including ChaCha20 (RFC7539)
+ * ChaCha and HChaCha functions (MIPS optimized)
  *
  * Copyright (C) 2019 Linaro, Ltd. <ard.biesheuvel@linaro.org>
  */
 
-#include <asm/byteorder.h>
-#include <crypto/algapi.h>
-#include <crypto/internal/chacha.h>
-#include <crypto/internal/skcipher.h>
+#include <crypto/chacha.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 
 asmlinkage void chacha_crypt_arch(u32 *state, u8 *dst, const u8 *src,
 				  unsigned int bytes, int nrounds);
 EXPORT_SYMBOL(chacha_crypt_arch);
 
 asmlinkage void hchacha_block_arch(const u32 *state, u32 *stream, int nrounds);
 EXPORT_SYMBOL(hchacha_block_arch);
 
-static int chacha_mips_stream_xor(struct skcipher_request *req,
-				  const struct chacha_ctx *ctx, const u8 *iv)
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
-		chacha_crypt(state, walk.dst.virt.addr, walk.src.virt.addr,
-			     nbytes, ctx->nrounds);
-		err = skcipher_walk_done(&walk, walk.nbytes - nbytes);
-	}
-
-	return err;
-}
-
-static int chacha_mips(struct skcipher_request *req)
-{
-	struct crypto_skcipher *tfm = crypto_skcipher_reqtfm(req);
-	struct chacha_ctx *ctx = crypto_skcipher_ctx(tfm);
-
-	return chacha_mips_stream_xor(req, ctx, req->iv);
-}
-
-static int xchacha_mips(struct skcipher_request *req)
-{
-	struct crypto_skcipher *tfm = crypto_skcipher_reqtfm(req);
-	struct chacha_ctx *ctx = crypto_skcipher_ctx(tfm);
-	struct chacha_ctx subctx;
-	u32 state[16];
-	u8 real_iv[16];
-
-	chacha_init(state, ctx->key, req->iv);
-
-	hchacha_block(state, subctx.key, ctx->nrounds);
-	subctx.nrounds = ctx->nrounds;
-
-	memcpy(&real_iv[0], req->iv + 24, 8);
-	memcpy(&real_iv[8], req->iv + 16, 8);
-	return chacha_mips_stream_xor(req, &subctx, real_iv);
-}
-
-static struct skcipher_alg algs[] = {
-	{
-		.base.cra_name		= "chacha20",
-		.base.cra_driver_name	= "chacha20-mips",
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
-		.encrypt		= chacha_mips,
-		.decrypt		= chacha_mips,
-	}, {
-		.base.cra_name		= "xchacha20",
-		.base.cra_driver_name	= "xchacha20-mips",
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
-		.encrypt		= xchacha_mips,
-		.decrypt		= xchacha_mips,
-	}, {
-		.base.cra_name		= "xchacha12",
-		.base.cra_driver_name	= "xchacha12-mips",
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
-		.encrypt		= xchacha_mips,
-		.decrypt		= xchacha_mips,
-	}
-};
-
 bool chacha_is_arch_optimized(void)
 {
 	return true;
 }
 EXPORT_SYMBOL(chacha_is_arch_optimized);
 
-static int __init chacha_simd_mod_init(void)
-{
-	return IS_REACHABLE(CONFIG_CRYPTO_SKCIPHER) ?
-		crypto_register_skciphers(algs, ARRAY_SIZE(algs)) : 0;
-}
-
-static void __exit chacha_simd_mod_fini(void)
-{
-	if (IS_REACHABLE(CONFIG_CRYPTO_SKCIPHER))
-		crypto_unregister_skciphers(algs, ARRAY_SIZE(algs));
-}
-
-arch_initcall(chacha_simd_mod_init);
-module_exit(chacha_simd_mod_fini);
-
-MODULE_DESCRIPTION("ChaCha and XChaCha stream ciphers (MIPS accelerated)");
+MODULE_DESCRIPTION("ChaCha and HChaCha functions (MIPS optimized)");
 MODULE_AUTHOR("Ard Biesheuvel <ard.biesheuvel@linaro.org>");
 MODULE_LICENSE("GPL v2");
-MODULE_ALIAS_CRYPTO("chacha20");
-MODULE_ALIAS_CRYPTO("chacha20-mips");
-MODULE_ALIAS_CRYPTO("xchacha20");
-MODULE_ALIAS_CRYPTO("xchacha20-mips");
-MODULE_ALIAS_CRYPTO("xchacha12");
-MODULE_ALIAS_CRYPTO("xchacha12-mips");
-- 
2.49.0


