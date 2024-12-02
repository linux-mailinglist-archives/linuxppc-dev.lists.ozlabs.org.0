Return-Path: <linuxppc-dev+bounces-3652-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 95B8E9DF86E
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Dec 2024 02:21:54 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y1mG74Yrmz2yVD;
	Mon,  2 Dec 2024 12:21:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733102494;
	cv=none; b=dY0yqGzPoGF/HLZKIkI9UwdQ2t50FjUdPj7LoNkeeye2AxiEEWWkus6NkN4P8OgQZrrhQMXCLfMF9Il1X68kj2sXHROXeJlUWF7in+AmyQKmlpsxRRZ0OXxy5GzuixiLz8+znVA76n2kFd7j1XC38n/3U8HeLfuPFXm8tfNzrf1XO6HAXjUPRe2jVpGwnHXTCTNxk2GJsZodhEAz6wfzPpSjFq9x2+FQEKN4Mrrc8zYNo5Tp9r8dcBdgPSlNR9s5T68xN4OzWmZDwdjHoN8c58+wBoAHqon8zwhvFoLS9IaMfjq35C5Z2/6HvmD/aM64dBBmVDnt6Oh/toyygANZhg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733102494; c=relaxed/relaxed;
	bh=710RFBmGsjX2YG7fhFrhLJpisCuudrgWgQ6Gyze+LAs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=avP5skMJ/ZQH2ToCnkMrXadeOV/85W9YT+LX3byQmIBX8nzm3m8LSGlqtIpUDOUARLWJBSLZ/F/yj1v7RAEsrSU3bUZ4se8xzvdqg9bqU3Es8eSVFiEztpGBNz/tg5yZiHPEi6/4B2gQ9qsKWNOMM60NUlvjNvOAdNRmcdg9L9uZED4OIMqKYoqo5nld1FXZTQ7OPTVlNH2OH83YlYUtyG5aRWvMnWj266X5mCqv2XBG+cuh43Hc3KndImcUrDbjEi2Zaf0G1+nF/CtB/TdG3bJAw14ZN8DxBDihwIMqJTUInG+vZlAa/Yu5bYkUr7cArE2thoBlTqtzy7jm3Ag00w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=uai+Cmj9; dkim-atps=neutral; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=uai+Cmj9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y1mG41BdCz2yVv
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  2 Dec 2024 12:21:32 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 7FD21A40C31;
	Mon,  2 Dec 2024 01:19:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81811C4CEE3;
	Mon,  2 Dec 2024 01:21:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733102489;
	bh=zOpYjUq7IQjKYIrBHyUZaVOUe0+fJqvMIlVQKF8tL0k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=uai+Cmj9j4A5P2GS5WcQnAxocOeWsVEwvyY8SeucQw2OkVH3+H0ju+3XodE3WUhjm
	 IetkN0BFtXZzJHJkKPm38BROhdzjnJvjZuVYNRz+oJi0J6p0EulS5ZZwtNZRZlW+JN
	 YG6DKvPLc8JaIy9odQYgKTxJRIvsa3yRbyJ7t4POK/1jomC1TrH48M6UkYTYfEqWJN
	 U+hIi40pO1eLq/Ux+3HDkDhigE4eo5RvPS8vFJrpsleYrm7Bm8UWy+FGd8ykUtigIT
	 86HnhwIVcWZv7LwSRMVPNH1anQmBJw0pn5v7QyrdTNCXZQdif9jP8TPcHqCy1NYZgS
	 lzwosfEA5MdKA==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: linux-arch@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-crypto@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	x86@kernel.org,
	Zhihang Shao <zhihang.shao.iscas@gmail.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	"Martin K. Petersen" <martin.petersen@oracle.com>
Subject: [PATCH v2 03/12] crypto: crct10dif - expose arch-optimized lib function
Date: Sun,  1 Dec 2024 17:20:47 -0800
Message-ID: <20241202012056.209768-4-ebiggers@kernel.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241202012056.209768-1-ebiggers@kernel.org>
References: <20241202012056.209768-1-ebiggers@kernel.org>
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

Reviewed-by: Ard Biesheuvel <ardb@kernel.org>
Reviewed-by: Martin K. Petersen <martin.petersen@oracle.com>
Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 crypto/Makefile            |  1 +
 crypto/crct10dif_generic.c | 82 +++++++++++++++++++++++++++++---------
 2 files changed, 65 insertions(+), 18 deletions(-)

diff --git a/crypto/Makefile b/crypto/Makefile
index 0537df1719d3..ffd94c7f2643 100644
--- a/crypto/Makefile
+++ b/crypto/Makefile
@@ -156,10 +156,11 @@ obj-$(CONFIG_CRYPTO_MICHAEL_MIC) += michael_mic.o
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
2.47.1


