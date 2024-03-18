Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 39E9287E5C7
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Mar 2024 10:31:12 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=u7zOq/T+;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TyqNY759dz3dXP
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Mar 2024 20:31:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=u7zOq/T+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=patchwork-bot+netdevbpf@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TyqMp5DbXz30fh
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 Mar 2024 20:30:30 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9BB9E60BC1;
	Mon, 18 Mar 2024 09:30:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5FFB3C43399;
	Mon, 18 Mar 2024 09:30:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710754227;
	bh=wa8S5aQ0Fzi4i7GlEYIb73Ld/KafiFSLsqPj7Efjbi0=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=u7zOq/T+2e0HggZ/WQdkDzR0G8QMpdeSemZfzugL74LUOQ02tAv/n6eS6Kx+vEldX
	 phqUbOvi1az5LXAWZAZuWZ5znyaVa2GZ6MgkzPXrPXbMj+TywfN3uhU0PwuucpbbxQ
	 5H0XnLfYoSbrLSY8nMABiUhzsGICcmvq8+yoKgUT3c8HNTbPdhDQis9qD5E4cz/Bf4
	 P37wHZCP8P1ZaGx+anM/Ascqzsa4c3Dmk7Kl1Y1PZGDjPzvj6H1908d9AuEKy+E/QQ
	 CBKq9e439vt4/OHOQObE/nHKcCatFeXWYDaShsMsRF3UQsetajPusOrYjOZsiTJ1ny
	 r+41iwwRFmNwg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 504A1D84BB3;
	Mon, 18 Mar 2024 09:30:27 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] net: wan: fsl_qmc_hdlc: Fix module compilation
From: patchwork-bot+netdevbpf@kernel.org
Message-Id:  <171075422732.16862.15652727322358933272.git-patchwork-notify@kernel.org>
Date: Mon, 18 Mar 2024 09:30:27 +0000
References: <20240314123346.461350-1-herve.codina@bootlin.com>
In-Reply-To: <20240314123346.461350-1-herve.codina@bootlin.com>
To: Herve Codina <herve.codina@bootlin.com>
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
Cc: andrew@lunn.ch, andriy.shevchenko@linux.intel.com, vadim.fedorenko@linux.dev, rkannoth@marvell.com, yury.norov@gmail.com, linux@rasmusvillemoes.dk, linux-kernel@vger.kernel.org, edumazet@google.com, broonie@kernel.org, thomas.petazzoni@bootlin.com, netdev@vger.kernel.org, kuba@kernel.org, pabeni@redhat.com, linuxppc-dev@lists.ozlabs.org, davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello:

This patch was applied to netdev/net.git (main)
by David S. Miller <davem@davemloft.net>:

On Thu, 14 Mar 2024 13:33:46 +0100 you wrote:
> The fsl_qmc_driver does not compile as module:
>   error: ‘qmc_hdlc_driver’ undeclared here (not in a function);
>     405 | MODULE_DEVICE_TABLE(of, qmc_hdlc_driver);
>         |                         ^~~~~~~~~~~~~~~
> 
> Fix the typo.
> 
> [...]

Here is the summary with links:
  - net: wan: fsl_qmc_hdlc: Fix module compilation
    https://git.kernel.org/netdev/net/c/badc9e33c795

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


