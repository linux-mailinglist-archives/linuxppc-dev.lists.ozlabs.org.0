Return-Path: <linuxppc-dev+bounces-4510-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EAD49FE11E
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Dec 2024 01:16:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YLxTl1q6rz2yVD;
	Mon, 30 Dec 2024 11:16:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=139.178.84.217
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1735517771;
	cv=none; b=W0DYkgUkLf9EjyaNAypZNDrQOSITbejGOKG+J4ipFNVUehEk/f/H8opYi/Jf1h3bq8ogySewcC7d/gaZpkDJ/qPlrldz0pssc4UUnAq/gsRRm93/RZLNxKG9l8zd4UYZ5ICy5w6EzUmd622a6AvOiSafNTiSJ6OdoDO4vemeo8vb9fSoIrfiWmC3B+Xxb4kZHPfZFE5kRaLKhhc3wN1Al0H7EQTKN06r4VFrmwLy4dcyfEF1awXPSpp+2NtstRnBjVFN0fWGXUeOMIf0PQ+9tlOI86C/ds2RefsAzdpTa6AgOloVOPE3DyD7FQ3kcmJvAB9ECcf9c0oZbI6Lk7g6nw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1735517771; c=relaxed/relaxed;
	bh=n3Oqy2HnsAwjo/67lpbMhC1uBHPyoFQW18MsBRyX60U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=V3c49UjirO/2/mzABkfuzX8h1f24Ks8XR64PA0eGFtl2tJR2mtWavKPOdurHgl/l04ywtjYYGYSQY8IVRtpsuQPt2WFEoaqFjr4MoNinrnSYVBmipkbsRkN9G5bwaxRGByUgtLSTVbpXGmv0UhdOwuqd+RGdPJs0RGjIyxADZ5mmyFgPR9KM1zJ3AEopo6Z2oZjHeXtHgB4sUSkpvzq3gLhjiYzo8JXHSK+jtlMVQREyPBXL+pT+0DCIn8PuCS730nRAhs6GNNY9Qm8Facr898DK+qZWmz21dwKy3RsroGnfxVrCDpyN1lIpdyvdWs51U3RHXwucwOFqeYfyCdpzZA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=O5il+uw4; dkim-atps=neutral; spf=pass (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=O5il+uw4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YLxTf1G9Jz2xLR
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Dec 2024 11:16:06 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E94FF5C5618;
	Mon, 30 Dec 2024 00:15:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3560C4CEE1;
	Mon, 30 Dec 2024 00:16:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735517762;
	bh=l3mcIF8SEtYBua+ussMVqyNpUvcPBoNrQm89sO2KshY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=O5il+uw47yUf4bNQKXq32psvRn/OjXkiWSchhO7EH6YLcHiQWhfzIVuy2natJvgp3
	 coB7MaqzMUG6J7buiQVoj5N/OY8tkKYlmOXu5jF8SiHshrlMngtjET2Ep0xcwH4K+T
	 hcsuUbcDsZHW43Rw7UlkwXRvKFsEQ44k/RMVggp8D42zCvK34maSXPPf+NnMdKQDE+
	 f+61fYWvEW9BxwsGNqpK5feRzlwLXjtMFv7upZE5CIXw3nYJ0egqn+Zzl+pOmC28x6
	 Urz2j59NsldJo5BjW3a94bf5OSSPryQ03rKqfh5pG4OxZdLUQE/tj7SQukbbY7vqIb
	 vM4xU3YqhtSHQ==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Danny Tsen <dtsen@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Naveen N Rao <naveen@kernel.org>,
	Nicholas Piggin <npiggin@gmail.com>,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 10/29] crypto: powerpc/p10-aes-gcm - simplify handling of linear associated data
Date: Sun, 29 Dec 2024 16:13:59 -0800
Message-ID: <20241230001418.74739-11-ebiggers@kernel.org>
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
X-Spam-Status: No, score=-5.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
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

This patch is part of a long series touching many files, so I have
limited the Cc list on the full series.  If you want the full series and
did not receive it, please retrieve it from lore.kernel.org.

 arch/powerpc/crypto/aes-gcm-p10-glue.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/arch/powerpc/crypto/aes-gcm-p10-glue.c b/arch/powerpc/crypto/aes-gcm-p10-glue.c
index f37b3d13fc53..2862c3cf8e41 100644
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
@@ -251,13 +249,11 @@ static int p10_aes_gcm_crypt(struct aead_request *req, u8 *riv,
 
 	vsx_begin();
 	gcmp10_init(gctx, iv, (unsigned char *) &ctx->enc_key, hash, assoc, assoclen);
 	vsx_end();
 
-	if (!assocmem)
-		scatterwalk_unmap(assoc);
-	else
+	if (assocmem)
 		kfree(assocmem);
 
 	if (enc)
 		ret = skcipher_walk_aead_encrypt(&walk, req, false);
 	else
-- 
2.47.1


