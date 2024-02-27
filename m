Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B2B87868B2C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Feb 2024 09:47:30 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TkWMN3xxHz3vcH
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Feb 2024 19:47:28 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=pengutronix.de (client-ip=2a0a:edc0:2:b01:1d::104; helo=metis.whiteo.stw.pengutronix.de; envelope-from=ukl@pengutronix.de; receiver=lists.ozlabs.org)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TkWLy37vZz30dx
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Feb 2024 19:47:04 +1100 (AEDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1ret6v-0003DI-OB; Tue, 27 Feb 2024 09:46:49 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1ret6u-0039kQ-3P; Tue, 27 Feb 2024 09:46:48 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ukl@pengutronix.de>)
	id 1ret6u-00CL29-02;
	Tue, 27 Feb 2024 09:46:48 +0100
Date: Tue, 27 Feb 2024 09:46:47 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Increasing build coverage for drivers/spi/spi-ppc4xx.c
Message-ID: <qvuhez7vrcoui7i6s4yohd4ednneuoejcp6tw6iwzeefgpyvd6@fkwwtwozhakf>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="pdqtf3l5nbfguqt3"
Content-Disposition: inline
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
Cc: linux-spi@vger.kernel.org, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Mark Brown <broonie@kernel.org>, Nicholas Piggin <npiggin@gmail.com>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--pdqtf3l5nbfguqt3
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

recently the spi-ppc4xx.c driver suffered from build errors and warnings
that were undetected for longer than I expected. I think it would be
very beneficial if this driver was enabled in (at least) a powerpc
allmodconfig build.

The challenge to do so is that spi-ppc4xx.c uses dcri_clrset() which is
only defined for 4xx (as these select PPC_DCR_NATIVE).

I wonder if dcri_clrset() could be defined for the PPC_DCR_MMIO case,
too. I tried and failed. The best I came up without extensive doc
reading is:

diff --git a/arch/powerpc/include/asm/dcr-native.h b/arch/powerpc/include/a=
sm/dcr-native.h
index a92059964579..159ab7abfe46 100644
--- a/arch/powerpc/include/asm/dcr-native.h
+++ b/arch/powerpc/include/asm/dcr-native.h
@@ -115,15 +115,11 @@ static inline void __dcri_clrset(int base_addr, int b=
ase_data, int reg,
 	unsigned int val;
=20
 	spin_lock_irqsave(&dcr_ind_lock, flags);
-	if (cpu_has_feature(CPU_FTR_INDEXED_DCR)) {
-		mtdcrx(base_addr, reg);
-		val =3D (mfdcrx(base_data) & ~clr) | set;
-		mtdcrx(base_data, val);
-	} else {
-		__mtdcr(base_addr, reg);
-		val =3D (__mfdcr(base_data) & ~clr) | set;
-		__mtdcr(base_data, val);
-	}
+
+	mtdcr(base_addr, reg);
+	val =3D (mfdcr(base_data) & ~clr) | set;
+	mtdcr(base_data, val);
+
 	spin_unlock_irqrestore(&dcr_ind_lock, flags);
 }
=20
diff --git a/drivers/spi/Kconfig b/drivers/spi/Kconfig
index bc7021da2fe9..9a0a5e8c70c8 100644
--- a/drivers/spi/Kconfig
+++ b/drivers/spi/Kconfig
@@ -810,7 +810,8 @@ config SPI_PL022
=20
 config SPI_PPC4xx
 	tristate "PPC4xx SPI Controller"
-	depends on PPC32 && 4xx
+	depends on 4xx || COMPILE_TEST
+	depends on PPC32 || PPC64
 	select SPI_BITBANG
 	help
 	  This selects a driver for the PPC4xx SPI Controller.

While this is a step in the right direction (I think) it's not enough to
make the driver build (but maybe make it easier to define
dcri_clrset()?)

Could someone with more powerpc knowledge jump in and help (for the
benefit of better compile coverage of the spi driver and so less
breakage)? (If you do so based on my changes above, you don't need to
credit me for my effort, claim it as your's. I'm happy enough if the
situation improves.)

Thanks
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--pdqtf3l5nbfguqt3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmXdoXcACgkQj4D7WH0S
/k7vXQf6AkXGI7iH3aBjJ9XLOaapu4lrYQh0OTChbwICyvaJm2IF4w5DxEcHrlkn
Eb99x993wMGR9NgL0unwgwsaMyFe4dwk244Syy6FYYDuhxime67J4XOIs3XXV9GL
rUxW5EAZFU3RWL1QkaVE81ZMsn3OCrKd5eCFtE5nwSneNRcFsbclXYe8qD2MSeKI
x9zhvaQYK3CcYQVUgyqW5NWyHFNXee7XiZHq16M/sthfzNlA2xYZwPY3A76DqVMB
ayFxhR0QJBpsjZwlsjAxU8OgY1lDd9KZ6LsSP0CyQ4f8WDLv9fQN+rxu2JRLAiOL
KLPe9WbnXfN9jS9m5PuCekpVBtIqyA==
=Ij2S
-----END PGP SIGNATURE-----

--pdqtf3l5nbfguqt3--
