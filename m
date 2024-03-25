Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 01553888D40
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Mar 2024 05:44:00 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=GdKqpJYq;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V30gx5bflz3vYF
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Mar 2024 15:43:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=GdKqpJYq;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=patchwork-bot+linux-riscv@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V30fQ11qFz2ykC
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 Mar 2024 15:42:38 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B4E2C60D39;
	Mon, 25 Mar 2024 04:42:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id CB0CCC43143;
	Mon, 25 Mar 2024 04:42:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711341754;
	bh=XMszcJq9qKpbV4DFBwSekh9f/MWb18ne5dXsAM6kKD8=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=GdKqpJYqq4nzWFRO9Hpv5UH3Py1smxmB/DXoCXJtllla7M+UbtYM4CJ5/L896W7IV
	 yQNZ+TVXisg+8sTpUFlmLRoFuUc0LEioY4l5kubTTV7+kTnb8wBKXBmUQuqxFirQOM
	 +r7s6pXT4cgp/uVDoprMn8sgYkXHbx8mHeeSxDTGj5EF3mvSNK50KxsmorJkJA4wO7
	 zDT9ZpkpOD2ZRWN3OzSLAbYkoL+iyKgdNDK5cCLI9ndEy0u4mkYkxx8ZcQ9kia61k/
	 zgU/eNUoN3a7r9NnvA0lfHszFUpclZw3XcF/Xe2dG4exz/EXhbcXzChTQzT6SVcFzX
	 xxSpvAwPq1e4Q==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id BB1EAD95072;
	Mon, 25 Mar 2024 04:42:34 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v3 00/15] mm/memory: optimize fork() with PTE-mapped THP
From: patchwork-bot+linux-riscv@kernel.org
Message-Id:  <171134175476.18749.11889611045887549553.git-patchwork-notify@kernel.org>
Date: Mon, 25 Mar 2024 04:42:34 +0000
References: <20240129124649.189745-1-david@redhat.com>
In-Reply-To: <20240129124649.189745-1-david@redhat.com>
To: David Hildenbrand <david@redhat.com>
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
Cc: catalin.marinas@arm.com, linux-mm@kvack.org, sparclinux@vger.kernel.org, agordeev@linux.ibm.com, will@kernel.org, linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, linux@armlinux.org.uk, willy@infradead.org, aneesh.kumar@kernel.org, naveen.n.rao@linux.ibm.com, gerald.schaefer@linux.ibm.com, borntraeger@linux.ibm.com, aou@eecs.berkeley.edu, ryan.roberts@arm.com, gor@linux.ibm.com, hca@linux.ibm.com, npiggin@gmail.com, paul.walmsley@sifive.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, dinguyen@kernel.org, palmer@dabbelt.com, svens@linux.ibm.com, akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org, davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello:

This series was applied to riscv/linux.git (fixes)
by Andrew Morton <akpm@linux-foundation.org>:

On Mon, 29 Jan 2024 13:46:34 +0100 you wrote:
> Now that the rmap overhaul[1] is upstream that provides a clean interface
> for rmap batching, let's implement PTE batching during fork when processing
> PTE-mapped THPs.
> 
> This series is partially based on Ryan's previous work[2] to implement
> cont-pte support on arm64, but its a complete rewrite based on [1] to
> optimize all architectures independent of any such PTE bits, and to
> use the new rmap batching functions that simplify the code and prepare
> for further rmap accounting changes.
> 
> [...]

Here is the summary with links:
  - [v3,01/15] arm64/mm: Make set_ptes() robust when OAs cross 48-bit boundary
    (no matching commit)
  - [v3,02/15] arm/pgtable: define PFN_PTE_SHIFT
    (no matching commit)
  - [v3,03/15] nios2/pgtable: define PFN_PTE_SHIFT
    (no matching commit)
  - [v3,04/15] powerpc/pgtable: define PFN_PTE_SHIFT
    (no matching commit)
  - [v3,05/15] riscv/pgtable: define PFN_PTE_SHIFT
    https://git.kernel.org/riscv/c/57c254b2fb31
  - [v3,06/15] s390/pgtable: define PFN_PTE_SHIFT
    (no matching commit)
  - [v3,07/15] sparc/pgtable: define PFN_PTE_SHIFT
    (no matching commit)
  - [v3,08/15] mm/pgtable: make pte_next_pfn() independent of set_ptes()
    (no matching commit)
  - [v3,09/15] arm/mm: use pte_next_pfn() in set_ptes()
    (no matching commit)
  - [v3,10/15] powerpc/mm: use pte_next_pfn() in set_ptes()
    (no matching commit)
  - [v3,11/15] mm/memory: factor out copying the actual PTE in copy_present_pte()
    (no matching commit)
  - [v3,12/15] mm/memory: pass PTE to copy_present_pte()
    (no matching commit)
  - [v3,13/15] mm/memory: optimize fork() with PTE-mapped THP
    (no matching commit)
  - [v3,14/15] mm/memory: ignore dirty/accessed/soft-dirty bits in folio_pte_batch()
    (no matching commit)
  - [v3,15/15] mm/memory: ignore writable bit in folio_pte_batch()
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


