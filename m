Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B497862D68
	for <lists+linuxppc-dev@lfdr.de>; Sun, 25 Feb 2024 23:21:31 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=sigma-star.at header.i=@sigma-star.at header.a=rsa-sha256 header.s=google header.b=qsBhLclX;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TjdWY0ThWz3cWB
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Feb 2024 09:21:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=sigma-star.at header.i=@sigma-star.at header.a=rsa-sha256 header.s=google header.b=qsBhLclX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=sigma-star.at (client-ip=2a00:1450:4864:20::52a; helo=mail-ed1-x52a.google.com; envelope-from=richard@sigma-star.at; receiver=lists.ozlabs.org)
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TjdVh6wQ8z3bnV
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Feb 2024 09:20:41 +1100 (AEDT)
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-55a8fd60af0so2945299a12.1
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 25 Feb 2024 14:20:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sigma-star.at; s=google; t=1708899634; x=1709504434; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vcAAMbo5fPSeSlUc+G3Ds0RoWmjIC7d5lnGAqCLP7+0=;
        b=qsBhLclXFBuDPif9VBhxrXiUqjl5lxr4GIifLKyhXj4zvNH3XZoUvR8FCBkfAmfyQs
         C0nohXRB6DJJPVLyK2eVS76czvptlPMrgvrGOMYTO5Hu5ckCrwdfPxC5StMmiLdKQz6/
         1fe5tAfxjpUliEAud8ElIW0Jd1zi4v/6FPcUp3N5Z1IqNwA8A1dVcHNmrseMA8CoV4RF
         hytPi7FnvkviKVSTMWXvE5JM2Anw0Oh/A92uaKgYOV8jxTD8+nmTDEoXubwP/cG2tR/o
         0AvaCygmzEGQ30mS3KqNcygpw93DXjbWXmuo/0LkEe3w//hM3GbiFxlpj83BMypS0QoL
         8OXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708899634; x=1709504434;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vcAAMbo5fPSeSlUc+G3Ds0RoWmjIC7d5lnGAqCLP7+0=;
        b=bhoaxv/uYwMWL332JYW28GyJG/y7X000nBWg/1mbpmKyvIrill8UwQqk2Be1pvnWfw
         LaRjzargf+7yxzLHPUl/qpABklClTPBXgZHIYgsytNL0CwkS9m9FNvSjcAnbCpwPAmlX
         /GGmgxtvb7MR1fiCZlxyAYNvt7g2Av5zyqVV4Vc3NtWryJsQPnhtf1dMPQBkUZVTNYKv
         KKZgMov26uwXE0GgKurLQtgiGG1t6BPogt/KVGD2en5DQYjbaD4kr7bu/EXfXpH8U5hK
         d96aqXoY8+LpeSY26mmjxtMQ8Wpm1pC+KReWQ0gz/qlx0ri1WMc18SFLJ2H39KERNjGt
         bmMA==
X-Forwarded-Encrypted: i=1; AJvYcCVD70qdr1VG0IToyRzbTfAGmCiX1Iy+99CiMD6UYRKOUvOjmNTDiKJ6wwjDcPwzqnzBCbFlPDaNYlgMB/gblKvYvxRxOWHBlGsyKlekUA==
X-Gm-Message-State: AOJu0Yyek09bZYi4MIGWnAZS303Vng7IpL7PqAFHGva8xjuFr3RFtD83
	sB81h/izVmoqieri2UVA0oMquLuQ2G0ExF0RWX1TvjwCrNDquSUgn7IM/jaUhhM=
X-Google-Smtp-Source: AGHT+IG5bJ/fK8sFX2rG8b+VDYEkiBFr76ZXZ4JyDKWlPw45GhDGbdPCrTlUaWepqwiGPkAAQmeUww==
X-Received: by 2002:a17:906:3c18:b0:a3e:d5ac:9995 with SMTP id h24-20020a1709063c1800b00a3ed5ac9995mr3150880ejg.59.1708899633957;
        Sun, 25 Feb 2024 14:20:33 -0800 (PST)
Received: from blindfold.localnet (84-115-239-180.cable.dynamic.surfer.at. [84.115.239.180])
        by smtp.gmail.com with ESMTPSA id h4-20020a1709062dc400b00a3f355aeb0bsm1828968eji.131.2024.02.25.14.20.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Feb 2024 14:20:33 -0800 (PST)
From: Richard Weinberger <richard@sigma-star.at>
To: Mimi Zohar <zohar@linux.ibm.com>, James Bottomley <jejb@linux.ibm.com>, Jarkko Sakkinen <jarkko@kernel.org>, Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>, upstream@sigma-star.at, David Howells <dhowells@redhat.com>
Subject: Re: [PATCH v5 0/6] DCP as trusted keys backend
Date: Sun, 25 Feb 2024 23:20:31 +0100
Message-ID: <1733761.uacIGzncQW@somecomputer>
In-Reply-To: <47439997.XUcTiDjVJD@somecomputer>
References: <20231215110639.45522-1-david@sigma-star.at> <7AED262F-9387-446D-B11A-C549C02542F9@sigma-star.at> <47439997.XUcTiDjVJD@somecomputer>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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
Cc: David Gstir <david@sigma-star.at>, linux-doc@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, "keyrings@vger.kernel.org" <keyrings@vger.kernel.org>, Fabio Estevam <festevam@gmail.com>, Ahmad Fatoum <a.fatoum@pengutronix.de>, Paul Moore <paul@paul-moore.com>, Jonathan Corbet <corbet@lwn.net>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, James Morris <jmorris@namei.org>, NXP Linux Team <linux-imx@nxp.com>, "Serge E. Hallyn" <serge@hallyn.com>, "Paul E. McKenney" <paulmck@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, sigma star Kernel Team <upstream+dcp@sigma-star.at>, "Steven Rostedt \(Google\)" <rostedt@goodmis.org>, linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, Randy Dunlap <rdunlap@infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Li Yang <leoyang.li@nxp.com>, "linux-security-module@vger.kernel.org" <linux-security-module@vger.kernel.org>, "linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>, "ker
 nel@pengutronix.de" <kernel@pengutronix.de>, Tejun Heo <tj@kernel.org>, "linux-integrity@vger.kernel.org" <linux-integrity@vger.kernel.org>, Shawn Guo <shawnguo@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Mimi, James, Jarkko, David,

you remained silent for a whole release cycle.
Is there anything we can do to get this forward?

Thanks,
//richard

Am Dienstag, 13. Februar 2024, 10:59:56 CET schrieb Richard Weinberger:
> Am Montag, 5. Februar 2024, 09:39:07 CET schrieb David Gstir:
> > Hi,
> >=20
> > > On 15.12.2023, at 12:06, David Gstir <david@sigma-star.at> wrote:
> > >=20
> > > This is a revival of the previous patch set submitted by Richard Wein=
berger:
> > > https://lore.kernel.org/linux-integrity/20210614201620.30451-1-richar=
d@nod.at/
> > >=20
> > > v4 is here:
> > > https://lore.kernel.org/keyrings/20231024162024.51260-1-david@sigma-s=
tar.at/
> > >=20
> > > v4 -> v5:
> > > - Make Kconfig for trust source check scalable as suggested by Jarkko=
 Sakkinen
> > > - Add Acked-By from Herbert Xu to patch #1 - thanks!
> > > v3 -> v4:
> > > - Split changes on MAINTAINERS and documentation into dedicated patch=
es
> > > - Use more concise wording in commit messages as suggested by Jarkko =
Sakkinen
> > > v2 -> v3:
> > > - Addressed review comments from Jarkko Sakkinen
> > > v1 -> v2:
> > > - Revive and rebase to latest version
> > > - Include review comments from Ahmad Fatoum
> > >=20
> > > The Data CoProcessor (DCP) is an IP core built into many NXP SoCs such
> > > as i.mx6ull.
> > >=20
> > > Similar to the CAAM engine used in more powerful SoCs, DCP can AES-
> > > encrypt/decrypt user data using a unique, never-disclosed,
> > > device-specific key. Unlike CAAM though, it cannot directly wrap and
> > > unwrap blobs in hardware. As DCP offers only the bare minimum feature
> > > set and a blob mechanism needs aid from software. A blob in this case
> > > is a piece of sensitive data (e.g. a key) that is encrypted and
> > > authenticated using the device-specific key so that unwrapping can on=
ly
> > > be done on the hardware where the blob was wrapped.
> > >=20
> > > This patch series adds a DCP based, trusted-key backend and is similar
> > > in spirit to the one by Ahmad Fatoum [0] that does the same for CAAM.
> > > It is of interest for similar use cases as the CAAM patch set, but for
> > > lower end devices, where CAAM is not available.
> > >=20
> > > Because constructing and parsing the blob has to happen in software,
> > > we needed to decide on a blob format and chose the following:
> > >=20
> > > struct dcp_blob_fmt {
> > > __u8 fmt_version;
> > > __u8 blob_key[AES_KEYSIZE_128];
> > > __u8 nonce[AES_KEYSIZE_128];
> > > __le32 payload_len;
> > > __u8 payload[];
> > > } __packed;
> > >=20
> > > The `fmt_version` is currently 1.
> > >=20
> > > The encrypted key is stored in the payload area. It is AES-128-GCM
> > > encrypted using `blob_key` and `nonce`, GCM auth tag is attached at
> > > the end of the payload (`payload_len` does not include the size of
> > > the auth tag).
> > >=20
> > > The `blob_key` itself is encrypted in AES-128-ECB mode by DCP using
> > > the OTP or UNIQUE device key. A new `blob_key` and `nonce` are genera=
ted
> > > randomly, when sealing/exporting the DCP blob.
> > >=20
> > > This patchset was tested with dm-crypt on an i.MX6ULL board.
> > >=20
> > > [0] https://lore.kernel.org/keyrings/20220513145705.2080323-1-a.fatou=
m@pengutronix.de/
> > >=20
> > > David Gstir (6):
> > >  crypto: mxs-dcp: Add support for hardware-bound keys
> > >  KEYS: trusted: improve scalability of trust source config
> > >  KEYS: trusted: Introduce NXP DCP-backed trusted keys
> > >  MAINTAINERS: add entry for DCP-based trusted keys
> > >  docs: document DCP-backed trusted keys kernel params
> > >  docs: trusted-encrypted: add DCP as new trust source
> > >=20
> > > .../admin-guide/kernel-parameters.txt         |  13 +
> > > .../security/keys/trusted-encrypted.rst       |  85 +++++
> > > MAINTAINERS                                   |   9 +
> > > drivers/crypto/mxs-dcp.c                      | 104 +++++-
> > > include/keys/trusted_dcp.h                    |  11 +
> > > include/soc/fsl/dcp.h                         |  17 +
> > > security/keys/trusted-keys/Kconfig            |  18 +-
> > > security/keys/trusted-keys/Makefile           |   2 +
> > > security/keys/trusted-keys/trusted_core.c     |   6 +-
> > > security/keys/trusted-keys/trusted_dcp.c      | 311 ++++++++++++++++++
> > > 10 files changed, 562 insertions(+), 14 deletions(-)
> > > create mode 100644 include/keys/trusted_dcp.h
> > > create mode 100644 include/soc/fsl/dcp.h
> > > create mode 100644 security/keys/trusted-keys/trusted_dcp.c
> >=20
> > Jarkko, Mimi, David do you need anything from my side for these patches=
 to get them merged?
>=20
> Friendly ping also from my side. :-)
>=20
> Thanks,
> //richard
>=20
> --=20
> =E2=80=8B=E2=80=8B=E2=80=8B=E2=80=8B=E2=80=8Bsigma star gmbh | Eduard-Bod=
em-Gasse 6, 6020 Innsbruck, AUT
> UID/VAT Nr: ATU 66964118 | FN: 374287y
>=20


=2D-=20
=E2=80=8B=E2=80=8B=E2=80=8B=E2=80=8B=E2=80=8Bsigma star gmbh | Eduard-Bodem=
=2DGasse 6, 6020 Innsbruck, AUT
UID/VAT Nr: ATU 66964118 | FN: 374287y


