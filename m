Return-Path: <linuxppc-dev+bounces-7633-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 93835A870B4
	for <lists+linuxppc-dev@lfdr.de>; Sun, 13 Apr 2025 06:56:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZZymM2Wsxz2ySW;
	Sun, 13 Apr 2025 14:55:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1744520147;
	cv=none; b=J1NGSsFPyRuuJmDiyVYftbcPec4X0ya74sWvr650Ku/y37fvGpCLeQkQp8eEuPBKSIiPRZqijTJvZVje9JQwQ4lZUYA3USIXjVEy9xgZtk26FwWWALyiPnHFEmxHcx6MY6kXOFaZILi3Thva78y+OegGaFlb1bFPYR/gxEsfI7w3wRog6WY7GQEeOdBsE0/Yy4bBvipxhfmoDkLheVhsXbhR+4XjFJdC3zIowgLYntZsNa0+Ae5JaMOnF7C9Y9xXX+XgbDEgD7RugUo8dLiGubBMpsekGr80XDdPrYkoSVnyhTUEZI3NvlAPIYofzJ3BWy7O65N+MnbIpjeXczbdTw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1744520147; c=relaxed/relaxed;
	bh=O6e/7+xSkqHNapzqaKLz5lcr5fn/gFwGUJi7HyR0IVQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GJLG33zv1coCZmMOB8hzOML8z2PX4WgLKtcKWIzfD4zbw2GhNldHr1lWeBY/QL+6/xXDYFt9jzcvYpqyD5vzNzJtEaGg3c3K63fEffLmQ23mVlqwAwGFUUcqeSOyWWU1x/+eOoEfpQfvs7LenJR4VwCFiG2T/Dckby3IV99sCdR5NNaVhjmts7XwLlZ0CbFJRMhdiWH9X3P3tXAkJcJCxub+LxtCog4d9mVivu4osHbJfvbtFFDl/niOfDzvkpGl9S5WU/Odp9KdrgLYBsQXcjD7hWlsVYPMJzovpIgHdT9amkexa84jipSFPZSv1Puv6FTMuNeTjmUjV0V3YQu7jw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=raC1yaz/; dkim-atps=neutral; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=raC1yaz/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZZymJ3KXjz2xrb
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 13 Apr 2025 14:55:44 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 19EBBA407E5;
	Sun, 13 Apr 2025 04:50:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7EE6C4CEEC;
	Sun, 13 Apr 2025 04:55:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744520140;
	bh=0eZGQ4HOV8ila8DyyAF1mDleVNmhJHh2p5GKktNCdP0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=raC1yaz/NDXB5M5reoTn4t/01dfz407KBNfd0K/poDFbBFUEXP/CzzQ/h7BteTKya
	 +l7uKwR0/amZTMR3DiCT4nH7nArCjhZueQexvrtZHd1cqtpaZmRDLh5ctmFa/17nNz
	 YvKl3VfyjfrY+n4+fVBaZFVabVob+HzAYlmZBeuLJed3kN9mqzNFK1Dr+NpPQHmKfv
	 aTwBkkxbcyoedBvl/d93d69Apzs8J+eTE/mQIYs1kMuv509JB0qmRvALse4njknTIM
	 +MqCByN2EQaGo2r6lHoqjSObkDTt2F9oRPuZ1LRLrdmx8gkUI1M9HlEWVfoq+o2o+e
	 OGm+yRM8WpVlw==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	x86@kernel.org,
	Danny Tsen <dtsen@linux.ibm.com>
Subject: [PATCH 1/9] crypto: powerpc/poly1305 - implement library instead of shash
Date: Sat, 12 Apr 2025 21:54:13 -0700
Message-ID: <20250413045421.55100-2-ebiggers@kernel.org>
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
X-Spam-Status: No, score=-1.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

From: Eric Biggers <ebiggers@google.com>

Currently the Power10 optimized Poly1305 is only wired up to the
crypto_shash API, which makes it unavailable to users of the library
API.  The crypto_shash API for Poly1305 is going to change to be
implemented on top of the library API, so the library API needs to be
supported.  And of course it's needed anyway to serve the library users.

Therefore, change the Power10 optimized Poly1305 code to implement the
library API instead of the crypto_shash API.

Cc: Danny Tsen <dtsen@linux.ibm.com>
Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 arch/powerpc/crypto/Kconfig             |  11 +-
 arch/powerpc/crypto/poly1305-p10-glue.c | 132 +++++++-----------------
 2 files changed, 39 insertions(+), 104 deletions(-)

diff --git a/arch/powerpc/crypto/Kconfig b/arch/powerpc/crypto/Kconfig
index 47dccdd49637..cbcf76953d83 100644
--- a/arch/powerpc/crypto/Kconfig
+++ b/arch/powerpc/crypto/Kconfig
@@ -98,20 +98,15 @@ config CRYPTO_CHACHA20_P10
 	select CRYPTO_LIB_CHACHA_GENERIC
 	select CRYPTO_ARCH_HAVE_LIB_CHACHA
 	default CRYPTO_LIB_CHACHA_INTERNAL
 
 config CRYPTO_POLY1305_P10
-	tristate "Hash functions: Poly1305 (P10 or later)"
+	tristate
 	depends on PPC64 && CPU_LITTLE_ENDIAN && VSX
-	select CRYPTO_HASH
+	select CRYPTO_ARCH_HAVE_LIB_POLY1305
 	select CRYPTO_LIB_POLY1305_GENERIC
-	help
-	  Poly1305 authenticator algorithm (RFC7539)
-
-	  Architecture: PowerPC64
-	  - Power10 or later
-	  - Little-endian
+	default CRYPTO_LIB_POLY1305_INTERNAL
 
 config CRYPTO_DEV_VMX
         bool "Support for VMX cryptographic acceleration instructions"
         depends on PPC64 && VSX
         help
diff --git a/arch/powerpc/crypto/poly1305-p10-glue.c b/arch/powerpc/crypto/poly1305-p10-glue.c
index 369686e9370b..87bd5eba4497 100644
--- a/arch/powerpc/crypto/poly1305-p10-glue.c
+++ b/arch/powerpc/crypto/poly1305-p10-glue.c
@@ -2,28 +2,26 @@
 /*
  * Poly1305 authenticator algorithm, RFC7539.
  *
  * Copyright 2023- IBM Corp. All rights reserved.
  */
-
-#include <crypto/algapi.h>
-#include <linux/crypto.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/jump_label.h>
-#include <crypto/internal/hash.h>
-#include <crypto/internal/poly1305.h>
 #include <crypto/internal/simd.h>
+#include <crypto/poly1305.h>
 #include <linux/cpufeature.h>
 #include <linux/unaligned.h>
 #include <asm/simd.h>
 #include <asm/switch_to.h>
 
 asmlinkage void poly1305_p10le_4blocks(void *h, const u8 *m, u32 mlen);
 asmlinkage void poly1305_64s(void *h, const u8 *m, u32 mlen, int highbit);
 asmlinkage void poly1305_emit_64(void *h, void *s, u8 *dst);
 
+static __ro_after_init DEFINE_STATIC_KEY_FALSE(have_p10);
+
 static void vsx_begin(void)
 {
 	preempt_disable();
 	enable_kernel_vsx();
 }
@@ -32,82 +30,50 @@ static void vsx_end(void)
 {
 	disable_kernel_vsx();
 	preempt_enable();
 }
 
-static int crypto_poly1305_p10_init(struct shash_desc *desc)
+void poly1305_init_arch(struct poly1305_desc_ctx *dctx, const u8 key[POLY1305_KEY_SIZE])
 {
-	struct poly1305_desc_ctx *dctx = shash_desc_ctx(desc);
-
-	poly1305_core_init(&dctx->h);
+	if (!static_key_enabled(&have_p10))
+		return poly1305_init_generic(dctx, key);
+
+	dctx->h = (struct poly1305_state){};
+	dctx->core_r.key.r64[0] = get_unaligned_le64(key + 0);
+	dctx->core_r.key.r64[1] = get_unaligned_le64(key + 8);
+	dctx->s[0] = get_unaligned_le32(key + 16);
+	dctx->s[1] = get_unaligned_le32(key + 20);
+	dctx->s[2] = get_unaligned_le32(key + 24);
+	dctx->s[3] = get_unaligned_le32(key + 28);
 	dctx->buflen = 0;
-	dctx->rset = 0;
-	dctx->sset = false;
-
-	return 0;
 }
+EXPORT_SYMBOL(poly1305_init_arch);
 
-static unsigned int crypto_poly1305_setdctxkey(struct poly1305_desc_ctx *dctx,
-					       const u8 *inp, unsigned int len)
+void poly1305_update_arch(struct poly1305_desc_ctx *dctx,
+			  const u8 *src, unsigned int srclen)
 {
-	unsigned int acc = 0;
-
-	if (unlikely(!dctx->sset)) {
-		if (!dctx->rset && len >= POLY1305_BLOCK_SIZE) {
-			struct poly1305_core_key *key = &dctx->core_r;
-
-			key->key.r64[0] = get_unaligned_le64(&inp[0]);
-			key->key.r64[1] = get_unaligned_le64(&inp[8]);
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
+	unsigned int bytes;
 
-static int crypto_poly1305_p10_update(struct shash_desc *desc,
-				      const u8 *src, unsigned int srclen)
-{
-	struct poly1305_desc_ctx *dctx = shash_desc_ctx(desc);
-	unsigned int bytes, used;
+	if (!static_key_enabled(&have_p10))
+		return poly1305_update_generic(dctx, src, srclen);
 
 	if (unlikely(dctx->buflen)) {
 		bytes = min(srclen, POLY1305_BLOCK_SIZE - dctx->buflen);
 		memcpy(dctx->buf + dctx->buflen, src, bytes);
 		src += bytes;
 		srclen -= bytes;
 		dctx->buflen += bytes;
-
-		if (dctx->buflen == POLY1305_BLOCK_SIZE) {
-			if (likely(!crypto_poly1305_setdctxkey(dctx, dctx->buf,
-							       POLY1305_BLOCK_SIZE))) {
-				vsx_begin();
-				poly1305_64s(&dctx->h, dctx->buf,
-						  POLY1305_BLOCK_SIZE, 1);
-				vsx_end();
-			}
-			dctx->buflen = 0;
-		}
+		if (dctx->buflen < POLY1305_BLOCK_SIZE)
+			return;
+		vsx_begin();
+		poly1305_64s(&dctx->h, dctx->buf, POLY1305_BLOCK_SIZE, 1);
+		vsx_end();
+		dctx->buflen = 0;
 	}
 
 	if (likely(srclen >= POLY1305_BLOCK_SIZE)) {
 		bytes = round_down(srclen, POLY1305_BLOCK_SIZE);
-		used = crypto_poly1305_setdctxkey(dctx, src, bytes);
-		if (likely(used)) {
-			srclen -= used;
-			src += used;
-		}
 		if (crypto_simd_usable() && (srclen >= POLY1305_BLOCK_SIZE*4)) {
 			vsx_begin();
 			poly1305_p10le_4blocks(&dctx->h, src, srclen);
 			vsx_end();
 			src += srclen - (srclen % (POLY1305_BLOCK_SIZE * 4));
@@ -124,63 +90,37 @@ static int crypto_poly1305_p10_update(struct shash_desc *desc,
 
 	if (unlikely(srclen)) {
 		dctx->buflen = srclen;
 		memcpy(dctx->buf, src, srclen);
 	}
-
-	return 0;
 }
+EXPORT_SYMBOL(poly1305_update_arch);
 
-static int crypto_poly1305_p10_final(struct shash_desc *desc, u8 *dst)
+void poly1305_final_arch(struct poly1305_desc_ctx *dctx, u8 *dst)
 {
-	struct poly1305_desc_ctx *dctx = shash_desc_ctx(desc);
+	if (!static_key_enabled(&have_p10))
+		return poly1305_final_generic(dctx, dst);
 
-	if (unlikely(!dctx->sset))
-		return -ENOKEY;
-
-	if ((dctx->buflen)) {
+	if (dctx->buflen) {
 		dctx->buf[dctx->buflen++] = 1;
 		memset(dctx->buf + dctx->buflen, 0,
 		       POLY1305_BLOCK_SIZE - dctx->buflen);
 		vsx_begin();
 		poly1305_64s(&dctx->h, dctx->buf, POLY1305_BLOCK_SIZE, 0);
 		vsx_end();
-		dctx->buflen = 0;
 	}
 
 	poly1305_emit_64(&dctx->h, &dctx->s, dst);
-	return 0;
 }
-
-static struct shash_alg poly1305_alg = {
-	.digestsize	= POLY1305_DIGEST_SIZE,
-	.init		= crypto_poly1305_p10_init,
-	.update		= crypto_poly1305_p10_update,
-	.final		= crypto_poly1305_p10_final,
-	.descsize	= sizeof(struct poly1305_desc_ctx),
-	.base		= {
-		.cra_name		= "poly1305",
-		.cra_driver_name	= "poly1305-p10",
-		.cra_priority		= 300,
-		.cra_blocksize		= POLY1305_BLOCK_SIZE,
-		.cra_module		= THIS_MODULE,
-	},
-};
+EXPORT_SYMBOL(poly1305_final_arch);
 
 static int __init poly1305_p10_init(void)
 {
-	return crypto_register_shash(&poly1305_alg);
-}
-
-static void __exit poly1305_p10_exit(void)
-{
-	crypto_unregister_shash(&poly1305_alg);
+	if (cpu_has_feature(CPU_FTR_ARCH_31))
+		static_branch_enable(&have_p10);
+	return 0;
 }
-
-module_cpu_feature_match(PPC_MODULE_FEATURE_P10, poly1305_p10_init);
-module_exit(poly1305_p10_exit);
+arch_initcall(poly1305_p10_init);
 
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Danny Tsen <dtsen@linux.ibm.com>");
 MODULE_DESCRIPTION("Optimized Poly1305 for P10");
-MODULE_ALIAS_CRYPTO("poly1305");
-MODULE_ALIAS_CRYPTO("poly1305-p10");

base-commit: 3be3f70ee95da03a87d94c4a714ee679a5c7b34d
-- 
2.49.0


