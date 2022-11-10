Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 275B2623847
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Nov 2022 01:43:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N73410MCCz3cNN
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Nov 2022 11:43:45 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=cIugGGgR;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52f; helo=mail-pg1-x52f.google.com; envelope-from=jniethe5@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=cIugGGgR;
	dkim-atps=neutral
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com [IPv6:2607:f8b0:4864:20::52f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N730n5gwHz3f3b
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Nov 2022 11:40:57 +1100 (AEDT)
Received: by mail-pg1-x52f.google.com with SMTP id 6so216919pgm.6
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 09 Nov 2022 16:40:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:user-agent:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QXoYCuq0MwoCVC9rbDchK9tss1IVHX9d4rmGc/QLV0o=;
        b=cIugGGgRZ/OwDafDAUBDa9A2jt8Sd9wdDYlCq7qxxs0hH5WoxWQ5f7iL75NAA+vyTh
         jIOMZfMXs0+QUQinm0uYrbbjeAit3oyXeEUsVM54yiP5uMjAumFix/zl0O3C1YMEJu+q
         cZ1PYriX48W3toQ8JwXG4L/WaYh7fRLjtSjqGY1oiBwUFflm2oseAsuu0w0LxYoP6moP
         +7m4ZxmSTYiDjTRiWYDSG7ZkVJVOIBn5jrqYAd+nRjJ084Hz630/czp33pvjW6BS59hr
         wUDjtslFtBGUd2UOLx9ETCEEJunNgSC7qtJUcA9IxEFEAoQY/f1cq0f+7ipAArXifypu
         fCFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:user-agent:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QXoYCuq0MwoCVC9rbDchK9tss1IVHX9d4rmGc/QLV0o=;
        b=117kzCMqUA7NaK7WL1KbWskZy9+T+DvaSFwQkMfVYA0qWv9f90jvay7klRYMPKdCsJ
         dPl4sp3LHAEqDMwbttWaLDbMU6n/bdnCDfbPPA2yYvYe9UONvd8eGI9O+CYdIuonI0UI
         3vng+wfmBCTXG3x3+Xd/KfzUp2F0dwoBlB4yfKpBraegAhZHcnnljij8F8+ghL+mgkKd
         J3b/NR4GqLhADHJNH6cZEQjWCKb9taabIQiLj8UJYrtuGJx/iaRmrk8+Xa3hOCOBnEE+
         KIilGaB+GlZcKfItxgiS0qbkEwSVQJxnNX42jhlg/wVVTmD61tIEGeqMrmsJsBjR4Oqp
         eMVw==
X-Gm-Message-State: ACrzQf0A9EUSEO92IQhrO4VhxB+mU6S0UW+NhqcWYqe4g4RBbxq81BEm
	sm26+yNygPiVIy9bL4hlZRarY05l0OA=
X-Google-Smtp-Source: AMsMyM5UvyfBaz0vrdMw8TW7FrJ8Rb/MppftnJHMNUsD58BpZ5L+oW4FMHKTIryoSbnZkZoiHmVWWQ==
X-Received: by 2002:a65:464b:0:b0:42c:b0:9643 with SMTP id k11-20020a65464b000000b0042c00b09643mr54634574pgr.232.1668040855314;
        Wed, 09 Nov 2022 16:40:55 -0800 (PST)
Received: from tee480.ozlabs.ibm.com (110-175-254-242.static.tpgi.com.au. [110.175.254.242])
        by smtp.googlemail.com with ESMTPSA id k3-20020a170902c40300b00176a6ba5969sm9740311plk.98.2022.11.09.16.40.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Nov 2022 16:40:54 -0800 (PST)
Message-ID: <81beccebe8089c9a8762875332beb7ddb395de06.camel@gmail.com>
Subject: Re: [PATCH 07/17] powerpc/qspinlock: store owner CPU in lock word
From: Jordan Niethe <jniethe5@gmail.com>
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
Date: Thu, 10 Nov 2022 11:40:51 +1100
In-Reply-To: <20220728063120.2867508-9-npiggin@gmail.com>
References: <20220728063120.2867508-1-npiggin@gmail.com>
	 <20220728063120.2867508-9-npiggin@gmail.com>
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
> Store the owner CPU number in the lock word so it may be yielded to,
> as powerpc's paravirtualised simple spinlocks do.
> ---
>  arch/powerpc/include/asm/qspinlock.h       |  8 +++++++-
>  arch/powerpc/include/asm/qspinlock_types.h | 10 ++++++++++
>  arch/powerpc/lib/qspinlock.c               |  6 +++---
>  3 files changed, 20 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/powerpc/include/asm/qspinlock.h b/arch/powerpc/include/asm/qspinlock.h
> index 3ab354159e5e..44601b261e08 100644
> --- a/arch/powerpc/include/asm/qspinlock.h
> +++ b/arch/powerpc/include/asm/qspinlock.h
> @@ -20,9 +20,15 @@ static __always_inline int queued_spin_is_contended(struct qspinlock *lock)
>  	return !!(READ_ONCE(lock->val) & _Q_TAIL_CPU_MASK);
>  }
>  
> +static __always_inline u32 queued_spin_get_locked_val(void)

Maybe this function should have "encode" in the name to match with
encode_tail_cpu().


> +{
> +	/* XXX: make this use lock value in paca like simple spinlocks? */

Is that the paca's lock_token which is 0x8000?


> +	return _Q_LOCKED_VAL | (smp_processor_id() << _Q_OWNER_CPU_OFFSET);
> +}
> +
>  static __always_inline int queued_spin_trylock(struct qspinlock *lock)
>  {
> -	u32 new = _Q_LOCKED_VAL;
> +	u32 new = queued_spin_get_locked_val();
>  	u32 prev;
>  
>  	asm volatile(
> diff --git a/arch/powerpc/include/asm/qspinlock_types.h b/arch/powerpc/include/asm/qspinlock_types.h
> index 8b20f5e22bba..35f9525381e6 100644
> --- a/arch/powerpc/include/asm/qspinlock_types.h
> +++ b/arch/powerpc/include/asm/qspinlock_types.h
> @@ -29,6 +29,8 @@ typedef struct qspinlock {
>   * Bitfields in the lock word:
>   *
>   *     0: locked bit
> + *  1-14: lock holder cpu
> + *    15: unused bit
>   *    16: must queue bit
>   * 17-31: tail cpu (+1)

So there is one more bit to store the tail cpu vs the lock holder cpu?

>   */
> @@ -39,6 +41,14 @@ typedef struct qspinlock {
>  #define _Q_LOCKED_MASK		_Q_SET_MASK(LOCKED)
>  #define _Q_LOCKED_VAL		(1U << _Q_LOCKED_OFFSET)
>  
> +#define _Q_OWNER_CPU_OFFSET	1
> +#define _Q_OWNER_CPU_BITS	14
> +#define _Q_OWNER_CPU_MASK	_Q_SET_MASK(OWNER_CPU)
> +
> +#if CONFIG_NR_CPUS > (1U << _Q_OWNER_CPU_BITS)
> +#error "qspinlock does not support such large CONFIG_NR_CPUS"
> +#endif
> +
>  #define _Q_MUST_Q_OFFSET	16
>  #define _Q_MUST_Q_BITS		1
>  #define _Q_MUST_Q_MASK		_Q_SET_MASK(MUST_Q)
> diff --git a/arch/powerpc/lib/qspinlock.c b/arch/powerpc/lib/qspinlock.c
> index a906cc8f15fa..aa26cfe21f18 100644
> --- a/arch/powerpc/lib/qspinlock.c
> +++ b/arch/powerpc/lib/qspinlock.c
> @@ -50,7 +50,7 @@ static inline int get_tail_cpu(u32 val)
>  /* Take the lock by setting the lock bit, no other CPUs will touch it. */
>  static __always_inline void lock_set_locked(struct qspinlock *lock)
>  {
> -	u32 new = _Q_LOCKED_VAL;
> +	u32 new = queued_spin_get_locked_val();
>  	u32 prev;
>  
>  	asm volatile(
> @@ -68,7 +68,7 @@ static __always_inline void lock_set_locked(struct qspinlock *lock)
>  /* Take lock, clearing tail, cmpxchg with old (which must not be locked) */
>  static __always_inline int trylock_clear_tail_cpu(struct qspinlock *lock, u32 old)
>  {
> -	u32 new = _Q_LOCKED_VAL;
> +	u32 new = queued_spin_get_locked_val();
>  	u32 prev;
>  
>  	BUG_ON(old & _Q_LOCKED_VAL);
> @@ -116,7 +116,7 @@ static __always_inline u32 __trylock_cmpxchg(struct qspinlock *lock, u32 old, u3
>  /* Take lock, preserving tail, cmpxchg with val (which must not be locked) */
>  static __always_inline int trylock_with_tail_cpu(struct qspinlock *lock, u32 val)
>  {
> -	u32 newval = _Q_LOCKED_VAL | (val & _Q_TAIL_CPU_MASK);
> +	u32 newval = queued_spin_get_locked_val() | (val & _Q_TAIL_CPU_MASK);
>  
>  	if (__trylock_cmpxchg(lock, val, newval) == val)
>  		return 1;

