Return-Path: <linuxppc-dev+bounces-4374-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C08C9F9F6D
	for <lists+linuxppc-dev@lfdr.de>; Sat, 21 Dec 2024 10:11:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YFdnk3X4Rz2xxx;
	Sat, 21 Dec 2024 20:11:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:4641:c500::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1734772298;
	cv=none; b=BlxeRYxI2DK9hSoMof8UAjAFb4XDVpRO0F60YhNx55YMtFSBO0GnJqLB6aSoAbN7lnrcK0x4B0Ef1L3V0oCjS1JJnc7Z6tP4D/BplJIOKsidVfn2+H+InstSHIKXOTPm+3LCdj0ktkgtBsEJzMpbidYrUGrRwbFk+1LRC5Hnxh6sgseHZKvx7SBsvtiEqdNOD1uN5zIg351pAE1HAbDL3w6KRjHOpVvcNeBnFnhHdARJYeky1w33HKiWenIZNe35e1/TKL3CN1gHZ4ACjtMyYsZuaip94nuoNe2+0Okujyd2gjmGa0xKliumTQPS8hAeiCAbfDDt6bjQek+7GjLOpg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1734772298; c=relaxed/relaxed;
	bh=n3Oqy2HnsAwjo/67lpbMhC1uBHPyoFQW18MsBRyX60U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jKySoxG091zKPoU4I3LFt01HGanZn4cqQTj0fcV05ahxYh3GAg546u2wcuCPK1tXVIAXLNe1Q1a8qN2umYkygSevrTtLMNfJy5251rqUy5gQ3M+k0icUW/nREVLLccYfwCuR528qHwJkyf4+WWA/FNLpHbvEi391DkC+21W1lcPgVAlljz9VkiLVtu81tJ6T6ivScBPA598CwVUIFF+63jPNBsRGAfzqDOuUnARUpMHnpGIsvVku6xVjVC95hb70DKjy3FHii5KhNQgvv8Ga7XuNqBAKU2aPAwZW8s2UamxhfAT61GcKDqGuxFunOuel+r52QFP+hzwpbq21Z5cu/w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=lPCAlzTL; dkim-atps=neutral; spf=pass (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=lPCAlzTL;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YFdnj2R8gz2xs8
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 21 Dec 2024 20:11:37 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4A2A05C477D;
	Sat, 21 Dec 2024 09:10:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AAB71C4CED6;
	Sat, 21 Dec 2024 09:11:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734772292;
	bh=l3mcIF8SEtYBua+ussMVqyNpUvcPBoNrQm89sO2KshY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lPCAlzTLn/W65gAW/TitVUHpbJl+s+1DDEg/itXgrgIkSwyK2j4ddjr34saeXx/Lo
	 lhiPqNp/rwMt/PuOq4DrFrzKO2Y0cHTvxoB3QleRaAyw9l35Fp5ggbouBmOcPbMFEr
	 5QHdMaH2wivdWqDtMSn0r6aMQZWnCD3ldtBTcJcQoPQoUKeqdx4QtfcXCvXP4Dh8M7
	 JaewEW5EiNRJaB4i+W9BXWx8VggIvG+In98ebpKQOSihl5m9IPIElTH4bcepP+2MzR
	 yXljeZIySVQlendyQl2f5FtTZNctAjsmX3+2nK/EGGs0NwVOOV0jemWqYL1DIxf/bp
	 sbjl51d9JMjZQ==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
	Danny Tsen <dtsen@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Naveen N Rao <naveen@kernel.org>,
	Nicholas Piggin <npiggin@gmail.com>,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 10/29] crypto: powerpc/p10-aes-gcm - simplify handling of linear associated data
Date: Sat, 21 Dec 2024 01:10:37 -0800
Message-ID: <20241221091056.282098-11-ebiggers@kernel.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241221091056.282098-1-ebiggers@kernel.org>
References: <20241221091056.282098-1-ebiggers@kernel.org>
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


