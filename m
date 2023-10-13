Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CB8C7C81BA
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Oct 2023 11:15:36 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=AQtTwPCm;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S6LT22Xcpz3w2J
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Oct 2023 20:15:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=AQtTwPCm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=patchwork-bot+netdevbpf@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S6LMJ44r5z3vpX
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Oct 2023 20:10:36 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 33DC862063;
	Fri, 13 Oct 2023 09:10:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id EEDC8C433CB;
	Fri, 13 Oct 2023 09:10:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697188231;
	bh=x7mc+kQYSsekJK4vlCye+6KPOUJkFZpCl0x3sxdgaaw=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=AQtTwPCmajOmNNQPHtTr/zoA/M7SdwCrA5V9FAtAtdm7Ym6xjJjw7WotI6tBpMCpM
	 MyVA/dkPX2f9eKdrX0iFiy9ikBV2W2VDPlNKUFZ8eMx9ZmhJxej7QyBa8B18SbMGv5
	 qSC6fuBbLr1aYasdO92fsMbZJ7T8gtFwgCtgBkHb337NFEyvLcivFYDSTAVpENqPfi
	 rKTXLxmnF43ghcQfVDVluH/VqcQ6iZ9Xu+3MCZpKld29GOou5Hxl0hyL6TCagn+Jah
	 NifCVuHcJH3km9jk78Jz6A6enfGvNufLaykR9nKnZWYPzTjSmmuYLJhppVGPHklyhR
	 PIGjkkXd6p94A==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id D3F2AE1F669;
	Fri, 13 Oct 2023 09:10:30 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next] net: ethernet: Use device_get_match_data()
From: patchwork-bot+netdevbpf@kernel.org
Message-Id:  <169718823086.32613.16429893280352977849.git-patchwork-notify@kernel.org>
Date: Fri, 13 Oct 2023 09:10:30 +0000
References: <20231009172923.2457844-3-robh@kernel.org>
In-Reply-To: <20231009172923.2457844-3-robh@kernel.org>
To: Rob Herring <robh@kernel.org>
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
Cc: Shyam-sundar.S-k@amd.com, alexandre.torgue@foss.st.com, edumazet@google.com, iyappan@os.amperecomputing.com, quan@os.amperecomputing.com, shenwei.wang@nxp.com, linux-stm32@st-md-mailman.stormreply.com, joyce.ooi@intel.com, linux@armlinux.org.uk, joabreu@synopsys.com, xiaoning.wang@nxp.com, linux-imx@nxp.com, kuba@kernel.org, pabeni@redhat.com, yisen.zhuang@huawei.com, grygorii.strashko@ti.com, keyur@os.amperecomputing.com, wei.fang@nxp.com, linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org, salil.mehta@huawei.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, mcoquelin.stm32@gmail.com, linuxppc-dev@lists.ozlabs.org, davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello:

This patch was applied to netdev/net-next.git (main)
by David S. Miller <davem@davemloft.net>:

On Mon,  9 Oct 2023 12:28:58 -0500 you wrote:
> Use preferred device_get_match_data() instead of of_match_device() to
> get the driver match data. With this, adjust the includes to explicitly
> include the correct headers.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  drivers/net/ethernet/altera/altera_tse.h      |  2 +-
>  drivers/net/ethernet/altera/altera_tse_main.c | 13 ++----
>  drivers/net/ethernet/amd/xgbe/xgbe-platform.c | 42 +------------------
>  .../net/ethernet/apm/xgene/xgene_enet_main.c  | 15 +------
>  .../net/ethernet/apm/xgene/xgene_enet_main.h  |  3 +-
>  drivers/net/ethernet/freescale/fec_main.c     | 12 +++---
>  .../ethernet/freescale/fs_enet/fs_enet-main.c | 18 ++++----
>  .../net/ethernet/freescale/fs_enet/mii-fec.c  | 10 ++---
>  drivers/net/ethernet/freescale/fsl_pq_mdio.c  | 12 ++----
>  drivers/net/ethernet/hisilicon/hix5hd2_gmac.c | 11 ++---
>  .../stmicro/stmmac/dwmac-intel-plat.c         |  9 ++--
>  drivers/net/ethernet/ti/davinci_emac.c        | 12 ++----
>  drivers/net/ethernet/ti/icssg/icssg_prueth.c  | 13 ++----
>  13 files changed, 40 insertions(+), 132 deletions(-)

Here is the summary with links:
  - [net-next] net: ethernet: Use device_get_match_data()
    https://git.kernel.org/netdev/net-next/c/b0377116decd

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


