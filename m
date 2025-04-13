Return-Path: <linuxppc-dev+bounces-7637-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5255AA870BF
	for <lists+linuxppc-dev@lfdr.de>; Sun, 13 Apr 2025 06:56:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZZymQ2tt7z2yrv;
	Sun, 13 Apr 2025 14:55:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1744520150;
	cv=none; b=iq6vHYaGo69tyLOOaFRyWyFCSrBfK0yTr54aryhZmj5tYyYY27kpxStHLm26Gpxu7dkQzbYWA5vG99FxLWzJuMFxw5Jry9fPNeXsn3JMkq5LsvDFqzUDDXTG+vBvTTxwzk+cHHB2cIJBSBWv2mFiEdO+i6VkEz++zbbXL1T85N0LnH5lTklv+IqkTVW9DwXESOKG5PHO56ju6xdiC4yV25RSidhRUUVmf5KCddkTCV3aKe8LKAj/4r7WptTwueYTEgqtKNx2u4E5OgCsCcqrrHjMTZXN3pHINUBb1a85DFkXLexp80NgGAfEpfxPK+LvMUB0KtLG2Y2jsRi8FFG+xA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1744520150; c=relaxed/relaxed;
	bh=ghHI1ua22909A9AO+A0V2TeTXm1nvlLoI7Gwe5xVBGg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=S1mG0a2PSIdl9eLBfUbGqDoYEKgNIQ3FhME9qOa+kL0J8xJj1C067VZzC6+QfcUJDfPPTfKFlDwsgbDJkm4Cjc6bG6r+8x1vRS4J2Rm8h2YWXYdl8GqFVJ3TsLnF4z+BOrvnxW7wQxJoNag/m13jL5fmNxgkNfItZ+WmfQChVPhvDPr9fnEJNwPKVewtaL09WW+GCmKbSnLqFF5RukG9nhPf/XV8N5lKx0HnxReOO5xrmAiaRYFHoWi4z7ly0bDC7W5os42TLZUV9dixrGSuN8slNJeFDfUpnDzghW1Zn4ETv4SeBU3bR79KSTYTse9IxxM+3Qa2GCeeemF2H2d6ZA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=qurcntK5; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=qurcntK5;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZZymL4w5Bz2yHj
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 13 Apr 2025 14:55:46 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id C1C63A40E71;
	Sun, 13 Apr 2025 04:50:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6BB1C4CEEF;
	Sun, 13 Apr 2025 04:55:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744520142;
	bh=9FIfB3SWlQ3XpNk3Dx8kombdj2eN1jWYviON2vPLySA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qurcntK5oD7ir9QIYy87uFOTG7DZ5ai9xFFMpiTEhR/j4EdtY12M1OVTdVtw/NJsu
	 rsi1wNoL03woAdSu5nYj1OYQmu0DYRKWlULNk+FTWgaf2Zblpp5kLX7C7phu3fINkJ
	 FaacxnBSITxJUiMkcoVJmZVe9NRVMocxReuTm9Pemzo9v6gGJxHgF6uHuS4P1oa0cy
	 e52Y1ytSrBM2Ff5pvBoMUuPsuevuOXObpmTux9yE2jVJ0ejIcew5LdtJJw2W2JfmFM
	 qFMw+xdBSJRuCKY61p/OVXS05LkzuFyjgccxIl3qFqMfmh5X9gWRb5IiP+vnLiXMN2
	 d51Zcu6bAdL7w==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	x86@kernel.org
Subject: [PATCH 4/9] crypto: arm64/poly1305 - remove redundant shash algorithm
Date: Sat, 12 Apr 2025 21:54:16 -0700
Message-ID: <20250413045421.55100-5-ebiggers@kernel.org>
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
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS,SUSPICIOUS_RECIPS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

From: Eric Biggers <ebiggers@google.com>

Since crypto/poly1305.c now registers a poly1305-$(ARCH) shash algorithm
that uses the architecture's Poly1305 library functions, individual
architectures no longer need to do the same.  Therefore, remove the
redundant shash algorithm from the arch-specific code and leave just the
library functions there.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 arch/arm64/crypto/Kconfig         |   6 --
 arch/arm64/crypto/poly1305-glue.c | 140 ++----------------------------
 2 files changed, 6 insertions(+), 140 deletions(-)

diff --git a/arch/arm64/crypto/Kconfig b/arch/arm64/crypto/Kconfig
index ce655da0fbee..c47a7649a241 100644
--- a/arch/arm64/crypto/Kconfig
+++ b/arch/arm64/crypto/Kconfig
@@ -26,18 +26,12 @@ config CRYPTO_NHPOLY1305_NEON
 	  - NEON (Advanced SIMD) extensions
 
 config CRYPTO_POLY1305_NEON
 	tristate
 	depends on KERNEL_MODE_NEON
-	select CRYPTO_HASH
 	select CRYPTO_ARCH_HAVE_LIB_POLY1305
 	default CRYPTO_LIB_POLY1305_INTERNAL
-	help
-	  Poly1305 authenticator algorithm (RFC7539)
-
-	  Architecture: arm64 using:
-	  - NEON (Advanced SIMD) extensions
 
 config CRYPTO_SHA1_ARM64_CE
 	tristate "Hash functions: SHA-1 (ARMv8 Crypto Extensions)"
 	depends on KERNEL_MODE_NEON
 	select CRYPTO_HASH
diff --git a/arch/arm64/crypto/poly1305-glue.c b/arch/arm64/crypto/poly1305-glue.c
index 89415731d9be..cb152ceac14a 100644
--- a/arch/arm64/crypto/poly1305-glue.c
+++ b/arch/arm64/crypto/poly1305-glue.c
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
 
 asmlinkage void poly1305_init_arm64(void *state, const u8 *key);
 asmlinkage void poly1305_blocks(void *state, const u8 *src, u32 len, u32 hibit);
 asmlinkage void poly1305_blocks_neon(void *state, const u8 *src, u32 len, u32 hibit);
 asmlinkage void poly1305_emit(void *state, u8 *digest, const u32 *nonce);
@@ -34,96 +31,10 @@ void poly1305_init_arch(struct poly1305_desc_ctx *dctx, const u8 key[POLY1305_KE
 	dctx->s[3] = get_unaligned_le32(key + 28);
 	dctx->buflen = 0;
 }
 EXPORT_SYMBOL(poly1305_init_arch);
 
-static int neon_poly1305_init(struct shash_desc *desc)
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
-static void neon_poly1305_blocks(struct poly1305_desc_ctx *dctx, const u8 *src,
-				 u32 len, u32 hibit, bool do_neon)
-{
-	if (unlikely(!dctx->sset)) {
-		if (!dctx->rset) {
-			poly1305_init_arm64(&dctx->h, src);
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
-		poly1305_blocks(&dctx->h, src, len, hibit);
-}
-
-static void neon_poly1305_do_update(struct poly1305_desc_ctx *dctx,
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
-			neon_poly1305_blocks(dctx, dctx->buf,
-					     POLY1305_BLOCK_SIZE, 1, false);
-			dctx->buflen = 0;
-		}
-	}
-
-	if (likely(len >= POLY1305_BLOCK_SIZE)) {
-		neon_poly1305_blocks(dctx, src, len, 1, do_neon);
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
-static int neon_poly1305_update(struct shash_desc *desc,
-				const u8 *src, unsigned int srclen)
-{
-	bool do_neon = crypto_simd_usable() && srclen > 128;
-	struct poly1305_desc_ctx *dctx = shash_desc_ctx(desc);
-
-	if (static_branch_likely(&have_neon) && do_neon)
-		kernel_neon_begin();
-	neon_poly1305_do_update(dctx, src, srclen, do_neon);
-	if (static_branch_likely(&have_neon) && do_neon)
-		kernel_neon_end();
-	return 0;
-}
-
 void poly1305_update_arch(struct poly1305_desc_ctx *dctx, const u8 *src,
 			  unsigned int nbytes)
 {
 	if (unlikely(dctx->buflen)) {
 		u32 bytes = min(nbytes, POLY1305_BLOCK_SIZE - dctx->buflen);
@@ -179,61 +90,22 @@ void poly1305_final_arch(struct poly1305_desc_ctx *dctx, u8 *dst)
 	poly1305_emit(&dctx->h, dst, dctx->s);
 	memzero_explicit(dctx, sizeof(*dctx));
 }
 EXPORT_SYMBOL(poly1305_final_arch);
 
-static int neon_poly1305_final(struct shash_desc *desc, u8 *dst)
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
-static struct shash_alg neon_poly1305_alg = {
-	.init			= neon_poly1305_init,
-	.update			= neon_poly1305_update,
-	.final			= neon_poly1305_final,
-	.digestsize		= POLY1305_DIGEST_SIZE,
-	.descsize		= sizeof(struct poly1305_desc_ctx),
-
-	.base.cra_name		= "poly1305",
-	.base.cra_driver_name	= "poly1305-neon",
-	.base.cra_priority	= 200,
-	.base.cra_blocksize	= POLY1305_BLOCK_SIZE,
-	.base.cra_module	= THIS_MODULE,
-};
-
 bool poly1305_is_arch_optimized(void)
 {
 	/* We always can use at least the ARM64 scalar implementation. */
 	return true;
 }
 EXPORT_SYMBOL(poly1305_is_arch_optimized);
 
 static int __init neon_poly1305_mod_init(void)
 {
-	if (!cpu_have_named_feature(ASIMD))
-		return 0;
-
-	static_branch_enable(&have_neon);
-
-	return IS_REACHABLE(CONFIG_CRYPTO_HASH) ?
-		crypto_register_shash(&neon_poly1305_alg) : 0;
-}
-
-static void __exit neon_poly1305_mod_exit(void)
-{
-	if (IS_REACHABLE(CONFIG_CRYPTO_HASH) && cpu_have_named_feature(ASIMD))
-		crypto_unregister_shash(&neon_poly1305_alg);
+	if (cpu_have_named_feature(ASIMD))
+		static_branch_enable(&have_neon);
+	return 0;
 }
-
 arch_initcall(neon_poly1305_mod_init);
-module_exit(neon_poly1305_mod_exit);
 
-MODULE_DESCRIPTION("Poly1305 transform using NEON instructions");
+MODULE_DESCRIPTION("Poly1305 authenticator (ARM64 optimized)");
 MODULE_LICENSE("GPL v2");
-MODULE_ALIAS_CRYPTO("poly1305");
-MODULE_ALIAS_CRYPTO("poly1305-neon");
-- 
2.49.0


