Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E9CC75A3F9
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Jul 2023 03:32:28 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Va7hgLXL;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R5wCt1Lk3z3cF2
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Jul 2023 11:32:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Va7hgLXL;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=sj@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R5wBy6RrHz2ykW
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Jul 2023 11:31:38 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 3A694617DC;
	Thu, 20 Jul 2023 01:31:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B390C433C8;
	Thu, 20 Jul 2023 01:31:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689816694;
	bh=UDoAwOoTRFMVXMbtpTIjACSb6DxR18kojrUncbeOA18=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Va7hgLXLrKKOJjpAv2HcDzaAhxIkO+JYdw5MfU+6lVXsogaHmRH/WW+YxtrWObKj+
	 2Be8/jJ+YOy9V34SJzjspVfn/yMS6pxozyYmqvt6jWy+Bb0EUnTkXU50EN3h8wA5zl
	 Eh3284/BNRh/C3Pf8LDg3YFy1pX0OfrShi4W8xDCqX99AENT7rzbXFF6vzzKDoiaIR
	 iIHc7E/kJonG4MfyYmTmi0I204S2MwjazVkPt5i5W+ibP5MRCwgSmX7Oj2+QQoncN2
	 mQnhGuWUzFV0Y+/Mu/kw6NsWbVNjpSprEjfV46jHsnPJx+/f8duJVJsoqzj6y6R5Fz
	 FvbxJ2OhkGJUg==
From: SeongJae Park <sj@kernel.org>
To: Alistair Popple <apopple@nvidia.com>
Subject: Re: [PATCH v2 3/5] mmu_notifiers: Call invalidate_range() when invalidating TLBs
Date: Thu, 20 Jul 2023 01:31:31 +0000
Message-Id: <20230720013131.1880-1-sj@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <877cqvl7vr.fsf@nvdebian.thelocal>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: zhi.wang.linux@gmail.com, kvm@vger.kernel.org, catalin.marinas@arm.com, linux-mm@kvack.org, will@kernel.org, x86@kernel.org, jgg@ziepe.ca, iommu@lists.linux.dev, nicolinc@nvidia.com, kevin.tian@intel.com, ajd@linux.ibm.com, jhubbard@nvidia.com, robin.murphy@arm.com, npiggin@gmail.com, linux-arm-kernel@lists.infradead.org, SeongJae Park <sj@kernel.org>, seanjc@google.com, linux-kernel@vger.kernel.org, fbarrat@linux.ibm.com, akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 20 Jul 2023 10:52:59 +1000 Alistair Popple <apopple@nvidia.com> wrote:

> 
> SeongJae Park <sj@kernel.org> writes:
> 
> > Hi Alistair,
> >
> > On Wed, 19 Jul 2023 22:18:44 +1000 Alistair Popple <apopple@nvidia.com> wrote:
> >
> >> The invalidate_range() is going to become an architecture specific mmu
> >> notifier used to keep the TLB of secondary MMUs such as an IOMMU in
> >> sync with the CPU page tables. Currently it is called from separate
> >> code paths to the main CPU TLB invalidations. This can lead to a
> >> secondary TLB not getting invalidated when required and makes it hard
> >> to reason about when exactly the secondary TLB is invalidated.
> >> 
> >> To fix this move the notifier call to the architecture specific TLB
> >> maintenance functions for architectures that have secondary MMUs
> >> requiring explicit software invalidations.
> >> 
> >> This fixes a SMMU bug on ARM64. On ARM64 PTE permission upgrades
> >> require a TLB invalidation. This invalidation is done by the
> >> architecutre specific ptep_set_access_flags() which calls
> >> flush_tlb_page() if required. However this doesn't call the notifier
> >> resulting in infinite faults being generated by devices using the SMMU
> >> if it has previously cached a read-only PTE in it's TLB.
> >> 
> >> Moving the invalidations into the TLB invalidation functions ensures
> >> all invalidations happen at the same time as the CPU invalidation. The
> >> architecture specific flush_tlb_all() routines do not call the
> >> notifier as none of the IOMMUs require this.
> >> 
> >> Signed-off-by: Alistair Popple <apopple@nvidia.com>
> >> Suggested-by: Jason Gunthorpe <jgg@ziepe.ca>
> >
> > I found below kernel NULL-dereference issue on latest mm-unstable tree, and
> > bisect points me to the commit of this patch, namely
> > 75c400f82d347af1307010a3e06f3aa5d831d995.
> >
> > To reproduce, I use 'stress-ng --bigheap $(nproc)'.  The issue happens as soon
> > as it starts reclaiming memory.  I didn't dive deep into this yet, but
> > reporting this issue first, since you might have an idea already.
> 
> Thanks for the report SJ!
> 
> I see the problem - current->mm can (obviously!) be NULL which is what's
> leading to the NULL dereference. Instead I think on x86 I need to call
> the notifier when adding the invalidate to the tlbbatch in
> arch_tlbbatch_add_pending() which is equivalent to what ARM64 does.
> 
> The below should fix it. Will do a respin with this.

Thank you for this quick reply!  I confirm this fixes my issue.


Tested-by: SeongJae Park <sj@kernel.org>

> 
> ---
> 
> diff --git a/arch/x86/include/asm/tlbflush.h b/arch/x86/include/asm/tlbflush.h
> index 837e4a50281a..79c46da919b9 100644
> --- a/arch/x86/include/asm/tlbflush.h
> +++ b/arch/x86/include/asm/tlbflush.h
> @@ -4,6 +4,7 @@
>  
>  #include <linux/mm_types.h>
>  #include <linux/sched.h>
> +#include <linux/mmu_notifier.h>

Nit.  How about putting it between mm_types.h and sched.h, so that it looks
alphabetically sorted?

>  
>  #include <asm/processor.h>
>  #include <asm/cpufeature.h>
> @@ -282,6 +283,7 @@ static inline void arch_tlbbatch_add_pending(struct arch_tlbflush_unmap_batch *b
>  {
>  	inc_mm_tlb_gen(mm);
>  	cpumask_or(&batch->cpumask, &batch->cpumask, mm_cpumask(mm));
> +	mmu_notifier_arch_invalidate_secondary_tlbs(mm, 0, -1UL);
>  }
>  
>  static inline void arch_flush_tlb_batched_pending(struct mm_struct *mm)
> diff --git a/arch/x86/mm/tlb.c b/arch/x86/mm/tlb.c
> index 0b990fb56b66..2d253919b3e8 100644
> --- a/arch/x86/mm/tlb.c
> +++ b/arch/x86/mm/tlb.c
> @@ -1265,7 +1265,6 @@ void arch_tlbbatch_flush(struct arch_tlbflush_unmap_batch *batch)
>  
>  	put_flush_tlb_info();
>  	put_cpu();
> -	mmu_notifier_arch_invalidate_secondary_tlbs(current->mm, 0, -1UL);
>  }
>  
>  /*
> 
> 


Thanks,
SJ
