Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 51C9932B94E
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Mar 2021 17:50:32 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DrKkG2P9Yz3cb3
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Mar 2021 03:50:30 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=hQpDBi9K;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=patchwork-bot+netdevbpf@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=hQpDBi9K; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DrKjs5mwJz30Ld
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Mar 2021 03:50:09 +1100 (AEDT)
Received: by mail.kernel.org (Postfix) with ESMTPS id C97E664ED0;
 Wed,  3 Mar 2021 16:50:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1614790206;
 bh=vyWmKUOBbS6lHY2tc7qFSUiBwJxzrV0lRzpRy7/2YDE=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=hQpDBi9K/5eCdpWyWrMeGXSpuGA2uKWpCzJxN7hUXCk6Wvuwxfn9MeGdgf0zgwDWd
 FsqZdGrbOBIc9UVVYE8oewGHr01XKcXbH4qES0rmzyZkk7toEDOOt1JHoHz+EAwfio
 jLOv65KS7Q18aCe3w03b1E8MWyEAbNahG1z8j+KAwbrsAdoBQ0Z9Rypd/fuIahW03A
 sXQT0kyir+CsWGG8R1G2/I/uutKiJmVdt8FjUw6I5OW1qw7Gxw6l7LJkTiph7nDJ/8
 rbdo7/Vn0273TrkyhR2gULoZCn0OS6PiK1tIPFpMlc2Oqanji0frhu9EurdQW8+Wcp
 RV81KGNJGcxUw==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain
 [127.0.0.1])
 by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id BC71F600DF;
 Wed,  3 Mar 2021 16:50:06 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] ibmvnic: Fix possibly uninitialized old_num_tx_queues
 variable warning.
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <161479020676.31057.2292593478574354971.git-patchwork-notify@kernel.org>
Date: Wed, 03 Mar 2021 16:50:06 +0000
References: <20210302194747.21704-1-msuchanek@suse.de>
In-Reply-To: <20210302194747.21704-1-msuchanek@suse.de>
To: Michal Suchanek <msuchanek@suse.de>
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
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kuba@kernel.org,
 ljp@linux.ibm.com, drt@linux.ibm.com, paulus@samba.org, sukadev@linux.ibm.com,
 linuxppc-dev@lists.ozlabs.org, davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello:

This patch was applied to netdev/net.git (refs/heads/master):

On Tue,  2 Mar 2021 20:47:47 +0100 you wrote:
> GCC 7.5 reports:
> ../drivers/net/ethernet/ibm/ibmvnic.c: In function 'ibmvnic_reset_init':
> ../drivers/net/ethernet/ibm/ibmvnic.c:5373:51: warning: 'old_num_tx_queues' may be used uninitialized in this function [-Wmaybe-uninitialized]
> ../drivers/net/ethernet/ibm/ibmvnic.c:5373:6: warning: 'old_num_rx_queues' may be used uninitialized in this function [-Wmaybe-uninitialized]
> 
> The variable is initialized only if(reset) and used only if(reset &&
> something) so this is a false positive. However, there is no reason to
> not initialize the variables unconditionally avoiding the warning.
> 
> [...]

Here is the summary with links:
  - ibmvnic: Fix possibly uninitialized old_num_tx_queues variable warning.
    https://git.kernel.org/netdev/net/c/6881b07fdd24

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


