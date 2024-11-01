Return-Path: <linuxppc-dev+bounces-2757-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 130F29B8960
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Nov 2024 03:40:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XflTV2dgCz2yGZ;
	Fri,  1 Nov 2024 13:40:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730428830;
	cv=none; b=csfCS2szrWulD65kutTM1bi9jJS4Adh3Szx6hSPWaDQ3mdt8f8vCCVrtu28CABnOxRTdsMU9nm9nrJLO80s8WwykWTo6xAr++cq1KZAO7EP8PCirm3w8ocg9MSov7VdhJZN8XdqWJfO8n03S46K00xKxI9Fe/mwpI4HwIrfITfQQlfilLnY8M8R2zFcjWB9c4+rH7TKmfmP4f1WffX8H+GXg1P8zH69/McIrPzTDlqcUxIru/iaVu0GWqdWCqIeCBh671fWrMSKRd1pi6ickdK64N1XxDeImdT4mPdCAsOxTl9bTxmfeF2wVmyDYr9D7o/GU0MW69H9ap3N2df2pAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730428830; c=relaxed/relaxed;
	bh=g/iE2NzGokqY5fcXFFGNn15rcpyTO8l1veRl0rG6C18=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=LXemiNIjrpXOJVcHcMGAH7pDsZww5BGm1JtqTaBggHzkx09k0yINR5s8cr7VZQwwxmbmfUVHtSGp0WSD/+A33FgnEM61CaNwrraAuow+VJOs5lLe1Qi+RICBh32++L5y5qZiQRJckkP58aGvuRQQP1DU3ivUMQ5rfSTS52ORcYzAlqljd4wf2PCR9IxADqEaUjEofySV3EwI4OiPus9N1BiL+2E9o8WifxKQ3tvl1pr/z8FNLvQcpoNqZGNgc4Wi34B/QDgiJf+y8OQW9n3Mmx4OHiq7TwCxe8MNLpuT1ku28rwY4fbAfOD96bnL360e/Zx1zshq7PJG8g+NqlnE7w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=skCmTBHq; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=patchwork-bot+netdevbpf@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=skCmTBHq;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=patchwork-bot+netdevbpf@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XflTT1RpFz2yD4
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  1 Nov 2024 13:40:29 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 40CCEA4162B;
	Fri,  1 Nov 2024 02:38:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DD96C4CED0;
	Fri,  1 Nov 2024 02:40:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730428824;
	bh=hPom6XFQ8qBzLHhYj0bj1tSoFVlQuFqEEm6gsee2TWw=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=skCmTBHqRx/7k+TGgQq248pTzZQ3YBKKgqkhZB4Av8EbKG1UI2B+noqChRS3zXMPt
	 /IS5/2UfAavsUHrZqbF6tVuPjnGMEG7DwT2AqxV+YfAuwXnMNUOEK6bvWFUM2YScnF
	 Lp2jJtwi8HYtXA3H9gYE3Kh6+00ibxxOBXcn5K1PrWDktkul1eorLNec59jQ/aQLxr
	 JR2CN+h2ELS/XAb5QGHH6xi8cHZ4P6sdWEgF5b53AAa1hVINQlKKK27e7BUYO/xtr9
	 BkD2RBUJrnT+mQGQozjAOZatRkWrzVO0QITevRJUsfKWrTExxt5KI5466hduvvdqiV
	 OPDdaxALC1AsA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADE77380AC02;
	Fri,  1 Nov 2024 02:40:33 +0000 (UTC)
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
Subject: Re: [PATCH net] net: dpaa_eth: print FD status in CPU endianness in
 dpaa_eth_fd tracepoint
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <173042883250.2159382.982406472849657183.git-patchwork-notify@kernel.org>
Date: Fri, 01 Nov 2024 02:40:32 +0000
References: <20241029163105.44135-1-vladimir.oltean@nxp.com>
In-Reply-To: <20241029163105.44135-1-vladimir.oltean@nxp.com>
To: Vladimir Oltean <vladimir.oltean@nxp.com>
Cc: netdev@vger.kernel.org, radu-andrei.bulie@nxp.com, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, leitao@debian.org,
 madalin.bucur@nxp.com, ioana.ciornei@nxp.com, christophe.leroy@csgroup.eu,
 sean.anderson@linux.dev, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Hello:

This patch was applied to netdev/net.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Tue, 29 Oct 2024 18:31:05 +0200 you wrote:
> Sparse warns:
> 
> note: in included file (through ../include/trace/trace_events.h,
> ../include/trace/define_trace.h,
> ../drivers/net/ethernet/freescale/dpaa/dpaa_eth_trace.h):
> warning: incorrect type in assignment (different base types)
>    expected unsigned int [usertype] fd_status
>    got restricted __be32 const [usertype] status
> 
> [...]

Here is the summary with links:
  - [net] net: dpaa_eth: print FD status in CPU endianness in dpaa_eth_fd tracepoint
    https://git.kernel.org/netdev/net/c/0144c06c5890

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



