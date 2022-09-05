Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D2085AD421
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 Sep 2022 15:40:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MLqR81GS2z3blS
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 Sep 2022 23:40:52 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Sh4RtzZv;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=patchwork-bot+netdevbpf@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Sh4RtzZv;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MLqQb3tPWz2xGB
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  5 Sep 2022 23:40:23 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id F27CE611B7;
	Mon,  5 Sep 2022 13:40:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7B63CC43140;
	Mon,  5 Sep 2022 13:40:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1662385218;
	bh=6OkNTRmZgp9w9Gp+m6vHUoevwgIKFYL8Zii/ZwPojUY=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=Sh4RtzZvi+GizYPg7PV2g9FMRtjd+Mkk4Q/0HelEX+759PzbasbrSubnRiIZ9BO1P
	 Dn32m3gt2GWkXsVTk3iLvvT5zQXXhxMsMxwOEHFq0DodysCkMEfI9NgEFOC5yoU0NU
	 jep/Qy9f5R2ThWeCT5kzfEbj2QcPVyRkGQ0LdMz6RlhbnUafWaH9JXdj/6GGtAM8dT
	 kl7GyN5Fn1+YXK1wiULWOe4K1F4W7+SHyU84Pm8s4kvqxMVLUZ1FfnlL2vCgc3esWS
	 z/ITpd4I22zVSHNucY2vySajmO/UABY1KOOgoE96FpUPhyRlE8ciMYSJZEQjDoupva
	 miZhTHv3m7fmg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 5F17FC73FE0;
	Mon,  5 Sep 2022 13:40:18 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v5 00/14] net: dpaa: Cleanups in preparation for
 phylink conversion (part 2)
From: patchwork-bot+netdevbpf@kernel.org
Message-Id:  <166238521838.32478.17433933785506172537.git-patchwork-notify@kernel.org>
Date: Mon, 05 Sep 2022 13:40:18 +0000
References: <20220902215737.981341-1-sean.anderson@seco.com>
In-Reply-To: <20220902215737.981341-1-sean.anderson@seco.com>
To: Sean Anderson <sean.anderson@seco.com>
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
Cc: madalin.bucur@nxp.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, leoyang.li@nxp.com, edumazet@google.com, camelia.groza@nxp.com, kuba@kernel.org, pabeni@redhat.com, linuxppc-dev@lists.ozlabs.org, davem@davemloft.net, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello:

This series was applied to netdev/net-next.git (master)
by David S. Miller <davem@davemloft.net>:

On Fri,  2 Sep 2022 17:57:22 -0400 you wrote:
> This series contains several cleanup patches for dpaa/fman. While they
> are intended to prepare for a phylink conversion, they stand on their
> own. This series was originally submitted as part of [1].
> 
> [1] https://lore.kernel.org/netdev/20220715215954.1449214-1-sean.anderson@seco.com
> 
> Changes in v5:
> - Reduce line length of tgec_config
> - Reduce line length of qman_update_cgr_safe
> - Rebase onto net-next/master
> 
> [...]

Here is the summary with links:
  - [net-next,v5,01/14] net: fman: Move initialization to mac-specific files
    https://git.kernel.org/netdev/net-next/c/302376feec1d
  - [net-next,v5,02/14] net: fman: Mark mac methods static
    https://git.kernel.org/netdev/net-next/c/1257c9623deb
  - [net-next,v5,03/14] net: fman: Inline several functions into initialization
    (no matching commit)
  - [net-next,v5,04/14] net: fman: Remove internal_phy_node from params
    https://git.kernel.org/netdev/net-next/c/45fa34bfaa52
  - [net-next,v5,05/14] net: fman: Map the base address once
    https://git.kernel.org/netdev/net-next/c/262f2b782e25
  - [net-next,v5,06/14] net: fman: Pass params directly to mac init
    (no matching commit)
  - [net-next,v5,07/14] net: fman: Use mac_dev for some params
    https://git.kernel.org/netdev/net-next/c/19c788b144e2
  - [net-next,v5,08/14] net: fman: Specify type of mac_dev for exception_cb
    https://git.kernel.org/netdev/net-next/c/5b6acb554065
  - [net-next,v5,09/14] net: fman: Clean up error handling
    https://git.kernel.org/netdev/net-next/c/aedbeb4e597e
  - [net-next,v5,10/14] net: fman: Change return type of disable to void
    https://git.kernel.org/netdev/net-next/c/901bdff2f529
  - [net-next,v5,11/14] net: dpaa: Use mac_dev variable in dpaa_netdev_init
    https://git.kernel.org/netdev/net-next/c/fca4804f68cf
  - [net-next,v5,12/14] soc: fsl: qbman: Add helper for sanity checking cgr ops
    https://git.kernel.org/netdev/net-next/c/d0e17a4653ce
  - [net-next,v5,13/14] soc: fsl: qbman: Add CGR update function
    https://git.kernel.org/netdev/net-next/c/914f8b228ede
  - [net-next,v5,14/14] net: dpaa: Adjust queue depth on rate change
    https://git.kernel.org/netdev/net-next/c/ef2a8d5478b9

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


