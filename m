Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id ACF2C41CD6F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Sep 2021 22:34:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HKSlf2rq8z304r
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Sep 2021 06:34:22 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=NwaW0+Yx;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=wsa@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=NwaW0+Yx; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HKSl10yVnz2ymr
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Sep 2021 06:33:49 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPSA id AE5B261214;
 Wed, 29 Sep 2021 20:33:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1632947625;
 bh=WhIOdO1kGw77Ewr1D3r2Fuf1SftvNF+jqwjULDSyJRw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NwaW0+YxmxXBlG5e0Wg083UOBAXIHEOfj8bi8S7bxFd5JrNukFQZuW2lhhdbWtZL7
 ROy2pBQAnQwPT2NHAAS0mu4DYWCIPVgaRlKGngnrSfkM/nfnmdC5J9xjQPSZ+jknVr
 XjEBcMXNh9WERP4XlVdDWt+ml+JMFvYLENA9wXqwovAuJ+nVwddSJ8ZeKK5T9hAZlM
 VGeU9wxupu7XPwGGtck81CEzOsG29eY37sav+eXwkXcR6yAhTrOt/gY2o+O/77YggX
 HwTvZPo/glGuuDy19nzkPlggdSGJOtY2Naiz8ThCA4HeI553u1Atf8S2l2g5aAC9Pr
 IElxuYt/1AFKg==
Date: Wed, 29 Sep 2021 22:33:42 +0200
From: Wolfram Sang <wsa@kernel.org>
To: Sven Peter <sven@svenpeter.dev>
Subject: Re: [PATCH 09/10] i2c: pasemi: Add Apple platform driver
Message-ID: <YVTNpt/vOeZI5P+L@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
 Sven Peter <sven@svenpeter.dev>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Olof Johansson <olof@lixom.net>,
 Arnd Bergmann <arnd@arndb.de>, Hector Martin <marcan@marcan.st>,
 Mohamed Mediouni <mohamed.mediouni@caramail.com>,
 Stan Skowronek <stan@corellium.com>,
 Mark Kettenis <mark.kettenis@xs4all.nl>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210926095847.38261-1-sven@svenpeter.dev>
 <20210926095847.38261-10-sven@svenpeter.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="Abt4sC3J3qWpCcYx"
Content-Disposition: inline
In-Reply-To: <20210926095847.38261-10-sven@svenpeter.dev>
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
Cc: Arnd Bergmann <arnd@arndb.de>, Hector Martin <marcan@marcan.st>,
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
 Paul Mackerras <paulus@samba.org>, linux-arm-kernel@lists.infradead.org,
 Olof Johansson <olof@lixom.net>,
 Mohamed Mediouni <mohamed.mediouni@caramail.com>,
 Mark Kettenis <mark.kettenis@xs4all.nl>, linuxppc-dev@lists.ozlabs.org,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Stan Skowronek <stan@corellium.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--Abt4sC3J3qWpCcYx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


>  drivers/i2c/busses/i2c-pasemi-apple.c | 122 ++++++++++++++++++++++++++

Can't we name it 'i2c-pasemi-platform.c' instead? Makes more sense to me
because the other instance is named -pci.


--Abt4sC3J3qWpCcYx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmFUzaYACgkQFA3kzBSg
KbbIGxAAh1Nhm33vkf+55YJVzuykGVhjXJqAR9GAq2GGbu78lsZehwAAPp0SUGvO
aLPxI1nxlgvoMggZARhM4uMzQjF92GGsQyv0HR8vZRrPS2qWwVoN76RI8Qq3n3oh
FheNQhW/lWImFFd1WQ7HyKEK7KKJJwyOBcSKqUtGy/B+Z/4NmSpFgM3vMKoszBoR
sff9SQ8ebdLnI5IdAyGunxc7qmF5Wvg+2Njapv36GcX9lDid4eRsoH4MUk+Kr9rV
kdaa6rs+RHvfAHV5r09k+aWeZorR69k5iqynoEiFQpXGXyNwKjlAAdXNyBSAATe0
KzYVcKQkmsS+um1Cw9TXRUdKgO4TRG7rBcsgwhvY560Q96gCsPh7yxnHFXPNnyNK
v68guAIQTPeo6azA8JO2UrIs14JgJGiTD0Yi0lylTueBO8z3dEooT7dzHJl9qnsC
HTl8DwSFjYVsACpMKNAQI4AnQ8vy2mXY6kfvTOGGancUPF4CEA95lvHlBV0AWWhS
YGa9IALzCdeklLkpN1TYHtXatD8kqij940UL+hJH4O9SjCfMXUukoT6z2+ZIJfME
WvqUG2NMMazDNb/Idx4aHAEPVIe6j+iU/SOgdmYpuFTnNOUMyQnHjsMFmo5t77Vd
Hj9BWpHL3eyDQj6Y71Apps/jRZoU5kXXinuFBVkHtZojBpFd5rE=
=l4Nn
-----END PGP SIGNATURE-----

--Abt4sC3J3qWpCcYx--
