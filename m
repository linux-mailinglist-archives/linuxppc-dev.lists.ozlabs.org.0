Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B9B7757D1D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Jul 2023 15:18:14 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=UP0n7PK2;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R4zz81tS4z3ck1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Jul 2023 23:18:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=UP0n7PK2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=ardb@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R4zbQ0s7sz30XV
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Jul 2023 23:01:06 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 5E2DC61579;
	Tue, 18 Jul 2023 13:01:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E196C43391;
	Tue, 18 Jul 2023 13:00:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689685263;
	bh=m4l5ZQoIj7Re6eMR5Sl4bR7fm+Y5+NwLizkQOqwnLNc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=UP0n7PK2DqJ2rYR+dFT1OVwzl3iGJxjJYr4DjdUXR5gKEww7gzV9N5NwfnmR3aMgu
	 XjP51hne1Bd/cdZdQUBz1c5VKBVO9eqX12yQ7jERyAktlvIwmjtvvrvbdUSrl9TEPC
	 UjLzPm4CX1XgyrbBoTNo+zsiKA06yhnhqCtVHyb8sNDNCF0aa53Zvr4Iihawiy/Mjq
	 aZvj606amYLZxAdxA2K6HQ4CPkn1O4QalesB4YqqynUqW+pY23s4fU6/047rFptspf
	 5YtY4Hho6JKXUnovcc/DX/wiij7dtuPho2diJdjL8S0NnPASs3bOM/UZ8BXNPsV95Y
	 EniiH9ZFBtqUA==
From: Ard Biesheuvel <ardb@kernel.org>
To: linux-crypto@vger.kernel.org
Subject: [RFC PATCH 20/21] crypto: deflate - implement acomp API directly
Date: Tue, 18 Jul 2023 14:58:46 +0200
Message-Id: <20230718125847.3869700-21-ardb@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230718125847.3869700-1-ardb@kernel.org>
References: <20230718125847.3869700-1-ardb@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=10915; i=ardb@kernel.org; h=from:subject; bh=m4l5ZQoIj7Re6eMR5Sl4bR7fm+Y5+NwLizkQOqwnLNc=; b=owGbwMvMwCFmkMcZplerG8N4Wi2JIWVbT+uu5R87mxPEwx8u5nZnSl7jtsnm1/lPazr8G+afm aTn/vFKRykLgxgHg6yYIovA7L/vdp6eKFXrPEsWZg4rE8gQBi5OAZjIrysMv1m9zq/T/r3hn01F Fgvv9CVvU5TPMzqurNt09032qeiMX3IM/5OirwUddDodvGTmlf56X19Rp6yFEaI5UyQ4zYPDBM4 2swMA
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

Drop the scomp implementation of deflate, which can only operate on
contiguous in- and output buffer, and replace it with an implementation
of acomp directly. This implementation walks the scatterlists, removing
the need for the caller to use scratch buffers to present the input and
output in a contiguous manner.

This is intended for use by the IPcomp code, which currently needs to
'linearize' SKBs in order for the compression to be able to consume the
input in a single chunk.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 crypto/deflate.c             | 315 +++++++-------------
 include/crypto/scatterwalk.h |   2 +-
 2 files changed, 113 insertions(+), 204 deletions(-)

diff --git a/crypto/deflate.c b/crypto/deflate.c
index 0955040ca9e64146..112683473df2b588 100644
--- a/crypto/deflate.c
+++ b/crypto/deflate.c
@@ -6,246 +6,154 @@
  * by IPCOMP (RFC 3173 & RFC 2394).
  *
  * Copyright (c) 2003 James Morris <jmorris@intercode.com.au>
- *
- * FIXME: deflate transforms will require up to a total of about 436k of kernel
- * memory on i386 (390k for compression, the rest for decompression), as the
- * current zlib kernel code uses a worst case pre-allocation system by default.
- * This needs to be fixed so that the amount of memory required is properly
- * related to the  winbits and memlevel parameters.
- *
- * The default winbits of 11 should suit most packets, and it may be something
- * to configure on a per-tfm basis in the future.
- *
- * Currently, compression history is not maintained between tfm calls, as
- * it is not needed for IPCOMP and keeps the code simpler.  It can be
- * implemented if someone wants it.
+ * Copyright (c) 2023 Google, LLC. <ardb@kernel.org>
  */
 #include <linux/init.h>
 #include <linux/module.h>
 #include <linux/crypto.h>
 #include <linux/zlib.h>
-#include <linux/vmalloc.h>
-#include <linux/interrupt.h>
-#include <linux/mm.h>
 #include <linux/net.h>
-#include <crypto/internal/scompress.h>
+#include <linux/scatterlist.h>
+#include <crypto/scatterwalk.h>
+#include <crypto/internal/acompress.h>
 
 #define DEFLATE_DEF_LEVEL		Z_DEFAULT_COMPRESSION
 #define DEFLATE_DEF_WINBITS		11
 #define DEFLATE_DEF_MEMLEVEL		MAX_MEM_LEVEL
 
-struct deflate_ctx {
-	struct z_stream_s comp_stream;
-	struct z_stream_s decomp_stream;
+struct deflate_req_ctx {
+	struct z_stream_s stream;
+	u8 workspace[];
 };
 
-static int deflate_comp_init(struct deflate_ctx *ctx)
+static int deflate_process(struct acomp_req *req, struct z_stream_s *stream,
+			   int (*process)(struct z_stream_s *, int))
 {
-	int ret = 0;
-	struct z_stream_s *stream = &ctx->comp_stream;
+	unsigned int slen = req->slen;
+	unsigned int dlen = req->dlen;
+	struct scatter_walk src, dst;
+	unsigned int scur, dcur;
+	int ret;
 
-	stream->workspace = vzalloc(zlib_deflate_workspacesize(
-				-DEFLATE_DEF_WINBITS, DEFLATE_DEF_MEMLEVEL));
-	if (!stream->workspace) {
-		ret = -ENOMEM;
-		goto out;
-	}
+	stream->avail_in = stream->avail_out = 0;
+
+	scatterwalk_start(&src, req->src);
+	scatterwalk_start(&dst, req->dst);
+
+	scur = dcur = 0;
+
+	do {
+		if (stream->avail_in == 0) {
+			if (scur) {
+				slen -= scur;
+
+				scatterwalk_unmap(stream->next_in - scur);
+				scatterwalk_advance(&src, scur);
+				scatterwalk_done(&src, 0, slen);
+			}
+
+			scur = scatterwalk_clamp(&src, slen);
+			if (scur) {
+				stream->next_in = scatterwalk_map(&src);
+				stream->avail_in = scur;
+			}
+		}
+
+		if (stream->avail_out == 0) {
+			if (dcur) {
+				dlen -= dcur;
+
+				scatterwalk_unmap(stream->next_out - dcur);
+				scatterwalk_advance(&dst, dcur);
+				scatterwalk_done(&dst, 1, dlen);
+			}
+
+			dcur = scatterwalk_clamp(&dst, dlen);
+			if (!dcur)
+				break;
+
+			stream->next_out = scatterwalk_map(&dst);
+			stream->avail_out = dcur;
+		}
+
+		ret = process(stream, (slen == scur) ? Z_FINISH : Z_SYNC_FLUSH);
+	} while (ret == Z_OK);
+
+	if (scur)
+		scatterwalk_unmap(stream->next_in - scur);
+	if (dcur)
+		scatterwalk_unmap(stream->next_out - dcur);
+
+	if (ret != Z_STREAM_END)
+		return -EINVAL;
+
+	req->dlen = stream->total_out;
+	return 0;
+}
+
+static int deflate_compress(struct acomp_req *req)
+{
+	struct deflate_req_ctx *ctx = acomp_request_ctx(req);
+	struct z_stream_s *stream = &ctx->stream;
+	int ret;
+
+        if (!req->src || !req->slen || !req->dst || !req->dlen)
+                return -EINVAL;
+
+	stream->workspace = ctx->workspace;
 	ret = zlib_deflateInit2(stream, DEFLATE_DEF_LEVEL, Z_DEFLATED,
 	                        -DEFLATE_DEF_WINBITS, DEFLATE_DEF_MEMLEVEL,
 	                        Z_DEFAULT_STRATEGY);
-	if (ret != Z_OK) {
-		ret = -EINVAL;
-		goto out_free;
-	}
-out:
+	if (ret != Z_OK)
+		return -EINVAL;
+
+	ret = deflate_process(req, stream, zlib_deflate);
+	zlib_deflateEnd(stream);
 	return ret;
-out_free:
-	vfree(stream->workspace);
-	goto out;
 }
 
-static int deflate_decomp_init(struct deflate_ctx *ctx)
+static int deflate_decompress(struct acomp_req *req)
 {
-	int ret = 0;
-	struct z_stream_s *stream = &ctx->decomp_stream;
+	struct deflate_req_ctx *ctx = acomp_request_ctx(req);
+	struct z_stream_s *stream = &ctx->stream;
+	int ret;
 
-	stream->workspace = vzalloc(zlib_inflate_workspacesize());
-	if (!stream->workspace) {
-		ret = -ENOMEM;
-		goto out;
-	}
+        if (!req->src || !req->slen || !req->dst || !req->dlen)
+                return -EINVAL;
+
+	stream->workspace = ctx->workspace;
 	ret = zlib_inflateInit2(stream, -DEFLATE_DEF_WINBITS);
-	if (ret != Z_OK) {
-		ret = -EINVAL;
-		goto out_free;
-	}
-out:
-	return ret;
-out_free:
-	vfree(stream->workspace);
-	goto out;
-}
+	if (ret != Z_OK)
+		return -EINVAL;
 
-static void deflate_comp_exit(struct deflate_ctx *ctx)
-{
-	zlib_deflateEnd(&ctx->comp_stream);
-	vfree(ctx->comp_stream.workspace);
-}
-
-static void deflate_decomp_exit(struct deflate_ctx *ctx)
-{
-	zlib_inflateEnd(&ctx->decomp_stream);
-	vfree(ctx->decomp_stream.workspace);
-}
-
-static int __deflate_init(void *ctx)
-{
-	int ret;
-
-	ret = deflate_comp_init(ctx);
-	if (ret)
-		goto out;
-	ret = deflate_decomp_init(ctx);
-	if (ret)
-		deflate_comp_exit(ctx);
-out:
+	ret = deflate_process(req, stream, zlib_inflate);
+	req->dlen = stream->total_out;
+	zlib_inflateEnd(stream);
 	return ret;
 }
 
-static void *deflate_alloc_ctx(struct crypto_scomp *tfm)
-{
-	struct deflate_ctx *ctx;
-	int ret;
+static struct acomp_alg alg = {
+	.compress		= deflate_compress,
+	.decompress		= deflate_decompress,
 
-	ctx = kzalloc(sizeof(*ctx), GFP_KERNEL);
-	if (!ctx)
-		return ERR_PTR(-ENOMEM);
-
-	ret = __deflate_init(ctx);
-	if (ret) {
-		kfree(ctx);
-		return ERR_PTR(ret);
-	}
-
-	return ctx;
-}
-
-static void __deflate_exit(void *ctx)
-{
-	deflate_comp_exit(ctx);
-	deflate_decomp_exit(ctx);
-}
-
-static void deflate_free_ctx(struct crypto_scomp *tfm, void *ctx)
-{
-	__deflate_exit(ctx);
-	kfree_sensitive(ctx);
-}
-
-static int __deflate_compress(const u8 *src, unsigned int slen,
-			      u8 *dst, unsigned int *dlen, void *ctx)
-{
-	int ret = 0;
-	struct deflate_ctx *dctx = ctx;
-	struct z_stream_s *stream = &dctx->comp_stream;
-
-	ret = zlib_deflateReset(stream);
-	if (ret != Z_OK) {
-		ret = -EINVAL;
-		goto out;
-	}
-
-	stream->next_in = (u8 *)src;
-	stream->avail_in = slen;
-	stream->next_out = (u8 *)dst;
-	stream->avail_out = *dlen;
-
-	ret = zlib_deflate(stream, Z_FINISH);
-	if (ret != Z_STREAM_END) {
-		ret = -EINVAL;
-		goto out;
-	}
-	ret = 0;
-	*dlen = stream->total_out;
-out:
-	return ret;
-}
-
-static int deflate_scompress(struct crypto_scomp *tfm, const u8 *src,
-			     unsigned int slen, u8 *dst, unsigned int *dlen,
-			     void *ctx)
-{
-	return __deflate_compress(src, slen, dst, dlen, ctx);
-}
-
-static int __deflate_decompress(const u8 *src, unsigned int slen,
-				u8 *dst, unsigned int *dlen, void *ctx)
-{
-
-	int ret = 0;
-	struct deflate_ctx *dctx = ctx;
-	struct z_stream_s *stream = &dctx->decomp_stream;
-
-	ret = zlib_inflateReset(stream);
-	if (ret != Z_OK) {
-		ret = -EINVAL;
-		goto out;
-	}
-
-	stream->next_in = (u8 *)src;
-	stream->avail_in = slen;
-	stream->next_out = (u8 *)dst;
-	stream->avail_out = *dlen;
-
-	ret = zlib_inflate(stream, Z_SYNC_FLUSH);
-	/*
-	 * Work around a bug in zlib, which sometimes wants to taste an extra
-	 * byte when being used in the (undocumented) raw deflate mode.
-	 * (From USAGI).
-	 */
-	if (ret == Z_OK && !stream->avail_in && stream->avail_out) {
-		u8 zerostuff = 0;
-		stream->next_in = &zerostuff;
-		stream->avail_in = 1;
-		ret = zlib_inflate(stream, Z_FINISH);
-	}
-	if (ret != Z_STREAM_END) {
-		ret = -EINVAL;
-		goto out;
-	}
-	ret = 0;
-	*dlen = stream->total_out;
-out:
-	return ret;
-}
-
-static int deflate_sdecompress(struct crypto_scomp *tfm, const u8 *src,
-			       unsigned int slen, u8 *dst, unsigned int *dlen,
-			       void *ctx)
-{
-	return __deflate_decompress(src, slen, dst, dlen, ctx);
-}
-
-static struct scomp_alg scomp = {
-	.alloc_ctx		= deflate_alloc_ctx,
-	.free_ctx		= deflate_free_ctx,
-	.compress		= deflate_scompress,
-	.decompress		= deflate_sdecompress,
-	.base			= {
-		.cra_name	= "deflate",
-		.cra_driver_name = "deflate-scomp",
-		.cra_module	 = THIS_MODULE,
-	}
+	.base.cra_name		= "deflate",
+	.base.cra_driver_name	= "deflate-generic",
+	.base.cra_module	= THIS_MODULE,
 };
 
 static int __init deflate_mod_init(void)
 {
-	return crypto_register_scomp(&scomp);
+	size_t size = max(zlib_inflate_workspacesize(),
+			  zlib_deflate_workspacesize(-DEFLATE_DEF_WINBITS,
+						     DEFLATE_DEF_MEMLEVEL));
+
+	alg.reqsize = struct_size_t(struct deflate_req_ctx, workspace, size);
+	return crypto_register_acomp(&alg);
 }
 
 static void __exit deflate_mod_fini(void)
 {
-	crypto_unregister_scomp(&scomp);
+	crypto_unregister_acomp(&alg);
 }
 
 subsys_initcall(deflate_mod_init);
@@ -254,4 +162,5 @@ module_exit(deflate_mod_fini);
 MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION("Deflate Compression Algorithm for IPCOMP");
 MODULE_AUTHOR("James Morris <jmorris@intercode.com.au>");
+MODULE_AUTHOR("Ard Biesheuvel <ardb@kernel.org>");
 MODULE_ALIAS_CRYPTO("deflate");
diff --git a/include/crypto/scatterwalk.h b/include/crypto/scatterwalk.h
index 32fc4473175b1d81..46dc7b21bf9ecbd0 100644
--- a/include/crypto/scatterwalk.h
+++ b/include/crypto/scatterwalk.h
@@ -51,7 +51,7 @@ static inline struct page *scatterwalk_page(struct scatter_walk *walk)
 	return sg_page(walk->sg) + (walk->offset >> PAGE_SHIFT);
 }
 
-static inline void scatterwalk_unmap(void *vaddr)
+static inline void scatterwalk_unmap(const void *vaddr)
 {
 	kunmap_local(vaddr);
 }
-- 
2.39.2

