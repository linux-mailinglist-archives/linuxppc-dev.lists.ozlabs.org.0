Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 30988D62B7
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Oct 2019 14:38:49 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46sJ5J5SrzzDqlj
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Oct 2019 23:38:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linaro.org
 (client-ip=2a00:1450:4864:20::344; helo=mail-wm1-x344.google.com;
 envelope-from=ard.biesheuvel@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.b="YXI1tLEZ"; 
 dkim-atps=neutral
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46sJ1p3Q3lzDqgq
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Oct 2019 23:35:39 +1100 (AEDT)
Received: by mail-wm1-x344.google.com with SMTP id m18so16598696wmc.1
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Oct 2019 05:35:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Pb1wudvtkVBoqcuP+Ug/DMQ02lyAyBVX0wV7Uq6bxNg=;
 b=YXI1tLEZIcB3EYRi/5Gd9UGiExZ6nGKi+5lL9+iq3zJtTDTWBwbnK8hj7BPIOfrIEm
 HY3PlLSKbpUxx/m+CvsDD2Bfctws2OAJSnKspqZSEOMvR7gBI+RSeAuGhXqq91I+4bb6
 ChKCKYYEcrtwnytnRC2Zq4pR4WTAzKkc1uCiMlVr5rLUR7cR6GtDO0O4nDsKDkilSNkZ
 HqUGKlZv7YUfKPme/dCjcH2MQwHh0KCyqkRvaLhDCSEFHGgQ4lELEmb+hoNhoKv8GAAH
 hvFY0Jrm6lal8LRRLRNDJc8PVIa1JxC1X2f90wtOJpfIEV5TEkBi8vmZyXvms8AuMYwL
 UN/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Pb1wudvtkVBoqcuP+Ug/DMQ02lyAyBVX0wV7Uq6bxNg=;
 b=P9DpGdnicfj/k2DK6sp+RWjPiC0gCrWzZ1zeNwwcZesHwtzQiup/BclpxKy0SdIaXZ
 DGW3fq0/omCKwCEWNa6gT+Ha7zFDY9eTCw7Jo0JicmHO68sG4VAgilKLW/OmHIKFYY4H
 biXYBK+dIzioJxSW/HqoJoHgtKRLt8/JIJWBqOkrIMQwYfMxy+oGmYQIAeR4tSCeaIAp
 3ua7d/6bG+DL0xP94AI4Aehtn7phIJMj5JDfK4F5PsoYXNmpqPoYQUAeT854KeF6rE7A
 LvqxPWCI19qhM9kj6URLnUTH3mFttRyDeACVGU9dDEjy/ucBDlHncOcfjmO97xQJxb0H
 m+0g==
X-Gm-Message-State: APjAAAUIUqJ3Y9Rrqb2s6obyWLcfoR89pK2KB4cSTD9u+I8Qwsxcg0EK
 J0OhMwfSSSN5NJrdk5ceZ/I1voMuBqJg0MXP8Z+WCQ==
X-Google-Smtp-Source: APXvYqyfaiNqhCSkojlaUuWjXIrU4jtR/eqnKwC2wLCSgxhnDwPPVc3/tZCgV0oo5wfKICGX71Z2zvCIZkhnyLSB1ac=
X-Received: by 2002:a7b:ce01:: with SMTP id m1mr13975783wmc.136.1571056533948; 
 Mon, 14 Oct 2019 05:35:33 -0700 (PDT)
MIME-Version: 1.0
References: <20191013043918.337113-1-ebiggers@kernel.org>
 <20191013043918.337113-2-ebiggers@kernel.org>
In-Reply-To: <20191013043918.337113-2-ebiggers@kernel.org>
From: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Date: Mon, 14 Oct 2019 14:35:22 +0200
Message-ID: <CAKv+Gu9ocFEULWMcE9_NzQ9uhw3KPCaUFbY1ATr+3mHJQKAHDg@mail.gmail.com>
Subject: Re: [PATCH 1/4] crypto: nx - don't abuse blkcipher_desc to pass iv
 around
To: Eric Biggers <ebiggers@kernel.org>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Herbert Xu <herbert@gondor.apana.org.au>, Nayna Jain <nayna@linux.ibm.com>,
 Paulo Flabiano Smorigo <pfsmorigo@gmail.com>,
 "open list:HARDWARE RANDOM NUMBER GENERATOR CORE"
 <linux-crypto@vger.kernel.org>,
 =?UTF-8?Q?Breno_Leit=C3=A3o?= <leitao@debian.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, 13 Oct 2019 at 06:40, Eric Biggers <ebiggers@kernel.org> wrote:
>
> From: Eric Biggers <ebiggers@google.com>
>
> The NX crypto driver is using 'struct blkcipher_desc' to pass the IV
> around, even for AEADs (for which it creates the struct on the stack).
> This is not appropriate since this structure is part of the "blkcipher"
> API, which is deprecated and will be removed.
>
> Just pass around the IV directly instead.
>
> Signed-off-by: Eric Biggers <ebiggers@google.com>

Reviewed-by: Ard Biesheuvel <ard.biesheuvel@linaro.org>

> ---
>  drivers/crypto/nx/nx-aes-cbc.c |  5 +++--
>  drivers/crypto/nx/nx-aes-ccm.c | 40 ++++++++++++----------------------
>  drivers/crypto/nx/nx-aes-ctr.c |  5 +++--
>  drivers/crypto/nx/nx-aes-ecb.c |  4 ++--
>  drivers/crypto/nx/nx-aes-gcm.c | 24 +++++++++-----------
>  drivers/crypto/nx/nx.c         | 16 +++++++-------
>  drivers/crypto/nx/nx.h         |  6 ++---
>  7 files changed, 43 insertions(+), 57 deletions(-)
>
> diff --git a/drivers/crypto/nx/nx-aes-cbc.c b/drivers/crypto/nx/nx-aes-cbc.c
> index e631f9979127..482a203a9260 100644
> --- a/drivers/crypto/nx/nx-aes-cbc.c
> +++ b/drivers/crypto/nx/nx-aes-cbc.c
> @@ -72,8 +72,9 @@ static int cbc_aes_nx_crypt(struct blkcipher_desc *desc,
>         do {
>                 to_process = nbytes - processed;
>
> -               rc = nx_build_sg_lists(nx_ctx, desc, dst, src, &to_process,
> -                                      processed, csbcpb->cpb.aes_cbc.iv);
> +               rc = nx_build_sg_lists(nx_ctx, desc->info, dst, src,
> +                                      &to_process, processed,
> +                                      csbcpb->cpb.aes_cbc.iv);
>                 if (rc)
>                         goto out;
>
> diff --git a/drivers/crypto/nx/nx-aes-ccm.c b/drivers/crypto/nx/nx-aes-ccm.c
> index 5be8f01c5da8..84fed736ed2e 100644
> --- a/drivers/crypto/nx/nx-aes-ccm.c
> +++ b/drivers/crypto/nx/nx-aes-ccm.c
> @@ -327,7 +327,7 @@ static int generate_pat(u8                   *iv,
>  }
>
>  static int ccm_nx_decrypt(struct aead_request   *req,
> -                         struct blkcipher_desc *desc,
> +                         u8                    *iv,
>                           unsigned int assoclen)
>  {
>         struct nx_crypto_ctx *nx_ctx = crypto_tfm_ctx(req->base.tfm);
> @@ -348,7 +348,7 @@ static int ccm_nx_decrypt(struct aead_request   *req,
>                                  req->src, nbytes + req->assoclen, authsize,
>                                  SCATTERWALK_FROM_SG);
>
> -       rc = generate_pat(desc->info, req, nx_ctx, authsize, nbytes, assoclen,
> +       rc = generate_pat(iv, req, nx_ctx, authsize, nbytes, assoclen,
>                           csbcpb->cpb.aes_ccm.in_pat_or_b0);
>         if (rc)
>                 goto out;
> @@ -367,7 +367,7 @@ static int ccm_nx_decrypt(struct aead_request   *req,
>
>                 NX_CPB_FDM(nx_ctx->csbcpb) &= ~NX_FDM_ENDE_ENCRYPT;
>
> -               rc = nx_build_sg_lists(nx_ctx, desc, req->dst, req->src,
> +               rc = nx_build_sg_lists(nx_ctx, iv, req->dst, req->src,
>                                        &to_process, processed + req->assoclen,
>                                        csbcpb->cpb.aes_ccm.iv_or_ctr);
>                 if (rc)
> @@ -381,7 +381,7 @@ static int ccm_nx_decrypt(struct aead_request   *req,
>                 /* for partial completion, copy following for next
>                  * entry into loop...
>                  */
> -               memcpy(desc->info, csbcpb->cpb.aes_ccm.out_ctr, AES_BLOCK_SIZE);
> +               memcpy(iv, csbcpb->cpb.aes_ccm.out_ctr, AES_BLOCK_SIZE);
>                 memcpy(csbcpb->cpb.aes_ccm.in_pat_or_b0,
>                         csbcpb->cpb.aes_ccm.out_pat_or_mac, AES_BLOCK_SIZE);
>                 memcpy(csbcpb->cpb.aes_ccm.in_s0,
> @@ -405,7 +405,7 @@ static int ccm_nx_decrypt(struct aead_request   *req,
>  }
>
>  static int ccm_nx_encrypt(struct aead_request   *req,
> -                         struct blkcipher_desc *desc,
> +                         u8                    *iv,
>                           unsigned int assoclen)
>  {
>         struct nx_crypto_ctx *nx_ctx = crypto_tfm_ctx(req->base.tfm);
> @@ -418,7 +418,7 @@ static int ccm_nx_encrypt(struct aead_request   *req,
>
>         spin_lock_irqsave(&nx_ctx->lock, irq_flags);
>
> -       rc = generate_pat(desc->info, req, nx_ctx, authsize, nbytes, assoclen,
> +       rc = generate_pat(iv, req, nx_ctx, authsize, nbytes, assoclen,
>                           csbcpb->cpb.aes_ccm.in_pat_or_b0);
>         if (rc)
>                 goto out;
> @@ -436,7 +436,7 @@ static int ccm_nx_encrypt(struct aead_request   *req,
>
>                 NX_CPB_FDM(csbcpb) |= NX_FDM_ENDE_ENCRYPT;
>
> -               rc = nx_build_sg_lists(nx_ctx, desc, req->dst, req->src,
> +               rc = nx_build_sg_lists(nx_ctx, iv, req->dst, req->src,
>                                        &to_process, processed + req->assoclen,
>                                        csbcpb->cpb.aes_ccm.iv_or_ctr);
>                 if (rc)
> @@ -450,7 +450,7 @@ static int ccm_nx_encrypt(struct aead_request   *req,
>                 /* for partial completion, copy following for next
>                  * entry into loop...
>                  */
> -               memcpy(desc->info, csbcpb->cpb.aes_ccm.out_ctr, AES_BLOCK_SIZE);
> +               memcpy(iv, csbcpb->cpb.aes_ccm.out_ctr, AES_BLOCK_SIZE);
>                 memcpy(csbcpb->cpb.aes_ccm.in_pat_or_b0,
>                         csbcpb->cpb.aes_ccm.out_pat_or_mac, AES_BLOCK_SIZE);
>                 memcpy(csbcpb->cpb.aes_ccm.in_s0,
> @@ -481,60 +481,48 @@ static int ccm4309_aes_nx_encrypt(struct aead_request *req)
>  {
>         struct nx_crypto_ctx *nx_ctx = crypto_tfm_ctx(req->base.tfm);
>         struct nx_gcm_rctx *rctx = aead_request_ctx(req);
> -       struct blkcipher_desc desc;
>         u8 *iv = rctx->iv;
>
>         iv[0] = 3;
>         memcpy(iv + 1, nx_ctx->priv.ccm.nonce, 3);
>         memcpy(iv + 4, req->iv, 8);
>
> -       desc.info = iv;
> -
> -       return ccm_nx_encrypt(req, &desc, req->assoclen - 8);
> +       return ccm_nx_encrypt(req, iv, req->assoclen - 8);
>  }
>
>  static int ccm_aes_nx_encrypt(struct aead_request *req)
>  {
> -       struct blkcipher_desc desc;
>         int rc;
>
> -       desc.info = req->iv;
> -
> -       rc = crypto_ccm_check_iv(desc.info);
> +       rc = crypto_ccm_check_iv(req->iv);
>         if (rc)
>                 return rc;
>
> -       return ccm_nx_encrypt(req, &desc, req->assoclen);
> +       return ccm_nx_encrypt(req, req->iv, req->assoclen);
>  }
>
>  static int ccm4309_aes_nx_decrypt(struct aead_request *req)
>  {
>         struct nx_crypto_ctx *nx_ctx = crypto_tfm_ctx(req->base.tfm);
>         struct nx_gcm_rctx *rctx = aead_request_ctx(req);
> -       struct blkcipher_desc desc;
>         u8 *iv = rctx->iv;
>
>         iv[0] = 3;
>         memcpy(iv + 1, nx_ctx->priv.ccm.nonce, 3);
>         memcpy(iv + 4, req->iv, 8);
>
> -       desc.info = iv;
> -
> -       return ccm_nx_decrypt(req, &desc, req->assoclen - 8);
> +       return ccm_nx_decrypt(req, iv, req->assoclen - 8);
>  }
>
>  static int ccm_aes_nx_decrypt(struct aead_request *req)
>  {
> -       struct blkcipher_desc desc;
>         int rc;
>
> -       desc.info = req->iv;
> -
> -       rc = crypto_ccm_check_iv(desc.info);
> +       rc = crypto_ccm_check_iv(req->iv);
>         if (rc)
>                 return rc;
>
> -       return ccm_nx_decrypt(req, &desc, req->assoclen);
> +       return ccm_nx_decrypt(req, req->iv, req->assoclen);
>  }
>
>  /* tell the block cipher walk routines that this is a stream cipher by
> diff --git a/drivers/crypto/nx/nx-aes-ctr.c b/drivers/crypto/nx/nx-aes-ctr.c
> index 191e226a11a1..05e558cefe94 100644
> --- a/drivers/crypto/nx/nx-aes-ctr.c
> +++ b/drivers/crypto/nx/nx-aes-ctr.c
> @@ -85,8 +85,9 @@ static int ctr_aes_nx_crypt(struct blkcipher_desc *desc,
>         do {
>                 to_process = nbytes - processed;
>
> -               rc = nx_build_sg_lists(nx_ctx, desc, dst, src, &to_process,
> -                                      processed, csbcpb->cpb.aes_ctr.iv);
> +               rc = nx_build_sg_lists(nx_ctx, desc->info, dst, src,
> +                                      &to_process, processed,
> +                                      csbcpb->cpb.aes_ctr.iv);
>                 if (rc)
>                         goto out;
>
> diff --git a/drivers/crypto/nx/nx-aes-ecb.c b/drivers/crypto/nx/nx-aes-ecb.c
> index c67570470c9d..87183890d1ab 100644
> --- a/drivers/crypto/nx/nx-aes-ecb.c
> +++ b/drivers/crypto/nx/nx-aes-ecb.c
> @@ -72,8 +72,8 @@ static int ecb_aes_nx_crypt(struct blkcipher_desc *desc,
>         do {
>                 to_process = nbytes - processed;
>
> -               rc = nx_build_sg_lists(nx_ctx, desc, dst, src, &to_process,
> -                               processed, NULL);
> +               rc = nx_build_sg_lists(nx_ctx, NULL, dst, src, &to_process,
> +                                      processed, NULL);
>                 if (rc)
>                         goto out;
>
> diff --git a/drivers/crypto/nx/nx-aes-gcm.c b/drivers/crypto/nx/nx-aes-gcm.c
> index 7d3d67871270..898220e159d3 100644
> --- a/drivers/crypto/nx/nx-aes-gcm.c
> +++ b/drivers/crypto/nx/nx-aes-gcm.c
> @@ -166,8 +166,7 @@ static int nx_gca(struct nx_crypto_ctx  *nx_ctx,
>         return rc;
>  }
>
> -static int gmac(struct aead_request *req, struct blkcipher_desc *desc,
> -               unsigned int assoclen)
> +static int gmac(struct aead_request *req, const u8 *iv, unsigned int assoclen)
>  {
>         int rc;
>         struct nx_crypto_ctx *nx_ctx =
> @@ -190,7 +189,7 @@ static int gmac(struct aead_request *req, struct blkcipher_desc *desc,
>                            nx_ctx->ap->databytelen/NX_PAGE_SIZE);
>
>         /* Copy IV */
> -       memcpy(csbcpb->cpb.aes_gcm.iv_or_cnt, desc->info, AES_BLOCK_SIZE);
> +       memcpy(csbcpb->cpb.aes_gcm.iv_or_cnt, iv, AES_BLOCK_SIZE);
>
>         do {
>                 /*
> @@ -240,8 +239,7 @@ static int gmac(struct aead_request *req, struct blkcipher_desc *desc,
>         return rc;
>  }
>
> -static int gcm_empty(struct aead_request *req, struct blkcipher_desc *desc,
> -                    int enc)
> +static int gcm_empty(struct aead_request *req, const u8 *iv, int enc)
>  {
>         int rc;
>         struct nx_crypto_ctx *nx_ctx =
> @@ -268,7 +266,7 @@ static int gcm_empty(struct aead_request *req, struct blkcipher_desc *desc,
>         len = AES_BLOCK_SIZE;
>
>         /* Encrypt the counter/IV */
> -       in_sg = nx_build_sg_list(nx_ctx->in_sg, (u8 *) desc->info,
> +       in_sg = nx_build_sg_list(nx_ctx->in_sg, (u8 *) iv,
>                                  &len, nx_ctx->ap->sglen);
>
>         if (len != AES_BLOCK_SIZE)
> @@ -285,7 +283,7 @@ static int gcm_empty(struct aead_request *req, struct blkcipher_desc *desc,
>         nx_ctx->op.outlen = (nx_ctx->out_sg - out_sg) * sizeof(struct nx_sg);
>
>         rc = nx_hcall_sync(nx_ctx, &nx_ctx->op,
> -                          desc->flags & CRYPTO_TFM_REQ_MAY_SLEEP);
> +                          req->base.flags & CRYPTO_TFM_REQ_MAY_SLEEP);
>         if (rc)
>                 goto out;
>         atomic_inc(&(nx_ctx->stats->aes_ops));
> @@ -313,7 +311,6 @@ static int gcm_aes_nx_crypt(struct aead_request *req, int enc,
>                 crypto_aead_ctx(crypto_aead_reqtfm(req));
>         struct nx_gcm_rctx *rctx = aead_request_ctx(req);
>         struct nx_csbcpb *csbcpb = nx_ctx->csbcpb;
> -       struct blkcipher_desc desc;
>         unsigned int nbytes = req->cryptlen;
>         unsigned int processed = 0, to_process;
>         unsigned long irq_flags;
> @@ -321,15 +318,14 @@ static int gcm_aes_nx_crypt(struct aead_request *req, int enc,
>
>         spin_lock_irqsave(&nx_ctx->lock, irq_flags);
>
> -       desc.info = rctx->iv;
>         /* initialize the counter */
> -       *(u32 *)(desc.info + NX_GCM_CTR_OFFSET) = 1;
> +       *(u32 *)&rctx->iv[NX_GCM_CTR_OFFSET] = 1;
>
>         if (nbytes == 0) {
>                 if (assoclen == 0)
> -                       rc = gcm_empty(req, &desc, enc);
> +                       rc = gcm_empty(req, rctx->iv, enc);
>                 else
> -                       rc = gmac(req, &desc, assoclen);
> +                       rc = gmac(req, rctx->iv, assoclen);
>                 if (rc)
>                         goto out;
>                 else
> @@ -358,7 +354,7 @@ static int gcm_aes_nx_crypt(struct aead_request *req, int enc,
>                 to_process = nbytes - processed;
>
>                 csbcpb->cpb.aes_gcm.bit_length_data = nbytes * 8;
> -               rc = nx_build_sg_lists(nx_ctx, &desc, req->dst,
> +               rc = nx_build_sg_lists(nx_ctx, rctx->iv, req->dst,
>                                        req->src, &to_process,
>                                        processed + req->assoclen,
>                                        csbcpb->cpb.aes_gcm.iv_or_cnt);
> @@ -377,7 +373,7 @@ static int gcm_aes_nx_crypt(struct aead_request *req, int enc,
>                 if (rc)
>                         goto out;
>
> -               memcpy(desc.info, csbcpb->cpb.aes_gcm.out_cnt, AES_BLOCK_SIZE);
> +               memcpy(rctx->iv, csbcpb->cpb.aes_gcm.out_cnt, AES_BLOCK_SIZE);
>                 memcpy(csbcpb->cpb.aes_gcm.in_pat_or_aad,
>                         csbcpb->cpb.aes_gcm.out_pat_or_mac, AES_BLOCK_SIZE);
>                 memcpy(csbcpb->cpb.aes_gcm.in_s0,
> diff --git a/drivers/crypto/nx/nx.c b/drivers/crypto/nx/nx.c
> index 28817880c76d..1202a00715ac 100644
> --- a/drivers/crypto/nx/nx.c
> +++ b/drivers/crypto/nx/nx.c
> @@ -243,25 +243,25 @@ static long int trim_sg_list(struct nx_sg *sg,
>   *                     scatterlists based on them.
>   *
>   * @nx_ctx: NX crypto context for the lists we're building
> - * @desc: the block cipher descriptor for the operation
> + * @iv: iv data, if the algorithm requires it
>   * @dst: destination scatterlist
>   * @src: source scatterlist
>   * @nbytes: length of data described in the scatterlists
>   * @offset: number of bytes to fast-forward past at the beginning of
>   *          scatterlists.
> - * @iv: destination for the iv data, if the algorithm requires it
> + * @oiv: destination for the iv data, if the algorithm requires it
>   *
> - * This is common code shared by all the AES algorithms. It uses the block
> - * cipher walk routines to traverse input and output scatterlists, building
> + * This is common code shared by all the AES algorithms. It uses the crypto
> + * scatterlist walk routines to traverse input and output scatterlists, building
>   * corresponding NX scatterlists
>   */
>  int nx_build_sg_lists(struct nx_crypto_ctx  *nx_ctx,
> -                     struct blkcipher_desc *desc,
> +                     const u8              *iv,
>                       struct scatterlist    *dst,
>                       struct scatterlist    *src,
>                       unsigned int          *nbytes,
>                       unsigned int           offset,
> -                     u8                    *iv)
> +                     u8                    *oiv)
>  {
>         unsigned int delta = 0;
>         unsigned int total = *nbytes;
> @@ -274,8 +274,8 @@ int nx_build_sg_lists(struct nx_crypto_ctx  *nx_ctx,
>         max_sg_len = min_t(u64, max_sg_len,
>                         nx_ctx->ap->databytelen/NX_PAGE_SIZE);
>
> -       if (iv)
> -               memcpy(iv, desc->info, AES_BLOCK_SIZE);
> +       if (oiv)
> +               memcpy(oiv, iv, AES_BLOCK_SIZE);
>
>         *nbytes = min_t(u64, *nbytes, nx_ctx->ap->databytelen);
>
> diff --git a/drivers/crypto/nx/nx.h b/drivers/crypto/nx/nx.h
> index 7ecca168f8c4..768ebae9731e 100644
> --- a/drivers/crypto/nx/nx.h
> +++ b/drivers/crypto/nx/nx.h
> @@ -155,9 +155,9 @@ void nx_ctx_init(struct nx_crypto_ctx *nx_ctx, unsigned int function);
>  int nx_hcall_sync(struct nx_crypto_ctx *ctx, struct vio_pfo_op *op,
>                   u32 may_sleep);
>  struct nx_sg *nx_build_sg_list(struct nx_sg *, u8 *, unsigned int *, u32);
> -int nx_build_sg_lists(struct nx_crypto_ctx *, struct blkcipher_desc *,
> -                     struct scatterlist *, struct scatterlist *, unsigned int *,
> -                     unsigned int, u8 *);
> +int nx_build_sg_lists(struct nx_crypto_ctx *nx_ctx, const u8 *iv,
> +                     struct scatterlist *dst, struct scatterlist *src,
> +                     unsigned int *nbytes, unsigned int offset, u8 *oiv);
>  struct nx_sg *nx_walk_and_build(struct nx_sg *, unsigned int,
>                                 struct scatterlist *, unsigned int,
>                                 unsigned int *);
> --
> 2.23.0
>
