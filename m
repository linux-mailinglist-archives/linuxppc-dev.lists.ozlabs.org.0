Return-Path: <linuxppc-dev+bounces-4511-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C0C2E9FE120
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Dec 2024 01:16:22 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YLxTp6X4sz2yWK;
	Mon, 30 Dec 2024 11:16:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1735517774;
	cv=none; b=nvRMrr6ZSnIEYa6ykqpG+JkDZtAo1YHtGxkJYAeqAeTqa72v1kmP8EMZJguNNXS/xGrKGJ90CR6dM8aZu23Kw9//e+9Kt7bpqbHyJJuY2qXOzbqQfwX9t9r4lCWMSgviB7xfPOv+49KY5lSv5RNJKtpPz5sZqX4tGxEh63yUVqnNxRDHqcZh3XX3XvPVYkeIC1jV76eRJszoqZxu8Jj+o7igctPT1ZRMlAwIpM1zO16L1S3tgCkpauItDrs3XJH4V5+8PQlKuyzH9/f2BbmJmXnBgi+tsOAWpp4798CbWyopdek/6uPbFGZD/ptGLM7LMqG4kMR2eFN5MdWL67uMPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1735517774; c=relaxed/relaxed;
	bh=yTe15Tj8VEIjbN08d1F8wK0WLROao4ZYg0eN8rBybW8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OtkcwFSFaKXUaavnR/l1ER2O5QNVce7rBNk5X0f6NGuBFF0jnl+52OWNn/Jb+49skoEF1P68AxKg87vRne1+0xH6AdOQjBz3AE3X5C9mIEJSkHpUCIgiZZz7AGw4az9xVxmM/Tsr+5ju6795gAIRbdp25qWgJwni3zKC/oCBrzaIuTuFosk8mIx+5lXQRzO8S6bziuUooPxmomWt3ykiHen1Vkri/rLYNp6nTE8GwVDMb7nkyv8KI92X37P8oMQ3tPyI512s9m1x4dd4Hkj46sFeKMhM0bSWyOdziSCTcT8mPGbX41BkkZzmze/806DA17y/e2MRjtAgw/Wd7BkDPw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=T/UvuFwR; dkim-atps=neutral; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=T/UvuFwR;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YLxTn0Tp7z2xLR
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Dec 2024 11:16:12 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 8F5F0A4056B;
	Mon, 30 Dec 2024 00:14:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89B7FC4CEDD;
	Mon, 30 Dec 2024 00:16:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735517765;
	bh=FDzNrJCoVdAmqgX/rTeMmUPgE6IOzOA1GEP6JN6T8HU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=T/UvuFwRWdKLULyZldooFldhH+tu37W6X22cmGB8QkaaVYdGUqE2vErdBb3LOEZO/
	 gZ7fJYbPzIF/smtDRzJE7n1NbbUqOI921yjPfm8iNWjQRA2hPN9l65SIy7+fvftSDT
	 JempkVhxX8ZqgZ+D3JV9BMUUqPPu3rnxwgkJQ3idcCGc7mAa6af3GogSRr6269qD0F
	 7gFNFvUU5uEllXPOgUP8xIIqaJeJLfa+6v+SnZV81TKv/RQrSQ/RYCAV5wwt2i3OvS
	 wpvZamcvU+Wez3NStN+LB8Q5H7TF9CqVwwuPQ6d3G+FC6cijFylUrNdOxJvuYyzWOn
	 gx68h5vs9jGAg==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Naveen N Rao <naveen@kernel.org>,
	Nicholas Piggin <npiggin@gmail.com>,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 20/29] crypto: nx - use the new scatterwalk functions
Date: Sun, 29 Dec 2024 16:14:09 -0800
Message-ID: <20241230001418.74739-21-ebiggers@kernel.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241230001418.74739-1-ebiggers@kernel.org>
References: <20241230001418.74739-1-ebiggers@kernel.org>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

From: Eric Biggers <ebiggers@google.com>

- In nx_walk_and_build(), use scatterwalk_start_at_pos() instead of a
  more complex way to achieve the same result.

- Also in nx_walk_and_build(), use the new functions scatterwalk_next()
  which consolidates scatterwalk_clamp() and scatterwalk_map(), and use
  scatterwalk_done_src() which consolidates scatterwalk_unmap(),
  scatterwalk_advance(), and scatterwalk_done().  Remove unnecessary
  code that seemed to be intended to advance to the next sg entry, which
  is already handled by the scatterwalk functions.

  Note that nx_walk_and_build() does not actually read or write the
  mapped virtual address, and thus it is misusing the scatter_walk API.
  It really should just access the scatterlist directly.  This patch
  does not try to address this existing issue.

- In nx_gca(), use memcpy_from_sglist() instead of a more complex way to
  achieve the same result.

- In various functions, replace calls to scatterwalk_map_and_copy() with
  memcpy_from_sglist() or memcpy_to_sglist() as appropriate.  Note that
  this eliminates the confusing 'out' argument (which this driver had
  tried to work around by defining the missing constants for it...)

Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Naveen N Rao <naveen@kernel.org>
Cc: Nicholas Piggin <npiggin@gmail.com>
Cc: linuxppc-dev@lists.ozlabs.org
Signed-off-by: Eric Biggers <ebiggers@google.com>
---

This patch is part of a long series touching many files, so I have
limited the Cc list on the full series.  If you want the full series and
did not receive it, please retrieve it from lore.kernel.org.

 drivers/crypto/nx/nx-aes-ccm.c | 16 ++++++----------
 drivers/crypto/nx/nx-aes-gcm.c | 17 ++++++-----------
 drivers/crypto/nx/nx.c         | 31 +++++--------------------------
 drivers/crypto/nx/nx.h         |  3 ---
 4 files changed, 17 insertions(+), 50 deletions(-)

diff --git a/drivers/crypto/nx/nx-aes-ccm.c b/drivers/crypto/nx/nx-aes-ccm.c
index c843f4c6f684..56a0b3a67c33 100644
--- a/drivers/crypto/nx/nx-aes-ccm.c
+++ b/drivers/crypto/nx/nx-aes-ccm.c
@@ -215,17 +215,15 @@ static int generate_pat(u8                   *iv,
 	 */
 	if (b1) {
 		memset(b1, 0, 16);
 		if (assoclen <= 65280) {
 			*(u16 *)b1 = assoclen;
-			scatterwalk_map_and_copy(b1 + 2, req->src, 0,
-					 iauth_len, SCATTERWALK_FROM_SG);
+			memcpy_from_sglist(b1 + 2, req->src, 0, iauth_len);
 		} else {
 			*(u16 *)b1 = (u16)(0xfffe);
 			*(u32 *)&b1[2] = assoclen;
-			scatterwalk_map_and_copy(b1 + 6, req->src, 0,
-					 iauth_len, SCATTERWALK_FROM_SG);
+			memcpy_from_sglist(b1 + 6, req->src, 0, iauth_len);
 		}
 	}
 
 	/* now copy any remaining AAD to scatterlist and call nx... */
 	if (!assoclen) {
@@ -339,13 +337,12 @@ static int ccm_nx_decrypt(struct aead_request   *req,
 	spin_lock_irqsave(&nx_ctx->lock, irq_flags);
 
 	nbytes -= authsize;
 
 	/* copy out the auth tag to compare with later */
-	scatterwalk_map_and_copy(priv->oauth_tag,
-				 req->src, nbytes + req->assoclen, authsize,
-				 SCATTERWALK_FROM_SG);
+	memcpy_from_sglist(priv->oauth_tag, req->src, nbytes + req->assoclen,
+			   authsize);
 
 	rc = generate_pat(iv, req, nx_ctx, authsize, nbytes, assoclen,
 			  csbcpb->cpb.aes_ccm.in_pat_or_b0);
 	if (rc)
 		goto out;
@@ -463,13 +460,12 @@ static int ccm_nx_encrypt(struct aead_request   *req,
 		processed += to_process;
 
 	} while (processed < nbytes);
 
 	/* copy out the auth tag */
-	scatterwalk_map_and_copy(csbcpb->cpb.aes_ccm.out_pat_or_mac,
-				 req->dst, nbytes + req->assoclen, authsize,
-				 SCATTERWALK_TO_SG);
+	memcpy_to_sglist(req->dst, nbytes + req->assoclen,
+			 csbcpb->cpb.aes_ccm.out_pat_or_mac, authsize);
 
 out:
 	spin_unlock_irqrestore(&nx_ctx->lock, irq_flags);
 	return rc;
 }
diff --git a/drivers/crypto/nx/nx-aes-gcm.c b/drivers/crypto/nx/nx-aes-gcm.c
index 4a796318b430..b7fe2de96d96 100644
--- a/drivers/crypto/nx/nx-aes-gcm.c
+++ b/drivers/crypto/nx/nx-aes-gcm.c
@@ -101,20 +101,17 @@ static int nx_gca(struct nx_crypto_ctx  *nx_ctx,
 		  u8                    *out,
 		  unsigned int assoclen)
 {
 	int rc;
 	struct nx_csbcpb *csbcpb_aead = nx_ctx->csbcpb_aead;
-	struct scatter_walk walk;
 	struct nx_sg *nx_sg = nx_ctx->in_sg;
 	unsigned int nbytes = assoclen;
 	unsigned int processed = 0, to_process;
 	unsigned int max_sg_len;
 
 	if (nbytes <= AES_BLOCK_SIZE) {
-		scatterwalk_start(&walk, req->src);
-		scatterwalk_copychunks(out, &walk, nbytes, SCATTERWALK_FROM_SG);
-		scatterwalk_done(&walk, SCATTERWALK_FROM_SG, 0);
+		memcpy_from_sglist(out, req->src, 0, nbytes);
 		return 0;
 	}
 
 	NX_CPB_FDM(csbcpb_aead) &= ~NX_FDM_CONTINUATION;
 
@@ -389,23 +386,21 @@ static int gcm_aes_nx_crypt(struct aead_request *req, int enc,
 	} while (processed < nbytes);
 
 mac:
 	if (enc) {
 		/* copy out the auth tag */
-		scatterwalk_map_and_copy(
-			csbcpb->cpb.aes_gcm.out_pat_or_mac,
+		memcpy_to_sglist(
 			req->dst, req->assoclen + nbytes,
-			crypto_aead_authsize(crypto_aead_reqtfm(req)),
-			SCATTERWALK_TO_SG);
+			csbcpb->cpb.aes_gcm.out_pat_or_mac,
+			crypto_aead_authsize(crypto_aead_reqtfm(req)));
 	} else {
 		u8 *itag = nx_ctx->priv.gcm.iauth_tag;
 		u8 *otag = csbcpb->cpb.aes_gcm.out_pat_or_mac;
 
-		scatterwalk_map_and_copy(
+		memcpy_from_sglist(
 			itag, req->src, req->assoclen + nbytes,
-			crypto_aead_authsize(crypto_aead_reqtfm(req)),
-			SCATTERWALK_FROM_SG);
+			crypto_aead_authsize(crypto_aead_reqtfm(req)));
 		rc = crypto_memneq(itag, otag,
 			    crypto_aead_authsize(crypto_aead_reqtfm(req))) ?
 		     -EBADMSG : 0;
 	}
 out:
diff --git a/drivers/crypto/nx/nx.c b/drivers/crypto/nx/nx.c
index 010e87d9da36..dd95e5361d88 100644
--- a/drivers/crypto/nx/nx.c
+++ b/drivers/crypto/nx/nx.c
@@ -151,44 +151,23 @@ struct nx_sg *nx_walk_and_build(struct nx_sg       *nx_dst,
 				unsigned int        start,
 				unsigned int       *src_len)
 {
 	struct scatter_walk walk;
 	struct nx_sg *nx_sg = nx_dst;
-	unsigned int n, offset = 0, len = *src_len;
+	unsigned int n, len = *src_len;
 	char *dst;
 
 	/* we need to fast forward through @start bytes first */
-	for (;;) {
-		scatterwalk_start(&walk, sg_src);
-
-		if (start < offset + sg_src->length)
-			break;
-
-		offset += sg_src->length;
-		sg_src = sg_next(sg_src);
-	}
-
-	/* start - offset is the number of bytes to advance in the scatterlist
-	 * element we're currently looking at */
-	scatterwalk_advance(&walk, start - offset);
+	scatterwalk_start_at_pos(&walk, sg_src, start);
 
 	while (len && (nx_sg - nx_dst) < sglen) {
-		n = scatterwalk_clamp(&walk, len);
-		if (!n) {
-			/* In cases where we have scatterlist chain sg_next
-			 * handles with it properly */
-			scatterwalk_start(&walk, sg_next(walk.sg));
-			n = scatterwalk_clamp(&walk, len);
-		}
-		dst = scatterwalk_map(&walk);
+		dst = scatterwalk_next(&walk, len, &n);
 
 		nx_sg = nx_build_sg_list(nx_sg, dst, &n, sglen - (nx_sg - nx_dst));
-		len -= n;
 
-		scatterwalk_unmap(dst);
-		scatterwalk_advance(&walk, n);
-		scatterwalk_done(&walk, SCATTERWALK_FROM_SG, len);
+		scatterwalk_done_src(&walk, dst, n);
+		len -= n;
 	}
 	/* update to_process */
 	*src_len -= len;
 
 	/* return the moved destination pointer */
diff --git a/drivers/crypto/nx/nx.h b/drivers/crypto/nx/nx.h
index 2697baebb6a3..e1b4b6927bec 100644
--- a/drivers/crypto/nx/nx.h
+++ b/drivers/crypto/nx/nx.h
@@ -187,9 +187,6 @@ extern struct shash_alg nx_shash_aes_xcbc_alg;
 extern struct shash_alg nx_shash_sha512_alg;
 extern struct shash_alg nx_shash_sha256_alg;
 
 extern struct nx_crypto_driver nx_driver;
 
-#define SCATTERWALK_TO_SG	1
-#define SCATTERWALK_FROM_SG	0
-
 #endif
-- 
2.47.1


