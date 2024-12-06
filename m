Return-Path: <linuxppc-dev+bounces-3843-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 137539E6F81
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Dec 2024 14:50:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y4XhG2VXwz2yDM;
	Sat,  7 Dec 2024 00:50:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=139.178.84.217
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733493022;
	cv=none; b=YiSYCq7uVIaQlA2+pjBlOAugF61Baeni32qHM/GScB6o51poVOMr0N/mhQPM5pT5BKO9PjmQVBamnBiyjeHvzHjavlW2cvZ4CehOFsa+C6BPbiOualDT2Jyhv9MUB1UPergO7zVy/8Q3+5qYf8IRP0ebtx7au91AwFm/R8ZpRpmx4bYcHAz7HUxOpMTiqjcdnmyaK+jdypbTDed+SLEdNzgalRomCP24HQr7AKaHywhvpbY7YgASzkuwewF65a+boK/zPHRTF3VVZ2CtFNMZ0nw+7qAjt+Hg1tVAN7YvuSyvZiDvhngQ6dBvCFPFw1cxEfcE1QdYtORzVCvHF2Hl1A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733493022; c=relaxed/relaxed;
	bh=7wtq8cFjnfX89YbhyxiBq4RHIaWhnHE0kNlJKyqwPcU=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=TmOTrZR/VbMWTlCk9Ea6lgdGu1q0jO2iW0LeEf9QC9s4mN4x4DZvwn+pCAvdXU9Gqfdm1pasVUylD5iXD/IuSS7PbAxcgAOt12sS3ipZ3KnWLNziIszGRHhdK7LgXpOnIILx+CH3oZNWI0VU30SmIy0M9MuMlqHVaaPBF6moXTrjRixgUIYAga0FumdinyqojYZTbk11SvqzqkR0wZoOcPdyJ+LFuAwTNrW4z1h48ym9w6GFpIg2OeA2QNOu84LfIATxAB6kaH7f5bD+aEmjvK1Pktm9ZDxVtysQW7PxOGcd59Bx84/PpypFvSd10Dn1dCDb9wgUA/nkhMwmxqn23g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=QceMpiHA; dkim-atps=neutral; spf=pass (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=patchwork-bot+netdevbpf@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=QceMpiHA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=patchwork-bot+netdevbpf@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y4XhF0kPpz2y33
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  7 Dec 2024 00:50:21 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2210F5C0665;
	Fri,  6 Dec 2024 13:49:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8EC49C4CED1;
	Fri,  6 Dec 2024 13:50:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733493018;
	bh=wlRY6k7NolzfAGAka37pQ5kdxPVTKWbmUW1+NF1SLrg=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=QceMpiHAFZR8JJiyeg7s5mwGm3WcHP4x9gLp/aBN/WHFssHLGfpXWX1ZS+A3Os4tE
	 N4LyQpVlyR+1GZYL1mhH3XF/groDzF5/75iLGYZD7pCuswXx7Abmj7X00fUjnvaDTL
	 0YYYw17HguZoT8GZj5/JtyiEtLHKxZRn1uu8Pp04+zHqbX7OQoFLTM2mBSLmxtFitG
	 KMr2J/yFrRCzNeWPxmhKgTSeE91d6oXQIm7xVsbnl9UZo4pRgqhVsFP28FxKzyT5oZ
	 XCDxZjzER94yKF2Vowt4LQdzcqUMY8bkaL1XV+ERvp1Dp+jvxwmvGL9pqJX0vdZL76
	 DnSz6bVnAtiJA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id AE076380A954;
	Fri,  6 Dec 2024 13:50:34 +0000 (UTC)
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
Subject: Re: [PATCH net-next v3 00/10] net: freescale: ucc_geth: Phylink
 conversion
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <173349303350.2342394.11250822704225305865.git-patchwork-notify@kernel.org>
Date: Fri, 06 Dec 2024 13:50:33 +0000
References: <20241203124323.155866-1-maxime.chevallier@bootlin.com>
In-Reply-To: <20241203124323.155866-1-maxime.chevallier@bootlin.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: davem@davemloft.net, andrew@lunn.ch, kuba@kernel.org, edumazet@google.com,
 pabeni@redhat.com, linux@armlinux.org.uk, christophe.leroy@csgroup.eu,
 hkallweit1@gmail.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 thomas.petazzoni@bootlin.com, horms@kernel.org, herve.codina@bootlin.com,
 u.kleine-koenig@baylibre.com, linuxppc-dev@lists.ozlabs.org
X-Spam-Status: No, score=-5.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Hello:

This series was applied to netdev/net-next.git (main)
by David S. Miller <davem@davemloft.net>:

On Tue,  3 Dec 2024 13:43:11 +0100 you wrote:
> Hello everyone,
> 
> This is V3 of the phylink conversion for ucc_geth.
> 
> The main changes in this V3 are related to error handling in the patches
> 1 and 10 to report an error when the deprecated "interface" property is
> found in DT. Doing so, I found and addressed some issues with the jump
> labels in the error paths, impacting patches 1 and 10.
> 
> [...]

Here is the summary with links:
  - [net-next,v3,01/10] net: freescale: ucc_geth: Drop support for the "interface" DT property
    https://git.kernel.org/netdev/net-next/c/3e42bb998c6d
  - [net-next,v3,02/10] net: freescale: ucc_geth: split adjust_link for phylink conversion
    https://git.kernel.org/netdev/net-next/c/1e59fd163100
  - [net-next,v3,03/10] net: freescale: ucc_geth: Use netdev->phydev to access the PHY
    https://git.kernel.org/netdev/net-next/c/43068024cc2a
  - [net-next,v3,04/10] net: freescale: ucc_geth: Fix WOL configuration
    https://git.kernel.org/netdev/net-next/c/d2adc441a19a
  - [net-next,v3,05/10] net: freescale: ucc_geth: Use the correct type to store WoL opts
    https://git.kernel.org/netdev/net-next/c/420d56e4de52
  - [net-next,v3,06/10] net: freescale: ucc_geth: Simplify frame length check
    https://git.kernel.org/netdev/net-next/c/270ec339126a
  - [net-next,v3,07/10] net: freescale: ucc_geth: Hardcode the preamble length to 7 bytes
    https://git.kernel.org/netdev/net-next/c/dba25f75383f
  - [net-next,v3,08/10] net: freescale: ucc_geth: Move the serdes configuration around
    https://git.kernel.org/netdev/net-next/c/efc52055b756
  - [net-next,v3,09/10] net: freescale: ucc_geth: Introduce a helper to check Reduced modes
    https://git.kernel.org/netdev/net-next/c/02d4a6498b30
  - [net-next,v3,10/10] net: freescale: ucc_geth: phylink conversion
    https://git.kernel.org/netdev/net-next/c/53036aa8d031

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



