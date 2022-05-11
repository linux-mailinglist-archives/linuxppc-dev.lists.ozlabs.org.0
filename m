Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 53AAE522E87
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 May 2022 10:37:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KypDq1yRyz3cM7
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 May 2022 18:37:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=huawei.com (client-ip=45.249.212.255; helo=szxga08-in.huawei.com;
 envelope-from=xiujianfeng@huawei.com; receiver=<UNKNOWN>)
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KypDQ28XFz3bWt
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 May 2022 18:36:54 +1000 (AEST)
Received: from dggpeml500023.china.huawei.com (unknown [172.30.72.57])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4KypBw1B6dz1JC74;
 Wed, 11 May 2022 16:35:36 +0800 (CST)
Received: from [10.67.110.112] (10.67.110.112) by
 dggpeml500023.china.huawei.com (7.185.36.114) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Wed, 11 May 2022 16:36:48 +0800
Subject: Re: [PATCH -next] powerpc: add support for syscall stack randomization
To: Kees Cook <keescook@chromium.org>, Nicholas Piggin <npiggin@gmail.com>
References: <20220505111932.228814-1-xiujianfeng@huawei.com>
 <1652173338.7bltwybi0c.astroid@bobo.none> <202205100917.5480D91@keescook>
From: xiujianfeng <xiujianfeng@huawei.com>
Message-ID: <34b960b1-c0e3-19da-ae49-c709b837f2de@huawei.com>
Date: Wed, 11 May 2022 16:36:47 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <202205100917.5480D91@keescook>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.110.112]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
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
Cc: mark.rutland@arm.com, linux-kernel@vger.kernel.org, paulus@samba.org,
 linux-hardening@vger.kernel.org, tglx@linutronix.de,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


在 2022/5/11 0:19, Kees Cook 写道:
> On Tue, May 10, 2022 at 07:23:46PM +1000, Nicholas Piggin wrote:
>> Excerpts from Xiu Jianfeng's message of May 5, 2022 9:19 pm:
>>> Add support for adding a random offset to the stack while handling
>>> syscalls. This patch uses mftb() instead of get_random_int() for better
>>> performance.
>> Hey, very nice.
> Agreed! :)
>
>>> [...]
>>> @@ -82,6 +83,7 @@ notrace long system_call_exception(long r3, long r4, long r5,
>>>   
>>>   	kuap_lock();
>>>   
>>> +	add_random_kstack_offset();
>>>   	regs->orig_gpr3 = r3;
>>>   
>>>   	if (IS_ENABLED(CONFIG_PPC_IRQ_SOFT_MASK_DEBUG))
>> This looks like the right place. I wonder why other interrupts don't
>> get the same treatment. Userspace can induce the kernel to take a
>> synchronous interrupt, or wait for async ones. Smaller surface area
>> maybe but certain instruction emulation for example could result in
>> significant logic that depends on user state. Anyway that's for
>> hardening gurus to ponder.
> I welcome it being used for any userspace controllable entry to the
> kernel! :)
>
> Also, related, have you validated the result using the LKDTM test?
> See tools/testing/selftests/lkdtm/stack-entropy.sh

not yet, I tested it by printing the address of local variable 
directly,  will do before I send v2,

thanks.

>>> @@ -405,6 +407,7 @@ interrupt_exit_user_prepare_main(unsigned long ret, struct pt_regs *regs)
>>>   
>>>   	/* Restore user access locks last */
>>>   	kuap_user_restore(regs);
>>> +	choose_random_kstack_offset(mftb() & 0xFF);
>>>   
>>>   	return ret;
>>>   }
>> So this seems to be what x86 and s390 do, but why are we choosing a
>> new offset for every interrupt when it's only used on a syscall?
>> I would rather you do what arm64 does and just choose the offset
>> at the end of system_call_exception.
>>
>> I wonder why the choose is separated from the add? I guess it's to
>> avoid a data dependency for stack access on an expensive random
>> function, so that makes sense (a comment would be nice in the
>> generic code).
> How does this read? I can send a "real" patch if it looks good:
>
>
> diff --git a/include/linux/randomize_kstack.h b/include/linux/randomize_kstack.h
> index 1468caf001c0..ad3e80275c74 100644
> --- a/include/linux/randomize_kstack.h
> +++ b/include/linux/randomize_kstack.h
> @@ -40,8 +40,11 @@ DECLARE_PER_CPU(u32, kstack_offset);
>    */
>   #define KSTACK_OFFSET_MAX(x)	((x) & 0x3FF)
>   
> -/*
> - * These macros must be used during syscall entry when interrupts and
> +/**
> + * add_random_kstack_offset - Increase stack utilization by previously
> + *			      chosen random offset
> + *
> + * This should be used in the syscall entry path when interrupts and
>    * preempt are disabled, and after user registers have been stored to
>    * the stack.
>    */
> @@ -55,6 +58,24 @@ DECLARE_PER_CPU(u32, kstack_offset);
>   	}								\
>   } while (0)
>   
> +/**
> + * choose_random_kstack_offset - Choose the random offsset for the next
> + *				 add_random_kstack_offset()
> + *
> + * This should only be used during syscall exit when interrupts and
> + * preempt are disabled, and before user registers have been restored
> + * from the stack. This is done to frustrate attack attempts from
> + * userspace to learn the offset:
> + * - Maximize the timing uncertainty visible from userspace: if the
> + *   the offset is chosen at syscall entry, userspace has much more
> + *   control over the timing between chosen offsets. "How long will we
> + *   be in kernel mode?" tends to be more difficult to know than "how
> + *   long will be be in user mode?"
> + * - Reduce the lifetime of the new offset sitting in memory during
> + *   kernel mode execution. Exposures of "thread-local" (e.g. current,
> + *   percpu, etc) memory contents tends to be easier than arbitrary
> + *   location memory exposures.
> + */
>   #define choose_random_kstack_offset(rand) do {				\
>   	if (static_branch_maybe(CONFIG_RANDOMIZE_KSTACK_OFFSET_DEFAULT,	\
>   				&randomize_kstack_offset)) {		\
>
>
