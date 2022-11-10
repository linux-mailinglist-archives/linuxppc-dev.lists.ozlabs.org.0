Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FC52624083
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Nov 2022 11:58:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N7Jhw6sgdz3dtv
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Nov 2022 21:58:08 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=WqI2MXGV;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42c; helo=mail-pf1-x42c.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=WqI2MXGV;
	dkim-atps=neutral
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N7Jh23DWxz3cH9
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Nov 2022 21:57:22 +1100 (AEDT)
Received: by mail-pf1-x42c.google.com with SMTP id m6so1710018pfb.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Nov 2022 02:57:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:references:subject:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vSp8qeB73tpKlE5FoGeRycPLzP7uT0i0hzXjyML5EN8=;
        b=WqI2MXGVpl4N54j/zBNsJe5yuNY4K+ZEu1ii1+eLx05XirHSsWIrGe4fDiOcsis9v+
         RlR2cp02Q9MEFR/RCt127c/PaS9KyBJ7Qt6fk+8/hz9oPnDrGToLQ4FnWNWcVznckTX5
         X/Oc3fLnIp1qSX9Mcfc+C4lAAEQp5jwMOHDjMOoPtYXoLai8ZVf79Kq+fZdoHymP9ARc
         0OJ39UhNG41atDmmcisB+WAMVP4SZSIYSHd4slbxyNxVlVZ9YPo/CbssTWLl4diiuWmf
         jXW2sYeda+2UA4v51YZRtmQ3dwWBJydM3pmp4+GGzUQuIQCQ01Pxuuq/PxXgY6ZOlbZi
         lL1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:references:subject:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vSp8qeB73tpKlE5FoGeRycPLzP7uT0i0hzXjyML5EN8=;
        b=WUnopHf3zcV0enjqR5b6bAmwu/zyW72GormbuYbPF1MEXdryCwdsz+qdDjDw4BDEMn
         mwnZ+uLBWLUP4jVEZz+ijOsE3uVGcUbjt7FU1aBadOh+ehGO83eAfDRVr6dJYyIYX33g
         Sdck/WIyhpcxVZehgrTmUnM69lbz7UM21337eFdbEC7FF6qTMCAXlRS9ez2kO6qFqkXe
         SiS+VYL04H4TFtz5MWJy2OfQsgVS3G2IS9cZc52e84B62TtqUVbGXBuuh8Eg0rhcRrLq
         z74ZJ8mxqHVbaBcVMGe26S1SfRUnl+qxWGW32KmGEtp8PmCpFXIfahScoHc8OraRyHIA
         yw7A==
X-Gm-Message-State: ACrzQf1sYAt+y/MESsN5AVHxzveCvJ2mTtb8sxG7dXxdqqyc9rGwxAn1
	CwTAObC3MTXM9W8E/418Tp631qlHiTc=
X-Google-Smtp-Source: AMsMyM56yokWdQB0GSVtiBVOpdYw2fhvtJKQRTnyRCKmUOCVr5EipbCepn9o898Kj2feS2jUW50agw==
X-Received: by 2002:a05:6a00:224c:b0:56c:40ff:7709 with SMTP id i12-20020a056a00224c00b0056c40ff7709mr64083871pfu.59.1668077839373;
        Thu, 10 Nov 2022 02:57:19 -0800 (PST)
Received: from localhost (61-68-184-43.tpgi.com.au. [61.68.184.43])
        by smtp.gmail.com with ESMTPSA id w22-20020a1709026f1600b00177e5d83d3esm10943639plk.88.2022.11.10.02.57.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Nov 2022 02:57:18 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 10 Nov 2022 20:57:14 +1000
Message-Id: <CO8K8Q97CDRP.2SETW1SLWN7K2@bobo>
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Jordan Niethe" <jniethe5@gmail.com>, <linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH 06/17] powerpc/qspinlock: theft prevention to control
 latency
X-Mailer: aerc 0.13.0
References: <20220728063120.2867508-1-npiggin@gmail.com>
 <20220728063120.2867508-8-npiggin@gmail.com>
 <72d8e4c8160c4d19ee6bdeb9f6d0c8fe1df5f8dc.camel@gmail.com>
In-Reply-To: <72d8e4c8160c4d19ee6bdeb9f6d0c8fe1df5f8dc.camel@gmail.com>
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
> > Give the queue head the ability to stop stealers. After a number of
> > spins without sucessfully acquiring the lock, the queue head employs
> > this, which will assure it is the next owner.
> > ---
> >  arch/powerpc/include/asm/qspinlock_types.h | 10 +++-
> >  arch/powerpc/lib/qspinlock.c               | 56 +++++++++++++++++++++-
> >  2 files changed, 63 insertions(+), 3 deletions(-)
> >=20
> > diff --git a/arch/powerpc/include/asm/qspinlock_types.h b/arch/powerpc/=
include/asm/qspinlock_types.h
> > index 210adf05b235..8b20f5e22bba 100644
> > --- a/arch/powerpc/include/asm/qspinlock_types.h
> > +++ b/arch/powerpc/include/asm/qspinlock_types.h
> > @@ -29,7 +29,8 @@ typedef struct qspinlock {
> >   * Bitfields in the lock word:
> >   *
> >   *     0: locked bit
> > - * 16-31: tail cpu (+1)
> > + *    16: must queue bit
> > + * 17-31: tail cpu (+1)
> >   */
> >  #define	_Q_SET_MASK(type)	(((1U << _Q_ ## type ## _BITS) - 1)\
> >  				      << _Q_ ## type ## _OFFSET)
> > @@ -38,7 +39,12 @@ typedef struct qspinlock {
> >  #define _Q_LOCKED_MASK		_Q_SET_MASK(LOCKED)
> >  #define _Q_LOCKED_VAL		(1U << _Q_LOCKED_OFFSET)
> > =20
> > -#define _Q_TAIL_CPU_OFFSET	16
> > +#define _Q_MUST_Q_OFFSET	16
> > +#define _Q_MUST_Q_BITS		1
> > +#define _Q_MUST_Q_MASK		_Q_SET_MASK(MUST_Q)
> > +#define _Q_MUST_Q_VAL		(1U << _Q_MUST_Q_OFFSET)
> > +
> > +#define _Q_TAIL_CPU_OFFSET	17
> >  #define _Q_TAIL_CPU_BITS	(32 - _Q_TAIL_CPU_OFFSET)
> >  #define _Q_TAIL_CPU_MASK	_Q_SET_MASK(TAIL_CPU)
>
> Not a big deal but some of these values could be calculated like in the
> generic version. e.g.
>
> 	#define _Q_PENDING_OFFSET	(_Q_LOCKED_OFFSET +_Q_LOCKED_BITS)

Yeah, we don't *really* have more than one locked bit though. Haven't
made up my mind about these defines yet.

> > diff --git a/arch/powerpc/lib/qspinlock.c b/arch/powerpc/lib/qspinlock.=
c
> > index 1625cce714b2..a906cc8f15fa 100644
> > --- a/arch/powerpc/lib/qspinlock.c
> > +++ b/arch/powerpc/lib/qspinlock.c
> > @@ -22,6 +22,7 @@ struct qnodes {
> >  /* Tuning parameters */
> >  static int STEAL_SPINS __read_mostly =3D (1<<5);
> >  static bool MAYBE_STEALERS __read_mostly =3D true;
> > +static int HEAD_SPINS __read_mostly =3D (1<<8);
> > =20
> >  static DEFINE_PER_CPU_ALIGNED(struct qnodes, qnodes);
> > =20
> > @@ -30,6 +31,11 @@ static __always_inline int get_steal_spins(void)
> >  	return STEAL_SPINS;
> >  }
> > =20
> > +static __always_inline int get_head_spins(void)
> > +{
> > +	return HEAD_SPINS;
> > +}
> > +
> >  static inline u32 encode_tail_cpu(void)
> >  {
> >  	return (smp_processor_id() + 1) << _Q_TAIL_CPU_OFFSET;
> > @@ -142,6 +148,23 @@ static __always_inline u32 publish_tail_cpu(struct=
 qspinlock *lock, u32 tail)
> >  	return prev;
> >  }
> > =20
> > +static __always_inline u32 lock_set_mustq(struct qspinlock *lock)
> > +{
> > +	u32 new =3D _Q_MUST_Q_VAL;
> > +	u32 prev;
> > +
> > +	asm volatile(
> > +"1:	lwarx	%0,0,%1		# lock_set_mustq			\n"
>
> Is the EH bit not set because we don't hold the lock here?

Right, we're still waiting for it.

> > +"	or	%0,%0,%2						\n"
> > +"	stwcx.	%0,0,%1							\n"
> > +"	bne-	1b							\n"
> > +	: "=3D&r" (prev)
> > +	: "r" (&lock->val), "r" (new)
> > +	: "cr0", "memory");
>
> This is another usage close to the DEFINE_TESTOP() pattern.
>
> > +
> > +	return prev;
> > +}
> > +
> >  static struct qnode *get_tail_qnode(struct qspinlock *lock, u32 val)
> >  {
> >  	int cpu =3D get_tail_cpu(val);
> > @@ -165,6 +188,9 @@ static inline bool try_to_steal_lock(struct qspinlo=
ck *lock)
> >  	for (;;) {
> >  		u32 val =3D READ_ONCE(lock->val);
> > =20
> > +		if (val & _Q_MUST_Q_VAL)
> > +			break;
> > +
> >  		if (unlikely(!(val & _Q_LOCKED_VAL))) {
> >  			if (trylock_with_tail_cpu(lock, val))
> >  				return true;
> > @@ -246,11 +272,22 @@ static inline void queued_spin_lock_mcs_queue(str=
uct qspinlock *lock)
> >  		/* We must be the owner, just set the lock bit and acquire */
> >  		lock_set_locked(lock);
> >  	} else {
> > +		int iters =3D 0;
> > +		bool set_mustq =3D false;
> > +
> >  again:
> >  		/* We're at the head of the waitqueue, wait for the lock. */
> > -		while ((val =3D READ_ONCE(lock->val)) & _Q_LOCKED_VAL)
> > +		while ((val =3D READ_ONCE(lock->val)) & _Q_LOCKED_VAL) {
> >  			cpu_relax();
> > =20
> > +			iters++;
>
> It seems instead of using set_mustq, (val & _Q_MUST_Q_VAL) could be check=
ed?

I wanted to give the reader (and compiler for what that's worth) the
idea that it won't change concurrently after we set it.

Thanks,
Nick
