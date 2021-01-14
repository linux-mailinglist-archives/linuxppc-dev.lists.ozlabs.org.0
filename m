Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 24D622F60B6
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Jan 2021 13:04:53 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DGjfp0rQJzDrhp
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Jan 2021 23:04:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DGjYw1QG4zDrg1
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Jan 2021 23:00:36 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=bCh3t3cG; 
 dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by ozlabs.org (Postfix) with ESMTP id 4DGjYv5MM9z9sSs
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Jan 2021 23:00:35 +1100 (AEDT)
Received: by ozlabs.org (Postfix)
 id 4DGjYv4CLRz9sVF; Thu, 14 Jan 2021 23:00:35 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=broonie@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=bCh3t3cG; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 4DGjYt6v5lz9sSs
 for <linuxppc-dev@ozlabs.org>; Thu, 14 Jan 2021 23:00:34 +1100 (AEDT)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9B40E23A50;
 Thu, 14 Jan 2021 12:00:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1610625632;
 bh=INY4CE7CQQYCVvJ4IYFg/6ov+XHogEimL9aQ46Ij89A=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bCh3t3cG7vJakYHnKh2vXr9Pa1B4Z0VarzqUlXT7j2G0IHFN+F5Y9sVKUrrnAS6f8
 DhlAGKQTJGBF2uHENRH4CvKxCLr/CQCRAgBBYAKag823xi6TXXcFaFkhJGOfGqRBgY
 RQRCl65zhaNc0aKdANkzlyhiwkePoxbmotXyhc4bGaHezy9NRkJSuTyWJsvGvpueq7
 rGNQbDGpkirQOxXkFj+kGJPjDq8s+sxvflsn+vaeYJYu2As95vzO1fmEqAkQoDFUbX
 U40RKLMQVpaEa7FVI+gzwdYD5vVOD8/VjRrNDF34BITy5kjlADB3xNgWDq4to9ZBT7
 2O2dqPiLbHFXQ==
Date: Thu, 14 Jan 2021 11:59:58 +0000
From: Mark Brown <broonie@kernel.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: SPI not working on 5.10 and 5.11, bisected to 766c6b63aa04
 ("spi: fix client driver breakages when using GPIO descriptors")
Message-ID: <20210114115958.GB4854@sirena.org.uk>
References: <dc5d8d35-31aa-b36d-72b0-17c8a7c13061@csgroup.eu>
 <20210113123345.GD4641@sirena.org.uk>
 <9400d900-f315-815f-a358-16ed4963da6c@csgroup.eu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="+g7M9IMkV8truYOl"
Content-Disposition: inline
In-Reply-To: <9400d900-f315-815f-a358-16ed4963da6c@csgroup.eu>
X-Cookie: You have taken yourself too seriously.
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: "linuxppc-dev@ozlabs.org" <linuxppc-dev@ozlabs.org>,
 Sven Van Asbroeck <thesven73@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 linux-spi <linux-spi@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--+g7M9IMkV8truYOl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 14, 2021 at 12:27:42PM +0100, Christophe Leroy wrote:

> Today I have in the DTS the CS GPIOs declared as ACTIVE_LOW.

> If I declare them as ACTIVE_HIGH instead, then I also have to set
> spi-cs-high property, otherwise of_gpio_flags_quirks() is not happy and
> forces the GPIO ACTIVE LOW.

> When I set spi-cs-high property, it sets the SPI_CS_HIGH bit in spi->mode.

OK, so it sounds like you want SPI_CS_HIGH and that is being set
correctly?

> In fsl_spi_chipselect(), we have
>=20
> 	bool pol =3D spi->mode & SPI_CS_HIGH
>=20
> Then
> 	pdata->cs_control(spi, pol);

> So changing the board config is compensated by the above, and at the end =
it still doesn't work.

This is a driver bug, the driver set_cs() operation should not be
modifying the value it is told to set.

--+g7M9IMkV8truYOl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmAAMj0ACgkQJNaLcl1U
h9D6Bwf+JW4953RUClZPcFMDyoQMw5ksSpnT2TroqZ+JObAHxKT85Ale61GgiGrG
P8kiuahjvzc1lwsafI5fa63OKy+tRJ+5eqxKpQRAvsOzaT642r8WE1rUJSNtGDLI
56v4ikNB3DquUiJLujiQsry1ab5+du7BVFiLMlD5DgGuL+By5lEXjnFbyifJSTbH
UTti5kDJaI4VTOXIqbtCvfL8CWPmaP+EdKL1Hi/llLFVrZEefuf7qJMn+defX+cw
2tXhtzLECfYIOf8qR34VanbwoGQhhXCefIBa0OQN2gRpiP5oYaZjhVigXWhDSPUZ
PS5J2+pqej3DON95T4rCm9lKGqunWA==
=aods
-----END PGP SIGNATURE-----

--+g7M9IMkV8truYOl--
