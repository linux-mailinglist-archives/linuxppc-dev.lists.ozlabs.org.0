Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6321E6B6FC5
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Mar 2023 07:58:37 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PZnYl2BnWz3cBy
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Mar 2023 17:58:35 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=OV3Qmz/I;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=kvalo@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=OV3Qmz/I;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PZnXn0xZPz3c1K
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Mar 2023 17:57:45 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id A057E610E8;
	Mon, 13 Mar 2023 06:57:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF9A8C433EF;
	Mon, 13 Mar 2023 06:57:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678690661;
	bh=yXZd505XmCeN942UNqXIjHQ5Kwm2nMyuVli34Flsl0k=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=OV3Qmz/IfYFypeHG/KN765o4V5OmR9wF58a5r9sl82BrhzjL6RJ0t2BMCNGpw1ntM
	 KjslQkVZ0JESUZldaRATa7IiEt8tChEUY7aZGOsKDbNPnUsdLkk50GUTNcHuQt8uwu
	 /nvJPmC0zq/U3J3CkrwQSJOg3YVsyp9NHgqDbR+vvwKY5uHZfopN5Xhlfq4vRJqL5K
	 2lcLp4KOgNNKzHrc3lBCwzRTQhSEaT9H270FVzm0fOR5LBxNIFif2HMZyuJyMpJZPr
	 JZdom+77L9fbpCIolgn8UTraemz7xWvoDX9JRXWvn+mO+3wAXa1vcYQvfqy6DaFU28
	 H00x/o9omaPFw==
From: Kalle Valo <kvalo@kernel.org>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] net: Use of_property_read_bool() for boolean properties
References: <20230310144718.1544169-1-robh@kernel.org>
Date: Mon, 13 Mar 2023 08:57:31 +0200
In-Reply-To: <20230310144718.1544169-1-robh@kernel.org> (Rob Herring's message
	of "Fri, 10 Mar 2023 08:47:16 -0600")
Message-ID: <87ttypnnok.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>, linux-kernel@vger.kernel.org, Eric Dumazet <edumazet@google.com>, Shenwei Wang <shenwei.wang@nxp.com>, Fabio Estevam <festevam@gmail.com>, linux-stm32@st-md-mailman.stormreply.com, Zhao Qiang <qiang.zhao@nxp.com>, Michal Simek <michal.simek@xilinx.com>, Jose Abreu <joabreu@synopsys.com>, Clark Wang <xiaoning.wang@nxp.com>, NXP Linux Team <linux-imx@nxp.com>, Francois Romieu <romieu@fr.zoreil.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Wolfgang Grandegger <wg@grandegger.com>, devicetree@vger.kernel.org, Grygorii Strashko <grygorii.strashko@ti.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Sascha Hauer <s.hauer@pengutronix.de>, linuxppc-dev@lists.ozlabs.org, linux-can@vger.kernel.org, Claudiu Manoil <claudiu.manoil@nxp.com>, Marc Kleine-Budde <mkl@pengutronix.de>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org, 
 linux-wireless@vger.kernel.org, Nicolas Ferre <nicolas.ferre@microchip.com>, "David S. Miller" <davem@davemloft.net>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Wei Fang <wei.fang@nxp.com>, Samuel Mendoza-Jonas <sam@mendozajonas.com>, Shawn Guo <shawnguo@kernel.org>, Claudiu Beznea <claudiu.beznea@microchip.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Rob Herring <robh@kernel.org> writes:

> It is preferred to use typed property access functions (i.e.
> of_property_read_<type> functions) rather than low-level
> of_get_property/of_find_property functions for reading properties.
> Convert reading boolean properties to to of_property_read_bool().
>
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  drivers/net/can/cc770/cc770_platform.c          | 12 ++++++------
>  drivers/net/ethernet/cadence/macb_main.c        |  2 +-
>  drivers/net/ethernet/davicom/dm9000.c           |  4 ++--
>  drivers/net/ethernet/freescale/fec_main.c       |  2 +-
>  drivers/net/ethernet/freescale/fec_mpc52xx.c    |  2 +-
>  drivers/net/ethernet/freescale/gianfar.c        |  4 ++--
>  drivers/net/ethernet/ibm/emac/core.c            |  8 ++++----
>  drivers/net/ethernet/ibm/emac/rgmii.c           |  2 +-
>  drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c |  3 +--
>  drivers/net/ethernet/sun/niu.c                  |  2 +-
>  drivers/net/ethernet/ti/cpsw-phy-sel.c          |  3 +--
>  drivers/net/ethernet/ti/netcp_ethss.c           |  8 +++-----
>  drivers/net/ethernet/via/via-velocity.c         |  3 +--
>  drivers/net/ethernet/xilinx/ll_temac_main.c     |  9 ++++-----
>  drivers/net/wan/fsl_ucc_hdlc.c                  | 11 +++--------
>  drivers/net/wireless/ti/wlcore/spi.c            |  3 +--
>  net/ncsi/ncsi-manage.c                          |  4 ++--
>  17 files changed, 35 insertions(+), 47 deletions(-)

For wireless:

Acked-by: Kalle Valo <kvalo@kernel.org>

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
