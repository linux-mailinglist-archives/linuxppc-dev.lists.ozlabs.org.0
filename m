Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E16E624194
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Nov 2022 12:39:18 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N7KcN0YTnz3f4h
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Nov 2022 22:39:16 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=WZmAY3qf;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42b; helo=mail-pf1-x42b.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=WZmAY3qf;
	dkim-atps=neutral
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N7KbC6Hffz3f5H
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Nov 2022 22:38:15 +1100 (AEDT)
Received: by mail-pf1-x42b.google.com with SMTP id y13so1771529pfp.7
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Nov 2022 03:38:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oN/jPo2+KtFhXSBq3DAzgf04zshbxssLYFKHGmi/14o=;
        b=WZmAY3qfpfyyZQb4D4gvOd3XTRvhpCvSllP65L1ZQbWmSl99tNhdfBnvezwZYJytY+
         y6S9SlSLXV7mBJLgaIFPkA7GsjV6T0/BeEUpcNUu75vPsPvEWPQaL6CXnOwKkHBouKln
         jLswdE2Ui/xx1b4J2S1WIWrsDkbiMbRP1JQLB98u6fcUW91YcJFvIWYMTtfLwqagdSPl
         Q1PPsJxRqwX2ltcdfGMVYUwnqt8vWIuYHPi+Zth/oUm7HGDQ7DHGtj/JqDzY9xDhBp0o
         LbVULZ6RszCbsLv9fwmaCL4EIBm/b7Cyv1IrZ8FzYzS7FMTVyNOwAf1K+1VrVdszGpEa
         xDEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oN/jPo2+KtFhXSBq3DAzgf04zshbxssLYFKHGmi/14o=;
        b=ofcOW+XhhEfPhTbdt50ojDI9x/QSw+55ua5qe3a+PeNxS0AJ9pawZ3b+UNoyq+qo5/
         dYWRR7Y0iir7CvpWwYn/zj8wcBlMIleytZi7dRbSRsRit5q7XJM5PGca/wcJVzlUV3+u
         cwcdnW634WV7GlcEdjOdE7AQVBIXVczAgdC/XMEPzRCNdX66RRh/e8gHWvTJdNxeleJ+
         EWEZU8JGwOCVxI/huFJnx9vEaEo7dKOVElQ+rUhzpgT/5X6Xi2jQzL4WZtHe+q7MjOd7
         HJnq8/dr3tL4tESXgEJ1PhZc+q7TNdqwdrHuYqj+rzDKIb8/mk7svDAqFPwnwlMGX7L/
         teDQ==
X-Gm-Message-State: ACrzQf1N4dhMJxhLZ918TDVuP0NLQHD9UtxPkOkF+JkTLHDD99UYDAfq
	WBiooNJD1P8Qvo+yQrckQlwSjJYu75w=
X-Google-Smtp-Source: AMsMyM7rQFYbnVoHJp0/zJjkq4hPy682Go6wmzbTTiy6emDVYFjaUBPVzxQvkrGfsot+cr2pNI1jdQ==
X-Received: by 2002:a63:ce02:0:b0:440:3cc0:c062 with SMTP id y2-20020a63ce02000000b004403cc0c062mr2356410pgf.10.1668080287367;
        Thu, 10 Nov 2022 03:38:07 -0800 (PST)
Received: from localhost (61-68-184-43.tpgi.com.au. [61.68.184.43])
        by smtp.gmail.com with ESMTPSA id t8-20020a170902e84800b001785fa792f4sm11106258plg.243.2022.11.10.03.38.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Nov 2022 03:38:06 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 10 Nov 2022 21:38:02 +1000
Message-Id: <CO8L3YUSJ1HW.236EC6T4G0X5D@bobo>
Subject: Re: [PATCH 16/17] powerpc/qspinlock: allow indefinite spinning on a
 preempted owner
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Jordan Niethe" <jniethe5@gmail.com>, <linuxppc-dev@lists.ozlabs.org>
X-Mailer: aerc 0.13.0
References: <20220728063120.2867508-1-npiggin@gmail.com>
 <20220728063120.2867508-18-npiggin@gmail.com>
 <6307bef2943054255d5241d41efd218a4f487194.camel@gmail.com>
In-Reply-To: <6307bef2943054255d5241d41efd218a4f487194.camel@gmail.com>
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
> > Provide an option that holds off queueing indefinitely while the lock
> > owner is preempted. This could reduce queueing latencies for very
> > overcommitted vcpu situations.
> >=20
> > This is disabled by default.
> > ---
> >  arch/powerpc/lib/qspinlock.c | 91 +++++++++++++++++++++++++++++++-----
> >  1 file changed, 79 insertions(+), 12 deletions(-)
> >=20
> > diff --git a/arch/powerpc/lib/qspinlock.c b/arch/powerpc/lib/qspinlock.=
c
> > index 24f68bd71e2b..5cfd69931e31 100644
> > --- a/arch/powerpc/lib/qspinlock.c
> > +++ b/arch/powerpc/lib/qspinlock.c
> > @@ -35,6 +35,7 @@ static int HEAD_SPINS __read_mostly =3D (1<<8);
> > =20
> >  static bool pv_yield_owner __read_mostly =3D true;
> >  static bool pv_yield_allow_steal __read_mostly =3D false;
> > +static bool pv_spin_on_preempted_owner __read_mostly =3D false;
> >  static bool pv_yield_prev __read_mostly =3D true;
> >  static bool pv_yield_propagate_owner __read_mostly =3D true;
> >  static bool pv_prod_head __read_mostly =3D false;
> > @@ -220,13 +221,15 @@ static struct qnode *get_tail_qnode(struct qspinl=
ock *lock, u32 val)
> >  	BUG();
> >  }
> > =20
> > -static __always_inline void __yield_to_locked_owner(struct qspinlock *=
lock, u32 val, bool paravirt, bool clear_mustq)
> > +static __always_inline void __yield_to_locked_owner(struct qspinlock *=
lock, u32 val, bool paravirt, bool clear_mustq, bool *preempted)
> >  {
> >  	int owner;
> >  	u32 yield_count;
> > =20
> >  	BUG_ON(!(val & _Q_LOCKED_VAL));
> > =20
> > +	*preempted =3D false;
> > +
> >  	if (!paravirt)
> >  		goto relax;
> > =20
> > @@ -241,6 +244,8 @@ static __always_inline void __yield_to_locked_owner=
(struct qspinlock *lock, u32
> > =20
> >  	spin_end();
> > =20
> > +	*preempted =3D true;
> > +
> >  	/*
> >  	 * Read the lock word after sampling the yield count. On the other si=
de
> >  	 * there may a wmb because the yield count update is done by the
> > @@ -265,14 +270,14 @@ static __always_inline void __yield_to_locked_own=
er(struct qspinlock *lock, u32
> >  	spin_cpu_relax();
> >  }
> > =20
> > -static __always_inline void yield_to_locked_owner(struct qspinlock *lo=
ck, u32 val, bool paravirt)
> > +static __always_inline void yield_to_locked_owner(struct qspinlock *lo=
ck, u32 val, bool paravirt, bool *preempted)
>
> It seems like preempted parameter could be the return value of
> yield_to_locked_owner(). Then callers that don't use the value returned i=
n
> preempted don't need to create an unnecessary variable to pass in.

That works.

Thanks,
Nick
