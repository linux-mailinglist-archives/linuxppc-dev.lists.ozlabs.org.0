Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6749856295F
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Jul 2022 05:10:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LZ0Zl1HPvz3chy
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Jul 2022 13:10:55 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=gPKgbsUy;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=patchwork-bot+netdevbpf@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=gPKgbsUy;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LZ0Z43Y95z3cB7
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  1 Jul 2022 13:10:20 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id C4D3B62267;
	Fri,  1 Jul 2022 03:10:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9EA3CC341D2;
	Fri,  1 Jul 2022 03:10:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1656645016;
	bh=j6jOROreW3+3syekmt4WxahSu3rHsGmaW4t/09lYLIc=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=gPKgbsUyzs4I4RJyu9lVpbKN2yI7K+NPPw386xq1xr14+fisuUOpxKW7VMzVKPj4k
	 0NsCxXvheGLPZaN3weC+rgea+aYwxq2e6U0PiwBACZos1igT7VBuA8knmIn30+Bguo
	 H56ayE/Y6BwPwZt/77JqfVdfFihAxwk4k812pzshsNkttpU67wgw0traLyXrXduwZP
	 03BomcvZ9xO9z5YK3+sbzIC0z2IEqWohWxREaOSR1skW4FDf9qLV9fceWFtMz+l8Ls
	 2G18cT7kfKHAHGUlZzyTw47m14SFZXYP8W5J43wf4TUYU/Tpros5eToc/3MMYvv15L
	 1SyWD1cQaOd+A==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 7570BE49FA2;
	Fri,  1 Jul 2022 03:10:16 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] freescale/fs_enet:fix repeated words in comments
From: patchwork-bot+netdevbpf@kernel.org
Message-Id:  <165664501647.21670.1917049788196328275.git-patchwork-notify@kernel.org>
Date: Fri, 01 Jul 2022 03:10:16 +0000
References: <20220629125441.62420-1-yuanjilin@cdjrlc.com>
In-Reply-To: <20220629125441.62420-1-yuanjilin@cdjrlc.com>
To: Jilin Yuan <yuanjilin@cdjrlc.com>
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
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, linuxppc-dev@lists.ozlabs.org, davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello:

This patch was applied to netdev/net-next.git (master)
by Jakub Kicinski <kuba@kernel.org>:

On Wed, 29 Jun 2022 20:54:41 +0800 you wrote:
> Delete the redundant word 'a'.
> 
> Signed-off-by: Jilin Yuan <yuanjilin@cdjrlc.com>
> ---
>  drivers/net/ethernet/freescale/fs_enet/fs_enet.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Here is the summary with links:
  - freescale/fs_enet:fix repeated words in comments
    https://git.kernel.org/netdev/net-next/c/b1769b6eb06b

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


