Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BE642623ED4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Nov 2022 10:41:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N7H054hrZz3dv7
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Nov 2022 20:41:09 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=KEFZQ+G6;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::431; helo=mail-pf1-x431.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=KEFZQ+G6;
	dkim-atps=neutral
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N7Gz84fBbz3cFc
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Nov 2022 20:40:19 +1100 (AEDT)
Received: by mail-pf1-x431.google.com with SMTP id q9so1472514pfg.5
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Nov 2022 01:40:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H3IxMFXUuEWnZ7dlqPEKXD23wj1eSpgnOaVD5fa9BQA=;
        b=KEFZQ+G6FWbyeJoGFemkE0re6PEYNei5PtubhDGvl6NNd6j/ONJaZm/nCXOkqLAiKd
         3xFTT4brfBPKrLWyIMnUXOigVn49Fu9F5dvddFXgObb5VEDwiqT3W7VFdTb4v8Lw5/Nw
         oS3pDr9MC9anYNSusEMgK6EQATisMUCXm8P+c05FT+aivybMMgd3ukP3Vjmg7xRs2QZf
         stzGjVCfUl2dW3qNrOr7a7r20RPTN6b4prn6cnZBnrEcQAv0RnUvKs8p3E7a+0ZhMi/J
         +S8/ocgFIHVEM7uftWgaxAZT8a1NA1DeQ601YddmBy1COTEoOvhhFr6pKoMf8G3hyhTc
         wEVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=H3IxMFXUuEWnZ7dlqPEKXD23wj1eSpgnOaVD5fa9BQA=;
        b=uWwp3s6XgFVrrQbkY/UyHLue5tSqRZHu1LyAoAHx25+A2l+mvCtPMb6vyse6DHQAFU
         njG+AqgO+DLskeExirHonirNMMwlQDAPlTTvkdBL/AQecQAf2cXZgHy1k7/9KMzO0nUg
         aYfHGjtnW4xjF5Pk0rEQyszp6vUy+2Yqh2k1BEgqbdWcvyBy9M6R6sAmdKcUsL80LcWR
         nvknK+gqE70HszLfpt81gAFTdeRc9yPmv0rLhJep1tuB6YfVP1bOcGNhJ6iF54wphBCp
         DFp0BY9t2lYSC88uY+eyAx7994FYj5EiPcuP6nLZGKBParD0E92c/yeMUYVK+JGmj0e2
         35QQ==
X-Gm-Message-State: ACrzQf0sWCxWaRq/1LFuUMx0x9EQRqbPrU+NcItVWee1TmbmACtJFqw3
	0LvgJSAmX2iahCaO8G6+6iwM3OXUzHehSQ==
X-Google-Smtp-Source: AMsMyM76yetVDEmMViSv6S/kyu1sib7isLPk9H9YsXM/mN2cBFHbJd+e2Mk/AioyEBPxA7hcWtNRnQ==
X-Received: by 2002:a63:1255:0:b0:44b:89b6:3026 with SMTP id 21-20020a631255000000b0044b89b63026mr2148356pgs.115.1668073216555;
        Thu, 10 Nov 2022 01:40:16 -0800 (PST)
Received: from localhost (61-68-184-43.tpgi.com.au. [61.68.184.43])
        by smtp.gmail.com with ESMTPSA id c17-20020a170902d49100b001754cfb5e21sm10815417plg.96.2022.11.10.01.40.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Nov 2022 01:40:15 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 10 Nov 2022 19:40:11 +1000
Message-Id: <CO8ILQMO00P0.3ATB8LNW57SOQ@bobo>
Subject: Re: [PATCH 04/17] powerpc/qspinlock: convert atomic operations to
 assembly
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Jordan Niethe" <jniethe5@gmail.com>, <linuxppc-dev@lists.ozlabs.org>
X-Mailer: aerc 0.13.0
References: <20220728063120.2867508-1-npiggin@gmail.com>
 <20220728063120.2867508-6-npiggin@gmail.com>
 <9ccfa76e921ea0b79a7ff166604004370e7aa30b.camel@gmail.com>
In-Reply-To: <9ccfa76e921ea0b79a7ff166604004370e7aa30b.camel@gmail.com>
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

On Thu Nov 10, 2022 at 10:39 AM AEST, Jordan Niethe wrote:
> On Thu, 2022-07-28 at 16:31 +1000, Nicholas Piggin wrote:
> [resend as utf-8, not utf-7]
> > This uses more optimal ll/sc style access patterns (rather than
> > cmpxchg), and also sets the EH=3D1 lock hint on those operations
> > which acquire ownership of the lock.
> > ---
> >  arch/powerpc/include/asm/qspinlock.h       | 25 +++++--
> >  arch/powerpc/include/asm/qspinlock_types.h |  6 +-
> >  arch/powerpc/lib/qspinlock.c               | 81 +++++++++++++++-------
> >  3 files changed, 79 insertions(+), 33 deletions(-)
> >=20
> > diff --git a/arch/powerpc/include/asm/qspinlock.h b/arch/powerpc/includ=
e/asm/qspinlock.h
> > index 79a1936fb68d..3ab354159e5e 100644
> > --- a/arch/powerpc/include/asm/qspinlock.h
> > +++ b/arch/powerpc/include/asm/qspinlock.h
> > @@ -2,28 +2,43 @@
> >  #ifndef _ASM_POWERPC_QSPINLOCK_H
> >  #define _ASM_POWERPC_QSPINLOCK_H
> > =20
> > -#include <linux/atomic.h>
> >  #include <linux/compiler.h>
> >  #include <asm/qspinlock_types.h>
> > =20
> >  static __always_inline int queued_spin_is_locked(struct qspinlock *loc=
k)
> >  {
> > -	return atomic_read(&lock->val);
> > +	return READ_ONCE(lock->val);
> >  }
> > =20
> >  static __always_inline int queued_spin_value_unlocked(struct qspinlock=
 lock)
> >  {
> > -	return !atomic_read(&lock.val);
> > +	return !lock.val;
> >  }
> > =20
> >  static __always_inline int queued_spin_is_contended(struct qspinlock *=
lock)
> >  {
> > -	return !!(atomic_read(&lock->val) & _Q_TAIL_CPU_MASK);
> > +	return !!(READ_ONCE(lock->val) & _Q_TAIL_CPU_MASK);
> >  }
> > =20
> >  static __always_inline int queued_spin_trylock(struct qspinlock *lock)
> >  {
> > -	if (atomic_cmpxchg_acquire(&lock->val, 0, _Q_LOCKED_VAL) =3D=3D 0)
> > +	u32 new =3D _Q_LOCKED_VAL;
> > +	u32 prev;
> > +
> > +	asm volatile(
> > +"1:	lwarx	%0,0,%1,%3	# queued_spin_trylock			\n"
> > +"	cmpwi	0,%0,0							\n"
> > +"	bne-	2f							\n"
> > +"	stwcx.	%2,0,%1							\n"
> > +"	bne-	1b							\n"
> > +"\t"	PPC_ACQUIRE_BARRIER "						\n"
> > +"2:									\n"
> > +	: "=3D&r" (prev)
> > +	: "r" (&lock->val), "r" (new),
> > +	  "i" (IS_ENABLED(CONFIG_PPC64) ? 1 : 0)
>
> btw IS_ENABLED() already returns 1 or 0

I guess we already do that in atomic.h too. Okay.

> > +	: "cr0", "memory");
>
> This is the ISA's "test and set" atomic primitive. Do you think it would =
be worth seperating it as a helper?

It ends up getting more complex as we go. I might leave some of these
primitives open coded for now, we could possibly look at providing them
or reusing more generic primitives after the series though.

> > +
> > +	if (likely(prev =3D=3D 0))
> >  		return 1;
> >  	return 0;
>
> same optional style nit: return likely(prev =3D=3D 0);

Will do.

>
> >  }
> > diff --git a/arch/powerpc/include/asm/qspinlock_types.h b/arch/powerpc/=
include/asm/qspinlock_types.h
> > index 3425dab42576..210adf05b235 100644
> > --- a/arch/powerpc/include/asm/qspinlock_types.h
> > +++ b/arch/powerpc/include/asm/qspinlock_types.h
> > @@ -7,7 +7,7 @@
> > =20
> >  typedef struct qspinlock {
> >  	union {
> > -		atomic_t val;
> > +		u32 val;
> > =20
> >  #ifdef __LITTLE_ENDIAN
> >  		struct {
> > @@ -23,10 +23,10 @@ typedef struct qspinlock {
> >  	};
> >  } arch_spinlock_t;
> > =20
> > -#define	__ARCH_SPIN_LOCK_UNLOCKED	{ { .val =3D ATOMIC_INIT(0) } }
> > +#define	__ARCH_SPIN_LOCK_UNLOCKED	{ { .val =3D 0 } }
> > =20
> >  /*
> > - * Bitfields in the atomic value:
> > + * Bitfields in the lock word:
> >   *
> >   *     0: locked bit
> >   * 16-31: tail cpu (+1)
> > diff --git a/arch/powerpc/lib/qspinlock.c b/arch/powerpc/lib/qspinlock.=
c
> > index 5ebb88d95636..7c71e5e287df 100644
> > --- a/arch/powerpc/lib/qspinlock.c
> > +++ b/arch/powerpc/lib/qspinlock.c
> > @@ -1,5 +1,4 @@
> >  // SPDX-License-Identifier: GPL-2.0-or-later
> > -#include <linux/atomic.h>
> >  #include <linux/bug.h>
> >  #include <linux/compiler.h>
> >  #include <linux/export.h>
> > @@ -22,32 +21,59 @@ struct qnodes {
> > =20
> >  static DEFINE_PER_CPU_ALIGNED(struct qnodes, qnodes);
> > =20
> > -static inline int encode_tail_cpu(void)
> > +static inline u32 encode_tail_cpu(void)
> >  {
> >  	return (smp_processor_id() + 1) << _Q_TAIL_CPU_OFFSET;
> >  }
> > =20
> > -static inline int get_tail_cpu(int val)
> > +static inline int get_tail_cpu(u32 val)
> >  {
> >  	return (val >> _Q_TAIL_CPU_OFFSET) - 1;
> >  }
> > =20
> >  /* Take the lock by setting the bit, no other CPUs may concurrently lo=
ck it. */
>
> I think you missed deleting the above line.
>
> > +/* Take the lock by setting the lock bit, no other CPUs will touch it.=
 */
> >  static __always_inline void lock_set_locked(struct qspinlock *lock)
> >  {
> > -	atomic_or(_Q_LOCKED_VAL, &lock->val);
> > -	__atomic_acquire_fence();
> > +	u32 new =3D _Q_LOCKED_VAL;
> > +	u32 prev;
> > +
> > +	asm volatile(
> > +"1:	lwarx	%0,0,%1,%3	# lock_set_locked			\n"
> > +"	or	%0,%0,%2						\n"
> > +"	stwcx.	%0,0,%1							\n"
> > +"	bne-	1b							\n"
> > +"\t"	PPC_ACQUIRE_BARRIER "						\n"
> > +	: "=3D&r" (prev)
> > +	: "r" (&lock->val), "r" (new),
> > +	  "i" (IS_ENABLED(CONFIG_PPC64) ? 1 : 0)
> > +	: "cr0", "memory");
> >  }
>
> This is pretty similar with the DEFINE_TESTOP() pattern from
> arch/powerpc/include/asm/bitops.h (such as test_and_set_bits_lock()) exce=
pt for
> word instead of double word. Do you think it's possible / beneficial to m=
ake
> use of those macros?

If we could pull almost all our atomic primitives into one place and
make them usable by atomics, bitops, locks, etc. might be a good idea.

That function specifically works on a dword so we can't use it here,
and I don't want to modify any files except for the new ones in this
series if possible, but consolidating our primitives a bit more would
be nice.

> > -/* Take lock, clearing tail, cmpxchg with val (which must not be locke=
d) */
> > -static __always_inline int trylock_clear_tail_cpu(struct qspinlock *lo=
ck, int val)
> > +/* Take lock, clearing tail, cmpxchg with old (which must not be locke=
d) */
> > +static __always_inline int trylock_clear_tail_cpu(struct qspinlock *lo=
ck, u32 old)
> >  {
> > -	int newval =3D _Q_LOCKED_VAL;
> > -
> > -	if (atomic_cmpxchg_acquire(&lock->val, val, newval) =3D=3D val)
> > +	u32 new =3D _Q_LOCKED_VAL;
> > +	u32 prev;
> > +
> > +	BUG_ON(old & _Q_LOCKED_VAL);
>
> The BUG_ON() could have been introduced in an earlier patch I think.

Yes.

> > +
> > +	asm volatile(
> > +"1:	lwarx	%0,0,%1,%4	# trylock_clear_tail_cpu		\n"
> > +"	cmpw	0,%0,%2							\n"
> > +"	bne-	2f							\n"
> > +"	stwcx.	%3,0,%1							\n"
> > +"	bne-	1b							\n"
> > +"\t"	PPC_ACQUIRE_BARRIER "						\n"
> > +"2:									\n"
> > +	: "=3D&r" (prev)
> > +	: "r" (&lock->val), "r"(old), "r" (new),
>
> Could this be like  "r"(_Q_TAIL_CPU_MASK) below?
> i.e. "r" (_Q_LOCKED_VAL)? Makes it clear new doesn't change.

Sure.

>
> > +	  "i" (IS_ENABLED(CONFIG_PPC64) ? 1 : 0)
> > +	: "cr0", "memory");
> > +
> > +	if (likely(prev =3D=3D old))
> >  		return 1;
> > -	else
> > -		return 0;
> > +	return 0;
> >  }
> > =20
> >  /*
> > @@ -56,20 +82,25 @@ static __always_inline int trylock_clear_tail_cpu(s=
truct qspinlock *lock, int va
> >   * This provides a release barrier for publishing node, and an acquire=
 barrier
>
> Does the comment mean there needs to be an acquire barrier in this assemb=
ly?

Yes, another good catch. What I'm going to do instead is add the acquire
to get_tail_qnode() because that path is only hit when you have multiple
waiters, and I think pairing it that way makes the barriers more
obvious.

Thanks,
Nick
