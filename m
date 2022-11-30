Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 60B8E63CD56
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Nov 2022 03:25:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NMNMk2H8Xz3bhP
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Nov 2022 13:25:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=45.249.212.187; helo=szxga01-in.huawei.com; envelope-from=yangyicong@huawei.com; receiver=<UNKNOWN>)
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NMNM66bzqz30hh
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Nov 2022 13:24:31 +1100 (AEDT)
Received: from canpemm500009.china.huawei.com (unknown [172.30.72.53])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4NMNFY6J5yzqSpv;
	Wed, 30 Nov 2022 10:19:45 +0800 (CST)
Received: from [10.67.102.169] (10.67.102.169) by
 canpemm500009.china.huawei.com (7.192.105.203) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 30 Nov 2022 10:23:47 +0800
Subject: Re: [PATCH v7 1/2] mm/tlbbatch: Introduce
 arch_tlbbatch_should_defer()
To: Andrew Morton <akpm@linux-foundation.org>
References: <20221117082648.47526-1-yangyicong@huawei.com>
 <20221117082648.47526-2-yangyicong@huawei.com>
 <20221129152306.54b6d439e2a0ca7ece1d1afa@linux-foundation.org>
From: Yicong Yang <yangyicong@huawei.com>
Message-ID: <9999b87d-5f7e-275b-d99f-b51ef19361eb@huawei.com>
Date: Wed, 30 Nov 2022 10:23:47 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <20221129152306.54b6d439e2a0ca7ece1d1afa@linux-foundation.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.102.169]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 canpemm500009.china.huawei.com (7.192.105.203)
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
Cc: wangkefeng.wang@huawei.com, prime.zeng@hisilicon.com, realmz6@gmail.com, linux-doc@vger.kernel.org, peterz@infradead.org, catalin.marinas@arm.com, linux-kernel@vger.kernel.org, linux-mm@kvack.org, punit.agrawal@bytedance.com, linux-riscv@lists.infradead.org, will@kernel.org, Anshuman Khandual <khandual@linux.vnet.ibm.com>, linux-s390@vger.kernel.org, zhangshiming@oppo.com, lipeifeng@oppo.com, corbet@lwn.net, x86@kernel.org, Barry Song <21cnbao@gmail.com>, arnd@arndb.de, anshuman.khandual@arm.com, openrisc@lists.librecores.org, darren@os.amperecomputing.com, yangyicong@hisilicon.com, linux-arm-kernel@lists.infradead.org, Barry Song <baohua@kernel.org>, guojian@oppo.com, xhao@linux.alibaba.com, linux-mips@vger.kernel.org, huzhanyuan@oppo.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2022/11/30 7:23, Andrew Morton wrote:
> On Thu, 17 Nov 2022 16:26:47 +0800 Yicong Yang <yangyicong@huawei.com> wrote:
> 
>> From: Anshuman Khandual <khandual@linux.vnet.ibm.com>
>>
>> The entire scheme of deferred TLB flush in reclaim path rests on the
>> fact that the cost to refill TLB entries is less than flushing out
>> individual entries by sending IPI to remote CPUs. But architecture
>> can have different ways to evaluate that. Hence apart from checking
>> TTU_BATCH_FLUSH in the TTU flags, rest of the decision should be
>> architecture specific.
>>
>> ...
>>
>> --- a/arch/x86/include/asm/tlbflush.h
>> +++ b/arch/x86/include/asm/tlbflush.h
>> @@ -240,6 +240,18 @@ static inline void flush_tlb_page(struct vm_area_struct *vma, unsigned long a)
>>  	flush_tlb_mm_range(vma->vm_mm, a, a + PAGE_SIZE, PAGE_SHIFT, false);
>>  }
>>  
>> +static inline bool arch_tlbbatch_should_defer(struct mm_struct *mm)
>> +{
>> +	bool should_defer = false;
>> +
>> +	/* If remote CPUs need to be flushed then defer batch the flush */
>> +	if (cpumask_any_but(mm_cpumask(mm), get_cpu()) < nr_cpu_ids)
>> +		should_defer = true;
>> +	put_cpu();
>> +
>> +	return should_defer;
>> +}
>> +
>>  static inline u64 inc_mm_tlb_gen(struct mm_struct *mm)
>>  {
>>  	/*
>> diff --git a/mm/rmap.c b/mm/rmap.c
>> index 2ec925e5fa6a..a9ab10bc0144 100644
>> --- a/mm/rmap.c
>> +++ b/mm/rmap.c
>> @@ -685,17 +685,10 @@ static void set_tlb_ubc_flush_pending(struct mm_struct *mm, bool writable)
>>   */
>>  static bool should_defer_flush(struct mm_struct *mm, enum ttu_flags flags)
>>  {
>> -	bool should_defer = false;
>> -
>>  	if (!(flags & TTU_BATCH_FLUSH))
>>  		return false;
>>  
>> -	/* If remote CPUs need to be flushed then defer batch the flush */
>> -	if (cpumask_any_but(mm_cpumask(mm), get_cpu()) < nr_cpu_ids)
>> -		should_defer = true;
>> -	put_cpu();
>> -
>> -	return should_defer;
>> +	return arch_tlbbatch_should_defer(mm);
>>  }
> 
> I think this conversion could have been done better.
> 
> should_defer_flush() is compiled if
> CONFIG_ARCH_WANT_BATCHED_UNMAP_TLB_FLUSH.  So the patch implicitly
> assumes that only x86 implements
> CONFIG_ARCH_WANT_BATCHED_UNMAP_TLB_FLUSH.  Presently true, but what
> happens if sparc (for example) wants to set
> CONFIG_ARCH_WANT_BATCHED_UNMAP_TLB_FLUSH?  Now sparc needs its private
> version of arch_tlbbatch_should_defer(), even if that is identical to
> x86's.
> 

The current logic is if architecture want to enable batched TLB flush, they
need to implement their own version of arch_tlbbatch_should_defer() (for the
hint to defer the TLB flush) and arch_tlbbatch_add_mm() (for pending TLB flush)
and select ARCH_WANT_BATCHED_UNMAP_TLB_FLUSH. That's what we do in Patch 2/2 for
enabling this on arm64.

Since it is architecture specific, we must rely on the architecture to implement
these two functions. Only select the ARCH_HAS_ARCH_TLBBATCH_SHOULD_DEFER is not
enough.

> Wouldn't it be better to make should_defer_flush() a __weak
> function in rmap.c, or a static inline inside #ifndef
> ARCH_HAS_ARCH_TLBBATCH_SHOULD_DEFER, or whatever technique best fits?
> 

When ARCH_HAS_ARCH_TLBBATCH_SHOULD_DEFER is not selected, should_defer_flush()
is implemented to only return false. I think this match what you want already.

Thanks.




