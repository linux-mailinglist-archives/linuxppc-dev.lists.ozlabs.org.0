Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BBEA7562B7
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Jul 2023 14:26:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R4LtM1xfKz30NY
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Jul 2023 22:26:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=45.249.212.255; helo=szxga08-in.huawei.com; envelope-from=yangyicong@huawei.com; receiver=lists.ozlabs.org)
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R4Lsq5FBrz2yD8
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Jul 2023 22:26:18 +1000 (AEST)
Received: from canpemm500009.china.huawei.com (unknown [172.30.72.54])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4R4Lrp2BrKz18LY9;
	Mon, 17 Jul 2023 20:25:30 +0800 (CST)
Received: from [10.67.102.169] (10.67.102.169) by
 canpemm500009.china.huawei.com (7.192.105.203) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 17 Jul 2023 20:26:11 +0800
Subject: Re: [PATCH v10 4/4] arm64: support batched/deferred tlb shootdown
 during page reclamation/migration
To: Catalin Marinas <catalin.marinas@arm.com>
References: <20230710083914.18336-1-yangyicong@huawei.com>
 <20230710083914.18336-5-yangyicong@huawei.com> <ZLQIvPpKvjWppc59@arm.com>
From: Yicong Yang <yangyicong@huawei.com>
Message-ID: <9438aa19-8eb5-a36a-c4a0-6c8333665637@huawei.com>
Date: Mon, 17 Jul 2023 20:26:10 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <ZLQIvPpKvjWppc59@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.102.169]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
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
Cc: mark.rutland@arm.com, wangkefeng.wang@huawei.com, prime.zeng@hisilicon.com, realmz6@gmail.com, linux-doc@vger.kernel.org, peterz@infradead.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, Nadav Amit <namit@vmware.com>, punit.agrawal@bytedance.com, linux-riscv@lists.infradead.org, will@kernel.org, linux-s390@vger.kernel.org, zhangshiming@oppo.com, lipeifeng@oppo.com, corbet@lwn.net, x86@kernel.org, Barry Song <21cnbao@gmail.com>, Mel Gorman <mgorman@suse.de>, ryan.roberts@arm.com, arnd@arndb.de, anshuman.khandual@arm.com, Barry Song <v-songbaohua@oppo.com>, openrisc@lists.librecores.org, darren@os.amperecomputing.com, Jonathan.Cameron@huawei.com, yangyicong@hisilicon.com, linux-arm-kernel@lists.infradead.org, guojian@oppo.com, xhao@linux.alibaba.com, linux-mips@vger.kernel.org, huzhanyuan@oppo.com, akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2023/7/16 23:11, Catalin Marinas wrote:
> On Mon, Jul 10, 2023 at 04:39:14PM +0800, Yicong Yang wrote:
>> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
>> index 7856c3a3e35a..f0ce8208c57f 100644
>> --- a/arch/arm64/Kconfig
>> +++ b/arch/arm64/Kconfig
>> @@ -96,6 +96,7 @@ config ARM64
>>  	select ARCH_SUPPORTS_NUMA_BALANCING
>>  	select ARCH_SUPPORTS_PAGE_TABLE_CHECK
>>  	select ARCH_SUPPORTS_PER_VMA_LOCK
>> +	select ARCH_WANT_BATCHED_UNMAP_TLB_FLUSH if EXPERT
> 
> I don't want EXPERT to turn on a feature that's not selectable by the
> user. This would lead to different performance behaviour based on
> EXPERT. Just select it unconditionally.

Got it. will drop it and address the comment below.

Thanks.

> 
>> diff --git a/arch/arm64/include/asm/tlbflush.h b/arch/arm64/include/asm/tlbflush.h
>> index 412a3b9a3c25..4bb9cec62e26 100644
>> --- a/arch/arm64/include/asm/tlbflush.h
>> +++ b/arch/arm64/include/asm/tlbflush.h
>> @@ -254,17 +254,23 @@ static inline void flush_tlb_mm(struct mm_struct *mm)
>>  	dsb(ish);
>>  }
>>  
>> -static inline void flush_tlb_page_nosync(struct vm_area_struct *vma,
>> -					 unsigned long uaddr)
>> +static inline void __flush_tlb_page_nosync(struct mm_struct *mm,
>> +					   unsigned long uaddr)
>>  {
>>  	unsigned long addr;
>>  
>>  	dsb(ishst);
>> -	addr = __TLBI_VADDR(uaddr, ASID(vma->vm_mm));
>> +	addr = __TLBI_VADDR(uaddr, ASID(mm));
>>  	__tlbi(vale1is, addr);
>>  	__tlbi_user(vale1is, addr);
>>  }
>>  
>> +static inline void flush_tlb_page_nosync(struct vm_area_struct *vma,
>> +					 unsigned long uaddr)
>> +{
>> +	return __flush_tlb_page_nosync(vma->vm_mm, uaddr);
>> +}
>> +
>>  static inline void flush_tlb_page(struct vm_area_struct *vma,
>>  				  unsigned long uaddr)
>>  {
>> @@ -272,6 +278,42 @@ static inline void flush_tlb_page(struct vm_area_struct *vma,
>>  	dsb(ish);
>>  }
>>  
>> +#ifdef CONFIG_ARCH_WANT_BATCHED_UNMAP_TLB_FLUSH
> 
> If it's selected unconditionally, we won't need this #ifdef here.
> 
>> +
>> +static inline bool arch_tlbbatch_should_defer(struct mm_struct *mm)
>> +{
>> +#ifdef CONFIG_ARM64_WORKAROUND_REPEAT_TLBI
>> +	/*
>> +	 * TLB flush deferral is not required on systems, which are affected with
> 
> "affected by" and drop the comma before "which".
> 
