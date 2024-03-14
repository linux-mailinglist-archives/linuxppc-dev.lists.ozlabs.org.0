Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 68AD987BDC4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Mar 2024 14:33:41 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=DH3QDicN;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=K6GBVYi5;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TwSyC1BMKz3vbh
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Mar 2024 00:33:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=DH3QDicN;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=K6GBVYi5;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=longman@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TwSxV3nJ6z3vZS
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Mar 2024 00:33:01 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1710423178;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7W6VhUuT1IYXtZxvs3JZ1xOnzXyykRUh8w8oxA4GA0I=;
	b=DH3QDicNRqMeenxwWc9Wdr3N5CaTFOZuo6rm9fz3GgqbjCokFvS8iGWtu8KKMUItNfePa3
	onGQ7PJR0n5KTrKqF7UPyuLpml+9IMhiiZp5i1BbMBTNJVweS/Umt5Id0YFItIT/cJwoyL
	lk/X2yOc7awGCVHSfTwQ9+07tDIG8zo=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1710423179;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7W6VhUuT1IYXtZxvs3JZ1xOnzXyykRUh8w8oxA4GA0I=;
	b=K6GBVYi5ee4T70LkAgb8eDhg5pPYOzmJ/0lPKq4gn/698hM73AQJYkvmZuSonUt4nhRZV+
	JnDbbyrCVFIm3g/Yv+QOT/I9MCGlpQmLUhlULhIlU8imrAkD2cmX4/XOYA6ySMHFHwTDAm
	EJXARxmGbkb/bHdq5+dbIMx0bfK+WM8=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-468-06n3wqtbNFSas5BYEGQpiw-1; Thu,
 14 Mar 2024 09:32:54 -0400
X-MC-Unique: 06n3wqtbNFSas5BYEGQpiw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 725BC1C5454A;
	Thu, 14 Mar 2024 13:32:50 +0000 (UTC)
Received: from [10.22.16.244] (unknown [10.22.16.244])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 41D38492BC6;
	Thu, 14 Mar 2024 13:32:48 +0000 (UTC)
Message-ID: <9fe2eaef-0407-4a96-b603-e7f6579110b6@redhat.com>
Date: Thu, 14 Mar 2024 09:32:48 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/9] locking/mutex: introduce devm_mutex_init
Content-Language: en-US
To: George Stark <gnstark@salutedevices.com>, andy.shevchenko@gmail.com,
 pavel@ucw.cz, lee@kernel.org, vadimp@nvidia.com, mpe@ellerman.id.au,
 npiggin@gmail.com, christophe.leroy@csgroup.eu, hdegoede@redhat.com,
 mazziesaccount@gmail.com, peterz@infradead.org, mingo@redhat.com,
 will@kernel.org, boqun.feng@gmail.com, nikitos.tr@gmail.com,
 marek.behun@nic.cz, kabel@kernel.org
References: <20240314084531.1935545-1-gnstark@salutedevices.com>
 <20240314084531.1935545-2-gnstark@salutedevices.com>
From: Waiman Long <longman@redhat.com>
In-Reply-To: <20240314084531.1935545-2-gnstark@salutedevices.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.9
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


On 3/14/24 04:45, George Stark wrote:
> Using of devm API leads to a certain order of releasing resources.
> So all dependent resources which are not devm-wrapped should be deleted
> with respect to devm-release order. Mutex is one of such objects that
> often is bound to other resources and has no own devm wrapping.
> Since mutex_destroy() actually does nothing in non-debug builds
> frequently calling mutex_destroy() is just ignored which is safe for now
> but wrong formally and can lead to a problem if mutex_destroy() will be
> extended so introduce devm_mutex_init()
>
> Signed-off-by: George Stark <gnstark@salutedevices.com>
> Suggested by-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---
>   include/linux/mutex.h        | 27 +++++++++++++++++++++++++++
>   kernel/locking/mutex-debug.c | 11 +++++++++++
>   2 files changed, 38 insertions(+)
>
> diff --git a/include/linux/mutex.h b/include/linux/mutex.h
> index 67edc4ca2bee..f57e005ded24 100644
> --- a/include/linux/mutex.h
> +++ b/include/linux/mutex.h
> @@ -22,6 +22,8 @@
>   #include <linux/cleanup.h>
>   #include <linux/mutex_types.h>
>   
> +struct device;
> +
>   #ifdef CONFIG_DEBUG_LOCK_ALLOC
>   # define __DEP_MAP_MUTEX_INITIALIZER(lockname)			\
>   		, .dep_map = {					\
> @@ -117,6 +119,31 @@ do {							\
>   } while (0)
>   #endif /* CONFIG_PREEMPT_RT */
>   
> +#ifdef CONFIG_DEBUG_MUTEXES
> +
> +int __devm_mutex_init(struct device *dev, struct mutex *lock);
> +
> +#else
> +
> +static inline int __devm_mutex_init(struct device *dev, struct mutex *lock)
> +{
> +	/*
> +	 * When CONFIG_DEBUG_MUTEXES is off mutex_destroy is just a nop so
> +	 * no really need to register it in devm subsystem.
> +	 */
> +	return 0;
> +}
> +
> +#endif
> +
> +#define devm_mutex_init(dev, mutex)			\
> +({							\
> +	typeof(mutex) mutex_ = (mutex);			\
> +							\
> +	mutex_init(mutex_);				\
> +	__devm_mutex_init(dev, mutex_);			\
> +})
> +
>   /*
>    * See kernel/locking/mutex.c for detailed documentation of these APIs.
>    * Also see Documentation/locking/mutex-design.rst.
> diff --git a/kernel/locking/mutex-debug.c b/kernel/locking/mutex-debug.c
> index bc8abb8549d2..6aa77e3dc82e 100644
> --- a/kernel/locking/mutex-debug.c
> +++ b/kernel/locking/mutex-debug.c
> @@ -19,6 +19,7 @@
>   #include <linux/kallsyms.h>
>   #include <linux/interrupt.h>
>   #include <linux/debug_locks.h>
> +#include <linux/device.h>
>   
>   #include "mutex.h"
>   
> @@ -89,6 +90,16 @@ void debug_mutex_init(struct mutex *lock, const char *name,
>   	lock->magic = lock;
>   }
>   
> +static void devm_mutex_release(void *res)
> +{
> +	mutex_destroy(res);
> +}
> +
> +int __devm_mutex_init(struct device *dev, struct mutex *lock)
> +{
> +	return devm_add_action_or_reset(dev, devm_mutex_release, lock);
> +}
> +
>   /***
>    * mutex_destroy - mark a mutex unusable
>    * @lock: the mutex to be destroyed
Acked-by: Waiman Long <longman@redhat.com>

