Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BB048757CB1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Jul 2023 15:03:35 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=XVg1yBaw;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R4zfF4kBdz3cf0
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Jul 2023 23:03:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=XVg1yBaw;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=ardb@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R4zYr4M4kz30g8
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Jul 2023 22:59:44 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 9281461524;
	Tue, 18 Jul 2023 12:59:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BC7FC433A9;
	Tue, 18 Jul 2023 12:59:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689685182;
	bh=WHwz9/IerLZuAMcdxeFxF/xnqkGa8Udt+0cnPybEFbA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=XVg1yBawcsOWEcOzZms+CEOR9fHPLE7HVa0+cg/25hWlk3oZGj4hCF9Y5VExy5iZ8
	 bAV3urUBiTlj231pQbsb8hWkRUHFZMnxwyoVx4IkyvMwwl455KuDE7mhvQ8cC+cjxV
	 771+ImPUjmwoPJg1jv2AKFNBoPwts+Qam+NJH+0QfHPezWDSB0lM2k4hCWHPhfJXSN
	 PUhBB2ppv3XF1L18IqbGeQqG3medjJxSo6D837YoLznf0mjS2FeozbcJKbUBz0sm23
	 MGM0LAwfArD9hnsadorqPiFYlUK3skwIMvl8aeYTD/y7t67X33AQ1uTRETr+dseedO
	 lvqIV6V5a7nwQ==
From: Ard Biesheuvel <ardb@kernel.org>
To: linux-crypto@vger.kernel.org
Subject: [RFC PATCH 03/21] crypto: acompress - Drop destination scatterlist allocation feature
Date: Tue, 18 Jul 2023 14:58:29 +0200
Message-Id: <20230718125847.3869700-4-ardb@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230718125847.3869700-1-ardb@kernel.org>
References: <20230718125847.3869700-1-ardb@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=6259; i=ardb@kernel.org; h=from:subject; bh=WHwz9/IerLZuAMcdxeFxF/xnqkGa8Udt+0cnPybEFbA=; b=owGbwMvMwCFmkMcZplerG8N4Wi2JIWVbT4GvRLH/LEkjV81tn2oObnkfxfv3ra95U7VM4jzxV 9sMlr7vKGVhEONgkBVTZBGY/ffdztMTpWqdZ8nCzGFlAhnCwMUpABNxOcnI0JNvE8/+bpmSW14M y44lsq9WHbTVEA5NsljuK5jAfTnOlJFh657yZdMNtxc8ClR4vf+ZnOr6jWGmb+QOJvypXbOvUWE VFwA=
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

The acomp crypto code will allocate a destination scatterlist and its
backing pages on the fly if no destination is passed. This feature is
not used, and given that the caller should own this memory, it is far
better if the caller allocates it. This is especially true for
decompression, where the output size is essentially unbounded, and so
the caller already needs to provide the size for this feature to work
reliably.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 crypto/acompress.c         |  6 ----
 crypto/scompress.c         | 14 +---------
 crypto/testmgr.c           | 29 --------------------
 include/crypto/acompress.h | 16 ++---------
 4 files changed, 4 insertions(+), 61 deletions(-)

diff --git a/crypto/acompress.c b/crypto/acompress.c
index 1c682810a484dcdf..431876b0ee2096fd 100644
--- a/crypto/acompress.c
+++ b/crypto/acompress.c
@@ -71,7 +71,6 @@ static int crypto_acomp_init_tfm(struct crypto_tfm *tfm)
 
 	acomp->compress = alg->compress;
 	acomp->decompress = alg->decompress;
-	acomp->dst_free = alg->dst_free;
 	acomp->reqsize = alg->reqsize;
 
 	if (alg->exit)
@@ -173,11 +172,6 @@ void acomp_request_free(struct acomp_req *req)
 	if (tfm->__crt_alg->cra_type != &crypto_acomp_type)
 		crypto_acomp_scomp_free_ctx(req);
 
-	if (req->flags & CRYPTO_ACOMP_ALLOC_OUTPUT) {
-		acomp->dst_free(req->dst);
-		req->dst = NULL;
-	}
-
 	__acomp_request_free(req);
 }
 EXPORT_SYMBOL_GPL(acomp_request_free);
diff --git a/crypto/scompress.c b/crypto/scompress.c
index 442a82c9de7def1f..3155cdce9116e092 100644
--- a/crypto/scompress.c
+++ b/crypto/scompress.c
@@ -122,12 +122,9 @@ static int scomp_acomp_comp_decomp(struct acomp_req *req, int dir)
 	if (!req->src || !req->slen || req->slen > SCOMP_SCRATCH_SIZE)
 		return -EINVAL;
 
-	if (req->dst && !req->dlen)
+	if (!req->dst || !req->dlen || req->dlen > SCOMP_SCRATCH_SIZE)
 		return -EINVAL;
 
-	if (!req->dlen || req->dlen > SCOMP_SCRATCH_SIZE)
-		req->dlen = SCOMP_SCRATCH_SIZE;
-
 	scratch = raw_cpu_ptr(&scomp_scratch);
 	spin_lock(&scratch->lock);
 
@@ -139,17 +136,9 @@ static int scomp_acomp_comp_decomp(struct acomp_req *req, int dir)
 		ret = crypto_scomp_decompress(scomp, scratch->src, req->slen,
 					      scratch->dst, &req->dlen, *ctx);
 	if (!ret) {
-		if (!req->dst) {
-			req->dst = sgl_alloc(req->dlen, GFP_ATOMIC, NULL);
-			if (!req->dst) {
-				ret = -ENOMEM;
-				goto out;
-			}
-		}
 		scatterwalk_map_and_copy(scratch->dst, req->dst, 0, req->dlen,
 					 1);
 	}
-out:
 	spin_unlock(&scratch->lock);
 	return ret;
 }
@@ -197,7 +186,6 @@ int crypto_init_scomp_ops_async(struct crypto_tfm *tfm)
 
 	crt->compress = scomp_acomp_compress;
 	crt->decompress = scomp_acomp_decompress;
-	crt->dst_free = sgl_free;
 	crt->reqsize = sizeof(void *);
 
 	return 0;
diff --git a/crypto/testmgr.c b/crypto/testmgr.c
index b41a8e8c1d1a1987..4971351f55dbabb9 100644
--- a/crypto/testmgr.c
+++ b/crypto/testmgr.c
@@ -3497,21 +3497,6 @@ static int test_acomp(struct crypto_acomp *tfm,
 			goto out;
 		}
 
-#ifdef CONFIG_CRYPTO_MANAGER_EXTRA_TESTS
-		crypto_init_wait(&wait);
-		sg_init_one(&src, input_vec, ilen);
-		acomp_request_set_params(req, &src, NULL, ilen, 0);
-
-		ret = crypto_wait_req(crypto_acomp_compress(req), &wait);
-		if (ret) {
-			pr_err("alg: acomp: compression failed on NULL dst buffer test %d for %s: ret=%d\n",
-			       i + 1, algo, -ret);
-			kfree(input_vec);
-			acomp_request_free(req);
-			goto out;
-		}
-#endif
-
 		kfree(input_vec);
 		acomp_request_free(req);
 	}
@@ -3573,20 +3558,6 @@ static int test_acomp(struct crypto_acomp *tfm,
 			goto out;
 		}
 
-#ifdef CONFIG_CRYPTO_MANAGER_EXTRA_TESTS
-		crypto_init_wait(&wait);
-		acomp_request_set_params(req, &src, NULL, ilen, 0);
-
-		ret = crypto_wait_req(crypto_acomp_decompress(req), &wait);
-		if (ret) {
-			pr_err("alg: acomp: decompression failed on NULL dst buffer test %d for %s: ret=%d\n",
-			       i + 1, algo, -ret);
-			kfree(input_vec);
-			acomp_request_free(req);
-			goto out;
-		}
-#endif
-
 		kfree(input_vec);
 		acomp_request_free(req);
 	}
diff --git a/include/crypto/acompress.h b/include/crypto/acompress.h
index 574cffc90730f5f3..ccb6f3279bc8b32e 100644
--- a/include/crypto/acompress.h
+++ b/include/crypto/acompress.h
@@ -43,15 +43,12 @@ struct acomp_req {
  *
  * @compress:		Function performs a compress operation
  * @decompress:		Function performs a de-compress operation
- * @dst_free:		Frees destination buffer if allocated inside the
- *			algorithm
  * @reqsize:		Context size for (de)compression requests
  * @base:		Common crypto API algorithm data structure
  */
 struct crypto_acomp {
 	int (*compress)(struct acomp_req *req);
 	int (*decompress)(struct acomp_req *req);
-	void (*dst_free)(struct scatterlist *dst);
 	unsigned int reqsize;
 	struct crypto_tfm base;
 };
@@ -222,8 +219,7 @@ static inline void acomp_request_set_callback(struct acomp_req *req,
 {
 	req->base.complete = cmpl;
 	req->base.data = data;
-	req->base.flags &= CRYPTO_ACOMP_ALLOC_OUTPUT;
-	req->base.flags |= flgs & ~CRYPTO_ACOMP_ALLOC_OUTPUT;
+	req->base.flags = flgs;
 }
 
 /**
@@ -233,11 +229,9 @@ static inline void acomp_request_set_callback(struct acomp_req *req,
  *
  * @req:	asynchronous compress request
  * @src:	pointer to input buffer scatterlist
- * @dst:	pointer to output buffer scatterlist. If this is NULL, the
- *		acomp layer will allocate the output memory
+ * @dst:	pointer to output buffer scatterlist
  * @slen:	size of the input buffer
- * @dlen:	size of the output buffer. If dst is NULL, this can be used by
- *		the user to specify the maximum amount of memory to allocate
+ * @dlen:	size of the output buffer
  */
 static inline void acomp_request_set_params(struct acomp_req *req,
 					    struct scatterlist *src,
@@ -249,10 +243,6 @@ static inline void acomp_request_set_params(struct acomp_req *req,
 	req->dst = dst;
 	req->slen = slen;
 	req->dlen = dlen;
-
-	req->flags &= ~CRYPTO_ACOMP_ALLOC_OUTPUT;
-	if (!req->dst)
-		req->flags |= CRYPTO_ACOMP_ALLOC_OUTPUT;
 }
 
 static inline struct crypto_istat_compress *comp_get_stat(
-- 
2.39.2

