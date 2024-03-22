Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 903BD88727D
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Mar 2024 19:03:08 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=cNmYtKwO;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V1VYQ292xz3wBk
	for <lists+linuxppc-dev@lfdr.de>; Sat, 23 Mar 2024 05:03:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=cNmYtKwO;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=sang-engineering.com (client-ip=194.117.254.33; helo=mail.zeus03.de; envelope-from=wsa+renesas@sang-engineering.com; receiver=lists.ozlabs.org)
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V1TN33Vwjz3vmv
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 23 Mar 2024 04:09:55 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=WFSR
	OxQZOVxFu47A+8VqRSUCe8TRaljA8PS0t5b553Y=; b=cNmYtKwO5Cu5IWiuRD5o
	Rra1wfWzl7faA6KT3pVfA9ipAZ93fnWCDyioXrFmupshiecN38ZhuEn20Lv197ck
	wliUCprkQUA+jo49CTtVw9txv7lkqS3TK7Sph3u8PGimL8isWCSjBtDUOvzRJC0c
	HV4nrVroNyYOMldN5AgE4PNKHFpmVyKgXYoBCwPSXbXBzaxGbeNIbPfQZpKPIkJj
	OW/7uewh3zH5HPeHcYM/IfiHiY62bvPzBSsPOmiOjbDOgKSwOamu6D/qtV+wk6R+
	BNT0hTYDcakbO1754UvcuMCQVFvDQRT4cCISEjn5KLHZbq2psaT5U9oxZ+uoJ87t
	pw==
Received: (qmail 3929014 invoked from network); 22 Mar 2024 18:09:43 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 22 Mar 2024 18:09:43 +0100
X-UD-Smtp-Session: l3s3148p1@P2He40IU0sJehhtF
Date: Fri, 22 Mar 2024 18:09:42 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Guenter Roeck <groeck@google.com>
Subject: Re: [PATCH 64/64] i2c: reword i2c_algorithm in drivers according to
 newest specification
Message-ID: <Zf27VpOHPXAtHCLr@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Guenter Roeck <groeck@google.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	linux-i2c@vger.kernel.org, Elie Morisse <syniurge@gmail.com>,
	Shyam Sundar S K <shyam-sundar.s-k@amd.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Codrin Ciubotariu <codrin.ciubotariu@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Krzysztof Adamski <krzysztof.adamski@nokia.com>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Jan Dabros <jsd@semihalf.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Jean-Marie Verdun <verdun@hpe.com>,
	Nick Hawkins <nick.hawkins@hpe.com>,
	Yicong Yang <yangyicong@hisilicon.com>,
	Oleksij Rempel <o.rempel@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Paul Cercueil <paul@crapouillou.net>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Khalil Blaiech <kblaiech@nvidia.com>,
	Asmaa Mnebhi <asmaa@nvidia.com>, Qii Wang <qii.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Avi Fishman <avifishman70@gmail.com>,
	Tomer Maimon <tmaimon77@gmail.com>,
	Tali Perry <tali.perry1@gmail.com>,
	Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>,
	Benjamin Fair <benjaminfair@google.com>,
	Ajay Gupta <ajayg@nvidia.com>,
	Peter Korsgaard <peter@korsgaard.com>, Andrew Lunn <andrew@lunn.ch>,
	Robert Richter <rric@kernel.org>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Janusz Krzysztofik <jmkrzyszt@gmail.com>,
	Tony Lindgren <tony@atomide.com>, Vignesh R <vigneshr@ti.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	"Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
	"Naveen N. Rao" <naveen.n.rao@linux.ibm.com>,
	Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Vladimir Zapolskiy <vz@mleia.com>,
	Loic Poulain <loic.poulain@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>,
	Alain Volmat <alain.volmat@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Laxman Dewangan <ldewangan@nvidia.com>,
	Dmitry Osipenko <digetx@gmail.com>,
	Conghui Chen <conghui.chen@intel.com>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Michal Simek <michal.simek@amd.com>, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	chrome-platform@lists.linux.dev, linux-samsung-soc@vger.kernel.org,
	imx@lists.linux.dev, linux-mips@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-mediatek@lists.infradead.org, openbmc@lists.ozlabs.org,
	linux-omap@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	asahi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-tegra@vger.kernel.org, virtualization@lists.linux.dev,
	Ryan Wanner <Ryan.Wanner@microchip.com>
References: <20240322132619.6389-1-wsa+renesas@sang-engineering.com>
 <20240322132619.6389-65-wsa+renesas@sang-engineering.com>
 <e8dff9d4-ed15-44e9-ae9a-2e77845ec40b@microchip.com>
 <Zf22G4jC2gIlzhi_@shikoro>
 <CABXOdTc14kfPpkF96KG-oeLRTLvjxAD_gtOO2TQFLnHMLNoU_Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="un7BlYMtStBuO9gz"
Content-Disposition: inline
In-Reply-To: <CABXOdTc14kfPpkF96KG-oeLRTLvjxAD_gtOO2TQFLnHMLNoU_Q@mail.gmail.com>
X-Mailman-Approved-At: Sat, 23 Mar 2024 04:58:59 +1100
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
Cc: Andrew Lunn <andrew@lunn.ch>, Shyam Sundar S K <shyam-sundar.s-k@amd.com>, Tomer Maimon <tmaimon77@gmail.com>, Ajay Gupta <ajayg@nvidia.com>, Viresh Kumar <viresh.kumar@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>, Dmitry Osipenko <digetx@gmail.com>, linux-stm32@st-md-mailman.stormreply.com, Jerome Brunet <jbrunet@baylibre.com>, linux-samsung-soc@vger.kernel.org, Robert Foss <rfoss@kernel.org>, Aaro Koskinen <aaro.koskinen@iki.fi>, Khalil Blaiech <kblaiech@nvidia.com>, Oleksij Rempel <o.rempel@pengutronix.de>, Sascha Hauer <s.hauer@pengutronix.de>, Nicholas Piggin <npiggin@gmail.com>, linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org, Pengutronix Kernel Team <kernel@pengutronix.de>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Yicong Yang <yangyicong@hisilicon.com>, Laxman Dewangan <ldewangan@nvidia.com>, linux-i2c@vger.kernel.org, Guenter Roeck <groeck@chromium.org>, chrome-platform@lists.linux.dev, Fabio Estevam <fest
 evam@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Alain Volmat <alain.volmat@foss.st.com>, Ryan Wanner <Ryan.Wanner@microchip.com>, Andi Shyti <andi.shyti@kernel.org>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-arm-msm@vger.kernel.org, Nicolas Ferre <nicolas.ferre@microchip.com>, Fabrizio Castro <fabrizio.castro.jz@renesas.com>, Nick Hawkins <nick.hawkins@hpe.com>, linux-amlogic@lists.infradead.org, Mika Westerberg <mika.westerberg@linux.intel.com>, linux-arm-kernel@lists.infradead.org, Neil Armstrong <neil.armstrong@linaro.org>, Hector Martin <marcan@marcan.st>, linux-renesas-soc@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Kevin Hilman <khilman@baylibre.com>, linux-mediatek@lists.infradead.org, imx@lists.linux.dev, Jean-Marie Verdun <verdun@hpe.com>, linux-tegra@vger.kernel.org, Elie Morisse <syniurge@gmail.com>, Krzysztof Adamski <krzysztof.adamski@nokia.com>, Alyssa Rosenzweig <alyssa@rose
 nzweig.io>, Peter Korsgaard <peter@korsgaard.com>, Benjamin Fair <benjaminfair@google.com>, Michal Simek <michal.simek@amd.com>, Nancy Yuen <yuenn@google.com>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Codrin Ciubotariu <codrin.ciubotariu@microchip.com>, Robert Richter <rric@kernel.org>, Asmaa Mnebhi <asmaa@nvidia.com>, Vladimir Zapolskiy <vz@mleia.com>, Conghui Chen <conghui.chen@intel.com>, Benson Leung <bleung@chromium.org>, Qii Wang <qii.wang@mediatek.com>, Avi Fishman <avifishman70@gmail.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, Konrad Dybcio <konrad.dybcio@linaro.org>, Thierry Reding <thierry.reding@gmail.com>, Jarkko Nikula <jarkko.nikula@linux.intel.com>, asahi@lists.linux.dev, Shawn Guo <shawnguo@kernel.org>, Vignesh R <vigneshr@ti.com>, Tony Lindgren <tony@atomide.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, Tali Perry <tali.perry1@gmail.com>, Paul Cercueil <paul@crapouillou.net>, Jan Dabros <jsd@semihalf.com>, openbmc@lists.ozlabs.org, Janusz Krzyszto
 fik <jmkrzyszt@gmail.com>, Sven Peter <sven@svenpeter.dev>, virtualization@lists.linux.dev, Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>, Matthias Brugger <matthias.bgg@gmail.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Loic Poulain <loic.poulain@linaro.org>, Patrick Venture <venture@google.com>, Bjorn Andersson <andersson@kernel.org>, linux-mips@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--un7BlYMtStBuO9gz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Kind of odd though to change function names but not parameter names of
> those very same functions.

Ouch, this is definitely a valid point. Seems like this series will need
a respin after all. Will wait for further comments, though.

Thanks!


--un7BlYMtStBuO9gz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmX9u1YACgkQFA3kzBSg
KbZSKA//Q8484MbfzpPKmvUS0QA73oCgcHXOiIKbRKOfwXWkquKc1vuGV6LbxWG+
oPc84UQGrv+MjAhAMX/ZpO2VdGp+ej/a1j1kNYihlqVTkY/rRWPMa5y1oNB2H5Xq
tFjFmqgwbqm/K/OND3KcJw8zAmXCTgCvgQDyQx76B6KMydRGzKel/sM29TwW6mTm
HCQ9klGLK273LaNEAwn4vkLQ6BtVmjI1CpnjIp3hSRWdW9IytTQlM2weh0gQ+D2p
OerYgE9JUZp4dgPgLIR60J3AER1DaZtHMVH5NwMLT8xMLa/L3RgkSaTbxa/D2tvm
K2XQbEWvx8HsxtEIUEcIy936gmSyZ7Nta1mJv+5yN+DLHdGoo9KNl6vcMxzXLgpM
02/ySV8tMq+Q4cX/fIVZxaeudi69toWj1QcjLg11KaJDo4ndbPqBwYRkSYJ+o2Nh
aJNDu7J+5ud051bq05bFRaCitl7kyEdv5WEjwk5RTLDD1xvwR84SZ3ElcQ6Jnb/I
VaA1JNnKw/et4KmEF4A65wphnC8pC/gmH5c9SrPs6w7dUw44dla+p+jPrgtvUOnY
sqhCnFNLZ5MGuyhTemuWVdGNNvwwuTYFf/VYKi7mdRVsCRdLQIoHklH7FUfmwhpM
G5oEk4nI7j9MbLPl4WOjrZ9k5wZQnd5zRSWHj/aw5xmVCbNVKsQ=
=dqSs
-----END PGP SIGNATURE-----

--un7BlYMtStBuO9gz--
