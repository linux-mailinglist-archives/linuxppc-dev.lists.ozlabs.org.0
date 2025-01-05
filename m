Return-Path: <linuxppc-dev+bounces-4674-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 105A2A01B70
	for <lists+linuxppc-dev@lfdr.de>; Sun,  5 Jan 2025 20:21:37 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YR6cX1WXJz2yL0;
	Mon,  6 Jan 2025 06:21:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736104892;
	cv=none; b=FYBTuyMywiFUGGEKtZZLO9438NB0kl82mI4gfYR8c//FN5XN/bA5kuQ7jRjletAF5RZ2QUa4Q5B6o7j5MlzQ/sFWbTTJmiPI3pzdYdzsHTv/UisH3BmHzt9H4b8GxJDmbb0LPw3M8gUMZolx9/RdrrzEb50l+cgzw2xl+CtdzdW1bJfY3X7iB5Nsx+IEaRccnuhUhX/1D9PEZ3KGCIkV9YsMsa76ecsjzi51zY/2EpDLtm2Yi19gAqqPcPEWCZUqGnGWNRPEIACZFfG3dROurtFu4ZPOrhEtQGlKjG+f8/mqmeVEk6FG9k9xClT75LtTpjfEvx85t1MqT1KMmue2vA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736104892; c=relaxed/relaxed;
	bh=H7eBiQI9lIAxG/dN+Aw/ufsnvpWxT342cNPq/u5cYXE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ARHxxXyANLcx+PpriCtpG3akx2FKpA24wa1kAkChDStfyMhATGqvrX31Q8WRfi0smEd5BDx65Nb9wr5zAsc7Jo5VbjkZvL22lgXbxM9IK2tD0L88G0/I5stibdwR6K2/gIQv1nDRDDMnU7ql1Kh9g/1RM0IzJbDx3/Nv7GhUcFTmxaaS5u21xr0uZv7XaeK1lsfpoU36A8tSrQ/39OkOmND/kFNeTzDhzqSUdfraeax/C7mgce0MpFogamTMT1HIz709JzG0rdlYrWtcqSklrB8aoyEYdiKKc5KJgtpUcIH9CjTCCzJMeXSDo8KWKUjtdhqxbJuCBPRnGExXtbCB8g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Ef+5CRUD; dkim-atps=neutral; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Ef+5CRUD;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YR6cV5YYrz2xr4
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 Jan 2025 06:21:30 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 34C37A40B5B;
	Sun,  5 Jan 2025 19:19:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94256C4CED0;
	Sun,  5 Jan 2025 19:21:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736104883;
	bh=Ui7IP2Y8Ot5SeE3bpeVS9SLWPY7zGqsAyHDmSDNQjUY=;
	h=From:To:Cc:Subject:Date:From;
	b=Ef+5CRUDBX1sVIG1LRy0sX5H5p++a8k8WX4mvsL9oKH4nG4qPHL8HZMAFIpg2xZGA
	 Y+s66F9S41XCqrGIcNe9g+lnkp/tjue//GczN/8BVrdi2kG5WvpUh60fkfZ+hSQZjc
	 jz6KYN/mc9dCXM3/RbMLDb32bBNDFV4W82wFtOUdAKPO5/KyqPZq0r3FtfkIcgVPRs
	 IKy2Z6/Gu8N6wVCrl4EaKlw3Lun9exkEhJXYbwo4P95v+bKbQt+P0crW5Q16evgWps
	 IWvWjPHGYD7oWqAd0PU62PzASwGlb4Ldz4SV2kZ+ElsGefQJWC5vvuwqpkiBbzr7xQ
	 A46SvJygMG1CQ==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
	Danny Tsen <dtsen@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Naveen N Rao <naveen@kernel.org>,
	Nicholas Piggin <npiggin@gmail.com>,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3] crypto: powerpc/p10-aes-gcm - simplify handling of linear associated data
Date: Sun,  5 Jan 2025 11:21:10 -0800
Message-ID: <20250105192110.34634-1-ebiggers@kernel.org>
X-Mailer: git-send-email 2.47.1
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

p10_aes_gcm_crypt() is abusing the scatter_walk API to get the virtual
address for the first source scatterlist element.  But this code is only
built for PPC64 which is a !HIGHMEM platform, and it can read past a
page boundary from the address returned by scatterwalk_map() which means
it already assumes the address is from the kernel's direct map.  Thus,
just use sg_virt() instead to get the same result in a simpler way.

Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Danny Tsen <dtsen@linux.ibm.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Naveen N Rao <naveen@kernel.org>
Cc: Nicholas Piggin <npiggin@gmail.com>
Cc: linuxppc-dev@lists.ozlabs.org
Signed-off-by: Eric Biggers <ebiggers@google.com>
---

v3: don't check for NULL before calling kfree(),
    and resent this patch as a standalone patch.

 arch/powerpc/crypto/aes-gcm-p10-glue.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/arch/powerpc/crypto/aes-gcm-p10-glue.c b/arch/powerpc/crypto/aes-gcm-p10-glue.c
index f37b3d13fc53..679f52794baf 100644
--- a/arch/powerpc/crypto/aes-gcm-p10-glue.c
+++ b/arch/powerpc/crypto/aes-gcm-p10-glue.c
@@ -212,11 +212,10 @@ static int p10_aes_gcm_crypt(struct aead_request *req, u8 *riv,
 	struct p10_aes_gcm_ctx *ctx = crypto_tfm_ctx(tfm);
 	u8 databuf[sizeof(struct gcm_ctx) + PPC_ALIGN];
 	struct gcm_ctx *gctx = PTR_ALIGN((void *)databuf, PPC_ALIGN);
 	u8 hashbuf[sizeof(struct Hash_ctx) + PPC_ALIGN];
 	struct Hash_ctx *hash = PTR_ALIGN((void *)hashbuf, PPC_ALIGN);
-	struct scatter_walk assoc_sg_walk;
 	struct skcipher_walk walk;
 	u8 *assocmem = NULL;
 	u8 *assoc;
 	unsigned int cryptlen = req->cryptlen;
 	unsigned char ivbuf[AES_BLOCK_SIZE+PPC_ALIGN];
@@ -232,12 +231,11 @@ static int p10_aes_gcm_crypt(struct aead_request *req, u8 *riv,
 	memset(ivbuf, 0, sizeof(ivbuf));
 	memcpy(iv, riv, GCM_IV_SIZE);
 
 	/* Linearize assoc, if not already linear */
 	if (req->src->length >= assoclen && req->src->length) {
-		scatterwalk_start(&assoc_sg_walk, req->src);
-		assoc = scatterwalk_map(&assoc_sg_walk);
+		assoc = sg_virt(req->src); /* ppc64 is !HIGHMEM */
 	} else {
 		gfp_t flags = (req->base.flags & CRYPTO_TFM_REQ_MAY_SLEEP) ?
 			      GFP_KERNEL : GFP_ATOMIC;
 
 		/* assoc can be any length, so must be on heap */
@@ -251,14 +249,11 @@ static int p10_aes_gcm_crypt(struct aead_request *req, u8 *riv,
 
 	vsx_begin();
 	gcmp10_init(gctx, iv, (unsigned char *) &ctx->enc_key, hash, assoc, assoclen);
 	vsx_end();
 
-	if (!assocmem)
-		scatterwalk_unmap(assoc);
-	else
-		kfree(assocmem);
+	kfree(assocmem);
 
 	if (enc)
 		ret = skcipher_walk_aead_encrypt(&walk, req, false);
 	else
 		ret = skcipher_walk_aead_decrypt(&walk, req, false);

base-commit: 7fa4817340161a34d5b4ca39e96d6318d37c1d3a
-- 
2.47.1


