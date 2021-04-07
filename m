Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BF1C335620A
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Apr 2021 05:43:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FFVbl5Brqz30Cr
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Apr 2021 13:43:15 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=pRLlQVTS;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=robh+dt@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=pRLlQVTS; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FFRH10S7Nz2ydJ
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  7 Apr 2021 11:13:32 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8F2FD613B7
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  7 Apr 2021 01:13:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617758008;
 bh=4wmgtd3m+Ta1X4jkV88q8R8S6J8R9xiITuF0Yr6xVvE=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=pRLlQVTSNNqQq6FWgIz2B7IVJb0WD4DcmH/q1OoNuEMrYaWQrNUQZE+TGHQqvO7uZ
 0sbEWPuyB8HyaAmOyOmuJUzxCmp1p115y8GLeeHMULg8c7AuvfXjx5Z564IDbK8lJq
 gmbN4+vm5P6n1CiJ0TfpP9EWDKvzUd31Ix6pvdON87LVzboxcqirc6EFlZYA+M4j8G
 jHfCtKJ3iJFDoh1b09Poyvm8SAkLWUaz66KIw278EYEG9sTTsgo5EgmZQ4PmQnu3Wd
 /7t4s6bK6dnu7hbZeox3JOJGIH6WZmQ5XIo2AS7KlPr83ACsPhjvDPLHQqqdmOaGvc
 LBaAPBKO1awEA==
Received: by mail-ej1-f53.google.com with SMTP id qo10so14481044ejb.6
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 06 Apr 2021 18:13:28 -0700 (PDT)
X-Gm-Message-State: AOAM5301krqlZpCPWtbyEnA50zLJyv3AJkBSrADAkeM0xJcs58jzW9OH
 6RAA4LMvw0TFZevEDAVVGMWgcsNuc5bEiPSnfQ==
X-Google-Smtp-Source: ABdhPJzl6RD27BOpLC9b+ksVgecIqSPzz04cn67QiZn3u6NF8pL8OvwlE6sLhJddWpFdEonXi5GuOvvWMqx7AYRmDLw=
X-Received: by 2002:a17:906:1984:: with SMTP id
 g4mr847605ejd.525.1617758006930; 
 Tue, 06 Apr 2021 18:13:26 -0700 (PDT)
MIME-Version: 1.0
References: <20210405164643.21130-1-michael@walle.cc>
 <20210405164643.21130-3-michael@walle.cc>
In-Reply-To: <20210405164643.21130-3-michael@walle.cc>
From: Rob Herring <robh+dt@kernel.org>
Date: Tue, 6 Apr 2021 20:13:15 -0500
X-Gmail-Original-Message-ID: <CAL_JsqKbxY5sCJ_8F7iF0hFr52cwRsSc2bu48H7cqcNeWytDpA@mail.gmail.com>
Message-ID: <CAL_JsqKbxY5sCJ_8F7iF0hFr52cwRsSc2bu48H7cqcNeWytDpA@mail.gmail.com>
Subject: Re: [PATCH 2/2] of: net: fix of_get_mac_addr_nvmem() for PCI and DSA
 nodes
To: Michael Walle <michael@walle.cc>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Wed, 07 Apr 2021 13:42:52 +1000
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

On Mon, Apr 5, 2021 at 11:47 AM Michael Walle <michael@walle.cc> wrote:
>
> of_get_mac_address() already supports fetching the MAC address by an
> nvmem provider. But until now, it was just working for platform devices.
> Esp. it was not working for DSA ports and PCI devices. It gets more
> common that PCI devices have a device tree binding since SoCs contain
> integrated root complexes.
>
> Use the nvmem of_* binding to fetch the nvmem cells by a struct
> device_node. We still have to try to read the cell by device first
> because there might be a nvmem_cell_lookup associated with that device.
>
> Signed-off-by: Michael Walle <michael@walle.cc>
> ---
> Please note, that I've kept the nvmem_get_mac_address() which operates
> on a device. The new of_get_mac_addr_nvmem() is almost identical and
> there are no users of the former function right now, but it seems to be
> the "newer" version to get the MAC address for a "struct device". Thus
> I've kept it. Please advise, if I should kill it though.

It seems kind of backwards from how we normally design this type of
API where the API with a struct device will call a firmware specific
version if there's a firmware handle. But certainly, I don't think we
should be operating on platform device if we can help it.

>  drivers/of/of_net.c | 37 +++++++++++++++++++++++++++++++------
>  1 file changed, 31 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/of/of_net.c b/drivers/of/of_net.c
> index 2344ad7fff5e..2323c6063eaf 100644
> --- a/drivers/of/of_net.c
> +++ b/drivers/of/of_net.c
> @@ -11,6 +11,7 @@
>  #include <linux/phy.h>
>  #include <linux/export.h>
>  #include <linux/device.h>
> +#include <linux/nvmem-consumer.h>
>
>  /**
>   * of_get_phy_mode - Get phy mode for given device_node
> @@ -56,18 +57,42 @@ static int of_get_mac_addr(struct device_node *np, const char *name, u8 *addr)
>         return -ENODEV;
>  }
>
> -static int of_get_mac_addr_nvmem(struct device_node *np, u8 addr)
> +static int of_get_mac_addr_nvmem(struct device_node *np, u8 *addr)
>  {
>         struct platform_device *pdev = of_find_device_by_node(np);
> +       struct nvmem_cell *cell;
> +       const void *mac;
> +       size_t len;
>         int ret;
>
> -       if (!pdev)
> -               return -ENODEV;
> +       /* Try lookup by device first, there might be a nvmem_cell_lookup
> +        * associated with a given device.
> +        */
> +       if (pdev) {
> +               ret = nvmem_get_mac_address(&pdev->dev, addr);
> +               put_device(&pdev->dev);
> +               return ret;
> +       }
> +
> +       cell = of_nvmem_cell_get(np, "mac-address");
> +       if (IS_ERR(cell))
> +               return PTR_ERR(cell);
> +
> +       mac = nvmem_cell_read(cell, &len);
> +       nvmem_cell_put(cell);
> +
> +       if (IS_ERR(mac))
> +               return PTR_ERR(mac);
> +
> +       if (len != ETH_ALEN || !is_valid_ether_addr(mac)) {
> +               kfree(mac);
> +               return -EINVAL;
> +       }
>
> -       ret = nvmem_get_mac_address(&pdev->dev, addr);
> -       put_device(&pdev->dev);
> +       ether_addr_copy(addr, mac);
> +       kfree(mac);
>
> -       return ret;
> +       return 0;
>  }
>
>  /**
> --
> 2.20.1
>
