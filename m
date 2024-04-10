Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8697089FE83
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Apr 2024 19:29:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VF8vY3WWyz3vfD
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Apr 2024 03:29:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ghiti.fr (client-ip=217.70.183.198; helo=relay6-d.mail.gandi.net; envelope-from=alex@ghiti.fr; receiver=lists.ozlabs.org)
X-Greylist: delayed 35747 seconds by postgrey-1.37 at boromir; Thu, 11 Apr 2024 03:28:51 AEST
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VF8v76yzQz2yst
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Apr 2024 03:28:47 +1000 (AEST)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 376E7C0004;
	Wed, 10 Apr 2024 17:28:36 +0000 (UTC)
Message-ID: <3493a2f4-9cae-4773-a6a1-2eeb2d23f0c8@ghiti.fr>
Date: Wed, 10 Apr 2024 19:28:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/7] riscv: mm: accelerate pagefault when badaccess
Content-Language: en-US
To: Kefeng Wang <wangkefeng.wang@huawei.com>, akpm@linux-foundation.org
References: <20240403083805.1818160-1-wangkefeng.wang@huawei.com>
 <20240403083805.1818160-6-wangkefeng.wang@huawei.com>
 <8fe1a53f-f031-4423-97e1-28d93d0cd59e@ghiti.fr>
 <ac978061-ce1a-40a4-8b0a-61883b42bea7@huawei.com>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <ac978061-ce1a-40a4-8b0a-61883b42bea7@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Sasl: alex@ghiti.fr
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
Cc: x86@kernel.org, linux-s390@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>, linuxppc-dev@lists.ozlabs.org, Peter Zijlstra <peterz@infradead.org>, Catalin Marinas <catalin.marinas@arm.com>, Paul Walmsley <paul.walmsley@sifive.com>, Russell King <linux@armlinux.org.uk>, surenb@google.com, Dave Hansen <dave.hansen@linux.intel.com>, linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>, Nicholas Piggin <npiggin@gmail.com>, Andy Lutomirski <luto@kernel.org>, Alexander Gordeev <agordeev@linux.ibm.com>, Will Deacon <will@kernel.org>, Gerald Schaefer <gerald.schaefer@linux.ibm.com>, linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 10/04/2024 10:07, Kefeng Wang wrote:
>
>
> On 2024/4/10 15:32, Alexandre Ghiti wrote:
>> Hi Kefeng,
>>
>> On 03/04/2024 10:38, Kefeng Wang wrote:
>>> The access_error() of vma already checked under per-VMA lock, if it
>>> is a bad access, directly handle error, no need to retry with mmap_lock
>>> again. Since the page faut is handled under per-VMA lock, count it as
>>> a vma lock event with VMA_LOCK_SUCCESS.
>>>
>>> Reviewed-by: Suren Baghdasaryan <surenb@google.com>
>>> Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
>>> ---
>>>   arch/riscv/mm/fault.c | 5 ++++-
>>>   1 file changed, 4 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/arch/riscv/mm/fault.c b/arch/riscv/mm/fault.c
>>> index 3ba1d4dde5dd..b3fcf7d67efb 100644
>>> --- a/arch/riscv/mm/fault.c
>>> +++ b/arch/riscv/mm/fault.c
>>> @@ -292,7 +292,10 @@ void handle_page_fault(struct pt_regs *regs)
>>>       if (unlikely(access_error(cause, vma))) {
>>>           vma_end_read(vma);
>>> -        goto lock_mmap;
>>> +        count_vm_vma_lock_event(VMA_LOCK_SUCCESS);
>>> +        tsk->thread.bad_cause = SEGV_ACCERR;
>>
>>
>> I think we should use the cause variable here instead of SEGV_ACCERR, 
>> as bad_cause is a riscv internal status which describes the real 
>> fault that happened.
>
> Oh, I see, it is exception causes on riscv, so it should be
>
> diff --git a/arch/riscv/mm/fault.c b/arch/riscv/mm/fault.c
> index b3fcf7d67efb..5224f3733802 100644
> --- a/arch/riscv/mm/fault.c
> +++ b/arch/riscv/mm/fault.c
> @@ -293,8 +293,8 @@ void handle_page_fault(struct pt_regs *regs)
>         if (unlikely(access_error(cause, vma))) {
>                 vma_end_read(vma);
>                 count_vm_vma_lock_event(VMA_LOCK_SUCCESS);
> -               tsk->thread.bad_cause = SEGV_ACCERR;
> -               bad_area_nosemaphore(regs, code, addr);
> +               tsk->thread.bad_cause = cause;
> +               bad_area_nosemaphore(regs, SEGV_ACCERR, addr);
>                 return;
>         }
>
> Hi Alex, could you help to check it?
>
> Hi Andrew, please help to squash it after Alex ack it.
>
> Thanks both.


So I have just tested Kefeng's fixup on my usual CI and with a simple 
program that triggers such bad access, everything went fine so with the 
fixup applied:

Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
Tested-by: Alexandre Ghiti <alexghiti@rivosinc.com>

Thanks,

Alex



>
>
>>
>> Thanks,
>>
>> Alex
>>
>>
>>> +        bad_area_nosemaphore(regs, code, addr);
>>> +        return;
>>>       }
>>>       fault = handle_mm_fault(vma, addr, flags | 
>>> FAULT_FLAG_VMA_LOCK, regs);
