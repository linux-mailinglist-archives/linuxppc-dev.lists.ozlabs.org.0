Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B6AF757C9F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Jul 2023 15:02:46 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=RgCzMfR0;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R4zdJ0T4rz3bcH
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Jul 2023 23:02:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=RgCzMfR0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=ardb@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R4zYl238bz30QQ
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Jul 2023 22:59:39 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 8ED1561584;
	Tue, 18 Jul 2023 12:59:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B75E8C433CC;
	Tue, 18 Jul 2023 12:59:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689685177;
	bh=BS2Ua6/n3aRqHPKMRJPp1FC8GaVv/4XUY13WakgdGDM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RgCzMfR05aIkDbyJZ3v/jXT/fviiQZB2WL0HlKLdZ4sg5V0R/fE/lUqu82nfd7qpN
	 UANpWAUnlun6C/kpE/QWca78r8cJK7ojHoQAKJKyy+kaggJ5keW8p4PcAd61l71hfq
	 JJ7I47gAh9oWPl9Y9OtEIhWeuksqE1q2hDHMEaQqXNAY+RrC80jcfLvj0hI/7AfJeZ
	 ZYwvtjyiQeYzkNu8upMwjdi+LVIkXNrK2hbxk+liKDQ0jB6nZ6QFZbF9E5ooNxhH4n
	 Xc6N6OZiNFU7rUgVHoeU6a1nbH6cx3vTpy2iH//B0r420Gtt4NambJWq4UEiTP0uNk
	 0MdGXxD+mU1mQ==
From: Ard Biesheuvel <ardb@kernel.org>
To: linux-crypto@vger.kernel.org
Subject: [RFC PATCH 02/21] crypto: qat - Drop support for allocating destination buffers
Date: Tue, 18 Jul 2023 14:58:28 +0200
Message-Id: <20230718125847.3869700-3-ardb@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230718125847.3869700-1-ardb@kernel.org>
References: <20230718125847.3869700-1-ardb@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=11060; i=ardb@kernel.org; h=from:subject; bh=BS2Ua6/n3aRqHPKMRJPp1FC8GaVv/4XUY13WakgdGDM=; b=owGbwMvMwCFmkMcZplerG8N4Wi2JIWVbT96r2IhF982thO7eM4hpfHDv5oL6pSXKwrN+hXcss TISWBvSUcrCIMbBICumyCIw+++7nacnStU6z5KFmcPKBDKEgYtTACaiZMLI0Pqy54KULl/kEvfI G4/zCxTNnNZtCqxIn7RT+6z1nqtiqgz/VOQ2v11z/gN7dcS829UH9/4/2T5v0+6kq9erbh3KfGn lzg0A
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

Remove the logic that allocates the destination scatterlist and backing
pages on the fly when no destination is provided: this is a rather
dubious proposition, given that the caller is in a far better position
to estimate the size of such a buffer, or how it should be allocated.

This feature has no current users, so let's remove it while we still
can.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 drivers/crypto/intel/qat/qat_common/qat_bl.c        | 159 --------------------
 drivers/crypto/intel/qat/qat_common/qat_bl.h        |   6 -
 drivers/crypto/intel/qat/qat_common/qat_comp_algs.c |  86 +----------
 drivers/crypto/intel/qat/qat_common/qat_comp_req.h  |  10 --
 4 files changed, 1 insertion(+), 260 deletions(-)

diff --git a/drivers/crypto/intel/qat/qat_common/qat_bl.c b/drivers/crypto/intel/qat/qat_common/qat_bl.c
index 76baed0a76c0ee93..94f6a5fe0f3dea75 100644
--- a/drivers/crypto/intel/qat/qat_common/qat_bl.c
+++ b/drivers/crypto/intel/qat/qat_common/qat_bl.c
@@ -249,162 +249,3 @@ int qat_bl_sgl_to_bufl(struct adf_accel_dev *accel_dev,
 				    extra_dst_buff, sz_extra_dst_buff,
 				    sskip, dskip, flags);
 }
-
-static void qat_bl_sgl_unmap(struct adf_accel_dev *accel_dev,
-			     struct qat_alg_buf_list *bl)
-{
-	struct device *dev = &GET_DEV(accel_dev);
-	int n = bl->num_bufs;
-	int i;
-
-	for (i = 0; i < n; i++)
-		if (!dma_mapping_error(dev, bl->buffers[i].addr))
-			dma_unmap_single(dev, bl->buffers[i].addr,
-					 bl->buffers[i].len, DMA_FROM_DEVICE);
-}
-
-static int qat_bl_sgl_map(struct adf_accel_dev *accel_dev,
-			  struct scatterlist *sgl,
-			  struct qat_alg_buf_list **bl)
-{
-	struct device *dev = &GET_DEV(accel_dev);
-	struct qat_alg_buf_list *bufl;
-	int node = dev_to_node(dev);
-	struct scatterlist *sg;
-	int n, i, sg_nctr;
-	size_t sz;
-
-	n = sg_nents(sgl);
-	sz = struct_size(bufl, buffers, n);
-	bufl = kzalloc_node(sz, GFP_KERNEL, node);
-	if (unlikely(!bufl))
-		return -ENOMEM;
-
-	for (i = 0; i < n; i++)
-		bufl->buffers[i].addr = DMA_MAPPING_ERROR;
-
-	sg_nctr = 0;
-	for_each_sg(sgl, sg, n, i) {
-		int y = sg_nctr;
-
-		if (!sg->length)
-			continue;
-
-		bufl->buffers[y].addr = dma_map_single(dev, sg_virt(sg),
-						       sg->length,
-						       DMA_FROM_DEVICE);
-		bufl->buffers[y].len = sg->length;
-		if (unlikely(dma_mapping_error(dev, bufl->buffers[y].addr)))
-			goto err_map;
-		sg_nctr++;
-	}
-	bufl->num_bufs = sg_nctr;
-	bufl->num_mapped_bufs = sg_nctr;
-
-	*bl = bufl;
-
-	return 0;
-
-err_map:
-	for (i = 0; i < n; i++)
-		if (!dma_mapping_error(dev, bufl->buffers[i].addr))
-			dma_unmap_single(dev, bufl->buffers[i].addr,
-					 bufl->buffers[i].len,
-					 DMA_FROM_DEVICE);
-	kfree(bufl);
-	*bl = NULL;
-
-	return -ENOMEM;
-}
-
-static void qat_bl_sgl_free_unmap(struct adf_accel_dev *accel_dev,
-				  struct scatterlist *sgl,
-				  struct qat_alg_buf_list *bl,
-				  bool free_bl)
-{
-	if (bl) {
-		qat_bl_sgl_unmap(accel_dev, bl);
-
-		if (free_bl)
-			kfree(bl);
-	}
-	if (sgl)
-		sgl_free(sgl);
-}
-
-static int qat_bl_sgl_alloc_map(struct adf_accel_dev *accel_dev,
-				struct scatterlist **sgl,
-				struct qat_alg_buf_list **bl,
-				unsigned int dlen,
-				gfp_t gfp)
-{
-	struct scatterlist *dst;
-	int ret;
-
-	dst = sgl_alloc(dlen, gfp, NULL);
-	if (!dst) {
-		dev_err(&GET_DEV(accel_dev), "sg_alloc failed\n");
-		return -ENOMEM;
-	}
-
-	ret = qat_bl_sgl_map(accel_dev, dst, bl);
-	if (ret)
-		goto err;
-
-	*sgl = dst;
-
-	return 0;
-
-err:
-	sgl_free(dst);
-	*sgl = NULL;
-	return ret;
-}
-
-int qat_bl_realloc_map_new_dst(struct adf_accel_dev *accel_dev,
-			       struct scatterlist **sg,
-			       unsigned int dlen,
-			       struct qat_request_buffs *qat_bufs,
-			       gfp_t gfp)
-{
-	struct device *dev = &GET_DEV(accel_dev);
-	dma_addr_t new_blp = DMA_MAPPING_ERROR;
-	struct qat_alg_buf_list *new_bl;
-	struct scatterlist *new_sg;
-	size_t new_bl_size;
-	int ret;
-
-	ret = qat_bl_sgl_alloc_map(accel_dev, &new_sg, &new_bl, dlen, gfp);
-	if (ret)
-		return ret;
-
-	new_bl_size = struct_size(new_bl, buffers, new_bl->num_bufs);
-
-	/* Map new firmware SGL descriptor */
-	new_blp = dma_map_single(dev, new_bl, new_bl_size, DMA_TO_DEVICE);
-	if (unlikely(dma_mapping_error(dev, new_blp)))
-		goto err;
-
-	/* Unmap old firmware SGL descriptor */
-	dma_unmap_single(dev, qat_bufs->bloutp, qat_bufs->sz_out, DMA_TO_DEVICE);
-
-	/* Free and unmap old scatterlist */
-	qat_bl_sgl_free_unmap(accel_dev, *sg, qat_bufs->blout,
-			      !qat_bufs->sgl_dst_valid);
-
-	qat_bufs->sgl_dst_valid = false;
-	qat_bufs->blout = new_bl;
-	qat_bufs->bloutp = new_blp;
-	qat_bufs->sz_out = new_bl_size;
-
-	*sg = new_sg;
-
-	return 0;
-err:
-	qat_bl_sgl_free_unmap(accel_dev, new_sg, new_bl, true);
-
-	if (!dma_mapping_error(dev, new_blp))
-		dma_unmap_single(dev, new_blp, new_bl_size, DMA_TO_DEVICE);
-
-	return -ENOMEM;
-}
diff --git a/drivers/crypto/intel/qat/qat_common/qat_bl.h b/drivers/crypto/intel/qat/qat_common/qat_bl.h
index d87e4f35ac395c76..a508d795113116c0 100644
--- a/drivers/crypto/intel/qat/qat_common/qat_bl.h
+++ b/drivers/crypto/intel/qat/qat_common/qat_bl.h
@@ -60,10 +60,4 @@ static inline gfp_t qat_algs_alloc_flags(struct crypto_async_request *req)
 	return req->flags & CRYPTO_TFM_REQ_MAY_SLEEP ? GFP_KERNEL : GFP_ATOMIC;
 }
 
-int qat_bl_realloc_map_new_dst(struct adf_accel_dev *accel_dev,
-			       struct scatterlist **newd,
-			       unsigned int dlen,
-			       struct qat_request_buffs *qat_bufs,
-			       gfp_t gfp);
-
 #endif
diff --git a/drivers/crypto/intel/qat/qat_common/qat_comp_algs.c b/drivers/crypto/intel/qat/qat_common/qat_comp_algs.c
index b533984906ece67a..09e00037b0165793 100644
--- a/drivers/crypto/intel/qat/qat_common/qat_comp_algs.c
+++ b/drivers/crypto/intel/qat/qat_common/qat_comp_algs.c
@@ -38,11 +38,6 @@ struct qat_compression_ctx {
 	int (*qat_comp_callback)(struct qat_compression_req *qat_req, void *resp);
 };
 
-struct qat_dst {
-	bool is_null;
-	int resubmitted;
-};
-
 struct qat_compression_req {
 	u8 req[QAT_COMP_REQ_SIZE];
 	struct qat_compression_ctx *qat_compression_ctx;
@@ -51,8 +46,6 @@ struct qat_compression_req {
 	enum direction dir;
 	int actual_dlen;
 	struct qat_alg_req alg_req;
-	struct work_struct resubmit;
-	struct qat_dst dst;
 };
 
 static int qat_alg_send_dc_message(struct qat_compression_req *qat_req,
@@ -69,46 +62,6 @@ static int qat_alg_send_dc_message(struct qat_compression_req *qat_req,
 	return qat_alg_send_message(alg_req);
 }
 
-static void qat_comp_resubmit(struct work_struct *work)
-{
-	struct qat_compression_req *qat_req =
-		container_of(work, struct qat_compression_req, resubmit);
-	struct qat_compression_ctx *ctx = qat_req->qat_compression_ctx;
-	struct adf_accel_dev *accel_dev = ctx->inst->accel_dev;
-	struct qat_request_buffs *qat_bufs = &qat_req->buf;
-	struct qat_compression_instance *inst = ctx->inst;
-	struct acomp_req *areq = qat_req->acompress_req;
-	struct crypto_acomp *tfm = crypto_acomp_reqtfm(areq);
-	unsigned int dlen = CRYPTO_ACOMP_DST_MAX;
-	u8 *req = qat_req->req;
-	dma_addr_t dfbuf;
-	int ret;
-
-	areq->dlen = dlen;
-
-	dev_dbg(&GET_DEV(accel_dev), "[%s][%s] retry NULL dst request - dlen = %d\n",
-		crypto_tfm_alg_driver_name(crypto_acomp_tfm(tfm)),
-		qat_req->dir == COMPRESSION ? "comp" : "decomp", dlen);
-
-	ret = qat_bl_realloc_map_new_dst(accel_dev, &areq->dst, dlen, qat_bufs,
-					 qat_algs_alloc_flags(&areq->base));
-	if (ret)
-		goto err;
-
-	qat_req->dst.resubmitted = true;
-
-	dfbuf = qat_req->buf.bloutp;
-	qat_comp_override_dst(req, dfbuf, dlen);
-
-	ret = qat_alg_send_dc_message(qat_req, inst, &areq->base);
-	if (ret != -ENOSPC)
-		return;
-
-err:
-	qat_bl_free_bufl(accel_dev, qat_bufs);
-	acomp_request_complete(areq, ret);
-}
-
 static int parse_zlib_header(u16 zlib_h)
 {
 	int ret = -EINVAL;
@@ -203,21 +156,6 @@ static void qat_comp_generic_callback(struct qat_compression_req *qat_req,
 
 	areq->dlen = 0;
 
-	if (qat_req->dir == DECOMPRESSION && qat_req->dst.is_null) {
-		if (cmp_err == ERR_CODE_OVERFLOW_ERROR) {
-			if (qat_req->dst.resubmitted) {
-				dev_dbg(&GET_DEV(accel_dev),
-					"Output does not fit destination buffer\n");
-				res = -EOVERFLOW;
-				goto end;
-			}
-
-			INIT_WORK(&qat_req->resubmit, qat_comp_resubmit);
-			adf_misc_wq_queue_work(&qat_req->resubmit);
-			return;
-		}
-	}
-
 	if (unlikely(status != ICP_QAT_FW_COMN_STATUS_FLAG_OK))
 		goto end;
 
@@ -329,29 +267,9 @@ static int qat_comp_alg_compress_decompress(struct acomp_req *areq, enum directi
 	if (!areq->src || !slen)
 		return -EINVAL;
 
-	if (areq->dst && !dlen)
+	if (!areq->dst || !dlen)
 		return -EINVAL;
 
-	qat_req->dst.is_null = false;
-
-	/* Handle acomp requests that require the allocation of a destination
-	 * buffer. The size of the destination buffer is double the source
-	 * buffer (rounded up to the size of a page) to fit the decompressed
-	 * output or an expansion on the data for compression.
-	 */
-	if (!areq->dst) {
-		qat_req->dst.is_null = true;
-
-		dlen = round_up(2 * slen, PAGE_SIZE);
-		areq->dst = sgl_alloc(dlen, f, NULL);
-		if (!areq->dst)
-			return -ENOMEM;
-
-		dlen -= dhdr + dftr;
-		areq->dlen = dlen;
-		qat_req->dst.resubmitted = false;
-	}
-
 	if (dir == COMPRESSION) {
 		params.extra_dst_buff = inst->dc_data->ovf_buff_p;
 		ovf_buff_sz = inst->dc_data->ovf_buff_sz;
@@ -450,7 +368,6 @@ static struct acomp_alg qat_acomp[] = { {
 	.exit = qat_comp_alg_exit_tfm,
 	.compress = qat_comp_alg_compress,
 	.decompress = qat_comp_alg_decompress,
-	.dst_free = sgl_free,
 	.reqsize = sizeof(struct qat_compression_req),
 }, {
 	.base = {
@@ -465,7 +382,6 @@ static struct acomp_alg qat_acomp[] = { {
 	.exit = qat_comp_alg_exit_tfm,
 	.compress = qat_comp_alg_rfc1950_compress,
 	.decompress = qat_comp_alg_rfc1950_decompress,
-	.dst_free = sgl_free,
 	.reqsize = sizeof(struct qat_compression_req),
 } };
 
diff --git a/drivers/crypto/intel/qat/qat_common/qat_comp_req.h b/drivers/crypto/intel/qat/qat_common/qat_comp_req.h
index 404e32c5e77838df..18a1f33a6db98e8c 100644
--- a/drivers/crypto/intel/qat/qat_common/qat_comp_req.h
+++ b/drivers/crypto/intel/qat/qat_common/qat_comp_req.h
@@ -25,16 +25,6 @@ static inline void qat_comp_create_req(void *ctx, void *req, u64 src, u32 slen,
 	req_pars->out_buffer_sz = dlen;
 }
 
-static inline void qat_comp_override_dst(void *req, u64 dst, u32 dlen)
-{
-	struct icp_qat_fw_comp_req *fw_req = req;
-	struct icp_qat_fw_comp_req_params *req_pars = &fw_req->comp_pars;
-
-	fw_req->comn_mid.dest_data_addr = dst;
-	fw_req->comn_mid.dst_length = dlen;
-	req_pars->out_buffer_sz = dlen;
-}
-
 static inline void qat_comp_create_compression_req(void *ctx, void *req,
 						   u64 src, u32 slen,
 						   u64 dst, u32 dlen,
-- 
2.39.2

