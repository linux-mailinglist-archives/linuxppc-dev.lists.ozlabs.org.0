Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A0A60807B2D
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Dec 2023 23:12:31 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Db28e5AY;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Db28e5AY;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Sls8Y0q8Sz3dLQ
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Dec 2023 09:12:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Db28e5AY;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Db28e5AY;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=hdegoede@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Slp913Tfmz3c56
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Dec 2023 06:57:40 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1701892656;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WNtxqmUk2Bs7YzOVHZEViZ/O+MeQgcYuxCuXpozAJVI=;
	b=Db28e5AYavj6G7nbahIJA6OpqgFgTxj8n1Ry07rp93da6PxwAQb0/zhkSI0giWOiVjvCLq
	Gf5Z+8vdLZ3x4SQanm2okUWHkoy6lmmLx9Q84WN3aIWAqyfAus+wXgnPASe4N12sepFyKB
	wqpiAqcsSPMAsBqHGmlBBZatOQjpeUU=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1701892656;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WNtxqmUk2Bs7YzOVHZEViZ/O+MeQgcYuxCuXpozAJVI=;
	b=Db28e5AYavj6G7nbahIJA6OpqgFgTxj8n1Ry07rp93da6PxwAQb0/zhkSI0giWOiVjvCLq
	Gf5Z+8vdLZ3x4SQanm2okUWHkoy6lmmLx9Q84WN3aIWAqyfAus+wXgnPASe4N12sepFyKB
	wqpiAqcsSPMAsBqHGmlBBZatOQjpeUU=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-564-r0sBXetcNuq5GmMKJR_uMw-1; Wed, 06 Dec 2023 14:55:05 -0500
X-MC-Unique: r0sBXetcNuq5GmMKJR_uMw-1
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-40b32faeb7eso1256635e9.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 06 Dec 2023 11:55:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701892504; x=1702497304;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WNtxqmUk2Bs7YzOVHZEViZ/O+MeQgcYuxCuXpozAJVI=;
        b=iDzBeRb+zU0J/yGSvxpwgDBtJuC/C0tHoEgwhdmGuAdnpSORcVDwIukpLG2dFZA450
         vSKddgOuG347uzRfy0Z7UKJjlo7iCSAgYu5P9Vz6JNgqjaNFZrAJyLf79JXagBRDSRMo
         9b4dbzKEoqYzsfGPCefFJTd7vAcHidD1dls6Nc4d6bhz2ypT7Ky4hTGdVFWwNu8B3PNk
         3cQgC1UfD7EjWJMsOLzTVrddNt92KpqOtcdvz4+WOxi/RW8dguK2FvYjxDzMfrDcOTaG
         bowJucuAubG2IpTC3cHC7DEZRDcwZOb+hOkiwUDsM1PVSDaBXVkHijiWPdZ+iBNTmfYU
         eY9Q==
X-Gm-Message-State: AOJu0YywfrGc6NQ+VriZljtsCKbgKR5Rb9Dm1XfA17tfSt6FRwQyJeTe
	y3ETkobJ/iF5tSnTTE1KjM9plmB0Yy6w29dxGlPHOdVGXgk7EqX+39U5Y0QjyxJ8Ti0gQgzUhgV
	H0BQjVjbWsik4tBgulJ/dsl0wAA==
X-Received: by 2002:a1c:7909:0:b0:40c:c1a:cfac with SMTP id l9-20020a1c7909000000b0040c0c1acfacmr568914wme.158.1701892503953;
        Wed, 06 Dec 2023 11:55:03 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHnky6uLpyWb8bqYMMFni4xX3EDvcb9YnlGZqz8FxzcndfpsjoChNLslaWPUEOk6wlicauAww==
X-Received: by 2002:a1c:7909:0:b0:40c:c1a:cfac with SMTP id l9-20020a1c7909000000b0040c0c1acfacmr568903wme.158.1701892503589;
        Wed, 06 Dec 2023 11:55:03 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id r19-20020a1709067fd300b00a1cbb289a7csm341617ejs.183.2023.12.06.11.55.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Dec 2023 11:55:03 -0800 (PST)
Message-ID: <580ecff0-b335-4cc0-b928-a99fe73741ca@redhat.com>
Date: Wed, 6 Dec 2023 20:55:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/10] devm-helpers: introduce devm_mutex_init
To: George Stark <gnstark@salutedevices.com>, pavel@ucw.cz, lee@kernel.org,
 vadimp@nvidia.com, mpe@ellerman.id.au, npiggin@gmail.com,
 christophe.leroy@csgroup.eu, mazziesaccount@gmail.com,
 andy.shevchenko@gmail.com, jic23@kernel.org, peterz@infradead.org,
 Waiman Long <longman@redhat.com>
References: <20231204180603.470421-1-gnstark@salutedevices.com>
 <20231204180603.470421-2-gnstark@salutedevices.com>
 <81798fe5-f89e-482f-b0d0-674ccbfc3666@redhat.com>
 <29584eb6-fa10-4ce0-9fa3-0c409a582445@salutedevices.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <29584eb6-fa10-4ce0-9fa3-0c409a582445@salutedevices.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, nl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 07 Dec 2023 09:10:12 +1100
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

Hi,

On 12/6/23 19:58, George Stark wrote:
> 
> Hello Hans
> 
> Thanks for the review.
> 
> On 12/6/23 18:01, Hans de Goede wrote:
>> Hi George,
>>
>> On 12/4/23 19:05, George Stark wrote:
>>> Using of devm API leads to certain order of releasing resources.
>>> So all dependent resources which are not devm-wrapped should be deleted
>>> with respect to devm-release order. Mutex is one of such objects that
>>> often is bound to other resources and has no own devm wrapping.
>>> Since mutex_destroy() actually does nothing in non-debug builds
>>> frequently calling mutex_destroy() is just ignored which is safe for now
>>> but wrong formally and can lead to a problem if mutex_destroy() is
>>> extended so introduce devm_mutex_init().
>>>
>>> Signed-off-by: George Stark <gnstark@salutedevices.com>
>>> ---
>>>   include/linux/devm-helpers.h | 18 ++++++++++++++++++
>>>   1 file changed, 18 insertions(+)
>>>
>>> diff --git a/include/linux/devm-helpers.h b/include/linux/devm-helpers.h
>>> index 74891802200d..2f56e476776f 100644
>>> --- a/include/linux/devm-helpers.h
>>> +++ b/include/linux/devm-helpers.h
>>> @@ -76,4 +76,22 @@ static inline int devm_work_autocancel(struct device *dev,
>>>       return devm_add_action(dev, devm_work_drop, w);
>>>   }
>>>   +static inline void devm_mutex_release(void *res)
>>> +{
>>> +    mutex_destroy(res);
>>> +}
>>> +
>>> +/**
>>> + * devm_mutex_init - Resource-managed mutex initialization
>>> + * @dev:    Device which lifetime work is bound to
>>> + * @lock:    Pointer to a mutex
>>> + *
>>> + * Initialize mutex which is automatically destroyed when driver is detached.
>>> + */
>>> +static inline int devm_mutex_init(struct device *dev, struct mutex *lock)
>>> +{
>>> +    mutex_init(lock);
>>> +    return devm_add_action_or_reset(dev, devm_mutex_release, lock);
>>> +}
>>> +
>>>   #endif
>>
>> mutex_destroy() only actually does anything if CONFIG_DEBUG_MUTEXES
>> is set, otherwise it is an empty inline-stub.
>>
>> Adding a devres resource to the device just to call an empty inline
>> stub which is a no-op seems like a waste of resources. IMHO it
>> would be better to change this to:
>>
>> static inline int devm_mutex_init(struct device *dev, struct mutex *lock)
>> {
>>     mutex_init(lock);
>> #ifdef CONFIG_DEBUG_MUTEXES
>>     return devm_add_action_or_reset(dev, devm_mutex_release, lock);
>> #else
>>     return 0;
>> #endif
>> }
>>
>> To avoid the unnecessary devres allocation when
>> CONFIG_DEBUG_MUTEXES is not set.
> 
> Honestly saying I don't like unnecessary devres allocation either but the proposed approach has its own price:
> 
> 1) we'll have more than one place with branching if mutex_destroy is empty or not using  indirect condition. If suddenly mutex_destroy is extended for non-debug code (in upstream branch or e.g. by someone for local debug) than there'll be a problem.
> 
> 2) If mutex_destroy is empty or not depends on CONFIG_PREEMPT_RT option too. When CONFIG_PREEMPT_RT is on mutex_destroy is always empty.
> 
> As I see it only the mutex interface (mutex.h) has to say definitely if mutex_destroy must be called. Probably we could add some define to include/linux/mutex.h,like IS_MUTEX_DESTROY_REQUIRED and declare it near mutex_destroy definition itself.

That (a  IS_MUTEX_DESTROY_REQUIRED define) is an interesting idea. Lets see for v3 if the mutex maintainers will accept that and if not then I guess we will just need to live with the unnecessary devres allocation.

Regards,

Hans


