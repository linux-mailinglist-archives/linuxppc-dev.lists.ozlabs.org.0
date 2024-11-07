Return-Path: <linuxppc-dev+bounces-2947-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C5A69BFC16
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Nov 2024 03:00:37 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XkQJf6qjSz3bgs;
	Thu,  7 Nov 2024 13:00:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=139.178.84.217
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730944834;
	cv=none; b=TYJ23Gw8tg3Nzx4w0h9VW2SJIm2emkfvolT/EE6XoBqLt15+fJD6JqEPvSLtVy0s2dMeHAokmWY3qrglW01QKsxCFSjan4NUV1tXMEoWJva6lUyaAXcxegIT+VSBW2jIKYDYZXwnkwgQyWy4qW0CqJQmfBTk3U21Iks3AjFyNaZbYhqjvLFxuZ9g31dFDr2DrsC3HLbULVWdm8hYy6SZ7IV+JEumrlES95hMg+mXFgwp95aIQxwSqk2ZfaDnt066aDK0uDBFwpPEHJZAJZKoEk2nJ8P2X7u4al59jvy0VqJR2CJqgx5ejHrQir2qG170Kzamz0Bn3VZT9J8oYhqSNA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730944834; c=relaxed/relaxed;
	bh=0EdutC03yjwFQkwXCG2tQZxwMxGac24zSXBtnBi05P0=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=HEx7Rso2VtN01LxtjtlwXDpQY1DXZLgEIWNQe0zomS+QvRbzaHVyvMn+w3KsQU4KwKDgCkvQMze8/GjX4dSiGvKU7yQjvkTYa/27sWnUXPLqMTl8RJrNUQp5u/S2zIOhoAhu2hsdc0r2Nhac9FFX6FbXDJX76lvyCdcyL8HPFUENeRpx+5aXUJ93x5XY+jLGoWyM0TfEi2kT+s9p9lRSIl0bRAoYw3F+20afg9/rKkU1k51HqMyR8atwiVvJz01/6BJIDxSsXLBqPzIuQaTwKYoRPxZ0wAi0BzEng081u1kdDPSC7JUwm7Wfe8TP22a9WHeSI7PZvJDmOxVtgbMRpw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=JOePNEfH; dkim-atps=neutral; spf=pass (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=patchwork-bot+netdevbpf@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=JOePNEfH;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=patchwork-bot+netdevbpf@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XkQJb5zRXz30PD
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Nov 2024 13:00:31 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 873F15C5461;
	Thu,  7 Nov 2024 01:59:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DEF8FC4CECC;
	Thu,  7 Nov 2024 02:00:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730944827;
	bh=1BUDSPoeb+/qQeqYnnF7CsVsbkJqooWgE1ax/Juomq8=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=JOePNEfHKy27IoxmW8tn3U3WcpHvwyoJN2uP8RkH0ekIX1IOBVA6UvqHpDZrlcjFK
	 /Qr12rqZx3c9/HKA2i0nByh1VO88ZwjR2hxTnHjfTq2WSZDgr2EW8yYwyxU7gPe7ST
	 AIdoSzmAhDVoxgGIV6rqdPnpROmU0Nbz+Pja+VGBT0tgpeeomcUdDOUxasJuItWg+Z
	 mphtLiACVPQ4GwGNucKCTuI82MXYqkyCcWQncQwg6Tg+muouHf7sBLZqxdOo7LwN8y
	 qlFSzwmvpwJmx2wmESRG3BFCglSogmnSbnhoilWP+puEdm/UdNCM2TwDX6rC5gOmu0
	 wKwaliaZw2Kfg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33C3A3809A80;
	Thu,  7 Nov 2024 02:00:38 +0000 (UTC)
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
Subject: Re: [PATCH net-next 0/4] net: ucc_geth: devm cleanups
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <173094483699.1489169.1489956594032005327.git-patchwork-notify@kernel.org>
Date: Thu, 07 Nov 2024 02:00:36 +0000
References: <20241104210127.307420-1-rosenp@gmail.com>
In-Reply-To: <20241104210127.307420-1-rosenp@gmail.com>
To: Rosen Penev <rosenp@gmail.com>
Cc: netdev@vger.kernel.org, andrew+netdev@lunn.ch,
 maxime.chevallier@bootlin.com, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Hello:

This series was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Mon,  4 Nov 2024 13:01:23 -0800 you wrote:
> Also added a small fix for NVMEM mac addresses.
> 
> This was tested as working on a Watchguard T10 device.
> 
> Rosen Penev (4):
>   net: ucc_geth: use devm for kmemdup
>   net: ucc_geth: use devm for alloc_etherdev
>   net: ucc_geth: use devm for register_netdev
>   net: ucc_geth: fix usage with NVMEM MAC address
> 
> [...]

Here is the summary with links:
  - [net-next,1/4] net: ucc_geth: use devm for kmemdup
    https://git.kernel.org/netdev/net-next/c/2246f5b2e982
  - [net-next,2/4] net: ucc_geth: use devm for alloc_etherdev
    https://git.kernel.org/netdev/net-next/c/edf0e374e446
  - [net-next,3/4] net: ucc_geth: use devm for register_netdev
    https://git.kernel.org/netdev/net-next/c/85d05befbbfc
  - [net-next,4/4] net: ucc_geth: fix usage with NVMEM MAC address
    https://git.kernel.org/netdev/net-next/c/257589764032

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



