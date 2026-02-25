Return-Path: <linuxppc-dev+bounces-17139-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yOhWORV2nmnCVQQAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17139-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Feb 2026 05:09:57 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 05893191810
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Feb 2026 05:09:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fLLhf09fGz3cCM;
	Wed, 25 Feb 2026 15:09:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c04:e001:324:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1771992593;
	cv=none; b=UjYpPvkVQWAHxw8djAqcsFh3PYMhQMHMnq29bY+zzXFp2ADbIRVvw+HSrzNZecuZ7WIF5w1lvQny2DfG8hYx7KSlDktwzZHmd+3a5xwd9MTejDV8Jkf0KPRSqGsJeK1YzBSYWG/t6UwFeIk2fxXweaZYrzA+MhThuLpREGaKrwg4AOA5Nk8S/T1cDceWF1Mstp547/12DHxvA5j2gXhxuZDwuXQwz99F4gWHxE56bHZgZXAK+XUz3wLYdaQm36gm73PX6PNm2kwsURw3BGRUJbEtOl9/mmw9sPNm0xXiYAkiptck5pADQupdqzwKBHy5sAaQhA9UDy6lCTA0UVMj3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1771992593; c=relaxed/relaxed;
	bh=FdDbKok30e1CYl/mzNYE+Kl40wY1pzOsdB0VwKgPdSU=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=eofFAd3Q/23YSXTJk+VtY3GwDa+pjU/31pxtasdo5IpnG9PhYTHEeknxE6rR+N/22lLLMcsvBNSh0PiKGQCdeSPgFOglsjU0aB4TdRYpxe7nQo7FuqIG1kO/ZflLNeDqpK3FZW90VnLCFgm4rM9bZk6kuWFvy9gv46STnTcoe3ttJsNLk0gxY35zZP2dxmFh2gCC6bD9RIoH8AZNjCjYqxj34aYY2agNwcWLgsE8oRcF2FG0FNmWdA2A7W3PhkdWpG20Sj+MaZZ+YqdXcSi1u1zPG5/olRSJtJrx8ftg6Sun6Ohg1PxCPGqZo6TB6gEmBZdgaK2ZhijDZ1BSFGjj9w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=j4qMn5fk; dkim-atps=neutral; spf=pass (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=patchwork-bot+netdevbpf@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=j4qMn5fk;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=patchwork-bot+netdevbpf@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04:e001:324:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fLLhc63V3z3btw
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Feb 2026 15:09:52 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 77FF66011F;
	Wed, 25 Feb 2026 04:09:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2DABFC19421;
	Wed, 25 Feb 2026 04:09:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771992590;
	bh=RMBa7D5h1ftTyJLqLsVXguQywkNV8bB5KmFCiALLmb0=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=j4qMn5fkOWnB51e4SWEPKt93KmLZDxhqfqpHx2JfHvYVDaVk6RLYVTbCr5neoT4KN
	 r9fV61B4zbHbBzP1IcU9AZDb6CNQgOjUgXPSu5HWDPswj5MRaqDBRpwxOLTWOqyWkX
	 8I0mgE2b/pC26he+c8p7ynX//SCQBO+sAs9p0NTOgvWKuVU8ttkouXKtAZ0j/5ViHW
	 Gvp5BuWQ3zNFZOmpTJqx8kETj+n+NL39L8QOCzg96RVxabprlBhR1youPJ7DfGeaDP
	 KXduCoePFrtmoujrAjc3M0rPJqdrF/pJHGbr4s7R9qeg/3DCDheDsNKvkML0xXqLvQ
	 C8O1vFIwd94Uw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B9FB8380820E;
	Wed, 25 Feb 2026 04:09:56 +0000 (UTC)
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
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next] net: freescale: ucc_geth: call of_node_put once
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <177199259529.36698.15027911300492192448.git-patchwork-notify@kernel.org>
Date: Wed, 25 Feb 2026 04:09:55 +0000
References: <20260224014141.352642-1-rosenp@gmail.com>
In-Reply-To: <20260224014141.352642-1-rosenp@gmail.com>
To: Rosen Penev <rosenp@gmail.com>
Cc: netdev@vger.kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.71 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-17139-lists,linuxppc-dev=lfdr.de,netdevbpf];
	FROM_NEQ_ENVFROM(0.00)[patchwork-bot@kernel.org,linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS(0.00)[m:rosenp@gmail.com,m:netdev@vger.kernel.org,m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:linuxppc-dev@lists.ozlabs.org,m:linux-kernel@vger.kernel.org,m:andrew@lunn.ch,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER(0.00)[patchwork-bot@kernel.org,linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NO_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev,netdev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: 05893191810
X-Rspamd-Action: no action

Hello:

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Mon, 23 Feb 2026 17:41:41 -0800 you wrote:
> Move it up to avoid placing it in both the error and success paths.
> 
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>  drivers/net/ethernet/freescale/ucc_geth.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> [...]

Here is the summary with links:
  - [net-next] net: freescale: ucc_geth: call of_node_put once
    https://git.kernel.org/netdev/net-next/c/d2adf01780b8

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



