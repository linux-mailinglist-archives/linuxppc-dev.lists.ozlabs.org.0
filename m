Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B35AFD62DD
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Oct 2019 14:45:32 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46sJF54kvPzDqPW
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Oct 2019 23:45:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linaro.org
 (client-ip=2a00:1450:4864:20::442; helo=mail-wr1-x442.google.com;
 envelope-from=ard.biesheuvel@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.b="QkSQnfrV"; 
 dkim-atps=neutral
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46sJ675J5JzDqmY
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Oct 2019 23:39:27 +1100 (AEDT)
Received: by mail-wr1-x442.google.com with SMTP id n14so19509061wrw.9
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Oct 2019 05:39:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=eC2V7TUqfE9dXmDaFLqNWLvUbdgeVI2lpDkDcOcFK4o=;
 b=QkSQnfrV3qSp3kR58FqzGl6z0gDTRFQkbeKqNk2g5S8eRQuAkrrtAW6jDUNYjoLdUH
 Gd6W1ryWj/gVg3qSkJ7ccpvQxH2E81NfzXGjJoaSE12mJ+GeA82hxjJ+vMcnC6G+QdCp
 S8xrJ2rRKK0n7UMN9oy/twz/sp6BLN9oGmW0gePCYH1gXZaIw0wiuK2a80grFwe67+Ee
 x9DVRSytY7VAb5/LPNnMxFMrfrUjlyPm4uS91qr62s9lOYBHwmjaopYyTjkWmgI5BAd6
 m6MsAw+1deQO3vZ8+QKKQXA0Ad498i6xhguR4kJr54sC2FyHW7+1pTiuHXmRVcud8sAT
 oEgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eC2V7TUqfE9dXmDaFLqNWLvUbdgeVI2lpDkDcOcFK4o=;
 b=luLHOLkKKv4s7qypcKbOb4YFJ575RsF2gQDm8S4cVnV+lCX6y5/dUIvZyY1W8gBvV2
 8i0WqSwXSBn8Bm+w86axd32YbQv9iqteP7bt1JZCOXQ4A4AgoUGcJwW4JG6gLXhP4MP8
 Y0FmG4gGF//PngBx4ObPTx4NmR5ukh3OA3VZmP9N6iGqluQ6NuBJmh33g2dAJjxXhikj
 q5K2pTW9FGsxp8dhD5fntLp3N/fdIG1SSmRHfy7JgRvsw/f2tWRuhPhcsv0YZMeMRG1I
 qGp9dwpotPLmq33daLez3eWuVIXF+3HTUOn+wOMStFC2bPzRKR6CrUIQd8PejLnUI6i5
 CgAw==
X-Gm-Message-State: APjAAAWJxNdOhBtIPUocpyBtuoLpkU7zZg+Zt+MnCqYmP89NsTPxFJxn
 MuqmY4c/a8bDeGaPMHpdI6kzjlTV3kLvs8+J9bcHvQ==
X-Google-Smtp-Source: APXvYqylv9LxEi0v1Xlrbkbynt92Ssl3GCIVIsIKf6Zo+1thAWurIPsDhXlZB+oe9ebYc+++m8AW28xqCxvhQ6dNYIs=
X-Received: by 2002:a5d:43c9:: with SMTP id v9mr24980785wrr.200.1571056764115; 
 Mon, 14 Oct 2019 05:39:24 -0700 (PDT)
MIME-Version: 1.0
References: <20191013043918.337113-1-ebiggers@kernel.org>
 <20191013043918.337113-4-ebiggers@kernel.org>
In-Reply-To: <20191013043918.337113-4-ebiggers@kernel.org>
From: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Date: Mon, 14 Oct 2019 14:39:12 +0200
Message-ID: <CAKv+Gu-VQrZPS6+Eo27cpXg9LS2d9MSeBYdd81xkLmF9Lt-s0w@mail.gmail.com>
Subject: Re: [PATCH 3/4] crypto: nx - convert AES-CBC to skcipher API
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
> Convert the PowerPC Nest (NX) implementation of AES-CBC from the
> deprecated "blkcipher" API to the "skcipher" API.  This is needed in
> order for the blkcipher API to be removed.
>
> Signed-off-by: Eric Biggers <ebiggers@google.com>

Reviewed-by: Ard Biesheuvel <ard.biesheuvel@linaro.org>

> ---
>  drivers/crypto/nx/nx-aes-cbc.c | 78 ++++++++++++++--------------------
>  drivers/crypto/nx/nx.c         | 11 ++---
>  drivers/crypto/nx/nx.h         |  4 +-
>  3 files changed, 41 insertions(+), 52 deletions(-)
>
> diff --git a/drivers/crypto/nx/nx-aes-cbc.c b/drivers/crypto/nx/nx-aes-cbc.c
> index 482a203a9260..92e921eceed7 100644
> --- a/drivers/crypto/nx/nx-aes-cbc.c
> +++ b/drivers/crypto/nx/nx-aes-cbc.c
> @@ -18,11 +18,11 @@
>  #include "nx.h"
>
>
> -static int cbc_aes_nx_set_key(struct crypto_tfm *tfm,
> -                             const u8          *in_key,
> -                             unsigned int       key_len)
> +static int cbc_aes_nx_set_key(struct crypto_skcipher *tfm,
> +                             const u8               *in_key,
> +                             unsigned int            key_len)
>  {
> -       struct nx_crypto_ctx *nx_ctx = crypto_tfm_ctx(tfm);
> +       struct nx_crypto_ctx *nx_ctx = crypto_skcipher_ctx(tfm);
>         struct nx_csbcpb *csbcpb = nx_ctx->csbcpb;
>
>         nx_ctx_init(nx_ctx, HCOP_FC_AES);
> @@ -50,13 +50,11 @@ static int cbc_aes_nx_set_key(struct crypto_tfm *tfm,
>         return 0;
>  }
>
> -static int cbc_aes_nx_crypt(struct blkcipher_desc *desc,
> -                           struct scatterlist    *dst,
> -                           struct scatterlist    *src,
> -                           unsigned int           nbytes,
> -                           int                    enc)
> +static int cbc_aes_nx_crypt(struct skcipher_request *req,
> +                           int                      enc)
>  {
> -       struct nx_crypto_ctx *nx_ctx = crypto_blkcipher_ctx(desc->tfm);
> +       struct crypto_skcipher *tfm = crypto_skcipher_reqtfm(req);
> +       struct nx_crypto_ctx *nx_ctx = crypto_skcipher_ctx(tfm);
>         struct nx_csbcpb *csbcpb = nx_ctx->csbcpb;
>         unsigned long irq_flags;
>         unsigned int processed = 0, to_process;
> @@ -70,9 +68,9 @@ static int cbc_aes_nx_crypt(struct blkcipher_desc *desc,
>                 NX_CPB_FDM(csbcpb) &= ~NX_FDM_ENDE_ENCRYPT;
>
>         do {
> -               to_process = nbytes - processed;
> +               to_process = req->cryptlen - processed;
>
> -               rc = nx_build_sg_lists(nx_ctx, desc->info, dst, src,
> +               rc = nx_build_sg_lists(nx_ctx, req->iv, req->dst, req->src,
>                                        &to_process, processed,
>                                        csbcpb->cpb.aes_cbc.iv);
>                 if (rc)
> @@ -84,56 +82,46 @@ static int cbc_aes_nx_crypt(struct blkcipher_desc *desc,
>                 }
>
>                 rc = nx_hcall_sync(nx_ctx, &nx_ctx->op,
> -                                  desc->flags & CRYPTO_TFM_REQ_MAY_SLEEP);
> +                                  req->base.flags & CRYPTO_TFM_REQ_MAY_SLEEP);
>                 if (rc)
>                         goto out;
>
> -               memcpy(desc->info, csbcpb->cpb.aes_cbc.cv, AES_BLOCK_SIZE);
> +               memcpy(req->iv, csbcpb->cpb.aes_cbc.cv, AES_BLOCK_SIZE);
>                 atomic_inc(&(nx_ctx->stats->aes_ops));
>                 atomic64_add(csbcpb->csb.processed_byte_count,
>                              &(nx_ctx->stats->aes_bytes));
>
>                 processed += to_process;
> -       } while (processed < nbytes);
> +       } while (processed < req->cryptlen);
>  out:
>         spin_unlock_irqrestore(&nx_ctx->lock, irq_flags);
>         return rc;
>  }
>
> -static int cbc_aes_nx_encrypt(struct blkcipher_desc *desc,
> -                             struct scatterlist    *dst,
> -                             struct scatterlist    *src,
> -                             unsigned int           nbytes)
> +static int cbc_aes_nx_encrypt(struct skcipher_request *req)
>  {
> -       return cbc_aes_nx_crypt(desc, dst, src, nbytes, 1);
> +       return cbc_aes_nx_crypt(req, 1);
>  }
>
> -static int cbc_aes_nx_decrypt(struct blkcipher_desc *desc,
> -                             struct scatterlist    *dst,
> -                             struct scatterlist    *src,
> -                             unsigned int           nbytes)
> +static int cbc_aes_nx_decrypt(struct skcipher_request *req)
>  {
> -       return cbc_aes_nx_crypt(desc, dst, src, nbytes, 0);
> +       return cbc_aes_nx_crypt(req, 0);
>  }
>
> -struct crypto_alg nx_cbc_aes_alg = {
> -       .cra_name        = "cbc(aes)",
> -       .cra_driver_name = "cbc-aes-nx",
> -       .cra_priority    = 300,
> -       .cra_flags       = CRYPTO_ALG_TYPE_BLKCIPHER,
> -       .cra_blocksize   = AES_BLOCK_SIZE,
> -       .cra_ctxsize     = sizeof(struct nx_crypto_ctx),
> -       .cra_type        = &crypto_blkcipher_type,
> -       .cra_alignmask   = 0xf,
> -       .cra_module      = THIS_MODULE,
> -       .cra_init        = nx_crypto_ctx_aes_cbc_init,
> -       .cra_exit        = nx_crypto_ctx_exit,
> -       .cra_blkcipher = {
> -               .min_keysize = AES_MIN_KEY_SIZE,
> -               .max_keysize = AES_MAX_KEY_SIZE,
> -               .ivsize      = AES_BLOCK_SIZE,
> -               .setkey      = cbc_aes_nx_set_key,
> -               .encrypt     = cbc_aes_nx_encrypt,
> -               .decrypt     = cbc_aes_nx_decrypt,
> -       }
> +struct skcipher_alg nx_cbc_aes_alg = {
> +       .base.cra_name          = "cbc(aes)",
> +       .base.cra_driver_name   = "cbc-aes-nx",
> +       .base.cra_priority      = 300,
> +       .base.cra_blocksize     = AES_BLOCK_SIZE,
> +       .base.cra_ctxsize       = sizeof(struct nx_crypto_ctx),
> +       .base.cra_alignmask     = 0xf,
> +       .base.cra_module        = THIS_MODULE,
> +       .init                   = nx_crypto_ctx_aes_cbc_init,
> +       .exit                   = nx_crypto_ctx_skcipher_exit,
> +       .min_keysize            = AES_MIN_KEY_SIZE,
> +       .max_keysize            = AES_MAX_KEY_SIZE,
> +       .ivsize                 = AES_BLOCK_SIZE,
> +       .setkey                 = cbc_aes_nx_set_key,
> +       .encrypt                = cbc_aes_nx_encrypt,
> +       .decrypt                = cbc_aes_nx_decrypt,
>  };
> diff --git a/drivers/crypto/nx/nx.c b/drivers/crypto/nx/nx.c
> index 4b97081e7486..8e5367776ca0 100644
> --- a/drivers/crypto/nx/nx.c
> +++ b/drivers/crypto/nx/nx.c
> @@ -589,7 +589,7 @@ static int nx_register_algs(void)
>         if (rc)
>                 goto out;
>
> -       rc = nx_register_alg(&nx_cbc_aes_alg, NX_FC_AES, NX_MODE_AES_CBC);
> +       rc = nx_register_skcipher(&nx_cbc_aes_alg, NX_FC_AES, NX_MODE_AES_CBC);
>         if (rc)
>                 goto out_unreg_ecb;
>
> @@ -647,7 +647,7 @@ static int nx_register_algs(void)
>  out_unreg_ctr3686:
>         nx_unregister_alg(&nx_ctr3686_aes_alg, NX_FC_AES, NX_MODE_AES_CTR);
>  out_unreg_cbc:
> -       nx_unregister_alg(&nx_cbc_aes_alg, NX_FC_AES, NX_MODE_AES_CBC);
> +       nx_unregister_skcipher(&nx_cbc_aes_alg, NX_FC_AES, NX_MODE_AES_CBC);
>  out_unreg_ecb:
>         nx_unregister_skcipher(&nx_ecb_aes_alg, NX_FC_AES, NX_MODE_AES_ECB);
>  out:
> @@ -722,9 +722,9 @@ int nx_crypto_ctx_aes_ctr_init(struct crypto_tfm *tfm)
>                                   NX_MODE_AES_CTR);
>  }
>
> -int nx_crypto_ctx_aes_cbc_init(struct crypto_tfm *tfm)
> +int nx_crypto_ctx_aes_cbc_init(struct crypto_skcipher *tfm)
>  {
> -       return nx_crypto_ctx_init(crypto_tfm_ctx(tfm), NX_FC_AES,
> +       return nx_crypto_ctx_init(crypto_skcipher_ctx(tfm), NX_FC_AES,
>                                   NX_MODE_AES_CBC);
>  }
>
> @@ -817,7 +817,8 @@ static int nx_remove(struct vio_dev *viodev)
>                                    NX_FC_AES, NX_MODE_AES_GCM);
>                 nx_unregister_alg(&nx_ctr3686_aes_alg,
>                                   NX_FC_AES, NX_MODE_AES_CTR);
> -               nx_unregister_alg(&nx_cbc_aes_alg, NX_FC_AES, NX_MODE_AES_CBC);
> +               nx_unregister_skcipher(&nx_cbc_aes_alg, NX_FC_AES,
> +                                      NX_MODE_AES_CBC);
>                 nx_unregister_skcipher(&nx_ecb_aes_alg, NX_FC_AES,
>                                        NX_MODE_AES_ECB);
>         }
> diff --git a/drivers/crypto/nx/nx.h b/drivers/crypto/nx/nx.h
> index 1a839ef21c4f..2e1a3e5e65cb 100644
> --- a/drivers/crypto/nx/nx.h
> +++ b/drivers/crypto/nx/nx.h
> @@ -146,7 +146,7 @@ int nx_crypto_ctx_aes_ccm_init(struct crypto_aead *tfm);
>  int nx_crypto_ctx_aes_gcm_init(struct crypto_aead *tfm);
>  int nx_crypto_ctx_aes_xcbc_init(struct crypto_tfm *tfm);
>  int nx_crypto_ctx_aes_ctr_init(struct crypto_tfm *tfm);
> -int nx_crypto_ctx_aes_cbc_init(struct crypto_tfm *tfm);
> +int nx_crypto_ctx_aes_cbc_init(struct crypto_skcipher *tfm);
>  int nx_crypto_ctx_aes_ecb_init(struct crypto_skcipher *tfm);
>  int nx_crypto_ctx_sha_init(struct crypto_tfm *tfm);
>  void nx_crypto_ctx_exit(struct crypto_tfm *tfm);
> @@ -176,7 +176,7 @@ void nx_debugfs_fini(struct nx_crypto_driver *);
>
>  #define NX_PAGE_NUM(x)         ((u64)(x) & 0xfffffffffffff000ULL)
>
> -extern struct crypto_alg nx_cbc_aes_alg;
> +extern struct skcipher_alg nx_cbc_aes_alg;
>  extern struct skcipher_alg nx_ecb_aes_alg;
>  extern struct aead_alg nx_gcm_aes_alg;
>  extern struct aead_alg nx_gcm4106_aes_alg;
> --
> 2.23.0
>
