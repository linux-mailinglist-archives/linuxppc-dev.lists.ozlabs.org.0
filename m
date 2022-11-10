Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E2994624072
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Nov 2022 11:55:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N7Jdg61ngz3cck
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Nov 2022 21:55:19 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Vhiez2qd;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42e; helo=mail-pf1-x42e.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Vhiez2qd;
	dkim-atps=neutral
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N7Jcj4t7Zz3blY
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Nov 2022 21:54:27 +1100 (AEDT)
Received: by mail-pf1-x42e.google.com with SMTP id b29so1629136pfp.13
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Nov 2022 02:54:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VgCqGHVxS4ltgJiyQ9etHAiultsdxXTfgBrB7obw1iY=;
        b=Vhiez2qdHqBJuzXL7szeEgKuro4DG9Y/d18fwjLrwG5O9C1WRcHW0YXluuxZujxO4K
         1HhfqHdVt7dOg5Nk1Cdm0SUmZVgfsP+FoBHROUyxed1YzKJMtEf/e7N9/U4arKAMpfge
         3eddQcM8OwVWVT3ulkdTeLdJGet3+vMUpTs2/MHVBiCBzK+tmmBqYdWeVsN2uCpQSjqd
         +weFmXlv2VFPIo0NZycx+RwAiSpgd4HUZiqXPHwhm/0Y1yhRDKdIzwuZzJOfEHM4LZm2
         KJ/rld+lzo2CSz91dGZXBh84LWNG8/roOLxAxEo6mKpJ7IG1cvTnU7t7DSK2S+d25CO+
         1/vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VgCqGHVxS4ltgJiyQ9etHAiultsdxXTfgBrB7obw1iY=;
        b=iuX8Fpblv0Ynnb2PQU4z72O8gn7I0b695PPPf5P3yWoXHS7WWMDR4ZLUbQ2MCzSHEO
         MQhoDagyebH/XpFfQofszcBv7ic2ufr+8boqMX5XdkaIeBY57LJxByAy5pZHFoUXDrsF
         wBAL6e58K97ZHQXn77cx9spl2yGjWtSIrjA/Ed6ewOz24E5Y1vBZYOvAiAQxIv6s58gP
         mEjoVGZXpQ9EYNJI4CEerTj1FWDCQs1WV4Moeb9LnRxcr7U99yuZfpQUBr/T0iP+xoCD
         dlJsimBKmbjQ8JbIbzGOSym/Wno+n4L6EeCYDz55MbzH/xH64fvbjVf4B04Gl+RyBgdi
         rzIQ==
X-Gm-Message-State: ACrzQf0r4/s06nWYoMQqX3Di9mgyEoK+fAq0VyFxLGxsF2u7jNgA7GBG
	L6lVjWl2+NVLaAMenMgPmEM=
X-Google-Smtp-Source: AMsMyM6vL5+ChTJhDvfhHrBhfltC53rSplBrTLB59v98fLB+OmoqTbvjJhOyNcXwpJGHxmax4z0cRQ==
X-Received: by 2002:a63:565f:0:b0:439:8688:a98d with SMTP id g31-20020a63565f000000b004398688a98dmr2189929pgm.424.1668077664068;
        Thu, 10 Nov 2022 02:54:24 -0800 (PST)
Received: from localhost (61-68-184-43.tpgi.com.au. [61.68.184.43])
        by smtp.gmail.com with ESMTPSA id c16-20020a056a00009000b0056c3d3f5a8dsm9848120pfj.56.2022.11.10.02.54.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Nov 2022 02:54:23 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 10 Nov 2022 20:54:19 +1000
Message-Id: <CO8K6HSM8F4S.2TPYGPKKG84D5@bobo>
Subject: Re: [PATCH 05/17] powerpc/qspinlock: allow new waiters to steal the
 lock before queueing
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Jordan Niethe" <jniethe5@gmail.com>, <linuxppc-dev@lists.ozlabs.org>
X-Mailer: aerc 0.13.0
References: <20220728063120.2867508-1-npiggin@gmail.com>
 <20220728063120.2867508-7-npiggin@gmail.com>
 <5fdefbeaa6d81aa33c384c73e265049c43b70832.camel@gmail.com>
In-Reply-To: <5fdefbeaa6d81aa33c384c73e265049c43b70832.camel@gmail.com>
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

On Thu Nov 10, 2022 at 10:40 AM AEST, Jordan Niethe wrote:
> On Thu, 2022-07-28 at 16:31 +1000, Nicholas Piggin wrote:
> [resend as utf-8, not utf-7]
> > Allow new waiters a number of spins on the lock word before queueing,
> > which particularly helps paravirt performance when physical CPUs are
> > oversubscribed.
> > ---
> >  arch/powerpc/lib/qspinlock.c | 152 ++++++++++++++++++++++++++++++++---
> >  1 file changed, 141 insertions(+), 11 deletions(-)
> >=20
> > diff --git a/arch/powerpc/lib/qspinlock.c b/arch/powerpc/lib/qspinlock.=
c
> > index 7c71e5e287df..1625cce714b2 100644
> > --- a/arch/powerpc/lib/qspinlock.c
> > +++ b/arch/powerpc/lib/qspinlock.c
> > @@ -19,8 +19,17 @@ struct qnodes {
> >  	struct qnode nodes[MAX_NODES];
> >  };
> > =20
> > +/* Tuning parameters */
> > +static int STEAL_SPINS __read_mostly =3D (1<<5);
> > +static bool MAYBE_STEALERS __read_mostly =3D true;
>
> I can understand why, but macro case variables can be a bit confusing.

Yeah they started out as #defines. I'll change them.

> > +
> >  static DEFINE_PER_CPU_ALIGNED(struct qnodes, qnodes);
> > =20
> > +static __always_inline int get_steal_spins(void)
> > +{
> > +	return STEAL_SPINS;
> > +}
> > +
> >  static inline u32 encode_tail_cpu(void)
> >  {
> >  	return (smp_processor_id() + 1) << _Q_TAIL_CPU_OFFSET;
> > @@ -76,6 +85,39 @@ static __always_inline int trylock_clear_tail_cpu(st=
ruct qspinlock *lock, u32 ol
> >  	return 0;
> >  }
> > =20
> > +static __always_inline u32 __trylock_cmpxchg(struct qspinlock *lock, u=
32 old, u32 new)
> > +{
> > +	u32 prev;
> > +
> > +	BUG_ON(old & _Q_LOCKED_VAL);
> > +
> > +	asm volatile(
> > +"1:	lwarx	%0,0,%1,%4	# queued_spin_trylock_cmpxchg		\n"
>
> s/queued_spin_trylock_cmpxchg/__trylock_cmpxchg/

Yes.

> btw what is the format you using for the '\n's in the inline asm?

Ah, not really sure :P

> > +"	cmpw	0,%0,%2							\n"
> > +"	bne-	2f							\n"
> > +"	stwcx.	%3,0,%1							\n"
> > +"	bne-	1b							\n"
> > +"\t"	PPC_ACQUIRE_BARRIER "						\n"
> > +"2:									\n"
> > +	: "=3D&r" (prev)
> > +	: "r" (&lock->val), "r"(old), "r" (new),
> > +	  "i" (IS_ENABLED(CONFIG_PPC64) ? 1 : 0)
> > +	: "cr0", "memory");
>
> This is very similar to trylock_clear_tail_cpu(). So maybe it is worth ha=
ving
> some form of "test and set" primitive helper.

Yes I was able to consolidate these two, good point.

> > +
> > +	return prev;
> > +}
> > +
> > +/* Take lock, preserving tail, cmpxchg with val (which must not be loc=
ked) */
> > +static __always_inline int trylock_with_tail_cpu(struct qspinlock *loc=
k, u32 val)
> > +{
> > +	u32 newval =3D _Q_LOCKED_VAL | (val & _Q_TAIL_CPU_MASK);
> > +
> > +	if (__trylock_cmpxchg(lock, val, newval) =3D=3D val)
> > +		return 1;
> > +	else
> > +		return 0;
>
> same optional style nit: return __trylock_cmpxchg(lock, val, newval) =3D=
=3D val
>
> > +}
> > +
> >  /*
> >   * Publish our tail, replacing previous tail. Return previous value.
> >   *
> > @@ -115,6 +157,31 @@ static struct qnode *get_tail_qnode(struct qspinlo=
ck *lock, u32 val)
> >  	BUG();
> >  }
> > =20
> > +static inline bool try_to_steal_lock(struct qspinlock *lock)
> > +{
> > +	int iters;
> > +
> > +	/* Attempt to steal the lock */
> > +	for (;;) {
> > +		u32 val =3D READ_ONCE(lock->val);
> > +
> > +		if (unlikely(!(val & _Q_LOCKED_VAL))) {
> > +			if (trylock_with_tail_cpu(lock, val))
> > +				return true;
> > +			continue;
> > +		}
>
> The continue would bypass iters++/cpu_relax but the next time around
>   if (unlikely(!(val & _Q_LOCKED_VAL))) {
> should fail so everything should be fine?

Yes it should. I suppose it could starve in theory though. Maybe
I'll change it to count as an iteration.

> > +#include <linux/debugfs.h>
> > +static int steal_spins_set(void *data, u64 val)
> > +{
> > +	static DEFINE_MUTEX(lock);
>
> I just want to check if it would be possible to get rid of the MAYBE_STEA=
LERS
> variable completely and do something like:
>
>   bool maybe_stealers() { return STEAL_SPINS > 0; }
>
> I guess based on the below code it wouldn't work, but I'm still not quite=
 sure
> why that is.

Because the slowpath has a !maybe_stealers path which assumes the
lock won't be stolen so it doesn't need to cmpxchg the lock bit on,
among other things.

I'll add a bit more comment.

> > +
> > +	mutex_lock(&lock);
> > +	if (val && !STEAL_SPINS) {
> > +		MAYBE_STEALERS =3D true;
> > +		/* wait for waiter to go away */
> > +		synchronize_rcu();
> > +		STEAL_SPINS =3D val;
> > +	} else if (!val && STEAL_SPINS) {
> > +		STEAL_SPINS =3D val;
> > +		/* wait for all possible stealers to go away */
> > +		synchronize_rcu();
> > +		MAYBE_STEALERS =3D false;
> > +	} else {
> > +		STEAL_SPINS =3D val;
> > +	}
> > +	mutex_unlock(&lock);
>
> STEAL_SPINS is an int not a u64.

Yeah but that's how the DEFINE_SIMPLE_ATTRIBUTE things seem to work,
unfortunately.

Thanks,
Nick
