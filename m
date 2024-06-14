Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 26DB49090C8
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Jun 2024 18:52:28 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=CpFq6UCC;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W151502zVz3cc7
	for <lists+linuxppc-dev@lfdr.de>; Sat, 15 Jun 2024 02:52:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=CpFq6UCC;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:40e1:4800::1; helo=sin.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W150N50l4z3cY3
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 15 Jun 2024 02:51:48 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id D46D1CE2C46;
	Fri, 14 Jun 2024 16:51:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29068C2BD10;
	Fri, 14 Jun 2024 16:51:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718383907;
	bh=fPlz7/O4CHKldDLCxbpg3ui9wtblMgB3TXnLBn0vSI8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CpFq6UCC7cqq4TL2Q4voaO/eWCDtFrzYqrhpIB1METf7ygd32ZxG5reEb08aI2/2l
	 EOxJV0ZJspzfFvIBXYmPTqrYT27w3rTiKkm+0qK4iCpyuG7O8YAUweHKhCa8wqWvjd
	 cjod0053tLA2spwX/oQuoY0BJCQ8ikbCbbKxI3lw3enf1LhXAA6RU9YT5281LMbTRV
	 BM47sjqNEhDV2l7quJAsEP4p/QiQyrdWTMeDPgyTL6Vqsm+ScmxescTGkW2jxGxXvb
	 /Uf4o81uIhzqasU0dnRZVZ0nFTzxCL9yCWfUrzi+KZa3C2Rw0AIU1tMb3tNPV6KEG3
	 lW5zitAlFmhCw==
Date: Fri, 14 Jun 2024 17:51:43 +0100
From: Mark Brown <broonie@kernel.org>
To: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
Subject: Re: [Patch v2 1/2] ASoC: fsl: Add i2s and pcm drivers for LPC32xx
 CPUs
Message-ID: <Zmx1H5MyjWvoRdwz@finisterre.sirena.org.uk>
References: <20240611094810.27475-1-piotr.wojtaszczyk@timesys.com>
 <Zmgor8accyAiUkUO@finisterre.sirena.org.uk>
 <CAG+cZ06B+AexqvwZtNP5FX50AmghAFLa=1ebxmKLvMoyVJ529w@mail.gmail.com>
 <Zmxy-xA3YDU06Eht@finisterre.sirena.org.uk>
 <CAG+cZ05KomezPn0bAuZWrfO=rbyLdCU8_Xx11oEihUaD97gF8w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="7aeyEfJwNjSnCeXl"
Content-Disposition: inline
In-Reply-To: <CAG+cZ05KomezPn0bAuZWrfO=rbyLdCU8_Xx11oEihUaD97gF8w@mail.gmail.com>
X-Cookie: Your love life will be... interesting.
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
Cc: alsa-devel@alsa-project.org, Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, devicetree@vger.kernel.org, Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, linux-sound@vger.kernel.org, Russell King <linux@armlinux.org.uk>, Chancel Liu <chancel.liu@nxp.com>, linux-arm-kernel@lists.infradead.org, Jaroslav Kysela <perex@perex.cz>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Vladimir Zapolskiy <vz@mleia.com>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--7aeyEfJwNjSnCeXl
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 14, 2024 at 06:46:46PM +0200, Piotr Wojtaszczyk wrote:
> On Fri, Jun 14, 2024 at 6:42=E2=80=AFPM Mark Brown <broonie@kernel.org> w=
rote:
> > On Fri, Jun 14, 2024 at 06:24:50PM +0200, Piotr Wojtaszczyk wrote:

> > > Ok. Later I will add a sound card driver to phytec3250 board which us=
es
> > > arch/arm/configs/lpc32xx_defconfig config file so that the COMPILE_TE=
ST
> > > won't be needed.

> > Why would a defconfig affect the Kconfig?

> I guess when lpc32xx_defconfig enables the SND_SOC_FSL_LPC3XXX then the
> COMPILE_TEST won't be needed or does it?

The whole point of COMPILE_TEST is to allow the driver to be covered
when people aren't building for whatever specific platform would
actually use it.

--7aeyEfJwNjSnCeXl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmZsdR4ACgkQJNaLcl1U
h9CNrQf/QOGnPQlIqhyNGJmHt+OTyAKxvU02FdwW1IOOW6yQBj4UO9d4k7nblhEn
F7Vtbh6YUxU664IKdVLn2n6JwvOzBu2sPuLmm0JQgsZnlOB23KNWgw7yoZdgPL9m
tKbUe6KCBHoMU/LJe+m2nm9qhAlTXlL4Uf1xgJQ3TK9c2neuko0efOtWy97OE8Oc
PxHGfc5fFxAjEtnOQq47Nj0/fKCzXF3HLOseOx+KibzpUMgVZJTdVilroWPHOGXa
u9aMHOWsdypZIO6rRaAjhslOpENc0zW4+v4gaWtRD8mmsiKzvQuZTB6zo/vMTTfA
GUx5oQKpFeCMxaFkBGj6dCVLbitmgQ==
=r/9i
-----END PGP SIGNATURE-----

--7aeyEfJwNjSnCeXl--
