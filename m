Return-Path: <linuxppc-dev+bounces-2115-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A346D99A370
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Oct 2024 14:10:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XQ56v59hZz3c03;
	Fri, 11 Oct 2024 23:10:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728648631;
	cv=none; b=exrQvaS2VHBCZ8yUh3ViuVr/2IcG2xmpV1VwO081OY8xpWShJxEqytOOYxWgotSNHTN82i5mQbJOLWl1H3aSaTUuc3O5V6ZFaIXFzuypd62LkKjmObH+kIhaAJhJcY6AE+c89ZbsWljSFKvaCzx7POb+A9qGYV05P28KZJZEcdJOs6L1ES++B6cSHlxvltp6JvwVaCYuz8AMNtqGjgDOvHjw/d6Wv4C39t+iHN+ovD9y57j1dM9VvOB4woR/v/0i3F9FU1uYuO+Uh5TGQdcVX3B0dCu2zX9vm7RdUIUQThILlyT5h33GNdbyqndLlrykC15xEEie+uSx9Gtf5Do/ew==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728648631; c=relaxed/relaxed;
	bh=1ISnlOQeIgfkX7GKWq5iJi8B9L7WsuASuNcSmx24Vxc=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=bxyfMCdDsFAV/H29dtpoNgoBWhCVTv0xYUtCX3/XuIErVEbs/6dPPtBk7Rnyy870aeJABph9Q5esVigvWoJbI1/iRJCiw+sDqRS7NW7s++dPEwiC+86Cz7eeru+3AnXmcQMsJXHHdygWdqe4x3y3cKnl1CuEsd8tCekp05z3GZ0sj3KvUKehc3sx1YWrfNZn7qwZX8RMT7eUykIedpO6ululOQNIozwtv8E2K3n34ftQQLihNqDDvyHvg7BK7r3VXQL0GNxWKaSuMBBkQ6XBs/2iX2DGYPkozJSl4pCbsnqaAq6B44ltUUdYjn3SbR8qUNDRI5wokO/M+c9uVdTlgw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=MMggbeoO; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=patchwork-bot+netdevbpf@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=MMggbeoO;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=patchwork-bot+netdevbpf@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XQ56t49Q5z3c01
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Oct 2024 23:10:30 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id D2B18A43E72;
	Fri, 11 Oct 2024 12:10:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32CD1C4CECC;
	Fri, 11 Oct 2024 12:10:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728648627;
	bh=QsWhg1lPTy3xAXP6qpwZyfL4P1tilWHSFqdyzad3j40=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=MMggbeoOZIDWYva2gyVPbsA18OBrYiUIncQeNizMo2465ZLLSHcF/mu4zoELbkv8x
	 uFQUbLajDOG5+POY0aHajh6AbNxHYvAbNOD0mSm6O9yD7LpIhTFkyVqy9+zWewFEXC
	 puNTTA31Dp9cjqB0jTahT24oN+/IR1r5gkqNbGPrG+U6kNlnTXY1yTxAjjVRBERK0s
	 +ojLcILDgKUufReYbUHACMWdJysLI8aiL9MyXuqUXIgNVUrSmMy/uM9GLHQepRhoA0
	 tGWNSkQbPenefNhG7PWTvVg/bCctqvhaC34FR/J7l8A793CWYH/4Zxhd7XEbz8cIhF
	 nDvH0pfvn2viA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EAEE33822E4C;
	Fri, 11 Oct 2024 12:10:32 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next] eth: remove the DLink/Sundance (ST201) driver
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <172864863175.2796508.4724823416498296056.git-patchwork-notify@kernel.org>
Date: Fri, 11 Oct 2024 12:10:31 +0000
References: <20241008154824.1448370-1-kuba@kernel.org>
In-Reply-To: <20241008154824.1448370-1-kuba@kernel.org>
To: Jakub Kicinski <kuba@kernel.org>
Cc: davem@davemloft.net, netdev@vger.kernel.org, edumazet@google.com,
 pabeni@redhat.com, kda@linux-powerpc.org, arnd@arndb.de,
 tsbogend@alpha.franken.de, mpe@ellerman.id.au, npiggin@gmail.com,
 christophe.leroy@csgroup.eu, naveen@kernel.org, maddy@linux.ibm.com,
 pctammela@mojatatu.com, victor@mojatatu.com, coelacanthushex@gmail.com,
 jhs@mojatatu.com, horms@kernel.org, shannon.nelson@amd.com,
 sd@queasysnail.net, linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Hello:

This patch was applied to netdev/net-next.git (main)
by David S. Miller <davem@davemloft.net>:

On Tue,  8 Oct 2024 08:48:24 -0700 you wrote:
> Konstantin reports the maintainer's address bounces.
> There is no other maintainer and the driver is quite old.
> There is a good chance nobody is using this driver any more.
> Let's try to remove it completely, we can revert it back in
> if someone complains.
> 
> Link: https://lore.kernel.org/20240925-bizarre-earwig-from-pluto-1484aa@lemu/
> Signed-off-by: Jakub Kicinski <kuba@kernel.org>
> 
> [...]

Here is the summary with links:
  - [net-next] eth: remove the DLink/Sundance (ST201) driver
    https://git.kernel.org/netdev/net-next/c/8401a108a633

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



