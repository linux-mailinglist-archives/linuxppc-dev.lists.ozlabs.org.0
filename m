Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 385E77816D6
	for <lists+linuxppc-dev@lfdr.de>; Sat, 19 Aug 2023 04:51:18 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=FveI6L/c;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RSNY00jjjz3cVD
	for <lists+linuxppc-dev@lfdr.de>; Sat, 19 Aug 2023 12:51:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=FveI6L/c;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=patchwork-bot+netdevbpf@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RSNX65H5sz2xH6
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 19 Aug 2023 12:50:30 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 3DE5263C18;
	Sat, 19 Aug 2023 02:50:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5C374C43395;
	Sat, 19 Aug 2023 02:50:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692413425;
	bh=0jJt8m5yFKtJxamI0Ci5sBIWPYUY9djOARET/LN3jGs=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=FveI6L/ct3DXIsrGYU/0IeM/in60JziOIg65M/gNf9QPvxCBrSLsBvf87Jk/mI1c7
	 y10rwADS58M7UznOEg7nYXU7WWi1q1FyAafPejmmqzCJnpewlWSqMKB/oZ3q+Izjlu
	 Ltaw/+YhMjR4kQwrCypOdRR1aUs/yM5XMiMCC1/t3+a6GSLhPfrL+ao5XW8I4SnqGn
	 aPT5s+RJsYsThmrOKtREyz/LLRVdjtYT9Tf8e4CmMALH06uIgj7CjaFexS2RUtjYk1
	 CgmGYUY2k/7Kr7VWNSTMk3CpyVyJBZehKxh67CVaNicv1Z0EsSdRWrBDYNCXrvoC2L
	 8vsmCqDy8tZ2Q==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 48DE6E1F65A;
	Sat, 19 Aug 2023 02:50:25 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next] net: freescale: Remove unused declarations
From: patchwork-bot+netdevbpf@kernel.org
Message-Id:  <169241342529.21912.8905041170100218080.git-patchwork-notify@kernel.org>
Date: Sat, 19 Aug 2023 02:50:25 +0000
References: <20230817134159.38484-1-yuehaibing@huawei.com>
In-Reply-To: <20230817134159.38484-1-yuehaibing@huawei.com>
To: Yue Haibing <yuehaibing@huawei.com>
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
Cc: madalin.bucur@nxp.com, sean.anderson@seco.com, netdev@vger.kernel.org, edumazet@google.com, camelia.groza@nxp.com, kuba@kernel.org, pabeni@redhat.com, linuxppc-dev@lists.ozlabs.org, davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello:

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Thu, 17 Aug 2023 21:41:59 +0800 you wrote:
> Commit 5d93cfcf7360 ("net: dpaa: Convert to phylink") removed
> fman_set_mac_active_pause()/fman_get_pause_cfg() but not declarations.
> Commit 48257c4f168e ("Add fs_enet ethernet network driver, for several
> embedded platforms.") declared but never implemented
> fs_enet_platform_init() and fs_enet_platform_cleanup().
> 
> Signed-off-by: Yue Haibing <yuehaibing@huawei.com>
> 
> [...]

Here is the summary with links:
  - [net-next] net: freescale: Remove unused declarations
    https://git.kernel.org/netdev/net-next/c/cb49ec034924

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


