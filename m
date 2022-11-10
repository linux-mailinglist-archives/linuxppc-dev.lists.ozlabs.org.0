Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2977A62383E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Nov 2022 01:41:02 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N730q6vc5z3f3y
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Nov 2022 11:40:59 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=lT2zuXOp;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::535; helo=mail-pg1-x535.google.com; envelope-from=jniethe5@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=lT2zuXOp;
	dkim-atps=neutral
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com [IPv6:2607:f8b0:4864:20::535])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N72zR0QG7z3cck
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Nov 2022 11:39:46 +1100 (AEDT)
Received: by mail-pg1-x535.google.com with SMTP id r18so193811pgr.12
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 09 Nov 2022 16:39:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:user-agent:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FmgT8Z58FxCbKY8TbaOWlJ/P63YrFV5OX2LVh5pIe2g=;
        b=lT2zuXOp4R9R6/xebDmoVlqZsT6gAgd51iLVTz/HMJ40EXj9jZ6GKDapLnfXcuqRfA
         PR3Z55lo0ZzP3fwuWT1EVWa8luS0VfsNoj7if7LiwO1iqG3X+RXaJjJjJ/xVC/EI8ih0
         CDOI+kIp+h9M3a8IHIgmiuL4jMeLL/LHW+NgYcSO/zCKSWNbHa/xj2pe8H0N4cyMSD9r
         /WmhJmQSHGY32WbykqTqxS1DYoQ9NI75ZFCRmwukVt2/VVw1q+nRyJxuKYk5cimVeOn+
         GZcLOC88qaln/2Hqf7KfW1V8HWEhYyWWDx3ouMoSuplbxrXd9SJR+83qfQ5Ribao/88c
         g7mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:user-agent:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FmgT8Z58FxCbKY8TbaOWlJ/P63YrFV5OX2LVh5pIe2g=;
        b=skSGyGWTQFBdar5YLGhE6GQpq6We+UL8qXHcXsSB5qEIdupE+DNSJ4lYkTV13fprix
         uIDgna3xtDsa9szUjfXw6w20hycdSUFLxuGpWgLitcjDKtlMCeQA+YK/asZXhT9wymnt
         3neOreY4HWE1T9RDWh4RLKDTraY9a0Rnmj7DeXh0IttwxpuNqOq4wYqMjcEMzKFcPS/c
         Osj0O1YxA2wKoOR+58eLYiX+inkmPlc2VneQbFKJ0dCvjIe/9n+IFSU8TgnQJsMHaPVy
         fHwSx15eFrPtwwfA7F6XlkJBqpva2Mur6tVxVAHjaqo+7mGz5LqQwhJsv3S8IplVLE1X
         uUmQ==
X-Gm-Message-State: ACrzQf0wB9qUp9d/RCvePEc2G3q/JSQYVKB9KDBbowsyks8G+HjhfYA3
	rRltVPWIOYA5IKr/g4np5A/oY/Ivn5A=
X-Google-Smtp-Source: AMsMyM7jSW25MwG8ojyJfW8MByKQXYAhsP72JJ5K2RBbBhWqQFwGIrqWO5BDN2T70PqE1V3uNNz1WQ==
X-Received: by 2002:a05:6a00:bd2:b0:56d:8bb9:5a0b with SMTP id x18-20020a056a000bd200b0056d8bb95a0bmr51546827pfu.20.1668040784714;
        Wed, 09 Nov 2022 16:39:44 -0800 (PST)
Received: from tee480.ozlabs.ibm.com (110-175-254-242.static.tpgi.com.au. [110.175.254.242])
        by smtp.googlemail.com with ESMTPSA id w25-20020aa79559000000b0056b8181861esm9151881pfq.19.2022.11.09.16.39.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Nov 2022 16:39:44 -0800 (PST)
Message-ID: <9ccfa76e921ea0b79a7ff166604004370e7aa30b.camel@gmail.com>
Subject: Re: [PATCH 04/17] powerpc/qspinlock: convert atomic operations to
 assembly
From: Jordan Niethe <jniethe5@gmail.com>
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
Date: Thu, 10 Nov 2022 11:39:40 +1100
In-Reply-To: <20220728063120.2867508-6-npiggin@gmail.com>
References: <20220728063120.2867508-1-npiggin@gmail.com>
	 <20220728063120.2867508-6-npiggin@gmail.com>
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
> This uses more optimal ll/sc style access patterns (rather than
> cmpxchg), and also sets the EH=1 lock hint on those operations
> which acquire ownership of the lock.
> ---
>  arch/powerpc/include/asm/qspinlock.h       | 25 +++++--
>  arch/powerpc/include/asm/qspinlock_types.h |  6 +-
>  arch/powerpc/lib/qspinlock.c               | 81 +++++++++++++++-------
>  3 files changed, 79 insertions(+), 33 deletions(-)
> 
> diff --git a/arch/powerpc/include/asm/qspinlock.h b/arch/powerpc/include/asm/qspinlock.h
> index 79a1936fb68d..3ab354159e5e 100644
> --- a/arch/powerpc/include/asm/qspinlock.h
> +++ b/arch/powerpc/include/asm/qspinlock.h
> @@ -2,28 +2,43 @@
>  #ifndef _ASM_POWERPC_QSPINLOCK_H
>  #define _ASM_POWERPC_QSPINLOCK_H
>  
> -#include <linux/atomic.h>
>  #include <linux/compiler.h>
>  #include <asm/qspinlock_types.h>
>  
>  static __always_inline int queued_spin_is_locked(struct qspinlock *lock)
>  {
> -	return atomic_read(&lock->val);
> +	return READ_ONCE(lock->val);
>  }
>  
>  static __always_inline int queued_spin_value_unlocked(struct qspinlock lock)
>  {
> -	return !atomic_read(&lock.val);
> +	return !lock.val;
>  }
>  
>  static __always_inline int queued_spin_is_contended(struct qspinlock *lock)
>  {
> -	return !!(atomic_read(&lock->val) & _Q_TAIL_CPU_MASK);
> +	return !!(READ_ONCE(lock->val) & _Q_TAIL_CPU_MASK);
>  }
>  
>  static __always_inline int queued_spin_trylock(struct qspinlock *lock)
>  {
> -	if (atomic_cmpxchg_acquire(&lock->val, 0, _Q_LOCKED_VAL) == 0)
> +	u32 new = _Q_LOCKED_VAL;
> +	u32 prev;
> +
> +	asm volatile(
> +"1:	lwarx	%0,0,%1,%3	# queued_spin_trylock			\n"
> +"	cmpwi	0,%0,0							\n"
> +"	bne-	2f							\n"
> +"	stwcx.	%2,0,%1							\n"
> +"	bne-	1b							\n"
> +"\t"	PPC_ACQUIRE_BARRIER "						\n"
> +"2:									\n"
> +	: "=&r" (prev)
> +	: "r" (&lock->val), "r" (new),
> +	  "i" (IS_ENABLED(CONFIG_PPC64) ? 1 : 0)

btw IS_ENABLED() already returns 1 or 0

> +	: "cr0", "memory");

This is the ISA's "test and set" atomic primitive. Do you think it would be worth seperating it as a helper?

> +
> +	if (likely(prev == 0))
>  		return 1;
>  	return 0;

same optional style nit: return likely(prev == 0);

>  }
> diff --git a/arch/powerpc/include/asm/qspinlock_types.h b/arch/powerpc/include/asm/qspinlock_types.h
> index 3425dab42576..210adf05b235 100644
> --- a/arch/powerpc/include/asm/qspinlock_types.h
> +++ b/arch/powerpc/include/asm/qspinlock_types.h
> @@ -7,7 +7,7 @@
>  
>  typedef struct qspinlock {
>  	union {
> -		atomic_t val;
> +		u32 val;
>  
>  #ifdef __LITTLE_ENDIAN
>  		struct {
> @@ -23,10 +23,10 @@ typedef struct qspinlock {
>  	};
>  } arch_spinlock_t;
>  
> -#define	__ARCH_SPIN_LOCK_UNLOCKED	{ { .val = ATOMIC_INIT(0) } }
> +#define	__ARCH_SPIN_LOCK_UNLOCKED	{ { .val = 0 } }
>  
>  /*
> - * Bitfields in the atomic value:
> + * Bitfields in the lock word:
>   *
>   *     0: locked bit
>   * 16-31: tail cpu (+1)
> diff --git a/arch/powerpc/lib/qspinlock.c b/arch/powerpc/lib/qspinlock.c
> index 5ebb88d95636..7c71e5e287df 100644
> --- a/arch/powerpc/lib/qspinlock.c
> +++ b/arch/powerpc/lib/qspinlock.c
> @@ -1,5 +1,4 @@
>  // SPDX-License-Identifier: GPL-2.0-or-later
> -#include <linux/atomic.h>
>  #include <linux/bug.h>
>  #include <linux/compiler.h>
>  #include <linux/export.h>
> @@ -22,32 +21,59 @@ struct qnodes {
>  
>  static DEFINE_PER_CPU_ALIGNED(struct qnodes, qnodes);
>  
> -static inline int encode_tail_cpu(void)
> +static inline u32 encode_tail_cpu(void)
>  {
>  	return (smp_processor_id() + 1) << _Q_TAIL_CPU_OFFSET;
>  }
>  
> -static inline int get_tail_cpu(int val)
> +static inline int get_tail_cpu(u32 val)
>  {
>  	return (val >> _Q_TAIL_CPU_OFFSET) - 1;
>  }
>  
>  /* Take the lock by setting the bit, no other CPUs may concurrently lock it. */

I think you missed deleting the above line.

> +/* Take the lock by setting the lock bit, no other CPUs will touch it. */
>  static __always_inline void lock_set_locked(struct qspinlock *lock)
>  {
> -	atomic_or(_Q_LOCKED_VAL, &lock->val);
> -	__atomic_acquire_fence();
> +	u32 new = _Q_LOCKED_VAL;
> +	u32 prev;
> +
> +	asm volatile(
> +"1:	lwarx	%0,0,%1,%3	# lock_set_locked			\n"
> +"	or	%0,%0,%2						\n"
> +"	stwcx.	%0,0,%1							\n"
> +"	bne-	1b							\n"
> +"\t"	PPC_ACQUIRE_BARRIER "						\n"
> +	: "=&r" (prev)
> +	: "r" (&lock->val), "r" (new),
> +	  "i" (IS_ENABLED(CONFIG_PPC64) ? 1 : 0)
> +	: "cr0", "memory");
>  }

This is pretty similar with the DEFINE_TESTOP() pattern from
arch/powerpc/include/asm/bitops.h (such as test_and_set_bits_lock()) except for
word instead of double word. Do you think it's possible / beneficial to make
use of those macros?


>  
> -/* Take lock, clearing tail, cmpxchg with val (which must not be locked) */
> -static __always_inline int trylock_clear_tail_cpu(struct qspinlock *lock, int val)
> +/* Take lock, clearing tail, cmpxchg with old (which must not be locked) */
> +static __always_inline int trylock_clear_tail_cpu(struct qspinlock *lock, u32 old)
>  {
> -	int newval = _Q_LOCKED_VAL;
> -
> -	if (atomic_cmpxchg_acquire(&lock->val, val, newval) == val)
> +	u32 new = _Q_LOCKED_VAL;
> +	u32 prev;
> +
> +	BUG_ON(old & _Q_LOCKED_VAL);

The BUG_ON() could have been introduced in an earlier patch I think.

> +
> +	asm volatile(
> +"1:	lwarx	%0,0,%1,%4	# trylock_clear_tail_cpu		\n"
> +"	cmpw	0,%0,%2							\n"
> +"	bne-	2f							\n"
> +"	stwcx.	%3,0,%1							\n"
> +"	bne-	1b							\n"
> +"\t"	PPC_ACQUIRE_BARRIER "						\n"
> +"2:									\n"
> +	: "=&r" (prev)
> +	: "r" (&lock->val), "r"(old), "r" (new),

Could this be like  "r"(_Q_TAIL_CPU_MASK) below?
i.e. "r" (_Q_LOCKED_VAL)? Makes it clear new doesn't change.

> +	  "i" (IS_ENABLED(CONFIG_PPC64) ? 1 : 0)
> +	: "cr0", "memory");
> +
> +	if (likely(prev == old))
>  		return 1;
> -	else
> -		return 0;
> +	return 0;
>  }
>  
>  /*
> @@ -56,20 +82,25 @@ static __always_inline int trylock_clear_tail_cpu(struct qspinlock *lock, int va
>   * This provides a release barrier for publishing node, and an acquire barrier

Does the comment mean there needs to be an acquire barrier in this assembly?


>   * for getting the old node.
>   */
> -static __always_inline int publish_tail_cpu(struct qspinlock *lock, int tail)
> +static __always_inline u32 publish_tail_cpu(struct qspinlock *lock, u32 tail)
>  {
> -	for (;;) {
> -		int val = atomic_read(&lock->val);
> -		int newval = (val & ~_Q_TAIL_CPU_MASK) | tail;
> -		int old;
> -
> -		old = atomic_cmpxchg(&lock->val, val, newval);
> -		if (old == val)
> -			return old;
> -	}
> +	u32 prev, tmp;
> +
> +	asm volatile(
> +"\t"	PPC_RELEASE_BARRIER "						\n"
> +"1:	lwarx	%0,0,%2		# publish_tail_cpu			\n"
> +"	andc	%1,%0,%4						\n"
> +"	or	%1,%1,%3						\n"
> +"	stwcx.	%1,0,%2							\n"
> +"	bne-	1b							\n"
> +	: "=&r" (prev), "=&r"(tmp)
> +	: "r" (&lock->val), "r" (tail), "r"(_Q_TAIL_CPU_MASK)
> +	: "cr0", "memory");
> +
> +	return prev;
>  }
>  
> -static struct qnode *get_tail_qnode(struct qspinlock *lock, int val)
> +static struct qnode *get_tail_qnode(struct qspinlock *lock, u32 val)
>  {
>  	int cpu = get_tail_cpu(val);
>  	struct qnodes *qnodesp = per_cpu_ptr(&qnodes, cpu);
> @@ -88,7 +119,7 @@ static inline void queued_spin_lock_mcs_queue(struct qspinlock *lock)
>  {
>  	struct qnodes *qnodesp;
>  	struct qnode *next, *node;
> -	int val, old, tail;
> +	u32 val, old, tail;
>  	int idx;
>  
>  	BUILD_BUG_ON(CONFIG_NR_CPUS >= (1U << _Q_TAIL_CPU_BITS));
> @@ -134,7 +165,7 @@ static inline void queued_spin_lock_mcs_queue(struct qspinlock *lock)
>  	}
>  
>  	/* We're at the head of the waitqueue, wait for the lock. */
> -	while ((val = atomic_read(&lock->val)) & _Q_LOCKED_VAL)
> +	while ((val = READ_ONCE(lock->val)) & _Q_LOCKED_VAL)
>  		cpu_relax();
>  
>  	/* If we're the last queued, must clean up the tail. */

