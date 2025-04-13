Return-Path: <linuxppc-dev+bounces-7641-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EB80A870C0
	for <lists+linuxppc-dev@lfdr.de>; Sun, 13 Apr 2025 06:56:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZZymT24xyz2ywR;
	Sun, 13 Apr 2025 14:55:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1744520153;
	cv=none; b=hsZxSG4Dm/T0olFzj8UmpkzP+KAYJeMlec8UrCCny6mOjjuZKxjO0ce1qRPsZYl94yiCI8kwilpaaWNG/LIdyoL/hp9u848vdS7MygnGo88AXOb/cK38hL4gsFEUJpX5StLl2GjISJSUsUoQKA0By5jdVp8Eff2gMyMyAQpGbBuPDW4LSJ2ifmJXPGaAdxWdDfGtR3HMYzXc/UbcvUgDfOo3ZM2iioni+GRi3/iAJE5dXpijaApp44tcvCu52fYYDiNZx5ECHGlyrPnwiitAdRQ/A5gdQm/4v2sOx0Cqqnh7LH0PwSSvHxHPBziWqFjbaQyY2O28Kn0qg7IP0h+fug==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1744520153; c=relaxed/relaxed;
	bh=9Rtv5yf9SdcNfi/Q6caE6xtWhSbobaxGzn3ctMwJWPU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gkPsNXWt3pNmZkw1gyChoPuO57MxDcAPVLn8bJwKxdhbvzdVpCBmj1TDJRLppvZGh8iG31Mw6wFQFN7beC7AFgR9olzL6ZvwqiG/jyqaeh5AUkTtgJXhl7yXAhu/0H+m2RpJ8PW64bfsKXrcUHKjbRozyNeXW96HjEPnyoGlf1cneHgydwzCE6LxwLTQmKo4dK8muvRY68hdcazFD8w1rhwsqpOgIc9w2WEfRjdzvFVFrGImoE2Q6iQcc5PR5xc9oTBRM6eXGj83Q/BJNFkPuQJjyh5FMHuYmqq2QPvhMYhNNtQgLGmXwCxnspLEudl9QFPY/bR0qmtaS9v4DtE9Kw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=KY5b4L7n; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=KY5b4L7n;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZZymR736Xz30Bd
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 13 Apr 2025 14:55:51 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5C54243F31;
	Sun, 13 Apr 2025 04:55:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE7ACC4CEEB;
	Sun, 13 Apr 2025 04:55:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744520143;
	bh=Uv2ivhKGeSVnJttJbFk66Y1ps6xLRxh4yCdmxnmogHY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KY5b4L7n1HqepIWAPKLs1qrotLq2c54a5O7KU0785rvEUYPKN6iDwBm2H9Smjz+s6
	 Yp9mmMGANuGpo/CTioxu8qeRKTEeTTXAwR1vcwSjvNdNPyCLvrNgbFhEyEhWF7NOkE
	 96qdSnf50bYKRMWykgRovqVBmMjPND0lspd9/w1Bni+H1UCw/RhJwnvbeZFsQ02x0F
	 k3OIIZ9PGOglVBsOXXM8G3qUCsQ+w3yAwd0V9G0+7/9IuxjMHA698IpLzGy6QH7MGw
	 Ju8HUR/Ph7QsHlMeyL/wpDb+EivNONqlMHtGfyoc0HwNf2SxWk0SP4w3IA54l0olOs
	 LfGZUrCVQQ0pg==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	x86@kernel.org
Subject: [PATCH 6/9] crypto: mips/poly1305 - remove redundant shash algorithm
Date: Sat, 12 Apr 2025 21:54:18 -0700
Message-ID: <20250413045421.55100-7-ebiggers@kernel.org>
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
 arch/mips/crypto/Kconfig         |   5 --
 arch/mips/crypto/poly1305-glue.c | 120 +------------------------------
 2 files changed, 2 insertions(+), 123 deletions(-)

diff --git a/arch/mips/crypto/Kconfig b/arch/mips/crypto/Kconfig
index 9892391f74ac..8283664a1f24 100644
--- a/arch/mips/crypto/Kconfig
+++ b/arch/mips/crypto/Kconfig
@@ -2,17 +2,12 @@
 
 menu "Accelerated Cryptographic Algorithms for CPU (mips)"
 
 config CRYPTO_POLY1305_MIPS
 	tristate
-	select CRYPTO_HASH
 	select CRYPTO_ARCH_HAVE_LIB_POLY1305
 	default CRYPTO_LIB_POLY1305_INTERNAL
-	help
-	  Poly1305 authenticator algorithm (RFC7539)
-
-	  Architecture: mips
 
 config CRYPTO_MD5_OCTEON
 	tristate "Digests: MD5 (OCTEON)"
 	depends on CPU_CAVIUM_OCTEON
 	select CRYPTO_MD5
diff --git a/arch/mips/crypto/poly1305-glue.c b/arch/mips/crypto/poly1305-glue.c
index 9eee71dc0b99..576e7a58e0b1 100644
--- a/arch/mips/crypto/poly1305-glue.c
+++ b/arch/mips/crypto/poly1305-glue.c
@@ -3,17 +3,14 @@
  * OpenSSL/Cryptogams accelerated Poly1305 transform for MIPS
  *
  * Copyright (C) 2019 Linaro Ltd. <ard.biesheuvel@linaro.org>
  */
 
-#include <linux/unaligned.h>
-#include <crypto/algapi.h>
-#include <crypto/internal/hash.h>
-#include <crypto/internal/poly1305.h>
+#include <crypto/poly1305.h>
 #include <linux/cpufeature.h>
-#include <linux/crypto.h>
 #include <linux/module.h>
+#include <linux/unaligned.h>
 
 asmlinkage void poly1305_init_mips(void *state, const u8 *key);
 asmlinkage void poly1305_blocks_mips(void *state, const u8 *src, u32 len, u32 hibit);
 asmlinkage void poly1305_emit_mips(void *state, u8 *digest, const u32 *nonce);
 
@@ -26,81 +23,10 @@ void poly1305_init_arch(struct poly1305_desc_ctx *dctx, const u8 key[POLY1305_KE
 	dctx->s[3] = get_unaligned_le32(key + 28);
 	dctx->buflen = 0;
 }
 EXPORT_SYMBOL(poly1305_init_arch);
 
-static int mips_poly1305_init(struct shash_desc *desc)
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
-static void mips_poly1305_blocks(struct poly1305_desc_ctx *dctx, const u8 *src,
-				 u32 len, u32 hibit)
-{
-	if (unlikely(!dctx->sset)) {
-		if (!dctx->rset) {
-			poly1305_init_mips(&dctx->h, src);
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
-	poly1305_blocks_mips(&dctx->h, src, len, hibit);
-}
-
-static int mips_poly1305_update(struct shash_desc *desc, const u8 *src,
-				unsigned int len)
-{
-	struct poly1305_desc_ctx *dctx = shash_desc_ctx(desc);
-
-	if (unlikely(dctx->buflen)) {
-		u32 bytes = min(len, POLY1305_BLOCK_SIZE - dctx->buflen);
-
-		memcpy(dctx->buf + dctx->buflen, src, bytes);
-		src += bytes;
-		len -= bytes;
-		dctx->buflen += bytes;
-
-		if (dctx->buflen == POLY1305_BLOCK_SIZE) {
-			mips_poly1305_blocks(dctx, dctx->buf, POLY1305_BLOCK_SIZE, 1);
-			dctx->buflen = 0;
-		}
-	}
-
-	if (likely(len >= POLY1305_BLOCK_SIZE)) {
-		mips_poly1305_blocks(dctx, src, len, 1);
-		src += round_down(len, POLY1305_BLOCK_SIZE);
-		len %= POLY1305_BLOCK_SIZE;
-	}
-
-	if (unlikely(len)) {
-		dctx->buflen = len;
-		memcpy(dctx->buf, src, len);
-	}
-	return 0;
-}
-
 void poly1305_update_arch(struct poly1305_desc_ctx *dctx, const u8 *src,
 			  unsigned int nbytes)
 {
 	if (unlikely(dctx->buflen)) {
 		u32 bytes = min(nbytes, POLY1305_BLOCK_SIZE - dctx->buflen);
@@ -144,55 +70,13 @@ void poly1305_final_arch(struct poly1305_desc_ctx *dctx, u8 *dst)
 	poly1305_emit_mips(&dctx->h, dst, dctx->s);
 	*dctx = (struct poly1305_desc_ctx){};
 }
 EXPORT_SYMBOL(poly1305_final_arch);
 
-static int mips_poly1305_final(struct shash_desc *desc, u8 *dst)
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
-static struct shash_alg mips_poly1305_alg = {
-	.init			= mips_poly1305_init,
-	.update			= mips_poly1305_update,
-	.final			= mips_poly1305_final,
-	.digestsize		= POLY1305_DIGEST_SIZE,
-	.descsize		= sizeof(struct poly1305_desc_ctx),
-
-	.base.cra_name		= "poly1305",
-	.base.cra_driver_name	= "poly1305-mips-old",
-	.base.cra_priority	= 200,
-	.base.cra_blocksize	= POLY1305_BLOCK_SIZE,
-	.base.cra_module	= THIS_MODULE,
-};
-
 bool poly1305_is_arch_optimized(void)
 {
 	return true;
 }
 EXPORT_SYMBOL(poly1305_is_arch_optimized);
 
-static int __init mips_poly1305_mod_init(void)
-{
-	return IS_REACHABLE(CONFIG_CRYPTO_HASH) ?
-		crypto_register_shash(&mips_poly1305_alg) : 0;
-}
-
-static void __exit mips_poly1305_mod_exit(void)
-{
-	if (IS_REACHABLE(CONFIG_CRYPTO_HASH))
-		crypto_unregister_shash(&mips_poly1305_alg);
-}
-
-arch_initcall(mips_poly1305_mod_init);
-module_exit(mips_poly1305_mod_exit);
-
 MODULE_DESCRIPTION("Poly1305 transform (MIPS accelerated");
 MODULE_LICENSE("GPL v2");
-MODULE_ALIAS_CRYPTO("poly1305");
-MODULE_ALIAS_CRYPTO("poly1305-mips");
-- 
2.49.0


