Return-Path: <linuxppc-dev+bounces-7635-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 62B5CA870B9
	for <lists+linuxppc-dev@lfdr.de>; Sun, 13 Apr 2025 06:56:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZZymP1fBPz2yrC;
	Sun, 13 Apr 2025 14:55:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1744520149;
	cv=none; b=AI8YY4AIU6ercoPqqHslOFtinhl1ky++SWV6XpSDsVpXd+MVZWzRgitBWn/e3ntvbc4XQUj5z+PBTE9v9SeitTd9j+UXV9V+Fp1GHhXbJOCJwulITOfGJ1+Gt+RLcWGA+YsJWCxZOfHuaHHpOBtsBiiyqkXm1VorVa97rUqtR4Qz/Lbz9dsCHf9F7MPS/LpC6ZPsNarUop4S52cmmS72tTn1vFCke9c5XjCJ3rV/cP8aC3qAvUPFqilHiWtng2F8LwZ9hoSvTupheuMSGCjNaPegxU1HEfQTDWW59cZtVbO9Z2UriwNc5tKqAVnHOP2JuBkSfDkSaanvgcaroCIDBA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1744520149; c=relaxed/relaxed;
	bh=6LFKrjXL+ASEJNAYWGzGxdZzCjPuyh8F8fOUR6TZNK0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YcZrTMl2PFnwxfeqfj/DHGA468qhqU393bCe3BwY6nNl7YDMo17bz7DOyNOrqiJlzlnCv4FKwfmRHKqj4+e+DcqRHuSJ9apd8szU2EOpLS/eXhih4NCegvt7MnJV0CUQMYiz20jaOiATE2872JolvpdRUNkvGOBK/vi6s5B3fTu0XK/E5MhNq6BphVOBZ0duzQ+cWJcNEAe5MAwfKPf40rewpswzIlru+0gG7XBegMYirEiSc9ktBk+U7lXG/ZAZP81ATdeAM8zJJDtm3MngCRis5qxgwITfEeY/jZF2TN+lV1jHL5eka+k19gPXj/XwlUJlCWbp6HTjLJPzLxMnbQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=aqBiDJNe; dkim-atps=neutral; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=aqBiDJNe;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZZymJ3MmMz2yDD
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 13 Apr 2025 14:55:44 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 33772A40DC5;
	Sun, 13 Apr 2025 04:50:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10ACDC4CEEC;
	Sun, 13 Apr 2025 04:55:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744520141;
	bh=hZyztrbmssg+PrHVWx2Hv09SPvgkFndX9/sdkxmFyCM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=aqBiDJNeYaacGQKLSOrtH0dEmHnz8GG7mwtiNLcT21DVDsTUo4a2IaxaEIwwY+a7x
	 dvmdb7NMOO7O4OucwSb/wmk2V6lsZVQTSYVyXTArnKXrs8+w8OvXrsYRPELDOOAozO
	 Z/A4AacddrqD236XPJvlGqNyhS96sc+eDhjDcoCv2uwOCcNh/oW7sXbh+gNdHoBBkW
	 ggSTugWAcoP8HkugkbFl2TPVoL2KfFoQLFclwOoMmJ2EHXE254NfXXBUOJGpjBVCtA
	 cVqQiGeYDG457JRu4L36AywhK9aOWYtt2rOxA/DkCJV0zHKmer/ll2wBuioClhzJ+o
	 x5dfUmi2MXaNg==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	x86@kernel.org
Subject: [PATCH 3/9] crypto: arm/poly1305 - remove redundant shash algorithm
Date: Sat, 12 Apr 2025 21:54:15 -0700
Message-ID: <20250413045421.55100-4-ebiggers@kernel.org>
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
 arch/arm/crypto/Kconfig         |   6 --
 arch/arm/crypto/poly1305-glue.c | 167 +-------------------------------
 2 files changed, 3 insertions(+), 170 deletions(-)

diff --git a/arch/arm/crypto/Kconfig b/arch/arm/crypto/Kconfig
index 332f2430beec..3530e7c80793 100644
--- a/arch/arm/crypto/Kconfig
+++ b/arch/arm/crypto/Kconfig
@@ -46,18 +46,12 @@ config CRYPTO_NHPOLY1305_NEON
 	  Architecture: arm using:
 	  - NEON (Advanced SIMD) extensions
 
 config CRYPTO_POLY1305_ARM
 	tristate
-	select CRYPTO_HASH
 	select CRYPTO_ARCH_HAVE_LIB_POLY1305
 	default CRYPTO_LIB_POLY1305_INTERNAL
-	help
-	  Poly1305 authenticator algorithm (RFC7539)
-
-	  Architecture: arm optionally using
-	  - NEON (Advanced SIMD) extensions
 
 config CRYPTO_BLAKE2S_ARM
 	bool "Hash functions: BLAKE2s"
 	select CRYPTO_ARCH_HAVE_LIB_BLAKE2S
 	help
diff --git a/arch/arm/crypto/poly1305-glue.c b/arch/arm/crypto/poly1305-glue.c
index 238dbf50d05d..6d6998b3ec7e 100644
--- a/arch/arm/crypto/poly1305-glue.c
+++ b/arch/arm/crypto/poly1305-glue.c
@@ -6,19 +6,16 @@
  */
 
 #include <asm/hwcap.h>
 #include <asm/neon.h>
 #include <asm/simd.h>
-#include <linux/unaligned.h>
-#include <crypto/algapi.h>
-#include <crypto/internal/hash.h>
-#include <crypto/internal/poly1305.h>
+#include <crypto/poly1305.h>
 #include <crypto/internal/simd.h>
 #include <linux/cpufeature.h>
-#include <linux/crypto.h>
 #include <linux/jump_label.h>
 #include <linux/module.h>
+#include <linux/unaligned.h>
 
 void poly1305_init_arm(void *state, const u8 *key);
 void poly1305_blocks_arm(void *state, const u8 *src, u32 len, u32 hibit);
 void poly1305_blocks_neon(void *state, const u8 *src, u32 len, u32 hibit);
 void poly1305_emit_arm(void *state, u8 *digest, const u32 *nonce);
@@ -38,106 +35,10 @@ void poly1305_init_arch(struct poly1305_desc_ctx *dctx, const u8 key[POLY1305_KE
 	dctx->s[3] = get_unaligned_le32(key + 28);
 	dctx->buflen = 0;
 }
 EXPORT_SYMBOL(poly1305_init_arch);
 
-static int arm_poly1305_init(struct shash_desc *desc)
-{
-	struct poly1305_desc_ctx *dctx = shash_desc_ctx(desc);
-
-	dctx->buflen = 0;
-	dctx->rset = 0;
-	dctx->sset = false;
-
-	return 0;
-}
-
-static void arm_poly1305_blocks(struct poly1305_desc_ctx *dctx, const u8 *src,
-				 u32 len, u32 hibit, bool do_neon)
-{
-	if (unlikely(!dctx->sset)) {
-		if (!dctx->rset) {
-			poly1305_init_arm(&dctx->h, src);
-			src += POLY1305_BLOCK_SIZE;
-			len -= POLY1305_BLOCK_SIZE;
-			dctx->rset = 1;
-		}
-		if (len >= POLY1305_BLOCK_SIZE) {
-			dctx->s[0] = get_unaligned_le32(src +  0);
-			dctx->s[1] = get_unaligned_le32(src +  4);
-			dctx->s[2] = get_unaligned_le32(src +  8);
-			dctx->s[3] = get_unaligned_le32(src + 12);
-			src += POLY1305_BLOCK_SIZE;
-			len -= POLY1305_BLOCK_SIZE;
-			dctx->sset = true;
-		}
-		if (len < POLY1305_BLOCK_SIZE)
-			return;
-	}
-
-	len &= ~(POLY1305_BLOCK_SIZE - 1);
-
-	if (static_branch_likely(&have_neon) && likely(do_neon))
-		poly1305_blocks_neon(&dctx->h, src, len, hibit);
-	else
-		poly1305_blocks_arm(&dctx->h, src, len, hibit);
-}
-
-static void arm_poly1305_do_update(struct poly1305_desc_ctx *dctx,
-				    const u8 *src, u32 len, bool do_neon)
-{
-	if (unlikely(dctx->buflen)) {
-		u32 bytes = min(len, POLY1305_BLOCK_SIZE - dctx->buflen);
-
-		memcpy(dctx->buf + dctx->buflen, src, bytes);
-		src += bytes;
-		len -= bytes;
-		dctx->buflen += bytes;
-
-		if (dctx->buflen == POLY1305_BLOCK_SIZE) {
-			arm_poly1305_blocks(dctx, dctx->buf,
-					    POLY1305_BLOCK_SIZE, 1, false);
-			dctx->buflen = 0;
-		}
-	}
-
-	if (likely(len >= POLY1305_BLOCK_SIZE)) {
-		arm_poly1305_blocks(dctx, src, len, 1, do_neon);
-		src += round_down(len, POLY1305_BLOCK_SIZE);
-		len %= POLY1305_BLOCK_SIZE;
-	}
-
-	if (unlikely(len)) {
-		dctx->buflen = len;
-		memcpy(dctx->buf, src, len);
-	}
-}
-
-static int arm_poly1305_update(struct shash_desc *desc,
-			       const u8 *src, unsigned int srclen)
-{
-	struct poly1305_desc_ctx *dctx = shash_desc_ctx(desc);
-
-	arm_poly1305_do_update(dctx, src, srclen, false);
-	return 0;
-}
-
-static int __maybe_unused arm_poly1305_update_neon(struct shash_desc *desc,
-						   const u8 *src,
-						   unsigned int srclen)
-{
-	struct poly1305_desc_ctx *dctx = shash_desc_ctx(desc);
-	bool do_neon = crypto_simd_usable() && srclen > 128;
-
-	if (static_branch_likely(&have_neon) && do_neon)
-		kernel_neon_begin();
-	arm_poly1305_do_update(dctx, src, srclen, do_neon);
-	if (static_branch_likely(&have_neon) && do_neon)
-		kernel_neon_end();
-	return 0;
-}
-
 void poly1305_update_arch(struct poly1305_desc_ctx *dctx, const u8 *src,
 			  unsigned int nbytes)
 {
 	bool do_neon = IS_ENABLED(CONFIG_KERNEL_MODE_NEON) &&
 		       crypto_simd_usable();
@@ -197,49 +98,10 @@ void poly1305_final_arch(struct poly1305_desc_ctx *dctx, u8 *dst)
 	poly1305_emit_arm(&dctx->h, dst, dctx->s);
 	*dctx = (struct poly1305_desc_ctx){};
 }
 EXPORT_SYMBOL(poly1305_final_arch);
 
-static int arm_poly1305_final(struct shash_desc *desc, u8 *dst)
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
-static struct shash_alg arm_poly1305_algs[] = {{
-	.init			= arm_poly1305_init,
-	.update			= arm_poly1305_update,
-	.final			= arm_poly1305_final,
-	.digestsize		= POLY1305_DIGEST_SIZE,
-	.descsize		= sizeof(struct poly1305_desc_ctx),
-
-	.base.cra_name		= "poly1305",
-	.base.cra_driver_name	= "poly1305-arm-old",
-	.base.cra_priority	= 150,
-	.base.cra_blocksize	= POLY1305_BLOCK_SIZE,
-	.base.cra_module	= THIS_MODULE,
-#ifdef CONFIG_KERNEL_MODE_NEON
-}, {
-	.init			= arm_poly1305_init,
-	.update			= arm_poly1305_update_neon,
-	.final			= arm_poly1305_final,
-	.digestsize		= POLY1305_DIGEST_SIZE,
-	.descsize		= sizeof(struct poly1305_desc_ctx),
-
-	.base.cra_name		= "poly1305",
-	.base.cra_driver_name	= "poly1305-neon",
-	.base.cra_priority	= 200,
-	.base.cra_blocksize	= POLY1305_BLOCK_SIZE,
-	.base.cra_module	= THIS_MODULE,
-#endif
-}};
-
 bool poly1305_is_arch_optimized(void)
 {
 	/* We always can use at least the ARM scalar implementation. */
 	return true;
 }
@@ -248,34 +110,11 @@ EXPORT_SYMBOL(poly1305_is_arch_optimized);
 static int __init arm_poly1305_mod_init(void)
 {
 	if (IS_ENABLED(CONFIG_KERNEL_MODE_NEON) &&
 	    (elf_hwcap & HWCAP_NEON))
 		static_branch_enable(&have_neon);
-	else if (IS_REACHABLE(CONFIG_CRYPTO_HASH))
-		/* register only the first entry */
-		return crypto_register_shash(&arm_poly1305_algs[0]);
-
-	return IS_REACHABLE(CONFIG_CRYPTO_HASH) ?
-		crypto_register_shashes(arm_poly1305_algs,
-					ARRAY_SIZE(arm_poly1305_algs)) : 0;
-}
-
-static void __exit arm_poly1305_mod_exit(void)
-{
-	if (!IS_REACHABLE(CONFIG_CRYPTO_HASH))
-		return;
-	if (!static_branch_likely(&have_neon)) {
-		crypto_unregister_shash(&arm_poly1305_algs[0]);
-		return;
-	}
-	crypto_unregister_shashes(arm_poly1305_algs,
-				  ARRAY_SIZE(arm_poly1305_algs));
+	return 0;
 }
-
 arch_initcall(arm_poly1305_mod_init);
-module_exit(arm_poly1305_mod_exit);
 
 MODULE_DESCRIPTION("Accelerated Poly1305 transform for ARM");
 MODULE_LICENSE("GPL v2");
-MODULE_ALIAS_CRYPTO("poly1305");
-MODULE_ALIAS_CRYPTO("poly1305-arm");
-MODULE_ALIAS_CRYPTO("poly1305-neon");
-- 
2.49.0


