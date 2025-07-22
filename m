Return-Path: <linuxppc-dev+bounces-10355-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C187B0DAA6
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Jul 2025 15:19:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bmdCt6CQpz2yb9;
	Tue, 22 Jul 2025 23:19:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1753190394;
	cv=none; b=MOobcSQcO57GhdXAS/+sxo6sX/YFlMmkaPG0lPjNuxfxjKTf8N9A9aFo3HetzZAmCm6VM2EUImxpm+cAryltnwug4A5WzDCMVnm7tBOwUTveq64oTAGbrrYg649D5zdq8qo2n5da7d0thKalET5r24kg8TVu2QeYdeGJsH2eH3WSYBlVQ276zBOePRdAV6nm+7ABg8buMCpSx3MC0RRn7mTrqf+Vl9I9iW1NtPyRTyfnruWK9YT2HHXtUeOpaBkMrBiu/wg7K57bTwGJ0GuROSyRGbGvL6182XkCcih9ZjHMXOwi+QS8YqNE3gZAT46lHT/9d7ZVZ7E18QyaKeDSHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1753190394; c=relaxed/relaxed;
	bh=vKmEiTvyzPNFoOM/E4/rY6Ik+icVc4tWACFomkmKsLM=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=edgK6m+B2RJyshnGkC309xXqd5lypPhbkh8RZX7s14bH658wJ8wp9nhqnrCHUFi5XDrMkWDCT3+BvQ+2UUJKaBo+0uZI/+cQDImPiZLEmrnu7aqgaLpFXJC83AX+l/OsgvemvNhytZLtU6BjnRJrpQ1tw+BwgEbhshfYn/5bXW1e5vqCmp4nvRIHcVODHSC1dqu8CURVR2eJjkTbIEjCGpe8lYmSFvj4TyUV05dD0aSwQUQIwvS/RQbsSRgGnHeGfYTwh4wYKdPx1+sE3ieKdZh27y+s/xe1QQuvVbLzfhsgLQlGlnOHSwSBqwRi/i5R473JBn3pD6Rk4FQ1mg8ffg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=llEK+/Tj; dkim-atps=neutral; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=patchwork-bot+netdevbpf@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=llEK+/Tj;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=patchwork-bot+netdevbpf@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bmdCt03GGz2yHs
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Jul 2025 23:19:53 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 81A14A55FD7;
	Tue, 22 Jul 2025 13:19:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C970C4CEEB;
	Tue, 22 Jul 2025 13:19:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753190388;
	bh=EOUEFcX5YMS0VQlMFjStfuaBMv69udOXsuXdiFYXua0=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=llEK+/TjVjIbZT20yjBUA72UyE338a49pBeh3LR+0wGjbmeI3yhyKhrPajmD8MDDz
	 WUGdtoKnb+XxHldyHRRtqO3XoREotJ0TxL1ZGkjf5C33Wz6mNVAldHqirC3A56JJSp
	 W76vpFIjVhLVbPe2rY+73eB8TGSqVMuZ0t82N+ld5BWrQ9Kl4rYbkheAyqjAc5HDKn
	 yTdMmlw3n3bi5/xQ0XNE5Iyin16XNfFcSHNm27EXk5BQwcWZ3C6p6zigtuO045ULN6
	 odsDpOHzn8SbDuvl78NtX22+mNU5mGF8QfwFzkuOMa3AATdk606rirTWRupYmO3rn6
	 5TRWq5YaYu7lg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EB325383BF5D;
	Tue, 22 Jul 2025 13:20:07 +0000 (UTC)
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
Subject: Re: [PATCH net-next v2] ibmveth: Add multi buffers rx replenishment
 hcall
 support
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <175319040676.805808.11285306488247395666.git-patchwork-notify@kernel.org>
Date: Tue, 22 Jul 2025 13:20:06 +0000
References: <20250719091356.57252-1-mmc@linux.ibm.com>
In-Reply-To: <20250719091356.57252-1-mmc@linux.ibm.com>
To: Mingming Cao <mmc@linux.ibm.com>
Cc: netdev@vger.kernel.org, horms@kernel.org, bjking1@linux.ibm.com,
 haren@linux.ibm.com, ricklind@linux.ibm.com, davemarq@linux.ibm.com,
 maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
 christophe.leroy@csgroup.eu, andrew+netdev@lunn.ch, davem@davemloft.net,
 kuba@kernel.org, edumazet@google.com, pabeni@redhat.com,
 linuxppc-dev@lists.ozlabs.org
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hello:

This patch was applied to netdev/net-next.git (main)
by Paolo Abeni <pabeni@redhat.com>:

On Sat, 19 Jul 2025 05:13:56 -0400 you wrote:
> This patch enables batched RX buffer replenishment in ibmveth by
> using the new firmware-supported h_add_logical_lan_buffers() hcall
>  to submit up to 8 RX buffers in a single call, instead of repeatedly
> calling the single-buffer h_add_logical_lan_buffer() hcall.
> 
> During the probe, with the patch, the driver queries ILLAN attributes
> to detect IBMVETH_ILLAN_RX_MULTI_BUFF_SUPPORT bit. If the attribute is
> present, rx_buffers_per_hcall is set to 8, enabling batched replenishment.
> Otherwise, it defaults to 1, preserving the original upstream behavior
>  with no change in code flow for unsupported systems.
> 
> [...]

Here is the summary with links:
  - [net-next,v2] ibmveth: Add multi buffers rx replenishment hcall support
    https://git.kernel.org/netdev/net-next/c/2094200b5f77

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



