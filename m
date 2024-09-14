Return-Path: <linuxppc-dev+bounces-1369-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C844E978D53
	for <lists+linuxppc-dev@lfdr.de>; Sat, 14 Sep 2024 06:30:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X5JBt0cxdz2yGL;
	Sat, 14 Sep 2024 14:30:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:4641:c500::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726288246;
	cv=none; b=iREYVW0mORDnEfvd5zNt9zuUo/3e8FqW/IUxfbs5ANAt10297giX4/y9GKpCpJNeSce0o/jtlm+D2GKkD9KvdUEj3EhJoqUlTKEJ+41hO0Tb4anULgvEMVo48qCG9YSwVDA09tt9B82OuE4fBgW7oAukzIIpmguwZ/+mzowQsaRB//Eta6ymcFuG6gv6v3WB6WkFxQCDG2pjNZgvaxV5UZ5CpmjVuAuUbNFVeWDo0mFeygzfZTmTLGzWA31c0UXEcaDTvkYLysT2gxdafpmKKdvMy7HUSAQXfsk6OgSfsMwNnfdxA0LV3EH6pQECjrkK6VkZFDF6f4+7OqRPYrSjRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726288246; c=relaxed/relaxed;
	bh=iGwjGWqdPwHhtC4o3Dl8lvDqWrYwoXW8dpHSoEBLLvs=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=c0+1nVLkM/RdSS58OJz6vlfdfM/6ZfMmXPZpyMO9J0liMOz7iBLxvannv7wAxL+oW5fM2/0RUfMQyGWvIRqvt3f2QlP9lKLkHn8N3ud6pS8TfIeTXxOnCGjsqa8SBvRc8V7C5w8w/AJa8CbEkzFGo8I4HpMdL0PHMvFl3Kq6j/JAeLIdApzstJqBTXl532RIjQUUBrDu4rQaxYDUvdacdjxyfiLBkaHoYRC0I2D6MVBxJ1M/wZG1p+1FrtKHZVdO0t8yAThy+8AQ6KssH87pPu/XeF8lw2Zpgnap3IGFMgIuqn9PQL4LnLl5gcRM43HWLA5sHwF/W8RI8lDDBWDEkA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=h6ftL7aI; dkim-atps=neutral; spf=pass (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=patchwork-bot+netdevbpf@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=h6ftL7aI;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=patchwork-bot+netdevbpf@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X5JBs5QQBz2xvH
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 14 Sep 2024 14:30:45 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 01D095C0641;
	Sat, 14 Sep 2024 04:30:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D913C4CEC0;
	Sat, 14 Sep 2024 04:30:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726288241;
	bh=EOEQiPa9JzgjyE2T7e5qIcCS5O315/C7fyMKNclj6Og=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=h6ftL7aIkAxoGX8UD/BzcT7sL4ze/V9Rwqxws3RG6smFVzO4ZJv5XQGxa2qQGM+kR
	 peVWAbh1vuRRqq6680c+g27FQ91s9AlvbHKQVsS9EZRdxvG3AAS0DRTolRZ4wSBUnC
	 ZBkR02RNCgZHLZUCmu75CcJeSx0/Pl/EtXyoBb2QfotlfD257pm2teuYoNNbylj/Hy
	 l8XCTfMMGwoCVEGx9smy4to9SHoYKBpBa22uFr1+n69RJPejjvnFFsbNjjWQZpKZpd
	 1w+aspWjkuRU8N+zuDVesTgttdxgKht6DFly7JwDODrAvwHvUf1C2xGsOQ7e/SfJhc
	 RZyPahfjCA/pw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ED32D3806655;
	Sat, 14 Sep 2024 04:30:43 +0000 (UTC)
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
Subject: Re: [PATCH -next,v3] MIPS: Remove the obsoleted code for
 include/linux/mv643xx.h
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <172628824251.2458848.1377145599961685216.git-patchwork-notify@kernel.org>
Date: Sat, 14 Sep 2024 04:30:42 +0000
References: <20240912011949.2726928-1-cuigaosheng1@huawei.com>
In-Reply-To: <20240912011949.2726928-1-cuigaosheng1@huawei.com>
To: Gaosheng Cui <cuigaosheng1@huawei.com>
Cc: mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu,
 naveen@kernel.org, wangweiyang2@huawei.com, sebastian.hesselbarth@gmail.com,
 linuxppc-dev@lists.ozlabs.org, netdev@vger.kernel.org

Hello:

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Thu, 12 Sep 2024 09:19:49 +0800 you wrote:
> Most of the drivers which used this header have been deleted, most
> of these code is obsoleted, move the only defines that are actually
> used into arch/powerpc/platforms/chrp/pegasos_eth.c and delete the
> file completely.
> 
> Signed-off-by: Gaosheng Cui <cuigaosheng1@huawei.com>
> 
> [...]

Here is the summary with links:
  - [-next,v3] MIPS: Remove the obsoleted code for include/linux/mv643xx.h
    https://git.kernel.org/netdev/net-next/c/1b8c9cb3151a

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



