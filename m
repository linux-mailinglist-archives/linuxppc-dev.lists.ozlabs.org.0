Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 945348A0613
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Apr 2024 04:41:12 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=CBQwymop;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VFP8Q3409z3vZ5
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Apr 2024 12:41:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=CBQwymop;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:40e1:4800::1; helo=sin.source.kernel.org; envelope-from=patchwork-bot+netdevbpf@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VFP7j4DThz3cQm
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Apr 2024 12:40:33 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 89396CE2E69;
	Thu, 11 Apr 2024 02:40:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 77201C433C7;
	Thu, 11 Apr 2024 02:40:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712803228;
	bh=Zmk1fk70Hqu5bNMkAwUutOzHTLESrot20KQz6j4g7Wo=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=CBQwymop1NuQqMI2sUsffEk0jvsHjzsJsMfqKvAvN1VJ7vWGsI+vbyndwP2eAdfzx
	 NIk3/pYQ1icJIH84HPo7L8s0zJ2TEfPBJ+cdDgB7Bos3n3Jxqx8G7bkpqi9XTd2/Br
	 fpRcPISV1tu15K2mgCf4Uexu4e53B/P2ri0Ju5ZvHTI0Kl+eGhwbhYS9UhqJubb3Ip
	 LViONdW5U5kPtuQSfX0Qbown6LuNfippQC0mcIzw30VFb3pUGmDSE+gS7CtWTsCewr
	 vzcp1hvpt5oDFWQaucm+jH3KbylH2vVHoKd5fuh+dwuPczUpvRDSfW6Dji4s0EJYzJ
	 /HUkCNMLqO+PQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 68382D6030E;
	Thu, 11 Apr 2024 02:40:28 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next] net: wan: fsl_qmc_hdlc: Convert to platform remove
 callback returning void
From: patchwork-bot+netdevbpf@kernel.org
Message-Id:  <171280322842.23404.11616120911781131170.git-patchwork-notify@kernel.org>
Date: Thu, 11 Apr 2024 02:40:28 +0000
References: <20240409091203.39062-2-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20240409091203.39062-2-u.kleine-koenig@pengutronix.de>
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
Cc: andriy.shevchenko@linux.intel.com, herve.codina@bootlin.com, netdev@vger.kernel.org, edumazet@google.com, kernel@pengutronix.de, kuba@kernel.org, pabeni@redhat.com, linuxppc-dev@lists.ozlabs.org, davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello:

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Tue,  9 Apr 2024 11:12:04 +0200 you wrote:
> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is ignored (apart
> from emitting a warning) and this typically results in resource leaks.
> 
> To improve here there is a quest to make the remove callback return
> void. In the first step of this quest all drivers are converted to
> .remove_new(), which already returns void. Eventually after all drivers
> are converted, .remove_new() will be renamed to .remove().
> 
> [...]

Here is the summary with links:
  - [net-next] net: wan: fsl_qmc_hdlc: Convert to platform remove callback returning void
    https://git.kernel.org/netdev/net-next/c/07409cf72844

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


