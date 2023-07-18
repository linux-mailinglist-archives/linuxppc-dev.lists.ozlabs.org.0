Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 04463757C89
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Jul 2023 15:01:57 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=AfZLZ7JT;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R4zcL6Q0Hz3cbw
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Jul 2023 23:01:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=AfZLZ7JT;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=ardb@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R4zYg0fTfz30hF
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Jul 2023 22:59:35 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 6095D61576;
	Tue, 18 Jul 2023 12:59:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F36D2C433C8;
	Tue, 18 Jul 2023 12:59:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689685172;
	bh=uQIEsSEi5AfZzsVkJmjn+QxN0t6yI2U4oKGRn0z/nPs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=AfZLZ7JTif4C3qePP7JKQHnnyh1u2hcqFZxGpPnYlOl2D4TtBUYrcF4X3CmBdU/wd
	 MzdRX+BXp5+FZx0eCw9Ha+LGdh/RHkQneozHQYOQuhgOdZTIVYj23CcnUF4kdHkeTP
	 7R28o0x8d7J43T83I/zGLHLggNxLs76wxONDkoUyl7+CexeTkV6wRVNluwXA1TjSXw
	 zmmrxjtQ0fqYNl7R54NFrH3rZvwlbGfvlEgPAeBefe6lCsYfV3s6KZXu+lcAF8jPbE
	 O4dBL8/SqK4Ni7fyrknc8hVH3eN7uQPh8Zt9jeKs7kgcEjFil+xRFwr4ibfViKwHrL
	 xBBq+VXe1D3VA==
From: Ard Biesheuvel <ardb@kernel.org>
To: linux-crypto@vger.kernel.org
Subject: [RFC PATCH 01/21] crypto: scomp - Revert "add support for deflate rfc1950 (zlib)"
Date: Tue, 18 Jul 2023 14:58:27 +0200
Message-Id: <20230718125847.3869700-2-ardb@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230718125847.3869700-1-ardb@kernel.org>
References: <20230718125847.3869700-1-ardb@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=9149; i=ardb@kernel.org; h=from:subject; bh=uQIEsSEi5AfZzsVkJmjn+QxN0t6yI2U4oKGRn0z/nPs=; b=owGbwMvMwCFmkMcZplerG8N4Wi2JIWVbT651eemDyIfbzsXYnz1Qw9vtZ5QSznB6X82sGpHXj z9PSeXvKGVhEONgkBVTZBGY/ffdztMTpWqdZ8nCzGFlAhnCwMUpABM5EcvIMG3+sxemk5o28ypZ tt+WTNPRVFp92uSjz+aph2/MWPhV9gfDH55nL6Y7hK7cErhrx8WSfxVt78N49XhVzDh0NP0Zebb /ZAMA
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
Content-Transfer-Encoding: 8bit
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: Giovanni Cabiddu <giovanni.cabiddu@intel.com>, Eric Dumazet <edumazet@google.com>, linux-mtd@lists.infradead.org, Ard Biesheuvel <ardb@kernel.org>, Steffen Klassert <steffen.klassert@secunet.com>, Herbert Xu <herbert@gondor.apana.org.au>, Minchan Kim <minchan@kernel.org>, Richard Weinberger <richard@nod.at>, qat-linux@intel.com, Eric Biggers <ebiggers@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Kees Cook <keescook@chromium.org>, linux-block@vger.kernel.org, Nick Terrell <terrelln@fb.com>, Jens Axboe <axboe@kernel.dk>, netdev@vger.kernel.org, David Ahern <dsahern@kernel.org>, linux-kernel@vger.kernel.org, Sergey Senozhatsky <senozhatsky@chromium.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This reverts commit a368f43d6e3a001e684e9191a27df384fbff12f5.

"zlib-deflate" was introduced 6 years ago, but it does not have any
users. So let's remove the generic implementation and the test vectors,
but retain the "zlib-deflate" entry in the testmgr code to avoid
introducing warning messages on systems that implement zlib-deflate in
hardware.

Note that RFC 1950 which forms the basis of this algorithm dates back to
1996, and predates RFC 1951, on which the existing IPcomp is based and
which we have supported in the kernel since 2003. So it seems rather
unlikely that we will ever grow the need to support zlib-deflate.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 crypto/deflate.c | 61 +++++-----------
 crypto/testmgr.c |  8 +--
 crypto/testmgr.h | 75 --------------------
 3 files changed, 18 insertions(+), 126 deletions(-)

diff --git a/crypto/deflate.c b/crypto/deflate.c
index b2a46f6dc961e71d..f4f127078fe2a5aa 100644
--- a/crypto/deflate.c
+++ b/crypto/deflate.c
@@ -39,24 +39,20 @@ struct deflate_ctx {
 	struct z_stream_s decomp_stream;
 };
 
-static int deflate_comp_init(struct deflate_ctx *ctx, int format)
+static int deflate_comp_init(struct deflate_ctx *ctx)
 {
 	int ret = 0;
 	struct z_stream_s *stream = &ctx->comp_stream;
 
 	stream->workspace = vzalloc(zlib_deflate_workspacesize(
-				    MAX_WBITS, MAX_MEM_LEVEL));
+				-DEFLATE_DEF_WINBITS, DEFLATE_DEF_MEMLEVEL));
 	if (!stream->workspace) {
 		ret = -ENOMEM;
 		goto out;
 	}
-	if (format)
-		ret = zlib_deflateInit(stream, 3);
-	else
-		ret = zlib_deflateInit2(stream, DEFLATE_DEF_LEVEL, Z_DEFLATED,
-					-DEFLATE_DEF_WINBITS,
-					DEFLATE_DEF_MEMLEVEL,
-					Z_DEFAULT_STRATEGY);
+	ret = zlib_deflateInit2(stream, DEFLATE_DEF_LEVEL, Z_DEFLATED,
+	                        -DEFLATE_DEF_WINBITS, DEFLATE_DEF_MEMLEVEL,
+	                        Z_DEFAULT_STRATEGY);
 	if (ret != Z_OK) {
 		ret = -EINVAL;
 		goto out_free;
@@ -68,7 +64,7 @@ static int deflate_comp_init(struct deflate_ctx *ctx, int format)
 	goto out;
 }
 
-static int deflate_decomp_init(struct deflate_ctx *ctx, int format)
+static int deflate_decomp_init(struct deflate_ctx *ctx)
 {
 	int ret = 0;
 	struct z_stream_s *stream = &ctx->decomp_stream;
@@ -78,10 +74,7 @@ static int deflate_decomp_init(struct deflate_ctx *ctx, int format)
 		ret = -ENOMEM;
 		goto out;
 	}
-	if (format)
-		ret = zlib_inflateInit(stream);
-	else
-		ret = zlib_inflateInit2(stream, -DEFLATE_DEF_WINBITS);
+	ret = zlib_inflateInit2(stream, -DEFLATE_DEF_WINBITS);
 	if (ret != Z_OK) {
 		ret = -EINVAL;
 		goto out_free;
@@ -105,21 +98,21 @@ static void deflate_decomp_exit(struct deflate_ctx *ctx)
 	vfree(ctx->decomp_stream.workspace);
 }
 
-static int __deflate_init(void *ctx, int format)
+static int __deflate_init(void *ctx)
 {
 	int ret;
 
-	ret = deflate_comp_init(ctx, format);
+	ret = deflate_comp_init(ctx);
 	if (ret)
 		goto out;
-	ret = deflate_decomp_init(ctx, format);
+	ret = deflate_decomp_init(ctx);
 	if (ret)
 		deflate_comp_exit(ctx);
 out:
 	return ret;
 }
 
-static void *gen_deflate_alloc_ctx(struct crypto_scomp *tfm, int format)
+static void *deflate_alloc_ctx(struct crypto_scomp *tfm)
 {
 	struct deflate_ctx *ctx;
 	int ret;
@@ -128,7 +121,7 @@ static void *gen_deflate_alloc_ctx(struct crypto_scomp *tfm, int format)
 	if (!ctx)
 		return ERR_PTR(-ENOMEM);
 
-	ret = __deflate_init(ctx, format);
+	ret = __deflate_init(ctx);
 	if (ret) {
 		kfree(ctx);
 		return ERR_PTR(ret);
@@ -137,21 +130,11 @@ static void *gen_deflate_alloc_ctx(struct crypto_scomp *tfm, int format)
 	return ctx;
 }
 
-static void *deflate_alloc_ctx(struct crypto_scomp *tfm)
-{
-	return gen_deflate_alloc_ctx(tfm, 0);
-}
-
-static void *zlib_deflate_alloc_ctx(struct crypto_scomp *tfm)
-{
-	return gen_deflate_alloc_ctx(tfm, 1);
-}
-
 static int deflate_init(struct crypto_tfm *tfm)
 {
 	struct deflate_ctx *ctx = crypto_tfm_ctx(tfm);
 
-	return __deflate_init(ctx, 0);
+	return __deflate_init(ctx);
 }
 
 static void __deflate_exit(void *ctx)
@@ -286,7 +269,7 @@ static struct crypto_alg alg = {
 	.coa_decompress  	= deflate_decompress } }
 };
 
-static struct scomp_alg scomp[] = { {
+static struct scomp_alg scomp = {
 	.alloc_ctx		= deflate_alloc_ctx,
 	.free_ctx		= deflate_free_ctx,
 	.compress		= deflate_scompress,
@@ -296,17 +279,7 @@ static struct scomp_alg scomp[] = { {
 		.cra_driver_name = "deflate-scomp",
 		.cra_module	 = THIS_MODULE,
 	}
-}, {
-	.alloc_ctx		= zlib_deflate_alloc_ctx,
-	.free_ctx		= deflate_free_ctx,
-	.compress		= deflate_scompress,
-	.decompress		= deflate_sdecompress,
-	.base			= {
-		.cra_name	= "zlib-deflate",
-		.cra_driver_name = "zlib-deflate-scomp",
-		.cra_module	 = THIS_MODULE,
-	}
-} };
+};
 
 static int __init deflate_mod_init(void)
 {
@@ -316,7 +289,7 @@ static int __init deflate_mod_init(void)
 	if (ret)
 		return ret;
 
-	ret = crypto_register_scomps(scomp, ARRAY_SIZE(scomp));
+	ret = crypto_register_scomp(&scomp);
 	if (ret) {
 		crypto_unregister_alg(&alg);
 		return ret;
@@ -328,7 +301,7 @@ static int __init deflate_mod_init(void)
 static void __exit deflate_mod_fini(void)
 {
 	crypto_unregister_alg(&alg);
-	crypto_unregister_scomps(scomp, ARRAY_SIZE(scomp));
+	crypto_unregister_scomp(&scomp);
 }
 
 subsys_initcall(deflate_mod_init);
diff --git a/crypto/testmgr.c b/crypto/testmgr.c
index 216878c8bc3d62f8..b41a8e8c1d1a1987 100644
--- a/crypto/testmgr.c
+++ b/crypto/testmgr.c
@@ -5774,14 +5774,8 @@ static const struct alg_test_desc alg_test_descs[] = {
 		}
 	}, {
 		.alg = "zlib-deflate",
-		.test = alg_test_comp,
+		.test = alg_test_null,
 		.fips_allowed = 1,
-		.suite = {
-			.comp = {
-				.comp = __VECS(zlib_deflate_comp_tv_template),
-				.decomp = __VECS(zlib_deflate_decomp_tv_template)
-			}
-		}
 	}, {
 		.alg = "zstd",
 		.test = alg_test_comp,
diff --git a/crypto/testmgr.h b/crypto/testmgr.h
index 5ca7a412508fbfb2..0cd6e0600255aad9 100644
--- a/crypto/testmgr.h
+++ b/crypto/testmgr.h
@@ -35754,81 +35754,6 @@ static const struct comp_testvec deflate_decomp_tv_template[] = {
 	},
 };
 
-static const struct comp_testvec zlib_deflate_comp_tv_template[] = {
-	{
-		.inlen	= 70,
-		.outlen	= 44,
-		.input	= "Join us now and share the software "
-			"Join us now and share the software ",
-		.output	= "\x78\x5e\xf3\xca\xcf\xcc\x53\x28"
-			  "\x2d\x56\xc8\xcb\x2f\x57\x48\xcc"
-			  "\x4b\x51\x28\xce\x48\x2c\x4a\x55"
-			  "\x28\xc9\x48\x55\x28\xce\x4f\x2b"
-			  "\x29\x07\x71\xbc\x08\x2b\x01\x00"
-			  "\x7c\x65\x19\x3d",
-	}, {
-		.inlen	= 191,
-		.outlen	= 129,
-		.input	= "This document describes a compression method based on the DEFLATE"
-			"compression algorithm.  This document defines the application of "
-			"the DEFLATE algorithm to the IP Payload Compression Protocol.",
-		.output	= "\x78\x5e\x5d\xce\x41\x0a\xc3\x30"
-			  "\x0c\x04\xc0\xaf\xec\x0b\xf2\x87"
-			  "\xd2\xa6\x50\xe8\xc1\x07\x7f\x40"
-			  "\xb1\x95\x5a\x60\x5b\xc6\x56\x0f"
-			  "\xfd\x7d\x93\x1e\x42\xe8\x51\xec"
-			  "\xee\x20\x9f\x64\x20\x6a\x78\x17"
-			  "\xae\x86\xc8\x23\x74\x59\x78\x80"
-			  "\x10\xb4\xb4\xce\x63\x88\x56\x14"
-			  "\xb6\xa4\x11\x0b\x0d\x8e\xd8\x6e"
-			  "\x4b\x8c\xdb\x7c\x7f\x5e\xfc\x7c"
-			  "\xae\x51\x7e\x69\x17\x4b\x65\x02"
-			  "\xfc\x1f\xbc\x4a\xdd\xd8\x7d\x48"
-			  "\xad\x65\x09\x64\x3b\xac\xeb\xd9"
-			  "\xc2\x01\xc0\xf4\x17\x3c\x1c\x1c"
-			  "\x7d\xb2\x52\xc4\xf5\xf4\x8f\xeb"
-			  "\x6a\x1a\x34\x4f\x5f\x2e\x32\x45"
-			  "\x4e",
-	},
-};
-
-static const struct comp_testvec zlib_deflate_decomp_tv_template[] = {
-	{
-		.inlen	= 128,
-		.outlen	= 191,
-		.input	= "\x78\x9c\x5d\x8d\x31\x0e\xc2\x30"
-			  "\x10\x04\xbf\xb2\x2f\xc8\x1f\x10"
-			  "\x04\x09\x89\xc2\x85\x3f\x70\xb1"
-			  "\x2f\xf8\x24\xdb\x67\xd9\x47\xc1"
-			  "\xef\x49\x68\x12\x51\xae\x76\x67"
-			  "\xd6\x27\x19\x88\x1a\xde\x85\xab"
-			  "\x21\xf2\x08\x5d\x16\x1e\x20\x04"
-			  "\x2d\xad\xf3\x18\xa2\x15\x85\x2d"
-			  "\x69\xc4\x42\x83\x23\xb6\x6c\x89"
-			  "\x71\x9b\xef\xcf\x8b\x9f\xcf\x33"
-			  "\xca\x2f\xed\x62\xa9\x4c\x80\xff"
-			  "\x13\xaf\x52\x37\xed\x0e\x52\x6b"
-			  "\x59\x02\xd9\x4e\xe8\x7a\x76\x1d"
-			  "\x02\x98\xfe\x8a\x87\x83\xa3\x4f"
-			  "\x56\x8a\xb8\x9e\x8e\x5c\x57\xd3"
-			  "\xa0\x79\xfa\x02\x2e\x32\x45\x4e",
-		.output	= "This document describes a compression method based on the DEFLATE"
-			"compression algorithm.  This document defines the application of "
-			"the DEFLATE algorithm to the IP Payload Compression Protocol.",
-	}, {
-		.inlen	= 44,
-		.outlen	= 70,
-		.input	= "\x78\x9c\xf3\xca\xcf\xcc\x53\x28"
-			  "\x2d\x56\xc8\xcb\x2f\x57\x48\xcc"
-			  "\x4b\x51\x28\xce\x48\x2c\x4a\x55"
-			  "\x28\xc9\x48\x55\x28\xce\x4f\x2b"
-			  "\x29\x07\x71\xbc\x08\x2b\x01\x00"
-			  "\x7c\x65\x19\x3d",
-		.output	= "Join us now and share the software "
-			"Join us now and share the software ",
-	},
-};
-
 /*
  * LZO test vectors (null-terminated strings).
  */
-- 
2.39.2

