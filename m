Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FD2B7D72A8
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Oct 2023 19:50:30 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=nadt9RxL;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SFxKc3Srjz3cST
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Oct 2023 04:50:28 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=nadt9RxL;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=jarkko@kernel.org; receiver=lists.ozlabs.org)
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SFxJh1TPDz2xYt
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Oct 2023 04:49:40 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id DFF4FB81B3E;
	Wed, 25 Oct 2023 17:49:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96A26C433C8;
	Wed, 25 Oct 2023 17:49:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698256173;
	bh=CeyTBZs2xeQb0TaJ5m+PpCM8nU28HSwaY1ik5tYD5o0=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=nadt9RxLEqdHQTzPCvB13pBQ1Ju+RhH3NuQ+TT+dsOEsLlKYWgzWmdZbyM7HjHxsG
	 R7PqnTwS5jDxcU0LCHA15oW67sHKbxeTFWDFsZkNjS6wPoDme83JMnIAkPZg+iMOiG
	 gvM89z6zDpLOCUhfgShobVv5NtRtt4igElnNjJJ596qVQ+FJAdlCIlJVfWw15kw+fH
	 f5I8rbfwXSh5SoR2cWdwEa/TzVEJcmGZb6bAlUNACxoItcxlsz1b14qIJ0v05LDXT/
	 /IOHbguBYqKOkVKZvQ+XVSmfCas70j1oqYv3vTtDp6JapFQpKWQ/rNR8apP0znKWAp
	 pOMIzfudAr/HA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 25 Oct 2023 20:49:24 +0300
Message-Id: <CWHPKFQIGWPM.B6IBLPXVBR1E@suppilovahvero>
Subject: Re: [PATCH v4 2/5] KEYS: trusted: Introduce NXP DCP-backed trusted
 keys
From: "Jarkko Sakkinen" <jarkko@kernel.org>
To: "David Gstir" <david@sigma-star.at>, "Mimi Zohar" <zohar@linux.ibm.com>,
 "James Bottomley" <jejb@linux.ibm.com>, "Herbert Xu"
 <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>
X-Mailer: aerc 0.15.2
References: <20231024162024.51260-1-david@sigma-star.at>
 <20231024162024.51260-3-david@sigma-star.at>
In-Reply-To: <20231024162024.51260-3-david@sigma-star.at>
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

On Tue Oct 24, 2023 at 7:20 PM EEST, David Gstir wrote:
> DCP (Data Co-Processor) is the little brother of NXP's CAAM IP.
> Beside of accelerated crypto operations, it also offers support for
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
>
> Co-developed-by: Richard Weinberger <richard@nod.at>
> Signed-off-by: Richard Weinberger <richard@nod.at>
> Co-developed-by: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
> Signed-off-by: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
> Signed-off-by: David Gstir <david@sigma-star.at>
> ---
>  include/keys/trusted_dcp.h                |  11 +
>  security/keys/trusted-keys/Kconfig        |   9 +-
>  security/keys/trusted-keys/Makefile       |   2 +
>  security/keys/trusted-keys/trusted_core.c |   6 +-
>  security/keys/trusted-keys/trusted_dcp.c  | 311 ++++++++++++++++++++++
>  5 files changed, 337 insertions(+), 2 deletions(-)
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
> index dbfdd8536468..c6b80b7e5c78 100644
> --- a/security/keys/trusted-keys/Kconfig
> +++ b/security/keys/trusted-keys/Kconfig
> @@ -33,6 +33,13 @@ config TRUSTED_KEYS_CAAM
>  	  Enable use of NXP's Cryptographic Accelerator and Assurance Module
>  	  (CAAM) as trusted key backend.
> =20
> -if !TRUSTED_KEYS_TPM && !TRUSTED_KEYS_TEE && !TRUSTED_KEYS_CAAM
> +config TRUSTED_KEYS_DCP
> +	bool "DCP-based trusted keys"
> +	depends on CRYPTO_DEV_MXS_DCP >=3D TRUSTED_KEYS
> +	default y
> +	help
> +	  Enable use of NXP's DCP (Data Co-Processor) as trusted key backend.
> +
> +if !TRUSTED_KEYS_TPM && !TRUSTED_KEYS_TEE && !TRUSTED_KEYS_CAAM && !TRUS=
TED_KEYS_DCP

This does not scale tbh.

I'd suggest to add additional patch before adding the new key type,
which clears this up a little bit.

First:

config HAVE_TRUSTED_KEYS
	bool

And then following this pattern to all trusted key types:

config TRUSTED_KEYS_DCP
	bool "DCP-based trusted keys"
	depends on CRYPTO_DEV_MXS_DCP >=3D TRUSTED_KEYS
	default y
	select HAVE_TRUSTED_KEYS
	help
	  Enable use of NXP's DCP (Data Co-Processor) as trusted key backend.

And finally:

if !HAVE_TRUSTED_KEYS
	comment "No trust source selected!"
endif

BR, Jarkko
