Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C245757D00
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Jul 2023 15:13:50 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=QhcyEI48;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R4zt41gwFz3dT0
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Jul 2023 23:13:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=QhcyEI48;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=ardb@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R4zZx6P64z30NY
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Jul 2023 23:00:41 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 3A98C6157D;
	Tue, 18 Jul 2023 13:00:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F118C433CB;
	Tue, 18 Jul 2023 13:00:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689685239;
	bh=B1nBFJJhWHao7x/jd7i5fuI23+yDZ6JoStSpKA85T9w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QhcyEI485FT2QOQtXBfhXcNDTACc7aPZfUqUqG3O9OToL0ZEx0lz7onOEKWJPzF9a
	 29V0dmzfrrJ3bCKgXlMuwbIUdTvTm+1Zpoe+tGs6TZti2ETR6FJ1FgdzwzaSvekHmr
	 c8yV+dQ2XrHtLMqI7Vg2esHe763q3vsZ7ZM/UIhrdy4i+AbmkEaxlGPqCzCZMOZyix
	 ShrupEhmBq/x4aJ6cfMqPlbAT/aHBEWz10wyt3zwdM+RIAFOkK7WZLz3QX6ltlCYT4
	 7BfiQ4z+MIU14wMhRhIlW7ioLMEBdLH5L7qx293zEXFht84tDeGivetAZTv7LWIhuC
	 Qj9M8ywZ/Mz2w==
From: Ard Biesheuvel <ardb@kernel.org>
To: linux-crypto@vger.kernel.org
Subject: [RFC PATCH 15/21] crypto: lzo - drop obsolete 'comp' implementation
Date: Tue, 18 Jul 2023 14:58:41 +0200
Message-Id: <20230718125847.3869700-16-ardb@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230718125847.3869700-1-ardb@kernel.org>
References: <20230718125847.3869700-1-ardb@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3060; i=ardb@kernel.org; h=from:subject; bh=B1nBFJJhWHao7x/jd7i5fuI23+yDZ6JoStSpKA85T9w=; b=owGbwMvMwCFmkMcZplerG8N4Wi2JIWVbT/2Ni1NiPvWy+jZsEfB5cPNcUclCmTWb/9o7t6rL7 P3yrMm5o5SFQYyDQVZMkUVg9t93O09PlKp1niULM4eVCWQIAxenAExklT8jw7eu5YnnXnr2v3/k /iTKISblY5WU5XlVNdWz8+re3l2YNouRYdar/jru1XfPPjn586Ufp6+6Aeu1+6/7rfx5ZuZ8ePL YhRMA
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
 crypto/lzo.c | 60 +-------------------
 1 file changed, 1 insertion(+), 59 deletions(-)

diff --git a/crypto/lzo.c b/crypto/lzo.c
index ebda132dd22bf543..52558f9d41f3dcea 100644
--- a/crypto/lzo.c
+++ b/crypto/lzo.c
@@ -26,29 +26,11 @@ static void *lzo_alloc_ctx(struct crypto_scomp *tfm)
 	return ctx;
 }
 
-static int lzo_init(struct crypto_tfm *tfm)
-{
-	struct lzo_ctx *ctx = crypto_tfm_ctx(tfm);
-
-	ctx->lzo_comp_mem = lzo_alloc_ctx(NULL);
-	if (IS_ERR(ctx->lzo_comp_mem))
-		return -ENOMEM;
-
-	return 0;
-}
-
 static void lzo_free_ctx(struct crypto_scomp *tfm, void *ctx)
 {
 	kvfree(ctx);
 }
 
-static void lzo_exit(struct crypto_tfm *tfm)
-{
-	struct lzo_ctx *ctx = crypto_tfm_ctx(tfm);
-
-	lzo_free_ctx(NULL, ctx->lzo_comp_mem);
-}
-
 static int __lzo_compress(const u8 *src, unsigned int slen,
 			  u8 *dst, unsigned int *dlen, void *ctx)
 {
@@ -64,14 +46,6 @@ static int __lzo_compress(const u8 *src, unsigned int slen,
 	return 0;
 }
 
-static int lzo_compress(struct crypto_tfm *tfm, const u8 *src,
-			unsigned int slen, u8 *dst, unsigned int *dlen)
-{
-	struct lzo_ctx *ctx = crypto_tfm_ctx(tfm);
-
-	return __lzo_compress(src, slen, dst, dlen, ctx->lzo_comp_mem);
-}
-
 static int lzo_scompress(struct crypto_scomp *tfm, const u8 *src,
 			 unsigned int slen, u8 *dst, unsigned int *dlen,
 			 void *ctx)
@@ -94,12 +68,6 @@ static int __lzo_decompress(const u8 *src, unsigned int slen,
 	return 0;
 }
 
-static int lzo_decompress(struct crypto_tfm *tfm, const u8 *src,
-			  unsigned int slen, u8 *dst, unsigned int *dlen)
-{
-	return __lzo_decompress(src, slen, dst, dlen);
-}
-
 static int lzo_sdecompress(struct crypto_scomp *tfm, const u8 *src,
 			   unsigned int slen, u8 *dst, unsigned int *dlen,
 			   void *ctx)
@@ -107,19 +75,6 @@ static int lzo_sdecompress(struct crypto_scomp *tfm, const u8 *src,
 	return __lzo_decompress(src, slen, dst, dlen);
 }
 
-static struct crypto_alg alg = {
-	.cra_name		= "lzo",
-	.cra_driver_name	= "lzo-generic",
-	.cra_flags		= CRYPTO_ALG_TYPE_COMPRESS,
-	.cra_ctxsize		= sizeof(struct lzo_ctx),
-	.cra_module		= THIS_MODULE,
-	.cra_init		= lzo_init,
-	.cra_exit		= lzo_exit,
-	.cra_u			= { .compress = {
-	.coa_compress		= lzo_compress,
-	.coa_decompress		= lzo_decompress } }
-};
-
 static struct scomp_alg scomp = {
 	.alloc_ctx		= lzo_alloc_ctx,
 	.free_ctx		= lzo_free_ctx,
@@ -134,24 +89,11 @@ static struct scomp_alg scomp = {
 
 static int __init lzo_mod_init(void)
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
 
 static void __exit lzo_mod_fini(void)
 {
-	crypto_unregister_alg(&alg);
 	crypto_unregister_scomp(&scomp);
 }
 
-- 
2.39.2

