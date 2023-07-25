Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BE24A760AF4
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jul 2023 08:52:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R974W596Qz3dCD
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jul 2023 16:52:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=pengutronix.de (client-ip=2001:67c:670:201:290:27ff:fe1d:cc33; helo=metis.ext.pengutronix.de; envelope-from=ukl@pengutronix.de; receiver=lists.ozlabs.org)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R973w3VWmz30MD
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Jul 2023 16:51:37 +1000 (AEST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1qOBsF-0008CR-QE; Tue, 25 Jul 2023 08:50:23 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qOBs7-001wAn-Vc; Tue, 25 Jul 2023 08:50:15 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qOBs7-007bOg-45; Tue, 25 Jul 2023 08:50:15 +0200
Date: Tue, 25 Jul 2023 08:50:14 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2] tty: Explicitly include correct DT includes
Message-ID: <20230725065014.kjdcos77kzepprvw@pengutronix.de>
References: <20230724205440.767071-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="egg3m5pjvujeb37y"
Content-Disposition: inline
In-Reply-To: <20230724205440.767071-1-robh@kernel.org>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
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
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, Mateusz Holenko <mholenko@antmicro.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, Liviu Dudau <liviu.dudau@arm.com>, linux-kernel@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>, sparclinux@vger.kernel.org, Laxman Dewangan <ldewangan@nvidia.com>, Shan-Chun Hung <schung@nuvoton.com>, Peter Korsgaard <jacmet@sunsite.dk>, Fabio Estevam <festevam@gmail.com>, Karol Gugala <kgugala@antmicro.com>, Russell King <linux@armlinux.org.uk>, Jonathan Hunter <jonathanh@nvidia.com>, Gabriel Somlo <gsomlo@gmail.com>, Andy Gross <agross@kernel.org>, Joel Stanley <joel@jms.id.au>, linux-serial@vger.kernel.org, linux-mips@vger.kernel.org, NXP Linux Team <linux-imx@nxp.com>, Jacky Huang <ychuang3@nuvoton.com>, linux-tegra@vger.kernel.org, linux-arm-msm@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>, linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>, Jiri Slaby <jirislaby@kernel.org>, linux-arm-kernel@lists.infradead.o
 rg, Timur Tabi <timur@kernel.org>, Richard Genoud <richard.genoud@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Bjorn Andersson <andersson@kernel.org>, Nicolas Ferre <nicolas.ferre@microchip.com>, "David S. Miller" <davem@davemloft.net>, Konrad Dybcio <konrad.dybcio@linaro.org>, Thierry Reding <thierry.reding@gmail.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Sudeep Holla <sudeep.holla@arm.com>, Shawn Guo <shawnguo@kernel.org>, Claudiu Beznea <claudiu.beznea@microchip.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--egg3m5pjvujeb37y
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Rob,

On Mon, Jul 24, 2023 at 02:54:38PM -0600, Rob Herring wrote:
> The DT of_device.h and of_platform.h date back to the separate
> of_platform_bus_type before it as merged into the regular platform bus.
> As part of that merge prepping Arm DT support 13 years ago, they
> "temporarily" include each other. They also include platform_device.h
> and of.h. As a result, there's a pretty much random mix of those include
> files used throughout the tree. In order to detangle these headers and
> replace the implicit includes with struct declarations, users need to
> explicitly include the correct includes.
>=20
> Signed-off-by: Rob Herring <robh@kernel.org>

Acked-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de> # for imx

Thanks for your efforts!

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--egg3m5pjvujeb37y
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmS/cKYACgkQj4D7WH0S
/k5DeQf/XZ9i2MKupQ474foZd/xSXDoeGP/mzcur4EO3Bu06s1VDyknWODS3IU5p
VGN/GNMpV8QCC4UBbhddhyqP60D9vYNBqbyw6ZsVZTH5+9Ld4Dmfi8jTYeTNiYYc
+EmM4HrAdY1GVXkdkip00c1GWdcPsHQA6JgSwV1z2cjiJU/7AeRdF6FTB7LPtxCO
lHZ+at0pra4cRma7o2dZyjIZCa3M05OFqBIX5FAbCCptQsRYlnfTJbOuA2Fr3aTq
mn7uHJbHPuX+r4PnWXzeq/IC4eEynkYfcINsTmQtG2H2ecI+GvJGttDpTrZstKr7
ThQy424A1jo0R00lnwmfFmOG/Q7gKQ==
=p7gV
-----END PGP SIGNATURE-----

--egg3m5pjvujeb37y--
