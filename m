Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3680C6BD783
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Mar 2023 18:51:26 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PcvvN5tC1z3cjN
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Mar 2023 04:51:12 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=rKgHmH1s;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=patchwork-bot+netdevbpf@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=rKgHmH1s;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PcvtS22ftz3cF6
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Mar 2023 04:50:24 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 45CBC620D9;
	Thu, 16 Mar 2023 17:50:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 31B95C433A1;
	Thu, 16 Mar 2023 17:50:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678989020;
	bh=/rFLNe93rQIRlAx/57xJ6NacQ6gFAXPh6A+DAAqx/RY=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=rKgHmH1sooRqw3nGbq3dUryuP04azSVgLR00rq6MsZBt67K6xq5U/DbzcpvZwgspe
	 LDwV12ROIoHxlgKyvMkkkbsAo/Bo0YyjeDuI9yQ38MIlzJg5A90jtS5cBd+jIqUB2d
	 ZjnpEtBLXj2fI0zxBCWMS36HM7et2XB9AH2jIWKKvcUysXzNR8nT3/ek4v0Ni79GU9
	 U60CsnFj2LB59sYcNJ46yQOqptrQMaM9E1J0Gqn9OBQU1uM5ybRzEQxsFiSndKRB/m
	 Tochl8xGkSZkmS0L1QXqZBvoOblNX8O4m1G9SM5ioao93p/jS3EPqHh/ROVd7b1OXc
	 Swe/YlbXKZipg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 0EAE9E29F32;
	Thu, 16 Mar 2023 17:50:20 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2] net: Use of_property_read_bool() for boolean properties
From: patchwork-bot+netdevbpf@kernel.org
Message-Id:  <167898902004.2133.16158810493778389682.git-patchwork-notify@kernel.org>
Date: Thu, 16 Mar 2023 17:50:20 +0000
References: <20230314191828.914124-1-robh@kernel.org>
In-Reply-To: <20230314191828.914124-1-robh@kernel.org>
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
Cc: simon.horman@corigine.com, alexandre.torgue@foss.st.com, linux-kernel@vger.kernel.org, edumazet@google.com, shenwei.wang@nxp.com, festevam@gmail.com, linux-stm32@st-md-mailman.stormreply.com, qiang.zhao@nxp.com, michal.simek@xilinx.com, joabreu@synopsys.com, xiaoning.wang@nxp.com, linux-imx@nxp.com, romieu@fr.zoreil.com, kuba@kernel.org, pabeni@redhat.com, kvalo@kernel.org, wg@grandegger.com, grygorii.strashko@ti.com, kernel@pengutronix.de, s.hauer@pengutronix.de, linuxppc-dev@lists.ozlabs.org, linux-can@vger.kernel.org, claudiu.manoil@nxp.com, mkl@pengutronix.de, peppe.cavallaro@st.com, linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org, linux-wireless@vger.kernel.org, nicolas.ferre@microchip.com, davem@davemloft.net, mcoquelin.stm32@gmail.com, wei.fang@nxp.com, sam@mendozajonas.com, shawnguo@kernel.org, claudiu.beznea@microchip.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello:

This patch was applied to netdev/net.git (main)
by David S. Miller <davem@davemloft.net>:

On Tue, 14 Mar 2023 14:18:27 -0500 you wrote:
> It is preferred to use typed property access functions (i.e.
> of_property_read_<type> functions) rather than low-level
> of_get_property/of_find_property functions for reading properties.
> Convert reading boolean properties to of_property_read_bool().
> 
> Reviewed-by: Simon Horman <simon.horman@corigine.com>
> Acked-by: Marc Kleine-Budde <mkl@pengutronix.de> # for net/can
> Acked-by: Kalle Valo <kvalo@kernel.org>
> Acked-by: Nicolas Ferre <nicolas.ferre@microchip.com>
> Acked-by: Francois Romieu <romieu@fr.zoreil.com>
> Reviewed-by: Wei Fang <wei.fang@nxp.com>
> Signed-off-by: Rob Herring <robh@kernel.org>
> 
> [...]

Here is the summary with links:
  - [v2] net: Use of_property_read_bool() for boolean properties
    https://git.kernel.org/netdev/net/c/1a87e641d8a5

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


