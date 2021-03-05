Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2152B32F51A
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Mar 2021 22:10:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DsgPQ1Ptqz3dKn
	for <lists+linuxppc-dev@lfdr.de>; Sat,  6 Mar 2021 08:10:34 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=eau6n5wE;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=patchwork-bot+netdevbpf@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=eau6n5wE; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DsgP1478Mz3bPH
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  6 Mar 2021 08:10:13 +1100 (AEDT)
Received: by mail.kernel.org (Postfix) with ESMTPS id 3313E650A5;
 Fri,  5 Mar 2021 21:10:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1614978609;
 bh=/pJj/nB535Qu0F9dhwEEv/JkP20imH0yiCmcAAmvo6U=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=eau6n5wEUdwCMIXk0EhStLu5mRpuvWpK/+v+u0MsnXxlQJLa7Vs72MgGSAeXQ8tKF
 u7Ztto4jyaVhAjip3mMdYAOX58snN1Qy57i5/wMA4frtMI7KmWdXv6poH+7M7EjK38
 vdBvcMkq0+rTkLTP7qnf+ir5e7VL0EqQbJ60BZVjD8tM4MYJQKG8JGWyNG3q/m5q7b
 gD89BYah1EQGyrGdax6MPZIGoODbEy7fIV3Aiagn/3hmO7OHoBMjQzva9TO1HgCATI
 bMSNqaADqjKpB9wafIaF0JTAqgjtDAMo8peSbrrJa/R3E3qnjafbKcONA3yRRu7lq5
 cw6S/xOHs8y0Q==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain
 [127.0.0.1])
 by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 25C3160A22;
 Fri,  5 Mar 2021 21:10:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v1] ibmvnic: remove excessive irqsave
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <161497860915.24588.2102886207868627115.git-patchwork-notify@kernel.org>
Date: Fri, 05 Mar 2021 21:10:09 +0000
References: <20210305084839.2405-1-angkery@163.com>
In-Reply-To: <20210305084839.2405-1-angkery@163.com>
To: angkery <angkery@163.com>
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
Cc: yangjunlin@yulong.com, linux-kernel@vger.kernel.org, kuba@kernel.org,
 netdev@vger.kernel.org, ljp@linux.ibm.com, drt@linux.ibm.com, paulus@samba.org,
 sukadev@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello:

This patch was applied to netdev/net.git (refs/heads/master):

On Fri,  5 Mar 2021 16:48:39 +0800 you wrote:
> From: Junlin Yang <yangjunlin@yulong.com>
> 
> ibmvnic_remove locks multiple spinlocks while disabling interrupts:
> spin_lock_irqsave(&adapter->state_lock, flags);
> spin_lock_irqsave(&adapter->rwi_lock, flags);
> 
> As reported by coccinelle, the second _irqsave() overwrites the value
> saved in 'flags' by the first _irqsave(),   therefore when the second
> _irqrestore() comes,the value in 'flags' is not valid,the value saved
> by the first _irqsave() has been lost.
> This likely leads to IRQs remaining disabled. So remove the second
> _irqsave():
> spin_lock_irqsave(&adapter->state_lock, flags);
> spin_lock(&adapter->rwi_lock);
> 
> [...]

Here is the summary with links:
  - [v1] ibmvnic: remove excessive irqsave
    https://git.kernel.org/netdev/net/c/69cdb7947adb

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


