Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 891FF943E4D
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Aug 2024 03:21:28 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=aqrSKcoe;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WZB4k3bl4z3cBP
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Aug 2024 11:21:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=aqrSKcoe;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:40e1:4800::1; helo=sin.source.kernel.org; envelope-from=patchwork-bot+netdevbpf@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WZB4300R0z2y8f
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Aug 2024 11:20:50 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 5262ECE180D;
	Thu,  1 Aug 2024 01:20:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 496C4C4AF0E;
	Thu,  1 Aug 2024 01:20:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722475244;
	bh=0Cj2CYi5Yaa/r8yTIhFd9T0uI/B1fVza5+1vkd36H74=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=aqrSKcoerJZT5xTH7Z3RNqdF2mgkwPn9FeI/0Ffr/SK1nb3NvbO1z5beD/ujlJFBi
	 YkeAV6hjwTlfaqLj1LFiCGncqnzoS+arc8j/tK1436FGJifqGIaHdWdkl+8YsMnp1h
	 SqHNqPno+1WhXaHNPY47n0PNdK8HKFJYiq1PXgKez2JPq6igX8CVssuxRPQmB5ESEb
	 +Pvywrt/b6iAR5Mq/CvHMUSC7CPPWOjGQa0xokpFNH3x6OjPX9XrhQVexN2yrSujGb
	 SWZGYRHhpPFez2pKSVvY+tK4hEIaJQGDN3/dYmmMNKfOvkqYR7ivMPwtmHCNU6m+7u
	 rEdyAAyNLAvhg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 33592C43140;
	Thu,  1 Aug 2024 01:20:44 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net v1] net: wan: fsl_qmc_hdlc: Discard received CRC
From: patchwork-bot+netdevbpf@kernel.org
Message-Id:  <172247524420.27205.8731063476744531287.git-patchwork-notify@kernel.org>
Date: Thu, 01 Aug 2024 01:20:44 +0000
References: <20240730063133.179598-1-herve.codina@bootlin.com>
In-Reply-To: <20240730063133.179598-1-herve.codina@bootlin.com>
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
Cc: andriy.shevchenko@linux.intel.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, christophe.leroy@csgroup.eu, edumazet@google.com, stable@vger.kernel.org, thomas.petazzoni@bootlin.com, kuba@kernel.org, pabeni@redhat.com, linuxppc-dev@lists.ozlabs.org, davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello:

This patch was applied to netdev/net.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Tue, 30 Jul 2024 08:31:33 +0200 you wrote:
> Received frame from QMC contains the CRC.
> Upper layers don't need this CRC and tcpdump mentioned trailing junk
> data due to this CRC presence.
> 
> As some other HDLC driver, simply discard this CRC.
> 
> Fixes: d0f2258e79fd ("net: wan: Add support for QMC HDLC")
> Cc: stable@vger.kernel.org
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> 
> [...]

Here is the summary with links:
  - [net,v1] net: wan: fsl_qmc_hdlc: Discard received CRC
    https://git.kernel.org/netdev/net/c/e549360069b4

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


