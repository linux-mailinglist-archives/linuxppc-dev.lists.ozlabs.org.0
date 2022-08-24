Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A5C659F6AB
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Aug 2022 11:44:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MCLlZ12nkz3bhQ
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Aug 2022 19:44:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=45.249.212.189; helo=szxga03-in.huawei.com; envelope-from=wangkefeng.wang@huawei.com; receiver=<UNKNOWN>)
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MCLkM5QDnz2xk5
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Aug 2022 19:43:07 +1000 (AEST)
Received: from dggpemm500023.china.huawei.com (unknown [172.30.72.53])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4MCLhM2jttzGpnB;
	Wed, 24 Aug 2022 17:41:23 +0800 (CST)
Received: from dggpemm500001.china.huawei.com (7.185.36.107) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Wed, 24 Aug 2022 17:43:03 +0800
Received: from [10.174.177.243] (10.174.177.243) by
 dggpemm500001.china.huawei.com (7.185.36.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Wed, 24 Aug 2022 17:43:01 +0800
Message-ID: <ec787d70-8d8a-c601-3282-a34329b078c4@huawei.com>
Date: Wed, 24 Aug 2022 17:43:01 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v3 3/4] mm: rmap: Extend tlbbatch APIs to fit new
 platforms
Content-Language: en-US
To: Yicong Yang <yangyicong@huawei.com>, <akpm@linux-foundation.org>,
	<linux-mm@kvack.org>, <linux-arm-kernel@lists.infradead.org>,
	<x86@kernel.org>, <catalin.marinas@arm.com>, <will@kernel.org>,
	<linux-doc@vger.kernel.org>
References: <20220822082120.8347-1-yangyicong@huawei.com>
 <20220822082120.8347-4-yangyicong@huawei.com>
From: Kefeng Wang <wangkefeng.wang@huawei.com>
In-Reply-To: <20220822082120.8347-4-yangyicong@huawei.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.177.243]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggpemm500001.china.huawei.com (7.185.36.107)
X-CFilter-Loop: Reflected
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
Cc: darren@os.amperecomputing.com, peterz@infradead.org, Dave Hansen <dave.hansen@linux.intel.com>, yangyicong@hisilicon.com, Nadav Amit <namit@vmware.com>, "H. Peter
 Anvin" <hpa@zytor.com>, guojian@oppo.com, linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, zhangshiming@oppo.com, lipeifeng@oppo.com, corbet@lwn.net, anshuman.khandual@arm.com, Barry Song <21cnbao@gmail.com>, Ingo Molnar <mingo@redhat.com>, Mel Gorman <mgorman@suse.de>, linux-mips@vger.kernel.org, arnd@arndb.de, realmz6@gmail.com, Barry Song <v-songbaohua@oppo.com>, openrisc@lists.librecores.org, Borislav
 Petkov <bp@alien8.de>, prime.zeng@hisilicon.com, Thomas
 Gleixner <tglx@linutronix.de>, xhao@linux.alibaba.com, linux-kernel@vger.kernel.org, huzhanyuan@oppo.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On 2022/8/22 16:21, Yicong Yang wrote:
> From: Barry Song <v-songbaohua@oppo.com>
>
> Add uaddr to tlbbatch APIs so that platforms like ARM64 are
> able to apply this on their specific hardware features. For
> ARM64, this could be sending tlbi into hardware queues for
> the page with this particular uaddr.
>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Ingo Molnar <mingo@redhat.com>
> Cc: Borislav Petkov <bp@alien8.de>
> Cc: Dave Hansen <dave.hansen@linux.intel.com>
> Cc: "H. Peter Anvin" <hpa@zytor.com>
> Cc: Nadav Amit <namit@vmware.com>
> Cc: Mel Gorman <mgorman@suse.de>
> Tested-by: Xin Hao <xhao@linux.alibaba.com>
> Signed-off-by: Barry Song <v-songbaohua@oppo.com>
> Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
Reviewed-by: Kefeng Wang <wangkefeng.wang@huawei.com>
> ---
>   arch/x86/include/asm/tlbflush.h |  3 ++-
>   mm/rmap.c                       | 10 ++++++----
>   2 files changed, 8 insertions(+), 5 deletions(-)
>
> diff --git a/arch/x86/include/asm/tlbflush.h b/arch/x86/include/asm/tlbflush.h
> index 8a497d902c16..5bd78ae55cd4 100644
> --- a/arch/x86/include/asm/tlbflush.h
> +++ b/arch/x86/include/asm/tlbflush.h
> @@ -264,7 +264,8 @@ static inline u64 inc_mm_tlb_gen(struct mm_struct *mm)
>   }
>   
>   static inline void arch_tlbbatch_add_mm(struct arch_tlbflush_unmap_batch *batch,
> -					struct mm_struct *mm)
> +					struct mm_struct *mm,
> +					unsigned long uaddr)
>   {
>   	inc_mm_tlb_gen(mm);
>   	cpumask_or(&batch->cpumask, &batch->cpumask, mm_cpumask(mm));
> diff --git a/mm/rmap.c b/mm/rmap.c
> index a17a004550c6..7187a72b63b1 100644
> --- a/mm/rmap.c
> +++ b/mm/rmap.c
> @@ -642,12 +642,13 @@ void try_to_unmap_flush_dirty(void)
>   #define TLB_FLUSH_BATCH_PENDING_LARGE			\
>   	(TLB_FLUSH_BATCH_PENDING_MASK / 2)
>   
> -static void set_tlb_ubc_flush_pending(struct mm_struct *mm, bool writable)
> +static void set_tlb_ubc_flush_pending(struct mm_struct *mm, bool writable,
> +				      unsigned long uaddr)
>   {
>   	struct tlbflush_unmap_batch *tlb_ubc = &current->tlb_ubc;
>   	int batch, nbatch;
>   
> -	arch_tlbbatch_add_mm(&tlb_ubc->arch, mm);
> +	arch_tlbbatch_add_mm(&tlb_ubc->arch, mm, uaddr);
>   	tlb_ubc->flush_required = true;
>   
>   	/*
> @@ -725,7 +726,8 @@ void flush_tlb_batched_pending(struct mm_struct *mm)
>   	}
>   }
>   #else
> -static void set_tlb_ubc_flush_pending(struct mm_struct *mm, bool writable)
> +static void set_tlb_ubc_flush_pending(struct mm_struct *mm, bool writable,
> +				      unsigned long uaddr)
>   {
>   }
>   
> @@ -1587,7 +1589,7 @@ static bool try_to_unmap_one(struct folio *folio, struct vm_area_struct *vma,
>   				 */
>   				pteval = ptep_get_and_clear(mm, address, pvmw.pte);
>   
> -				set_tlb_ubc_flush_pending(mm, pte_dirty(pteval));
> +				set_tlb_ubc_flush_pending(mm, pte_dirty(pteval), address);
>   			} else {
>   				pteval = ptep_clear_flush(vma, address, pvmw.pte);
>   			}
