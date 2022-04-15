Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BC1625028B7
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Apr 2022 13:10:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kftt25Zd0z3bp0
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Apr 2022 21:10:50 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=tCWvZrdh;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1;
 helo=dfw.source.kernel.org; envelope-from=patchwork-bot+netdevbpf@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=tCWvZrdh; 
 dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KftsN33VYz2yXM
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Apr 2022 21:10:16 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id EC3676228D;
 Fri, 15 Apr 2022 11:10:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 61A7BC385A9;
 Fri, 15 Apr 2022 11:10:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650021011;
 bh=f5522Fbo2dXjfAGlD5q36ttNQxa4AOpp2bPNvk44ymo=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=tCWvZrdhvWDj0GmOGuSJoJoH3TeuqffCAtoMOvHxaXdZnHLLDxy1EdyHpqX5MJX9Y
 zATFg/5vU/dX4oYdeZNTONFd0hLwHOnUCK9jTPfNBLkGNcyqPjC2InYhOrm/fmEWQ6
 Rk0Qb9dCtUd9N7BxZZVEfTj+KmP8t/q3kMSsr3OmjN8y3lg/ww0+IMesQXT3PSEPAV
 wKnGn7y1GG2A1sgFN3O1VZcVtOc/d5flMC+6ze9j6axeyLTKq6aXQoexV7B2HRFGHX
 1PxOGul5TlvrA3ibePMD3b/WC0j7fN0SC4Lnp05jkb9U1Hy4W52kCNR8KYrEs2fW1u
 8rwql0xGjJBnQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 3EAF0EAC096; Fri, 15 Apr 2022 11:10:11 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 1/1] powerpc: Update MAINTAINERS for ibmvnic and VAS
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <165002101125.2718.18001601253242630733.git-patchwork-notify@kernel.org>
Date: Fri, 15 Apr 2022 11:10:11 +0000
References: <20220413194515.93139-1-sukadev@linux.ibm.com>
In-Reply-To: <20220413194515.93139-1-sukadev@linux.ibm.com>
To: Sukadev Bhattiprolu <sukadev@linux.ibm.com>
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
Cc: drt@linux.ibm.com, netdev@vger.kernel.org, brking@linux.ibm.com,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello:

This patch was applied to netdev/net.git (master)
by David S. Miller <davem@davemloft.net>:

On Wed, 13 Apr 2022 12:45:15 -0700 you wrote:
> Signed-off-by: Sukadev Bhattiprolu <sukadev@linux.ibm.com>
> ---
>  MAINTAINERS | 2 --
>  1 file changed, 2 deletions(-)

Here is the summary with links:
  - [1/1] powerpc: Update MAINTAINERS for ibmvnic and VAS
    https://git.kernel.org/netdev/net/c/60496069d0ae

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


