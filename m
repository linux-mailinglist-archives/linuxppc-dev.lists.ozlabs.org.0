Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B2B5A875069
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Mar 2024 14:40:40 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=iyeW1MaJ;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=iyeW1MaJ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tr9RV1YyHz3fCg
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Mar 2024 00:40:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=iyeW1MaJ;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=iyeW1MaJ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=longman@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tr9Qn2ZKBz2xTN
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 Mar 2024 00:40:00 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1709818795;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=112pI+gt3JMCgKzIzUNSwArv3bdYT5A5xYg70+5/nCY=;
	b=iyeW1MaJKCipOTrNCGF8ihsfL2rCwf3t9LvVXPZCT63bPJi8rj5LgxeD/gZEbZDsCRYCE1
	wpIcZm+geKCODSpOoV2ifj9XOGXlS8gOY4LYclyU2gWI0ko2ibVKxwNa4ocS8ocUfD4Q4u
	X4kOXjY5WVek389wM0uSEzAVYyoDZzY=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1709818795;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=112pI+gt3JMCgKzIzUNSwArv3bdYT5A5xYg70+5/nCY=;
	b=iyeW1MaJKCipOTrNCGF8ihsfL2rCwf3t9LvVXPZCT63bPJi8rj5LgxeD/gZEbZDsCRYCE1
	wpIcZm+geKCODSpOoV2ifj9XOGXlS8gOY4LYclyU2gWI0ko2ibVKxwNa4ocS8ocUfD4Q4u
	X4kOXjY5WVek389wM0uSEzAVYyoDZzY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-286-PhGOQ0k9Pra5YEfCRg8aGQ-1; Thu, 07 Mar 2024 08:39:50 -0500
X-MC-Unique: PhGOQ0k9Pra5YEfCRg8aGQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1EA19101A523;
	Thu,  7 Mar 2024 13:39:49 +0000 (UTC)
Received: from [10.22.17.9] (unknown [10.22.17.9])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5BB371C0653F;
	Thu,  7 Mar 2024 13:39:47 +0000 (UTC)
Message-ID: <3d95ab40-2df5-4988-87be-568a628a0561@redhat.com>
Date: Thu, 7 Mar 2024 08:39:46 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 02/10] locking/mutex: introduce devm_mutex_init
Content-Language: en-US
To: =?UTF-8?Q?Marek_Beh=C3=BAn?= <marek.behun@nic.cz>,
 George Stark <gnstark@salutedevices.com>
References: <20240307024034.1548605-1-gnstark@salutedevices.com>
 <20240307024034.1548605-3-gnstark@salutedevices.com>
 <20240307095639.b6utkbzr36liuu3p@kandell>
From: Waiman Long <longman@redhat.com>
In-Reply-To: <20240307095639.b6utkbzr36liuu3p@kandell>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.7
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

On 3/7/24 04:56, Marek Behún wrote:
> On Thu, Mar 07, 2024 at 05:40:26AM +0300, George Stark wrote:
>> Using of devm API leads to a certain order of releasing resources.
>> So all dependent resources which are not devm-wrapped should be deleted
>> with respect to devm-release order. Mutex is one of such objects that
>> often is bound to other resources and has no own devm wrapping.
>> Since mutex_destroy() actually does nothing in non-debug builds
>> frequently calling mutex_destroy() is just ignored which is safe for now
>> but wrong formally and can lead to a problem if mutex_destroy() will be
>> extended so introduce devm_mutex_init()
>>
>> Signed-off-by: George Stark <gnstark@salutedevices.com>
>> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
>> ---
>>   Hello Christophe. Hope you don't mind I put you SoB tag because you helped alot
>>   to make this patch happen.
>>
>>   include/linux/mutex.h        | 13 +++++++++++++
>>   kernel/locking/mutex-debug.c | 22 ++++++++++++++++++++++
>>   2 files changed, 35 insertions(+)
>>
>> diff --git a/include/linux/mutex.h b/include/linux/mutex.h
>> index f7611c092db7..9bcf72cb941a 100644
>> --- a/include/linux/mutex.h
>> +++ b/include/linux/mutex.h
>> @@ -22,6 +22,8 @@
>>   #include <linux/cleanup.h>
>>   #include <linux/mutex_types.h>
>>
>> +struct device;
>> +
>>   #ifdef CONFIG_DEBUG_LOCK_ALLOC
>>   # define __DEP_MAP_MUTEX_INITIALIZER(lockname)			\
>>   		, .dep_map = {					\
>> @@ -115,10 +117,21 @@ do {							\
>>
>>   #ifdef CONFIG_DEBUG_MUTEXES
>>
>> +int devm_mutex_init(struct device *dev, struct mutex *lock);
>>   void mutex_destroy(struct mutex *lock);
>>
>>   #else
>>
>> +static inline int devm_mutex_init(struct device *dev, struct mutex *lock)
>> +{
>> +	/*
>> +	 * since mutex_destroy is nop actually there's no need to register it
>> +	 * in devm subsystem.
>> +	 */
>> +	mutex_init(lock);
>> +	return 0;
>> +}
>> +
>>   static inline void mutex_destroy(struct mutex *lock) {}
>>
>>   #endif
>> diff --git a/kernel/locking/mutex-debug.c b/kernel/locking/mutex-debug.c
>> index bc8abb8549d2..c9efab1a8026 100644
>> --- a/kernel/locking/mutex-debug.c
>> +++ b/kernel/locking/mutex-debug.c
>> @@ -19,6 +19,7 @@
>>   #include <linux/kallsyms.h>
>>   #include <linux/interrupt.h>
>>   #include <linux/debug_locks.h>
>> +#include <linux/device.h>
>>
>>   #include "mutex.h"
>>
>> @@ -104,3 +105,24 @@ void mutex_destroy(struct mutex *lock)
>>   }
>>
>>   EXPORT_SYMBOL_GPL(mutex_destroy);
>> +
>> +static void devm_mutex_release(void *res)
>> +{
>> +	mutex_destroy(res);
>> +}
>> +
>> +/**
>> + * devm_mutex_init - Resource-managed mutex initialization
>> + * @dev:	Device which lifetime mutex is bound to
>> + * @lock:	Pointer to a mutex
>> + *
>> + * Initialize mutex which is automatically destroyed when the driver is detached.
>> + *
>> + * Returns: 0 on success or a negative error code on failure.
>> + */
>> +int devm_mutex_init(struct device *dev, struct mutex *lock)
>> +{
>> +	mutex_init(lock);
>> +	return devm_add_action_or_reset(dev, devm_mutex_release, lock);
>> +}
>> +EXPORT_SYMBOL_GPL(devm_mutex_init);
> Hi George,
>
> look at
> https://lore.kernel.org/lkml/7013bf9e-2663-4613-ae61-61872e81355b@redhat.com/
> where Matthew and Hans explain that devm_mutex_init needs to be a macro
> because of the static lockdep key.
>
> so this should be something like:
>
> static inline int __devm_mutex_init(struct device *dev, struct mutex *mutex,
> 				    const char *name,
> 				    struct lock_class_key *key)
> {
> 	__mutex_init(mutex, name, key);
> 	return devm_add_action_or_reset(dev, devm_mutex_release, mutex);
> }
>
> #define devm_mutex_init(dev, mutex)				\
> do {								\
> 	static struct lock_class_key __key;			\
> 								\
> 	__devm_mutex_init(dev, (mutex), #mutex, &__key);	\
> } while (0);
>
>
> Marek

Making devm_mutex_init() a function will make all the devm_mutex share 
the same lockdep key. Making it a macro will make each caller of 
devm_mutex_init() have a distinct lockdep key. It all depends on whether 
all the devm_mutexes have the same lock usage pattern or not and whether 
it is possible for one devm_mutex to be nested inside another. So either 
way can be fine depending on the mutex usage pattern. My suggestion is 
to use a function, if possible, unless it will cause a false positive 
lockdep splat as there is a limit on the maximum # of lockdep keys that 
can be used.

Cheers,
Longman

