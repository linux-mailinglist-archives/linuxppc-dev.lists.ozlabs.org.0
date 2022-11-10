Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BBDFD623848
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Nov 2022 01:44:39 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N735143fWz3f9y
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Nov 2022 11:44:37 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=WUzGSBO1;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::534; helo=mail-pg1-x534.google.com; envelope-from=jniethe5@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=WUzGSBO1;
	dkim-atps=neutral
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com [IPv6:2607:f8b0:4864:20::534])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N731D6FkYz3f41
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Nov 2022 11:41:20 +1100 (AEDT)
Received: by mail-pg1-x534.google.com with SMTP id q71so210310pgq.8
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 09 Nov 2022 16:41:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:user-agent:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zLWWR1iqPtnhGN4nd0CrfQQvT/Iv7fknuHsK/OScmjo=;
        b=WUzGSBO1yvvVc5XK7nxjAkX/t3l13ttMsmufNd8Cqj7TOjqekLJn2wpXKTva/VuFQh
         4sle4eWz7Gfbn+nCOjk+9+F6mCPPbRlVHIqsygWPycdT8k/fjpzgebO/cVbqaxHjiTa2
         /4hzp8X2HHp4Qu2/S5Gn6GRUjG0CrgcuVzWztHXqqsV+EkLZxheQDtGVjz2AeQsRGlfP
         NJpCZlOqJO7jQwcKJINjFCKJrBdO8cQLN7HfVKtEYaq9w4QbUQYuSDHw4JhLjHNRRftb
         wAvfo1J1ZMCzvsBzDbv1biimHnZ1vt5bQEHLgsMhsKE0swO3YRqiIs5pNNONUGXOP5nQ
         PcvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:user-agent:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zLWWR1iqPtnhGN4nd0CrfQQvT/Iv7fknuHsK/OScmjo=;
        b=1BCusLvuSG0S8D8uypcpdiQvXdve6PWhpkEkmMzjUj3yCmjy8ThqJeHz4DErVHwd7O
         ewTDfMYCPuf1Wi5n1NIZmOzhX23fjgudlg8Ov8LS4Va7Cpgjf/Vp6CR7khJse6ZW4N2Z
         SqPxy4Zlew2cBsXNKZ3mSfrEA6H9aKyQc1u9mm/CPEloRlSXHmJUystipdIAbFGHdRiu
         1hbyj/2Wi6tUI/uCZGy8oJPEqxTLpJpEXk4dXAQimrTF1g39qswOfviCV6zHUMgfpmX6
         zM9QWlE0Isn9uIzznhcrNgiuKZ2XlUu8eSmsTmttj1l8PkMsHzXo4CflpnTPjr1cbIZv
         mz1A==
X-Gm-Message-State: ACrzQf1lk3l+K6fLF+DAbCG4QJx1yjDvPykfhOElxD0OTPsZAAmoQ4zD
	csVbQ2lIzzYOWDOgnlwR8AFjMDDvdVM=
X-Google-Smtp-Source: AMsMyM7IRZbo7vnnhzMcCjvdQ0Jtyzwbd4Z1EQcosub2qLwKuktar/2R8OxZrFRKp4Oj8pL55lBLIw==
X-Received: by 2002:a63:1e16:0:b0:430:5c4a:a3b5 with SMTP id e22-20020a631e16000000b004305c4aa3b5mr55648444pge.37.1668040878575;
        Wed, 09 Nov 2022 16:41:18 -0800 (PST)
Received: from tee480.ozlabs.ibm.com (110-175-254-242.static.tpgi.com.au. [110.175.254.242])
        by smtp.googlemail.com with ESMTPSA id y19-20020a170902ed5300b001870dc3b4c0sm9688704plb.74.2022.11.09.16.41.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Nov 2022 16:41:18 -0800 (PST)
Message-ID: <7f160be06ae6530abab716232f47e7769715062b.camel@gmail.com>
Subject: Re: [PATCH 08/17] powerpc/qspinlock: paravirt yield to lock owner
From: Jordan Niethe <jniethe5@gmail.com>
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
Date: Thu, 10 Nov 2022 11:41:15 +1100
In-Reply-To: <20220728063120.2867508-10-npiggin@gmail.com>
References: <20220728063120.2867508-1-npiggin@gmail.com>
	 <20220728063120.2867508-10-npiggin@gmail.com>
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
> Waiters spinning on the lock word should yield to the lock owner if the
> vCPU is preempted. This improves performance when the hypervisor has
> oversubscribed physical CPUs.
> ---
>  arch/powerpc/lib/qspinlock.c | 97 ++++++++++++++++++++++++++++++------
>  1 file changed, 83 insertions(+), 14 deletions(-)
> 
> diff --git a/arch/powerpc/lib/qspinlock.c b/arch/powerpc/lib/qspinlock.c
> index aa26cfe21f18..55286ac91da5 100644
> --- a/arch/powerpc/lib/qspinlock.c
> +++ b/arch/powerpc/lib/qspinlock.c
> @@ -5,6 +5,7 @@
>  #include <linux/percpu.h>
>  #include <linux/smp.h>
>  #include <asm/qspinlock.h>
> +#include <asm/paravirt.h>
>  
>  #define MAX_NODES	4
>  
> @@ -24,14 +25,16 @@ static int STEAL_SPINS __read_mostly = (1<<5);
>  static bool MAYBE_STEALERS __read_mostly = true;
>  static int HEAD_SPINS __read_mostly = (1<<8);
>  
> +static bool pv_yield_owner __read_mostly = true;

Not macro case for these globals? To me name does not make it super clear this
is a boolean. What about pv_yield_owner_enabled?

> +
>  static DEFINE_PER_CPU_ALIGNED(struct qnodes, qnodes);
>  
> -static __always_inline int get_steal_spins(void)
> +static __always_inline int get_steal_spins(bool paravirt)
>  {
>  	return STEAL_SPINS;
>  }
>  
> -static __always_inline int get_head_spins(void)
> +static __always_inline int get_head_spins(bool paravirt)
>  {
>  	return HEAD_SPINS;
>  }
> @@ -46,7 +49,11 @@ static inline int get_tail_cpu(u32 val)
>  	return (val >> _Q_TAIL_CPU_OFFSET) - 1;
>  }
>  
> -/* Take the lock by setting the bit, no other CPUs may concurrently lock it. */
> +static inline int get_owner_cpu(u32 val)
> +{
> +	return (val & _Q_OWNER_CPU_MASK) >> _Q_OWNER_CPU_OFFSET;
> +}
> +
>  /* Take the lock by setting the lock bit, no other CPUs will touch it. */
>  static __always_inline void lock_set_locked(struct qspinlock *lock)
>  {
> @@ -180,7 +187,45 @@ static struct qnode *get_tail_qnode(struct qspinlock *lock, u32 val)
>  	BUG();
>  }
>  
> -static inline bool try_to_steal_lock(struct qspinlock *lock)
> +static __always_inline void yield_to_locked_owner(struct qspinlock *lock, u32 val, bool paravirt)

This name doesn't seem correct for the non paravirt case.

> +{
> +	int owner;
> +	u32 yield_count;
> +
> +	BUG_ON(!(val & _Q_LOCKED_VAL));
> +
> +	if (!paravirt)
> +		goto relax;
> +
> +	if (!pv_yield_owner)
> +		goto relax;
> +
> +	owner = get_owner_cpu(val);
> +	yield_count = yield_count_of(owner);
> +
> +	if ((yield_count & 1) == 0)
> +		goto relax; /* owner vcpu is running */

I wonder why not use vcpu_is_preempted()?

> +
> +	/*
> +	 * Read the lock word after sampling the yield count. On the other side
> +	 * there may a wmb because the yield count update is done by the
> +	 * hypervisor preemption and the value update by the OS, however this
> +	 * ordering might reduce the chance of out of order accesses and
> +	 * improve the heuristic.
> +	 */
> +	smp_rmb();
> +
> +	if (READ_ONCE(lock->val) == val) {
> +		yield_to_preempted(owner, yield_count);
> +		/* Don't relax if we yielded. Maybe we should? */
> +		return;
> +	}
> +relax:
> +	cpu_relax();
> +}
> +
> +
> +static __always_inline bool try_to_steal_lock(struct qspinlock *lock, bool paravirt)
>  {
>  	int iters;
>  
> @@ -197,18 +242,18 @@ static inline bool try_to_steal_lock(struct qspinlock *lock)
>  			continue;
>  		}
>  
> -		cpu_relax();
> +		yield_to_locked_owner(lock, val, paravirt);
>  
>  		iters++;
>  
> -		if (iters >= get_steal_spins())
> +		if (iters >= get_steal_spins(paravirt))
>  			break;
>  	}
>  
>  	return false;
>  }
>  
> -static inline void queued_spin_lock_mcs_queue(struct qspinlock *lock)
> +static __always_inline void queued_spin_lock_mcs_queue(struct qspinlock *lock, bool paravirt)
>  {
>  	struct qnodes *qnodesp;
>  	struct qnode *next, *node;
> @@ -260,7 +305,7 @@ static inline void queued_spin_lock_mcs_queue(struct qspinlock *lock)
>  	if (!MAYBE_STEALERS) {
>  		/* We're at the head of the waitqueue, wait for the lock. */
>  		while ((val = READ_ONCE(lock->val)) & _Q_LOCKED_VAL)
> -			cpu_relax();
> +			yield_to_locked_owner(lock, val, paravirt);
>  
>  		/* If we're the last queued, must clean up the tail. */
>  		if ((val & _Q_TAIL_CPU_MASK) == tail) {
> @@ -278,10 +323,10 @@ static inline void queued_spin_lock_mcs_queue(struct qspinlock *lock)
>  again:
>  		/* We're at the head of the waitqueue, wait for the lock. */
>  		while ((val = READ_ONCE(lock->val)) & _Q_LOCKED_VAL) {
> -			cpu_relax();
> +			yield_to_locked_owner(lock, val, paravirt);
>  
>  			iters++;
> -			if (!set_mustq && iters >= get_head_spins()) {
> +			if (!set_mustq && iters >= get_head_spins(paravirt)) {
>  				set_mustq = true;
>  				lock_set_mustq(lock);
>  				val |= _Q_MUST_Q_VAL;
> @@ -320,10 +365,15 @@ static inline void queued_spin_lock_mcs_queue(struct qspinlock *lock)
>  
>  void queued_spin_lock_slowpath(struct qspinlock *lock)
>  {
> -	if (try_to_steal_lock(lock))
> -		return;
> -
> -	queued_spin_lock_mcs_queue(lock);
> +	if (IS_ENABLED(CONFIG_PARAVIRT_SPINLOCKS) && is_shared_processor()) {
> +		if (try_to_steal_lock(lock, true))
> +			return;
> +		queued_spin_lock_mcs_queue(lock, true);
> +	} else {
> +		if (try_to_steal_lock(lock, false))
> +			return;
> +		queued_spin_lock_mcs_queue(lock, false);
> +	}
>  }

There is not really a need for a conditional: 

bool paravirt = IS_ENABLED(CONFIG_PARAVIRT_SPINLOCKS) &&
is_shared_processor();

if (try_to_steal_lock(lock, paravirt))
	return;

queued_spin_lock_mcs_queue(lock, paravirt);


The paravirt parameter used by the various functions seems always to be
equivalent to (IS_ENABLED(CONFIG_PARAVIRT_SPINLOCKS) && is_shared_processor()).
I wonder if it would be simpler testing (IS_ENABLED(CONFIG_PARAVIRT_SPINLOCKS) && is_shared_processor())
(using a helper function) in those functions instead passing it as a parameter?


>  EXPORT_SYMBOL(queued_spin_lock_slowpath);
>  
> @@ -382,10 +432,29 @@ static int head_spins_get(void *data, u64 *val)
>  
>  DEFINE_SIMPLE_ATTRIBUTE(fops_head_spins, head_spins_get, head_spins_set, "%llu\n");
>  
> +static int pv_yield_owner_set(void *data, u64 val)
> +{
> +	pv_yield_owner = !!val;
> +
> +	return 0;
> +}
> +
> +static int pv_yield_owner_get(void *data, u64 *val)
> +{
> +	*val = pv_yield_owner;
> +
> +	return 0;
> +}
> +
> +DEFINE_SIMPLE_ATTRIBUTE(fops_pv_yield_owner, pv_yield_owner_get, pv_yield_owner_set, "%llu\n");
> +
>  static __init int spinlock_debugfs_init(void)
>  {
>  	debugfs_create_file("qspl_steal_spins", 0600, arch_debugfs_dir, NULL, &fops_steal_spins);
>  	debugfs_create_file("qspl_head_spins", 0600, arch_debugfs_dir, NULL, &fops_head_spins);
> +	if (is_shared_processor()) {
> +		debugfs_create_file("qspl_pv_yield_owner", 0600, arch_debugfs_dir, NULL, &fops_pv_yield_owner);
> +	}
>  
>  	return 0;
>  }

