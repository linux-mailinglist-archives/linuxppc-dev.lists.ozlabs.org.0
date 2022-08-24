Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 82CEC59F6FF
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Aug 2022 11:59:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MCM5N3QCRz308b
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Aug 2022 19:59:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=45.249.212.187; helo=szxga01-in.huawei.com; envelope-from=wangkefeng.wang@huawei.com; receiver=<UNKNOWN>)
X-Greylist: delayed 1094 seconds by postgrey-1.36 at boromir; Wed, 24 Aug 2022 19:59:11 AEST
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MCM4v0ZWPz2xGy
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Aug 2022 19:59:06 +1000 (AEST)
Received: from dggpemm500021.china.huawei.com (unknown [172.30.72.54])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4MCLcR2060znTkv;
	Wed, 24 Aug 2022 17:37:59 +0800 (CST)
Received: from dggpemm500001.china.huawei.com (7.185.36.107) by
 dggpemm500021.china.huawei.com (7.185.36.109) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Wed, 24 Aug 2022 17:40:08 +0800
Received: from [10.174.177.243] (10.174.177.243) by
 dggpemm500001.china.huawei.com (7.185.36.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Wed, 24 Aug 2022 17:40:06 +0800
Message-ID: <0dc19773-81f7-84c2-2bc7-7d8d987b24b7@huawei.com>
Date: Wed, 24 Aug 2022 17:40:06 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v3 2/4] mm/tlbbatch: Introduce
 arch_tlbbatch_should_defer()
Content-Language: en-US
To: Yicong Yang <yangyicong@huawei.com>, <akpm@linux-foundation.org>,
	<linux-mm@kvack.org>, <linux-arm-kernel@lists.infradead.org>,
	<x86@kernel.org>, <catalin.marinas@arm.com>, <will@kernel.org>,
	<linux-doc@vger.kernel.org>
References: <20220822082120.8347-1-yangyicong@huawei.com>
 <20220822082120.8347-3-yangyicong@huawei.com>
From: Kefeng Wang <wangkefeng.wang@huawei.com>
In-Reply-To: <20220822082120.8347-3-yangyicong@huawei.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.177.243]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
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
Cc: linux-s390@vger.kernel.org, zhangshiming@oppo.com, lipeifeng@oppo.com, prime.zeng@hisilicon.com, arnd@arndb.de, corbet@lwn.net, peterz@infradead.org, Anshuman Khandual <khandual@linux.vnet.ibm.com>, realmz6@gmail.com, Barry Song <21cnbao@gmail.com>, linux-kernel@vger.kernel.org, yangyicong@hisilicon.com, openrisc@lists.librecores.org, xhao@linux.alibaba.com, darren@os.amperecomputing.com, huzhanyuan@oppo.com, guojian@oppo.com, linux-riscv@lists.infradead.org, linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, anshuman.khandual@arm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On 2022/8/22 16:21, Yicong Yang wrote:
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

Reviewed-by: Kefeng Wang <wangkefeng.wang@huawei.com>

> ---
>   arch/x86/include/asm/tlbflush.h | 12 ++++++++++++
>   mm/rmap.c                       |  9 +--------
>   2 files changed, 13 insertions(+), 8 deletions(-)
>
> diff --git a/arch/x86/include/asm/tlbflush.h b/arch/x86/include/asm/tlbflush.h
> index cda3118f3b27..8a497d902c16 100644
> --- a/arch/x86/include/asm/tlbflush.h
> +++ b/arch/x86/include/asm/tlbflush.h
> @@ -240,6 +240,18 @@ static inline void flush_tlb_page(struct vm_area_struct *vma, unsigned long a)
>   	flush_tlb_mm_range(vma->vm_mm, a, a + PAGE_SIZE, PAGE_SHIFT, false);
>   }
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
>   static inline u64 inc_mm_tlb_gen(struct mm_struct *mm)
>   {
>   	/*
> diff --git a/mm/rmap.c b/mm/rmap.c
> index edc06c52bc82..a17a004550c6 100644
> --- a/mm/rmap.c
> +++ b/mm/rmap.c
> @@ -687,17 +687,10 @@ static void set_tlb_ubc_flush_pending(struct mm_struct *mm, bool writable)
>    */
>   static bool should_defer_flush(struct mm_struct *mm, enum ttu_flags flags)
>   {
> -	bool should_defer = false;
> -
>   	if (!(flags & TTU_BATCH_FLUSH))
>   		return false;
>   
> -	/* If remote CPUs need to be flushed then defer batch the flush */
> -	if (cpumask_any_but(mm_cpumask(mm), get_cpu()) < nr_cpu_ids)
> -		should_defer = true;
> -	put_cpu();
> -
> -	return should_defer;
> +	return arch_tlbbatch_should_defer(mm);
>   }
>   
>   /*
