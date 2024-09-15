Return-Path: <linuxppc-dev+bounces-1381-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 43ED19797AC
	for <lists+linuxppc-dev@lfdr.de>; Sun, 15 Sep 2024 18:01:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X6CTR2G1hz2xk7;
	Mon, 16 Sep 2024 02:01:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:4641:c500::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726416091;
	cv=none; b=DHDfEmI8gQxjeF8D0+wqwk2q3DUbQQZt6rM755r1i+7SC0TXGxzKm4zr4QcocuHKR3xEOeqYnjAWU7q0iLDVUtzf0aGNHtgrshg/+UxzlBW5muMdDulyRb6zsrqVZyNF29J46+ZTFKpAm07irQ8ODD0xzp0OsUzEEUUfSGhMpAgmorUwmx1EvTWERw6qbE8bRuBLXi4qxB1xk2wRHAS7/O/C5QDJh69ZC9sJfkJi52+72wvOpL6dpMCLpbxfXCnPZN3sQtJNs9Pn5wSf+KKL8uc63t9VGBMYJVwl9KB4JYUwH8OttUnT87nXjeuVSe03TR6h/murKkljBk9ClxqmOg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726416091; c=relaxed/relaxed;
	bh=rvU7RY6BSHuGO7deGhW4A+gfiIYnHxMKHkDACiyQyMc=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=YbC+9YQUQe+v/J5kx5yseX4QHJyq1vCdrLkgKwxzmEqoQaWIAX2zVtox7mYaP/Z0kRjULEpHNfw05rJNqeDJcoAmldRDiG5v22w9olt16QqhJp0PmWEzlNa2TLKYESt2OEGp1mTT8c0QLsuFTXrWN9wpkRf5VHLfXjh7fG/Xtbigvj44Fw5EHMXVqAE5TK0ObYlB5YCBruUH2gjhhqnq3UmygOo5nJ5ccvjpHF9gkGYPgmlO0J/7LNhov1QVQ8kJcRwI1fxJ0pTjDLdAR/74ZilG/FZkb4NMiRzeYFtl08n/b+LcbZP15VyT6pqRsCJCtcpMrK2ReAGjH7aSooqsRQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ZHkWk0JA; dkim-atps=neutral; spf=pass (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=patchwork-bot+netdevbpf@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ZHkWk0JA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=patchwork-bot+netdevbpf@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X6CTR0RRMz2xLR
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Sep 2024 02:01:30 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 371E55C59B5;
	Sun, 15 Sep 2024 16:01:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 878FAC4CEC6;
	Sun, 15 Sep 2024 16:01:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726416087;
	bh=Y8QP24CKHUvxLYd6VZy5Fp3zHnNGYYSNewltGROYn34=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=ZHkWk0JA/Ib6KBKxL+0HxbEwiOP+hmS3CZCOYnTJOS5KKOfuVxrG83DRGloVa2hMl
	 XjrOrOu3mZdFpJL9JOdX1oHsBWfHa0SBcMWeNQePdpZpo0mGKWJcyo9nftFyLg/MCV
	 qOTjCzlVKTUk5yyai9tIZRDIRiR+ozqu+qUXhPKFZ8csxkbxFkWCR3J+NNMGlj73s/
	 RcNJil1qYQV4wOWsrSEEnAGVZBIUQZvRIKkbVttB4F/5iAAnxTqfcsLKFc/cnnl59L
	 cUY4E8VgFBQMeH1UEXwPZGO3nKBFQnU73dfmyBEHeYb0D9n7yu+4JLAsRHuieWgboj
	 jwzOuBM6qNRVg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33D6B3804C85;
	Sun, 15 Sep 2024 16:01:30 +0000 (UTC)
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
Subject: Re: [PATCH net-next] net: ethernet: fs_enet: Make the per clock optional
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <172641608876.3111582.12752959256186522702.git-patchwork-notify@kernel.org>
Date: Sun, 15 Sep 2024 16:01:28 +0000
References: <20240914081821.209130-1-maxime.chevallier@bootlin.com>
In-Reply-To: <20240914081821.209130-1-maxime.chevallier@bootlin.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: davem@davemloft.net, pantelis.antoniou@gmail.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 thomas.petazzoni@bootlin.com, andrew@lunn.ch, kuba@kernel.org,
 edumazet@google.com, pabeni@redhat.com, linux-arm-kernel@lists.infradead.org,
 christophe.leroy@csgroup.eu, herve.codina@bootlin.com,
 christophe.jaillet@wanadoo.fr

Hello:

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Sat, 14 Sep 2024 10:18:20 +0200 you wrote:
> Some platforms that use fs_enet don't have the PER register clock. This
> optional dependency on the clock was incorrectly made mandatory when
> switching to devm_ accessors.
> 
> Reported-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> Closes: https://lore.kernel.org/netdev/4e4defa9-ef2f-4ff1-95ca-6627c24db20c@wanadoo.fr/
> Fixes: c614acf6e8e1 ("net: ethernet: fs_enet: simplify clock handling with devm accessors")
> Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
> 
> [...]

Here is the summary with links:
  - [net-next] net: ethernet: fs_enet: Make the per clock optional
    https://git.kernel.org/netdev/net-next/c/c209847b8974

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



