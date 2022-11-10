Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 85DAA624188
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Nov 2022 12:36:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N7KY733prz3dvk
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Nov 2022 22:36:27 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=lJJ4nT5M;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42d; helo=mail-pf1-x42d.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=lJJ4nT5M;
	dkim-atps=neutral
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N7KX94r42z3cHX
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Nov 2022 22:35:37 +1100 (AEDT)
Received: by mail-pf1-x42d.google.com with SMTP id m6so1814490pfb.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Nov 2022 03:35:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4578P0OiW53c2LAZL+fg5jfAO6YRp+8n3H+zu8p3Ymw=;
        b=lJJ4nT5M68IsM8q4QtubkvJL5pWCUXuC6Zs0VjqdDJhysn7meZEFC7Pm2mA50N5UHe
         j/Zcmq3QJjU26lSdv+zn+M0t3R6sRMa76ufq+oqwatg2TXNxhUjPUua1EymYqQzVlEkb
         470/MHDFskO74XhssUrOH/QBmM1DCYXP7NTH6moZIyZBcjTS+fZtLOKfgjBByEj4EW6d
         bOUAvWr5RvNHDCCKS4Qrs9PHUfgf49Ays0UXNYB8uLH3PGuVl0kx/T2bYBwMfkmjlCVU
         nHjseNnzPxWHva2B/LS56HrgOYiWfmdPMom4pWj6ZDWNNbEBOiGx+gZnUBMwRxJoa5F4
         mCLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4578P0OiW53c2LAZL+fg5jfAO6YRp+8n3H+zu8p3Ymw=;
        b=bJJlN5QbSdPK7jVGwXbgh7qVsTRZMtWuF+PSi3pvofg7RS2DYoB7mIBL+9kN1mMRE9
         YbNjnIca4lMfV3xzdqrJzLduUeREHCqshzAI2ErGhuO0zvfpNIeSil0N8RNYIlSCsL5q
         nWBb7SAqzEh72iNLzdFqhUfa09kxhuNnq2zzu8F15E1VFEbiSp1Uc9/j5J5ni0o8MhmI
         A5mITG6xK5lrBs3KEbGRHWXFLR8ABMCXavgyu1ii5EaInHSs/TvEGEQun9bZg+tdY6nh
         qi0TcfOZ41CcDkpYNYMcwM9tqp2Tety+NSO9Vhtw0alMJboRwHOaS30uF+jpwkIOtqR3
         D3ZA==
X-Gm-Message-State: ACrzQf3LyqFn4xD1JYEyJ+gZcOo/ZN2+1cCpQFtlTDstgv5CIeXi79Iw
	H8EPMruMj0NpyBNzWaRQHZZpYUOxnn4=
X-Google-Smtp-Source: AMsMyM7s0Zv/Z7FE3SxRVIG2bfHoc/iQCs+mMdPD7BRU8Ftnvvu/RFlxjTx3Q47z73B2NX1UCcZD1A==
X-Received: by 2002:a65:6c0d:0:b0:46f:a98a:5abf with SMTP id y13-20020a656c0d000000b0046fa98a5abfmr2321857pgu.128.1668080134517;
        Thu, 10 Nov 2022 03:35:34 -0800 (PST)
Received: from localhost (61-68-184-43.tpgi.com.au. [61.68.184.43])
        by smtp.gmail.com with ESMTPSA id p18-20020a63f452000000b0047079cb8875sm6459817pgk.42.2022.11.10.03.35.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Nov 2022 03:35:33 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 10 Nov 2022 21:35:29 +1000
Message-Id: <CO8L20P9WJK4.3627HY5JX74SB@bobo>
Subject: Re: [PATCH 13/17] powerpc/qspinlock: trylock and initial lock
 attempt may steal
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Jordan Niethe" <jniethe5@gmail.com>, <linuxppc-dev@lists.ozlabs.org>
X-Mailer: aerc 0.13.0
References: <20220728063120.2867508-1-npiggin@gmail.com>
 <20220728063120.2867508-15-npiggin@gmail.com>
 <102be7ce979d8edc5eec56881a5d14c1eb2211b2.camel@gmail.com>
In-Reply-To: <102be7ce979d8edc5eec56881a5d14c1eb2211b2.camel@gmail.com>
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

On Thu Nov 10, 2022 at 10:43 AM AEST, Jordan Niethe wrote:
> On Thu, 2022-07-28 at 16:31 +1000, Nicholas Piggin wrote:
> [resend as utf-8, not utf-7]
> > This gives trylock slightly more strength, and it also gives most
> > of the benefit of passing 'val' back through the slowpath without
> > the complexity.
> > ---
> >  arch/powerpc/include/asm/qspinlock.h | 39 +++++++++++++++++++++++++++-
> >  arch/powerpc/lib/qspinlock.c         |  9 +++++++
> >  2 files changed, 47 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/arch/powerpc/include/asm/qspinlock.h b/arch/powerpc/includ=
e/asm/qspinlock.h
> > index 44601b261e08..d3d2039237b2 100644
> > --- a/arch/powerpc/include/asm/qspinlock.h
> > +++ b/arch/powerpc/include/asm/qspinlock.h
> > @@ -5,6 +5,8 @@
> >  #include <linux/compiler.h>
> >  #include <asm/qspinlock_types.h>
> > =20
> > +#define _Q_SPIN_TRY_LOCK_STEAL 1
>
> Would this be a config option?

I think probably not, it's more to keep the other code variant there if
we want to try tune experiment with it. We might end up cutting out a
bunch of these options if we narrow down on a good configuration.

>
> > +
> >  static __always_inline int queued_spin_is_locked(struct qspinlock *loc=
k)
> >  {
> >  	return READ_ONCE(lock->val);
> > @@ -26,11 +28,12 @@ static __always_inline u32 queued_spin_get_locked_v=
al(void)
> >  	return _Q_LOCKED_VAL | (smp_processor_id() << _Q_OWNER_CPU_OFFSET);
> >  }
> > =20
> > -static __always_inline int queued_spin_trylock(struct qspinlock *lock)
> > +static __always_inline int __queued_spin_trylock_nosteal(struct qspinl=
ock *lock)
> >  {
> >  	u32 new =3D queued_spin_get_locked_val();
> >  	u32 prev;
> > =20
> > +	/* Trylock succeeds only when unlocked and no queued nodes */
> >  	asm volatile(
> >  "1:	lwarx	%0,0,%1,%3	# queued_spin_trylock			\n"
>
> s/queued_spin_trylock/__queued_spin_trylock_nosteal

I wanted to keep those because they (can be) inlined into the wider
kernel, so you'd rather see queued_spin_trylock than this internal name.

> >  "	cmpwi	0,%0,0							\n"
> > @@ -49,6 +52,40 @@ static __always_inline int queued_spin_trylock(struc=
t qspinlock *lock)
> >  	return 0;
> >  }
> > =20
> > +static __always_inline int __queued_spin_trylock_steal(struct qspinloc=
k *lock)
> > +{
> > +	u32 new =3D queued_spin_get_locked_val();
> > +	u32 prev, tmp;
> > +
> > +	/* Trylock may get ahead of queued nodes if it finds unlocked */
> > +	asm volatile(
> > +"1:	lwarx	%0,0,%2,%5	# queued_spin_trylock			\n"
>
> s/queued_spin_trylock/__queued_spin_trylock_steal
>
> > +"	andc.	%1,%0,%4						\n"
> > +"	bne-	2f							\n"
> > +"	and	%1,%0,%4						\n"
> > +"	or	%1,%1,%3						\n"
> > +"	stwcx.	%1,0,%2							\n"
> > +"	bne-	1b							\n"
> > +"\t"	PPC_ACQUIRE_BARRIER "						\n"
> > +"2:									\n"
>
> Just because there's a little bit more going on here...
>
> Q_TAIL_CPU_MASK =3D 0xFFFE0000
> ~Q_TAIL_CPU_MASK =3D 0x1FFFF
>
>
> 1:	lwarx	prev, 0, &lock->val, IS_ENABLED_PPC64
> 	andc.	tmp, prev, _Q_TAIL_CPU_MASK 	(tmp =3D prev & ~_Q_TAIL_CPU_MASK)
> 	bne-	2f 				(exit if locked)
> 	and	tmp, prev, _Q_TAIL_CPU_MASK 	(tmp =3D prev & _Q_TAIL_CPU_MASK)
> 	or	tmp, tmp, new			(tmp |=3D new)				=09
> 	stwcx.	tmp, 0, &lock->val				=09
> 	=09
> 	bne-	1b						=09
> 	PPC_ACQUIRE_BARRIER	=09
> 2:
>
> ... which seems correct.

Thanks,
Nick
