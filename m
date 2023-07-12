Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 78A0674FDC1
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jul 2023 05:31:18 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=EbfNDU4K;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R13Dh2fBvz3c2D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jul 2023 13:31:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=EbfNDU4K;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=patchwork-bot+netdevbpf@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R13Cl5c9pz30fd
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Jul 2023 13:30:27 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 117E6616CD;
	Wed, 12 Jul 2023 03:30:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D277EC43397;
	Wed, 12 Jul 2023 03:30:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689132623;
	bh=KwsKbTt6v0IR4Q8rP+GR6PnPs+ltgKYK5aPH6kmT3mY=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=EbfNDU4Kjq7ad5m+ffHoayiS5wV5Tt4yzHx7J8U9u9LrnpHzDtpjcO563TayU3qgj
	 Bt3CtuiirPT2wqoaGzea1AKVAvv5SyNdfoS5IXObkaqpdyk4nqVpRH7zyZWbhYoJZn
	 U3UDojN1IiHA7jgwJ32JriOG62/Hno2e4uCdD4JIUlRscwPD8dSF9aIf5EQ3NwU94A
	 L2cLabV7YJhExZqlyebqjPs+myKvEm9qcXGwuk41TPSDzZgQNq/aO7YrLFl9ixYdO6
	 2yC4WLKCaxQ4gQdRUOb7aBguWEsaKHnH6I3kbBLf0J3ynpfS4U+1KWtHkGtUZNCmQp
	 mOZjyXsDHZoqQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id B5B16E52508;
	Wed, 12 Jul 2023 03:30:23 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v3 0/8] net: freescale: Convert to platform remove
 callback returning void
From: patchwork-bot+netdevbpf@kernel.org
Message-Id:  <168913262373.27250.8401630436062534160.git-patchwork-notify@kernel.org>
Date: Wed, 12 Jul 2023 03:30:23 +0000
References: <20230710071946.3470249-1-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20230710071946.3470249-1-u.kleine-koenig@pengutronix.de>
To: =?utf-8?q?Uwe_Kleine-K=C3=B6nig_=3Cu=2Ekleine-koenig=40pengutronix=2Ede=3E?=@ci.codeaurora.org
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
Cc: madalin.bucur@nxp.com, simon.horman@corigine.com, edumazet@google.com, robh@kernel.org, sean.anderson@seco.com, linux@armlinux.org.uk, shenwei.wang@nxp.com, xiaoning.wang@nxp.com, linux-imx@nxp.com, kuba@kernel.org, pabeni@redhat.com, maciej.fijalkowski@intel.com, claudiu.manoil@nxp.com, wei.fang@nxp.com, michal.kubiak@intel.com, netdev@vger.kernel.org, nicolas.ferre@microchip.com, leoyang.li@nxp.com, kernel@pengutronix.de, mkl@pengutronix.de, linuxppc-dev@lists.ozlabs.org, davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello:

This series was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Mon, 10 Jul 2023 09:19:38 +0200 you wrote:
> Hello,
> 
> v2 of this series was sent in June[1], code changes since then only affect
> patch #1 where the dev_err invocation was adapted to emit the error code of
> dpaa_fq_free(). Thanks for feedback by Maciej Fijalkowski and Russell King.
> Other than that I added Reviewed-by tags for Simon Horman and Wei Fang and
> rebased to v6.5-rc1.
> 
> [...]

Here is the summary with links:
  - [net-next,v3,1/8] net: dpaa: Improve error reporting
    https://git.kernel.org/netdev/net-next/c/1e679b957ae2
  - [net-next,v3,2/8] net: dpaa: Convert to platform remove callback returning void
    https://git.kernel.org/netdev/net-next/c/9c3ddc44d0c0
  - [net-next,v3,3/8] net: fec: Convert to platform remove callback returning void
    https://git.kernel.org/netdev/net-next/c/12d6cc19f29b
  - [net-next,v3,4/8] net: fman: Convert to platform remove callback returning void
    https://git.kernel.org/netdev/net-next/c/4875b2a362e9
  - [net-next,v3,5/8] net: fs_enet: Convert to platform remove callback returning void
    https://git.kernel.org/netdev/net-next/c/ead29c5e0888
  - [net-next,v3,6/8] net: fsl_pq_mdio: Convert to platform remove callback returning void
    https://git.kernel.org/netdev/net-next/c/f833635589ae
  - [net-next,v3,7/8] net: gianfar: Convert to platform remove callback returning void
    https://git.kernel.org/netdev/net-next/c/4be0ebc33f39
  - [net-next,v3,8/8] net: ucc_geth: Convert to platform remove callback returning void
    https://git.kernel.org/netdev/net-next/c/ae18facf566c

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


