Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B7DFE5503A4
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 Jun 2022 11:19:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LQ9NC5DGVz3cFd
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 Jun 2022 19:19:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=45.249.212.188; helo=szxga02-in.huawei.com; envelope-from=tongtiangen@huawei.com; receiver=<UNKNOWN>)
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LQ9Mm0LdBz306r
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 18 Jun 2022 19:19:12 +1000 (AEST)
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.54])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4LQ9HY3JHWzBt0p;
	Sat, 18 Jun 2022 17:15:37 +0800 (CST)
Received: from kwepemm600017.china.huawei.com (7.193.23.234) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Sat, 18 Jun 2022 17:18:58 +0800
Received: from [10.174.179.234] (10.174.179.234) by
 kwepemm600017.china.huawei.com (7.193.23.234) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Sat, 18 Jun 2022 17:18:56 +0800
Message-ID: <4aa8b109-c79b-8da0-db89-85ca128f1049@huawei.com>
Date: Sat, 18 Jun 2022 17:18:55 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH -next v5 6/8] arm64: add support for machine check error
 safe
To: Mark Rutland <mark.rutland@arm.com>
References: <20220528065056.1034168-1-tongtiangen@huawei.com>
 <20220528065056.1034168-7-tongtiangen@huawei.com>
 <YqxBd9GfUHLWZWoh@FVFF77S0Q05N>
From: Tong Tiangen <tongtiangen@huawei.com>
In-Reply-To: <YqxBd9GfUHLWZWoh@FVFF77S0Q05N>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.179.234]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemm600017.china.huawei.com (7.193.23.234)
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
Cc: Kefeng Wang <wangkefeng.wang@huawei.com>, Dave Hansen <dave.hansen@linux.intel.com>, linux-mm@kvack.org, Paul Mackerras <paulus@samba.org>, Guohanjun <guohanjun@huawei.com>, Will Deacon <will@kernel.org>, "H . Peter Anvin" <hpa@zytor.com>, x86@kernel.org, Ingo
 Molnar <mingo@redhat.com>, Catalin
 Marinas <catalin.marinas@arm.com>, Xie XiuQi <xiexiuqi@huawei.com>, Borislav Petkov <bp@alien8.de>, Alexander
 Viro <viro@zeniv.linux.org.uk>, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org, Robin Murphy <robin.murphy@arm.com>, linux-kernel@vger.kernel.org, James Morse <james.morse@arm.com>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



在 2022/6/17 16:55, Mark Rutland 写道:
> On Sat, May 28, 2022 at 06:50:54AM +0000, Tong Tiangen wrote:
>> During the processing of arm64 kernel hardware memory errors(do_sea()), if
>> the errors is consumed in the kernel, the current processing is panic.
>> However, it is not optimal.
>>
>> Take uaccess for example, if the uaccess operation fails due to memory
>> error, only the user process will be affected, kill the user process
>> and isolate the user page with hardware memory errors is a better choice.
>>
>> This patch only enable machine error check framework, it add exception
>> fixup before kernel panic in do_sea() and only limit the consumption of
>> hardware memory errors in kernel mode triggered by user mode processes.
>> If fixup successful, panic can be avoided.
>>
>> Signed-off-by: Tong Tiangen <tongtiangen@huawei.com>
>> ---
>>   arch/arm64/Kconfig               |  1 +
>>   arch/arm64/include/asm/extable.h |  1 +
>>   arch/arm64/mm/extable.c          | 17 +++++++++++++++++
>>   arch/arm64/mm/fault.c            | 27 ++++++++++++++++++++++++++-
>>   4 files changed, 45 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
>> index aaeb70358979..a3b12ff0cd7f 100644
>> --- a/arch/arm64/Kconfig
>> +++ b/arch/arm64/Kconfig
>> @@ -19,6 +19,7 @@ config ARM64
>>   	select ARCH_ENABLE_SPLIT_PMD_PTLOCK if PGTABLE_LEVELS > 2
>>   	select ARCH_ENABLE_THP_MIGRATION if TRANSPARENT_HUGEPAGE
>>   	select ARCH_HAS_CACHE_LINE_SIZE
>> +	select ARCH_HAS_COPY_MC if ACPI_APEI_GHES
>>   	select ARCH_HAS_CURRENT_STACK_POINTER
>>   	select ARCH_HAS_DEBUG_VIRTUAL
>>   	select ARCH_HAS_DEBUG_VM_PGTABLE
>> diff --git a/arch/arm64/include/asm/extable.h b/arch/arm64/include/asm/extable.h
>> index 72b0e71cc3de..f80ebd0addfd 100644
>> --- a/arch/arm64/include/asm/extable.h
>> +++ b/arch/arm64/include/asm/extable.h
>> @@ -46,4 +46,5 @@ bool ex_handler_bpf(const struct exception_table_entry *ex,
>>   #endif /* !CONFIG_BPF_JIT */
>>   
>>   bool fixup_exception(struct pt_regs *regs);
>> +bool fixup_exception_mc(struct pt_regs *regs);
>>   #endif
>> diff --git a/arch/arm64/mm/extable.c b/arch/arm64/mm/extable.c
>> index 228d681a8715..c301dcf6335f 100644
>> --- a/arch/arm64/mm/extable.c
>> +++ b/arch/arm64/mm/extable.c
>> @@ -9,6 +9,7 @@
>>   
>>   #include <asm/asm-extable.h>
>>   #include <asm/ptrace.h>
>> +#include <asm/esr.h>
>>   
>>   static inline unsigned long
>>   get_ex_fixup(const struct exception_table_entry *ex)
>> @@ -76,3 +77,19 @@ bool fixup_exception(struct pt_regs *regs)
>>   
>>   	BUG();
>>   }
>> +
>> +bool fixup_exception_mc(struct pt_regs *regs)
>> +{
>> +	const struct exception_table_entry *ex;
>> +
>> +	ex = search_exception_tables(instruction_pointer(regs));
>> +	if (!ex)
>> +		return false;
>> +
>> +	/*
>> +	 * This is not complete, More Machine check safe extable type can
>> +	 * be processed here.
>> +	 */
>> +
>> +	return false;
>> +}
>> diff --git a/arch/arm64/mm/fault.c b/arch/arm64/mm/fault.c
>> index c5e11768e5c1..b262bd282a89 100644
>> --- a/arch/arm64/mm/fault.c
>> +++ b/arch/arm64/mm/fault.c
>> @@ -696,6 +696,29 @@ static int do_bad(unsigned long far, unsigned long esr, struct pt_regs *regs)
>>   	return 1; /* "fault" */
>>   }
>>   
>> +static bool arm64_do_kernel_sea(unsigned long addr, unsigned int esr,
>> +				     struct pt_regs *regs, int sig, int code)
>> +{
>> +	if (!IS_ENABLED(CONFIG_ARCH_HAS_COPY_MC))
>> +		return false;
>> +
>> +	if (user_mode(regs) || !current->mm)
>> +		return false;
> 
> What's the `!current->mm` check for?

At first, I considered that only user processes have the opportunity to 
recover when they trigger memory error.

But it seems that this restriction is unreasonable. When the kernel 
thread triggers memory error, it can also be recovered. for instance:

https://lore.kernel.org/linux-mm/20220527190731.322722-1-jiaqiyan@google.com/

And i think if(!current->mm) shoud be added below:

if(!current->mm) {
	set_thread_esr(0, esr);
	arm64_force_sig_fault(...);
}
return true;

> 
>> +
>> +	if (apei_claim_sea(regs) < 0)
>> +		return false;
>> +
>> +	if (!fixup_exception_mc(regs))
>> +		return false;
> 
> I thought we still wanted to signal the task in this case? Or do you expect to
> add that into `fixup_exception_mc()` ?

Yeah, here return false and will signal to task in do_sea() -> 
arm64_notify_die().

> 
>> +
>> +	set_thread_esr(0, esr);
> 
> Why are we not setting the address? Is that deliberate, or an oversight?

Here set fault_address to 0, i refer to the logic of arm64_notify_die().

void arm64_notify_die(...)
{
          if (user_mode(regs)) {
                  WARN_ON(regs != current_pt_regs());
                  current->thread.fault_address = 0;
                  current->thread.fault_code = err;

                  arm64_force_sig_fault(signo, sicode, far, str);
          } else {
                  die(str, regs, err);
          }
}

I don't know exactly why and do you know why arm64_notify_die() did this? :)

> 
>> +
>> +	arm64_force_sig_fault(sig, code, addr,
>> +		"Uncorrected hardware memory error in kernel-access\n");
> 
> I think the wording here is misleading since we don't expect to recover from
> accesses to kernel memory, and would be better as something like:
> 
> 	"Uncorrected memory error on access to user memory\n"

OK, agreed.

Thanks,
Tong.

> 
> Thanks,
> Mark.
> 
>> +
>> +	return true;
>> +}
>> +
>>   static int do_sea(unsigned long far, unsigned long esr, struct pt_regs *regs)
>>   {
>>   	const struct fault_info *inf;
>> @@ -721,7 +744,9 @@ static int do_sea(unsigned long far, unsigned long esr, struct pt_regs *regs)
>>   		 */
>>   		siaddr  = untagged_addr(far);
>>   	}
>> -	arm64_notify_die(inf->name, regs, inf->sig, inf->code, siaddr, esr);
>> +
>> +	if (!arm64_do_kernel_sea(siaddr, esr, regs, inf->sig, inf->code))
>> +		arm64_notify_die(inf->name, regs, inf->sig, inf->code, siaddr, esr);
>>   
>>   	return 0;
>>   }
>> -- 
>> 2.25.1
>>
> 
> .
