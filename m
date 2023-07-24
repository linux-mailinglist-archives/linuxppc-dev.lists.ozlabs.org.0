Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A8CE375FEEB
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Jul 2023 20:19:30 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ALkl62Ci;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R8pN04BLsz301R
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jul 2023 04:19:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ALkl62Ci;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2607:7c80:54:3::133; helo=bombadil.infradead.org; envelope-from=mcgrof@infradead.org; receiver=lists.ozlabs.org)
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R8pM44J3gz2xdp
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Jul 2023 04:18:40 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=FftEnjrfbBAd3Ww9EqN8sppXbEA0boEKYQQaC3XYChY=; b=ALkl62CiRE28E2LSizMN3y7fEY
	kJycbVRJZEvZWmguJTa9cV8saw4voW845Dk7ZUIQ/EpBqHehcYEObAuEhAbV5cICUXMxpEHgWD1xY
	0G6eQD7tzvNPI+5LLNz+rczyJT/b6KyVcZ+bYO3jrw6raTDm6jxMaJpIvIG1XxtiGTStkaoeXQ5ux
	i2K6PllfRHRUSgqlIGCCkFHMYoEy4mFvIGC8wSVGTqOtUaudgrq/YQeHfsLxDw4QBvQ2/XP3rLron
	/nYKqQX7yUCVJiO+cQev86wNP91/7Iz+oGCh9AS1aLKpPK5iq4sDhzycio7fP17V8xO0Lv6e1RKak
	XdsSA3Lg==;
Received: from mcgrof by bombadil.infradead.org with local (Exim 4.96 #2 (Red Hat Linux))
	id 1qO08S-005BNK-31;
	Mon, 24 Jul 2023 18:18:20 +0000
Date: Mon, 24 Jul 2023 11:18:20 -0700
From: Luis Chamberlain <mcgrof@kernel.org>
To: Alistair Popple <apopple@nvidia.com>, linux-fsdevel@vger.kernel.org,
	linux-xfs@vger.kernel.org, Pankaj Raghav <p.raghav@samsung.com>
Subject: Re: [PATCH v2 3/5] mmu_notifiers: Call invalidate_range() when
 invalidating TLBs
Message-ID: <ZL7AbLJ+RUUgzt8O@bombadil.infradead.org>
References: <8f293bb51a423afa71ddc3ba46e9f323ee9ffbc7.1689768831.git-series.apopple@nvidia.com>
 <20230719225105.1934-1-sj@kernel.org>
 <877cqvl7vr.fsf@nvdebian.thelocal>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <877cqvl7vr.fsf@nvdebian.thelocal>
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
Cc: zhi.wang.linux@gmail.com, kvm@vger.kernel.org, catalin.marinas@arm.com, linux-mm@kvack.org, will@kernel.org, x86@kernel.org, jgg@ziepe.ca, iommu@lists.linux.dev, nicolinc@nvidia.com, kevin.tian@intel.com, ajd@linux.ibm.com, jhubbard@nvidia.com, linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com, linux-arm-kernel@lists.infradead.org, SeongJae Park <sj@kernel.org>, seanjc@google.com, linux-kernel@vger.kernel.org, mcgrof@kernel.org, fbarrat@linux.ibm.com, akpm@linux-foundation.org, robin.murphy@arm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Cc'ing fsdevel + xfs folks as this fixes a regression tests with
XFS with generic/176.

On Thu, Jul 20, 2023 at 10:52:59AM +1000, Alistair Popple wrote:
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

This patch also fixes a regression introduced on linux-next, the same
crash on arch_tlbbatch_flush() is reproducible with fstests generic/176
on XFS. This patch fixes that regression [0]. This should also close out
the syzbot crash too [1]

[0] https://gist.github.com/mcgrof/b37fc8cf7e6e1b3935242681de1a83e2
[1] https://lore.kernel.org/all/0000000000003afcb4060135a664@google.com/

Tested-by: Luis Chamberlain <mcgrof@kernel.org>

  Luis
