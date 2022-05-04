Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 83DB851AEBA
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 May 2022 22:10:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ktnxn2pXnz3c7W
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 May 2022 06:10:21 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=a6do+IeW;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org;
 envelope-from=wsa@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=a6do+IeW; 
 dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KtnxB0VV0z2ywH
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 May 2022 06:09:49 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D86876140D;
 Wed,  4 May 2022 20:09:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83578C385A5;
 Wed,  4 May 2022 20:09:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651694987;
 bh=iStJpBX3VysI3BJkMa+4eOTaEzUvXsP2MKiLXZmdm98=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=a6do+IeWTo7YZXY9hCFP+MnNkgjGWY50ZpS0AWhM6oAsu9I+c4wxET54Hq+Q0TeXP
 uHVy8+rL81TQDqXIjaD1in0PJQ2582iQsXCsfwxQMb33/OjiaBRBZToxiBJOClLi6Z
 JzPiN0tndFSVfFlybc3GFh0KM9Sm+Pauy87H2f3NRlls0LWJOsEkwSwCal183C5noh
 8CzCWVRhrb6d8NXC8BNZMUmxW+Nav2cknc8FCTIJM3nE6lgksnMPaW6u7H77gIZxEu
 BGsuDwlLiw0byBpE9B+54XIHrP+2rhihmHfZwFIFlee4uocSs1kGTP3a2JTgjVxNK2
 JRJELIn3oVNlw==
Date: Wed, 4 May 2022 22:09:43 +0200
From: Wolfram Sang <wsa@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v1 1/4] powerpc/52xx: Remove dead code, i.e.
 mpc52xx_get_xtal_freq()
Message-ID: <YnLdh96Z6S6IcaL2@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Sergey Shtylyov <s.shtylyov@omp.ru>,
 Damien Le Moal <damien.lemoal@opensource.wdc.com>,
 Chris Packham <chris.packham@alliedtelesis.co.nz>,
 Marc Kleine-Budde <mkl@pengutronix.de>,
 "David S. Miller" <davem@davemloft.net>,
 Jakub Kicinski <kuba@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, linux-ide@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-can@vger.kernel.org,
 netdev@vger.kernel.org, linux-spi@vger.kernel.org,
 linux-serial@vger.kernel.org, Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>,
 Anatolij Gustschin <agust@denx.de>,
 Wolfgang Grandegger <wg@grandegger.com>,
 Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
 Pantelis Antoniou <pantelis.antoniou@gmail.com>,
 Mark Brown <broonie@kernel.org>
References: <20220504134449.64473-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="++MSw5fknTzpn73A"
Content-Disposition: inline
In-Reply-To: <20220504134449.64473-1-andriy.shevchenko@linux.intel.com>
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
Cc: linux-ide@vger.kernel.org, Eric Dumazet <edumazet@google.com>,
 Paul Mackerras <paulus@samba.org>, linux-i2c@vger.kernel.org,
 Paolo Abeni <pabeni@redhat.com>, Jiri Slaby <jirislaby@kernel.org>,
 Damien Le Moal <damien.lemoal@opensource.wdc.com>,
 linux-serial@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>,
 Anatolij Gustschin <agust@denx.de>, Wolfgang Grandegger <wg@grandegger.com>,
 linux-can@vger.kernel.org, Chris Packham <chris.packham@alliedtelesis.co.nz>,
 Marc Kleine-Budde <mkl@pengutronix.de>, Sergey Shtylyov <s.shtylyov@omp.ru>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 netdev@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--++MSw5fknTzpn73A
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


Wow, MPC5200, that was a long time ago for me...

> It seems mpc52xx_get_xtal_freq() is not used anywhere. Remove dead code.

Looks like it.

Reviewed-by: Wolfram Sang <wsa@kernel.org>


--++MSw5fknTzpn73A
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmJy3XEACgkQFA3kzBSg
KbbTjRAApraHeAflyhzKaB4HdS0SS02AfYrsPj4tQGg+OdY7fGIgt0ZNCwI8CTsE
A+PYJ4XvUcIsL5q2RFeWnsiXSeGRLiui2WLVBILJoiVfILFsR01R6QTy6OOlwIzO
Nx5QSUgwHQB7ODDVbjOvp8pQ8FSFvqa+TM3lOJ6zWnG4d1sSSUoQnb8iXWnQFBM1
L6wpf1VRjbKYkLyO8/omDQDGJQd2BAn9rG1jF3pEmVEmMGY57wzaRmpyU49KnPRP
VuKtBXNrUbZXyvk4h7IEOhvI6tSD15uOrqJ/eeSfYcDLk3amS2TTvqwHaiuZCe1E
9PJB8ch296Sr+/LCdw3nMsLZY0v5NmrthY6K7AMZCN3eFkebsSnxkbcK1BXnuKKQ
YHKw8BafHhoQUrYxcWanNuOp2qjVodSurENsIE4s5wjpVP9EKp562+nWsrWtHns0
poXhMlPDYldvRG/IciRnG5p/XiMeKdX2ud4OdXgTVHulLxa8AMQEap0nVwwXFjTL
IcP3m7MEo8L5OhGsHAaw9G/VLVutLoBnyWk3oLXdSqpRPBov9r+oyZnVV5q7z8Gz
gjejj4ciQRm08iHn9eqJ1hvHHk2erpc1aP6takxN+owEbVSAqJpypk4B3EcAhdGp
P3VVm1YqMbiPpzP2LhWYS8ajAwFUEuyRrJSsPTzjA34uSVu4jHI=
=2zt3
-----END PGP SIGNATURE-----

--++MSw5fknTzpn73A--
