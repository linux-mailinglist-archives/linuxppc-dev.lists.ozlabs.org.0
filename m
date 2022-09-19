Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C24E55BD643
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Sep 2022 23:21:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MWczW4p2Vz3c34
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Sep 2022 07:20:55 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Ou2550Hn;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=patchwork-bot+netdevbpf@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Ou2550Hn;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MWcys1981z2xJN
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Sep 2022 07:20:20 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 852566207D;
	Mon, 19 Sep 2022 21:20:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 71C4EC433C1;
	Mon, 19 Sep 2022 21:20:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663622414;
	bh=akJpHY6MQEHvLsC1Re27oJlE5aMX8u2E99iMcnMhMxc=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=Ou2550HnOwwWMe8oYpmod5gb+LfI4zWiwDtuDKmGlpOgOuf7mJOZG29hiSbscQpJx
	 0EWw2EhGr5AZAWOuFhc9og2EcL4FWxvEub/YIl/pxZTqDB+CEyjV+lEUfhsTteo2gR
	 /o/2RcYS5+Gro9dovTXax0TYykVO+PLI7c8RW+isu47qH+AKufD8hjb3cvTCF1Ye6R
	 lR5w0eK5Ns7pG2ETmUqrTD0LQSPBOmo4FOoZk74qrL1UR97eQGmMH0rchbmO2x2nGV
	 50v68fpor0BSq5JrsgtKlz5PM74HbXG08hYQF6hpZpj2g541BINxxJ9+POpFvx8CIW
	 knlpDcCMB8g5g==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 50A83E52536;
	Mon, 19 Sep 2022 21:20:14 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] net: ethernet: remove fs_mii_disconnect and fs_mii_connect
 declarations
From: patchwork-bot+netdevbpf@kernel.org
Message-Id:  <166362241432.4330.4829794093210572810.git-patchwork-notify@kernel.org>
Date: Mon, 19 Sep 2022 21:20:14 +0000
References: <20220909062959.1144493-1-cuigaosheng1@huawei.com>
In-Reply-To: <20220909062959.1144493-1-cuigaosheng1@huawei.com>
To: Gaosheng Cui <cuigaosheng1@huawei.com>
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
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, edumazet@google.com, vbordug@ru.mvista.com, kuba@kernel.org, pabeni@redhat.com, linuxppc-dev@lists.ozlabs.org, davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello:

This patch was applied to netdev/net-next.git (master)
by Jakub Kicinski <kuba@kernel.org>:

On Fri, 9 Sep 2022 14:29:59 +0800 you wrote:
> fs_mii_disconnect and fs_mii_connect have been removed since
> commit 5b4b8454344a ("[PATCH] FS_ENET: use PAL for mii management"),
> so remove them.
> 
> Signed-off-by: Gaosheng Cui <cuigaosheng1@huawei.com>
> ---
>  drivers/net/ethernet/freescale/fs_enet/fs_enet-main.c | 3 ---
>  1 file changed, 3 deletions(-)

Here is the summary with links:
  - net: ethernet: remove fs_mii_disconnect and fs_mii_connect declarations
    https://git.kernel.org/netdev/net-next/c/feceb24ed79a

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


