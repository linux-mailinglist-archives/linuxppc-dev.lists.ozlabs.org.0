Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2773A77C41A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Aug 2023 01:58:39 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=hW+W0wmz;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RPrvc6tsHz3cTD
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Aug 2023 09:58:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=hW+W0wmz;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=sang-engineering.com (client-ip=194.117.254.33; helo=mail.zeus03.de; envelope-from=wsa+renesas@sang-engineering.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 385 seconds by postgrey-1.37 at boromir; Tue, 15 Aug 2023 01:57:13 AEST
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RPfD96nxDz2yD6
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Aug 2023 01:57:13 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=FYep
	wEYtDzQvBpaqNq01ju5b6nuQwAUfmhoLQUMczxo=; b=hW+W0wmzjGTNGIoKy/ap
	lEHAoznAyAfVL7icFHh183O6QhmQ/RFFz1bBxMIFqN4sVGcow6I1ev2ZyDM2yY5a
	F0+vrfaAjzKbzTMTKdFnmxIFmX/mX5oTizcVu7pBpP3CXXNzXZBPkfpbSm8fZD3p
	47yT+S4QJ0m1XyEsNDwmnV2MIbyGCMdsu+wttTFMTjG3HwB1o4JmmWtii6wfbTh9
	WiiGlmpGudcaDNcJ1BVQCga1C1QXrrtJ+p18X1Sk5WWD8G29cY2FHbz9oITK8IW4
	1Ias5CaMQ6Dm+VoLFhG49pbAADA+vtcd8Wj/FXZxUFPGFr3SfY0eknRzKvcJU8F/
	Lg==
Received: (qmail 95061 invoked from network); 14 Aug 2023 17:50:30 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 14 Aug 2023 17:50:30 +0200
X-UD-Smtp-Session: l3s3148p1@9OabBeQC6KAgAwDPXxIFAOXxDpD4UZq0
Date: Mon, 14 Aug 2023 17:50:30 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] I2C: Explicitly include correct DT includes
Message-ID: <ZNpNRlLSdjR7Zfv0@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Rob Herring <robh@kernel.org>,
	Codrin Ciubotariu <codrin.ciubotariu@microchip.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@microchip.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Jochen Friedrich <jochen@scram.de>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Jean-Marie Verdun <verdun@hpe.com>,
	Nick Hawkins <nick.hawkins@hpe.com>,
	Dong Aisheng <aisheng.dong@nxp.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>,
	Oleksij Rempel <linux@rempel-privat.de>,
	Paul Cercueil <paul@crapouillou.net>,
	Vladimir Zapolskiy <vz@mleia.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Khalil Blaiech <kblaiech@nvidia.com>,
	Asmaa Mnebhi <asmaa@nvidia.com>,
	Chris Packham <chris.packham@alliedtelesis.co.nz>,
	Qii Wang <qii.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Stefan Roese <sr@denx.de>, Avi Fishman <avifishman70@gmail.com>,
	Tomer Maimon <tmaimon77@gmail.com>,
	Tali Perry <tali.perry1@gmail.com>,
	Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>,
	Benjamin Fair <benjaminfair@google.com>,
	Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber@suse.de>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Chris Brandt <chris.brandt@renesas.com>,
	Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Laxman Dewangan <ldewangan@nvidia.com>,
	Dmitry Osipenko <digetx@gmail.com>, Peter Rosin <peda@axentia.se>,
	Michael Hennerich <michael.hennerich@analog.com>,
	devicetree@vger.kernel.org, linux-i2c@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
	linux-renesas-soc@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org, linux-mips@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-mediatek@lists.infradead.org, openbmc@lists.ozlabs.org,
	linux-actions@lists.infradead.org, linux-tegra@vger.kernel.org
References: <20230714174619.4057577-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="17Pm2F6dlWUYnS2d"
Content-Disposition: inline
In-Reply-To: <20230714174619.4057577-1-robh@kernel.org>
X-Mailman-Approved-At: Tue, 15 Aug 2023 09:57:01 +1000
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
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, Tomer Maimon <tmaimon77@gmail.com>, Asmaa Mnebhi <asmaa@nvidia.com>, Jean-Marie Verdun <verdun@hpe.com>, Tali Perry <tali.perry1@gmail.com>, Paul Cercueil <paul@crapouillou.net>, linux-tegra@vger.kernel.org, Chris Brandt <chris.brandt@renesas.com>, Thierry Reding <thierry.reding@gmail.com>, linux-i2c@vger.kernel.org, Alim Akhtar <alim.akhtar@samsung.com>, Dmitry Osipenko <digetx@gmail.com>, Stefan Roese <sr@denx.de>, Fabio Estevam <festevam@gmail.com>, linux-kernel@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>, linux-samsung-soc@vger.kernel.org, Benjamin Fair <benjaminfair@google.com>, Florian Fainelli <florian.fainelli@broadcom.com>, Peter Rosin <peda@axentia.se>, Kevin Hilman <khilman@baylibre.com>, Bartosz Golaszewski <brgl@bgdev.pl>, Khalil Blaiech <kblaiech@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>, Nancy Yuen <yuenn@google.com>, Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 NXP Linux Team <linux-imx@nxp.com>, Orson Zhai <orsonzhai@gmail.com>, Codrin Ciubotariu <codrin.ciubotariu@microchip.com>, linux-mips@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Andi Shyti <andi.shyti@kernel.org>, Michael Hennerich <michael.hennerich@analog.com>, Manivannan Sadhasivam <mani@kernel.org>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Ray Jui <rjui@broadcom.com>, Sascha Hauer <s.hauer@pengutronix.de>, openbmc@lists.ozlabs.org, linuxppc-dev@lists.ozlabs.org, Vladimir Zapolskiy <vz@mleia.com>, Chris Packham <chris.packham@alliedtelesis.co.nz>, linux-mediatek@lists.infradead.org, linux-rpi-kernel@lists.infradead.org, Nick Hawkins <nick.hawkins@hpe.com>, Chunyan Zhang <zhang.lyra@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, linux-amlogic@lists.infradead.org, Qii Wang <qii.wang@mediatek.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Dong Aisheng <aisheng.dong@nxp.com>, Neil Armstrong <
 neil.armstrong@linaro.org>, Baolin Wang <baolin.wang@linux.alibaba.com>, Scott Branden <sbranden@broadcom.com>, Avi Fishman <avifishman70@gmail.com>, Patrick Venture <venture@google.com>, Nicolas Ferre <nicolas.ferre@microchip.com>, Oleksij Rempel <linux@rempel-privat.de>, linux-renesas-soc@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Laxman Dewangan <ldewangan@nvidia.com>, linux-actions@lists.infradead.org, Pengutronix Kernel Team <kernel@pengutronix.de>, Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber@suse.de>, Shawn Guo <shawnguo@kernel.org>, Claudiu Beznea <claudiu.beznea@microchip.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--17Pm2F6dlWUYnS2d
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 14, 2023 at 11:46:16AM -0600, Rob Herring wrote:
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

Applied to for-next, thanks!


--17Pm2F6dlWUYnS2d
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmTaTUIACgkQFA3kzBSg
KbZaIg//XMJpFp3VA+SvgguI2F+p7s5pQ1LhS3BPR9cxnpeb9QOe8vkSLthUd35o
9ImYsH82xfRxJL0/+gJ0axhPMMdC1Sf8wudKBxibLmYvlZnFyVXjzXPSjEbpuwjR
JjrM8toQVug/vn3nAiHwd3PMG/rtWFhfv/sGSb7IscOaQOtJ52qdGzJWFlU81blQ
4SXETUaeM+l3O10jJBpcL+WI/J5Gog31ORqi14hh4AMOO/GkEZrMBO1smByiPiGU
oOWPfXyBDmT6O9e3MTtn5TCtrDHdcWI/JHnpl1pyiEjBFV6GmjcA+Ra36+L7RwCc
1kIDHKc3OOLluAkbuZF+28s/SqDEXoued+TUfDTYtyR1PgqCDEM/W0G3pcfV49uM
41m2pavMgKoYY6FnGaaS5/qghLvKAzqn9X+JqpH0TzvTaS3rIZl6izdrCvauL1Cg
b+/wb9BUtfV3EgCUV0ruuvvlIgjGaBu9WW7vMPhmkfRMVjFTVgI+NTEIGfpDc8+i
OVluYvBPotiiUP/SYw6Gy8jqgZmVByWr5RsGu3b/1x8Sqq9ia8Jh66UaUUUhLSRW
MUoxnGxJb7gQTYQSv3q1ZDJJhHAhsTT1HMN5q7n3ueAXL1Ef3HmZ4Q/87YU5jJbn
nNHpy13KwdwzqPw2iKii9Ab8GWvWjN8siNfPM2GCJvEH2/TfoyY=
=PhdP
-----END PGP SIGNATURE-----

--17Pm2F6dlWUYnS2d--
