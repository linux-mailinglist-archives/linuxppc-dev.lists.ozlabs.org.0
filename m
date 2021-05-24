Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5631638DF0D
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 May 2021 04:00:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FpL5x2TYCz300P
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 May 2021 12:00:53 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=o98bkmHF;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=patchwork-bot+netdevbpf@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=o98bkmHF; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FpL591y6lz3014
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 May 2021 12:00:12 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPS id 541CC610FA;
 Mon, 24 May 2021 02:00:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1621821609;
 bh=uge5Dg7VE4PLgrFz8mpzqnYhf/xY4NpY9/Haz6SYHXU=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=o98bkmHFnp8vkfLmG+8ieQe8E5XVlqa7XXetAUqyKxSruztv45QV0I6AGbBuyB+rO
 Jtu6Fab2cr3ypPbhgPpctwOEusCVYO5/iX7WlW+bdS5J2qA1ARXOXvbrUhLfREjXF0
 JZwtNCgBX0sFZCOao7kXyiC1Vg00O2NUThy/rgx9D7L/DdGw7hgZ79vLnNdNAcKwoJ
 So6WpV3gTFyoRpzqCOc9YyDSOkmCztt5E/LX8w5ey8n2uGVvyIJDNg/HjWO8TE4T5H
 c0Ly+tCTTfWbf/2PuiI70Jngug446YFcyq/I1f7n1vljq1x8SgWsEwdXPkekuPWkHN
 hE2JfgPYjKZiA==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain
 [127.0.0.1])
 by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 48B8660BD8;
 Mon, 24 May 2021 02:00:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2 net-next] ethernet: ucc_geth: Use kmemdup() rather than
 kmalloc+memcpy
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <162182160929.2555.6400143269658856505.git-patchwork-notify@kernel.org>
Date: Mon, 24 May 2021 02:00:09 +0000
References: <20210524010701.24596-1-yuehaibing@huawei.com>
In-Reply-To: <20210524010701.24596-1-yuehaibing@huawei.com>
To: YueHaibing <yuehaibing@huawei.com>
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
Cc: andrew@lunn.ch, rasmus.villemoes@prevas.dk, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, leoyang.li@nxp.com, kuba@kernel.org,
 linuxppc-dev@lists.ozlabs.org, davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello:

This patch was applied to netdev/net-next.git (refs/heads/master):

On Mon, 24 May 2021 09:07:01 +0800 you wrote:
> Issue identified with Coccinelle.
> 
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> ---
> v2: keep kmemdup oneline
> 
>  drivers/net/ethernet/freescale/ucc_geth.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)

Here is the summary with links:
  - [v2,net-next] ethernet: ucc_geth: Use kmemdup() rather than kmalloc+memcpy
    https://git.kernel.org/netdev/net-next/c/ec7d6dd870d4

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


