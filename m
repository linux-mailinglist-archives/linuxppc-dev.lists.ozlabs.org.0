Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 24BCF3317FC
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Mar 2021 21:00:34 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DvTjD1YJzz3cLN
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Mar 2021 07:00:32 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=bSyAqqUc;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=patchwork-bot+netdevbpf@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=bSyAqqUc; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DvThq5pTYz30Qw
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Mar 2021 07:00:11 +1100 (AEDT)
Received: by mail.kernel.org (Postfix) with ESMTPS id 2F3DE65287;
 Mon,  8 Mar 2021 20:00:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1615233609;
 bh=V5DtGVzxX7v4dke4rhw+8vBR951EeV0UUfUNebDBeDg=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=bSyAqqUcg3wvaw8GmUJ7wQmFJutAkbOkxEFa9qIbtmw458Q/rouFfHhUebH1yRJrb
 fKWKwzJB1zI7iaRmR1bCggKQ9wdCKBiSNBD7LyBCkB5aZhXp/g5vj/cu1rKx30IYAs
 GHsA+u9wBZwn4zj2OYh9fJFDIv5pORy/vwNzLL89CM4S6oAeVkERc5GwL9QRicsZ0U
 5dohaeQf5pmJHt7xykx2hVJ+JsMJbm6WRCmgX5fPmWTQVMIbDGaKa/VknvtELfhR0Z
 LnO2skZ22uKOjX82QZW8snt6tEZssRVni8dgdzZVMGIgG5SZnct6HDYsN/HjtAcxtE
 7UBuiFIaUppBg==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain
 [127.0.0.1])
 by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 20FB2609DB;
 Mon,  8 Mar 2021 20:00:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] net: wan: fix error return code of uhdlc_init()
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <161523360913.22994.7942114811329653133.git-patchwork-notify@kernel.org>
Date: Mon, 08 Mar 2021 20:00:09 +0000
References: <20210307091256.22897-1-baijiaju1990@gmail.com>
In-Reply-To: <20210307091256.22897-1-baijiaju1990@gmail.com>
To: Jia-Ju Bai <baijiaju1990@gmail.com>
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
 linuxppc-dev@lists.ozlabs.org, davem@davemloft.net, qiang.zhao@nxp.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello:

This patch was applied to netdev/net.git (refs/heads/master):

On Sun,  7 Mar 2021 01:12:56 -0800 you wrote:
> When priv->rx_skbuff or priv->tx_skbuff is NULL, no error return code of
> uhdlc_init() is assigned.
> To fix this bug, ret is assigned with -ENOMEM in these cases.
> 
> Reported-by: TOTE Robot <oslab@tsinghua.edu.cn>
> Signed-off-by: Jia-Ju Bai <baijiaju1990@gmail.com>
> 
> [...]

Here is the summary with links:
  - net: wan: fix error return code of uhdlc_init()
    https://git.kernel.org/netdev/net/c/62765d39553c

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


