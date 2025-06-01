Return-Path: <linuxppc-dev+bounces-9056-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E4138ACA0C0
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Jun 2025 00:46:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b9XBc35qvz2xjK;
	Mon,  2 Jun 2025 08:46:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1748817960;
	cv=none; b=cxlqSDCNeUqXviSOaAlA0RbrbK9zxe11k2q52yArnnAOMed3N++VPRY3Zn3e5R2RXfQMf52gal49F4ktpwvTLaJcu8lP5sdZteilyj79CuRTgQWxSdqe4pFH1k5hmSOnoCCS9ByTKje819AvTIRKaXah1F1uebLFG/sB3B6Dt+fMZ6lKp1NgOlFsvUI4cdD1NPNGDP74RPdnwvVD5+xOflZ7haauJm61w6MYtv39YCGXr36qjPQiW4bZG2HnnmB1ChWKfBvzFmrzNDaVPWoLWsNrI3lJgup1pBCiM6pNiydU7Ele7xEE4Ph9Q6tGHGAE2S5GJlWeiusC7Uh4yYyacA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1748817960; c=relaxed/relaxed;
	bh=i0Y8menV7yjk2FqCvshFVcPkgIOzs0nXGE7PFZIIXUs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QX2jvlYTUsAgQHrtJOB5XVt+NAgW7KS+NNFVINONiINrJFHTfYeaDX8cQVhlIuJRegeF+Y+dFd0PFDkRNonELg/1XQbhOhu9i/vJnmJeLmHbutFtZwfMkO5gr/b7zXLi+qfQH42WegZNR/IpsIp6Cn1kWlns7Wy3uXO0tRlOEsozU1oEazZYpnp2/V4qII4YloSyFgjEtQxo53wBIpI22lOP/q43VMRpB4XnyT2rajt02N5+VqljemLjUacRm9/MrxxLmEwi4JfamMrWvX47aztV7imLKNMRRuQni14MkMf6RnNASw+EnOW1nFVto3bxmredD0nXSUwicSTg1f/XiA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=s5KZx5zF; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=s5KZx5zF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b9XBX6T7Wz2xH9
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  2 Jun 2025 08:45:56 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 259304A838;
	Sun,  1 Jun 2025 22:45:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97E5FC4AF09;
	Sun,  1 Jun 2025 22:45:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748817954;
	bh=DuymbRdfQNASqdv95GmKI7xo6X3aqFKpkNJXYJg46+g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=s5KZx5zFP0pmjW+yPAWdh9HSDJ2eN9w2ECvi4PqHcvu7LAXDpxsbC+W620rIBoLrE
	 DznkxM4gfP4EgC5XNbW/1IZSwXBfLwYb/IAzXBTSTWzJC4xcVQe3Kc8S5SaI7DgHDo
	 zB1yc7zunGBGTw5P/TzAbj5R/07z6Jz4uDjDkknV7a/3ATwioeZfpMpSDAJIGlwvmZ
	 lDcK7YxikgkmIs33oVtz5QhNny84wp9XVplAzVmdhy00Q1kCZDwflOiPDRUlhAlYk2
	 Eg0xXw+k7lVB/hD59SGVjKJq3uODrL4J9EKIvDT8fqH39+CwyxjA3VwspzvlJX9AJO
	 fhH3nLtfKMqaw==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: linux-crypto@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	loongarch@lists.linux.dev,
	linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org,
	x86@kernel.org,
	linux-arch@vger.kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld " <Jason@zx2c4.com>,
	Linus Torvalds <torvalds@linux-foundation.org>
Subject: [PATCH 02/13] crypto/crc32c: register only one shash_alg
Date: Sun,  1 Jun 2025 15:44:30 -0700
Message-ID: <20250601224441.778374-3-ebiggers@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250601224441.778374-1-ebiggers@kernel.org>
References: <20250601224441.778374-1-ebiggers@kernel.org>
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

From: Eric Biggers <ebiggers@google.com>

Stop unnecessarily registering a "crc32c-generic" shash_alg when a
"crc32c-$(ARCH)" shash_alg is registered too.

While every algorithm does need to have a generic implementation to
ensure uniformity of support across platforms, that doesn't mean that we
need to make the generic implementation available through crypto_shash
when an optimized implementation is also available.

Registering the generic shash_alg did allow users of the crypto_shash or
crypto_ahash APIs to request the generic implementation specifically,
instead of an optimized one.  However, the only known use case for that
was the differential fuzz tests in crypto/testmgr.c.  Equivalent test
coverage is now provided by crc_kunit.

Besides simplifying crypto/crc32c.c, this change eliminates the need for
the library to provide crc32c_base() as part of its interface.  Later
patches will make crc32c_base() be internal to the library.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 crypto/crc32c.c | 70 +++++++------------------------------------------
 1 file changed, 10 insertions(+), 60 deletions(-)

diff --git a/crypto/crc32c.c b/crypto/crc32c.c
index e5377898414a2..e160695682f16 100644
--- a/crypto/crc32c.c
+++ b/crypto/crc32c.c
@@ -83,19 +83,10 @@ static int chksum_setkey(struct crypto_shash *tfm, const u8 *key,
 static int chksum_update(struct shash_desc *desc, const u8 *data,
 			 unsigned int length)
 {
 	struct chksum_desc_ctx *ctx = shash_desc_ctx(desc);
 
-	ctx->crc = crc32c_base(ctx->crc, data, length);
-	return 0;
-}
-
-static int chksum_update_arch(struct shash_desc *desc, const u8 *data,
-			      unsigned int length)
-{
-	struct chksum_desc_ctx *ctx = shash_desc_ctx(desc);
-
 	ctx->crc = crc32c(ctx->crc, data, length);
 	return 0;
 }
 
 static int chksum_final(struct shash_desc *desc, u8 *out)
@@ -105,17 +96,10 @@ static int chksum_final(struct shash_desc *desc, u8 *out)
 	put_unaligned_le32(~ctx->crc, out);
 	return 0;
 }
 
 static int __chksum_finup(u32 *crcp, const u8 *data, unsigned int len, u8 *out)
-{
-	put_unaligned_le32(~crc32c_base(*crcp, data, len), out);
-	return 0;
-}
-
-static int __chksum_finup_arch(u32 *crcp, const u8 *data, unsigned int len,
-			       u8 *out)
 {
 	put_unaligned_le32(~crc32c(*crcp, data, len), out);
 	return 0;
 }
 
@@ -125,98 +109,64 @@ static int chksum_finup(struct shash_desc *desc, const u8 *data,
 	struct chksum_desc_ctx *ctx = shash_desc_ctx(desc);
 
 	return __chksum_finup(&ctx->crc, data, len, out);
 }
 
-static int chksum_finup_arch(struct shash_desc *desc, const u8 *data,
-			     unsigned int len, u8 *out)
-{
-	struct chksum_desc_ctx *ctx = shash_desc_ctx(desc);
-
-	return __chksum_finup_arch(&ctx->crc, data, len, out);
-}
-
 static int chksum_digest(struct shash_desc *desc, const u8 *data,
 			 unsigned int length, u8 *out)
 {
 	struct chksum_ctx *mctx = crypto_shash_ctx(desc->tfm);
 
 	return __chksum_finup(&mctx->key, data, length, out);
 }
 
-static int chksum_digest_arch(struct shash_desc *desc, const u8 *data,
-			      unsigned int length, u8 *out)
-{
-	struct chksum_ctx *mctx = crypto_shash_ctx(desc->tfm);
-
-	return __chksum_finup_arch(&mctx->key, data, length, out);
-}
-
 static int crc32c_cra_init(struct crypto_tfm *tfm)
 {
 	struct chksum_ctx *mctx = crypto_tfm_ctx(tfm);
 
 	mctx->key = ~0;
 	return 0;
 }
 
-static struct shash_alg algs[] = {{
+static struct shash_alg alg = {
 	.digestsize		= CHKSUM_DIGEST_SIZE,
 	.setkey			= chksum_setkey,
 	.init			= chksum_init,
 	.update			= chksum_update,
 	.final			= chksum_final,
 	.finup			= chksum_finup,
 	.digest			= chksum_digest,
 	.descsize		= sizeof(struct chksum_desc_ctx),
 
 	.base.cra_name		= "crc32c",
-	.base.cra_driver_name	= "crc32c-generic",
 	.base.cra_priority	= 100,
 	.base.cra_flags		= CRYPTO_ALG_OPTIONAL_KEY,
 	.base.cra_blocksize	= CHKSUM_BLOCK_SIZE,
 	.base.cra_ctxsize	= sizeof(struct chksum_ctx),
 	.base.cra_module	= THIS_MODULE,
 	.base.cra_init		= crc32c_cra_init,
-}, {
-	.digestsize		= CHKSUM_DIGEST_SIZE,
-	.setkey			= chksum_setkey,
-	.init			= chksum_init,
-	.update			= chksum_update_arch,
-	.final			= chksum_final,
-	.finup			= chksum_finup_arch,
-	.digest			= chksum_digest_arch,
-	.descsize		= sizeof(struct chksum_desc_ctx),
-
-	.base.cra_name		= "crc32c",
-	.base.cra_driver_name	= "crc32c-" __stringify(ARCH),
-	.base.cra_priority	= 150,
-	.base.cra_flags		= CRYPTO_ALG_OPTIONAL_KEY,
-	.base.cra_blocksize	= CHKSUM_BLOCK_SIZE,
-	.base.cra_ctxsize	= sizeof(struct chksum_ctx),
-	.base.cra_module	= THIS_MODULE,
-	.base.cra_init		= crc32c_cra_init,
-}};
-
-static int num_algs;
+};
 
 static int __init crc32c_mod_init(void)
 {
-	/* register the arch flavor only if it differs from the generic one */
-	num_algs = 1 + ((crc32_optimizations() & CRC32C_OPTIMIZATION) != 0);
+	const char *driver_name =
+		(crc32_optimizations() & CRC32C_OPTIMIZATION) ?
+			"crc32c-" __stringify(ARCH) :
+			"crc32c-generic";
+
+	strscpy(alg.base.cra_driver_name, driver_name, CRYPTO_MAX_ALG_NAME);
 
-	return crypto_register_shashes(algs, num_algs);
+	return crypto_register_shash(&alg);
 }
 
 static void __exit crc32c_mod_fini(void)
 {
-	crypto_unregister_shashes(algs, num_algs);
+	crypto_unregister_shash(&alg);
 }
 
 module_init(crc32c_mod_init);
 module_exit(crc32c_mod_fini);
 
 MODULE_AUTHOR("Clay Haapala <chaapala@cisco.com>");
 MODULE_DESCRIPTION("CRC32c (Castagnoli) calculations wrapper for lib/crc32c");
 MODULE_LICENSE("GPL");
 MODULE_ALIAS_CRYPTO("crc32c");
-MODULE_ALIAS_CRYPTO("crc32c-generic");
-- 
2.49.0


