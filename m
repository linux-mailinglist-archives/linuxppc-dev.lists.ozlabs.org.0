Return-Path: <linuxppc-dev+bounces-7642-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E4D2A870C8
	for <lists+linuxppc-dev@lfdr.de>; Sun, 13 Apr 2025 06:57:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZZymT36ZFz30Ss;
	Sun, 13 Apr 2025 14:55:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1744520153;
	cv=none; b=jdXUMmNt9mT2hVficEUxE7z5Ti69iYv3rQk9Qvzv1t87baY/TarQ5HaZNlN4nuZBSFYpb8poNgJGxoyIZyg60yp4kg2ksjH1OuzAAdV3jxtzkMiw99dMU8mSfwGeXj45yvsltINvf6TxMN7ld4MLpVBUCNi+zZZnDLLBFt5QmvMDR+gipV9Zk6wG9QrJTWVpOsXltnHIfBa4PrPyiarCb1G0WrIBHzukgNP+kc11EnnEOdbhLBf1MB4joGRuAImdJ+Qfbtw0qRjDoNS01oxoStrMUHhP+vmwLU4wGwQUOkwz6cwGsHtdarTCwJwIBmDSM4LaX5OMM7onE3DiXg1t3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1744520153; c=relaxed/relaxed;
	bh=WlWBjj/lxGNOH0Q4D7F6zVnwaN37HigKAHiZelMg+o8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RoKKCImuXYbhnqgttjnWADYT/7ox+xAB9AJJNJsYV6QzHFcDaBAkSWg5JvpV/c1o3yq7Shqs6XdMy4HZO5vrWkheBGRTd1o4oPx5zFslu7KVTnNPwzH0k0a42CWlpd8sGFjC8FleBIC8fMl20xNFRAjWJYCwE/BqzPu7J0QE5vBLFBo87LpNfi9Lz4I7nTb7FON3D48lLP4FPvEQ6lShP0H7JApSQmHknydjNAF6VGWSzY8hVRPhY2jkTY7SxWaT0xBIuCQEZW0R+cpm23lk0DEDAN2QACkT/+hcbP//jK3U/rn0XDatSTX47pCXtIrLKJnCrPjL08tWnip2KHyVuw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=EOmwlI34; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=EOmwlI34;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZZymR6TpFz307q
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 13 Apr 2025 14:55:51 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id EDF3E4A374;
	Sun, 13 Apr 2025 04:55:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63D36C4CEEC;
	Sun, 13 Apr 2025 04:55:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744520143;
	bh=pU25hoOE+o9gz8inrSmm1Ozslc+pQV84IIV/XOU2PEM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=EOmwlI343XmwmzZIUWOVNU7G6Cqc8PiuW2n1l5i5/IAWq1XfjzPCN+LX+VY8dR9UP
	 NehEwfxN4bhQgNu//RpRBAA6146hPT1tzcjQGZ5evFj2BMa9iRgz3DcOKM5y4iOsTY
	 J7AX0FybsD6Ty2fMP1wJO0DyHmh0CDfMKCWQuMg7hIMprIjy+TxOfx7wp4VmYU3UUY
	 vdo1y3P28uc/9ngMZzd6Q/qa9yEHDJZtw+jqLEVcfeg2ntSD5ZNU5q6coLGOS6FMQf
	 9L66jYsGLo5vT9yNqcqINUchcyHS66J9MnMBjUoo+q/xA50PvKqOAf49rW8g+lbdwP
	 hh93Vi0qDdIDQ==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	x86@kernel.org
Subject: [PATCH 7/9] crypto: x86/poly1305 - remove redundant shash algorithm
Date: Sat, 12 Apr 2025 21:54:19 -0700
Message-ID: <20250413045421.55100-8-ebiggers@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250413045421.55100-1-ebiggers@kernel.org>
References: <20250413045421.55100-1-ebiggers@kernel.org>
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
X-Spam-Status: No, score=1.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
	SUSPICIOUS_RECIPS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

From: Eric Biggers <ebiggers@google.com>

Since crypto/poly1305.c now registers a poly1305-$(ARCH) shash algorithm
that uses the architecture's Poly1305 library functions, individual
architectures no longer need to do the same.  Therefore, remove the
redundant shash algorithm from the arch-specific code and leave just the
library functions there.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 arch/x86/crypto/Kconfig         |  7 ---
 arch/x86/crypto/poly1305_glue.c | 97 +++------------------------------
 2 files changed, 7 insertions(+), 97 deletions(-)

diff --git a/arch/x86/crypto/Kconfig b/arch/x86/crypto/Kconfig
index 0cec75926380..31804dacf9a4 100644
--- a/arch/x86/crypto/Kconfig
+++ b/arch/x86/crypto/Kconfig
@@ -397,20 +397,13 @@ config CRYPTO_POLYVAL_CLMUL_NI
 	  - CLMUL-NI (carry-less multiplication new instructions)
 
 config CRYPTO_POLY1305_X86_64
 	tristate
 	depends on X86 && 64BIT
-	select CRYPTO_HASH
 	select CRYPTO_LIB_POLY1305_GENERIC
 	select CRYPTO_ARCH_HAVE_LIB_POLY1305
 	default CRYPTO_LIB_POLY1305_INTERNAL
-	help
-	  Poly1305 authenticator algorithm (RFC7539)
-
-	  Architecture: x86_64 using:
-	  - SSE2 (Streaming SIMD Extensions 2)
-	  - AVX2 (Advanced Vector Extensions 2)
 
 config CRYPTO_SHA1_SSSE3
 	tristate "Hash functions: SHA-1 (SSSE3/AVX/AVX2/SHA-NI)"
 	depends on X86 && 64BIT
 	select CRYPTO_SHA1
diff --git a/arch/x86/crypto/poly1305_glue.c b/arch/x86/crypto/poly1305_glue.c
index 40d03a9a4fb5..a0fc543a0d68 100644
--- a/arch/x86/crypto/poly1305_glue.c
+++ b/arch/x86/crypto/poly1305_glue.c
@@ -1,19 +1,17 @@
 // SPDX-License-Identifier: GPL-2.0 OR MIT
 /*
  * Copyright (C) 2015-2019 Jason A. Donenfeld <Jason@zx2c4.com>. All Rights Reserved.
  */
 
-#include <crypto/algapi.h>
-#include <crypto/internal/hash.h>
-#include <crypto/internal/poly1305.h>
 #include <crypto/internal/simd.h>
-#include <linux/crypto.h>
+#include <crypto/poly1305.h>
 #include <linux/jump_label.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/sizes.h>
+#include <linux/unaligned.h>
 #include <asm/cpu_device_id.h>
 #include <asm/simd.h>
 
 asmlinkage void poly1305_init_x86_64(void *ctx,
 				     const u8 key[POLY1305_BLOCK_SIZE]);
@@ -135,64 +133,36 @@ void poly1305_init_arch(struct poly1305_desc_ctx *dctx, const u8 key[POLY1305_KE
 	dctx->s[0] = get_unaligned_le32(&key[16]);
 	dctx->s[1] = get_unaligned_le32(&key[20]);
 	dctx->s[2] = get_unaligned_le32(&key[24]);
 	dctx->s[3] = get_unaligned_le32(&key[28]);
 	dctx->buflen = 0;
-	dctx->sset = true;
 }
 EXPORT_SYMBOL(poly1305_init_arch);
 
-static unsigned int crypto_poly1305_setdctxkey(struct poly1305_desc_ctx *dctx,
-					       const u8 *inp, unsigned int len)
-{
-	unsigned int acc = 0;
-	if (unlikely(!dctx->sset)) {
-		if (!dctx->rset && len >= POLY1305_BLOCK_SIZE) {
-			poly1305_simd_init(&dctx->h, inp);
-			inp += POLY1305_BLOCK_SIZE;
-			len -= POLY1305_BLOCK_SIZE;
-			acc += POLY1305_BLOCK_SIZE;
-			dctx->rset = 1;
-		}
-		if (len >= POLY1305_BLOCK_SIZE) {
-			dctx->s[0] = get_unaligned_le32(&inp[0]);
-			dctx->s[1] = get_unaligned_le32(&inp[4]);
-			dctx->s[2] = get_unaligned_le32(&inp[8]);
-			dctx->s[3] = get_unaligned_le32(&inp[12]);
-			acc += POLY1305_BLOCK_SIZE;
-			dctx->sset = true;
-		}
-	}
-	return acc;
-}
-
 void poly1305_update_arch(struct poly1305_desc_ctx *dctx, const u8 *src,
 			  unsigned int srclen)
 {
-	unsigned int bytes, used;
+	unsigned int bytes;
 
 	if (unlikely(dctx->buflen)) {
 		bytes = min(srclen, POLY1305_BLOCK_SIZE - dctx->buflen);
 		memcpy(dctx->buf + dctx->buflen, src, bytes);
 		src += bytes;
 		srclen -= bytes;
 		dctx->buflen += bytes;
 
 		if (dctx->buflen == POLY1305_BLOCK_SIZE) {
-			if (likely(!crypto_poly1305_setdctxkey(dctx, dctx->buf, POLY1305_BLOCK_SIZE)))
-				poly1305_simd_blocks(&dctx->h, dctx->buf, POLY1305_BLOCK_SIZE, 1);
+			poly1305_simd_blocks(&dctx->h, dctx->buf, POLY1305_BLOCK_SIZE, 1);
 			dctx->buflen = 0;
 		}
 	}
 
 	if (likely(srclen >= POLY1305_BLOCK_SIZE)) {
 		bytes = round_down(srclen, POLY1305_BLOCK_SIZE);
-		srclen -= bytes;
-		used = crypto_poly1305_setdctxkey(dctx, src, bytes);
-		if (likely(bytes - used))
-			poly1305_simd_blocks(&dctx->h, src + used, bytes - used, 1);
+		poly1305_simd_blocks(&dctx->h, src, bytes, 1);
 		src += bytes;
+		srclen -= bytes;
 	}
 
 	if (unlikely(srclen)) {
 		dctx->buflen = srclen;
 		memcpy(dctx->buf, src, srclen);
@@ -212,53 +182,10 @@ void poly1305_final_arch(struct poly1305_desc_ctx *dctx, u8 *dst)
 	poly1305_simd_emit(&dctx->h, dst, dctx->s);
 	memzero_explicit(dctx, sizeof(*dctx));
 }
 EXPORT_SYMBOL(poly1305_final_arch);
 
-static int crypto_poly1305_init(struct shash_desc *desc)
-{
-	struct poly1305_desc_ctx *dctx = shash_desc_ctx(desc);
-
-	*dctx = (struct poly1305_desc_ctx){};
-	return 0;
-}
-
-static int crypto_poly1305_update(struct shash_desc *desc,
-				  const u8 *src, unsigned int srclen)
-{
-	struct poly1305_desc_ctx *dctx = shash_desc_ctx(desc);
-
-	poly1305_update_arch(dctx, src, srclen);
-	return 0;
-}
-
-static int crypto_poly1305_final(struct shash_desc *desc, u8 *dst)
-{
-	struct poly1305_desc_ctx *dctx = shash_desc_ctx(desc);
-
-	if (unlikely(!dctx->sset))
-		return -ENOKEY;
-
-	poly1305_final_arch(dctx, dst);
-	return 0;
-}
-
-static struct shash_alg alg = {
-	.digestsize	= POLY1305_DIGEST_SIZE,
-	.init		= crypto_poly1305_init,
-	.update		= crypto_poly1305_update,
-	.final		= crypto_poly1305_final,
-	.descsize	= sizeof(struct poly1305_desc_ctx),
-	.base		= {
-		.cra_name		= "poly1305",
-		.cra_driver_name	= "poly1305-simd",
-		.cra_priority		= 300,
-		.cra_blocksize		= POLY1305_BLOCK_SIZE,
-		.cra_module		= THIS_MODULE,
-	},
-};
-
 bool poly1305_is_arch_optimized(void)
 {
 	return static_key_enabled(&poly1305_use_avx);
 }
 EXPORT_SYMBOL(poly1305_is_arch_optimized);
@@ -275,22 +202,12 @@ static int __init poly1305_simd_mod_init(void)
 	    boot_cpu_has(X86_FEATURE_AVX512F) &&
 	    cpu_has_xfeatures(XFEATURE_MASK_SSE | XFEATURE_MASK_YMM | XFEATURE_MASK_AVX512, NULL) &&
 	    /* Skylake downclocks unacceptably much when using zmm, but later generations are fast. */
 	    boot_cpu_data.x86_vfm != INTEL_SKYLAKE_X)
 		static_branch_enable(&poly1305_use_avx512);
-	return IS_REACHABLE(CONFIG_CRYPTO_HASH) ? crypto_register_shash(&alg) : 0;
-}
-
-static void __exit poly1305_simd_mod_exit(void)
-{
-	if (IS_REACHABLE(CONFIG_CRYPTO_HASH))
-		crypto_unregister_shash(&alg);
+	return 0;
 }
-
 arch_initcall(poly1305_simd_mod_init);
-module_exit(poly1305_simd_mod_exit);
 
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Jason A. Donenfeld <Jason@zx2c4.com>");
 MODULE_DESCRIPTION("Poly1305 authenticator");
-MODULE_ALIAS_CRYPTO("poly1305");
-MODULE_ALIAS_CRYPTO("poly1305-simd");
-- 
2.49.0


