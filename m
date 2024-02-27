Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B515D869558
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Feb 2024 15:01:15 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TkfKP3mDtz3vdQ
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Feb 2024 01:01:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=pengutronix.de (client-ip=2a0a:edc0:2:b01:1d::104; helo=metis.whiteo.stw.pengutronix.de; envelope-from=ukl@pengutronix.de; receiver=lists.ozlabs.org)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TkfJw5PGLz3d3Q
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Feb 2024 01:00:46 +1100 (AEDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1rey0V-0008Gl-Vq; Tue, 27 Feb 2024 15:00:31 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1rey0U-003DCm-J2; Tue, 27 Feb 2024 15:00:30 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ukl@pengutronix.de>)
	id 1rey0U-00CUXz-1d;
	Tue, 27 Feb 2024 15:00:30 +0100
Date: Tue, 27 Feb 2024 15:00:30 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: Increasing build coverage for drivers/spi/spi-ppc4xx.c
Message-ID: <645ngchmigftlvbvquprqqjcn2frogkihdplbmngnz6hvywefo@rvthwy2epwg3>
References: <qvuhez7vrcoui7i6s4yohd4ednneuoejcp6tw6iwzeefgpyvd6@fkwwtwozhakf>
 <6fab09e0-1f21-4ada-b5ae-472bf71a1225@csgroup.eu>
 <7ah7rzijbwkvr3hmtqfjh7syxave756usevumrypqspn27wgyv@ln42tyqxo5ai>
 <2fe58bc5-2f1b-4f51-8f01-fa397a1c9291@csgroup.eu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="yofmhws4bjeessoi"
Content-Disposition: inline
In-Reply-To: <2fe58bc5-2f1b-4f51-8f01-fa397a1c9291@csgroup.eu>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linuxppc-dev@lists.ozlabs.org
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
Cc: Nicholas Piggin <npiggin@gmail.com>, "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Mark Brown <broonie@kernel.org>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--yofmhws4bjeessoi
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 27, 2024 at 01:52:07PM +0000, Christophe Leroy wrote:
>=20
>=20
> Le 27/02/2024 =E0 11:58, Uwe Kleine-K=F6nig a =E9crit=A0:
> > Hello Christophe,
> >=20
> > On Tue, Feb 27, 2024 at 10:25:15AM +0000, Christophe Leroy wrote:
> >> Le 27/02/2024 =E0 09:46, Uwe Kleine-K=F6nig a =E9crit=A0:
> >>> recently the spi-ppc4xx.c driver suffered from build errors and warni=
ngs
> >>> that were undetected for longer than I expected. I think it would be
> >>> very beneficial if this driver was enabled in (at least) a powerpc
> >>> allmodconfig build.
> >>>
> >>> The challenge to do so is that spi-ppc4xx.c uses dcri_clrset() which =
is
> >>> only defined for 4xx (as these select PPC_DCR_NATIVE).
> >>>
> >>> I wonder if dcri_clrset() could be defined for the PPC_DCR_MMIO case,
> >>> too. I tried and failed. The best I came up without extensive doc
> >>> reading is:
> >>>
> >>> diff --git a/arch/powerpc/include/asm/dcr-native.h b/arch/powerpc/inc=
lude/asm/dcr-native.h
> >>> index a92059964579..159ab7abfe46 100644
> >>> --- a/arch/powerpc/include/asm/dcr-native.h
> >>> +++ b/arch/powerpc/include/asm/dcr-native.h
> >>> @@ -115,15 +115,11 @@ static inline void __dcri_clrset(int base_addr,=
 int base_data, int reg,
> >>>    	unsigned int val;
> >>>   =20
> >>>    	spin_lock_irqsave(&dcr_ind_lock, flags);
> >>> -	if (cpu_has_feature(CPU_FTR_INDEXED_DCR)) {
> >>> -		mtdcrx(base_addr, reg);
> >>> -		val =3D (mfdcrx(base_data) & ~clr) | set;
> >>> -		mtdcrx(base_data, val);
> >>> -	} else {
> >>> -		__mtdcr(base_addr, reg);
> >>> -		val =3D (__mfdcr(base_data) & ~clr) | set;
> >>> -		__mtdcr(base_data, val);
> >>> -	}
> >>> +
> >>> +	mtdcr(base_addr, reg);
> >>> +	val =3D (mfdcr(base_data) & ~clr) | set;
> >>> +	mtdcr(base_data, val);
> >>> +
> >>>    	spin_unlock_irqrestore(&dcr_ind_lock, flags);
> >>>    }
> >>>   =20
> >>> diff --git a/drivers/spi/Kconfig b/drivers/spi/Kconfig
> >>> index bc7021da2fe9..9a0a5e8c70c8 100644
> >>> --- a/drivers/spi/Kconfig
> >>> +++ b/drivers/spi/Kconfig
> >>> @@ -810,7 +810,8 @@ config SPI_PL022
> >>>   =20
> >>>    config SPI_PPC4xx
> >>>    	tristate "PPC4xx SPI Controller"
> >>> -	depends on PPC32 && 4xx
> >>> +	depends on 4xx || COMPILE_TEST
> >>> +	depends on PPC32 || PPC64
> >>>    	select SPI_BITBANG
> >>>    	help
> >>>    	  This selects a driver for the PPC4xx SPI Controller.
> >>>
> >>> While this is a step in the right direction (I think) it's not enough=
 to
> >>> make the driver build (but maybe make it easier to define
> >>> dcri_clrset()?)
> >>>
> >>> Could someone with more powerpc knowledge jump in and help (for the
> >>> benefit of better compile coverage of the spi driver and so less
> >>> breakage)? (If you do so based on my changes above, you don't need to
> >>> credit me for my effort, claim it as your's. I'm happy enough if the
> >>> situation improves.)
> >>
> >> What about this ?
> >>
> >> diff --git a/arch/powerpc/include/asm/dcr-mmio.h
> >> b/arch/powerpc/include/asm/dcr-mmio.h
> >> index fc6d93ef4a13..38b515afbffc 100644
> >> --- a/arch/powerpc/include/asm/dcr-mmio.h
> >> +++ b/arch/powerpc/include/asm/dcr-mmio.h
> >> @@ -38,6 +38,11 @@ static inline void dcr_write_mmio(dcr_host_mmio_t h=
ost,
> >>    	out_be32(host.token + ((host.base + dcr_n) * host.stride), value);
> >>    }
> >>
> >> +static inline void __dcri_clrset(int base_addr, int base_data, int re=
g,
> >> +				 unsigned clr, unsigned set)
> >> +{
> >> +}
> >> +
> >=20
> > The downside of that one is that if we find a matching device where
> > dcr-mmio is used, the driver claims to work but silently fails. Is this
> > good enough?
>=20
> I don't know the details of DCR, but it looks like this spi-ppc4xx=20
> driver is really specific to 4xx, which is PPC32.
>=20
> Do you really need/want it to be built with allmodconfig ?
>=20
> Maybe it would be easier to have it work with ppc32_allmodconfig ?
>=20
> Or even easier with ppc44x_defconfig ?

The reason I'd like to see it in allmodconfig is that testing
allmodconfig on several archs is the check I do for my patch series.
Also I assume I'm not the only one relying on allmodconfig for this
purpose. So in my eyes every driver that is built there is a net win.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--yofmhws4bjeessoi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmXd6v0ACgkQj4D7WH0S
/k7yEgf/Tz157az3FVESUBdN2ilY0Teefm0nbWyCzS5sUxh2ppmaB6c9HQmu1nK/
zy4BS9L2c5chIbzOcwTE8anMvfVAVuqF3MuNSCa+Yau6OKL6pE8qyPMYTV6tWlKJ
WRP59kwZsQw+BVms96Oo336/knSmapitLLixbYXvNn13eC2FZVM8PR7WvJPSm86G
PFimEGz+sJoEfSs8yRTSP5a7CBgEGES90yxs3sxoj/WELpGER5xkTMU6axeZdpY5
tG4LfR3HbSuNiA5+/yY4INKOcPoFbe4nzmi4tjb41S3+clUYvEvKhrMahxPXrJ2P
2ajDfO+3zjz1dRKEs32WZaqb0GzhWw==
=bkOz
-----END PGP SIGNATURE-----

--yofmhws4bjeessoi--
