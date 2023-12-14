Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 700A9812F75
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Dec 2023 12:52:52 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=KPVCy4Jo;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=AEcLp4Qm;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SrW1t1JGqz3cYy
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Dec 2023 22:52:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=KPVCy4Jo;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=AEcLp4Qm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=hdegoede@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SrW0z2KR7z3bd6
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Dec 2023 22:52:01 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1702554718;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aS/6XnBRIdVtrYOp4wLHjvS6oz2atR3YP9ICgOB3iGg=;
	b=KPVCy4JoG5Zi1WZBbThBmgzcPQP47UmD0HsBh8Zw2DvPE6uG4/xs7xsl7dqZFNk5jhDT82
	VABqJBLUkJ/+IfkcrnTPMMzSi4OF0r5m3kewmYedQPYPLPTQWxB2F7sB2GB0ICJ4FX+tzP
	FPhWCy8+gLVhKkZaPapN01EcI3pVxq0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1702554719;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aS/6XnBRIdVtrYOp4wLHjvS6oz2atR3YP9ICgOB3iGg=;
	b=AEcLp4Qm4ONpDt88Qs//W/StohQFanzXQrvDyyd4fQA5qsZGK9FlnbxdDca4L3TQdyRf91
	MHPqxQNKOWyCs3LStjHt9Ol5awJknaZWnC8VGeX3Dfi7lcA9HljWv2XwQLO1y6vajmwa8G
	iV3Fr07IGXOFgpJuNU2I+QEfokU73xE=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-355-jEJbN8haPgSLO9DLIMFg9g-1; Thu, 14 Dec 2023 06:51:56 -0500
X-MC-Unique: jEJbN8haPgSLO9DLIMFg9g-1
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-a1eb3f3dc2eso219978866b.2
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Dec 2023 03:51:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702554715; x=1703159515;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aS/6XnBRIdVtrYOp4wLHjvS6oz2atR3YP9ICgOB3iGg=;
        b=QCayweAiSO1YWJWPn8W5mv5VnUAOJDWvUkGAbxGSWGh5N9gUhHmgQ8ljzvw5gKENrB
         b8yHbtuKiRqADSA/4oBdy8H8OB89ThBeB/rKIKe/W4/I7G2yM1bNBadzXkxIfJziVi93
         1Eh/eWW0ehTyCG07Np9kbTMPrkxxRcEEdQ2DZwHnZ0ev9WZ9PtsBsIZccJnCEKyxYQzG
         a+57DJAVXUhvqJtSWGs2SXuBMTs19qd2/RsRPGZDK+Beo5W8mYOSr9wRQzgQletXT167
         WTdZpyxEiNXTZxGi2k2fvDb8FO2YFwjLq2J2k07vxRx0EKLPuOLiTxEX/GHaD3sPNzPI
         uonA==
X-Gm-Message-State: AOJu0YwajIbmnETHq8+YBZ++4ipRlIW7cPvxCjwhMCw9D+IXWGnzmsXS
	U6sWNOkV5mJKmupMt5Vau/5JVnaS3T92pXNhaEKa+O0zPpNw+q5iZ+gqmIcYexXSJSbmVzYTlAz
	EymgmwrZ7iwbiTKXrMUqhLI1oYg==
X-Received: by 2002:a17:906:10c7:b0:a1c:e980:3c3 with SMTP id v7-20020a17090610c700b00a1ce98003c3mr4066585ejv.28.1702554715588;
        Thu, 14 Dec 2023 03:51:55 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHFL7HyiSYut4T02F873+WBU/5sTp49/HyQIdZ0Go18ospT2UlJqi27N9WVGJWziHpX9DdSow==
X-Received: by 2002:a17:906:10c7:b0:a1c:e980:3c3 with SMTP id v7-20020a17090610c700b00a1ce98003c3mr4066575ejv.28.1702554715217;
        Thu, 14 Dec 2023 03:51:55 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id se13-20020a170907a38d00b00a1f78048f08sm8487004ejc.146.2023.12.14.03.51.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Dec 2023 03:51:54 -0800 (PST)
Message-ID: <c8950992-9b3e-4740-8ad6-f22d5a043fb1@redhat.com>
Date: Thu, 14 Dec 2023 12:51:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 03/11] devm-helpers: introduce devm_mutex_init
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 George Stark <gnstark@salutedevices.com>,
 "andy.shevchenko@gmail.com" <andy.shevchenko@gmail.com>,
 "pavel@ucw.cz" <pavel@ucw.cz>, "lee@kernel.org" <lee@kernel.org>,
 "vadimp@nvidia.com" <vadimp@nvidia.com>,
 "mpe@ellerman.id.au" <mpe@ellerman.id.au>,
 "npiggin@gmail.com" <npiggin@gmail.com>,
 "mazziesaccount@gmail.com" <mazziesaccount@gmail.com>,
 "peterz@infradead.org" <peterz@infradead.org>,
 "mingo@redhat.com" <mingo@redhat.com>, "will@kernel.org" <will@kernel.org>,
 "longman@redhat.com" <longman@redhat.com>,
 "boqun.feng@gmail.com" <boqun.feng@gmail.com>,
 "nikitos.tr@gmail.com" <nikitos.tr@gmail.com>
References: <20231213223020.2713164-1-gnstark@salutedevices.com>
 <20231213223020.2713164-4-gnstark@salutedevices.com>
 <80881d5d-3ae9-4580-84c1-f25b421cc518@csgroup.eu>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <80881d5d-3ae9-4580-84c1-f25b421cc518@csgroup.eu>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, nl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

Hi,

On 12/14/23 11:06, Christophe Leroy wrote:
> 
> 
> Le 13/12/2023 à 23:30, George Stark a écrit :
>> [Vous ne recevez pas souvent de courriers de gnstark@salutedevices.com. Découvrez pourquoi ceci est important à https://aka.ms/LearnAboutSenderIdentification ]
>>
>> Using of devm API leads to a certain order of releasing resources.
>> So all dependent resources which are not devm-wrapped should be deleted
>> with respect to devm-release order. Mutex is one of such objects that
>> often is bound to other resources and has no own devm wrapper.
>> Since mutex_destroy() actually does nothing in non-debug builds
>> frequently calling mutex_destroy() is just ignored which is safe for now
>> but wrong formally and can lead to a problem if mutex_destroy() is
>> extended so introduce devm_mutex_init().
> 
> So you abandonned the idea of using mutex.h ?
> 
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

FWIW defining devm_mutex_init() in mutex.h is fine
with me and makes sense to me. I also agree that putting
it there would be better if that is acceptable for
the mutex maintainers.

devm-helpers.h is there for helpers which don't fit
in another place.

Regards,

Hans




> 
> 
>>
>> Signed-off-by: George Stark <gnstark@salutedevices.com>
>> ---
>>   include/linux/devm-helpers.h | 27 +++++++++++++++++++++++++++
>>   1 file changed, 27 insertions(+)
>>
>> diff --git a/include/linux/devm-helpers.h b/include/linux/devm-helpers.h
>> index 74891802200d..4043c3481d2e 100644
>> --- a/include/linux/devm-helpers.h
>> +++ b/include/linux/devm-helpers.h
>> @@ -24,6 +24,7 @@
>>    */
>>
>>   #include <linux/device.h>
>> +#include <linux/mutex.h>
>>   #include <linux/workqueue.h>
>>
>>   static inline void devm_delayed_work_drop(void *res)
>> @@ -76,4 +77,30 @@ static inline int devm_work_autocancel(struct device *dev,
>>          return devm_add_action(dev, devm_work_drop, w);
>>   }
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
>>   #endif
>> --
>> 2.25.1
>>

