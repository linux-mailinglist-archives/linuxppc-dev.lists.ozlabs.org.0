Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B68A789089E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Mar 2024 19:51:13 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=TtN5bh02;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V5CL73gV4z3vcf
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Mar 2024 05:51:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=TtN5bh02;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=jarkko@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V5CKQ4ymyz3vYp
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Mar 2024 05:50:34 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3356E615F8;
	Thu, 28 Mar 2024 18:50:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 194FDC433C7;
	Thu, 28 Mar 2024 18:50:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711651830;
	bh=v47lKJs0Ij31Lu1i4dgbBcc3S1l62Crepl3XB+i3pHk=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=TtN5bh02FrPTKu9xC+1yTpzkaJuCahZccbAaMqgtJLIA3L/JGfowwOAoz6eY9Gt/x
	 j1t/iJmTlhFZ1ebfpkyR3pulVZIqn25ghMzitDejpq8Idf0aMvh0Zmf6cj6ZY6YXZ5
	 ma9ykqNCCMRrXr2gq1XRpJRV01XLbXeelLym1+jgU+w/uijmzzEP/uXsCLOFFOg6W7
	 tub1teDBLgpxXzl8GHvd2BMBsywEkaQlU5tBGkJLoZB+7TJYYveRZoYTSTFsDk2bQh
	 CN1sJqsJJU0vzPmplUKnRJ+7KCuz4BXg24vZsWJ/Vt8JjbhDiH0UI4+ZqGdguKTHpk
	 xih3Pa+YcDsog==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 28 Mar 2024 20:50:22 +0200
Message-Id: <D05LXJUT7T5Z.39FGAGHVQ6HZH@kernel.org>
Subject: Re: [PATCH v7 6/6] docs: trusted-encrypted: add DCP as new trust
 source
From: "Jarkko Sakkinen" <jarkko@kernel.org>
To: "Jarkko Sakkinen" <jarkko@kernel.org>, "David Gstir"
 <david@sigma-star.at>
X-Mailer: aerc 0.17.0
References: <20240327082454.13729-1-david@sigma-star.at>
 <20240327082454.13729-7-david@sigma-star.at>
 <D04N9E61QWYB.3IPEEGVPY6V8L@kernel.org>
 <A3831544-E47C-4AEB-9963-536F0B1EE8FD@sigma-star.at>
 <D05LV2A6J8X7.11895O5TC10TS@kernel.org>
In-Reply-To: <D05LV2A6J8X7.11895O5TC10TS@kernel.org>
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

On Thu Mar 28, 2024 at 8:47 PM EET, Jarkko Sakkinen wrote:
> On Thu Mar 28, 2024 at 10:05 AM EET, David Gstir wrote:
> > Jarkko,
> >
> > > On 27.03.2024, at 16:40, Jarkko Sakkinen <jarkko@kernel.org> wrote:
> > >=20
> > > On Wed Mar 27, 2024 at 10:24 AM EET, David Gstir wrote:
> > >> Update the documentation for trusted and encrypted KEYS with DCP as =
new
> > >> trust source:
> > >>=20
> > >> - Describe security properties of DCP trust source
> > >> - Describe key usage
> > >> - Document blob format
> > >>=20
> > >> Co-developed-by: Richard Weinberger <richard@nod.at>
> > >> Signed-off-by: Richard Weinberger <richard@nod.at>
> > >> Co-developed-by: David Oberhollenzer <david.oberhollenzer@sigma-star=
.at>
> > >> Signed-off-by: David Oberhollenzer <david.oberhollenzer@sigma-star.a=
t>
> > >> Signed-off-by: David Gstir <david@sigma-star.at>
> > >> ---
> > >> .../security/keys/trusted-encrypted.rst       | 85 +++++++++++++++++=
++
> > >> 1 file changed, 85 insertions(+)
> > >>=20
> > >> diff --git a/Documentation/security/keys/trusted-encrypted.rst b/Doc=
umentation/security/keys/trusted-encrypted.rst
> > >> index e989b9802f92..81fb3540bb20 100644
> > >> --- a/Documentation/security/keys/trusted-encrypted.rst
> > >> +++ b/Documentation/security/keys/trusted-encrypted.rst
> > >> @@ -42,6 +42,14 @@ safe.
> > >>          randomly generated and fused into each SoC at manufacturing=
 time.
> > >>          Otherwise, a common fixed test key is used instead.
> > >>=20
> > >> +     (4) DCP (Data Co-Processor: crypto accelerator of various i.MX=
 SoCs)
> > >> +
> > >> +         Rooted to a one-time programmable key (OTP) that is genera=
lly burnt
> > >> +         in the on-chip fuses and is accessible to the DCP encrypti=
on engine only.
> > >> +         DCP provides two keys that can be used as root of trust: t=
he OTP key
> > >> +         and the UNIQUE key. Default is to use the UNIQUE key, but =
selecting
> > >> +         the OTP key can be done via a module parameter (dcp_use_ot=
p_key).
> > >> +
> > >>   *  Execution isolation
> > >>=20
> > >>      (1) TPM
> > >> @@ -57,6 +65,12 @@ safe.
> > >>=20
> > >>          Fixed set of operations running in isolated execution envir=
onment.
> > >>=20
> > >> +     (4) DCP
> > >> +
> > >> +         Fixed set of cryptographic operations running in isolated =
execution
> > >> +         environment. Only basic blob key encryption is executed th=
ere.
> > >> +         The actual key sealing/unsealing is done on main processor=
/kernel space.
> > >> +
> > >>   * Optional binding to platform integrity state
> > >>=20
> > >>      (1) TPM
> > >> @@ -79,6 +93,11 @@ safe.
> > >>          Relies on the High Assurance Boot (HAB) mechanism of NXP So=
Cs
> > >>          for platform integrity.
> > >>=20
> > >> +     (4) DCP
> > >> +
> > >> +         Relies on Secure/Trusted boot process (called HAB by vendo=
r) for
> > >> +         platform integrity.
> > >> +
> > >>   *  Interfaces and APIs
> > >>=20
> > >>      (1) TPM
> > >> @@ -94,6 +113,11 @@ safe.
> > >>=20
> > >>          Interface is specific to silicon vendor.
> > >>=20
> > >> +     (4) DCP
> > >> +
> > >> +         Vendor-specific API that is implemented as part of the DCP=
 crypto driver in
> > >> +         ``drivers/crypto/mxs-dcp.c``.
> > >> +
> > >>   *  Threat model
> > >>=20
> > >>      The strength and appropriateness of a particular trust source f=
or a given
> > >> @@ -129,6 +153,13 @@ selected trust source:
> > >>      CAAM HWRNG, enable CRYPTO_DEV_FSL_CAAM_RNG_API and ensure the d=
evice
> > >>      is probed.
> > >>=20
> > >> +  *  DCP (Data Co-Processor: crypto accelerator of various i.MX SoC=
s)
> > >> +
> > >> +     The DCP hardware device itself does not provide a dedicated RN=
G interface,
> > >> +     so the kernel default RNG is used. SoCs with DCP like the i.MX=
6ULL do have
> > >> +     a dedicated hardware RNG that is independent from DCP which ca=
n be enabled
> > >> +     to back the kernel RNG.
> > >> +
> > >> Users may override this by specifying ``trusted.rng=3Dkernel`` on th=
e kernel
> > >> command-line to override the used RNG with the kernel's random numbe=
r pool.
> > >>=20
> > >> @@ -231,6 +262,19 @@ Usage::
> > >> CAAM-specific format.  The key length for new keys is always in byte=
s.
> > >> Trusted Keys can be 32 - 128 bytes (256 - 1024 bits).
> > >>=20
> > >> +Trusted Keys usage: DCP
> > >> +-----------------------
> > >> +
> > >> +Usage::
> > >> +
> > >> +    keyctl add trusted name "new keylen" ring
> > >> +    keyctl add trusted name "load hex_blob" ring
> > >> +    keyctl print keyid
> > >> +
> > >> +"keyctl print" returns an ASCII hex copy of the sealed key, which i=
s in format
> > >> +specific to this DCP key-blob implementation.  The key length for n=
ew keys is
> > >> +always in bytes. Trusted Keys can be 32 - 128 bytes (256 - 1024 bit=
s).
> > >> +
> > >> Encrypted Keys usage
> > >> --------------------
> > >>=20
> > >> @@ -426,3 +470,44 @@ string length.
> > >> privkey is the binary representation of TPM2B_PUBLIC excluding the
> > >> initial TPM2B header which can be reconstructed from the ASN.1 octed
> > >> string length.
> > >> +
> > >> +DCP Blob Format
> > >> +---------------
> > >> +
> > >> +The Data Co-Processor (DCP) provides hardware-bound AES keys using =
its
> > >> +AES encryption engine only. It does not provide direct key sealing/=
unsealing.
> > >> +To make DCP hardware encryption keys usable as trust source, we def=
ine
> > >> +our own custom format that uses a hardware-bound key to secure the =
sealing
> > >> +key stored in the key blob.
> > >> +
> > >> +Whenever a new trusted key using DCP is generated, we generate a ra=
ndom 128-bit
> > >> +blob encryption key (BEK) and 128-bit nonce. The BEK and nonce are =
used to
> > >> +encrypt the trusted key payload using AES-128-GCM.
> > >> +
> > >> +The BEK itself is encrypted using the hardware-bound key using the =
DCP's AES
> > >> +encryption engine with AES-128-ECB. The encrypted BEK, generated no=
nce,
> > >> +BEK-encrypted payload and authentication tag make up the blob forma=
t together
> > >> +with a version number, payload length and authentication tag::
> > >> +
> > >> +    /*
> > >> +     * struct dcp_blob_fmt - DCP BLOB format.
> > >> +     *
> > >> +     * @fmt_version: Format version, currently being %1
> > >> +     * @blob_key: Random AES 128 key which is used to encrypt @payl=
oad,
> > >> +     *            @blob_key itself is encrypted with OTP or UNIQUE =
device key in
> > >> +     *            AES-128-ECB mode by DCP.
> > >> +     * @nonce: Random nonce used for @payload encryption.
> > >> +     * @payload_len: Length of the plain text @payload.
> > >> +     * @payload: The payload itself, encrypted using AES-128-GCM an=
d @blob_key,
> > >> +     *           GCM auth tag of size AES_BLOCK_SIZE is attached at=
 the end of it.
> > >> +     *
> > >> +     * The total size of a DCP BLOB is sizeof(struct dcp_blob_fmt) =
+ @payload_len +
> > >> +     * AES_BLOCK_SIZE.
> > >> +     */
> > >> +    struct dcp_blob_fmt {
> > >> +            __u8 fmt_version;
> > >> +            __u8 blob_key[AES_KEYSIZE_128];
> > >> +            __u8 nonce[AES_KEYSIZE_128];
> > >> +            __le32 payload_len;
> > >> +            __u8 payload[];
> > >> +    } __packed;
> > >=20
> > > I'm thinking here given that you need to replicate the same thing tha=
t
> > > is in the source files. E.g. Documentation/gpu/i915.rst.
> > >=20
> > > The rationale would so many sources so maybe it would make sense to
> > > maintain this in the source code.
> > >=20
> > > Also this documents how to generally insert documentation inline:
> > > https://docs.kernel.org/doc-guide/kernel-doc.html
> > >=20
> > > I.e. I'm feeling that this is good time to improve scalability so tha=
t
> > > documentation will keep up to date. Also then backend specific patche=
s
> > > mostly go to their subdirectories and not to Documentation/ subtree
> > > (or that would be more rare case).
> > >=20
> > > So a good chance to do more than just a new backend for the benefit
> > > of the trusted keys subsystem :-)
> > >=20
> > > Also, later on if something is changed e.g. in the above struct you
> > > don't have to do matching update to the documentation so it will save
> > > time too (over time).
> >
> > sound good! I=E2=80=99ll maintain the blob format documentation to the =
source and insert=20
> > a reference in the documentation. Thanks for pointing that out!
> >
> > Is there anything else I can improve for this patchset? I=E2=80=99d lik=
e to include that in v8
> > too and make it the last iteration of this patchset.
>
> Yeah, I don't enforce you to convert all the existing work to this
> model, but we could use this as a reference for that work.

I mean that way documentation update will become more natural part of
the code update and less frustrating to do which usually encourages
to document stuff better and also later on tweak and improve it.

So yeah I feel that GPU documentation in kernel is doing lot's of things
right, and other subsystems should follow. I.e. it is good reference
model for trusted keys documentation, and said I'm cool with realizing
this for only this new key type :-) Otherwise, finishing this patch set
will torture for you and also for me if it tries to fix everything.

BR, Jarkko
