Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A6A0D6241AA
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Nov 2022 12:42:28 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N7Kh23zzRz3cKL
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Nov 2022 22:42:26 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=EYK0oaZZ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::535; helo=mail-pg1-x535.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=EYK0oaZZ;
	dkim-atps=neutral
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com [IPv6:2607:f8b0:4864:20::535])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N7Kg443LXz2xkD
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Nov 2022 22:41:36 +1100 (AEDT)
Received: by mail-pg1-x535.google.com with SMTP id e129so1546933pgc.9
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Nov 2022 03:41:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XNafZgKoQpRzM+S46Qlobh8PEiVGqw/bPjw03XUd7Ps=;
        b=EYK0oaZZp3xYGMnJH6U62kEt0PuLFLo9TpfIcmpBzPRTOBC9rg4pEhzCj6AJ1Tu35P
         J0WcaqlVrM89lXOm3y3JrIMtCuQXRAsO4kfRCJkh9UHaL6ZBcY0Dwea41WLQtlhxF/Cg
         5QQtYzJVMPsYuJao+8cH0VLOZHzqUaXE5geAjuJmvWrTtnvT7J2cOzOn/LyKoq7CkpRe
         eyjLKXFGuJ0pLMt7D7xYJvD/XqMutEpYlO9nOMUnJHh8zJaTPGBSGHwJk/9B1cRcMWFb
         9T/YX7jYwJsAFrTFabxPo0DWCDRHD2HEpOKe1AhpEoddtPMNg808F3nSry7Xm93j2wPW
         p94Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XNafZgKoQpRzM+S46Qlobh8PEiVGqw/bPjw03XUd7Ps=;
        b=jfi8SFWIQ8g4eOdgyFOli80fLGkzMJSibbeXDCFauo6Sdj2Fl7JLQ5LzaUYu21XX3U
         rEcnQszW1ysWXcN5erhfA5XbvjRrMytzALqETRUD49lLKOMTYKx+6lgFqvKCBuG/1yye
         Jx1VB3SMnTn/coVjCLvG1dSarReyhLhIVS87f3n0sMQBX/HWIbEmXKx6q9r0XUQ1ekDN
         zi1ZRRYsKd6VvR2YPv7WYbDn5NKAtaEdXlflXJzYaT/gqATWoFLpsrcq7UKKtx67R9Zs
         BTSAdQ56cI8/Y1nceo+9zyTvnxgY0vh32r7WTXJ2kACXrPw42BEfgiw8jFcTRZZ871cl
         sU2g==
X-Gm-Message-State: ACrzQf2P6VDiUz7+d/HJI5o71R1yUNSbMmbjPb99vDVwpA9rdeWPT0f6
	KZvCS3eZcubmymefR/jSN/ly+RbVug8=
X-Google-Smtp-Source: AMsMyM4KfdsQ6qGyinueKzGgmjJr0kfHYUyHK70Su3hjLxYSdI8geNbc9No0iwuQGh1zilD63qSjOA==
X-Received: by 2002:a65:6e0e:0:b0:434:59e0:27d3 with SMTP id bd14-20020a656e0e000000b0043459e027d3mr53131905pgb.185.1668080494412;
        Thu, 10 Nov 2022 03:41:34 -0800 (PST)
Received: from localhost (61-68-184-43.tpgi.com.au. [61.68.184.43])
        by smtp.gmail.com with ESMTPSA id a14-20020a17090ad80e00b00213d08fa459sm2928608pjv.17.2022.11.10.03.41.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Nov 2022 03:41:33 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 10 Nov 2022 21:41:29 +1000
Message-Id: <CO8L6M3ERSIO.1D8E65M4BMIUK@bobo>
Subject: Re: [PATCH 17/17] powerpc/qspinlock: provide accounting and options
 for sleepy locks
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Jordan Niethe" <jniethe5@gmail.com>, <linuxppc-dev@lists.ozlabs.org>
X-Mailer: aerc 0.13.0
References: <20220728063120.2867508-1-npiggin@gmail.com>
 <20220728063120.2867508-19-npiggin@gmail.com>
 <3ee8195c7491c8e4598977713d10873fc95346e1.camel@gmail.com>
In-Reply-To: <3ee8195c7491c8e4598977713d10873fc95346e1.camel@gmail.com>
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

On Thu Nov 10, 2022 at 10:44 AM AEST, Jordan Niethe wrote:
> On Thu, 2022-07-28 at 16:31 +1000, Nicholas Piggin wrote:
> [resend as utf-8, not utf-7]
> > Finding the owner or a queued waiter on a lock with a preempted vcpu
> > is indicative of an oversubscribed guest causing the lock to get into
> > trouble. Provide some options to detect this situation and have new
> > CPUs avoid queueing for a longer time (more steal iterations) to
> > minimise the problems caused by vcpu preemption on the queue.
> > ---
> >  arch/powerpc/include/asm/qspinlock_types.h |   7 +-
> >  arch/powerpc/lib/qspinlock.c               | 240 +++++++++++++++++++--
> >  2 files changed, 232 insertions(+), 15 deletions(-)
> >=20
> > diff --git a/arch/powerpc/include/asm/qspinlock_types.h b/arch/powerpc/=
include/asm/qspinlock_types.h
> > index 35f9525381e6..4fbcc8a4230b 100644
> > --- a/arch/powerpc/include/asm/qspinlock_types.h
> > +++ b/arch/powerpc/include/asm/qspinlock_types.h
> > @@ -30,7 +30,7 @@ typedef struct qspinlock {
> >   *
> >   *     0: locked bit
> >   *  1-14: lock holder cpu
> > - *    15: unused bit
> > + *    15: lock owner or queuer vcpus observed to be preempted bit
> >   *    16: must queue bit
> >   * 17-31: tail cpu (+1)
> >   */
> > @@ -49,6 +49,11 @@ typedef struct qspinlock {
> >  #error "qspinlock does not support such large CONFIG_NR_CPUS"
> >  #endif
> > =20
> > +#define _Q_SLEEPY_OFFSET	15
> > +#define _Q_SLEEPY_BITS		1
> > +#define _Q_SLEEPY_MASK		_Q_SET_MASK(SLEEPY_OWNER)
> > +#define _Q_SLEEPY_VAL		(1U << _Q_SLEEPY_OFFSET)
> > +
> >  #define _Q_MUST_Q_OFFSET	16
> >  #define _Q_MUST_Q_BITS		1
> >  #define _Q_MUST_Q_MASK		_Q_SET_MASK(MUST_Q)
> > diff --git a/arch/powerpc/lib/qspinlock.c b/arch/powerpc/lib/qspinlock.=
c
> > index 5cfd69931e31..c18133c01450 100644
> > --- a/arch/powerpc/lib/qspinlock.c
> > +++ b/arch/powerpc/lib/qspinlock.c
> > @@ -5,6 +5,7 @@
> >  #include <linux/percpu.h>
> >  #include <linux/smp.h>
> >  #include <linux/topology.h>
> > +#include <linux/sched/clock.h>
> >  #include <asm/qspinlock.h>
> >  #include <asm/paravirt.h>
> > =20
> > @@ -36,24 +37,54 @@ static int HEAD_SPINS __read_mostly =3D (1<<8);
> >  static bool pv_yield_owner __read_mostly =3D true;
> >  static bool pv_yield_allow_steal __read_mostly =3D false;
> >  static bool pv_spin_on_preempted_owner __read_mostly =3D false;
> > +static bool pv_sleepy_lock __read_mostly =3D true;
> > +static bool pv_sleepy_lock_sticky __read_mostly =3D false;
>
> The sticky part could potentially be its own patch.

I'll see how that looks.

> > +static u64 pv_sleepy_lock_interval_ns __read_mostly =3D 0;
> > +static int pv_sleepy_lock_factor __read_mostly =3D 256;
> >  static bool pv_yield_prev __read_mostly =3D true;
> >  static bool pv_yield_propagate_owner __read_mostly =3D true;
> >  static bool pv_prod_head __read_mostly =3D false;
> > =20
> >  static DEFINE_PER_CPU_ALIGNED(struct qnodes, qnodes);
> > +static DEFINE_PER_CPU_ALIGNED(u64, sleepy_lock_seen_clock);
> > =20
> > -static __always_inline int get_steal_spins(bool paravirt, bool remote)
> > +static __always_inline bool recently_sleepy(void)
> > +{
>
> Other users of pv_sleepy_lock_interval_ns first check pv_sleepy_lock.

In this case it should be implied, I've added a comment.

>
> > +	if (pv_sleepy_lock_interval_ns) {
> > +		u64 seen =3D this_cpu_read(sleepy_lock_seen_clock);
> > +
> > +		if (seen) {
> > +			u64 delta =3D sched_clock() - seen;
> > +			if (delta < pv_sleepy_lock_interval_ns)
> > +				return true;
> > +			this_cpu_write(sleepy_lock_seen_clock, 0);
> > +		}
> > +	}
> > +
> > +	return false;
> > +}
> > +
> > +static __always_inline int get_steal_spins(bool paravirt, bool remote,=
 bool sleepy)
>
> It seems like paravirt is implied by sleepy.
>
> >  {
> >  	if (remote) {
> > -		return REMOTE_STEAL_SPINS;
> > +		if (paravirt && sleepy)
> > +			return REMOTE_STEAL_SPINS * pv_sleepy_lock_factor;
> > +		else
> > +			return REMOTE_STEAL_SPINS;
> >  	} else {
> > -		return STEAL_SPINS;
> > +		if (paravirt && sleepy)
> > +			return STEAL_SPINS * pv_sleepy_lock_factor;
> > +		else
> > +			return STEAL_SPINS;
> >  	}
> >  }
>
> I think that separate functions would still be nicer but this could get r=
id of
> the nesting conditionals like
>
>
> 	int spins;
> 	if (remote)
> 		spins =3D REMOTE_STEAL_SPINS;
> 	else
> 		spins =3D STEAL_SPINS;
>
> 	if (sleepy)
> 		return spins * pv_sleepy_lock_factor;
> 	return spins;

Yeah it was getting a bit out of hand.

>
> > =20
> > -static __always_inline int get_head_spins(bool paravirt)
> > +static __always_inline int get_head_spins(bool paravirt, bool sleepy)
> >  {
> > -	return HEAD_SPINS;
> > +	if (paravirt && sleepy)
> > +		return HEAD_SPINS * pv_sleepy_lock_factor;
> > +	else
> > +		return HEAD_SPINS;
> >  }
> > =20
> >  static inline u32 encode_tail_cpu(void)
> > @@ -206,6 +237,60 @@ static __always_inline u32 lock_clear_mustq(struct=
 qspinlock *lock)
> >  	return prev;
> >  }
> > =20
> > +static __always_inline bool lock_try_set_sleepy(struct qspinlock *lock=
, u32 old)
> > +{
> > +	u32 prev;
> > +	u32 new =3D old | _Q_SLEEPY_VAL;
> > +
> > +	BUG_ON(!(old & _Q_LOCKED_VAL));
> > +	BUG_ON(old & _Q_SLEEPY_VAL);
> > +
> > +	asm volatile(
> > +"1:	lwarx	%0,0,%1		# lock_try_set_sleepy			\n"
> > +"	cmpw	0,%0,%2							\n"
> > +"	bne-	2f							\n"
> > +"	stwcx.	%3,0,%1							\n"
> > +"	bne-	1b							\n"
> > +"2:									\n"
> > +	: "=3D&r" (prev)
> > +	: "r" (&lock->val), "r"(old), "r" (new)
> > +	: "cr0", "memory");
> > +
> > +	if (prev =3D=3D old)
> > +		return true;
> > +	return false;
> > +}
> > +
> > +static __always_inline void seen_sleepy_owner(struct qspinlock *lock, =
u32 val)
> > +{
> > +	if (pv_sleepy_lock) {
> > +		if (pv_sleepy_lock_interval_ns)
> > +			this_cpu_write(sleepy_lock_seen_clock, sched_clock());
> > +		if (!(val & _Q_SLEEPY_VAL))
> > +			lock_try_set_sleepy(lock, val);
> > +	}
> > +}
> > +
> > +static __always_inline void seen_sleepy_lock(void)
> > +{
> > +	if (pv_sleepy_lock && pv_sleepy_lock_interval_ns)
> > +		this_cpu_write(sleepy_lock_seen_clock, sched_clock());
> > +}
> > +
> > +static __always_inline void seen_sleepy_node(struct qspinlock *lock)
> > +{
>
> If yield_to_prev() was made to take a raw val, that val could be passed t=
o
> seen_sleepy_node() and it would not need to get it by itself.

Yep.

>
> > +	if (pv_sleepy_lock) {
> > +		u32 val =3D READ_ONCE(lock->val);
> > +
> > +		if (pv_sleepy_lock_interval_ns)
> > +			this_cpu_write(sleepy_lock_seen_clock, sched_clock());
> > +		if (val & _Q_LOCKED_VAL) {
> > +			if (!(val & _Q_SLEEPY_VAL))
> > +				lock_try_set_sleepy(lock, val);
> > +		}
> > +	}
> > +}
> > +
> >  static struct qnode *get_tail_qnode(struct qspinlock *lock, u32 val)
> >  {
> >  	int cpu =3D get_tail_cpu(val);
> > @@ -244,6 +329,7 @@ static __always_inline void __yield_to_locked_owner=
(struct qspinlock *lock, u32
> > =20
> >  	spin_end();
> > =20
> > +	seen_sleepy_owner(lock, val);
> >  	*preempted =3D true;
> > =20
> >  	/*
> > @@ -307,11 +393,13 @@ static __always_inline void propagate_yield_cpu(s=
truct qnode *node, u32 val, int
> >  	}
> >  }
> > =20
> > -static __always_inline void yield_to_prev(struct qspinlock *lock, stru=
ct qnode *node, int prev_cpu, bool paravirt)
> > +static __always_inline void yield_to_prev(struct qspinlock *lock, stru=
ct qnode *node, int prev_cpu, bool paravirt, bool *preempted)
> >  {
> >  	u32 yield_count;
> >  	int yield_cpu;
> > =20
> > +	*preempted =3D false;
> > +
> >  	if (!paravirt)
> >  		goto relax;
> > =20
> > @@ -332,6 +420,9 @@ static __always_inline void yield_to_prev(struct qs=
pinlock *lock, struct qnode *
> > =20
> >  	spin_end();
> > =20
> > +	*preempted =3D true;
> > +	seen_sleepy_node(lock);
> > +
> >  	smp_rmb();
> > =20
> >  	if (yield_cpu =3D=3D node->yield_cpu) {
> > @@ -353,6 +444,9 @@ static __always_inline void yield_to_prev(struct qs=
pinlock *lock, struct qnode *
> > =20
> >  	spin_end();
> > =20
> > +	*preempted =3D true;
> > +	seen_sleepy_node(lock);
> > +
> >  	smp_rmb(); /* See yield_to_locked_owner comment */
> > =20
> >  	if (!node->locked) {
> > @@ -369,6 +463,9 @@ static __always_inline void yield_to_prev(struct qs=
pinlock *lock, struct qnode *
> > =20
> >  static __always_inline bool try_to_steal_lock(struct qspinlock *lock, =
bool paravirt)
> >  {
> > +	bool preempted;
> > +	bool seen_preempted =3D false;
> > +	bool sleepy =3D false;
> >  	int iters =3D 0;
> > =20
> >  	if (!STEAL_SPINS) {
> > @@ -376,7 +473,6 @@ static __always_inline bool try_to_steal_lock(struc=
t qspinlock *lock, bool parav
> >  			spin_begin();
> >  			for (;;) {
> >  				u32 val =3D READ_ONCE(lock->val);
> > -				bool preempted;
> > =20
> >  				if (val & _Q_MUST_Q_VAL)
> >  					break;
> > @@ -395,7 +491,6 @@ static __always_inline bool try_to_steal_lock(struc=
t qspinlock *lock, bool parav
> >  	spin_begin();
> >  	for (;;) {
> >  		u32 val =3D READ_ONCE(lock->val);
> > -		bool preempted;
> > =20
> >  		if (val & _Q_MUST_Q_VAL)
> >  			break;
> > @@ -408,9 +503,29 @@ static __always_inline bool try_to_steal_lock(stru=
ct qspinlock *lock, bool parav
> >  			continue;
> >  		}
> > =20
> > +		if (paravirt && pv_sleepy_lock && !sleepy) {
> > +			if (!sleepy) {
>
> The enclosing conditional means this would always be true. I think the ou=
t conditional should be
> if (paravirt && pv_sleepy_lock)
> otherwise the pv_sleepy_lock_sticky part wouldn't work properly.

Good catch, I think you're right.
>
>
> > +				if (val & _Q_SLEEPY_VAL) {
> > +					seen_sleepy_lock();
> > +					sleepy =3D true;
> > +				} else if (recently_sleepy()) {
> > +					sleepy =3D true;
> > +				}
> > +
> > +			if (pv_sleepy_lock_sticky && seen_preempted &&
> > +					!(val & _Q_SLEEPY_VAL)) {
> > +				if (lock_try_set_sleepy(lock, val))
> > +					val |=3D _Q_SLEEPY_VAL;
> > +			}
> > +
> > +
> >  		yield_to_locked_owner(lock, val, paravirt, &preempted);
> > +		if (preempted)
> > +			seen_preempted =3D true;
>
> This could belong to the next if statement, there can not be !paravirt &&=
 preempted ?

Yep.

Thanks,
Nick
