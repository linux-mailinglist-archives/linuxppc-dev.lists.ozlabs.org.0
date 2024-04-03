Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D57A896468
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Apr 2024 08:14:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V8ZFl3fsGz3cN6
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Apr 2024 17:14:03 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=45.249.212.189; helo=szxga03-in.huawei.com; envelope-from=wangkefeng.wang@huawei.com; receiver=lists.ozlabs.org)
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V8ZFJ4qhwz2yhZ
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Apr 2024 17:13:37 +1100 (AEDT)
Received: from mail.maildlp.com (unknown [172.19.88.194])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4V8ZBg2jZLz1JB3c;
	Wed,  3 Apr 2024 14:11:23 +0800 (CST)
Received: from dggpemm100001.china.huawei.com (unknown [7.185.36.93])
	by mail.maildlp.com (Postfix) with ESMTPS id A9A6B1402C7;
	Wed,  3 Apr 2024 14:13:31 +0800 (CST)
Received: from [10.174.177.243] (10.174.177.243) by
 dggpemm100001.china.huawei.com (7.185.36.93) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 3 Apr 2024 14:13:30 +0800
Message-ID: <bcfe8e2e-7ca9-44a8-b6ea-f4d9d789cc10@huawei.com>
Date: Wed, 3 Apr 2024 14:13:30 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/7] arm64: mm: accelerate pagefault when
 VM_FAULT_BADACCESS
Content-Language: en-US
To: Suren Baghdasaryan <surenb@google.com>
References: <20240402075142.196265-1-wangkefeng.wang@huawei.com>
 <20240402075142.196265-3-wangkefeng.wang@huawei.com>
 <CAJuCfpGpKup6AOPY08p35S2S+D4ch5XjEB=FM-n9-kU8dZXS5Q@mail.gmail.com>
 <CAJuCfpHkrwPp0X65BuYS2SKAkWPJDMNWYPDO+Jr4SmuxoCEsZg@mail.gmail.com>
From: Kefeng Wang <wangkefeng.wang@huawei.com>
In-Reply-To: <CAJuCfpHkrwPp0X65BuYS2SKAkWPJDMNWYPDO+Jr4SmuxoCEsZg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.177.243]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggpemm100001.china.huawei.com (7.185.36.93)
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
Cc: x86@kernel.org, linux-s390@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>, linuxppc-dev@lists.ozlabs.org, Peter Zijlstra <peterz@infradead.org>, Catalin Marinas <catalin.marinas@arm.com>, Paul Walmsley <paul.walmsley@sifive.com>, Russell King <linux@armlinux.org.uk>, Nicholas Piggin <npiggin@gmail.com>, Dave Hansen <dave.hansen@linux.intel.com>, linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>, Andy Lutomirski <luto@kernel.org>, akpm@linux-foundation.org, Gerald Schaefer <gerald.schaefer@linux.ibm.com>, Will Deacon <will@kernel.org>, Alexander Gordeev <agordeev@linux.ibm.com>, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 2024/4/3 13:30, Suren Baghdasaryan wrote:
> On Tue, Apr 2, 2024 at 10:19 PM Suren Baghdasaryan <surenb@google.com> wrote:
>>
>> On Tue, Apr 2, 2024 at 12:53 AM Kefeng Wang <wangkefeng.wang@huawei.com> wrote:
>>>
>>> The vm_flags of vma already checked under per-VMA lock, if it is a
>>> bad access, directly set fault to VM_FAULT_BADACCESS and handle error,
>>> no need to lock_mm_and_find_vma() and check vm_flags again, the latency
>>> time reduce 34% in lmbench 'lat_sig -P 1 prot lat_sig'.
>>
>> The change makes sense to me. Per-VMA lock is enough to keep
>> vma->vm_flags stable, so no need to retry with mmap_lock.
>>
>>>
>>> Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
>>
>> Reviewed-by: Suren Baghdasaryan <surenb@google.com>
>>
>>> ---
>>>   arch/arm64/mm/fault.c | 4 +++-
>>>   1 file changed, 3 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/arch/arm64/mm/fault.c b/arch/arm64/mm/fault.c
>>> index 9bb9f395351a..405f9aa831bd 100644
>>> --- a/arch/arm64/mm/fault.c
>>> +++ b/arch/arm64/mm/fault.c
>>> @@ -572,7 +572,9 @@ static int __kprobes do_page_fault(unsigned long far, unsigned long esr,
>>>
>>>          if (!(vma->vm_flags & vm_flags)) {
>>>                  vma_end_read(vma);
>>> -               goto lock_mmap;
>>> +               fault = VM_FAULT_BADACCESS;
>>> +               count_vm_vma_lock_event(VMA_LOCK_SUCCESS);
>>
>> nit: VMA_LOCK_SUCCESS accounting here seems correct to me but
>> unrelated to the main change. Either splitting into a separate patch
>> or mentioning this additional fixup in the changelog would be helpful.
> 
> The above nit applies to all the patches after this one, so I won't
> comment on each one separately. If you decide to split or adjust the
> changelog please do that for each patch.

I will update the change log for each patch, thank for your review and 
suggestion.

> 
>>
>>> +               goto done;
>>>          }
>>>          fault = handle_mm_fault(vma, addr, mm_flags | FAULT_FLAG_VMA_LOCK, regs);
>>>          if (!(fault & (VM_FAULT_RETRY | VM_FAULT_COMPLETED)))
>>> --
>>> 2.27.0
>>>
