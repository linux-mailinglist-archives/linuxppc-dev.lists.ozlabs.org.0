Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9052C4BB8A7
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Feb 2022 12:50:52 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K0VQ16xldz3cQj
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Feb 2022 22:50:49 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=uZTUQkBM;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1;
 helo=ams.source.kernel.org; envelope-from=patchwork-bot+netdevbpf@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=uZTUQkBM; 
 dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K0VPN3kv3z3bXg
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Feb 2022 22:50:16 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 8B8EBB82613;
 Fri, 18 Feb 2022 11:50:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B3D70C340ED;
 Fri, 18 Feb 2022 11:50:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645185011;
 bh=M92w/Vvn2KP961+PnGi4s2JIBOakuipmVw6Dd0s/pUI=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=uZTUQkBMLZLaLc15PQ2gFSmc7JUWunC3BBDhIUgIHlDlDuUyxrP4q7t7ieU1BDs3t
 WQ2EqYkz3Ul9VznOd2X18eyz0ecGab+TcmAUMIf+VGf0gKkzJO0v2xIXuef2VpjXtd
 kecBSV1X6ifvlQcsaF+DGCamr6iEgcBTgzYkKwUBCHGV6tfLbjcy45qg4TWtp2V/Zj
 Jl4+oqQzfDzz0lPtWzkWRTxl808qRWVdU9RWSncnVcg0rp+0za7k5niejgyGzRy6yY
 UuCZHsgeUHOmhGEiJ/SRpSweEKR3HMiwvwWa53+yspIdh6wp7+qKXphuU9+nrN6DlR
 DFsw104va7UGQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 9F68AE5D07D; Fri, 18 Feb 2022 11:50:11 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] net/ibmvnic: Cleanup workaround doing an EOI after
 partition migration
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <164518501164.13243.6810888493004564611.git-patchwork-notify@kernel.org>
Date: Fri, 18 Feb 2022 11:50:11 +0000
References: <20220218080708.636587-1-clg@kaod.org>
In-Reply-To: <20220218080708.636587-1-clg@kaod.org>
To: =?utf-8?q?C=C3=A9dric_Le_Goater_=3Cclg=40kaod=2Eorg=3E?=@ci.codeaurora.org
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
Cc: netdev@vger.kernel.org, drt@linux.ibm.com, kuba@kernel.org,
 sukadev@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello:

This patch was applied to netdev/net-next.git (master)
by David S. Miller <davem@davemloft.net>:

On Fri, 18 Feb 2022 09:07:08 +0100 you wrote:
> There were a fair amount of changes to workaround a firmware bug leaving
> a pending interrupt after migration of the ibmvnic device :
> 
> commit 2df5c60e198c ("net/ibmvnic: Ignore H_FUNCTION return from H_EOI
>        		    to tolerate XIVE mode")
> commit 284f87d2f387 ("Revert "net/ibmvnic: Fix EOI when running in
>        		    XIVE mode"")
> commit 11d49ce9f794 ("net/ibmvnic: Fix EOI when running in XIVE mode.")
> commit f23e0643cd0b ("ibmvnic: Clear pending interrupt after device reset")
> 
> [...]

Here is the summary with links:
  - net/ibmvnic: Cleanup workaround doing an EOI after partition migration
    https://git.kernel.org/netdev/net-next/c/7ea0c16a74a4

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


