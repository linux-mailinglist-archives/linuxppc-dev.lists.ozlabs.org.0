Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id ED8013474F6
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Mar 2021 10:46:49 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F53Kg6Vnlz3bqf
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Mar 2021 20:46:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=huawei.com (client-ip=45.249.212.191; helo=szxga05-in.huawei.com;
 envelope-from=heying24@huawei.com; receiver=<UNKNOWN>)
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F53KK2h0Dz300J
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Mar 2021 20:46:26 +1100 (AEDT)
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4F53GF40qRzPll5;
 Wed, 24 Mar 2021 17:43:49 +0800 (CST)
Received: from [10.67.110.136] (10.67.110.136) by
 DGGEMS406-HUB.china.huawei.com (10.3.19.206) with Microsoft SMTP Server id
 14.3.498.0; Wed, 24 Mar 2021 17:46:19 +0800
Subject: Re: [PATCH V3 -next] powerpc: kernel/time.c - cleanup warnings
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
References: <20210324090939.143477-1-heying24@huawei.com>
 <YFsGYgdNH5HrlqDJ@piout.net>
From: "heying (H)" <heying24@huawei.com>
Message-ID: <18a8d444-f1a5-61e0-b9f2-f85c03d71686@huawei.com>
Date: Wed, 24 Mar 2021 17:46:19 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YFsGYgdNH5HrlqDJ@piout.net>
Content-Type: text/plain; charset="gbk"; format=flowed
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
Cc: linux-rtc@vger.kernel.org, a.zummo@towertech.it, geert+renesas@glider.be,
 peterz@infradead.org, frederic@kernel.org, linux-kernel@vger.kernel.org,
 npiggin@gmail.com, kernelfans@gmail.com, paulus@samba.org,
 geert@linux-m68k.org, tglx@linutronix.de, msuchanek@suse.de,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Dear Alexandre,


ÔÚ 2021/3/24 17:29, Alexandre Belloni Ð´µÀ:
> On 24/03/2021 05:09:39-0400, He Ying wrote:
>> We found these warnings in arch/powerpc/kernel/time.c as follows:
>> warning: symbol 'decrementer_max' was not declared. Should it be static?
>> warning: symbol 'rtc_lock' was not declared. Should it be static?
>> warning: symbol 'dtl_consumer' was not declared. Should it be static?
>>
>> Declare 'decrementer_max' in powerpc asm/time.h.
>> Include linux/mc146818rtc.h in powerpc kernel/time.c where 'rtc_lock'
>> is declared. And remove duplicated declaration of 'rtc_lock' in powerpc
>> platforms/chrp/time.c because it has included linux/mc146818rtc.h.
>> Move 'dtl_consumer' definition behind "include <asm/dtl.h>" because it
>> is declared there.
>>
>> Reported-by: Hulk Robot <hulkci@huawei.com>
>> Signed-off-by: He Ying <heying24@huawei.com>
>> ---
>> V2:
>> - Instead of including linux/mc146818rtc.h in powerpc kernel/time.c, declare
>>    rtc_lock in powerpc asm/time.h.
>> V3:
>> - Recover to V1, that is including linux/mc146818rtc.h in powerpc
>>    kernel/time.c. And remove duplicated declaration of 'rtc_lock' in powerpc
>>    platforms/chrp/time.c because it has included linux/mc146818rtc.h.
>>
>>   arch/powerpc/include/asm/time.h    | 1 +
>>   arch/powerpc/kernel/time.c         | 9 ++++-----
>>   arch/powerpc/platforms/chrp/time.c | 2 --
>>   3 files changed, 5 insertions(+), 7 deletions(-)
>>
>> diff --git a/arch/powerpc/include/asm/time.h b/arch/powerpc/include/asm/time.h
>> index 8dd3cdb25338..2cd2b50bedda 100644
>> --- a/arch/powerpc/include/asm/time.h
>> +++ b/arch/powerpc/include/asm/time.h
>> @@ -22,6 +22,7 @@ extern unsigned long tb_ticks_per_jiffy;
>>   extern unsigned long tb_ticks_per_usec;
>>   extern unsigned long tb_ticks_per_sec;
>>   extern struct clock_event_device decrementer_clockevent;
>> +extern u64 decrementer_max;
>>   
>>   
>>   extern void generic_calibrate_decr(void);
>> diff --git a/arch/powerpc/kernel/time.c b/arch/powerpc/kernel/time.c
>> index b67d93a609a2..ac81f043bf49 100644
>> --- a/arch/powerpc/kernel/time.c
>> +++ b/arch/powerpc/kernel/time.c
>> @@ -55,8 +55,9 @@
>>   #include <linux/sched/cputime.h>
>>   #include <linux/sched/clock.h>
>>   #include <linux/processor.h>
>> -#include <asm/trace.h>
>> +#include <linux/mc146818rtc.h>
> I'm fine with that but I really think my suggestion to make the rtc_lock
> local to the platforms was better because it is only used to synchronize
> between concurrent invocations of chrp_set_rtc_time or
> maple_set_rtc_time. The rtc core will never do that and the only case
> would be concurrent calls to rtc_ops.set_time and
> update_persistent_clock64 (which should also be removed at some point).

Many thanks for your suggestion. As you suggest, rtc_lock should be 
local to platforms.

Does it mean not only powerpc but also all other platforms should adapt 
this change?

It might be a big change. I have no idea if that's OK. What are other 
maintainers' opinions?


Thanks.


