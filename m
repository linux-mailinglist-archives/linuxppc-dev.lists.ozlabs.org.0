Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 23725755EB1
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Jul 2023 10:45:34 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=JtWPLPlr;
	dkim=fail reason="signature verification failed" header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=SWiZ2ZAW;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R4Fz00Hd0z3bjK
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Jul 2023 18:45:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=JtWPLPlr;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=SWiZ2ZAW;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=kurt@linutronix.de; receiver=lists.ozlabs.org)
X-Greylist: delayed 374 seconds by postgrey-1.37 at boromir; Mon, 17 Jul 2023 16:49:58 AEST
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R4CPf2kwQz2yDp
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Jul 2023 16:49:58 +1000 (AEST)
From: Kurt Kanzenbach <kurt@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1689576217;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=uboJEUKSahjdAVYpA+pF5+aSJ07v5EaQ349H/nsSHfw=;
	b=JtWPLPlrsuM3RupOo5UUWtyEXwtzvhKqw/HW1UHwDOMmbBRQ/QmJZgZBjar4KOos/ATHBN
	FVeRzyNa7e5MqS/vQpfZt+vcENuhhxsj2My8mYiL4fphLiPMtlOU6HdcMsxDqnQ1sEhNQz
	NJjlbA026w0upxHlxBwNcBU5hgbd2qeeHGi0nDLJoGJyPHOkWNXGPfPEXK/lOb2QseiD0a
	MRWYBkNWwkdz+j+H/qEC6XJscdi2JmQUkd9yvuFLKjPWqIzPFXtt0KNjzN/rZhI15vxlNH
	DEVIwUHuNrU6jwJkdOWTM6D4LtFyGxEwGD5Hy8NKo36a44VqsUYSFgXDPqbH+A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1689576217;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=uboJEUKSahjdAVYpA+pF5+aSJ07v5EaQ349H/nsSHfw=;
	b=SWiZ2ZAWDV2WrTFAOBDomuHgk89Qm6iY5G2ULlukqd9M8oXoTTZbgD1XRFh7LF0KLB/zVm
	e5qJVtMqyKfxhiAQ==
To: Rob Herring <robh@kernel.org>, Dario Binacchi
 <dario.binacchi@amarulasolutions.com>, Wolfgang Grandegger
 <wg@grandegger.com>, Marc Kleine-Budde <mkl@pengutronix.de>, "David S.
 Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub
 Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Chandrasekar
 Ramakrishnan <rcsekar@samsung.com>, Chen-Yu Tsai <wens@csie.org>, Jernej
 Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>, Andrew Lunn
 <andrew@lunn.ch>, Vladimir Oltean <olteanv@gmail.com>, Woojung Huh
 <woojung.huh@microchip.com>, UNGLinuxDriver@microchip.com, =?utf-8?B?QXI=?=
 =?utf-8?B?xLFuw6cgw5xOQUw=?=
 <arinc.unal@arinc9.com>, Daniel Golle <daniel@makrotopia.org>, Landen Chao
 <Landen.Chao@mediatek.com>, DENG Qingfang <dqfext@gmail.com>, Sean Wang
 <sean.wang@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Cla
 udiu Manoil <claudiu.manoil@nxp.com>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, Linus Walleij <linus.walleij@linaro.org>,
 Alvin =?utf-8?Q?=C5=A0ipraga?= <alsi@bang-olufsen.dk>, George McCollister
 <george.mccollister@gmail.com>, Andreas Larsson <andreas@gaisler.com>,
 Iyappan Subramanian <iyappan@os.amperecomputing.com>, Keyur Chudgar
 <keyur@os.amperecomputing.com>, Chris Snook <chris.snook@gmail.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, Claudiu Beznea
 <claudiu.beznea@microchip.com>, Madalin Bucur <madalin.bucur@nxp.com>, Wei
 Fang <wei.fang@nxp.com>, Shenwei Wang <shenwei.wang@nxp.com>, Clark Wang
 <xiaoning.wang@nxp.com>, NXP Linux Team <linux-imx@nxp.com>, Sean Anderson
 <sean.anderson@seco.com>, Pantelis Antoniou <pantelis.antoniou@gmail.com>,
 Li Yang <leoyang.li@nxp.com>, Yisen Zhuang <yisen.zhuang@huawei.com>,
 Salil Mehta <salil.mehta@huawei.com>, Douglas Miller
 <dougmill@linux.ibm.com>, Marcin Wojtas <mw@semihalf.com>, Russell King
 <linux@armlinux.org.uk>, Tara s Chornyi <taras.chornyi@plvision.eu>, Mirko
 Lindner <mlindner@marvell.com>, Stephen Hemminger
 <stephen@networkplumber.org>, Felix Fietkau <nbd@nbd.name>, John Crispin
 <john@phrozen.org>, Mark Lee <Mark-MC.Lee@mediatek.com>, Lorenzo Bianconi
 <lorenzo@kernel.org>, Horatiu Vultur <horatiu.vultur@microchip.com>, Timur
 Tabi <timur@kernel.org>, Sergey Shtylyov <s.shtylyov@omp.ru>, Steve
 Glendinning <steve.glendinning@shawell.net>, Kunihiko Hayashi
 <hayashi.kunihiko@socionext.com>, Giuseppe Cavallaro
 <peppe.cavallaro@st.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer
 <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, Jerome
 Brunet <jbrunet@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, Vinod Ko ul <vkoul@kernel.org>,
 Bhupesh Sharma <bhupesh.sharma@linaro.org>, Emil Renner Berthing
 <kernel@esmil.dk>, Samin Guo <samin.guo@starfivetech.com>, Thierry Reding
 <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>,
 Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>, Grygorii Strashko
 <grygorii.strashko@ti.com>, Kevin Brace <kevinbrace@bracecomputerlab.com>,
 Francois Romieu <romieu@fr.zoreil.com>, Michal Simek
 <michal.simek@amd.com>, Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
 Alexander Aring <alex.aring@gmail.com>, Stefan Schmidt
 <stefan@datenfreihafen.org>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Alex Elder <elder@kernel.org>, =?utf-8?Q?Cl=C3=A9ment_L=C3=A9ger?=
 <clement.leger@bootlin.com>,
 Heiner Kallweit <hkallweit1@gmail.com>, SkyLake Huang
 <SkyLake.Huang@mediatek.com>, Kalle Valo <kvalo@kernel.org>, Loic Poulain
 <loic.poulain@linaro.org>, Ryder Lee <ryder.lee@mediatek.com>, Shayne Chen
 <shayne.chen@mediatek.com>, =?utf-8?B?SsOpcsO0bWU=?= Pouille r
 <jerome.pouiller@silabs.com>,
 Richard Cochran <richardcochran@gmail.com>
Subject: Re: [PATCH] net: Explicitly include correct DT includes
In-Reply-To: <20230714174809.4060885-1-robh@kernel.org>
References: <20230714174809.4060885-1-robh@kernel.org>
Date: Mon, 17 Jul 2023 08:43:32 +0200
Message-ID: <87r0p7597v.fsf@kurt>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"
X-Mailman-Approved-At: Mon, 17 Jul 2023 18:42:53 +1000
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
Cc: devicetree@vger.kernel.org, linux-omap@vger.kernel.org, linux-wireless@vger.kernel.org, netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org, ath10k@lists.infradead.org, linux-can@vger.kernel.org, linux-renesas-soc@vger.kernel.org, linux-wpan@vger.kernel.org, linux-mediatek@lists.infradead.org, ath11k@lists.infradead.org, wcn36xx@lists.infradead.org, linux-tegra@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-oxnas@groups.io, linuxppc-dev@lists.ozlabs.org, linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--=-=-=
Content-Type: text/plain

On Fri Jul 14 2023, Rob Herring wrote:
> The DT of_device.h and of_platform.h date back to the separate
> of_platform_bus_type before it as merged into the regular platform bus.
> As part of that merge prepping Arm DT support 13 years ago, they
> "temporarily" include each other. They also include platform_device.h
> and of.h. As a result, there's a pretty much random mix of those include
> files used throughout the tree. In order to detangle these headers and
> replace the implicit includes with struct declarations, users need to
> explicitly include the correct includes.
>
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---

[...]

>  drivers/net/dsa/hirschmann/hellcreek.c                  | 1 -
>  drivers/net/dsa/hirschmann/hellcreek_ptp.c              | 1 +

Acked-by: Kurt Kanzenbach <kurt@linutronix.de> # hellcreek

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQJHBAEBCgAxFiEEvLm/ssjDfdPf21mSwZPR8qpGc4IFAmS04xQTHGt1cnRAbGlu
dXRyb25peC5kZQAKCRDBk9HyqkZzgtQ+D/4rxLrP90HZoMklo1bSDPz4shsBjqNI
WnulP+nkfb+Qtwn8rBKcJezrFK9O6lJpYTq33kAJwEX/SE8b961KoY/V9s6ssagq
UBdww2O31sKDjd4MbmNjsULZi1BpRmVBJLaxkTQRy/i1JQlHN3rNZtQBT9ZPLcus
oYN4pegQ+WymkHI/KQtmFpPpTMNZjPn6ItB8g5uh6LFWgVIOZi5L13KC4mus7SFP
ujD3Fe0Y2ya/EOyjT4NpcS2IQjTacbYk/z/hB3fuFp0mW5l1X8TKVKz2zquZ01ef
armvD+bjs+3emvjNDs4/9yBd6kJ/4RHP6BkYJMWIHuYxxM62qOJvr3O6JV2FRKug
CKGvmYJBedVkf4RAEc1nQrMH8U4H8ktjYYUKsMp2JdQ5mrDI0xS5Mrfzf4vsonpe
OZXf5Z0CrehMlal4X5Y330gU0iVuZmUARGWKSGFmzWDV5A7vn3jubM8FqCJtiB0X
wD9w4pdsJ+jRp+35GluO4anayr9lDPU3w8Y+4KDmwafuzG2VUajeUSWmBxiDgGh9
6WB5lWsI0Oa+Llb6DzrALRkwXzJPDzZ7YULwb2v37sOq9xma8cce3W9N967on0bX
YcnqpBdEg3tncRq58oK9uDJtdggXzTSO7C78b09WvIa2l5G2JkaM77I/VXhGgvGt
BXSqDM8imlVRFg==
=8lun
-----END PGP SIGNATURE-----
--=-=-=--
