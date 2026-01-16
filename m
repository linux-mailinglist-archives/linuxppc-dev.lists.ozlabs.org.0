Return-Path: <linuxppc-dev+bounces-15875-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 495B0D2B509
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Jan 2026 05:23:40 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dsmtx603zz2ySb;
	Fri, 16 Jan 2026 15:23:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768537417;
	cv=none; b=I0m+utiDAWT0BqYp5HpQXz9Qk1GSTsVM8i6n/+m8L7L5tWhO0hGi85TivMjazKE7Hm+l2oQx8EwpOw330e6n5Hw2jb1chgChKnYDypJDloj+bdF0kCv7Om0PTMyrt6mBobXTRU0kK/n1tKWFGwpGW6/eZK2+uz2+SeXho1D974MV5+VkQNwFlTumk48P3j/TBG4RRtAtgbcSFgTyvQrcLvWuhFVhTVYa+NBkl4+wBMDofW/d4UJmVzjIA1FikTQAmlcrIo9/2ujg8nkGvcoGiangzuuS5rWsPPzlG7hWCLNoEwGQvH6dnj2vcT/hEjn1hwEvZy9Lte4EF9tFojvtWw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768537417; c=relaxed/relaxed;
	bh=rg2iRq4NK8CskuRKIYy11Uu6+OLXe0mEmk52wzZj2BE=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=elM7s56LofdxYtbXgEDNkUKBM1KQGE8Jx6v1FrjelxXWnGzAluLx0STV/80Dp86hNaijwdJ8qTCcZR1xYPfcosf7FRpwbA3DjmmG/yYA1PvflEzuvW0gQD1Q6ojcY0QWyy0yPWJioKCEq6kDJn6zxVeBm+t5rQSvatVPD346nyv/lHHRFtxDHA53yf7o60LQ6dLct/WDSSD5UISMWkEme/Mm29m726LtYd8faFIs0PPgx/fiIt6Zie/Q5cmYRlsLyGuK6NMvY/LtpgKHmay190CRkbQSyeNb9yYqPzw1FdXRYfs7IYCsGVSBJAhiXucLSXBX5WQDZsM9QITjHWMytQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=lr8YbhNG; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=patchwork-bot+netdevbpf@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=lr8YbhNG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=patchwork-bot+netdevbpf@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dsmtx1ghPz2xSN
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Jan 2026 15:23:37 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id BC93044282;
	Fri, 16 Jan 2026 04:23:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B7EEC116C6;
	Fri, 16 Jan 2026 04:23:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768537414;
	bh=bKGN9ojOmxae7da9bMpz9sjOeqsILuGbfwjjJX3u6yg=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=lr8YbhNGYC3KqrDpq/4N56z7RiiOv6xkta/kQ3N/bqs8vtQjhBxoF9casH4fQ4vbs
	 M7b/S+sLkGQoA1rPJtKFAc+s4V2GVfjlQ07+u+By2b6lz3ahxXrJaaqDv8nGiD4yDl
	 2LCwKv/BoqjWeNNfu9N37/oL6xUfKKOi2+OIsbidwoF/8D2miHTxSYqRCvDLtNp7Wd
	 LjUlHOK58SiAmPAUumfVidJBSIa0iaHngIuui09JStFp91oaen78cPrS1+7AG1+hNd
	 KNrX82YScYlNQviTFcqq/6rtGpoLdSukUPFW0XNoNeA+ZNmarzY6ipi4LuTQxjAg4E
	 TGl/7BCPNP5Uw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B5C1D380AA4C;
	Fri, 16 Jan 2026 04:20:07 +0000 (UTC)
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
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net v2] net: freescale: ucc_geth: Return early when TBI
 PHY
 can't be found
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <176853720655.81103.460026902506669237.git-patchwork-notify@kernel.org>
Date: Fri, 16 Jan 2026 04:20:06 +0000
References: <20260114080247.366252-1-maxime.chevallier@bootlin.com>
In-Reply-To: <20260114080247.366252-1-maxime.chevallier@bootlin.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, xiaopei01@kylinos.cn,
 christophe.leroy@csgroup.eu, linux@armlinux.org.uk, netdev@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 thomas.petazzoni@bootlin.com, dan.carpenter@linaro.org, lkp@intel.com
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hello:

This patch was applied to netdev/net.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Wed, 14 Jan 2026 09:02:46 +0100 you wrote:
> In ucc_geth's .mac_config(), we configure the TBI Serdes block represented by a
> struct phy_device that we get from firmware.
> 
> While porting to phylink, a check was missed to make sure we don't try
> to access the TBI PHY if we can't get it. Let's add it and return early
> in case of error
> 
> [...]

Here is the summary with links:
  - [net,v2] net: freescale: ucc_geth: Return early when TBI PHY can't be found
    https://git.kernel.org/netdev/net/c/a74c7a58ca2c

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



