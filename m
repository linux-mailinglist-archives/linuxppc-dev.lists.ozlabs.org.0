Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C4AF656142A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Jun 2022 10:07:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LYWBv5Jb1z3dsG
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Jun 2022 18:07:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=45.249.212.188; helo=szxga02-in.huawei.com; envelope-from=xiujianfeng@huawei.com; receiver=<UNKNOWN>)
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LYWBS3NcPz3c8h
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Jun 2022 18:06:39 +1000 (AEST)
Received: from dggpeml500023.china.huawei.com (unknown [172.30.72.55])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4LYW6G0jM8zTgGS;
	Thu, 30 Jun 2022 16:03:02 +0800 (CST)
Received: from [10.67.110.112] (10.67.110.112) by
 dggpeml500023.china.huawei.com (7.185.36.114) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Thu, 30 Jun 2022 16:06:31 +0800
Subject: Re: [PATCH -next, v2] powerpc: add support for syscall stack
 randomization
To: Christophe Leroy <christophe.leroy@csgroup.eu>, "mpe@ellerman.id.au"
	<mpe@ellerman.id.au>, "benh@kernel.crashing.org" <benh@kernel.crashing.org>,
	"paulus@samba.org" <paulus@samba.org>, "npiggin@gmail.com"
	<npiggin@gmail.com>, "tglx@linutronix.de" <tglx@linutronix.de>,
	"mark.rutland@arm.com" <mark.rutland@arm.com>
References: <20220516073225.112875-1-xiujianfeng@huawei.com>
 <cfbfcbf8-0350-9b73-bacc-53effeb1f1f2@csgroup.eu>
From: xiujianfeng <xiujianfeng@huawei.com>
Message-ID: <50a540b6-1d36-c5f3-a01f-4da2706ec913@huawei.com>
Date: Thu, 30 Jun 2022 16:06:31 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <cfbfcbf8-0350-9b73-bacc-53effeb1f1f2@csgroup.eu>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.110.112]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-hardening@vger.kernel.org" <linux-hardening@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi,

在 2022/6/29 1:36, Christophe Leroy 写道:
>
> Le 16/05/2022 à 09:32, Xiu Jianfeng a écrit :
>> Add support for adding a random offset to the stack while handling
>> syscalls. This patch uses mftb() instead of get_random_int() for better
>> performance.
>>
>> In order to avoid unconditional stack canaries on syscall entry (due to
>> the use of alloca()), also disable stack protector to avoid triggering
>> needless checks and slowing down the entry path. As there is no general
>> way to control stack protector coverage with a function attribute, this
>> must be disabled at the compilation unit level.
>>
>> Signed-off-by: Xiu Jianfeng <xiujianfeng@huawei.com>
>>
> Did you see this patch generates sparse warnings ?
>
> See
> https://patchwork.ozlabs.org/project/linuxppc-dev/patch/20220516073225.112875-1-xiujianfeng@huawei.com/
>
> It is not directly related to this patch but that's worth a patch to fix it.

Thanks for your reminder, the fix patch is here:

https://lore.kernel.org/all/20220629060423.2515693-1-gongruiqi1@huawei.com/

>> ---
>> Changes in v2:
>>     -move choose choose_random_kstack_offset() to the end of system_call_exception
>>     -allow full 6 (10) bits of entropy
>>     -disable stack-protector for interrupt.c
>> ---
>>    arch/powerpc/Kconfig            |  1 +
>>    arch/powerpc/kernel/Makefile    |  7 +++++++
>>    arch/powerpc/kernel/interrupt.c | 19 ++++++++++++++++++-
>>    3 files changed, 26 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
>> index 98309eeae09c..2f0019a0054e 100644
>> --- a/arch/powerpc/Kconfig
>> +++ b/arch/powerpc/Kconfig
>> @@ -192,6 +192,7 @@ config PPC
>>    	select HAVE_ARCH_KASAN			if PPC32 && PPC_PAGE_SHIFT <= 14
>>    	select HAVE_ARCH_KASAN_VMALLOC		if PPC32 && PPC_PAGE_SHIFT <= 14
>>    	select HAVE_ARCH_KFENCE			if PPC_BOOK3S_32 || PPC_8xx || 40x
>> +	select HAVE_ARCH_RANDOMIZE_KSTACK_OFFSET
>>    	select HAVE_ARCH_KGDB
>>    	select HAVE_ARCH_MMAP_RND_BITS
>>    	select HAVE_ARCH_MMAP_RND_COMPAT_BITS	if COMPAT
>> diff --git a/arch/powerpc/kernel/Makefile b/arch/powerpc/kernel/Makefile
>> index 4ddd161aef32..5c5e85b8229b 100644
>> --- a/arch/powerpc/kernel/Makefile
>> +++ b/arch/powerpc/kernel/Makefile
>> @@ -40,6 +40,13 @@ CFLAGS_cputable.o += -DDISABLE_BRANCH_PROFILING
>>    CFLAGS_btext.o += -DDISABLE_BRANCH_PROFILING
>>    endif
>>    
>> +#ifdef CONFIG_RANDOMIZE_KSTACK_OFFSET
>> +# Remove stack protector to avoid triggering unneeded stack canary
>> +# checks due to randomize_kstack_offset.
>> +CFLAGS_REMOVE_interrupt.o = -fstack-protector -fstack-protector-strong
>> +CFLAGS_interrupt.o += -fno-stack-protector
>> +#endif
>> +
>>    obj-y				:= cputable.o syscalls.o \
>>    				   irq.o align.o signal_$(BITS).o pmc.o vdso.o \
>>    				   process.o systbl.o idle.o \
>> diff --git a/arch/powerpc/kernel/interrupt.c b/arch/powerpc/kernel/interrupt.c
>> index 784ea3289c84..d7cdcb6fc336 100644
>> --- a/arch/powerpc/kernel/interrupt.c
>> +++ b/arch/powerpc/kernel/interrupt.c
>> @@ -4,6 +4,7 @@
>>    #include <linux/err.h>
>>    #include <linux/compat.h>
>>    #include <linux/sched/debug.h> /* for show_regs */
>> +#include <linux/randomize_kstack.h>
>>    
>>    #include <asm/kup.h>
>>    #include <asm/cputime.h>
>> @@ -78,10 +79,12 @@ notrace long system_call_exception(long r3, long r4, long r5,
>>    				   long r6, long r7, long r8,
>>    				   unsigned long r0, struct pt_regs *regs)
>>    {
>> +	long ret;
>>    	syscall_fn f;
>>    
>>    	kuap_lock();
>>    
>> +	add_random_kstack_offset();
>>    	regs->orig_gpr3 = r3;
>>    
>>    	if (IS_ENABLED(CONFIG_PPC_IRQ_SOFT_MASK_DEBUG))
>> @@ -229,7 +232,21 @@ notrace long system_call_exception(long r3, long r4, long r5,
>>    		f = (void *)sys_call_table[r0];
>>    	}
>>    
>> -	return f(r3, r4, r5, r6, r7, r8);
>> +	ret = f(r3, r4, r5, r6, r7, r8);
>> +	/*
>> +	 * Ultimately, this value will get limited by KSTACK_OFFSET_MAX(),
>> +	 * so the maximum stack offset is 1k bytes(10 bits).
>> +	 *
>> +	 * The actual entropy will be further reduced by the compiler when
>> +	 * applying stack alignment constraints: the powerpc architecture
>> +	 * may have two kinds of stack alignment(16-bytes and 8-bytes).
>> +	 *
>> +	 * So the resulting 6 or 7 bits of entropy is seen in SP[9:4] or SP[9:3].
>> +	 *
>> +	 */
>> +	choose_random_kstack_offset(mftb());
>> +
>> +	return ret;
>>    }
>>    
>>    static notrace void booke_load_dbcr0(void)
