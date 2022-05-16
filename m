Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F4D7527E94
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 May 2022 09:30:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L1rW00pf0z3cCf
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 May 2022 17:30:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=huawei.com (client-ip=45.249.212.188; helo=szxga02-in.huawei.com;
 envelope-from=xiujianfeng@huawei.com; receiver=<UNKNOWN>)
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L1rVb1wTwz2ypD
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 May 2022 17:29:40 +1000 (AEST)
Received: from dggpeml500023.china.huawei.com (unknown [172.30.72.53])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4L1rTW2qhnzhZCc;
 Mon, 16 May 2022 15:28:47 +0800 (CST)
Received: from [10.67.110.112] (10.67.110.112) by
 dggpeml500023.china.huawei.com (7.185.36.114) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Mon, 16 May 2022 15:29:33 +0800
Subject: Re: [PATCH -next] powerpc: add support for syscall stack randomization
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin
 <npiggin@gmail.com>, <benh@kernel.crashing.org>,
 <christophe.leroy@csgroup.eu>, <mark.rutland@arm.com>, <paulus@samba.org>,
 <tglx@linutronix.de>
References: <20220505111932.228814-1-xiujianfeng@huawei.com>
 <1652173338.7bltwybi0c.astroid@bobo.none>
 <a1dcd50b-0819-df54-a963-ebb0551e3356@huawei.com>
 <87pmki7uwf.fsf@mpe.ellerman.id.au>
From: xiujianfeng <xiujianfeng@huawei.com>
Message-ID: <bf8abb20-0aca-24b2-0f24-bc977af1fa1c@huawei.com>
Date: Mon, 16 May 2022 15:29:33 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <87pmki7uwf.fsf@mpe.ellerman.id.au>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.110.112]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
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


在 2022/5/12 21:17, Michael Ellerman 写道:
> xiujianfeng <xiujianfeng@huawei.com> writes:
>> 在 2022/5/10 17:23, Nicholas Piggin 写道:
>>> Excerpts from Xiu Jianfeng's message of May 5, 2022 9:19 pm:
>>>> Add support for adding a random offset to the stack while handling
>>>> syscalls. This patch uses mftb() instead of get_random_int() for better
>>>> performance.
> ...
>>>> @@ -405,6 +407,7 @@ interrupt_exit_user_prepare_main(unsigned long ret, struct pt_regs *regs)
>>>>
>>>>    	/* Restore user access locks last */
>>>>    	kuap_user_restore(regs);
>>>> +	choose_random_kstack_offset(mftb() & 0xFF);
>>>>
>>>>    	return ret;
>>>>    }
>>> So this seems to be what x86 and s390 do, but why are we choosing a
>>> new offset for every interrupt when it's only used on a syscall?
>>> I would rather you do what arm64 does and just choose the offset
>>> at the end of system_call_exception.
>> thanks for you suggestion, will do in v2.
>>> I wonder why the choose is separated from the add? I guess it's to
>>> avoid a data dependency for stack access on an expensive random
>>> function, so that makes sense (a comment would be nice in the
>>> generic code).
>>>
>>> I don't actually know if mftb() is cheaper here than a RNG. It
>>> may not be conditioned all that well either. I would be tempted
>> #if defined(__powerpc64__) && (defined(CONFIG_PPC_CELL) ||
>> defined(CONFIG_E500))
>> #define mftb()          ({unsigned long rval;                           \
>>                           asm volatile(                                   \
>>                                   "90:    mfspr %0, %2;\n"                \
>> ASM_FTR_IFSET(                          \
>>                                           "97:    cmpwi %0,0;\n"          \
>>                                           "       beq- 90b;\n", "", %1)   \
>>                           : "=r" (rval) \
>>                           : "i" (CPU_FTR_CELL_TB_BUG), "i" (SPRN_TBRL) :
>> "cr0"); \
>>                           rval;})
>> #elif defined(CONFIG_PPC_8xx)
>> #define mftb()          ({unsigned long rval;   \
>>                           asm volatile("mftbl %0" : "=r" (rval)); rval;})
>> #else
>> #define mftb()          ({unsigned long rval;   \
>>                           asm volatile("mfspr %0, %1" : \
>>                                        "=r" (rval) : "i" (SPRN_TBRL));
>> rval;})
>> #endif /* !CONFIG_PPC_CELL */
>>
>> there are 3 implementations of mftb() in
>> arch/powerpc/include/asm/vdso/timebase.h,
>>
>> the last two cases have only one instruction, It's obviously cheaper
>> than get_random_int,
> Just because it's one instruction doesn't mean it's obviously cheaper.
> On some CPUs mftb takes 10s of cycles, and can also stall the pipeline.
>
> But looking at get_random_u32() it does look pretty complicated, it
> takes a lock and so on. It's also silly to call get_random_u32() for
> 4-bits of randomness.
>
> My initial impression was that mftb() is too predictable to be useful
> against a determined attacker. But looking closer I see that
> choose_random_kstack_offset() xor's the value we pass with the existing
> value. So that makes me less worried about using mftb().
>
> We could additionally call choose_random_kstack_offset(get_random_int())
> less regularly, eg. during context switch. But I guess that's too
> infrequent to actually make any difference.
>
> But limiting it to 4-bits of randomness seems insufficient. It seems
> like we should allow the full 6 (10) bits, and anyone turning this
> option on should probably also consider increasing their stack size.
>
> Also did you check the help text about stack-protector under
> HAVE_ARCH_RANDOMIZE_KSTACK_OFFSET?

thanks for your reminder, will disable stack-protector for interrupt.c 
in v2,

just like arm64 do.

>
> cheers
