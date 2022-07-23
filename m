Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CA4857ED08
	for <lists+linuxppc-dev@lfdr.de>; Sat, 23 Jul 2022 11:23:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LqgpG3DrVz3cfd
	for <lists+linuxppc-dev@lfdr.de>; Sat, 23 Jul 2022 19:23:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.alibaba.com (client-ip=115.124.30.132; helo=out30-132.freemail.mail.aliyun.com; envelope-from=xhao@linux.alibaba.com; receiver=<UNKNOWN>)
Received: from out30-132.freemail.mail.aliyun.com (out30-132.freemail.mail.aliyun.com [115.124.30.132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Lqgnr5p6nz2yw7
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 23 Jul 2022 19:22:55 +1000 (AEST)
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R161e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018046059;MF=xhao@linux.alibaba.com;NM=1;PH=DS;RN=25;SR=0;TI=SMTPD_---0VK94Ta0_1658568166;
Received: from B-X3VXMD6M-2058.local(mailfrom:xhao@linux.alibaba.com fp:SMTPD_---0VK94Ta0_1658568166)
          by smtp.aliyun-inc.com;
          Sat, 23 Jul 2022 17:22:48 +0800
From: xhao@linux.alibaba.com
Subject: Re: [PATCH v2 0/4] mm: arm64: bring up BATCHED_UNMAP_TLB_FLUSH
To: Barry Song <21cnbao@gmail.com>, Yicong Yang <yangyicong@huawei.com>
References: <20220711034615.482895-1-21cnbao@gmail.com>
 <24f5e25b-3946-b92a-975b-c34688005398@linux.alibaba.com>
 <CAGsJ_4zjnmQV6LT3yo--K-qD-92=hBmgfK121=n-Y0oEFX8RnQ@mail.gmail.com>
 <8e603deb-7023-5de5-c958-8911971aec24@huawei.com>
 <CAGsJ_4x9hLbXGMU737SShZGS89_4zywyhvkcRfz3W5s_p7O1PA@mail.gmail.com>
Message-ID: <3ac4b1a3-8067-3edb-be4f-326e2a4943ed@linux.alibaba.com>
Date: Sat, 23 Jul 2022 17:22:45 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <CAGsJ_4x9hLbXGMU737SShZGS89_4zywyhvkcRfz3W5s_p7O1PA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
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
Reply-To: xhao@linux.alibaba.com
Cc: Linux Doc Mailing List <linux-doc@vger.kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Yicong Yang <yangyicong@hisilicon.com>, Linux-MM <linux-mm@kvack.org>, =?UTF-8?B?6YOt5YGl?= <guojian@oppo.com>, linux-riscv@lists.infradead.org, Will Deacon <will@kernel.org>, linux-s390@vger.kernel.org, =?UTF-8?B?5byg6K+X5piOKFNpbW9uIFpoYW5nKQ==?= <zhangshiming@oppo.com>, =?UTF-8?B?5p2O5Z+56ZSLKHdpbmsp?= <lipeifeng@oppo.com>, Jonathan Corbet <corbet@lwn.net>, x86 <x86@kernel.org>, linux-mips@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, real mz <realmz6@gmail.com>, openrisc@lists.librecores.org, Darren Hart <darren@os.amperecomputing.com>, LAK <linux-arm-kernel@lists.infradead.org>, LKML <linux-kernel@vger.kernel.org>, huzhanyuan@oppo.com, "tiantao \(H\)" <tiantao6@hisilicon.com>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On 7/20/22 7:18 PM, Barry Song wrote:
> On Tue, Jul 19, 2022 at 1:28 AM Yicong Yang <yangyicong@huawei.com> wrote:
>> On 2022/7/14 12:51, Barry Song wrote:
>>> On Thu, Jul 14, 2022 at 3:29 PM Xin Hao <xhao@linux.alibaba.com> wrote:
>>>> Hi barry.
>>>>
>>>> I do some test on Kunpeng arm64 machine use Unixbench.
>>>>
>>>> The test  result as below.
>>>>
>>>> One core, we can see the performance improvement above +30%.
>>> I am really pleased to see the 30%+ improvement on unixbench on single core.
>>>
>>>> ./Run -c 1 -i 1 shell1
>>>> w/o
>>>> System Benchmarks Partial Index              BASELINE RESULT INDEX
>>>> Shell Scripts (1 concurrent)                     42.4 5481.0 1292.7
>>>> ========
>>>> System Benchmarks Index Score (Partial Only)                         1292.7
>>>>
>>>> w/
>>>> System Benchmarks Partial Index              BASELINE RESULT INDEX
>>>> Shell Scripts (1 concurrent)                     42.4 6974.6 1645.0
>>>> ========
>>>> System Benchmarks Index Score (Partial Only)                         1645.0
>>>>
>>>>
>>>> But with whole cores, there have little performance degradation above -5%
>>> That is sad as we might get more concurrency between mprotect(), madvise(),
>>> mremap(), zap_pte_range() and the deferred tlbi.
>>>
>>>> ./Run -c 96 -i 1 shell1
>>>> w/o
>>>> Shell Scripts (1 concurrent)                  80765.5 lpm   (60.0 s, 1
>>>> samples)
>>>> System Benchmarks Partial Index              BASELINE RESULT INDEX
>>>> Shell Scripts (1 concurrent)                     42.4 80765.5 19048.5
>>>> ========
>>>> System Benchmarks Index Score (Partial Only)                        19048.5
>>>>
>>>> w
>>>> Shell Scripts (1 concurrent)                  76333.6 lpm   (60.0 s, 1
>>>> samples)
>>>> System Benchmarks Partial Index              BASELINE RESULT INDEX
>>>> Shell Scripts (1 concurrent)                     42.4 76333.6 18003.2
>>>> ========
>>>> System Benchmarks Index Score (Partial Only)                        18003.2
>>>>
>>>> ----------------------------------------------------------------------------------------------
>>>>
>>>>
>>>> After discuss with you, and do some changes in the patch.
>>>>
>>>> ndex a52381a680db..1ecba81f1277 100644
>>>> --- a/mm/rmap.c
>>>> +++ b/mm/rmap.c
>>>> @@ -727,7 +727,11 @@ void flush_tlb_batched_pending(struct mm_struct *mm)
>>>>           int flushed = batch >> TLB_FLUSH_BATCH_FLUSHED_SHIFT;
>>>>
>>>>           if (pending != flushed) {
>>>> +#ifdef CONFIG_ARCH_HAS_MM_CPUMASK
>>>>                   flush_tlb_mm(mm);
>>>> +#else
>>>> +               dsb(ish);
>>>> +#endif
>>>>
>>> i was guessing the problem might be flush_tlb_batched_pending()
>>> so i asked you to change this to verify my guess.
>>>
>> flush_tlb_batched_pending() looks like the critical path for this issue then the code
>> above can mitigate this.
>>
>> I cannot reproduce this on a 2P 128C Kunpeng920 server. The kernel is based on the
>> v5.19-rc6 and unixbench of version 5.1.3. The result of `./Run -c 128 -i 1 shell1` is:
>>        iter-1      iter-2     iter-3
>> w/o  17708.1     17637.1    17630.1
>> w    17766.0     17752.3    17861.7
>>
>> And flush_tlb_batched_pending()isn't the hot spot with the patch:
>>     7.00%  sh        [kernel.kallsyms]      [k] ptep_clear_flush
>>     4.17%  sh        [kernel.kallsyms]      [k] ptep_set_access_flags
>>     2.43%  multi.sh  [kernel.kallsyms]      [k] ptep_clear_flush
>>     1.98%  sh        [kernel.kallsyms]      [k] _raw_spin_unlock_irqrestore
>>     1.69%  sh        [kernel.kallsyms]      [k] next_uptodate_page
>>     1.66%  sort      [kernel.kallsyms]      [k] ptep_clear_flush
>>     1.56%  multi.sh  [kernel.kallsyms]      [k] ptep_set_access_flags
>>     1.27%  sh        [kernel.kallsyms]      [k] page_counter_cancel
>>     1.11%  sh        [kernel.kallsyms]      [k] page_remove_rmap
>>     1.06%  sh        [kernel.kallsyms]      [k] perf_event_alloc
>>
>> Hi Xin Hao,
>>
>> I'm not sure the test setup as well as the config is same with yours. (96C vs 128C
>> should not be the reason I think). Did you check that the 5% is a fluctuation or
>> not? It'll be helpful if more information provided for reproducing this issue.
>>
>> Thanks.
> I guess that is because  "./Run -c 1 -i 1 shell1" isn't an application
> stressed on
> memory. Hi Xin, in what kinds of configurations can we reproduce your test
> result?

Oh, my fault, I do the test is not based on the lastest upstream kernel, there maybe some impact here,
i will do a new test on the lastest kernel.

> As I suppose tlbbatch will mainly affect the performance of user scenarios
> which require memory page-out/page-in like reclaiming file/anon pages.
> "./Run -c 1 -i 1 shell1" on a system with sufficient free memory won't be
> affected by tlbbatch at all, I believe.
>
> Thanks
> Barry

-- 
Best Regards!
Xin Hao

