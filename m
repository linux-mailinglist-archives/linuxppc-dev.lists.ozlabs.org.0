Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5880E38964D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 May 2021 21:10:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FljBQ1V24z3bvR
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 May 2021 05:10:38 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=hfEtSjjj;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=patchwork-bot+netdevbpf@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=hfEtSjjj; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Flj9x0BXQz2xtn
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 May 2021 05:10:12 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPS id D5D3F6108D;
 Wed, 19 May 2021 19:10:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1621451409;
 bh=mgLUY+f2akZHJbZWL/mYxBrxRzaLsj4xwqxjtQgeUMk=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=hfEtSjjjmkJ8yflpHTJVxTH6R+xYqyELxRzaUHLUy8xxXrzlRrwxitY81IsbE39jb
 zDFYb6RTO/xURpftxACtBg/n1BrwHAj4Gv6HBNKrf2MACsTgDQ9cw7ATcWVmG7xav5
 UyzPcKl7sckLAV3cm8tki/TFQgn80Ra2SO1Ub4QOz0PD2uhW7TGnJlFE+xd0C6pDpY
 ujHKc5q0c7HVCwTJsQuiAuFH/uqwtYVNRX1ObFxzs91ocZ/ruLCcW3VYVBlx+151Rl
 jV+Y6egSeSWtjJ6vWojTbxmvWj6KtrdV3vUSB+k+6PUXwKgvPnFMnMMMFafsZUt7rH
 gMQdGdzmSwrfA==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain
 [127.0.0.1])
 by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id C594B60CD2;
 Wed, 19 May 2021 19:10:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next] ibmveth: fix kobj_to_dev.cocci warnings
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <162145140980.13987.12676480557847918732.git-patchwork-notify@kernel.org>
Date: Wed, 19 May 2021 19:10:09 +0000
References: <20210519022849.12752-1-yuehaibing@huawei.com>
In-Reply-To: <20210519022849.12752-1-yuehaibing@huawei.com>
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
Cc: cforno12@linux.ibm.com, dwilder@us.ibm.com, linux-kernel@vger.kernel.org,
 paulus@samba.org, netdev@vger.kernel.org, kuba@kernel.org,
 linuxppc-dev@lists.ozlabs.org, davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello:

This patch was applied to netdev/net-next.git (refs/heads/master):

On Wed, 19 May 2021 10:28:49 +0800 you wrote:
> Use kobj_to_dev() instead of container_of()
> 
> Generated by: scripts/coccinelle/api/kobj_to_dev.cocci
> 
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> ---
>  drivers/net/ethernet/ibm/ibmveth.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)

Here is the summary with links:
  - [net-next] ibmveth: fix kobj_to_dev.cocci warnings
    https://git.kernel.org/netdev/net-next/c/1756055de284

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


