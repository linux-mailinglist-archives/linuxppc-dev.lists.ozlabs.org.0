Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DAF8962412D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Nov 2022 12:15:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N7K4n5ZHVz3f4H
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Nov 2022 22:15:21 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=fK4SO5Ry;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::633; helo=mail-pl1-x633.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=fK4SO5Ry;
	dkim-atps=neutral
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N7K3t2F1hz3dwd
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Nov 2022 22:14:34 +1100 (AEDT)
Received: by mail-pl1-x633.google.com with SMTP id j12so1157827plj.5
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Nov 2022 03:14:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oRhbva6fB0twAFoNWAJhQYjaPR/sPYgR4Tr1QrB7I04=;
        b=fK4SO5RyTh68WRB4Sb249/MUoLzoJmRTAFy4Yec3o9tw2Kw2vezpxaYahoPd5kV5n8
         2CkD+vfLp2Xhv6Zc91pFTpb9uycWn4lbl7i/KKQqQbiQi6zDr/CjRDvFBxavb8IJrPX+
         ++I34cklTPc9MSqnMxUIktWGjKSRnPf+8Ylj+3mLEjRQI8ee9CB0ct8CqQySilsY41gs
         0Zj/2a4/jN2JmGxyMwmLwWaQOb1UgbzCxrk5lA9uhZs1DSpjeZVE5R1UkcxUhiKmFoIv
         EJovOs15tbgUuZRjxas1G5JVP7RtpnBqBtyf+2wZHdeUJXRUzHCnyabBSPG7aGB78dJz
         WpqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oRhbva6fB0twAFoNWAJhQYjaPR/sPYgR4Tr1QrB7I04=;
        b=c2u6toH7E9JM2fxRGNRoju0Ra/aTrEegPisir2gkjSEjHyOaOQCOWUqxonjaVxpgJy
         F13u3toRJZgpkglbFkKngvwF9xRR3p4B+XISll55sZhQqngl5tHseJHqkP9AMTOe6ovw
         wdovxGtL/tgQzeSvOhA8TAwBQx7/q3pE5PO0slKkUptT6n0R4QOlipBNu4sYYKOx+r4R
         B3DicnxOU2DQIdxLnNidCMfTYcPeMSWf73rvY8NpYD9MfraVA2QozFISJ8AdRJ9CDXAK
         RtvKZ8b1H/X7JGDAQgFm8UjLGAGAwYEMv8P1OBHoJc7oF/k2jvwBXjMNA2ghk7Rb2DEs
         4YdA==
X-Gm-Message-State: ACrzQf1r0YBpTWCqrq8eNo0O/XGcp7N6usNNkPJwc3cIP+7n/iakit3y
	Tx3/yKDS2Ba2BFRGWpFF29cVdby3XN4=
X-Google-Smtp-Source: AMsMyM6/B6Ezss/fnrCzIeU3El0H7OHzZZvDEFnqXalqHsgy75ge4STSIiMtEAspqqGMl1hxxXE9Uw==
X-Received: by 2002:a17:902:b595:b0:187:34f6:7820 with SMTP id a21-20020a170902b59500b0018734f67820mr48966239pls.152.1668078871304;
        Thu, 10 Nov 2022 03:14:31 -0800 (PST)
Received: from localhost (61-68-184-43.tpgi.com.au. [61.68.184.43])
        by smtp.gmail.com with ESMTPSA id l29-20020a635b5d000000b00439d071c110sm9030776pgm.43.2022.11.10.03.14.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Nov 2022 03:14:30 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 10 Nov 2022 21:14:26 +1000
Message-Id: <CO8KLWDWSQDW.273LILF6ZT13O@bobo>
Subject: Re: [PATCH 09/17] powerpc/qspinlock: implement option to yield to
 previous node
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Jordan Niethe" <jniethe5@gmail.com>, <linuxppc-dev@lists.ozlabs.org>
X-Mailer: aerc 0.13.0
References: <20220728063120.2867508-1-npiggin@gmail.com>
 <20220728063120.2867508-11-npiggin@gmail.com>
 <c56326f5d55db6b8f6a611ae130e0e5362b39ceb.camel@gmail.com>
In-Reply-To: <c56326f5d55db6b8f6a611ae130e0e5362b39ceb.camel@gmail.com>
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
> On Thu, 2022-07-28 at 16:31 +1000, Nicholas Piggin wrote:
> [resend as utf-8, not utf-7]
> > Queued waiters which are not at the head of the queue don't spin on
> > the lock word but their qnode lock word, waiting for the previous queue=
d
> > CPU to release them. Add an option which allows these waiters to yield
> > to the previous CPU if its vCPU is preempted.
> >=20
> > Disable this option by default for now, i.e., no logical change.
> > ---
> >  arch/powerpc/lib/qspinlock.c | 46 +++++++++++++++++++++++++++++++++++-
> >  1 file changed, 45 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/arch/powerpc/lib/qspinlock.c b/arch/powerpc/lib/qspinlock.=
c
> > index 55286ac91da5..b39f8c5b329c 100644
> > --- a/arch/powerpc/lib/qspinlock.c
> > +++ b/arch/powerpc/lib/qspinlock.c
> > @@ -26,6 +26,7 @@ static bool MAYBE_STEALERS __read_mostly =3D true;
> >  static int HEAD_SPINS __read_mostly =3D (1<<8);
> > =20
> >  static bool pv_yield_owner __read_mostly =3D true;
> > +static bool pv_yield_prev __read_mostly =3D true;
>
> Similiar suggestion, maybe pv_yield_prev_enabled would read better.
>
> Isn't this enabled by default contrary to the commit message?

Yeah a few of those changelogs got out of synch.

>
> > =20
> >  static DEFINE_PER_CPU_ALIGNED(struct qnodes, qnodes);
> > =20
> > @@ -224,6 +225,31 @@ static __always_inline void yield_to_locked_owner(=
struct qspinlock *lock, u32 va
> >  	cpu_relax();
> >  }
> > =20
> > +static __always_inline void yield_to_prev(struct qspinlock *lock, stru=
ct qnode *node, int prev_cpu, bool paravirt)
>
> yield_to_locked_owner() takes a raw val and works out the cpu to yield to=
.
> I think for consistency have yield_to_prev() take the raw val and work it=
 out too.

Good thinking.

> > +{
> > +	u32 yield_count;
> > +
> > +	if (!paravirt)
> > +		goto relax;
> > +
> > +	if (!pv_yield_prev)
> > +		goto relax;
> > +
> > +	yield_count =3D yield_count_of(prev_cpu);
> > +	if ((yield_count & 1) =3D=3D 0)
> > +		goto relax; /* owner vcpu is running */
> > +
> > +	smp_rmb(); /* See yield_to_locked_owner comment */
> > +
> > +	if (!node->locked) {
> > +		yield_to_preempted(prev_cpu, yield_count);
> > +		return;
> > +	}
> > +
> > +relax:
> > +	cpu_relax();
> > +}
> > +
> > =20
> >  static __always_inline bool try_to_steal_lock(struct qspinlock *lock, =
bool paravirt)
> >  {
> > @@ -291,13 +317,14 @@ static __always_inline void queued_spin_lock_mcs_=
queue(struct qspinlock *lock, b
> >  	 */
> >  	if (old & _Q_TAIL_CPU_MASK) {
> >  		struct qnode *prev =3D get_tail_qnode(lock, old);
> > +		int prev_cpu =3D get_tail_cpu(old);
>
> This could then be removed.
>
> > =20
> >  		/* Link @node into the waitqueue. */
> >  		WRITE_ONCE(prev->next, node);
> > =20
> >  		/* Wait for mcs node lock to be released */
> >  		while (!node->locked)
> > -			cpu_relax();
> > +			yield_to_prev(lock, node, prev_cpu, paravirt);
>
> And would have this as:
> 			yield_to_prev(lock, node, old, paravirt);

Yep.

Thanks,
Nick

