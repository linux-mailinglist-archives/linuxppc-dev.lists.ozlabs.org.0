Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F98F88E96E
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Mar 2024 16:41:25 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=WevJ7zL2;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V4W9Z65lbz3vvh
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Mar 2024 02:41:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=WevJ7zL2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=jarkko@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V4W8P5J0Lz3vhR
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Mar 2024 02:40:21 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 679B6CE26C3;
	Wed, 27 Mar 2024 15:40:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A2B8C433C7;
	Wed, 27 Mar 2024 15:40:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711554019;
	bh=0kU1Y1g7b5S7SzsNPgZKwi7JQaJEmDAsXvKCtpVKdQI=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=WevJ7zL2SbneDrByZF4xuhxghlDU0PwsMnc75tQheSw2fbENgrL/WTKvlrn86wr8k
	 tfwpXXuyIlggJd0lUame2pkRb2yrpEiJkgjALyUJgan0RJLEl3QRdTufbHgc3lNCWm
	 qWsGQJar+deai9SBnqn5wj2jxTHN/c6htYxJaS7FpeEJfduk7IweGaDdm0zKrVM3Gv
	 Vj5FfArk0sKufcVVKFNwE+IcwwirRu4Oocz3PhGjflHNyIOqFFOzhzkrtHAwHWtMEM
	 rlBWmNdj9so1KCAJo28yXf7e4D92yzkmrBOgpCnEl8NWL6h87AG6R2pcw8ayo+W2JU
	 dJ3K6mIOrX/+Q==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 27 Mar 2024 17:40:11 +0200
Message-Id: <D04N9E61QWYB.3IPEEGVPY6V8L@kernel.org>
Subject: Re: [PATCH v7 6/6] docs: trusted-encrypted: add DCP as new trust
 source
From: "Jarkko Sakkinen" <jarkko@kernel.org>
To: "David Gstir" <david@sigma-star.at>, "Mimi Zohar" <zohar@linux.ibm.com>,
 "James Bottomley" <jejb@linux.ibm.com>, "Herbert Xu"
 <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>
X-Mailer: aerc 0.17.0
References: <20240327082454.13729-1-david@sigma-star.at>
 <20240327082454.13729-7-david@sigma-star.at>
In-Reply-To: <20240327082454.13729-7-david@sigma-star.at>
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

On Wed Mar 27, 2024 at 10:24 AM EET, David Gstir wrote:
> Update the documentation for trusted and encrypted KEYS with DCP as new
> trust source:
>
> - Describe security properties of DCP trust source
> - Describe key usage
> - Document blob format
>
> Co-developed-by: Richard Weinberger <richard@nod.at>
> Signed-off-by: Richard Weinberger <richard@nod.at>
> Co-developed-by: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
> Signed-off-by: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
> Signed-off-by: David Gstir <david@sigma-star.at>
> ---
>  .../security/keys/trusted-encrypted.rst       | 85 +++++++++++++++++++
>  1 file changed, 85 insertions(+)
>
> diff --git a/Documentation/security/keys/trusted-encrypted.rst b/Document=
ation/security/keys/trusted-encrypted.rst
> index e989b9802f92..81fb3540bb20 100644
> --- a/Documentation/security/keys/trusted-encrypted.rst
> +++ b/Documentation/security/keys/trusted-encrypted.rst
> @@ -42,6 +42,14 @@ safe.
>           randomly generated and fused into each SoC at manufacturing tim=
e.
>           Otherwise, a common fixed test key is used instead.
> =20
> +     (4) DCP (Data Co-Processor: crypto accelerator of various i.MX SoCs=
)
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
> +         Relies on Secure/Trusted boot process (called HAB by vendor) fo=
r
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
>       CAAM HWRNG, enable CRYPTO_DEV_FSL_CAAM_RNG_API and ensure the devic=
e
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
> @@ -426,3 +470,44 @@ string length.
>  privkey is the binary representation of TPM2B_PUBLIC excluding the
>  initial TPM2B header which can be reconstructed from the ASN.1 octed
>  string length.
> +
> +DCP Blob Format
> +---------------
> +
> +The Data Co-Processor (DCP) provides hardware-bound AES keys using its
> +AES encryption engine only. It does not provide direct key sealing/unsea=
ling.
> +To make DCP hardware encryption keys usable as trust source, we define
> +our own custom format that uses a hardware-bound key to secure the seali=
ng
> +key stored in the key blob.
> +
> +Whenever a new trusted key using DCP is generated, we generate a random =
128-bit
> +blob encryption key (BEK) and 128-bit nonce. The BEK and nonce are used =
to
> +encrypt the trusted key payload using AES-128-GCM.
> +
> +The BEK itself is encrypted using the hardware-bound key using the DCP's=
 AES
> +encryption engine with AES-128-ECB. The encrypted BEK, generated nonce,
> +BEK-encrypted payload and authentication tag make up the blob format tog=
ether
> +with a version number, payload length and authentication tag::
> +
> +    /*
> +     * struct dcp_blob_fmt - DCP BLOB format.
> +     *
> +     * @fmt_version: Format version, currently being %1
> +     * @blob_key: Random AES 128 key which is used to encrypt @payload,
> +     *            @blob_key itself is encrypted with OTP or UNIQUE devic=
e key in
> +     *            AES-128-ECB mode by DCP.
> +     * @nonce: Random nonce used for @payload encryption.
> +     * @payload_len: Length of the plain text @payload.
> +     * @payload: The payload itself, encrypted using AES-128-GCM and @bl=
ob_key,
> +     *           GCM auth tag of size AES_BLOCK_SIZE is attached at the =
end of it.
> +     *
> +     * The total size of a DCP BLOB is sizeof(struct dcp_blob_fmt) + @pa=
yload_len +
> +     * AES_BLOCK_SIZE.
> +     */
> +    struct dcp_blob_fmt {
> +            __u8 fmt_version;
> +            __u8 blob_key[AES_KEYSIZE_128];
> +            __u8 nonce[AES_KEYSIZE_128];
> +            __le32 payload_len;
> +            __u8 payload[];
> +    } __packed;

I'm thinking here given that you need to replicate the same thing that
is in the source files. E.g. Documentation/gpu/i915.rst.

The rationale would so many sources so maybe it would make sense to
maintain this in the source code.

Also this documents how to generally insert documentation inline:
https://docs.kernel.org/doc-guide/kernel-doc.html

I.e. I'm feeling that this is good time to improve scalability so that
documentation will keep up to date. Also then backend specific patches
mostly go to their subdirectories and not to Documentation/ subtree
(or that would be more rare case).

So a good chance to do more than just a new backend for the benefit
of the trusted keys subsystem :-)

Also, later on if something is changed e.g. in the above struct you
don't have to do matching update to the documentation so it will save
time too (over time).

BR, Jarkko
