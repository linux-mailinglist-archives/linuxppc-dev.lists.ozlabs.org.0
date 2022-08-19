Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ED4A59A996
	for <lists+linuxppc-dev@lfdr.de>; Sat, 20 Aug 2022 01:51:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M8dmz0lcLz3dxq
	for <lists+linuxppc-dev@lfdr.de>; Sat, 20 Aug 2022 09:50:59 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=U6GGTPHD;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=patchwork-bot+netdevbpf@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=U6GGTPHD;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M8dmH5TvVz3bkZ
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 20 Aug 2022 09:50:23 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 43C06B829A8;
	Fri, 19 Aug 2022 23:50:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id ED0A4C433B5;
	Fri, 19 Aug 2022 23:50:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1660953019;
	bh=CuQ5Q9EewpvW9DDE3E3uqhT70iZXoQdmu06/1ktmPDM=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=U6GGTPHDLBiPb6MzRyp9FD9HLvdHJrDRAg5X6mhXZAklnI+bG32ezr0sXqJqavBci
	 ww6FIALOoXsGymiY1anis2yA91KWRNY0k8QOiZKCqbfg5C6fqUqsSlWp2MWkc+RwGH
	 ARJHFbtLS1Cbz0SHzAiAPIpb8w1Cjgf6x4ITmJhm3EYASqnZ+fczLJfaaT4X5Yd8cA
	 OsSZKyhLHSFqB3mycA21dkHMnG0I+GOmxJg6M5oh60bXL05wUMjoTGxum4M1ejfxII
	 u5YLBHCk7y8gkIRO/4nRi9cFltqV2W2G1CzGIwMI+2fYZD9aksbS4zig6NUibhgs/M
	 GkL1PWICRzHEA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id C389DE2A05E;
	Fri, 19 Aug 2022 23:50:18 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [RESEND PATCH net-next v4 00/25] net: dpaa: Cleanups in preparation
 for phylink conversion
From: patchwork-bot+netdevbpf@kernel.org
Message-Id:  <166095301878.11596.4206338454317459884.git-patchwork-notify@kernel.org>
Date: Fri, 19 Aug 2022 23:50:18 +0000
References: <20220818161649.2058728-1-sean.anderson@seco.com>
In-Reply-To: <20220818161649.2058728-1-sean.anderson@seco.com>
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
Cc: devicetree@vger.kernel.org, madalin.bucur@nxp.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, leoyang.li@nxp.com, edumazet@google.com, robh+dt@kernel.org, camelia.groza@nxp.com, krzysztof.kozlowski+dt@linaro.org, kuba@kernel.org, pabeni@redhat.com, linuxppc-dev@lists.ozlabs.org, davem@davemloft.net, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello:

This series was applied to netdev/net-next.git (master)
by Jakub Kicinski <kuba@kernel.org>:

On Thu, 18 Aug 2022 12:16:24 -0400 you wrote:
> This series contains several cleanup patches for dpaa/fman. While they
> are intended to prepare for a phylink conversion, they stand on their
> own. This series was originally submitted as part of [1].
> 
> [1] https://lore.kernel.org/netdev/20220715215954.1449214-1-sean.anderson@seco.com
> 
> Changes in v4:
> - Clarify commit message
> - weer -> were
> - tricy -> tricky
> - Use mac_dev for calling change_addr
> - qman_cgr_create -> qman_create_cgr
> 
> [...]

Here is the summary with links:
  - [RESEND,net-next,v4,01/25] dt-bindings: net: Convert FMan MAC bindings to yaml
    https://git.kernel.org/netdev/net-next/c/ee8433da085e
  - [RESEND,net-next,v4,02/25] net: fman: Convert to SPDX identifiers
    https://git.kernel.org/netdev/net-next/c/8585bdadc247
  - [RESEND,net-next,v4,03/25] net: fman: Don't pass comm_mode to enable/disable
    https://git.kernel.org/netdev/net-next/c/b7d852566a52
  - [RESEND,net-next,v4,04/25] net: fman: Store en/disable in mac_device instead of mac_priv_s
    https://git.kernel.org/netdev/net-next/c/e61406a1955e
  - [RESEND,net-next,v4,05/25] net: fman: dtsec: Always gracefully stop/start
    https://git.kernel.org/netdev/net-next/c/aae73fde7eb3
  - [RESEND,net-next,v4,06/25] net: fman: Get PCS node in per-mac init
    https://git.kernel.org/netdev/net-next/c/478eb957ced6
  - [RESEND,net-next,v4,07/25] net: fman: Store initialization function in match data
    https://git.kernel.org/netdev/net-next/c/28c3948a018d
  - [RESEND,net-next,v4,08/25] net: fman: Move struct dev to mac_device
    https://git.kernel.org/netdev/net-next/c/7bd63966f0cc
  - [RESEND,net-next,v4,09/25] net: fman: Configure fixed link in memac_initialization
    https://git.kernel.org/netdev/net-next/c/9ea4742a55ca
  - [RESEND,net-next,v4,10/25] net: fman: Export/rename some common functions
    https://git.kernel.org/netdev/net-next/c/c496e4d686aa
  - [RESEND,net-next,v4,11/25] net: fman: memac: Use params instead of priv for max_speed
    https://git.kernel.org/netdev/net-next/c/c0e36be156c2
  - [RESEND,net-next,v4,12/25] net: fman: Move initialization to mac-specific files
    (no matching commit)
  - [RESEND,net-next,v4,13/25] net: fman: Mark mac methods static
    (no matching commit)
  - [RESEND,net-next,v4,14/25] net: fman: Inline several functions into initialization
    (no matching commit)
  - [RESEND,net-next,v4,15/25] net: fman: Remove internal_phy_node from params
    (no matching commit)
  - [RESEND,net-next,v4,16/25] net: fman: Map the base address once
    (no matching commit)
  - [RESEND,net-next,v4,17/25] net: fman: Pass params directly to mac init
    (no matching commit)
  - [RESEND,net-next,v4,18/25] net: fman: Use mac_dev for some params
    (no matching commit)
  - [RESEND,net-next,v4,19/25] net: fman: Specify type of mac_dev for exception_cb
    (no matching commit)
  - [RESEND,net-next,v4,20/25] net: fman: Clean up error handling
    (no matching commit)
  - [RESEND,net-next,v4,21/25] net: fman: Change return type of disable to void
    (no matching commit)
  - [RESEND,net-next,v4,22/25] net: dpaa: Use mac_dev variable in dpaa_netdev_init
    (no matching commit)
  - [RESEND,net-next,v4,23/25] soc: fsl: qbman: Add helper for sanity checking cgr ops
    (no matching commit)
  - [RESEND,net-next,v4,24/25] soc: fsl: qbman: Add CGR update function
    (no matching commit)
  - [RESEND,net-next,v4,25/25] net: dpaa: Adjust queue depth on rate change
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


