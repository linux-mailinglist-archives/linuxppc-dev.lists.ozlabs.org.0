Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CD87B62385A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Nov 2022 01:46:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N7372584Nz3dvh
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Nov 2022 11:46:22 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=PrNSij+3;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52a; helo=mail-pg1-x52a.google.com; envelope-from=jniethe5@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=PrNSij+3;
	dkim-atps=neutral
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com [IPv6:2607:f8b0:4864:20::52a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N732F5P1Kz3dvJ
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Nov 2022 11:42:13 +1100 (AEDT)
Received: by mail-pg1-x52a.google.com with SMTP id e129so208150pgc.9
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 09 Nov 2022 16:42:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:user-agent:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y+wOvzv7/mWEQbylHV1IvF2jLXZg2ljln7jZmnEHbjM=;
        b=PrNSij+3ZaRUSjGG/iXLDXdYsHJbla0USjIiPEWi29ewakVUmQ1l9yWA6ZXG5WFrCW
         pQ/gP+Ijo7X/zqROYMtkq2cEalBs/wsQLAAp9fRy96lCtkfaB83L3O5S3oVFFjuZYu7/
         sNv9BRGXAAeQK0Bh2JWzlYq9DU7izGGUjuGBRbTctjUqcyKu5j3zlspbs8G5HZ1YHJw+
         m6OAKV9sdClYzF+EfNglj0bJdXm0MUuhsQdWtBY5xqeJWOLJrjWcQ529KNUww7qj2CEm
         Btf79AY/pkKNg8q0Zh60LQfZ4sNKzhAITnYQsgTm2kpWLzxwa/aKi01VvHOCD40zI/Tz
         BwfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:user-agent:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=y+wOvzv7/mWEQbylHV1IvF2jLXZg2ljln7jZmnEHbjM=;
        b=ZDh5yzeNwWt3cz8aJNhl6XyquAusPer6kG3ztsKgApRiCL6hkUq3xEevtq3TOjd2KU
         wBgX3DuUuE/lCoSV8hMLq/AsX6TvLB1twwkMoWFdomOvYLv3YPl9WVbyuqXzIGvJwhM6
         8LM+tSb6ZKSCfirIRy6lm8UtvBE2vaY1+H7EaVCQ3DPSF4X+Wk+9IcXqy6sVAEIysrvA
         r/7uZoKiqJEfsgVHT0G31aGvHOD7FRK+A2jHB4TjOgqoOf9zX83L8F/HyJsDPD/LxOtH
         oSCM4RniKjebIcZC0eMDfKBJ1SMgoue7wKwKtkzmaCztcm2HW9ERRTb8GMX0YNhKlUY0
         aXrQ==
X-Gm-Message-State: ACrzQf2kA0sMLDjl43yO1EnXNZQwnsQPdScvWicIUxY7tOVEcDrPRuJj
	pQD/L/qV7Me9BPL14n4ma/vqGYVWm6E=
X-Google-Smtp-Source: AMsMyM7miPDE4ES/Y3kpti6LIGIJaHwz7EvXW+oPOK1AgGlgE+lPv6MSlzknP2kP4+KeMUg+Ly/tOQ==
X-Received: by 2002:a05:6a00:234d:b0:561:ec04:e77e with SMTP id j13-20020a056a00234d00b00561ec04e77emr63673601pfj.14.1668040931555;
        Wed, 09 Nov 2022 16:42:11 -0800 (PST)
Received: from tee480.ozlabs.ibm.com (110-175-254-242.static.tpgi.com.au. [110.175.254.242])
        by smtp.googlemail.com with ESMTPSA id r26-20020aa79eda000000b0056c7b49a011sm8835357pfq.76.2022.11.09.16.42.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Nov 2022 16:42:11 -0800 (PST)
Message-ID: <105e7cbf5289fe19339f0cde4033a9afdfea17f9.camel@gmail.com>
Subject: Re: [PATCH 10/17] powerpc/qspinlock: allow stealing when head of
 queue yields
From: Jordan Niethe <jniethe5@gmail.com>
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
Date: Thu, 10 Nov 2022 11:42:07 +1100
In-Reply-To: <20220728063120.2867508-12-npiggin@gmail.com>
References: <20220728063120.2867508-1-npiggin@gmail.com>
	 <20220728063120.2867508-12-npiggin@gmail.com>
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
> If the head of queue is preventing stealing but it finds the owner vCPU
> is preempted, it will yield its cycles to the owner which could cause it
> to become preempted. Add an option to re-allow stealers before yielding,
> and disallow them again after returning from the yield.
> 
> Disable this option by default for now, i.e., no logical change.
> ---
>  arch/powerpc/lib/qspinlock.c | 56 ++++++++++++++++++++++++++++++++++--
>  1 file changed, 53 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/powerpc/lib/qspinlock.c b/arch/powerpc/lib/qspinlock.c
> index b39f8c5b329c..94f007f66942 100644
> --- a/arch/powerpc/lib/qspinlock.c
> +++ b/arch/powerpc/lib/qspinlock.c
> @@ -26,6 +26,7 @@ static bool MAYBE_STEALERS __read_mostly = true;
>  static int HEAD_SPINS __read_mostly = (1<<8);
>  
>  static bool pv_yield_owner __read_mostly = true;
> +static bool pv_yield_allow_steal __read_mostly = false;

To me this one does read as a boolean, but if you go with those other changes
I'd make it pv_yield_steal_enable to be consistent.

>  static bool pv_yield_prev __read_mostly = true;
>  
>  static DEFINE_PER_CPU_ALIGNED(struct qnodes, qnodes);
> @@ -173,6 +174,23 @@ static __always_inline u32 lock_set_mustq(struct qspinlock *lock)
>  	return prev;
>  }
>  
> +static __always_inline u32 lock_clear_mustq(struct qspinlock *lock)
> +{
> +	u32 new = _Q_MUST_Q_VAL;
> +	u32 prev;
> +
> +	asm volatile(
> +"1:	lwarx	%0,0,%1		# lock_clear_mustq			\n"
> +"	andc	%0,%0,%2						\n"
> +"	stwcx.	%0,0,%1							\n"
> +"	bne-	1b							\n"
> +	: "=&r" (prev)
> +	: "r" (&lock->val), "r" (new)
> +	: "cr0", "memory");
> +

This is pretty similar to the DEFINE_TESTOP() pattern again with the same llong caveat.


> +	return prev;
> +}
> +
>  static struct qnode *get_tail_qnode(struct qspinlock *lock, u32 val)
>  {
>  	int cpu = get_tail_cpu(val);
> @@ -188,7 +206,7 @@ static struct qnode *get_tail_qnode(struct qspinlock *lock, u32 val)
>  	BUG();
>  }
>  
> -static __always_inline void yield_to_locked_owner(struct qspinlock *lock, u32 val, bool paravirt)
> +static __always_inline void __yield_to_locked_owner(struct qspinlock *lock, u32 val, bool paravirt, bool clear_mustq)

 /* See yield_to_locked_owner comment */ comment needs to be updated now.


>  {
>  	int owner;
>  	u32 yield_count;
> @@ -217,7 +235,11 @@ static __always_inline void yield_to_locked_owner(struct qspinlock *lock, u32 va
>  	smp_rmb();
>  
>  	if (READ_ONCE(lock->val) == val) {
> +		if (clear_mustq)
> +			lock_clear_mustq(lock);
>  		yield_to_preempted(owner, yield_count);
> +		if (clear_mustq)
> +			lock_set_mustq(lock);
>  		/* Don't relax if we yielded. Maybe we should? */
>  		return;
>  	}
> @@ -225,6 +247,16 @@ static __always_inline void yield_to_locked_owner(struct qspinlock *lock, u32 va
>  	cpu_relax();
>  }
>  
> +static __always_inline void yield_to_locked_owner(struct qspinlock *lock, u32 val, bool paravirt)
> +{
> +	__yield_to_locked_owner(lock, val, paravirt, false);
> +}
> +
> +static __always_inline void yield_head_to_locked_owner(struct qspinlock *lock, u32 val, bool paravirt, bool clear_mustq)
> +{

The check for pv_yield_allow_steal seems like it could go here instead of
being done by the caller.
__yield_to_locked_owner() checks for pv_yield_owner so it seems more
  consistent.



> +	__yield_to_locked_owner(lock, val, paravirt, clear_mustq);
> +}
> +
>  static __always_inline void yield_to_prev(struct qspinlock *lock, struct qnode *node, int prev_cpu, bool paravirt)
>  {
>  	u32 yield_count;
> @@ -332,7 +364,7 @@ static __always_inline void queued_spin_lock_mcs_queue(struct qspinlock *lock, b
>  	if (!MAYBE_STEALERS) {
>  		/* We're at the head of the waitqueue, wait for the lock. */
>  		while ((val = READ_ONCE(lock->val)) & _Q_LOCKED_VAL)
> -			yield_to_locked_owner(lock, val, paravirt);
> +			yield_head_to_locked_owner(lock, val, paravirt, false);
>  
>  		/* If we're the last queued, must clean up the tail. */
>  		if ((val & _Q_TAIL_CPU_MASK) == tail) {
> @@ -350,7 +382,8 @@ static __always_inline void queued_spin_lock_mcs_queue(struct qspinlock *lock, b
>  again:
>  		/* We're at the head of the waitqueue, wait for the lock. */
>  		while ((val = READ_ONCE(lock->val)) & _Q_LOCKED_VAL) {
> -			yield_to_locked_owner(lock, val, paravirt);
> +			yield_head_to_locked_owner(lock, val, paravirt,
> +					pv_yield_allow_steal && set_mustq);
>  
>  			iters++;
>  			if (!set_mustq && iters >= get_head_spins(paravirt)) {
> @@ -475,6 +508,22 @@ static int pv_yield_owner_get(void *data, u64 *val)
>  
>  DEFINE_SIMPLE_ATTRIBUTE(fops_pv_yield_owner, pv_yield_owner_get, pv_yield_owner_set, "%llu\n");
>  
> +static int pv_yield_allow_steal_set(void *data, u64 val)
> +{
> +	pv_yield_allow_steal = !!val;
> +
> +	return 0;
> +}
> +
> +static int pv_yield_allow_steal_get(void *data, u64 *val)
> +{
> +	*val = pv_yield_allow_steal;
> +
> +	return 0;
> +}
> +
> +DEFINE_SIMPLE_ATTRIBUTE(fops_pv_yield_allow_steal, pv_yield_allow_steal_get, pv_yield_allow_steal_set, "%llu\n");
> +
>  static int pv_yield_prev_set(void *data, u64 val)
>  {
>  	pv_yield_prev = !!val;
> @@ -497,6 +546,7 @@ static __init int spinlock_debugfs_init(void)
>  	debugfs_create_file("qspl_head_spins", 0600, arch_debugfs_dir, NULL, &fops_head_spins);
>  	if (is_shared_processor()) {
>  		debugfs_create_file("qspl_pv_yield_owner", 0600, arch_debugfs_dir, NULL, &fops_pv_yield_owner);
> +		debugfs_create_file("qspl_pv_yield_allow_steal", 0600, arch_debugfs_dir, NULL, &fops_pv_yield_allow_steal);
>  		debugfs_create_file("qspl_pv_yield_prev", 0600, arch_debugfs_dir, NULL, &fops_pv_yield_prev);
>  	}
>  

