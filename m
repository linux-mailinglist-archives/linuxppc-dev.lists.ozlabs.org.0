Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A2C3812B78
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Dec 2023 10:17:43 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Nx5uV3a4;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=SCaAzi4K;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SrRZs0Jysz3vpK
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Dec 2023 20:17:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Nx5uV3a4;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=SCaAzi4K;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=hdegoede@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SrRZ03vVtz3vkr
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Dec 2023 20:16:55 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1702545412;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aSXTliSLRPJwWKgirD+ynnpgvILXx2haTFF7t0rHIEw=;
	b=Nx5uV3a4jMfbpeuoFxbTM1pY9iPITeaqSUs7sbSOnrp+2fQxTe1LGlAu2SuxYJxHFYmLnk
	OcvFmZ47izKgCkQ9RFuEV2//E2xuT82q6mLe7KdH6vewF6+BVbDYjitqvN2ACf6vDtw/Yn
	zzxAAv6DTugGwp9SlHtVNgWeBNg40PE=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1702545413;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aSXTliSLRPJwWKgirD+ynnpgvILXx2haTFF7t0rHIEw=;
	b=SCaAzi4KmIM6ISNHKWolrGUjhphScjlxuoQQObf0Koy7yB2ROVWn/gxhdtM5goDCSvcIXO
	QXJGixuKwKL63kQ38LnKfyuzW5pMKi45aUBquLwqCilezu7632z08Eu++gi/VODvWO1QER
	ILv6T4O0lslXm0Qf6rbFcPo/JetQJ3E=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-605-t8Ct9jKXO1Gk7INNUW1PHA-1; Thu, 14 Dec 2023 04:16:50 -0500
X-MC-Unique: t8Ct9jKXO1Gk7INNUW1PHA-1
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-a1f6b30185bso392799166b.2
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Dec 2023 01:16:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702545409; x=1703150209;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aSXTliSLRPJwWKgirD+ynnpgvILXx2haTFF7t0rHIEw=;
        b=wDK+MHI7+Q2tsR9KDPNWeAmgpP+oChD7XNlASDNs89xRh3NnaaPISMeGnkeuYtWKqL
         ZfS4bXBJSNd0TbGx0q4emE76f8Nrg2AIby59xni14UA2mZQ3X0t88E2BCDmylFlk4Pj+
         JZ2RGrqE2HgEa1S3lonB7fKbCDzw7RQi0Or+sqJ9GYjfJAzVmlzhIfjpeIv7GtOD5zrX
         k/Ft8JmxSLzVWVcQL5VK9nODEj+bFfMTz9JywojeOtHYxHIVIWvlK0U8qI+CPfDlFwoK
         TCpyGmZ273bW/kN5H9TfXL5vWIzJEoFEb7G6MpwESg8uPrXsB9GgmjOl/75ss0NOXcg/
         Z6bA==
X-Gm-Message-State: AOJu0Yzd39RN7hqO0vVgQB/1HbXgeC1cPfQdkLRygSJfLeg4y194LGJv
	5MGHD6ORt7Gb6EY9cUsz8n/09pwIcpl8j+NYyRmA6dIwZ1Y+Umhwqo+TOK1EfgZSnM125Eq0Aqe
	CyzzM1/JDMJZ26aZfzdhTHptA8A==
X-Received: by 2002:a17:907:268e:b0:a1d:b7b9:3263 with SMTP id bn14-20020a170907268e00b00a1db7b93263mr2986295ejc.164.1702545409805;
        Thu, 14 Dec 2023 01:16:49 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFVQE/9DmmfQQ7JcgUanGLiAM3AoyRWgj4qusaFgzl7bO8ELi8lg6GnTyvH3KcEx592UQ4ElQ==
X-Received: by 2002:a17:907:268e:b0:a1d:b7b9:3263 with SMTP id bn14-20020a170907268e00b00a1db7b93263mr2986277ejc.164.1702545409439;
        Thu, 14 Dec 2023 01:16:49 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id tq14-20020a170907c50e00b00a1f83646eb6sm7701080ejc.149.2023.12.14.01.16.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Dec 2023 01:16:48 -0800 (PST)
Message-ID: <56e74264-6f98-4216-9f9a-e8f718375602@redhat.com>
Date: Thu, 14 Dec 2023 10:16:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 03/11] devm-helpers: introduce devm_mutex_init
To: Andy Shevchenko <andy.shevchenko@gmail.com>,
 George Stark <gnstark@salutedevices.com>
References: <20231213223020.2713164-1-gnstark@salutedevices.com>
 <20231213223020.2713164-4-gnstark@salutedevices.com>
 <CAHp75Vc1zZFWB8PPrg8oeAKz9aHnQrrSjdGyGd8mWcmeZdJ9qA@mail.gmail.com>
 <CAHp75Vdxa5k-CLhL+PmK0iTPTNSpP77DA6ooWnxfViwSKiEOSw@mail.gmail.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAHp75Vdxa5k-CLhL+PmK0iTPTNSpP77DA6ooWnxfViwSKiEOSw@mail.gmail.com>
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
Cc: linuxppc-dev@lists.ozlabs.org, vadimp@nvidia.com, mazziesaccount@gmail.com, peterz@infradead.org, boqun.feng@gmail.com, lee@kernel.org, kernel@salutedevices.com, linux-kernel@vger.kernel.org, npiggin@gmail.com, mingo@redhat.com, pavel@ucw.cz, longman@redhat.com, nikitos.tr@gmail.com, will@kernel.org, linux-leds@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi,

On 12/13/23 23:38, Andy Shevchenko wrote:
> On Thu, Dec 14, 2023 at 12:36 AM Andy Shevchenko
> <andy.shevchenko@gmail.com> wrote:
>> On Thu, Dec 14, 2023 at 12:30 AM George Stark <gnstark@salutedevices.com> wrote:
>>>
>>> Using of devm API leads to a certain order of releasing resources.
>>> So all dependent resources which are not devm-wrapped should be deleted
>>> with respect to devm-release order. Mutex is one of such objects that
>>> often is bound to other resources and has no own devm wrapper.
>>> Since mutex_destroy() actually does nothing in non-debug builds
>>> frequently calling mutex_destroy() is just ignored which is safe for now
>>> but wrong formally and can lead to a problem if mutex_destroy() is
>>> extended so introduce devm_mutex_init().
> 
> ...
> 
>>> +#ifdef mutex_destroy
>>> +static inline void devm_mutex_release(void *res)
>>> +{
>>> +       mutex_destroy(res);
>>> +}
>>> +#endif
>>> +
>>> +/**
>>> + * devm_mutex_init - Resource-managed mutex initialization
>>> + * @dev:       Device which lifetime mutex is bound to
>>> + * @lock:      Pointer to a mutex
>>> + *
>>> + * Initialize mutex which is automatically destroyed when the driver is detached.
>>> + *
>>> + * Returns: 0 on success or a negative error code on failure.
>>> + */
>>> +static inline int devm_mutex_init(struct device *dev, struct mutex *lock)
>>> +{
>>> +       mutex_init(lock);
>>> +#ifdef mutex_destroy
>>> +       return devm_add_action_or_reset(dev, devm_mutex_release, lock);
>>> +#else
>>> +       return 0;
>>> +#endif
>>> +}
>>
>> If this is going to be accepted, you may decrease the amount of ifdeffery.
>>
>> #ifdef ...
>> #else
>> #define devm_mutex_init(dev, lock)  mutex_init(lock)
> 
> More precisely ({ mutex_init(lock); 0; }) or as a static inline...

With a static inline we are pretty much back to the original
v3 patch.

I believe the best way to reduce the ifdef-ery is to remove
the #ifdef around devm_mutex_release() having unused
static inline ... functions in .h files is quite common,
so this one does not need a #ifdef around it and with
that removed we are down to just one #ifdef so just
removing the #ifdef around devm_mutex_release() seems
the best fix.

With that fixed you may add my:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

to the patch and I'm fine with this being routed
upstream through whatever tree is convenient.

Regards,

Hans



