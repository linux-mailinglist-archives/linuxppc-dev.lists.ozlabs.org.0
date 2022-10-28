Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6195E6107C4
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Oct 2022 04:15:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mz5k72Dsjz3cGF
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Oct 2022 13:15:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=anshuman.khandual@arm.com; receiver=<UNKNOWN>)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mz5jZ3dffz2xl1
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Oct 2022 13:15:13 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2BAF523A;
	Thu, 27 Oct 2022 19:14:48 -0700 (PDT)
Received: from [192.168.0.146] (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AD67A3F445;
	Thu, 27 Oct 2022 19:14:32 -0700 (PDT)
Message-ID: <8a3ade4c-1714-5ffd-ed57-02ab0509725b@arm.com>
Date: Fri, 28 Oct 2022 07:44:29 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v4 2/2] arm64: support batched/deferred tlb shootdown
 during page reclamation
Content-Language: en-US
To: Barry Song <21cnbao@gmail.com>,
 Punit Agrawal <punit.agrawal@bytedance.com>
References: <20220921084302.43631-1-yangyicong@huawei.com>
 <20220921084302.43631-3-yangyicong@huawei.com>
 <168eac93-a6ee-0b2e-12bb-4222eff24561@arm.com>
 <8e391962-4e3a-5a56-64b4-78e8637e3b8c@huawei.com>
 <CAGsJ_4z=dZbrAUD9jczT08S3qi_ep-h+EK35UfayVk1S+Cnp2A@mail.gmail.com>
 <ecd161db-b290-7997-a81e-a0a00bd1c599@arm.com> <87o7tx5oyx.fsf@stealth>
 <CAGsJ_4zrGfPYAXGW0g3Z-GF4vT7GD0xDjZn1dv-qruztEQTghg@mail.gmail.com>
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <CAGsJ_4zrGfPYAXGW0g3Z-GF4vT7GD0xDjZn1dv-qruztEQTghg@mail.gmail.com>
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
Cc: wangkefeng.wang@huawei.com, prime.zeng@hisilicon.com, linux-doc@vger.kernel.org, peterz@infradead.org, catalin.marinas@arm.com, yangyicong@hisilicon.com, linux-mm@kvack.org, Nadav Amit <namit@vmware.com>, guojian@oppo.com, linux-riscv@lists.infradead.org, will@kernel.org, linux-s390@vger.kernel.org, zhangshiming@oppo.com, lipeifeng@oppo.com, corbet@lwn.net, x86@kernel.org, Mel Gorman <mgorman@suse.de>, linux-mips@vger.kernel.org, arnd@arndb.de, realmz6@gmail.com, Barry Song <v-songbaohua@oppo.com>, openrisc@lists.librecores.org, darren@os.amperecomputing.com, linux-arm-kernel@lists.infradead.org, xhao@linux.alibaba.com, linux-kernel@vger.kernel.org, huzhanyuan@oppo.com, Yicong Yang <yangyicong@huawei.com>, akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 10/28/22 03:25, Barry Song wrote:
> On Fri, Oct 28, 2022 at 3:19 AM Punit Agrawal
> <punit.agrawal@bytedance.com> wrote:
>>
>> [ Apologies for chiming in late in the conversation ]
>>
>> Anshuman Khandual <anshuman.khandual@arm.com> writes:
>>
>>> On 9/28/22 05:53, Barry Song wrote:
>>>> On Tue, Sep 27, 2022 at 10:15 PM Yicong Yang <yangyicong@huawei.com> wrote:
>>>>> On 2022/9/27 14:16, Anshuman Khandual wrote:
>>>>>> [...]
>>>>>>
>>>>>> On 9/21/22 14:13, Yicong Yang wrote:
>>>>>>> +static inline bool arch_tlbbatch_should_defer(struct mm_struct *mm)
>>>>>>> +{
>>>>>>> +    /* for small systems with small number of CPUs, TLB shootdown is cheap */
>>>>>>> +    if (num_online_cpus() <= 4)
>>>>>> It would be great to have some more inputs from others, whether 4 (which should
>>>>>> to be codified into a macro e.g ARM64_NR_CPU_DEFERRED_TLB, or something similar)
>>>>>> is optimal for an wide range of arm64 platforms.
>>>>>>
>>>> I have tested it on a 4-cpus and 8-cpus machine. but i have no machine
>>>> with 5,6,7
>>>> cores.
>>>> I saw improvement on 8-cpus machines and I found 4-cpus machines don't need
>>>> this patch.
>>>>
>>>> so it seems safe to have
>>>> if (num_online_cpus()  < 8)
>>>>
>>>>> Do you prefer this macro to be static or make it configurable through kconfig then
>>>>> different platforms can make choice based on their own situations? It maybe hard to
>>>>> test on all the arm64 platforms.
>>>> Maybe we can have this default enabled on machines with 8 and more cpus and
>>>> provide a tlbflush_batched = on or off to allow users enable or
>>>> disable it according
>>>> to their hardware and products. Similar example: rodata=on or off.
>>> No, sounds bit excessive. Kernel command line options should not be added
>>> for every possible run time switch options.
>>>
>>>> Hi Anshuman, Will,  Catalin, Andrew,
>>>> what do you think about this approach?
>>>>
>>>> BTW, haoxin mentioned another important user scenarios for tlb bach on arm64:
>>>> https://lore.kernel.org/lkml/393d6318-aa38-01ed-6ad8-f9eac89bf0fc@linux.alibaba.com/
>>>>
>>>> I do believe we need it based on the expensive cost of tlb shootdown in arm64
>>>> even by hardware broadcast.
>>> Alright, for now could we enable ARCH_WANT_BATCHED_UNMAP_TLB_FLUSH selectively
>>> with CONFIG_EXPERT and for num_online_cpus()  > 8 ?
>> When running the test program in the commit in a VM, I saw benefits from
>> the patches at all sizes from 2, 4, 8, 32 vcpus. On the test machine,
>> ptep_clear_flush() went from ~1% in the unpatched version to not showing
>> up.
>>
>> Yicong mentioned that he didn't see any benefit for <= 4 CPUs but is
>> there any overhead? I am wondering what are the downsides of enabling
>> the config by default.
> As we are deferring tlb flush, but sometimes while we are modifying the vma
> which are deferred, we need to do a sync by flush_tlb_batched_pending() in
> mprotect() , madvise() to make sure they can see the flushed result. if nobody
> is doing mprotect(), madvise() etc in the deferred period, the overhead is zero.

Right, it is difficult to justify this overhead for smaller systems,
which for sure would not benefit from this batched TLB framework.
