Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C5B05477D74
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Dec 2021 21:23:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JFNpx49psz3cWL
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Dec 2021 07:23:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=temperror (SPF Temporary Error: DNS Timeout)
 smtp.mailfrom=linkmauve.fr (client-ip=2a01:e0a:828:c7c0:49:5ff:fe41:d261;
 helo=luna.linkmauve.fr; envelope-from=linkmauve@linkmauve.fr;
 receiver=<UNKNOWN>)
Received: from luna.linkmauve.fr (unknown
 [IPv6:2a01:e0a:828:c7c0:49:5ff:fe41:d261])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JFNpR5v8bz306d
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Dec 2021 07:22:29 +1100 (AEDT)
Received: by luna.linkmauve.fr (Postfix, from userid 1000)
 id B941FF40EA4; Thu, 16 Dec 2021 21:22:20 +0100 (CET)
Date: Thu, 16 Dec 2021 21:22:20 +0100
From: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: Re: [PATCH v3 0/5] rtc: nintendo: Add a RTC driver for the GameCube, 
 Wii and Wii U
Message-ID: <20211216202220.y6rctd2k72yuya5w@luna>
Jabber-ID: linkmauve@linkmauve.fr
References: <20211027223516.2031-1-linkmauve@linkmauve.fr>
 <20211215175501.6761-1-linkmauve@linkmauve.fr>
 <163964813197.6786.14005810276404182021.b4-ty@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="xjgfe6sy2p6qs4uc"
Content-Disposition: inline
In-Reply-To: <163964813197.6786.14005810276404182021.b4-ty@bootlin.com>
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
Cc: linux-rtc@vger.kernel.org, Alessandro Zummo <a.zummo@towertech.it>,
 devicetree@vger.kernel.org, Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>,
 linux-kernel@vger.kernel.org, rw-r-r-0644 <r.r.qwertyuiop.r.r@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Paul Mackerras <paulus@samba.org>,
 Ash Logan <ash@heyquark.com>, linuxppc-dev@lists.ozlabs.org,
 Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.ne@posteo.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--xjgfe6sy2p6qs4uc
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 16, 2021 at 10:49:44AM +0100, Alexandre Belloni wrote:
> On Wed, 15 Dec 2021 18:54:56 +0100, Emmanuel Gil Peyrot wrote:
> > These three consoles share a device, the MX23L4005, which contains a
> > clock and 64=C2=A0bytes of SRAM storage, and is exposed on the EXI bus
> > (similar to SPI) on channel 0, device 1.  This driver allows it to be
> > used as a Linux RTC device, where time can be read and set.
> >=20
> > The hardware also exposes two timers, one which shuts down the console
> > and one which powers it on, but these aren=E2=80=99t supported currentl=
y.
> >=20
> > [...]
>=20
> Applied, thanks!
>=20
> [1/5] rtc: gamecube: Add a RTC driver for the GameCube, Wii and Wii U
>       commit: 86559400b3ef9de93ba50523cffe767c35cd531a
> [2/5] rtc: gamecube: Report low battery as invalid data
>       commit: 322539a014bcd24cbb9281832c09b24e07912237
> [3/5] powerpc: wii.dts: Expose HW_SRNPROT on this platform
>       commit: 5479618e1e2641dd57352a73b7b7b2f6908fbeee
> [4/5] powerpc: gamecube_defconfig: Enable the RTC driver
>       commit: 57bd7d356506b713d0df8d8e42da7810a18864df
> [5/5] powerpc: wii_defconfig: Enable the RTC driver
>       commit: 69e8ba80ddda4db31e59facbf2db19773ad3785b
>=20
> This one didn't apply ceanly but I believe I did the right thing. Can you=
 check?

I believe you didn=E2=80=99t, at least that commit[1] seems to have one =E2=
=80=9C+=E2=80=9D too
many in the modified line, whereas the previous one[2] doesn=E2=80=99t.

But thanks for applying them!

>=20
>=20
> Best regards,
> --=20
> Alexandre Belloni <alexandre.belloni@bootlin.com>

[1] https://git.kernel.org/pub/scm/linux/kernel/git/abelloni/linux.git/comm=
it/?id=3D69e8ba80dd
[2] https://git.kernel.org/pub/scm/linux/kernel/git/abelloni/linux.git/comm=
it/?id=3D57bd7d3565

--=20
Emmanuel Gil Peyrot

--xjgfe6sy2p6qs4uc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEjrVT1SzTln43kCLJOWgfYkb2LpAFAmG7n/kACgkQOWgfYkb2
LpC5TggAi5VOpJA1g7QxHH22JVQUoOoi2gh+8iLJUAXipFMNAcQ3ehzzpA47P7pF
QvCjk8aywr3VNj2+mzVz4CsgFHI2EyxqvHVzuEETddZe/bbd4PjS3Q39jMFP2bzG
oHtt8C0/z2XTBgPHC0VtT8cI9cliiadPzsDCYQRdZHWYCnckWZmo51BzH4cmZzC1
ECD/VgEunDre1ATXcefh7gRAEsQH+1FjkhukL/jNKUONeTpyr9r8D81R5lFyrLGK
e5NXNykw2kdkpzv29CnQnIpc9y/AqX6U9WpY6P39xzlpaudSI8VEOKGFunJjXxI8
O8Bp+trQO2iCKZX1EyABFUKkuF+QXA==
=lj83
-----END PGP SIGNATURE-----

--xjgfe6sy2p6qs4uc--
