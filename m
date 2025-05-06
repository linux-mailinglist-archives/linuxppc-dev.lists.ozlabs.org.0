Return-Path: <linuxppc-dev+bounces-8342-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9457EAABDBA
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 May 2025 10:49:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZsBsv1PZFz2yST;
	Tue,  6 May 2025 18:49:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1746521395;
	cv=none; b=dH2FpISl+OYmRUYIpX0NRkTqktk99bR55SgtfEA/nXwUAN+1Q3V14HtniQ6Q8hwlSD3Q1gU4msjCjvQjPBaJqlQbRUfzUt9bOG8bimJyqDQ20HelpeB47clmeJZvf+iXMSNeGTzOFveqI9h6F4yiJaA62qZ+xCxlzBviCJBAvLlz9UYBl6a1Cp8HS5TnpSbTH1PS22m+KeKnNH3mcgn0cK429SAtFwnPaHXkEhZBjBZOJcaA9h76/F+tq5X0I910l5mxYYL9TEXNSozNsTOeZ0FmHQgcHTAXw69BbWnLXPegG/ggkOkWd+vfKrAhaz4AVoP4csa9kUbWaSfKoTNfhg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1746521395; c=relaxed/relaxed;
	bh=kliv9eCorh0A8NC0Ti+cWv2ljAh7EBo6W5d4DUJZ4l0=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=X1BEofUGAvGDas2lrRiNi7v/zPTVzkKVrmNtkwE2o0xBEHN6Ho9cL+YYeLwzK62GB198Ts/bYn+7Vy3zDe2i5AFV4NKoMNw7sElCWapdtrEZpwPNpMgeVlopMgaw6Gh165rUmIbppmRy9ecrab0QJZ5Gkk8Koy1XNimh5oE9JMuNiY+aCvPqKtCe1hZFmVKjrl+wO6AOVLiNCSJ/XngpGjMOpKSwjCsl3vg2sUo2zE8XQj+h9qZN20V8hX1Mpq4OPZw/3MdgHRcMCQJhPnoX+49D3j51NUYyn8w1l+sKQ5AJc+dbqjwNMBoc+L/+Yf2CDCljNesJKiXESQ5h77Hk9Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=CRgyYQ5d; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=patchwork-bot+netdevbpf@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=CRgyYQ5d;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=patchwork-bot+netdevbpf@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZsBst0p03z2ySP
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  6 May 2025 18:49:54 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A8DA243F0D;
	Tue,  6 May 2025 08:49:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E267C4CEE4;
	Tue,  6 May 2025 08:49:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746521391;
	bh=egFVLcMF5ZlUs/oGwyBIskHABlbsNz4HF3dVBmtgtF0=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=CRgyYQ5dUD8YigkIe+vdNFjZfHnuMmnEfjehrn/Bq392FLKJ4SK/5dv+q3EL45dBR
	 ldpiJq1btsKEfJsuI6dexEry7//h3NBI5yq0iOpvqzmPmTTzaxiu39T8aWm8H31iow
	 /Qkh5bt26wdCx9TdRDacL5Nv18oUXyqmNf7xWoQg1Y5W3YnybG/5yocGNrq0EaFC+d
	 F/BbTEjMGqo0Ucm29gs91tO4S4ruKbLoqHxci0Wd/q6BQz2PMFyaxL/j3OQk0dd4ds
	 EHW+UiDa0eaf9vfy8suthHt11FeCT3k/HDolFVYbaEAoJLkfXgoHiN1DqzhoZaSwAG
	 EhE0ImgyKohvQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EAC573822D64;
	Tue,  6 May 2025 08:50:31 +0000 (UTC)
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
Subject: Re: [PATCH v4 0/3] net: ibmveth: Make ibmveth use new reset function and
 new KUnit testsg
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <174652143074.1095323.4277122495116903692.git-patchwork-notify@kernel.org>
Date: Tue, 06 May 2025 08:50:30 +0000
References: <20250501194944.283729-1-davemarq@linux.ibm.com>
In-Reply-To: <20250501194944.283729-1-davemarq@linux.ibm.com>
To: Dave Marquardt <davemarq@linux.ibm.com>
Cc: netdev@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 michal.swiatkowski@linux.intel.com, horms@kernel.org, kuba@kernel.org
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hello:

This series was applied to netdev/net-next.git (main)
by Paolo Abeni <pabeni@redhat.com>:

On Thu,  1 May 2025 14:49:41 -0500 you wrote:
> - Fixed struct ibmveth_adapter indentation
> - Made ibmveth driver use WARN_ON with recovery rather than BUG_ON. Some
>   recovery code schedules a reset through new function ibmveth_reset. Also
>   removed a conflicting and unneeded forward declaration.
> - Added KUnit tests for some areas changed by the WARN_ON changes.
> 
> Changes:
> v4: Addressed Jakub Kicinski's review comment: added missing work
> queue cancel in ibmveth_remove
> v3: Addressed Simon Horman's review comments
> - Reworded commit message for ibmveth_reset and WARN_ON changes
> - Fixed broken kernel-doc comments
> - Fixed struct ibmveth_adapter as a separate patch before ibmveth_reset
>   and WARN_ON changes
> v2: Addressed Michal Swiatkowski's review comments
> - Split into multiple patches
> - Used a more descriptive label
> 
> [...]

Here is the summary with links:
  - [v4,1/3] net: ibmveth: Indented struct ibmveth_adapter correctly
    https://git.kernel.org/netdev/net-next/c/b30978515430
  - [v4,2/3] net: ibmveth: Reset the adapter when unexpected states are detected
    https://git.kernel.org/netdev/net-next/c/2c91e2319ed9
  - [v4,3/3] net: ibmveth: added KUnit tests for some buffer pool functions
    https://git.kernel.org/netdev/net-next/c/8a97de243df5

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



