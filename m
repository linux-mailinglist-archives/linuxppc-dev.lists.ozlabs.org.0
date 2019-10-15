Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F353D6D4F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Oct 2019 04:49:16 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46sfyc2JhbzDqxH
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Oct 2019 13:49:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=kernel.org
 (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=ebiggers@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="c2YzhhEV"; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46sftd1MTJzDqtv
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Oct 2019 13:45:44 +1100 (AEDT)
Received: from sol.localdomain (c-24-5-143-220.hsd1.ca.comcast.net
 [24.5.143.220])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C08FB21848;
 Tue, 15 Oct 2019 02:45:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1571107543;
 bh=pkpP6CSFnf6juSCpU87sSXFvcpAe+bZMo8bRvI1qD2E=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=c2YzhhEVYYmwdFwzYaRRvwkeM7YAfeKXAoOXkxQZSpJwAY4b0WmkKj+jIN+DLxRSz
 EO4WKt+07g5fVhiNlOTiDkcTRED+wHdA6CzoKCNLrjHYysF+zFYg3jXaj0fYv6LKHB
 GKrjfLnCjTSu7doxgQUYRrf7Fle/+BCgIcEZSfyI=
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org,
	Herbert Xu <herbert@gondor.apana.org.au>
Subject: [PATCH v2 3/3] crypto: powerpc - convert SPE AES algorithms to
 skcipher API
Date: Mon, 14 Oct 2019 19:45:17 -0700
Message-Id: <20191015024517.52790-4-ebiggers@kernel.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191015024517.52790-1-ebiggers@kernel.org>
References: <20191015024517.52790-1-ebiggers@kernel.org>
MIME-Version: 1.0
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
Cc: Markus Stockhausen <stockhausen@collogia.de>,
 Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Eric Biggers <ebiggers@google.com>

Convert the glue code for the PowerPC SPE implementations of AES-ECB,
AES-CBC, AES-CTR, and AES-XTS from the deprecated "blkcipher" API to the
"skcipher" API.  This is needed in order for the blkcipher API to be
removed.

Tested with:

	export ARCH=powerpc CROSS_COMPILE=powerpc-linux-gnu-
	make mpc85xx_defconfig
	cat >> .config << EOF
	# CONFIG_MODULES is not set
	# CONFIG_CRYPTO_MANAGER_DISABLE_TESTS is not set
	CONFIG_DEBUG_KERNEL=y
	CONFIG_CRYPTO_MANAGER_EXTRA_TESTS=y
	CONFIG_CRYPTO_AES=y
	CONFIG_CRYPTO_CBC=y
	CONFIG_CRYPTO_CTR=y
	CONFIG_CRYPTO_ECB=y
	CONFIG_CRYPTO_XTS=y
	CONFIG_CRYPTO_AES_PPC_SPE=y
	EOF
	make olddefconfig
	make -j32
	qemu-system-ppc -M mpc8544ds -cpu e500 -nographic \
		-kernel arch/powerpc/boot/zImage \
		-append cryptomgr.fuzz_iterations=1000

Note that xts-ppc-spe still fails the comparison tests due to the lack
of ciphertext stealing support.  This is not addressed by this patch.

This patch also cleans up the code by making ->encrypt() and ->decrypt()
call a common function for each of ECB, CBC, and XTS, and by using a
clearer way to compute the length to process at each step.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 arch/powerpc/crypto/aes-spe-glue.c | 381 +++++++++++++----------------
 crypto/Kconfig                     |   1 +
 2 files changed, 166 insertions(+), 216 deletions(-)

diff --git a/arch/powerpc/crypto/aes-spe-glue.c b/arch/powerpc/crypto/aes-spe-glue.c
index 4189d2644f74..f828f8bcd0c6 100644
--- a/arch/powerpc/crypto/aes-spe-glue.c
+++ b/arch/powerpc/crypto/aes-spe-glue.c
@@ -17,6 +17,7 @@
 #include <asm/byteorder.h>
 #include <asm/switch_to.h>
 #include <crypto/algapi.h>
+#include <crypto/internal/skcipher.h>
 #include <crypto/xts.h>
 
 /*
@@ -118,13 +119,19 @@ static int ppc_aes_setkey(struct crypto_tfm *tfm, const u8 *in_key,
 	return 0;
 }
 
-static int ppc_xts_setkey(struct crypto_tfm *tfm, const u8 *in_key,
+static int ppc_aes_setkey_skcipher(struct crypto_skcipher *tfm,
+				   const u8 *in_key, unsigned int key_len)
+{
+	return ppc_aes_setkey(crypto_skcipher_tfm(tfm), in_key, key_len);
+}
+
+static int ppc_xts_setkey(struct crypto_skcipher *tfm, const u8 *in_key,
 		   unsigned int key_len)
 {
-	struct ppc_xts_ctx *ctx = crypto_tfm_ctx(tfm);
+	struct ppc_xts_ctx *ctx = crypto_skcipher_ctx(tfm);
 	int err;
 
-	err = xts_check_key(tfm, in_key, key_len);
+	err = xts_verify_key(tfm, in_key, key_len);
 	if (err)
 		return err;
 
@@ -133,7 +140,7 @@ static int ppc_xts_setkey(struct crypto_tfm *tfm, const u8 *in_key,
 	if (key_len != AES_KEYSIZE_128 &&
 	    key_len != AES_KEYSIZE_192 &&
 	    key_len != AES_KEYSIZE_256) {
-		tfm->crt_flags |= CRYPTO_TFM_RES_BAD_KEY_LEN;
+		crypto_skcipher_set_flags(tfm, CRYPTO_TFM_RES_BAD_KEY_LEN);
 		return -EINVAL;
 	}
 
@@ -178,201 +185,154 @@ static void ppc_aes_decrypt(struct crypto_tfm *tfm, u8 *out, const u8 *in)
 	spe_end();
 }
 
-static int ppc_ecb_encrypt(struct blkcipher_desc *desc, struct scatterlist *dst,
-			   struct scatterlist *src, unsigned int nbytes)
+static int ppc_ecb_crypt(struct skcipher_request *req, bool enc)
 {
-	struct ppc_aes_ctx *ctx = crypto_blkcipher_ctx(desc->tfm);
-	struct blkcipher_walk walk;
-	unsigned int ubytes;
+	struct crypto_skcipher *tfm = crypto_skcipher_reqtfm(req);
+	struct ppc_aes_ctx *ctx = crypto_skcipher_ctx(tfm);
+	struct skcipher_walk walk;
+	unsigned int nbytes;
 	int err;
 
-	blkcipher_walk_init(&walk, dst, src, nbytes);
-	err = blkcipher_walk_virt(desc, &walk);
+	err = skcipher_walk_virt(&walk, req, false);
 
-	while ((nbytes = walk.nbytes)) {
-		ubytes = nbytes > MAX_BYTES ?
-			 nbytes - MAX_BYTES : nbytes & (AES_BLOCK_SIZE - 1);
-		nbytes -= ubytes;
+	while ((nbytes = walk.nbytes) != 0) {
+		nbytes = min_t(unsigned int, nbytes, MAX_BYTES);
+		nbytes = round_down(nbytes, AES_BLOCK_SIZE);
 
 		spe_begin();
-		ppc_encrypt_ecb(walk.dst.virt.addr, walk.src.virt.addr,
-				ctx->key_enc, ctx->rounds, nbytes);
+		if (enc)
+			ppc_encrypt_ecb(walk.dst.virt.addr, walk.src.virt.addr,
+					ctx->key_enc, ctx->rounds, nbytes);
+		else
+			ppc_decrypt_ecb(walk.dst.virt.addr, walk.src.virt.addr,
+					ctx->key_dec, ctx->rounds, nbytes);
 		spe_end();
 
-		err = blkcipher_walk_done(desc, &walk, ubytes);
+		err = skcipher_walk_done(&walk, walk.nbytes - nbytes);
 	}
 
 	return err;
 }
 
-static int ppc_ecb_decrypt(struct blkcipher_desc *desc, struct scatterlist *dst,
-			   struct scatterlist *src, unsigned int nbytes)
+static int ppc_ecb_encrypt(struct skcipher_request *req)
 {
-	struct ppc_aes_ctx *ctx = crypto_blkcipher_ctx(desc->tfm);
-	struct blkcipher_walk walk;
-	unsigned int ubytes;
-	int err;
-
-	blkcipher_walk_init(&walk, dst, src, nbytes);
-	err = blkcipher_walk_virt(desc, &walk);
-
-	while ((nbytes = walk.nbytes)) {
-		ubytes = nbytes > MAX_BYTES ?
-			 nbytes - MAX_BYTES : nbytes & (AES_BLOCK_SIZE - 1);
-		nbytes -= ubytes;
-
-		spe_begin();
-		ppc_decrypt_ecb(walk.dst.virt.addr, walk.src.virt.addr,
-				ctx->key_dec, ctx->rounds, nbytes);
-		spe_end();
-
-		err = blkcipher_walk_done(desc, &walk, ubytes);
-	}
+	return ppc_ecb_crypt(req, true);
+}
 
-	return err;
+static int ppc_ecb_decrypt(struct skcipher_request *req)
+{
+	return ppc_ecb_crypt(req, false);
 }
 
-static int ppc_cbc_encrypt(struct blkcipher_desc *desc, struct scatterlist *dst,
-			   struct scatterlist *src, unsigned int nbytes)
+static int ppc_cbc_crypt(struct skcipher_request *req, bool enc)
 {
-	struct ppc_aes_ctx *ctx = crypto_blkcipher_ctx(desc->tfm);
-	struct blkcipher_walk walk;
-	unsigned int ubytes;
+	struct crypto_skcipher *tfm = crypto_skcipher_reqtfm(req);
+	struct ppc_aes_ctx *ctx = crypto_skcipher_ctx(tfm);
+	struct skcipher_walk walk;
+	unsigned int nbytes;
 	int err;
 
-	blkcipher_walk_init(&walk, dst, src, nbytes);
-	err = blkcipher_walk_virt(desc, &walk);
+	err = skcipher_walk_virt(&walk, req, false);
 
-	while ((nbytes = walk.nbytes)) {
-		ubytes = nbytes > MAX_BYTES ?
-			 nbytes - MAX_BYTES : nbytes & (AES_BLOCK_SIZE - 1);
-		nbytes -= ubytes;
+	while ((nbytes = walk.nbytes) != 0) {
+		nbytes = min_t(unsigned int, nbytes, MAX_BYTES);
+		nbytes = round_down(nbytes, AES_BLOCK_SIZE);
 
 		spe_begin();
-		ppc_encrypt_cbc(walk.dst.virt.addr, walk.src.virt.addr,
-				ctx->key_enc, ctx->rounds, nbytes, walk.iv);
+		if (enc)
+			ppc_encrypt_cbc(walk.dst.virt.addr, walk.src.virt.addr,
+					ctx->key_enc, ctx->rounds, nbytes,
+					walk.iv);
+		else
+			ppc_decrypt_cbc(walk.dst.virt.addr, walk.src.virt.addr,
+					ctx->key_dec, ctx->rounds, nbytes,
+					walk.iv);
 		spe_end();
 
-		err = blkcipher_walk_done(desc, &walk, ubytes);
+		err = skcipher_walk_done(&walk, walk.nbytes - nbytes);
 	}
 
 	return err;
 }
 
-static int ppc_cbc_decrypt(struct blkcipher_desc *desc, struct scatterlist *dst,
-			   struct scatterlist *src, unsigned int nbytes)
+static int ppc_cbc_encrypt(struct skcipher_request *req)
 {
-	struct ppc_aes_ctx *ctx = crypto_blkcipher_ctx(desc->tfm);
-	struct blkcipher_walk walk;
-	unsigned int ubytes;
-	int err;
-
-	blkcipher_walk_init(&walk, dst, src, nbytes);
-	err = blkcipher_walk_virt(desc, &walk);
-
-	while ((nbytes = walk.nbytes)) {
-		ubytes = nbytes > MAX_BYTES ?
-			 nbytes - MAX_BYTES : nbytes & (AES_BLOCK_SIZE - 1);
-		nbytes -= ubytes;
-
-		spe_begin();
-		ppc_decrypt_cbc(walk.dst.virt.addr, walk.src.virt.addr,
-				ctx->key_dec, ctx->rounds, nbytes, walk.iv);
-		spe_end();
-
-		err = blkcipher_walk_done(desc, &walk, ubytes);
-	}
+	return ppc_cbc_crypt(req, true);
+}
 
-	return err;
+static int ppc_cbc_decrypt(struct skcipher_request *req)
+{
+	return ppc_cbc_crypt(req, false);
 }
 
-static int ppc_ctr_crypt(struct blkcipher_desc *desc, struct scatterlist *dst,
-			 struct scatterlist *src, unsigned int nbytes)
+static int ppc_ctr_crypt(struct skcipher_request *req)
 {
-	struct ppc_aes_ctx *ctx = crypto_blkcipher_ctx(desc->tfm);
-	struct blkcipher_walk walk;
-	unsigned int pbytes, ubytes;
+	struct crypto_skcipher *tfm = crypto_skcipher_reqtfm(req);
+	struct ppc_aes_ctx *ctx = crypto_skcipher_ctx(tfm);
+	struct skcipher_walk walk;
+	unsigned int nbytes;
 	int err;
 
-	blkcipher_walk_init(&walk, dst, src, nbytes);
-	err = blkcipher_walk_virt_block(desc, &walk, AES_BLOCK_SIZE);
+	err = skcipher_walk_virt(&walk, req, false);
 
-	while ((pbytes = walk.nbytes)) {
-		pbytes = pbytes > MAX_BYTES ? MAX_BYTES : pbytes;
-		pbytes = pbytes == nbytes ?
-			 nbytes : pbytes & ~(AES_BLOCK_SIZE - 1);
-		ubytes = walk.nbytes - pbytes;
+	while ((nbytes = walk.nbytes) != 0) {
+		nbytes = min_t(unsigned int, nbytes, MAX_BYTES);
+		if (nbytes < walk.total)
+			nbytes = round_down(nbytes, AES_BLOCK_SIZE);
 
 		spe_begin();
 		ppc_crypt_ctr(walk.dst.virt.addr, walk.src.virt.addr,
-			      ctx->key_enc, ctx->rounds, pbytes , walk.iv);
+			      ctx->key_enc, ctx->rounds, nbytes, walk.iv);
 		spe_end();
 
-		nbytes -= pbytes;
-		err = blkcipher_walk_done(desc, &walk, ubytes);
+		err = skcipher_walk_done(&walk, walk.nbytes - nbytes);
 	}
 
 	return err;
 }
 
-static int ppc_xts_encrypt(struct blkcipher_desc *desc, struct scatterlist *dst,
-			   struct scatterlist *src, unsigned int nbytes)
+static int ppc_xts_crypt(struct skcipher_request *req, bool enc)
 {
-	struct ppc_xts_ctx *ctx = crypto_blkcipher_ctx(desc->tfm);
-	struct blkcipher_walk walk;
-	unsigned int ubytes;
+	struct crypto_skcipher *tfm = crypto_skcipher_reqtfm(req);
+	struct ppc_xts_ctx *ctx = crypto_skcipher_ctx(tfm);
+	struct skcipher_walk walk;
+	unsigned int nbytes;
 	int err;
 	u32 *twk;
 
-	blkcipher_walk_init(&walk, dst, src, nbytes);
-	err = blkcipher_walk_virt(desc, &walk);
+	err = skcipher_walk_virt(&walk, req, false);
 	twk = ctx->key_twk;
 
-	while ((nbytes = walk.nbytes)) {
-		ubytes = nbytes > MAX_BYTES ?
-			 nbytes - MAX_BYTES : nbytes & (AES_BLOCK_SIZE - 1);
-		nbytes -= ubytes;
+	while ((nbytes = walk.nbytes) != 0) {
+		nbytes = min_t(unsigned int, nbytes, MAX_BYTES);
+		nbytes = round_down(nbytes, AES_BLOCK_SIZE);
 
 		spe_begin();
-		ppc_encrypt_xts(walk.dst.virt.addr, walk.src.virt.addr,
-				ctx->key_enc, ctx->rounds, nbytes, walk.iv, twk);
+		if (enc)
+			ppc_encrypt_xts(walk.dst.virt.addr, walk.src.virt.addr,
+					ctx->key_enc, ctx->rounds, nbytes,
+					walk.iv, twk);
+		else
+			ppc_decrypt_xts(walk.dst.virt.addr, walk.src.virt.addr,
+					ctx->key_dec, ctx->rounds, nbytes,
+					walk.iv, twk);
 		spe_end();
 
 		twk = NULL;
-		err = blkcipher_walk_done(desc, &walk, ubytes);
+		err = skcipher_walk_done(&walk, walk.nbytes - nbytes);
 	}
 
 	return err;
 }
 
-static int ppc_xts_decrypt(struct blkcipher_desc *desc, struct scatterlist *dst,
-			   struct scatterlist *src, unsigned int nbytes)
+static int ppc_xts_encrypt(struct skcipher_request *req)
 {
-	struct ppc_xts_ctx *ctx = crypto_blkcipher_ctx(desc->tfm);
-	struct blkcipher_walk walk;
-	unsigned int ubytes;
-	int err;
-	u32 *twk;
-
-	blkcipher_walk_init(&walk, dst, src, nbytes);
-	err = blkcipher_walk_virt(desc, &walk);
-	twk = ctx->key_twk;
-
-	while ((nbytes = walk.nbytes)) {
-		ubytes = nbytes > MAX_BYTES ?
-			 nbytes - MAX_BYTES : nbytes & (AES_BLOCK_SIZE - 1);
-		nbytes -= ubytes;
-
-		spe_begin();
-		ppc_decrypt_xts(walk.dst.virt.addr, walk.src.virt.addr,
-				ctx->key_dec, ctx->rounds, nbytes, walk.iv, twk);
-		spe_end();
-
-		twk = NULL;
-		err = blkcipher_walk_done(desc, &walk, ubytes);
-	}
+	return ppc_xts_crypt(req, true);
+}
 
-	return err;
+static int ppc_xts_decrypt(struct skcipher_request *req)
+{
+	return ppc_xts_crypt(req, false);
 }
 
 /*
@@ -381,9 +341,9 @@ static int ppc_xts_decrypt(struct blkcipher_desc *desc, struct scatterlist *dst,
  * This improves IPsec thoughput by another few percent. Additionally we assume
  * that AES context is always aligned to at least 8 bytes because it is created
  * with kmalloc() in the crypto infrastructure
- *
  */
-static struct crypto_alg aes_algs[] = { {
+
+static struct crypto_alg aes_cipher_alg = {
 	.cra_name		=	"aes",
 	.cra_driver_name	=	"aes-ppc-spe",
 	.cra_priority		=	300,
@@ -401,95 +361,84 @@ static struct crypto_alg aes_algs[] = { {
 			.cia_decrypt		=	ppc_aes_decrypt
 		}
 	}
-}, {
-	.cra_name		=	"ecb(aes)",
-	.cra_driver_name	=	"ecb-ppc-spe",
-	.cra_priority		=	300,
-	.cra_flags		=	CRYPTO_ALG_TYPE_BLKCIPHER,
-	.cra_blocksize		=	AES_BLOCK_SIZE,
-	.cra_ctxsize		=	sizeof(struct ppc_aes_ctx),
-	.cra_alignmask		=	0,
-	.cra_type		=	&crypto_blkcipher_type,
-	.cra_module		=	THIS_MODULE,
-	.cra_u = {
-		.blkcipher = {
-			.min_keysize		=	AES_MIN_KEY_SIZE,
-			.max_keysize		=	AES_MAX_KEY_SIZE,
-			.setkey			=	ppc_aes_setkey,
-			.encrypt		=	ppc_ecb_encrypt,
-			.decrypt		=	ppc_ecb_decrypt,
-		}
-	}
-}, {
-	.cra_name		=	"cbc(aes)",
-	.cra_driver_name	=	"cbc-ppc-spe",
-	.cra_priority		=	300,
-	.cra_flags		=	CRYPTO_ALG_TYPE_BLKCIPHER,
-	.cra_blocksize		=	AES_BLOCK_SIZE,
-	.cra_ctxsize		=	sizeof(struct ppc_aes_ctx),
-	.cra_alignmask		=	0,
-	.cra_type		=	&crypto_blkcipher_type,
-	.cra_module		=	THIS_MODULE,
-	.cra_u = {
-		.blkcipher = {
-			.min_keysize		=	AES_MIN_KEY_SIZE,
-			.max_keysize		=	AES_MAX_KEY_SIZE,
-			.ivsize			=	AES_BLOCK_SIZE,
-			.setkey			=	ppc_aes_setkey,
-			.encrypt		=	ppc_cbc_encrypt,
-			.decrypt		=	ppc_cbc_decrypt,
-		}
-	}
-}, {
-	.cra_name		=	"ctr(aes)",
-	.cra_driver_name	=	"ctr-ppc-spe",
-	.cra_priority		=	300,
-	.cra_flags		=	CRYPTO_ALG_TYPE_BLKCIPHER,
-	.cra_blocksize		=	1,
-	.cra_ctxsize		=	sizeof(struct ppc_aes_ctx),
-	.cra_alignmask		=	0,
-	.cra_type		=	&crypto_blkcipher_type,
-	.cra_module		=	THIS_MODULE,
-	.cra_u = {
-		.blkcipher = {
-			.min_keysize		=	AES_MIN_KEY_SIZE,
-			.max_keysize		=	AES_MAX_KEY_SIZE,
-			.ivsize			=	AES_BLOCK_SIZE,
-			.setkey			=	ppc_aes_setkey,
-			.encrypt		=	ppc_ctr_crypt,
-			.decrypt		=	ppc_ctr_crypt,
-		}
-	}
-}, {
-	.cra_name		=	"xts(aes)",
-	.cra_driver_name	=	"xts-ppc-spe",
-	.cra_priority		=	300,
-	.cra_flags		=	CRYPTO_ALG_TYPE_BLKCIPHER,
-	.cra_blocksize		=	AES_BLOCK_SIZE,
-	.cra_ctxsize		=	sizeof(struct ppc_xts_ctx),
-	.cra_alignmask		=	0,
-	.cra_type		=	&crypto_blkcipher_type,
-	.cra_module		=	THIS_MODULE,
-	.cra_u = {
-		.blkcipher = {
-			.min_keysize		=	AES_MIN_KEY_SIZE * 2,
-			.max_keysize		=	AES_MAX_KEY_SIZE * 2,
-			.ivsize			=	AES_BLOCK_SIZE,
-			.setkey			=	ppc_xts_setkey,
-			.encrypt		=	ppc_xts_encrypt,
-			.decrypt		=	ppc_xts_decrypt,
-		}
+};
+
+static struct skcipher_alg aes_skcipher_algs[] = {
+	{
+		.base.cra_name		=	"ecb(aes)",
+		.base.cra_driver_name	=	"ecb-ppc-spe",
+		.base.cra_priority	=	300,
+		.base.cra_blocksize	=	AES_BLOCK_SIZE,
+		.base.cra_ctxsize	=	sizeof(struct ppc_aes_ctx),
+		.base.cra_module	=	THIS_MODULE,
+		.min_keysize		=	AES_MIN_KEY_SIZE,
+		.max_keysize		=	AES_MAX_KEY_SIZE,
+		.setkey			=	ppc_aes_setkey_skcipher,
+		.encrypt		=	ppc_ecb_encrypt,
+		.decrypt		=	ppc_ecb_decrypt,
+	}, {
+		.base.cra_name		=	"cbc(aes)",
+		.base.cra_driver_name	=	"cbc-ppc-spe",
+		.base.cra_priority	=	300,
+		.base.cra_blocksize	=	AES_BLOCK_SIZE,
+		.base.cra_ctxsize	=	sizeof(struct ppc_aes_ctx),
+		.base.cra_module	=	THIS_MODULE,
+		.min_keysize		=	AES_MIN_KEY_SIZE,
+		.max_keysize		=	AES_MAX_KEY_SIZE,
+		.ivsize			=	AES_BLOCK_SIZE,
+		.setkey			=	ppc_aes_setkey_skcipher,
+		.encrypt		=	ppc_cbc_encrypt,
+		.decrypt		=	ppc_cbc_decrypt,
+	}, {
+		.base.cra_name		=	"ctr(aes)",
+		.base.cra_driver_name	=	"ctr-ppc-spe",
+		.base.cra_priority	=	300,
+		.base.cra_blocksize	=	1,
+		.base.cra_ctxsize	=	sizeof(struct ppc_aes_ctx),
+		.base.cra_module	=	THIS_MODULE,
+		.min_keysize		=	AES_MIN_KEY_SIZE,
+		.max_keysize		=	AES_MAX_KEY_SIZE,
+		.ivsize			=	AES_BLOCK_SIZE,
+		.setkey			=	ppc_aes_setkey_skcipher,
+		.encrypt		=	ppc_ctr_crypt,
+		.decrypt		=	ppc_ctr_crypt,
+		.chunksize		=	AES_BLOCK_SIZE,
+	}, {
+		.base.cra_name		=	"xts(aes)",
+		.base.cra_driver_name	=	"xts-ppc-spe",
+		.base.cra_priority	=	300,
+		.base.cra_blocksize	=	AES_BLOCK_SIZE,
+		.base.cra_ctxsize	=	sizeof(struct ppc_xts_ctx),
+		.base.cra_module	=	THIS_MODULE,
+		.min_keysize		=	AES_MIN_KEY_SIZE * 2,
+		.max_keysize		=	AES_MAX_KEY_SIZE * 2,
+		.ivsize			=	AES_BLOCK_SIZE,
+		.setkey			=	ppc_xts_setkey,
+		.encrypt		=	ppc_xts_encrypt,
+		.decrypt		=	ppc_xts_decrypt,
 	}
-} };
+};
 
 static int __init ppc_aes_mod_init(void)
 {
-	return crypto_register_algs(aes_algs, ARRAY_SIZE(aes_algs));
+	int err;
+
+	err = crypto_register_alg(&aes_cipher_alg);
+	if (err)
+		return err;
+
+	err = crypto_register_skciphers(aes_skcipher_algs,
+					ARRAY_SIZE(aes_skcipher_algs));
+	if (err)
+		crypto_unregister_alg(&aes_cipher_alg);
+	return err;
 }
 
 static void __exit ppc_aes_mod_fini(void)
 {
-	crypto_unregister_algs(aes_algs, ARRAY_SIZE(aes_algs));
+	crypto_unregister_alg(&aes_cipher_alg);
+	crypto_unregister_skciphers(aes_skcipher_algs,
+				    ARRAY_SIZE(aes_skcipher_algs));
 }
 
 module_init(ppc_aes_mod_init);
diff --git a/crypto/Kconfig b/crypto/Kconfig
index 8c38c2b7f8e7..320548b4dfa9 100644
--- a/crypto/Kconfig
+++ b/crypto/Kconfig
@@ -1125,6 +1125,7 @@ config CRYPTO_AES_SPARC64
 config CRYPTO_AES_PPC_SPE
 	tristate "AES cipher algorithms (PPC SPE)"
 	depends on PPC && SPE
+	select CRYPTO_BLKCIPHER
 	help
 	  AES cipher algorithms (FIPS-197). Additionally the acceleration
 	  for popular block cipher modes ECB, CBC, CTR and XTS is supported.
-- 
2.23.0

