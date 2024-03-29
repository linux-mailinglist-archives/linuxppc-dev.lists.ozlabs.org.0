Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7471B892450
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Mar 2024 20:31:18 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=IVV3npmS;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V5r9w1FMnz3vh0
	for <lists+linuxppc-dev@lfdr.de>; Sat, 30 Mar 2024 06:31:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=IVV3npmS;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=patchwork-bot+netdevbpf@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V5r991ssFz3vYC
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 30 Mar 2024 06:30:37 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id BC73F619E6;
	Fri, 29 Mar 2024 19:30:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 293A4C43390;
	Fri, 29 Mar 2024 19:30:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711740633;
	bh=kASKGM3dFtExpzEE03kTs35TIgPe+csliIufLHzIK04=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=IVV3npmSePL8advnxP77niTJn9r5VWn3Rp+dlR8NGJ9lX2oLIqkoGV+xDPWNxKxDQ
	 Vy1L2g8YCGgRSXrLc/sQkv/2M4J9jxdAA8SAbhGR8ajFTlmfsqHLf0fvOTAPm2dcKv
	 R1fVsKFXQ0PjDCVdjZFjTagXNRerIfdbo2okMOvrjklmOXE9qqZC9SCAN3EPi44fip
	 ZCq07ahttvJ9JoOo07ITMoNBIgDCC6Y+Xv77EcLFfSARbiSqQFxIHg2hw6SwpkmRbP
	 ts7yiXSanAtz/RnbfgXbCMeoFa7uggmPCtKepIwsnK9u0syfJQLIrvmxPSuoFye3BV
	 B+EvADBhn/jTg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 0FC90D2D0EE;
	Fri, 29 Mar 2024 19:30:33 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 0/9] enabled -Wformat-truncation for clang
From: patchwork-bot+netdevbpf@kernel.org
Message-Id:  <171174063305.18563.745216419087873927.git-patchwork-notify@kernel.org>
Date: Fri, 29 Mar 2024 19:30:33 +0000
References: <20240326223825.4084412-1-arnd@kernel.org>
In-Reply-To: <20240326223825.4084412-1-arnd@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>
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
Cc: hare@kernel.org, vladimir.oltean@nxp.com, llvm@lists.linux.dev, linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org, perex@perex.cz, netdev@vger.kernel.org, morbo@google.com, linux-scsi@vger.kernel.org, leon@kernel.org, linux-rdma@vger.kernel.org, deller@gmx.de, linux-input@vger.kernel.org, ilpo.jarvinen@linux.intel.com, aelior@marvell.com, nicolas@fjasle.eu, arnd@arndb.de, linux-kbuild@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-sound@vger.kernel.org, nathan@kernel.org, hdegoede@redhat.com, claudiu.manoil@nxp.com, kuba@kernel.org, platform-driver-x86@vger.kernel.org, manishc@marvell.com, martin.petersen@oracle.com, saeedm@nvidia.com, dmitry.torokhov@gmail.com, ndesaulniers@google.com, tiwai@suse.com, linux-kernel@vger.kernel.org, justinstitt@google.com, johannes@sipsolutions.net, alsa-devel@alsa-project.org, luzmaximilian@gmail.com, masahiroy@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello:

This series was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Tue, 26 Mar 2024 23:37:59 +0100 you wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> With randconfig build testing, I found only eight files that produce
> warnings with clang when -Wformat-truncation is enabled. This means
> we can just turn it on by default rather than only enabling it for
> "make W=1".
> 
> [...]

Here is the summary with links:
  - [2/9] enetc: avoid truncating error message
    https://git.kernel.org/netdev/net-next/c/9046d581ed58
  - [3/9] qed: avoid truncating work queue length
    https://git.kernel.org/netdev/net-next/c/954fd908f177
  - [4/9] mlx5: avoid truncating error message
    https://git.kernel.org/netdev/net-next/c/b324a960354b

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


