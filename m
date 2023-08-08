Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 26886774E0F
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Aug 2023 00:11:32 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=HaEtjISl;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RL6pp0V9Jz3byL
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Aug 2023 08:11:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=HaEtjISl;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=patchwork-bot+netdevbpf@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RL6ng0mM2z2y1d
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Aug 2023 08:10:31 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 9C0CD62DB1;
	Tue,  8 Aug 2023 22:10:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 830B9C433CA;
	Tue,  8 Aug 2023 22:10:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691532626;
	bh=ElzwQNB5k4o9+Lw4DzC4a7QoKVmgp4dLbavyMvqdX4o=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=HaEtjISl7bsUid68IEO4GasfSC01wI2nfCS5A1XTvlxVsyFHrOezgLr5URdJhgUvv
	 u+Rntsk+AJIQgNnZR/cll7sPy4C0gFohNytM5SGE3MkDMtm+Czipr+PEyww9ALVkxK
	 077GFkbV0lq/yrYPouoEUYwp7Yk1EcoPnyv1F4CCk93T9x+EQEQh2zIff00b+4wk3r
	 hwA5hYyHFVfZN4KFvH2H4vDdTmXog7P/B7vfCbgE1hjyxyy3EHKIbn/PvGx1ZNNtHp
	 EXX0pFAN0un/m3EXCVPTnxnLROfJ/P2CSQ9dFse9hYN3fh8ui12PNrQMXY74QBBduZ
	 P5bjSyqXDp0jg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 677DBC64459;
	Tue,  8 Aug 2023 22:10:26 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v2 00/10] net: fs_enet: Driver cleanup
From: patchwork-bot+netdevbpf@kernel.org
Message-Id:  <169153262641.13746.13289621238747032969.git-patchwork-notify@kernel.org>
Date: Tue, 08 Aug 2023 22:10:26 +0000
References: <cover.1691155346.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1691155346.git.christophe.leroy@csgroup.eu>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
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
Cc: robh@kernel.org, linux-kernel@vger.kernel.org, npiggin@gmail.com, edumazet@google.com, netdev@vger.kernel.org, kuba@kernel.org, pabeni@redhat.com, linuxppc-dev@lists.ozlabs.org, davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello:

This series was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Fri,  4 Aug 2023 15:30:10 +0200 you wrote:
> Over the years, platform and driver initialisation have evolved into
> more generic ways, and driver or platform specific stuff has gone
> away, leaving stale objects behind.
> 
> This series aims at cleaning all that up for fs_enet ethernet driver.
> 
> Changes in v2:
> - Remove a trailing whitespace in the old struct moved in patch 7.
> - Include powerpc people and list that I forgot when sending v1
> (and Rob as expected by Patchwork for patch 6, not sure why)
> 
> [...]

Here is the summary with links:
  - [net-next,v2,01/10] net: fs_enet: Remove set but not used variable
    https://git.kernel.org/netdev/net-next/c/78d3902795f0
  - [net-next,v2,02/10] net: fs_enet: Fix address space and base types mismatches
    https://git.kernel.org/netdev/net-next/c/ae9e78a9dc88
  - [net-next,v2,03/10] net: fs_enet: Remove fs_get_id()
    https://git.kernel.org/netdev/net-next/c/26bbbef8ff40
  - [net-next,v2,04/10] net: fs_enet: Remove unused fields in fs_platform_info struct
    https://git.kernel.org/netdev/net-next/c/caaf482e2654
  - [net-next,v2,05/10] net: fs_enet: Remove has_phy field in fs_platform_info struct
    https://git.kernel.org/netdev/net-next/c/9359a48c65a3
  - [net-next,v2,06/10] net: fs_enet: Remove stale prototypes from fsl_soc.c
    https://git.kernel.org/netdev/net-next/c/62e106c802c5
  - [net-next,v2,07/10] net: fs_enet: Move struct fs_platform_info into fs_enet.h
    https://git.kernel.org/netdev/net-next/c/7a76918371fe
  - [net-next,v2,08/10] net: fs_enet: Don't include fs_enet_pd.h when not needed
    https://git.kernel.org/netdev/net-next/c/33deffc9f19f
  - [net-next,v2,09/10] net: fs_enet: Remove linux/fs_enet_pd.h
    https://git.kernel.org/netdev/net-next/c/7149b38dc7cb
  - [net-next,v2,10/10] net: fs_enet: Use cpm_muram_xxx() functions instead of cpm_dpxxx() macros
    https://git.kernel.org/netdev/net-next/c/5e6cb39a256d

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


