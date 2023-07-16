Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DA587558D2
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Jul 2023 02:22:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R42ny3ymsz3bfT
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Jul 2023 10:21:58 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=pengutronix.de (client-ip=2001:67c:670:201:290:27ff:fe1d:cc33; helo=metis.ext.pengutronix.de; envelope-from=mkl@pengutronix.de; receiver=lists.ozlabs.org)
X-Greylist: delayed 1094 seconds by postgrey-1.37 at boromir; Mon, 17 Jul 2023 03:21:58 AEST
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R3sTL20lPz2yLV
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Jul 2023 03:21:57 +1000 (AEST)
Received: from moin.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::7b] helo=bjornoya.blackshift.org)
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mkl@pengutronix.de>)
	id 1qL590-0006CU-2q; Sun, 16 Jul 2023 19:02:50 +0200
Received: from pengutronix.de (unknown [172.20.34.65])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	(Authenticated sender: mkl-all@blackshift.org)
	by smtp.blackshift.org (Postfix) with ESMTPSA id 1B66C1F1E34;
	Sun, 16 Jul 2023 17:02:35 +0000 (UTC)
Date: Sun, 16 Jul 2023 19:02:33 +0200
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] net: Explicitly include correct DT includes
Message-ID: <20230716-stout-grudging-1f91d771de85-mkl@pengutronix.de>
References: <20230714174809.4060885-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="g5fw27woy7qbit6d"
Content-Disposition: inline
In-Reply-To: <20230714174809.4060885-1-robh@kernel.org>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:b01:1d::7b
X-SA-Exim-Mail-From: mkl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linuxppc-dev@lists.ozlabs.org
X-Mailman-Approved-At: Mon, 17 Jul 2023 10:21:33 +1000
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
Cc: Andrew Lunn <andrew@lunn.ch>, Kevin Brace <kevinbrace@bracecomputerlab.com>, Linus Walleij <linus.walleij@linaro.org>, Iyappan Subramanian <iyappan@os.amperecomputing.com>, Miquel Raynal <miquel.raynal@bootlin.com>, Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>, Horatiu Vultur <horatiu.vultur@microchip.com>, Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>, Jerome Brunet <jbrunet@baylibre.com>, Samuel Holland <samuel@sholland.org>, Sean Anderson <sean.anderson@seco.com>, Kevin Hilman <khilman@baylibre.com>, Madalin Bucur <madalin.bucur@nxp.com>, Jose Abreu <joabreu@synopsys.com>, NXP Linux Team <linux-imx@nxp.com>, Mark Lee <Mark-MC.Lee@mediatek.com>, Landen Chao <Landen.Chao@mediatek.com>, Sascha Hauer <s.hauer@pengutronix.de>, linux-omap@vger.kernel.org, Alex Elder <elder@kernel.org>, =?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>, Douglas Miller <dougmill@linux.ibm.com>, Daniel Golle <daniel@makrotopia.org>, Pengutronix Kernel Team <kernel@pengutronix.de>
 , Vladimir Oltean <olteanv@gmail.com>, linux-wpan@vger.kernel.org, Claudiu Beznea <claudiu.beznea@microchip.com>, Shayne Chen <shayne.chen@mediatek.com>, Steve Glendinning <steve.glendinning@shawell.net>, Alexandre Belloni <alexandre.belloni@bootlin.com>, =?utf-8?B?SsOpcsO0bWU=?= Pouille r <jerome.pouiller@silabs.com>, Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Chris Snook <chris.snook@gmail.com>, linux-kernel@vger.kernel.org, Eric Dumazet <edumazet@google.com>, Thierry Reding <thierry.reding@gmail.com>, wcn36xx@lists.infradead.org, Dario Binacchi <dario.binacchi@amarulasolutions.com>, SkyLake Huang <SkyLake.Huang@mediatek.com>, Jonathan Hunter <jonathanh@nvidia.com>, Stefan Schmidt <stefan@datenfreihafen.org>, Yisen Zhuang <yisen.zhuang@huawei.com>, Richard Cochran <richardcochran@gmail.com>, Wolfgang Grandegger <wg@grandegger.com>, Woojung Huh <woojung.huh@microchip.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Sean Wang <sean.wang@mediatek.com>, linux-ca
 n@vger.kernel.org, Cla udiu Manoil <claudiu.manoil@nxp.com>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, Michal Simek <michal.simek@amd.com>, linux-arm-kernel@lists.infradead.org, Mirko Lindner <mlindner@marvell.com>, Neil Armstrong <neil.armstrong@linaro.org>, Chandrasekar Ramakrishnan <rcsekar@samsung.com>, UNGLinuxDriver@microchip.com, linux-renesas-soc@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-mediatek@lists.infradead.org, Heiner Kallweit <hkallweit1@gmail.com>, Tara s Chornyi <taras.chornyi@plvision.eu>, linux-wireless@vger.kernel.org, Emil Renner Berthing <kernel@esmil.dk>, Andreas Larsson <andreas@gaisler.com>, Kurt Kanzenbach <kurt@linutronix.de>, linux-tegra@vger.kernel.org, ath10k@lists.infradead.org, linux-amlogic@lists.infradead.org, Fabio Estevam <festevam@gmail.com>, Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>, Shenwei Wang <shenwei.wang@nxp.com>, Samin Guo <samin.guo@starfivetech.com>, Francois Romieu <romieu@fr.z
 oreil.com>, Paolo Abeni <pabeni@redhat.com>, Lorenzo Bianconi <lorenzo@kernel.org>, ath11k@lists.infradead.org, Grygorii Strashko <grygorii.strashko@ti.com>, Bhupesh Sharma <bhupesh.sharma@linaro.org>, John Crispin <john@phrozen.org>, Salil Mehta <salil.mehta@huawei.com>, Sergey Shtylyov <s.shtylyov@omp.ru>, Timur Tabi <timur@kernel.org>, =?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>, linux-sunxi@lists.linux.dev, linux-oxnas@groups.io, Shawn Guo <shawnguo@kernel.org>, "David S. Miller" <davem@davemloft.net>, Alexander Aring <alex.aring@gmail.com>, linux-stm32@st-md-mailman.stormreply.com, Alexandre Torgue <alexandre.torgue@foss.st.com>, George McCollister <george.mccollister@gmail.com>, Ryder Lee <ryder.lee@mediatek.com>, Florian Fainelli <florian.fainelli@broadcom.com>, Russell King <linux@armlinux.org.uk>, Clark Wang <xiaoning.wang@nxp.com>, Jakub Kicinski <kuba@kernel.org>, devicetree@vger.kernel.org, Kalle Valo <kvalo@kernel.org>, Keyur Chudgar <keyur@os.amperecomputi
 ng.com>, DENG Qingfang <dqfext@gmail.com>, Wei Fang <wei.fang@nxp.com>, Matthias Brugger <matthias.bgg@gmail.com>, Marcin Wojtas <mw@semihalf.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Loic Poulain <loic.poulain@linaro.org>, netdev@vger.kernel.org, Nicolas Ferre <nicolas.ferre@microchip.com>, Li Yang <leoyang.li@nxp.com>, Stephen Hemminger <stephen@networkplumber.org>, Vinod Ko ul <vkoul@kernel.org>, Alvin =?utf-8?Q?=C5=A0ipraga?= <alsi@bang-olufsen.dk>, linuxppc-dev@lists.ozlabs.org, Felix Fietkau <nbd@nbd.name>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--g5fw27woy7qbit6d
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="vxeub4efr4nku2wd"
Content-Disposition: inline


--vxeub4efr4nku2wd
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="2mmyiduer253ii4f"
Content-Disposition: inline


--2mmyiduer253ii4f
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 14.07.2023 11:48:00, Rob Herring wrote:
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
> ---
>  drivers/net/can/bxcan.c                                 | 1 -
>  drivers/net/can/ifi_canfd/ifi_canfd.c                   | 1 -
>  drivers/net/can/m_can/m_can.c                           | 1 -
>  drivers/net/can/m_can/m_can.h                           | 1 -
>  drivers/net/can/rcar/rcar_canfd.c                       | 1 -
>  drivers/net/can/sja1000/sja1000_platform.c              | 1 -
>  drivers/net/can/sun4i_can.c                             | 1 -
>  drivers/net/can/ti_hecc.c                               | 1 -

Acked-by: Marc Kleine-Budde <mkl@pengutronix.de> # for drivers/net/can

regards,
Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde          |
Embedded Linux                   | https://www.pengutronix.de |
Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |

--2mmyiduer253ii4f--

--vxeub4efr4nku2wd--

--g5fw27woy7qbit6d
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEDs2BvajyNKlf9TJQvlAcSiqKBOgFAmS0IqYACgkQvlAcSiqK
BOhfLQgAnOPxJiYWHd0YYYBr6D5Xvaa7YD/llBx5YeP2Eol6zKlE5NW1xdwBoHP/
oxs3PENqI/mVuAtWhs6sNCSEtOEssWtUWrx23I9bxRa2AE/DUWfpg/NP/sy3ZVsV
sYgzGHOJqf+S+OMzalvZ9hIDu+a6xxhA9rUTaK2lNn0nBeWxEf92JhPV+nGREldR
CHY3WW/trL1qHxxtn7ZWhI2IVounTWpkXZnJz9DRocIQrm1mPmNz5lcwkr+ST1th
C92e2GJEahuxXdOMXfuuGMUSGzFqGZRtKT3WAx9/8l/lUsyKZ9Jhn1Rv7NE9zNPG
R640Tfvr5cFRQIVusYrKVMlQ8URlUg==
=ICgU
-----END PGP SIGNATURE-----

--g5fw27woy7qbit6d--
