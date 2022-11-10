Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D071623E79
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Nov 2022 10:22:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N7GZF5L6sz3cN5
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Nov 2022 20:22:13 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=DJbZLZ9r;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62f; helo=mail-pl1-x62f.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=DJbZLZ9r;
	dkim-atps=neutral
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N7GYG6jz4z3cFZ
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Nov 2022 20:21:21 +1100 (AEDT)
Received: by mail-pl1-x62f.google.com with SMTP id p12so975085plq.4
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Nov 2022 01:21:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xrYSDiCYFlvUczbhb5HjXhuc2SW/hH4qTi7C1hnSQpI=;
        b=DJbZLZ9rFvya3FEjn1DQdSnBg7WhOMidR+pmznuINhw9HOV1dY5ISeL3q6tgU9IG1M
         YwVPr4EqujkOiOqT1LG5ZODk0ly8rUHLWG2/H2c3kPLZUx1JHqF1FpZvU0kfrPwVndKE
         TQSPqcTm4dgE03/aR6SFE9csLprmH9YDgKtYN014zfuNl4jmBwpuvXbym2iKFaobtc7d
         OUpHMi00QyeelTRjDrXrNKV/8+T1F9uM2UIQVsZHQKUEB3b4cxjM6KZAzN9JDSKfa1ut
         5xtcSlT4rxv1tjf3CQ9x5udVSiLiggvpsJNL7D06KTIKZ7unUklKKc82ScvSpYhkal/M
         2Prw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xrYSDiCYFlvUczbhb5HjXhuc2SW/hH4qTi7C1hnSQpI=;
        b=LVhpW8c0TC3hpX/uPrzZsDfQP67T8NCaRpm60PsaQU11vppDmc7iZq7gtKjMY2JcF5
         VcKKTWl67Uzplb/EBVPTMwTAczzeuPoVAmWcP19zfOp/cghEpK5mZEg0WRHygxSUrVgG
         RlU+yRIa1S90/+QGWpng07q9gSQ54H5sKQgWtCrOscySwKRRx33ai4oy511rJRkOn4gl
         xi/GgfAbfApQEH94fOrnuR147nNo9OvIKLqyOQTh9i6dgEZn1MAyZLrM7vibaaBOPPFd
         c1vps7ICHLdUHmrbQJtOqeLYhFbV02NJdOznTGEkxmC2cqwYtc8Ig5Ja72bWFLiruNQK
         1/yw==
X-Gm-Message-State: ANoB5pm1F93EPuqLqNVTRolzoBum2m7BzNHdjMD3RddHUNri9cYj4p1l
	mOaHlsLOcJnGp+7XN3TY4gA=
X-Google-Smtp-Source: AA0mqf7/jZuIDB/76rUj0WoFm6Zefx+2ZY8lXn/CLd921HcpQnyFl9LcDi8YbvYhDfBZOTG+/3NV2Q==
X-Received: by 2002:a17:902:cf11:b0:188:7dca:6f2a with SMTP id i17-20020a170902cf1100b001887dca6f2amr20023089plg.2.1668072078077;
        Thu, 10 Nov 2022 01:21:18 -0800 (PST)
Received: from localhost (61-68-184-43.tpgi.com.au. [61.68.184.43])
        by smtp.gmail.com with ESMTPSA id f4-20020a170902e98400b001782aab6318sm10638495plb.68.2022.11.10.01.21.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Nov 2022 01:21:17 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 10 Nov 2022 19:21:13 +1000
Message-Id: <CO8I77UFSII9.W7QL732AK5HK@bobo>
Subject: Re: [PATCH 02/17] powerpc/qspinlock: add mcs queueing for contended
 waiters
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Jordan Niethe" <jniethe5@gmail.com>, <linuxppc-dev@lists.ozlabs.org>
X-Mailer: aerc 0.13.0
References: <20220728063120.2867508-1-npiggin@gmail.com>
 <20220728063120.2867508-4-npiggin@gmail.com>
 <e8fd017828415c10e71c71a7e1bdbb26faca7719.camel@gmail.com>
In-Reply-To: <e8fd017828415c10e71c71a7e1bdbb26faca7719.camel@gmail.com>
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

On Thu Nov 10, 2022 at 10:36 AM AEST, Jordan Niethe wrote:
> On Thu, 2022-07-28 at 16:31 +1000, Nicholas Piggin wrote:
> <snip>
> [resend as utf-8, not utf-7]
> > =20
> > +/*
> > + * Bitfields in the atomic value:
> > + *
> > + *     0: locked bit
> > + * 16-31: tail cpu (+1)
> > + */
> > +#define	_Q_SET_MASK(type)	(((1U << _Q_ ## type ## _BITS) - 1)\
> > +				      << _Q_ ## type ## _OFFSET)
> > +#define _Q_LOCKED_OFFSET	0
> > +#define _Q_LOCKED_BITS		1
> > +#define _Q_LOCKED_MASK		_Q_SET_MASK(LOCKED)
> > +#define _Q_LOCKED_VAL		(1U << _Q_LOCKED_OFFSET)
> > +
> > +#define _Q_TAIL_CPU_OFFSET	16
> > +#define _Q_TAIL_CPU_BITS	(32 - _Q_TAIL_CPU_OFFSET)
> > +#define _Q_TAIL_CPU_MASK	_Q_SET_MASK(TAIL_CPU)
> > +
>
> Just to state the obvious this is:
>
> #define _Q_LOCKED_OFFSET	0
> #define _Q_LOCKED_BITS		1
> #define _Q_LOCKED_MASK		0x00000001
> #define _Q_LOCKED_VAL		1
>
> #define _Q_TAIL_CPU_OFFSET	16
> #define _Q_TAIL_CPU_BITS	16
> #define _Q_TAIL_CPU_MASK	0xffff0000

Yeah. I'm wondering if that's a better style in the first place.
Generic qspinlock this can chance so there's slightly more reason to do
it that way.

> > +#if CONFIG_NR_CPUS >=3D (1U << _Q_TAIL_CPU_BITS)
> > +#error "qspinlock does not support such large CONFIG_NR_CPUS"
> > +#endif
> > +
> >  #endif /* _ASM_POWERPC_QSPINLOCK_TYPES_H */
> > diff --git a/arch/powerpc/lib/qspinlock.c b/arch/powerpc/lib/qspinlock.=
c
> > index 8dbce99a373c..5ebb88d95636 100644
> > --- a/arch/powerpc/lib/qspinlock.c
> > +++ b/arch/powerpc/lib/qspinlock.c
> > @@ -1,12 +1,172 @@
> >  // SPDX-License-Identifier: GPL-2.0-or-later
> > +#include <linux/atomic.h>
> > +#include <linux/bug.h>
> > +#include <linux/compiler.h>
> >  #include <linux/export.h>
> > -#include <linux/processor.h>
> > +#include <linux/percpu.h>
> > +#include <linux/smp.h>
> >  #include <asm/qspinlock.h>
> > =20
> > -void queued_spin_lock_slowpath(struct qspinlock *lock)
> > +#define MAX_NODES	4
> > +
> > +struct qnode {
> > +	struct qnode	*next;
> > +	struct qspinlock *lock;
> > +	u8		locked; /* 1 if lock acquired */
> > +};
> > +
> > +struct qnodes {
> > +	int		count;
> > +	struct qnode nodes[MAX_NODES];
> > +};
>
> I think it could be worth commenting why qnodes::count instead _Q_TAIL_ID=
X_OFFSET.

I wasn't sure what you meant by this.

> > +
> > +static DEFINE_PER_CPU_ALIGNED(struct qnodes, qnodes);
> > +
> > +static inline int encode_tail_cpu(void)
>
> I think the generic version that takes smp_processor_id() as a parameter =
is clearer - at least with this function name.

Agree.

> > +{
> > +	return (smp_processor_id() + 1) << _Q_TAIL_CPU_OFFSET;
> > +}
> > +
> > +static inline int get_tail_cpu(int val)
>
> It seems like there should be a "decode" function to pair up with the "en=
code" function.

Agree.

> > +{
> > +	return (val >> _Q_TAIL_CPU_OFFSET) - 1;
> > +}
> > +
> > +/* Take the lock by setting the bit, no other CPUs may concurrently lo=
ck it. */
>
> Does that comment mean it is not necessary to use an atomic_or here?

No, only that it can't be locked. It can still be modified by another
queuer.

> > +static __always_inline void lock_set_locked(struct qspinlock *lock)
>
> nit: could just be called set_locked()

Yep.

> > +{
> > +	atomic_or(_Q_LOCKED_VAL, &lock->val);
> > +	__atomic_acquire_fence();
> > +}
> > +
> > +/* Take lock, clearing tail, cmpxchg with val (which must not be locke=
d) */
> > +static __always_inline int trylock_clear_tail_cpu(struct qspinlock *lo=
ck, int val)
> > +{
> > +	int newval =3D _Q_LOCKED_VAL;
> > +
> > +	if (atomic_cmpxchg_acquire(&lock->val, val, newval) =3D=3D val)
> > +		return 1;
> > +	else
> > +		return 0;
>
> same optional style nit: return (atomic_cmpxchg_acquire(&lock->val, val, =
newval) =3D=3D val);

Am thinking about it :)

> > +}
> > +
> > +/*
> > + * Publish our tail, replacing previous tail. Return previous value.
> > + *
> > + * This provides a release barrier for publishing node, and an acquire=
 barrier
> > + * for getting the old node.
> > + */
> > +static __always_inline int publish_tail_cpu(struct qspinlock *lock, in=
t tail)
>
> Did you change from the xchg_tail() name in the generic version because o=
f the release and acquire barriers this provides?
> Does "publish" generally imply the old value will be returned?

Yes publish I thought is a bit more obvious that's where it becomes
visible to other CPUs. It doesn't imply return, but I thought those
semantis are the self-documenting part.

>
> >  {
> > -	while (!queued_spin_trylock(lock))
> > +	for (;;) {
> > +		int val =3D atomic_read(&lock->val);
> > +		int newval =3D (val & ~_Q_TAIL_CPU_MASK) | tail;
> > +		int old;
> > +
> > +		old =3D atomic_cmpxchg(&lock->val, val, newval);
> > +		if (old =3D=3D val)
> > +			return old;
> > +	}
> > +}
> > +
> > +static struct qnode *get_tail_qnode(struct qspinlock *lock, int val)
> > +{
> > +	int cpu =3D get_tail_cpu(val);
> > +	struct qnodes *qnodesp =3D per_cpu_ptr(&qnodes, cpu);
> > +	int idx;
> > +
> > +	for (idx =3D 0; idx < MAX_NODES; idx++) {
> > +		struct qnode *qnode =3D &qnodesp->nodes[idx];
> > +		if (qnode->lock =3D=3D lock)
> > +			return qnode;
> > +	}
>
> In case anyone else is confused by this, Nick explained each cpu can only=
 queue on a unique spinlock once regardless of "idx" level.
>
> > +
> > +	BUG();
> > +}
> > +
> > +static inline void queued_spin_lock_mcs_queue(struct qspinlock *lock)
> > +{
> > +	struct qnodes *qnodesp;
> > +	struct qnode *next, *node;
> > +	int val, old, tail;
> > +	int idx;
> > +
> > +	BUILD_BUG_ON(CONFIG_NR_CPUS >=3D (1U << _Q_TAIL_CPU_BITS));
> > +
> > +	qnodesp =3D this_cpu_ptr(&qnodes);
> > +	if (unlikely(qnodesp->count =3D=3D MAX_NODES)) {
>
> The comparison is >=3D in the generic, I guess we've no nested NMI so thi=
s is safe?

No... we could have nested NMI so this is wrong, good catch.

Thanks,
Nick
