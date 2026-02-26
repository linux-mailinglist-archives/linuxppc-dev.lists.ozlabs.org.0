Return-Path: <linuxppc-dev+bounces-17221-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kBoDDEG+n2lOdgQAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17221-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Feb 2026 04:30:09 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CD241A08F2
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Feb 2026 04:30:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fLxmF5Ltmz305M;
	Thu, 26 Feb 2026 14:30:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c04:e001:324:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772076605;
	cv=none; b=ZSPv7nY+wB7ZTKNjevQ/rAI3yFehhqDRUDLW5msYk+nZGUM0IMT+JzQ926yL3gvkuWukhROJ7j+JTT8srsgVGj1bRXB69tlEJrdKK5JHyj0e74MYomz5yekohR42BdtpcEeHjLBqsQCetL1rv/Z5zlDdZdsXT1TDxCwGz9C6tF0V5cfOPpSrWrJG1DJpQppagKX/bpjWdaoLJ/424We2IpZbZdUILA0iXYdzAv5e6UQkWfGQcuvprKdvIRrqm8ZaZTaE5OCb3BWuc9gtb5fb3JM0QCzYTCrLM9uvYBxmlmmmK+VuEVbDmK2VgV6PZlg9g37xdqNTCQ+XhOEEUzSP7w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772076605; c=relaxed/relaxed;
	bh=uKRe8yZxzDnkzHGXp//NgMff0Q2246hPY9uqI1nkf3A=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=A+cyzNZcukTTE9KdMFMf+Q/wvpg1q5LQZ9SELj4vtWvguJBPZClCyoECfpdDsLh22PVynHdUyAZ6aBBG40A7IZ07xkihsvCn1md11pqR7gFhxf1g9Wkd/PhEu3yWIWfxZlVgvUkFV652sK6aB6/igZIuBptzbCuzg+t3LUVRTA3R1JnJ+emRDGeWLFaNcHTAh9RFP9OglhsUewDqPtYuys7weuje2/9DeW++UYYWdD1w+5WAaPrRWWZGySjEx5OJUI0GHGQmUCgL6FB2WdEDmmyrcV7E0KBSLsLnaL3bOCGrlGUXlD/V8mE7+h7XPZbERavf6XJ87ydoKaGUTo0ctQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=kURdJ+ZV; dkim-atps=neutral; spf=pass (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=patchwork-bot+netdevbpf@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=kURdJ+ZV;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=patchwork-bot+netdevbpf@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04:e001:324:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fLxmF0GXzz2xMt
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Feb 2026 14:30:05 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B2787600AE;
	Thu, 26 Feb 2026 03:30:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4AAA5C116D0;
	Thu, 26 Feb 2026 03:30:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772076602;
	bh=7lCmbDv+2pRFz25J9Y5YD+I1O9idkhZlZdp0R+Bw6tU=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=kURdJ+ZV6FUaCIue5OgphZ6iCKILsjtgG7kBybGxnWFdJ/CE3AaK2Tpa0eHG5IpVd
	 fFWM1LUG4wTv0PKbpQTlMv/qoHFC6zcCr/4HWtg4824xHRfrXPCpLkaCN3TIoWy00d
	 aqVoi/V14euPqR4PptQWcNLnZIVWDhRD+17C5q5XAXS6onDp2JSP04hB7Ki5DHDJ4G
	 75ETwvHi0UeJE+Jnd2RhyF374d8qTfBt1HZSn7kg/fOqy/j+hNzDSxGPCOJSKw8sJb
	 SB3IoT2gDLzYKKlS9penxODyKwSWzP++vsZFYkzHoAvWPuUM6HHQY4JwkE0V6K4vgI
	 7Nw2LCnJGdNwA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B9EBB380A94B;
	Thu, 26 Feb 2026 03:30:07 +0000 (UTC)
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
Subject: Re: [PATCH v3] net/ibmveth: fix comment typos in ibmveth.c
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <177207660629.1022268.3552526517808096956.git-patchwork-notify@kernel.org>
Date: Thu, 26 Feb 2026 03:30:06 +0000
References: <20260224153601.17534-1-abhindeka@gmail.com>
In-Reply-To: <20260224153601.17534-1-abhindeka@gmail.com>
To: Abhilekh Deka <abhindeka@gmail.com>
Cc: davem@davemloft.net, kuba@kernel.org, pabeni@redhat.com,
 nnac123@linux.ibm.com, maddy@linux.ibm.com, mpe@ellerman.id.au,
 linuxppc-dev@lists.ozlabs.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.21 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-17221-lists,linuxppc-dev=lfdr.de,netdevbpf];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[patchwork-bot@kernel.org,linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_TO(0.00)[gmail.com];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:abhindeka@gmail.com,m:davem@davemloft.net,m:kuba@kernel.org,m:pabeni@redhat.com,m:nnac123@linux.ibm.com,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:linuxppc-dev@lists.ozlabs.org,m:netdev@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER(0.00)[patchwork-bot@kernel.org,linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	FROM_NO_DN(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: 4CD241A08F2
X-Rspamd-Action: no action

Hello:

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Tue, 24 Feb 2026 21:06:01 +0530 you wrote:
> Correct spelling mistakes in comments:
> - Fix misspelling of gro_receive
> - Fix misspelling of Partition
> 
> Signed-off-by: Abhilekh Deka <abhindeka@gmail.com>
> ---
>  drivers/net/ethernet/ibm/ibmveth.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Here is the summary with links:
  - [v3] net/ibmveth: fix comment typos in ibmveth.c
    https://git.kernel.org/netdev/net-next/c/8debe7a22309

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



