Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B4906B64D7
	for <lists+linuxppc-dev@lfdr.de>; Sun, 12 Mar 2023 11:18:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PZG2s04RKz3f48
	for <lists+linuxppc-dev@lfdr.de>; Sun, 12 Mar 2023 21:18:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=pengutronix.de (client-ip=2001:67c:670:201:290:27ff:fe1d:cc33; helo=metis.ext.pengutronix.de; envelope-from=mkl@pengutronix.de; receiver=<UNKNOWN>)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PZG2G4dQlz3bdV
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 12 Mar 2023 21:17:56 +1100 (AEDT)
Received: from moin.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::7b] helo=bjornoya.blackshift.org)
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mkl@pengutronix.de>)
	id 1pbIlX-0001NV-KV; Sun, 12 Mar 2023 11:17:23 +0100
Received: from pengutronix.de (unknown [IPv6:2a00:20:4047:f0aa:709:fab:bab8:4a48])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	(Authenticated sender: mkl-all@blackshift.org)
	by smtp.blackshift.org (Postfix) with ESMTPSA id 8D95418F886;
	Sun, 12 Mar 2023 10:16:59 +0000 (UTC)
Date: Sun, 12 Mar 2023 11:16:56 +0100
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] net: Use of_property_read_bool() for boolean properties
Message-ID: <20230312101656.6vugofe3ejtovnks@pengutronix.de>
References: <20230310144718.1544169-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="56s4oxy73xinyvne"
Content-Disposition: inline
In-Reply-To: <20230310144718.1544169-1-robh@kernel.org>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:b01:1d::7b
X-SA-Exim-Mail-From: mkl@pengutronix.de
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
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>, linux-kernel@vger.kernel.org, Eric Dumazet <edumazet@google.com>, Shenwei Wang <shenwei.wang@nxp.com>, Fabio Estevam <festevam@gmail.com>, linux-stm32@st-md-mailman.stormreply.com, Zhao Qiang <qiang.zhao@nxp.com>, Michal Simek <michal.simek@xilinx.com>, Jose Abreu <joabreu@synopsys.com>, Clark Wang <xiaoning.wang@nxp.com>, NXP Linux Team <linux-imx@nxp.com>, Francois Romieu <romieu@fr.zoreil.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Kalle Valo <kvalo@kernel.org>, Wolfgang Grandegger <wg@grandegger.com>, devicetree@vger.kernel.org, Grygorii Strashko <grygorii.strashko@ti.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Sascha Hauer <s.hauer@pengutronix.de>, linuxppc-dev@lists.ozlabs.org, linux-can@vger.kernel.org, Claudiu Manoil <claudiu.manoil@nxp.com>, Wei Fang <wei.fang@nxp.com>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org, netd
 ev@vger.kernel.org, linux-wireless@vger.kernel.org, Nicolas Ferre <nicolas.ferre@microchip.com>, "David S. Miller" <davem@davemloft.net>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Samuel Mendoza-Jonas <sam@mendozajonas.com>, Shawn Guo <shawnguo@kernel.org>, Claudiu Beznea <claudiu.beznea@microchip.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--56s4oxy73xinyvne
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 10.03.2023 08:47:16, Rob Herring wrote:
> It is preferred to use typed property access functions (i.e.
> of_property_read_<type> functions) rather than low-level
> of_get_property/of_find_property functions for reading properties.
> Convert reading boolean properties to to of_property_read_bool().
>=20
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  drivers/net/can/cc770/cc770_platform.c          | 12 ++++++------

Acked-by: Marc Kleine-Budde <mkl@pengutronix.de> # for net/can

regards,
Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde           |
Embedded Linux                   | https://www.pengutronix.de  |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-5555 |

--56s4oxy73xinyvne
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEDs2BvajyNKlf9TJQvlAcSiqKBOgFAmQNppYACgkQvlAcSiqK
BOih8Af/YX2B3N5FsBIZG4yqpr++vgKc4n7OnSLKeurhmc0xDoCskNspwUZEwQMx
qH0NpgRO8lQRNavcmnZCXsQNyaDN+MZisfJf/6ok61y5S2klIpM53ExvbwwG3bMN
s4yVdfQC6+OXVLKbp8zOkZvkjIJ8WPXROJs7co0Vwpw+6ISlaBCr1tNOyaQ8pG1I
okCqcVtkxS7Oq972YEV14iIgJkqaIhjVDuCQib7hRPf3AQOf4HVwSOdRmKQSpa2J
JoiV0ENG22zhLQ10qSyttO6mLAyAfF63yU4gNr8Qr4HFfMu2GrnhlI5mhVJAsBET
xkYmWkJD8zscCZtljlR5NmYU9uO/sA==
=0vPJ
-----END PGP SIGNATURE-----

--56s4oxy73xinyvne--
