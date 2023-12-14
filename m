Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B6FC813088
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Dec 2023 13:49:14 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=salutedevices.com header.i=@salutedevices.com header.a=rsa-sha256 header.s=mail header.b=EjoAk9t3;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SrXGv5yflz3dLL
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Dec 2023 23:49:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=salutedevices.com header.i=@salutedevices.com header.a=rsa-sha256 header.s=mail header.b=EjoAk9t3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=salutedevices.com (client-ip=45.89.224.132; helo=mx1.sberdevices.ru; envelope-from=gnstark@salutedevices.com; receiver=lists.ozlabs.org)
Received: from mx1.sberdevices.ru (mx2.sberdevices.ru [45.89.224.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SrXG43Yy7z3cLQ
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Dec 2023 23:48:23 +1100 (AEDT)
Received: from p-infra-ksmg-sc-msk02 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 2BE86120006;
	Thu, 14 Dec 2023 15:48:19 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 2BE86120006
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1702558099;
	bh=u+Z5N++7kSFY5F/c2vJ7dRETDl74LEfCFys2YGreP0U=;
	h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type:From;
	b=EjoAk9t3ili75t5nFo1YFyObpi37mVffM2APXHrDL7UCttExpyNB7Q79fDnLYD8K9
	 g6gvOsiXawD2nktGF7NhcGA1xfX8GcszTJWfHYYeGz2v2QBMz1JvPqrU18bY0hJ8M3
	 CC11DtjBWbEdbczxzUtpBugN0iEE98f+al793cKa7EaCzSoXt9Ck1lIjZ3yTmqMo84
	 4e6ec79vYEtt412a62fqqvhGIIZ/lUeN5wue8GxK7p5LwGZxJGMqHt/+Cd/sGoszx+
	 rK2lRlUlxlf+GRbzgNCJ2dUNAbg5CviwmAtq2dUPz0MeXuL+5O+J+egZCQN2qFH6Qx
	 AZIJQx/FS38Qg==
Received: from smtp.sberdevices.ru (p-i-exch-sc-m01.sberdevices.ru [172.16.192.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Thu, 14 Dec 2023 15:48:18 +0300 (MSK)
Received: from [192.168.1.143] (100.64.160.123) by
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Thu, 14 Dec 2023 15:48:18 +0300
Message-ID: <99882775-af52-49ea-b17d-f3d1f23f8bbe@salutedevices.com>
Date: Thu, 14 Dec 2023 15:48:18 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 03/11] devm-helpers: introduce devm_mutex_init
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
	"andy.shevchenko@gmail.com" <andy.shevchenko@gmail.com>, "pavel@ucw.cz"
	<pavel@ucw.cz>, "lee@kernel.org" <lee@kernel.org>, "vadimp@nvidia.com"
	<vadimp@nvidia.com>, "mpe@ellerman.id.au" <mpe@ellerman.id.au>,
	"npiggin@gmail.com" <npiggin@gmail.com>, "hdegoede@redhat.com"
	<hdegoede@redhat.com>, "mazziesaccount@gmail.com" <mazziesaccount@gmail.com>,
	"peterz@infradead.org" <peterz@infradead.org>, "mingo@redhat.com"
	<mingo@redhat.com>, "will@kernel.org" <will@kernel.org>, "longman@redhat.com"
	<longman@redhat.com>, "boqun.feng@gmail.com" <boqun.feng@gmail.com>,
	"nikitos.tr@gmail.com" <nikitos.tr@gmail.com>
References: <20231213223020.2713164-1-gnstark@salutedevices.com>
 <20231213223020.2713164-4-gnstark@salutedevices.com>
 <80881d5d-3ae9-4580-84c1-f25b421cc518@csgroup.eu>
Content-Language: en-US
From: George Stark <gnstark@salutedevices.com>
In-Reply-To: <80881d5d-3ae9-4580-84c1-f25b421cc518@csgroup.eu>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) To
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 182110 [Dec 14 2023]
X-KSMG-AntiSpam-Version: 6.1.0.3
X-KSMG-AntiSpam-Envelope-From: gnstark@salutedevices.com
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 7 0.3.7 6d6bf5bd8eea7373134f756a2fd73e9456bb7d1a, {Tracking_uf_ne_domains}, {Tracking_from_domain_doesnt_match_to}, lore.kernel.org:7.1.1;100.64.160.123:7.1.2;smtp.sberdevices.ru:5.0.1,7.1.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;salutedevices.com:7.1.1;127.0.0.199:7.1.2, FromAlignment: s, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean, bases: 2023/12/14 09:55:00
X-KSMG-LinksScanning: Clean, bases: 2023/12/14 09:55:00
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2023/12/14 10:50:00 #22693095
X-KSMG-AntiVirus-Status: Clean, skipped
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
Cc: "kernel@salutedevices.com" <kernel@salutedevices.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello Christophe

On 12/14/23 13:06, Christophe Leroy wrote:
> 
> 
...
> 
> So you abandonned the idea of using mutex.h ?

I'm not the one who make a choice here. The patch [1] you're talking 
about was seen by everyone but it seems like no one had shown interest.
For me personally approach with #define mutex_destroy is not very usual
but if even slight mixing device with mutex.h is unacceptable what else
can we do? Avoiding the need to allocate devm slot for empty 
mutex_destroy is more important.

Should I make series #4 with the patch [1] to give it a last chance?

[1] 
https://lore.kernel.org/lkml/377e4437-7051-4d88-ae68-1460bcd692e1@redhat.com/T/#m3f6df30ffccaccb1df4669a327f349164f572931


> I can't see the point to spread mutex functions into devm-helpers.h
> 
> Adding a mutex_destroy macro for this purpose looks odd. And if someone
> defines a new version of mutex_destroy() and forget the macro, it will
> go undetected.
> 
> Usually macros of that type serve the purpose of defining a fallback
> when the macro is not defined. In that case, when someone adds a new
> version without defining the macro, it gets detected because if
> conflicts with the fallback.
> But in your case it works the other way round, so I will just go undetected.
> 
> For me the best solution remains to use mutex.h and have
> devm_mutex_init() defined or declared at the same place as mutex_destroy().
> 


> 
>>
>> Signed-off-by: George Stark <gnstark@salutedevices.com>
>> ---
>>    include/linux/devm-helpers.h | 27 +++++++++++++++++++++++++++
>>    1 file changed, 27 insertions(+)
>>
>> diff --git a/include/linux/devm-helpers.h b/include/linux/devm-helpers.h
>> index 74891802200d..4043c3481d2e 100644
>> --- a/include/linux/devm-helpers.h
>> +++ b/include/linux/devm-helpers.h
>> @@ -24,6 +24,7 @@
>>     */
>>
>>    #include <linux/device.h>
>> +#include <linux/mutex.h>
>>    #include <linux/workqueue.h>
>>
>>    static inline void devm_delayed_work_drop(void *res)
>> @@ -76,4 +77,30 @@ static inline int devm_work_autocancel(struct device *dev,
>>           return devm_add_action(dev, devm_work_drop, w);
>>    }
>>
>> +#ifdef mutex_destroy
>> +static inline void devm_mutex_release(void *res)
>> +{
>> +       mutex_destroy(res);
>> +}
>> +#endif
>> +
>> +/**
>> + * devm_mutex_init - Resource-managed mutex initialization
>> + * @dev:       Device which lifetime mutex is bound to
>> + * @lock:      Pointer to a mutex
>> + *
>> + * Initialize mutex which is automatically destroyed when the driver is detached.
>> + *
>> + * Returns: 0 on success or a negative error code on failure.
>> + */
>> +static inline int devm_mutex_init(struct device *dev, struct mutex *lock)
>> +{
>> +       mutex_init(lock);
>> +#ifdef mutex_destroy
>> +       return devm_add_action_or_reset(dev, devm_mutex_release, lock);
>> +#else
>> +       return 0;
>> +#endif
>> +}
>> +
>>    #endif
>> --
>> 2.25.1
>>

-- 
Best regards
George
