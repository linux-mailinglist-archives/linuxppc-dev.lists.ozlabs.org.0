Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 36AA24506F2
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Nov 2021 15:30:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HtBSX1cGhz2yKF
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Nov 2021 01:30:52 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=QwmLij4v;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=patchwork-bot+netdevbpf@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=QwmLij4v; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HtBRp0hSnz2xsv
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Nov 2021 01:30:13 +1100 (AEDT)
Received: by mail.kernel.org (Postfix) with ESMTPS id 3F29963222;
 Mon, 15 Nov 2021 14:30:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1636986610;
 bh=5P25mLT6Jr6VmyP/I0R+Oxwdz1c2BzKwtGMFLED8VYY=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=QwmLij4v79zfinmYoB7fJfDZQneCm1VgJioEa9NR0AqwiyWfBUyC3SFpyHRZujvKT
 Dkny2IsqH2W1IP19Mgutwx+QlEWLu8slCc735sUkBOChB/c/Ac71jZf9xRje0dA+/T
 xlXxICRUIoNvREMDNpK9QaHMRD0PQTW8nGJ65RpS2YX1XP5WI5VxyfgEKQ7+O3H5va
 l/vvLCvRISXn+f//f6ZoFw8Hm6tAIY+z4hvhWa2O4tHYx0JG9NIvZDp+LvfpQQW92c
 RXMMzWIu+SM6z0ZErh6MZ4aLv3hOCCIkv9rYkWs/af4QqL7RfYwDVbGiXbQlfEph1b
 Ixk4yetYvM0nQ==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain
 [127.0.0.1])
 by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 37F0460A49;
 Mon, 15 Nov 2021 14:30:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] net/wan/fsl_ucc_hdlc: fix sparse warnings
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <163698661022.25242.10725414110897368088.git-patchwork-notify@kernel.org>
Date: Mon, 15 Nov 2021 14:30:10 +0000
References: <28f87309a3bb26e91d93e808a3b0e43baf79cc3b.1636974508.git.christophe.leroy@csgroup.eu>
In-Reply-To: <28f87309a3bb26e91d93e808a3b0e43baf79cc3b.1636974508.git.christophe.leroy@csgroup.eu>
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
Cc: lkp@intel.com, netdev@vger.kernel.org, linux@rasmusvillemoes.dk,
 linux-kernel@vger.kernel.org, kuba@kernel.org, linuxppc-dev@lists.ozlabs.org,
 davem@davemloft.net, qiang.zhao@nxp.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello:

This patch was applied to netdev/net-next.git (master)
by David S. Miller <davem@davemloft.net>:

On Mon, 15 Nov 2021 12:08:59 +0100 you wrote:
> CHECK   drivers/net/wan/fsl_ucc_hdlc.c
> drivers/net/wan/fsl_ucc_hdlc.c:309:57: warning: incorrect type in argument 2 (different address spaces)
> drivers/net/wan/fsl_ucc_hdlc.c:309:57:    expected void [noderef] __iomem *
> drivers/net/wan/fsl_ucc_hdlc.c:309:57:    got restricted __be16 *
> drivers/net/wan/fsl_ucc_hdlc.c:311:46: warning: incorrect type in argument 2 (different address spaces)
> drivers/net/wan/fsl_ucc_hdlc.c:311:46:    expected void [noderef] __iomem *
> drivers/net/wan/fsl_ucc_hdlc.c:311:46:    got restricted __be32 *
> drivers/net/wan/fsl_ucc_hdlc.c:320:57: warning: incorrect type in argument 2 (different address spaces)
> drivers/net/wan/fsl_ucc_hdlc.c:320:57:    expected void [noderef] __iomem *
> drivers/net/wan/fsl_ucc_hdlc.c:320:57:    got restricted __be16 *
> drivers/net/wan/fsl_ucc_hdlc.c:322:46: warning: incorrect type in argument 2 (different address spaces)
> drivers/net/wan/fsl_ucc_hdlc.c:322:46:    expected void [noderef] __iomem *
> drivers/net/wan/fsl_ucc_hdlc.c:322:46:    got restricted __be32 *
> drivers/net/wan/fsl_ucc_hdlc.c:372:29: warning: incorrect type in assignment (different base types)
> drivers/net/wan/fsl_ucc_hdlc.c:372:29:    expected unsigned short [usertype]
> drivers/net/wan/fsl_ucc_hdlc.c:372:29:    got restricted __be16 [usertype]
> drivers/net/wan/fsl_ucc_hdlc.c:379:36: warning: restricted __be16 degrades to integer
> drivers/net/wan/fsl_ucc_hdlc.c:402:12: warning: incorrect type in assignment (different address spaces)
> drivers/net/wan/fsl_ucc_hdlc.c:402:12:    expected struct qe_bd [noderef] __iomem *bd
> drivers/net/wan/fsl_ucc_hdlc.c:402:12:    got struct qe_bd *curtx_bd
> drivers/net/wan/fsl_ucc_hdlc.c:425:20: warning: incorrect type in assignment (different address spaces)
> drivers/net/wan/fsl_ucc_hdlc.c:425:20:    expected struct qe_bd [noderef] __iomem *[assigned] bd
> drivers/net/wan/fsl_ucc_hdlc.c:425:20:    got struct qe_bd *tx_bd_base
> drivers/net/wan/fsl_ucc_hdlc.c:427:16: error: incompatible types in comparison expression (different address spaces):
> drivers/net/wan/fsl_ucc_hdlc.c:427:16:    struct qe_bd [noderef] __iomem *
> drivers/net/wan/fsl_ucc_hdlc.c:427:16:    struct qe_bd *
> drivers/net/wan/fsl_ucc_hdlc.c:462:33: warning: incorrect type in argument 1 (different address spaces)
> drivers/net/wan/fsl_ucc_hdlc.c:506:41: warning: incorrect type in argument 1 (different address spaces)
> drivers/net/wan/fsl_ucc_hdlc.c:528:33: warning: incorrect type in argument 1 (different address spaces)
> drivers/net/wan/fsl_ucc_hdlc.c:552:38: warning: incorrect type in argument 1 (different address spaces)
> drivers/net/wan/fsl_ucc_hdlc.c:596:67: warning: incorrect type in argument 2 (different address spaces)
> drivers/net/wan/fsl_ucc_hdlc.c:611:41: warning: incorrect type in argument 1 (different address spaces)
> drivers/net/wan/fsl_ucc_hdlc.c:851:38: warning: incorrect type in initializer (different address spaces)
> drivers/net/wan/fsl_ucc_hdlc.c:854:40: warning: incorrect type in argument 1 (different address spaces)
> drivers/net/wan/fsl_ucc_hdlc.c:855:40: warning: incorrect type in argument 1 (different address spaces)
> drivers/net/wan/fsl_ucc_hdlc.c:858:39: warning: incorrect type in argument 1 (different address spaces)
> drivers/net/wan/fsl_ucc_hdlc.c:861:37: warning: incorrect type in argument 2 (different address spaces)
> drivers/net/wan/fsl_ucc_hdlc.c:866:38: warning: incorrect type in initializer (different address spaces)
> drivers/net/wan/fsl_ucc_hdlc.c:868:21: warning: incorrect type in argument 1 (different address spaces)
> drivers/net/wan/fsl_ucc_hdlc.c:870:40: warning: incorrect type in argument 2 (different address spaces)
> drivers/net/wan/fsl_ucc_hdlc.c:871:40: warning: incorrect type in argument 2 (different address spaces)
> drivers/net/wan/fsl_ucc_hdlc.c:873:39: warning: incorrect type in argument 2 (different address spaces)
> drivers/net/wan/fsl_ucc_hdlc.c:993:57: warning: incorrect type in argument 2 (different address spaces)
> drivers/net/wan/fsl_ucc_hdlc.c:995:46: warning: incorrect type in argument 2 (different address spaces)
> drivers/net/wan/fsl_ucc_hdlc.c:1004:57: warning: incorrect type in argument 2 (different address spaces)
> drivers/net/wan/fsl_ucc_hdlc.c:1006:46: warning: incorrect type in argument 2 (different address spaces)
> drivers/net/wan/fsl_ucc_hdlc.c:412:35: warning: dereference of noderef expression
> drivers/net/wan/fsl_ucc_hdlc.c:412:35: warning: dereference of noderef expression
> drivers/net/wan/fsl_ucc_hdlc.c:724:29: warning: dereference of noderef expression
> drivers/net/wan/fsl_ucc_hdlc.c:815:21: warning: dereference of noderef expression
> drivers/net/wan/fsl_ucc_hdlc.c:1021:29: warning: dereference of noderef expression
> 
> [...]

Here is the summary with links:
  - net/wan/fsl_ucc_hdlc: fix sparse warnings
    https://git.kernel.org/netdev/net-next/c/5cf46d8e741f

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


