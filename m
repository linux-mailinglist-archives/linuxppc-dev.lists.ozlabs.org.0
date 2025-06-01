Return-Path: <linuxppc-dev+bounces-9057-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B2557ACA0C6
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Jun 2025 00:46:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b9XBf1Bh0z2yf3;
	Mon,  2 Jun 2025 08:46:02 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1748817962;
	cv=none; b=Y0unZY2PFFiJXVhQlc+n4Yf8Cup4rcOSXRDW1qLC017OvIvWV2MkKPh1bTjqCp6m3LPeM6XyK7JNlG8XhghAElhY2ubtqu0fi/vSqvrlBgvw7m5rX1GeyoX4pDjyyYzkdsS9VZfYXqAMOn8pnZMZKFyVDoA8X/V1ZZ6kWkRz1+JNlrz4U+MiJ8kg/AGi1rk95BsbRV2HmgHDbwoGJsQgkfWonqmhzQzVW5LyHJ3o2p0JM6mQJad0s3MNE/EB+98B0asLmyH9+7yRWACERW4zcG+ag57GobzVpaGc5eJC317g/C1rXvpyTnNkILBXYhxeOm6a2hNap/WvNTVl43w7EA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1748817962; c=relaxed/relaxed;
	bh=K/feknWBDObfV4ObDYpqpgF7krLYHSTEruwmyAIF5Ik=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TCC4nK6Th/2pHIzhuRjdGglclLUFDelrg3r/S2PGClNOoUmYSNjdM0w2k2cBKPgM1BaV9MtsgeNZL18xhfoFQxjZkhA8WuoLWjxFll1fDngKUqaiQEmWkIngcE4G5UF6KBHNYDoopt4m362qjBv6pybr8Yqtpz+PhUNLmmZ7UAJvcfhOH5MZyGS608TprcAlr8tJcA2zqI1TBHUCPMkykf7WCR7Q5xVdwHwYYQkuuP+U3oDgNQKbFzfjlpiU3Tvuo3bbic35+bA5+hTOzVM4zVuKeZUkVqKSjp9URBjGhLdyYlBBVObgG8gTiR7RRuFCH4oSHb8GqC/zO/63M8PsXw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=DNPBjqUP; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=DNPBjqUP;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b9XBY2D5Vz2xHZ
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  2 Jun 2025 08:45:57 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id C2768A4A507;
	Sun,  1 Jun 2025 22:45:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C7E3C4CEF3;
	Sun,  1 Jun 2025 22:45:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748817953;
	bh=HDU9nSTLbE55YbS5EUuBOLBm8L+KFIjICgPyy22jxdc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DNPBjqUP++VnaPZeQEjCA9PyqCJOY1jpIJYbHsl58QNltzexLH+k8ZpJP826lKJc6
	 4uiNjnztbjOQdF4v00x2dEGtWcRRGMZXT4P2/7aRYie0N3dfqpFTBMtr4tB/gTk+ro
	 2C8fZYfDf+KKdNV9QH1Fvbe22PkJswPRcWoBHgi7Ae73mX/+cFwVJzfwqCEaqPyQYL
	 dYvjAgD1stt+XlvcSxaIVj8HfZoVRj9GfkwMdVGe18TiSaMerfLHUZXzoq3RcwpSA+
	 kDVCYaQs7AB87EEgn9MXaT1pxlISTeshxy5D2VGrJt0fqsYGg703b67vwpKi5cdlPV
	 9yCrZlVd3VVRQ==
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
Subject: [PATCH 01/13] crypto/crc32: register only one shash_alg
Date: Sun,  1 Jun 2025 15:44:29 -0700
Message-ID: <20250601224441.778374-2-ebiggers@kernel.org>
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
X-Spam-Status: No, score=-5.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

From: Eric Biggers <ebiggers@google.com>

Stop unnecessarily registering a "crc32-generic" shash_alg when a
"crc32-$(ARCH)" shash_alg is registered too.

While every algorithm does need to have a generic implementation to
ensure uniformity of support across platforms, that doesn't mean that we
need to make the generic implementation available through crypto_shash
when an optimized implementation is also available.

Registering the generic shash_alg did allow users of the crypto_shash or
crypto_ahash APIs to request the generic implementation specifically,
instead of an optimized one.  However, the only known use case for that
was the differential fuzz tests in crypto/testmgr.c.  Equivalent test
coverage is now provided by crc_kunit.

Besides simplifying crypto/crc32.c, this change eliminates the need for
the library to provide crc32_le_base() as part of its interface.  Later
patches will make crc32_le_base() be internal to the library.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 crypto/crc32.c | 69 ++++++++------------------------------------------
 1 file changed, 11 insertions(+), 58 deletions(-)

diff --git a/crypto/crc32.c b/crypto/crc32.c
index cc371d42601fd..b61d5663d0bac 100644
--- a/crypto/crc32.c
+++ b/crypto/crc32.c
@@ -57,33 +57,16 @@ static int crc32_init(struct shash_desc *desc)
 static int crc32_update(struct shash_desc *desc, const u8 *data,
 			unsigned int len)
 {
 	u32 *crcp = shash_desc_ctx(desc);
 
-	*crcp = crc32_le_base(*crcp, data, len);
-	return 0;
-}
-
-static int crc32_update_arch(struct shash_desc *desc, const u8 *data,
-			     unsigned int len)
-{
-	u32 *crcp = shash_desc_ctx(desc);
-
 	*crcp = crc32_le(*crcp, data, len);
 	return 0;
 }
 
 /* No final XOR 0xFFFFFFFF, like crc32_le */
-static int __crc32_finup(u32 *crcp, const u8 *data, unsigned int len,
-			 u8 *out)
-{
-	put_unaligned_le32(crc32_le_base(*crcp, data, len), out);
-	return 0;
-}
-
-static int __crc32_finup_arch(u32 *crcp, const u8 *data, unsigned int len,
-			      u8 *out)
+static int __crc32_finup(u32 *crcp, const u8 *data, unsigned int len, u8 *out)
 {
 	put_unaligned_le32(crc32_le(*crcp, data, len), out);
 	return 0;
 }
 
@@ -91,16 +74,10 @@ static int crc32_finup(struct shash_desc *desc, const u8 *data,
 		       unsigned int len, u8 *out)
 {
 	return __crc32_finup(shash_desc_ctx(desc), data, len, out);
 }
 
-static int crc32_finup_arch(struct shash_desc *desc, const u8 *data,
-		       unsigned int len, u8 *out)
-{
-	return __crc32_finup_arch(shash_desc_ctx(desc), data, len, out);
-}
-
 static int crc32_final(struct shash_desc *desc, u8 *out)
 {
 	u32 *crcp = shash_desc_ctx(desc);
 
 	put_unaligned_le32(*crcp, out);
@@ -111,72 +88,48 @@ static int crc32_digest(struct shash_desc *desc, const u8 *data,
 			unsigned int len, u8 *out)
 {
 	return __crc32_finup(crypto_shash_ctx(desc->tfm), data, len, out);
 }
 
-static int crc32_digest_arch(struct shash_desc *desc, const u8 *data,
-			     unsigned int len, u8 *out)
-{
-	return __crc32_finup_arch(crypto_shash_ctx(desc->tfm), data, len, out);
-}
-
-static struct shash_alg algs[] = {{
+static struct shash_alg alg = {
 	.setkey			= crc32_setkey,
 	.init			= crc32_init,
 	.update			= crc32_update,
 	.final			= crc32_final,
 	.finup			= crc32_finup,
 	.digest			= crc32_digest,
 	.descsize		= sizeof(u32),
 	.digestsize		= CHKSUM_DIGEST_SIZE,
 
 	.base.cra_name		= "crc32",
-	.base.cra_driver_name	= "crc32-generic",
 	.base.cra_priority	= 100,
 	.base.cra_flags		= CRYPTO_ALG_OPTIONAL_KEY,
 	.base.cra_blocksize	= CHKSUM_BLOCK_SIZE,
 	.base.cra_ctxsize	= sizeof(u32),
 	.base.cra_module	= THIS_MODULE,
 	.base.cra_init		= crc32_cra_init,
-}, {
-	.setkey			= crc32_setkey,
-	.init			= crc32_init,
-	.update			= crc32_update_arch,
-	.final			= crc32_final,
-	.finup			= crc32_finup_arch,
-	.digest			= crc32_digest_arch,
-	.descsize		= sizeof(u32),
-	.digestsize		= CHKSUM_DIGEST_SIZE,
-
-	.base.cra_name		= "crc32",
-	.base.cra_driver_name	= "crc32-" __stringify(ARCH),
-	.base.cra_priority	= 150,
-	.base.cra_flags		= CRYPTO_ALG_OPTIONAL_KEY,
-	.base.cra_blocksize	= CHKSUM_BLOCK_SIZE,
-	.base.cra_ctxsize	= sizeof(u32),
-	.base.cra_module	= THIS_MODULE,
-	.base.cra_init		= crc32_cra_init,
-}};
-
-static int num_algs;
+};
 
 static int __init crc32_mod_init(void)
 {
-	/* register the arch flavor only if it differs from the generic one */
-	num_algs = 1 + ((crc32_optimizations() & CRC32_LE_OPTIMIZATION) != 0);
+	const char *driver_name =
+		(crc32_optimizations() & CRC32_LE_OPTIMIZATION) ?
+			"crc32-" __stringify(ARCH) :
+			"crc32-generic";
+
+	strscpy(alg.base.cra_driver_name, driver_name, CRYPTO_MAX_ALG_NAME);
 
-	return crypto_register_shashes(algs, num_algs);
+	return crypto_register_shash(&alg);
 }
 
 static void __exit crc32_mod_fini(void)
 {
-	crypto_unregister_shashes(algs, num_algs);
+	crypto_unregister_shash(&alg);
 }
 
 module_init(crc32_mod_init);
 module_exit(crc32_mod_fini);
 
 MODULE_AUTHOR("Alexander Boyko <alexander_boyko@xyratex.com>");
 MODULE_DESCRIPTION("CRC32 calculations wrapper for lib/crc32");
 MODULE_LICENSE("GPL");
 MODULE_ALIAS_CRYPTO("crc32");
-MODULE_ALIAS_CRYPTO("crc32-generic");
-- 
2.49.0


