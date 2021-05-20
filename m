Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A432238B9BA
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 May 2021 00:50:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FmQ1q3B6Lz3bt6
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 May 2021 08:50:39 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=KSSGI9av;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=patchwork-bot+netdevbpf@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=KSSGI9av; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FmQ1L523Xz2yYv
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 May 2021 08:50:14 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPS id 80825613AE;
 Thu, 20 May 2021 22:50:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1621551011;
 bh=4n0PcuduYHajRHSW49fRgqymQt+G8zdf0b7qAbPcecw=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=KSSGI9avqu9m9Ne/IAFmNzxkQxadnFNcxE74DZ3j0gsI90nB+kBrdwuDn65JD2KMm
 yJLsGXZCOAo0HIV5ndQkCwUletSt/5zTZ43A7wz0v+xdDy9Ct9rqj9mXaBCpNdaIr8
 eYuFckls4HA86lF4ehcw0Nu39MNssj/oq6j0+OXRS5n0BKV2zLUsLSr+z3vBbuMucK
 Yh4SMnorso3m9EK0UwWfcyjRP/j5T+poKo/EvSCNohvoI4nI0NmlDqa8W8NwCe2BUY
 0r7K/ONcmoWr5I+ej2SWGc9WrPTvJ7/r6BXs4b6LcDLU8WJdr9ZHE0dCnFaTeTxWnw
 5SNIIYq9XZ72g==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain
 [127.0.0.1])
 by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 75A3260A56;
 Thu, 20 May 2021 22:50:11 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2 net-next resend] ibmvnic: remove default label from
 to_string switch
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <162155101147.27401.5665625357028273375.git-patchwork-notify@kernel.org>
Date: Thu, 20 May 2021 22:50:11 +0000
References: <20210520065034.5912-1-msuchanek@suse.de>
In-Reply-To: <20210520065034.5912-1-msuchanek@suse.de>
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
Cc: lijunp213@gmail.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 tlfalcon@linux.ibm.com, paulus@samba.org, drt@linux.ibm.com, kuba@kernel.org,
 sukadev@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello:

This patch was applied to netdev/net-next.git (refs/heads/master):

On Thu, 20 May 2021 08:50:34 +0200 you wrote:
> This way the compiler warns when a new value is added to the enum but
> not to the string translation like:
> 
> drivers/net/ethernet/ibm/ibmvnic.c: In function 'adapter_state_to_string':
> drivers/net/ethernet/ibm/ibmvnic.c:832:2: warning: enumeration value 'VNIC_FOOBAR' not handled in switch [-Wswitch]
>   switch (state) {
>   ^~~~~~
> drivers/net/ethernet/ibm/ibmvnic.c: In function 'reset_reason_to_string':
> drivers/net/ethernet/ibm/ibmvnic.c:1935:2: warning: enumeration value 'VNIC_RESET_FOOBAR' not handled in switch [-Wswitch]
>   switch (reason) {
>   ^~~~~~
> 
> [...]

Here is the summary with links:
  - [v2,net-next,resend] ibmvnic: remove default label from to_string switch
    https://git.kernel.org/netdev/net-next/c/07b5dc1d515a

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


