Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A8BCA6A612F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Feb 2023 22:23:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PR9N24KlDz3ccl
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Mar 2023 08:23:46 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=emOgvl42;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=patchwork-bot+linux-riscv@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=emOgvl42;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PR95k1C06z2ylk
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 Mar 2023 08:11:21 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 1943A611BF;
	Tue, 28 Feb 2023 21:11:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6C6F4C4339B;
	Tue, 28 Feb 2023 21:11:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677618677;
	bh=IB9Sk6Sew2oBE0tBUuiuebk20E+C56Ut6PZLin772Nk=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=emOgvl42vWzqzWChtKHzMHvotZsKDFOYMyzPq7CQAWnydVT3wCUftCrJgz4I96sVT
	 J/p2OpBWB1Pfl7lM95qMXkEOuSSwV3OOY5QkIi4y4E4TMiphO/6LCFUrjcj6VtVV7y
	 OqFAVUEOEE+LHNIKcVtUjyUQDYVHHnyUdND45alz0Hd9SkIYZjwDkf5s6BhiNivQ3t
	 ooc1Zz4w4sfDqIRqmXhnwa/PPz8cRzyNIKX7rNjgeVdg9M8zNjUmOXtoCwjv3phgR8
	 zgYKOqkEV/UonTYwYdQveKsTxgsF4XCJOJ+DHfzlb61xD21CVpekeZTvgvBIXth6Ct
	 kGAa595muc6kQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 50A4DC395EC;
	Tue, 28 Feb 2023 21:11:17 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] mm: remove zap_page_range and create zap_vma_pages
From: patchwork-bot+linux-riscv@kernel.org
Message-Id:  <167761867732.10135.11248419155612086016.git-patchwork-notify@kernel.org>
Date: Tue, 28 Feb 2023 21:11:17 +0000
References: <20230104002732.232573-1-mike.kravetz@oracle.com>
In-Reply-To: <20230104002732.232573-1-mike.kravetz@oracle.com>
To: Mike Kravetz <mike.kravetz@oracle.com>
X-Mailman-Approved-At: Wed, 01 Mar 2023 08:22:08 +1100
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
Cc: mhocko@suse.com, david@redhat.com, dave.hansen@linux.intel.com, peterx@redhat.com, linux-mm@kvack.org, edumazet@google.com, linux-riscv@lists.infradead.org, nadav.amit@gmail.com, linux-s390@vger.kernel.org, will@kernel.org, willy@infradead.org, hch@infradead.org, borntraeger@linux.ibm.com, riel@surriel.com, vbabka@suse.cz, brauner@kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, palmer@dabbelt.com, akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello:

This patch was applied to riscv/linux.git (for-next)
by Andrew Morton <akpm@linux-foundation.org>:

On Tue,  3 Jan 2023 16:27:32 -0800 you wrote:
> zap_page_range was originally designed to unmap pages within an address
> range that could span multiple vmas.  While working on [1], it was
> discovered that all callers of zap_page_range pass a range entirely within
> a single vma.  In addition, the mmu notification call within zap_page
> range does not correctly handle ranges that span multiple vmas.  When
> crossing a vma boundary, a new mmu_notifier_range_init/end call pair
> with the new vma should be made.
> 
> [...]

Here is the summary with links:
  - mm: remove zap_page_range and create zap_vma_pages
    https://git.kernel.org/riscv/c/e9adcfecf572

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


