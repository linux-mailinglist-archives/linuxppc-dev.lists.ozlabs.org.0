Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C9D135E8C5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Apr 2021 00:09:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FKfs23rSXz3bvb
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Apr 2021 08:09:10 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=pRV3XRV8;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=patchwork-bot+netdevbpf@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=pRV3XRV8; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FKfCj4Xfgz301N
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Apr 2021 07:40:17 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPS id B533E613C0;
 Tue, 13 Apr 2021 21:40:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1618350012;
 bh=toVub+slEHyxpan1zl2EKjAs+n9L+DqJjmVyXdpSda8=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=pRV3XRV88aPlnwLClx5LDM21mdefxIbRGFcsOMAWKDGAPSf1o7HWMcUJArQ3XXTo2
 omQ7Z2UBYmJ/4VEgdmDWMtz3nLyeoWfPZMbM/epzVuNn/dfLkNcaqGX/sQ3OpMjUBS
 bAKgZugFWBnTeaINp8LqtfjdEpx90+cwvi+asWJoSAi80GbrFagrnhafBEMs9d/q64
 V1GuK22jWWyeImHuDUYrsXisI7HOHaVrq3GZpA1n6OF84dCG4EQ57enrHgZGDRNpgk
 +wx2yJOLG9rxC5gEKrr9mBBot2pLRQqzLRJSzYPRKCwgwQuIOp0m7AJtIXo8z3kOIr
 TcOoK6hf+PaXg==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain
 [127.0.0.1])
 by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 9A519609B9;
 Tue, 13 Apr 2021 21:40:12 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v4 0/2] of: net: support non-platform devices in
 of_get_mac_address()
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <161835001262.18297.4500601910911096840.git-patchwork-notify@kernel.org>
Date: Tue, 13 Apr 2021 21:40:12 +0000
References: <20210412174718.17382-1-michael@walle.cc>
In-Reply-To: <20210412174718.17382-1-michael@walle.cc>
To: Michael Walle <michael@walle.cc>
X-Mailman-Approved-At: Wed, 14 Apr 2021 08:08:46 +1000
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
Cc: andrew@lunn.ch, paulus@samba.org, rafal@milecki.pl,
 nobuhiro1.iwamatsu@toshiba.co.jp, linux-stm32@st-md-mailman.stormreply.com,
 jbrunet@baylibre.com, narmstrong@baylibre.com, michal.simek@xilinx.com,
 joabreu@synopsys.com, linux-imx@nxp.com, Mark-MC.Lee@mediatek.com,
 hauke@hauke-m.de, s.hauer@pengutronix.de, lorenzo.bianconi83@gmail.com,
 linux-omap@vger.kernel.org, gregkh@linuxfoundation.org,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 kernel@pengutronix.de, olteanv@gmail.com, claudiu.beznea@microchip.com,
 jerome.pouiller@silabs.com, hayashi.kunihiko@socionext.com,
 chris.snook@gmail.com, joyce.ooi@intel.com, gregory.clement@bootlin.com,
 madalin.bucur@nxp.com, martin.blumenstingl@googlemail.com, m-karicheri2@ti.com,
 yisen.zhuang@huawei.com, alexandre.torgue@st.com, w-kwok2@ti.com,
 sean.wang@mediatek.com, mripard@kernel.org, claudiu.manoil@nxp.com,
 linux-amlogic@lists.infradead.org, kvalo@codeaurora.org, mlindner@marvell.com,
 fugang.duan@nxp.com, bryan.whitehead@microchip.com,
 ath9k-devel@qca.qualcomm.com, UNGLinuxDriver@microchip.com,
 tchornyi@marvell.com, mcoquelin.stm32@gmail.com, khilman@baylibre.com,
 hkallweit1@gmail.com, andreas@gaisler.com, peppe.cavallaro@st.com,
 festevam@gmail.com, stf_xl@wp.pl, f.fainelli@gmail.com, frowand.list@gmail.com,
 linux-staging@lists.linux.dev, wens@csie.org,
 bcm-kernel-feedback-list@broadcom.com, linux-arm-kernel@lists.infradead.org,
 grygorii.strashko@ti.com, bh74.an@samsung.com, radhey.shyam.pandey@xilinx.com,
 vz@mleia.com, john@phrozen.org, salil.mehta@huawei.com,
 sergei.shtylyov@gmail.com, linux-oxnas@groups.io, shawnguo@kernel.org,
 davem@davemloft.net, helmut.schaa@googlemail.com, thomas.petazzoni@bootlin.com,
 linux-renesas-soc@vger.kernel.org, ryder.lee@mediatek.com,
 linux@armlinux.org.uk, vkochan@marvell.com, kuba@kernel.org,
 vivien.didelot@gmail.com, sgoutham@marvell.com,
 sebastian.hesselbarth@gmail.com, devicetree@vger.kernel.org,
 robh+dt@kernel.org, linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 jernej.skrabec@siol.net, netdev@vger.kernel.org, nicolas.ferre@microchip.com,
 leoyang.li@nxp.com, stephen@networkplumber.org, vkoul@kernel.org,
 linuxppc-dev@lists.ozlabs.org, nbd@nbd.name
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello:

This series was applied to netdev/net-next.git (refs/heads/master):

On Mon, 12 Apr 2021 19:47:16 +0200 you wrote:
> of_get_mac_address() is commonly used to fetch the MAC address
> from the device tree. It also supports reading it from a NVMEM
> provider. But the latter is only possible for platform devices,
> because only platform devices are searched for a matching device
> node.
> 
> Add a second method to fetch the NVMEM cell by a device tree node
> instead of a "struct device".
> 
> [...]

Here is the summary with links:
  - [net-next,v4,1/2] of: net: pass the dst buffer to of_get_mac_address()
    https://git.kernel.org/netdev/net-next/c/83216e3988cd
  - [net-next,v4,2/2] of: net: fix of_get_mac_addr_nvmem() for non-platform devices
    https://git.kernel.org/netdev/net-next/c/f10843e04a07

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


