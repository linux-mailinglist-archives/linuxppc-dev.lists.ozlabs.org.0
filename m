Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C70E7530E65
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 May 2022 12:50:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L6DdR4mWSz3bn5
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 May 2022 20:50:51 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=O8ti3r6u;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1;
 helo=dfw.source.kernel.org; envelope-from=patchwork-bot+netdevbpf@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=O8ti3r6u; 
 dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L6Dcm659Lz2ync
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 May 2022 20:50:16 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0623E6122C;
 Mon, 23 May 2022 10:50:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 64358C34116;
 Mon, 23 May 2022 10:50:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1653303012;
 bh=RLHeGFzVSDV11EwgnKw/aguWyzZ0qKFGVx4BKotalhQ=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=O8ti3r6uJUFy8dfOhEOy6P1H6Op4O7M1vLHPJMCAZ9TZXpvamhD3Wu+rfaTuyaI1g
 pqIInk2M5nusQ1TvCAWViS+tbNM2JDgYSVoTEcZu4f1MbGK12m3WYn+P67Zkpp/AQX
 U7H8Ap020mgKB31JfFBJPb/ANG5gh3WnEjoqwklT6w2S8nlk+2vg1rtwvY4Zf/eMhz
 wusL14kllR3jsIIg5QOadHSLTXYWGzGbCqp0aGqcKWTEBnJRX2BuZq5BuZVNWbhT6a
 JnRDTqOjfXFfY9hCaJrOAcU8pXxK0HiS5lq8z+Q124slpW87roZnRwG3bZwokK+YqF
 8TSp3gVdIXIGg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 4A8B9F03943; Mon, 23 May 2022 10:50:12 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next] eth: de4x5: remove support for Generic DECchip &
 DIGITAL EtherWORKS PCI/EISA
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <165330301230.7594.1301485592206225247.git-patchwork-notify@kernel.org>
Date: Mon, 23 May 2022 10:50:12 +0000
References: <20220519031345.2134401-1-kuba@kernel.org>
In-Reply-To: <20220519031345.2134401-1-kuba@kernel.org>
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
Cc: tsbogend@alpha.franken.de, linux-parisc@vger.kernel.org, arnd@arndb.de,
 corbet@lwn.net, netdev@vger.kernel.org, sburla@marvell.com,
 linux-doc@vger.kernel.org, linux-mips@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, edumazet@google.com, paulus@samba.org,
 vburru@marvell.com, zhangyue1@kylinos.cn, pabeni@redhat.com,
 aayarekar@marvell.com, davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello:

This patch was applied to netdev/net-next.git (master)
by David S. Miller <davem@davemloft.net>:

On Wed, 18 May 2022 20:13:45 -0700 you wrote:
> Looks like almost all changes to this driver had been tree-wide
> refactoring since git era begun. There is one commit from Al
> 15 years ago which could potentially be fixing a real bug.
> 
> The driver is using virt_to_bus() and is a real magnet for pointless
> cleanups. It seems unlikely to have real users. Let's try to shed
> this maintenance burden.
> 
> [...]

Here is the summary with links:
  - [net-next] eth: de4x5: remove support for Generic DECchip & DIGITAL EtherWORKS PCI/EISA
    https://git.kernel.org/netdev/net-next/c/32c53420d2a0

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


