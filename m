Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CA788719BF7
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Jun 2023 14:22:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QX4yv3mW8z3f0f
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Jun 2023 22:22:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=pengutronix.de (client-ip=2001:67c:670:201:290:27ff:fe1d:cc33; helo=metis.ext.pengutronix.de; envelope-from=ukl@pengutronix.de; receiver=<UNKNOWN>)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QWyYm296dz3bqx
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Jun 2023 17:34:04 +1000 (AEST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1q4coI-0002fI-SS; Thu, 01 Jun 2023 09:33:26 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1q4coF-004Iia-Ri; Thu, 01 Jun 2023 09:33:23 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1q4coF-00A54n-3w; Thu, 01 Jun 2023 09:33:23 +0200
Date: Thu, 1 Jun 2023 09:33:22 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: Re: [PATCH 00/89] i2c: Convert to platform remove callback returning
 void
Message-ID: <20230601073322.ww25ajaurktqsryr@pengutronix.de>
References: <20230508205306.1474415-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="t3p72aozx6nadzgj"
Content-Disposition: inline
In-Reply-To: <20230508205306.1474415-1-u.kleine-koenig@pengutronix.de>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linuxppc-dev@lists.ozlabs.org
X-Mailman-Approved-At: Thu, 01 Jun 2023 22:22:24 +1000
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
Cc: Andrew Lunn <andrew@lunn.ch>, Shyam Sundar S K <shyam-sundar.s-k@amd.com>, Tomer Maimon <tmaimon77@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, Conor Dooley <conor.dooley@microchip.com>, Alim Akhtar <alim.akhtar@samsung.com>, Miquel Raynal <miquel.raynal@bootlin.com>, Dmitry Osipenko <digetx@gmail.com>, linux-stm32@st-md-mailman.stormreply.com, Heiko Stuebner <heiko@sntech.de>, linux-samsung-soc@vger.kernel.org, Robert Foss <rfoss@kernel.org>, Samuel Holland <samuel@sholland.org>, Khalil Blaiech <kblaiech@nvidia.com>, NXP Linux Team <linux-imx@nxp.com>, linux-sunxi@lists.linux.dev, Jean Delvare <jdelvare@suse.com>, linux-tegra@vger.kernel.org, ye xingchen <ye.xingchen@zte.com.cn>, Sascha Hauer <s.hauer@pengutronix.de>, Nicholas Piggin <npiggin@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, linux-omap@vger.kernel.org, Allison Randal <allison@lohutok.net>, Scott Branden <sbranden@broadcom.com>, Daire McNamara <daire.mcnamara@microchip.com>, Greg Kroah-Hartman <gregkh@li
 nuxfoundation.org>, Andrew Jeffery <andrew@aj.id.au>, Masami Hiramatsu <mhiramat@kernel.org>, kernel@pengutronix.de, Claudiu Beznea <claudiu.beznea@microchip.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Thierry Reding <thierry.reding@gmail.com>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, linux-i2c@vger.kernel.org, Guenter Roeck <groeck@chromium.org>, Stefan Wahren <stefan.wahren@i2se.com>, chrome-platform@lists.linux.dev, Matthias Schiffer <matthias.schiffer@ew.tq-group.com>, Fabio Estevam <festevam@gmail.com>, Bartosz Golaszewski <brgl@bgdev.pl>, Jonathan Hunter <jonathanh@nvidia.com>, linux-rockchip@lists.infradead.org, Peter Korsgaard <peter.korsgaard@barco.com>, Alain Volmat <alain.volmat@foss.st.com>, Jerome Brunet <jbrunet@baylibre.com>, Chris Pringle <chris.pringle@phabrix.com>, Andi Shyti <andi.shyti@kernel.org>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-arm-msm@vger.kernel.org, C
 hris Packham <chris.packham@alliedtelesis.co.nz>, linux-rpi-kernel@lists.infradead.org, Nick Hawkins <nick.hawkins@hpe.com>, linux-amlogic@lists.infradead.org, Michal Simek <michal.simek@amd.com>, linux-arm-kernel@lists.infradead.org, Benjamin Fair <benjaminfair@google.com>, Dong Aisheng <aisheng.dong@nxp.com>, Neil Armstrong <neil.armstrong@linaro.org>, Jim Cromie <jim.cromie@gmail.com>, Hector Martin <marcan@marcan.st>, Wolfram Sang <wsa@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Kevin Hilman <khilman@baylibre.com>, Aaro Koskinen <aaro.koskinen@iki.fi>, Thor Thayer <thor.thayer@linux.intel.com>, Vadim Pasternak <vadimp@nvidia.com>, Jean-Marie Verdun <verdun@hpe.com>, Brendan Higgins <brendan.higgins@linux.dev>, Elie Morisse <syniurge@gmail.com>, Stefan Roese <sr@denx.de>, Krzysztof Adamski <krzysztof.adamski@nokia.com>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, Rob Herring <robh@kernel.org>, Peter Korsgaard <peter@korsgaard.com>, Florian Fainelli <f.fainelli@gmail.c
 om>, linux-aspeed@lists.ozlabs.org, Mika Westerberg <mika.westerberg@linux.intel.com>, Jernej Skrabec <jernej.skrabec@gmail.com>, Wei Chen <harperchen1110@gmail.com>, Nancy Yuen <yuenn@google.com>, Chen-Yu Tsai <wens@csie.org>, Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Joel Stanley <joel@jms.id.au>, Codrin Ciubotariu <codrin.ciubotariu@microchip.com>, Patrice Chotard <patrice.chotard@foss.st.com>, Robert Richter <rric@kernel.org>, Asmaa Mnebhi <asmaa@nvidia.com>, Ray Jui <rjui@broadcom.com>, Vladimir Zapolskiy <vz@mleia.com>, Benson Leung <bleung@chromium.org>, Qii Wang <qii.wang@mediatek.com>, Avi Fishman <avifishman70@gmail.com>, linux-mips@vger.kernel.org, Sebastian Reichel <sre@kernel.org>, Oleksij Rempel <linux@rempel-privat.de>, Julia Lawall <Julia.Lawall@inria.fr>, Laxman Dewangan <ldewangan@nvidia.com>, Jarkko Nikula <jarkko.nikula@linux.intel.com>, asahi@lists.linux.dev, Shawn Guo <shawnguo@kernel.org>, Peter Rosin <peda@axentia.se>, Baru
 ch Siach <baruch@tkos.co.il>, Vignesh R <vigneshr@ti.com>, Tony Lindgren <tony@atomide.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, Tali Perry <tali.perry1@gmail.com>, Paul Cercueil <paul@crapouillou.net>, Chris Brandt <chris.brandt@renesas.com>, linux-mediatek@lists.infradead.org, Jan Dabros <jsd@semihalf.com>, linux-riscv@lists.infradead.org, Ard Biesheuvel <ardb@kernel.org>, linux-renesas-soc@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>, Kamal Dasu <kdasu.kdev@gmail.com>, openbmc@lists.ozlabs.org, Janusz Krzysztofik <jmkrzyszt@gmail.com>, Andy Gross <agross@kernel.org>, Sven Peter <sven@svenpeter.dev>, Hans de Goede <hdegoede@redhat.com>, George Cherian <gcherian@marvell.com>, Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>, Matthias Brugger <matthias.bgg@gmail.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Loic Poulain <loic.poulain@linaro.org>, Patrick Venture <venture
 @google.com>, Bjorn Andersson <andersson@kernel.org>, Nicolas Ferre <nicolas.ferre@microchip.com>, Michael Shych <michaelsh@nvidia.com>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Philipp Zabel <p.zabel@pengutronix.de>, linuxppc-dev@lists.ozlabs.org, Gregory CLEMENT <gregory.clement@bootlin.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--t3p72aozx6nadzgj
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[Dropped Phil Edworthy from recipents as his email address has problems]

Hello,

On Mon, May 08, 2023 at 10:51:37PM +0200, Uwe Kleine-K=F6nig wrote:
> this series convers the drivers below drivers/i2c to the .remove_new()
> callback of struct platform_driver(). The motivation is to make the
> remove callback less prone for errors and wrong assumptions. See commit
> 5c5a7680e67b ("platform: Provide a remove callback that returns no
> value") for a more detailed rationale.
>=20
> All but one driver already returned zero unconditionally in their
> .remove() callback, so converting them to .remove_new() is trivial.
> i2c-davinci has two patches in this series, first the error path is
> improved to not return an error code, then it's converted as the others
> drivers are.
>=20
> The two davinci patches are also the only interdependency in this
> series. I was unsure if I should split the series in two, the busses and
> the mux changes; if convenient these can be applied independent of each
> other.

I wonder how this series will go in. My expectation was that Wolfram
picks up the whole series via his tree?!

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--t3p72aozx6nadzgj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmR4ScIACgkQj4D7WH0S
/k5tFwgAlOnFyNSd/y+RTxXNPFfhdLDFrGmy0vVlKgNWr54rj45mpn2vKbWNVNMh
uHJkfu86+59kw2Z0mV0P0MetDeJReqHGuXrjQe87Pkus+gNIQ6yV0pH5TFAVpTxR
eD04UBlV5+o939pFIOX+jBdeGDvPcSeECFfwxplSVVvUU6jJ6g0LiCDNdn6eNxHD
g2Dnl8SpsU1t5iM62pyjZlBoscqvjfFiBCGdT80CmYeMPJM5UnBEdJOmpybfa8Ce
scJdDvHFUP2jh1LC+0RQ43raxUyZon0Lie6tT6IbAoOXUiTqpcZ6NOhyobMzOcHq
FIkEZoeC8nKcmthV7foaEY5TgzmK+w==
=LLVA
-----END PGP SIGNATURE-----

--t3p72aozx6nadzgj--
