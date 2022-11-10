Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DF1D5624179
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Nov 2022 12:33:52 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N7KV65fR5z3cMw
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Nov 2022 22:33:50 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=SdPgTJN7;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62b; helo=mail-pl1-x62b.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=SdPgTJN7;
	dkim-atps=neutral
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N7KTD3C4Vz3cGH
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Nov 2022 22:33:02 +1100 (AEDT)
Received: by mail-pl1-x62b.google.com with SMTP id k7so1186443pll.6
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Nov 2022 03:33:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SVeZJ8EPpNSKTMR9MDyThdbldktq5sCjAJwj2StUOuE=;
        b=SdPgTJN7yh/qC9xHBdfJhT9UunhxT2Z+so6YcPPX1E96dwGjPkHXAkZ5EDNnkSuNOg
         4lOFdepicl0NSykf4gQypkHmchjcRMwiLS8IogNmX2dWe4YNs3MpsTXOS6JH3usYtUhu
         J2h7AYRnFH6RiyVOBax/9spzKwYyEoQ1GJqqqHTcsXroPiU3BgZfaLutBoHd1LWEiLlv
         +i6jfbpxYC6rxMpTS02Bbyfa/C12KbFWIrof/Dp9klxQUVbVM4JYmvw+5SYB9ARY86aj
         buU3Y2u85Jsvjsej8bdYFVcJspu2iUhY/UQ8EL6IK4lqcW41/J1f/TiTOisAsYYChcqT
         59Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SVeZJ8EPpNSKTMR9MDyThdbldktq5sCjAJwj2StUOuE=;
        b=CJiAh/PBC8SflVe6pYL/2E0IWphd1nfEEgH6y0bDYAoAEv/GMqiyoGq3Y1lW5f6Q/9
         J6UayLyOc0/TUzz+XS1vKiAdQ5FwP2sB7Q7zegPRjlNeGQJ57wYf4yzAnYgphN1oubH2
         Deu0j5F6nYpr4IjZC9/MXRFyiTlacp9pX0Nvef+M3GZtkjdvuzEEGw+ouFsPrMo0TU78
         Zz0UObUJhP+YjjK2A+NMuJ0gJ+49rIp2ZcqVkFKgZCHetMG2Pgdkv/GYSZ3hm59H7j16
         nO5rgGTVwwwbziLYGsHJu2pu85fcmmi+tubsNMkpBDebLB6TQvFVq07VhluHiHJzsIE3
         n3zw==
X-Gm-Message-State: ACrzQf0y4lLmN04891dVDNwXVG5iTdgUgfbQBGLFChOsYMnygv8toD1a
	KfjGLx/0wgt5RUk9wbWe+r6xk5CH2Ho=
X-Google-Smtp-Source: AMsMyM5EXKCkYGd7l+IyiiswfoZrJsgkrEU5CUAjzNb0+EsMu48SR67tpsqeg5fp40Yglu6Zh//4Gg==
X-Received: by 2002:a17:90b:3605:b0:213:c5ae:55ec with SMTP id ml5-20020a17090b360500b00213c5ae55ecmr1271014pjb.182.1668079980447;
        Thu, 10 Nov 2022 03:33:00 -0800 (PST)
Received: from localhost (61-68-184-43.tpgi.com.au. [61.68.184.43])
        by smtp.gmail.com with ESMTPSA id p11-20020a17090a284b00b002135de3013fsm2865628pjf.32.2022.11.10.03.32.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Nov 2022 03:32:59 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 10 Nov 2022 21:32:51 +1000
Message-Id: <CO8KZZQPJK2P.YZYOEHAU4LYL@bobo>
Subject: Re: [PATCH 12/17] powerpc/qspinlock: add ability to prod new queue
 head CPU
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Jordan Niethe" <jniethe5@gmail.com>, <linuxppc-dev@lists.ozlabs.org>
X-Mailer: aerc 0.13.0
References: <20220728063120.2867508-1-npiggin@gmail.com>
 <20220728063120.2867508-14-npiggin@gmail.com>
 <d3a58bf7b022c906d370fbb10ab6f14fb31d1c3d.camel@gmail.com>
In-Reply-To: <d3a58bf7b022c906d370fbb10ab6f14fb31d1c3d.camel@gmail.com>
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
> > After the head of the queue acquires the lock, it releases the
> > next waiter in the queue to become the new head. Add an option
> > to prod the new head if its vCPU was preempted. This may only
> > have an effect if queue waiters are yielding.
> >=20
> > Disable this option by default for now, i.e., no logical change.
> > ---
> >  arch/powerpc/lib/qspinlock.c | 29 ++++++++++++++++++++++++++++-
> >  1 file changed, 28 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/arch/powerpc/lib/qspinlock.c b/arch/powerpc/lib/qspinlock.=
c
> > index 28c85a2d5635..3b10e31bcf0a 100644
> > --- a/arch/powerpc/lib/qspinlock.c
> > +++ b/arch/powerpc/lib/qspinlock.c
> > @@ -12,6 +12,7 @@
> >  struct qnode {
> >  	struct qnode	*next;
> >  	struct qspinlock *lock;
> > +	int		cpu;
> >  	int		yield_cpu;
> >  	u8		locked; /* 1 if lock acquired */
> >  };
> > @@ -30,6 +31,7 @@ static bool pv_yield_owner __read_mostly =3D true;
> >  static bool pv_yield_allow_steal __read_mostly =3D false;
> >  static bool pv_yield_prev __read_mostly =3D true;
> >  static bool pv_yield_propagate_owner __read_mostly =3D true;
> > +static bool pv_prod_head __read_mostly =3D false;
> > =20
> >  static DEFINE_PER_CPU_ALIGNED(struct qnodes, qnodes);
> > =20
> > @@ -392,6 +394,7 @@ static __always_inline void queued_spin_lock_mcs_qu=
eue(struct qspinlock *lock, b
> >  	node =3D &qnodesp->nodes[idx];
> >  	node->next =3D NULL;
> >  	node->lock =3D lock;
> > +	node->cpu =3D smp_processor_id();
>
> I suppose this could be used in some other places too.
>
> For example change:
> 	yield_to_prev(lock, node, prev, paravirt);
>
> In yield_to_prev() it could then access the prev->cpu.

That case is a bit iffy. As soon as we WRITE_ONCE to prev, the prev lock
holder can go away. It's a statically allocated array and per-CPU so it
should actually give us the right value even if that CPU queued on some
other lock again, but I think it's more straightforward just to not
touch it after that point. This is also a remote and hot cache line, so
avoiding any loads on it is nice (we have the store, but you don't have
to wait for those), and we already have val.

Thanks,
Nick
