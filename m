Return-Path: <linuxppc-dev+bounces-6356-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 71869A3C754
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Feb 2025 19:24:37 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YylD22TT5z30TK;
	Thu, 20 Feb 2025 05:24:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=139.178.84.217
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1739989474;
	cv=none; b=kC2qyAVIoFzNe/RqHHCdd5H7nGMcug0N9mQa5UiwHiExHhe19XY4v5gC3fpKZntLfqzQxv+FUm48u8PTM8ZV0tFNk6w2anNAVzEyM3zJDRfIiqya+Gx2+2Yu7STL4JYchnt82GQNsHCw8/TXJezL/g8i5Fnl/fSgk4Ca+/fr5zMsoisS/bqAUSSrUzp/1aCQUcCrU8QT0WNdftkXk2JPESGZ78Pg3AJ9lW0qrexhgdrbKpiNwF6GwnsUEFMQB4sz4Xizj7XOS4BpZg8AWme7Ro5z2UzymyRFE5zUTi9xfo3XWckFCyIlo+E1eB41+iKJRWyx3absENs7iiszjtJ8MA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1739989474; c=relaxed/relaxed;
	bh=Tc+VeXjlTAwwrtnPlPEPhysS6dXeCJBQj/i87ILgP/c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=d7Q/KquEfUuJRlGdEz4J+uXLMEWGfDx/d6HZzqDWKDyfQM+l7DDhHWJNkm/yNj/cRLEnf079EVJA0BFHkjhKrkd3IScAElRuDpMGMFDoytbNTdztMIHp7tJtrwUiYSmsxJ2jv/SAa/AlqBgtJUgkZ0DwY7//BQAeQlM45G0DPftzYX/cs+qqfdvH5tnAR1txH5qcFzF5IVcmHn8/KCKG9UR6aSWHtyokM9ygRm6x4WGaoqQTonAkhTB2kGw7mU7N/ws6vbOQXLncotYRcZxZzTyh8g93zaPZKJdbYIYQYXF5knlRPkH4FmV2vphTQba3xTHNbVKCBQBVGn5YH2VPLQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=YfocSNg/; dkim-atps=neutral; spf=pass (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=YfocSNg/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YylD12VjWz2yFB
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Feb 2025 05:24:33 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id CEC915C5C45;
	Wed, 19 Feb 2025 18:23:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8ACC3C4CEE0;
	Wed, 19 Feb 2025 18:24:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739989469;
	bh=IweyEzHVugUZRfF2BC17ceLBJxhhb+nfKN/4JWYuPNo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YfocSNg/nuCK5LdQF7MglpbQVv42eWvN2zezEudFgrSUsQW4AbTtaROP1eL8CftyQ
	 nsG4zrsleyoIGoU+mFwHuYEGqBzFszKwi37PMutZj9o4uhDjZhZ2NiOv5skkbPqh6q
	 GXgtZl4SCb/ZJRaTj4CpL1Op0hPnK5TYR5P1oa/xrhCXGQzDWAnv+Nt8Mvqd1/Rmaw
	 CxPlSwUc6yZeIhrS/5BywE0/UQOB02wDVQ240Jy7YiscmC/P2jg0Adj7GmqyeopAbD
	 92YYQovjY2HnoD4jc9842Bay59Xx3GwSH4xFmBKocxfSGVTHlnpZLuJJtFcxiZ0Gay
	 sAGAlwX0Vhstw==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Naveen N Rao <naveen@kernel.org>,
	Nicholas Piggin <npiggin@gmail.com>,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 10/19] crypto: nx - use the new scatterwalk functions
Date: Wed, 19 Feb 2025 10:23:32 -0800
Message-ID: <20250219182341.43961-11-ebiggers@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250219182341.43961-1-ebiggers@kernel.org>
References: <20250219182341.43961-1-ebiggers@kernel.org>
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
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
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
 drivers/crypto/nx/nx-aes-ccm.c | 16 ++++++----------
 drivers/crypto/nx/nx-aes-gcm.c | 17 ++++++-----------
 drivers/crypto/nx/nx.c         | 31 +++++--------------------------
 drivers/crypto/nx/nx.h         |  3 ---
 4 files changed, 17 insertions(+), 50 deletions(-)

diff --git a/drivers/crypto/nx/nx-aes-ccm.c b/drivers/crypto/nx/nx-aes-ccm.c
index c843f4c6f684d..56a0b3a67c330 100644
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
index 4a796318b4306..b7fe2de96d962 100644
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
index 010e87d9da36b..dd95e5361d88c 100644
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
index 2697baebb6a35..e1b4b6927bec3 100644
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
2.48.1


