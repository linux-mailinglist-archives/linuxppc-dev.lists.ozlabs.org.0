Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 36F72943DDF
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Aug 2024 03:11:17 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=hSpq9c+7;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WZ9rz0rdyz3cfm
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Aug 2024 11:11:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=hSpq9c+7;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=patchwork-bot+netdevbpf@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WZ9rH2Kc8z30TZ
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Aug 2024 11:10:39 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9984D626EB;
	Thu,  1 Aug 2024 01:10:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 44D88C4AF0C;
	Thu,  1 Aug 2024 01:10:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722474637;
	bh=iJtqiAXqX0LwxAhBTKTJEZ3kteVZpRMr4hNaCqlp3Z0=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=hSpq9c+7ucTqqSamea53A4yOmCM0BtaeXgsKY7gCYPqzUCBIJ9xLMyUO+15GxxKf1
	 2D2Ovvzj5jTWMTuVqRZqjOsTnFjhnSAxE38s2mHeYjDsvVWBhKSLiWs0LvaAPo1//w
	 G9XWDUDl8aCqLMmKpJEbZymEEtBsk0gLMPvshv5OUhNYE08UEwIvrZZbP6TQOhUKtS
	 UlToWm1qXqQF6vCapVJp51OlMFndXIXwxDcgZ2m+7nXXKeFzO3LZiV0hnlCN5LjN1W
	 uzP7m3usl/fnk3CvIzbj8DBd5BESdeXW8ymDR5mVGVKM90kAyoKW6zk2r/PlQwACX5
	 q8eqW9dwoPqjQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 2E43AC6E396;
	Thu,  1 Aug 2024 01:10:37 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net v1] net: wan: fsl_qmc_hdlc: Convert carrier_lock spinlock
 to a mutex
From: patchwork-bot+netdevbpf@kernel.org
Message-Id:  <172247463718.20901.3118468784661815872.git-patchwork-notify@kernel.org>
Date: Thu, 01 Aug 2024 01:10:37 +0000
References: <20240730063104.179553-1-herve.codina@bootlin.com>
In-Reply-To: <20240730063104.179553-1-herve.codina@bootlin.com>
To: Herve Codina <herve.codina@bootlin.com>
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
Cc: andriy.shevchenko@linux.intel.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, christophe.leroy@csgroup.eu, edumazet@google.com, stable@vger.kernel.org, thomas.petazzoni@bootlin.com, kuba@kernel.org, pabeni@redhat.com, linuxppc-dev@lists.ozlabs.org, davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello:

This patch was applied to netdev/net.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Tue, 30 Jul 2024 08:31:04 +0200 you wrote:
> The carrier_lock spinlock protects the carrier detection. While it is
> hold, framer_get_status() is called witch in turn takes a mutex.
> This is not correct and can lead to a deadlock.
> 
> A run with PROVE_LOCKING enabled detected the issue:
>   [ BUG: Invalid wait context ]
>   ...
>   c204ddbc (&framer->mutex){+.+.}-{3:3}, at: framer_get_status+0x40/0x78
>   other info that might help us debug this:
>   context-{4:4}
>   2 locks held by ifconfig/146:
>   #0: c0926a38 (rtnl_mutex){+.+.}-{3:3}, at: devinet_ioctl+0x12c/0x664
>   #1: c2006a40 (&qmc_hdlc->carrier_lock){....}-{2:2}, at: qmc_hdlc_framer_set_carrier+0x30/0x98
> 
> [...]

Here is the summary with links:
  - [net,v1] net: wan: fsl_qmc_hdlc: Convert carrier_lock spinlock to a mutex
    https://git.kernel.org/netdev/net/c/c4d6a347ba7b

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


