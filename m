Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A3B28155FA
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Dec 2023 02:32:02 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=haSrAL3u;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=haSrAL3u;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SsT8S0hZrz3ckQ
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Dec 2023 12:31:52 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=haSrAL3u;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=haSrAL3u;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=longman@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SsT7Y6xnxz2ykZ
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 16 Dec 2023 12:31:04 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1702690259;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mVlrB+oQEuOU8B0i3W32kFhArbOa2dYtoStKRM7GlpY=;
	b=haSrAL3u5QyNQkH+j0ygKze75R8Ny4FPAgru/U8l8a0Y45CN7xQcxVTJJfU+xv9XFa7cVw
	lL67JoGcuKf9Pd7lbULceS13FaJtBSL1Q3itKKw5Rc0rw84iexTeygfacCOThQ7Nsm0pIX
	e46wNxJOf2+GMes6PdZ5mYUdGzK/Mb0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1702690259;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mVlrB+oQEuOU8B0i3W32kFhArbOa2dYtoStKRM7GlpY=;
	b=haSrAL3u5QyNQkH+j0ygKze75R8Ny4FPAgru/U8l8a0Y45CN7xQcxVTJJfU+xv9XFa7cVw
	lL67JoGcuKf9Pd7lbULceS13FaJtBSL1Q3itKKw5Rc0rw84iexTeygfacCOThQ7Nsm0pIX
	e46wNxJOf2+GMes6PdZ5mYUdGzK/Mb0=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-562-swiyUIjUOvCYb61XDJkKDw-1; Fri,
 15 Dec 2023 20:30:54 -0500
X-MC-Unique: swiyUIjUOvCYb61XDJkKDw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 66A9329AB3E0;
	Sat, 16 Dec 2023 01:30:53 +0000 (UTC)
Received: from [10.22.9.217] (unknown [10.22.9.217])
	by smtp.corp.redhat.com (Postfix) with ESMTP id F2B942166B31;
	Sat, 16 Dec 2023 01:30:51 +0000 (UTC)
Message-ID: <550a22b0-dfc9-427f-bbf0-3c6854e9867d@redhat.com>
Date: Fri, 15 Dec 2023 20:30:51 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v4-bis] locking: introduce devm_mutex_init
Content-Language: en-US
To: Andy Shevchenko <andy.shevchenko@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>
References: <20231214173614.2820929-3-gnstark@salutedevices.com>
 <c16599b23afa853a44d13b906af5683027959a26.1702621174.git.christophe.leroy@csgroup.eu>
 <CAHp75VfBcmTBXXtU6o1x0Ea24wG-_Qb46opkS0EXKQ1Ynh0Mcw@mail.gmail.com>
From: Waiman Long <longman@redhat.com>
In-Reply-To: <CAHp75VfBcmTBXXtU6o1x0Ea24wG-_Qb46opkS0EXKQ1Ynh0Mcw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.6
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
Cc: kernel@salutedevices.com, vadimp@nvidia.com, mazziesaccount@gmail.com, peterz@infradead.org, boqun.feng@gmail.com, lee@kernel.org, linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com, linux-kernel@vger.kernel.org, hdegoede@redhat.com, mingo@redhat.com, pavel@ucw.cz, George Stark <gnstark@salutedevices.com>, nikitos.tr@gmail.com, will@kernel.org, linux-leds@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 12/15/23 10:58, Andy Shevchenko wrote:
> On Fri, Dec 15, 2023 at 8:23 AM Christophe Leroy
> <christophe.leroy@csgroup.eu> wrote:
>> From: George Stark <gnstark@salutedevices.com>
>>
>> Using of devm API leads to a certain order of releasing resources.
>> So all dependent resources which are not devm-wrapped should be deleted
>> with respect to devm-release order. Mutex is one of such objects that
>> often is bound to other resources and has no own devm wrapping.
>> Since mutex_destroy() actually does nothing in non-debug builds
>> frequently calling mutex_destroy() is just ignored which is safe for now
>> but wrong formally and can lead to a problem if mutex_destroy() will be
>> extended so introduce devm_mutex_init()
> Missing period.
>
> ...
>
>>   } while (0)
>>   #endif /* CONFIG_PREEMPT_RT */
> ^^^ (1)
>
>> +struct device;
>> +
>> +/*
>> + * devm_mutex_init() registers a function that calls mutex_destroy()
>> + * when the ressource is released.
>> + *
>> + * When mutex_destroy() is a not, there is no need to register that
>> + * function.
>> + */
>> +#ifdef CONFIG_DEBUG_MUTEXES
> Shouldn't this be
>
> #if defined(CONFIG_DEBUG_MUTEXES) && !defined(CONFIG_PREEMPT_RT)
>
> (see (1) as well)?

CONFIG_DEBUG_MUTEXES and CONFIG_PREEMPT_RT are mutually exclusive. At 
most one of them can be set.

Cheers,
Longman

