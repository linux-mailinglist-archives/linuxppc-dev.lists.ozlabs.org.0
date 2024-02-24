Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 33F8786223A
	for <lists+linuxppc-dev@lfdr.de>; Sat, 24 Feb 2024 03:11:20 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=lhp21QS+;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ThVjf142Dz3vXY
	for <lists+linuxppc-dev@lfdr.de>; Sat, 24 Feb 2024 13:11:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=lhp21QS+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:40e1:4800::1; helo=sin.source.kernel.org; envelope-from=patchwork-bot+netdevbpf@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ThVhr4PZlz3cDg
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 24 Feb 2024 13:10:36 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id B59B7CE2F76;
	Sat, 24 Feb 2024 02:10:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 981C7C433B1;
	Sat, 24 Feb 2024 02:10:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708740629;
	bh=e3awmqg9DuvQucPvgIH+uPzPjXjLUPXMLUcPP7URmYg=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=lhp21QS+4BnuICE7ZhAiXzVD7eNcy3Pn9GzyE1nC+PEBrbKOX6WF7vIiTwORgjBBs
	 tKV9PgJNJv5IbKvn2T4MHkrfIqwhAt6Kdgi0aimFXwOk/daPfaXJv1bg/Cimhbo2JT
	 wVD4PBNg06HRejU07WYitoedfe09/QQ+s9EqC8s5XxxYRk69QGvL/FMjhZRNF2uowb
	 8kngcfSgcbZq//M+HvpQ08LVkTH7o0P8xOL2r44D7g5yLmmL7S2zh17/5vbhd2cc+2
	 DuLQxcL4rqgL+0BRiKnrlZfjtTh2Sk4KyMkr11t+WjcTR0n/aeHXF+xBAi93mW5kwl
	 3Je2Ttjz5aDhw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 74E20C59A4C;
	Sat, 24 Feb 2024 02:10:29 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next] ps3/gelic: minor Kernel Doc corrections
From: patchwork-bot+netdevbpf@kernel.org
Message-Id:  <170874062946.5601.16694725773526396855.git-patchwork-notify@kernel.org>
Date: Sat, 24 Feb 2024 02:10:29 +0000
References: <20240221-ps3-gelic-kdoc-v1-1-7629216d1340@kernel.org>
In-Reply-To: <20240221-ps3-gelic-kdoc-v1-1-7629216d1340@kernel.org>
To: Simon Horman <horms@kernel.org>
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: geoff@infradead.org, npiggin@gmail.com, aneesh.kumar@kernel.org, edumazet@google.com, netdev@vger.kernel.org, naveen.n.rao@linux.ibm.com, kuba@kernel.org, pabeni@redhat.com, linuxppc-dev@lists.ozlabs.org, davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello:

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Wed, 21 Feb 2024 17:46:21 +0000 you wrote:
> * Update the Kernel Doc for gelic_descr_set_tx_cmdstat()
>   and gelic_net_setup_netdev() so that documented name
>   and the actual name of the function match.
> 
> * Move define of GELIC_ALIGN() so that it is no longer
>   between gelic_alloc_card_net() and it's Kernel Doc.
> 
> [...]

Here is the summary with links:
  - [net-next] ps3/gelic: minor Kernel Doc corrections
    https://git.kernel.org/netdev/net-next/c/3e596599372e

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


