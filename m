Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C80A6757CCB
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Jul 2023 15:07:56 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=OMfSi7Ja;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R4zlG52qQz3dgv
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Jul 2023 23:07:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=OMfSi7Ja;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=ardb@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R4zZJ1fM5z3bhc
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Jul 2023 23:00:08 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 7D84661564;
	Tue, 18 Jul 2023 13:00:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F638C433BA;
	Tue, 18 Jul 2023 13:00:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689685205;
	bh=HLeFyJ4elCj3PCL9yLBCWDNmAFSWQ5owIJ4uPCtQ01k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OMfSi7JaG1YgRbUikTp3RAVi+Puki10pCCv8NwIZLWavXOZf6b4agoSF+ANT7jNJQ
	 HLAtXQ1aZc/Ei0giEfw/ZT3RcJvlGFkW78TpT3ssf2SlDn05nXIx19TRkfJBfkUwcs
	 87PJDlORbs1yZa9BcKBJ4Erj/ijUF6EmO/RSsbnZ//OjjBmSffcwniPjYY8PuWiZ7K
	 V+F+QviT7E6XGan7Hdy+Jerd0CBKfnhdpBJskCVBUSFyHo5ab77GAXdN12sHC/Yb2N
	 hmwNU2UduqiIB9vy/g/U/nmQAClPnYlWcEwe0VstBbYhwY8xh1kvPXWP1/mPVKmVKd
	 Fa6yaBd2neVWw==
From: Ard Biesheuvel <ardb@kernel.org>
To: linux-crypto@vger.kernel.org
Subject: [RFC PATCH 08/21] zram: Migrate to acomp compression API
Date: Tue, 18 Jul 2023 14:58:34 +0200
Message-Id: <20230718125847.3869700-9-ardb@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230718125847.3869700-1-ardb@kernel.org>
References: <20230718125847.3869700-1-ardb@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=7420; i=ardb@kernel.org; h=from:subject; bh=HLeFyJ4elCj3PCL9yLBCWDNmAFSWQ5owIJ4uPCtQ01k=; b=owGbwMvMwCFmkMcZplerG8N4Wi2JIWVbT1lzFrfwnBaubR80rMSmhzH4mEd/+tWaebdMaWGc6 PEPYYodpSwMYhwMsmKKLAKz/77beXqiVK3zLFmYOaxMIEMYuDgFYCJtrgx/JU//YA5SlbsX3VyV 9UKuKPXdprvf2Wfe6PgiqvNoY0ddNcP/4pYzux/JJOdkW3nw1ew5bbfjd8r3G3/7vjqedOud7aT GAwA=
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

Switch from the deprecated 'comp' to the more recent 'acomp' API.

This involves using scatterlists and request objects to describe the in-
and output buffers, all of which happen to be contiguous in memory, and
reside either entirely in lowmem, or inside a single highmem page. This
makes the conversion quite straight-forward, and easy to back by either
a software or a hardware implementation.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 drivers/block/zram/zcomp.c    | 67 +++++++++++++++-----
 drivers/block/zram/zcomp.h    |  7 +-
 drivers/block/zram/zram_drv.c | 12 +---
 3 files changed, 57 insertions(+), 29 deletions(-)

diff --git a/drivers/block/zram/zcomp.c b/drivers/block/zram/zcomp.c
index 55af4efd79835666..12bdd288a153c455 100644
--- a/drivers/block/zram/zcomp.c
+++ b/drivers/block/zram/zcomp.c
@@ -11,6 +11,9 @@
 #include <linux/sched.h>
 #include <linux/cpu.h>
 #include <linux/crypto.h>
+#include <linux/highmem.h>
+#include <linux/scatterlist.h>
+#include <crypto/acompress.h>
 
 #include "zcomp.h"
 
@@ -35,26 +38,32 @@ static const char * const backends[] = {
 
 static void zcomp_strm_free(struct zcomp_strm *zstrm)
 {
+	if (zstrm->req)
+		acomp_request_free(zstrm->req);
 	if (!IS_ERR_OR_NULL(zstrm->tfm))
-		crypto_free_comp(zstrm->tfm);
+		crypto_free_acomp(zstrm->tfm);
 	free_pages((unsigned long)zstrm->buffer, 1);
+	zstrm->req = NULL;
 	zstrm->tfm = NULL;
 	zstrm->buffer = NULL;
 }
 
 /*
- * Initialize zcomp_strm structure with ->tfm initialized by backend, and
- * ->buffer. Return a negative value on error.
+ * Initialize zcomp_strm structure with ->tfm and ->req initialized by
+ * backend, and ->buffer. Return a negative value on error.
  */
 static int zcomp_strm_init(struct zcomp_strm *zstrm, struct zcomp *comp)
 {
-	zstrm->tfm = crypto_alloc_comp(comp->name, 0, 0);
+	zstrm->tfm = crypto_alloc_acomp(comp->name, 0, CRYPTO_ALG_ASYNC);
+	if (!IS_ERR_OR_NULL(zstrm->tfm))
+		zstrm->req = acomp_request_alloc(zstrm->tfm);
+
 	/*
 	 * allocate 2 pages. 1 for compressed data, plus 1 extra for the
 	 * case when compressed size is larger than the original one
 	 */
 	zstrm->buffer = (void *)__get_free_pages(GFP_KERNEL | __GFP_ZERO, 1);
-	if (IS_ERR_OR_NULL(zstrm->tfm) || !zstrm->buffer) {
+	if (IS_ERR_OR_NULL(zstrm->tfm) || !zstrm->req || !zstrm->buffer) {
 		zcomp_strm_free(zstrm);
 		return -ENOMEM;
 	}
@@ -70,7 +79,7 @@ bool zcomp_available_algorithm(const char *comp)
 	 * This also means that we permit zcomp initialisation
 	 * with any compressing algorithm known to crypto api.
 	 */
-	return crypto_has_comp(comp, 0, 0) == 1;
+	return crypto_has_acomp(comp, 0, CRYPTO_ALG_ASYNC);
 }
 
 /* show available compressors */
@@ -95,7 +104,7 @@ ssize_t zcomp_available_show(const char *comp, char *buf)
 	 * Out-of-tree module known to crypto api or a missing
 	 * entry in `backends'.
 	 */
-	if (!known_algorithm && crypto_has_comp(comp, 0, 0) == 1)
+	if (!known_algorithm && crypto_has_acomp(comp, 0, CRYPTO_ALG_ASYNC))
 		sz += scnprintf(buf + sz, PAGE_SIZE - sz - 2,
 				"[%s] ", comp);
 
@@ -115,8 +124,14 @@ void zcomp_stream_put(struct zcomp *comp)
 }
 
 int zcomp_compress(struct zcomp_strm *zstrm,
-		const void *src, unsigned int *dst_len)
+		   struct page *src, unsigned int *dst_len)
 {
+	struct scatterlist sg_src, sg_dst;
+	int ret;
+
+	sg_init_table(&sg_src, 1);
+	sg_set_page(&sg_src, src, PAGE_SIZE, 0);
+
 	/*
 	 * Our dst memory (zstrm->buffer) is always `2 * PAGE_SIZE' sized
 	 * because sometimes we can endup having a bigger compressed data
@@ -131,21 +146,39 @@ int zcomp_compress(struct zcomp_strm *zstrm,
 	 * the dst buffer, zram_drv will take care of the fact that
 	 * compressed buffer is too big.
 	 */
-	*dst_len = PAGE_SIZE * 2;
+	sg_init_one(&sg_dst, zstrm->buffer, PAGE_SIZE * 2);
 
-	return crypto_comp_compress(zstrm->tfm,
-			src, PAGE_SIZE,
-			zstrm->buffer, dst_len);
+	acomp_request_set_params(zstrm->req, &sg_src, &sg_dst, PAGE_SIZE,
+				 PAGE_SIZE * 2);
+
+	ret = crypto_acomp_compress(zstrm->req);
+	if (ret)
+		return ret;
+
+	*dst_len = zstrm->req->dlen;
+	return 0;
 }
 
 int zcomp_decompress(struct zcomp_strm *zstrm,
-		const void *src, unsigned int src_len, void *dst)
+		     const void *src, unsigned int src_len, struct page *dst)
 {
-	unsigned int dst_len = PAGE_SIZE;
+	struct scatterlist sg_src, sg_dst;
 
-	return crypto_comp_decompress(zstrm->tfm,
-			src, src_len,
-			dst, &dst_len);
+	if (is_kmap_addr(src)) {
+		sg_init_table(&sg_src, 1);
+		sg_set_page(&sg_src, kmap_to_page((void *)src), src_len,
+			    offset_in_page(src));
+	} else {
+		sg_init_one(&sg_src, src, src_len);
+	}
+
+	sg_init_table(&sg_dst, 1);
+	sg_set_page(&sg_dst, dst, PAGE_SIZE, 0);
+
+	acomp_request_set_params(zstrm->req, &sg_src, &sg_dst, src_len,
+				 PAGE_SIZE);
+
+	return crypto_acomp_decompress(zstrm->req);
 }
 
 int zcomp_cpu_up_prepare(unsigned int cpu, struct hlist_node *node)
diff --git a/drivers/block/zram/zcomp.h b/drivers/block/zram/zcomp.h
index cdefdef93da8c00d..32b9c4ae2d6dd9bf 100644
--- a/drivers/block/zram/zcomp.h
+++ b/drivers/block/zram/zcomp.h
@@ -12,7 +12,8 @@ struct zcomp_strm {
 	local_lock_t lock;
 	/* compression/decompression buffer */
 	void *buffer;
-	struct crypto_comp *tfm;
+	struct crypto_acomp *tfm;
+	struct acomp_req *req;
 };
 
 /* dynamic per-device compression frontend */
@@ -34,10 +35,10 @@ struct zcomp_strm *zcomp_stream_get(struct zcomp *comp);
 void zcomp_stream_put(struct zcomp *comp);
 
 int zcomp_compress(struct zcomp_strm *zstrm,
-		const void *src, unsigned int *dst_len);
+		   struct page *src, unsigned int *dst_len);
 
 int zcomp_decompress(struct zcomp_strm *zstrm,
-		const void *src, unsigned int src_len, void *dst);
+		     const void *src, unsigned int src_len, struct page *dst);
 
 bool zcomp_set_max_streams(struct zcomp *comp, int num_strm);
 #endif /* _ZCOMP_H_ */
diff --git a/drivers/block/zram/zram_drv.c b/drivers/block/zram/zram_drv.c
index 5676e6dd5b1672a8..ac24f5d955e3c16d 100644
--- a/drivers/block/zram/zram_drv.c
+++ b/drivers/block/zram/zram_drv.c
@@ -1345,9 +1345,7 @@ static int zram_read_from_zspool(struct zram *zram, struct page *page,
 		kunmap_atomic(dst);
 		ret = 0;
 	} else {
-		dst = kmap_atomic(page);
-		ret = zcomp_decompress(zstrm, src, size, dst);
-		kunmap_atomic(dst);
+		ret = zcomp_decompress(zstrm, src, size, page);
 		zcomp_stream_put(zram->comps[prio]);
 	}
 	zs_unmap_object(zram->mem_pool, handle);
@@ -1432,9 +1430,7 @@ static int zram_write_page(struct zram *zram, struct page *page, u32 index)
 
 compress_again:
 	zstrm = zcomp_stream_get(zram->comps[ZRAM_PRIMARY_COMP]);
-	src = kmap_atomic(page);
-	ret = zcomp_compress(zstrm, src, &comp_len);
-	kunmap_atomic(src);
+	ret = zcomp_compress(zstrm, page, &comp_len);
 
 	if (unlikely(ret)) {
 		zcomp_stream_put(zram->comps[ZRAM_PRIMARY_COMP]);
@@ -1618,9 +1614,7 @@ static int zram_recompress(struct zram *zram, u32 index, struct page *page,
 
 		num_recomps++;
 		zstrm = zcomp_stream_get(zram->comps[prio]);
-		src = kmap_atomic(page);
-		ret = zcomp_compress(zstrm, src, &comp_len_new);
-		kunmap_atomic(src);
+		ret = zcomp_compress(zstrm, page, &comp_len_new);
 
 		if (ret) {
 			zcomp_stream_put(zram->comps[prio]);
-- 
2.39.2

