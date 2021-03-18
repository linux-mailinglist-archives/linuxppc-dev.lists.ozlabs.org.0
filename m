Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 05C3E340FCF
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Mar 2021 22:30:39 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F1gDY0Vs2z3c1Z
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Mar 2021 08:30:37 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=g6I43FoE;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=patchwork-bot+netdevbpf@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=g6I43FoE; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F1gD90sP8z30JK
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Mar 2021 08:30:16 +1100 (AEDT)
Received: by mail.kernel.org (Postfix) with ESMTPS id 09E0D64EB6;
 Thu, 18 Mar 2021 21:30:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1616103010;
 bh=njIxVbMP2TpTidEcVGE5rBGrmzNdINWBbtvz4f0g1ng=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=g6I43FoETF+MB+kPHxHCwCYSvq/G7LTyRtol75wG5QaeKWl3arXJhD24o1CjqhUQm
 MNq1eU0yIyMNlfwqTkLC4R1nQmvGJr8kw2fzQQdLRG2YB6y1TTjQGdbuYfD7QySHEt
 aKSF9PyckCyKN6AJ+KI2xceg1REzlKllFeea6BYDz1g05j4P6mrjFwdEaviSyCwpjn
 ZAz2UktEnta2yzz3hgfgJlUi4vOyyKC2Zv9piQStddIdxHibEbhXIlT8FMEAQIdp1J
 pqPXbot+XRoydmc5CQcEtc741N24cvWgY/CPANz98OwIPPwH50u8xto0xVGCok8ZmG
 RU0n23r7b6Gtw==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain
 [127.0.0.1])
 by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id ED34960951;
 Thu, 18 Mar 2021 21:30:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] net: marvell: Remove reference to CONFIG_MV64X60
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <161610300996.15925.6620318542461392361.git-patchwork-notify@kernel.org>
Date: Thu, 18 Mar 2021 21:30:09 +0000
References: <7fc233cfbda60b87894c3f4a3b0d1e63fdb24b37.1616085654.git.christophe.leroy@csgroup.eu>
In-Reply-To: <7fc233cfbda60b87894c3f4a3b0d1e63fdb24b37.1616085654.git.christophe.leroy@csgroup.eu>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
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
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kuba@kernel.org,
 linuxppc-dev@lists.ozlabs.org, davem@davemloft.net,
 sebastian.hesselbarth@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello:

This patch was applied to netdev/net.git (refs/heads/master):

On Thu, 18 Mar 2021 17:25:08 +0000 (UTC) you wrote:
> Commit 92c8c16f3457 ("powerpc/embedded6xx: Remove C2K board support")
> removed last selector of CONFIG_MV64X60.
> 
> As it is not a user selectable config item, all references to it
> are stale. Remove them.
> 
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> 
> [...]

Here is the summary with links:
  - net: marvell: Remove reference to CONFIG_MV64X60
    https://git.kernel.org/netdev/net/c/600cc3c9c62d

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


