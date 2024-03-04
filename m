Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B26F871041
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Mar 2024 23:45:03 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=aDUYHl/g;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TpYg1153Dz3dwr
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Mar 2024 09:45:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=aDUYHl/g;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=jarkko@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TpYdx6S7pz3dW2
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Mar 2024 09:44:05 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C3FCA60C4D;
	Mon,  4 Mar 2024 22:44:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D19A7C433C7;
	Mon,  4 Mar 2024 22:43:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709592243;
	bh=dmAbF1CtHmg87P884fbtkaF7czfd8ruUOuskVOi2PtQ=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=aDUYHl/gUofy53yoXtNjHkIQWBIVaDhKAUqxtXBJa2gYq1suh2g+9gqQhNtt1kojb
	 +h1X1x1BIAUjNMFUioZpvuJsU/2MuFEl4H+FZIvOusrZ5HT8qsQO8iIhXX7V0zrhBW
	 8WqZu/FvwSrtRWtyS5+EP/E+3D1wG4Jbqy+e+6+fm2xOmCujogm7U4tkUvxQYP2khC
	 Xo8RW/I7F3aswG/uduAW9Nj9fPGZRGyO+5rALrO8WQyxAL1isEByuJlcQQ7jZWb/5A
	 9hAdKwepwVah24U7WvGEu4yPFrJuOPE7ImHeZsYIuY93eVsVXem5xQ4ZNj5UQYwDu5
	 fULY0/jFyYPrQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 05 Mar 2024 00:43:54 +0200
Message-Id: <CZLBVAE478RG.3M8NKJAYI9QS5@suppilovahvero>
Subject: Re: [PATCH v5 3/6] KEYS: trusted: Introduce NXP DCP-backed trusted
 keys
From: "Jarkko Sakkinen" <jarkko@kernel.org>
To: "David Gstir" <david@sigma-star.at>, "Mimi Zohar" <zohar@linux.ibm.com>,
 "James Bottomley" <jejb@linux.ibm.com>, "Herbert Xu"
 <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>
X-Mailer: aerc 0.15.2
References: <20231215110639.45522-1-david@sigma-star.at>
 <20231215110639.45522-4-david@sigma-star.at>
In-Reply-To: <20231215110639.45522-4-david@sigma-star.at>
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

On Fri Dec 15, 2023 at 1:06 PM EET, David Gstir wrote:
> DCP (Data Co-Processor) is the little brother of NXP's CAAM IP.
> Beside of accelerated crypto operations, it also offers support for

Why acronym is not opened already in the first patch? Also, that does
not mean it could not be opened also here. Sometimes redundancy is for
better...

> hardware-bound keys. Using this feature it is possible to implement a blo=
b
> mechanism similar to what CAAM offers. Unlike on CAAM, constructing and
> parsing the blob has to happen in software (i.e. the kernel).
>
> The software-based blob format used by DCP trusted keys encrypts
> the payload using AES-128-GCM with a freshly generated random key and non=
ce.
> The random key itself is AES-128-ECB encrypted using the DCP unique
> or OTP key.
>
> The DCP trusted key blob format is:
> /*
>  * struct dcp_blob_fmt - DCP BLOB format.
>  *
>  * @fmt_version: Format version, currently being %1
>  * @blob_key: Random AES 128 key which is used to encrypt @payload,
>  *            @blob_key itself is encrypted with OTP or UNIQUE device key=
 in
>  *            AES-128-ECB mode by DCP.
>  * @nonce: Random nonce used for @payload encryption.
>  * @payload_len: Length of the plain text @payload.
>  * @payload: The payload itself, encrypted using AES-128-GCM and @blob_ke=
y,
>  *           GCM auth tag of size AES_BLOCK_SIZE is attached at the end o=
f it.
>  *
>  * The total size of a DCP BLOB is sizeof(struct dcp_blob_fmt) + @payload=
_len +
>  * AES_BLOCK_SIZE.
>  */
> struct dcp_blob_fmt {
> 	__u8 fmt_version;
> 	__u8 blob_key[AES_KEYSIZE_128];
> 	__u8 nonce[AES_KEYSIZE_128];
> 	__le32 payload_len;
> 	__u8 payload[];
> } __packed;
>
> By default the unique key is used. It is also possible to use the
> OTP key. While the unique key should be unique it is not documented how
> this key is derived. Therefore selection the OTP key is supported as
> well via the use_otp_key module parameter.

This is pretty good but I'll look it in more detail in the next
iteration of the patch set.

>
> Co-developed-by: Richard Weinberger <richard@nod.at>
> Signed-off-by: Richard Weinberger <richard@nod.at>
> Co-developed-by: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
> Signed-off-by: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
> Signed-off-by: David Gstir <david@sigma-star.at>
> ---
>  include/keys/trusted_dcp.h                |  11 +
>  security/keys/trusted-keys/Kconfig        |   8 +
>  security/keys/trusted-keys/Makefile       |   2 +
>  security/keys/trusted-keys/trusted_core.c |   6 +-
>  security/keys/trusted-keys/trusted_dcp.c  | 311 ++++++++++++++++++++++
>  5 files changed, 337 insertions(+), 1 deletion(-)
>  create mode 100644 include/keys/trusted_dcp.h
>  create mode 100644 security/keys/trusted-keys/trusted_dcp.c
>
> diff --git a/include/keys/trusted_dcp.h b/include/keys/trusted_dcp.h
> new file mode 100644
> index 000000000000..9aaa42075b40
> --- /dev/null
> +++ b/include/keys/trusted_dcp.h
> @@ -0,0 +1,11 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (C) 2021 sigma star gmbh
> + */
> +
> +#ifndef TRUSTED_DCP_H
> +#define TRUSTED_DCP_H
> +
> +extern struct trusted_key_ops dcp_trusted_key_ops;
> +
> +#endif
> diff --git a/security/keys/trusted-keys/Kconfig b/security/keys/trusted-k=
eys/Kconfig
> index 553dc117f385..1fb8aa001995 100644
> --- a/security/keys/trusted-keys/Kconfig
> +++ b/security/keys/trusted-keys/Kconfig
> @@ -39,6 +39,14 @@ config TRUSTED_KEYS_CAAM
>  	  Enable use of NXP's Cryptographic Accelerator and Assurance Module
>  	  (CAAM) as trusted key backend.
> =20
> +config TRUSTED_KEYS_DCP
> +	bool "DCP-based trusted keys"
> +	depends on CRYPTO_DEV_MXS_DCP >=3D TRUSTED_KEYS
> +	default y
> +	select HAVE_TRUSTED_KEYS
> +	help
> +	  Enable use of NXP's DCP (Data Co-Processor) as trusted key backend.
> +
>  if !HAVE_TRUSTED_KEYS
>  	comment "No trust source selected!"
>  endif
> diff --git a/security/keys/trusted-keys/Makefile b/security/keys/trusted-=
keys/Makefile
> index 735aa0bc08ef..f0f3b27f688b 100644
> --- a/security/keys/trusted-keys/Makefile
> +++ b/security/keys/trusted-keys/Makefile
> @@ -14,3 +14,5 @@ trusted-$(CONFIG_TRUSTED_KEYS_TPM) +=3D tpm2key.asn1.o
>  trusted-$(CONFIG_TRUSTED_KEYS_TEE) +=3D trusted_tee.o
> =20
>  trusted-$(CONFIG_TRUSTED_KEYS_CAAM) +=3D trusted_caam.o
> +
> +trusted-$(CONFIG_TRUSTED_KEYS_DCP) +=3D trusted_dcp.o
> diff --git a/security/keys/trusted-keys/trusted_core.c b/security/keys/tr=
usted-keys/trusted_core.c
> index c6fc50d67214..8af0988be850 100644
> --- a/security/keys/trusted-keys/trusted_core.c
> +++ b/security/keys/trusted-keys/trusted_core.c
> @@ -10,6 +10,7 @@
>  #include <keys/trusted-type.h>
>  #include <keys/trusted_tee.h>
>  #include <keys/trusted_caam.h>
> +#include <keys/trusted_dcp.h>
>  #include <keys/trusted_tpm.h>
>  #include <linux/capability.h>
>  #include <linux/err.h>
> @@ -30,7 +31,7 @@ MODULE_PARM_DESC(rng, "Select trusted key RNG");
> =20
>  static char *trusted_key_source;
>  module_param_named(source, trusted_key_source, charp, 0);
> -MODULE_PARM_DESC(source, "Select trusted keys source (tpm, tee or caam)"=
);
> +MODULE_PARM_DESC(source, "Select trusted keys source (tpm, tee, caam or =
dcp)");
> =20
>  static const struct trusted_key_source trusted_key_sources[] =3D {
>  #if defined(CONFIG_TRUSTED_KEYS_TPM)
> @@ -42,6 +43,9 @@ static const struct trusted_key_source trusted_key_sour=
ces[] =3D {
>  #if defined(CONFIG_TRUSTED_KEYS_CAAM)
>  	{ "caam", &trusted_key_caam_ops },
>  #endif
> +#if defined(CONFIG_TRUSTED_KEYS_DCP)
> +	{ "dcp", &dcp_trusted_key_ops },
> +#endif
>  };
> =20
>  DEFINE_STATIC_CALL_NULL(trusted_key_init, *trusted_key_sources[0].ops->i=
nit);
> diff --git a/security/keys/trusted-keys/trusted_dcp.c b/security/keys/tru=
sted-keys/trusted_dcp.c
> new file mode 100644
> index 000000000000..8d19b92fe976
> --- /dev/null
> +++ b/security/keys/trusted-keys/trusted_dcp.c
> @@ -0,0 +1,311 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (C) 2021 sigma star gmbh
> + */
> +
> +#include <crypto/aead.h>
> +#include <crypto/aes.h>
> +#include <crypto/algapi.h>
> +#include <crypto/gcm.h>
> +#include <crypto/skcipher.h>
> +#include <keys/trusted-type.h>
> +#include <linux/key-type.h>
> +#include <linux/module.h>
> +#include <linux/printk.h>
> +#include <linux/random.h>
> +#include <linux/scatterlist.h>
> +#include <soc/fsl/dcp.h>
> +
> +#define DCP_BLOB_VERSION 1
> +#define DCP_BLOB_AUTHLEN 16
> +
> +/**
> + * struct dcp_blob_fmt - DCP BLOB format.
> + *
> + * @fmt_version: Format version, currently being %1.
> + * @blob_key: Random AES 128 key which is used to encrypt @payload,
> + *            @blob_key itself is encrypted with OTP or UNIQUE device ke=
y in
> + *            AES-128-ECB mode by DCP.
> + * @nonce: Random nonce used for @payload encryption.
> + * @payload_len: Length of the plain text @payload.
> + * @payload: The payload itself, encrypted using AES-128-GCM and @blob_k=
ey,
> + *           GCM auth tag of size DCP_BLOB_AUTHLEN is attached at the en=
d of it.
> + *
> + * The total size of a DCP BLOB is sizeof(struct dcp_blob_fmt) + @payloa=
d_len +
> + * DCP_BLOB_AUTHLEN.
> + */
> +struct dcp_blob_fmt {
> +	__u8 fmt_version;
> +	__u8 blob_key[AES_KEYSIZE_128];
> +	__u8 nonce[AES_KEYSIZE_128];
> +	__le32 payload_len;
> +	__u8 payload[];
> +} __packed;
> +
> +static bool use_otp_key;
> +module_param_named(dcp_use_otp_key, use_otp_key, bool, 0);
> +MODULE_PARM_DESC(dcp_use_otp_key, "Use OTP instead of UNIQUE key for sea=
ling");
> +
> +static bool skip_zk_test;
> +module_param_named(dcp_skip_zk_test, skip_zk_test, bool, 0);
> +MODULE_PARM_DESC(dcp_skip_zk_test, "Don't test whether device keys are z=
ero'ed");
> +
> +static unsigned int calc_blob_len(unsigned int payload_len)
> +{
> +	return sizeof(struct dcp_blob_fmt) + payload_len + DCP_BLOB_AUTHLEN;
> +}
> +
> +static int do_dcp_crypto(u8 *in, u8 *out, bool is_encrypt)
> +{
> +	int res =3D 0;
> +	struct skcipher_request *req =3D NULL;
> +	DECLARE_CRYPTO_WAIT(wait);
> +	struct scatterlist src_sg, dst_sg;
> +	struct crypto_skcipher *tfm;
> +	u8 paes_key[DCP_PAES_KEYSIZE];

Can you put these into reverse tree order (descending length)?

> +
> +	if (use_otp_key)
> +		paes_key[0] =3D DCP_PAES_KEY_OTP;
> +	else
> +		paes_key[0] =3D DCP_PAES_KEY_UNIQUE;
> +
> +	tfm =3D crypto_alloc_skcipher("ecb-paes-dcp", CRYPTO_ALG_INTERNAL,
> +				    CRYPTO_ALG_INTERNAL);
> +	if (IS_ERR(tfm)) {
> +		res =3D PTR_ERR(tfm);
> +		pr_err("Unable to request DCP pAES-ECB cipher: %i\n", res);

Error can be only used when something is not functioning properly
(hardware, kernel, firmware). Out of memory condition is not such
case, meaning that this is not legit use of pr_err().

To add, it is already easy to trace given that you easily hook into
crypto_alloc_cipher() either with ftrace or kprobes, if you really
have to debug this.

So to summarize: scrape it away, please.

> +		tfm =3D NULL;
> +		goto out;
> +	}
> +
> +	req =3D skcipher_request_alloc(tfm, GFP_NOFS);
> +	if (!req) {
> +		res =3D -ENOMEM;
> +		goto out;
> +	}
> +
> +	skcipher_request_set_callback(req, CRYPTO_TFM_REQ_MAY_BACKLOG |
> +				      CRYPTO_TFM_REQ_MAY_SLEEP,
> +				      crypto_req_done, &wait);
> +	res =3D crypto_skcipher_setkey(tfm, paes_key, sizeof(paes_key));
> +	if (res < 0)
> +		goto out;
> +
> +	sg_init_one(&src_sg, in, AES_KEYSIZE_128);
> +	sg_init_one(&dst_sg, out, AES_KEYSIZE_128);
> +	skcipher_request_set_crypt(req, &src_sg, &dst_sg, AES_KEYSIZE_128,
> +				   NULL);
> +
> +	if (is_encrypt)
> +		res =3D crypto_wait_req(crypto_skcipher_encrypt(req), &wait);
> +	else
> +		res =3D crypto_wait_req(crypto_skcipher_decrypt(req), &wait);
> +
> +out:
> +	skcipher_request_free(req);
> +	crypto_free_skcipher(tfm);
> +
> +	return res;
> +}
> +
> +static int do_aead_crypto(u8 *in, u8 *out, size_t len, u8 *key, u8 *nonc=
e,
> +			  bool is_encrypt)
     =20
I'd rename the last parameter "is_encrypted" as it is at least proper
English. No reason to cut two letters out (applies also to other
locations with this parameter).

> +{
> +	struct aead_request *aead_req =3D NULL;
> +	struct scatterlist src_sg, dst_sg;
> +	struct crypto_aead *aead;
> +	int ret;
> +
> +	aead =3D crypto_alloc_aead("gcm(aes)", 0, CRYPTO_ALG_ASYNC);
> +	if (IS_ERR(aead)) {
> +		ret =3D PTR_ERR(aead);
> +		pr_err("Unable to request AES-GCM cipher: %i\n", ret);
> +		goto out;
> +	}
> +
> +	ret =3D crypto_aead_setauthsize(aead, DCP_BLOB_AUTHLEN);
> +	if (ret < 0) {
> +		pr_err("Can't set crypto auth tag len: %d\n", ret);
> +		goto free_aead;
> +	}
> +
> +	aead_req =3D aead_request_alloc(aead, GFP_KERNEL);
> +	if (!aead_req) {
> +		ret =3D -ENOMEM;
> +		goto free_aead;
> +	}
> +
> +	sg_init_one(&src_sg, in, len);
> +	if (is_encrypt) {
> +		/*
> +		 * If we encrypt our buffer has extra space for the auth tag.
> +		 */
> +		sg_init_one(&dst_sg, out, len + DCP_BLOB_AUTHLEN);
> +	} else {
> +		sg_init_one(&dst_sg, out, len);
> +	}
> +
> +	aead_request_set_crypt(aead_req, &src_sg, &dst_sg, len, nonce);
> +	aead_request_set_callback(aead_req, CRYPTO_TFM_REQ_MAY_SLEEP, NULL,
> +				  NULL);
> +	aead_request_set_ad(aead_req, 0);
> +
> +	if (crypto_aead_setkey(aead, key, AES_KEYSIZE_128)) {
> +		pr_err("Can't set crypto AEAD key\n");
> +		ret =3D -EINVAL;
> +		goto free_req;
> +	}
> +
> +	if (is_encrypt)
> +		ret =3D crypto_aead_encrypt(aead_req);
> +	else
> +		ret =3D crypto_aead_decrypt(aead_req);
> +
> +free_req:
> +	aead_request_free(aead_req);
> +free_aead:
> +	crypto_free_aead(aead);
> +out:
> +	return ret;
> +}
> +
> +static int decrypt_blob_key(u8 *key)
> +{
> +	return do_dcp_crypto(key, key, false);
> +}
> +
> +static int encrypt_blob_key(u8 *key)
> +{
> +	return do_dcp_crypto(key, key, true);
> +}
> +
> +static int trusted_dcp_seal(struct trusted_key_payload *p, char *datablo=
b)
> +{
> +	struct dcp_blob_fmt *b =3D (struct dcp_blob_fmt *)p->blob;
> +	int blen, ret;
> +
> +	blen =3D calc_blob_len(p->key_len);
> +	if (blen > MAX_BLOB_SIZE)
> +		return -E2BIG;
> +
> +	b->fmt_version =3D DCP_BLOB_VERSION;
> +	get_random_bytes(b->nonce, AES_KEYSIZE_128);
> +	get_random_bytes(b->blob_key, AES_KEYSIZE_128);
> +
> +	ret =3D do_aead_crypto(p->key, b->payload, p->key_len, b->blob_key,
> +			     b->nonce, true);
> +	if (ret) {
> +		pr_err("Unable to encrypt blob payload: %i\n", ret);
> +		return ret;
> +	}
> +
> +	ret =3D encrypt_blob_key(b->blob_key);
> +	if (ret) {
> +		pr_err("Unable to encrypt blob key: %i\n", ret);
> +		return ret;
> +	}
> +
> +	b->payload_len =3D get_unaligned_le32(&p->key_len);
> +	p->blob_len =3D blen;
> +	return 0;
> +}
> +
> +static int trusted_dcp_unseal(struct trusted_key_payload *p, char *datab=
lob)
> +{
> +	struct dcp_blob_fmt *b =3D (struct dcp_blob_fmt *)p->blob;
> +	int blen, ret;
> +
> +	if (b->fmt_version !=3D DCP_BLOB_VERSION) {
> +		pr_err("DCP blob has bad version: %i, expected %i\n",
> +		       b->fmt_version, DCP_BLOB_VERSION);
> +		ret =3D -EINVAL;
> +		goto out;
> +	}
> +
> +	p->key_len =3D le32_to_cpu(b->payload_len);
> +	blen =3D calc_blob_len(p->key_len);
> +	if (blen !=3D p->blob_len) {
> +		pr_err("DCP blob has bad length: %i !=3D %i\n", blen,
> +		       p->blob_len);
> +		ret =3D -EINVAL;
> +		goto out;
> +	}
> +
> +	ret =3D decrypt_blob_key(b->blob_key);
> +	if (ret) {
> +		pr_err("Unable to decrypt blob key: %i\n", ret);
> +		goto out;
> +	}
> +
> +	ret =3D do_aead_crypto(b->payload, p->key, p->key_len + DCP_BLOB_AUTHLE=
N,
> +			     b->blob_key, b->nonce, false);
> +	if (ret) {
> +		pr_err("Unwrap of DCP payload failed: %i\n", ret);
> +		goto out;
> +	}
> +
> +	ret =3D 0;
> +out:
> +	return ret;
> +}
> +
> +static int test_for_zero_key(void)
> +{
> +	static const u8 bad[] =3D {0x9a, 0xda, 0xe0, 0x54, 0xf6, 0x3d, 0xfa, 0x=
ff,
> +				 0x5e, 0xa1, 0x8e, 0x45, 0xed, 0xf6, 0xea, 0x6f};
> +	void *buf =3D NULL;
> +	int ret =3D 0;
> +
> +	if (skip_zk_test)
> +		goto out;
> +
> +	buf =3D kmalloc(AES_BLOCK_SIZE, GFP_KERNEL);
> +	if (!buf) {
> +		ret =3D -ENOMEM;
> +		goto out;
> +	}
> +
> +	memset(buf, 0x55, AES_BLOCK_SIZE);
> +
> +	ret =3D do_dcp_crypto(buf, buf, true);
> +	if (ret)
> +		goto out;
> +
> +	if (memcmp(buf, bad, AES_BLOCK_SIZE) =3D=3D 0) {
> +		pr_err("Device neither in secure nor trusted mode!\n");
> +		ret =3D -EINVAL;
> +	}
> +out:
> +	kfree(buf);
> +	return ret;
> +}
> +
> +static int trusted_dcp_init(void)
> +{
> +	int ret;
> +
> +	if (use_otp_key)
> +		pr_info("Using DCP OTP key\n");
> +
> +	ret =3D test_for_zero_key();
> +	if (ret) {
> +		pr_err("Test for zero'ed keys failed: %i\n", ret);
> +
> +		return -EINVAL;
> +	}
> +
> +	return register_key_type(&key_type_trusted);
> +}
> +
> +static void trusted_dcp_exit(void)
> +{
> +	unregister_key_type(&key_type_trusted);
> +}
> +
> +struct trusted_key_ops dcp_trusted_key_ops =3D {
> +	.exit =3D trusted_dcp_exit,
> +	.init =3D trusted_dcp_init,
> +	.seal =3D trusted_dcp_seal,
> +	.unseal =3D trusted_dcp_unseal,
> +	.migratable =3D 0,
> +};

BR, Jarkko
