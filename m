Return-Path: <linuxppc-dev+bounces-9335-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8534AAD85D3
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Jun 2025 10:41:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bJXtl6PFXz30DP;
	Fri, 13 Jun 2025 18:41:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1749804095;
	cv=none; b=HNiLAsGEZH8tYQHtaySYxGTOxPiWKJA70kHomOaCntPEe8xIpOM8nN5NeAC9jbo305o/9s3E52I4ZTb1Ta7qs6ZczjfJmiMxXQQEd94ezjgWzht/QGJN2Yl5zCg1tyO0JBJBkFKOzNjLdFyjcqklH0z03xOcwwz27BieRHeUER59LNoO/5D4R9WlUKUzVNqjK1/eT1MfHTUN0hU7Cu55IkRn10LF7MCkQFszSjLQrTEDRP2wr7/4C38lZmQpGMq1Oa64iMG01bel3mtOcLdNbvmnqwqxOq2+BGBxSt9YTp9R1JQ4BkNW2CiWzMmOI4nFX3e3uwMoMToFuRB4rLtnaw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1749804095; c=relaxed/relaxed;
	bh=CMgnkMIG/DukeBtP6vVNc/sfMhj00uMw9w2nlSoRpiU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aUNzjIPnH6g/qQmshSEgVckPTnt34R65RgYCmglwwaLH4WGdofssGbSP076yZ8jjLctR2WjWAe+Bn3xTdCIExhrbkn2qPRn7rBRAauv0kpoOEIE0hnjBZJqj45co9Q6rDJBtgwha7vium08Zrjux1traw3dBLoA6bM0nkfv3o3GpW7hm7iuF+6UWUnMAObrRnlgVj6ShcztkwEDFxBRjniQoQxRFaL3CzUtFugz1gfPACmc4YmoEelQzsOjOststHrhjx6cad0lhAdjWM5YGnSQjGaruy+FDN6RBw3YBhdNU4rUXIgZo0PXRvWkTU1TrsBwOxLAGkb7Uo388BHd+1w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=ryan.roberts@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=ryan.roberts@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bJXtk40fHz2xBb
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Jun 2025 18:41:34 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5C1C41CDD;
	Fri, 13 Jun 2025 01:40:42 -0700 (PDT)
Received: from [10.57.84.117] (unknown [10.57.84.117])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6DA213F66E;
	Fri, 13 Jun 2025 01:41:00 -0700 (PDT)
Message-ID: <0ba9820d-f498-42b0-a663-6f4dca5374b4@arm.com>
Date: Fri, 13 Jun 2025 09:40:58 +0100
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
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] sparc/mm: Do not disable preemption in lazy MMU mode
Content-Language: en-GB
To: Alexander Gordeev <agordeev@linux.ibm.com>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org,
 linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org,
 Hugh Dickins <hughd@google.com>, Nicholas Piggin <npiggin@gmail.com>,
 Guenter Roeck <linux@roeck-us.net>, Juergen Gross <jgross@suse.com>,
 Jeremy Fitzhardinge <jeremy@goop.org>
References: <cover.1749747752.git.agordeev@linux.ibm.com>
 <db1559396c38c1dfe97a6d929412d7d6244f64b8.1749747752.git.agordeev@linux.ibm.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <db1559396c38c1dfe97a6d929412d7d6244f64b8.1749747752.git.agordeev@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.3 required=3.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 12/06/2025 18:36, Alexander Gordeev wrote:
> Commit a1d416bf9faf ("sparc/mm: disable preemption in lazy mmu mode")
> is not necessary anymore, since the lazy MMU mode is entered with a
> spinlock held and sparc does not support Real-Time. Thus, upon entering
> the lazy mode the preemption is already disabled.

Surely given Sparc knows that it doesn't support PREEMPT_RT, it is better for
it's implementation to explicitly disable preemption rather than rely on the
spinlock to do it, since the spinlock penalizes other arches unnecessarily? It
also prevents multiple CPUs from updating (different areas of) kernel pgtables
in parallel. The property Sparc needs is for the task to stay on the same CPU
without interruption, right? Same goes for powerpc.

> 
> Signed-off-by: Alexander Gordeev <agordeev@linux.ibm.com>
> ---
>  arch/sparc/include/asm/tlbflush_64.h |  2 +-
>  arch/sparc/mm/tlb.c                  | 12 ++++++++----
>  2 files changed, 9 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/sparc/include/asm/tlbflush_64.h b/arch/sparc/include/asm/tlbflush_64.h
> index 8b8cdaa69272..a6d8068fb211 100644
> --- a/arch/sparc/include/asm/tlbflush_64.h
> +++ b/arch/sparc/include/asm/tlbflush_64.h
> @@ -44,7 +44,7 @@ void flush_tlb_kernel_range(unsigned long start, unsigned long end);
>  void flush_tlb_pending(void);
>  void arch_enter_lazy_mmu_mode(void);
>  void arch_leave_lazy_mmu_mode(void);
> -#define arch_flush_lazy_mmu_mode()      do {} while (0)
> +void arch_flush_lazy_mmu_mode(void);
>  
>  /* Local cpu only.  */
>  void __flush_tlb_all(void);
> diff --git a/arch/sparc/mm/tlb.c b/arch/sparc/mm/tlb.c
> index a35ddcca5e76..e46dfd5f2583 100644
> --- a/arch/sparc/mm/tlb.c
> +++ b/arch/sparc/mm/tlb.c
> @@ -52,10 +52,9 @@ void flush_tlb_pending(void)
>  
>  void arch_enter_lazy_mmu_mode(void)
>  {
> -	struct tlb_batch *tb;
> +	struct tlb_batch *tb = this_cpu_ptr(&tlb_batch);
>  
> -	preempt_disable();
> -	tb = this_cpu_ptr(&tlb_batch);
> +	VM_WARN_ON_ONCE(preemptible());
>  	tb->active = 1;
>  }
>  
> @@ -63,10 +62,15 @@ void arch_leave_lazy_mmu_mode(void)
>  {
>  	struct tlb_batch *tb = this_cpu_ptr(&tlb_batch);
>  
> +	VM_WARN_ON_ONCE(preemptible());
>  	if (tb->tlb_nr)
>  		flush_tlb_pending();
>  	tb->active = 0;
> -	preempt_enable();
> +}
> +
> +void arch_flush_lazy_mmu_mode(void)
> +{
> +	VM_WARN_ON_ONCE(preemptible());
>  }
>  
>  static void tlb_batch_add_one(struct mm_struct *mm, unsigned long vaddr,


