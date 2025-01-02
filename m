Return-Path: <linuxppc-dev+bounces-4564-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 24AD99FF94D
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Jan 2025 13:20:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YP5Pg4Vnzz2xgX;
	Thu,  2 Jan 2025 23:20:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1735820407;
	cv=none; b=RoovccSjW8YZsUDi/+gcjyp7JS8cVpprsPyGftUur/m9ZLIAOdR2yOpTKd0Uw6yatQMej+Gkbb/jzPy3Cz7+6La1mdV6ZrHvbJk6PnPDDNzZEG6xlFPoKjp7u1HQudFJt5Inwt/Q0CighhX5jzHQAiKJaqfAOoni60mVK3bg3J//yzSewzg/FkxjoTDbsQB/68yE34X+1MP7ieCU+a49hSgnobqntLwTHVYdGmuqKjFJaPL6s/VtDrZ/jMaj662mIzwRbagJJPd1UNmo2hu5aQjDi4VB8hWkFqRhneNDiIhAMfhm4Cg7DbIm2XTY5A5Hvz6FyancyNICk485QSUTiA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1735820407; c=relaxed/relaxed;
	bh=s85hPu6J7AIWOJKhu5vOpGVwEvzA+6SU7SbnAn6T72I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=T1DtAeUa3H2NrXDscLOHDzdqERWO6aTZU7vEqS4TWquVIK/F0JDbwNy6gIQJo3bxm0aqirgT4Z/pBP6wolKjQFGs9F3cHUtg+0kluzmzO/ZWAB9CinzrJF49BAKKQ9KLAza3XRTb2xfCxRPbN4QnZyPz6Ajkd3+f9Ml3pv7QSK3+D0fbkSommY8+MCtQfZWWa3aI0NdjRHToTmylJWYkJaxIyGw4EMXH7ahO62PMT1OWnP5tcOh1AmB7pS+UNILOgZafh8cfJpQkjJEKuJu3iWUA+MS5/LGTm532GeKNMH5Zk0ZoBP/5x/WJE4/SzK8nd50GLIYXEhUln2lPtxDt9Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YP5Pf3g9cz2xbS
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 Jan 2025 23:20:04 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4YP4lv3gC6z9shx;
	Thu,  2 Jan 2025 12:50:51 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qCix7nZ6SYKj; Thu,  2 Jan 2025 12:50:51 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4YP4lv2m0zz9shw;
	Thu,  2 Jan 2025 12:50:51 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 4E98E8B767;
	Thu,  2 Jan 2025 12:50:51 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id Oius1QCwqKti; Thu,  2 Jan 2025 12:50:51 +0100 (CET)
Received: from [192.168.232.97] (unknown [192.168.232.97])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id BDC3E8B763;
	Thu,  2 Jan 2025 12:50:50 +0100 (CET)
Message-ID: <ec3515f1-f93a-4520-a9da-6ad14f9a6fe0@csgroup.eu>
Date: Thu, 2 Jan 2025 12:50:50 +0100
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
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 10/29] crypto: powerpc/p10-aes-gcm - simplify handling
 of linear associated data
To: Eric Biggers <ebiggers@kernel.org>, linux-crypto@vger.kernel.org
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Danny Tsen <dtsen@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>,
 Naveen N Rao <naveen@kernel.org>, Nicholas Piggin <npiggin@gmail.com>,
 linuxppc-dev@lists.ozlabs.org
References: <20241230001418.74739-1-ebiggers@kernel.org>
 <20241230001418.74739-11-ebiggers@kernel.org>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <20241230001418.74739-11-ebiggers@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org



Le 30/12/2024 à 01:13, Eric Biggers a écrit :
> From: Eric Biggers <ebiggers@google.com>
> 
> p10_aes_gcm_crypt() is abusing the scatter_walk API to get the virtual
> address for the first source scatterlist element.  But this code is only
> built for PPC64 which is a !HIGHMEM platform, and it can read past a
> page boundary from the address returned by scatterwalk_map() which means
> it already assumes the address is from the kernel's direct map.  Thus,
> just use sg_virt() instead to get the same result in a simpler way.
> 
> Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
> Cc: Danny Tsen <dtsen@linux.ibm.com>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Naveen N Rao <naveen@kernel.org>
> Cc: Nicholas Piggin <npiggin@gmail.com>
> Cc: linuxppc-dev@lists.ozlabs.org
> Signed-off-by: Eric Biggers <ebiggers@google.com>
> ---
> 
> This patch is part of a long series touching many files, so I have
> limited the Cc list on the full series.  If you want the full series and
> did not receive it, please retrieve it from lore.kernel.org.
> 
>   arch/powerpc/crypto/aes-gcm-p10-glue.c | 8 ++------
>   1 file changed, 2 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/powerpc/crypto/aes-gcm-p10-glue.c b/arch/powerpc/crypto/aes-gcm-p10-glue.c
> index f37b3d13fc53..2862c3cf8e41 100644
> --- a/arch/powerpc/crypto/aes-gcm-p10-glue.c
> +++ b/arch/powerpc/crypto/aes-gcm-p10-glue.c
> @@ -212,11 +212,10 @@ static int p10_aes_gcm_crypt(struct aead_request *req, u8 *riv,
>   	struct p10_aes_gcm_ctx *ctx = crypto_tfm_ctx(tfm);
>   	u8 databuf[sizeof(struct gcm_ctx) + PPC_ALIGN];
>   	struct gcm_ctx *gctx = PTR_ALIGN((void *)databuf, PPC_ALIGN);
>   	u8 hashbuf[sizeof(struct Hash_ctx) + PPC_ALIGN];
>   	struct Hash_ctx *hash = PTR_ALIGN((void *)hashbuf, PPC_ALIGN);
> -	struct scatter_walk assoc_sg_walk;
>   	struct skcipher_walk walk;
>   	u8 *assocmem = NULL;
>   	u8 *assoc;
>   	unsigned int cryptlen = req->cryptlen;
>   	unsigned char ivbuf[AES_BLOCK_SIZE+PPC_ALIGN];
> @@ -232,12 +231,11 @@ static int p10_aes_gcm_crypt(struct aead_request *req, u8 *riv,
>   	memset(ivbuf, 0, sizeof(ivbuf));
>   	memcpy(iv, riv, GCM_IV_SIZE);
>   
>   	/* Linearize assoc, if not already linear */
>   	if (req->src->length >= assoclen && req->src->length) {
> -		scatterwalk_start(&assoc_sg_walk, req->src);
> -		assoc = scatterwalk_map(&assoc_sg_walk);
> +		assoc = sg_virt(req->src); /* ppc64 is !HIGHMEM */
>   	} else {
>   		gfp_t flags = (req->base.flags & CRYPTO_TFM_REQ_MAY_SLEEP) ?
>   			      GFP_KERNEL : GFP_ATOMIC;
>   
>   		/* assoc can be any length, so must be on heap */
> @@ -251,13 +249,11 @@ static int p10_aes_gcm_crypt(struct aead_request *req, u8 *riv,
>   
>   	vsx_begin();
>   	gcmp10_init(gctx, iv, (unsigned char *) &ctx->enc_key, hash, assoc, assoclen);
>   	vsx_end();
>   
> -	if (!assocmem)
> -		scatterwalk_unmap(assoc);
> -	else
> +	if (assocmem)
>   		kfree(assocmem);

kfree() accepts a NULL pointer, you can call kfree(assocmem) without 'if 
(assocmem)'


>   
>   	if (enc)
>   		ret = skcipher_walk_aead_encrypt(&walk, req, false);
>   	else


