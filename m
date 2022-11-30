Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 32FEA63E5B4
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Dec 2022 00:46:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NMwp70NF5z3fKv
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Dec 2022 10:46:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=sntech.de (client-ip=185.11.138.130; helo=gloria.sntech.de; envelope-from=heiko@sntech.de; receiver=<UNKNOWN>)
X-Greylist: delayed 1393 seconds by postgrey-1.36 at boromir; Thu, 01 Dec 2022 06:04:17 AEDT
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NMpXd189Bz3bWN
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Dec 2022 06:04:14 +1100 (AEDT)
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1p0S0E-0003wh-HH; Wed, 30 Nov 2022 19:40:14 +0100
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Vladimir Oltean <vladimir.oltean@nxp.com>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, soc@kernel.org, "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@bootlin.com>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Russell King <linux@armlinux.org.uk>, Nicolas Ferre <nicolas.ferre@microchip.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@microchip.com>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Florian Fainelli <f.fainelli@gmail.com>, Hauke Mehrtens <hauke@hauke-m.de>, =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>, Hans Ulli Kroll <ulli.kroll@googlemail.com>, Linus Walle
 ij <linus.walleij@linaro.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, Matthias Brugger <matthias.bgg@gmail.com>, Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@somainline.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, Stefan Agner <stefan@agner.ch>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, =?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>, Sergio Paracuellos <sergio.paracuellos@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, Tim Harvey
  <tharvey@gateworks.com>, Peng Fan <peng.fan@nxp.com>, Rasmus Villemoes <rasmus.villemoes@prevas.dk>, Frank Wunderlich <frank-w@public-files.de>, Michael Riesch <michael.riesch@wolfvision.net>, Oleksij Rempel <linux@rempel-privat.de>, =?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
Subject: Re: [PATCH 3/5] arm64: dts: remove label = "cpu" from DSA dt-binding
Date: Wed, 30 Nov 2022 19:40:12 +0100
Message-ID: <5443335.kQq0lBPeGt@diego>
In-Reply-To: <20221130141040.32447-4-arinc.unal@arinc9.com>
References: <20221130141040.32447-1-arinc.unal@arinc9.com> <20221130141040.32447-4-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Thu, 01 Dec 2022 10:32:49 +1100
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
Cc: devicetree@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev, linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org, linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Am Mittwoch, 30. November 2022, 15:10:38 CET schrieb Ar=C4=B1n=C3=A7 =C3=9C=
NAL:
> This is not used by the DSA dt-binding, so remove it from all devicetrees.
>=20
> Signed-off-by: Ar=C4=B1n=C3=A7 =C3=9CNAL <arinc.unal@arinc9.com>
> ---

> diff --git a/arch/arm64/boot/dts/rockchip/rk3568-bpi-r2-pro.dts b/arch/ar=
m64/boot/dts/rockchip/rk3568-bpi-r2-pro.dts
> index c282f6e79960..b71162d65d2e 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3568-bpi-r2-pro.dts
> +++ b/arch/arm64/boot/dts/rockchip/rk3568-bpi-r2-pro.dts
> @@ -552,7 +552,6 @@ port@4 {
> =20
>  			port@5 {
>  				reg =3D <5>;
> -				label =3D "cpu";
>  				ethernet =3D <&gmac0>;
>  				phy-mode =3D "rgmii";
> =20
>=20

Rockchip-part:
Acked-by: Heiko Stuebner <heiko@sntech.de>


