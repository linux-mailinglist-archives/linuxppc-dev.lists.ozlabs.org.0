Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CB8E32679
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Jun 2019 04:12:40 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45HJVF2XjGzDqMv
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Jun 2019 12:12:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=axtens.net
 (client-ip=2607:f8b0:4864:20::644; helo=mail-pl1-x644.google.com;
 envelope-from=dja@axtens.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=axtens.net
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.b="b6czOLs+"; 
 dkim-atps=neutral
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45HJQH52J7zDqMw
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  3 Jun 2019 12:09:11 +1000 (AEST)
Received: by mail-pl1-x644.google.com with SMTP id f97so6349637plb.5
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 02 Jun 2019 19:09:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=W0qPdmOlHokX2EU0AW/d1ZAOu7LJ1PYTnO4lj8aDC9U=;
 b=b6czOLs+OdxQpOdatuxnK+W1hOShYB0s/RH6VCccdeaBOldKKK4BJC8codDTgCZBgD
 cAkXI9RInnHBVIUNZaEVZjFclfIlx57+Hjg+4bH4Ix4aRwONyZj+mkIxwNOsaeoC0kay
 bSYXnZKFeuh/LDxQ6K28Tc/lN49nQUIXBgdXE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=W0qPdmOlHokX2EU0AW/d1ZAOu7LJ1PYTnO4lj8aDC9U=;
 b=GqilAHLQZrdYyzHNRUuzbItOdrYX1c4x+mxBMTyY0n3NQD4nZkMsiqEzVr+I1cx/kW
 UNHAhRLUoc4rXAriRimCYDVFYbxO5VDS1GmXetLni53iGtaOz64i3SSOp5gLPK96veWj
 Ho5EQ4LbpEWvlX8SzNNDeSp930VURFby56IMET7dXHF65lPTJGVRRurKg5+NHA8MhtU3
 Wo/hOG7PSkDuPRyAna3zzGWS3WCfnmCZQI/bPBr47HZzR5JP2IDxCM9syKP+3pHqz5AK
 QcwcHvQpnP+YDUnp2MRlNTA3LjIt4eb3MD04XSH4R4jNOLeBJV49InJL/ui+PVNaoSJI
 lueg==
X-Gm-Message-State: APjAAAWER13vhGSfIY/8PTyuFulYhKSFfdH3S5dqHW5R1Zsmg9oOM3lN
 MWLAlCdg3u745AP4vABaTq0wIFMjZKA=
X-Google-Smtp-Source: APXvYqwRwfUGjSsFzgdRa3h4nuXmscF+zjBYPO39Gx5tFWk+kevskB7m4bSgAmdwO4CJCeAEdlnCdQ==
X-Received: by 2002:a17:902:2a69:: with SMTP id
 i96mr18430590plb.108.1559527749031; 
 Sun, 02 Jun 2019 19:09:09 -0700 (PDT)
Received: from localhost (ppp167-251-205.static.internode.on.net.
 [59.167.251.205])
 by smtp.gmail.com with ESMTPSA id m5sm6238381pgn.59.2019.06.02.19.09.07
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sun, 02 Jun 2019 19:09:08 -0700 (PDT)
From: Daniel Axtens <dja@axtens.net>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH BACKPORTv2 4.9,
 4.14] crypto: vmx - ghash: do nosimd fallback manually
Date: Mon,  3 Jun 2019 12:09:03 +1000
Message-Id: <20190603020903.9665-1-dja@axtens.net>
X-Mailer: git-send-email 2.19.1
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
Cc: Herbert Xu <herbert@gondor.apana.org.au>, stable@vger.kernel.org,
 Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

commit 357d065a44cdd77ed5ff35155a989f2a763e96ef upstream.
[backported: the VMX driver did not use crypto_simd_usable() until
 after 5.1, CRYPTO_ALG_TYPE_SHASH was still specified in .options
 until after 4.14]

VMX ghash was using a fallback that did not support interleaving simd
and nosimd operations, leading to failures in the extended test suite.

If I understood correctly, Eric's suggestion was to use the same
data format that the generic code uses, allowing us to call into it
with the same contexts. I wasn't able to get that to work - I think
there's a very different key structure and data layout being used.

So instead steal the arm64 approach and perform the fallback
operations directly if required.

Fixes: cc333cd68dfa ("crypto: vmx - Adding GHASH routines for VMX module")
Cc: stable@vger.kernel.org # v4.1+
Reported-by: Eric Biggers <ebiggers@google.com>
Signed-off-by: Daniel Axtens <dja@axtens.net>
Acked-by: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Tested-by: Michael Ellerman <mpe@ellerman.id.au>
Signed-off-by: Herbert Xu <herbert@gondor.apana.org.au>
Signed-off-by: Daniel Axtens <dja@axtens.net>
---

v2: do stable backport form correctly.

---
 drivers/crypto/vmx/ghash.c | 213 +++++++++++++++----------------------
 1 file changed, 87 insertions(+), 126 deletions(-)

diff --git a/drivers/crypto/vmx/ghash.c b/drivers/crypto/vmx/ghash.c
index 1c4b5b889fba..1bfe867c0b7b 100644
--- a/drivers/crypto/vmx/ghash.c
+++ b/drivers/crypto/vmx/ghash.c
@@ -1,22 +1,14 @@
+// SPDX-License-Identifier: GPL-2.0
 /**
  * GHASH routines supporting VMX instructions on the Power 8
  *
- * Copyright (C) 2015 International Business Machines Inc.
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; version 2 only.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program; if not, write to the Free Software
- * Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
+ * Copyright (C) 2015, 2019 International Business Machines Inc.
  *
  * Author: Marcelo Henrique Cerri <mhcerri@br.ibm.com>
+ *
+ * Extended by Daniel Axtens <dja@axtens.net> to replace the fallback
+ * mechanism. The new approach is based on arm64 code, which is:
+ *   Copyright (C) 2014 - 2018 Linaro Ltd. <ard.biesheuvel@linaro.org>
  */
 
 #include <linux/types.h>
@@ -39,71 +31,25 @@ void gcm_ghash_p8(u64 Xi[2], const u128 htable[16],
 		  const u8 *in, size_t len);
 
 struct p8_ghash_ctx {
+	/* key used by vector asm */
 	u128 htable[16];
-	struct crypto_shash *fallback;
+	/* key used by software fallback */
+	be128 key;
 };
 
 struct p8_ghash_desc_ctx {
 	u64 shash[2];
 	u8 buffer[GHASH_DIGEST_SIZE];
 	int bytes;
-	struct shash_desc fallback_desc;
 };
 
-static int p8_ghash_init_tfm(struct crypto_tfm *tfm)
-{
-	const char *alg = "ghash-generic";
-	struct crypto_shash *fallback;
-	struct crypto_shash *shash_tfm = __crypto_shash_cast(tfm);
-	struct p8_ghash_ctx *ctx = crypto_tfm_ctx(tfm);
-
-	fallback = crypto_alloc_shash(alg, 0, CRYPTO_ALG_NEED_FALLBACK);
-	if (IS_ERR(fallback)) {
-		printk(KERN_ERR
-		       "Failed to allocate transformation for '%s': %ld\n",
-		       alg, PTR_ERR(fallback));
-		return PTR_ERR(fallback);
-	}
-
-	crypto_shash_set_flags(fallback,
-			       crypto_shash_get_flags((struct crypto_shash
-						       *) tfm));
-
-	/* Check if the descsize defined in the algorithm is still enough. */
-	if (shash_tfm->descsize < sizeof(struct p8_ghash_desc_ctx)
-	    + crypto_shash_descsize(fallback)) {
-		printk(KERN_ERR
-		       "Desc size of the fallback implementation (%s) does not match the expected value: %lu vs %u\n",
-		       alg,
-		       shash_tfm->descsize - sizeof(struct p8_ghash_desc_ctx),
-		       crypto_shash_descsize(fallback));
-		return -EINVAL;
-	}
-	ctx->fallback = fallback;
-
-	return 0;
-}
-
-static void p8_ghash_exit_tfm(struct crypto_tfm *tfm)
-{
-	struct p8_ghash_ctx *ctx = crypto_tfm_ctx(tfm);
-
-	if (ctx->fallback) {
-		crypto_free_shash(ctx->fallback);
-		ctx->fallback = NULL;
-	}
-}
-
 static int p8_ghash_init(struct shash_desc *desc)
 {
-	struct p8_ghash_ctx *ctx = crypto_tfm_ctx(crypto_shash_tfm(desc->tfm));
 	struct p8_ghash_desc_ctx *dctx = shash_desc_ctx(desc);
 
 	dctx->bytes = 0;
 	memset(dctx->shash, 0, GHASH_DIGEST_SIZE);
-	dctx->fallback_desc.tfm = ctx->fallback;
-	dctx->fallback_desc.flags = desc->flags;
-	return crypto_shash_init(&dctx->fallback_desc);
+	return 0;
 }
 
 static int p8_ghash_setkey(struct crypto_shash *tfm, const u8 *key,
@@ -121,7 +67,51 @@ static int p8_ghash_setkey(struct crypto_shash *tfm, const u8 *key,
 	disable_kernel_vsx();
 	pagefault_enable();
 	preempt_enable();
-	return crypto_shash_setkey(ctx->fallback, key, keylen);
+
+	memcpy(&ctx->key, key, GHASH_BLOCK_SIZE);
+
+	return 0;
+}
+
+static inline void __ghash_block(struct p8_ghash_ctx *ctx,
+				 struct p8_ghash_desc_ctx *dctx)
+{
+	if (!IN_INTERRUPT) {
+		preempt_disable();
+		pagefault_disable();
+		enable_kernel_vsx();
+		gcm_ghash_p8(dctx->shash, ctx->htable,
+				dctx->buffer, GHASH_DIGEST_SIZE);
+		disable_kernel_vsx();
+		pagefault_enable();
+		preempt_enable();
+	} else {
+		crypto_xor((u8 *)dctx->shash, dctx->buffer, GHASH_BLOCK_SIZE);
+		gf128mul_lle((be128 *)dctx->shash, &ctx->key);
+	}
+}
+
+static inline void __ghash_blocks(struct p8_ghash_ctx *ctx,
+				  struct p8_ghash_desc_ctx *dctx,
+				  const u8 *src, unsigned int srclen)
+{
+	if (!IN_INTERRUPT) {
+		preempt_disable();
+		pagefault_disable();
+		enable_kernel_vsx();
+		gcm_ghash_p8(dctx->shash, ctx->htable,
+				src, srclen);
+		disable_kernel_vsx();
+		pagefault_enable();
+		preempt_enable();
+	} else {
+		while (srclen >= GHASH_BLOCK_SIZE) {
+			crypto_xor((u8 *)dctx->shash, src, GHASH_BLOCK_SIZE);
+			gf128mul_lle((be128 *)dctx->shash, &ctx->key);
+			srclen -= GHASH_BLOCK_SIZE;
+			src += GHASH_BLOCK_SIZE;
+		}
+	}
 }
 
 static int p8_ghash_update(struct shash_desc *desc,
@@ -131,49 +121,33 @@ static int p8_ghash_update(struct shash_desc *desc,
 	struct p8_ghash_ctx *ctx = crypto_tfm_ctx(crypto_shash_tfm(desc->tfm));
 	struct p8_ghash_desc_ctx *dctx = shash_desc_ctx(desc);
 
-	if (IN_INTERRUPT) {
-		return crypto_shash_update(&dctx->fallback_desc, src,
-					   srclen);
-	} else {
-		if (dctx->bytes) {
-			if (dctx->bytes + srclen < GHASH_DIGEST_SIZE) {
-				memcpy(dctx->buffer + dctx->bytes, src,
-				       srclen);
-				dctx->bytes += srclen;
-				return 0;
-			}
+	if (dctx->bytes) {
+		if (dctx->bytes + srclen < GHASH_DIGEST_SIZE) {
 			memcpy(dctx->buffer + dctx->bytes, src,
-			       GHASH_DIGEST_SIZE - dctx->bytes);
-			preempt_disable();
-			pagefault_disable();
-			enable_kernel_vsx();
-			gcm_ghash_p8(dctx->shash, ctx->htable,
-				     dctx->buffer, GHASH_DIGEST_SIZE);
-			disable_kernel_vsx();
-			pagefault_enable();
-			preempt_enable();
-			src += GHASH_DIGEST_SIZE - dctx->bytes;
-			srclen -= GHASH_DIGEST_SIZE - dctx->bytes;
-			dctx->bytes = 0;
-		}
-		len = srclen & ~(GHASH_DIGEST_SIZE - 1);
-		if (len) {
-			preempt_disable();
-			pagefault_disable();
-			enable_kernel_vsx();
-			gcm_ghash_p8(dctx->shash, ctx->htable, src, len);
-			disable_kernel_vsx();
-			pagefault_enable();
-			preempt_enable();
-			src += len;
-			srclen -= len;
-		}
-		if (srclen) {
-			memcpy(dctx->buffer, src, srclen);
-			dctx->bytes = srclen;
+				srclen);
+			dctx->bytes += srclen;
+			return 0;
 		}
-		return 0;
+		memcpy(dctx->buffer + dctx->bytes, src,
+			GHASH_DIGEST_SIZE - dctx->bytes);
+
+		__ghash_block(ctx, dctx);
+
+		src += GHASH_DIGEST_SIZE - dctx->bytes;
+		srclen -= GHASH_DIGEST_SIZE - dctx->bytes;
+		dctx->bytes = 0;
+	}
+	len = srclen & ~(GHASH_DIGEST_SIZE - 1);
+	if (len) {
+		__ghash_blocks(ctx, dctx, src, len);
+		src += len;
+		srclen -= len;
 	}
+	if (srclen) {
+		memcpy(dctx->buffer, src, srclen);
+		dctx->bytes = srclen;
+	}
+	return 0;
 }
 
 static int p8_ghash_final(struct shash_desc *desc, u8 *out)
@@ -182,25 +156,14 @@ static int p8_ghash_final(struct shash_desc *desc, u8 *out)
 	struct p8_ghash_ctx *ctx = crypto_tfm_ctx(crypto_shash_tfm(desc->tfm));
 	struct p8_ghash_desc_ctx *dctx = shash_desc_ctx(desc);
 
-	if (IN_INTERRUPT) {
-		return crypto_shash_final(&dctx->fallback_desc, out);
-	} else {
-		if (dctx->bytes) {
-			for (i = dctx->bytes; i < GHASH_DIGEST_SIZE; i++)
-				dctx->buffer[i] = 0;
-			preempt_disable();
-			pagefault_disable();
-			enable_kernel_vsx();
-			gcm_ghash_p8(dctx->shash, ctx->htable,
-				     dctx->buffer, GHASH_DIGEST_SIZE);
-			disable_kernel_vsx();
-			pagefault_enable();
-			preempt_enable();
-			dctx->bytes = 0;
-		}
-		memcpy(out, dctx->shash, GHASH_DIGEST_SIZE);
-		return 0;
+	if (dctx->bytes) {
+		for (i = dctx->bytes; i < GHASH_DIGEST_SIZE; i++)
+			dctx->buffer[i] = 0;
+		__ghash_block(ctx, dctx);
+		dctx->bytes = 0;
 	}
+	memcpy(out, dctx->shash, GHASH_DIGEST_SIZE);
+	return 0;
 }
 
 struct shash_alg p8_ghash_alg = {
@@ -215,11 +178,9 @@ struct shash_alg p8_ghash_alg = {
 		 .cra_name = "ghash",
 		 .cra_driver_name = "p8_ghash",
 		 .cra_priority = 1000,
-		 .cra_flags = CRYPTO_ALG_TYPE_SHASH | CRYPTO_ALG_NEED_FALLBACK,
+		 .cra_flags = CRYPTO_ALG_TYPE_SHASH,
 		 .cra_blocksize = GHASH_BLOCK_SIZE,
 		 .cra_ctxsize = sizeof(struct p8_ghash_ctx),
 		 .cra_module = THIS_MODULE,
-		 .cra_init = p8_ghash_init_tfm,
-		 .cra_exit = p8_ghash_exit_tfm,
 	},
 };
-- 
2.19.1

