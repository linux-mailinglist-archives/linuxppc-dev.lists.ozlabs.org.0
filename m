Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 726F484261E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jan 2024 14:23:40 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TPQpy2l9kz3cXl
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Jan 2024 00:23:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=45.249.212.190; helo=szxga04-in.huawei.com; envelope-from=tongtiangen@huawei.com; receiver=lists.ozlabs.org)
Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TPQpS4Kpsz3bqB
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 Jan 2024 00:23:09 +1100 (AEDT)
Received: from mail.maildlp.com (unknown [172.19.88.214])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4TPQm8519Qz29knY;
	Tue, 30 Jan 2024 21:21:12 +0800 (CST)
Received: from kwepemm600017.china.huawei.com (unknown [7.193.23.234])
	by mail.maildlp.com (Postfix) with ESMTPS id 574B81A016B;
	Tue, 30 Jan 2024 21:23:02 +0800 (CST)
Received: from [10.174.179.234] (10.174.179.234) by
 kwepemm600017.china.huawei.com (7.193.23.234) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 30 Jan 2024 21:23:00 +0800
Message-ID: <f10848f1-36d5-c954-2b55-d9cdaf5262bf@huawei.com>
Date: Tue, 30 Jan 2024 21:22:59 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v10 2/6] arm64: add support for machine check error safe
To: Mark Rutland <mark.rutland@arm.com>
References: <20240129134652.4004931-1-tongtiangen@huawei.com>
 <20240129134652.4004931-3-tongtiangen@huawei.com>
 <ZbflpQV7aVry0qPz@FVFF77S0Q05N>
 <eb78caf9-ac03-1030-4e32-b614e73c0f62@huawei.com>
 <Zbj0heg7eFukm_5Z@FVFF77S0Q05N>
From: Tong Tiangen <tongtiangen@huawei.com>
In-Reply-To: <Zbj0heg7eFukm_5Z@FVFF77S0Q05N>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.179.234]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemm600017.china.huawei.com (7.193.23.234)
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
Cc: wangkefeng.wang@huawei.com, Catalin Marinas <catalin.marinas@arm.com>, Dave Hansen <dave.hansen@linux.intel.com>, linux-mm@kvack.org, Andrey Ryabinin <ryabinin.a.a@gmail.com>, Alexander Potapenko <glider@google.com>, kasan-dev@googlegroups.com, "H. Peter Anvin" <hpa@zytor.com>, Vincenzo Frascino <vincenzo.frascino@arm.com>, Will Deacon <will@kernel.org>, x86@kernel.org, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Ingo Molnar <mingo@redhat.com>, linux-arm-kernel@lists.infradead.org, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>, Borislav Petkov <bp@alien8.de>, Alexander Viro <viro@zeniv.linux.org.uk>, Thomas Gleixner <tglx@linutronix.de>, Dmitry Vyukov <dvyukov@google.com>, Andrey Konovalov <andreyknvl@gmail.com>, linuxppc-dev@lists.ozlabs.org, Guohanjun <guohanjun@huawei.com>, linux-kernel@vger.kernel.org, James Morse <james.morse@arm.com>, Andrew Morton <akpm@linux-foundation.org>, Robin Murphy <robin.murphy@arm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



在 2024/1/30 21:07, Mark Rutland 写道:
> On Tue, Jan 30, 2024 at 06:57:24PM +0800, Tong Tiangen wrote:
>> 在 2024/1/30 1:51, Mark Rutland 写道:
>>> On Mon, Jan 29, 2024 at 09:46:48PM +0800, Tong Tiangen wrote:
> 
>>>> diff --git a/arch/arm64/mm/fault.c b/arch/arm64/mm/fault.c
>>>> index 55f6455a8284..312932dc100b 100644
>>>> --- a/arch/arm64/mm/fault.c
>>>> +++ b/arch/arm64/mm/fault.c
>>>> @@ -730,6 +730,31 @@ static int do_bad(unsigned long far, unsigned long esr, struct pt_regs *regs)
>>>>    	return 1; /* "fault" */
>>>>    }
>>>> +static bool arm64_do_kernel_sea(unsigned long addr, unsigned int esr,
>>>> +				     struct pt_regs *regs, int sig, int code)
>>>> +{
>>>> +	if (!IS_ENABLED(CONFIG_ARCH_HAS_COPY_MC))
>>>> +		return false;
>>>> +
>>>> +	if (user_mode(regs))
>>>> +		return false;
>>>
>>> This function is called "arm64_do_kernel_sea"; surely the caller should *never*
>>> call this for a SEA taken from user mode?
>>
>> In do_sea(), the processing logic is as follows:
>>    do_sea()
>>    {
>>      [...]
>>      if (user_mode(regs) && apei_claim_sea(regs) == 0) {
>>         return 0;
>>      }
>>      [...]
>>      //[1]
>>      if (!arm64_do_kernel_sea()) {
>>         arm64_notify_die();
>>      }
>>    }
>>
>> [1] user_mode() is still possible to go here,If user_mode() goes here,
>>   it indicates that the impact caused by the memory error cannot be
>>   processed correctly by apei_claim_sea().
>>
>>
>> In this case, only arm64_notify_die() can be used, This also maintains
>> the original logic of user_mode()'s processing.
> 
> My point is that either:
> 
> (a) The name means that this should *only* be called for SEAs from a kernel
>      context, and the caller should be responsible for ensuring that.
> 
> (b) The name is misleading, and the 'kernel' part should be removed from the
>      name.
> 
> I prefer (a), and if you head down that route it's clear that you can get rid
> of a bunch of redundant logic and remove the need for do_kernel_sea(), anyway,
> e.g.
> 
> | static int do_sea(unsigned long far, unsigned long esr, struct pt_regs *regs)
> | {
> |         const struct fault_info *inf = esr_to_fault_info(esr);
> |         bool claimed = apei_claim_sea(regs) == 0;
> |         unsigned long siaddr;
> |
> |         if (claimed) {
> |                 if (user_mode(regs)) {
> |                         /*
> |                          * APEI claimed this as a firmware-first notification.
> |                          * Some processing deferred to task_work before ret_to_user().
> |                          */
> |                         return 0;
> |                 } else {
> |                         /*
> |                          * TODO: explain why this is correct.
> |                          */
> |                         if ((current->flags & PF_KTHREAD) &&
> |                             fixup_exception_mc(regs))
> |                                 return 0;
> |                 }
> |         }

This code seems to be a bit more concise and avoids misleading function 
names, which I'll use in the next version:）

> |
> |         if (esr & ESR_ELx_FnV) {
> |                 siaddr = 0;
> |         } else {
> |                 /*
> |                  * The architecture specifies that the tag bits of FAR_EL1 are
> |                  * UNKNOWN for synchronous external aborts. Mask them out now
> |                  * so that userspace doesn't see them.
> |                  */
> |                 siaddr  = untagged_addr(far);
> |         }
> |         arm64_notify_die(inf->name, regs, inf->sig, inf->code, siaddr, esr);
> |
> |         return 0;
> | }
> 
>>>> +
>>>> +	if (apei_claim_sea(regs) < 0)
>>>> +		return false;
>>>> +
>>>> +	if (!fixup_exception_mc(regs))
>>>> +		return false;
>>>> +
>>>> +	if (current->flags & PF_KTHREAD)
>>>> +		return true;
>>>
>>> I think this needs a comment; why do we allow kthreads to go on, yet kill user
>>> threads? What about helper threads (e.g. for io_uring)?
>>
>> If a memroy error occurs in the kernel thread, the problem is more
>> serious than that of the user thread. As a result, related kernel
>> functions, such as khugepaged, cannot run properly. kernel panic should
>> be a better choice at this time.
>>
>> Therefore, the processing scope of this framework is limited to the user
>> thread.
> 
> That's reasonable, but needs to be explained in a comment.
> 
> Also, as above, I think you haven't conisderd helper threads (e.g. io_uring),
> which don't have PF_KTHREAD set but do have PF_USER_WORKER set. I suspect those
> need the same treatment as kthreads.

Okay, I'm going to investigate PF_USER_WORKER.

> 
>>>> +	set_thread_esr(0, esr);
>>>
>>> Why do we set the ESR to 0?
>>
>> The purpose is to reuse the logic of arm64_notify_die() and set the
>> following parameters before sending signals to users:
>>    current->thread.fault_address = 0;
>>    current->thread.fault_code = err;
> 
> Ok, but there's no need to open-code that.
> 
> As per my above example, please continue to use the existing call to
> arm64_notify_die() rather than open-coding bits of it.

OK.

Many thanks.
Tong.
> 
> Mark.
> .
