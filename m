Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E853C13D13C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jan 2020 01:45:29 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47ylpt4HK7zDqTQ
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jan 2020 11:45:26 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=the-dreams.de (client-ip=88.99.104.3; helo=pokefinder.org;
 envelope-from=wsa@the-dreams.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=the-dreams.de
Received: from pokefinder.org (sauhun.de [88.99.104.3])
 by lists.ozlabs.org (Postfix) with ESMTP id 47ylmq2XnnzDqN3
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Jan 2020 11:43:37 +1100 (AEDT)
Received: from localhost (p54B33239.dip0.t-ipconnect.de [84.179.50.57])
 by pokefinder.org (Postfix) with ESMTPSA id 467852C0742;
 Wed, 15 Jan 2020 20:57:05 +0100 (CET)
Date: Wed, 15 Jan 2020 20:57:05 +0100
From: Wolfram Sang <wsa@the-dreams.de>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: Re: [PATCH 00/12] i2c: convert subsystem to use
 i2c_new_client_device()
Message-ID: <20200115195704.GC23789@ninjato>
References: <20200107174748.9616-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="oTHb8nViIGeoXxdp"
Content-Disposition: inline
In-Reply-To: <20200107174748.9616-1-wsa+renesas@sang-engineering.com>
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
Cc: linux-acpi@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--oTHb8nViIGeoXxdp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 07, 2020 at 06:47:34PM +0100, Wolfram Sang wrote:
> This patch series converts the I2C subsystem to use the new API. Drivers
> have been build tested. There is one user left in the SMBus part of the
> core which will need a seperate series because all users of this
> function need to be checked/converted, too.
>=20
> Except for documentation patches, the conversion has been done with a
> coccinelle script and further simplification have been applied when
> proofreading the patches.
>=20
> A branch is here:
>=20
> git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git renesas/i2c/n=
ew_client_device
>=20
> Looking forward to comments...

Thanks for all the quick reviews and tests \o/

Series applied to for-next, thanks!


--oTHb8nViIGeoXxdp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl4fbpAACgkQFA3kzBSg
KbZsuxAAlGN3Qw/NoGCVgmD5F27FU32w32SIt3btqM+Smwb8h/YywvrdIxuaElC4
U0FVB9Nt21/V6whDPbpRqNwtf3Wld5jgpFt3GinATmO0LBrYZM0qsrAWaf9Mnnaw
KgDuO5MOsyLhxxgsT7ak2ASe6o+QzDUOxtGJJLgjEUxAcdF7MEVinFLPA1qOgGlu
qTPNb+z3htcdaoLIVBvUBzS6xIt8HyD2XB71db4C1TqBfdoWI/kRIWn5Fd0Bjiv4
EmUag6Gy7G0CTw0lzmYne+gSB/U8ugzpNDTWEyns4bxTVUGgyuAdWcPomJ9Duieq
zA2yUvTbIX/L/smIXiJcXUOwgWiozVsY+oFpDp0lpg7ZaULiuCZbmcdbil6GRfqB
qVfn8F94w1GRCQ5lNzMTuUbTIo/4w5HFMKQY23lJ8BMI26nVQ4+6YyUoZstLLyMA
Np0s2EAUUGGO9IdMigfaJrVW7m0ukj1Je4S9a8OAE4eVuV89o1UjNdx0O7kV4BPI
K0YpHnEvGaEiQB3MonKIE0jUL6WA1eXUUxsgQCBoXyPx9nmz5QzANoenIPmN8PBw
sf8NAgK8ppLrkWjmbydI2GWMFFhp4gXdGFzvrjLahMNXZsHGLyK/ad9XS6+E54RD
GynwEX6zU+0Znoa+3I2Po2bbPBRvuHSZqES3obLnS7x/VQ8Xz1w=
=uUCI
-----END PGP SIGNATURE-----

--oTHb8nViIGeoXxdp--
