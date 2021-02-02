Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B34C30B559
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Feb 2021 03:41:50 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DV8GL75W6zDr2m
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Feb 2021 13:41:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=patchwork-bot+netdevbpf@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=hQ65JZUa; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DV8DT1gmczDq8F
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Feb 2021 13:40:08 +1100 (AEDT)
Received: by mail.kernel.org (Postfix) with ESMTPS id 610C964DDD;
 Tue,  2 Feb 2021 02:40:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612233606;
 bh=yfntcXcoqe1wusH7Htycob0bwFGVAVcT1tMwYbfHg9c=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=hQ65JZUalJB0jfM5k5T9biYh7Et52VefVKV34QjHDQcj+ldO8D3N2Tjdv8YW/AFkd
 aCrAcxLe+zyJhz9Hp4iqalfYH3sypFQ7445Ldb2nIfSkGhrk9vPDvLnmDaaBh+AynS
 t2CG8IwZpRYlVKnMsRqbiFLbOQXNGfcsJcwL2slchSfWZenLv9GRk+UhIrVtx5jxyM
 +/JID5c6afjzdZsr3jaR3T7vCc8NkSXDELofChNboYy+/nYYZjrjJgd9MUvFjud3uh
 VXPrIOsL7GTMoFrfnmIDatZo+xD4FYGNnhnsIwb76xF7be3lYDG+/mizELMXe3t6xp
 BUbrmkX183iwg==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain
 [127.0.0.1])
 by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 5170A609D7;
 Tue,  2 Feb 2021 02:40:06 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net v2] ibmvnic: device remove has higher precedence over
 reset
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <161223360632.28374.6957431077646560509.git-patchwork-notify@kernel.org>
Date: Tue, 02 Feb 2021 02:40:06 +0000
References: <20210129043402.95744-1-ljp@linux.ibm.com>
In-Reply-To: <20210129043402.95744-1-ljp@linux.ibm.com>
To: Lijun Pan <ljp@linux.ibm.com>
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
Cc: gregkh@linuxfoundation.org, julietk@linux.vnet.ibm.com,
 netdev@vger.kernel.org, u.kleine-koenig@pengutronix.de, paulus@samba.org,
 kernel@pengutronix.de, drt@linux.ibm.com, kuba@kernel.org,
 sukadev@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello:

This patch was applied to netdev/net.git (refs/heads/master):

On Thu, 28 Jan 2021 22:34:01 -0600 you wrote:
> Returning -EBUSY in ibmvnic_remove() does not actually hold the
> removal procedure since driver core doesn't care for the return
> value (see __device_release_driver() in drivers/base/dd.c
> calling dev->bus->remove()) though vio_bus_remove
> (in arch/powerpc/platforms/pseries/vio.c) records the
> return value and passes it on. [1]
> 
> [...]

Here is the summary with links:
  - [net,v2] ibmvnic: device remove has higher precedence over reset
    https://git.kernel.org/netdev/net/c/5e9eff5dfa46

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


