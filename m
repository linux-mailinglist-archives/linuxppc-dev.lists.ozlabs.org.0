Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F0BED522E78
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 May 2022 10:34:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kyp9s6Wmhz3cMh
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 May 2022 18:34:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=huawei.com (client-ip=45.249.212.255; helo=szxga08-in.huawei.com;
 envelope-from=xiujianfeng@huawei.com; receiver=<UNKNOWN>)
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kyp9S50K6z3bc8
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 May 2022 18:34:20 +1000 (AEST)
Received: from dggpeml500023.china.huawei.com (unknown [172.30.72.54])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4Kyp7x3kN9z1JC6N;
 Wed, 11 May 2022 16:33:01 +0800 (CST)
Received: from [10.67.110.112] (10.67.110.112) by
 dggpeml500023.china.huawei.com (7.185.36.114) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Wed, 11 May 2022 16:34:13 +0800
Subject: Re: [PATCH -next] powerpc: add support for syscall stack randomization
To: Nicholas Piggin <npiggin@gmail.com>, <benh@kernel.crashing.org>,
 <christophe.leroy@csgroup.eu>, <mark.rutland@arm.com>, <mpe@ellerman.id.au>,
 <paulus@samba.org>, <tglx@linutronix.de>
References: <20220505111932.228814-1-xiujianfeng@huawei.com>
 <1652173338.7bltwybi0c.astroid@bobo.none>
From: xiujianfeng <xiujianfeng@huawei.com>
Message-ID: <a1dcd50b-0819-df54-a963-ebb0551e3356@huawei.com>
Date: Wed, 11 May 2022 16:34:13 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <1652173338.7bltwybi0c.astroid@bobo.none>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.110.112]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggpeml500023.china.huawei.com (7.185.36.114)
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-hardening@vger.kernel.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi,

在 2022/5/10 17:23, Nicholas Piggin 写道:
> Excerpts from Xiu Jianfeng's message of May 5, 2022 9:19 pm:
>> Add support for adding a random offset to the stack while handling
>> syscalls. This patch uses mftb() instead of get_random_int() for better
>> performance.
> Hey, very nice.
>
>> Signed-off-by: Xiu Jianfeng <xiujianfeng@huawei.com>
>> ---
>>   arch/powerpc/Kconfig            | 1 +
>>   arch/powerpc/kernel/interrupt.c | 3 +++
>>   2 files changed, 4 insertions(+)
>>
>> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
>> index 5fc9153927ac..7e04c9f80cbc 100644
>> --- a/arch/powerpc/Kconfig
>> +++ b/arch/powerpc/Kconfig
>> @@ -192,6 +192,7 @@ config PPC
>>   	select HAVE_ARCH_KASAN			if PPC32 && PPC_PAGE_SHIFT <= 14
>>   	select HAVE_ARCH_KASAN_VMALLOC		if PPC32 && PPC_PAGE_SHIFT <= 14
>>   	select HAVE_ARCH_KFENCE			if PPC_BOOK3S_32 || PPC_8xx || 40x
>> +	select HAVE_ARCH_RANDOMIZE_KSTACK_OFFSET
>>   	select HAVE_ARCH_KGDB
>>   	select HAVE_ARCH_MMAP_RND_BITS
>>   	select HAVE_ARCH_MMAP_RND_COMPAT_BITS	if COMPAT
>> diff --git a/arch/powerpc/kernel/interrupt.c b/arch/powerpc/kernel/interrupt.c
>> index 784ea3289c84..459385769721 100644
>> --- a/arch/powerpc/kernel/interrupt.c
>> +++ b/arch/powerpc/kernel/interrupt.c
>> @@ -4,6 +4,7 @@
>>   #include <linux/err.h>
>>   #include <linux/compat.h>
>>   #include <linux/sched/debug.h> /* for show_regs */
>> +#include <linux/randomize_kstack.h>
>>   
>>   #include <asm/kup.h>
>>   #include <asm/cputime.h>
>> @@ -82,6 +83,7 @@ notrace long system_call_exception(long r3, long r4, long r5,
>>   
>>   	kuap_lock();
>>   
>> +	add_random_kstack_offset();
>>   	regs->orig_gpr3 = r3;
>>   
>>   	if (IS_ENABLED(CONFIG_PPC_IRQ_SOFT_MASK_DEBUG))
> This looks like the right place. I wonder why other interrupts don't
> get the same treatment. Userspace can induce the kernel to take a
> synchronous interrupt, or wait for async ones. Smaller surface area
> maybe but certain instruction emulation for example could result in
> significant logic that depends on user state. Anyway that's for
> hardening gurus to ponder.
>
>> @@ -405,6 +407,7 @@ interrupt_exit_user_prepare_main(unsigned long ret, struct pt_regs *regs)
>>   
>>   	/* Restore user access locks last */
>>   	kuap_user_restore(regs);
>> +	choose_random_kstack_offset(mftb() & 0xFF);
>>   
>>   	return ret;
>>   }
> So this seems to be what x86 and s390 do, but why are we choosing a
> new offset for every interrupt when it's only used on a syscall?
> I would rather you do what arm64 does and just choose the offset
> at the end of system_call_exception.
thanks for you suggestion, will do in v2.
>
> I wonder why the choose is separated from the add? I guess it's to
> avoid a data dependency for stack access on an expensive random
> function, so that makes sense (a comment would be nice in the
> generic code).
>
> I don't actually know if mftb() is cheaper here than a RNG. It
> may not be conditioned all that well either. I would be tempted
#if defined(__powerpc64__) && (defined(CONFIG_PPC_CELL) || 
defined(CONFIG_E500))
#define mftb()          ({unsigned long rval;                           \
                         asm volatile(                                   \
                                 "90:    mfspr %0, %2;\n"                \
ASM_FTR_IFSET(                          \
                                         "97:    cmpwi %0,0;\n"          \
                                         "       beq- 90b;\n", "", %1)   \
                         : "=r" (rval) \
                         : "i" (CPU_FTR_CELL_TB_BUG), "i" (SPRN_TBRL) : 
"cr0"); \
                         rval;})
#elif defined(CONFIG_PPC_8xx)
#define mftb()          ({unsigned long rval;   \
                         asm volatile("mftbl %0" : "=r" (rval)); rval;})
#else
#define mftb()          ({unsigned long rval;   \
                         asm volatile("mfspr %0, %1" : \
                                      "=r" (rval) : "i" (SPRN_TBRL)); 
rval;})
#endif /* !CONFIG_PPC_CELL */

there are 3 implementations of mftb() in 
arch/powerpc/include/asm/vdso/timebase.h,

the last two cases have only one instruction, It's obviously cheaper 
than get_random_int,

do you mean the first one? It looks like cheaper too, or am I missing 
something?

> to measure. 64-bit *may* be able to use a bit more than 256
> bytes of stack too -- we have 16 byte alignment minimum so this
> gives only 4 bits of randomness AFAIKS.

KSTACK_OFFSET_MAX limits entropy to 10 bits, and THREAD_SHIFT is 14 for 
ppc64 and 13 for ppc32,

so can we just use 0x1FF for both or 0x1FF for 64bit and 0xFF for 32bit? 
what is your suggestion?

thanks.

>
> Thanks,
> Nick
> .
