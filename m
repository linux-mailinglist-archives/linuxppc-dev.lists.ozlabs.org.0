Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F0A948E931
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Jan 2022 12:31:30 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JZzdr0nnZz3bb9
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Jan 2022 22:31:28 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=XR9Z1B2E;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1;
 helo=ams.source.kernel.org; envelope-from=patchwork-bot+netdevbpf@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=XR9Z1B2E; 
 dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JZzcS4HzXz2y8P
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Jan 2022 22:30:16 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id AC7E7B825CB;
 Fri, 14 Jan 2022 11:30:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C5872C36AF3;
 Fri, 14 Jan 2022 11:30:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1642159810;
 bh=sLsNgaqjW2U6QlzM5RG4QTdUVssGVZWYI4cf4SQFWqk=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=XR9Z1B2E74UGtdE+M5sopu//rN3GfyFRFzEcXV7EOuHB5lHocmdc57SHb7iYpm8Ja
 GXgSEF8BKE0RbK9XwFKi7rWpdhUGZcantf3YWYmgT9OgIIvKlQeFAkFXB7KAdVrzVz
 hFuJM3UKC3I5CEIGaAfL8UorD3+ntXhs184LvvPlGWq4LZq6mIZGTr3z2rh776Tz1k
 JmscimOriGXMvSaPCkwFdhUPB0AJcirRLpl8Id0wFuyAx87YfhWRrsZrASXa5gFd4e
 ZG9OitXh262rDZwPBsnvRnlKoxQhAEG7ls0YcDmxg6MXsYSQbpr3ZQX+/dfGAK9QfK
 XPteBv0PUnzEA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 8DE9DF607A0; Fri, 14 Jan 2022 11:30:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] net: apple: mace: Fix build since dev_addr constification
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <164215981057.30922.17945470510196780677.git-patchwork-notify@kernel.org>
Date: Fri, 14 Jan 2022 11:30:10 +0000
References: <20220114031252.2419042-1-mpe@ellerman.id.au>
In-Reply-To: <20220114031252.2419042-1-mpe@ellerman.id.au>
To: Michael Ellerman <mpe@ellerman.id.au>
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
Cc: netdev@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, davem@davemloft.net,
 kuba@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello:

This patch was applied to netdev/net.git (master)
by David S. Miller <davem@davemloft.net>:

On Fri, 14 Jan 2022 14:12:52 +1100 you wrote:
> Since commit adeef3e32146 ("net: constify netdev->dev_addr") the mace
> driver no longer builds with various errors (pmac32_defconfig):
> 
>   linux/drivers/net/ethernet/apple/mace.c: In function ‘mace_probe’:
>   linux/drivers/net/ethernet/apple/mace.c:170:20: error: assignment of read-only location ‘*(dev->dev_addr + (sizetype)j)’
>     170 |   dev->dev_addr[j] = rev ? bitrev8(addr[j]): addr[j];
>         |                    ^
>   linux/drivers/net/ethernet/apple/mace.c: In function ‘mace_reset’:
>   linux/drivers/net/ethernet/apple/mace.c:349:32: warning: passing argument 2 of ‘__mace_set_address’ discards ‘const’ qualifier from pointer target type
>     349 |     __mace_set_address(dev, dev->dev_addr);
>         |                             ~~~^~~~~~~~~~
>   linux/drivers/net/ethernet/apple/mace.c:93:62: note: expected ‘void *’ but argument is of type ‘const unsigned char *’
>      93 | static void __mace_set_address(struct net_device *dev, void *addr);
>         |                                                        ~~~~~~^~~~
>   linux/drivers/net/ethernet/apple/mace.c: In function ‘__mace_set_address’:
>   linux/drivers/net/ethernet/apple/mace.c:388:36: error: assignment of read-only location ‘*(dev->dev_addr + (sizetype)i)’
>     388 |  out_8(&mb->padr, dev->dev_addr[i] = p[i]);
>         |                                    ^
> 
> [...]

Here is the summary with links:
  - net: apple: mace: Fix build since dev_addr constification
    https://git.kernel.org/netdev/net/c/6c8dc12cd925

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


