Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DE59A3599DD
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Apr 2021 11:53:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FGtjw5PlCz3c0N
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Apr 2021 19:53:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=huawei.com (client-ip=45.249.212.191; helo=szxga05-in.huawei.com;
 envelope-from=weiyongjun1@huawei.com; receiver=<UNKNOWN>)
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FGtjc1nP8z2yYn
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Apr 2021 19:53:08 +1000 (AEST)
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4FGtfH4M5rzPnWd;
 Fri,  9 Apr 2021 17:50:15 +0800 (CST)
Received: from [10.174.178.48] (10.174.178.48) by smtp.huawei.com
 (10.3.19.202) with Microsoft SMTP Server id 14.3.498.0; Fri, 9 Apr 2021
 17:52:56 +0800
Subject: Re: [PATCH -next] [POWERPC] Rename get_property to of_get_property:
 use DEFINE_SPINLOCK() for spinlock
From: "weiyongjun (A)" <weiyongjun1@huawei.com>
To: Ye Bin <yebin10@huawei.com>, Benjamin Herrenschmidt
 <benh@kernel.crashing.org>
References: <20210409095148.2294319-1-yebin10@huawei.com>
 <4b0b16f3-bb06-3a90-5148-ea8302bb3a58@huawei.com>
Message-ID: <f63e20d1-7161-bb54-35cb-877ee747acaa@huawei.com>
Date: Fri, 9 Apr 2021 17:52:55 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <4b0b16f3-bb06-3a90-5148-ea8302bb3a58@huawei.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.178.48]
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
Cc: kernel-janitors@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, Hulk Robot <hulkci@huawei.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


Rename get_property to of_get_property: use DEFINE_SPINLOCK() for spinlock

^^^^^^^^^

Please fix the module name in the patch subject.


> spinlock can be initialized automatically with DEFINE_SPINLOCK()
>
>> rather than explicitly calling spin_lock_init().
>>
>> Reported-by: Hulk Robot <hulkci@huawei.com>
>> Signed-off-by: Ye Bin <yebin10@huawei.com>
>> ---
>>   drivers/macintosh/via-pmu-led.c | 4 +---
>>   1 file changed, 1 insertion(+), 3 deletions(-)
>>
>> diff --git a/drivers/macintosh/via-pmu-led.c 
>> b/drivers/macintosh/via-pmu-led.c
>> index ae067ab2373d..2502119cff42 100644
>> --- a/drivers/macintosh/via-pmu-led.c
>> +++ b/drivers/macintosh/via-pmu-led.c
>> @@ -27,7 +27,7 @@
>>   #include <linux/pmu.h>
>>   #include <asm/prom.h>
>>   -static spinlock_t pmu_blink_lock;
>> +static DEFINE_SPINLOCK(pmu_blink_lock);
>>   static struct adb_request pmu_blink_req;
>>   /* -1: no change, 0: request off, 1: request on */
>>   static int requested_change;
>> @@ -105,8 +105,6 @@ static int __init via_pmu_led_init(void)
>>           return -ENODEV;
>>       }
>>       of_node_put(dt);
>> -
>> -    spin_lock_init(&pmu_blink_lock);
>>       /* no outstanding req */
>>       pmu_blink_req.complete = 1;
>>       pmu_blink_req.done = pmu_req_done;
>>
