Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A3C1624158
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Nov 2022 12:26:49 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N7KKy5vwLz3cNh
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Nov 2022 22:26:46 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=px5zMZB9;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102b; helo=mail-pj1-x102b.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=px5zMZB9;
	dkim-atps=neutral
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N7KK10Yg9z3cJM
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Nov 2022 22:25:56 +1100 (AEDT)
Received: by mail-pj1-x102b.google.com with SMTP id l22-20020a17090a3f1600b00212fbbcfb78so4420332pjc.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Nov 2022 03:25:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OqQqEnls6tGoJeego97jUx950uh45WZLAi+Hncqb+F4=;
        b=px5zMZB9V116wgYwgLyCxvDUP4JDVLmVisVfEdFbG1yqlco5B6E9HPreY3QEl7vY1/
         cM2Da0PwS5LOpKL+SfWYOC5aDfLaX/eg22hHjnDDfsur78szmTZtCZYL8uGF0exqfPFn
         i7tK0mEJAedHsoPz9p06o7jLWNgygdhNSe3spX6WalqPaXmP/aAo+VOsxTuyqQBiN9Yf
         /YTKmWN91qlZmEc6jYScDevu1CTc1S09iRUfEIilsJXET+hhBFZOTqeHzcrMeJdVsSTG
         QVgjxw6h7tiSsqy41LfihweGjfcTJavcDbSFLJXNOK6GOpgmc0ZP4RqmCFlJvhZ+lETv
         Selg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=OqQqEnls6tGoJeego97jUx950uh45WZLAi+Hncqb+F4=;
        b=XyfHp/m26HRwC5lwhH8JjsfFJJ9Fkxcz4dzTjP7X8vfcImBhF/29+N1ewCZ6S4LW8D
         mqvhPG4/bWt1nTlk7ZrsiA9AVxVltYUi2y8vgRrlfb13XP5O//s5MoIbPnGlv5Ji5Flp
         SwCnCS2shXquTfjQeVly0V6fuPo3r1akN540NxLZuFeGWfXFOupN35Gukd1Z/GfLEnQf
         dxNRAwWLUfHxisM8CXrK1TuExnDpG9Pwl8DtbEWRt/5g6uCX8Gn4XNpLZYcWIwE5z4cW
         UA2evcou1XCeLsq+i++rDjUyX9ETiegcCSRSww+BZOQnX9toF1jPTe6tFOftHDE6nmLI
         F+uQ==
X-Gm-Message-State: ACrzQf3bVYsOj3uWITaOLqBwNTELPll62iAtPFv3qWYldXeIPUl8HxF3
	i9YajpcccbMlr69hrI1CL2X+smNwUlI=
X-Google-Smtp-Source: AMsMyM7+scb5UT/AtphoohFJNEFkeRBruF5mpaVPXw6HkNFMCtZUYz3je94cQbArwRXtdgrPA+ngmw==
X-Received: by 2002:a17:903:558:b0:187:18f7:714b with SMTP id jo24-20020a170903055800b0018718f7714bmr55044681plb.28.1668079553845;
        Thu, 10 Nov 2022 03:25:53 -0800 (PST)
Received: from localhost (61-68-184-43.tpgi.com.au. [61.68.184.43])
        by smtp.gmail.com with ESMTPSA id a14-20020a17090ad80e00b00213d08fa459sm2901450pjv.17.2022.11.10.03.25.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Nov 2022 03:25:52 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 10 Nov 2022 21:25:47 +1000
Message-Id: <CO8KULDWDO5R.16Z0BBIL7LCP3@bobo>
Subject: Re: [PATCH 11/17] powerpc/qspinlock: allow propagation of yield CPU
 down the queue
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Jordan Niethe" <jniethe5@gmail.com>, <linuxppc-dev@lists.ozlabs.org>
X-Mailer: aerc 0.13.0
References: <20220728063120.2867508-1-npiggin@gmail.com>
 <20220728063120.2867508-13-npiggin@gmail.com>
 <539debd7b25d5b4fe36756ae257d12f19aa4d6d3.camel@gmail.com>
In-Reply-To: <539debd7b25d5b4fe36756ae257d12f19aa4d6d3.camel@gmail.com>
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
> > Having all CPUs poll the lock word for the owner CPU that should be
> > yielded to defeats most of the purpose of using MCS queueing for
> > scalability. Yet it may be desirable for queued waiters to to yield
> > to a preempted owner.
> >=20
> > s390 addreses this problem by having queued waiters sample the lock
> > word to find the owner much less frequently. In this approach, the
> > waiters never sample it directly, but the queue head propagates the
> > owner CPU back to the next waiter if it ever finds the owner has
> > been preempted. Queued waiters then subsequently propagate the owner
> > CPU back to the next waiter, and so on.
> >=20
> > Disable this option by default for now, i.e., no logical change.
> > ---
> >  arch/powerpc/lib/qspinlock.c | 85 +++++++++++++++++++++++++++++++++++-
> >  1 file changed, 84 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/arch/powerpc/lib/qspinlock.c b/arch/powerpc/lib/qspinlock.=
c
> > index 94f007f66942..28c85a2d5635 100644
> > --- a/arch/powerpc/lib/qspinlock.c
> > +++ b/arch/powerpc/lib/qspinlock.c
> > @@ -12,6 +12,7 @@
> >  struct qnode {
> >  	struct qnode	*next;
> >  	struct qspinlock *lock;
> > +	int		yield_cpu;
> >  	u8		locked; /* 1 if lock acquired */
> >  };
> > =20
> > @@ -28,6 +29,7 @@ static int HEAD_SPINS __read_mostly =3D (1<<8);
> >  static bool pv_yield_owner __read_mostly =3D true;
> >  static bool pv_yield_allow_steal __read_mostly =3D false;
> >  static bool pv_yield_prev __read_mostly =3D true;
> > +static bool pv_yield_propagate_owner __read_mostly =3D true;
>
> This also seems to be enabled by default.
>
> > =20
> >  static DEFINE_PER_CPU_ALIGNED(struct qnodes, qnodes);
> > =20
> > @@ -257,13 +259,66 @@ static __always_inline void yield_head_to_locked_=
owner(struct qspinlock *lock, u
> >  	__yield_to_locked_owner(lock, val, paravirt, clear_mustq);
> >  }
> > =20
> > +static __always_inline void propagate_yield_cpu(struct qnode *node, u3=
2 val, int *set_yield_cpu, bool paravirt)
> > +{
> > +	struct qnode *next;
> > +	int owner;
> > +
> > +	if (!paravirt)
> > +		return;
> > +	if (!pv_yield_propagate_owner)
> > +		return;
> > +
> > +	owner =3D get_owner_cpu(val);
> > +	if (*set_yield_cpu =3D=3D owner)
> > +		return;
> > +
> > +	next =3D READ_ONCE(node->next);
> > +	if (!next)
> > +		return;
> > +
> > +	if (vcpu_is_preempted(owner)) {
>
> Is there a difference about using vcpu_is_preempted() here
> vs checking bit 0 in other places?

Yeah we weren't yielding here so didn't have to load the yield count
explicitly.

> > +		next->yield_cpu =3D owner;
> > +		*set_yield_cpu =3D owner;
> > +	} else if (*set_yield_cpu !=3D -1) {
>
> It might be worth giving the -1 CPU a #define.

It's fairly standard to use -1 as a null value for cpu.

>
> > +		next->yield_cpu =3D owner;
> > +		*set_yield_cpu =3D owner;
> > +	}
> > +}
>
> Does this need to pass set_yield_cpu by reference? Couldn't it's new valu=
e be
> returned? To me it makes it more clear the function is used to change
> set_yield_cpu. I think this would work:
>
> int set_yield_cpu =3D -1;
>
> static __always_inline int propagate_yield_cpu(struct qnode *node, u32 va=
l, int set_yield_cpu, bool paravirt)
> {
> 	struct qnode *next;
> 	int owner;
>
> 	if (!paravirt)
> 		goto out;
> 	if (!pv_yield_propagate_owner)
> 		goto out;
>
> 	owner =3D get_owner_cpu(val);
> 	if (set_yield_cpu =3D=3D owner)
> 		goto out;
>
> 	next =3D READ_ONCE(node->next);
> 	if (!next)
> 		goto out;
>
> 	if (vcpu_is_preempted(owner)) {
> 		next->yield_cpu =3D owner;
> 		return owner;
> 	} else if (set_yield_cpu !=3D -1) {
> 		next->yield_cpu =3D owner;
> 		return owner;
> 	}
>
> out:
> 	return set_yield_cpu;
> }
>
> set_yield_cpu =3D propagate_yield_cpu(...  set_yield_cpu ...);

I think I prefer as is, because the caller doesn't use it anywhere. It
looks more like some temporary storage to be used by the function over
multiple calls this way.

Thanks,
Nick
