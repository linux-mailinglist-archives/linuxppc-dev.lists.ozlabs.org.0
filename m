Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 21E1C2F9032
	for <lists+linuxppc-dev@lfdr.de>; Sun, 17 Jan 2021 03:21:58 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DJJZq0wKNzDqYq
	for <lists+linuxppc-dev@lfdr.de>; Sun, 17 Jan 2021 13:21:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=patchwork-bot+netdevbpf@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=LBqHqoWJ; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DJJXr6DpLzDqQs
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 17 Jan 2021 13:20:12 +1100 (AEDT)
Received: by mail.kernel.org (Postfix) with ESMTPS id 1EA7322CB8;
 Sun, 17 Jan 2021 02:20:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1610850010;
 bh=ORQl1ZFd11tXszy9IjdFFuITzpen0YjySzTPviRMEh4=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=LBqHqoWJucjw3HIAcEiRHddbHmZGc/5C4egWd3sUP+8sDHxa0OHsmth8puPy2dWsd
 vJf/Az2S4ocZDZmHYbQpKNneAnc7At1mKvWjmrEKToq8hnJUu+CC/nInGc6WyDKBnm
 6flzMGPOoSjiTeJ7IdgNQxCWlVJq89w4IZ1zYBJwfcyYwvI2ZkFbBrdcXpKDv5bc9f
 u5XeQNfe553p0wxKpQdtZ4GsQ2j9pfNxFoKQ+nkvsfP40Zm5XNxD6Eq9fbmg81j/Cn
 LVtRvh1kHLuzhYc5Oi6POmY2Wmb/cwHx6OShdHvNAftGN6hzRB/nAnHQi0kD7hOPwu
 sVtsfh7ba/xzw==
Received: from pdx-korg-docbuild-1.ci.codeaurora.org (localhost.localdomain
 [127.0.0.1])
 by pdx-korg-docbuild-1.ci.codeaurora.org (Postfix) with ESMTP id 0AEBD60658;
 Sun, 17 Jan 2021 02:20:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [RESEND v2 0/7] Rid W=1 warnings in Ethernet
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <161085001003.18239.10975020699076928503.git-patchwork-notify@kernel.org>
Date: Sun, 17 Jan 2021 02:20:10 +0000
References: <20210115200905.3470941-1-lee.jones@linaro.org>
In-Reply-To: <20210115200905.3470941-1-lee.jones@linaro.org>
To: Lee Jones <lee.jones@linaro.org>
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
Cc: paul@xen.org, kurt@linutronix.de, ast@kernel.org, gustavoars@kernel.org,
 pc@denkart.be, paulus@samba.org, sukadev@linux.ibm.com, wei.liu@kernel.org,
 daniel@iogearbox.net, john.fastabend@gmail.com, santi_leon@yahoo.com,
 kuba@kernel.org, grygorii.strashko@ti.com, tlfalcon@linux.vnet.ibm.com,
 hawk@kernel.org, Jens.Osterkamp@de.ibm.com, rusty@rustcorp.com.au,
 dnevil@snmc.com, ljp@linux.ibm.com, xen-devel@lists.xenproject.org,
 ivan.khoronzhuk@linaro.org, nico@fluxnic.net, geoff@infradead.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, erik@vt.edu,
 jallen@linux.vnet.ibm.com, utz.bacher@de.ibm.com, drt@linux.ibm.com,
 bpf@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, davem@davemloft.net,
 rmk@arm.linux.org.uk
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello:

This series was applied to netdev/net-next.git (refs/heads/master):

On Fri, 15 Jan 2021 20:08:58 +0000 you wrote:
> Resending the stragglers again.
> This set is part of a larger effort attempting to clean-up W=1
> kernel builds, which are currently overwhelmingly riddled with
> niggly little warnings.
> 
> No changes since v2, just a rebase onto net-next.
> 
> [...]

Here is the summary with links:
  - [1/7] net: ethernet: smsc: smc91x: Fix function name in kernel-doc header
    https://git.kernel.org/netdev/net-next/c/7d2a92445e3f
  - [2/7] net: xen-netback: xenbus: Demote nonconformant kernel-doc headers
    https://git.kernel.org/netdev/net-next/c/090c7ae8e0d0
  - [3/7] net: ethernet: ti: am65-cpsw-qos: Demote non-conformant function header
    https://git.kernel.org/netdev/net-next/c/935888cda820
  - [4/7] net: ethernet: ti: am65-cpts: Document am65_cpts_rx_enable()'s 'en' parameter
    https://git.kernel.org/netdev/net-next/c/e49e4647f3e2
  - [5/7] net: ethernet: ibm: ibmvnic: Fix some kernel-doc misdemeanours
    https://git.kernel.org/netdev/net-next/c/807086021bf5
  - [6/7] net: ethernet: toshiba: ps3_gelic_net: Fix some kernel-doc misdemeanours
    https://git.kernel.org/netdev/net-next/c/b51036321461
  - [7/7] net: ethernet: toshiba: spider_net: Document a whole bunch of function parameters
    https://git.kernel.org/netdev/net-next/c/e242d5989965

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


