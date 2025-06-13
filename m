Return-Path: <linuxppc-dev+bounces-9332-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B57C9AD858A
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Jun 2025 10:27:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bJXZD6x1kz2yZ6;
	Fri, 13 Jun 2025 18:27:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1749803236;
	cv=none; b=UEEf2cKRtGXaNb+FIt1gvDqQvohhq9FxRYmhhejFeJlp1gwZbGmywrkLNN90fOjUd0wNd7K2UhMaJdGzCffOeGWzeEr3jOSpT8Gr4utYvaI57+wwGD+O0849J6FpriFb7kv/37/zX5EBVY1Z12WPryubgC9Y9R6k6bZ62SpNcqtQOZYnO132X5Psrrp3lBznUEzrrCiV9hmPs+Rm1rJKkazjCIB4a/0lij1V5GTWRKVZrUvAE9eNFKaqvQEr4JIYNDqz0K5TTXfPRqBytDisUS7P/Vm3BZ4FbVSzCb961FmNNi/mkbuCTb0ciuQhojr5T7I2B3Ig5IlHwvQ8WUcjwg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1749803236; c=relaxed/relaxed;
	bh=fo37PQv2rm3Xne0CGA2Mk0pTeTGHYsoK6kdCw1GPq3A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BcJNgmz8e15KEzki7lCy6ztLXrSklAuVi/LEJUsqpCDHAhMRBiO5g3LtYW82aXAnWFp/ztgNNhQ21EBhe6WU6wseytDKEE2/ko6z42Y5bOie2Egwx0MNqdhMGHIPKb+GcEBUr7eP0SqFAanj3DYFpQXsVdeT7TJcDvv0gLcEE8vd+zGjGLHpDLJGSU8d/gUv3hnF9YrzkyoYGDj0XHGqe33mu45mmlhreP5OPXuXLxlbrzPJ45TUvsPV4B3USnneAePBjkEZwIj/yW4KdL+pYhmrgB+YO4MaugGEVpyYla4kIdQoOxBZxkwI2pj029wqhoVquzjH4ZkzYeWRPOVv9g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=ryan.roberts@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=ryan.roberts@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bJXZC62lPz2xKN
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Jun 2025 18:27:14 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 338E114BF;
	Fri, 13 Jun 2025 01:26:21 -0700 (PDT)
Received: from [10.57.84.117] (unknown [10.57.84.117])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 243333F66E;
	Fri, 13 Jun 2025 01:26:38 -0700 (PDT)
Message-ID: <bf59680e-c523-4af8-b81f-ea0b4d0e12f2@arm.com>
Date: Fri, 13 Jun 2025 09:26:37 +0100
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
Subject: Re: [PATCH 2/6] mm: Lock kernel page tables before entering lazy MMU
 mode
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
 <7bd3a45dbc375dc2c15cebae09cb2bb972d6039f.1749747752.git.agordeev@linux.ibm.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <7bd3a45dbc375dc2c15cebae09cb2bb972d6039f.1749747752.git.agordeev@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.3 required=3.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 12/06/2025 18:36, Alexander Gordeev wrote:
> As a follow-up to commit 691ee97e1a9d ("mm: fix lazy mmu docs and
> usage") take a step forward and protect with a lock not only user,
> but also kernel mappings before entering the lazy MMU mode. With
> that the semantics of arch_enter|leave_lazy_mmu_mode() callbacks
> is consolidated, which allows further simplifications.
> 
> The effect of this consolidation is not fully preemptible (Real-Time)
> kernels can not enter the context switch while the lazy MMU mode is
> active - which is easier to comprehend.
> 
> Signed-off-by: Alexander Gordeev <agordeev@linux.ibm.com>
> ---
>  include/linux/pgtable.h | 12 ++++++------
>  mm/kasan/shadow.c       |  5 -----
>  mm/memory.c             |  5 ++++-
>  mm/vmalloc.c            |  6 ++++++
>  4 files changed, 16 insertions(+), 12 deletions(-)
> 
> diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
> index 0b6e1f781d86..33bf2b13c219 100644
> --- a/include/linux/pgtable.h
> +++ b/include/linux/pgtable.h
> @@ -224,12 +224,12 @@ static inline int pmd_dirty(pmd_t pmd)
>   * a raw PTE pointer after it has been modified are not guaranteed to be
>   * up to date.
>   *
> - * In the general case, no lock is guaranteed to be held between entry and exit
> - * of the lazy mode. So the implementation must assume preemption may be enabled
> - * and cpu migration is possible; it must take steps to be robust against this.
> - * (In practice, for user PTE updates, the appropriate page table lock(s) are
> - * held, but for kernel PTE updates, no lock is held). Nesting is not permitted
> - * and the mode cannot be used in interrupt context.
> + * For PREEMPT_RT kernels implementation must assume that preemption may
> + * be enabled and cpu migration is possible between entry and exit of the
> + * lazy MMU mode; it must take steps to be robust against this. There is
> + * no such assumption for non-PREEMPT_RT kernels, since both kernel and
> + * user page tables are protected with a spinlock while in lazy MMU mode.
> + * Nesting is not permitted and the mode cannot be used in interrupt context.

While I agree that spec for lazy mmu mode is not well defined, and welcome
changes to clarify and unify the implementations across arches, I think this is
a step in the wrong direction.

First the major one: you are serializing kernel pgtable operations that don't
need to be serialized. This, surely, can only lead to performance loss? vmalloc
could previously (mostly) run in parallel; The only part that was serialized was
the allocation of the VA space. Once that's done, operations on the VA space can
be done in parallel because each is only operating on the area it allocated.
With your change I think all pte operations are serialised with the single
init_mm.page_table_lock.

Additionally, some arches (inc arm64) use apply_to_page_range() to modify the
permissions of regions of kernel VA space. Again, we used to be able to modify
multiple regions in parallel, but you are now serializing this for no good reason.

Secondly, the lazy mmu handler still needs to handle the
preemption-while-in-lazy-mmu case because, as you mention, it can still be
preempted for PREEMPT_RT kernels where the spin lock is converted to a sleepable
lock.

So I think the handler needs to either explicitly disable preemption (as powerpc
and sparc do) or handle it by plugging into the arch-specific context switch
code (as x86 does) or only maintain per-task state in the first place (as arm64
does).

Thanks,
Ryan

>   */
>  #ifndef __HAVE_ARCH_ENTER_LAZY_MMU_MODE
>  #define arch_enter_lazy_mmu_mode()	do {} while (0)
> diff --git a/mm/kasan/shadow.c b/mm/kasan/shadow.c
> index d2c70cd2afb1..45115bd770a9 100644
> --- a/mm/kasan/shadow.c
> +++ b/mm/kasan/shadow.c
> @@ -313,12 +313,10 @@ static int kasan_populate_vmalloc_pte(pte_t *ptep, unsigned long addr,
>  	__memset(page_to_virt(page), KASAN_VMALLOC_INVALID, PAGE_SIZE);
>  	pte = pfn_pte(page_to_pfn(page), PAGE_KERNEL);
>  
> -	spin_lock(&init_mm.page_table_lock);
>  	if (likely(pte_none(ptep_get(ptep)))) {
>  		set_pte_at(&init_mm, addr, ptep, pte);
>  		data->pages[index] = NULL;
>  	}
> -	spin_unlock(&init_mm.page_table_lock);
>  
>  	return 0;
>  }
> @@ -465,13 +463,10 @@ static int kasan_depopulate_vmalloc_pte(pte_t *ptep, unsigned long addr,
>  
>  	page = (unsigned long)__va(pte_pfn(ptep_get(ptep)) << PAGE_SHIFT);
>  
> -	spin_lock(&init_mm.page_table_lock);
> -
>  	if (likely(!pte_none(ptep_get(ptep)))) {
>  		pte_clear(&init_mm, addr, ptep);
>  		free_page(page);
>  	}
> -	spin_unlock(&init_mm.page_table_lock);
>  
>  	return 0;
>  }
> diff --git a/mm/memory.c b/mm/memory.c
> index 71b3d3f98999..1ddc532b1f13 100644
> --- a/mm/memory.c
> +++ b/mm/memory.c
> @@ -3017,6 +3017,7 @@ static int apply_to_pte_range(struct mm_struct *mm, pmd_t *pmd,
>  			pte = pte_offset_kernel(pmd, addr);
>  		if (!pte)
>  			return err;
> +		spin_lock(&init_mm.page_table_lock);
>  	} else {
>  		if (create)
>  			pte = pte_alloc_map_lock(mm, pmd, addr, &ptl);
> @@ -3042,7 +3043,9 @@ static int apply_to_pte_range(struct mm_struct *mm, pmd_t *pmd,
>  
>  	arch_leave_lazy_mmu_mode();
>  
> -	if (mm != &init_mm)
> +	if (mm == &init_mm)
> +		spin_unlock(&init_mm.page_table_lock);
> +	else
>  		pte_unmap_unlock(mapped_pte, ptl);
>  
>  	*mask |= PGTBL_PTE_MODIFIED;
> diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> index ab986dd09b6a..57b11000ae36 100644
> --- a/mm/vmalloc.c
> +++ b/mm/vmalloc.c
> @@ -105,6 +105,7 @@ static int vmap_pte_range(pmd_t *pmd, unsigned long addr, unsigned long end,
>  	if (!pte)
>  		return -ENOMEM;
>  
> +	spin_lock(&init_mm.page_table_lock);
>  	arch_enter_lazy_mmu_mode();
>  
>  	do {
> @@ -132,6 +133,7 @@ static int vmap_pte_range(pmd_t *pmd, unsigned long addr, unsigned long end,
>  	} while (pte += PFN_DOWN(size), addr += size, addr != end);
>  
>  	arch_leave_lazy_mmu_mode();
> +	spin_unlock(&init_mm.page_table_lock);
>  	*mask |= PGTBL_PTE_MODIFIED;
>  	return 0;
>  }
> @@ -359,6 +361,7 @@ static void vunmap_pte_range(pmd_t *pmd, unsigned long addr, unsigned long end,
>  	unsigned long size = PAGE_SIZE;
>  
>  	pte = pte_offset_kernel(pmd, addr);
> +	spin_lock(&init_mm.page_table_lock);
>  	arch_enter_lazy_mmu_mode();
>  
>  	do {
> @@ -379,6 +382,7 @@ static void vunmap_pte_range(pmd_t *pmd, unsigned long addr, unsigned long end,
>  	} while (pte += (size >> PAGE_SHIFT), addr += size, addr != end);
>  
>  	arch_leave_lazy_mmu_mode();
> +	spin_unlock(&init_mm.page_table_lock);
>  	*mask |= PGTBL_PTE_MODIFIED;
>  }
>  
> @@ -525,6 +529,7 @@ static int vmap_pages_pte_range(pmd_t *pmd, unsigned long addr,
>  	if (!pte)
>  		return -ENOMEM;
>  
> +	spin_lock(&init_mm.page_table_lock);
>  	arch_enter_lazy_mmu_mode();
>  
>  	do {
> @@ -542,6 +547,7 @@ static int vmap_pages_pte_range(pmd_t *pmd, unsigned long addr,
>  	} while (pte++, addr += PAGE_SIZE, addr != end);
>  
>  	arch_leave_lazy_mmu_mode();
> +	spin_unlock(&init_mm.page_table_lock);
>  	*mask |= PGTBL_PTE_MODIFIED;
>  	return 0;
>  }


