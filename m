Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AD8B0852D4B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Feb 2024 11:00:49 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=sigma-star.at header.i=@sigma-star.at header.a=rsa-sha256 header.s=google header.b=IJimwB3v;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TYxfR4HyDz3dVq
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Feb 2024 21:00:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=sigma-star.at header.i=@sigma-star.at header.a=rsa-sha256 header.s=google header.b=IJimwB3v;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=sigma-star.at (client-ip=2a00:1450:4864:20::62e; helo=mail-ej1-x62e.google.com; envelope-from=richard@sigma-star.at; receiver=lists.ozlabs.org)
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TYxdg5dHgz2ydW
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Feb 2024 21:00:05 +1100 (AEDT)
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-a3ce44c5ac0so134939466b.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Feb 2024 02:00:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sigma-star.at; s=google; t=1707818399; x=1708423199; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kyeDtepLgx0McOY1pO4WdkIJtQMiPkAy0vk69/uR3rI=;
        b=IJimwB3vIWcv0qeGU67Dby9ljAJsO1Z8NpHUq+L5XcqFhMnSa2IP1j8/H3PpHzHwxp
         3l/IXo4PIiDogNVkSblqXlGsa6nt/Pp24f1M7tyRiju154gHAVnodBPiya5VSPOTBpVx
         9nKtvi7RuBTR1FR3S6ZUteEwxtOSBVQUtmA98gcmSi/7rFIHPe20wj4RfI+HsrbL4vG8
         uqEsdMpSOUduh61uVGd8Qo09CGx4qI4Nius63V74egYjFCMBWQX6I0ZKdYRU381YAtfX
         QEQyMaBWk9Uu1ap4smxdgj+W14vpKEEdEJYGZ3DxatckiTXdAaAkOBoGrOd3ovNk2v5m
         la4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707818399; x=1708423199;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kyeDtepLgx0McOY1pO4WdkIJtQMiPkAy0vk69/uR3rI=;
        b=bEa/4IRsgESSDFWwqx/2LavWI3kjFKvWYd2z1WQV17NttDYeXk6mRCeOGl4Gr4V6Yt
         7pa9rfYMshYPB7IVgTEy85MNIjvUp5XUR9fsVzMxYLgrWqS2tidWFbnkR+mM5muViKfC
         wKTe3xW/WXQ3Jm6FBBEWD3preoodcpo3SW2YAcEYQYE+0IcWvkmsMhsFS2+qT0h3uLF9
         XbQRmQSPdouAcr1He5ddFW8ryiYmSgJrJEJzUz3XivrpYRwZcEeTEUB8fxXZH6mLWtoR
         khtLRf/zm3NtZS87xFMIk0l5xZ48VqZEjkNuzf/PLNONr7cm6R4bNdTRKtCUYBIbHpqZ
         TgPg==
X-Forwarded-Encrypted: i=1; AJvYcCWc1KIMT1sYY3L4V7CAR8cLE3bYzG22rLOENdm77wbKtWtW90DF8gL5Ep1B7h4A8fLBjmt+/mclIDQNfwXT4Ex0HeBmMCvbMMevU7Ij+g==
X-Gm-Message-State: AOJu0YyvvURwTuUETTk3cpe22KMGXrfHYM1FXc+2yU8wQUQROcWt7s3h
	FWOoLIN6/qkQw6Y+jOWAKhgAfz5U2ueziJ/oWrnJuaE0z+A41GobpGYsRCPsGnw=
X-Google-Smtp-Source: AGHT+IHEjTCzJQiMRtlAWhiS4vBU8FucNsWEQmzIuMGcPfQWtxNPG6A/AHgXHP88FZXuf9FpsLb1RA==
X-Received: by 2002:a17:906:da03:b0:a3c:8772:97bc with SMTP id fi3-20020a170906da0300b00a3c877297bcmr4593945ejb.70.1707818399072;
        Tue, 13 Feb 2024 01:59:59 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU9Lvd0gIyxW7fyt4/vBOTtTFhw8BwSuz+lp9azwGwU/sEacO3hp4UP5b9jT4ZdzTXdpxRrNw3yWTkRA2mZc0ViUYvJI1T1Wil0XREjFxK6TG0gNqfdSgjrNF3pi9+7ljipOLTqFxTmPut2EvJvoC8REQLk9w3hNJDOA5mnxH5VIGqWmQD6wpqUTTkgCCec3TIQHVlmxYJ+RIbhuiDhlBe61VOjQ6ixhteHpfb50d+9J3rO+r26f2iEIQN04Loa/NxVD9DoebEX0YjEI/E0wU7EuKGFQhUzHfBc7zRzkZICZaXj2PpNdGdV7ULDQtMx1e2tHpcuaNgXcZxx53a3PrQpPSWkPLUGh9PLTugf22ZPoLA79U+WpqCLjlqJ+wMIuGy4aRX2astyccDTpqopsnoZwr+Le8XQl44nQ6XGse4g+ZsL5HSIoGYaTdcc8put9I/V4NLPaVXKQeFqCJgyDybNC8Laewb91SL/TQRVdzTVLx9+dhvfWHwYXfHQeMNJCe72RkbkPzT6l/CPkYElYVrWj8wfEITjz6UKfDibWZB9i9ao8mCJ6B/0uiw9X6zcxuJUKi9qESLTeVDKBnfWtk8P58ZkCAu03Y+qtfwccvG07ICfkjzsKxpE5Pt861yDtMR6V1bK7JZVoQ72CkFkr4h1JAMpgffeNn5a8693YQG0btUA22KCxYl748oIeBuUaU5weN0OgylotSAWDn3J+w9D8+iAVNcYDDDm6vrBuVEVe/nkWh3eCqeE3h4+ixmPB1guSaScYDm3pSJsYggz3f3662OrPJO66ThrXIAoTwKOuD3gEuyFt9um4e5fU1zMso7lcn9Y4JkbAlXk5eM5zUfdLJX36PrPI/Cm6fIT2meQUyuGG0ZG0cYTECFnY1/RtGANkJEWV5Z1TL7Y/e+1gt9IS9+hus0u+UJ6M37+PAiCR0b1Lib4J7X75weyMTYmwhW0AK
 mqmjwh2l9tVFgBdCifZBmXLaCEPzP813Cy13sEjfE6Aw/xPVQ1s23IRXd3yquvCIyW2lH73g1yk3Yd1QO9sJHXm84uLvW1g9PraVncRy64krUOqC22xsO9nxpucuoBjrbq
Received: from blindfold.localnet ([82.150.214.1])
        by smtp.gmail.com with ESMTPSA id vg9-20020a170907d30900b00a3cf4e8fdf5sm657479ejc.150.2024.02.13.01.59.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Feb 2024 01:59:58 -0800 (PST)
From: Richard Weinberger <richard@sigma-star.at>
To: Mimi Zohar <zohar@linux.ibm.com>, James Bottomley <jejb@linux.ibm.com>, Jarkko Sakkinen <jarkko@kernel.org>, Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>, upstream@sigma-star.at
Subject: Re: [PATCH v5 0/6] DCP as trusted keys backend
Date: Tue, 13 Feb 2024 10:59:56 +0100
Message-ID: <47439997.XUcTiDjVJD@somecomputer>
In-Reply-To: <7AED262F-9387-446D-B11A-C549C02542F9@sigma-star.at>
References: <20231215110639.45522-1-david@sigma-star.at> <7AED262F-9387-446D-B11A-C549C02542F9@sigma-star.at>
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
Cc: David Gstir <david@sigma-star.at>, linux-doc@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, David Howells <dhowells@redhat.com>, "keyrings@vger.kernel.org" <keyrings@vger.kernel.org>, Fabio Estevam <festevam@gmail.com>, Ahmad Fatoum <a.fatoum@pengutronix.de>, Paul Moore <paul@paul-moore.com>, Jonathan Corbet <corbet@lwn.net>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, James Morris <jmorris@namei.org>, NXP Linux Team <linux-imx@nxp.com>, "Serge E. Hallyn" <serge@hallyn.com>, "Paul E. McKenney" <paulmck@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, sigma star Kernel Team <upstream+dcp@sigma-star.at>, "Steven Rostedt \(Google\)" <rostedt@goodmis.org>, linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, Randy Dunlap <rdunlap@infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Li Yang <leoyang.li@nxp.com>, "linux-security-module@vger.kernel.org" <linux-security-module@vger.kernel.org>, "linux-crypto@vger.kernel.org"
  <linux-crypto@vger.kernel.org>, "kernel@pengutronix.de" <kernel@pengutronix.de>, Tejun Heo <tj@kernel.org>, "linux-integrity@vger.kernel.org" <linux-integrity@vger.kernel.org>, Shawn Guo <shawnguo@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Am Montag, 5. Februar 2024, 09:39:07 CET schrieb David Gstir:
> Hi,
>=20
> > On 15.12.2023, at 12:06, David Gstir <david@sigma-star.at> wrote:
> >=20
> > This is a revival of the previous patch set submitted by Richard Weinbe=
rger:
> > https://lore.kernel.org/linux-integrity/20210614201620.30451-1-richard@=
nod.at/
> >=20
> > v4 is here:
> > https://lore.kernel.org/keyrings/20231024162024.51260-1-david@sigma-sta=
r.at/
> >=20
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
> >=20
> > The Data CoProcessor (DCP) is an IP core built into many NXP SoCs such
> > as i.mx6ull.
> >=20
> > Similar to the CAAM engine used in more powerful SoCs, DCP can AES-
> > encrypt/decrypt user data using a unique, never-disclosed,
> > device-specific key. Unlike CAAM though, it cannot directly wrap and
> > unwrap blobs in hardware. As DCP offers only the bare minimum feature
> > set and a blob mechanism needs aid from software. A blob in this case
> > is a piece of sensitive data (e.g. a key) that is encrypted and
> > authenticated using the device-specific key so that unwrapping can only
> > be done on the hardware where the blob was wrapped.
> >=20
> > This patch series adds a DCP based, trusted-key backend and is similar
> > in spirit to the one by Ahmad Fatoum [0] that does the same for CAAM.
> > It is of interest for similar use cases as the CAAM patch set, but for
> > lower end devices, where CAAM is not available.
> >=20
> > Because constructing and parsing the blob has to happen in software,
> > we needed to decide on a blob format and chose the following:
> >=20
> > struct dcp_blob_fmt {
> > __u8 fmt_version;
> > __u8 blob_key[AES_KEYSIZE_128];
> > __u8 nonce[AES_KEYSIZE_128];
> > __le32 payload_len;
> > __u8 payload[];
> > } __packed;
> >=20
> > The `fmt_version` is currently 1.
> >=20
> > The encrypted key is stored in the payload area. It is AES-128-GCM
> > encrypted using `blob_key` and `nonce`, GCM auth tag is attached at
> > the end of the payload (`payload_len` does not include the size of
> > the auth tag).
> >=20
> > The `blob_key` itself is encrypted in AES-128-ECB mode by DCP using
> > the OTP or UNIQUE device key. A new `blob_key` and `nonce` are generated
> > randomly, when sealing/exporting the DCP blob.
> >=20
> > This patchset was tested with dm-crypt on an i.MX6ULL board.
> >=20
> > [0] https://lore.kernel.org/keyrings/20220513145705.2080323-1-a.fatoum@=
pengutronix.de/
> >=20
> > David Gstir (6):
> >  crypto: mxs-dcp: Add support for hardware-bound keys
> >  KEYS: trusted: improve scalability of trust source config
> >  KEYS: trusted: Introduce NXP DCP-backed trusted keys
> >  MAINTAINERS: add entry for DCP-based trusted keys
> >  docs: document DCP-backed trusted keys kernel params
> >  docs: trusted-encrypted: add DCP as new trust source
> >=20
> > .../admin-guide/kernel-parameters.txt         |  13 +
> > .../security/keys/trusted-encrypted.rst       |  85 +++++
> > MAINTAINERS                                   |   9 +
> > drivers/crypto/mxs-dcp.c                      | 104 +++++-
> > include/keys/trusted_dcp.h                    |  11 +
> > include/soc/fsl/dcp.h                         |  17 +
> > security/keys/trusted-keys/Kconfig            |  18 +-
> > security/keys/trusted-keys/Makefile           |   2 +
> > security/keys/trusted-keys/trusted_core.c     |   6 +-
> > security/keys/trusted-keys/trusted_dcp.c      | 311 ++++++++++++++++++
> > 10 files changed, 562 insertions(+), 14 deletions(-)
> > create mode 100644 include/keys/trusted_dcp.h
> > create mode 100644 include/soc/fsl/dcp.h
> > create mode 100644 security/keys/trusted-keys/trusted_dcp.c
>=20
> Jarkko, Mimi, David do you need anything from my side for these patches t=
o get them merged?

=46riendly ping also from my side. :-)

Thanks,
//richard

=2D-=20
=E2=80=8B=E2=80=8B=E2=80=8B=E2=80=8B=E2=80=8Bsigma star gmbh | Eduard-Bodem=
=2DGasse 6, 6020 Innsbruck, AUT
UID/VAT Nr: ATU 66964118 | FN: 374287y


