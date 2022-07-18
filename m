Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EAD55783B6
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Jul 2022 15:29:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LmjVG1lQNz3c7V
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Jul 2022 23:29:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=45.249.212.189; helo=szxga03-in.huawei.com; envelope-from=yangyicong@huawei.com; receiver=<UNKNOWN>)
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LmjTq6nfXz302d
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 Jul 2022 23:28:43 +1000 (AEST)
Received: from canpemm500009.china.huawei.com (unknown [172.30.72.56])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4LmjSL1J1JzFq9F;
	Mon, 18 Jul 2022 21:27:30 +0800 (CST)
Received: from [10.67.102.169] (10.67.102.169) by
 canpemm500009.china.huawei.com (7.192.105.203) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Mon, 18 Jul 2022 21:28:30 +0800
Subject: Re: [PATCH v2 0/4] mm: arm64: bring up BATCHED_UNMAP_TLB_FLUSH
To: Barry Song <21cnbao@gmail.com>, <xhao@linux.alibaba.com>
References: <20220711034615.482895-1-21cnbao@gmail.com>
 <24f5e25b-3946-b92a-975b-c34688005398@linux.alibaba.com>
 <CAGsJ_4zjnmQV6LT3yo--K-qD-92=hBmgfK121=n-Y0oEFX8RnQ@mail.gmail.com>
From: Yicong Yang <yangyicong@huawei.com>
Message-ID: <8e603deb-7023-5de5-c958-8911971aec24@huawei.com>
Date: Mon, 18 Jul 2022 21:28:30 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <CAGsJ_4zjnmQV6LT3yo--K-qD-92=hBmgfK121=n-Y0oEFX8RnQ@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.102.169]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
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
Cc: Linux Doc Mailing List <linux-doc@vger.kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, yangyicong@hisilicon.com, Linux-MM <linux-mm@kvack.org>, =?UTF-8?B?6YOt5YGl?= <guojian@oppo.com>, linux-riscv@lists.infradead.org, Will Deacon <will@kernel.org>, linux-s390@vger.kernel.org, =?UTF-8?B?5byg6K+X5piOKFNpbW9uIFpoYW5nKQ==?= <zhangshiming@oppo.com>, =?UTF-8?B?5p2O5Z+56ZSLKHdpbmsp?= <lipeifeng@oppo.com>, Jonathan Corbet <corbet@lwn.net>, x86 <x86@kernel.org>, linux-mips@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, real mz <realmz6@gmail.com>, openrisc@lists.librecores.org, Darren Hart <darren@os.amperecomputing.com>, LAK <linux-arm-kernel@lists.infradead.org>, LKML <linux-kernel@vger.kernel.org>, huzhanyuan@oppo.com, "tiantao \(H\)" <tiantao6@hisilicon.com>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2022/7/14 12:51, Barry Song wrote:
> On Thu, Jul 14, 2022 at 3:29 PM Xin Hao <xhao@linux.alibaba.com> wrote:
>>
>> Hi barry.
>>
>> I do some test on Kunpeng arm64 machine use Unixbench.
>>
>> The test  result as below.
>>
>> One core, we can see the performance improvement above +30%.
> 
> I am really pleased to see the 30%+ improvement on unixbench on single core.
> 
>> ./Run -c 1 -i 1 shell1
>> w/o
>> System Benchmarks Partial Index              BASELINE RESULT INDEX
>> Shell Scripts (1 concurrent)                     42.4 5481.0 1292.7
>> ========
>> System Benchmarks Index Score (Partial Only)                         1292.7
>>
>> w/
>> System Benchmarks Partial Index              BASELINE RESULT INDEX
>> Shell Scripts (1 concurrent)                     42.4 6974.6 1645.0
>> ========
>> System Benchmarks Index Score (Partial Only)                         1645.0
>>
>>
>> But with whole cores, there have little performance degradation above -5%
> 
> That is sad as we might get more concurrency between mprotect(), madvise(),
> mremap(), zap_pte_range() and the deferred tlbi.
> 
>>
>> ./Run -c 96 -i 1 shell1
>> w/o
>> Shell Scripts (1 concurrent)                  80765.5 lpm   (60.0 s, 1
>> samples)
>> System Benchmarks Partial Index              BASELINE RESULT INDEX
>> Shell Scripts (1 concurrent)                     42.4 80765.5 19048.5
>> ========
>> System Benchmarks Index Score (Partial Only)                        19048.5
>>
>> w
>> Shell Scripts (1 concurrent)                  76333.6 lpm   (60.0 s, 1
>> samples)
>> System Benchmarks Partial Index              BASELINE RESULT INDEX
>> Shell Scripts (1 concurrent)                     42.4 76333.6 18003.2
>> ========
>> System Benchmarks Index Score (Partial Only)                        18003.2
>>
>> ----------------------------------------------------------------------------------------------
>>
>>
>> After discuss with you, and do some changes in the patch.
>>
>> ndex a52381a680db..1ecba81f1277 100644
>> --- a/mm/rmap.c
>> +++ b/mm/rmap.c
>> @@ -727,7 +727,11 @@ void flush_tlb_batched_pending(struct mm_struct *mm)
>>          int flushed = batch >> TLB_FLUSH_BATCH_FLUSHED_SHIFT;
>>
>>          if (pending != flushed) {
>> +#ifdef CONFIG_ARCH_HAS_MM_CPUMASK
>>                  flush_tlb_mm(mm);
>> +#else
>> +               dsb(ish);
>> +#endif
>>
> 
> i was guessing the problem might be flush_tlb_batched_pending()
> so i asked you to change this to verify my guess.
> 

flush_tlb_batched_pending() looks like the critical path for this issue then the code
above can mitigate this.

I cannot reproduce this on a 2P 128C Kunpeng920 server. The kernel is based on the
v5.19-rc6 and unixbench of version 5.1.3. The result of `./Run -c 128 -i 1 shell1` is:
      iter-1      iter-2     iter-3
w/o  17708.1     17637.1    17630.1
w    17766.0     17752.3    17861.7

And flush_tlb_batched_pending()isn't the hot spot with the patch:
   7.00%  sh        [kernel.kallsyms]      [k] ptep_clear_flush
   4.17%  sh        [kernel.kallsyms]      [k] ptep_set_access_flags
   2.43%  multi.sh  [kernel.kallsyms]      [k] ptep_clear_flush
   1.98%  sh        [kernel.kallsyms]      [k] _raw_spin_unlock_irqrestore
   1.69%  sh        [kernel.kallsyms]      [k] next_uptodate_page
   1.66%  sort      [kernel.kallsyms]      [k] ptep_clear_flush
   1.56%  multi.sh  [kernel.kallsyms]      [k] ptep_set_access_flags
   1.27%  sh        [kernel.kallsyms]      [k] page_counter_cancel
   1.11%  sh        [kernel.kallsyms]      [k] page_remove_rmap
   1.06%  sh        [kernel.kallsyms]      [k] perf_event_alloc

Hi Xin Hao,

I'm not sure the test setup as well as the config is same with yours. (96C vs 128C
should not be the reason I think). Did you check that the 5% is a fluctuation or
not? It'll be helpful if more information provided for reproducing this issue.

Thanks.

>      /*
>>                   * If the new TLB flushing is pending during flushing, leave
>>                   * mm->tlb_flush_batched as is, to avoid losing flushing.
>>
>> there have a performance improvement with whole cores, above +30%
> 
> But I don't think it is a proper patch. There is no guarantee the cpu calling
> flush_tlb_batched_pending is exactly the cpu sending the deferred
> tlbi. so the solution is unsafe. But since this temporary code can bring the
> 30%+ performance improvement back for high concurrency, we have huge
> potential to finally make it.
> 
> Unfortunately I don't have an arm64 server to debug on this. I only have
> 8 cores which are unlikely to reproduce regression which happens in
> high concurrency with 96 parallel tasks.
> 
> So I'd ask if @yicong or someone else working on kunpeng or other
> arm64 servers  is able to actually debug and figure out a proper
> patch for this, then add the patch as 5/5 into this series?
> 
>>
>> ./Run -c 96 -i 1 shell1
>> 96 CPUs in system; running 96 parallel copies of tests
>>
>> Shell Scripts (1 concurrent)                 109229.0 lpm   (60.0 s, 1 samples)
>> System Benchmarks Partial Index              BASELINE       RESULT    INDEX
>> Shell Scripts (1 concurrent)                     42.4     109229.0  25761.6
>>                                                                     ========
>> System Benchmarks Index Score (Partial Only)                        25761.6
>>
>>
>> Tested-by: Xin Hao<xhao@linux.alibaba.com>
> 
> Thanks for your testing!
> 
>>
>> Looking forward to your next version patch.
>>
>> On 7/11/22 11:46 AM, Barry Song wrote:
>>> Though ARM64 has the hardware to do tlb shootdown, the hardware
>>> broadcasting is not free.
>>> A simplest micro benchmark shows even on snapdragon 888 with only
>>> 8 cores, the overhead for ptep_clear_flush is huge even for paging
>>> out one page mapped by only one process:
>>> 5.36%  a.out    [kernel.kallsyms]  [k] ptep_clear_flush
>>>
>>> While pages are mapped by multiple processes or HW has more CPUs,
>>> the cost should become even higher due to the bad scalability of
>>> tlb shootdown.
>>>
>>> The same benchmark can result in 16.99% CPU consumption on ARM64
>>> server with around 100 cores according to Yicong's test on patch
>>> 4/4.
>>>
>>> This patchset leverages the existing BATCHED_UNMAP_TLB_FLUSH by
>>> 1. only send tlbi instructions in the first stage -
>>>       arch_tlbbatch_add_mm()
>>> 2. wait for the completion of tlbi by dsb while doing tlbbatch
>>>       sync in arch_tlbbatch_flush()
>>> My testing on snapdragon shows the overhead of ptep_clear_flush
>>> is removed by the patchset. The micro benchmark becomes 5% faster
>>> even for one page mapped by single process on snapdragon 888.
>>>
>>>
>>> -v2:
>>> 1. Collected Yicong's test result on kunpeng920 ARM64 server;
>>> 2. Removed the redundant vma parameter in arch_tlbbatch_add_mm()
>>>     according to the comments of Peter Zijlstra and Dave Hansen
>>> 3. Added ARCH_HAS_MM_CPUMASK rather than checking if mm_cpumask
>>>     is empty according to the comments of Nadav Amit
>>>
>>> Thanks, Yicong, Peter, Dave and Nadav for your testing or reviewing
>>> , and comments.
>>>
>>> -v1:
>>> https://lore.kernel.org/lkml/20220707125242.425242-1-21cnbao@gmail.com/
>>>
>>> Barry Song (4):
>>>    Revert "Documentation/features: mark BATCHED_UNMAP_TLB_FLUSH doesn't
>>>      apply to ARM64"
>>>    mm: rmap: Allow platforms without mm_cpumask to defer TLB flush
>>>    mm: rmap: Extend tlbbatch APIs to fit new platforms
>>>    arm64: support batched/deferred tlb shootdown during page reclamation
>>>
>>>   Documentation/features/arch-support.txt       |  1 -
>>>   .../features/vm/TLB/arch-support.txt          |  2 +-
>>>   arch/arm/Kconfig                              |  1 +
>>>   arch/arm64/Kconfig                            |  1 +
>>>   arch/arm64/include/asm/tlbbatch.h             | 12 ++++++++++
>>>   arch/arm64/include/asm/tlbflush.h             | 23 +++++++++++++++++--
>>>   arch/loongarch/Kconfig                        |  1 +
>>>   arch/mips/Kconfig                             |  1 +
>>>   arch/openrisc/Kconfig                         |  1 +
>>>   arch/powerpc/Kconfig                          |  1 +
>>>   arch/riscv/Kconfig                            |  1 +
>>>   arch/s390/Kconfig                             |  1 +
>>>   arch/um/Kconfig                               |  1 +
>>>   arch/x86/Kconfig                              |  1 +
>>>   arch/x86/include/asm/tlbflush.h               |  3 ++-
>>>   mm/Kconfig                                    |  3 +++
>>>   mm/rmap.c                                     | 14 +++++++----
>>>   17 files changed, 59 insertions(+), 9 deletions(-)
>>>   create mode 100644 arch/arm64/include/asm/tlbbatch.h
>>>
>> --
>> Best Regards!
>> Xin Hao
>>
> 
> Thanks
> Barry
> .
> 
