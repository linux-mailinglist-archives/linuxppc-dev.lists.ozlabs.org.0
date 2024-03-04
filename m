Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F88787106B
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Mar 2024 23:52:21 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=qH7ghQWU;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TpYqR2zynz3ccC
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Mar 2024 09:52:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=qH7ghQWU;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=jarkko@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TpYpl2b3Pz2ytp
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Mar 2024 09:51:43 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6310461233;
	Mon,  4 Mar 2024 22:51:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD380C433C7;
	Mon,  4 Mar 2024 22:51:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709592701;
	bh=YhKdEjJYfUK5PGnDdyu7Ox1LTeRZMNbyU1Aoe9uCC1k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qH7ghQWUmWQSFGS9dlXBIbNWYEOOV2jZSCJ5jRYtKU+tKXVwRV3OzXUDwdQCSfBcu
	 ILXJufnw4gwvdFpU28/Ac0v+55ZUgCnLN5hWfIViC8GuEbcJHk+1n1WNQH1F9ozfck
	 eOYFpNFCdzT4p8oxHi08FIGAODLqPl/HQsDxr51Apj5rdpBtdjjRXT6esVMAVPcbJC
	 N2Mv+13ROf8vZNFvpecIxb3OxpBw7iuSSafDNlQVCRvmBjMlNu9DQ2/ucT98HNiR5g
	 yDDWTIMc4cPTIFkdL1o9fRuyQiBDkdEhahBQtZRB8OyaQAb2z8VmXTSy4DkvZFnuTu
	 aBWa4hCcB5ErA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 05 Mar 2024 00:51:33 +0200
Message-Id: <CZLC14YSOYS5.XWHWWQYZCFZ3@suppilovahvero>
From: "Jarkko Sakkinen" <jarkko@kernel.org>
To: "Paul Moore" <paul@paul-moore.com>, "David Gstir" <david@sigma-star.at>,
 "Mimi Zohar" <zohar@linux.ibm.com>, "David Howells" <dhowells@redhat.com>
Subject: Re: [PATCH v5 0/6] DCP as trusted keys backend
X-Mailer: aerc 0.15.2
References: <20231215110639.45522-1-david@sigma-star.at>
 <CAHC9VhSRjwN=a9=V--m46_xh4fQNwZ9781YBCDpAmAV1mofhQg@mail.gmail.com>
In-Reply-To: <CAHC9VhSRjwN=a9=V--m46_xh4fQNwZ9781YBCDpAmAV1mofhQg@mail.gmail.com>
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
Cc: linux-doc@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, keyrings@vger.kernel.org, Fabio Estevam <festevam@gmail.com>, Ahmad Fatoum <a.fatoum@pengutronix.de>, Herbert Xu <herbert@gondor.apana.org.au>, Jonathan Corbet <corbet@lwn.net>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, James Morris <jmorris@namei.org>, NXP Linux
 Team <linux-imx@nxp.com>, James Bottomley <jejb@linux.ibm.com>, "Serge E. Hallyn" <serge@hallyn.com>, "Paul E. McKenney" <paulmck@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, sigma
 star Kernel Team <upstream+dcp@sigma-star.at>, "Steven Rostedt \(Google\)" <rostedt@goodmis.org>, linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org, Li Yang <leoyang.li@nxp.com>, linux-security-module@vger.kernel.org, linux-crypto@vger.kernel.org, Pengutronix Kernel Team <kernel@pengutronix.de>, Tejun Heo <tj@kernel.org>, linux-integrity@vger.kernel.org, Shawn Guo <shawnguo@kernel.org>, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue Dec 19, 2023 at 2:45 AM EET, Paul Moore wrote:
> On Fri, Dec 15, 2023 at 6:07=E2=80=AFAM David Gstir <david@sigma-star.at>=
 wrote:
> >
> > This is a revival of the previous patch set submitted by Richard Weinbe=
rger:
> > https://lore.kernel.org/linux-integrity/20210614201620.30451-1-richard@=
nod.at/
> >
> > v4 is here:
> > https://lore.kernel.org/keyrings/20231024162024.51260-1-david@sigma-sta=
r.at/
> >
> > v4 -> v5:
> > - Make Kconfig for trust source check scalable as suggested by Jarkko S=
akkinen
> > - Add Acked-By from Herbert Xu to patch #1 - thanks!
> > v3 -> v4:
> > - Split changes on MAINTAINERS and documentation into dedicated patches
> > - Use more concise wording in commit messages as suggested by Jarkko Sa=
kkinen
> > v2 -> v3:
> > - Addressed review comments from Jarkko Sakkinen
> > v1 -> v2:
> > - Revive and rebase to latest version
> > - Include review comments from Ahmad Fatoum
> >
> > The Data CoProcessor (DCP) is an IP core built into many NXP SoCs such
> > as i.mx6ull.
> >
> > Similar to the CAAM engine used in more powerful SoCs, DCP can AES-
> > encrypt/decrypt user data using a unique, never-disclosed,
> > device-specific key. Unlike CAAM though, it cannot directly wrap and
> > unwrap blobs in hardware. As DCP offers only the bare minimum feature
> > set and a blob mechanism needs aid from software. A blob in this case
> > is a piece of sensitive data (e.g. a key) that is encrypted and
> > authenticated using the device-specific key so that unwrapping can only
> > be done on the hardware where the blob was wrapped.
> >
> > This patch series adds a DCP based, trusted-key backend and is similar
> > in spirit to the one by Ahmad Fatoum [0] that does the same for CAAM.
> > It is of interest for similar use cases as the CAAM patch set, but for
> > lower end devices, where CAAM is not available.
> >
> > Because constructing and parsing the blob has to happen in software,
> > we needed to decide on a blob format and chose the following:
> >
> > struct dcp_blob_fmt {
> >         __u8 fmt_version;
> >         __u8 blob_key[AES_KEYSIZE_128];
> >         __u8 nonce[AES_KEYSIZE_128];
> >         __le32 payload_len;
> >         __u8 payload[];
> > } __packed;
> >
> > The `fmt_version` is currently 1.
> >
> > The encrypted key is stored in the payload area. It is AES-128-GCM
> > encrypted using `blob_key` and `nonce`, GCM auth tag is attached at
> > the end of the payload (`payload_len` does not include the size of
> > the auth tag).
> >
> > The `blob_key` itself is encrypted in AES-128-ECB mode by DCP using
> > the OTP or UNIQUE device key. A new `blob_key` and `nonce` are generate=
d
> > randomly, when sealing/exporting the DCP blob.
> >
> > This patchset was tested with dm-crypt on an i.MX6ULL board.
> >
> > [0] https://lore.kernel.org/keyrings/20220513145705.2080323-1-a.fatoum@=
pengutronix.de/
> >
> > David Gstir (6):
> >   crypto: mxs-dcp: Add support for hardware-bound keys
> >   KEYS: trusted: improve scalability of trust source config
> >   KEYS: trusted: Introduce NXP DCP-backed trusted keys
> >   MAINTAINERS: add entry for DCP-based trusted keys
> >   docs: document DCP-backed trusted keys kernel params
> >   docs: trusted-encrypted: add DCP as new trust source
> >
> >  .../admin-guide/kernel-parameters.txt         |  13 +
> >  .../security/keys/trusted-encrypted.rst       |  85 +++++
> >  MAINTAINERS                                   |   9 +
> >  drivers/crypto/mxs-dcp.c                      | 104 +++++-
> >  include/keys/trusted_dcp.h                    |  11 +
> >  include/soc/fsl/dcp.h                         |  17 +
> >  security/keys/trusted-keys/Kconfig            |  18 +-
> >  security/keys/trusted-keys/Makefile           |   2 +
> >  security/keys/trusted-keys/trusted_core.c     |   6 +-
> >  security/keys/trusted-keys/trusted_dcp.c      | 311 ++++++++++++++++++
> >  10 files changed, 562 insertions(+), 14 deletions(-)
> >  create mode 100644 include/keys/trusted_dcp.h
> >  create mode 100644 include/soc/fsl/dcp.h
> >  create mode 100644 security/keys/trusted-keys/trusted_dcp.c
>
> Jarkko, Mimi, David - if this patchset isn't already in your review
> queue, can you take a look at it from a security/keys perspective?
>
> Thanks.

I gave my 5 cents. I had no intention not to review it, somehow just
slipped. I try to do my best but sometimes this still does happen :-) So
please ping me if there is radio silence.=20

BR, Jarkko
