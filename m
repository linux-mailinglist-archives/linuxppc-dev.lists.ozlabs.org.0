Return-Path: <linuxppc-dev+bounces-11304-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 807D6B35615
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Aug 2025 09:50:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cB0F42sznz3dLW;
	Tue, 26 Aug 2025 17:50:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756194600;
	cv=none; b=EHaRA2n2vk9c6EZ7gkps7s88qNMVKvhKWw/+iRT6iwmLFLQ7Q59oIcYE92zyVKBSP/UvRVdzws+IuqGjcP9LGLc5zhIVbTryUxs7lSxU6yLV2cJuPzhcCXN1snscXfT2QbUpFyoz/yAi76S8H+F1Hxfo5RPzHJpAbAsKo4DUdxNutsBsut1aRWL7qL/oEl7+4fivR/PehusmIfTG6Ldjos6El+MtShvNsaE3PE2nWecGKDYSYwPcF0v+1miAjS9da+22hu5H0z/GMZbGZ8x1uCJ8mmJ6j/8lgST8IEFnYz6Gs1190+F1NgBZ059K6tJXw3XiR/mSo/yOVx+oLJS+Ag==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756194600; c=relaxed/relaxed;
	bh=omHo6ZLcqBp9G5tipliM6gIq5sOTXuKwvnYqg08E1MY=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=Mebxtlgi5tPmHpAEljK/+NMmlM9ty2C850S1+MRXmttLaMX3nIf7jT4jh+EtcdQx7V9XEwi6jXGTlX/xnf9dfgzIc7Vbp/bjOujqaYe/hjA0lwXB/yyIfNQo9XTibZEnKKNwULmuqO+Z7SVJB57hVCBC/W9NGVr2CPvB9Luyut5Ti1AuLsFbe7gYQDdEDubLTJY5aEUxFz6hcWl4QqaVFxDQlwQW3hYUOtx3AtUnNyXdMgZnCn1E0uZdWC78rT/hkSAmBS3L98w9wXHVj/o6SUIJeECUjxgAWQT/sJm3ZnMn6gSaWo0YdBCd8Q89Ji9OKBzOz0m9C8Bx+fymU+PMMg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=TxTNvc3M; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=patchwork-bot+netdevbpf@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=TxTNvc3M;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=patchwork-bot+netdevbpf@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cB0F35fBlz3dLT
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Aug 2025 17:49:59 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 130A744916;
	Tue, 26 Aug 2025 07:49:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD05CC4CEF1;
	Tue, 26 Aug 2025 07:49:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756194597;
	bh=2e63oCSp9jCyFXDXSIVyTIDFCK5Wk+hRQYyzd57ISuk=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=TxTNvc3MnU7OUnCe02BZWB8mN44ib8Cm7q8Qxedt0MPpN/GhIgzJIT4zwDBbCXbHS
	 MzpYgeqGKBGwXWAFK5TENzS+VWhDq26YQDnOrhX+ixywmIbgrnbDtM6dWLN3sA++Sp
	 2O0rXl4AIRhnVEENVv3nr5BdoPGRFqdIVapcVjdff9vE0I1t+injJrH4motXDKIqoN
	 eX2mnHbkm9PD9lOYx2V31L9SkJ+HvefGMHMf1ITI8mKisCXvH+U6BuRjK3VrV/iWUh
	 KbSE/LiBTK9CGS6ktN0sgqS257nCQZclahRA9jMzkvavj/farDHd6dVovWvUcK7xE7
	 74OZb5ISvsCwg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EB0A4383BF70;
	Tue, 26 Aug 2025 07:50:06 +0000 (UTC)
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
Subject: Re: [PATCH net-next RESEND v4] ibmvnic: Increase max subcrq indirect
 entries with fallback
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <175619460575.3698989.15196706539067195769.git-patchwork-notify@kernel.org>
Date: Tue, 26 Aug 2025 07:50:05 +0000
References: <20250821130215.97960-1-mmc@linux.ibm.com>
In-Reply-To: <20250821130215.97960-1-mmc@linux.ibm.com>
To: Mingming Cao <mmc@linux.ibm.com>
Cc: netdev@vger.kernel.org, horms@kernel.org, bjking1@linux.ibm.com,
 haren@linux.ibm.com, ricklind@linux.ibm.com, kuba@kernel.org,
 edumazet@google.com, pabeni@redhat.com, linuxppc-dev@lists.ozlabs.org,
 maddy@linux.ibm.com, mpe@ellerman.id.au
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hello:

This patch was applied to netdev/net-next.git (main)
by Paolo Abeni <pabeni@redhat.com>:

On Thu, 21 Aug 2025 06:02:15 -0700 you wrote:
> POWER8 support a maximum of 16 subcrq indirect descriptor entries per
>  H_SEND_SUB_CRQ_INDIRECT call, while POWER9 and newer hypervisors
>  support up to 128 entries. Increasing the max number of indirect
> descriptor entries improves batching efficiency and reduces
> hcall overhead, which enhances throughput under large workload on POWER9+.
> 
> Currently, ibmvnic driver always uses a fixed number of max indirect
> descriptor entries (16). send_subcrq_indirect() treats all hypervisor
> errors the same:
>  - Cleanup and Drop the entire batch of descriptors.
>  - Return an error to the caller.
>  - Rely on TCP/IP retransmissions to recover.
>  - If the hypervisor returns H_PARAMETER (e.g., because 128
>    entries are not supported on POWER8), the driver will continue
>    to drop batches, resulting in unnecessary packet loss.
> 
> [...]

Here is the summary with links:
  - [net-next,RESEND,v4] ibmvnic: Increase max subcrq indirect entries with fallback
    https://git.kernel.org/netdev/net-next/c/3c14917953a5

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



