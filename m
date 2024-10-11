Return-Path: <linuxppc-dev+bounces-2133-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id ABCE899AF0C
	for <lists+linuxppc-dev@lfdr.de>; Sat, 12 Oct 2024 01:10:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XQMmb5yd9z3blv;
	Sat, 12 Oct 2024 10:10:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728688239;
	cv=none; b=WZ9Gt5oAKbHboeXsYhlbrq/kR4lKyRf+BDqjmPKylz2ntzkX5bI4O4NcS3A8hDrjijumXW1olugNQfNadyLLhOKZ1/VwIE2mWka29BmMkJLOP75EFz9SdB2fVMzs7g9V8nLETmhqVGmFOV67QuxyAIVHUsSWb/usu2ZJLSQCnXnEh07MjWOEN2tynSoWDYUTGZ+/eLDGOWCYXkLGMIVEws40kEYkWZBevWUEVqgUKM+SZfd4FyZqaAPJDQToYAH9DvTb6yt0VjQvdmTYs7JgPmobPkW1EJHPdDElqP+tAX/0UTUvBHmSTkrY9jkm8EzZ8j258rTOqSyFrnQMhw7vcw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728688239; c=relaxed/relaxed;
	bh=gC+988g3/U5lruOnAbqCQBiayhOS83f6aqGM2v/ZAKg=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=mwYNaSrb9gpUUoFUHzVJ0qU9CcMWrvSZhvcWyG/6uJhH9PexpivKKZlVsx+NUgS8Er67hnwju5Eb6rFgoo8ixMOynzn/ttWGKQiN20FcaCghI3hlb8XaWra3vgeFnhZ8dMsvc8/Q4RG4b3F/RVAvOJ/uEbZOmBkENWJGP1uI9Fxzp2331ENmP3+Y5PyWakpKmyhIOUJ+lX5AVTGqNId9dMb5Ym6s9HbFBFGHpeFrxuUCfz0L1UkJ6shK7HEUkO9xmY74NswR6RiVdseSHjRmKhyVGdUysI7gp6kw2f3a3inl7X/jkTyYAHajWV4VSl4DnGXoRNwvUBEG/yonWuHYpg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=RoMduaAi; dkim-atps=neutral; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=patchwork-bot+netdevbpf@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=RoMduaAi;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=patchwork-bot+netdevbpf@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XQMmZ6tghz3028
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 12 Oct 2024 10:10:38 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 4711BA4529E;
	Fri, 11 Oct 2024 23:10:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95B0DC4CED1;
	Fri, 11 Oct 2024 23:10:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728688234;
	bh=j9zN59cx19FqHur0YFxPqcYCl41LyYMRbn8YHI5JBEE=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=RoMduaAiMX6S4iYv5OrR+rbr3LkHYnraMaDuM87829C4yLLkAj96hM5tV7FScZL0A
	 dMj8hfjjW96pUYJvZNKlOAfeHVCbpuBWDM72wTBoL2KxwBbBElPVm8UB5/XuwqjA7I
	 ko6D1NqicyukZ5BVP+mw9LjQIfDKuKX8vX8SmekQvDZ2p+IFrAtDF4xxTHCVmWmrB5
	 eABUMixMU2TDrdVdcnTB/ZbAY1b6CwCjWUwH4J7bGSywFUHkt+5AUZGcF9Kbk/tQcJ
	 Ok5DjOi4mRTz23S73oDkaER4Lqi9C+BApjxRFd301A6pHrWjzAtNP0K46cf2INofe+
	 XJqniueg4fSdw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 7119438363CB;
	Fri, 11 Oct 2024 23:10:40 +0000 (UTC)
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
Subject: Re: [PATCH net] net: enetc: add missing static descriptor and inline
 keyword
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <172868823925.3022673.11344630026816990350.git-patchwork-notify@kernel.org>
Date: Fri, 11 Oct 2024 23:10:39 +0000
References: <20241011030103.392362-1-wei.fang@nxp.com>
In-Reply-To: <20241011030103.392362-1-wei.fang@nxp.com>
To: Wei Fang <wei.fang@nxp.com>
Cc: davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, claudiu.manoil@nxp.com, vladimir.oltean@nxp.com,
 christophe.leroy@csgroup.eu, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, imx@lists.linux.dev
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Hello:

This patch was applied to netdev/net.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Fri, 11 Oct 2024 11:01:03 +0800 you wrote:
> Fix the build warnings when CONFIG_FSL_ENETC_MDIO is not enabled.
> The detailed warnings are shown as follows.
> 
> include/linux/fsl/enetc_mdio.h:62:18: warning: no previous prototype for function 'enetc_hw_alloc' [-Wmissing-prototypes]
>       62 | struct enetc_hw *enetc_hw_alloc(struct device *dev, void __iomem *port_regs)
>          |                  ^
> include/linux/fsl/enetc_mdio.h:62:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
>       62 | struct enetc_hw *enetc_hw_alloc(struct device *dev, void __iomem *port_regs)
>          | ^
>          | static
> 8 warnings generated.
> 
> [...]

Here is the summary with links:
  - [net] net: enetc: add missing static descriptor and inline keyword
    https://git.kernel.org/netdev/net/c/1d7b2ce43d2c

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



