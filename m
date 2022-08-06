Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 25C8358B350
	for <lists+linuxppc-dev@lfdr.de>; Sat,  6 Aug 2022 04:01:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M05KP1xDGz3bXZ
	for <lists+linuxppc-dev@lfdr.de>; Sat,  6 Aug 2022 12:00:57 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=tyU80Vha;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=patchwork-bot+netdevbpf@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=tyU80Vha;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M05Jk5Jtyz3bXD
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  6 Aug 2022 12:00:22 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 37626B829D8;
	Sat,  6 Aug 2022 02:00:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id CDD49C433B5;
	Sat,  6 Aug 2022 02:00:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1659751215;
	bh=YbVhrt9J/yvNayPVU5J1z+GqJ+1XOJjcl7TC5yN1WZE=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=tyU80Vha90quApWYdqZhUeQgNPFpOeWn/pks2C8Oo08GC2rqcRMx4jF5Qwusmp4QA
	 yQlvLfQY/OqYDYK2HQlL5H/Ghp60SCUpG+Hy21swd6wSRGQeQQFVCClwV1mwsUElLT
	 Lz3ZrquILGnF9PJHpgDpxxgtsfz97WXPCUuOBNq8/x1w3MBecyG5l3CsHEAHF9KgS9
	 TLo+WUtoeHYbBJ70WkaBcltgnXzHdfqqgsfBGz9DXDfQS1ie0mEvHPoCaXl0vtji7a
	 4iZpbgosv5YFTVBNthMKpM+FuaU2NVbIs77OVItyb1+M6WaQDhTBrrGvQNKoEFejFy
	 OEmSnQQV//etQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id B3ADAC43140;
	Sat,  6 Aug 2022 02:00:15 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] MAINTAINERS: Update ibmveth maintainer
From: patchwork-bot+netdevbpf@kernel.org
Message-Id:  <165975121572.22545.734294955087814195.git-patchwork-notify@kernel.org>
Date: Sat, 06 Aug 2022 02:00:15 +0000
References: <20220803155246.39582-1-nnac123@linux.ibm.com>
In-Reply-To: <20220803155246.39582-1-nnac123@linux.ibm.com>
To: Nick Child <nnac123@linux.ibm.com>
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
Cc: netdev@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello:

This patch was applied to netdev/net.git (master)
by Jakub Kicinski <kuba@kernel.org>:

On Wed,  3 Aug 2022 10:52:46 -0500 you wrote:
> Add Nick Child as the maintainer of the IBM Power Virtual Ethernet
> Device Driver, replacing Cristobal Forno.
> 
> Signed-off-by: Nick Child <nnac123@linux.ibm.com>
> ---
>  MAINTAINERS | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Here is the summary with links:
  - MAINTAINERS: Update ibmveth maintainer
    https://git.kernel.org/netdev/net/c/8a5dfc28af9a

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


