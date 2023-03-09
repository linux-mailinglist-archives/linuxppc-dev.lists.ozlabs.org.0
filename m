Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 732786B1C58
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Mar 2023 08:31:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PXLTG1zFjz3ccr
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Mar 2023 18:31:14 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=LMA0ITtU;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=patchwork-bot+netdevbpf@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=LMA0ITtU;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PXLSK08vmz3c6X
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Mar 2023 18:30:24 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 4954061A3E;
	Thu,  9 Mar 2023 07:30:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8FAA3C4339B;
	Thu,  9 Mar 2023 07:30:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678347020;
	bh=mu4O7Pvq1VNZVGOZLBf7dz+hLxR8Z6QVu2isJcMcwxE=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=LMA0ITtUNNBu9wowRtgErO4EczJ4X7ten37Ue68OJD9Bz32rM6EaOy3OiAzRrbgjW
	 7pEd6FOwuluGqJsjhIRJNsK8+kEu3VIWjdr3sSk+XwrHFq4I3fleGJGDEJao17cW+h
	 kjQr0PcY0ykrIaFfUoMM8MklPFFJaOWZOPwmEcOOjmNaejXw3lKx+9hIx8kKtnchoI
	 8DTocUmhaf+S/krh2SXsiExaOZjNnJtV8N+3ENQt6jSYW4IJvJnyFAINWjXETFW2pI
	 KlW7JXceHr2kevBsycJYyQMF0mzVatau6qB9vL2/540hDKToPB36nz3BScErRIENaP
	 Zqtg6wtmBcILg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 72B64E68C00;
	Thu,  9 Mar 2023 07:30:19 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net] eth: fealnx: bring back this old driver
From: patchwork-bot+netdevbpf@kernel.org
Message-Id:  <167834701946.22182.5252646764368734052.git-patchwork-notify@kernel.org>
Date: Thu, 09 Mar 2023 07:30:19 +0000
References: <20230307171930.4008454-1-kuba@kernel.org>
In-Reply-To: <20230307171930.4008454-1-kuba@kernel.org>
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
Cc: petrm@nvidia.com, tsbogend@alpha.franken.de, leon@kernel.org, geoff@infradead.org, netdev@vger.kernel.org, linux-mips@vger.kernel.org, stable@vger.kernel.org, stephen@networkplumber.org, wsa+renesas@sang-engineering.com, edumazet@google.com, npiggin@gmail.com, lukas.bulwahn@gmail.com, pabeni@redhat.com, linuxppc-dev@lists.ozlabs.org, davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello:

This patch was applied to netdev/net.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Tue,  7 Mar 2023 09:19:30 -0800 you wrote:
> This reverts commit d5e2d038dbece821f1af57acbeded3aa9a1832c1.
> 
> We have a report of this chip being used on a
> 
>   SURECOM EP-320X-S 100/10M Ethernet PCI Adapter
> 
> which could still have been purchased in some parts
> of the world 3 years ago.
> 
> [...]

Here is the summary with links:
  - [net] eth: fealnx: bring back this old driver
    https://git.kernel.org/netdev/net/c/8f1482080104

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


