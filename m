Return-Path: <linuxppc-dev+bounces-1174-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C1CD79713A4
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Sep 2024 11:30:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X2M5C3jQqz2yDm;
	Mon,  9 Sep 2024 19:30:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:4641:c500::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725874239;
	cv=none; b=dSTJ2psooiNXnEhEA+tTte48XPdPQYPmWYZH78AurYUqDiwlwNuWeuXTzTDFlFME0jlFma6zX0T8GU9atFwTeDsvG9JuwpRTbbPlJcJMO5SBNFLu+oERb3HKXRqyovF6e+0DKu2wxhWEmiBb7YcK0mAF+l8ltqouXwbzJ9qYmw2ejufsmh5RWSUVCQ8dkWgHXl1Gq1NnrTuqiMWNzafLtRchRTJ0W3NMJiGTU2QtU91C75ETQYUFTGJJzoVn64ZZX3K9FQ+wQCYFgp5W77lmPMOGtgs5sZZ5FmCAIxUaBIqZWuAhpmc47eM+/FUQORkxdYK0FA0EkPAWToYFiGQ18A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725874239; c=relaxed/relaxed;
	bh=1oLhwXZlVPu7VHcf2ixEHHX5m0iDfZ1YNnEnmuVdINM=;
	h=DKIM-Signature:Content-Type:MIME-Version:Subject:From:Message-Id:
	 Date:References:In-Reply-To:To:Cc; b=ObBIOnvjXLV//a3v2Hm4vY+pW3CwYPTIBvmASi+d2tAviLoS4Kjzazoy10WJhAyHmb67xheldaHNRUF7c5NIgJ4smPVJflxnAoTL4A2hlQdK0XBRVYnF33smpePeieCODekrPi9KqDGDuBmB/CHaUXYz15JnWmOKjh1Mto85Zg/n3fMFCBxHKwvfe5wSeK8Jdrmwua51uxhECBTpgpKl61SKhLu+1oGk51cRM+ORyjOgns6r8oxVklmlwI8KK70mPEQRTNW+icQBqhCQ5+N+tsudSjHrE8xhBBb8tYKcVKy9eygKFwz93NJXG5LiNWbf6ZCsQAiF5xJxGyyh1jD+aQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=GZ70S5aJ; dkim-atps=neutral; spf=pass (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=patchwork-bot+netdevbpf@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=GZ70S5aJ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=patchwork-bot+netdevbpf@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X2M5C0tvHz2yDM
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  9 Sep 2024 19:30:39 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id BC4C35C574C;
	Mon,  9 Sep 2024 09:30:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00E7DC4CEC5;
	Mon,  9 Sep 2024 09:30:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725874236;
	bh=jM+eEh3z9hLSGFBAP2spBKroZ66fcOCywXa+4ATXtio=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=GZ70S5aJU5Pg8yp0BGZe4FbpXG0LTPt+mnwb/p2aR9Rune2sPb6vDxQe219aZmUaj
	 Zn13wbt1wlH+NLRpkFVOlNoSP+42XBL9vyZNEKQ4UA1ICY0hOsYp1YN2NnMKw9tGtL
	 p6l2GGgcTn33qPycPaIJbvXKWoBsSu5PC4X1yQJSdYcI3tCnbMZ5XCVj7MRgTA5ZlK
	 DeIG+QGnYU3wM2UXFY2LdXSoBp2sS+NHLjzhFPuZoPFOUL53F273KzdN2xsfkoCrH9
	 Mwi3DPghOS4cQUE5fRWj8fl3pB4WjFkYWPSt0H89gx+HGIlcyRSdtPNlkJF+nhnu18
	 x9zh/6itZ0eDQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33C533804CAB;
	Mon,  9 Sep 2024 09:30:38 +0000 (UTC)
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
Subject: Re: [PATCH net-next v3 0/8] net: ethernet: fs_enet: Cleanup and phylink
 conversion
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <172587423699.3396102.11607239737245606580.git-patchwork-notify@kernel.org>
Date: Mon, 09 Sep 2024 09:30:36 +0000
References: <20240904171822.64652-1-maxime.chevallier@bootlin.com>
In-Reply-To: <20240904171822.64652-1-maxime.chevallier@bootlin.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: davem@davemloft.net, pantelis.antoniou@gmail.com, andrew@lunn.ch,
 kuba@kernel.org, edumazet@google.com, pabeni@redhat.com,
 linux@armlinux.org.uk, christophe.leroy@csgroup.eu, f.fainelli@gmail.com,
 hkallweit1@gmail.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 thomas.petazzoni@bootlin.com, herve.codina@bootlin.com,
 linuxppc-dev@lists.ozlabs.org

Hello:

This series was applied to netdev/net-next.git (main)
by David S. Miller <davem@davemloft.net>:

On Wed,  4 Sep 2024 19:18:13 +0200 you wrote:
> Hi everyone,
> 
> This is V3 of a series that cleans-up fs_enet, with the ultimate goal of
> converting it to phylink (patch 8).
> 
> The main changes compared to V2 are :
>  - Reviewed-by tags from Andrew were gathered
>  - Patch 5 now includes the removal of now unused includes, thanks
>    Andrew for spotting this
>  - Patch 4 is new, it reworks the adjust_link to move the spinlock
>    acquisition to a more suitable location. Although this dissapears in
>    the actual phylink port, it makes the phylink conversion clearer on
>    that point
>  - Patch 8 includes fixes in the tx_timeout cancellation, to prevent
>    taking rtnl twice when canceling a pending tx_timeout. Thanks Jakub
>    for spotting this.
> 
> [...]

Here is the summary with links:
  - [net-next,v3,1/8] net: ethernet: fs_enet: convert to SPDX
    https://git.kernel.org/netdev/net-next/c/30ba6d2f3463
  - [net-next,v3,2/8] net: ethernet: fs_enet: cosmetic cleanups
    https://git.kernel.org/netdev/net-next/c/2b29ac68e786
  - [net-next,v3,3/8] net: ethernet: fs_enet: drop the .adjust_link custom fs_ops
    https://git.kernel.org/netdev/net-next/c/96bf0c4e9f48
  - [net-next,v3,4/8] net: ethernet: fs_enet: only protect the .restart() call in .adjust_link
    https://git.kernel.org/netdev/net-next/c/aa3672be731d
  - [net-next,v3,5/8] net: ethernet: fs_enet: drop unused phy_info and mii_if_info
    https://git.kernel.org/netdev/net-next/c/6b576b2d4430
  - [net-next,v3,6/8] net: ethernet: fs_enet: use macros for speed and duplex values
    https://git.kernel.org/netdev/net-next/c/21c6321459aa
  - [net-next,v3,7/8] net: ethernet: fs_enet: simplify clock handling with devm accessors
    https://git.kernel.org/netdev/net-next/c/c614acf6e8e1
  - [net-next,v3,8/8] net: ethernet: fs_enet: phylink conversion
    https://git.kernel.org/netdev/net-next/c/41f5fbffd177

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



