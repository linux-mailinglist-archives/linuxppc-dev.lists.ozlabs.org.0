Return-Path: <linuxppc-dev+bounces-11981-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BE1AB50B2D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Sep 2025 04:40:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cM4fm25qwz3cb1;
	Wed, 10 Sep 2025 12:40:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c04:e001:324:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757472016;
	cv=none; b=c7fmSoxWkFojVtpf0XphqD48H07E4So+dh1sval2bC6R7nvstu5JXZTwqT/CbrNgIdDrgCg0bsUre5+MW4hG1LRgvKug+j5gZRta40Eyd1Qlddq3ceWlftBrrDqfg4pKCeqh0sbeQtE1jj1KJfaQcy2Gdh0Zda/z3+5/PnloyjnTpSCZug313T0rNRJDt5OUH/p6Vp8Bl4u8BapcDmpR8VEVU/oqiIkgNJj29I1wbMFrLqcMbUrbDcmuvjMkaybu9iKVNRfr4j8qJSm+Y1CqRJSGW7ifeuAdnyWDhnIR/yzAtf+m3/1tLcefoLhPWrHN051EsuvQI05ZoZ8CHqY13w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757472016; c=relaxed/relaxed;
	bh=MBiNzngweTlvRpfY+thWwfGL9VYxxczr7Qvh/TNwJuA=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=OfwurLmK4CD9BUctQ1+0IXgsejzELqVL0c1fXlOnXRvOGUnKo8znPawuO8qLnkjFzU+qb06FqOVEjvS02+fA49LgeY9DILKLku8PVgG+qSpecnZnomFX01gQHk7PxE/eQkY9of31BHm1j6nodxG3wRw0F05hMKAtU6kHwk+nRCLM9mtCUKKXIjRevUnp8Ph7pYyLS8eDo329PjrJNggol0ybvflnFhB85EbSValrTyApGchZczOfeyYaR85cc5mgX76T1TDphf1rjTYFYRomcu6jPNs9fPvMfLtYXaV8VrHCTANlHBqqEP82sJFrhP1J7q7DacsrstdfDRqZFSnakA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=jNNYJenb; dkim-atps=neutral; spf=pass (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=patchwork-bot+netdevbpf@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=jNNYJenb;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=patchwork-bot+netdevbpf@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04:e001:324:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cM4fl3rJPz3cYH
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Sep 2025 12:40:15 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B8B776023B;
	Wed, 10 Sep 2025 02:40:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F0CBC4CEF4;
	Wed, 10 Sep 2025 02:40:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757472012;
	bh=nZR1dALMHbgyKK0AcfI3cwQlZU/usFmgnkGpJdsY+VY=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=jNNYJenb6kLy4W+zjOyyxLdIhcU9HLhymCSwGuibjRkXSPspqS2H/lq//IBjA2oV3
	 e3fjw2bf1FtolwO/SC9+X5JG0s8sR78WdTmeeduKCn271/oLfDGyz/ALWOruAIs4DB
	 Lp1s4I7TA0pkGg/Kwco8Ft55oz4Y9Tx4+OCEqZCo80t2ZxWQrQK9vAq/Y11PcGbHqQ
	 Z3eI6di0eZCReRSKOOm58LB4umiQWPO82O/elfVYMEUrCMmE0I28h3ivd1nQpg4XQ4
	 QoPHIl6ooVNFSB4SW340+x19ofkmzBxTqNvrPPhyI6SICKMvmRYIdbyV28wOyUo1xd
	 JCr05fb+oO9Bw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADCB6383BF69;
	Wed, 10 Sep 2025 02:40:16 +0000 (UTC)
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
Subject: Re: [PATCH v2 net-next 0/3] ptp: add pulse signal loopback support
 for
 debugging
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <175747201550.884239.5015453227972787708.git-patchwork-notify@kernel.org>
Date: Wed, 10 Sep 2025 02:40:15 +0000
References: <20250905030711.1509648-1-wei.fang@nxp.com>
In-Reply-To: <20250905030711.1509648-1-wei.fang@nxp.com>
To: Wei Fang <wei.fang@nxp.com>
Cc: richardcochran@gmail.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 vladimir.oltean@nxp.com, xiaoning.wang@nxp.com, Frank.Li@nxp.com,
 yangbo.lu@nxp.com, christophe.leroy@csgroup.eu, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hello:

This series was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Fri,  5 Sep 2025 11:07:08 +0800 you wrote:
> Some PTP devices support looping back the periodic pulse signal for
> debugging. For example, the PTP device of QorIQ platform and the NETC v4
> Timer has the ability to loop back the pulse signal and record the extts
> events for the loopback signal. So we can make sure that the pulse
> intervals and their phase alignment are correct from the perspective of
> the emitting PHC's time base. In addition, we can use this loopback
> feature as a built-in extts event generator when we have no external
> equipment which does that. Therefore, add the generic debugfs interfaces
> to the ptp_clock driver. The first two patch are separated from the
> previous patch set [1]. The third patch is new added.
> 
> [...]

Here is the summary with links:
  - [v2,net-next,1/3] ptp: add debugfs interfaces to loop back the periodic output signal
    https://git.kernel.org/netdev/net-next/c/e096a7cc0be1
  - [v2,net-next,2/3] ptp: netc: add the periodic output signal loopback support
    https://git.kernel.org/netdev/net-next/c/67ac836373f4
  - [v2,net-next,3/3] ptp: qoriq: convert to use generic interfaces to set loopback mode
    https://git.kernel.org/netdev/net-next/c/f3164840a136

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



