Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A874E361BBB
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Apr 2021 10:53:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FM93T4hQPz3c06
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Apr 2021 18:53:25 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=walle.cc header.i=@walle.cc header.a=rsa-sha256 header.s=mail2016061301 header.b=EUtjzMP9;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=walle.cc (client-ip=176.9.125.105; helo=ssl.serverraum.org;
 envelope-from=michael@walle.cc; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=walle.cc header.i=@walle.cc header.a=rsa-sha256
 header.s=mail2016061301 header.b=EUtjzMP9; 
 dkim-atps=neutral
Received: from ssl.serverraum.org (ssl.serverraum.org [176.9.125.105])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FM7Ch11WFz2yjL
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Apr 2021 17:30:21 +1000 (AEST)
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 49EE022172;
 Fri, 16 Apr 2021 09:29:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1618558211;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PbMduC+y8U2TnYB1yFy6DIbM598uMx2+jq28dZXHweQ=;
 b=EUtjzMP9GqVLqpUQjKAWkwn0o1sw8EWtxSv8YMRSVD0469vqt05Io1/SVJgobjz7HB/r6y
 Vjk/Jn7gR9cbQkm/qxqSnOY+yQWCWcha3iHS/TQBkEhMmvcdPKJxGg9UyvHCIIkZANcb/g
 63rLgVagJ+mEmiydqQVNecyvEgF/m50=
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Fri, 16 Apr 2021 09:29:59 +0200
From: Michael Walle <michael@walle.cc>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Subject: Re: [PATCH net-next v4 2/2] of: net: fix of_get_mac_addr_nvmem() for
 non-platform devices
In-Reply-To: <730d603b12e590c56770309b4df2bd668f7afbe3.camel@kernel.crashing.org>
References: <20210412174718.17382-1-michael@walle.cc>
 <20210412174718.17382-3-michael@walle.cc>
 <730d603b12e590c56770309b4df2bd668f7afbe3.camel@kernel.crashing.org>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <8157eba9317609294da80472622deb28@walle.cc>
X-Sender: michael@walle.cc
X-Mailman-Approved-At: Fri, 16 Apr 2021 18:53:01 +1000
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
 linux-stm32@st-md-mailman.stormreply.com, Jerome Brunet <jbrunet@baylibre.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Michal Simek <michal.simek@xilinx.com>, Jose Abreu <joabreu@synopsys.com>,
 NXP Linux Team <linux-imx@nxp.com>, Mark Lee <Mark-MC.Lee@mediatek.com>,
 Vadym Kochan <vkochan@marvell.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Lorenzo Bianconi <lorenzo.bianconi83@gmail.com>, linux-omap@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Vladimir Oltean <olteanv@gmail.com>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 =?UTF-8?Q?J=C3=A9r=C3=B4me?= =?UTF-8?Q?_Pouiller?=
 <jerome.pouiller@silabs.com>,
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
 Russell King <linux@armlinux.org.uk>, Hauke Mehrtens <hauke@hauke-m.de>,
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

Am 2021-04-16 05:24, schrieb Benjamin Herrenschmidt:
> On Mon, 2021-04-12 at 19:47 +0200, Michael Walle wrote:
>> 
>>  /**
>>   * of_get_phy_mode - Get phy mode for given device_node
>> @@ -59,15 +60,39 @@ static int of_get_mac_addr(struct device_node *np, 
>> const char *name, u8 *addr)
>>  static int of_get_mac_addr_nvmem(struct device_node *np, u8 *addr)
>>  {
>>         struct platform_device *pdev = of_find_device_by_node(np);
>> +       struct nvmem_cell *cell;
>> +       const void *mac;
>> +       size_t len;
>>         int ret;
>> 
>> -       if (!pdev)
>> -               return -ENODEV;
>> +       /* Try lookup by device first, there might be a 
>> nvmem_cell_lookup
>> +        * associated with a given device.
>> +        */
>> +       if (pdev) {
>> +               ret = nvmem_get_mac_address(&pdev->dev, addr);
>> +               put_device(&pdev->dev);
>> +               return ret;
>> +       }
>> +
> 
> This smells like the wrong band aid :)
> 
> Any struct device can contain an OF node pointer these days.

But not all nodes might have an associated device, see DSA for example.
And as the name suggests of_get_mac_address() operates on a node. So
if a driver calls of_get_mac_address() it should work on the node. What
is wrong IMHO, is that the ethernet drivers where the corresponding 
board
has a nvmem_cell_lookup registered is calling of_get_mac_address(node).
It should rather call eth_get_mac_address(dev) in the first place.

One would need to figure out if there is an actual device (with an
assiciated of_node), then call eth_get_mac_address(dev) and if there
isn't a device call of_get_mac_address(node).

But I don't know if that is easy to figure out. Well, one could start
with just the device where nvmem_cell_lookup is used. Then we could
drop the workaround above.

> This seems all backwards. I think we are dealing with bad evolution.
> 
> We need to do a lookup for the device because we get passed an of_node.
> We should just get passed a device here... or rather stop calling
> of_get_mac_addr() from all those drivers and instead call
> eth_platform_get_mac_address() which in turns calls of_get_mac_addr().
> 
> Then the nvmem stuff gets put in eth_platform_get_mac_address().
> 
> of_get_mac_addr() becomes a low-level thingy that most drivers don't
> care about.

The NVMEM thing is just another (optional) way how the MAC address
is fetched from the device tree. Thus, if the drivers have the
of_get_mac_address() call they should automatically get the NVMEM
method, too.

-michael
