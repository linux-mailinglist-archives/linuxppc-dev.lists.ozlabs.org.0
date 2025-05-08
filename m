Return-Path: <linuxppc-dev+bounces-8423-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C431AAF146
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 May 2025 04:49:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZtGnX3v6qz2yf1;
	Thu,  8 May 2025 12:49:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1746672592;
	cv=none; b=TGtUavuMTV5o+PbufK9tZaC5CnnH4nvXQ6pxPHutophdk55fQOW3MJEpCWdy3jCe4VFi+wPD+dNNuKKIzXUlzp/YfGd9+qWn6x0Gih/utV9KyEkU2VV+4DmABHNuuOXFcg0lYk8LZ+ttPAhJc+gHVYv6NzsjlS3Xdvss2aV5Ncn8G9aSRJdU0dHCw8Jci8K0nLnjlmKz3EFyeYPmQTOxHxYiRszjDaKWEPe8Z7FU5MlajXsClk+z+vT/QiMQT2nQowiEUi8a/BYKvWI1VNGFHQecPJcwUwJ7Qevg4Sv5+3OFgw/TNOdIhTAqfU8fGhVgO+4xpuHvOdBv9X9oWLRsIw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1746672592; c=relaxed/relaxed;
	bh=WDyIwRNa9RK7QAxskiJB7p068CUzPTfeqIGmYe9Ejds=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=ifoQWRxW9UZ0ep7V4D2rEVe+Lg8GVQmwIQTQ10DPgqUluCqIqlSr/FCswEDreHw6NbJ8zTurXYXepn9AI10h/Sev2wMCIh6w5jtQm8pY4SEXU5gCtGEmLseBgFGZ8Yox+Oq6n7J3bla1Hpvanl2+0j545xBuLa98C3GPKJuOWzS3drWrj37Pil5syGvQwmdxgs3SSrw8FOUENZRaQ6H7bqaNoxJY+4uypFDISqHYPKdRGH9G5CNcfQF/5cXYeicYgVGyO+b/Uc2Yk4kv1quTN0SM2TAeLJXM9dD1m2frX4CcVNhEsWIVMR0CPHU3MeoW93BBltom1R0inWiKg3/Xdg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Q2MBMQXX; dkim-atps=neutral; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=patchwork-bot+netdevbpf@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Q2MBMQXX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=patchwork-bot+netdevbpf@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZtGnW5k2Bz2yZZ
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 May 2025 12:49:51 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id CC17DA4B855;
	Thu,  8 May 2025 02:49:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7298DC4CEE2;
	Thu,  8 May 2025 02:49:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746672588;
	bh=s9eti+mmKmuzG5etTANGs7weTEGIgIRLk08n5mcTOSk=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=Q2MBMQXX8veSBjMBwP259PxhJZXHejQ58XJkZCeJdtiCt7/wPOVDdbkXyh0mWw8Hk
	 K+t49ZJ0arkHVTnNXsnHj0+0ONavO9L1jLFeJ1Ztff3ino24LuU/672nTD4qCwgJDe
	 skSOq+S4XaGwxZDAYIvq1EI6Qwn/HrfXsMRuGL0fHHzibREorkfiJDNDqOKJ3nBgNC
	 znTqxXhg2UpU0VTbbxTnaRd0d0wLr37FSaX0HSfeeT8i7S+is0X4R/kV9anyBfSFR2
	 nC3RoiEtBPUCRB2qhfDx7g+tOcyuSVRbn1UMFoqUTHNv9lsaHHPaiJbe8S4MLCKN2N
	 l0y990fXnFOaw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70CAC380AA70;
	Thu,  8 May 2025 02:50:28 +0000 (UTC)
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
Subject: Re: [PATCH net-next] net: ibmveth: Refactored veth_pool_store for better
 maintainability
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <174667262725.2432699.18267996894730522721.git-patchwork-notify@kernel.org>
Date: Thu, 08 May 2025 02:50:27 +0000
References: <20250506160004.328347-1-davemarq@linux.ibm.com>
In-Reply-To: <20250506160004.328347-1-davemarq@linux.ibm.com>
To: Dave Marquardt <davemarq@linux.ibm.com>
Cc: netdev@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hello:

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Tue,  6 May 2025 11:00:04 -0500 you wrote:
> Make veth_pool_store detect requested pool changes, close device if
> necessary, update pool, and reopen device.
> 
> Signed-off-by: Dave Marquardt <davemarq@linux.ibm.com>
> ---
>  drivers/net/ethernet/ibm/ibmveth.c | 111 +++++++++++++++++------------
>  1 file changed, 67 insertions(+), 44 deletions(-)

Here is the summary with links:
  - [net-next] net: ibmveth: Refactored veth_pool_store for better maintainability
    https://git.kernel.org/netdev/net-next/c/46431fd5224f

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



