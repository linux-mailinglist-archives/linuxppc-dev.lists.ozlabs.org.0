Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EFB5623836
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Nov 2022 01:37:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N72wR1kDMz3dvJ
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Nov 2022 11:37:11 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=OYwRZZ70;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1034; helo=mail-pj1-x1034.google.com; envelope-from=jniethe5@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=OYwRZZ70;
	dkim-atps=neutral
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N72vJ4h59z3cMb
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Nov 2022 11:36:12 +1100 (AEDT)
Received: by mail-pj1-x1034.google.com with SMTP id c15-20020a17090a1d0f00b0021365864446so268970pjd.4
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 09 Nov 2022 16:36:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:user-agent:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=am0p+gNfDWX0dI4nJhNQ/uyihvAdqJVzp6DRHTNaD6Q=;
        b=OYwRZZ70mUKQQgYYYrMZQ+YYAsI984TJpyf9NeXsR3tjUIZMX+RnMLg0uubCxsVu1K
         LKwOkSwG4kZMdPd4xdALKgLGWNO/1mxxFdV1D30fJQdXHps4t0KiwGwXy3v4z5LP5PJI
         U+8jZ5MmqrexyefyixfyQjE/m0g4J2mrwXAR5oNwehD07BD4I18PC8dIXA3vUHW/WjDD
         Dqh23Gd0nKBnPTV1mt8/SFEUHKTpjSMMS2wHGQZTh5FPLIxX8tHmeFNToOAFqi9jZi/V
         R9PYGOkDGpvRVybo2mH8CJ7PDECOvXV9zZFLXXX8wks06oXIIFjxgW1wY0oaH3MvAkj1
         b+Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:user-agent:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=am0p+gNfDWX0dI4nJhNQ/uyihvAdqJVzp6DRHTNaD6Q=;
        b=gjhR9jsTlW35d4pptNnDDyaNF8EnGJnwR5vH//vEyIQqoL0Hm4E7YTGAzWl4TzlDO5
         YfEnABuF4PK1mB5rOH/yqpDk59UU6KKqKJFTyZ9Jr3IZ1U0+iT/8LsBl1p/gvzdZd9OL
         9lSqismRQtFDGz08crzrLEYrz+q5OTkNbkTtxf5GtlgZrtRvUfW0eIRvReF5iu1zOzc2
         WBsUdSD8DDAhyYr2V45eaGbxyKvQuBiGfxy4Qz2s2uqaMEyDK8ic55IguKzHOR2OB0iD
         HWClFmSnlh5Zas9bq7vsJwc0mWoLfqQ2oV6mgLTDlhvJrgp39O5QDFZCIizc9ZToxJVL
         sXwA==
X-Gm-Message-State: ANoB5pnQ0ONgPDm1nmLTTXfx4TTK+/F5PUlC0F9CvZzHC0e3+K8JObd2
	ctcV2rP9i9/r2U67O0WDAhc=
X-Google-Smtp-Source: AA0mqf6Cr2qCLefZmGgDWsmGmnJZ7jCzNOGDWpLwFNy+016Sab4PiXsa3SaXgSuFdoTeShjdP5iYig==
X-Received: by 2002:a17:902:a401:b0:188:79ba:d542 with SMTP id p1-20020a170902a40100b0018879bad542mr21882048plq.126.1668040570326;
        Wed, 09 Nov 2022 16:36:10 -0800 (PST)
Received: from tee480.ozlabs.ibm.com (110-175-254-242.static.tpgi.com.au. [110.175.254.242])
        by smtp.googlemail.com with ESMTPSA id k1-20020a170902760100b00186abb95bfdsm9685433pll.25.2022.11.09.16.36.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Nov 2022 16:36:09 -0800 (PST)
Message-ID: <e8fd017828415c10e71c71a7e1bdbb26faca7719.camel@gmail.com>
Subject: Re: [PATCH 02/17] powerpc/qspinlock: add mcs queueing for contended
 waiters
From: Jordan Niethe <jniethe5@gmail.com>
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
Date: Thu, 10 Nov 2022 11:36:04 +1100
In-Reply-To: <20220728063120.2867508-4-npiggin@gmail.com>
References: <20220728063120.2867508-1-npiggin@gmail.com>
	 <20220728063120.2867508-4-npiggin@gmail.com>
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
<snip>
[resend as utf-8, not utf-7]
>  
> +/*
> + * Bitfields in the atomic value:
> + *
> + *     0: locked bit
> + * 16-31: tail cpu (+1)
> + */
> +#define	_Q_SET_MASK(type)	(((1U << _Q_ ## type ## _BITS) - 1)\
> +				      << _Q_ ## type ## _OFFSET)
> +#define _Q_LOCKED_OFFSET	0
> +#define _Q_LOCKED_BITS		1
> +#define _Q_LOCKED_MASK		_Q_SET_MASK(LOCKED)
> +#define _Q_LOCKED_VAL		(1U << _Q_LOCKED_OFFSET)
> +
> +#define _Q_TAIL_CPU_OFFSET	16
> +#define _Q_TAIL_CPU_BITS	(32 - _Q_TAIL_CPU_OFFSET)
> +#define _Q_TAIL_CPU_MASK	_Q_SET_MASK(TAIL_CPU)
> +

Just to state the obvious this is:

#define _Q_LOCKED_OFFSET	0
#define _Q_LOCKED_BITS		1
#define _Q_LOCKED_MASK		0x00000001
#define _Q_LOCKED_VAL		1

#define _Q_TAIL_CPU_OFFSET	16
#define _Q_TAIL_CPU_BITS	16
#define _Q_TAIL_CPU_MASK	0xffff0000

> +#if CONFIG_NR_CPUS >= (1U << _Q_TAIL_CPU_BITS)
> +#error "qspinlock does not support such large CONFIG_NR_CPUS"
> +#endif
> +
>  #endif /* _ASM_POWERPC_QSPINLOCK_TYPES_H */
> diff --git a/arch/powerpc/lib/qspinlock.c b/arch/powerpc/lib/qspinlock.c
> index 8dbce99a373c..5ebb88d95636 100644
> --- a/arch/powerpc/lib/qspinlock.c
> +++ b/arch/powerpc/lib/qspinlock.c
> @@ -1,12 +1,172 @@
>  // SPDX-License-Identifier: GPL-2.0-or-later
> +#include <linux/atomic.h>
> +#include <linux/bug.h>
> +#include <linux/compiler.h>
>  #include <linux/export.h>
> -#include <linux/processor.h>
> +#include <linux/percpu.h>
> +#include <linux/smp.h>
>  #include <asm/qspinlock.h>
>  
> -void queued_spin_lock_slowpath(struct qspinlock *lock)
> +#define MAX_NODES	4
> +
> +struct qnode {
> +	struct qnode	*next;
> +	struct qspinlock *lock;
> +	u8		locked; /* 1 if lock acquired */
> +};
> +
> +struct qnodes {
> +	int		count;
> +	struct qnode nodes[MAX_NODES];
> +};

I think it could be worth commenting why qnodes::count instead _Q_TAIL_IDX_OFFSET.

> +
> +static DEFINE_PER_CPU_ALIGNED(struct qnodes, qnodes);
> +
> +static inline int encode_tail_cpu(void)

I think the generic version that takes smp_processor_id() as a parameter is clearer - at least with this function name.

> +{
> +	return (smp_processor_id() + 1) << _Q_TAIL_CPU_OFFSET;
> +}
> +
> +static inline int get_tail_cpu(int val)

It seems like there should be a "decode" function to pair up with the "encode" function.

> +{
> +	return (val >> _Q_TAIL_CPU_OFFSET) - 1;
> +}
> +
> +/* Take the lock by setting the bit, no other CPUs may concurrently lock it. */

Does that comment mean it is not necessary to use an atomic_or here?

> +static __always_inline void lock_set_locked(struct qspinlock *lock)

nit: could just be called set_locked()

> +{
> +	atomic_or(_Q_LOCKED_VAL, &lock->val);
> +	__atomic_acquire_fence();
> +}
> +
> +/* Take lock, clearing tail, cmpxchg with val (which must not be locked) */
> +static __always_inline int trylock_clear_tail_cpu(struct qspinlock *lock, int val)
> +{
> +	int newval = _Q_LOCKED_VAL;
> +
> +	if (atomic_cmpxchg_acquire(&lock->val, val, newval) == val)
> +		return 1;
> +	else
> +		return 0;

same optional style nit: return (atomic_cmpxchg_acquire(&lock->val, val, newval) == val);

> +}
> +
> +/*
> + * Publish our tail, replacing previous tail. Return previous value.
> + *
> + * This provides a release barrier for publishing node, and an acquire barrier
> + * for getting the old node.
> + */
> +static __always_inline int publish_tail_cpu(struct qspinlock *lock, int tail)

Did you change from the xchg_tail() name in the generic version because of the release and acquire barriers this provides?
Does "publish" generally imply the old value will be returned?

>  {
> -	while (!queued_spin_trylock(lock))
> +	for (;;) {
> +		int val = atomic_read(&lock->val);
> +		int newval = (val & ~_Q_TAIL_CPU_MASK) | tail;
> +		int old;
> +
> +		old = atomic_cmpxchg(&lock->val, val, newval);
> +		if (old == val)
> +			return old;
> +	}
> +}
> +
> +static struct qnode *get_tail_qnode(struct qspinlock *lock, int val)
> +{
> +	int cpu = get_tail_cpu(val);
> +	struct qnodes *qnodesp = per_cpu_ptr(&qnodes, cpu);
> +	int idx;
> +
> +	for (idx = 0; idx < MAX_NODES; idx++) {
> +		struct qnode *qnode = &qnodesp->nodes[idx];
> +		if (qnode->lock == lock)
> +			return qnode;
> +	}

In case anyone else is confused by this, Nick explained each cpu can only queue on a unique spinlock once regardless of "idx" level.

> +
> +	BUG();
> +}
> +
> +static inline void queued_spin_lock_mcs_queue(struct qspinlock *lock)
> +{
> +	struct qnodes *qnodesp;
> +	struct qnode *next, *node;
> +	int val, old, tail;
> +	int idx;
> +
> +	BUILD_BUG_ON(CONFIG_NR_CPUS >= (1U << _Q_TAIL_CPU_BITS));
> +
> +	qnodesp = this_cpu_ptr(&qnodes);
> +	if (unlikely(qnodesp->count == MAX_NODES)) {

The comparison is >= in the generic, I guess we've no nested NMI so this is safe?

> +		while (!queued_spin_trylock(lock))
> +			cpu_relax();
> +		return;
> +	}
> +
> +	idx = qnodesp->count++;
> +	/*
> +	 * Ensure that we increment the head node->count before initialising
> +	 * the actual node. If the compiler is kind enough to reorder these
> +	 * stores, then an IRQ could overwrite our assignments.
> +	 */
> +	barrier();
> +	node = &qnodesp->nodes[idx];
> +	node->next = NULL;
> +	node->lock = lock;
> +	node->locked = 0;
> +
> +	tail = encode_tail_cpu();
> +
> +	old = publish_tail_cpu(lock, tail);
> +
> +	/*
> +	 * If there was a previous node; link it and wait until reaching the
> +	 * head of the waitqueue.
> +	 */
> +	if (old & _Q_TAIL_CPU_MASK) {
> +		struct qnode *prev = get_tail_qnode(lock, old);
> +
> +		/* Link @node into the waitqueue. */
> +		WRITE_ONCE(prev->next, node);
> +
> +		/* Wait for mcs node lock to be released */
> +		while (!node->locked)
> +			cpu_relax();
> +
> +		smp_rmb(); /* acquire barrier for the mcs lock */
> +	}
> +
> +	/* We're at the head of the waitqueue, wait for the lock. */
> +	while ((val = atomic_read(&lock->val)) & _Q_LOCKED_VAL)
> +		cpu_relax();
> +
> +	/* If we're the last queued, must clean up the tail. */
> +	if ((val & _Q_TAIL_CPU_MASK) == tail) {
> +		if (trylock_clear_tail_cpu(lock, val))
> +			goto release;
> +		/* Another waiter must have enqueued */
> +	}
> +
> +	/* We must be the owner, just set the lock bit and acquire */
> +	lock_set_locked(lock);
> +
> +	/* contended path; must wait for next != NULL (MCS protocol) */
> +	while (!(next = READ_ONCE(node->next)))
>  		cpu_relax();
> +
> +	/*
> +	 * Unlock the next mcs waiter node. Release barrier is not required
> +	 * here because the acquirer is only accessing the lock word, and
> +	 * the acquire barrier we took the lock with orders that update vs
> +	 * this store to locked. The corresponding barrier is the smp_rmb()
> +	 * acquire barrier for mcs lock, above.
> +	 */
> +	WRITE_ONCE(next->locked, 1);
> +
> +release:
> +	qnodesp->count--; /* release the node */
> +}
> +
> +void queued_spin_lock_slowpath(struct qspinlock *lock)
> +{
> +	queued_spin_lock_mcs_queue(lock);
>  }
>  EXPORT_SYMBOL(queued_spin_lock_slowpath);
>  

