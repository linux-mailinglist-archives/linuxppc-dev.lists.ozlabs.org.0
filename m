Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3936F7C81DB
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Oct 2023 11:21:19 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ZBMsi6z5;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S6Lbd0Fvyz3vm9
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Oct 2023 20:21:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ZBMsi6z5;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=patchwork-bot+netdevbpf@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S6LZm3Nzyz2xdT
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Oct 2023 20:20:32 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8320462070;
	Fri, 13 Oct 2023 09:20:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A6489C433CC;
	Fri, 13 Oct 2023 09:20:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697188827;
	bh=mWSyMxKE2quLVklS4mF6hrQjoWiFg+m/8c7WZjyz05c=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=ZBMsi6z5ugLc/m4ZfrcPjuRlAq/WDH8OHESEVG/keyMetuwRPb4Y25hoGULUtP24q
	 U0RkDrzqWj9J5BEqVL1ShLw59PZH8CxAil/T5xNXPD7diLv61HKomoDYvMZIUz/n82
	 7m4XeP0r09bfnJ5LwELHQPTAL15J2twGrmmrNo2uDomaPmzr6yaIswIbA9xBIllUkK
	 e5gbOw8wyIHCbZsJMefXtbfWNcn4iyC38P0ZUs1rUMbjfhEgJLIhqoORG72Jrh5uOm
	 l7D/J2apOnFQHBs6HdAB6xnskaoi4Tow01Qhb6IcVhKvP92MYSfEl2ya+bHK+nJe89
	 Mq1Gybze/rekA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 8B497E1F66C;
	Fri, 13 Oct 2023 09:20:27 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] ibmvnic: replace deprecated strncpy with strscpy
From: patchwork-bot+netdevbpf@kernel.org
Message-Id:  <169718882756.6212.2338041860471845995.git-patchwork-notify@kernel.org>
Date: Fri, 13 Oct 2023 09:20:27 +0000
References: <20231009-strncpy-drivers-net-ethernet-ibm-ibmvnic-c-v1-1-712866f16754@google.com>
In-Reply-To: <20231009-strncpy-drivers-net-ethernet-ibm-ibmvnic-c-v1-1-712866f16754@google.com>
To: Justin Stitt <justinstitt@google.com>
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
Cc: nnac123@linux.ibm.com, ricklind@linux.ibm.com, haren@linux.ibm.com, edumazet@google.com, linux-kernel@vger.kernel.org, tlfalcon@linux.ibm.com, netdev@vger.kernel.org, npiggin@gmail.com, danymadden@us.ibm.com, kuba@kernel.org, pabeni@redhat.com, linuxppc-dev@lists.ozlabs.org, davem@davemloft.net, linux-hardening@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello:

This patch was applied to netdev/net-next.git (main)
by David S. Miller <davem@davemloft.net>:

On Mon, 09 Oct 2023 23:19:57 +0000 you wrote:
> `strncpy` is deprecated for use on NUL-terminated destination strings
> [1] and as such we should prefer more robust and less ambiguous string
> interfaces.
> 
> NUL-padding is not required as the buffer is already memset to 0:
> |       memset(adapter->fw_version, 0, 32);
> 
> [...]

Here is the summary with links:
  - ibmvnic: replace deprecated strncpy with strscpy
    https://git.kernel.org/netdev/net-next/c/431acee06923

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


