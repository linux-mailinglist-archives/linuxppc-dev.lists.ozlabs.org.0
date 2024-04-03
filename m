Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F2932897118
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Apr 2024 15:31:45 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Crt9rjJH;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V8lyl5SpKz3vwJ
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Apr 2024 00:31:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Crt9rjJH;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::631; helo=mail-pl1-x631.google.com; envelope-from=bagasdotme@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V8lpD4gJ1z3wFh
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Apr 2024 00:24:20 +1100 (AEDT)
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-1e2178b2cf2so49045415ad.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 03 Apr 2024 06:24:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712150659; x=1712755459; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rQsFbEjOTqJq35XSrf9t5tKMfoIw0aZp1GIU7FAGSpw=;
        b=Crt9rjJHBM2tpWj48fTHs5jVZBnuxWntK223bfzxV3CVXbMf3hu2lACz9pAT1zhzGZ
         xpjbPtTCDz6SM0SB8zFoYA+Qiae5qVvmyrn96+/Bf3kfTh2ADaVjsVafq9Jsojs21z3K
         Z5W2AM1O8OPD5vkElGAUyL+3vFr+hjZfPyYeL7RkWdbmNDEEclmyt2621REb2XJ2qBgW
         Lz5jsP5IaWpDyfsmoADTilzKMeJQi+RI17p61iilz8FP7ROM5jc0vMHeGMf6Fn/aJQhq
         aDHPdhmK5LD9NNmmr/kAw7yp8r8lluyCSxquVRkYvOi+SfWm66z1AZWxknb7hxYFCA8w
         lZIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712150659; x=1712755459;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rQsFbEjOTqJq35XSrf9t5tKMfoIw0aZp1GIU7FAGSpw=;
        b=oLrlT2vh/G9xtTjgEOhakGCbFH/KoTrnKxTVRCFba/n+P8BcfpyOcIkIbdmPxOwW/s
         u6v6pC4n2x6tL/4qL1mh9hPL3uVVVyVGMEs7FosvY6ERmaZK53OOuMrBoaCYQZymGfMz
         WoqlOMapx7SvfEGmEd9oRLhFOfAc8Xdp3GM5GmsifN6fYkzwh4DPGA5S0DBa9snSI4Tn
         LGCXhBZa9xXtl32/nilpM4pI0iwQNINvvcwaRFYc8wOvQhw3WDtHefUblRa40A5Yx/xR
         p3kt/h45HOG7NLQnQjURPQzccZmSuR44UOgCYauZOXHxDhOJIpLKwO2issrSJmkaH+gv
         BQ1A==
X-Forwarded-Encrypted: i=1; AJvYcCUZ9kN8iI6QHza4zULtKA4kyEZq3sM2cCwsrJE0Ez1w61l5YNCF6fXcS7soI+IEgqBOnMLUl/fMI/3ZWA7cLQURgUqDMLHXkewaEFOHLg==
X-Gm-Message-State: AOJu0YxS9AK2BUyS8aiQlggA3+xEncqszsh2EIP5Fa5rFcpNtu5Q1Vli
	3OYF1tOOB3Ic0Wm+8kr65ox4t1PJXHYoIHLiVqPLhmFnQWqge3+F
X-Google-Smtp-Source: AGHT+IFatdNBQSb3VrVYeBX6Z2JShOnIrwB6FOsdyOnRBQXn1pgGepQ/A/buywtE61oYlMx80pUAVQ==
X-Received: by 2002:a17:902:c94f:b0:1e0:a784:f965 with SMTP id i15-20020a170902c94f00b001e0a784f965mr18876173pla.65.1712150658416;
        Wed, 03 Apr 2024 06:24:18 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id i15-20020a170902c94f00b001dd02f4c2casm13275916pla.164.2024.04.03.06.24.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Apr 2024 06:24:17 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id 9178318108E2D; Wed,  3 Apr 2024 20:24:15 +0700 (WIB)
Date: Wed, 3 Apr 2024 20:24:15 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: David Gstir <david@sigma-star.at>, Mimi Zohar <zohar@linux.ibm.com>,
	James Bottomley <jejb@linux.ibm.com>,
	Jarkko Sakkinen <jarkko@kernel.org>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>
Subject: Re: [PATCH v8 6/6] docs: trusted-encrypted: add DCP as new trust
 source
Message-ID: <Zg1YfyhxO8BwtEfB@archie.me>
References: <20240403072131.54935-1-david@sigma-star.at>
 <20240403072131.54935-7-david@sigma-star.at>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="naAkpeAgH+6KHC1j"
Content-Disposition: inline
In-Reply-To: <20240403072131.54935-7-david@sigma-star.at>
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
Cc: linux-doc@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, David Howells <dhowells@redhat.com>, keyrings@vger.kernel.org, Fabio Estevam <festevam@gmail.com>, Ahmad Fatoum <a.fatoum@pengutronix.de>, Paul Moore <paul@paul-moore.com>, Jonathan Corbet <corbet@lwn.net>, Richard Weinberger <richard@nod.at>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, James Morris <jmorris@namei.org>, NXP Linux Team <linux-imx@nxp.com>, "Serge E. Hallyn" <serge@hallyn.com>, "Paul E. McKenney" <paulmck@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, sigma star Kernel Team <upstream+dcp@sigma-star.at>, "Steven Rostedt \(Google\)" <rostedt@goodmis.org>, David Oberhollenzer <david.oberhollenzer@sigma-star.at>, linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org, Li Yang <leoyang.li@nxp.com>, linux-security-module@vger.kernel.org, linux-crypto@vger.kernel.org, Pengutronix Kernel Team <kernel@pengutronix.d
 e>, Tejun Heo <tj@kernel.org>, linux-integrity@vger.kernel.org, Shawn Guo <shawnguo@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--naAkpeAgH+6KHC1j
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 03, 2024 at 09:21:22AM +0200, David Gstir wrote:
> diff --git a/Documentation/security/keys/trusted-encrypted.rst b/Document=
ation/security/keys/trusted-encrypted.rst
> index e989b9802f92..f4d7e162d5e4 100644
> --- a/Documentation/security/keys/trusted-encrypted.rst
> +++ b/Documentation/security/keys/trusted-encrypted.rst
> @@ -42,6 +42,14 @@ safe.
>           randomly generated and fused into each SoC at manufacturing tim=
e.
>           Otherwise, a common fixed test key is used instead.
> =20
> +     (4) DCP (Data Co-Processor: crypto accelerator of various i.MX SoCs)
> +
> +         Rooted to a one-time programmable key (OTP) that is generally b=
urnt
> +         in the on-chip fuses and is accessible to the DCP encryption en=
gine only.
> +         DCP provides two keys that can be used as root of trust: the OT=
P key
> +         and the UNIQUE key. Default is to use the UNIQUE key, but selec=
ting
> +         the OTP key can be done via a module parameter (dcp_use_otp_key=
).
> +
>    *  Execution isolation
> =20
>       (1) TPM
> @@ -57,6 +65,12 @@ safe.
> =20
>           Fixed set of operations running in isolated execution environme=
nt.
> =20
> +     (4) DCP
> +
> +         Fixed set of cryptographic operations running in isolated execu=
tion
> +         environment. Only basic blob key encryption is executed there.
> +         The actual key sealing/unsealing is done on main processor/kern=
el space.
> +
>    * Optional binding to platform integrity state
> =20
>       (1) TPM
> @@ -79,6 +93,11 @@ safe.
>           Relies on the High Assurance Boot (HAB) mechanism of NXP SoCs
>           for platform integrity.
> =20
> +     (4) DCP
> +
> +         Relies on Secure/Trusted boot process (called HAB by vendor) for
> +         platform integrity.
> +
>    *  Interfaces and APIs
> =20
>       (1) TPM
> @@ -94,6 +113,11 @@ safe.
> =20
>           Interface is specific to silicon vendor.
> =20
> +     (4) DCP
> +
> +         Vendor-specific API that is implemented as part of the DCP cryp=
to driver in
> +         ``drivers/crypto/mxs-dcp.c``.
> +
>    *  Threat model
> =20
>       The strength and appropriateness of a particular trust source for a=
 given
> @@ -129,6 +153,13 @@ selected trust source:
>       CAAM HWRNG, enable CRYPTO_DEV_FSL_CAAM_RNG_API and ensure the device
>       is probed.
> =20
> +  *  DCP (Data Co-Processor: crypto accelerator of various i.MX SoCs)
> +
> +     The DCP hardware device itself does not provide a dedicated RNG int=
erface,
> +     so the kernel default RNG is used. SoCs with DCP like the i.MX6ULL =
do have
> +     a dedicated hardware RNG that is independent from DCP which can be =
enabled
> +     to back the kernel RNG.
> +
>  Users may override this by specifying ``trusted.rng=3Dkernel`` on the ke=
rnel
>  command-line to override the used RNG with the kernel's random number po=
ol.
> =20
> @@ -231,6 +262,19 @@ Usage::
>  CAAM-specific format.  The key length for new keys is always in bytes.
>  Trusted Keys can be 32 - 128 bytes (256 - 1024 bits).
> =20
> +Trusted Keys usage: DCP
> +-----------------------
> +
> +Usage::
> +
> +    keyctl add trusted name "new keylen" ring
> +    keyctl add trusted name "load hex_blob" ring
> +    keyctl print keyid
> +
> +"keyctl print" returns an ASCII hex copy of the sealed key, which is in =
format
> +specific to this DCP key-blob implementation.  The key length for new ke=
ys is
> +always in bytes. Trusted Keys can be 32 - 128 bytes (256 - 1024 bits).
> +
>  Encrypted Keys usage
>  --------------------
> =20
> @@ -426,3 +470,12 @@ string length.
>  privkey is the binary representation of TPM2B_PUBLIC excluding the
>  initial TPM2B header which can be reconstructed from the ASN.1 octed
>  string length.
> +
> +DCP Blob Format
> +---------------
> +
> +.. kernel-doc:: security/keys/trusted-keys/trusted_dcp.c
> +   :doc: dcp blob format
> +
> +.. kernel-doc:: security/keys/trusted-keys/trusted_dcp.c
> +   :identifiers: struct dcp_blob_fmt
> diff --git a/security/keys/trusted-keys/trusted_dcp.c b/security/keys/tru=
sted-keys/trusted_dcp.c
> index 16c44aafeab3..b5f81a05be36 100644
> --- a/security/keys/trusted-keys/trusted_dcp.c
> +++ b/security/keys/trusted-keys/trusted_dcp.c
> @@ -19,6 +19,25 @@
>  #define DCP_BLOB_VERSION 1
>  #define DCP_BLOB_AUTHLEN 16
> =20
> +/**
> + * DOC: dcp blob format
> + *
> + * The Data Co-Processor (DCP) provides hardware-bound AES keys using its
> + * AES encryption engine only. It does not provide direct key sealing/un=
sealing.
> + * To make DCP hardware encryption keys usable as trust source, we define
> + * our own custom format that uses a hardware-bound key to secure the se=
aling
> + * key stored in the key blob.
> + *
> + * Whenever a new trusted key using DCP is generated, we generate a rand=
om 128-bit
> + * blob encryption key (BEK) and 128-bit nonce. The BEK and nonce are us=
ed to
> + * encrypt the trusted key payload using AES-128-GCM.
> + *
> + * The BEK itself is encrypted using the hardware-bound key using the DC=
P's AES
> + * encryption engine with AES-128-ECB. The encrypted BEK, generated nonc=
e,
> + * BEK-encrypted payload and authentication tag make up the blob format =
together
> + * with a version number, payload length and authentication tag.
> + */
> +
>  /**
>   * struct dcp_blob_fmt - DCP BLOB format.
>   *

The doc LGTM, thanks!

Reviewed-by: Bagas Sanjaya <bagasdotme@gmail.com>

--=20
An old man doll... just what I always wanted! - Clara

--naAkpeAgH+6KHC1j
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZg1YegAKCRD2uYlJVVFO
oyJuAQCZD3vF43N1Kkz1HmEgp7130tCkVQsyOA9E8/KbWap6iAD/QxxL8dI+KNzG
9SR+i7e0WhL71RpnBvHq6ovdU/G2iAI=
=lGz1
-----END PGP SIGNATURE-----

--naAkpeAgH+6KHC1j--
