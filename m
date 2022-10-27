Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B131460F65D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Oct 2022 13:41:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MykK24F5Jz3cGm
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Oct 2022 22:41:10 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=WVl8EVgZ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=patchwork-bot+netdevbpf@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=WVl8EVgZ;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MykJ51C3Kz2yy7
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Oct 2022 22:40:21 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 6FF87622A2;
	Thu, 27 Oct 2022 11:40:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C2BF1C433D7;
	Thu, 27 Oct 2022 11:40:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1666870815;
	bh=RF8Y5zep0x7rqgzfxQFPqd8WIra/ygMKrhNsxfV1RTQ=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=WVl8EVgZN0s4jNjH5Tj/pQZxm/GFX87VFUfxglOs9BnLSmY1nhojE6HCwRyRjtnUT
	 LfCWrV+nBN9A8UfHHqVXxDscWqDL7UIqkrmeT/i8bN4eUp+y/xJYELalaOrJl393Hw
	 8jNBKV8DMbij0C/m7qmL0OfN/JBZte90qqc16ppwfmoK1KD4C3ZMfwyCE8B4Sf/MpJ
	 eSkzJvVN7E+NNi4XsZDJeHyeefFCxhRk6c6s9BaqZ4Uzext2SwCjbVlEn6qNw/APW7
	 ydJyuiee4sdQDnmChMBf27OwVou0X5625IAN8JisbSdpk6WgVx5oOHG6kRcsrDm77c
	 kmqd6ZPbfTm2w==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id A1BEAE270D8;
	Thu, 27 Oct 2022 11:40:15 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next] eth: fealnx: delete the driver for Myson MTD-800
From: patchwork-bot+netdevbpf@kernel.org
Message-Id:  <166687081565.19214.14130841762810817464.git-patchwork-notify@kernel.org>
Date: Thu, 27 Oct 2022 11:40:15 +0000
References: <20221025184254.1717982-1-kuba@kernel.org>
In-Reply-To: <20221025184254.1717982-1-kuba@kernel.org>
To: Jakub Kicinski <kuba@kernel.org>
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
Cc: petrm@nvidia.com, tsbogend@alpha.franken.de, leon@kernel.org, arnd@arndb.de, netdev@vger.kernel.org, linux-mips@vger.kernel.org, npiggin@gmail.com, stephen@networkplumber.org, wsa+renesas@sang-engineering.com, lukas.bulwahn@gmail.com, shayagr@amazon.com, mw@semihalf.com, linuxppc-dev@lists.ozlabs.org, davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello:

This patch was applied to netdev/net-next.git (master)
by Paolo Abeni <pabeni@redhat.com>:

On Tue, 25 Oct 2022 11:42:54 -0700 you wrote:
> The git history for this driver seems to be completely
> automated / tree wide changes. I can't find any boards
> or systems which would use this chip. Google search
> shows pictures of towel warmers and no networking products.
> 
> Signed-off-by: Jakub Kicinski <kuba@kernel.org>
> 
> [...]

Here is the summary with links:
  - [net-next] eth: fealnx: delete the driver for Myson MTD-800
    https://git.kernel.org/netdev/net-next/c/d5e2d038dbec

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


