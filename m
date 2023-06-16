Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 81D0D7326F9
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Jun 2023 08:01:15 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=R7WLLJut;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qj7nj2bhzz3bv3
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Jun 2023 16:01:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=R7WLLJut;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=patchwork-bot+netdevbpf@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qj7mq2Nckz2xHK
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Jun 2023 16:00:27 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id B346561CC3;
	Fri, 16 Jun 2023 06:00:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 407C0C433CA;
	Fri, 16 Jun 2023 06:00:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686895223;
	bh=qmcmgjwqTMCDq/JHveSAC3AaX8zts5IADhw+H2J9ox0=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=R7WLLJutFWWwwLfgoGmMfQ7MWYMpUU5R+PffBZxTmdXhDlgx36bWJhVV8kDLwwLV7
	 j2os7vVB1/Cas3d1HgzhYKqjgGDIq6I3CKC6yyZpOuj9T9UlJcc8BsySyz16ItAb6w
	 o5H3eetpjlkvIMnPUiQl1gioKOF5AWTbEcKWPDu5R2LOHfyBDNVWNi1YcG47lCBWmG
	 5vlAHRAfHgOVlpY6UuXRKGpkTJVVG5XpF3IO9AjsKzTZo7Fp1NXxV2IpJC+3eoJG7s
	 Kbp+KzsuwLO/Uh3YHJag0QWA/zDsqo0CuSz5s/XY6EzSvScNt8yJGbINfKaujwWMXC
	 FuA1mgqpoB/DA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 138BAE49F62;
	Fri, 16 Jun 2023 06:00:23 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next] eth: fs_enet: fix print format for resource size
From: patchwork-bot+netdevbpf@kernel.org
Message-Id:  <168689522307.30897.16355114078429295626.git-patchwork-notify@kernel.org>
Date: Fri, 16 Jun 2023 06:00:23 +0000
References: <20230615035231.2184880-1-kuba@kernel.org>
In-Reply-To: <20230615035231.2184880-1-kuba@kernel.org>
To: Jakub Kicinski <kuba@kernel.org>
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
Cc: netdev@vger.kernel.org, rdunlap@infradead.org, edumazet@google.com, pabeni@redhat.com, linuxppc-dev@lists.ozlabs.org, davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello:

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Wed, 14 Jun 2023 20:52:31 -0700 you wrote:
> Randy forwarded report from Stephen that on PowerPC:
> 
> drivers/net/ethernet/freescale/fs_enet/mii-fec.c: In function 'fs_enet_mdio_probe':
> drivers/net/ethernet/freescale/fs_enet/mii-fec.c:130:50: warning: format '%x' expects argument of type 'unsigned int', but argument 4 has type 'resource_size_t' {aka 'long long unsigned int'} [-Wformat=]
>   130 |         snprintf(new_bus->id, MII_BUS_ID_SIZE, "%x", res.start);
>       |                                                 ~^   ~~~~~~~~~
>       |                                                  |      |
>       |                                                  |      resource_size_t {aka long long unsigned int}
>       |                                                  unsigned int
>       |                                                 %llx
> 
> [...]

Here is the summary with links:
  - [net-next] eth: fs_enet: fix print format for resource size
    https://git.kernel.org/netdev/net-next/c/8f72fb1578a9

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


