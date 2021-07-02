Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C3D0B3B9DD3
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Jul 2021 10:57:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GGTVG5G2xz3bY1
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Jul 2021 18:57:10 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=posteo.net header.i=@posteo.net header.a=rsa-sha256 header.s=2017 header.b=pANrYe4+;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=posteo.net (client-ip=185.67.36.65; helo=mout01.posteo.de;
 envelope-from=j.ne@posteo.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=posteo.net header.i=@posteo.net header.a=rsa-sha256
 header.s=2017 header.b=pANrYe4+; dkim-atps=neutral
Received: from mout01.posteo.de (mout01.posteo.de [185.67.36.65])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GGTTn5WtGz2xKM
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Jul 2021 18:56:42 +1000 (AEST)
Received: from submission (posteo.de [89.146.220.130]) 
 by mout01.posteo.de (Postfix) with ESMTPS id 6E68B240029
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Jul 2021 10:56:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.net; s=2017;
 t=1625216197; bh=TiLwUHSR7R0Qj3YVWzytod8xNxHzUWymnFs38evq0YU=;
 h=Date:From:To:Cc:Subject:From;
 b=pANrYe4+lMfhAz0DynDrXGQP7eZ/GniUVVLZO47iAPEfBeAizgHL4NroWS2mhQVH9
 8ql7bbrQqFbx+sZLX20db0V1RBNdk49egLVfU/HZhq5w7Cw5Zawx/9jBYAaTqIO6K5
 4d52ehvmnZMSCCpzdn0O6TFVzR5VSwIlzLfX8+jkcA7jVcF+jAg7UTbcbMEp2U94rO
 tqEj7hfDeWL31sPTiIb23164ZJ0A7mdbmGmlMUEKwNhtcsVkhKTpzPRGolll52Vviu
 7IvPxps8Upw8rZESejcodGLUn6GSOkbZcgRoI/phSvj92TkdJencHklDm8o7iavgFW
 u+d4+r29kNwBw==
Received: from customer (localhost [127.0.0.1])
 by submission (posteo.de) with ESMTPSA id 4GGTTW6dstz9rxS;
 Fri,  2 Jul 2021 10:56:31 +0200 (CEST)
Date: Fri,  2 Jul 2021 08:56:31 +0000
From: Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.ne@posteo.net>
To: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>
Subject: Re: [PATCH v2 3/4] powerpc: wii.dts: Expose the OTP on this platform
Message-ID: <YN7Uv/43TwL4+9ic@latitude>
References: <20210519095044.4109-1-linkmauve@linkmauve.fr>
 <20210519095044.4109-4-linkmauve@linkmauve.fr>
 <YNe5aW55SrXFGKFV@latitude> <20210701195655.knbcikdga57a7epx@luna>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="/oh87RkuYSLgv47m"
Content-Disposition: inline
In-Reply-To: <20210701195655.knbcikdga57a7epx@luna>
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Ash Logan <ash@heyquark.com>, Paul Mackerras <paulus@samba.org>,
 linuxppc-dev@lists.ozlabs.org,
 Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.ne@posteo.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--/oh87RkuYSLgv47m
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 01, 2021 at 09:56:55PM +0200, Emmanuel Gil Peyrot wrote:
> On Sat, Jun 26, 2021 at 11:34:01PM +0000, Jonathan Neusch=C3=A4fer wrote:
> > On Wed, May 19, 2021 at 11:50:43AM +0200, Emmanuel Gil Peyrot wrote:
[...]
> > > +		otp@d8001ec {
> > > +			compatible =3D "nintendo,hollywood-otp";
> > > +			reg =3D <0x0d8001ec 0x8>;
> >=20
> > The OTP registers overlap with the previous node, control@d800100.
> > Not sure what's the best way to structure the devicetree in this case,
> > maybe something roughly like the following (untested, unverified):
> [snip]
>=20
> I couldn=E2=80=99t get this to work, but additionally it looks like it sh=
ould
> start 0x100 earlier and contain pic1@d800030 and gpio@d8000c0, given
> https://wiibrew.org/wiki/Hardware/Hollywood_Registers
>=20
> Would it make sense, for the time being, to reduce the size of this
> control@d800100 device to the single register currently being used by
> arch/powerpc/platforms/embedded6xx/wii.c (0xd800194, used to reboot the
> system) and leave the refactor of restart + OTP + PIC + GPIO for a
> future series?

Makes sense to me!

Jonathan

--/oh87RkuYSLgv47m
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEvHAHGBBjQPVy+qvDCDBEmo7zX9sFAmDe1JUACgkQCDBEmo7z
X9vJqxAAyOC7GHGtEdGs0vs4QOo2/Kqcbn9qgnpKABaeF4UqeCCvRa8+mAAN3ai+
87P+gZgBZoJb/p4bYR/kP7B4AtGBBhzAFTIyO1dLzt8bZtPpCcaOBWjKRlKGHVrH
cQdBdPDTuhRbYR2iQLoweYXMiojsQqfCJVd5eEGXWEwItywRRtfZ3ZEVcPAzhNHK
vhspIhK47tFZpgEK+bJza8GDjK2mgvDZp4+hNGzwKpzcjwEPgk+G4s+yT2xN0xDn
4BP7UoER6NfpyQ5NYj81sGzcgzsWwCx9Tu/HeCA8wA30xxJQ/FUptyDw3hGuMiaM
DQcRjAHCI+Yil/U3tB8XoNFx+xbkgvKj/DY9bm+IkbsFKki0eK63PhdNI9R//QuG
zyTpzNNEvevNwtVH6stoBBLGqMDoXw2VuzgKmFkkTt0h7L7YCI5tYQ3aoZQi+tfl
wpwi+dskP0BiICvv2n0CQketiITe3b3Q+yBwwXT5chcSh+TtliwJrzHWSK+DgE2r
ixqJjg4Q6nDMsO7d8gwJTV/J3NAi3nIhIiuuFvtomqecOxq5jsnpyNRQTkFd0a19
vrG//er+o0sOSrKcgD4he3K8rBzBMOt1+ZwcCgKwmlryHqB9iMqUyBXoBLHoy8s9
CH+YMx0LNscsooI19FA595BOioLN+hlf8yprR54T5eARem3j1MQ=
=jObg
-----END PGP SIGNATURE-----

--/oh87RkuYSLgv47m--
