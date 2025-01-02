Return-Path: <linuxppc-dev+bounces-4569-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 52B839FFCB3
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Jan 2025 18:24:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YPD9J3S5qz2yVX;
	Fri,  3 Jan 2025 04:24:52 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1735838692;
	cv=none; b=ArkXI49tQvpqzddnZMHpNFofoI3mENFz5OexVIUs1GkTnokkRUWXAezAcHjYDjEWqgAWbfwm9kIGVKM72Jf4lTgV0jggyvZdfEDcuSpcbAqEWa+UgFQyj0qaImFnAR+ohMysn+bj3+Llxx7MyyFcS5Ftdrnxn9oLHzsO6Z6w+T09+TJ1lV1/ep/zS1QhQojxeUceT3eUGNhp+ZSVxsapgMMOjOtj5OKRXSxd9002Oh+LEDpHK5CxQAFbt8a1AimcugGK1SxOZpUplpeuGZjfPWUQOsb81uiyghSHa2AES3uHN1trtaBqj4lTCFuyxSuJB9GnDWZFDqlgYtysC+PZ9g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1735838692; c=relaxed/relaxed;
	bh=t1iXlsnsDe4bz1PnJhtN2ZjAG9ZaocmO4wo7p4W6M0g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bWF93nqgz4fT+OWGUDIjdaXpRLonSKoLxPyc8Rg5I1NT0UPpExGmmVkedmmu3K46H9jZhkKZn9JaGas2ZONJPMvwEys6pdJRe/ppXovVEX8ExXsOsuTEY/L7yo1qIWSP3fBRPzzsbGQXoMjJ5qkfBLzEBB463uhPVbrGDFUouvCw0BAe7sdb+0QTrTtds21ncjy6C7m/5lyfMm1oqDoitIujyn4tKEXNG92/I/WrxYF8zMbDTrxGShwI+zPALxuaoMFszx8M+TR8VauOxnmegpcA1xyiY0K+3bf66Nv/LpIZzXwsLv+tJ4CIuiU4LM23ene/4scGKi1ReR2LEujCoA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=AjRfdJPc; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=AjRfdJPc;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YPD9H1L3lz2yN3
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Jan 2025 04:24:51 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 7F8B9A40B4C;
	Thu,  2 Jan 2025 17:22:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40F20C4CED0;
	Thu,  2 Jan 2025 17:24:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735838686;
	bh=dhAKobW2Sn3UJxdMEMFF+/VJXFN/vgYVY2Kdus9Irc8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AjRfdJPcjYi4nv0p4ONg/pmLvQ/6q9hbqdWm92KbRtJ9C0henHMq2lTFg21M9Gnj6
	 ZfWQYaJb+Ay0/MZaZj92C1BZjLCJJJBLqIBPrljMgam2Kl/6ViYf1/FSbzyW/3gkMV
	 H1wZBaskVXi2fJk+Cg8LoKdnuWwHsPN2Kl1oyhI14dKva46zqIFRLFHK6L2Vj7gTJE
	 QIIbI4uMo7HX6jCu/Ml/LePfxEpEic9/8kIfjwHNgMPBvnKlpB6hdo8JQppL3VA0Hl
	 A04pidWhCcnL3sMGhq0ThkAC5Y2Ksi62eqIo0dwKPxHqTNl1mHNPU82llGLsmFqg+x
	 B+kCaSt9e2EnA==
Date: Thu, 2 Jan 2025 17:24:44 +0000
From: Eric Biggers <ebiggers@kernel.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: linux-crypto@vger.kernel.org, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, Danny Tsen <dtsen@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Naveen N Rao <naveen@kernel.org>,
	Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v2 10/29] crypto: powerpc/p10-aes-gcm - simplify handling
 of linear associated data
Message-ID: <20250102172444.GB49952@google.com>
References: <20241230001418.74739-1-ebiggers@kernel.org>
 <20241230001418.74739-11-ebiggers@kernel.org>
 <ec3515f1-f93a-4520-a9da-6ad14f9a6fe0@csgroup.eu>
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
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ec3515f1-f93a-4520-a9da-6ad14f9a6fe0@csgroup.eu>
X-Spam-Status: No, score=-2.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Thu, Jan 02, 2025 at 12:50:50PM +0100, Christophe Leroy wrote:
> 
> 
> Le 30/12/2024 à 01:13, Eric Biggers a écrit :
> > From: Eric Biggers <ebiggers@google.com>
> > 
> > p10_aes_gcm_crypt() is abusing the scatter_walk API to get the virtual
> > address for the first source scatterlist element.  But this code is only
> > built for PPC64 which is a !HIGHMEM platform, and it can read past a
> > page boundary from the address returned by scatterwalk_map() which means
> > it already assumes the address is from the kernel's direct map.  Thus,
> > just use sg_virt() instead to get the same result in a simpler way.
> > 
> > Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
> > Cc: Danny Tsen <dtsen@linux.ibm.com>
> > Cc: Michael Ellerman <mpe@ellerman.id.au>
> > Cc: Naveen N Rao <naveen@kernel.org>
> > Cc: Nicholas Piggin <npiggin@gmail.com>
> > Cc: linuxppc-dev@lists.ozlabs.org
> > Signed-off-by: Eric Biggers <ebiggers@google.com>
> > ---
> > 
> > This patch is part of a long series touching many files, so I have
> > limited the Cc list on the full series.  If you want the full series and
> > did not receive it, please retrieve it from lore.kernel.org.
> > 
> >   arch/powerpc/crypto/aes-gcm-p10-glue.c | 8 ++------
> >   1 file changed, 2 insertions(+), 6 deletions(-)
> > 
> > diff --git a/arch/powerpc/crypto/aes-gcm-p10-glue.c b/arch/powerpc/crypto/aes-gcm-p10-glue.c
> > index f37b3d13fc53..2862c3cf8e41 100644
> > --- a/arch/powerpc/crypto/aes-gcm-p10-glue.c
> > +++ b/arch/powerpc/crypto/aes-gcm-p10-glue.c
> > @@ -212,11 +212,10 @@ static int p10_aes_gcm_crypt(struct aead_request *req, u8 *riv,
> >   	struct p10_aes_gcm_ctx *ctx = crypto_tfm_ctx(tfm);
> >   	u8 databuf[sizeof(struct gcm_ctx) + PPC_ALIGN];
> >   	struct gcm_ctx *gctx = PTR_ALIGN((void *)databuf, PPC_ALIGN);
> >   	u8 hashbuf[sizeof(struct Hash_ctx) + PPC_ALIGN];
> >   	struct Hash_ctx *hash = PTR_ALIGN((void *)hashbuf, PPC_ALIGN);
> > -	struct scatter_walk assoc_sg_walk;
> >   	struct skcipher_walk walk;
> >   	u8 *assocmem = NULL;
> >   	u8 *assoc;
> >   	unsigned int cryptlen = req->cryptlen;
> >   	unsigned char ivbuf[AES_BLOCK_SIZE+PPC_ALIGN];
> > @@ -232,12 +231,11 @@ static int p10_aes_gcm_crypt(struct aead_request *req, u8 *riv,
> >   	memset(ivbuf, 0, sizeof(ivbuf));
> >   	memcpy(iv, riv, GCM_IV_SIZE);
> >   	/* Linearize assoc, if not already linear */
> >   	if (req->src->length >= assoclen && req->src->length) {
> > -		scatterwalk_start(&assoc_sg_walk, req->src);
> > -		assoc = scatterwalk_map(&assoc_sg_walk);
> > +		assoc = sg_virt(req->src); /* ppc64 is !HIGHMEM */
> >   	} else {
> >   		gfp_t flags = (req->base.flags & CRYPTO_TFM_REQ_MAY_SLEEP) ?
> >   			      GFP_KERNEL : GFP_ATOMIC;
> >   		/* assoc can be any length, so must be on heap */
> > @@ -251,13 +249,11 @@ static int p10_aes_gcm_crypt(struct aead_request *req, u8 *riv,
> >   	vsx_begin();
> >   	gcmp10_init(gctx, iv, (unsigned char *) &ctx->enc_key, hash, assoc, assoclen);
> >   	vsx_end();
> > -	if (!assocmem)
> > -		scatterwalk_unmap(assoc);
> > -	else
> > +	if (assocmem)
> >   		kfree(assocmem);
> 
> kfree() accepts a NULL pointer, you can call kfree(assocmem) without 'if
> (assocmem)'

The existing code did that too, but sure I'll change that in v3.

- Eric

