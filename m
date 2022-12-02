Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 45D1564114C
	for <lists+linuxppc-dev@lfdr.de>; Sat,  3 Dec 2022 00:05:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NP7nS5v5tz3bh4
	for <lists+linuxppc-dev@lfdr.de>; Sat,  3 Dec 2022 10:05:00 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ceAE5Mxr;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=patchwork-bot+netdevbpf@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ceAE5Mxr;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NNfcG30fdz2xjr
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Dec 2022 15:10:22 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 6AF8B61198;
	Fri,  2 Dec 2022 04:10:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2FAD9C43470;
	Fri,  2 Dec 2022 04:10:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669954217;
	bh=HaP17cY8bC6Z7s7UbiuxYbq8Tj2YqlDJaygBIxTtgLE=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=ceAE5Mxrl5cb2x2vxCvkWYLuAKVIUSda9eDgrj/v/dsN0Vo4tt9V/HX2M1h78crwH
	 d03jz31h574qWxU5y0Q6ocFqqylNVBdzBI9uTKgsYl38Y8QLSLrfk+o4bDBD8VeCNC
	 hOf+Q9VR7k40jlRRbcnmmPma/ihKnDAxNqujnGgx/nv1JtJ94HtmmJ+5QA/ZoM/ljG
	 RbLwj0w3XtuqtUeWwYO5QEIDqRz2znS9lfFPx2OW5XdmmmHyWdfTLPeNqAhADtZ0Ow
	 Pk/KqULn6e3dQaK9ZYBlnyp5ewEhowWzruyM0J9zZHiExqyTEM2UT4whZS83/WJftY
	 F7YUJMQy9oi4w==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 0DDFCE52545;
	Fri,  2 Dec 2022 04:10:17 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 0/5] remove label = "cpu" from DSA dt-binding
From: patchwork-bot+netdevbpf@kernel.org
Message-Id:  <166995421705.16716.5360501255567828327.git-patchwork-notify@kernel.org>
Date: Fri, 02 Dec 2022 04:10:17 +0000
References: <20221130141040.32447-1-arinc.unal@arinc9.com>
In-Reply-To: <20221130141040.32447-1-arinc.unal@arinc9.com>
To: =?utf-8?b?QXLEsW7DpyDDnE5BTCA8YXJpbmMudW5hbEBhcmluYzkuY29tPg==?=@ci.codeaurora.org
X-Mailman-Approved-At: Sat, 03 Dec 2022 10:04:15 +1100
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
Cc: andrew@lunn.ch, alexandre.belloni@bootlin.com, heiko@sntech.de, geert+renesas@glider.be, tharvey@gateworks.com, vladimir.oltean@nxp.com, linus.walleij@linaro.org, konrad.dybcio@somainline.org, alexandre.torgue@foss.st.com, stefan@agner.ch, linux-kernel@vger.kernel.org, edumazet@google.com, krzysztof.kozlowski+dt@linaro.org, linux@rempel-privat.de, festevam@gmail.com, peng.fan@nxp.com, f.fainelli@gmail.com, samuel@sholland.org, gregory.clement@bootlin.com, zajec5@gmail.com, linux@armlinux.org.uk, jernej.skrabec@gmail.com, linux-stm32@st-md-mailman.stormreply.com, sergio.paracuellos@gmail.com, wens@csie.org, agross@kernel.org, bcm-kernel-feedback-list@broadcom.com, linux-imx@nxp.com, rjui@broadcom.com, kuba@kernel.org, pabeni@redhat.com, s.hauer@pengutronix.de, sebastian.hesselbarth@gmail.com, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, mcoquelin.stm32@gmail.com, frank-w@public-files.de, hauke@hauke-m.de, ulli.kroll@googlemail.com, linuxppc-dev@lists.ozlabs.org, npig
 gin@gmail.com, linux-mips@vger.kernel.org, linux-rockchip@lists.infradead.org, soc@kernel.org, robh+dt@kernel.org, linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org, tsbogend@alpha.franken.de, sbranden@broadcom.com, netdev@vger.kernel.org, andersson@kernel.org, rasmus.villemoes@prevas.dk, nicolas.ferre@microchip.com, davem@davemloft.net, linux-renesas-soc@vger.kernel.org, linux-sunxi@lists.linux.dev, krzysztof.kozlowski@linaro.org, kernel@pengutronix.de, shawnguo@kernel.org, claudiu.beznea@microchip.com, michael.riesch@wolfvision.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello:

This series was applied to netdev/net-next.git (master)
by Jakub Kicinski <kuba@kernel.org>:

On Wed, 30 Nov 2022 17:10:35 +0300 you wrote:
> Hello folks,
> 
> With this patch series, we're completely getting rid of 'label = "cpu";'
> which is not used by the DSA dt-binding at all.
> 
> Information for taking the patches for maintainers:
> Patch 1: netdev maintainers (based off netdev/net-next.git main)
> Patch 2-3: SoC maintainers (based off soc/soc.git soc/dt)
> Patch 4: MIPS maintainers (based off mips/linux.git mips-next)
> Patch 5: PowerPC maintainers (based off powerpc/linux.git next-test)
> 
> [...]

Here is the summary with links:
  - [1/5] dt-bindings: net: qca,ar71xx: remove label = "cpu" from examples
    https://git.kernel.org/netdev/net-next/c/ce36d7ef4e08
  - [2/5] arm: dts: remove label = "cpu" from DSA dt-binding
    (no matching commit)
  - [3/5] arm64: dts: remove label = "cpu" from DSA dt-binding
    (no matching commit)
  - [4/5] mips: dts: remove label = "cpu" from DSA dt-binding
    (no matching commit)
  - [5/5] powerpc: dts: remove label = "cpu" from DSA dt-binding
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


