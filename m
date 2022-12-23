Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E0EF9654AA1
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Dec 2022 03:01:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NdVlT64T5z3c7N
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Dec 2022 13:01:09 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=btHwIS4z;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=patchwork-bot+netdevbpf@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=btHwIS4z;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NdVkW5Yqnz2yZv
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Dec 2022 13:00:19 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id AE6C261E0F;
	Fri, 23 Dec 2022 02:00:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0939AC433F0;
	Fri, 23 Dec 2022 02:00:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1671760816;
	bh=fwvSWB2s9SlQYbz2JB6wiQ2msaLPGTMWu5lU92DYC+E=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=btHwIS4z9bWPNKT/itvQrcnefxYcnYFFv9qBBqDBUODtO65DqipfHJY3Ju8IxftQf
	 qOOUE6EgQamu+0KE+UM0z+UuK9L8ODhufAiGUYnv59Y4NJsIXYCSGSsxo3q+brqQWh
	 vE2ECsxds1R2GvYQoOwL+lk0IiqoUrwpDCOXAclbrIC8M676lhpH+eg/TVKiD2XqBG
	 Lujz/0WF5VAsmJV5ujV9wtJQP0ygb03OAz5csnAGpjMCO4fd/yeK8R7KMU61N5x3IY
	 wBoFnzbOnqjDyft7f+DxUC7nIz9BJmQ/TcLE+PepokxANS3S3pfYvdCJIKQbP4d/uV
	 n/ZPNDYKmrOrw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id E05A9C5C7C4;
	Fri, 23 Dec 2022 02:00:15 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net v2] powerpc: dts: t208x: Disable 10G on MAC1 and MAC2
From: patchwork-bot+netdevbpf@kernel.org
Message-Id:  <167176081591.4251.11693761416005779690.git-patchwork-notify@kernel.org>
Date: Fri, 23 Dec 2022 02:00:15 +0000
References: <20221216172937.2960054-1-sean.anderson@seco.com>
In-Reply-To: <20221216172937.2960054-1-sean.anderson@seco.com>
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
Cc: devicetree@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, npiggin@gmail.com, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, linuxppc-dev@lists.ozlabs.org, davem@davemloft.net, camelia.groza@nxp.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello:

This patch was applied to netdev/net.git (master)
by Jakub Kicinski <kuba@kernel.org>:

On Fri, 16 Dec 2022 12:29:37 -0500 you wrote:
> There aren't enough resources to run these ports at 10G speeds. Disable
> 10G for these ports, reverting to the previous speed.
> 
> Fixes: 36926a7d70c2 ("powerpc: dts: t208x: Mark MAC1 and MAC2 as 10G")
> Reported-by: Camelia Alexandra Groza <camelia.groza@nxp.com>
> Signed-off-by: Sean Anderson <sean.anderson@seco.com>
> 
> [...]

Here is the summary with links:
  - [net,v2] powerpc: dts: t208x: Disable 10G on MAC1 and MAC2
    https://git.kernel.org/netdev/net/c/8d8bee13ae9e

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


