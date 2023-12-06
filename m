Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 492168079FD
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Dec 2023 22:03:07 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=BhGer3Z8;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=IdejeKfu;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SlqcS5gl7z3cV1
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Dec 2023 08:03:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=BhGer3Z8;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=IdejeKfu;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=longman@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SlqbY16Wjz2xdR
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Dec 2023 08:02:15 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1701896532;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yHW20tuEOrmNp4P41P/HLfeGuZPZFZ5btUUMCBjAyAo=;
	b=BhGer3Z86GXC+Tnl+fTXl52r3JXYI66KRdkrD7hfeQr19pu9KBzdsquAnNx3Gv+W+r6Rjd
	wzQvG9kHLuFc6WiQZWdbKqEIO8X8CydvoHVKG8sn2I6d7cSwMEkCQGgAEvDuUlGh1Pw5EX
	6GUdFivxhr4aYej8bLnQZ+JaXY69P4k=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1701896533;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yHW20tuEOrmNp4P41P/HLfeGuZPZFZ5btUUMCBjAyAo=;
	b=IdejeKfuAmbLBWE992qTb78Bjo78t/JICzCeIt1W3H1eVbpj22YscQhKT6NjvOajmRzxfv
	BXb/1jMEWw0cv3XqZP5HoS4UU5EM+w+YiCN73qXvjjZzr5ifdXaOadiQGz7Cy3+HRrxPHF
	YUVoc7xkOxwguaRKYJKh/xrNIztQASs=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-58-Tr0n8Aj5Or-lbiOYGgyS8w-1; Wed, 06 Dec 2023 16:02:07 -0500
X-MC-Unique: Tr0n8Aj5Or-lbiOYGgyS8w-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A252F8353F2;
	Wed,  6 Dec 2023 21:02:04 +0000 (UTC)
Received: from [10.22.34.92] (unknown [10.22.34.92])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B2EEB111E404;
	Wed,  6 Dec 2023 21:02:02 +0000 (UTC)
Message-ID: <469f44fb-2371-4b3b-bc1c-d09ec35a5ec8@redhat.com>
Date: Wed, 6 Dec 2023 16:02:02 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/10] devm-helpers: introduce devm_mutex_init
Content-Language: en-US
To: Hans de Goede <hdegoede@redhat.com>,
 George Stark <gnstark@salutedevices.com>, pavel@ucw.cz, lee@kernel.org,
 vadimp@nvidia.com, mpe@ellerman.id.au, npiggin@gmail.com,
 christophe.leroy@csgroup.eu, mazziesaccount@gmail.com,
 andy.shevchenko@gmail.com, jic23@kernel.org, peterz@infradead.org
References: <20231204180603.470421-1-gnstark@salutedevices.com>
 <20231204180603.470421-2-gnstark@salutedevices.com>
 <81798fe5-f89e-482f-b0d0-674ccbfc3666@redhat.com>
 <29584eb6-fa10-4ce0-9fa3-0c409a582445@salutedevices.com>
 <580ecff0-b335-4cc0-b928-a99fe73741ca@redhat.com>
From: Waiman Long <longman@redhat.com>
In-Reply-To: <580ecff0-b335-4cc0-b928-a99fe73741ca@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.3
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
Cc: kernel@salutedevices.com, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 12/6/23 14:55, Hans de Goede wrote:
> Hi,
>
> On 12/6/23 19:58, George Stark wrote:
>> Hello Hans
>>
>> Thanks for the review.
>>
>> On 12/6/23 18:01, Hans de Goede wrote:
>>> Hi George,
>>>
>>> On 12/4/23 19:05, George Stark wrote:
>>>> Using of devm API leads to certain order of releasing resources.
>>>> So all dependent resources which are not devm-wrapped should be deleted
>>>> with respect to devm-release order. Mutex is one of such objects that
>>>> often is bound to other resources and has no own devm wrapping.
>>>> Since mutex_destroy() actually does nothing in non-debug builds
>>>> frequently calling mutex_destroy() is just ignored which is safe for now
>>>> but wrong formally and can lead to a problem if mutex_destroy() is
>>>> extended so introduce devm_mutex_init().
>>>>
>>>> Signed-off-by: George Stark <gnstark@salutedevices.com>
>>>> ---
>>>>    include/linux/devm-helpers.h | 18 ++++++++++++++++++
>>>>    1 file changed, 18 insertions(+)
>>>>
>>>> diff --git a/include/linux/devm-helpers.h b/include/linux/devm-helpers.h
>>>> index 74891802200d..2f56e476776f 100644
>>>> --- a/include/linux/devm-helpers.h
>>>> +++ b/include/linux/devm-helpers.h
>>>> @@ -76,4 +76,22 @@ static inline int devm_work_autocancel(struct device *dev,
>>>>        return devm_add_action(dev, devm_work_drop, w);
>>>>    }
>>>>    +static inline void devm_mutex_release(void *res)
>>>> +{
>>>> +    mutex_destroy(res);
>>>> +}
>>>> +
>>>> +/**
>>>> + * devm_mutex_init - Resource-managed mutex initialization
>>>> + * @dev:    Device which lifetime work is bound to
>>>> + * @lock:    Pointer to a mutex
>>>> + *
>>>> + * Initialize mutex which is automatically destroyed when driver is detached.
>>>> + */
>>>> +static inline int devm_mutex_init(struct device *dev, struct mutex *lock)
>>>> +{
>>>> +    mutex_init(lock);
>>>> +    return devm_add_action_or_reset(dev, devm_mutex_release, lock);
>>>> +}
>>>> +
>>>>    #endif
>>> mutex_destroy() only actually does anything if CONFIG_DEBUG_MUTEXES
>>> is set, otherwise it is an empty inline-stub.
>>>
>>> Adding a devres resource to the device just to call an empty inline
>>> stub which is a no-op seems like a waste of resources. IMHO it
>>> would be better to change this to:
>>>
>>> static inline int devm_mutex_init(struct device *dev, struct mutex *lock)
>>> {
>>>      mutex_init(lock);
>>> #ifdef CONFIG_DEBUG_MUTEXES
>>>      return devm_add_action_or_reset(dev, devm_mutex_release, lock);
>>> #else
>>>      return 0;
>>> #endif
>>> }
>>>
>>> To avoid the unnecessary devres allocation when
>>> CONFIG_DEBUG_MUTEXES is not set.
>> Honestly saying I don't like unnecessary devres allocation either but the proposed approach has its own price:
>>
>> 1) we'll have more than one place with branching if mutex_destroy is empty or not using  indirect condition. If suddenly mutex_destroy is extended for non-debug code (in upstream branch or e.g. by someone for local debug) than there'll be a problem.
>>
>> 2) If mutex_destroy is empty or not depends on CONFIG_PREEMPT_RT option too. When CONFIG_PREEMPT_RT is on mutex_destroy is always empty.
>>
>> As I see it only the mutex interface (mutex.h) has to say definitely if mutex_destroy must be called. Probably we could add some define to include/linux/mutex.h,like IS_MUTEX_DESTROY_REQUIRED and declare it near mutex_destroy definition itself.
> That (a  IS_MUTEX_DESTROY_REQUIRED define) is an interesting idea. Lets see for v3 if the mutex maintainers will accept that and if not then I guess we will just need to live with the unnecessary devres allocation.

The purpose of calling mutex_destroy() is to mark a mutex as being 
destroyed so that any subsequent call to mutex_lock/unlock will cause a 
warning to be printed when CONFIG_DEBUG_MUTEXES is defined. I would not 
say that mutex_destroy() is required. Rather it is a nice to have for 
catching programming error.

Cheers,
Longman

