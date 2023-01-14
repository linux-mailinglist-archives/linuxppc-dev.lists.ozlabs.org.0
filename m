Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D26AC66A982
	for <lists+linuxppc-dev@lfdr.de>; Sat, 14 Jan 2023 06:51:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Nv6ps4dC1z3fBH
	for <lists+linuxppc-dev@lfdr.de>; Sat, 14 Jan 2023 16:51:17 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=PbzAb7Fu;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=patchwork-bot+netdevbpf@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=PbzAb7Fu;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Nv6np1Mg0z3c91;
	Sat, 14 Jan 2023 16:50:22 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 4DEE960B45;
	Sat, 14 Jan 2023 05:50:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 99D12C433EF;
	Sat, 14 Jan 2023 05:50:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673675418;
	bh=ngfQjwFKmCSeocAW86AdE9in/ESlzA2f+NOfkGPnaOg=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=PbzAb7FuLH7rstaaHzkqO/TKJ0jhzX5/WVGU1Atan9l2+aId0YIBwQBc6HEWGIdOx
	 NpBUiimoP/3W4GeYmgQWkIyK0QxD26i1VH8jDscuPlEWm/rxaumM/fnWM8Us8rXkdc
	 xVnwryq7I1nXtFLtPG4iU0vHUeQs6adLDniT54mEpUIdDbaTldpzW/tSZCCv49Latq
	 ASQ9j+AGIg2kynwAdJes0zFQh1cxh1mZpE8rDdsFr7ssJaPfEAj30VnTs0y0CgEV7e
	 g99L+fsWom9cv4n4jn7ebEEiBWKp8bDx58WvX+T4uizSBRsOOFIll46WgLTttVOLUn
	 Um0jMC9DtZRtQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 75D05E21EE0;
	Sat, 14 Jan 2023 05:50:18 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next 00/10] net: mdio: Continue separating C22 and C45
From: patchwork-bot+netdevbpf@kernel.org
Message-Id:  <167367541847.15756.1816103460556617097.git-patchwork-notify@kernel.org>
Date: Sat, 14 Jan 2023 05:50:18 +0000
References: <20230112-net-next-c45-seperation-part-2-v1-0-5eeaae931526@walle.cc>
In-Reply-To: <20230112-net-next-c45-seperation-part-2-v1-0-5eeaae931526@walle.cc>
To: Michael Walle <michael@walle.cc>
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
Cc: andrew@lunn.ch, alexandre.belloni@bootlin.com, linux-aspeed@lists.ozlabs.org, vladimir.oltean@nxp.com, alexandre.torgue@foss.st.com, edumazet@google.com, leoyang.li@nxp.com, linux-stm32@st-md-mailman.stormreply.com, f.fainelli@gmail.com, linux@armlinux.org.uk, joabreu@synopsys.com, bcm-kernel-feedback-list@broadcom.com, joel@jms.id.au, kuba@kernel.org, pabeni@redhat.com, lorenzo@kernel.org, Mark-MC.Lee@mediatek.com, rjui@broadcom.com, sean.wang@mediatek.com, claudiu.manoil@nxp.com, linux-mediatek@lists.infradead.org, john@phrozen.org, matthias.bgg@gmail.com, peppe.cavallaro@st.com, linux-arm-kernel@lists.infradead.org, sbranden@broadcom.com, andrew@aj.id.au, bryan.whitehead@microchip.com, linux-kernel@vger.kernel.org, UNGLinuxDriver@microchip.com, mcoquelin.stm32@gmail.com, netdev@vger.kernel.org, hkallweit1@gmail.com, linuxppc-dev@lists.ozlabs.org, davem@davemloft.net, nbd@nbd.name
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello:

This series was applied to netdev/net-next.git (master)
by Jakub Kicinski <kuba@kernel.org>:

On Thu, 12 Jan 2023 16:15:07 +0100 you wrote:
> I've picked this older series from Andrew up and rebased it onto
> the latest net-next.
> 
> This is the second patch set in the series which separates the C22
> and C45 MDIO bus transactions at the API level to the MDIO bus drivers.
> 
> Signed-off-by: Michael Walle <michael@walle.cc>
> 
> [...]

Here is the summary with links:
  - [net-next,01/10] net: mdio: cavium: Separate C22 and C45 transactions
    https://git.kernel.org/netdev/net-next/c/93641ecbaa1f
  - [net-next,02/10] net: mdio: i2c: Separate C22 and C45 transactions
    https://git.kernel.org/netdev/net-next/c/87e3bee0f247
  - [net-next,03/10] net: mdio: mux-bcm-iproc: Separate C22 and C45 transactions
    https://git.kernel.org/netdev/net-next/c/d544a25930a7
  - [net-next,04/10] net: mdio: aspeed: Separate C22 and C45 transactions
    https://git.kernel.org/netdev/net-next/c/c3c497eb8b24
  - [net-next,05/10] net: mdio: ipq4019: Separate C22 and C45 transactions
    https://git.kernel.org/netdev/net-next/c/c58e39942adf
  - [net-next,06/10] net: ethernet: mtk_eth_soc: Separate C22 and C45 transactions
    https://git.kernel.org/netdev/net-next/c/900888374e73
  - [net-next,07/10] net: lan743x: Separate C22 and C45 transactions
    https://git.kernel.org/netdev/net-next/c/3d90c03cb416
  - [net-next,08/10] net: stmmac: Separate C22 and C45 transactions for xgmac2
    https://git.kernel.org/netdev/net-next/c/5b0a447efff5
  - [net-next,09/10] net: stmmac: Separate C22 and C45 transactions for xgmac
    https://git.kernel.org/netdev/net-next/c/3c7826d0b106
  - [net-next,10/10] enetc: Separate C22 and C45 transactions
    https://git.kernel.org/netdev/net-next/c/80e87442e69b

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


