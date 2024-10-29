Return-Path: <linuxppc-dev+bounces-2690-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DB499B563B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Oct 2024 00:00:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XdQhZ5XJ3z2yHT;
	Wed, 30 Oct 2024 10:00:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=139.178.84.217
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730242830;
	cv=none; b=nq0lFtrlqbZ+dxhkZzj3drAH9o0N58dmuleKYUOAMvH+mwJcAZVLOFHYi/8SYVtmIytCLpHLKHkvuC0Hou6diRBp5+BbiRnlGCDH/mrw/F1bO0gJve4FJmtryKBj8u4hnzMJ2vlTgxqBeZYXuVf5gALFJlf9VNPR2+gurs+Fxttv+iK1LGBwdiGllyicXSr+FamkonWhIwLkd0bN6W6VG5Lf4zfn+r76MLZauabg2WdVpd4wyW1KtNamkEk2FcjTKlPWEIfHi4Z4LffaBoCqQx4B5KKRNFOaiWwgcIq2MEVPJs97OTun7Dti1InrQtQVscMimho3YMl0Z5/KMVxLDA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730242830; c=relaxed/relaxed;
	bh=03VEcQKiBgagm3N/o7YVQoblq+aLYpWlsY/aOEST/ac=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=OaqeaPuIVgj2elJj4joraktHUl+4VuBYEcMdJ1qmKHlcNOKFdvTKS18sYB1sLJ8ekbXl3Q8UmJsr107tHasqb/LsUw0/p/SVu12F+2G3LlDKNASiutzVA0b2SsHwLJpwXPkEGXNCbKrmcdQ3SOiVbOP7S1Q7cI0bFV9kzVE4UC7NRoFegvOjWUuzrMWKm6ESu1RExzRVkB0LBEEHfrgYKGx0u6JRfyzyK1C2me2bkvD8C01qHOLx4vA4UEP4+wL4ZGasan5BWfBVAMOtszrnSTZBNfRUjhi6l4vptOb0ZJ+Hw8CNTBK4B6M4Owk339I4UXT0f0D9ChPK9V0ETeZmig==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=QEopQIhK; dkim-atps=neutral; spf=pass (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=patchwork-bot+netdevbpf@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=QEopQIhK;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=patchwork-bot+netdevbpf@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XdQhY0fgqz2xxx
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Oct 2024 10:00:29 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 12B665C5D9A;
	Tue, 29 Oct 2024 22:59:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4ED5C4CEE6;
	Tue, 29 Oct 2024 23:00:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730242825;
	bh=duJPDuBAFLwDjusrbcjn+FPgdxj/aGJ7QPgdsR4UibA=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=QEopQIhK5uG3JFMzj7e1nWaO4R0i9LfPW98i1C5FN1Ctgb/472qMZdDBWJpPDuxaH
	 1Lwcy7eYugXVoRnSVM4qpFvR9CSGOzAjMZTYPkpt4O0Ki/xyKMB777HeCjXBqJYMUg
	 63zwXIs5FojIWfo1crYBRMZ4LZUlGWzV3liaF2D6QXEMhzlDVjejk74ZuGR7Dcm7if
	 U9fkJAy9AgQS//hOrVU8kdL3wAqQ0JtLUPYOY0uWRPt7ICZBLG3W4z2hpYi2lxbJyH
	 7MOJrXtu2GWOSZd9BooyN0cF5kVP5WSYuDg39Lg3ZzNWl7efGWrbmxjhhjHfPhy3nF
	 sj9G5g1LN/CZw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADBB7380AC00;
	Tue, 29 Oct 2024 23:00:34 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next] ibmvnic: use ethtool string helpers
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <173024283324.846516.868225407370186564.git-patchwork-notify@kernel.org>
Date: Tue, 29 Oct 2024 23:00:33 +0000
References: <20241022203240.391648-1-rosenp@gmail.com>
In-Reply-To: <20241022203240.391648-1-rosenp@gmail.com>
To: Rosen Penev <rosenp@gmail.com>
Cc: netdev@vger.kernel.org, mpe@ellerman.id.au, npiggin@gmail.com,
 christophe.leroy@csgroup.eu, naveen@kernel.org, maddy@linux.ibm.com,
 haren@linux.ibm.com, ricklind@linux.ibm.com, nnac123@linux.ibm.com,
 tlfalcon@linux.ibm.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Hello:

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Tue, 22 Oct 2024 13:32:40 -0700 you wrote:
> They are the prefered way to copy ethtool strings.
> 
> Avoids manually incrementing the data pointer.
> 
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>  drivers/net/ethernet/ibm/ibmvnic.c | 30 +++++++++---------------------
>  1 file changed, 9 insertions(+), 21 deletions(-)

Here is the summary with links:
  - [net-next] ibmvnic: use ethtool string helpers
    https://git.kernel.org/netdev/net-next/c/89abb6b3bd7b

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



