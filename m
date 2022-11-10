Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 12142623844
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Nov 2022 01:42:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N732r6tPxz3f24
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Nov 2022 11:42:44 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=J20RUrKW;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::430; helo=mail-pf1-x430.google.com; envelope-from=jniethe5@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=J20RUrKW;
	dkim-atps=neutral
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N730L2bRtz3dtg
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Nov 2022 11:40:33 +1100 (AEDT)
Received: by mail-pf1-x430.google.com with SMTP id b185so314689pfb.9
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 09 Nov 2022 16:40:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:user-agent:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2AMeVurdztOumYjQmPnpVbtcIRDXXHFw9+QWv8XP2tM=;
        b=J20RUrKWjybkVFBZe2SyHblobHWShzp159CFttlADnLyGP6SpRQtUIK9WCYoNHmg/y
         sHGLV2YN1R6vKoYPe7qYt/Gx3DsEFPpDNRALJua1dQCA64fNKp1n3YYKwTWye3ge2aZD
         aR7BSOxsI/BgFiurcGSErWzCddxqpypXdq3wLV06wS11Kuuge3Ro5hXY4p0lArS8lVyo
         G0gpxK1fzibKEJnzKJxyZNa/pV0i+wo4fh6rQNoWKPBYb+MUU01EANQlMRwuE+MC/VS+
         36l4PfLLmQkZnracD55UtPhj9IOALYIcomorr2p94QgmxCE+tI1Qb9LAOfu505BWAcHg
         nzQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:user-agent:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2AMeVurdztOumYjQmPnpVbtcIRDXXHFw9+QWv8XP2tM=;
        b=q7JWTQCP/I8vNzqAk4sDx5AIuna9NA0toJs5sRqUl++xjMLltmf5u3ek3o2cCveibM
         HuEYjo8yUklCEbRqZg94uZtYQ8qZwpur2R0A4u8+f2gdLlLXPQaZGlpLTpsQiBa/3SAh
         CiM03QiNTsH5LKl4IQVNexJZlhs7+uS07nuv2pulCgCbiaEuKsRI8fTb2VOSDEQd9Npr
         cbVvq+lRWF5Ky2x4JMoe9vETvFaAXVvxLWylHGWxejX+bWmaJUtMqWK16DmE3s72Xx1o
         Dgd/WwebC65EYxaOgkoDhjquO2q6S/F13B/6WpIeIi/hO9xXBld0Qyp2BfXDcUeqV/nV
         50ZA==
X-Gm-Message-State: ACrzQf2AJnvUl0oY9fe0XeaTihBQs+clai1mZK2OcYoKvOy82QN+Uc4F
	1aN8wgd0dDN3FkUUGq9Q+SxDa9QXUpU=
X-Google-Smtp-Source: AMsMyM7J/wbFNLwGKOfDZv3BDzRGpxntqlYQ1hefS4EiM1jvg7XxLsXQjiYdNDQzEfeFu7Go3B0BeA==
X-Received: by 2002:aa7:820f:0:b0:562:83c1:59e0 with SMTP id k15-20020aa7820f000000b0056283c159e0mr1430032pfi.34.1668040830447;
        Wed, 09 Nov 2022 16:40:30 -0800 (PST)
Received: from tee480.ozlabs.ibm.com (110-175-254-242.static.tpgi.com.au. [110.175.254.242])
        by smtp.googlemail.com with ESMTPSA id y11-20020a1709029b8b00b00178b6ccc8a0sm9680576plp.51.2022.11.09.16.40.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Nov 2022 16:40:30 -0800 (PST)
Message-ID: <72d8e4c8160c4d19ee6bdeb9f6d0c8fe1df5f8dc.camel@gmail.com>
Subject: Re: [PATCH 06/17] powerpc/qspinlock: theft prevention to control
 latency
From: Jordan Niethe <jniethe5@gmail.com>
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
Date: Thu, 10 Nov 2022 11:40:26 +1100
In-Reply-To: <20220728063120.2867508-8-npiggin@gmail.com>
References: <20220728063120.2867508-1-npiggin@gmail.com>
	 <20220728063120.2867508-8-npiggin@gmail.com>
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
> Give the queue head the ability to stop stealers. After a number of
> spins without sucessfully acquiring the lock, the queue head employs
> this, which will assure it is the next owner.
> ---
>  arch/powerpc/include/asm/qspinlock_types.h | 10 +++-
>  arch/powerpc/lib/qspinlock.c               | 56 +++++++++++++++++++++-
>  2 files changed, 63 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/powerpc/include/asm/qspinlock_types.h b/arch/powerpc/include/asm/qspinlock_types.h
> index 210adf05b235..8b20f5e22bba 100644
> --- a/arch/powerpc/include/asm/qspinlock_types.h
> +++ b/arch/powerpc/include/asm/qspinlock_types.h
> @@ -29,7 +29,8 @@ typedef struct qspinlock {
>   * Bitfields in the lock word:
>   *
>   *     0: locked bit
> - * 16-31: tail cpu (+1)
> + *    16: must queue bit
> + * 17-31: tail cpu (+1)
>   */
>  #define	_Q_SET_MASK(type)	(((1U << _Q_ ## type ## _BITS) - 1)\
>  				      << _Q_ ## type ## _OFFSET)
> @@ -38,7 +39,12 @@ typedef struct qspinlock {
>  #define _Q_LOCKED_MASK		_Q_SET_MASK(LOCKED)
>  #define _Q_LOCKED_VAL		(1U << _Q_LOCKED_OFFSET)
>  
> -#define _Q_TAIL_CPU_OFFSET	16
> +#define _Q_MUST_Q_OFFSET	16
> +#define _Q_MUST_Q_BITS		1
> +#define _Q_MUST_Q_MASK		_Q_SET_MASK(MUST_Q)
> +#define _Q_MUST_Q_VAL		(1U << _Q_MUST_Q_OFFSET)
> +
> +#define _Q_TAIL_CPU_OFFSET	17
>  #define _Q_TAIL_CPU_BITS	(32 - _Q_TAIL_CPU_OFFSET)
>  #define _Q_TAIL_CPU_MASK	_Q_SET_MASK(TAIL_CPU)

Not a big deal but some of these values could be calculated like in the
generic version. e.g.

	#define _Q_PENDING_OFFSET	(_Q_LOCKED_OFFSET +_Q_LOCKED_BITS)

>  
> diff --git a/arch/powerpc/lib/qspinlock.c b/arch/powerpc/lib/qspinlock.c
> index 1625cce714b2..a906cc8f15fa 100644
> --- a/arch/powerpc/lib/qspinlock.c
> +++ b/arch/powerpc/lib/qspinlock.c
> @@ -22,6 +22,7 @@ struct qnodes {
>  /* Tuning parameters */
>  static int STEAL_SPINS __read_mostly = (1<<5);
>  static bool MAYBE_STEALERS __read_mostly = true;
> +static int HEAD_SPINS __read_mostly = (1<<8);
>  
>  static DEFINE_PER_CPU_ALIGNED(struct qnodes, qnodes);
>  
> @@ -30,6 +31,11 @@ static __always_inline int get_steal_spins(void)
>  	return STEAL_SPINS;
>  }
>  
> +static __always_inline int get_head_spins(void)
> +{
> +	return HEAD_SPINS;
> +}
> +
>  static inline u32 encode_tail_cpu(void)
>  {
>  	return (smp_processor_id() + 1) << _Q_TAIL_CPU_OFFSET;
> @@ -142,6 +148,23 @@ static __always_inline u32 publish_tail_cpu(struct qspinlock *lock, u32 tail)
>  	return prev;
>  }
>  
> +static __always_inline u32 lock_set_mustq(struct qspinlock *lock)
> +{
> +	u32 new = _Q_MUST_Q_VAL;
> +	u32 prev;
> +
> +	asm volatile(
> +"1:	lwarx	%0,0,%1		# lock_set_mustq			\n"

Is the EH bit not set because we don't hold the lock here?

> +"	or	%0,%0,%2						\n"
> +"	stwcx.	%0,0,%1							\n"
> +"	bne-	1b							\n"
> +	: "=&r" (prev)
> +	: "r" (&lock->val), "r" (new)
> +	: "cr0", "memory");

This is another usage close to the DEFINE_TESTOP() pattern.

> +
> +	return prev;
> +}
> +
>  static struct qnode *get_tail_qnode(struct qspinlock *lock, u32 val)
>  {
>  	int cpu = get_tail_cpu(val);
> @@ -165,6 +188,9 @@ static inline bool try_to_steal_lock(struct qspinlock *lock)
>  	for (;;) {
>  		u32 val = READ_ONCE(lock->val);
>  
> +		if (val & _Q_MUST_Q_VAL)
> +			break;
> +
>  		if (unlikely(!(val & _Q_LOCKED_VAL))) {
>  			if (trylock_with_tail_cpu(lock, val))
>  				return true;
> @@ -246,11 +272,22 @@ static inline void queued_spin_lock_mcs_queue(struct qspinlock *lock)
>  		/* We must be the owner, just set the lock bit and acquire */
>  		lock_set_locked(lock);
>  	} else {
> +		int iters = 0;
> +		bool set_mustq = false;
> +
>  again:
>  		/* We're at the head of the waitqueue, wait for the lock. */
> -		while ((val = READ_ONCE(lock->val)) & _Q_LOCKED_VAL)
> +		while ((val = READ_ONCE(lock->val)) & _Q_LOCKED_VAL) {
>  			cpu_relax();
>  
> +			iters++;

It seems instead of using set_mustq, (val & _Q_MUST_Q_VAL) could be checked?

> +			if (!set_mustq && iters >= get_head_spins()) {
> +				set_mustq = true;
> +				lock_set_mustq(lock);
> +				val |= _Q_MUST_Q_VAL;
> +			}
> +		}
> +
>  		/* If we're the last queued, must clean up the tail. */
>  		if ((val & _Q_TAIL_CPU_MASK) == tail) {
>  			if (trylock_clear_tail_cpu(lock, val))
> @@ -329,9 +366,26 @@ static int steal_spins_get(void *data, u64 *val)
>  
>  DEFINE_SIMPLE_ATTRIBUTE(fops_steal_spins, steal_spins_get, steal_spins_set, "%llu\n");
>  
> +static int head_spins_set(void *data, u64 val)
> +{
> +	HEAD_SPINS = val;
> +
> +	return 0;
> +}
> +
> +static int head_spins_get(void *data, u64 *val)
> +{
> +	*val = HEAD_SPINS;
> +
> +	return 0;
> +}
> +
> +DEFINE_SIMPLE_ATTRIBUTE(fops_head_spins, head_spins_get, head_spins_set, "%llu\n");
> +
>  static __init int spinlock_debugfs_init(void)
>  {
>  	debugfs_create_file("qspl_steal_spins", 0600, arch_debugfs_dir, NULL, &fops_steal_spins);
> +	debugfs_create_file("qspl_head_spins", 0600, arch_debugfs_dir, NULL, &fops_head_spins);
>  
>  	return 0;
>  }

