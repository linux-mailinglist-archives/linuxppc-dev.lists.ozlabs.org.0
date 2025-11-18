Return-Path: <linuxppc-dev+bounces-14292-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 84613C69242
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Nov 2025 12:40:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d9jNY05y9z2yv9;
	Tue, 18 Nov 2025 22:40:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c04:e001:324:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1763466044;
	cv=none; b=GvOuBa9p5wE2vN68sINxZiyN/ZFOp3GSRq2yalOST3jNUQ8Dxhi9nUX5ESa7S1zSUTe/5E31Eem/wdsrb0pY0EcMW9BkceuaBknVZwg8unSwAjjdw4xxJWPd6ESgucutDkjXnJjgwqO0SyqmgY30ldH2gtoArV+g0ZL+KOEDyZ2r5smz3aRfnteK0oNCkAbDY66MgUGH+gyzygOnau+iceQ6eNN8Ibop0S892JJCuNCSbaWjJa4kscn4qK2t7+xpVDnef3i5G9LHTMRWRCDBgHW3szt/HXiBAttjSRenrnq2MVa2y8PY67D8Uxk6hLXqPXjHVbjSDKjFU1koJRGb+w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1763466044; c=relaxed/relaxed;
	bh=/A7euPsHRjyQeewsca32fyAqJKGxJhMQx1M+UP6kIbY=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=Kkw6jMDpo5QE9F185AZ9Zkn2xo5JHe7eDuPwCWlPzaNvDMDhDOrpbfp/5ZP5d9P+Fu3jVDDeeEo/NKQ6+3XNcGxO/izeo1odPk80yf0eZ+GMB2UMLy6zhdelibUy6WSVs3tEw/fbPaSdNEQzpa5j07knMuBq9PM27apcbs1wJvDPwx6Blkfg/MjrxZu97ZhtkTKgS5GdM9qs0nViePhPS0mGbl2WtKNg2IJtxULglcOFUwHuZl4ZWgHG1VJfDiOkvy0ZIWxkT0K06k/qNRbF8L0M20LkuOBh0rclP22fRH6s7q7UdHKxqcgOG3cuZ+J5mp604kb5nSokLsYVP/wC/Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=pwuK6TH1; dkim-atps=neutral; spf=pass (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=patchwork-bot+netdevbpf@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=pwuK6TH1;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=patchwork-bot+netdevbpf@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04:e001:324:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d9jNW5rFFz2yqP
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Nov 2025 22:40:43 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3133460627;
	Tue, 18 Nov 2025 11:40:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A560FC19422;
	Tue, 18 Nov 2025 11:40:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763466040;
	bh=Z6GSwPyQy2eYbtEeZSuWK+cWOiXSjWhICZdzZMBBoQw=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=pwuK6TH1ovOY3qtAfydGPeBptIVAk869cB1Yscoigbtoh1WfsiyM/rHcpU0Bu6rBf
	 rrQZ0yhNnDBb3rtK3PotTqP/IJzI04UaDmyU4WCVb9LAh8cDPstnZzCwHKiRExnA1m
	 sXgPTtvbc+D1HqttzbCPBbrnTf1057/4MFk2oRnTC+UhbcUF3T+pQfcRRMmCq3nMu1
	 XXnUHB+GXNXJS6exoneKmEUSurHiVQWLzXXBt7SsFEGfC8u2oPx4UYOnXnG6uFQ23Z
	 T9Zp2/v5dScdKPo5fux47HNvEZjJ3lwdbGRItue6Og2XGyX/kN/zaU5CCxFVX77Ofy
	 IyUruWG2A8DKg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70B773809A87;
	Tue, 18 Nov 2025 11:40:07 +0000 (UTC)
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
Subject: Re: [PATCH net v2] net: ps3_gelic_net: handle skb allocation failures
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <176346600613.4108098.16858864386263047134.git-patchwork-notify@kernel.org>
Date: Tue, 18 Nov 2025 11:40:06 +0000
References: <20251113181000.3914980-1-fuchsfl@gmail.com>
In-Reply-To: <20251113181000.3914980-1-fuchsfl@gmail.com>
To: Florian Fuchs <fuchsfl@gmail.com>
Cc: geoff@infradead.org, netdev@vger.kernel.org, kuba@kernel.org,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 pabeni@redhat.com, maddy@linux.ibm.com, mpe@ellerman.id.au,
 npiggin@gmail.com, christophe.leroy@csgroup.eu,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 mokuno@sm.sony.co.jp, jeff@garzik.org
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hello:

This patch was applied to netdev/net.git (main)
by Paolo Abeni <pabeni@redhat.com>:

On Thu, 13 Nov 2025 19:10:00 +0100 you wrote:
> Handle skb allocation failures in RX path, to avoid NULL pointer
> dereference and RX stalls under memory pressure. If the refill fails
> with -ENOMEM, complete napi polling and wake up later to retry via timer.
> Also explicitly re-enable RX DMA after oom, so the dmac doesn't remain
> stopped in this situation.
> 
> Previously, memory pressure could lead to skb allocation failures and
> subsequent Oops like:
> 
> [...]

Here is the summary with links:
  - [net,v2] net: ps3_gelic_net: handle skb allocation failures
    https://git.kernel.org/netdev/net/c/0f08f0b0fb5e

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



