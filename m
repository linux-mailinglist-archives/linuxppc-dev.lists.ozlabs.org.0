Return-Path: <linuxppc-dev+bounces-3341-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 28D019D0189
	for <lists+linuxppc-dev@lfdr.de>; Sun, 17 Nov 2024 01:24:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XrWhb3HxRz30T8;
	Sun, 17 Nov 2024 11:23:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731803039;
	cv=none; b=SC0xCBnvlo0kR00PRfSeA9XA2jys18sWj7pxHnSBCwRJEq44m9ROY5tV4hmE5lJMEzZy1Mb9MNG1LMEwttp2wJR0N5Lw2JUWx9q/eeWb5/3B+opXKHG11c8yXduhlH1TDtqJa/xj78fb+8Mib6AJ2IpJPz5uX2oi0N95f9vMfB6Yq9A21mRDM+bhyynazcKRYbful8E13fp0CknVlflhbKucC0armkVcG/ImqGeQ/YCySzJwlrHG3ug15Wo8O7AYfXw6ZGDb+FOxvMyyDZgVKTZc/jLlvo+IdcLhdzKvsfCgieB99gurb8zuXS1mUlHA7bhtOsjOMxo+wAocF8ypnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731803039; c=relaxed/relaxed;
	bh=mB6BH20WVM9iWaGKcD3eSgNmpgMrkxwjBpbXNo9CyTQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ihAIT6X+PF/37bt8iZcEUt3IMBAz/SFYUhBJt2HkWxoo4F+fHrlPl3/l6Qiw3R97uPtUk37uUACNX/mD+7jjS82nvPih9N7ZRwuLP1ihIhP1ggzE0xaJjTZAE9Fxv9+JzJGNVgM1yYspJlfdrg39cu/lrs1qQNI1bNovnzRIE6lnj9X4ihGtL6VNj6yyqDOfWjz/xGnTJqA6VeA6et5sAcHEblePD+zwIEkrjtkrv8F+rtXBjRLC2NdAx1/gdeUGoXd01P3apuFNUg2+XWkUNqwfCiF1C+bIFhtanf+EuIifRucNoXue9GsVDPqCehKs9qSasMvlnw1joDhSBf0lpg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=nHGBbzqp; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=nHGBbzqp;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XrWhZ0mvjz2y8p
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 17 Nov 2024 11:23:57 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 3C6A5A40BEA;
	Sun, 17 Nov 2024 00:22:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91DC5C4CED6;
	Sun, 17 Nov 2024 00:23:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731803034;
	bh=fz4SkCeYBuj7fsA/U1fUHvVppsJG5UVFRFRoPgOF4lQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nHGBbzqpxxXr7z9JTDGZvIsMrkHcSwzjkEx2FI60yxgCeuqd7tlL2odGxTgZf534f
	 giTrqvVfr65GbOH5Ng0xGyxC2lsMyOPC3zCe135DvXeMC2LgYcXdoFARkKEazMxP2S
	 FehNuJ8ZDFj942jvr3zEQ8IxBZP48bBUFQJQsp4a7tds04ZqPcw53S9svvFYaLhlv6
	 zaBgI3R3pSUtCc6ETR0AkkpCWdxmToc1xGnMpbR5cl23tXHtgXwV47kVcMaSMUROFD
	 +x7tSIlYPh2purRhNnEq5ELrIHjTitDF4gVgTH8zfln7JvJ1qUexkZCOf0heRM+0/7
	 cAEO7vRyLTMtQ==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: linux-arch@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-crypto@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	x86@kernel.org,
	Zhihang Shao <zhihang.shao.iscas@gmail.com>,
	Ard Biesheuvel <ardb@kernel.org>
Subject: [PATCH 03/11] crypto: crct10dif - expose arch-optimized lib function
Date: Sat, 16 Nov 2024 16:22:36 -0800
Message-ID: <20241117002244.105200-4-ebiggers@kernel.org>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241117002244.105200-1-ebiggers@kernel.org>
References: <20241117002244.105200-1-ebiggers@kernel.org>
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
X-Spam-Status: No, score=-2.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

From: Eric Biggers <ebiggers@google.com>

Now that crc_t10dif_update() may be directly optimized for each
architecture, make the shash driver for crct10dif register a
crct10dif-$arch algorithm that uses it, instead of only
crct10dif-generic which uses crc_t10dif_generic().

The result is that architecture-optimized crct10dif will remain
available through the shash API once the architectures implement
crc_t10dif_arch() instead of the shash API.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 crypto/Makefile            |  1 +
 crypto/crct10dif_generic.c | 82 +++++++++++++++++++++++++++++---------
 2 files changed, 65 insertions(+), 18 deletions(-)

diff --git a/crypto/Makefile b/crypto/Makefile
index e948a883f151..8361fdb1a27d 100644
--- a/crypto/Makefile
+++ b/crypto/Makefile
@@ -153,10 +153,11 @@ obj-$(CONFIG_CRYPTO_MICHAEL_MIC) += michael_mic.o
 obj-$(CONFIG_CRYPTO_CRC32C) += crc32c_generic.o
 obj-$(CONFIG_CRYPTO_CRC32) += crc32_generic.o
 CFLAGS_crc32c_generic.o += -DARCH=$(ARCH)
 CFLAGS_crc32_generic.o += -DARCH=$(ARCH)
 obj-$(CONFIG_CRYPTO_CRCT10DIF) += crct10dif_generic.o
+CFLAGS_crct10dif_generic.o += -DARCH=$(ARCH)
 obj-$(CONFIG_CRYPTO_CRC64_ROCKSOFT) += crc64_rocksoft_generic.o
 obj-$(CONFIG_CRYPTO_AUTHENC) += authenc.o authencesn.o
 obj-$(CONFIG_CRYPTO_LZO) += lzo.o lzo-rle.o
 obj-$(CONFIG_CRYPTO_LZ4) += lz4.o
 obj-$(CONFIG_CRYPTO_LZ4HC) += lz4hc.o
diff --git a/crypto/crct10dif_generic.c b/crypto/crct10dif_generic.c
index e843982073bb..259cb01932cb 100644
--- a/crypto/crct10dif_generic.c
+++ b/crypto/crct10dif_generic.c
@@ -55,10 +55,19 @@ static int chksum_update(struct shash_desc *desc, const u8 *data,
 
 	ctx->crc = crc_t10dif_generic(ctx->crc, data, length);
 	return 0;
 }
 
+static int chksum_update_arch(struct shash_desc *desc, const u8 *data,
+			      unsigned int length)
+{
+	struct chksum_desc_ctx *ctx = shash_desc_ctx(desc);
+
+	ctx->crc = crc_t10dif_update(ctx->crc, data, length);
+	return 0;
+}
+
 static int chksum_final(struct shash_desc *desc, u8 *out)
 {
 	struct chksum_desc_ctx *ctx = shash_desc_ctx(desc);
 
 	*(__u16 *)out = ctx->crc;
@@ -69,49 +78,86 @@ static int __chksum_finup(__u16 crc, const u8 *data, unsigned int len, u8 *out)
 {
 	*(__u16 *)out = crc_t10dif_generic(crc, data, len);
 	return 0;
 }
 
+static int __chksum_finup_arch(__u16 crc, const u8 *data, unsigned int len,
+			       u8 *out)
+{
+	*(__u16 *)out = crc_t10dif_update(crc, data, len);
+	return 0;
+}
+
 static int chksum_finup(struct shash_desc *desc, const u8 *data,
 			unsigned int len, u8 *out)
 {
 	struct chksum_desc_ctx *ctx = shash_desc_ctx(desc);
 
 	return __chksum_finup(ctx->crc, data, len, out);
 }
 
+static int chksum_finup_arch(struct shash_desc *desc, const u8 *data,
+			     unsigned int len, u8 *out)
+{
+	struct chksum_desc_ctx *ctx = shash_desc_ctx(desc);
+
+	return __chksum_finup_arch(ctx->crc, data, len, out);
+}
+
 static int chksum_digest(struct shash_desc *desc, const u8 *data,
 			 unsigned int length, u8 *out)
 {
 	return __chksum_finup(0, data, length, out);
 }
 
-static struct shash_alg alg = {
-	.digestsize		=	CRC_T10DIF_DIGEST_SIZE,
-	.init		=	chksum_init,
-	.update		=	chksum_update,
-	.final		=	chksum_final,
-	.finup		=	chksum_finup,
-	.digest		=	chksum_digest,
-	.descsize		=	sizeof(struct chksum_desc_ctx),
-	.base			=	{
-		.cra_name		=	"crct10dif",
-		.cra_driver_name	=	"crct10dif-generic",
-		.cra_priority		=	100,
-		.cra_blocksize		=	CRC_T10DIF_BLOCK_SIZE,
-		.cra_module		=	THIS_MODULE,
-	}
-};
+static int chksum_digest_arch(struct shash_desc *desc, const u8 *data,
+			      unsigned int length, u8 *out)
+{
+	return __chksum_finup_arch(0, data, length, out);
+}
+
+static struct shash_alg algs[] = {{
+	.digestsize		= CRC_T10DIF_DIGEST_SIZE,
+	.init			= chksum_init,
+	.update			= chksum_update,
+	.final			= chksum_final,
+	.finup			= chksum_finup,
+	.digest			= chksum_digest,
+	.descsize		= sizeof(struct chksum_desc_ctx),
+	.base.cra_name		= "crct10dif",
+	.base.cra_driver_name	= "crct10dif-generic",
+	.base.cra_priority	= 100,
+	.base.cra_blocksize	= CRC_T10DIF_BLOCK_SIZE,
+	.base.cra_module	= THIS_MODULE,
+}, {
+	.digestsize		= CRC_T10DIF_DIGEST_SIZE,
+	.init			= chksum_init,
+	.update			= chksum_update_arch,
+	.final			= chksum_final,
+	.finup			= chksum_finup_arch,
+	.digest			= chksum_digest_arch,
+	.descsize		= sizeof(struct chksum_desc_ctx),
+	.base.cra_name		= "crct10dif",
+	.base.cra_driver_name	= "crct10dif-" __stringify(ARCH),
+	.base.cra_priority	= 150,
+	.base.cra_blocksize	= CRC_T10DIF_BLOCK_SIZE,
+	.base.cra_module	= THIS_MODULE,
+}};
+
+static int num_algs;
 
 static int __init crct10dif_mod_init(void)
 {
-	return crypto_register_shash(&alg);
+	/* register the arch flavor only if it differs from the generic one */
+	num_algs = 1 + crc_t10dif_is_optimized();
+
+	return crypto_register_shashes(algs, num_algs);
 }
 
 static void __exit crct10dif_mod_fini(void)
 {
-	crypto_unregister_shash(&alg);
+	crypto_unregister_shashes(algs, num_algs);
 }
 
 subsys_initcall(crct10dif_mod_init);
 module_exit(crct10dif_mod_fini);
 
-- 
2.47.0


