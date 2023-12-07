Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EAA8807E49
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Dec 2023 03:17:33 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=SWTifrGq;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=SWTifrGq;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SlybG6ylLz3dBG
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Dec 2023 13:17:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=SWTifrGq;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=SWTifrGq;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=longman@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SlyZN6wFBz30hY
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Dec 2023 13:16:43 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1701915401;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hBSYHwojXw9kaGuT0KXDyW/rgXDL9EP6Xo6RAZZVUjw=;
	b=SWTifrGqQtBDAvSKw/WZz0sjuLL60LdZ28hKw1596+DssSfkTolc8LvpjrDsiSTTTNQvYZ
	Lp7fiZct8G14HK8c6k1XrNPyhWzjxnNVdb3Qh7FFKOU8xg4jBRFj+1R4tkhe/Fgy77HkPP
	00RrkVV6jxRLswsz+yqDotwMatRVv+w=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1701915401;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hBSYHwojXw9kaGuT0KXDyW/rgXDL9EP6Xo6RAZZVUjw=;
	b=SWTifrGqQtBDAvSKw/WZz0sjuLL60LdZ28hKw1596+DssSfkTolc8LvpjrDsiSTTTNQvYZ
	Lp7fiZct8G14HK8c6k1XrNPyhWzjxnNVdb3Qh7FFKOU8xg4jBRFj+1R4tkhe/Fgy77HkPP
	00RrkVV6jxRLswsz+yqDotwMatRVv+w=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-471-rmphrsgtOkS3HsEJKlrQog-1; Wed, 06 Dec 2023 21:16:38 -0500
X-MC-Unique: rmphrsgtOkS3HsEJKlrQog-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EA08F101A551;
	Thu,  7 Dec 2023 02:16:37 +0000 (UTC)
Received: from [10.22.34.92] (unknown [10.22.34.92])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 766B4C15E6C;
	Thu,  7 Dec 2023 02:16:35 +0000 (UTC)
Message-ID: <377e4437-7051-4d88-ae68-1460bcd692e1@redhat.com>
Date: Wed, 6 Dec 2023 21:16:35 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/10] devm-helpers: introduce devm_mutex_init
Content-Language: en-US
To: George Stark <gnstark@salutedevices.com>,
 Hans de Goede <hdegoede@redhat.com>, pavel@ucw.cz, lee@kernel.org,
 vadimp@nvidia.com, mpe@ellerman.id.au, npiggin@gmail.com,
 christophe.leroy@csgroup.eu, mazziesaccount@gmail.com,
 andy.shevchenko@gmail.com, jic23@kernel.org, peterz@infradead.org,
 boqun.feng@gmail.com, will@kernel.org, mingo@redhat.com
References: <20231204180603.470421-1-gnstark@salutedevices.com>
 <20231204180603.470421-2-gnstark@salutedevices.com>
 <81798fe5-f89e-482f-b0d0-674ccbfc3666@redhat.com>
 <29584eb6-fa10-4ce0-9fa3-0c409a582445@salutedevices.com>
 <580ecff0-b335-4cc0-b928-a99fe73741ca@redhat.com>
 <469f44fb-2371-4b3b-bc1c-d09ec35a5ec8@redhat.com>
 <75368bdb-b54e-4e15-a3c0-89b920e5e729@salutedevices.com>
From: Waiman Long <longman@redhat.com>
In-Reply-To: <75368bdb-b54e-4e15-a3c0-89b920e5e729@salutedevices.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.8
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

On 12/6/23 19:37, George Stark wrote:
> Hello Waiman
>
> Thanks for the review.
>
> On 12/7/23 00:02, Waiman Long wrote:
>> On 12/6/23 14:55, Hans de Goede wrote:
>>> Hi,
>>>
>>> On 12/6/23 19:58, George Stark wrote:
>>>> Hello Hans
>>>>
>>>> Thanks for the review.
>>>>
>>>> On 12/6/23 18:01, Hans de Goede wrote:
>>>>> Hi George,
>>>>>
> ...
>>>>> mutex_destroy() only actually does anything if CONFIG_DEBUG_MUTEXES
>>>>> is set, otherwise it is an empty inline-stub.
>>>>>
>>>>> Adding a devres resource to the device just to call an empty inline
>>>>> stub which is a no-op seems like a waste of resources. IMHO it
>>>>> would be better to change this to:
>>>>>
>>>>> static inline int devm_mutex_init(struct device *dev, struct mutex 
>>>>> *lock)
>>>>> {
>>>>>      mutex_init(lock);
>>>>> #ifdef CONFIG_DEBUG_MUTEXES
>>>>>      return devm_add_action_or_reset(dev, devm_mutex_release, lock);
>>>>> #else
>>>>>      return 0;
>>>>> #endif
>>>>> }
>>>>>
>>>>> To avoid the unnecessary devres allocation when
>>>>> CONFIG_DEBUG_MUTEXES is not set.
>>>> Honestly saying I don't like unnecessary devres allocation either 
>>>> but the proposed approach has its own price:
>>>>
>>>> 1) we'll have more than one place with branching if mutex_destroy 
>>>> is empty or not using  indirect condition. If suddenly 
>>>> mutex_destroy is extended for non-debug code (in upstream branch or 
>>>> e.g. by someone for local debug) than there'll be a problem.
>>>>
>>>> 2) If mutex_destroy is empty or not depends on CONFIG_PREEMPT_RT 
>>>> option too. When CONFIG_PREEMPT_RT is on mutex_destroy is always 
>>>> empty.
>>>>
>>>> As I see it only the mutex interface (mutex.h) has to say 
>>>> definitely if mutex_destroy must be called. Probably we could add 
>>>> some define to include/linux/mutex.h,like IS_MUTEX_DESTROY_REQUIRED 
>>>> and declare it near mutex_destroy definition itself.
>>> That (a  IS_MUTEX_DESTROY_REQUIRED define) is an interesting idea. 
>>> Lets s>
>>>>> Adding a devres resource to the device just to call an empty inline
>>>>> stub which is a no-op seems like a waste of resources. IMHO it
>>>>> would be better to change this to:
>>>>>
>>>>> static inline int devm_mutex_init(struct device *dev, struct mutex 
>>>>> *lock)
>>>>> {
>>>>>      mutex_init(lock);
>>>>> #ifdef CONFIG_DEBUG_MUTEXES
>>>>>      return devm_add_action_or_reset(dev, devm_mutex_release, lock);
>>>>> #else
>>>>>      return 0;
>>>>> #endif
>>>>> }
>>>>> ee for v3 if the mutex maintainers will accept that and if not 
>>> then I guess we will just need to live with the unnecessary devres 
>>> allocation.
>>
>> The purpose of calling mutex_destroy() is to mark a mutex as being 
>> destroyed so that any subsequent call to mutex_lock/unlock will cause 
>> a warning to be printed when CONFIG_DEBUG_MUTEXES is defined. I would 
>> not say that mutex_destroy() is required. Rather it is a nice to have 
>> for catching programming error.
>
> This is quite understandable but probably mutex_destroy() is not the 
> best name for an optional API. Questions are asked over and over again
> if it can be safely ignored taking into account that it could be 
> extended in the future. Every maintainer makes decision on that question
> in his own way and it leads to inconsistency.
>
> devm_mutex_init could take responsibility for calling/dropping 
> mutex_destroy() on its own.

The DEBUG_MUTEXES code is relatively old and there was no major change 
to it for a number of years. I don't see we will make major change to it 
in the near future. Of course, thing may change if there are new 
requirement that may affect the DEBUG_MUTEXES code.

Cheers,
Longman

>
>> Cheers,
>> Longman
>>
>

