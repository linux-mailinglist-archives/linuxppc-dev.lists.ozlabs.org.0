Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B7FF62386F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Nov 2022 01:52:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N73GS1YLfz3f9s
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Nov 2022 11:52:48 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=cBJb886V;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62c; helo=mail-pl1-x62c.google.com; envelope-from=jniethe5@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=cBJb886V;
	dkim-atps=neutral
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N734s4DfNz3f9Z
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Nov 2022 11:44:29 +1100 (AEDT)
Received: by mail-pl1-x62c.google.com with SMTP id k7so227905pll.6
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 09 Nov 2022 16:44:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:user-agent:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rLsd7rznfYA3KKOdJS+df6ZYcUuSSlL2QHUNw0dJ+o0=;
        b=cBJb886V4oQLjGYq2sSgXdbjTRROlFbyvEcrSTtjNb5bWtQMwz/JaUQUyiLQx9xlti
         MDo/JA6bDkE+EO1dDmO3Nx4orLDIoDChQxdgObtizeZQd504rvwVilcaN+6F7VwUpmNt
         g88s9ibrA2ZzvaSgUYIHrZhBn9whxhg92kSEIG8hu91sx/Af32PDzzPGIYLRSQoPibTs
         LJCyM0AvKDKCDzhd8M66hgQgDLttIiNgJduThhDdIaL2MPn4OO6us8MUkd0NjQn1o9pS
         CvgcfbwEe2FJQYamJIHhJXyzKzVTW8iyRCXo64l2pBSJswTvn3lLssFoYEYMcFr3h4Kv
         ihDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:user-agent:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rLsd7rznfYA3KKOdJS+df6ZYcUuSSlL2QHUNw0dJ+o0=;
        b=lzcW+90CdvoFxvPy5UVnPAduVJqg2lMZHIeE4HbmUohvYdHTFCWDtF00NJkUFEN2Zt
         nYH+UAaVAopH+/TwFY1l2FzVE7Ep3sO/nB5RaXD+iyKxKdVsBwHgDCrZeuSUArf7+KC4
         RbRY38dcg/SEe0qbrABzoKZGYCss+x/4p47QxZ6biXH4PL6tllSKzSOBffLvK1Pj147+
         TcminHGIpr1c5+595/MbUZXYAxFFbWQdRQnUFWTmeKf2De2ihSaYrjMnLPx3nLU7zGdE
         eySdP01TwFZel5+4TmSk+8KpG+ocJ0QSnNVDQ5B+6feuNdxeDtRYWBa/j7qHokkRvjTb
         kvCg==
X-Gm-Message-State: ACrzQf356GbJvw32lEX9knEm0iBuhI2+P481jtdsKQB06SQCJdsIHdjc
	G7fcvS/y3K/ktsp+ZWaKMeEsrSfx6eI=
X-Google-Smtp-Source: AMsMyM7arTQqsDWB1WbqO08IDNDP5lC4Qt6A4AG//VFEYccD4tk1S3Su8I3LUd0N+8Wju5/l6n9Agw==
X-Received: by 2002:a17:90a:1a44:b0:215:d520:f5a1 with SMTP id 4-20020a17090a1a4400b00215d520f5a1mr39280073pjl.182.1668041067661;
        Wed, 09 Nov 2022 16:44:27 -0800 (PST)
Received: from tee480.ozlabs.ibm.com (110-175-254-242.static.tpgi.com.au. [110.175.254.242])
        by smtp.googlemail.com with ESMTPSA id 7-20020a620407000000b005289a50e4c2sm8846131pfe.23.2022.11.09.16.44.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Nov 2022 16:44:27 -0800 (PST)
Message-ID: <3ee8195c7491c8e4598977713d10873fc95346e1.camel@gmail.com>
Subject: Re: [PATCH 17/17] powerpc/qspinlock: provide accounting and options
 for sleepy locks
From: Jordan Niethe <jniethe5@gmail.com>
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
Date: Thu, 10 Nov 2022 11:44:24 +1100
In-Reply-To: <20220728063120.2867508-19-npiggin@gmail.com>
References: <20220728063120.2867508-1-npiggin@gmail.com>
	 <20220728063120.2867508-19-npiggin@gmail.com>
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
> Finding the owner or a queued waiter on a lock with a preempted vcpu
> is indicative of an oversubscribed guest causing the lock to get into
> trouble. Provide some options to detect this situation and have new
> CPUs avoid queueing for a longer time (more steal iterations) to
> minimise the problems caused by vcpu preemption on the queue.
> ---
>  arch/powerpc/include/asm/qspinlock_types.h |   7 +-
>  arch/powerpc/lib/qspinlock.c               | 240 +++++++++++++++++++--
>  2 files changed, 232 insertions(+), 15 deletions(-)
> 
> diff --git a/arch/powerpc/include/asm/qspinlock_types.h b/arch/powerpc/include/asm/qspinlock_types.h
> index 35f9525381e6..4fbcc8a4230b 100644
> --- a/arch/powerpc/include/asm/qspinlock_types.h
> +++ b/arch/powerpc/include/asm/qspinlock_types.h
> @@ -30,7 +30,7 @@ typedef struct qspinlock {
>   *
>   *     0: locked bit
>   *  1-14: lock holder cpu
> - *    15: unused bit
> + *    15: lock owner or queuer vcpus observed to be preempted bit
>   *    16: must queue bit
>   * 17-31: tail cpu (+1)
>   */
> @@ -49,6 +49,11 @@ typedef struct qspinlock {
>  #error "qspinlock does not support such large CONFIG_NR_CPUS"
>  #endif
>  
> +#define _Q_SLEEPY_OFFSET	15
> +#define _Q_SLEEPY_BITS		1
> +#define _Q_SLEEPY_MASK		_Q_SET_MASK(SLEEPY_OWNER)
> +#define _Q_SLEEPY_VAL		(1U << _Q_SLEEPY_OFFSET)
> +
>  #define _Q_MUST_Q_OFFSET	16
>  #define _Q_MUST_Q_BITS		1
>  #define _Q_MUST_Q_MASK		_Q_SET_MASK(MUST_Q)
> diff --git a/arch/powerpc/lib/qspinlock.c b/arch/powerpc/lib/qspinlock.c
> index 5cfd69931e31..c18133c01450 100644
> --- a/arch/powerpc/lib/qspinlock.c
> +++ b/arch/powerpc/lib/qspinlock.c
> @@ -5,6 +5,7 @@
>  #include <linux/percpu.h>
>  #include <linux/smp.h>
>  #include <linux/topology.h>
> +#include <linux/sched/clock.h>
>  #include <asm/qspinlock.h>
>  #include <asm/paravirt.h>
>  
> @@ -36,24 +37,54 @@ static int HEAD_SPINS __read_mostly = (1<<8);
>  static bool pv_yield_owner __read_mostly = true;
>  static bool pv_yield_allow_steal __read_mostly = false;
>  static bool pv_spin_on_preempted_owner __read_mostly = false;
> +static bool pv_sleepy_lock __read_mostly = true;
> +static bool pv_sleepy_lock_sticky __read_mostly = false;

The sticky part could potentially be its own patch.

> +static u64 pv_sleepy_lock_interval_ns __read_mostly = 0;
> +static int pv_sleepy_lock_factor __read_mostly = 256;
>  static bool pv_yield_prev __read_mostly = true;
>  static bool pv_yield_propagate_owner __read_mostly = true;
>  static bool pv_prod_head __read_mostly = false;
>  
>  static DEFINE_PER_CPU_ALIGNED(struct qnodes, qnodes);
> +static DEFINE_PER_CPU_ALIGNED(u64, sleepy_lock_seen_clock);
>  
> -static __always_inline int get_steal_spins(bool paravirt, bool remote)
> +static __always_inline bool recently_sleepy(void)
> +{

Other users of pv_sleepy_lock_interval_ns first check pv_sleepy_lock.

> +	if (pv_sleepy_lock_interval_ns) {
> +		u64 seen = this_cpu_read(sleepy_lock_seen_clock);
> +
> +		if (seen) {
> +			u64 delta = sched_clock() - seen;
> +			if (delta < pv_sleepy_lock_interval_ns)
> +				return true;
> +			this_cpu_write(sleepy_lock_seen_clock, 0);
> +		}
> +	}
> +
> +	return false;
> +}
> +
> +static __always_inline int get_steal_spins(bool paravirt, bool remote, bool sleepy)

It seems like paravirt is implied by sleepy.

>  {
>  	if (remote) {
> -		return REMOTE_STEAL_SPINS;
> +		if (paravirt && sleepy)
> +			return REMOTE_STEAL_SPINS * pv_sleepy_lock_factor;
> +		else
> +			return REMOTE_STEAL_SPINS;
>  	} else {
> -		return STEAL_SPINS;
> +		if (paravirt && sleepy)
> +			return STEAL_SPINS * pv_sleepy_lock_factor;
> +		else
> +			return STEAL_SPINS;
>  	}
>  }

I think that separate functions would still be nicer but this could get rid of
the nesting conditionals like


	int spins;
	if (remote)
		spins = REMOTE_STEAL_SPINS;
	else
		spins = STEAL_SPINS;

	if (sleepy)
		return spins * pv_sleepy_lock_factor;
	return spins;

>  
> -static __always_inline int get_head_spins(bool paravirt)
> +static __always_inline int get_head_spins(bool paravirt, bool sleepy)
>  {
> -	return HEAD_SPINS;
> +	if (paravirt && sleepy)
> +		return HEAD_SPINS * pv_sleepy_lock_factor;
> +	else
> +		return HEAD_SPINS;
>  }
>  
>  static inline u32 encode_tail_cpu(void)
> @@ -206,6 +237,60 @@ static __always_inline u32 lock_clear_mustq(struct qspinlock *lock)
>  	return prev;
>  }
>  
> +static __always_inline bool lock_try_set_sleepy(struct qspinlock *lock, u32 old)
> +{
> +	u32 prev;
> +	u32 new = old | _Q_SLEEPY_VAL;
> +
> +	BUG_ON(!(old & _Q_LOCKED_VAL));
> +	BUG_ON(old & _Q_SLEEPY_VAL);
> +
> +	asm volatile(
> +"1:	lwarx	%0,0,%1		# lock_try_set_sleepy			\n"
> +"	cmpw	0,%0,%2							\n"
> +"	bne-	2f							\n"
> +"	stwcx.	%3,0,%1							\n"
> +"	bne-	1b							\n"
> +"2:									\n"
> +	: "=&r" (prev)
> +	: "r" (&lock->val), "r"(old), "r" (new)
> +	: "cr0", "memory");
> +
> +	if (prev == old)
> +		return true;
> +	return false;
> +}
> +
> +static __always_inline void seen_sleepy_owner(struct qspinlock *lock, u32 val)
> +{
> +	if (pv_sleepy_lock) {
> +		if (pv_sleepy_lock_interval_ns)
> +			this_cpu_write(sleepy_lock_seen_clock, sched_clock());
> +		if (!(val & _Q_SLEEPY_VAL))
> +			lock_try_set_sleepy(lock, val);
> +	}
> +}
> +
> +static __always_inline void seen_sleepy_lock(void)
> +{
> +	if (pv_sleepy_lock && pv_sleepy_lock_interval_ns)
> +		this_cpu_write(sleepy_lock_seen_clock, sched_clock());
> +}
> +
> +static __always_inline void seen_sleepy_node(struct qspinlock *lock)
> +{

If yield_to_prev() was made to take a raw val, that val could be passed to
seen_sleepy_node() and it would not need to get it by itself.

> +	if (pv_sleepy_lock) {
> +		u32 val = READ_ONCE(lock->val);
> +
> +		if (pv_sleepy_lock_interval_ns)
> +			this_cpu_write(sleepy_lock_seen_clock, sched_clock());
> +		if (val & _Q_LOCKED_VAL) {
> +			if (!(val & _Q_SLEEPY_VAL))
> +				lock_try_set_sleepy(lock, val);
> +		}
> +	}
> +}
> +
>  static struct qnode *get_tail_qnode(struct qspinlock *lock, u32 val)
>  {
>  	int cpu = get_tail_cpu(val);
> @@ -244,6 +329,7 @@ static __always_inline void __yield_to_locked_owner(struct qspinlock *lock, u32
>  
>  	spin_end();
>  
> +	seen_sleepy_owner(lock, val);
>  	*preempted = true;
>  
>  	/*
> @@ -307,11 +393,13 @@ static __always_inline void propagate_yield_cpu(struct qnode *node, u32 val, int
>  	}
>  }
>  
> -static __always_inline void yield_to_prev(struct qspinlock *lock, struct qnode *node, int prev_cpu, bool paravirt)
> +static __always_inline void yield_to_prev(struct qspinlock *lock, struct qnode *node, int prev_cpu, bool paravirt, bool *preempted)
>  {
>  	u32 yield_count;
>  	int yield_cpu;
>  
> +	*preempted = false;
> +
>  	if (!paravirt)
>  		goto relax;
>  
> @@ -332,6 +420,9 @@ static __always_inline void yield_to_prev(struct qspinlock *lock, struct qnode *
>  
>  	spin_end();
>  
> +	*preempted = true;
> +	seen_sleepy_node(lock);
> +
>  	smp_rmb();
>  
>  	if (yield_cpu == node->yield_cpu) {
> @@ -353,6 +444,9 @@ static __always_inline void yield_to_prev(struct qspinlock *lock, struct qnode *
>  
>  	spin_end();
>  
> +	*preempted = true;
> +	seen_sleepy_node(lock);
> +
>  	smp_rmb(); /* See yield_to_locked_owner comment */
>  
>  	if (!node->locked) {
> @@ -369,6 +463,9 @@ static __always_inline void yield_to_prev(struct qspinlock *lock, struct qnode *
>  
>  static __always_inline bool try_to_steal_lock(struct qspinlock *lock, bool paravirt)
>  {
> +	bool preempted;
> +	bool seen_preempted = false;
> +	bool sleepy = false;
>  	int iters = 0;
>  
>  	if (!STEAL_SPINS) {
> @@ -376,7 +473,6 @@ static __always_inline bool try_to_steal_lock(struct qspinlock *lock, bool parav
>  			spin_begin();
>  			for (;;) {
>  				u32 val = READ_ONCE(lock->val);
> -				bool preempted;
>  
>  				if (val & _Q_MUST_Q_VAL)
>  					break;
> @@ -395,7 +491,6 @@ static __always_inline bool try_to_steal_lock(struct qspinlock *lock, bool parav
>  	spin_begin();
>  	for (;;) {
>  		u32 val = READ_ONCE(lock->val);
> -		bool preempted;
>  
>  		if (val & _Q_MUST_Q_VAL)
>  			break;
> @@ -408,9 +503,29 @@ static __always_inline bool try_to_steal_lock(struct qspinlock *lock, bool parav
>  			continue;
>  		}
>  
> +		if (paravirt && pv_sleepy_lock && !sleepy) {
> +			if (!sleepy) {

The enclosing conditional means this would always be true. I think the out conditional should be
if (paravirt && pv_sleepy_lock)
otherwise the pv_sleepy_lock_sticky part wouldn't work properly.


> +				if (val & _Q_SLEEPY_VAL) {
> +					seen_sleepy_lock();
> +					sleepy = true;
> +				} else if (recently_sleepy()) {
> +					sleepy = true;
> +				}
> +
> +			if (pv_sleepy_lock_sticky && seen_preempted &&
> +					!(val & _Q_SLEEPY_VAL)) {
> +				if (lock_try_set_sleepy(lock, val))
> +					val |= _Q_SLEEPY_VAL;
> +			}
> +
> +
>  		yield_to_locked_owner(lock, val, paravirt, &preempted);
> +		if (preempted)
> +			seen_preempted = true;

This could belong to the next if statement, there can not be !paravirt && preempted ?

>  
>  		if (paravirt && preempted) {
> +			sleepy = true;
> +
>  			if (!pv_spin_on_preempted_owner)
>  				iters++;
>  			/*
> @@ -425,14 +540,15 @@ static __always_inline bool try_to_steal_lock(struct qspinlock *lock, bool parav
>  			iters++;
>  		}
>  
> -		if (iters >= get_steal_spins(paravirt, false))
> +		if (iters >= get_steal_spins(paravirt, false, sleepy))
>  			break;
> -		if (iters >= get_steal_spins(paravirt, true)) {
> +		if (iters >= get_steal_spins(paravirt, true, sleepy)) {
>  			int cpu = get_owner_cpu(val);
>  			if (numa_node_id() != cpu_to_node(cpu))
>  				break;
>  		}
>  	}
> +
>  	spin_end();
>  
>  	return false;
> @@ -443,6 +559,7 @@ static __always_inline void queued_spin_lock_mcs_queue(struct qspinlock *lock, b
>  	struct qnodes *qnodesp;
>  	struct qnode *next, *node;
>  	u32 val, old, tail;
> +	bool seen_preempted = false;
>  	int idx;
>  
>  	BUILD_BUG_ON(CONFIG_NR_CPUS >= (1U << _Q_TAIL_CPU_BITS));
> @@ -485,8 +602,13 @@ static __always_inline void queued_spin_lock_mcs_queue(struct qspinlock *lock, b
>  
>  		/* Wait for mcs node lock to be released */
>  		spin_begin();
> -		while (!node->locked)
> -			yield_to_prev(lock, node, prev_cpu, paravirt);
> +		while (!node->locked) {
> +			bool preempted;
> +
> +			yield_to_prev(lock, node, prev_cpu, paravirt, &preempted);
> +			if (preempted)
> +				seen_preempted = true;
> +		}
>  		spin_end();
>  
>  		/* Clear out stale propagated yield_cpu */
> @@ -506,6 +628,8 @@ static __always_inline void queued_spin_lock_mcs_queue(struct qspinlock *lock, b
>  
>  			propagate_yield_cpu(node, val, &set_yield_cpu, paravirt);
>  			yield_head_to_locked_owner(lock, val, paravirt, false, &preempted);
> +			if (preempted)
> +				seen_preempted = true;
>  		}
>  		spin_end();
>  
> @@ -521,27 +645,47 @@ static __always_inline void queued_spin_lock_mcs_queue(struct qspinlock *lock, b
>  	} else {
>  		int set_yield_cpu = -1;
>  		int iters = 0;
> +		bool sleepy = false;
>  		bool set_mustq = false;
> +		bool preempted;
>  
>  again:
>  		/* We're at the head of the waitqueue, wait for the lock. */
>  		spin_begin();
>  		while ((val = READ_ONCE(lock->val)) & _Q_LOCKED_VAL) {
> -			bool preempted;
> +			if (paravirt && pv_sleepy_lock) {
> +				if (!sleepy) {
> +					if (val & _Q_SLEEPY_VAL) {
> +						seen_sleepy_lock();
> +						sleepy = true;
> +					} else if (recently_sleepy()) {
> +						sleepy = true;
> +					}
> +				}
> +				if (pv_sleepy_lock_sticky && seen_preempted &&
> +						!(val & _Q_SLEEPY_VAL)) {
> +					if (lock_try_set_sleepy(lock, val))
> +						val |= _Q_SLEEPY_VAL;
> +				}
> +			}
>  
>  			propagate_yield_cpu(node, val, &set_yield_cpu, paravirt);
>  			yield_head_to_locked_owner(lock, val, paravirt,
>  					pv_yield_allow_steal && set_mustq,
>  					&preempted);
> +			if (preempted)
> +				seen_preempted = true;
>  
>  			if (paravirt && preempted) {
> +				sleepy = true;
> +
>  				if (!pv_spin_on_preempted_owner)
>  					iters++;
>  			} else {
>  				iters++;
>  			}
>  
> -			if (!set_mustq && iters >= get_head_spins(paravirt)) {
> +			if (!set_mustq && iters >= get_head_spins(paravirt, sleepy)) {
>  				set_mustq = true;
>  				lock_set_mustq(lock);
>  				val |= _Q_MUST_Q_VAL;
> @@ -729,6 +873,70 @@ static int pv_spin_on_preempted_owner_get(void *data, u64 *val)
>  
>  DEFINE_SIMPLE_ATTRIBUTE(fops_pv_spin_on_preempted_owner, pv_spin_on_preempted_owner_get, pv_spin_on_preempted_owner_set, "%llu\n");
>  
> +static int pv_sleepy_lock_set(void *data, u64 val)
> +{
> +	pv_sleepy_lock = !!val;
> +
> +	return 0;
> +}
> +
> +static int pv_sleepy_lock_get(void *data, u64 *val)
> +{
> +	*val = pv_sleepy_lock;
> +
> +	return 0;
> +}
> +
> +DEFINE_SIMPLE_ATTRIBUTE(fops_pv_sleepy_lock, pv_sleepy_lock_get, pv_sleepy_lock_set, "%llu\n");
> +
> +static int pv_sleepy_lock_sticky_set(void *data, u64 val)
> +{
> +	pv_sleepy_lock_sticky = !!val;
> +
> +	return 0;
> +}
> +
> +static int pv_sleepy_lock_sticky_get(void *data, u64 *val)
> +{
> +	*val = pv_sleepy_lock_sticky;
> +
> +	return 0;
> +}
> +
> +DEFINE_SIMPLE_ATTRIBUTE(fops_pv_sleepy_lock_sticky, pv_sleepy_lock_sticky_get, pv_sleepy_lock_sticky_set, "%llu\n");
> +
> +static int pv_sleepy_lock_interval_ns_set(void *data, u64 val)
> +{
> +	pv_sleepy_lock_interval_ns = val;
> +
> +	return 0;
> +}
> +
> +static int pv_sleepy_lock_interval_ns_get(void *data, u64 *val)
> +{
> +	*val = pv_sleepy_lock_interval_ns;
> +
> +	return 0;
> +}
> +
> +DEFINE_SIMPLE_ATTRIBUTE(fops_pv_sleepy_lock_interval_ns, pv_sleepy_lock_interval_ns_get, pv_sleepy_lock_interval_ns_set, "%llu\n");
> +
> +static int pv_sleepy_lock_factor_set(void *data, u64 val)
> +{
> +	pv_sleepy_lock_factor = val;
> +
> +	return 0;
> +}
> +
> +static int pv_sleepy_lock_factor_get(void *data, u64 *val)
> +{
> +	*val = pv_sleepy_lock_factor;
> +
> +	return 0;
> +}
> +
> +DEFINE_SIMPLE_ATTRIBUTE(fops_pv_sleepy_lock_factor, pv_sleepy_lock_factor_get, pv_sleepy_lock_factor_set, "%llu\n");
> +
>  static int pv_yield_prev_set(void *data, u64 val)
>  {
>  	pv_yield_prev = !!val;
> @@ -786,6 +994,10 @@ static __init int spinlock_debugfs_init(void)
>  		debugfs_create_file("qspl_pv_yield_owner", 0600, arch_debugfs_dir, NULL, &fops_pv_yield_owner);
>  		debugfs_create_file("qspl_pv_yield_allow_steal", 0600, arch_debugfs_dir, NULL, &fops_pv_yield_allow_steal);
>  		debugfs_create_file("qspl_pv_spin_on_preempted_owner", 0600, arch_debugfs_dir, NULL, &fops_pv_spin_on_preempted_owner);
> +		debugfs_create_file("qspl_pv_sleepy_lock", 0600, arch_debugfs_dir, NULL, &fops_pv_sleepy_lock);
> +		debugfs_create_file("qspl_pv_sleepy_lock_sticky", 0600, arch_debugfs_dir, NULL, &fops_pv_sleepy_lock_sticky);
> +		debugfs_create_file("qspl_pv_sleepy_lock_interval_ns", 0600, arch_debugfs_dir, NULL, &fops_pv_sleepy_lock_interval_ns);
> +		debugfs_create_file("qspl_pv_sleepy_lock_factor", 0600, arch_debugfs_dir, NULL, &fops_pv_sleepy_lock_factor);
>  		debugfs_create_file("qspl_pv_yield_prev", 0600, arch_debugfs_dir, NULL, &fops_pv_yield_prev);
>  		debugfs_create_file("qspl_pv_yield_propagate_owner", 0600, arch_debugfs_dir, NULL, &fops_pv_yield_propagate_owner);
>  		debugfs_create_file("qspl_pv_prod_head", 0600, arch_debugfs_dir, NULL, &fops_pv_prod_head);

