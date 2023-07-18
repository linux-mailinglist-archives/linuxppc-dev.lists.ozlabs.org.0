Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C6B5757CE7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Jul 2023 15:09:35 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Jx99k83l;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R4zn93LBdz3dD6
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Jul 2023 23:09:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Jx99k83l;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=ardb@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R4zZV2NpLz3bXH
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Jul 2023 23:00:18 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id AA2FE61593;
	Tue, 18 Jul 2023 13:00:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A5AEC433C9;
	Tue, 18 Jul 2023 13:00:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689685215;
	bh=/qQ5zVEDSQWgAAFuZ3X4YFEm+OAHRe8ZGR+DuY6dhnM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Jx99k83lQTosnEHIoqMPL/v8Bcu8QRVWYXkMeIHwWA0/2ffcR8hW88jOogx+7sbs2
	 Oo0pYl+hIX4Pp22IFS4oa4moekRcfNQR08hTZRALfNVDK3/pqs25UAlPVlXZLlP6+q
	 EpJutwNEnIA3Kw/vQkY38tASNdoCxNS9tY223solGfyGasrwwptAjoZTGe48e0h+zI
	 TPSrbDUlsOM7TUNxUydKXy3WngrJOdvZAQOzSQ1TYX6m3kWmykBY+K8EtgbRlW6QZu
	 C2p+dkrPWItiJW8Awli+goF89CkHLWZIblno2gdx8bL3KgdPNOpqvgiG51Hlqcq692
	 niwAFwT5xfQYw==
From: Ard Biesheuvel <ardb@kernel.org>
To: linux-crypto@vger.kernel.org
Subject: [RFC PATCH 10/21] crypto: 842 - drop obsolete 'comp' implementation
Date: Tue, 18 Jul 2023 14:58:36 +0200
Message-Id: <20230718125847.3869700-11-ardb@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230718125847.3869700-1-ardb@kernel.org>
References: <20230718125847.3869700-1-ardb@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3099; i=ardb@kernel.org; h=from:subject; bh=/qQ5zVEDSQWgAAFuZ3X4YFEm+OAHRe8ZGR+DuY6dhnM=; b=owGbwMvMwCFmkMcZplerG8N4Wi2JIWVbT+X11++23f3U8DQ/9SjHpLTS1Zpciya+eWBSvZ27J L2uX6K1o5SFQYyDQVZMkUVg9t93O09PlKp1niULM4eVCWQIAxenAExkhyjDf8+UdoabXwN4JvLV Kytb6q24N/1Ktl310bavz+7GLps7dS3DPxW9sh8cy1YXXAkw+/uyssR275cJZ4TP/Ptjmnv63AW eaGYA
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
 crypto/842.c | 63 +-------------------
 1 file changed, 1 insertion(+), 62 deletions(-)

diff --git a/crypto/842.c b/crypto/842.c
index e59e54d769609ba6..5001d88cf727f74e 100644
--- a/crypto/842.c
+++ b/crypto/842.c
@@ -39,38 +39,11 @@ static void *crypto842_alloc_ctx(struct crypto_scomp *tfm)
 	return ctx;
 }
 
-static int crypto842_init(struct crypto_tfm *tfm)
-{
-	struct crypto842_ctx *ctx = crypto_tfm_ctx(tfm);
-
-	ctx->wmem = crypto842_alloc_ctx(NULL);
-	if (IS_ERR(ctx->wmem))
-		return -ENOMEM;
-
-	return 0;
-}
-
 static void crypto842_free_ctx(struct crypto_scomp *tfm, void *ctx)
 {
 	kfree(ctx);
 }
 
-static void crypto842_exit(struct crypto_tfm *tfm)
-{
-	struct crypto842_ctx *ctx = crypto_tfm_ctx(tfm);
-
-	crypto842_free_ctx(NULL, ctx->wmem);
-}
-
-static int crypto842_compress(struct crypto_tfm *tfm,
-			      const u8 *src, unsigned int slen,
-			      u8 *dst, unsigned int *dlen)
-{
-	struct crypto842_ctx *ctx = crypto_tfm_ctx(tfm);
-
-	return sw842_compress(src, slen, dst, dlen, ctx->wmem);
-}
-
 static int crypto842_scompress(struct crypto_scomp *tfm,
 			       const u8 *src, unsigned int slen,
 			       u8 *dst, unsigned int *dlen, void *ctx)
@@ -78,13 +51,6 @@ static int crypto842_scompress(struct crypto_scomp *tfm,
 	return sw842_compress(src, slen, dst, dlen, ctx);
 }
 
-static int crypto842_decompress(struct crypto_tfm *tfm,
-				const u8 *src, unsigned int slen,
-				u8 *dst, unsigned int *dlen)
-{
-	return sw842_decompress(src, slen, dst, dlen);
-}
-
 static int crypto842_sdecompress(struct crypto_scomp *tfm,
 				 const u8 *src, unsigned int slen,
 				 u8 *dst, unsigned int *dlen, void *ctx)
@@ -92,20 +58,6 @@ static int crypto842_sdecompress(struct crypto_scomp *tfm,
 	return sw842_decompress(src, slen, dst, dlen);
 }
 
-static struct crypto_alg alg = {
-	.cra_name		= "842",
-	.cra_driver_name	= "842-generic",
-	.cra_priority		= 100,
-	.cra_flags		= CRYPTO_ALG_TYPE_COMPRESS,
-	.cra_ctxsize		= sizeof(struct crypto842_ctx),
-	.cra_module		= THIS_MODULE,
-	.cra_init		= crypto842_init,
-	.cra_exit		= crypto842_exit,
-	.cra_u			= { .compress = {
-	.coa_compress		= crypto842_compress,
-	.coa_decompress		= crypto842_decompress } }
-};
-
 static struct scomp_alg scomp = {
 	.alloc_ctx		= crypto842_alloc_ctx,
 	.free_ctx		= crypto842_free_ctx,
@@ -121,25 +73,12 @@ static struct scomp_alg scomp = {
 
 static int __init crypto842_mod_init(void)
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
 subsys_initcall(crypto842_mod_init);
 
 static void __exit crypto842_mod_exit(void)
 {
-	crypto_unregister_alg(&alg);
 	crypto_unregister_scomp(&scomp);
 }
 module_exit(crypto842_mod_exit);
-- 
2.39.2

