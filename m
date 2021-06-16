Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 81F8F3A9720
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Jun 2021 12:21:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G4h6Q1Tlhz301L
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Jun 2021 20:21:02 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ZjywvkZI;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=will@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=ZjywvkZI; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G4h5w28x7z308M
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Jun 2021 20:20:36 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPSA id EF0D261153;
 Wed, 16 Jun 2021 10:20:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1623838832;
 bh=Ym1vZEQrl4FAJY3nRQwAl9nRr777Xn5/+ZCgT0X7n8o=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ZjywvkZIEHr7cruyFpHj70eyFM9ijUIhaAuvYmmopSWlueo/fLaio4NubUX6xnoJx
 o8ztFiM/vr9zlSHMPNnyHqtWCPfhn0EplH/dMsOk/CkDCXq7XNu4yZkca+ExvW6M/z
 svHRm9f0cpkHkcRVAwmM74jbiLrhjJhVazJu9F4VL3whpPGTzOHLLKq25Bvd9DEBZC
 XLQ32bZXu2kgxxjZ3MrcwNC6Ii7Dauc9QMdPRD2f/I9PXJHcznekU243PsMIKz5Skc
 2zCtOJD456kw7DB2FcF2DTd9smFB25yvi/SNPP0yujLgqjmIYSfNEADIOjLqNxXptc
 FEnFGcxf5eI8w==
Date: Wed, 16 Jun 2021 11:20:26 +0100
From: Will Deacon <will@kernel.org>
To: Andy Lutomirski <luto@kernel.org>
Subject: Re: [PATCH 8/8] membarrier: Rewrite sync_core_before_usermode() and
 improve documentation
Message-ID: <20210616102026.GB22350@willie-the-truck>
References: <cover.1623813516.git.luto@kernel.org>
 <07a8b963002cb955b7516e61bad19514a3acaa82.1623813516.git.luto@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <07a8b963002cb955b7516e61bad19514a3acaa82.1623813516.git.luto@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: Catalin Marinas <catalin.marinas@arm.com>, linux-mm@kvack.org,
 Peter Zijlstra <peterz@infradead.org>, x86@kernel.org,
 LKML <linux-kernel@vger.kernel.org>, Nicholas Piggin <npiggin@gmail.com>,
 Dave Hansen <dave.hansen@intel.com>, Paul Mackerras <paulus@samba.org>,
 stable@vger.kernel.org, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jun 15, 2021 at 08:21:13PM -0700, Andy Lutomirski wrote:
> The old sync_core_before_usermode() comments suggested that a non-icache-syncing
> return-to-usermode instruction is x86-specific and that all other
> architectures automatically notice cross-modified code on return to
> userspace.
> 
> This is misleading.  The incantation needed to modify code from one
> CPU and execute it on another CPU is highly architecture dependent.
> On x86, according to the SDM, one must modify the code, issue SFENCE
> if the modification was WC or nontemporal, and then issue a "serializing
> instruction" on the CPU that will execute the code.  membarrier() can do
> the latter.
> 
> On arm64 and powerpc, one must flush the icache and then flush the pipeline
> on the target CPU, although the CPU manuals don't necessarily use this
> language.
> 
> So let's drop any pretense that we can have a generic way to define or
> implement membarrier's SYNC_CORE operation and instead require all
> architectures to define the helper and supply their own documentation as to
> how to use it.  This means x86, arm64, and powerpc for now.  Let's also
> rename the function from sync_core_before_usermode() to
> membarrier_sync_core_before_usermode() because the precise flushing details
> may very well be specific to membarrier, and even the concept of
> "sync_core" in the kernel is mostly an x86-ism.
> 
> (It may well be the case that, on real x86 processors, synchronizing the
>  icache (which requires no action at all) and "flushing the pipeline" is
>  sufficient, but trying to use this language would be confusing at best.
>  LFENCE does something awfully like "flushing the pipeline", but the SDM
>  does not permit LFENCE as an alternative to a "serializing instruction"
>  for this purpose.)
> 
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> Cc: Paul Mackerras <paulus@samba.org>
> Cc: linuxppc-dev@lists.ozlabs.org
> Cc: Nicholas Piggin <npiggin@gmail.com>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
> Cc: Nicholas Piggin <npiggin@gmail.com>
> Cc: Peter Zijlstra <peterz@infradead.org>
> Cc: x86@kernel.org
> Cc: stable@vger.kernel.org
> Fixes: 70216e18e519 ("membarrier: Provide core serializing command, *_SYNC_CORE")
> Signed-off-by: Andy Lutomirski <luto@kernel.org>
> ---
>  .../membarrier-sync-core/arch-support.txt     | 68 ++++++-------------
>  arch/arm64/include/asm/sync_core.h            | 19 ++++++
>  arch/powerpc/include/asm/sync_core.h          | 14 ++++
>  arch/x86/Kconfig                              |  1 -
>  arch/x86/include/asm/sync_core.h              |  7 +-
>  arch/x86/kernel/alternative.c                 |  2 +-
>  arch/x86/kernel/cpu/mce/core.c                |  2 +-
>  arch/x86/mm/tlb.c                             |  3 +-
>  drivers/misc/sgi-gru/grufault.c               |  2 +-
>  drivers/misc/sgi-gru/gruhandles.c             |  2 +-
>  drivers/misc/sgi-gru/grukservices.c           |  2 +-
>  include/linux/sched/mm.h                      |  1 -
>  include/linux/sync_core.h                     | 21 ------
>  init/Kconfig                                  |  3 -
>  kernel/sched/membarrier.c                     | 15 ++--
>  15 files changed, 75 insertions(+), 87 deletions(-)
>  create mode 100644 arch/arm64/include/asm/sync_core.h
>  create mode 100644 arch/powerpc/include/asm/sync_core.h
>  delete mode 100644 include/linux/sync_core.h

For the arm64 bits (docs and asm/sync_core.h):

Acked-by: Will Deacon <will@kernel.org>

Will
