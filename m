Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id CA842297A82
	for <lists+linuxppc-dev@lfdr.de>; Sat, 24 Oct 2020 05:18:12 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CJ5ry0xf0zDr4t
	for <lists+linuxppc-dev@lfdr.de>; Sat, 24 Oct 2020 14:18:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CJ3vM6wcxzDqKl
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 24 Oct 2020 12:50:07 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=WEluteaa; dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 4CJ3vM6Mqdz8v8F
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 24 Oct 2020 12:50:07 +1100 (AEDT)
Received: by ozlabs.org (Postfix)
 id 4CJ3vM6BP4z9sTc; Sat, 24 Oct 2020 12:50:07 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=patchwork-bot+netdevbpf@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=WEluteaa; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 4CJ3vM4PMqz9sTL
 for <linuxppc-dev@ozlabs.org>; Sat, 24 Oct 2020 12:50:07 +1100 (AEDT)
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1603504204;
 bh=CUzXYLtGveFSmSlLezNAhFfONjePV76oNr6E0NVVEKw=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=WEluteaaGv6KupDmZlmaFO3i56MU36X2hwKCaN3DaoM/8rC+Olk8QhzpKa/y5eF/p
 yRlEdR5Z5/R35RGBOv5OFQrQ5ss3XhFRl3t264YDx5/Y0jgNNJZZto0B0uQlO7WHWy
 V7gTUJ1bPA9SQjhC/Xll9B4QnDBPq7l2yINxaeIo=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] net: ucc_geth: Drop extraneous parentheses in comparison
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <160350420488.19271.8517625385382285867.git-patchwork-notify@kernel.org>
Date: Sat, 24 Oct 2020 01:50:04 +0000
References: <20201023033236.3296988-1-mpe@ellerman.id.au>
In-Reply-To: <20201023033236.3296988-1-mpe@ellerman.id.au>
To: Michael Ellerman <mpe@ellerman.id.au>
X-Mailman-Approved-At: Sat, 24 Oct 2020 14:16:55 +1100
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
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, leoyang.li@nxp.com,
 linuxppc-dev@ozlabs.org, kuba@kernel.org, davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello:

This patch was applied to netdev/net.git (refs/heads/master):

On Fri, 23 Oct 2020 14:32:36 +1100 you wrote:
> Clang warns about the extra parentheses in this comparison:
> 
>   drivers/net/ethernet/freescale/ucc_geth.c:1361:28:
>   warning: equality comparison with extraneous parentheses
>     if ((ugeth->phy_interface == PHY_INTERFACE_MODE_SGMII))
>          ~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~
> 
> [...]

Here is the summary with links:
  - net: ucc_geth: Drop extraneous parentheses in comparison
    https://git.kernel.org/netdev/net/c/dab234227cbd

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


