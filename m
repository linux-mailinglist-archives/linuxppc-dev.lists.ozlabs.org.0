Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BD7D8757CF4
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Jul 2023 15:11:21 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=e2jq/7vF;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R4zqC4jMqz3f6B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Jul 2023 23:11:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=e2jq/7vF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=ardb@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R4zZg41Xgz3c1h
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Jul 2023 23:00:27 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id DCB0261591;
	Tue, 18 Jul 2023 13:00:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB974C433C8;
	Tue, 18 Jul 2023 13:00:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689685225;
	bh=re+UehvkeQHBK1wHhGnLcp2yWUgDT1GsozNrkQ2XFcw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=e2jq/7vFH+5SdEhwac2XpIYEi4F+E5PgxK5t3cUMlQUQCqTe1YvjyexPjPu11dL2c
	 yA+xClzV0scHRHYaigqmMwGwO524EVduViwfjGbx5JZ/Md/8EykRqPS2KCqv+fjAg+
	 OVZipEnxTXLcwE41PRm9YCd5p3Sy4LxJSOmeX0DCqvN/sCP1Y3ysHaCTT4H9xGNyTG
	 PR81t1YkbjBc+0e4kc7x34mAlunxZCrAiJwbGXsiBYgfuNisFYP6+PTLhgYB2otZbr
	 MPfNvkjFsrvou9y5c77Q3VziexDLzAOAt6FRUzMHZ8XXO2LdWHKBOClxYEHpj6XmGa
	 3QKnSjw0+UlCw==
From: Ard Biesheuvel <ardb@kernel.org>
To: linux-crypto@vger.kernel.org
Subject: [RFC PATCH 12/21] crypto: lz4 - drop obsolete 'comp' implementation
Date: Tue, 18 Jul 2023 14:58:38 +0200
Message-Id: <20230718125847.3869700-13-ardb@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230718125847.3869700-1-ardb@kernel.org>
References: <20230718125847.3869700-1-ardb@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2947; i=ardb@kernel.org; h=from:subject; bh=re+UehvkeQHBK1wHhGnLcp2yWUgDT1GsozNrkQ2XFcw=; b=owGbwMvMwCFmkMcZplerG8N4Wi2JIWVbT7X8homhprm68cwLX+9c9Fvx644lvpYK0uyVHXczL lbqRHF3lLIwiHEwyIopsgjM/vtu5+mJUrXOs2Rh5rAygQxh4OIUgIkI7GFk2Cf5/H/hil+rRD0Y V1qVzlx8uzDmVsz8teat3v8K3ANncjIybI19KFrZfilr2byAGx94Wn2OsHp9Uz7yMyRa5daj4F4 hbgA=
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
 crypto/lz4.c | 61 +-------------------
 1 file changed, 1 insertion(+), 60 deletions(-)

diff --git a/crypto/lz4.c b/crypto/lz4.c
index 0606f8862e7872ad..c46b6cbd91ce10c0 100644
--- a/crypto/lz4.c
+++ b/crypto/lz4.c
@@ -27,29 +27,11 @@ static void *lz4_alloc_ctx(struct crypto_scomp *tfm)
 	return ctx;
 }
 
-static int lz4_init(struct crypto_tfm *tfm)
-{
-	struct lz4_ctx *ctx = crypto_tfm_ctx(tfm);
-
-	ctx->lz4_comp_mem = lz4_alloc_ctx(NULL);
-	if (IS_ERR(ctx->lz4_comp_mem))
-		return -ENOMEM;
-
-	return 0;
-}
-
 static void lz4_free_ctx(struct crypto_scomp *tfm, void *ctx)
 {
 	vfree(ctx);
 }
 
-static void lz4_exit(struct crypto_tfm *tfm)
-{
-	struct lz4_ctx *ctx = crypto_tfm_ctx(tfm);
-
-	lz4_free_ctx(NULL, ctx->lz4_comp_mem);
-}
-
 static int __lz4_compress_crypto(const u8 *src, unsigned int slen,
 				 u8 *dst, unsigned int *dlen, void *ctx)
 {
@@ -70,14 +52,6 @@ static int lz4_scompress(struct crypto_scomp *tfm, const u8 *src,
 	return __lz4_compress_crypto(src, slen, dst, dlen, ctx);
 }
 
-static int lz4_compress_crypto(struct crypto_tfm *tfm, const u8 *src,
-			       unsigned int slen, u8 *dst, unsigned int *dlen)
-{
-	struct lz4_ctx *ctx = crypto_tfm_ctx(tfm);
-
-	return __lz4_compress_crypto(src, slen, dst, dlen, ctx->lz4_comp_mem);
-}
-
 static int __lz4_decompress_crypto(const u8 *src, unsigned int slen,
 				   u8 *dst, unsigned int *dlen, void *ctx)
 {
@@ -97,26 +71,6 @@ static int lz4_sdecompress(struct crypto_scomp *tfm, const u8 *src,
 	return __lz4_decompress_crypto(src, slen, dst, dlen, NULL);
 }
 
-static int lz4_decompress_crypto(struct crypto_tfm *tfm, const u8 *src,
-				 unsigned int slen, u8 *dst,
-				 unsigned int *dlen)
-{
-	return __lz4_decompress_crypto(src, slen, dst, dlen, NULL);
-}
-
-static struct crypto_alg alg_lz4 = {
-	.cra_name		= "lz4",
-	.cra_driver_name	= "lz4-generic",
-	.cra_flags		= CRYPTO_ALG_TYPE_COMPRESS,
-	.cra_ctxsize		= sizeof(struct lz4_ctx),
-	.cra_module		= THIS_MODULE,
-	.cra_init		= lz4_init,
-	.cra_exit		= lz4_exit,
-	.cra_u			= { .compress = {
-	.coa_compress		= lz4_compress_crypto,
-	.coa_decompress		= lz4_decompress_crypto } }
-};
-
 static struct scomp_alg scomp = {
 	.alloc_ctx		= lz4_alloc_ctx,
 	.free_ctx		= lz4_free_ctx,
@@ -131,24 +85,11 @@ static struct scomp_alg scomp = {
 
 static int __init lz4_mod_init(void)
 {
-	int ret;
-
-	ret = crypto_register_alg(&alg_lz4);
-	if (ret)
-		return ret;
-
-	ret = crypto_register_scomp(&scomp);
-	if (ret) {
-		crypto_unregister_alg(&alg_lz4);
-		return ret;
-	}
-
-	return ret;
+	return crypto_register_scomp(&scomp);
 }
 
 static void __exit lz4_mod_fini(void)
 {
-	crypto_unregister_alg(&alg_lz4);
 	crypto_unregister_scomp(&scomp);
 }
 
-- 
2.39.2

