Return-Path: <linuxppc-dev+bounces-17219-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4MgIK6a5n2n5dQQAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17219-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Feb 2026 04:10:30 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A756E1A0567
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Feb 2026 04:10:28 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fLxKY4Vfnz305M;
	Thu, 26 Feb 2026 14:10:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772075425;
	cv=none; b=Rl1qd7EjposvSLKo5dHzec4sJJDyFBcU5CaVRpwcTZCXYe4/Z/NWc6CIkd/WRE780IocyCvnBGZ29R5bJ4MslRLKLIpwjhnaytL+62BZsnsYNvQvDbYRY29tf1SYK+vFx9cqqHT/WiDUrmtdiX5TjAhWQWfVW6S0lqZBq8Zg3h/PRyEKW51SrZEHL7aNx06rcoPVN8tvXBmAN0XECWMez1wI8DUz+pBq6H4p7wrCLjpXYhDT75iTZbgCKcFHPlQ++mkYafRstovYO/sUE1ENhodRWzNDPOGBqtmSYehjSLBjZEUOLl5CmURFuKGdnMslgOCnynurLbfGTgjYDTdiGw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772075425; c=relaxed/relaxed;
	bh=+vQn34VO851nepUlxdWw12zJ8upCHleZZ3Xf1PlVq94=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=FK9kKvtWiaj7zTdlKX8IyL8QR3WJqibkMY60E2SnExhoiR3/4tOvr/tgQhTq0hlU7rCT3JBh4phztJ8uRzK8Opk2aPbK3L0GaUIHdfcttkleahxeObFADiqMepcXZdhzOl0KpTgz3fuEhNa8GLfWwb9xFopSrZzwKfkb35F0R2Q0WV9Rv7rUaXP1OEqVkS6AThFMnDxZQ3wkkFrGpP0EU71iaQyvNjcD0nqLo/+YoSOKygTzmt6AaZB10DL2HRmZFufoZFJaCyCnD/gfqWCsTyDDoBq4LBb7gDgF/BzE4+xoLDC1IqjRv/PBP9YRk6ET9KlhEyrS9b91iJae34SfmQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=D3P7j/3h; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=patchwork-bot+netdevbpf@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=D3P7j/3h;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=patchwork-bot+netdevbpf@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fLxKX4tslz2xMt
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Feb 2026 14:10:24 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2C26244173;
	Thu, 26 Feb 2026 03:10:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A946C116D0;
	Thu, 26 Feb 2026 03:10:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772075422;
	bh=WEuS4UpaH1mhIWOXTq0r0IT77NR5gxE3+MA6q4btOhU=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=D3P7j/3h2OKv9yJKV4WmVeFHd+O7/FsGSb7Z0XFndDxNikaWTzyqt0bzBJmL2uard
	 RukAUeCwrWIdpDPcwUiUG/KFdHscIneyNWirPw8zxdf9iDvW7/11ti+Ulu6jXl+w/a
	 Dl7BJwZa50XOei3pUhQYk1TIF6SoJJ4sM9YfRi0XKSbMrAnYtuvKT5/WaGphkRMp+t
	 +4TBSEdIxM5gokvRH3tNd1Jiawkm+YeTDYeGKfS0fWKDKbh30ETlYybmkgiuJtmS6b
	 0F8roWj6nkVZtvQyXe/+pI5NXgeFJ4UwqOHlVfSVRWnrXpmEmMCxW6KYwUqTBbeym/
	 L/6cd6mHujBNg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 02C13380A94B;
	Thu, 26 Feb 2026 03:10:28 +0000 (UTC)
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
Subject: Re: [PATCH net-next] net: fs_enet: allow nvmem to override MAC
 address
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <177207542654.1014739.9375392210981588857.git-patchwork-notify@kernel.org>
Date: Thu, 26 Feb 2026 03:10:26 +0000
References: <20260224014607.353378-1-rosenp@gmail.com>
In-Reply-To: <20260224014607.353378-1-rosenp@gmail.com>
To: Rosen Penev <rosenp@gmail.com>
Cc: netdev@vger.kernel.org, pantelis.antoniou@gmail.com,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.71 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-17219-lists,linuxppc-dev=lfdr.de,netdevbpf];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,lists.ozlabs.org];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[patchwork-bot@kernel.org,linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS(0.00)[m:rosenp@gmail.com,m:netdev@vger.kernel.org,m:pantelis.antoniou@gmail.com,m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:linuxppc-dev@lists.ozlabs.org,m:linux-kernel@vger.kernel.org,m:pantelisantoniou@gmail.com,m:andrew@lunn.ch,s:lists@lfdr.de];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[patchwork-bot@kernel.org,linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NO_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-0.995];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev,netdev];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: A756E1A0567
X-Rspamd-Action: no action

Hello:

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Mon, 23 Feb 2026 17:46:06 -0800 you wrote:
> NVMEM typically loads after the ethernet driver and
> of_get_ethdev_address returns -EPROBE_DEFER. return in such a case to
> allow NVMEM to work.
> 
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>  drivers/net/ethernet/freescale/fs_enet/fs_enet-main.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> [...]

Here is the summary with links:
  - [net-next] net: fs_enet: allow nvmem to override MAC address
    https://git.kernel.org/netdev/net-next/c/dc2a1facbde8

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



