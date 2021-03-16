Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5709533E1AF
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Mar 2021 23:50:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F0T5j2fbPz3bqm
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Mar 2021 09:50:33 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=XR4Dpqbh;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=patchwork-bot+netdevbpf@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=XR4Dpqbh; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F0T5H5Vmcz30Bt
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Mar 2021 09:50:11 +1100 (AEDT)
Received: by mail.kernel.org (Postfix) with ESMTPS id C815464F41;
 Tue, 16 Mar 2021 22:50:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1615935008;
 bh=xIH2gb/CofT4JE6aVd1zdg0czU7V4ufYezWAVdq4PTo=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=XR4Dpqbhung/mG8SuTO+rIzqfx6LRQQPV9h7lRV1hENI+Bvay+CwIWHvRnJI0wDK5
 Bmeaa58TuDOG1RWiVt1mkq1h2eZHJowKIrmAzGTmmZmo46W9XeOo24bGo4CmjkXOMG
 9bGcxT/G9wxbJfTnKsdCwiygGF3YxBf9hoBhLWz4OjR8QnL2gZsS4PbUyOwUtAjQT0
 vrit07yhdwivJOifLLPiGHdgFBk7tepgsCxZNzKTuTSewZjBFsbRapKGOsQwnfqz+w
 uTtfMSqAdVVTXK1FtN5llxfEO/JtGbYHVzslnOOnN3C69pCbDmV+y6U9RAAi2W3X1Q
 b3oyzH6nb/XxQ==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain
 [127.0.0.1])
 by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id B95B360A60;
 Tue, 16 Mar 2021 22:50:08 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] MAINTAINERS: Update Spidernet network driver
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <161593500875.15002.17476700812563690539.git-patchwork-notify@kernel.org>
Date: Tue, 16 Mar 2021 22:50:08 +0000
References: <6399e3a4-c8b0-e015-c766-07cbb87780ab@infradead.org>
In-Reply-To: <6399e3a4-c8b0-e015-c766-07cbb87780ab@infradead.org>
To: Geoff Levand <geoff@infradead.org>
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
Cc: kuba@kernel.org, netdev@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello:

This patch was applied to netdev/net.git (refs/heads/master):

On Tue, 16 Mar 2021 10:13:52 -0700 you wrote:
> Change the Spidernet network driver from supported to
> maintained, add the linuxppc-dev ML, and add myself as
> a 'maintainer'.
> 
> Cc: Ishizaki Kou <kou.ishizaki@toshiba.co.jp>
> Signed-off-by: Geoff Levand <geoff@infradead.org>
> 
> [...]

Here is the summary with links:
  - MAINTAINERS: Update Spidernet network driver
    https://git.kernel.org/netdev/net/c/fc649670ba50

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


