Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 96939799F46
	for <lists+linuxppc-dev@lfdr.de>; Sun, 10 Sep 2023 20:01:26 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=WNCcNX0j;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RkHj03p7Tz3cD7
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Sep 2023 04:01:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=WNCcNX0j;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=patchwork-bot+netdevbpf@kernel.org; receiver=lists.ozlabs.org)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RkHh20hs2z2ygY
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 11 Sep 2023 04:00:34 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 55F8FB80CA9;
	Sun, 10 Sep 2023 18:00:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D277FC433C8;
	Sun, 10 Sep 2023 18:00:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694368821;
	bh=7pMVydPneVg3URKXwfaH+adzpHN2LLjVZsTSGuRN/Dc=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=WNCcNX0j78tRLBxMWD5xHUNdVWsV4X1c4GJprcT9133xluNlViXTJ+y1MbbMmvw4S
	 9l6p0mwmq1ciXkoHmtsYyK8lFvb1p3EVodnEbrR25eIRn+6jRHWBjTxm2wzjyRS6Mh
	 /jvEouU2JwW8Gm/EnKA/L+ncaZS7ANxE1SqxSdP9VAlRZQQbAQGSZNr44Pfjzomk2O
	 YmugA3EJ+2/4ZTwGg7O1MhyTBgt+SEpxLAiqRaqU5NrZ9WSluxkkNsOvrlaLWdV7jR
	 voEyBX1vKb3bWRjPhlJDd4v26hqNBBRPVghPsTewXgHu/u+K2aUEWjjrhAgY/J0FrG
	 nZp7NWsEXqO2w==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id B8F74F1D6A8;
	Sun, 10 Sep 2023 18:00:21 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 00/11] add missing of_node_put
From: patchwork-bot+netdevbpf@kernel.org
Message-Id:  <169436882175.20878.16500068409286410519.git-patchwork-notify@kernel.org>
Date: Sun, 10 Sep 2023 18:00:21 +0000
References: <20230907095521.14053-1-Julia.Lawall@inria.fr>
In-Reply-To: <20230907095521.14053-1-Julia.Lawall@inria.fr>
To: Julia Lawall <julia.lawall@inria.fr>
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
Cc: alsa-devel@alsa-project.org, linux-pm@vger.kernel.org, netdev@vger.kernel.org, dri-devel@lists.freedesktop.org, amitk@kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, npiggin@gmail.com, linux-mediatek@lists.infradead.org, bcm-kernel-feedback-list@broadcom.com, linux-mmc@vger.kernel.org, rui.zhang@intel.com, linux-media@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello:

This patch was applied to netdev/net.git (main)
by David S. Miller <davem@davemloft.net>:

On Thu,  7 Sep 2023 11:55:10 +0200 you wrote:
> Add of_node_put on a break out of an of_node loop.
> 
> ---
> 
>  arch/powerpc/kexec/file_load_64.c                    |    8 ++++++--
>  arch/powerpc/platforms/powermac/low_i2c.c            |    4 +++-
>  arch/powerpc/platforms/powermac/smp.c                |    4 +++-
>  drivers/bus/arm-cci.c                                |    4 +++-
>  drivers/genpd/ti/ti_sci_pm_domains.c                 |    8 ++++++--
>  drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c      |    4 +++-
>  drivers/gpu/drm/mediatek/mtk_drm_drv.c               |    4 +++-
>  drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.c |    1 +
>  drivers/mmc/host/atmel-mci.c                         |    8 ++++++--
>  drivers/net/ethernet/broadcom/asp2/bcmasp.c          |    1 +
>  drivers/soc/dove/pmu.c                               |    5 ++++-
>  drivers/thermal/thermal_of.c                         |    8 ++++++--
>  sound/soc/sh/rcar/core.c                             |    1 +
>  13 files changed, 46 insertions(+), 14 deletions(-)

Here is the summary with links:
  - [02/11] net: bcmasp: add missing of_node_put
    https://git.kernel.org/netdev/net/c/e73d1ab6cd7e

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


