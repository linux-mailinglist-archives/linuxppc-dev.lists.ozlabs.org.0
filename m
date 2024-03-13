Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0270887A413
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Mar 2024 09:21:15 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=d82jEuaD;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tvk480BdNz3dWj
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Mar 2024 19:21:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=d82jEuaD;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=patchwork-bot+netdevbpf@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tvk3Q0rC8z3bXk
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Mar 2024 19:20:34 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 30A04CE16AA;
	Wed, 13 Mar 2024 08:20:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6729AC43390;
	Wed, 13 Mar 2024 08:20:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710318029;
	bh=WHOuWjV3IDXUssQ4CoKMeiF90k47wssjsrGAJV5cu4U=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=d82jEuaD7bVXGbzKBcPIN9ASyXJ7OV2fy2+f5U1fckbB2EWSLafi2wY0g1ZYn0kQz
	 7Sz9Wp8GaYZ1B0ItYEbeT6NkNDE/JqR98d1hSK+GguXoS+L7wJ+cL6G1cTa/VjfwdI
	 v+QQrsjQIKtWMT4YRp8YtIgtRgzLoppxFUd6glWG6XTms5nkwCDqfHpXdfXB/NPNg8
	 6yWUSLnuNgqKL549fu2Ey3pjE93z9uhUIy+kEPj6+k+CbZuj8PlmGaHG3eT2xT+mAF
	 78OHYsEsT9np91CfAk7NpNR5sRsB3gqfcwXViOTr99HTaVp6RyUE6dCQ5p21N+BNjH
	 5dh5B9ObKRX3Q==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 4D806D95060;
	Wed, 13 Mar 2024 08:20:29 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net v5 1/2] soc: fsl: qbman: Always disable interrupts when
 taking cgr_lock
From: patchwork-bot+netdevbpf@kernel.org
Message-Id:  <171031802931.29357.17308276522742025565.git-patchwork-notify@kernel.org>
Date: Wed, 13 Mar 2024 08:20:29 +0000
References: <20240311163830.12952-1-sean.anderson@linux.dev>
In-Reply-To: <20240311163830.12952-1-sean.anderson@linux.dev>
To: Sean Anderson <sean.anderson@linux.dev>
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
Cc: s.trumtrar@pengutronix.de, linux-kernel@vger.kernel.org, madalin.bucur@nxp.com, vladimir.oltean@nxp.com, roy.pledge@nxp.com, claudiu.manoil@nxp.com, leoyang.li@nxp.com, oss@buserror.net, edumazet@google.com, camelia.groza@nxp.com, netdev@vger.kernel.org, kuba@kernel.org, stable@vger.kernel.org, pabeni@redhat.com, linuxppc-dev@lists.ozlabs.org, davem@davemloft.net, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello:

This series was applied to netdev/net.git (main)
by David S. Miller <davem@davemloft.net>:

On Mon, 11 Mar 2024 12:38:29 -0400 you wrote:
> smp_call_function_single disables IRQs when executing the callback. To
> prevent deadlocks, we must disable IRQs when taking cgr_lock elsewhere.
> This is already done by qman_update_cgr and qman_delete_cgr; fix the
> other lockers.
> 
> Fixes: 96f413f47677 ("soc/fsl/qbman: fix issue in qman_delete_cgr_safe()")
> CC: stable@vger.kernel.org
> Signed-off-by: Sean Anderson <sean.anderson@linux.dev>
> Reviewed-by: Camelia Groza <camelia.groza@nxp.com>
> Tested-by: Vladimir Oltean <vladimir.oltean@nxp.com>
> 
> [...]

Here is the summary with links:
  - [net,v5,1/2] soc: fsl: qbman: Always disable interrupts when taking cgr_lock
    https://git.kernel.org/netdev/net/c/584c2a9184a3
  - [net,v5,2/2] soc: fsl: qbman: Use raw spinlock for cgr_lock
    https://git.kernel.org/netdev/net/c/fbec4e7fed89

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


