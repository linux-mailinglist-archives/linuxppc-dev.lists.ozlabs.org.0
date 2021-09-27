Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E7E3419446
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Sep 2021 14:30:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HJ26X3V7gz2yfZ
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Sep 2021 22:30:44 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=aagikAYa;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=patchwork-bot+netdevbpf@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=aagikAYa; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HJ25t3FgXz2xrS
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Sep 2021 22:30:10 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPS id 4BAB561052;
 Mon, 27 Sep 2021 12:30:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1632745807;
 bh=K1EZKejVQe6qPIv+q8bePqmHhQ7/m2oRElQfBlUiiUw=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=aagikAYaDCNQGNOuW6a+zsTfAMr+d8KGwxskgIFj7ofvhk4kuA9sKUtKmJs0+VmOC
 p6JagmthfVuusQfCne6gaO184K2LcfbmklSueuYCZ8CNefOnW4tw2+rgdHdlWxC/qj
 uoiEy7UroCUUNE92gyfrd37PwwLHOlYLx4sujGDjbEf6VpCTvsxNJxatEew6c1z1fa
 4xW5VW5D+I7Re77xC6HXO6L7qmqKzw7BofjsHRNDGSMn46ykV+R5D/Dj+k1SkaM4Hu
 xRf+xeofEnkUODrip67zFoYvaSoB+SghMsY6GLJq4hhAMAiGUlpog6nTnNKE6hMH+A
 P7GuO3/Nni01g==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain
 [127.0.0.1])
 by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 3C8E660A59;
 Mon, 27 Sep 2021 12:30:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] Revert "ibmvnic: check failover_pending in login response"
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <163274580724.1790.16630852856514967779.git-patchwork-notify@kernel.org>
Date: Mon, 27 Sep 2021 12:30:07 +0000
References: <20210925151418.1614874-1-desnesn@linux.ibm.com>
In-Reply-To: <20210925151418.1614874-1-desnesn@linux.ibm.com>
To: Desnes A. Nunes do Rosario <desnesn@linux.ibm.com>
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
Cc: drt@linux.ibm.com, netdev@vger.kernel.org, tlfalcon@linux.ibm.com,
 sukadev@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello:

This patch was applied to netdev/net.git (refs/heads/master):

On Sat, 25 Sep 2021 12:14:18 -0300 you wrote:
> This reverts commit d437f5aa23aa2b7bd07cd44b839d7546cc17166f.
> 
> Code has been duplicated through commit <273c29e944bd> "ibmvnic: check
> failover_pending in login response"
> 
> Signed-off-by: Desnes A. Nunes do Rosario <desnesn@linux.ibm.com>
> 
> [...]

Here is the summary with links:
  - Revert "ibmvnic: check failover_pending in login response"
    https://git.kernel.org/netdev/net/c/2974b8a691a9

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


