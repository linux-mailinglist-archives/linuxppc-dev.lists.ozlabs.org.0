Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B77A489088B
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Mar 2024 19:48:02 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=M8qRP8j9;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V5CGS3fSXz3vfg
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Mar 2024 05:48:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=M8qRP8j9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=jarkko@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V5CFh3gkKz3vYp
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Mar 2024 05:47:20 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 973C1CE2B80;
	Thu, 28 Mar 2024 18:47:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3BC56C433F1;
	Thu, 28 Mar 2024 18:47:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711651635;
	bh=0TWJjs/gIGRkhPuMH4c0WZ3PmI7Wu7THN8xx4oFmQb4=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=M8qRP8j9t7rUbqJsllGH9HpVFiTiP2EhaPKjPPgzRGt63GOpm5oanZBm/bUc9+qSm
	 tgGKglNOR/7CPuLlsYgfxmnlk3zOovqM5IlISNnGvVj8sVOirqRAudy0vGhGYrPAuO
	 +7NTSLojn1KiqAtbvIBrMijJ6/KRv09wrmNBvr6F8e4LYfT+/bjkTzIo4xFqjNlVhR
	 N4DA0tSEyaM/b9KsBV7hphDr/b+HP8TUB4KfXm4nV/qLc9dMFpSHrufwyEC43R98KE
	 xR8v2aotJmV3rFHV1FtzfmOIwA2lpt5mY/6+vAvFgE++LNVRLEyM5dEma3D0GSVCWy
	 jkU846Vln42/Q==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 28 Mar 2024 20:47:07 +0200
Message-Id: <D05LV2A6J8X7.11895O5TC10TS@kernel.org>
Subject: Re: [PATCH v7 6/6] docs: trusted-encrypted: add DCP as new trust
 source
From: "Jarkko Sakkinen" <jarkko@kernel.org>
To: "David Gstir" <david@sigma-star.at>
X-Mailer: aerc 0.17.0
References: <20240327082454.13729-1-david@sigma-star.at>
 <20240327082454.13729-7-david@sigma-star.at>
 <D04N9E61QWYB.3IPEEGVPY6V8L@kernel.org>
 <A3831544-E47C-4AEB-9963-536F0B1EE8FD@sigma-star.at>
In-Reply-To: <A3831544-E47C-4AEB-9963-536F0B1EE8FD@sigma-star.at>
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
Cc: linux-doc@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Mimi Zohar <zohar@linux.ibm.com>, David Howells <dhowells@redhat.com>, "keyrings@vger.kernel.org" <keyrings@vger.kernel.org>, Fabio Estevam <festevam@gmail.com>, Ahmad Fatoum <a.fatoum@pengutronix.de>, Herbert Xu <herbert@gondor.apana.org.au>, Jonathan
 Corbet <corbet@lwn.net>, Richard Weinberger <richard@nod.at>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, James
 Morris <jmorris@namei.org>, NXP Linux Team <linux-imx@nxp.com>, James Bottomley <jejb@linux.ibm.com>, "Serge E. Hallyn" <serge@hallyn.com>, "Paul E.
 McKenney" <paulmck@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, sigma star Kernel Team <upstream+dcp@sigma-star.at>, "Steven Rostedt
 \(Google\)" <rostedt@goodmis.org>, David Oberhollenzer <david.oberhollenzer@sigma-star.at>, linux-arm-kernel@lists.infradead.org, Paul Moore <paul@paul-moore.com>, linuxppc-dev@lists.ozlabs.org, Randy Dunlap <rdunlap@infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Li
 Yang <leoyang.li@nxp.com>, "linux-security-module@vger.kernel.org" <linux-security-module@vger.kernel.org>, "linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>, "kernel@pengutronix.de" <kernel@pengutronix.de>, Tejun Heo <tj@kernel.org>, "linux-integrity@vger.kernel.org" <linux-integrity@vger.kernel.org>, Shawn Guo <shawnguo@kernel.org>, "David S.
 Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu Mar 28, 2024 at 10:05 AM EET, David Gstir wrote:
> Jarkko,
>
> > On 27.03.2024, at 16:40, Jarkko Sakkinen <jarkko@kernel.org> wrote:
> >=20
> > On Wed Mar 27, 2024 at 10:24 AM EET, David Gstir wrote:
> >> Update the documentation for trusted and encrypted KEYS with DCP as ne=
w
> >> trust source:
> >>=20
> >> - Describe security properties of DCP trust source
> >> - Describe key usage
> >> - Document blob format
> >>=20
> >> Co-developed-by: Richard Weinberger <richard@nod.at>
> >> Signed-off-by: Richard Weinberger <richard@nod.at>
> >> Co-developed-by: David Oberhollenzer <david.oberhollenzer@sigma-star.a=
t>
> >> Signed-off-by: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
> >> Signed-off-by: David Gstir <david@sigma-star.at>
> >> ---
> >> .../security/keys/trusted-encrypted.rst       | 85 +++++++++++++++++++
> >> 1 file changed, 85 insertions(+)
> >>=20
> >> diff --git a/Documentation/security/keys/trusted-encrypted.rst b/Docum=
entation/security/keys/trusted-encrypted.rst
> >> index e989b9802f92..81fb3540bb20 100644
> >> --- a/Documentation/security/keys/trusted-encrypted.rst
> >> +++ b/Documentation/security/keys/trusted-encrypted.rst
> >> @@ -42,6 +42,14 @@ safe.
> >>          randomly generated and fused into each SoC at manufacturing t=
ime.
> >>          Otherwise, a common fixed test key is used instead.
> >>=20
> >> +     (4) DCP (Data Co-Processor: crypto accelerator of various i.MX S=
oCs)
> >> +
> >> +         Rooted to a one-time programmable key (OTP) that is generall=
y burnt
> >> +         in the on-chip fuses and is accessible to the DCP encryption=
 engine only.
> >> +         DCP provides two keys that can be used as root of trust: the=
 OTP key
> >> +         and the UNIQUE key. Default is to use the UNIQUE key, but se=
lecting
> >> +         the OTP key can be done via a module parameter (dcp_use_otp_=
key).
> >> +
> >>   *  Execution isolation
> >>=20
> >>      (1) TPM
> >> @@ -57,6 +65,12 @@ safe.
> >>=20
> >>          Fixed set of operations running in isolated execution environ=
ment.
> >>=20
> >> +     (4) DCP
> >> +
> >> +         Fixed set of cryptographic operations running in isolated ex=
ecution
> >> +         environment. Only basic blob key encryption is executed ther=
e.
> >> +         The actual key sealing/unsealing is done on main processor/k=
ernel space.
> >> +
> >>   * Optional binding to platform integrity state
> >>=20
> >>      (1) TPM
> >> @@ -79,6 +93,11 @@ safe.
> >>          Relies on the High Assurance Boot (HAB) mechanism of NXP SoCs
> >>          for platform integrity.
> >>=20
> >> +     (4) DCP
> >> +
> >> +         Relies on Secure/Trusted boot process (called HAB by vendor)=
 for
> >> +         platform integrity.
> >> +
> >>   *  Interfaces and APIs
> >>=20
> >>      (1) TPM
> >> @@ -94,6 +113,11 @@ safe.
> >>=20
> >>          Interface is specific to silicon vendor.
> >>=20
> >> +     (4) DCP
> >> +
> >> +         Vendor-specific API that is implemented as part of the DCP c=
rypto driver in
> >> +         ``drivers/crypto/mxs-dcp.c``.
> >> +
> >>   *  Threat model
> >>=20
> >>      The strength and appropriateness of a particular trust source for=
 a given
> >> @@ -129,6 +153,13 @@ selected trust source:
> >>      CAAM HWRNG, enable CRYPTO_DEV_FSL_CAAM_RNG_API and ensure the dev=
ice
> >>      is probed.
> >>=20
> >> +  *  DCP (Data Co-Processor: crypto accelerator of various i.MX SoCs)
> >> +
> >> +     The DCP hardware device itself does not provide a dedicated RNG =
interface,
> >> +     so the kernel default RNG is used. SoCs with DCP like the i.MX6U=
LL do have
> >> +     a dedicated hardware RNG that is independent from DCP which can =
be enabled
> >> +     to back the kernel RNG.
> >> +
> >> Users may override this by specifying ``trusted.rng=3Dkernel`` on the =
kernel
> >> command-line to override the used RNG with the kernel's random number =
pool.
> >>=20
> >> @@ -231,6 +262,19 @@ Usage::
> >> CAAM-specific format.  The key length for new keys is always in bytes.
> >> Trusted Keys can be 32 - 128 bytes (256 - 1024 bits).
> >>=20
> >> +Trusted Keys usage: DCP
> >> +-----------------------
> >> +
> >> +Usage::
> >> +
> >> +    keyctl add trusted name "new keylen" ring
> >> +    keyctl add trusted name "load hex_blob" ring
> >> +    keyctl print keyid
> >> +
> >> +"keyctl print" returns an ASCII hex copy of the sealed key, which is =
in format
> >> +specific to this DCP key-blob implementation.  The key length for new=
 keys is
> >> +always in bytes. Trusted Keys can be 32 - 128 bytes (256 - 1024 bits)=
.
> >> +
> >> Encrypted Keys usage
> >> --------------------
> >>=20
> >> @@ -426,3 +470,44 @@ string length.
> >> privkey is the binary representation of TPM2B_PUBLIC excluding the
> >> initial TPM2B header which can be reconstructed from the ASN.1 octed
> >> string length.
> >> +
> >> +DCP Blob Format
> >> +---------------
> >> +
> >> +The Data Co-Processor (DCP) provides hardware-bound AES keys using it=
s
> >> +AES encryption engine only. It does not provide direct key sealing/un=
sealing.
> >> +To make DCP hardware encryption keys usable as trust source, we defin=
e
> >> +our own custom format that uses a hardware-bound key to secure the se=
aling
> >> +key stored in the key blob.
> >> +
> >> +Whenever a new trusted key using DCP is generated, we generate a rand=
om 128-bit
> >> +blob encryption key (BEK) and 128-bit nonce. The BEK and nonce are us=
ed to
> >> +encrypt the trusted key payload using AES-128-GCM.
> >> +
> >> +The BEK itself is encrypted using the hardware-bound key using the DC=
P's AES
> >> +encryption engine with AES-128-ECB. The encrypted BEK, generated nonc=
e,
> >> +BEK-encrypted payload and authentication tag make up the blob format =
together
> >> +with a version number, payload length and authentication tag::
> >> +
> >> +    /*
> >> +     * struct dcp_blob_fmt - DCP BLOB format.
> >> +     *
> >> +     * @fmt_version: Format version, currently being %1
> >> +     * @blob_key: Random AES 128 key which is used to encrypt @payloa=
d,
> >> +     *            @blob_key itself is encrypted with OTP or UNIQUE de=
vice key in
> >> +     *            AES-128-ECB mode by DCP.
> >> +     * @nonce: Random nonce used for @payload encryption.
> >> +     * @payload_len: Length of the plain text @payload.
> >> +     * @payload: The payload itself, encrypted using AES-128-GCM and =
@blob_key,
> >> +     *           GCM auth tag of size AES_BLOCK_SIZE is attached at t=
he end of it.
> >> +     *
> >> +     * The total size of a DCP BLOB is sizeof(struct dcp_blob_fmt) + =
@payload_len +
> >> +     * AES_BLOCK_SIZE.
> >> +     */
> >> +    struct dcp_blob_fmt {
> >> +            __u8 fmt_version;
> >> +            __u8 blob_key[AES_KEYSIZE_128];
> >> +            __u8 nonce[AES_KEYSIZE_128];
> >> +            __le32 payload_len;
> >> +            __u8 payload[];
> >> +    } __packed;
> >=20
> > I'm thinking here given that you need to replicate the same thing that
> > is in the source files. E.g. Documentation/gpu/i915.rst.
> >=20
> > The rationale would so many sources so maybe it would make sense to
> > maintain this in the source code.
> >=20
> > Also this documents how to generally insert documentation inline:
> > https://docs.kernel.org/doc-guide/kernel-doc.html
> >=20
> > I.e. I'm feeling that this is good time to improve scalability so that
> > documentation will keep up to date. Also then backend specific patches
> > mostly go to their subdirectories and not to Documentation/ subtree
> > (or that would be more rare case).
> >=20
> > So a good chance to do more than just a new backend for the benefit
> > of the trusted keys subsystem :-)
> >=20
> > Also, later on if something is changed e.g. in the above struct you
> > don't have to do matching update to the documentation so it will save
> > time too (over time).
>
> sound good! I=E2=80=99ll maintain the blob format documentation to the so=
urce and insert=20
> a reference in the documentation. Thanks for pointing that out!
>
> Is there anything else I can improve for this patchset? I=E2=80=99d like =
to include that in v8
> too and make it the last iteration of this patchset.

Yeah, I don't enforce you to convert all the existing work to this
model, but we could use this as a reference for that work.

The patch set is overally in a pretty good shape I think :-)

BR, Jarkko
