Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B153862386E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Nov 2022 01:51:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N73FQ4L5pz3f95
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Nov 2022 11:51:54 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Sn6QUtJ6;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1030; helo=mail-pj1-x1030.google.com; envelope-from=jniethe5@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Sn6QUtJ6;
	dkim-atps=neutral
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N734S21C8z3dv8
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Nov 2022 11:44:08 +1100 (AEDT)
Received: by mail-pj1-x1030.google.com with SMTP id e7-20020a17090a77c700b00216928a3917so3420450pjs.4
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 09 Nov 2022 16:44:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:user-agent:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k3HYb9AVoR/jVKV71ZfufyB5gWUX4VgPVU7K0aUxjpw=;
        b=Sn6QUtJ6TzMgLpWZUZp72hodNvsUvQngo4tw7LVoDiLd4mc4X6t08l68BDo9eY2NAb
         lxQym3PIHhv1DOJC4clQAwPKmx+BAkx7sfVRjSoaJRE/feDXsDyzY0BypPGD7/J+4WEJ
         7mY9VJlAq3R0PMyQ3MGcgcT/XqisIzjfBqtkMhMLOzruD0Q8RPLVgHZpD/tyWIZCTAzW
         4u3xGNbYNMM+4DCDkiGCvzV12X2VZlOoJBmR2erVu3scVcvyuwynEonUMYpcBuKGP+1i
         Q8KpVKY/SA7V+k0ZeDUWHi+iU4l0YR3JyhTA+2ojdRLOvFxwyVvYXkzTVGKnrqkxmA0h
         R6pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:user-agent:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=k3HYb9AVoR/jVKV71ZfufyB5gWUX4VgPVU7K0aUxjpw=;
        b=OInqwd4XzVBIMi4kLNMImMVE7KCc0VZuWFmCBkC3Ou4d/ZSd1SP5geHtFn+XQRY0j6
         GjhuvBKU846/GQKxbi37LHlyV/dn8+ojIozJ5rz2EwpP33OfbpYl7F0GXbmojEtzkKIs
         b1wcuvrzieHGd1ZIuqh2x93mswW8BF+p2pzmmXbGxTO8yMR74YROrRtmyWy2sIJVrkEd
         Om5M63jtZbSqTksjH3kiW5cg16iVtZ+IaRdE3DUoNMmd5+Ny7GmNZyj5Gn8nycw3wUWY
         4h4aOxhTvBumMP05UvxAJ2uTlm/sjMXBafmHYMyJTRowyxDzATsq1pu5CgVZJAnqZfPi
         6sdw==
X-Gm-Message-State: ACrzQf0Wk+i9AVwaMxyFGeXhiZ/WTE/DNvEvVowCWZ0NZuC6MeshEUZC
	rm9iKHp+AEmd8hAN63dzMDg=
X-Google-Smtp-Source: AMsMyM4aTEQx7UGpPYFpFDqpaCfSXgX6KYp03au3oNQNPrAXrv2pDGKge+NUUgjBKDZlH+OftIws2Q==
X-Received: by 2002:a17:902:7786:b0:178:48c0:a083 with SMTP id o6-20020a170902778600b0017848c0a083mr63834379pll.125.1668041045215;
        Wed, 09 Nov 2022 16:44:05 -0800 (PST)
Received: from tee480.ozlabs.ibm.com (110-175-254-242.static.tpgi.com.au. [110.175.254.242])
        by smtp.googlemail.com with ESMTPSA id u2-20020a17090341c200b001766a3b2a26sm9752178ple.105.2022.11.09.16.44.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Nov 2022 16:44:04 -0800 (PST)
Message-ID: <6307bef2943054255d5241d41efd218a4f487194.camel@gmail.com>
Subject: Re: [PATCH 16/17] powerpc/qspinlock: allow indefinite spinning on a
 preempted owner
From: Jordan Niethe <jniethe5@gmail.com>
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
Date: Thu, 10 Nov 2022 11:44:01 +1100
In-Reply-To: <20220728063120.2867508-18-npiggin@gmail.com>
References: <20220728063120.2867508-1-npiggin@gmail.com>
	 <20220728063120.2867508-18-npiggin@gmail.com>
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
> Provide an option that holds off queueing indefinitely while the lock
> owner is preempted. This could reduce queueing latencies for very
> overcommitted vcpu situations.
> 
> This is disabled by default.
> ---
>  arch/powerpc/lib/qspinlock.c | 91 +++++++++++++++++++++++++++++++-----
>  1 file changed, 79 insertions(+), 12 deletions(-)
> 
> diff --git a/arch/powerpc/lib/qspinlock.c b/arch/powerpc/lib/qspinlock.c
> index 24f68bd71e2b..5cfd69931e31 100644
> --- a/arch/powerpc/lib/qspinlock.c
> +++ b/arch/powerpc/lib/qspinlock.c
> @@ -35,6 +35,7 @@ static int HEAD_SPINS __read_mostly = (1<<8);
>  
>  static bool pv_yield_owner __read_mostly = true;
>  static bool pv_yield_allow_steal __read_mostly = false;
> +static bool pv_spin_on_preempted_owner __read_mostly = false;
>  static bool pv_yield_prev __read_mostly = true;
>  static bool pv_yield_propagate_owner __read_mostly = true;
>  static bool pv_prod_head __read_mostly = false;
> @@ -220,13 +221,15 @@ static struct qnode *get_tail_qnode(struct qspinlock *lock, u32 val)
>  	BUG();
>  }
>  
> -static __always_inline void __yield_to_locked_owner(struct qspinlock *lock, u32 val, bool paravirt, bool clear_mustq)
> +static __always_inline void __yield_to_locked_owner(struct qspinlock *lock, u32 val, bool paravirt, bool clear_mustq, bool *preempted)
>  {
>  	int owner;
>  	u32 yield_count;
>  
>  	BUG_ON(!(val & _Q_LOCKED_VAL));
>  
> +	*preempted = false;
> +
>  	if (!paravirt)
>  		goto relax;
>  
> @@ -241,6 +244,8 @@ static __always_inline void __yield_to_locked_owner(struct qspinlock *lock, u32
>  
>  	spin_end();
>  
> +	*preempted = true;
> +
>  	/*
>  	 * Read the lock word after sampling the yield count. On the other side
>  	 * there may a wmb because the yield count update is done by the
> @@ -265,14 +270,14 @@ static __always_inline void __yield_to_locked_owner(struct qspinlock *lock, u32
>  	spin_cpu_relax();
>  }
>  
> -static __always_inline void yield_to_locked_owner(struct qspinlock *lock, u32 val, bool paravirt)
> +static __always_inline void yield_to_locked_owner(struct qspinlock *lock, u32 val, bool paravirt, bool *preempted)

It seems like preempted parameter could be the return value of
yield_to_locked_owner(). Then callers that don't use the value returned in
preempted don't need to create an unnecessary variable to pass in.

>  {
> -	__yield_to_locked_owner(lock, val, paravirt, false);
> +	__yield_to_locked_owner(lock, val, paravirt, false, preempted);
>  }
>  
> -static __always_inline void yield_head_to_locked_owner(struct qspinlock *lock, u32 val, bool paravirt, bool clear_mustq)
> +static __always_inline void yield_head_to_locked_owner(struct qspinlock *lock, u32 val, bool paravirt, bool clear_mustq, bool *preempted)
>  {
> -	__yield_to_locked_owner(lock, val, paravirt, clear_mustq);
> +	__yield_to_locked_owner(lock, val, paravirt, clear_mustq, preempted);
>  }
>  
>  static __always_inline void propagate_yield_cpu(struct qnode *node, u32 val, int *set_yield_cpu, bool paravirt)
> @@ -364,12 +369,33 @@ static __always_inline void yield_to_prev(struct qspinlock *lock, struct qnode *
>  
>  static __always_inline bool try_to_steal_lock(struct qspinlock *lock, bool paravirt)
>  {
> -	int iters;
> +	int iters = 0;
> +
> +	if (!STEAL_SPINS) {
> +		if (paravirt && pv_spin_on_preempted_owner) {
> +			spin_begin();
> +			for (;;) {
> +				u32 val = READ_ONCE(lock->val);
> +				bool preempted;
> +
> +				if (val & _Q_MUST_Q_VAL)
> +					break;
> +				if (!(val & _Q_LOCKED_VAL))
> +					break;
> +				if (!vcpu_is_preempted(get_owner_cpu(val)))
> +					break;
> +				yield_to_locked_owner(lock, val, paravirt, &preempted);
> +			}
> +			spin_end();
> +		}
> +		return false;
> +	}
>  
>  	/* Attempt to steal the lock */
>  	spin_begin();
>  	for (;;) {
>  		u32 val = READ_ONCE(lock->val);
> +		bool preempted;
>  
>  		if (val & _Q_MUST_Q_VAL)
>  			break;
> @@ -382,9 +408,22 @@ static __always_inline bool try_to_steal_lock(struct qspinlock *lock, bool parav
>  			continue;
>  		}
>  
> -		yield_to_locked_owner(lock, val, paravirt);
> -
> -		iters++;
> +		yield_to_locked_owner(lock, val, paravirt, &preempted);
> +
> +		if (paravirt && preempted) {
> +			if (!pv_spin_on_preempted_owner)
> +				iters++;
> +			/*
> +			 * pv_spin_on_preempted_owner don't increase iters
> +			 * while the owner is preempted -- we won't interfere
> +			 * with it by definition. This could introduce some
> +			 * latency issue if we continually observe preempted
> +			 * owners, but hopefully that's a rare corner case of
> +			 * a badly oversubscribed system.
> +			 */
> +		} else {
> +			iters++;
> +		}
>  
>  		if (iters >= get_steal_spins(paravirt, false))
>  			break;
> @@ -463,8 +502,10 @@ static __always_inline void queued_spin_lock_mcs_queue(struct qspinlock *lock, b
>  		/* We're at the head of the waitqueue, wait for the lock. */
>  		spin_begin();
>  		while ((val = READ_ONCE(lock->val)) & _Q_LOCKED_VAL) {
> +			bool preempted;
> +
>  			propagate_yield_cpu(node, val, &set_yield_cpu, paravirt);
> -			yield_head_to_locked_owner(lock, val, paravirt, false);
> +			yield_head_to_locked_owner(lock, val, paravirt, false, &preempted);
>  		}
>  		spin_end();
>  
> @@ -486,11 +527,20 @@ static __always_inline void queued_spin_lock_mcs_queue(struct qspinlock *lock, b
>  		/* We're at the head of the waitqueue, wait for the lock. */
>  		spin_begin();
>  		while ((val = READ_ONCE(lock->val)) & _Q_LOCKED_VAL) {
> +			bool preempted;
> +
>  			propagate_yield_cpu(node, val, &set_yield_cpu, paravirt);
>  			yield_head_to_locked_owner(lock, val, paravirt,
> -					pv_yield_allow_steal && set_mustq);
> +					pv_yield_allow_steal && set_mustq,
> +					&preempted);
> +
> +			if (paravirt && preempted) {
> +				if (!pv_spin_on_preempted_owner)
> +					iters++;
> +			} else {
> +				iters++;
> +			}
>  
> -			iters++;
>  			if (!set_mustq && iters >= get_head_spins(paravirt)) {
>  				set_mustq = true;
>  				lock_set_mustq(lock);
> @@ -663,6 +713,22 @@ static int pv_yield_allow_steal_get(void *data, u64 *val)
>  
>  DEFINE_SIMPLE_ATTRIBUTE(fops_pv_yield_allow_steal, pv_yield_allow_steal_get, pv_yield_allow_steal_set, "%llu\n");
>  
> +static int pv_spin_on_preempted_owner_set(void *data, u64 val)
> +{
> +	pv_spin_on_preempted_owner = !!val;
> +
> +	return 0;
> +}
> +
> +static int pv_spin_on_preempted_owner_get(void *data, u64 *val)
> +{
> +	*val = pv_spin_on_preempted_owner;
> +
> +	return 0;
> +}
> +
> +DEFINE_SIMPLE_ATTRIBUTE(fops_pv_spin_on_preempted_owner, pv_spin_on_preempted_owner_get, pv_spin_on_preempted_owner_set, "%llu\n");
> +
>  static int pv_yield_prev_set(void *data, u64 val)
>  {
>  	pv_yield_prev = !!val;
> @@ -719,6 +785,7 @@ static __init int spinlock_debugfs_init(void)
>  	if (is_shared_processor()) {
>  		debugfs_create_file("qspl_pv_yield_owner", 0600, arch_debugfs_dir, NULL, &fops_pv_yield_owner);
>  		debugfs_create_file("qspl_pv_yield_allow_steal", 0600, arch_debugfs_dir, NULL, &fops_pv_yield_allow_steal);
> +		debugfs_create_file("qspl_pv_spin_on_preempted_owner", 0600, arch_debugfs_dir, NULL, &fops_pv_spin_on_preempted_owner);
>  		debugfs_create_file("qspl_pv_yield_prev", 0600, arch_debugfs_dir, NULL, &fops_pv_yield_prev);
>  		debugfs_create_file("qspl_pv_yield_propagate_owner", 0600, arch_debugfs_dir, NULL, &fops_pv_yield_propagate_owner);
>  		debugfs_create_file("qspl_pv_prod_head", 0600, arch_debugfs_dir, NULL, &fops_pv_prod_head);

