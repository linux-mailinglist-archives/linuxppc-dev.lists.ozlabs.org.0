Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B56A636B25B
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Apr 2021 13:30:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FTN4c4ndlz3bc4
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Apr 2021 21:30:56 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=walle.cc header.i=@walle.cc header.a=rsa-sha256 header.s=mail2016061301 header.b=aBLItzwT;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=walle.cc (client-ip=2a01:4f8:151:8464::1:2;
 helo=ssl.serverraum.org; envelope-from=michael@walle.cc; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=walle.cc header.i=@walle.cc header.a=rsa-sha256
 header.s=mail2016061301 header.b=aBLItzwT; 
 dkim-atps=neutral
Received: from ssl.serverraum.org (ssl.serverraum.org
 [IPv6:2a01:4f8:151:8464::1:2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FTMGf4Lt3z2xdQ
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Apr 2021 20:54:34 +1000 (AEST)
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id C353C22236;
 Mon, 26 Apr 2021 12:54:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1619434464;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Wk++B/L7nejW/Tu85IzTL8HKq5haXmWBuSRGMq5G9Vc=;
 b=aBLItzwTpMLhnbBUfRwBioPVMyZiTU0Pj1H6UNIlRFQlCvrRQC9+sCwg7Wn5J+XsvHZln5
 Tw13ybstx1ba3ts9pwi2ty81rvOdnoEZ8zIsZqSHZ7psnqzBT46f85vFqJlTddaAXCPvqK
 P1t1rcsQHgB7iSTeBLTyQ5gE26gcAtQ=
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Mon, 26 Apr 2021 12:54:08 +0200
From: Michael Walle <michael@walle.cc>
To: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH net-next v4 2/2] of: net: fix of_get_mac_addr_nvmem() for
 non-platform devices
In-Reply-To: <CAL_JsqLrx6nFZrKiEtm2a1vDvQGG+FkpGtJCG2osM8hhGo3P=Q@mail.gmail.com>
References: <20210412174718.17382-1-michael@walle.cc>
 <20210412174718.17382-3-michael@walle.cc>
 <730d603b12e590c56770309b4df2bd668f7afbe3.camel@kernel.crashing.org>
 <8157eba9317609294da80472622deb28@walle.cc>
 <CAL_JsqLrx6nFZrKiEtm2a1vDvQGG+FkpGtJCG2osM8hhGo3P=Q@mail.gmail.com>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <108f268a35843368466004f7fe5f9f88@walle.cc>
X-Sender: michael@walle.cc
X-Mailman-Approved-At: Mon, 26 Apr 2021 21:30:07 +1000
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
Cc: Andrew Lunn <andrew@lunn.ch>, Paul Mackerras <paulus@samba.org>,
 =?UTF-8?Q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>,
 Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
 "moderated list:ARM/STM32
 ARCHITECTURE" <linux-stm32@st-md-mailman.stormreply.com>,
 Jerome Brunet <jbrunet@baylibre.com>, Neil Armstrong <narmstrong@baylibre.com>,
 Michal Simek <michal.simek@xilinx.com>, Jose Abreu <joabreu@synopsys.com>,
 NXP Linux Team <linux-imx@nxp.com>, Mark Lee <Mark-MC.Lee@mediatek.com>,
 Hauke Mehrtens <hauke@hauke-m.de>, Sascha Hauer <s.hauer@pengutronix.de>,
 Lorenzo Bianconi <lorenzo.bianconi83@gmail.com>,
 linux-omap <linux-omap@vger.kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-wireless <linux-wireless@vger.kernel.org>, linux-kernel@vger.kernel.org,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Vladimir Oltean <olteanv@gmail.com>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 =?UTF-8?Q?J=C3=A9r=C3=B4me_Pouiller?= <jerome.pouiller@silabs.com>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Chris Snook <chris.snook@gmail.com>, Frank Rowand <frowand.list@gmail.com>,
 Gregory Clement <gregory.clement@bootlin.com>,
 Madalin Bucur <madalin.bucur@nxp.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Murali Karicheri <m-karicheri2@ti.com>, Yisen Zhuang <yisen.zhuang@huawei.com>,
 Alexandre Torgue <alexandre.torgue@st.com>, Wingman Kwok <w-kwok2@ti.com>,
 Sean Wang <sean.wang@mediatek.com>, Maxime Ripard <mripard@kernel.org>,
 Claudiu Manoil <claudiu.manoil@nxp.com>, "open
 list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 Kalle Valo <kvalo@codeaurora.org>, Mirko Lindner <mlindner@marvell.com>,
 Fugang Duan <fugang.duan@nxp.com>,
 Bryan Whitehead <bryan.whitehead@microchip.com>,
 QCA ath9k Development <ath9k-devel@qca.qualcomm.com>,
 Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>,
 Taras Chornyi <tchornyi@marvell.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Kevin Hilman <khilman@baylibre.com>, Heiner Kallweit <hkallweit1@gmail.com>,
 Andreas Larsson <andreas@gaisler.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Fabio Estevam <festevam@gmail.com>, Stanislaw Gruszka <stf_xl@wp.pl>,
 Florian Fainelli <f.fainelli@gmail.com>, linux-staging@lists.linux.dev,
 Chen-Yu Tsai <wens@csie.org>,
 "maintainer:BROADCOM BCM7XXX ARM ARCHITECTURE"
 <bcm-kernel-feedback-list@broadcom.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Grygorii Strashko <grygorii.strashko@ti.com>, Byungho An <bh74.an@samsung.com>,
 Radhey Shyam Pandey <radhey.shyam.pandey@xilinx.com>,
 Vladimir Zapolskiy <vz@mleia.com>, John Crispin <john@phrozen.org>,
 Salil Mehta <salil.mehta@huawei.com>,
 Sergei Shtylyov <sergei.shtylyov@gmail.com>, linux-oxnas@groups.io,
 Shawn Guo <shawnguo@kernel.org>, "David S . Miller" <davem@davemloft.net>,
 Helmut Schaa <helmut.schaa@googlemail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "open list:MEDIA DRIVERS FOR RENESAS -
 FCP" <linux-renesas-soc@vger.kernel.org>, Ryder Lee <ryder.lee@mediatek.com>,
 Russell King <linux@armlinux.org.uk>, Vadym Kochan <vkochan@marvell.com>,
 Jakub Kicinski <kuba@kernel.org>, Vivien Didelot <vivien.didelot@gmail.com>,
 Sunil Goutham <sgoutham@marvell.com>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 devicetree@vger.kernel.org,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Jernej Skrabec <jernej.skrabec@siol.net>, netdev <netdev@vger.kernel.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, Li Yang <leoyang.li@nxp.com>,
 Stephen Hemminger <stephen@networkplumber.org>, Vinod Koul <vkoul@kernel.org>,
 Joyce Ooi <joyce.ooi@intel.com>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Felix Fietkau <nbd@nbd.name>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Am 2021-04-16 17:19, schrieb Rob Herring:
> On Fri, Apr 16, 2021 at 2:30 AM Michael Walle <michael@walle.cc> wrote:
>> 
>> Am 2021-04-16 05:24, schrieb Benjamin Herrenschmidt:
>> > On Mon, 2021-04-12 at 19:47 +0200, Michael Walle wrote:
>> >>
>> >>  /**
>> >>   * of_get_phy_mode - Get phy mode for given device_node
>> >> @@ -59,15 +60,39 @@ static int of_get_mac_addr(struct device_node *np,
>> >> const char *name, u8 *addr)
>> >>  static int of_get_mac_addr_nvmem(struct device_node *np, u8 *addr)
>> >>  {
>> >>         struct platform_device *pdev = of_find_device_by_node(np);
>> >> +       struct nvmem_cell *cell;
>> >> +       const void *mac;
>> >> +       size_t len;
>> >>         int ret;
>> >>
>> >> -       if (!pdev)
>> >> -               return -ENODEV;
>> >> +       /* Try lookup by device first, there might be a
>> >> nvmem_cell_lookup
>> >> +        * associated with a given device.
>> >> +        */
>> >> +       if (pdev) {
>> >> +               ret = nvmem_get_mac_address(&pdev->dev, addr);
>> >> +               put_device(&pdev->dev);
>> >> +               return ret;
>> >> +       }
>> >> +
>> >
>> > This smells like the wrong band aid :)
>> >
>> > Any struct device can contain an OF node pointer these days.
>> 
>> But not all nodes might have an associated device, see DSA for 
>> example.
> 
> I believe what Ben is saying and what I said earlier is going from dev
> -> OF node is right and OF node -> dev is wrong. If you only have an
> OF node, then use an of_* function.
> 
>> And as the name suggests of_get_mac_address() operates on a node. So
>> if a driver calls of_get_mac_address() it should work on the node. 
>> What
>> is wrong IMHO, is that the ethernet drivers where the corresponding
>> board
>> has a nvmem_cell_lookup registered is calling 
>> of_get_mac_address(node).
>> It should rather call eth_get_mac_address(dev) in the first place.
>> 
>> One would need to figure out if there is an actual device (with an
>> assiciated of_node), then call eth_get_mac_address(dev) and if there
>> isn't a device call of_get_mac_address(node).
> 
> Yes, I think we're all in agreement.
> 
>> But I don't know if that is easy to figure out. Well, one could start
>> with just the device where nvmem_cell_lookup is used. Then we could
>> drop the workaround above.
> 
> Start with the ones just passing dev.of_node directly:
> 
> $ git grep 'of_get_mac_address(.*of_node)'

[..]

Before I'll try to come up with a patch for this, I'd like to get
your opinion on it.

(1) replacing of_get_mac_address(node) with eth_get_mac_address(dev)
     might sometimes lead to confusing comments like in
     drivers/net/ethernet/allwinner/sun4i-emac.c:

     /* Read MAC-address from DT */
     ret = of_get_mac_address(np, ndev->dev_addr);

     Do we live with that or should the new name somehow reflect that
     it is taken from the device tree.

(2) What do you think of eth_get_mac_address(ndev). That is, the
     second argument is missing and ndev->dev_addr is used.
     I'm unsure about it. We'd still need a second function for drivers
     which don't write ndev->dev_addr directly, but have some custom
     logic in between. OTOH it would be like eth_hw_addr_random(ndev).

-michael
