Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 28D64871012
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Mar 2024 23:28:52 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=qTQ7gLuC;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TpYJK6p3Rz3dWG
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Mar 2024 09:28:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=qTQ7gLuC;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=jarkko@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TpYHV52Jgz2yt0
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Mar 2024 09:28:06 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E76BB60AEB;
	Mon,  4 Mar 2024 22:28:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11FB8C433F1;
	Mon,  4 Mar 2024 22:27:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709591283;
	bh=O7ghxOz+tnaZWn/nOXvh3ShKeX06gALHOmHkv+3J2/Q=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=qTQ7gLuCWzqyriT4oUSLlJ8sKltSRQlBobaQEXm43MZ45PttQThgFD5iMwWXUJfnG
	 oofStCylr2SAU0p3mZh2UdqYoXzOoXy10WrbRe+bSl/iDJcE8aQzvSsz80X1K7kSha
	 PW4wsh9pmIArriU4BePfo1E7HMVsMA4WNvcQ9tWUKIUiaj4QTowMS7Ur1VJyy9q8qk
	 CwXFwli+u0ns7eTYxxzBFv7XbRdFcesMnY1i2DjORTe6OZizxsOVEtegrEC3PIHSZY
	 hu/VtCABKlw9f861AkeoLKBfCVMCqg66H0FiiIXn0VDRAD1hkoSpTFZWUh3x6C/wpu
	 AazA2tdooL7yw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 05 Mar 2024 00:27:54 +0200
Message-Id: <CZLBJ1HAC4TO.1F1C2IV0Z9RTF@suppilovahvero>
Subject: Re: [PATCH v5 1/6] crypto: mxs-dcp: Add support for hardware-bound
 keys
From: "Jarkko Sakkinen" <jarkko@kernel.org>
To: "David Gstir" <david@sigma-star.at>, "Mimi Zohar" <zohar@linux.ibm.com>,
 "James Bottomley" <jejb@linux.ibm.com>, "Herbert Xu"
 <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>
X-Mailer: aerc 0.15.2
References: <20231215110639.45522-1-david@sigma-star.at>
 <20231215110639.45522-2-david@sigma-star.at>
In-Reply-To: <20231215110639.45522-2-david@sigma-star.at>
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
Cc: linux-doc@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, David Howells <dhowells@redhat.com>, keyrings@vger.kernel.org, Fabio Estevam <festevam@gmail.com>, Ahmad Fatoum <a.fatoum@pengutronix.de>, Paul Moore <paul@paul-moore.com>, Jonathan Corbet <corbet@lwn.net>, Richard Weinberger <richard@nod.at>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, James Morris <jmorris@namei.org>, NXP Linux
 Team <linux-imx@nxp.com>, "Serge E.
 Hallyn" <serge@hallyn.com>, "Paul E. McKenney" <paulmck@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, sigma
 star Kernel Team <upstream+dcp@sigma-star.at>, "Steven Rostedt
 \(Google\)" <rostedt@goodmis.org>, David Oberhollenzer <david.oberhollenzer@sigma-star.at>, linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, Randy
 Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org, Li Yang <leoyang.li@nxp.com>, linux-security-module@vger.kernel.org, linux-crypto@vger.kernel.org, Pengutronix Kernel Team <kernel@pengutronix.de>, Tejun Heo <tj@kernel.org>, linux-integrity@vger.kernel.org, Shawn Guo <shawnguo@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Further remarks.

On Fri Dec 15, 2023 at 1:06 PM EET, David Gstir wrote:
> DCP is capable of performing AES with two hardware-bound keys:
>
> - The one-time programmable (OTP) key which is burnt via on-chip fuses
> - The unique key (UK) which is derived from the OTP key
>
> In addition to the two hardware-bound keys, DCP also supports
> storing keys in 4 dedicated key slots within its secure memory area
> (internal SRAM).
>
> These keys are not stored in main memory and are therefore
> not directly accessible by the operating system. To use them
> for AES operations, a one-byte key reference has to supplied
> with the DCP operation descriptor in the control register.
>
> This adds support for using any of these 6 keys through the crypto API
> via their key reference after they have been set up. The main purpose

Please write actions always in imperative form. E.g. instead of "This
adds" you could just as well simply write "Add", right?

Also, "adding support" is somewhat abstract expression tbh. You should
rather point out the driver exactly you are modifying (completely
missing BTW) and what sort of new functionalities this mysetery word
"support" maps into.

More cocrete and dumbed you can ever be, the better is the commit
message and more likely we also get the code changes you are doing.

> is to add support for DCP-backed trusted keys. Other use cases are
> possible too (see similar existing paes implementations), but these
> should carefully be evaluated as e.g. enabling AF_ALG will give
> userspace full access to use keys. In scenarios with untrustworthy
> userspace, this will enable en-/decryption oracles.
>
> Co-developed-by: Richard Weinberger <richard@nod.at>
> Signed-off-by: Richard Weinberger <richard@nod.at>
> Co-developed-by: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
> Signed-off-by: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
> Signed-off-by: David Gstir <david@sigma-star.at>
> Acked-by: Herbert Xu <herbert@gondor.apana.org.au>
> ---
>  drivers/crypto/mxs-dcp.c | 104 ++++++++++++++++++++++++++++++++++-----
>  include/soc/fsl/dcp.h    |  17 +++++++
>  2 files changed, 110 insertions(+), 11 deletions(-)
>  create mode 100644 include/soc/fsl/dcp.h
>
> diff --git a/drivers/crypto/mxs-dcp.c b/drivers/crypto/mxs-dcp.c
> index f6b7bce0e656..2dc664fb2faf 100644
> --- a/drivers/crypto/mxs-dcp.c
> +++ b/drivers/crypto/mxs-dcp.c
> @@ -15,6 +15,7 @@
>  #include <linux/platform_device.h>
>  #include <linux/stmp_device.h>
>  #include <linux/clk.h>
> +#include <soc/fsl/dcp.h>
> =20
>  #include <crypto/aes.h>
>  #include <crypto/sha1.h>
> @@ -101,6 +102,7 @@ struct dcp_async_ctx {
>  	struct crypto_skcipher		*fallback;
>  	unsigned int			key_len;
>  	uint8_t				key[AES_KEYSIZE_128];
> +	bool				key_referenced;
>  };
> =20
>  struct dcp_aes_req_ctx {
> @@ -155,6 +157,7 @@ static struct dcp *global_sdcp;
>  #define MXS_DCP_CONTROL0_HASH_TERM		(1 << 13)
>  #define MXS_DCP_CONTROL0_HASH_INIT		(1 << 12)
>  #define MXS_DCP_CONTROL0_PAYLOAD_KEY		(1 << 11)
> +#define MXS_DCP_CONTROL0_OTP_KEY		(1 << 10)
>  #define MXS_DCP_CONTROL0_CIPHER_ENCRYPT		(1 << 8)
>  #define MXS_DCP_CONTROL0_CIPHER_INIT		(1 << 9)
>  #define MXS_DCP_CONTROL0_ENABLE_HASH		(1 << 6)
> @@ -168,6 +171,8 @@ static struct dcp *global_sdcp;
>  #define MXS_DCP_CONTROL1_CIPHER_MODE_ECB	(0 << 4)
>  #define MXS_DCP_CONTROL1_CIPHER_SELECT_AES128	(0 << 0)
> =20
> +#define MXS_DCP_CONTROL1_KEY_SELECT_SHIFT	8
> +
>  static int mxs_dcp_start_dma(struct dcp_async_ctx *actx)
>  {
>  	int dma_err;
> @@ -224,13 +229,16 @@ static int mxs_dcp_run_aes(struct dcp_async_ctx *ac=
tx,
>  	struct dcp *sdcp =3D global_sdcp;
>  	struct dcp_dma_desc *desc =3D &sdcp->coh->desc[actx->chan];
>  	struct dcp_aes_req_ctx *rctx =3D skcipher_request_ctx(req);
> +	bool key_referenced =3D actx->key_referenced;
>  	int ret;
> =20
> -	key_phys =3D dma_map_single(sdcp->dev, sdcp->coh->aes_key,
> -				  2 * AES_KEYSIZE_128, DMA_TO_DEVICE);
> -	ret =3D dma_mapping_error(sdcp->dev, key_phys);
> -	if (ret)
> -		return ret;
> +	if (!key_referenced) {
> +		key_phys =3D dma_map_single(sdcp->dev, sdcp->coh->aes_key,
> +					  2 * AES_KEYSIZE_128, DMA_TO_DEVICE);
> +		ret =3D dma_mapping_error(sdcp->dev, key_phys);
> +		if (ret)
> +			return ret;
> +	}
> =20
>  	src_phys =3D dma_map_single(sdcp->dev, sdcp->coh->aes_in_buf,
>  				  DCP_BUF_SZ, DMA_TO_DEVICE);
> @@ -255,8 +263,12 @@ static int mxs_dcp_run_aes(struct dcp_async_ctx *act=
x,
>  		    MXS_DCP_CONTROL0_INTERRUPT |
>  		    MXS_DCP_CONTROL0_ENABLE_CIPHER;
> =20
> -	/* Payload contains the key. */
> -	desc->control0 |=3D MXS_DCP_CONTROL0_PAYLOAD_KEY;
> +	if (key_referenced)
> +		/* Set OTP key bit to select the key via KEY_SELECT. */
> +		desc->control0 |=3D MXS_DCP_CONTROL0_OTP_KEY;
> +	else
> +		/* Payload contains the key. */
> +		desc->control0 |=3D MXS_DCP_CONTROL0_PAYLOAD_KEY;
> =20
>  	if (rctx->enc)
>  		desc->control0 |=3D MXS_DCP_CONTROL0_CIPHER_ENCRYPT;
> @@ -270,6 +282,9 @@ static int mxs_dcp_run_aes(struct dcp_async_ctx *actx=
,
>  	else
>  		desc->control1 |=3D MXS_DCP_CONTROL1_CIPHER_MODE_CBC;
> =20
> +	if (key_referenced)
> +		desc->control1 |=3D sdcp->coh->aes_key[0] << MXS_DCP_CONTROL1_KEY_SELE=
CT_SHIFT;
> +
>  	desc->next_cmd_addr =3D 0;
>  	desc->source =3D src_phys;
>  	desc->destination =3D dst_phys;
> @@ -284,9 +299,9 @@ static int mxs_dcp_run_aes(struct dcp_async_ctx *actx=
,
>  err_dst:
>  	dma_unmap_single(sdcp->dev, src_phys, DCP_BUF_SZ, DMA_TO_DEVICE);
>  err_src:
> -	dma_unmap_single(sdcp->dev, key_phys, 2 * AES_KEYSIZE_128,
> -			 DMA_TO_DEVICE);
> -
> +	if (!key_referenced)
> +		dma_unmap_single(sdcp->dev, key_phys, 2 * AES_KEYSIZE_128,
> +				 DMA_TO_DEVICE);
>  	return ret;
>  }
> =20
> @@ -453,7 +468,7 @@ static int mxs_dcp_aes_enqueue(struct skcipher_reques=
t *req, int enc, int ecb)
>  	struct dcp_aes_req_ctx *rctx =3D skcipher_request_ctx(req);
>  	int ret;
> =20
> -	if (unlikely(actx->key_len !=3D AES_KEYSIZE_128))
> +	if (unlikely(actx->key_len !=3D AES_KEYSIZE_128 && !actx->key_reference=
d))
>  		return mxs_dcp_block_fallback(req, enc);
> =20
>  	rctx->enc =3D enc;
> @@ -500,6 +515,7 @@ static int mxs_dcp_aes_setkey(struct crypto_skcipher =
*tfm, const u8 *key,
>  	 * there can still be an operation in progress.
>  	 */
>  	actx->key_len =3D len;
> +	actx->key_referenced =3D false;
>  	if (len =3D=3D AES_KEYSIZE_128) {
>  		memcpy(actx->key, key, len);
>  		return 0;
> @@ -516,6 +532,32 @@ static int mxs_dcp_aes_setkey(struct crypto_skcipher=
 *tfm, const u8 *key,
>  	return crypto_skcipher_setkey(actx->fallback, key, len);
>  }
> =20
> +static int mxs_dcp_aes_setrefkey(struct crypto_skcipher *tfm, const u8 *=
key,
> +				 unsigned int len)
> +{
> +	struct dcp_async_ctx *actx =3D crypto_skcipher_ctx(tfm);
> +
> +	if (len !=3D DCP_PAES_KEYSIZE)
> +		return -EINVAL;
> +
> +	switch (key[0]) {
> +	case DCP_PAES_KEY_SLOT0:
> +	case DCP_PAES_KEY_SLOT1:
> +	case DCP_PAES_KEY_SLOT2:
> +	case DCP_PAES_KEY_SLOT3:
> +	case DCP_PAES_KEY_UNIQUE:
> +	case DCP_PAES_KEY_OTP:
> +		memcpy(actx->key, key, len);
> +		actx->key_len =3D len;
> +		actx->key_referenced =3D true;
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
>  static int mxs_dcp_aes_fallback_init_tfm(struct crypto_skcipher *tfm)
>  {
>  	const char *name =3D crypto_tfm_alg_name(crypto_skcipher_tfm(tfm));
> @@ -539,6 +581,13 @@ static void mxs_dcp_aes_fallback_exit_tfm(struct cry=
pto_skcipher *tfm)
>  	crypto_free_skcipher(actx->fallback);
>  }
> =20
> +static int mxs_dcp_paes_init_tfm(struct crypto_skcipher *tfm)
> +{
> +	crypto_skcipher_set_reqsize(tfm, sizeof(struct dcp_aes_req_ctx));
> +
> +	return 0;
> +}
> +
>  /*
>   * Hashing (SHA1/SHA256)
>   */
> @@ -889,6 +938,39 @@ static struct skcipher_alg dcp_aes_algs[] =3D {
>  		.ivsize			=3D AES_BLOCK_SIZE,
>  		.init			=3D mxs_dcp_aes_fallback_init_tfm,
>  		.exit			=3D mxs_dcp_aes_fallback_exit_tfm,
> +	}, {
> +		.base.cra_name		=3D "ecb(paes)",
> +		.base.cra_driver_name	=3D "ecb-paes-dcp",
> +		.base.cra_priority	=3D 401,
> +		.base.cra_alignmask	=3D 15,
> +		.base.cra_flags		=3D CRYPTO_ALG_ASYNC | CRYPTO_ALG_INTERNAL,
> +		.base.cra_blocksize	=3D AES_BLOCK_SIZE,
> +		.base.cra_ctxsize	=3D sizeof(struct dcp_async_ctx),
> +		.base.cra_module	=3D THIS_MODULE,
> +
> +		.min_keysize		=3D DCP_PAES_KEYSIZE,
> +		.max_keysize		=3D DCP_PAES_KEYSIZE,
> +		.setkey			=3D mxs_dcp_aes_setrefkey,
> +		.encrypt		=3D mxs_dcp_aes_ecb_encrypt,
> +		.decrypt		=3D mxs_dcp_aes_ecb_decrypt,
> +		.init			=3D mxs_dcp_paes_init_tfm,
> +	}, {
> +		.base.cra_name		=3D "cbc(paes)",
> +		.base.cra_driver_name	=3D "cbc-paes-dcp",
> +		.base.cra_priority	=3D 401,
> +		.base.cra_alignmask	=3D 15,
> +		.base.cra_flags		=3D CRYPTO_ALG_ASYNC | CRYPTO_ALG_INTERNAL,
> +		.base.cra_blocksize	=3D AES_BLOCK_SIZE,
> +		.base.cra_ctxsize	=3D sizeof(struct dcp_async_ctx),
> +		.base.cra_module	=3D THIS_MODULE,
> +
> +		.min_keysize		=3D DCP_PAES_KEYSIZE,
> +		.max_keysize		=3D DCP_PAES_KEYSIZE,
> +		.setkey			=3D mxs_dcp_aes_setrefkey,
> +		.encrypt		=3D mxs_dcp_aes_cbc_encrypt,
> +		.decrypt		=3D mxs_dcp_aes_cbc_decrypt,
> +		.ivsize			=3D AES_BLOCK_SIZE,
> +		.init			=3D mxs_dcp_paes_init_tfm,
>  	},
>  };
> =20
> diff --git a/include/soc/fsl/dcp.h b/include/soc/fsl/dcp.h
> new file mode 100644
> index 000000000000..cda89e260c46
> --- /dev/null
> +++ b/include/soc/fsl/dcp.h
> @@ -0,0 +1,17 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (C) 2021 sigma star gmbh

nit: short description of the contents would not harm.

> + */
> +
> +#ifndef MXS_DCP_H
> +#define MXS_DCP_H
> +
> +#define DCP_PAES_KEYSIZE 1
> +#define DCP_PAES_KEY_SLOT0 0x00
> +#define DCP_PAES_KEY_SLOT1 0x01
> +#define DCP_PAES_KEY_SLOT2 0x02
> +#define DCP_PAES_KEY_SLOT3 0x03
> +#define DCP_PAES_KEY_UNIQUE 0xfe
> +#define DCP_PAES_KEY_OTP 0xff
> +
> +#endif /* MXS_DCP_H */

BR, Jarkko
