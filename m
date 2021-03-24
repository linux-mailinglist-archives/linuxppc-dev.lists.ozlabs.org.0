Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F7D9346F22
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Mar 2021 02:59:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F4ry20bM2z3bqf
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Mar 2021 12:59:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=huawei.com (client-ip=45.249.212.191; helo=szxga05-in.huawei.com;
 envelope-from=heying24@huawei.com; receiver=<UNKNOWN>)
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F4rxh6RC3z302K
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Mar 2021 12:58:44 +1100 (AEDT)
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4F4rtb1krZzPlZk;
 Wed, 24 Mar 2021 09:56:07 +0800 (CST)
Received: from [10.67.110.136] (10.67.110.136) by
 DGGEMS412-HUB.china.huawei.com (10.3.19.212) with Microsoft SMTP Server id
 14.3.498.0; Wed, 24 Mar 2021 09:58:34 +0800
Subject: Re: [PATCH v2 -next] powerpc: kernel/time.c - cleanup warnings
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
References: <20210323091257.90054-1-heying24@huawei.com>
 <YFppJkpZRHMJFay0@piout.net>
From: "heying (H)" <heying24@huawei.com>
Message-ID: <ceeb191e-7aaf-6f02-5d5b-d6b2e8dc4948@huawei.com>
Date: Wed, 24 Mar 2021 09:58:35 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YFppJkpZRHMJFay0@piout.net>
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
 npiggin@gmail.com, paulus@samba.org, kernelfans@gmail.com, tglx@linutronix.de,
 msuchanek@suse.de, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Dear,


ÔÚ 2021/3/24 6:18, Alexandre Belloni Ð´µÀ:
> Hello,
>
> On 23/03/2021 05:12:57-0400, He Ying wrote:
>> We found these warnings in arch/powerpc/kernel/time.c as follows:
>> warning: symbol 'decrementer_max' was not declared. Should it be static?
>> warning: symbol 'rtc_lock' was not declared. Should it be static?
>> warning: symbol 'dtl_consumer' was not declared. Should it be static?
>>
>> Declare 'decrementer_max' and 'rtc_lock' in powerpc asm/time.h.
>> Rename 'rtc_lock' in drviers/rtc/rtc-vr41xx.c to 'vr41xx_rtc_lock' to
>> avoid the conflict with the variable in powerpc asm/time.h.
>> Move 'dtl_consumer' definition behind "include <asm/dtl.h>" because it
>> is declared there.
>>
>> Reported-by: Hulk Robot <hulkci@huawei.com>
>> Signed-off-by: He Ying <heying24@huawei.com>
>> ---
>> v2:
>> - Instead of including linux/mc146818rtc.h in powerpc kernel/time.c, declare
>>    rtc_lock in powerpc asm/time.h.
>>
> V1 was actually the correct thing to do. rtc_lock is there exactly
> because chrp and maple are using mc146818 compatible RTCs. This is then
> useful because then drivers/char/nvram.c is enabled. The proper fix
> would be to scrap all of that and use rtc-cmos for those platforms as
> this drives the RTC properly and exposes the NVRAM for the mc146818.

Do you mean that 'rtc_lock' declared in linux/mc146818rtc.h points to

same thing as that defined in powerpc kernel/time.c? And you think V1

was correct? Oh, I should have added you to my patch V1 senders:)

>
> Or at least, if there are no users for the char/nvram driver on those
> two platforms, remove the spinlock and stop enabling CONFIG_NVRAM or
> more likely rename the symbol as it seems to be abused by both chrp and
> powermac.
>
> I'm not completely against the rename in vr41xxx but the fix for the
> warnings can and should be contained in arch/powerpc.

Yes, I agree with you. But I have no choice because there is a compiling 
error.

Maybe there's a better way.

So, what about my patch V1? Should I resend it and add you to senders?


Thanks.

