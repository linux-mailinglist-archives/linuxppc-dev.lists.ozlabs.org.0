Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FC26757D13
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Jul 2023 15:16:27 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ISjla2n5;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R4zx50fR1z3cXH
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Jul 2023 23:16:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ISjla2n5;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=ardb@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R4zbC6gRGz3cP8
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Jul 2023 23:00:55 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 3C35461587;
	Tue, 18 Jul 2023 13:00:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA35DC433C7;
	Tue, 18 Jul 2023 13:00:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689685254;
	bh=XPV4TqBofI5Mv/9FxSzW2w9wDpjRH3FBmnl+elNmQmI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ISjla2n56YlijkAfztYf+g/V55gbC1NwHuZxMobak7dzq1xFYwC2FOjLzG7BhGk39
	 WElaQlZCvERhLtfdZN6U1NTa89maaiB/EROatQGBz3Tf+2R0fxGm7Mz2CwC19whuMX
	 ujukHX5uc0QUGdmNauZEsgc+XRWigo+HTrRhHh/XQV3Lg2DIjDtQD7ngcClNZQzThu
	 Ko41ly0UE0C9pfmRdwaPFsb6Gf5mwmNkCbbova/2+c4P5r9ZHJoRynlewW/aQwNEdd
	 +wNcHpk9se26dAHR8lWvDp9i/MsFjfKPDw90Z4ePMA82jrNu75a/IUzbYcr5SjzBcx
	 Au5HmuXBKW+SQ==
From: Ard Biesheuvel <ardb@kernel.org>
To: linux-crypto@vger.kernel.org
Subject: [RFC PATCH 18/21] crypto: compress_null - drop obsolete 'comp' implementation
Date: Tue, 18 Jul 2023 14:58:44 +0200
Message-Id: <20230718125847.3869700-19-ardb@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230718125847.3869700-1-ardb@kernel.org>
References: <20230718125847.3869700-1-ardb@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3053; i=ardb@kernel.org; h=from:subject; bh=XPV4TqBofI5Mv/9FxSzW2w9wDpjRH3FBmnl+elNmQmI=; b=owGbwMvMwCFmkMcZplerG8N4Wi2JIWVbT/O57bKCxz/9vLss0pfr+Jm/e61X1XTMfSsSULYue u/2p0xfOkpZGMQ4GGTFFFkEZv99t/P0RKla51myMHNYmUCGMHBxCsBE+MwY/odZ3Irasizr+IVT X0s6Prw8+Ytn0b/OLRkMdSdmL343SdCNkWHWzl16hVIP5jypnaLLdu2tadOnOdt63cPaO1PuCd/ ZfJQNAA==
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
 crypto/crypto_null.c | 31 ++++----------------
 crypto/testmgr.c     |  3 --
 2 files changed, 5 insertions(+), 29 deletions(-)

diff --git a/crypto/crypto_null.c b/crypto/crypto_null.c
index 5b84b0f7cc178fcd..75e73b1d6df01cc6 100644
--- a/crypto/crypto_null.c
+++ b/crypto/crypto_null.c
@@ -24,16 +24,6 @@ static DEFINE_MUTEX(crypto_default_null_skcipher_lock);
 static struct crypto_sync_skcipher *crypto_default_null_skcipher;
 static int crypto_default_null_skcipher_refcnt;
 
-static int null_compress(struct crypto_tfm *tfm, const u8 *src,
-			 unsigned int slen, u8 *dst, unsigned int *dlen)
-{
-	if (slen > *dlen)
-		return -EINVAL;
-	memcpy(dst, src, slen);
-	*dlen = slen;
-	return 0;
-}
-
 static int null_init(struct shash_desc *desc)
 {
 	return 0;
@@ -121,7 +111,7 @@ static struct skcipher_alg skcipher_null = {
 	.decrypt		=	null_skcipher_crypt,
 };
 
-static struct crypto_alg null_algs[] = { {
+static struct crypto_alg cipher_null = {
 	.cra_name		=	"cipher_null",
 	.cra_driver_name	=	"cipher_null-generic",
 	.cra_flags		=	CRYPTO_ALG_TYPE_CIPHER,
@@ -134,19 +124,8 @@ static struct crypto_alg null_algs[] = { {
 	.cia_setkey		= 	null_setkey,
 	.cia_encrypt		=	null_crypt,
 	.cia_decrypt		=	null_crypt } }
-}, {
-	.cra_name		=	"compress_null",
-	.cra_driver_name	=	"compress_null-generic",
-	.cra_flags		=	CRYPTO_ALG_TYPE_COMPRESS,
-	.cra_blocksize		=	NULL_BLOCK_SIZE,
-	.cra_ctxsize		=	0,
-	.cra_module		=	THIS_MODULE,
-	.cra_u			=	{ .compress = {
-	.coa_compress		=	null_compress,
-	.coa_decompress		=	null_compress } }
-} };
+};
 
-MODULE_ALIAS_CRYPTO("compress_null");
 MODULE_ALIAS_CRYPTO("digest_null");
 MODULE_ALIAS_CRYPTO("cipher_null");
 
@@ -189,7 +168,7 @@ static int __init crypto_null_mod_init(void)
 {
 	int ret = 0;
 
-	ret = crypto_register_algs(null_algs, ARRAY_SIZE(null_algs));
+	ret = crypto_register_alg(&cipher_null);
 	if (ret < 0)
 		goto out;
 
@@ -206,14 +185,14 @@ static int __init crypto_null_mod_init(void)
 out_unregister_shash:
 	crypto_unregister_shash(&digest_null);
 out_unregister_algs:
-	crypto_unregister_algs(null_algs, ARRAY_SIZE(null_algs));
+	crypto_unregister_alg(&cipher_null);
 out:
 	return ret;
 }
 
 static void __exit crypto_null_mod_fini(void)
 {
-	crypto_unregister_algs(null_algs, ARRAY_SIZE(null_algs));
+	crypto_unregister_alg(&cipher_null);
 	crypto_unregister_shash(&digest_null);
 	crypto_unregister_skcipher(&skcipher_null);
 }
diff --git a/crypto/testmgr.c b/crypto/testmgr.c
index 4971351f55dbabb9..e4b6d67233763193 100644
--- a/crypto/testmgr.c
+++ b/crypto/testmgr.c
@@ -4633,9 +4633,6 @@ static const struct alg_test_desc alg_test_descs[] = {
 		.suite = {
 			.hash = __VECS(sm4_cmac128_tv_template)
 		}
-	}, {
-		.alg = "compress_null",
-		.test = alg_test_null,
 	}, {
 		.alg = "crc32",
 		.test = alg_test_hash,
-- 
2.39.2

