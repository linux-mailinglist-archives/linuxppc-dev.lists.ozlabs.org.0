Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A1F1624122
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Nov 2022 12:14:30 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N7K3m3B18z3dvh
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Nov 2022 22:14:28 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=dz4sSnm5;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1029; helo=mail-pj1-x1029.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=dz4sSnm5;
	dkim-atps=neutral
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N7K2p6rsdz3cGH
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Nov 2022 22:13:38 +1100 (AEDT)
Received: by mail-pj1-x1029.google.com with SMTP id f5-20020a17090a4a8500b002131bb59d61so5287536pjh.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Nov 2022 03:13:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:references:from:subject:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rgZRF4+SNxbzxpQnjIIE8yOOGzrGhjuog6WOzLVwTPo=;
        b=dz4sSnm5raM/RlMSfslsiUwZFAVoUXHhLaKn+oo0cyuS9E/1DROy3Tac/FZc8cPfMf
         M/riuAqEL66hjouD3xQD6py8J+rS1rcNRIfdlVGwgDew7TGl+1WjvkQHyj6SkfvI/xnA
         fFwpMzfAwiVZ8Ifdc+/CgfhK/C7bFXuA23DGlBCej3D4ZAp3nkoSpzc+zBh2iUbvz7je
         B93IgEda18xjCF8/GifNF1nmf607hw7lSwloeYu5tWTzk4hGvFBaTkr+5ec9NOTock8J
         TWf1jNNTpliN+A9bwqg2traqRGa12Q9aei42R2XD551k8g6d34TceHqlQC8lS6n0vpaI
         nZbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:references:from:subject:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rgZRF4+SNxbzxpQnjIIE8yOOGzrGhjuog6WOzLVwTPo=;
        b=yVOQhD2+uZMWeOlxOu35CgLwkS7OWqtC3MzVXpHLC9j+yyzQnQNAJFECdqmMNbnA0p
         QG6wOUfNKkjWK6IijlK2NHIjUySYjRBrSIaZjhpSA9Gxa3+7a0D1VlLsvYWs/HK+UICh
         9B1DoyNxN6qkGAEsB0+CKB7jWJ/W+tcicMdDOe0eCT67QsKDdKWoU+hksA+aerWGrTbM
         UdGhImi59Q2cAhMbDW6GFc95ukEQgHrvj2ukjyNPfEBlFAHkzMGLGOCU2H5pzS3oIhFQ
         xXwqSGGhl6AHkZESLo47ZzKvDnQogFlHwGEDwARMbvXYg2+L56N08givv0odQFXuJaB2
         VEHw==
X-Gm-Message-State: ACrzQf2I/zx8Ews86H2nckUyQsVDer+zP4dFbm+xQf8yroJ+CCnuWvzZ
	42C6qFl9GiJF40QZFOxQjYt3Xqs2Qlo=
X-Google-Smtp-Source: AMsMyM51g8Cw7K/sfwgqCQO2at4UU1a2HsiRwCt0GipTidufisncPUqY/Bnmgusx26Oh+NHASPl9kQ==
X-Received: by 2002:a17:902:d38d:b0:186:9fc5:6c13 with SMTP id e13-20020a170902d38d00b001869fc56c13mr64534579pld.73.1668078814102;
        Thu, 10 Nov 2022 03:13:34 -0800 (PST)
Received: from localhost (61-68-184-43.tpgi.com.au. [61.68.184.43])
        by smtp.gmail.com with ESMTPSA id a24-20020a170902b59800b001788ccecbf5sm10873427pls.31.2022.11.10.03.13.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Nov 2022 03:13:33 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 10 Nov 2022 21:13:29 +1000
Message-Id: <CO8KL670V3W1.3O2JVCB7CV0GH@bobo>
To: "Jordan Niethe" <jniethe5@gmail.com>, <linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH 08/17] powerpc/qspinlock: paravirt yield to lock owner
From: "Nicholas Piggin" <npiggin@gmail.com>
X-Mailer: aerc 0.13.0
References: <20220728063120.2867508-1-npiggin@gmail.com>
 <20220728063120.2867508-10-npiggin@gmail.com>
 <7f160be06ae6530abab716232f47e7769715062b.camel@gmail.com>
In-Reply-To: <7f160be06ae6530abab716232f47e7769715062b.camel@gmail.com>
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

On Thu Nov 10, 2022 at 10:41 AM AEST, Jordan Niethe wrote:
>  On Thu, 2022-07-28 at 16:31 +1000, Nicholas Piggin wrote:
>  [resend as utf-8, not utf-7]
> > Waiters spinning on the lock word should yield to the lock owner if the
> > vCPU is preempted. This improves performance when the hypervisor has
> > oversubscribed physical CPUs.
> > ---
> >  arch/powerpc/lib/qspinlock.c | 97 ++++++++++++++++++++++++++++++------
> >  1 file changed, 83 insertions(+), 14 deletions(-)
> >=20
> > diff --git a/arch/powerpc/lib/qspinlock.c b/arch/powerpc/lib/qspinlock.=
c
> > index aa26cfe21f18..55286ac91da5 100644
> > --- a/arch/powerpc/lib/qspinlock.c
> > +++ b/arch/powerpc/lib/qspinlock.c
> > @@ -5,6 +5,7 @@
> >  #include <linux/percpu.h>
> >  #include <linux/smp.h>
> >  #include <asm/qspinlock.h>
> > +#include <asm/paravirt.h>
> > =20
> >  #define MAX_NODES	4
> > =20
> > @@ -24,14 +25,16 @@ static int STEAL_SPINS __read_mostly =3D (1<<5);
> >  static bool MAYBE_STEALERS __read_mostly =3D true;
> >  static int HEAD_SPINS __read_mostly =3D (1<<8);
> > =20
> > +static bool pv_yield_owner __read_mostly =3D true;
>
> Not macro case for these globals? To me name does not make it super clear=
 this
> is a boolean. What about pv_yield_owner_enabled?

Hmm. Might think about doing a better prefix namespace for these
tunables, which might help.

> > +
> >  static DEFINE_PER_CPU_ALIGNED(struct qnodes, qnodes);
> > =20
> > -static __always_inline int get_steal_spins(void)
> > +static __always_inline int get_steal_spins(bool paravirt)
> >  {
> >  	return STEAL_SPINS;
> >  }
> > =20
> > -static __always_inline int get_head_spins(void)
> > +static __always_inline int get_head_spins(bool paravirt)
> >  {
> >  	return HEAD_SPINS;
> >  }
> > @@ -46,7 +49,11 @@ static inline int get_tail_cpu(u32 val)
> >  	return (val >> _Q_TAIL_CPU_OFFSET) - 1;
> >  }
> > =20
> > -/* Take the lock by setting the bit, no other CPUs may concurrently lo=
ck it. */
> > +static inline int get_owner_cpu(u32 val)
> > +{
> > +	return (val & _Q_OWNER_CPU_MASK) >> _Q_OWNER_CPU_OFFSET;
> > +}
> > +
> >  /* Take the lock by setting the lock bit, no other CPUs will touch it.=
 */
> >  static __always_inline void lock_set_locked(struct qspinlock *lock)
> >  {
> > @@ -180,7 +187,45 @@ static struct qnode *get_tail_qnode(struct qspinlo=
ck *lock, u32 val)
> >  	BUG();
> >  }
> > =20
> > -static inline bool try_to_steal_lock(struct qspinlock *lock)
> > +static __always_inline void yield_to_locked_owner(struct qspinlock *lo=
ck, u32 val, bool paravirt)
>
> This name doesn't seem correct for the non paravirt case.

Well... a yield to a running CPU is just a relax in any case. I think
it's okay.

> > +{
> > +	int owner;
> > +	u32 yield_count;
> > +
> > +	BUG_ON(!(val & _Q_LOCKED_VAL));
> > +
> > +	if (!paravirt)
> > +		goto relax;
> > +
> > +	if (!pv_yield_owner)
> > +		goto relax;
> > +
> > +	owner =3D get_owner_cpu(val);
> > +	yield_count =3D yield_count_of(owner);
> > +
> > +	if ((yield_count & 1) =3D=3D 0)
> > +		goto relax; /* owner vcpu is running */
>
> I wonder why not use vcpu_is_preempted()?

Because we use a particular yield_count for the yield hcall (it
tries to avoid the situation where the owner wakes up and may release
the lock and then we yield to it).

>
> > +
> > +	/*
> > +	 * Read the lock word after sampling the yield count. On the other si=
de
> > +	 * there may a wmb because the yield count update is done by the
> > +	 * hypervisor preemption and the value update by the OS, however this
> > +	 * ordering might reduce the chance of out of order accesses and
> > +	 * improve the heuristic.
> > +	 */
> > +	smp_rmb();
> > +
> > +	if (READ_ONCE(lock->val) =3D=3D val) {
> > +		yield_to_preempted(owner, yield_count);
> > +		/* Don't relax if we yielded. Maybe we should? */
> > +		return;
> > +	}
> > +relax:
> > +	cpu_relax();
> > +}
> > +
> > +
> > +static __always_inline bool try_to_steal_lock(struct qspinlock *lock, =
bool paravirt)
> >  {
> >  	int iters;
> > =20
> > @@ -197,18 +242,18 @@ static inline bool try_to_steal_lock(struct qspin=
lock *lock)
> >  			continue;
> >  		}
> > =20
> > -		cpu_relax();
> > +		yield_to_locked_owner(lock, val, paravirt);
> > =20
> >  		iters++;
> > =20
> > -		if (iters >=3D get_steal_spins())
> > +		if (iters >=3D get_steal_spins(paravirt))
> >  			break;
> >  	}
> > =20
> >  	return false;
> >  }
> > =20
> > -static inline void queued_spin_lock_mcs_queue(struct qspinlock *lock)
> > +static __always_inline void queued_spin_lock_mcs_queue(struct qspinloc=
k *lock, bool paravirt)
> >  {
> >  	struct qnodes *qnodesp;
> >  	struct qnode *next, *node;
> > @@ -260,7 +305,7 @@ static inline void queued_spin_lock_mcs_queue(struc=
t qspinlock *lock)
> >  	if (!MAYBE_STEALERS) {
> >  		/* We're at the head of the waitqueue, wait for the lock. */
> >  		while ((val =3D READ_ONCE(lock->val)) & _Q_LOCKED_VAL)
> > -			cpu_relax();
> > +			yield_to_locked_owner(lock, val, paravirt);
> > =20
> >  		/* If we're the last queued, must clean up the tail. */
> >  		if ((val & _Q_TAIL_CPU_MASK) =3D=3D tail) {
> > @@ -278,10 +323,10 @@ static inline void queued_spin_lock_mcs_queue(str=
uct qspinlock *lock)
> >  again:
> >  		/* We're at the head of the waitqueue, wait for the lock. */
> >  		while ((val =3D READ_ONCE(lock->val)) & _Q_LOCKED_VAL) {
> > -			cpu_relax();
> > +			yield_to_locked_owner(lock, val, paravirt);
> > =20
> >  			iters++;
> > -			if (!set_mustq && iters >=3D get_head_spins()) {
> > +			if (!set_mustq && iters >=3D get_head_spins(paravirt)) {
> >  				set_mustq =3D true;
> >  				lock_set_mustq(lock);
> >  				val |=3D _Q_MUST_Q_VAL;
> > @@ -320,10 +365,15 @@ static inline void queued_spin_lock_mcs_queue(str=
uct qspinlock *lock)
> > =20
> >  void queued_spin_lock_slowpath(struct qspinlock *lock)
> >  {
> > -	if (try_to_steal_lock(lock))
> > -		return;
> > -
> > -	queued_spin_lock_mcs_queue(lock);
> > +	if (IS_ENABLED(CONFIG_PARAVIRT_SPINLOCKS) && is_shared_processor()) {
> > +		if (try_to_steal_lock(lock, true))
> > +			return;
> > +		queued_spin_lock_mcs_queue(lock, true);
> > +	} else {
> > +		if (try_to_steal_lock(lock, false))
> > +			return;
> > +		queued_spin_lock_mcs_queue(lock, false);
> > +	}
> >  }
>
> There is not really a need for a conditional:=20
>
> bool paravirt =3D IS_ENABLED(CONFIG_PARAVIRT_SPINLOCKS) &&
> is_shared_processor();
>
> if (try_to_steal_lock(lock, paravirt))
> 	return;
>
> queued_spin_lock_mcs_queue(lock, paravirt);
>
>
> The paravirt parameter used by the various functions seems always to be
> equivalent to (IS_ENABLED(CONFIG_PARAVIRT_SPINLOCKS) && is_shared_process=
or()).
> I wonder if it would be simpler testing (IS_ENABLED(CONFIG_PARAVIRT_SPINL=
OCKS) && is_shared_processor())
> (using a helper function) in those functions instead passing it as a para=
meter?

You'd think so and yes semantically that's identical, but with my
version gcc-12 seems to inline each side and with yours they are
more shared. We actually want the separate versions because
is_shared_processor() is set at boot so we always only run one side
or the other so we want best efficiency possible and don't have the
icache pollution concern because the other side never runs.

At least that's the idea, that's what generic qspinlocks do too.

Thanks,
Nick
