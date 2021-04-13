Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E9D735D4F0
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Apr 2021 03:47:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FK7ll2BB5z3bnM
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Apr 2021 11:47:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=lunn.ch
 (client-ip=185.16.172.187; helo=vps0.lunn.ch; envelope-from=andrew@lunn.ch;
 receiver=<UNKNOWN>)
Received: from vps0.lunn.ch (vps0.lunn.ch [185.16.172.187])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FK6cR0V4Zz2xYn
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Apr 2021 10:56:22 +1000 (AEST)
Received: from andrew by vps0.lunn.ch with local (Exim 4.94)
 (envelope-from <andrew@lunn.ch>)
 id 1lW7LN-00GOEl-SK; Tue, 13 Apr 2021 02:55:53 +0200
Date: Tue, 13 Apr 2021 02:55:53 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Michael Walle <michael@walle.cc>
Subject: Re: [PATCH net-next v4 1/2] of: net: pass the dst buffer to
 of_get_mac_address()
Message-ID: <YHTsGXbbr8mkifDo@lunn.ch>
References: <20210412174718.17382-1-michael@walle.cc>
 <20210412174718.17382-2-michael@walle.cc>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210412174718.17382-2-michael@walle.cc>
X-Mailman-Approved-At: Tue, 13 Apr 2021 11:47:28 +1000
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
Cc: Paul Mackerras <paulus@samba.org>,
 =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
 Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
 linux-stm32@st-md-mailman.stormreply.com, Jerome Brunet <jbrunet@baylibre.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Michal Simek <michal.simek@xilinx.com>, Jose Abreu <joabreu@synopsys.com>,
 NXP Linux Team <linux-imx@nxp.com>, Mark Lee <Mark-MC.Lee@mediatek.com>,
 Hauke Mehrtens <hauke@hauke-m.de>, Sascha Hauer <s.hauer@pengutronix.de>,
 Lorenzo Bianconi <lorenzo.bianconi83@gmail.com>, linux-omap@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Vladimir Oltean <olteanv@gmail.com>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 =?iso-8859-1?B?Suly9G1l?= Pouiller <jerome.pouiller@silabs.com>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Chris Snook <chris.snook@gmail.com>, Frank Rowand <frowand.list@gmail.com>,
 Gregory Clement <gregory.clement@bootlin.com>,
 Madalin Bucur <madalin.bucur@nxp.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Murali Karicheri <m-karicheri2@ti.com>, Yisen Zhuang <yisen.zhuang@huawei.com>,
 Alexandre Torgue <alexandre.torgue@st.com>, Wingman Kwok <w-kwok2@ti.com>,
 Sean Wang <sean.wang@mediatek.com>, Maxime Ripard <mripard@kernel.org>,
 Claudiu Manoil <claudiu.manoil@nxp.com>, linux-amlogic@lists.infradead.org,
 Kalle Valo <kvalo@codeaurora.org>, Mirko Lindner <mlindner@marvell.com>,
 Fugang Duan <fugang.duan@nxp.com>,
 Bryan Whitehead <bryan.whitehead@microchip.com>, ath9k-devel@qca.qualcomm.com,
 UNGLinuxDriver@microchip.com, Taras Chornyi <tchornyi@marvell.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Kevin Hilman <khilman@baylibre.com>, Heiner Kallweit <hkallweit1@gmail.com>,
 Andreas Larsson <andreas@gaisler.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Fabio Estevam <festevam@gmail.com>, Stanislaw Gruszka <stf_xl@wp.pl>,
 Florian Fainelli <f.fainelli@gmail.com>, linux-staging@lists.linux.dev,
 Chen-Yu Tsai <wens@csie.org>, bcm-kernel-feedback-list@broadcom.com,
 linux-arm-kernel@lists.infradead.org,
 Grygorii Strashko <grygorii.strashko@ti.com>, Byungho An <bh74.an@samsung.com>,
 Radhey Shyam Pandey <radhey.shyam.pandey@xilinx.com>,
 Vladimir Zapolskiy <vz@mleia.com>, John Crispin <john@phrozen.org>,
 Salil Mehta <salil.mehta@huawei.com>,
 Sergei Shtylyov <sergei.shtylyov@gmail.com>, linux-oxnas@groups.io,
 Shawn Guo <shawnguo@kernel.org>, "David S . Miller" <davem@davemloft.net>,
 Helmut Schaa <helmut.schaa@googlemail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-renesas-soc@vger.kernel.org, Ryder Lee <ryder.lee@mediatek.com>,
 Russell King <linux@armlinux.org.uk>, Vadym Kochan <vkochan@marvell.com>,
 Jakub Kicinski <kuba@kernel.org>, Vivien Didelot <vivien.didelot@gmail.com>,
 Sunil Goutham <sgoutham@marvell.com>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Jernej Skrabec <jernej.skrabec@siol.net>, netdev@vger.kernel.org,
 Nicolas Ferre <nicolas.ferre@microchip.com>, Li Yang <leoyang.li@nxp.com>,
 Stephen Hemminger <stephen@networkplumber.org>, Vinod Koul <vkoul@kernel.org>,
 Joyce Ooi <joyce.ooi@intel.com>, linuxppc-dev@lists.ozlabs.org,
 Felix Fietkau <nbd@nbd.name>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Apr 12, 2021 at 07:47:17PM +0200, Michael Walle wrote:
> of_get_mac_address() returns a "const void*" pointer to a MAC address.
> Lately, support to fetch the MAC address by an NVMEM provider was added.
> But this will only work with platform devices. It will not work with
> PCI devices (e.g. of an integrated root complex) and esp. not with DSA
> ports.
> 
> There is an of_* variant of the nvmem binding which works without
> devices. The returned data of a nvmem_cell_read() has to be freed after
> use. On the other hand the return of_get_mac_address() points to some
> static data without a lifetime. The trick for now, was to allocate a
> device resource managed buffer which is then returned. This will only
> work if we have an actual device.
> 
> Change it, so that the caller of of_get_mac_address() has to supply a
> buffer where the MAC address is written to. Unfortunately, this will
> touch all drivers which use the of_get_mac_address().
> 
> Usually the code looks like:
> 
>   const char *addr;
>   addr = of_get_mac_address(np);
>   if (!IS_ERR(addr))
>     ether_addr_copy(ndev->dev_addr, addr);
> 
> This can then be simply rewritten as:
> 
>   of_get_mac_address(np, ndev->dev_addr);
> 
> Sometimes is_valid_ether_addr() is used to test the MAC address.
> of_get_mac_address() already makes sure, it just returns a valid MAC
> address. Thus we can just test its return code. But we have to be
> careful if there are still other sources for the MAC address before the
> of_get_mac_address(). In this case we have to keep the
> is_valid_ether_addr() call.
> 
> The following coccinelle patch was used to convert common cases to the
> new style. Afterwards, I've manually gone over the drivers and fixed the
> return code variable: either used a new one or if one was already
> available use that. Mansour Moufid, thanks for that coccinelle patch!
> 
> <spml>
> @a@
> identifier x;
> expression y, z;
> @@
> - x = of_get_mac_address(y);
> + x = of_get_mac_address(y, z);
>   <...
> - ether_addr_copy(z, x);
>   ...>
> 
> @@
> identifier a.x;
> @@
> - if (<+... x ...+>) {}
> 
> @@
> identifier a.x;
> @@
>   if (<+... x ...+>) {
>       ...
>   }
> - else {}
> 
> @@
> identifier a.x;
> expression e;
> @@
> - if (<+... x ...+>@e)
> -     {}
> - else
> + if (!(e))
>       {...}
> 
> @@
> expression x, y, z;
> @@
> - x = of_get_mac_address(y, z);
> + of_get_mac_address(y, z);
>   ... when != x
> </spml>
> 
> All drivers, except drivers/net/ethernet/aeroflex/greth.c, were
> compile-time tested.
> 
> Suggested-by: Andrew Lunn <andrew@lunn.ch>
> Signed-off-by: Michael Walle <michael@walle.cc>

I cannot say i looked at all the changes, but the ones i did exam
seemed O.K.

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew
