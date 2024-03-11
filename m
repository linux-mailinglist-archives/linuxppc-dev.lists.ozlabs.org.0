Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 025DB878BA2
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Mar 2024 00:47:58 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=salutedevices.com header.i=@salutedevices.com header.a=rsa-sha256 header.s=mail header.b=kUGd/Eit;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TttkM5hT0z3dSn
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Mar 2024 10:47:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=salutedevices.com header.i=@salutedevices.com header.a=rsa-sha256 header.s=mail header.b=kUGd/Eit;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=salutedevices.com (client-ip=37.18.73.165; helo=mx1.sberdevices.ru; envelope-from=gnstark@salutedevices.com; receiver=lists.ozlabs.org)
Received: from mx1.sberdevices.ru (mx1.sberdevices.ru [37.18.73.165])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tttjc3sZYz3cL0
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Mar 2024 10:47:15 +1100 (AEDT)
Received: from p-infra-ksmg-sc-msk01 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id A913B100003;
	Tue, 12 Mar 2024 02:47:11 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru A913B100003
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1710200831;
	bh=Pa66IBwvzBGllcyWAkcLqGTkzGujBA0CdWQmDoOQ6z8=;
	h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type:From;
	b=kUGd/Eit5W8/WgDh6DbWHmf+SfheVMD6l/bAdQqIeMC19lgbkp63ix6tBKc0YszUy
	 Usr05sfLudH2UBKyBfGLyFkWQzrWGVBttdbz8skVTgXOZuPNQNgXccoVnwxjRY5P1g
	 5uWxufPjI+20tPEZvuokbC5F4UyhwAP6CdC7hfT6noyX3LAp4P4AP78wqx6QGfDG3M
	 KOzlCXQOECIkTJX/8BGF5T0b1ygzG4nDlVUXDz78zg6cfLY0kEGoW3/EmZbAG6/A1M
	 M4L2FrtsG0uz5H/Wp2rIVzBav2/ZeYQzDQCAY1RieSTZDRZHVPNYuNxuRQmiltBuLK
	 NPnyoqItnIURQ==
Received: from smtp.sberdevices.ru (p-i-exch-sc-m02.sberdevices.ru [172.16.192.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Tue, 12 Mar 2024 02:47:11 +0300 (MSK)
Received: from [172.28.160.241] (100.64.160.123) by
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Tue, 12 Mar 2024 02:47:11 +0300
Message-ID: <cfceef12-883e-4593-9dca-50768acb1aa9@salutedevices.com>
Date: Tue, 12 Mar 2024 02:47:10 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 02/10] locking/mutex: introduce devm_mutex_init
Content-Language: en-US
To: =?UTF-8?Q?Marek_Beh=C3=BAn?= <marek.behun@nic.cz>, Waiman Long
	<longman@redhat.com>
References: <20240307024034.1548605-1-gnstark@salutedevices.com>
 <20240307024034.1548605-3-gnstark@salutedevices.com>
 <20240307095639.b6utkbzr36liuu3p@kandell>
 <3d95ab40-2df5-4988-87be-568a628a0561@redhat.com>
 <20240307174414.4059d7ee@dellmb>
From: George Stark <gnstark@salutedevices.com>
In-Reply-To: <20240307174414.4059d7ee@dellmb>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) To
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 183875 [Feb 29 2024]
X-KSMG-AntiSpam-Version: 6.1.0.3
X-KSMG-AntiSpam-Envelope-From: gnstark@salutedevices.com
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 7 0.3.7 6d6bf5bd8eea7373134f756a2fd73e9456bb7d1a, {Tracking_uf_ne_domains}, {Tracking_from_domain_doesnt_match_to}, FromAlignment: s, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean, bases: 2024/02/29 16:52:00
X-KSMG-LinksScanning: Clean, bases: 2024/02/29 16:52:00
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2024/02/29 19:21:00 #23899999
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
Cc: kabel@kernel.org, linuxppc-dev@lists.ozlabs.org, vadimp@nvidia.com, mazziesaccount@gmail.com, peterz@infradead.org, boqun.feng@gmail.com, lee@kernel.org, kernel@salutedevices.com, linux-kernel@vger.kernel.org, npiggin@gmail.com, hdegoede@redhat.com, andy.shevchenko@gmail.com, mingo@redhat.com, pavel@ucw.cz, nikitos.tr@gmail.com, will@kernel.org, linux-leds@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello Waiman, Marek

Thanks for the review.

I've never used lockdep for debug but it seems preferable to
keep that feature working. It could be look like this:


diff --git a/include/linux/mutex.h b/include/linux/mutex.h
index f7611c092db7..574f6de6084d 100644
--- a/include/linux/mutex.h
+++ b/include/linux/mutex.h
@@ -22,6 +22,8 @@
  #include <linux/cleanup.h>
  #include <linux/mutex_types.h>

+struct device;
+
  #ifdef CONFIG_DEBUG_LOCK_ALLOC
  # define __DEP_MAP_MUTEX_INITIALIZER(lockname)			\
  		, .dep_map = {					\
@@ -115,10 +117,31 @@ do {							\

  #ifdef CONFIG_DEBUG_MUTEXES

+int debug_devm_mutex_init(struct device *dev, struct mutex *lock);
+
+#define devm_mutex_init(dev, mutex)			\
+({							\
+	int ret;					\
+	mutex_init(mutex);				\
+	ret = debug_devm_mutex_init(dev, mutex);	\
+	ret;						\
+})
+
  void mutex_destroy(struct mutex *lock);

  #else

+/*
+* When CONFIG_DEBUG_MUTEXES is off mutex_destroy is just a nop so
+* there's no really need to register it in devm subsystem.
+*/
+#define devm_mutex_init(dev, mutex)			\
+({							\
+	typecheck(struct device *, dev);		\
+	mutex_init(mutex);				\
+	0;						\
+})
+
  static inline void mutex_destroy(struct mutex *lock) {}

  #endif
diff --git a/kernel/locking/mutex-debug.c b/kernel/locking/mutex-debug.c
index bc8abb8549d2..967a5367c79a 100644
--- a/kernel/locking/mutex-debug.c
+++ b/kernel/locking/mutex-debug.c
@@ -19,6 +19,7 @@
  #include <linux/kallsyms.h>
  #include <linux/interrupt.h>
  #include <linux/debug_locks.h>
+#include <linux/device.h>

  #include "mutex.h"

@@ -89,6 +90,16 @@ void debug_mutex_init(struct mutex *lock, const char 
*name,
  	lock->magic = lock;
  }

+static void devm_mutex_release(void *res)
+{
+	mutex_destroy(res);
+}
+
+int debug_devm_mutex_init(struct device *dev, struct mutex *lock)
+{
+	return devm_add_action_or_reset(dev, devm_mutex_release, lock);
+}
+
  /***
   * mutex_destroy - mark a mutex unusable
   * @lock: the mutex to be destroyed
-- 
2.25.1



And now I would drop the the refactoring patch with moving down 
mutex_destroy. devm block is big enough to be declared standalone.


On 3/7/24 19:44, Marek Behún wrote:
> On Thu, 7 Mar 2024 08:39:46 -0500
> Waiman Long <longman@redhat.com> wrote:
> 
>> On 3/7/24 04:56, Marek Behún wrote:
>>> On Thu, Mar 07, 2024 at 05:40:26AM +0300, George Stark wrote:
>>>> Using of devm API leads to a certain order of releasing resources.
>>>> So all dependent resources which are not devm-wrapped should be deleted
>>>> with respect to devm-release order. Mutex is one of such objects that
>>>> often is bound to other resources and has no own devm wrapping.
>>>> Since mutex_destroy() actually does nothing in non-debug builds
>>>> frequently calling mutex_destroy() is just ignored which is safe for now
>>>> but wrong formally and can lead to a problem if mutex_destroy() will be
>>>> extended so introduce devm_mutex_init()
>>>>
>>>> Signed-off-by: George Stark <gnstark@salutedevices.com>
>>>> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
>>>> ---
>>>>    Hello Christophe. Hope you don't mind I put you SoB tag because you helped alot
>>>>    to make this patch happen.
>>>>
>>>>    include/linux/mutex.h        | 13 +++++++++++++
>>>>    kernel/locking/mutex-debug.c | 22 ++++++++++++++++++++++
>>>>    2 files changed, 35 insertions(+)
>>>>
>>>> diff --git a/include/linux/mutex.h b/include/linux/mutex.h
>>>> index f7611c092db7..9bcf72cb941a 100644
>>>> --- a/include/linux/mutex.h
>>>> +++ b/include/linux/mutex.h
>>>> @@ -22,6 +22,8 @@
>>>>    #include <linux/cleanup.h>
>>>>    #include <linux/mutex_types.h>
>>>>
>>>> +struct device;
>>>> +
>>>>    #ifdef CONFIG_DEBUG_LOCK_ALLOC
>>>>    # define __DEP_MAP_MUTEX_INITIALIZER(lockname)			\
>>>>    		, .dep_map = {					\
>>>> @@ -115,10 +117,21 @@ do {							\
>>>>
>>>>    #ifdef CONFIG_DEBUG_MUTEXES
>>>>
>>>> +int devm_mutex_init(struct device *dev, struct mutex *lock);
>>>>    void mutex_destroy(struct mutex *lock);
>>>>
>>>>    #else
>>>>
>>>> +static inline int devm_mutex_init(struct device *dev, struct mutex *lock)
>>>> +{
>>>> +	/*
>>>> +	 * since mutex_destroy is nop actually there's no need to register it
>>>> +	 * in devm subsystem.
>>>> +	 */
>>>> +	mutex_init(lock);
>>>> +	return 0;
>>>> +}
>>>> +
>>>>    static inline void mutex_destroy(struct mutex *lock) {}
>>>>
>>>>    #endif
>>>> diff --git a/kernel/locking/mutex-debug.c b/kernel/locking/mutex-debug.c
>>>> index bc8abb8549d2..c9efab1a8026 100644
>>>> --- a/kernel/locking/mutex-debug.c
>>>> +++ b/kernel/locking/mutex-debug.c
>>>> @@ -19,6 +19,7 @@
>>>>    #include <linux/kallsyms.h>
>>>>    #include <linux/interrupt.h>
>>>>    #include <linux/debug_locks.h>
>>>> +#include <linux/device.h>
>>>>
>>>>    #include "mutex.h"
>>>>
>>>> @@ -104,3 +105,24 @@ void mutex_destroy(struct mutex *lock)
>>>>    }
>>>>
>>>>    EXPORT_SYMBOL_GPL(mutex_destroy);
>>>> +
>>>> +static void devm_mutex_release(void *res)
>>>> +{
>>>> +	mutex_destroy(res);
>>>> +}
>>>> +
>>>> +/**
>>>> + * devm_mutex_init - Resource-managed mutex initialization
>>>> + * @dev:	Device which lifetime mutex is bound to
>>>> + * @lock:	Pointer to a mutex
>>>> + *
>>>> + * Initialize mutex which is automatically destroyed when the driver is detached.
>>>> + *
>>>> + * Returns: 0 on success or a negative error code on failure.
>>>> + */
>>>> +int devm_mutex_init(struct device *dev, struct mutex *lock)
>>>> +{
>>>> +	mutex_init(lock);
>>>> +	return devm_add_action_or_reset(dev, devm_mutex_release, lock);
>>>> +}
>>>> +EXPORT_SYMBOL_GPL(devm_mutex_init);
>>> Hi George,
>>>
>>> look at
>>> https://lore.kernel.org/lkml/7013bf9e-2663-4613-ae61-61872e81355b@redhat.com/
>>> where Matthew and Hans explain that devm_mutex_init needs to be a macro
>>> because of the static lockdep key.
>>>
>>> so this should be something like:
>>>
>>> static inline int __devm_mutex_init(struct device *dev, struct mutex *mutex,
>>> 				    const char *name,
>>> 				    struct lock_class_key *key)
>>> {
>>> 	__mutex_init(mutex, name, key);
>>> 	return devm_add_action_or_reset(dev, devm_mutex_release, mutex);
>>> }
>>>
>>> #define devm_mutex_init(dev, mutex)				\
>>> do {								\
>>> 	static struct lock_class_key __key;			\
>>> 								\
>>> 	__devm_mutex_init(dev, (mutex), #mutex, &__key);	\
>>> } while (0);
>>>
>>>
>>> Marek
>>
>> Making devm_mutex_init() a function will make all the devm_mutex share
>> the same lockdep key. Making it a macro will make each caller of
>> devm_mutex_init() have a distinct lockdep key. It all depends on whether
>> all the devm_mutexes have the same lock usage pattern or not and whether
>> it is possible for one devm_mutex to be nested inside another. So either
>> way can be fine depending on the mutex usage pattern. My suggestion is
>> to use a function, if possible, unless it will cause a false positive
>> lockdep splat as there is a limit on the maximum # of lockdep keys that
>> can be used.
> 
> devm_mutex_init() should behave like other similar function
> initializing stuff with resource management. I.e. it should behave like
> mutex_init(), but with resource management.
> 
> mutex_init() is a macro generating static lockdep key for each instance,
> so devm_mutex_init() should also generate static lockdep key for each
> instance.
> 
> Marek

-- 
Best regards
George
