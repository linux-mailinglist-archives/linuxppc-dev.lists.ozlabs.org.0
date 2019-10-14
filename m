Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A61D1D62D7
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Oct 2019 14:42:57 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46sJB61D6XzDqqD
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Oct 2019 23:42:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linaro.org
 (client-ip=2a00:1450:4864:20::343; helo=mail-wm1-x343.google.com;
 envelope-from=ard.biesheuvel@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.b="EkAt895g"; 
 dkim-atps=neutral
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46sJ5S2RJDzDq75
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Oct 2019 23:38:52 +1100 (AEDT)
Received: by mail-wm1-x343.google.com with SMTP id i16so17102547wmd.3
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Oct 2019 05:38:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JVf8WN7xBd9PYBqnH43cH+97kwnYaDzSbrPxioWEiKA=;
 b=EkAt895gGaW5A1rBqlKEzkAAgmryUha0FwrnaFCeC/EOVzU85WkYgdfSxXsAEHZy0y
 qDbgm6xdXhUFzfqKHyG2JdcRWAd0b1rMYV11QhA+iHh+Ql2fX4oAM6agAGA0Dok8FPjI
 84bSTTG5LmDP2JxUMlpCJLjet6Y7Z8humrwgWN+zW4FU3nICMJO7yP2SZhu44VSRenZ7
 h/Yjl9F8vhyMuFi/8zl2Rbt2SPqxqF86RbLxs1zhpR551R+rEpAKQ4ZWj9K9tL/U1UtZ
 092EmJqTJHL2qcbFsaoxg45BqrH5N5o9iVVN/nLbfuP3sBP1EIuiyxwI2e6kEbjEOjFG
 wr2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JVf8WN7xBd9PYBqnH43cH+97kwnYaDzSbrPxioWEiKA=;
 b=OHzGcHG/CvPenDBaxxRKof3HY2JMh22o8wfaTLyqNe37B0T/f0djqUJHZBULID3iv7
 WFXfthaXJcSHJNVL+9PJQ0HALz9g1Q134iHqy+MGVMZbQJz3IN/DP1t/0MheqQOtfUPW
 W/okZa+J9JUn0dUSUhhVLCUtOlE3mlM1nA+b2NQFxvpZ/IyVut0WwUUdDxhlB7/isXxK
 Q5Rlf6cUuqFdrhcSey/DO06ohoatLlXLC+/D2Rk9BhfQCBiHQJJsy+eq8ZaJSjxp+/7c
 8ebvDtCRyMOSALjuXU7jeKbCb0k8hOmfmupZ39aDFUrhDhz3A38219lgSJ8Po5t5/pye
 jRQQ==
X-Gm-Message-State: APjAAAWq53vFPtaBgcjtgnrGtI175ItzUq8WmGh+NUNng4Cxg9K9zC6E
 f/H82/iP+vWuSDmkpoLlEDFFW6K5d8b60ntJiTY5Jg==
X-Google-Smtp-Source: APXvYqxo6dAxEC0Xc2Ehm69zOd3GmWLkNrSClTOjkirS1csFkKawvPprPHS/PkW16iQOAgWFc5ZnEj7oxeOItN8DwDc=
X-Received: by 2002:a7b:cb54:: with SMTP id v20mr7214490wmj.119.1571056727850; 
 Mon, 14 Oct 2019 05:38:47 -0700 (PDT)
MIME-Version: 1.0
References: <20191013043918.337113-1-ebiggers@kernel.org>
 <20191013043918.337113-3-ebiggers@kernel.org>
In-Reply-To: <20191013043918.337113-3-ebiggers@kernel.org>
From: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Date: Mon, 14 Oct 2019 14:38:36 +0200
Message-ID: <CAKv+Gu_pBCBRDf=yd5KbsqvrGQrQScoOCtcZ+_0K-gLPs94niA@mail.gmail.com>
Subject: Re: [PATCH 2/4] crypto: nx - convert AES-ECB to skcipher API
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
> Convert the PowerPC Nest (NX) implementation of AES-ECB from the
> deprecated "blkcipher" API to the "skcipher" API.  This is needed in
> order for the blkcipher API to be removed.
>
> Signed-off-by: Eric Biggers <ebiggers@google.com>

Reviewed-by: Ard Biesheuvel <ard.biesheuvel@linaro.org>

> ---
>  drivers/crypto/nx/nx-aes-ecb.c | 76 ++++++++++++++--------------------
>  drivers/crypto/nx/nx.c         | 28 ++++++++++---
>  drivers/crypto/nx/nx.h         |  5 ++-
>  3 files changed, 58 insertions(+), 51 deletions(-)
>
> diff --git a/drivers/crypto/nx/nx-aes-ecb.c b/drivers/crypto/nx/nx-aes-ecb.c
> index 87183890d1ab..77e338dc33f1 100644
> --- a/drivers/crypto/nx/nx-aes-ecb.c
> +++ b/drivers/crypto/nx/nx-aes-ecb.c
> @@ -18,11 +18,11 @@
>  #include "nx.h"
>
>
> -static int ecb_aes_nx_set_key(struct crypto_tfm *tfm,
> -                             const u8          *in_key,
> -                             unsigned int       key_len)
> +static int ecb_aes_nx_set_key(struct crypto_skcipher *tfm,
> +                             const u8               *in_key,
> +                             unsigned int            key_len)
>  {
> -       struct nx_crypto_ctx *nx_ctx = crypto_tfm_ctx(tfm);
> +       struct nx_crypto_ctx *nx_ctx = crypto_skcipher_ctx(tfm);
>         struct nx_csbcpb *csbcpb = (struct nx_csbcpb *)nx_ctx->csbcpb;
>
>         nx_ctx_init(nx_ctx, HCOP_FC_AES);
> @@ -50,13 +50,11 @@ static int ecb_aes_nx_set_key(struct crypto_tfm *tfm,
>         return 0;
>  }
>
> -static int ecb_aes_nx_crypt(struct blkcipher_desc *desc,
> -                           struct scatterlist    *dst,
> -                           struct scatterlist    *src,
> -                           unsigned int           nbytes,
> -                           int                    enc)
> +static int ecb_aes_nx_crypt(struct skcipher_request *req,
> +                           int                      enc)
>  {
> -       struct nx_crypto_ctx *nx_ctx = crypto_blkcipher_ctx(desc->tfm);
> +       struct crypto_skcipher *tfm = crypto_skcipher_reqtfm(req);
> +       struct nx_crypto_ctx *nx_ctx = crypto_skcipher_ctx(tfm);
>         struct nx_csbcpb *csbcpb = nx_ctx->csbcpb;
>         unsigned long irq_flags;
>         unsigned int processed = 0, to_process;
> @@ -70,10 +68,10 @@ static int ecb_aes_nx_crypt(struct blkcipher_desc *desc,
>                 NX_CPB_FDM(csbcpb) &= ~NX_FDM_ENDE_ENCRYPT;
>
>         do {
> -               to_process = nbytes - processed;
> +               to_process = req->cryptlen - processed;
>
> -               rc = nx_build_sg_lists(nx_ctx, NULL, dst, src, &to_process,
> -                                      processed, NULL);
> +               rc = nx_build_sg_lists(nx_ctx, NULL, req->dst, req->src,
> +                                      &to_process, processed, NULL);
>                 if (rc)
>                         goto out;
>
> @@ -83,7 +81,7 @@ static int ecb_aes_nx_crypt(struct blkcipher_desc *desc,
>                 }
>
>                 rc = nx_hcall_sync(nx_ctx, &nx_ctx->op,
> -                                  desc->flags & CRYPTO_TFM_REQ_MAY_SLEEP);
> +                                  req->base.flags & CRYPTO_TFM_REQ_MAY_SLEEP);
>                 if (rc)
>                         goto out;
>
> @@ -92,46 +90,36 @@ static int ecb_aes_nx_crypt(struct blkcipher_desc *desc,
>                              &(nx_ctx->stats->aes_bytes));
>
>                 processed += to_process;
> -       } while (processed < nbytes);
> +       } while (processed < req->cryptlen);
>
>  out:
>         spin_unlock_irqrestore(&nx_ctx->lock, irq_flags);
>         return rc;
>  }
>
> -static int ecb_aes_nx_encrypt(struct blkcipher_desc *desc,
> -                             struct scatterlist    *dst,
> -                             struct scatterlist    *src,
> -                             unsigned int           nbytes)
> +static int ecb_aes_nx_encrypt(struct skcipher_request *req)
>  {
> -       return ecb_aes_nx_crypt(desc, dst, src, nbytes, 1);
> +       return ecb_aes_nx_crypt(req, 1);
>  }
>
> -static int ecb_aes_nx_decrypt(struct blkcipher_desc *desc,
> -                             struct scatterlist    *dst,
> -                             struct scatterlist    *src,
> -                             unsigned int           nbytes)
> +static int ecb_aes_nx_decrypt(struct skcipher_request *req)
>  {
> -       return ecb_aes_nx_crypt(desc, dst, src, nbytes, 0);
> +       return ecb_aes_nx_crypt(req, 0);
>  }
>
> -struct crypto_alg nx_ecb_aes_alg = {
> -       .cra_name        = "ecb(aes)",
> -       .cra_driver_name = "ecb-aes-nx",
> -       .cra_priority    = 300,
> -       .cra_flags       = CRYPTO_ALG_TYPE_BLKCIPHER,
> -       .cra_blocksize   = AES_BLOCK_SIZE,
> -       .cra_alignmask   = 0xf,
> -       .cra_ctxsize     = sizeof(struct nx_crypto_ctx),
> -       .cra_type        = &crypto_blkcipher_type,
> -       .cra_module      = THIS_MODULE,
> -       .cra_init        = nx_crypto_ctx_aes_ecb_init,
> -       .cra_exit        = nx_crypto_ctx_exit,
> -       .cra_blkcipher = {
> -               .min_keysize = AES_MIN_KEY_SIZE,
> -               .max_keysize = AES_MAX_KEY_SIZE,
> -               .setkey      = ecb_aes_nx_set_key,
> -               .encrypt     = ecb_aes_nx_encrypt,
> -               .decrypt     = ecb_aes_nx_decrypt,
> -       }
> +struct skcipher_alg nx_ecb_aes_alg = {
> +       .base.cra_name          = "ecb(aes)",
> +       .base.cra_driver_name   = "ecb-aes-nx",
> +       .base.cra_priority      = 300,
> +       .base.cra_blocksize     = AES_BLOCK_SIZE,
> +       .base.cra_alignmask     = 0xf,
> +       .base.cra_ctxsize       = sizeof(struct nx_crypto_ctx),
> +       .base.cra_module        = THIS_MODULE,
> +       .init                   = nx_crypto_ctx_aes_ecb_init,
> +       .exit                   = nx_crypto_ctx_skcipher_exit,
> +       .min_keysize            = AES_MIN_KEY_SIZE,
> +       .max_keysize            = AES_MAX_KEY_SIZE,
> +       .setkey                 = ecb_aes_nx_set_key,
> +       .encrypt                = ecb_aes_nx_encrypt,
> +       .decrypt                = ecb_aes_nx_decrypt,
>  };
> diff --git a/drivers/crypto/nx/nx.c b/drivers/crypto/nx/nx.c
> index 1202a00715ac..4b97081e7486 100644
> --- a/drivers/crypto/nx/nx.c
> +++ b/drivers/crypto/nx/nx.c
> @@ -517,6 +517,12 @@ static int nx_register_alg(struct crypto_alg *alg, u32 fc, u32 mode)
>                crypto_register_alg(alg) : 0;
>  }
>
> +static int nx_register_skcipher(struct skcipher_alg *alg, u32 fc, u32 mode)
> +{
> +       return nx_check_props(&nx_driver.viodev->dev, fc, mode) ?
> +              crypto_register_skcipher(alg) : 0;
> +}
> +
>  static int nx_register_aead(struct aead_alg *alg, u32 fc, u32 mode)
>  {
>         return nx_check_props(&nx_driver.viodev->dev, fc, mode) ?
> @@ -537,6 +543,12 @@ static void nx_unregister_alg(struct crypto_alg *alg, u32 fc, u32 mode)
>                 crypto_unregister_alg(alg);
>  }
>
> +static void nx_unregister_skcipher(struct skcipher_alg *alg, u32 fc, u32 mode)
> +{
> +       if (nx_check_props(NULL, fc, mode))
> +               crypto_unregister_skcipher(alg);
> +}
> +
>  static void nx_unregister_aead(struct aead_alg *alg, u32 fc, u32 mode)
>  {
>         if (nx_check_props(NULL, fc, mode))
> @@ -573,7 +585,7 @@ static int nx_register_algs(void)
>
>         nx_driver.of.status = NX_OKAY;
>
> -       rc = nx_register_alg(&nx_ecb_aes_alg, NX_FC_AES, NX_MODE_AES_ECB);
> +       rc = nx_register_skcipher(&nx_ecb_aes_alg, NX_FC_AES, NX_MODE_AES_ECB);
>         if (rc)
>                 goto out;
>
> @@ -637,7 +649,7 @@ static int nx_register_algs(void)
>  out_unreg_cbc:
>         nx_unregister_alg(&nx_cbc_aes_alg, NX_FC_AES, NX_MODE_AES_CBC);
>  out_unreg_ecb:
> -       nx_unregister_alg(&nx_ecb_aes_alg, NX_FC_AES, NX_MODE_AES_ECB);
> +       nx_unregister_skcipher(&nx_ecb_aes_alg, NX_FC_AES, NX_MODE_AES_ECB);
>  out:
>         return rc;
>  }
> @@ -716,9 +728,9 @@ int nx_crypto_ctx_aes_cbc_init(struct crypto_tfm *tfm)
>                                   NX_MODE_AES_CBC);
>  }
>
> -int nx_crypto_ctx_aes_ecb_init(struct crypto_tfm *tfm)
> +int nx_crypto_ctx_aes_ecb_init(struct crypto_skcipher *tfm)
>  {
> -       return nx_crypto_ctx_init(crypto_tfm_ctx(tfm), NX_FC_AES,
> +       return nx_crypto_ctx_init(crypto_skcipher_ctx(tfm), NX_FC_AES,
>                                   NX_MODE_AES_ECB);
>  }
>
> @@ -752,6 +764,11 @@ void nx_crypto_ctx_exit(struct crypto_tfm *tfm)
>         nx_ctx->out_sg = NULL;
>  }
>
> +void nx_crypto_ctx_skcipher_exit(struct crypto_skcipher *tfm)
> +{
> +       nx_crypto_ctx_exit(crypto_skcipher_ctx(tfm));
> +}
> +
>  void nx_crypto_ctx_aead_exit(struct crypto_aead *tfm)
>  {
>         struct nx_crypto_ctx *nx_ctx = crypto_aead_ctx(tfm);
> @@ -801,7 +818,8 @@ static int nx_remove(struct vio_dev *viodev)
>                 nx_unregister_alg(&nx_ctr3686_aes_alg,
>                                   NX_FC_AES, NX_MODE_AES_CTR);
>                 nx_unregister_alg(&nx_cbc_aes_alg, NX_FC_AES, NX_MODE_AES_CBC);
> -               nx_unregister_alg(&nx_ecb_aes_alg, NX_FC_AES, NX_MODE_AES_ECB);
> +               nx_unregister_skcipher(&nx_ecb_aes_alg, NX_FC_AES,
> +                                      NX_MODE_AES_ECB);
>         }
>
>         return 0;
> diff --git a/drivers/crypto/nx/nx.h b/drivers/crypto/nx/nx.h
> index 768ebae9731e..1a839ef21c4f 100644
> --- a/drivers/crypto/nx/nx.h
> +++ b/drivers/crypto/nx/nx.h
> @@ -147,9 +147,10 @@ int nx_crypto_ctx_aes_gcm_init(struct crypto_aead *tfm);
>  int nx_crypto_ctx_aes_xcbc_init(struct crypto_tfm *tfm);
>  int nx_crypto_ctx_aes_ctr_init(struct crypto_tfm *tfm);
>  int nx_crypto_ctx_aes_cbc_init(struct crypto_tfm *tfm);
> -int nx_crypto_ctx_aes_ecb_init(struct crypto_tfm *tfm);
> +int nx_crypto_ctx_aes_ecb_init(struct crypto_skcipher *tfm);
>  int nx_crypto_ctx_sha_init(struct crypto_tfm *tfm);
>  void nx_crypto_ctx_exit(struct crypto_tfm *tfm);
> +void nx_crypto_ctx_skcipher_exit(struct crypto_skcipher *tfm);
>  void nx_crypto_ctx_aead_exit(struct crypto_aead *tfm);
>  void nx_ctx_init(struct nx_crypto_ctx *nx_ctx, unsigned int function);
>  int nx_hcall_sync(struct nx_crypto_ctx *ctx, struct vio_pfo_op *op,
> @@ -176,7 +177,7 @@ void nx_debugfs_fini(struct nx_crypto_driver *);
>  #define NX_PAGE_NUM(x)         ((u64)(x) & 0xfffffffffffff000ULL)
>
>  extern struct crypto_alg nx_cbc_aes_alg;
> -extern struct crypto_alg nx_ecb_aes_alg;
> +extern struct skcipher_alg nx_ecb_aes_alg;
>  extern struct aead_alg nx_gcm_aes_alg;
>  extern struct aead_alg nx_gcm4106_aes_alg;
>  extern struct crypto_alg nx_ctr3686_aes_alg;
> --
> 2.23.0
>
