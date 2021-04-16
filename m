Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A956362C88
	for <lists+linuxppc-dev@lfdr.de>; Sat, 17 Apr 2021 03:01:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FMZX52BBDz3cBF
	for <lists+linuxppc-dev@lfdr.de>; Sat, 17 Apr 2021 11:01:09 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Uf7m8Z8p;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=robh+dt@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Uf7m8Z8p; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FMKdS0C63z301B
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 17 Apr 2021 01:19:56 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPSA id E56786101E
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Apr 2021 15:19:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1618586392;
 bh=pSsgz6SFE9awjWhpCd9doKdNFULnoUddJE0eDHwlPEw=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Uf7m8Z8ptnraoZ51IQdKXyFPpb17ObjRbvh/tgHJQQ5o+ciQAAcW4tbcnun59sBJX
 Ov85d36wXd57lDyw06gGeyqcFbb5FjxK1gFC7Qrxt0siWMpBPxslLI1Ib7jRn6v++F
 cAmJS6suNmYyLsln2n1OJnlvyXwMidQQNjPAbPQs7MfkhM0fJUKSB+nyMr8L4qzQud
 HTwRuAwiftEcwCLZDIRxIKUVRJ/SoYxXJ/sWW/PMvfAdr8QdP7WvJBtbdVkTfMRnMB
 pphfcPjJEo4hhDegHATnmlmSQaHF3XNmwJ/bD1K3yRsXX8ChKcHmEOFBr928TWvaEy
 TDNKkp8iMeOHg==
Received: by mail-qv1-f46.google.com with SMTP id i9so13411166qvo.3
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Apr 2021 08:19:52 -0700 (PDT)
X-Gm-Message-State: AOAM533q/H23BgRSfOOpCoTjCY0ihbfM/jp1XeXaxc3CjIgC+xxXwMm7
 e7HTeRTreazbkDZ9hSod7ZuJz16zGGSN0W2W+A==
X-Google-Smtp-Source: ABdhPJwFV5j0PpR0OOvbKTHrtQGM0/UHlnjLPz7IjIHFauq3IAwfsuj1+lSbzphYfDXiggRtdMYLzMTYnQvOIyCHQj8=
X-Received: by 2002:ad4:5a07:: with SMTP id ei7mr8951384qvb.50.1618586391992; 
 Fri, 16 Apr 2021 08:19:51 -0700 (PDT)
MIME-Version: 1.0
References: <20210412174718.17382-1-michael@walle.cc>
 <20210412174718.17382-3-michael@walle.cc>
 <730d603b12e590c56770309b4df2bd668f7afbe3.camel@kernel.crashing.org>
 <8157eba9317609294da80472622deb28@walle.cc>
In-Reply-To: <8157eba9317609294da80472622deb28@walle.cc>
From: Rob Herring <robh+dt@kernel.org>
Date: Fri, 16 Apr 2021 10:19:40 -0500
X-Gmail-Original-Message-ID: <CAL_JsqLrx6nFZrKiEtm2a1vDvQGG+FkpGtJCG2osM8hhGo3P=Q@mail.gmail.com>
Message-ID: <CAL_JsqLrx6nFZrKiEtm2a1vDvQGG+FkpGtJCG2osM8hhGo3P=Q@mail.gmail.com>
Subject: Re: [PATCH net-next v4 2/2] of: net: fix of_get_mac_addr_nvmem() for
 non-platform devices
To: Michael Walle <michael@walle.cc>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Sat, 17 Apr 2021 11:00:18 +1000
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
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
 Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
 "moderated list:ARM/STM32 ARCHITECTURE"
 <linux-stm32@st-md-mailman.stormreply.com>,
 Jerome Brunet <jbrunet@baylibre.com>, Neil Armstrong <narmstrong@baylibre.com>,
 Michal Simek <michal.simek@xilinx.com>, Jose Abreu <joabreu@synopsys.com>,
 NXP Linux Team <linux-imx@nxp.com>, Mark Lee <Mark-MC.Lee@mediatek.com>,
 Hauke Mehrtens <hauke@hauke-m.de>, Sascha Hauer <s.hauer@pengutronix.de>,
 Lorenzo Bianconi <lorenzo.bianconi83@gmail.com>,
 linux-omap <linux-omap@vger.kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-wireless <linux-wireless@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Vladimir Oltean <olteanv@gmail.com>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 =?UTF-8?B?SsOpcsO0bWUgUG91aWxsZXI=?= <jerome.pouiller@silabs.com>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Chris Snook <chris.snook@gmail.com>, Frank Rowand <frowand.list@gmail.com>,
 Gregory Clement <gregory.clement@bootlin.com>,
 Madalin Bucur <madalin.bucur@nxp.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Murali Karicheri <m-karicheri2@ti.com>, Yisen Zhuang <yisen.zhuang@huawei.com>,
 Alexandre Torgue <alexandre.torgue@st.com>, Wingman Kwok <w-kwok2@ti.com>,
 Sean Wang <sean.wang@mediatek.com>, Maxime Ripard <mripard@kernel.org>,
 Claudiu Manoil <claudiu.manoil@nxp.com>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
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
 "open list:MEDIA DRIVERS FOR RENESAS - FCP"
 <linux-renesas-soc@vger.kernel.org>, Ryder Lee <ryder.lee@mediatek.com>,
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

On Fri, Apr 16, 2021 at 2:30 AM Michael Walle <michael@walle.cc> wrote:
>
> Am 2021-04-16 05:24, schrieb Benjamin Herrenschmidt:
> > On Mon, 2021-04-12 at 19:47 +0200, Michael Walle wrote:
> >>
> >>  /**
> >>   * of_get_phy_mode - Get phy mode for given device_node
> >> @@ -59,15 +60,39 @@ static int of_get_mac_addr(struct device_node *np,
> >> const char *name, u8 *addr)
> >>  static int of_get_mac_addr_nvmem(struct device_node *np, u8 *addr)
> >>  {
> >>         struct platform_device *pdev = of_find_device_by_node(np);
> >> +       struct nvmem_cell *cell;
> >> +       const void *mac;
> >> +       size_t len;
> >>         int ret;
> >>
> >> -       if (!pdev)
> >> -               return -ENODEV;
> >> +       /* Try lookup by device first, there might be a
> >> nvmem_cell_lookup
> >> +        * associated with a given device.
> >> +        */
> >> +       if (pdev) {
> >> +               ret = nvmem_get_mac_address(&pdev->dev, addr);
> >> +               put_device(&pdev->dev);
> >> +               return ret;
> >> +       }
> >> +
> >
> > This smells like the wrong band aid :)
> >
> > Any struct device can contain an OF node pointer these days.
>
> But not all nodes might have an associated device, see DSA for example.

I believe what Ben is saying and what I said earlier is going from dev
-> OF node is right and OF node -> dev is wrong. If you only have an
OF node, then use an of_* function.

> And as the name suggests of_get_mac_address() operates on a node. So
> if a driver calls of_get_mac_address() it should work on the node. What
> is wrong IMHO, is that the ethernet drivers where the corresponding
> board
> has a nvmem_cell_lookup registered is calling of_get_mac_address(node).
> It should rather call eth_get_mac_address(dev) in the first place.
>
> One would need to figure out if there is an actual device (with an
> assiciated of_node), then call eth_get_mac_address(dev) and if there
> isn't a device call of_get_mac_address(node).

Yes, I think we're all in agreement.

> But I don't know if that is easy to figure out. Well, one could start
> with just the device where nvmem_cell_lookup is used. Then we could
> drop the workaround above.

Start with the ones just passing dev.of_node directly:

$ git grep 'of_get_mac_address(.*of_node)'
drivers/net/ethernet/aeroflex/greth.c:          addr =
of_get_mac_address(ofdev->dev.of_node);
drivers/net/ethernet/altera/altera_tse_main.c:  macaddr =
of_get_mac_address(pdev->dev.of_node);
drivers/net/ethernet/arc/emac_main.c:   mac_addr =
of_get_mac_address(dev->of_node);
drivers/net/ethernet/broadcom/bgmac-bcma.c:             mac =
of_get_mac_address(bgmac->dev->of_node);
drivers/net/ethernet/cavium/octeon/octeon_mgmt.c:       mac =
of_get_mac_address(pdev->dev.of_node);
drivers/net/ethernet/ethoc.c:           mac =
of_get_mac_address(pdev->dev.of_node);
drivers/net/ethernet/ezchip/nps_enet.c: mac_addr =
of_get_mac_address(dev->of_node);
drivers/net/ethernet/freescale/fs_enet/fs_enet-main.c:  mac_addr =
of_get_mac_address(ofdev->dev.of_node);
drivers/net/ethernet/marvell/pxa168_eth.c:              mac_addr =
of_get_mac_address(pdev->dev.of_node);
drivers/net/ethernet/marvell/sky2.c:    iap =
of_get_mac_address(hw->pdev->dev.of_node);
drivers/net/ethernet/mediatek/mtk_eth_soc.c:    mac_addr =
of_get_mac_address(mac->of_node);
drivers/net/ethernet/microchip/lan743x_main.c:  mac_addr =
of_get_mac_address(pdev->dev.of_node);
drivers/net/ethernet/qualcomm/qca_spi.c:        mac =
of_get_mac_address(spi->dev.of_node);
drivers/net/ethernet/qualcomm/qca_uart.c:       mac =
of_get_mac_address(serdev->dev.of_node);
drivers/net/ethernet/wiznet/w5100-spi.c:        const void *mac =
of_get_mac_address(spi->dev.of_node);
drivers/net/ethernet/xilinx/xilinx_axienet_main.c:      mac_addr =
of_get_mac_address(pdev->dev.of_node);
drivers/net/ethernet/xilinx/xilinx_emaclite.c:  mac_address =
of_get_mac_address(ofdev->dev.of_node);
drivers/net/wireless/ralink/rt2x00/rt2x00dev.c: mac_addr =
of_get_mac_address(rt2x00dev->dev->of_node);
drivers/staging/octeon/ethernet.c:              mac =
of_get_mac_address(priv->of_node);
drivers/staging/wfx/main.c:             macaddr =
of_get_mac_address(wdev->dev->of_node);
net/ethernet/eth.c:             addr = of_get_mac_address(dev->of_node);

Then this will find most of the rest:
git grep -W 'of_get_mac_address([a-z]*)'| grep -E '(node|np)'

Rob
