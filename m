Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 947347662CE
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Jul 2023 06:11:29 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=n5OOA0he;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RBvMg3rhWz3cQx
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Jul 2023 14:11:27 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=n5OOA0he;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=patchwork-bot+netdevbpf@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RBtgv59sbz2yDy
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Jul 2023 13:40:27 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 8DEF561FC8;
	Fri, 28 Jul 2023 03:40:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6D85AC433CA;
	Fri, 28 Jul 2023 03:40:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690515623;
	bh=nh7VNF71Px8+ehWsNezgTEu3Q5hpaEOt5oKxXH92/qA=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=n5OOA0hexFDJfGiqn8bTgbsd1NxuBlbkYDKSx4jve1A1uhS5AnTOvFTQV4JWG7aBf
	 g/w60ZUiuyy1xVob0CGewYJXVq1VL+QTFR/Web3ZJJ2NNh+cY5USv/q3z7SDcq/wTR
	 lonQnxK346qjNlcQZfWCfeuaLMI8E7TUSZjSKMLEMehF+DgMrtLu+XmXsACHxfUrce
	 uCl8v7KPKSe+YopRiOOHSvNs0MFFYZuVftoYlnB7ke0VUB/3LypcDS6Ej2rHAU9kNd
	 8tKWHNxo+5s5dfDX+o4x42ap7+FrTJwJM45yRjAs4oZ8Nub3PfEMVbrmDiV7UKUGPk
	 vMj95R4jHRhaw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 417E1C691EE;
	Fri, 28 Jul 2023 03:40:23 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v3] net: Explicitly include correct DT includes
From: patchwork-bot+netdevbpf@kernel.org
Message-Id:  <169051562326.23821.4231940284607437337.git-patchwork-notify@kernel.org>
Date: Fri, 28 Jul 2023 03:40:23 +0000
References: <20230727014944.3972546-1-robh@kernel.org>
In-Reply-To: <20230727014944.3972546-1-robh@kernel.org>
To: Rob Herring <robh@kernel.org>
X-Mailman-Approved-At: Fri, 28 Jul 2023 14:10:44 +1000
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
Cc: kevinbrace@bracecomputerlab.com, andrew@lunn.ch, iyappan@os.amperecomputing.com, miquel.raynal@bootlin.com, nobuhiro1.iwamatsu@toshiba.co.jp, jonathanh@nvidia.com, horatiu.vultur@microchip.com, radhey.shyam.pandey@amd.com, jbrunet@baylibre.com, samuel@sholland.org, sean.anderson@seco.com, khilman@baylibre.com, madalin.bucur@nxp.com, joabreu@synopsys.com, linux-imx@nxp.com, Mark-MC.Lee@mediatek.com, s.hauer@pengutronix.de, linux-omap@vger.kernel.org, elder@kernel.org, dougmill@linux.ibm.com, linux-kernel@vger.kernel.org, kernel@pengutronix.de, linux-wpan@vger.kernel.org, claudiu.beznea@microchip.com, alexandre.belloni@bootlin.com, hayashi.kunihiko@socionext.com, chris.snook@gmail.com, edumazet@google.com, thierry.reding@gmail.com, linux-stm32@st-md-mailman.stormreply.com, stefan@datenfreihafen.org, yisen.zhuang@huawei.com, steve.glendinning@shawell.net, martin.blumenstingl@googlemail.com, linux-arm-msm@vger.kernel.org, sean.wang@mediatek.com, claudiu.manoil@nxp.com, linux-amlogic@
 lists.infradead.org, michal.simek@amd.com, linux-arm-kernel@lists.infradead.org, mlindner@marvell.com, neil.armstrong@linaro.org, UNGLinuxDriver@microchip.com, linux-renesas-soc@vger.kernel.org, mcoquelin.stm32@gmail.com, linux-mediatek@lists.infradead.org, hkallweit1@gmail.com, taras.chornyi@plvision.eu, kernel@esmil.dk, andreas@gaisler.com, linux-tegra@vger.kernel.org, peppe.cavallaro@st.com, festevam@gmail.com, jernej.skrabec@gmail.com, wens@csie.org, shenwei.wang@nxp.com, samin.guo@starfivetech.com, romieu@fr.zoreil.com, pabeni@redhat.com, lorenzo@kernel.org, grygorii.strashko@ti.com, bhupesh.sharma@linaro.org, john@phrozen.org, salil.mehta@huawei.com, s.shtylyov@omp.ru, timur@kernel.org, linux-sunxi@lists.linux.dev, linux-oxnas@groups.io, shawnguo@kernel.org, davem@davemloft.net, alex.aring@gmail.com, vladimir.oltean@nxp.com, alexandre.torgue@foss.st.com, linux@armlinux.org.uk, xiaoning.wang@nxp.com, elder@linaro.org, kuba@kernel.org, richardcochran@gmail.com, keyur@os.ampereco
 mputing.com, wei.fang@nxp.com, matthias.bgg@gmail.com, mw@semihalf.com, angelogioacchino.delregno@collabora.com, netdev@vger.kernel.org, nicolas.ferre@microchip.com, leoyang.li@nxp.com, stephen@networkplumber.org, vkoul@kernel.org, linuxppc-dev@lists.ozlabs.org, nbd@nbd.name
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello:

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Wed, 26 Jul 2023 19:49:39 -0600 you wrote:
> The DT of_device.h and of_platform.h date back to the separate
> of_platform_bus_type before it as merged into the regular platform bus.
> As part of that merge prepping Arm DT support 13 years ago, they
> "temporarily" include each other. They also include platform_device.h
> and of.h. As a result, there's a pretty much random mix of those include
> files used throughout the tree. In order to detangle these headers and
> replace the implicit includes with struct declarations, users need to
> explicitly include the correct includes.
> 
> [...]

Here is the summary with links:
  - [net-next,v3] net: Explicitly include correct DT includes
    https://git.kernel.org/netdev/net-next/c/3d40aed86287

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


