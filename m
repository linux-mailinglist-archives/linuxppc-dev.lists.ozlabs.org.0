Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A0FC2757CFC
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Jul 2023 15:13:00 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=nT+7oEuP;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R4zs63yfRz3dRH
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Jul 2023 23:12:58 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=nT+7oEuP;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=ardb@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R4zZs0szPz3bbt
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Jul 2023 23:00:37 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 738A16157E;
	Tue, 18 Jul 2023 13:00:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80DE9C433D9;
	Tue, 18 Jul 2023 13:00:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689685234;
	bh=LMbtrrL41VdEZgul85mdHBoLsIRux4jBa3a/x61Ycxo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nT+7oEuP4bPgj+UiAqrCeUG8s2JirqYarClLaYQ/v7t474QklYXyL0XeFjZeHBVdh
	 gv6D22UjPMjlm71YbZ/F30zxtNnROq9jkGmaU6AnNvB2MtBuIPcvxAraaZNd0iDh0B
	 IMs+GSjziPHc22fbdXvDp3XCm0G+Lnmz9NSwGiWDdh+mPtQmwyjVrzILqas8OPkNnT
	 gWzoDk9n4OHoV1ckft0Jl7jge4Y/jOjIALGlr5nfTnwDwLWGcpc0OM7unB6x/JmeDq
	 qMI9+93zX3UyQsoHYBpXuJ6Jahesute96sx0/ZWb5cr42+NaO3NjuNrMS4ULnd2uuh
	 T9dfxF8HRZITw==
From: Ard Biesheuvel <ardb@kernel.org>
To: linux-crypto@vger.kernel.org
Subject: [RFC PATCH 14/21] crypto: lzo-rle - drop obsolete 'comp' implementation
Date: Tue, 18 Jul 2023 14:58:40 +0200
Message-Id: <20230718125847.3869700-15-ardb@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230718125847.3869700-1-ardb@kernel.org>
References: <20230718125847.3869700-1-ardb@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3187; i=ardb@kernel.org; h=from:subject; bh=LMbtrrL41VdEZgul85mdHBoLsIRux4jBa3a/x61Ycxo=; b=owGbwMvMwCFmkMcZplerG8N4Wi2JIWVbT92iOmFL6eW+FVzXLW0ihXLXO0i9eJVdGxorWFrc+ eDR0dsdpSwMYhwMsmKKLAKz/77beXqiVK3zLFmYOaxMIEMYuDgFYCJnXzP8U5K5NrOp8HTz3nm9 vE+Wqa1J2lLH4G911il0qi/fkmslLYwMe1lrDvNXerk8WPLgpeMdRTOuz4Gm+2dp7xJ/J76NUaC FGQA=
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

The 'comp' API is obsolete and will be removed, so remove this comp
implementation.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 crypto/lzo-rle.c | 60 +-------------------
 1 file changed, 1 insertion(+), 59 deletions(-)

diff --git a/crypto/lzo-rle.c b/crypto/lzo-rle.c
index 0631d975bfac1129..658d6aa46fe21e19 100644
--- a/crypto/lzo-rle.c
+++ b/crypto/lzo-rle.c
@@ -26,29 +26,11 @@ static void *lzorle_alloc_ctx(struct crypto_scomp *tfm)
 	return ctx;
 }
 
-static int lzorle_init(struct crypto_tfm *tfm)
-{
-	struct lzorle_ctx *ctx = crypto_tfm_ctx(tfm);
-
-	ctx->lzorle_comp_mem = lzorle_alloc_ctx(NULL);
-	if (IS_ERR(ctx->lzorle_comp_mem))
-		return -ENOMEM;
-
-	return 0;
-}
-
 static void lzorle_free_ctx(struct crypto_scomp *tfm, void *ctx)
 {
 	kvfree(ctx);
 }
 
-static void lzorle_exit(struct crypto_tfm *tfm)
-{
-	struct lzorle_ctx *ctx = crypto_tfm_ctx(tfm);
-
-	lzorle_free_ctx(NULL, ctx->lzorle_comp_mem);
-}
-
 static int __lzorle_compress(const u8 *src, unsigned int slen,
 			  u8 *dst, unsigned int *dlen, void *ctx)
 {
@@ -64,14 +46,6 @@ static int __lzorle_compress(const u8 *src, unsigned int slen,
 	return 0;
 }
 
-static int lzorle_compress(struct crypto_tfm *tfm, const u8 *src,
-			unsigned int slen, u8 *dst, unsigned int *dlen)
-{
-	struct lzorle_ctx *ctx = crypto_tfm_ctx(tfm);
-
-	return __lzorle_compress(src, slen, dst, dlen, ctx->lzorle_comp_mem);
-}
-
 static int lzorle_scompress(struct crypto_scomp *tfm, const u8 *src,
 			 unsigned int slen, u8 *dst, unsigned int *dlen,
 			 void *ctx)
@@ -94,12 +68,6 @@ static int __lzorle_decompress(const u8 *src, unsigned int slen,
 	return 0;
 }
 
-static int lzorle_decompress(struct crypto_tfm *tfm, const u8 *src,
-			  unsigned int slen, u8 *dst, unsigned int *dlen)
-{
-	return __lzorle_decompress(src, slen, dst, dlen);
-}
-
 static int lzorle_sdecompress(struct crypto_scomp *tfm, const u8 *src,
 			   unsigned int slen, u8 *dst, unsigned int *dlen,
 			   void *ctx)
@@ -107,19 +75,6 @@ static int lzorle_sdecompress(struct crypto_scomp *tfm, const u8 *src,
 	return __lzorle_decompress(src, slen, dst, dlen);
 }
 
-static struct crypto_alg alg = {
-	.cra_name		= "lzo-rle",
-	.cra_driver_name	= "lzo-rle-generic",
-	.cra_flags		= CRYPTO_ALG_TYPE_COMPRESS,
-	.cra_ctxsize		= sizeof(struct lzorle_ctx),
-	.cra_module		= THIS_MODULE,
-	.cra_init		= lzorle_init,
-	.cra_exit		= lzorle_exit,
-	.cra_u			= { .compress = {
-	.coa_compress		= lzorle_compress,
-	.coa_decompress		= lzorle_decompress } }
-};
-
 static struct scomp_alg scomp = {
 	.alloc_ctx		= lzorle_alloc_ctx,
 	.free_ctx		= lzorle_free_ctx,
@@ -134,24 +89,11 @@ static struct scomp_alg scomp = {
 
 static int __init lzorle_mod_init(void)
 {
-	int ret;
-
-	ret = crypto_register_alg(&alg);
-	if (ret)
-		return ret;
-
-	ret = crypto_register_scomp(&scomp);
-	if (ret) {
-		crypto_unregister_alg(&alg);
-		return ret;
-	}
-
-	return ret;
+	return crypto_register_scomp(&scomp);
 }
 
 static void __exit lzorle_mod_fini(void)
 {
-	crypto_unregister_alg(&alg);
 	crypto_unregister_scomp(&scomp);
 }
 
-- 
2.39.2

