Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 867B02F6264
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Jan 2021 14:51:20 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DGm1d0lNVzDscm
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Jan 2021 00:51:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DGlPl5T9PzDscc
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Jan 2021 00:23:39 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=H+NvHe0O; 
 dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by ozlabs.org (Postfix) with ESMTP id 4DGlPh0RvLz9sWL
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Jan 2021 00:23:36 +1100 (AEDT)
Received: by ozlabs.org (Postfix)
 id 4DGlPg5D0pz9sWK; Fri, 15 Jan 2021 00:23:35 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=broonie@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=H+NvHe0O; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 4DGlPf3hC3z9sWF
 for <linuxppc-dev@ozlabs.org>; Fri, 15 Jan 2021 00:23:34 +1100 (AEDT)
Received: by mail.kernel.org (Postfix) with ESMTPSA id A8F5923A05;
 Thu, 14 Jan 2021 13:23:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1610630612;
 bh=N4MLOcaBrg+ObtW8saTWFTIwry4CM2IZkHEMOlfdUBE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=H+NvHe0OMhIhxGZRoLH3VviN3uYMqqteXIlzhRhOHJnEZvYSuZ7Y6encH1ZUWYMAD
 coxOX1wuKEmfzBiY/Z0aNGdPIr0exq130aoFm3FTBd81APc8Yrs1Y2am7rXFKZ7CNr
 LfQtavxrV7gKDpAxYI+oOXmctLAaw6Vv2hPhXIGr1gH+Kv2RcdOOmgeRvXKkzL/u8V
 iNjhcLSF8LObyOL8P62i0/HbGqhBH6Vt58eRxfU7lhh0hh5kFhVLAbWc23qwthKXks
 2R4f3Kr14WAbHRMzV8hcGKrPO/IqcTHX7EbmYG1OjlplbYlsXNVzli5yMRItxsMgGd
 3HlSoc7iXPkkw==
Date: Thu, 14 Jan 2021 13:22:58 +0000
From: Mark Brown <broonie@kernel.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: SPI not working on 5.10 and 5.11, bisected to 766c6b63aa04
 ("spi: fix client driver breakages when using GPIO descriptors")
Message-ID: <20210114132258.GD4854@sirena.org.uk>
References: <dc5d8d35-31aa-b36d-72b0-17c8a7c13061@csgroup.eu>
 <20210113123345.GD4641@sirena.org.uk>
 <9400d900-f315-815f-a358-16ed4963da6c@csgroup.eu>
 <20210114115958.GB4854@sirena.org.uk>
 <006d1594-8eec-3aad-1651-919071e89f3b@csgroup.eu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="WChQLJJJfbwij+9x"
Content-Disposition: inline
In-Reply-To: <006d1594-8eec-3aad-1651-919071e89f3b@csgroup.eu>
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


--WChQLJJJfbwij+9x
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 14, 2021 at 01:33:50PM +0100, Christophe Leroy wrote:
> Le 14/01/2021 =E0 12:59, Mark Brown a =E9crit=A0:
> > On Thu, Jan 14, 2021 at 12:27:42PM +0100, Christophe Leroy wrote:

> > > Today I have in the DTS the CS GPIOs declared as ACTIVE_LOW.

> > > If I declare them as ACTIVE_HIGH instead, then I also have to set
> > > spi-cs-high property, otherwise of_gpio_flags_quirks() is not happy a=
nd
> > > forces the GPIO ACTIVE LOW.

> > > When I set spi-cs-high property, it sets the SPI_CS_HIGH bit in spi->=
mode.

> > OK, so it sounds like you want SPI_CS_HIGH and that is being set
> > correctly?

> > > In fsl_spi_chipselect(), we have
> > >=20
> > > 	bool pol =3D spi->mode & SPI_CS_HIGH
> > >=20
> > > Then
> > > 	pdata->cs_control(spi, pol);

> > > So changing the board config is compensated by the above, and at the =
end it still doesn't work.

> > This is a driver bug, the driver set_cs() operation should not be
> > modifying the value it is told to set.

> A driver bug ? Or maybe a change forgotten in commit  766c6b63aa04 ("spi:
> fix client driver breakages when using GPIO descriptors") ?

The expectation that the driver will be using the chip select exactly as
passed in and not attempting to implement SPI_CS_HIGH itself when it has
set_cs() has been there for a considerable time now, that's not new with
the cleanup.  Drivers should only be paying attention to SPI_CS_HIGH in
cases where the hardware controls the chip select autonomously and so
set_cs() can't be provided.

> I'm almost sure it was not a bug, it is in line which what is said in
> the comment removed by the above mentionned commit.

Please take a look at the list archive discussions around this - there's
been a lot of confusion with GPIO descriptors in particular due to there
being multiple places where you can set the inversion.  Note that the
situation you describe above is that you end up with all the various
places other than your driver agreeing that the chip select is active
high as it (AFAICT from what you're saying) actually is. =20

For GPIO chipselects you should really fix the driver to just hand the
GPIO off to the core rather than trying to implement this itself, that
will avoid driver specific differences like this.

--WChQLJJJfbwij+9x
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmAARbEACgkQJNaLcl1U
h9APTgf/aLwStecUVq1BEe96Q18/NhiIwRQPg/47gbkg+FKp4HlYPvBaXHWBArpP
1fUIEScYwM6Fw4n+mrL3+fxvQUaYacXxD37oQcBV6R+WlTPPSLofypBXy44k45vj
oMB3QWLUcLIC+K7AFAAbo9RA6QnSRT719RYo9NHF4qzcgGfweVckj7AkbIkcAbqN
Vte+RnwqZkY3iLTviZyfCMdIGtDy3+9pNHO9La9/LaLULemKMcMf2sdgHH2j7Ult
SnihJ2d39fxoNHSw+BgurYZ9APuiiHLL7Hq8sYbCkAZvdpFHR2TD8uovZeMbXZrs
42Uykbf8X9XIV9EtnwEkNN5ulcQnKw==
=oOhx
-----END PGP SIGNATURE-----

--WChQLJJJfbwij+9x--
