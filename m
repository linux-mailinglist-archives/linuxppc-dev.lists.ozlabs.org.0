Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B42504289C5
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Oct 2021 11:38:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HSYd5006Gz2yXc
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Oct 2021 20:38:16 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=i59HQEsR;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=wsa@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=i59HQEsR; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HSYcR4dp9z2yJT
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 11 Oct 2021 20:37:43 +1100 (AEDT)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7D06360EDF;
 Mon, 11 Oct 2021 09:37:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1633945061;
 bh=YyuuSg4+Xw1WBeodqUV8qTEhir5tsvWm6bEneSlHOmM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=i59HQEsRw6XeL+wWM/VpKT61n1VUj0RezFOCjc+1AthZno/w4EKiQ4PAZfRzpXHbs
 rRtiFU/s5A2ARGgjZqjyUtCPpPmvI7itUB8+OIkU69WuIAbfy6uYeC/NzCvk0WRrQN
 Z3xsGY1KDeSChYzBHmLDiFnJG6I14FlxtXTV57f3XxFvj5mqCevNecNIqdbBq2LdJo
 5REpks8Dc6RbBI0lCZE9EGHhPL4YGrBAGb+qCtVqFszz0ycd76ybGzMPwrfwDLCaZy
 eIWNHd2cCloOSxOhnhPsp2XpAniAjsWuvMcU/feK35TSsS070j7U2Vuoy6LwcEl8hf
 WFrunQPR7oIWQ==
Date: Mon, 11 Oct 2021 11:37:36 +0200
From: Wolfram Sang <wsa@kernel.org>
To: Hector Martin <marcan@marcan.st>
Subject: Re: [PATCH v2 00/11] Add Apple M1 support to PASemi i2c driver
Message-ID: <YWQF4D40a/qpfM3/@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
 Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>,
 Christian Zigotzky <chzigotzky@xenosoft.de>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Olof Johansson <olof@lixom.net>,
 Arnd Bergmann <arnd@arndb.de>,
 Mohamed Mediouni <mohamed.mediouni@caramail.com>,
 Stan Skowronek <stan@corellium.com>,
 Mark Kettenis <mark.kettenis@xs4all.nl>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 linux-arm-kernel@lists.infradead.org,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
 "R.T.Dickinson" <rtd@a-eon.com>, Matthew Leaman <matthew@a-eon.biz>,
 Darren Stevens <darren@stevens-zone.net>
References: <20211008163532.75569-1-sven@svenpeter.dev>
 <YWFqr4uQGlNgnT1z@ninjato>
 <8a8afc73-3756-a305-ce5f-70b4bce6999f@xenosoft.de>
 <11d8f784-c90a-4e6c-9abd-564cb5241cb7@www.fastmail.com>
 <YWP71c8cXlE3PcIo@kunai>
 <5ae30425-d6d4-5688-36e3-58cc6c6ff264@marcan.st>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="5TP+rHLVHtolMC1P"
Content-Disposition: inline
In-Reply-To: <5ae30425-d6d4-5688-36e3-58cc6c6ff264@marcan.st>
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
Cc: Darren Stevens <darren@stevens-zone.net>, Arnd Bergmann <arnd@arndb.de>,
 Sven Peter <sven@svenpeter.dev>, linux-kernel@vger.kernel.org,
 linux-i2c@vger.kernel.org, Paul Mackerras <paulus@samba.org>,
 linux-arm-kernel@lists.infradead.org,
 Christian Zigotzky <chzigotzky@xenosoft.de>, Olof Johansson <olof@lixom.net>,
 Mohamed Mediouni <mohamed.mediouni@caramail.com>,
 "R.T.Dickinson" <rtd@a-eon.com>, Mark Kettenis <mark.kettenis@xs4all.nl>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Matthew Leaman <matthew@a-eon.biz>, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Stan Skowronek <stan@corellium.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--5TP+rHLVHtolMC1P
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > Because MAINTAINER dependencies can be a bit nasty, I suggest I drop the
> > MAINTAINER additions for now and we add them later. Then, you can add
> > the pasemi-core as well. D'accord?
> >=20
>=20
> We can just split the MAINTAINERS changes into a separate patch and I can
> push that one through the SoC tree, along with other MAINTAINERS updates.
> Does that work for everyone?

That would also work for me. Thank you!


--5TP+rHLVHtolMC1P
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmFkBdwACgkQFA3kzBSg
KbYFeRAAn3V00WXZcUzFlKUIvdYT0C7Yni7P6e8BRdY0CYPcLdAQdT588ZDnztXb
F1+gVrKcGjcSW0PH9Poor5cE1bH3BtCWl3bM0lVC3QXPSLEA23ZjO/WA+mWDLnNM
y08LX6qn0jNDSf7MEgWCkKA7gpYTmxwZr4+hanflNHp2V+imR1vp803p59rSpX4+
ZO+bm4HBy3A0VvTU26uzIbOJgpn5cO9vdZ6bLdw4Q6CdYmr1rq3p0mytsPEnnIOz
gDuacJ9HwN3xmRa1cdMhXOKTgdryn6ZAEqyfaW5rgiM2dL9ZTumEUkJyHXcc1sMS
QQqvQnY3zzhyLyEJsLPLMJnQQHGwUyMFX4D5R54tO1s0ne6iNIcOdWMsfAcrOb8b
YWaikNAw3oQ392V6g/iXPUfMppY9O1f47gZkLMHuHZV5XusPm84qyYIlysgyyf3d
Qwg5nFywlOFxYtySkxfje/OLREkzZoVOQXaxi/kC3IQiWDtoxU9NYMu7blXrJa71
/kEe4lftTRBKib/iRahLb0ZOOiBI2Zpd0IiY3z5/Edhp9TY4akDHFOBOGZ66p8Af
P/3TDcr7XZ/10fBZA/2biB4a5/hVKbnUTMBkXjqhNYN4lQA4VbuFB4+KvXJXrf4y
Lsy0yB+hE2CIa7sRFrjGBPjPZTjvuYg1VONj3P/VUS4KDw02Uss=
=z66C
-----END PGP SIGNATURE-----

--5TP+rHLVHtolMC1P--
