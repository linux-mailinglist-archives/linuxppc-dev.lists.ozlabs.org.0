Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 96A1D62414E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Nov 2022 12:23:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N7KGC3bqLz3cRW
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Nov 2022 22:23:31 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=TAtBqUpN;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62b; helo=mail-pl1-x62b.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=TAtBqUpN;
	dkim-atps=neutral
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N7KFH1tVjz3cH9
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Nov 2022 22:22:41 +1100 (AEDT)
Received: by mail-pl1-x62b.google.com with SMTP id 4so1215606pli.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Nov 2022 03:22:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0sQlaVtu5408bC9Ght2OwuDi3abMQBa92eZujPcg4m8=;
        b=TAtBqUpNnG8GB0Bg9xTlKT0WQd5H2UcxBg+/ZMyri9Ugo6421ntoplCz1jhCJHkLXj
         wMJizQ8EZm07xlyQqzkGK/7G3s1QN9bIJZljPktOsAts1xNh3A2VOPFkQdWe0ywMaNGN
         dsEIe2lfq+7LCm61Rfpanp5Vgojhn02HwrWnd6KT3xRtN25n38wn97rI/961NP6N//38
         7+cstXvgqFTCXc0j5XizWCy9TOiGtnEQRek5KNf0ZKmk+PQ4Lo+DrTUB0Zke9qmhWhV9
         UKUt1vuy9YQUTZMmjsCSgUJjSnVc6d96dsYyCY3DWhoF78yVPPLzz0L1PkxutH1mrxIU
         rdDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0sQlaVtu5408bC9Ght2OwuDi3abMQBa92eZujPcg4m8=;
        b=we8KVxJHFrZpyg8Tm2rfxCfJW+OxOdltCgvxG9NRAfTWFmr11g0dugdg6rOaroKHBt
         RowkXWkdcZfLEEAElHGSOjKTE5WSwGNAxJbfHbk3l9CPQSKi4AFvi3q9nm0K8dmWOy7y
         eaxIMg+3KqJz2FX3sPfOxvqKYCoW39hH/eRbVfY/2Rc3YtNGaaBgrYJ1iuz8Mx4OjaPG
         v4we/ugloXZkadX08RoHdKSFBLsBuig65qg8VeMS6d9k8TAgcvjAOYdwXSAKFhCH2QKX
         pLlL5KEMHRDwZXmzobrh6lUnpgxHObqGJBy3DBMd5ggXfYTWqKsk08PDXoUG5wGaeNmo
         Y5Vw==
X-Gm-Message-State: ACrzQf0bwiAQjGbLULmT1xrRIcOhBulpEMEbU4aSUOCfxTTS7WSXM5Ak
	om5HtAAxaRoZ+5cfqkaPeAx/kRZ54zE=
X-Google-Smtp-Source: AMsMyM7NVnmd94EAvROkf9YIBMs5JXyzRHGGqB7PQn4flZD9uE1BSrvE2zN6BBIlY0Qg1xR8WTq7jA==
X-Received: by 2002:a17:90a:f414:b0:212:cacf:42c3 with SMTP id ch20-20020a17090af41400b00212cacf42c3mr83614788pjb.198.1668079358345;
        Thu, 10 Nov 2022 03:22:38 -0800 (PST)
Received: from localhost (61-68-184-43.tpgi.com.au. [61.68.184.43])
        by smtp.gmail.com with ESMTPSA id x4-20020a170902a38400b00177efb56475sm10999355pla.85.2022.11.10.03.22.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Nov 2022 03:22:37 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 10 Nov 2022 21:22:33 +1000
Message-Id: <CO8KS43CTGR6.18EOOXB8324JL@bobo>
Subject: Re: [PATCH 10/17] powerpc/qspinlock: allow stealing when head of
 queue yields
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Jordan Niethe" <jniethe5@gmail.com>, <linuxppc-dev@lists.ozlabs.org>
X-Mailer: aerc 0.13.0
References: <20220728063120.2867508-1-npiggin@gmail.com>
 <20220728063120.2867508-12-npiggin@gmail.com>
 <105e7cbf5289fe19339f0cde4033a9afdfea17f9.camel@gmail.com>
In-Reply-To: <105e7cbf5289fe19339f0cde4033a9afdfea17f9.camel@gmail.com>
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

On Thu Nov 10, 2022 at 10:42 AM AEST, Jordan Niethe wrote:
> On Thu, 2022-07-28 at 16:31 +1000, Nicholas Piggin wrote:
> [resend as utf-8, not utf-7]
> > If the head of queue is preventing stealing but it finds the owner vCPU
> > is preempted, it will yield its cycles to the owner which could cause i=
t
> > to become preempted. Add an option to re-allow stealers before yielding=
,
> > and disallow them again after returning from the yield.
> >=20
> > Disable this option by default for now, i.e., no logical change.
> > ---
> >  arch/powerpc/lib/qspinlock.c | 56 ++++++++++++++++++++++++++++++++++--
> >  1 file changed, 53 insertions(+), 3 deletions(-)
> >=20
> > diff --git a/arch/powerpc/lib/qspinlock.c b/arch/powerpc/lib/qspinlock.=
c
> > index b39f8c5b329c..94f007f66942 100644
> > --- a/arch/powerpc/lib/qspinlock.c
> > +++ b/arch/powerpc/lib/qspinlock.c
> > @@ -26,6 +26,7 @@ static bool MAYBE_STEALERS __read_mostly =3D true;
> >  static int HEAD_SPINS __read_mostly =3D (1<<8);
> > =20
> >  static bool pv_yield_owner __read_mostly =3D true;
> > +static bool pv_yield_allow_steal __read_mostly =3D false;
>
> To me this one does read as a boolean, but if you go with those other cha=
nges
> I'd make it pv_yield_steal_enable to be consistent.
>
> >  static bool pv_yield_prev __read_mostly =3D true;
> > =20
> >  static DEFINE_PER_CPU_ALIGNED(struct qnodes, qnodes);
> > @@ -173,6 +174,23 @@ static __always_inline u32 lock_set_mustq(struct q=
spinlock *lock)
> >  	return prev;
> >  }
> > =20
> > +static __always_inline u32 lock_clear_mustq(struct qspinlock *lock)
> > +{
> > +	u32 new =3D _Q_MUST_Q_VAL;
> > +	u32 prev;
> > +
> > +	asm volatile(
> > +"1:	lwarx	%0,0,%1		# lock_clear_mustq			\n"
> > +"	andc	%0,%0,%2						\n"
> > +"	stwcx.	%0,0,%1							\n"
> > +"	bne-	1b							\n"
> > +	: "=3D&r" (prev)
> > +	: "r" (&lock->val), "r" (new)
> > +	: "cr0", "memory");
> > +
>
> This is pretty similar to the DEFINE_TESTOP() pattern again with the same=
 llong caveat.
>
>
> > +	return prev;
> > +}
> > +
> >  static struct qnode *get_tail_qnode(struct qspinlock *lock, u32 val)
> >  {
> >  	int cpu =3D get_tail_cpu(val);
> > @@ -188,7 +206,7 @@ static struct qnode *get_tail_qnode(struct qspinloc=
k *lock, u32 val)
> >  	BUG();
> >  }
> > =20
> > -static __always_inline void yield_to_locked_owner(struct qspinlock *lo=
ck, u32 val, bool paravirt)
> > +static __always_inline void __yield_to_locked_owner(struct qspinlock *=
lock, u32 val, bool paravirt, bool clear_mustq)
>
>  /* See yield_to_locked_owner comment */ comment needs to be updated now.

Yep.

> >  {
> >  	int owner;
> >  	u32 yield_count;
> > @@ -217,7 +235,11 @@ static __always_inline void yield_to_locked_owner(=
struct qspinlock *lock, u32 va
> >  	smp_rmb();
> > =20
> >  	if (READ_ONCE(lock->val) =3D=3D val) {
> > +		if (clear_mustq)
> > +			lock_clear_mustq(lock);
> >  		yield_to_preempted(owner, yield_count);
> > +		if (clear_mustq)
> > +			lock_set_mustq(lock);
> >  		/* Don't relax if we yielded. Maybe we should? */
> >  		return;
> >  	}
> > @@ -225,6 +247,16 @@ static __always_inline void yield_to_locked_owner(=
struct qspinlock *lock, u32 va
> >  	cpu_relax();
> >  }
> > =20
> > +static __always_inline void yield_to_locked_owner(struct qspinlock *lo=
ck, u32 val, bool paravirt)
> > +{
> > +	__yield_to_locked_owner(lock, val, paravirt, false);
> > +}
> > +
> > +static __always_inline void yield_head_to_locked_owner(struct qspinloc=
k *lock, u32 val, bool paravirt, bool clear_mustq)
> > +{
>
> The check for pv_yield_allow_steal seems like it could go here instead of
> being done by the caller.
> __yield_to_locked_owner() checks for pv_yield_owner so it seems more
>   consistent.

Yeah that worked and is probably an improvement.

Thanks,
Nick
