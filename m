Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 867BA623869
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Nov 2022 01:50:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N73CF35Cjz3fFV
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Nov 2022 11:50:01 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=U7xfHPTf;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52a; helo=mail-pg1-x52a.google.com; envelope-from=jniethe5@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=U7xfHPTf;
	dkim-atps=neutral
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com [IPv6:2607:f8b0:4864:20::52a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N733j6spzz3f7h
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Nov 2022 11:43:29 +1100 (AEDT)
Received: by mail-pg1-x52a.google.com with SMTP id 130so223644pgc.5
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 09 Nov 2022 16:43:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:user-agent:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iZAv2wRTDAWbj0s5BoStPHM/MT78STvi0P+uk27tTbg=;
        b=U7xfHPTff2qofAZg/vl5B3kFk5b/KCeyHgSoOf/Gh9vJ10N2FPjfoFfOOg1bUYaUQf
         5Sdv7tc3mchLJJp0aSrQB4idh+19PuBkvD+UaMaRw+zAXkNSgJkKptw5T/QHmaWdfN3A
         XRQUnKicYqfqfwetwQYg4wq4IRUb/5hJgVBD2b+uwWqlE47WM8PjMBgTffyCCWTbBsAU
         sUvkQnIgOJWmjGYfElPIaPCwB7T1DGM1vvD+peERcXmTHS2VXYuiMelKKAcKm7Kk0zJe
         0Kry9q44UnD0VlKiPsEp9hDZl9QdsITJWZrV3JTD8lNARq/5UEE3A6e0X3j1V4CCgsRE
         yS1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:user-agent:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iZAv2wRTDAWbj0s5BoStPHM/MT78STvi0P+uk27tTbg=;
        b=2KVM6yGAAuIt67HvibqZ0g37pCRqc7gccnOO+yolEJQM74GwASWk8DMEohfLKY1RsJ
         jwTeorKUKoTXh1XJDxHPgpLKtlgIMY2RtqhEdMVEI4WK0lD+BjMLAUObWzFBuJyjLQbT
         kDb/jHxR3+fPPsbKsiVcfskrVCmxWRbCOhlHUObOgrWx763IhEd4KiES1NKDP9bBT1OU
         sh0autVsK9ffjm4pR0eo0MlTNahvnUirhTMElFlNC/+yo7tz6ZDYSzFh1lYEfZN2gWzd
         A4Amd6JjOnvo6hCAd71kZkSFkGyR/7Rz5rWEzpsIrBio8x8EWigYzqF+BXgtcSTL9UwC
         c1xA==
X-Gm-Message-State: ACrzQf0raHeb8E+/d6XItWn1CfI0+g/HwmAPqSWrsJx0tBXmXOiix6+1
	8iSK+183dfyXDQ1+PpTd7M7EukvvtSw=
X-Google-Smtp-Source: AMsMyM5Gdf4ahnBhQV7PBe7jK/fL2oZXmkvsg+zqpg2KB0H+zwvtj3ozUfcib6xwS/1hFC3Kj3Wt7A==
X-Received: by 2002:a63:105e:0:b0:46e:9bac:1c3 with SMTP id 30-20020a63105e000000b0046e9bac01c3mr51888306pgq.388.1668041008082;
        Wed, 09 Nov 2022 16:43:28 -0800 (PST)
Received: from tee480.ozlabs.ibm.com (110-175-254-242.static.tpgi.com.au. [110.175.254.242])
        by smtp.googlemail.com with ESMTPSA id bb7-20020a170902bc8700b00174c0dd29f0sm9680289plb.144.2022.11.09.16.43.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Nov 2022 16:43:27 -0800 (PST)
Message-ID: <b0a117995bb311dff161c475f7ba76709252c995.camel@gmail.com>
Subject: Re: [PATCH 14/17] powerpc/qspinlock: use spin_begin/end API
From: Jordan Niethe <jniethe5@gmail.com>
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
Date: Thu, 10 Nov 2022 11:43:24 +1100
In-Reply-To: <20220728063120.2867508-16-npiggin@gmail.com>
References: <20220728063120.2867508-1-npiggin@gmail.com>
	 <20220728063120.2867508-16-npiggin@gmail.com>
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
> Use the spin_begin/spin_cpu_relax/spin_end APIs in qspinlock, which helps
> to prevent threads issuing a lot of expensive priority nops which may not
> have much effect due to immediately executing low then medium priority.

Just a general comment regarding the spin_{begin,end} API, more complicated
than something like

	spin_begin()
	for(;;)
		spin_cpu_relax()
	spin_end()

it becomes difficult to keep track of. Unfortunately, I don't have any good
suggestions how to improve it. Hopefully with P10s wait instruction we can
maybe try and move away from this.

It might be useful to comment the functions pre and post conditions regarding
expectations about spin_begin() and spin_end().

> ---
>  arch/powerpc/lib/qspinlock.c | 35 +++++++++++++++++++++++++++++++----
>  1 file changed, 31 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/powerpc/lib/qspinlock.c b/arch/powerpc/lib/qspinlock.c
> index 277aef1fab0a..d4594c701f7d 100644
> --- a/arch/powerpc/lib/qspinlock.c
> +++ b/arch/powerpc/lib/qspinlock.c
> @@ -233,6 +233,8 @@ static __always_inline void __yield_to_locked_owner(struct qspinlock *lock, u32
>  	if ((yield_count & 1) == 0)
>  		goto relax; /* owner vcpu is running */
>  
> +	spin_end();
> +
>  	/*
>  	 * Read the lock word after sampling the yield count. On the other side
>  	 * there may a wmb because the yield count update is done by the
> @@ -248,11 +250,13 @@ static __always_inline void __yield_to_locked_owner(struct qspinlock *lock, u32
>  		yield_to_preempted(owner, yield_count);
>  		if (clear_mustq)
>  			lock_set_mustq(lock);
> +		spin_begin();
>  		/* Don't relax if we yielded. Maybe we should? */
>  		return;
>  	}
> +	spin_begin();
>  relax:
> -	cpu_relax();
> +	spin_cpu_relax();
>  }
>  
>  static __always_inline void yield_to_locked_owner(struct qspinlock *lock, u32 val, bool paravirt)
> @@ -315,14 +319,18 @@ static __always_inline void yield_to_prev(struct qspinlock *lock, struct qnode *
>  	if ((yield_count & 1) == 0)
>  		goto yield_prev; /* owner vcpu is running */
>  
> +	spin_end();
> +
>  	smp_rmb();
>  
>  	if (yield_cpu == node->yield_cpu) {
>  		if (node->next && node->next->yield_cpu != yield_cpu)
>  			node->next->yield_cpu = yield_cpu;
>  		yield_to_preempted(yield_cpu, yield_count);
> +		spin_begin();
>  		return;
>  	}
> +	spin_begin();
>  
>  yield_prev:
>  	if (!pv_yield_prev)
> @@ -332,15 +340,19 @@ static __always_inline void yield_to_prev(struct qspinlock *lock, struct qnode *
>  	if ((yield_count & 1) == 0)
>  		goto relax; /* owner vcpu is running */
>  
> +	spin_end();
> +
>  	smp_rmb(); /* See yield_to_locked_owner comment */
>  
>  	if (!node->locked) {
>  		yield_to_preempted(prev_cpu, yield_count);
> +		spin_begin();
>  		return;
>  	}
> +	spin_begin();
>  
>  relax:
> -	cpu_relax();
> +	spin_cpu_relax();
>  }
>  
>  
> @@ -349,6 +361,7 @@ static __always_inline bool try_to_steal_lock(struct qspinlock *lock, bool parav
>  	int iters;
>  
>  	/* Attempt to steal the lock */
> +	spin_begin();
>  	for (;;) {
>  		u32 val = READ_ONCE(lock->val);
>  
> @@ -356,8 +369,10 @@ static __always_inline bool try_to_steal_lock(struct qspinlock *lock, bool parav
>  			break;
>  
>  		if (unlikely(!(val & _Q_LOCKED_VAL))) {
> +			spin_end();
>  			if (trylock_with_tail_cpu(lock, val))
>  				return true;
> +			spin_begin();
>  			continue;
>  		}
>  
> @@ -368,6 +383,7 @@ static __always_inline bool try_to_steal_lock(struct qspinlock *lock, bool parav
>  		if (iters >= get_steal_spins(paravirt))
>  			break;
>  	}
> +	spin_end();
>  
>  	return false;
>  }
> @@ -418,8 +434,10 @@ static __always_inline void queued_spin_lock_mcs_queue(struct qspinlock *lock, b
>  		WRITE_ONCE(prev->next, node);
>  
>  		/* Wait for mcs node lock to be released */
> +		spin_begin();
>  		while (!node->locked)
>  			yield_to_prev(lock, node, prev_cpu, paravirt);
> +		spin_end();
>  
>  		/* Clear out stale propagated yield_cpu */
>  		if (paravirt && pv_yield_propagate_owner && node->yield_cpu != -1)
> @@ -432,10 +450,12 @@ static __always_inline void queued_spin_lock_mcs_queue(struct qspinlock *lock, b
>  		int set_yield_cpu = -1;
>  
>  		/* We're at the head of the waitqueue, wait for the lock. */
> +		spin_begin();
>  		while ((val = READ_ONCE(lock->val)) & _Q_LOCKED_VAL) {
>  			propagate_yield_cpu(node, val, &set_yield_cpu, paravirt);
>  			yield_head_to_locked_owner(lock, val, paravirt, false);
>  		}
> +		spin_end();
>  
>  		/* If we're the last queued, must clean up the tail. */
>  		if ((val & _Q_TAIL_CPU_MASK) == tail) {
> @@ -453,6 +473,7 @@ static __always_inline void queued_spin_lock_mcs_queue(struct qspinlock *lock, b
>  
>  again:
>  		/* We're at the head of the waitqueue, wait for the lock. */
> +		spin_begin();
>  		while ((val = READ_ONCE(lock->val)) & _Q_LOCKED_VAL) {
>  			propagate_yield_cpu(node, val, &set_yield_cpu, paravirt);
>  			yield_head_to_locked_owner(lock, val, paravirt,
> @@ -465,6 +486,7 @@ static __always_inline void queued_spin_lock_mcs_queue(struct qspinlock *lock, b
>  				val |= _Q_MUST_Q_VAL;
>  			}
>  		}
> +		spin_end();
>  
>  		/* If we're the last queued, must clean up the tail. */
>  		if ((val & _Q_TAIL_CPU_MASK) == tail) {
> @@ -480,8 +502,13 @@ static __always_inline void queued_spin_lock_mcs_queue(struct qspinlock *lock, b
>  
>  unlock_next:
>  	/* contended path; must wait for next != NULL (MCS protocol) */
> -	while (!(next = READ_ONCE(node->next)))
> -		cpu_relax();
> +	next = READ_ONCE(node->next);
> +	if (!next) {
> +		spin_begin();
> +		while (!(next = READ_ONCE(node->next)))
> +			cpu_relax();
> +		spin_end();
> +	}
>  
>  	/*
>  	 * Unlock the next mcs waiter node. Release barrier is not required

