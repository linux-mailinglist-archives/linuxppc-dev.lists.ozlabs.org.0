Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D6F13623868
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Nov 2022 01:49:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N73BD4qZxz3fJS
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Nov 2022 11:49:08 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=ix3R5LZX;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::432; helo=mail-pf1-x432.google.com; envelope-from=jniethe5@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=ix3R5LZX;
	dkim-atps=neutral
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N733J3bVrz3f7T
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Nov 2022 11:43:08 +1100 (AEDT)
Received: by mail-pf1-x432.google.com with SMTP id m6so378821pfb.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 09 Nov 2022 16:43:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:user-agent:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F7OjR3Crp5GEgjT9hJPOzGzhtTcX4/R667rnyOwgA9s=;
        b=ix3R5LZXhWczeBs/DfBBQe+6LSNZJcOW0ohAJ4i2lsf9Am4SuZKfg7IAAScDcMbpcZ
         sNIrBYQoWjQV4jEjJrO7TxJ+TSOMv8W5cVYbIWtE3EFWfaiGVSblR8KczXq2r4Ioln2+
         knqq5f1ZKk4krk0lVL++Ynu4bBsLS1Y6rbh5e+Moag2xRsvflscl3k42WmSUunaVXxqu
         XbV8Ll89uf5sH8cVsEEdt94xw7x0N/sV7BpA7XwVLB4fIjzYxM/IjOXpOl4j+lw9hr+h
         3t9YPNG6EPvrSJIicaTVStxYDUin42fWWZDICL7wLSLKx6Y9Zec2+Ea0eeLh5G7gDMat
         PFIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:user-agent:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=F7OjR3Crp5GEgjT9hJPOzGzhtTcX4/R667rnyOwgA9s=;
        b=oEtyzC4tFg6eoBZyVqVjhO3VcS3J3SHqOyuGZH9m/nzqxozh+d6lzXsUfZ1kKz5jiR
         aXxsmw8qN+QT9ylpTfJrZ01OKXgYXgg8q9D0QrGLZgknor+XNjlZkwYdTkiVlD9dHcGq
         EssQbOur3S+R4QKRq0sRemduRFPgxww+xhA9CAQ+z4nAzTY1gxbiT9ack1j5x53EAF0x
         8MJ7rx2HeO7Hj2Fr/1zkLEfRjsJurMJqQUXSMJvFahPIel8GSjhD/UXismltp+g4MitC
         MXLCMLfaa9dZFug+s2vRUHDqux0TaSXb/ffOfrM+6v/mR6XLZbiNMwrHel/EV/b5tmXY
         Qi2Q==
X-Gm-Message-State: ACrzQf29jlQkY5wxZdmo91o31UXoLE57ZvLWOdpq5QJm7pAPwkJfzAmD
	J/zxAGa9S6Nqhml1jn7wwxA=
X-Google-Smtp-Source: AMsMyM77FNyOfx5eZvJuNv9ZznMp3T7RzflY+IsI/SSut4L/cJbeC+G5nOGKOOYUyoVj5AyDDtakIg==
X-Received: by 2002:a63:66c6:0:b0:46e:c05d:b8d6 with SMTP id a189-20020a6366c6000000b0046ec05db8d6mr54082905pgc.474.1668040986624;
        Wed, 09 Nov 2022 16:43:06 -0800 (PST)
Received: from tee480.ozlabs.ibm.com (110-175-254-242.static.tpgi.com.au. [110.175.254.242])
        by smtp.googlemail.com with ESMTPSA id o3-20020a170902d4c300b00186b55e3cd6sm9806176plg.133.2022.11.09.16.43.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Nov 2022 16:43:06 -0800 (PST)
Message-ID: <102be7ce979d8edc5eec56881a5d14c1eb2211b2.camel@gmail.com>
Subject: Re: [PATCH 13/17] powerpc/qspinlock: trylock and initial lock
 attempt may steal
From: Jordan Niethe <jniethe5@gmail.com>
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
Date: Thu, 10 Nov 2022 11:43:02 +1100
In-Reply-To: <20220728063120.2867508-15-npiggin@gmail.com>
References: <20220728063120.2867508-1-npiggin@gmail.com>
	 <20220728063120.2867508-15-npiggin@gmail.com>
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
> This gives trylock slightly more strength, and it also gives most
> of the benefit of passing 'val' back through the slowpath without
> the complexity.
> ---
>  arch/powerpc/include/asm/qspinlock.h | 39 +++++++++++++++++++++++++++-
>  arch/powerpc/lib/qspinlock.c         |  9 +++++++
>  2 files changed, 47 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/powerpc/include/asm/qspinlock.h b/arch/powerpc/include/asm/qspinlock.h
> index 44601b261e08..d3d2039237b2 100644
> --- a/arch/powerpc/include/asm/qspinlock.h
> +++ b/arch/powerpc/include/asm/qspinlock.h
> @@ -5,6 +5,8 @@
>  #include <linux/compiler.h>
>  #include <asm/qspinlock_types.h>
>  
> +#define _Q_SPIN_TRY_LOCK_STEAL 1

Would this be a config option?

> +
>  static __always_inline int queued_spin_is_locked(struct qspinlock *lock)
>  {
>  	return READ_ONCE(lock->val);
> @@ -26,11 +28,12 @@ static __always_inline u32 queued_spin_get_locked_val(void)
>  	return _Q_LOCKED_VAL | (smp_processor_id() << _Q_OWNER_CPU_OFFSET);
>  }
>  
> -static __always_inline int queued_spin_trylock(struct qspinlock *lock)
> +static __always_inline int __queued_spin_trylock_nosteal(struct qspinlock *lock)
>  {
>  	u32 new = queued_spin_get_locked_val();
>  	u32 prev;
>  
> +	/* Trylock succeeds only when unlocked and no queued nodes */
>  	asm volatile(
>  "1:	lwarx	%0,0,%1,%3	# queued_spin_trylock			\n"

s/queued_spin_trylock/__queued_spin_trylock_nosteal

>  "	cmpwi	0,%0,0							\n"
> @@ -49,6 +52,40 @@ static __always_inline int queued_spin_trylock(struct qspinlock *lock)
>  	return 0;
>  }
>  
> +static __always_inline int __queued_spin_trylock_steal(struct qspinlock *lock)
> +{
> +	u32 new = queued_spin_get_locked_val();
> +	u32 prev, tmp;
> +
> +	/* Trylock may get ahead of queued nodes if it finds unlocked */
> +	asm volatile(
> +"1:	lwarx	%0,0,%2,%5	# queued_spin_trylock			\n"

s/queued_spin_trylock/__queued_spin_trylock_steal

> +"	andc.	%1,%0,%4						\n"
> +"	bne-	2f							\n"
> +"	and	%1,%0,%4						\n"
> +"	or	%1,%1,%3						\n"
> +"	stwcx.	%1,0,%2							\n"
> +"	bne-	1b							\n"
> +"\t"	PPC_ACQUIRE_BARRIER "						\n"
> +"2:									\n"

Just because there's a little bit more going on here...

Q_TAIL_CPU_MASK = 0xFFFE0000
~Q_TAIL_CPU_MASK = 0x1FFFF


1:	lwarx	prev, 0, &lock->val, IS_ENABLED_PPC64
	andc.	tmp, prev, _Q_TAIL_CPU_MASK 	(tmp = prev & ~_Q_TAIL_CPU_MASK)
	bne-	2f 				(exit if locked)
	and	tmp, prev, _Q_TAIL_CPU_MASK 	(tmp = prev & _Q_TAIL_CPU_MASK)
	or	tmp, tmp, new			(tmp |= new)					
	stwcx.	tmp, 0, &lock->val					
		
	bne-	1b							
	PPC_ACQUIRE_BARRIER		
2:

... which seems correct.


> +	: "=&r" (prev), "=&r" (tmp)
> +	: "r" (&lock->val), "r" (new), "r" (_Q_TAIL_CPU_MASK),
> +	  "i" (IS_ENABLED(CONFIG_PPC64) ? 1 : 0)
> +	: "cr0", "memory");
> +
> +	if (likely(!(prev & ~_Q_TAIL_CPU_MASK)))
> +		return 1;
> +	return 0;
> +}
> +
> +static __always_inline int queued_spin_trylock(struct qspinlock *lock)
> +{
> +	if (!_Q_SPIN_TRY_LOCK_STEAL)
> +		return __queued_spin_trylock_nosteal(lock);
> +	else
> +		return __queued_spin_trylock_steal(lock);
> +}
> +
>  void queued_spin_lock_slowpath(struct qspinlock *lock);
>  
>  static __always_inline void queued_spin_lock(struct qspinlock *lock)
> diff --git a/arch/powerpc/lib/qspinlock.c b/arch/powerpc/lib/qspinlock.c
> index 3b10e31bcf0a..277aef1fab0a 100644
> --- a/arch/powerpc/lib/qspinlock.c
> +++ b/arch/powerpc/lib/qspinlock.c
> @@ -24,7 +24,11 @@ struct qnodes {
>  
>  /* Tuning parameters */
>  static int STEAL_SPINS __read_mostly = (1<<5);
> +#if _Q_SPIN_TRY_LOCK_STEAL == 1
> +static const bool MAYBE_STEALERS = true;
> +#else
>  static bool MAYBE_STEALERS __read_mostly = true;
> +#endif
>  static int HEAD_SPINS __read_mostly = (1<<8);
>  
>  static bool pv_yield_owner __read_mostly = true;
> @@ -522,6 +526,10 @@ void pv_spinlocks_init(void)
>  #include <linux/debugfs.h>
>  static int steal_spins_set(void *data, u64 val)
>  {
> +#if _Q_SPIN_TRY_LOCK_STEAL == 1
> +	/* MAYBE_STEAL remains true */
> +	STEAL_SPINS = val;
> +#else
>  	static DEFINE_MUTEX(lock);
>  
>  	mutex_lock(&lock);
> @@ -539,6 +547,7 @@ static int steal_spins_set(void *data, u64 val)
>  		STEAL_SPINS = val;
>  	}
>  	mutex_unlock(&lock);
> +#endif
>  
>  	return 0;
>  }

