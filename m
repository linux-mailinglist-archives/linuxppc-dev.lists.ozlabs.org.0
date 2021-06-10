Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C412A3A359A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Jun 2021 23:10:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G1Gpd1TWbz3c0Q
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Jun 2021 07:10:33 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=dPF8AVT5;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=patchwork-bot+netdevbpf@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=dPF8AVT5; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G1Gp81p53z301N
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Jun 2021 07:10:07 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPS id 905C461410;
 Thu, 10 Jun 2021 21:10:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1623359404;
 bh=Xf/Mser0Wt8vmZfOibipy93iub3FShlAnjgArrrZeVo=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=dPF8AVT5TtbEdRp4qP/lr6xDSf8McmOFWGSEpsYnMqXSglEqusYWY75Kk64KFmfx7
 JtY1mtioMvSbTlJMkm7WnmHb/+z6vFLawTc2JOLzZwZA98F+/DNWg3GmNw/AzzxBLV
 4VCxdWiw7T3YbDkbDPNlEKozve2RsQFeLuTn/UiudjxPAp2/nUyCtLWZHps3pq18cd
 Y6oBbqDpjWXhEbg8pDhk7rS//V6XtU/lPY3l9X0Ixxz5s7NXK6ZmASxfmFWphGrDFM
 KNk7Ot77srqk8c2AEDUFfN1efJ31sOj/KG0wgxFFeY9ERAYJJR8R/j1ElbJIbt/DC0
 ZTwH2T0wxjYtQ==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain
 [127.0.0.1])
 by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 8059660A6C;
 Thu, 10 Jun 2021 21:10:04 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next] ibmvnic: Use list_for_each_entry() to simplify
 code in ibmvnic.c
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <162335940452.9889.14454091571299464148.git-patchwork-notify@kernel.org>
Date: Thu, 10 Jun 2021 21:10:04 +0000
References: <20210610125417.3834300-1-wanghai38@huawei.com>
In-Reply-To: <20210610125417.3834300-1-wanghai38@huawei.com>
To: Wang Hai <wanghai38@huawei.com>
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
Cc: linux-kernel@vger.kernel.org, tlfalcon@linux.ibm.com,
 netdev@vger.kernel.org, paulus@samba.org, drt@linux.ibm.com, kuba@kernel.org,
 sukadev@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello:

This patch was applied to netdev/net-next.git (refs/heads/master):

On Thu, 10 Jun 2021 20:54:17 +0800 you wrote:
> Convert list_for_each() to list_for_each_entry() where
> applicable. This simplifies the code.
> 
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Wang Hai <wanghai38@huawei.com>
> ---
>  drivers/net/ethernet/ibm/ibmvnic.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)

Here is the summary with links:
  - [net-next] ibmvnic: Use list_for_each_entry() to simplify code in ibmvnic.c
    https://git.kernel.org/netdev/net-next/c/3e98ae0014cb

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


