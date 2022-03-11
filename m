Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C49E04D6049
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Mar 2022 12:00:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KFNJk2vBRz3bX4
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Mar 2022 22:00:54 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=EgfnjWv2;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1;
 helo=ams.source.kernel.org; envelope-from=patchwork-bot+netdevbpf@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=EgfnjWv2; 
 dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KFNJ66YG6z2yNv
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Mar 2022 22:00:22 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id BE83FB82AFC;
 Fri, 11 Mar 2022 11:00:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id ED0EBC340F4;
 Fri, 11 Mar 2022 11:00:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646996414;
 bh=vei2XrdqQh2PV8B3FwqM1GUVmbx5mhp6g8aEwOZFwcA=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=EgfnjWv2x1GJuuFcV5nMZ7OXVNy2/tFpmX/lECVNUyWgjxhexQiL9vMACypPjALdb
 4qI9Mv9GfAZj8huDwUzK4YIBuSnV03RJqxVXdN5Nv8k7EIaKFSKwKsJuBczAF32FRg
 nzZwJ7DX5VLMV4mjRB+zQ0EOyoxPxwKLn0rXmcOqnz0xieqvoVtjWSWUhvhQVG0ylu
 G8+zs+CginBBy1MlH5vz2XtEyGajSgYJfyUWVsKptEFV4ITMfyUyFAvQfMSVjbvXQY
 27KT0OrAQn2imOpWRXksOnDv4mhJJ46Cn/W76MB1YqGnNfkGKuI/Zgyy1CfIaTfpRn
 L6WdWbTNwHbjA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 CDD90E6D3DD; Fri, 11 Mar 2022 11:00:13 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v2] powerpc/net: Implement powerpc specific
 csum_shift() to remove branch
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <164699641383.30508.9920591950729101881.git-patchwork-notify@kernel.org>
Date: Fri, 11 Mar 2022 11:00:13 +0000
References: <1e1a0f38f3f0ab61283ccfb69626104a897f3551.1646755813.git.christophe.leroy@csgroup.eu>
In-Reply-To: <1e1a0f38f3f0ab61283ccfb69626104a897f3551.1646755813.git.christophe.leroy@csgroup.eu>
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
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org, paulus@samba.org,
 kuba@kernel.org, linuxppc-dev@lists.ozlabs.org, davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello:

This patch was applied to netdev/net-next.git (master)
by David S. Miller <davem@davemloft.net>:

On Tue,  8 Mar 2022 17:12:10 +0100 you wrote:
> Today's implementation of csum_shift() leads to branching based on
> parity of 'offset'
> 
> 	000002f8 <csum_block_add>:
> 	     2f8:	70 a5 00 01 	andi.   r5,r5,1
> 	     2fc:	41 a2 00 08 	beq     304 <csum_block_add+0xc>
> 	     300:	54 84 c0 3e 	rotlwi  r4,r4,24
> 	     304:	7c 63 20 14 	addc    r3,r3,r4
> 	     308:	7c 63 01 94 	addze   r3,r3
> 	     30c:	4e 80 00 20 	blr
> 
> [...]

Here is the summary with links:
  - [net-next,v2] powerpc/net: Implement powerpc specific csum_shift() to remove branch
    https://git.kernel.org/netdev/net-next/c/3af722cb735d

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


