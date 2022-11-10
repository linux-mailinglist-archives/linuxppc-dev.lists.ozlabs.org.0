Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 409D8623863
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Nov 2022 01:47:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N738C10VRz3ccg
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Nov 2022 11:47:23 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=A0JTZLEy;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::434; helo=mail-pf1-x434.google.com; envelope-from=jniethe5@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=A0JTZLEy;
	dkim-atps=neutral
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com [IPv6:2607:f8b0:4864:20::434])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N732c3qfdz3f6N
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Nov 2022 11:42:32 +1100 (AEDT)
Received: by mail-pf1-x434.google.com with SMTP id 130so323082pfu.8
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 09 Nov 2022 16:42:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:user-agent:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+X7cuczpPVUk/MRUq69sticR3i3ggNFzSnuc75MmncA=;
        b=A0JTZLEyAy00tYtoQMZND+3QperLDl2Y571SAY3MjFIdza6KVI8dI4arqemXHmG1b0
         IDKgqYnkEy4b9iG38Io2Gyka/frabq359ePz6Io5n1VjThXHCnUs5oruHX0mHPS3q1ls
         B+U7K84LPcvVF1v6+kGlZJ9xhLT9t1+iwC5rYqfe6GP0ADBCB/YR4d5w9N3VqZEUhIip
         +HrqW2TLirHxm29fAi7vnf6YRI6gV717pj29J1jTQeetbPy870Jjb2br3WWnsRJ7mjLq
         qWhTD85MrBlr6jEuGzni1+evBI6zfysGCWnd0G/mAUC1QbJFDT6kb180P3DrNj1eUJBp
         m+pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:user-agent:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+X7cuczpPVUk/MRUq69sticR3i3ggNFzSnuc75MmncA=;
        b=zsykjBhD2jJ3HhmSyHmKUTA16FCr/TyydUr5ANBWE2BW3xdjIc+hVY3neFHOB9ZbJT
         O+E9EoGk2M7wtrnDG8KVF9G+FzrsGPu7Mm/JChDGK9Hjqy8R8xVjkRLd3cyP+IhbDwCG
         mqePwxjmPek08CdnSq+481K8PhTUcZGxL/brAiOQ7o40EmfcIHfzmNfU0ydXK233MtoZ
         gbbP7ipg8GfIRFSpMlbKdRG+/nh8ponKtTPXeedXBbjLAYD3M8iQ73HnYRJXW99qBB8J
         KHhjElYsEK6cmh9tya+iK+ELD2kv8juU742v0zjUNXQkoPO0jcvRA720hvTVLqbOY5wI
         AqvQ==
X-Gm-Message-State: ACrzQf2YALT/NWMon5CbkTulwelOQ1mAIWmkT+boT9esaW+a70hYb8nX
	v4g/BN0LTRx2mbNhnBn3hAh/BmGy83Y=
X-Google-Smtp-Source: AMsMyM7Nj7Ur48LFJU4s2K+6MP7FaU+NKSU5E1xtIWUslvgB8TmvYHYHOu+uhCWkqIrV5PUzfgCi5w==
X-Received: by 2002:a63:4e5a:0:b0:438:9513:da55 with SMTP id o26-20020a634e5a000000b004389513da55mr52494071pgl.381.1668040950191;
        Wed, 09 Nov 2022 16:42:30 -0800 (PST)
Received: from tee480.ozlabs.ibm.com (110-175-254-242.static.tpgi.com.au. [110.175.254.242])
        by smtp.googlemail.com with ESMTPSA id e9-20020a170902784900b00183e2a96414sm9678237pln.121.2022.11.09.16.42.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Nov 2022 16:42:29 -0800 (PST)
Message-ID: <539debd7b25d5b4fe36756ae257d12f19aa4d6d3.camel@gmail.com>
Subject: Re: [PATCH 11/17] powerpc/qspinlock: allow propagation of yield CPU
 down the queue
From: Jordan Niethe <jniethe5@gmail.com>
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
Date: Thu, 10 Nov 2022 11:42:26 +1100
In-Reply-To: <20220728063120.2867508-13-npiggin@gmail.com>
References: <20220728063120.2867508-1-npiggin@gmail.com>
	 <20220728063120.2867508-13-npiggin@gmail.com>
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
> Having all CPUs poll the lock word for the owner CPU that should be
> yielded to defeats most of the purpose of using MCS queueing for
> scalability. Yet it may be desirable for queued waiters to to yield
> to a preempted owner.
> 
> s390 addreses this problem by having queued waiters sample the lock
> word to find the owner much less frequently. In this approach, the
> waiters never sample it directly, but the queue head propagates the
> owner CPU back to the next waiter if it ever finds the owner has
> been preempted. Queued waiters then subsequently propagate the owner
> CPU back to the next waiter, and so on.
> 
> Disable this option by default for now, i.e., no logical change.
> ---
>  arch/powerpc/lib/qspinlock.c | 85 +++++++++++++++++++++++++++++++++++-
>  1 file changed, 84 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/powerpc/lib/qspinlock.c b/arch/powerpc/lib/qspinlock.c
> index 94f007f66942..28c85a2d5635 100644
> --- a/arch/powerpc/lib/qspinlock.c
> +++ b/arch/powerpc/lib/qspinlock.c
> @@ -12,6 +12,7 @@
>  struct qnode {
>  	struct qnode	*next;
>  	struct qspinlock *lock;
> +	int		yield_cpu;
>  	u8		locked; /* 1 if lock acquired */
>  };
>  
> @@ -28,6 +29,7 @@ static int HEAD_SPINS __read_mostly = (1<<8);
>  static bool pv_yield_owner __read_mostly = true;
>  static bool pv_yield_allow_steal __read_mostly = false;
>  static bool pv_yield_prev __read_mostly = true;
> +static bool pv_yield_propagate_owner __read_mostly = true;

This also seems to be enabled by default.

>  
>  static DEFINE_PER_CPU_ALIGNED(struct qnodes, qnodes);
>  
> @@ -257,13 +259,66 @@ static __always_inline void yield_head_to_locked_owner(struct qspinlock *lock, u
>  	__yield_to_locked_owner(lock, val, paravirt, clear_mustq);
>  }
>  
> +static __always_inline void propagate_yield_cpu(struct qnode *node, u32 val, int *set_yield_cpu, bool paravirt)
> +{
> +	struct qnode *next;
> +	int owner;
> +
> +	if (!paravirt)
> +		return;
> +	if (!pv_yield_propagate_owner)
> +		return;
> +
> +	owner = get_owner_cpu(val);
> +	if (*set_yield_cpu == owner)
> +		return;
> +
> +	next = READ_ONCE(node->next);
> +	if (!next)
> +		return;
> +
> +	if (vcpu_is_preempted(owner)) {

Is there a difference about using vcpu_is_preempted() here
vs checking bit 0 in other places?


> +		next->yield_cpu = owner;
> +		*set_yield_cpu = owner;
> +	} else if (*set_yield_cpu != -1) {

It might be worth giving the -1 CPU a #define.

> +		next->yield_cpu = owner;
> +		*set_yield_cpu = owner;
> +	}
> +}

Does this need to pass set_yield_cpu by reference? Couldn't it's new value be
returned? To me it makes it more clear the function is used to change
set_yield_cpu. I think this would work:

int set_yield_cpu = -1;

static __always_inline int propagate_yield_cpu(struct qnode *node, u32 val, int set_yield_cpu, bool paravirt)
{
	struct qnode *next;
	int owner;

	if (!paravirt)
		goto out;
	if (!pv_yield_propagate_owner)
		goto out;

	owner = get_owner_cpu(val);
	if (set_yield_cpu == owner)
		goto out;

	next = READ_ONCE(node->next);
	if (!next)
		goto out;

	if (vcpu_is_preempted(owner)) {
		next->yield_cpu = owner;
		return owner;
	} else if (set_yield_cpu != -1) {
		next->yield_cpu = owner;
		return owner;
	}

out:
	return set_yield_cpu;
}

set_yield_cpu = propagate_yield_cpu(...  set_yield_cpu ...);



> +
>  static __always_inline void yield_to_prev(struct qspinlock *lock, struct qnode *node, int prev_cpu, bool paravirt)
>  {
>  	u32 yield_count;
> +	int yield_cpu;
>  
>  	if (!paravirt)
>  		goto relax;
>  
> +	if (!pv_yield_propagate_owner)
> +		goto yield_prev;
> +
> +	yield_cpu = READ_ONCE(node->yield_cpu);
> +	if (yield_cpu == -1) {
> +		/* Propagate back the -1 CPU */
> +		if (node->next && node->next->yield_cpu != -1)
> +			node->next->yield_cpu = yield_cpu;
> +		goto yield_prev;
> +	}
> +
> +	yield_count = yield_count_of(yield_cpu);
> +	if ((yield_count & 1) == 0)
> +		goto yield_prev; /* owner vcpu is running */
> +
> +	smp_rmb();
> +
> +	if (yield_cpu == node->yield_cpu) {
> +		if (node->next && node->next->yield_cpu != yield_cpu)
> +			node->next->yield_cpu = yield_cpu;
> +		yield_to_preempted(yield_cpu, yield_count);
> +		return;
> +	}
> +
> +yield_prev:
>  	if (!pv_yield_prev)
>  		goto relax;
>  
> @@ -337,6 +392,7 @@ static __always_inline void queued_spin_lock_mcs_queue(struct qspinlock *lock, b
>  	node = &qnodesp->nodes[idx];
>  	node->next = NULL;
>  	node->lock = lock;
> +	node->yield_cpu = -1;
>  	node->locked = 0;
>  
>  	tail = encode_tail_cpu();
> @@ -358,13 +414,21 @@ static __always_inline void queued_spin_lock_mcs_queue(struct qspinlock *lock, b
>  		while (!node->locked)
>  			yield_to_prev(lock, node, prev_cpu, paravirt);
>  
> +		/* Clear out stale propagated yield_cpu */
> +		if (paravirt && pv_yield_propagate_owner && node->yield_cpu != -1)
> +			node->yield_cpu = -1;
> +
>  		smp_rmb(); /* acquire barrier for the mcs lock */
>  	}
>  
>  	if (!MAYBE_STEALERS) {
> +		int set_yield_cpu = -1;
> +
>  		/* We're at the head of the waitqueue, wait for the lock. */
> -		while ((val = READ_ONCE(lock->val)) & _Q_LOCKED_VAL)
> +		while ((val = READ_ONCE(lock->val)) & _Q_LOCKED_VAL) {
> +			propagate_yield_cpu(node, val, &set_yield_cpu, paravirt);
>  			yield_head_to_locked_owner(lock, val, paravirt, false);
> +		}
>  
>  		/* If we're the last queued, must clean up the tail. */
>  		if ((val & _Q_TAIL_CPU_MASK) == tail) {
> @@ -376,12 +440,14 @@ static __always_inline void queued_spin_lock_mcs_queue(struct qspinlock *lock, b
>  		/* We must be the owner, just set the lock bit and acquire */
>  		lock_set_locked(lock);
>  	} else {
> +		int set_yield_cpu = -1;
>  		int iters = 0;
>  		bool set_mustq = false;
>  
>  again:
>  		/* We're at the head of the waitqueue, wait for the lock. */
>  		while ((val = READ_ONCE(lock->val)) & _Q_LOCKED_VAL) {
> +			propagate_yield_cpu(node, val, &set_yield_cpu, paravirt);
>  			yield_head_to_locked_owner(lock, val, paravirt,
>  					pv_yield_allow_steal && set_mustq);
>  
> @@ -540,6 +606,22 @@ static int pv_yield_prev_get(void *data, u64 *val)
>  
>  DEFINE_SIMPLE_ATTRIBUTE(fops_pv_yield_prev, pv_yield_prev_get, pv_yield_prev_set, "%llu\n");
>  
> +static int pv_yield_propagate_owner_set(void *data, u64 val)
> +{
> +	pv_yield_propagate_owner = !!val;
> +
> +	return 0;
> +}
> +
> +static int pv_yield_propagate_owner_get(void *data, u64 *val)
> +{
> +	*val = pv_yield_propagate_owner;
> +
> +	return 0;
> +}
> +
> +DEFINE_SIMPLE_ATTRIBUTE(fops_pv_yield_propagate_owner, pv_yield_propagate_owner_get, pv_yield_propagate_owner_set, "%llu\n");
> +
>  static __init int spinlock_debugfs_init(void)
>  {
>  	debugfs_create_file("qspl_steal_spins", 0600, arch_debugfs_dir, NULL, &fops_steal_spins);
> @@ -548,6 +630,7 @@ static __init int spinlock_debugfs_init(void)
>  		debugfs_create_file("qspl_pv_yield_owner", 0600, arch_debugfs_dir, NULL, &fops_pv_yield_owner);
>  		debugfs_create_file("qspl_pv_yield_allow_steal", 0600, arch_debugfs_dir, NULL, &fops_pv_yield_allow_steal);
>  		debugfs_create_file("qspl_pv_yield_prev", 0600, arch_debugfs_dir, NULL, &fops_pv_yield_prev);
> +		debugfs_create_file("qspl_pv_yield_propagate_owner", 0600, arch_debugfs_dir, NULL, &fops_pv_yield_propagate_owner);
>  	}
>  
>  	return 0;

