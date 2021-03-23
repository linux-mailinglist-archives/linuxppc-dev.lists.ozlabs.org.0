Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 879923457B7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Mar 2021 07:22:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F4Lqv3wDyz3bcW
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Mar 2021 17:22:03 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=huawei.com (client-ip=45.249.212.191; helo=szxga05-in.huawei.com;
 envelope-from=heying24@huawei.com; receiver=<UNKNOWN>)
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F4LqY3Pnxz30Bt
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Mar 2021 17:21:44 +1100 (AEDT)
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4F4Ln22KhSzwPtR;
 Tue, 23 Mar 2021 14:19:34 +0800 (CST)
Received: from [10.67.110.136] (10.67.110.136) by
 DGGEMS411-HUB.china.huawei.com (10.3.19.211) with Microsoft SMTP Server id
 14.3.498.0; Tue, 23 Mar 2021 14:21:27 +0800
Subject: Re: [PATCH -next] powerpc: kernel/time.c - cleanup warnings
From: "heying (H)" <heying24@huawei.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>, <mpe@ellerman.id.au>,
 <benh@kernel.crashing.org>, <paulus@samba.org>, <npiggin@gmail.com>,
 <msuchanek@suse.de>, <peterz@infradead.org>, <geert+renesas@glider.be>,
 <kernelfans@gmail.com>, <frederic@kernel.org>
References: <20210317103438.177428-1-heying24@huawei.com>
 <3f4d196b-0a8e-d4c9-cabe-591f5916a2b9@csgroup.eu>
 <5ee06736-7fc4-7993-a8b5-042e1890a6de@huawei.com>
Message-ID: <c6908c07-1814-a7f8-5f48-a4c316fb567c@huawei.com>
Date: Tue, 23 Mar 2021 14:21:27 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <5ee06736-7fc4-7993-a8b5-042e1890a6de@huawei.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.110.136]
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Dear Christophe,


在 2021/3/18 10:28, heying (H) 写道:
>
> 在 2021/3/17 19:16, Christophe Leroy 写道:
>>
>>
>> Le 17/03/2021 à 11:34, He Ying a écrit :
>>> We found these warnings in arch/powerpc/kernel/time.c as follows:
>>> warning: symbol 'decrementer_max' was not declared. Should it be 
>>> static?
>>> warning: symbol 'rtc_lock' was not declared. Should it be static?
>>> warning: symbol 'dtl_consumer' was not declared. Should it be static?
>>>
>>> Declare 'decrementer_max' in arch/powerpc/include/asm/time.h. And 
>>> include
>>> proper header in which 'rtc_lock' is declared. Move 'dtl_consumer'
>>> definition behind "include <asm/dtl.h>" because 'dtl_consumer' is 
>>> declared
>>> there.
>>>
>>> Reported-by: Hulk Robot <hulkci@huawei.com>
>>> Signed-off-by: He Ying <heying24@huawei.com>
>>> ---
>>>   arch/powerpc/include/asm/time.h | 1 +
>>>   arch/powerpc/kernel/time.c      | 7 +++----
>>>   2 files changed, 4 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/arch/powerpc/include/asm/time.h 
>>> b/arch/powerpc/include/asm/time.h
>>> index 8dd3cdb25338..2cd2b50bedda 100644
>>> --- a/arch/powerpc/include/asm/time.h
>>> +++ b/arch/powerpc/include/asm/time.h
>>> @@ -22,6 +22,7 @@ extern unsigned long tb_ticks_per_jiffy;
>>>   extern unsigned long tb_ticks_per_usec;
>>>   extern unsigned long tb_ticks_per_sec;
>>>   extern struct clock_event_device decrementer_clockevent;
>>> +extern u64 decrementer_max;
>>>       extern void generic_calibrate_decr(void);
>>> diff --git a/arch/powerpc/kernel/time.c b/arch/powerpc/kernel/time.c
>>> index b67d93a609a2..409967713ca6 100644
>>> --- a/arch/powerpc/kernel/time.c
>>> +++ b/arch/powerpc/kernel/time.c
>>> @@ -55,6 +55,7 @@
>>>   #include <linux/sched/cputime.h>
>>>   #include <linux/sched/clock.h>
>>>   #include <linux/processor.h>
>>> +#include <linux/mc146818rtc.h>
>>
>> I don't think that's the good place. It has no link to powerpc, it is 
>> only by chance that it has the same name.
>>
>> As rtc_lock is defined in powerpc time.c, I think you should declare 
>> it in powerpc asm/time.h
>
> My first thought was the same as yours. I tried to add declaration in 
> powerpc asm/time.h, but got a compiling error:
>
> drivers/rtc/rtc-vr41xx.c:75:24: error: static declaration of 
> ‘rtc_lock’ follows non-static declaration
>  static DEFINE_SPINLOCK(rtc_lock);
>
> In file included from ./arch/powerpc/include/asm/delay.h:7:0,
>                  from ./arch/powerpc/include/asm/io.h:33,
>                  from ./include/linux/io.h:13,
>                  from drivers/rtc/rtc-vr41xx.c:11:
> ./arch/powerpc/include/asm/time.h:25:19: note: previous declaration of 
> ‘rtc_lock’ was here
>  extern spinlock_t rtc_lock;
>
> There's a conflict. Perhaps I can rename it in drivers/rtc/rtc-vr41xx.c.
>
>
> But I find an existing declaration in linux/mc146818rtc.h and there's 
> only one definition for 'rtc_lock' in powerpc.
>
> There's some includes of mc146818rtc.h in powperc. I wonder they point 
> to the same thing. But I'm not very sure
>
> because the header's name looks a bit strange.

How about including mc146818rtc.h in powperpc kernel/time.c? May I have 
your opinions please?


Thanks.


