Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E5AA5B2D56
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Sep 2022 06:24:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MP2vh5K7Kz3c8Z
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Sep 2022 14:24:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=anshuman.khandual@arm.com; receiver=<UNKNOWN>)
X-Greylist: delayed 451 seconds by postgrey-1.36 at boromir; Fri, 09 Sep 2022 14:24:25 AEST
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MP2vF3qDcz2xBl
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Sep 2022 14:24:24 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 09453153B;
	Thu,  8 Sep 2022 21:16:23 -0700 (PDT)
Received: from [10.162.41.8] (unknown [10.162.41.8])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F33023F71A;
	Thu,  8 Sep 2022 21:16:07 -0700 (PDT)
Message-ID: <46b8a713-64bf-9c00-9001-3196238d1482@arm.com>
Date: Fri, 9 Sep 2022 09:46:04 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
From: Anshuman Khandual <anshuman.khandual@arm.com>
Subject: Re: [PATCH v3 2/4] mm/tlbbatch: Introduce
 arch_tlbbatch_should_defer()
To: Yicong Yang <yangyicong@huawei.com>, akpm@linux-foundation.org,
 linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org, x86@kernel.org,
 catalin.marinas@arm.com, will@kernel.org, linux-doc@vger.kernel.org
References: <20220822082120.8347-1-yangyicong@huawei.com>
 <20220822082120.8347-3-yangyicong@huawei.com>
Content-Language: en-US
In-Reply-To: <20220822082120.8347-3-yangyicong@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: linux-s390@vger.kernel.org, wangkefeng.wang@huawei.com, zhangshiming@oppo.com, lipeifeng@oppo.com, prime.zeng@hisilicon.com, arnd@arndb.de, corbet@lwn.net, peterz@infradead.org, realmz6@gmail.com, Barry Song <21cnbao@gmail.com>, linux-kernel@vger.kernel.org, yangyicong@hisilicon.com, openrisc@lists.librecores.org, xhao@linux.alibaba.com, darren@os.amperecomputing.com, huzhanyuan@oppo.com, guojian@oppo.com, linux-riscv@lists.infradead.org, linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, Anshuman Khandual <khandual@linux.vnet.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 8/22/22 13:51, Yicong Yang wrote:
> From: Anshuman Khandual <khandual@linux.vnet.ibm.com>
> 
> The entire scheme of deferred TLB flush in reclaim path rests on the
> fact that the cost to refill TLB entries is less than flushing out
> individual entries by sending IPI to remote CPUs. But architecture
> can have different ways to evaluate that. Hence apart from checking
> TTU_BATCH_FLUSH in the TTU flags, rest of the decision should be
> architecture specific.
> 
> Signed-off-by: Anshuman Khandual <khandual@linux.vnet.ibm.com>
> [https://lore.kernel.org/linuxppc-dev/20171101101735.2318-2-khandual@linux.vnet.ibm.com/]
> Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
> [Rebase and fix incorrect return value type]

From semantics perspective, this patch still makes sense, even on its own.

Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>

> ---
>  arch/x86/include/asm/tlbflush.h | 12 ++++++++++++
>  mm/rmap.c                       |  9 +--------
>  2 files changed, 13 insertions(+), 8 deletions(-)
> 
> diff --git a/arch/x86/include/asm/tlbflush.h b/arch/x86/include/asm/tlbflush.h
> index cda3118f3b27..8a497d902c16 100644
> --- a/arch/x86/include/asm/tlbflush.h
> +++ b/arch/x86/include/asm/tlbflush.h
> @@ -240,6 +240,18 @@ static inline void flush_tlb_page(struct vm_area_struct *vma, unsigned long a)
>  	flush_tlb_mm_range(vma->vm_mm, a, a + PAGE_SIZE, PAGE_SHIFT, false);
>  }
>  
> +static inline bool arch_tlbbatch_should_defer(struct mm_struct *mm)
> +{
> +	bool should_defer = false;
> +
> +	/* If remote CPUs need to be flushed then defer batch the flush */
> +	if (cpumask_any_but(mm_cpumask(mm), get_cpu()) < nr_cpu_ids)
> +		should_defer = true;
> +	put_cpu();
> +
> +	return should_defer;
> +}
> +
>  static inline u64 inc_mm_tlb_gen(struct mm_struct *mm)
>  {
>  	/*
> diff --git a/mm/rmap.c b/mm/rmap.c
> index edc06c52bc82..a17a004550c6 100644
> --- a/mm/rmap.c
> +++ b/mm/rmap.c
> @@ -687,17 +687,10 @@ static void set_tlb_ubc_flush_pending(struct mm_struct *mm, bool writable)
>   */
>  static bool should_defer_flush(struct mm_struct *mm, enum ttu_flags flags)
>  {
> -	bool should_defer = false;
> -
>  	if (!(flags & TTU_BATCH_FLUSH))
>  		return false;
>  
> -	/* If remote CPUs need to be flushed then defer batch the flush */
> -	if (cpumask_any_but(mm_cpumask(mm), get_cpu()) < nr_cpu_ids)
> -		should_defer = true;
> -	put_cpu();
> -
> -	return should_defer;
> +	return arch_tlbbatch_should_defer(mm);
>  }
>  
>  /*
