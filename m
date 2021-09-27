Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B98F418FB5
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Sep 2021 09:08:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HHtyW15mpz2ypR
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Sep 2021 17:08:19 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=dM0aiacI;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=wsa@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=dM0aiacI; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HHtxn4kSYz2yHM
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Sep 2021 17:07:41 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4D47760F94;
 Mon, 27 Sep 2021 07:07:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1632726457;
 bh=eMQ6pJlXVCcD9g2RORTHEO4UfDrkbLRI1N5jWkz02pk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dM0aiacINeizZ/6nAaB75Y4hAq+u2IvBjiW0d5J2/eoqd+undvXHbOZWTKuBv0Rvl
 wpAsdPnQz4ltiF9RFHkApMFWBAbIl/YTlCXa5lCLoOoZoa8RcpRusmUNyyGvCUDk+O
 B0KlHcQ0OcBgbDCzd2z72uSf++2vFJsl1Ulit2Tc7mgFmz3M4VYv9KO2AjvvdqAa5D
 e+jGqSC/6IF7/inwhuRmkfuJcB1qXNtUVjLtybC/yzLdY4mclsBQGA8e1Hvx99fSzh
 JqzVMaJQpVaqnd1xSXaz333Y+fxr+BsuKoLLMmSBR6s9pF9HefFyymsGryxLbkisG+
 GfH1GfAfaCQ/A==
Date: Mon, 27 Sep 2021 09:07:26 +0200
From: Wolfram Sang <wsa@kernel.org>
To: Sven Peter <sven@svenpeter.dev>
Subject: Re: Add Apple M1 support to PASemi i2c driver
Message-ID: <YVFtrpxfUbzv4XxT@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
 Sven Peter <sven@svenpeter.dev>,
 Christian Zigotzky <chzigotzky@xenosoft.de>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Olof Johansson <olof@lixom.net>,
 Arnd Bergmann <arnd@arndb.de>, Hector Martin <marcan@marcan.st>,
 mohamed.mediouni@caramail.com, Stan Skowronek <stan@corellium.com>,
 Mark Kettenis <mark.kettenis@xs4all.nl>,
 linux-arm-kernel@lists.infradead.org,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 linux-i2c@vger.kernel.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "R.T.Dickinson" <rtd2@xtra.co.nz>,
 Darren Stevens <darren@stevens-zone.net>,
 Matthew Leaman <matthew@a-eon.biz>, "R.T.Dickinson" <rtd@a-eon.com>
References: <6487d099-e0d6-4ea3-d312-6adbd94589f4@xenosoft.de>
 <3dcc6c36-a0dd-0cad-428d-a6ed0f73e687@xenosoft.de>
 <d0a646c7-426b-4b40-b3fc-9776c6a1025d@www.fastmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="gTShxT62TmlXACri"
Content-Disposition: inline
In-Reply-To: <d0a646c7-426b-4b40-b3fc-9776c6a1025d@www.fastmail.com>
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
Cc: Hector Martin <marcan@marcan.st>, Arnd Bergmann <arnd@arndb.de>,
 Christian Zigotzky <chzigotzky@xenosoft.de>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-i2c@vger.kernel.org, Darren Stevens <darren@stevens-zone.net>,
 Paul Mackerras <paulus@samba.org>, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 "R.T.Dickinson" <rtd2@xtra.co.nz>, Olof Johansson <olof@lixom.net>,
 mohamed.mediouni@caramail.com, Matthew Leaman <matthew@a-eon.biz>,
 Mark Kettenis <mark.kettenis@xs4all.nl>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, "R.T.Dickinson" <rtd@a-eon.com>,
 linux-arm-kernel@lists.infradead.org, Stan Skowronek <stan@corellium.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--gTShxT62TmlXACri
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Sure, will do that later as well!

But please do it privately. For upstreaming, the patch series you sent
is way better than a single patch.


--gTShxT62TmlXACri
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmFRbaoACgkQFA3kzBSg
KbbrrQ/9HIs6yV6l8QWQ+P4IlPfU2kXwk3/9VhzWJrZ3nsok/WzVbDWJmgPo7lJH
XR6Nm4tcJI+N3zqD4K2yIjmjhOaZPS9FqWwU52+46C3N9KtefLm5nk2BKPcWQeSv
/ezPuxpFX73wh+sLjHrlGJm02QBycsWU0UWXPeDCjzMHvgLKMK+TBOMkMkDiaR7N
zHlVEyraezoqXsW+YIe766GewkmOnBp9r97NXrn1nLjWmVV81wXt0jTg7v/mVcCO
8HAle3UUvQc+njozZZrYwwDPyS5Qr1sfRWaVVOROD3ljqaDEC7kJtYJ+AyOVdmvU
vOrcmXKSvsluIZb7qfk6OuLL2H3Vg47TvaYjZ7jdqoHeAKiEOP/IOB8InYMiu49A
ne28Gw7Rrv4qxao4JIFnL0/3teaDMnlGXLe5unP0lQ0QDno9Q2PeiLfWkFPzvMeU
7XhioE+m3UFSFBG5MhjpDuVm0LeQXw+F2kOK2bSWEKbtRW0qfYgOhJVzBIrqYgn+
mdAiLA9CecBnAQDr8eS8nqg16MUpdCnm7AXr0WgFv43UN4kkeme3gTww1N3GAzSh
TkmF/Ii0C+Tl7DEUQP2YsRwS8b1axQ6BD80FjvYdVVur8Arb+KcnSgjdca7jYyfw
64CBmjl455K9IQv0wYY7r695zhQch3OkKa91VsmwGXMvzlw+tMo=
=Kgu0
-----END PGP SIGNATURE-----

--gTShxT62TmlXACri--
