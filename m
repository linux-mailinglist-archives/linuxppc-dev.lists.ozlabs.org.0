Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F3C7E35620C
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Apr 2021 05:43:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FFVcF73rJz3bpy
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Apr 2021 13:43:41 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=CIChkHRr;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52b;
 helo=mail-pg1-x52b.google.com; envelope-from=f.fainelli@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=CIChkHRr; dkim-atps=neutral
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com
 [IPv6:2607:f8b0:4864:20::52b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FFS0259PLz2xg0
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  7 Apr 2021 11:45:37 +1000 (AEST)
Received: by mail-pg1-x52b.google.com with SMTP id p12so7795455pgj.10
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 06 Apr 2021 18:45:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=w25lwMo3bZrfNfXLpALA+4I29YoJZak3FyajA6HeC94=;
 b=CIChkHRrI3lQGQaVgR3g6LW6mtE7yO24xnIbA3eBb2OBsSB2LpEOsEMe8qhA6ppB4/
 GFg8WBsRxrdBL+opf48EhryRN/JKtLSyUf8TtU4rVTRQa0D+2XsyLYjF95V4ZrkFFl1U
 5mLtoliRkEQSihgjqgixl9vUQ0ZABFHT2oc60rmHwJ60bV8gTNkz1J4AlAZwO+5B+DuQ
 +5lul+5kAwz6HwmSJjNChHm4+EocR2sBxC3baPIbPs036zqFQh7Ew01atfiMB7d3C/Ow
 PUNTNMFbHGoK1bfa8ixotxlbsKJ3STRzqpF8jldPfQ8ke/3eiY6H4rtWu1h0K8XYB2Vv
 rgqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=w25lwMo3bZrfNfXLpALA+4I29YoJZak3FyajA6HeC94=;
 b=I0EDKyYBdhCyUiWL6NiDa7T/ZsUWTs6f7AfyUmJI86u3vyl7POyXNKvr/LPDPYJVxw
 8rG1mo3J0uHW361Ktf0+XXULYonOu/e11MUOWnJgCYsYmR9gf/nRcRSy73OoRGozsfVX
 kgbk2LtN08z4NXiqILIzLH9JRm6+7E9yczVJJ7usRo+x/wwmucHw5Z9VHy93zyz5zPMd
 PQ81dVYG5Z8OEbCVwVsZ7J5rvIgjJwxuBgMLeSUCjrdGBPNfsh6ocb8vKTgGF/uWZT17
 H6isHoJl76uXNOt11SvsdyhI+OtxX+XlEuRNRgZtzX0YQPUI0SZCvMcG+kFqqW96seJG
 6gsA==
X-Gm-Message-State: AOAM5326kHYiWif7NsXWCMC+tifGpvN8xXDnEdim/Helj47FvJCrEexG
 +8Lm4ir1r62onmDwhTFcbNE=
X-Google-Smtp-Source: ABdhPJyjkdVdAMZsiQs6PYIHXwhXVO+uLzcp0Xe8vbkVPgJP52Fozx3Xafo1rzDkv0TO669OyIEiUA==
X-Received: by 2002:a63:fb12:: with SMTP id o18mr948658pgh.438.1617759935548; 
 Tue, 06 Apr 2021 18:45:35 -0700 (PDT)
Received: from [10.230.29.202] ([192.19.223.252])
 by smtp.gmail.com with ESMTPSA id o13sm20193959pgv.40.2021.04.06.18.45.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Apr 2021 18:45:34 -0700 (PDT)
Subject: Re: [PATCH net-next v3 2/2] of: net: fix of_get_mac_addr_nvmem() for
 PCI and DSA nodes
To: Michael Walle <michael@walle.cc>, ath9k-devel@qca.qualcomm.com,
 UNGLinuxDriver@microchip.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 netdev@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-renesas-soc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-amlogic@lists.infradead.org, linux-oxnas@groups.io,
 linux-omap@vger.kernel.org, linux-wireless@vger.kernel.org,
 devicetree@vger.kernel.org, linux-staging@lists.linux.dev
References: <20210406220921.24313-1-michael@walle.cc>
 <20210406220921.24313-3-michael@walle.cc>
From: Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <70b649a4-4b1f-3e95-a6b9-23a00bbaf122@gmail.com>
Date: Tue, 6 Apr 2021 18:45:26 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210406220921.24313-3-michael@walle.cc>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: Andrew Lunn <andrew@lunn.ch>,
 =?UTF-8?B?SsOpcsO0bWUgUG91aWxsZXI=?= <jerome.pouiller@silabs.com>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Andreas Larsson <andreas@gaisler.com>, Rob Herring <robh+dt@kernel.org>,
 Michal Simek <michal.simek@xilinx.com>,
 Lorenzo Bianconi <lorenzo.bianconi83@gmail.com>,
 Paul Mackerras <paulus@samba.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
 Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
 Li Yang <leoyang.li@nxp.com>, Fabio Estevam <festevam@gmail.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Stephen Hemminger <stephen@networkplumber.org>,
 Florian Fainelli <f.fainelli@gmail.com>, Frank Rowand <frowand.list@gmail.com>,
 Vivien Didelot <vivien.didelot@gmail.com>,
 Gregory Clement <gregory.clement@bootlin.com>,
 Madalin Bucur <madalin.bucur@nxp.com>, Russell King <linux@armlinux.org.uk>,
 Neil Armstrong <narmstrong@baylibre.com>, Wingman Kwok <w-kwok2@ti.com>,
 Chen-Yu Tsai <wens@csie.org>, Jose Abreu <joabreu@synopsys.com>,
 bcm-kernel-feedback-list@broadcom.com, NXP Linux Team <linux-imx@nxp.com>,
 Chris Snook <chris.snook@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Radhey Shyam Pandey <radhey.shyam.pandey@xilinx.com>,
 Yisen Zhuang <yisen.zhuang@huawei.com>, Mark Lee <Mark-MC.Lee@mediatek.com>,
 Sunil Goutham <sgoutham@marvell.com>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Grygorii Strashko <grygorii.strashko@ti.com>, Byungho An <bh74.an@samsung.com>,
 Alexandre Torgue <alexandre.torgue@st.com>, Stanislaw Gruszka <stf_xl@wp.pl>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Hauke Mehrtens <hauke@hauke-m.de>, Sascha Hauer <s.hauer@pengutronix.de>,
 Sean Wang <sean.wang@mediatek.com>, Salil Mehta <salil.mehta@huawei.com>,
 Maxime Ripard <mripard@kernel.org>, Vladimir Zapolskiy <vz@mleia.com>,
 Claudiu Manoil <claudiu.manoil@nxp.com>, Ryder Lee <ryder.lee@mediatek.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Murali Karicheri <m-karicheri2@ti.com>, John Crispin <john@phrozen.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Kalle Valo <kvalo@codeaurora.org>, Mirko Lindner <mlindner@marvell.com>,
 Jernej Skrabec <jernej.skrabec@siol.net>, Vladimir Oltean <olteanv@gmail.com>,
 Fugang Duan <fugang.duan@nxp.com>, Vadym Kochan <vkochan@marvell.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Bryan Whitehead <bryan.whitehead@microchip.com>,
 Helmut Schaa <helmut.schaa@googlemail.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 "David S . Miller" <davem@davemloft.net>, Taras Chornyi <tchornyi@marvell.com>,
 Vinod Koul <vkoul@kernel.org>, Sergei Shtylyov <sergei.shtylyov@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Joyce Ooi <joyce.ooi@intel.com>,
 Heiner Kallweit <hkallweit1@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
 Claudiu Beznea <claudiu.beznea@microchip.com>, Felix Fietkau <nbd@nbd.name>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 4/6/2021 3:09 PM, Michael Walle wrote:
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

Nit: if you need to resubmit you could rephrase the subject such that
the limitation of of_get_mac_addr_nvmem() is lifted to include all kinds
of devices, and no longer just platform_device instances as before.
-- 
Florian
