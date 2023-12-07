Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 36EEA80891A
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Dec 2023 14:24:35 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=salutedevices.com header.i=@salutedevices.com header.a=rsa-sha256 header.s=mail header.b=HTDxvcMc;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SmFNw4rWpz3dBW
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Dec 2023 00:24:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=salutedevices.com header.i=@salutedevices.com header.a=rsa-sha256 header.s=mail header.b=HTDxvcMc;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=salutedevices.com (client-ip=37.18.73.165; helo=mx1.sberdevices.ru; envelope-from=gnstark@salutedevices.com; receiver=lists.ozlabs.org)
Received: from mx1.sberdevices.ru (mx1.sberdevices.ru [37.18.73.165])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SmFN44jF1z3cR3
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 Dec 2023 00:23:47 +1100 (AEDT)
Received: from p-infra-ksmg-sc-msk01 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 4CCF3100004;
	Thu,  7 Dec 2023 16:23:43 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 4CCF3100004
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1701955423;
	bh=WiU1wKfzajMFrVfE3jVxhFLS8wmSs3n/pU96rWGNPGg=;
	h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type:From;
	b=HTDxvcMcsuO7aYfZ6vq7/NGVI0gMn7T5vIyE3TuEE5L4L+GFTTPKIi3xaq390O/op
	 iv1kI39hsnc9v19nCQJUJY3FwJrIqtjLSdJ6RRN5mJynvTqDGrBHrlttPAqdQEdbt8
	 8LvYMIpCKcNDd3QB+EXa5GJCWjp4fpbN8DY1p2Ed/31g1JKH04z7YTEaGYXcsC+aN7
	 +QKK2mZExHeCf8T/8C7YTidvLXyMLFsYiIwKq86BJjHkfP0pqjXoT8MCPrmDCSBqYo
	 f1AmCrMIpc5uFNECKxW+EbROGFyjqLigFdvW9vAolDpXbGj53WWciAZy8ZKyi9u4KM
	 r1uDpH717rtDA==
Received: from p-i-exch-sc-m01.sberdevices.ru (p-i-exch-sc-m01.sberdevices.ru [172.16.192.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Thu,  7 Dec 2023 16:23:43 +0300 (MSK)
Received: from [192.168.1.127] (100.64.160.123) by
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Thu, 7 Dec 2023 16:23:42 +0300
Message-ID: <b4396086-e877-4def-ad10-7a0bc5f69ff9@salutedevices.com>
Date: Thu, 7 Dec 2023 16:24:03 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/10] devm-helpers: introduce devm_mutex_init
Content-Language: en-US
To: Christophe Leroy <christophe.leroy@csgroup.eu>, Andy Shevchenko
	<andy.shevchenko@gmail.com>
References: <20231204180603.470421-1-gnstark@salutedevices.com>
 <20231204180603.470421-2-gnstark@salutedevices.com>
 <81798fe5-f89e-482f-b0d0-674ccbfc3666@redhat.com>
 <29584eb6-fa10-4ce0-9fa3-0c409a582445@salutedevices.com>
 <17a9fede-30e8-4cd5-ae02-fe34e11f5c20@csgroup.eu>
 <be693688-2e82-4e1a-9ead-cf1513ee637b@csgroup.eu>
 <2a68534b-9e64-4d6e-8a49-eeab0889841b@salutedevices.com>
 <CAHp75Veyz-hMYPDEiCC1WJASGZ8N9pVef0foYJ0vBcW2VpfR+w@mail.gmail.com>
 <34060476-86e5-42fb-a139-6790487c1568@csgroup.eu>
 <57ea099a-8b88-4b16-9b54-b81e5b28bcb6@salutedevices.com>
 <08cf2729-78c4-44a3-ac3f-78c652a527ff@csgroup.eu>
From: George Stark <gnstark@salutedevices.com>
In-Reply-To: <08cf2729-78c4-44a3-ac3f-78c652a527ff@csgroup.eu>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) To
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 181938 [Dec 07 2023]
X-KSMG-AntiSpam-Version: 6.0.0.2
X-KSMG-AntiSpam-Envelope-From: gnstark@salutedevices.com
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 5 0.3.5 98d108ddd984cca1d7e65e595eac546a62b0144b, {Tracking_from_domain_doesnt_match_to}, p-i-exch-sc-m01.sberdevices.ru:7.1.1,5.0.1;127.0.0.199:7.1.2;salutedevices.com:7.1.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;100.64.160.123:7.1.2, FromAlignment: s, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2023/12/07 02:56:00 #22627289
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "vadimp@nvidia.com" <vadimp@nvidia.com>, "mazziesaccount@gmail.com" <mazziesaccount@gmail.com>, "peterz@infradead.org" <peterz@infradead.org>, "boqun.feng@gmail.com" <boqun.feng@gmail.com>, "lee@kernel.org" <lee@kernel.org>, "kernel@salutedevices.com" <kernel@salutedevices.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "npiggin@gmail.com" <npiggin@gmail.com>, Hans de Goede <hdegoede@redhat.com>, "mingo@redhat.com" <mingo@redhat.com>, "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>, "pavel@ucw.cz" <pavel@ucw.cz>, Waiman Long <longman@redhat.com>, "will@kernel.org" <will@kernel.org>, "jic23@kernel.org" <jic23@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 12/7/23 16:01, Christophe Leroy wrote:
> 
> 
> Le 07/12/2023 à 13:51, George Stark a écrit :
>>
>>
>> On 12/7/23 15:28, Christophe Leroy wrote:
>>>
>>>
>>> Le 07/12/2023 à 13:02, Andy Shevchenko a écrit :
>>>> On Thu, Dec 7, 2023 at 1:23 AM George Stark
>>>> <gnstark@salutedevices.com> wrote:
>>>>> On 12/7/23 01:37, Christophe Leroy wrote:
>>>>>> Le 06/12/2023 à 23:14, Christophe Leroy a écrit :
>>>>
>>>> ...
>>>>
>>>>>> Looking at it closer, I have the feeling that you want to do
>>>>>> similar to
>>>>>> devm_gpio_request() in linux/gpio.h :
>>>>>>
>>>>>> In linux/mutex.h, add a prototype for devm_mutex_init() when
>>>>>> CONFIG_DEBUG_MUTEXES is defined and an empty static inline otherwise.
>>>>>> Then define devm_mutex_init() in kernel/locking/mutex-debug.c
>>>>>
>>>>> Yes, this would be almost perfect decision. BTW just as in linux/gpio.h
>>>>> we wouldn't have to include whole "linux/device.h" into mutex.h, only
>>>>> add forward declaration of struct device;
>>>>
>>>> In case you place it into a C-file. Otherwise you need a header for
>>>> the API and that is not acceptable for mutex.h.
>>>>
>>>
>>> Right, that's the reason why I'm suggesting to define devm_mutex_init()
>>> in kernel/locking/mutex-debug.c.
>>>
>>> In linux/mutex.h, you define a stub for when CONFIG_DEBUG_MUTEXES is not
>>> set, and the prototype of devm_mutex_init() when CONFIG_DEBUG_MUTEXES is
>>> set.
>>
>> Something like this:
>>
>> diff --git a/include/linux/mutex.h b/include/linux/mutex.h
>> index a33aa9eb9fc3..4a6041a7fd44 100644
>> --- a/include/linux/mutex.h
>> +++ b/include/linux/mutex.h
>> @@ -21,6 +21,8 @@
>>    #include <linux/debug_locks.h>
>>    #include <linux/cleanup.h>
>>
>> +struct device;
>> +
>>    #ifdef CONFIG_DEBUG_LOCK_ALLOC
>>    # define __DEP_MAP_MUTEX_INITIALIZER(lockname)            \
>>            , .dep_map = {                    \
>> @@ -127,6 +129,20 @@ extern void __mutex_init(struct mutex *lock, const
>> char *name,
>>     */
>>    extern bool mutex_is_locked(struct mutex *lock);
>>
>> +#ifdef CONFIG_DEBUG_MUTEXES
> 
> There is already a CONFIG_DEBUG_MUTEXES block, can you re-use it ?

those CONFIG_DEBUG_MUTEXES blockd are declared before mutex_init macro :(

> 
>> +
>> +extern int devm_mutex_init(struct device *dev, struct mutex *lock);
> 
> 'extern' is pointless and deprecated for function prototypes.
> I know the kernel is full of them, but it is not a good reason to add
> new ones.

Ok

Sure I will send this patch in the right way and then we could have 
proper review but firstly I'd like to hear from Andy and mutex.h's 
maintainers is it acceptable at all?

> 
>> +
>> +#else
>> +
>> +static inline int devm_mutex_init(struct device *dev, struct mutex *lock)
>> +{
>> +    mutex_init(lock);
>> +    return 0;
>> +}
>> +
>> +#endif
>> +
>>    #else /* !CONFIG_PREEMPT_RT */
>>    /*
>>     * Preempt-RT variant based on rtmutexes.
>> @@ -169,6 +185,13 @@ do {                            \
>>                                \
>>        __mutex_init((mutex), #mutex, &__key);        \
>>    } while (0)
>> +
>> +static inline int devm_mutex_init(struct device *dev, struct mutex *lock)
>> +{
>> +    mutex_init(lock);
>> +    return 0;
>> +}
>> +
>>    #endif /* CONFIG_PREEMPT_RT */
>>
>>    /*
>> diff --git a/kernel/locking/mutex-debug.c b/kernel/locking/mutex-debug.c
>> index bc8abb8549d2..d50dfa06e82c 100644
>> --- a/kernel/locking/mutex-debug.c
>> +++ b/kernel/locking/mutex-debug.c
>> @@ -19,6 +19,7 @@
>>    #include <linux/kallsyms.h>
>>    #include <linux/interrupt.h>
>>    #include <linux/debug_locks.h>
>> +#include <linux/device.h>
>>
>>    #include "mutex.h"
>>
>> @@ -104,3 +105,25 @@ void mutex_destroy(struct mutex *lock)
>>    }
>>
>>    EXPORT_SYMBOL_GPL(mutex_destroy);
>> +
>> +static void devm_mutex_release(void *res)
>> +{
>> +    mutex_destroy(res);
>> +}
>> +
>> +/**
>> + * devm_mutex_init - Resource-managed mutex initialization
>> + * @dev:    Device which lifetime mutex is bound to
>> + * @lock:    Pointer to a mutex
>> + *
>> + * Initialize mutex which is automatically destroyed when the driver is
>> detached.
>> + *
>> + * Returns: 0 on success or a negative error code on failure.
>> + */
>> +int devm_mutex_init(struct device *dev, struct mutex *lock)
>> +{
>> +    mutex_init(lock);
>> +    return devm_add_action_or_reset(dev, devm_mutex_release, lock);
>> +}
>> +
>> +EXPORT_SYMBOL_GPL(devm_mutex_init);
>> \ No newline at end of file
>>
>>

-- 
Best regards
George
