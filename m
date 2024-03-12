Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 28498878C24
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Mar 2024 02:11:07 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=MuaYE3qd;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=MuaYE3qd;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TtwZJ6qZ0z3vX6
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Mar 2024 12:11:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=MuaYE3qd;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=MuaYE3qd;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=longman@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TtwYb5q5wz3brm
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Mar 2024 12:10:26 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1710205822;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=O2b5/RPP4rC6xUSDs7L8tllctKlCe9JUBBRdcxIDUUE=;
	b=MuaYE3qdkdU/wfIPa6ZbqasR7XpqHCXihmprCpl56nRY4CUl5iD9V7eXMG8FRPKdq8dl6S
	eJNakFypm1LsCa74jdUvjpOQhKaS+fH+IGnhOzCMOcRJcMBBmwYi861/cWAmkawK3vEB4B
	UEcR75JeFZr2FQV4SzatWKbzWiWN90Q=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1710205822;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=O2b5/RPP4rC6xUSDs7L8tllctKlCe9JUBBRdcxIDUUE=;
	b=MuaYE3qdkdU/wfIPa6ZbqasR7XpqHCXihmprCpl56nRY4CUl5iD9V7eXMG8FRPKdq8dl6S
	eJNakFypm1LsCa74jdUvjpOQhKaS+fH+IGnhOzCMOcRJcMBBmwYi861/cWAmkawK3vEB4B
	UEcR75JeFZr2FQV4SzatWKbzWiWN90Q=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-175-ctD-h0z2PQ61I25Kqa-naw-1; Mon,
 11 Mar 2024 21:10:18 -0400
X-MC-Unique: ctD-h0z2PQ61I25Kqa-naw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C98D43800E88;
	Tue, 12 Mar 2024 01:10:17 +0000 (UTC)
Received: from [10.22.9.132] (unknown [10.22.9.132])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 83DAF492BC6;
	Tue, 12 Mar 2024 01:10:16 +0000 (UTC)
Message-ID: <d98bff53-c85f-45c0-acde-8cb4e018af30@redhat.com>
Date: Mon, 11 Mar 2024 21:10:16 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 02/10] locking/mutex: introduce devm_mutex_init
Content-Language: en-US
To: George Stark <gnstark@salutedevices.com>, =?UTF-8?Q?Marek_Beh=C3=BAn?=
 <marek.behun@nic.cz>
References: <20240307024034.1548605-1-gnstark@salutedevices.com>
 <20240307024034.1548605-3-gnstark@salutedevices.com>
 <20240307095639.b6utkbzr36liuu3p@kandell>
 <3d95ab40-2df5-4988-87be-568a628a0561@redhat.com>
 <20240307174414.4059d7ee@dellmb>
 <cfceef12-883e-4593-9dca-50768acb1aa9@salutedevices.com>
From: Waiman Long <longman@redhat.com>
In-Reply-To: <cfceef12-883e-4593-9dca-50768acb1aa9@salutedevices.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: kabel@kernel.org, linuxppc-dev@lists.ozlabs.org, vadimp@nvidia.com, mazziesaccount@gmail.com, peterz@infradead.org, boqun.feng@gmail.com, lee@kernel.org, kernel@salutedevices.com, linux-kernel@vger.kernel.org, npiggin@gmail.com, hdegoede@redhat.com, andy.shevchenko@gmail.com, mingo@redhat.com, pavel@ucw.cz, nikitos.tr@gmail.com, will@kernel.org, linux-leds@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 3/11/24 19:47, George Stark wrote:
> Hello Waiman, Marek
>
> Thanks for the review.
>
> I've never used lockdep for debug but it seems preferable to
> keep that feature working. It could be look like this:
>
> diff --git a/include/linux/mutex.h b/include/linux/mutex.h
> index f7611c092db7..574f6de6084d 100644
> --- a/include/linux/mutex.h
> +++ b/include/linux/mutex.h
> @@ -22,6 +22,8 @@
>  #include <linux/cleanup.h>
>  #include <linux/mutex_types.h>
>
> +struct device;
> +
>  #ifdef CONFIG_DEBUG_LOCK_ALLOC
>  # define __DEP_MAP_MUTEX_INITIALIZER(lockname)            \
>          , .dep_map = {                    \
> @@ -115,10 +117,31 @@ do {                            \
>
>  #ifdef CONFIG_DEBUG_MUTEXES
>
> +int debug_devm_mutex_init(struct device *dev, struct mutex *lock);
> +
> +#define devm_mutex_init(dev, mutex)            \
> +({                            \
> +    int ret;                    \
> +    mutex_init(mutex);                \
> +    ret = debug_devm_mutex_init(dev, mutex);    \
> +    ret;                        \
> +})

The int ret variable is not needed. The macro can just end with 
debug_devm_mutex_init().


> +
>  void mutex_destroy(struct mutex *lock);
>
>  #else
>
> +/*
> +* When CONFIG_DEBUG_MUTEXES is off mutex_destroy is just a nop so
> +* there's no really need to register it in devm subsystem.
"no really need"?
> +*/
> +#define devm_mutex_init(dev, mutex)            \
> +({                            \
> +    typecheck(struct device *, dev);        \
> +    mutex_init(mutex);                \
> +    0;                        \
> +})

Do we need a typecheck() here? Compilation will fail with 
CONFIG_DEBUG_MUTEXES if dev is not a device pointer.


> +
>  static inline void mutex_destroy(struct mutex *lock) {}
>
>  #endif
> diff --git a/kernel/locking/mutex-debug.c b/kernel/locking/mutex-debug.c
> index bc8abb8549d2..967a5367c79a 100644
> --- a/kernel/locking/mutex-debug.c
> +++ b/kernel/locking/mutex-debug.c
> @@ -19,6 +19,7 @@
>  #include <linux/kallsyms.h>
>  #include <linux/interrupt.h>
>  #include <linux/debug_locks.h>
> +#include <linux/device.h>
>
>  #include "mutex.h"
>
> @@ -89,6 +90,16 @@ void debug_mutex_init(struct mutex *lock, const 
> char *name,
>      lock->magic = lock;
>  }
>
> +static void devm_mutex_release(void *res)
> +{
> +    mutex_destroy(res);
> +}
> +
> +int debug_devm_mutex_init(struct device *dev, struct mutex *lock)
> +{
> +    return devm_add_action_or_reset(dev, devm_mutex_release, lock);
> +}
> +
>  /***
>   * mutex_destroy - mark a mutex unusable
>   * @lock: the mutex to be destroyed

