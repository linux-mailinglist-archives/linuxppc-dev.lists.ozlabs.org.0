Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5706D874C5B
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Mar 2024 11:26:55 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=nic.cz header.i=@nic.cz header.a=rsa-sha256 header.s=default header.b=U0oRVyb/;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tr57x0bl2z3vX1
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Mar 2024 21:26:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=nic.cz header.i=@nic.cz header.a=rsa-sha256 header.s=default header.b=U0oRVyb/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nic.cz (client-ip=2001:1488:800:400::400; helo=mail.nic.cz; envelope-from=marek.behun@nic.cz; receiver=lists.ozlabs.org)
X-Greylist: delayed 574 seconds by postgrey-1.37 at boromir; Thu, 07 Mar 2024 21:06:50 AEDT
Received: from mail.nic.cz (mail.nic.cz [IPv6:2001:1488:800:400::400])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tr4hp1z9hz3dJ0
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Mar 2024 21:06:50 +1100 (AEDT)
Received: from kandell (unknown [172.20.6.140])
	by mail.nic.cz (Postfix) with ESMTPS id A3B251C035F;
	Thu,  7 Mar 2024 10:56:58 +0100 (CET)
Authentication-Results: mail.nic.cz;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nic.cz; s=default;
	t=1709805421; bh=76Jo3UVwHUPVJ1Mxh3dPGM0nxOmpEeJydflFioZTAPQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From:Reply-To:
	 Subject:To:Cc;
	b=U0oRVyb/byvyZefng+g9v35ujBi7vq6aYkmzvkKCrDxKkrm4GdejErIA4KhO0xVnT
	 WUqRgmcFvpZBesK2q11bJeZP+NENK/F4uNa1T0zLPva3uD4Ifw484KchmjTu7f5Ttu
	 hIwK7zAsQ5g2CzFLPtjyTUvjxJV5Q6v7IBTxzfwg=
Date: Thu, 7 Mar 2024 10:56:58 +0100
From: Marek =?utf-8?B?QmVow7pu?= <marek.behun@nic.cz>
To: George Stark <gnstark@salutedevices.com>
Subject: Re: [PATCH v5 02/10] locking/mutex: introduce devm_mutex_init
Message-ID: <20240307095639.b6utkbzr36liuu3p@kandell>
References: <20240307024034.1548605-1-gnstark@salutedevices.com>
 <20240307024034.1548605-3-gnstark@salutedevices.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240307024034.1548605-3-gnstark@salutedevices.com>
X-Virus-Scanned: clamav-milter 0.103.10 at mail
X-Virus-Status: Clean
X-Rspamd-Queue-Id: A3B251C035F
X-Rspamd-Pre-Result: action=no action;
	module=multimap;
	Matched map: WHITELISTED_IP
X-Spam-Status: No, score=-0.10
X-Spamd-Result: default: False [-0.10 / 20.00];
	MIME_GOOD(-0.10)[text/plain];
	WHITELISTED_IP(0.00)[172.20.6.140];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	ARC_NA(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TAGGED_RCPT(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com]
X-Rspamd-Action: no action
X-Spamd-Bar: /
X-Rspamd-Server: mail
X-Mailman-Approved-At: Thu, 07 Mar 2024 21:26:16 +1100
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
Cc: kabel@kernel.org, linuxppc-dev@lists.ozlabs.org, vadimp@nvidia.com, mazziesaccount@gmail.com, peterz@infradead.org, boqun.feng@gmail.com, lee@kernel.org, kernel@salutedevices.com, linux-kernel@vger.kernel.org, npiggin@gmail.com, hdegoede@redhat.com, andy.shevchenko@gmail.com, mingo@redhat.com, pavel@ucw.cz, longman@redhat.com, nikitos.tr@gmail.com, will@kernel.org, linux-leds@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Mar 07, 2024 at 05:40:26AM +0300, George Stark wrote:
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
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---
>  Hello Christophe. Hope you don't mind I put you SoB tag because you helped alot
>  to make this patch happen.
> 
>  include/linux/mutex.h        | 13 +++++++++++++
>  kernel/locking/mutex-debug.c | 22 ++++++++++++++++++++++
>  2 files changed, 35 insertions(+)
> 
> diff --git a/include/linux/mutex.h b/include/linux/mutex.h
> index f7611c092db7..9bcf72cb941a 100644
> --- a/include/linux/mutex.h
> +++ b/include/linux/mutex.h
> @@ -22,6 +22,8 @@
>  #include <linux/cleanup.h>
>  #include <linux/mutex_types.h>
> 
> +struct device;
> +
>  #ifdef CONFIG_DEBUG_LOCK_ALLOC
>  # define __DEP_MAP_MUTEX_INITIALIZER(lockname)			\
>  		, .dep_map = {					\
> @@ -115,10 +117,21 @@ do {							\
> 
>  #ifdef CONFIG_DEBUG_MUTEXES
> 
> +int devm_mutex_init(struct device *dev, struct mutex *lock);
>  void mutex_destroy(struct mutex *lock);
> 
>  #else
> 
> +static inline int devm_mutex_init(struct device *dev, struct mutex *lock)
> +{
> +	/*
> +	 * since mutex_destroy is nop actually there's no need to register it
> +	 * in devm subsystem.
> +	 */
> +	mutex_init(lock);
> +	return 0;
> +}
> +
>  static inline void mutex_destroy(struct mutex *lock) {}
> 
>  #endif
> diff --git a/kernel/locking/mutex-debug.c b/kernel/locking/mutex-debug.c
> index bc8abb8549d2..c9efab1a8026 100644
> --- a/kernel/locking/mutex-debug.c
> +++ b/kernel/locking/mutex-debug.c
> @@ -19,6 +19,7 @@
>  #include <linux/kallsyms.h>
>  #include <linux/interrupt.h>
>  #include <linux/debug_locks.h>
> +#include <linux/device.h>
> 
>  #include "mutex.h"
> 
> @@ -104,3 +105,24 @@ void mutex_destroy(struct mutex *lock)
>  }
> 
>  EXPORT_SYMBOL_GPL(mutex_destroy);
> +
> +static void devm_mutex_release(void *res)
> +{
> +	mutex_destroy(res);
> +}
> +
> +/**
> + * devm_mutex_init - Resource-managed mutex initialization
> + * @dev:	Device which lifetime mutex is bound to
> + * @lock:	Pointer to a mutex
> + *
> + * Initialize mutex which is automatically destroyed when the driver is detached.
> + *
> + * Returns: 0 on success or a negative error code on failure.
> + */
> +int devm_mutex_init(struct device *dev, struct mutex *lock)
> +{
> +	mutex_init(lock);
> +	return devm_add_action_or_reset(dev, devm_mutex_release, lock);
> +}
> +EXPORT_SYMBOL_GPL(devm_mutex_init);

Hi George,

look at
https://lore.kernel.org/lkml/7013bf9e-2663-4613-ae61-61872e81355b@redhat.com/
where Matthew and Hans explain that devm_mutex_init needs to be a macro
because of the static lockdep key. 

so this should be something like:

static inline int __devm_mutex_init(struct device *dev, struct mutex *mutex,
				    const char *name,
				    struct lock_class_key *key)
{
	__mutex_init(mutex, name, key);
	return devm_add_action_or_reset(dev, devm_mutex_release, mutex);
}

#define devm_mutex_init(dev, mutex)				\
do {								\
	static struct lock_class_key __key;			\
								\
	__devm_mutex_init(dev, (mutex), #mutex, &__key);	\
} while (0);


Marek
