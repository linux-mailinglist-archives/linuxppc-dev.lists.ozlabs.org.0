Return-Path: <linuxppc-dev+bounces-2857-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AF0BB9BC3AA
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Nov 2024 04:10:28 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XjCyB2Ltlz2xt7;
	Tue,  5 Nov 2024 14:10:26 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:4641:c500::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730776226;
	cv=none; b=aqI8/9gKQ3T5wqL35z590rg/mgrqTx8yGZ7fruapfjBNUS2+RitTBbxJlnCTRNoGyjQiGnIYKliWyPT6g10WxL/Za1zyid+/ll+Iv3bD7LrsJoJJL6jwuX9iEwIV9nNvlGTE0luLjlexP5p3C+4Vym8QhHda+VdwIaonZ1rDQ15lllB5E60bUGyF7RdCsKDVMS0qTiZFZcMmS0p8PW3RyLVlr67H6A2DY2zW+NvElD3Ai83MEWZm2RNAvchtGfXN6Vn6/wRHeVy0tXZVZYMzlMsch04FBgHtqstMDdBoljnopHxvQhahhKL2HutNTnNfaIF+C3flveppvaPrKRS4sw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730776226; c=relaxed/relaxed;
	bh=sJG6dQ+n8RgJB507eGbqHTNCrPhm5/7WuF2UnhAHnCQ=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=bzgEu0PhHbD3bUbwR24aMDAg2jXBQtiP2qVKhYLc/NED4reeH2qya5DcUxbwDn4YGhbapjXyuUEyavhhenlzSUow95C8ALNNKiTSQlcKFfbSiWDFuu2JbQNqBlh8mEIUx6xxZl2JnW906rJfRfvwNhYXy4yOPkZIj86TbyMbnpVk3QFOoH3e22TY72ITUrY7MsUZAumExiDSE85pxnOkXxjOOeZDfhtto/O6EfUkeYoiloVhQPLYQxks96+Yt4s8U8Y0n9UC6RBQun3HSavMQFlyVSvOBDhV5Ovxp9wv94xAl741TcUUKXAZ6bFmfiWnqHHAV541qYTaIiq3IJCoSA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=SiHh+TMZ; dkim-atps=neutral; spf=pass (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=patchwork-bot+netdevbpf@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=SiHh+TMZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=patchwork-bot+netdevbpf@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XjCy84NPdz2xgM
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Nov 2024 14:10:24 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 950315C56D4;
	Tue,  5 Nov 2024 03:09:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 085E5C4CECE;
	Tue,  5 Nov 2024 03:10:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730776221;
	bh=9LDC91LMilMxXjCTP/fsGGlz+9VFe99Gy7W8ZsIgP18=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=SiHh+TMZhp30Fvgu5Hk5vbLHACsRQ9BkRex/T1O0xiHydSasP+8fwv8v8ktwQyJhr
	 JsfOKAnXNwOIJuTFBppn5NLBFYquL2ol7OjUMdkUKoGsrN69WfMsKO935qgOiunpzc
	 99wuKGhMnFGzlYjvDC+ZQ0HfqT8AN7KCDkQU5cbRtPSWq3WMPfgmtIXMBee85c+FlP
	 Fa5zlaYycskdvds6wYxO3rtBuVRJCm7iLaZ3eBizT09MxFhkD+wGAj5mVv/omNfOdz
	 ZqzMsZ2NYw2w/uGoGgEBCJCAPjEzTKGqqiSL7B2sds8Puz8NH0Eso0BM5QdqtAzZKc
	 zW5A6/S522uiQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EB3733809A80;
	Tue,  5 Nov 2024 03:10:30 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next 0/3] Fix sparse warnings in dpaa_eth driver
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <173077622975.100940.17453964424124667340.git-patchwork-notify@kernel.org>
Date: Tue, 05 Nov 2024 03:10:29 +0000
References: <20241029164317.50182-1-vladimir.oltean@nxp.com>
In-Reply-To: <20241029164317.50182-1-vladimir.oltean@nxp.com>
To: Vladimir Oltean <vladimir.oltean@nxp.com>
Cc: netdev@vger.kernel.org, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, leitao@debian.org, madalin.bucur@nxp.com,
 ioana.ciornei@nxp.com, radu-andrei.bulie@nxp.com,
 christophe.leroy@csgroup.eu, sean.anderson@linux.dev,
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org
X-Spam-Status: No, score=-2.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Hello:

This series was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Tue, 29 Oct 2024 18:43:14 +0200 you wrote:
> This is a follow-up of the discussion at:
> https://lore.kernel.org/oe-kbuild-all/20241028-sticky-refined-lionfish-b06c0c@leitao/
> where I said I would take care of the sparse warnings uncovered by
> Breno's COMPILE_TEST change for the dpaa_eth driver.
> 
> There was one warning that I decided to treat as an actual bug:
> https://lore.kernel.org/netdev/20241029163105.44135-1-vladimir.oltean@nxp.com/
> and what remains here are those warnings which I consider harmless.
> 
> [...]

Here is the summary with links:
  - [net-next,1/3] soc: fsl_qbman: use be16_to_cpu() in qm_sg_entry_get_off()
    https://git.kernel.org/netdev/net-next/c/a12fcef429e1
  - [net-next,2/3] net: dpaa_eth: add assertions about SGT entry offsets in sg_fd_to_skb()
    https://git.kernel.org/netdev/net-next/c/81f8ee2823f3
  - [net-next,3/3] net: dpaa_eth: extract hash using __be32 pointer in rx_default_dqrr()
    https://git.kernel.org/netdev/net-next/c/0a746cf8bb6d

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



