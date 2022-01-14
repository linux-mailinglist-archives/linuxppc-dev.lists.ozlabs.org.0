Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A076048E930
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Jan 2022 12:30:54 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JZzd82vDXz3bbM
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Jan 2022 22:30:52 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=BnVKdrWa;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1;
 helo=dfw.source.kernel.org; envelope-from=patchwork-bot+netdevbpf@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=BnVKdrWa; 
 dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JZzcS0C5Fz2y8P
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Jan 2022 22:30:15 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2D9CE61F1C;
 Fri, 14 Jan 2022 11:30:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id BEEB4C36AF2;
 Fri, 14 Jan 2022 11:30:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1642159810;
 bh=E5LT+oAo5Fk/JdTiZrtl9GV7Ce9I5RZcBDE51mYUc74=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=BnVKdrWa7BDhVsEmHiiU5QgsGhaQe2wkrLy6e26CVmcjVW4zvssLUBiA5RwtiuE1A
 D5rm0QuZQzxOWZLlj7ZFbESihxHiQsFtgXdZlzEnqGtL86LyuArl0aMJyyos00bHGl
 d85MDkMMzrvzDvyn4lh+NwSJBUOag2UIQL85h2N9nyLs46bDuRC2d4yZNUm8D15MmI
 CviYRyAphES/BtmIB1+yMvmJPiCw7WA4dnZ0V5F4GPkZ4Ehfwe6QAkhDByx53NKUSK
 aZ4bT6ynngjgraNceyIwhzyhH9X2qFIaOk+JzUFOXuAf/8HJlXLi7LBLHKQf3D8VOw
 s1VhzvDP7O+0Q==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 7AED7F6079E; Fri, 14 Jan 2022 11:30:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] net: apple: bmac: Fix build since dev_addr constification
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <164215981049.30922.9359003030904189013.git-patchwork-notify@kernel.org>
Date: Fri, 14 Jan 2022 11:30:10 +0000
References: <20220114031316.2419293-1-mpe@ellerman.id.au>
In-Reply-To: <20220114031316.2419293-1-mpe@ellerman.id.au>
To: Michael Ellerman <mpe@ellerman.id.au>
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
Cc: netdev@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, davem@davemloft.net,
 kuba@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello:

This patch was applied to netdev/net.git (master)
by David S. Miller <davem@davemloft.net>:

On Fri, 14 Jan 2022 14:13:16 +1100 you wrote:
> Since commit adeef3e32146 ("net: constify netdev->dev_addr") the bmac
> driver no longer builds with the following errors (pmac32_defconfig):
> 
>   linux/drivers/net/ethernet/apple/bmac.c: In function ‘bmac_probe’:
>   linux/drivers/net/ethernet/apple/bmac.c:1287:20: error: assignment of read-only location ‘*(dev->dev_addr + (sizetype)j)’
>    1287 |   dev->dev_addr[j] = rev ? bitrev8(addr[j]): addr[j];
>         |                    ^
> 
> [...]

Here is the summary with links:
  - net: apple: bmac: Fix build since dev_addr constification
    https://git.kernel.org/netdev/net/c/ea938248557a

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


