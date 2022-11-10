Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D32C623841
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Nov 2022 01:41:54 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N731r2Ng0z3f5B
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Nov 2022 11:41:52 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=knlpqkNl;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62c; helo=mail-pl1-x62c.google.com; envelope-from=jniethe5@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=knlpqkNl;
	dkim-atps=neutral
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N72zs4Vj6z3cHl
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Nov 2022 11:40:09 +1100 (AEDT)
Received: by mail-pl1-x62c.google.com with SMTP id d20so207367plr.10
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 09 Nov 2022 16:40:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:user-agent:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oYyKiv1x5nqDCQnykDsCR0FD8Pk64evQIr79l/80Brk=;
        b=knlpqkNlclxShNCAAljstoXFwMNbqvHbwMIuPnhZojdURUg5BRD+I17EbEpQ5dd+CB
         HSxwvgq4DxSe2hTqQQhwK9SFXOqzKxfr64fC6AmQSaJi1Q9ELh2yAgb/rf0RqEMc/USN
         5tSHOn7Vamys68nhVXBP3V6euUVN/nYuUsYI30/yvoEbLSGbOVLcnTrxnMCUvIRppNd5
         0YWXbxqHV4mNPs/eIeUyXqvaBf60dZOmqNDiEtAQWwhKGqXcUgcWLrP+VO3PE8XXVXZK
         ZXkAw59PpIo3pXW9uo0HF7g6RmGHxFTD5eIWBI/7SBjlxMJtd3g7j8MBeNBT0ZNUGBkS
         nHDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:user-agent:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oYyKiv1x5nqDCQnykDsCR0FD8Pk64evQIr79l/80Brk=;
        b=DokzMNgSEk4tJr234NJBoGGcVgYpMfBWSP/eSR0umu7e0dBtETrJuV5rHTON2cdzFw
         n+8p1sOepTrfzvM7EKNSldvkzzov/n5kgAqayhg48912G9mAfpgIi9tujSAJm+kfLbDk
         lcmo91EMV6NUAVlO4lJEF/2XcXNZkgYGR/w/k/jOfNUo+7S4B39eTZiw2rLj9CtrYQWX
         NRSuKtQpm9X2Vm2jn4bUuDjOP/yg+3CQVtxsN8f9dclPv31Dwgi3UugbK3G5TiMc4Akp
         q51169m2laVE0t4TwVX1i+NwMdQ44uA0vLyQEZj2CZ8NYWCMzYt3qTdjzh3FcsiQOMjg
         lMpA==
X-Gm-Message-State: ACrzQf0D+Zb8TNGABH5ZMouBbH3qSkDJTNyZtrW8XqKIXnApdRNNo392
	atqaOetPOIAtTKcrLbYd75Q5tcIR8hw=
X-Google-Smtp-Source: AMsMyM47Zmqqyj01bq7prh7Fm837NBOzGEGmkIZ+s+/cIAwzk/9+JobQ7thCME/tXf/zLa4LISIT+w==
X-Received: by 2002:a17:90a:e20d:b0:212:ec76:6fc6 with SMTP id a13-20020a17090ae20d00b00212ec766fc6mr65505334pjz.0.1668040807238;
        Wed, 09 Nov 2022 16:40:07 -0800 (PST)
Received: from tee480.ozlabs.ibm.com (110-175-254-242.static.tpgi.com.au. [110.175.254.242])
        by smtp.googlemail.com with ESMTPSA id b3-20020a62cf03000000b00562a526cd2esm8855848pfg.55.2022.11.09.16.40.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Nov 2022 16:40:06 -0800 (PST)
Message-ID: <5fdefbeaa6d81aa33c384c73e265049c43b70832.camel@gmail.com>
Subject: Re: [PATCH 05/17] powerpc/qspinlock: allow new waiters to steal the
 lock before queueing
From: Jordan Niethe <jniethe5@gmail.com>
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
Date: Thu, 10 Nov 2022 11:40:03 +1100
In-Reply-To: <20220728063120.2867508-7-npiggin@gmail.com>
References: <20220728063120.2867508-1-npiggin@gmail.com>
	 <20220728063120.2867508-7-npiggin@gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5-0ubuntu1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 2022-07-28 at 16:31 +1000, Nicholas Piggin wrote:
[resend as utf-8, not utf-7]
> Allow new waiters a number of spins on the lock word before queueing,
> which particularly helps paravirt performance when physical CPUs are
> oversubscribed.
> ---
>  arch/powerpc/lib/qspinlock.c | 152 ++++++++++++++++++++++++++++++++---
>  1 file changed, 141 insertions(+), 11 deletions(-)
> 
> diff --git a/arch/powerpc/lib/qspinlock.c b/arch/powerpc/lib/qspinlock.c
> index 7c71e5e287df..1625cce714b2 100644
> --- a/arch/powerpc/lib/qspinlock.c
> +++ b/arch/powerpc/lib/qspinlock.c
> @@ -19,8 +19,17 @@ struct qnodes {
>  	struct qnode nodes[MAX_NODES];
>  };
>  
> +/* Tuning parameters */
> +static int STEAL_SPINS __read_mostly = (1<<5);
> +static bool MAYBE_STEALERS __read_mostly = true;

I can understand why, but macro case variables can be a bit confusing.

> +
>  static DEFINE_PER_CPU_ALIGNED(struct qnodes, qnodes);
>  
> +static __always_inline int get_steal_spins(void)
> +{
> +	return STEAL_SPINS;
> +}
> +
>  static inline u32 encode_tail_cpu(void)
>  {
>  	return (smp_processor_id() + 1) << _Q_TAIL_CPU_OFFSET;
> @@ -76,6 +85,39 @@ static __always_inline int trylock_clear_tail_cpu(struct qspinlock *lock, u32 ol
>  	return 0;
>  }
>  
> +static __always_inline u32 __trylock_cmpxchg(struct qspinlock *lock, u32 old, u32 new)
> +{
> +	u32 prev;
> +
> +	BUG_ON(old & _Q_LOCKED_VAL);
> +
> +	asm volatile(
> +"1:	lwarx	%0,0,%1,%4	# queued_spin_trylock_cmpxchg		\n"

s/queued_spin_trylock_cmpxchg/__trylock_cmpxchg/

btw what is the format you using for the '\n's in the inline asm?

> +"	cmpw	0,%0,%2							\n"
> +"	bne-	2f							\n"
> +"	stwcx.	%3,0,%1							\n"
> +"	bne-	1b							\n"
> +"\t"	PPC_ACQUIRE_BARRIER "						\n"
> +"2:									\n"
> +	: "=&r" (prev)
> +	: "r" (&lock->val), "r"(old), "r" (new),
> +	  "i" (IS_ENABLED(CONFIG_PPC64) ? 1 : 0)
> +	: "cr0", "memory");

This is very similar to trylock_clear_tail_cpu(). So maybe it is worth having
some form of "test and set" primitive helper.

> +
> +	return prev;
> +}
> +
> +/* Take lock, preserving tail, cmpxchg with val (which must not be locked) */
> +static __always_inline int trylock_with_tail_cpu(struct qspinlock *lock, u32 val)
> +{
> +	u32 newval = _Q_LOCKED_VAL | (val & _Q_TAIL_CPU_MASK);
> +
> +	if (__trylock_cmpxchg(lock, val, newval) == val)
> +		return 1;
> +	else
> +		return 0;

same optional style nit: return __trylock_cmpxchg(lock, val, newval) == val

> +}
> +
>  /*
>   * Publish our tail, replacing previous tail. Return previous value.
>   *
> @@ -115,6 +157,31 @@ static struct qnode *get_tail_qnode(struct qspinlock *lock, u32 val)
>  	BUG();
>  }
>  
> +static inline bool try_to_steal_lock(struct qspinlock *lock)
> +{
> +	int iters;
> +
> +	/* Attempt to steal the lock */
> +	for (;;) {
> +		u32 val = READ_ONCE(lock->val);
> +
> +		if (unlikely(!(val & _Q_LOCKED_VAL))) {
> +			if (trylock_with_tail_cpu(lock, val))
> +				return true;
> +			continue;
> +		}

The continue would bypass iters++/cpu_relax but the next time around
  if (unlikely(!(val & _Q_LOCKED_VAL))) {
should fail so everything should be fine?

> +
> +		cpu_relax();
> +
> +		iters++;
> +
> +		if (iters >= get_steal_spins())
> +			break;
> +	}
> +
> +	return false;
> +}
> +
>  static inline void queued_spin_lock_mcs_queue(struct qspinlock *lock)
>  {
>  	struct qnodes *qnodesp;
> @@ -164,20 +231,39 @@ static inline void queued_spin_lock_mcs_queue(struct qspinlock *lock)
>  		smp_rmb(); /* acquire barrier for the mcs lock */
>  	}
>  
> -	/* We're at the head of the waitqueue, wait for the lock. */
> -	while ((val = READ_ONCE(lock->val)) & _Q_LOCKED_VAL)
> -		cpu_relax();
> +	if (!MAYBE_STEALERS) {
> +		/* We're at the head of the waitqueue, wait for the lock. */
> +		while ((val = READ_ONCE(lock->val)) & _Q_LOCKED_VAL)
> +			cpu_relax();
>  
> -	/* If we're the last queued, must clean up the tail. */
> -	if ((val & _Q_TAIL_CPU_MASK) == tail) {
> -		if (trylock_clear_tail_cpu(lock, val))
> -			goto release;
> -		/* Another waiter must have enqueued */
> -	}
> +		/* If we're the last queued, must clean up the tail. */
> +		if ((val & _Q_TAIL_CPU_MASK) == tail) {
> +			if (trylock_clear_tail_cpu(lock, val))
> +				goto release;
> +			/* Another waiter must have enqueued. */
> +		}
> +
> +		/* We must be the owner, just set the lock bit and acquire */
> +		lock_set_locked(lock);
> +	} else {
> +again:
> +		/* We're at the head of the waitqueue, wait for the lock. */
> +		while ((val = READ_ONCE(lock->val)) & _Q_LOCKED_VAL)
> +			cpu_relax();
>  
> -	/* We must be the owner, just set the lock bit and acquire */
> -	lock_set_locked(lock);
> +		/* If we're the last queued, must clean up the tail. */
> +		if ((val & _Q_TAIL_CPU_MASK) == tail) {
> +			if (trylock_clear_tail_cpu(lock, val))
> +				goto release;
> +			/* Another waiter must have enqueued, or lock stolen. */
> +		} else {
> +			if (trylock_with_tail_cpu(lock, val))
> +				goto unlock_next;
> +		}
> +		goto again;
> +	}
>  
> +unlock_next:
>  	/* contended path; must wait for next != NULL (MCS protocol) */
>  	while (!(next = READ_ONCE(node->next)))
>  		cpu_relax();
> @@ -197,6 +283,9 @@ static inline void queued_spin_lock_mcs_queue(struct qspinlock *lock)
>  
>  void queued_spin_lock_slowpath(struct qspinlock *lock)
>  {
> +	if (try_to_steal_lock(lock))
> +		return;
> +
>  	queued_spin_lock_mcs_queue(lock);
>  }
>  EXPORT_SYMBOL(queued_spin_lock_slowpath);
> @@ -207,3 +296,44 @@ void pv_spinlocks_init(void)
>  }
>  #endif
>  
> +#include <linux/debugfs.h>
> +static int steal_spins_set(void *data, u64 val)
> +{
> +	static DEFINE_MUTEX(lock);

I just want to check if it would be possible to get rid of the MAYBE_STEALERS
variable completely and do something like:

  bool maybe_stealers() { return STEAL_SPINS > 0; }

I guess based on the below code it wouldn't work, but I'm still not quite sure
why that is.

> +
> +	mutex_lock(&lock);
> +	if (val && !STEAL_SPINS) {
> +		MAYBE_STEALERS = true;
> +		/* wait for waiter to go away */
> +		synchronize_rcu();
> +		STEAL_SPINS = val;
> +	} else if (!val && STEAL_SPINS) {
> +		STEAL_SPINS = val;
> +		/* wait for all possible stealers to go away */
> +		synchronize_rcu();
> +		MAYBE_STEALERS = false;
> +	} else {
> +		STEAL_SPINS = val;
> +	}
> +	mutex_unlock(&lock);

STEAL_SPINS is an int not a u64.

> +
> +	return 0;
> +}
> +
> +static int steal_spins_get(void *data, u64 *val)
> +{
> +	*val = STEAL_SPINS;
> +
> +	return 0;
> +}
> +
> +DEFINE_SIMPLE_ATTRIBUTE(fops_steal_spins, steal_spins_get, steal_spins_set, "%llu\n");
> +
> +static __init int spinlock_debugfs_init(void)
> +{
> +	debugfs_create_file("qspl_steal_spins", 0600, arch_debugfs_dir, NULL, &fops_steal_spins);
> +
> +	return 0;
> +}
> +device_initcall(spinlock_debugfs_init);
> +

