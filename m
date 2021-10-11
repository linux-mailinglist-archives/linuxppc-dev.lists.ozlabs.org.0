Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AA97428A82
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Oct 2021 12:05:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HSZDh17qPz2yMH
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Oct 2021 21:05:40 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=VzxgnSPV;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=wsa@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=VzxgnSPV; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HSZCy6WsSz2xXt
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 11 Oct 2021 21:05:02 +1100 (AEDT)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 82B4660F21;
 Mon, 11 Oct 2021 10:04:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1633946700;
 bh=MhtMFlXjkISdgITPxUEBlvVPLOfKHnzQ8IBsF632QRU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=VzxgnSPV3d1xsqgadBy3rD2iAbUfUWKokuDtJaKMCudZS3akAute3IcteSot1V/F/
 RtkHzLgzyAPzfbaEvrQkfcxHaa4kBpcVnqyqfHEix/pc/oB1eirIKygY98WZcHCI3r
 fL11Zp4aLcjKrd6M6oHilOniZHUKEoVhFoC2W2wq4wVXGINRUvvm2ANd/r3NzwkzRX
 yCSS4cCsUiVeqsaBYsU9tni2cj3L6Mhelkv8N7YhJ173rJZPVVnpFT01GyoLAlYZ8k
 ++qDsUWAIwdH3MuH1ZKYUvZW8PKbH3Ug2GlBryDrqqR0C0b+moB5suS/PnMKUzjSQU
 RIWC16sSOyoog==
Date: Mon, 11 Oct 2021 12:04:56 +0200
From: Wolfram Sang <wsa@kernel.org>
To: Sven Peter <sven@svenpeter.dev>
Subject: Re: [PATCH v2 00/11] Add Apple M1 support to PASemi i2c driver
Message-ID: <YWQMSG0U1Ae4pTCD@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
 Sven Peter <sven@svenpeter.dev>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Olof Johansson <olof@lixom.net>,
 Christian Zigotzky <chzigotzky@xenosoft.de>,
 Arnd Bergmann <arnd@arndb.de>, Hector Martin <marcan@marcan.st>,
 Mohamed Mediouni <mohamed.mediouni@caramail.com>,
 Stan Skowronek <stan@corellium.com>,
 Mark Kettenis <mark.kettenis@xs4all.nl>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20211008163532.75569-1-sven@svenpeter.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="+fGTgqFSVJmj/Oq2"
Content-Disposition: inline
In-Reply-To: <20211008163532.75569-1-sven@svenpeter.dev>
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
 Christian Zigotzky <chzigotzky@xenosoft.de>, Olof Johansson <olof@lixom.net>,
 Mohamed Mediouni <mohamed.mediouni@caramail.com>,
 Mark Kettenis <mark.kettenis@xs4all.nl>, linuxppc-dev@lists.ozlabs.org,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Stan Skowronek <stan@corellium.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--+fGTgqFSVJmj/Oq2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 08, 2021 at 06:35:21PM +0200, Sven Peter wrote:
> Hi,
>=20
> v1: https://lore.kernel.org/linux-i2c/20210926095847.38261-1-sven@svenpet=
er.dev/
>=20
> Changes for v2:
>  - Added reviewed-by/acks
>  - Switched from ioport_map to pci_iomap as suggested by Arnd Bergmann
>  - Renamed i2c-pasemi-apple.c to i2c-pasemi-platform.c as suggested by
>    Wolfram Sang
>  - Replaced the ioport number in the adapter name with dev_name to be
>    able to identify separate busses in e.g. i2cdetect.
>=20
> I still don't have access to any old PASemi hardware but the changes from
> v1 are pretty small and I expect them to still work. Would still be nice
> if someone with access to such hardware could give this a quick test.
>=20
>=20
> And for those who didn't see v1 the (almost) unchanged original cover let=
ter:
>=20
> This series adds support for the I2C controller found on Apple Silicon Ma=
cs
> which has quite a bit of history:
>=20
> Apple bought P.A. Semi in 2008 and it looks like a part of its legacy con=
tinues
> to live on in the M1. This controller has actually been used since at lea=
st the
> iPhone 4S and hasn't changed much since then.
> Essentially, there are only a few differences that matter:
>=20
> 	- The controller no longer is a PCI device
> 	- Starting at some iPhone an additional bit in one register
>           must be set in order to start transmissions.
> 	- The reference clock and hence the clock dividers are different
>=20
> In order to add support for a platform device I first replaced PCI-specif=
ic
> bits and split out the PCI driver to its own file. Then I added support
> to make the clock divider configurable and converted the driver to use
> managed device resources to make it a bit simpler.
>=20
> The Apple and PASemi driver will never be compiled in the same kernel
> since the Apple one will run on arm64 while the original PASemi driver
> will only be useful on powerpc.
> I've thus followed the octeon (mips)/thunderx(arm64) approach to do the
> split: I created a -core.c file which contains the shared logic and just
> compile that one for both the PASemi and the new Apple driver.
>=20
>=20
> Best,
>=20
> Sven
>=20
> Sven Peter (11):
>   dt-bindings: i2c: Add Apple I2C controller bindings
>   i2c: pasemi: Use io{read,write}32
>   i2c: pasemi: Use dev_name instead of port number
>   i2c: pasemi: Remove usage of pci_dev
>   i2c: pasemi: Split off common probing code
>   i2c: pasemi: Split pci driver to its own file
>   i2c: pasemi: Move common reset code to own function
>   i2c: pasemi: Allow to configure bus frequency
>   i2c: pasemi: Refactor _probe to use devm_*
>   i2c: pasemi: Add Apple platform driver
>   i2c: pasemi: Set enable bit for Apple variant
>=20
>  .../devicetree/bindings/i2c/apple,i2c.yaml    |  61 +++++++++
>  MAINTAINERS                                   |   2 +
>  drivers/i2c/busses/Kconfig                    |  11 ++
>  drivers/i2c/busses/Makefile                   |   3 +

Applied to for-next with MAINTAINER bits dropped and added tags from
Olof and Christian, thanks!


--+fGTgqFSVJmj/Oq2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmFkDEgACgkQFA3kzBSg
KbYBZQ//R2NlpZBhdguawShOq4BTwGe34GDgvlznaOlspRRxCXY3iMfSb4jxgUOO
KiPnV7UTVnN4dxTljhNU0W+yFs77FMip/EBJKXGiwytIP1N5OP8K3sjSY3uNsnfh
LvWmV12hypUbyzxqc2bW9KmTCtm8W4+GsOZ0WNWiSmhzmx9qxq+n5E3Am28s/30y
dsH0FEQINGgjTuirrmocN2RmUpaN7B3tsiQ16xlzqf+5eNMnML0UD6g+9v2idxzx
XTcfiBy9v5aSPaJoSuqyCvUMi7svhKpM/uZtzp9R9qKHwFj3wejOQdhizzMj+QxL
VpMFmkOKIEDQLd0USIqLt29tNjSlTymxROvZKbhAHf42yiiMaIl1TC+0jOn+I2u4
52x40XiqNGjiAuHDnh9f/wMQ9d48gHDOWV1rLzz8F+FQxfGWjAW6CfOSLwDBy0cZ
MtD3iedjZQPEnF4cGtfRqeqqOMCc0jvqq80+0fu0pbp7ZoByZSgIkI93U7vwjTJP
OB1uuZTgttfELfSmUlyGX5vk86yfKFQo51kDTU1QU9Hl4kIXjGYFsH6QhN+PNbPO
GkxGdkbjhGubqdIIRqOO/YMWt3S5Kwl4Eo1XY0vaERY9F2quGcuy++9RSOU7iRxw
8An28pOesmGiDqTHnjmInNjoXpXW4Ix6ePzN2+n9eceZ0HAeIPM=
=FU0D
-----END PGP SIGNATURE-----

--+fGTgqFSVJmj/Oq2--
