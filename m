Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B9F8749728
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jul 2023 10:14:03 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=ebgLCz/p;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QxTnj1txrz3bpp
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jul 2023 18:14:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=ebgLCz/p;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::236; helo=mail-oi1-x236.google.com; envelope-from=zhouzhouyi@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com [IPv6:2607:f8b0:4864:20::236])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QxTms1cSPz30XZ
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Jul 2023 18:13:16 +1000 (AEST)
Received: by mail-oi1-x236.google.com with SMTP id 5614622812f47-3a0423ea749so457959b6e.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 06 Jul 2023 01:13:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688631193; x=1691223193;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pgG4Ij8rmZfqMBm2oqM6Ju2PS6yYhcktMwLW4JNMQGU=;
        b=ebgLCz/pKdH6r29bkq3wNtiOBu92/5gohz0mqsiCkHyMfi9lqkaYS6l2h2dj3IY8IG
         uqi1S0meqlthR7q73+9Ph6hHlgauiN6eAQ7kzDWh+t9MlC8bm1LhP4UMaktOWBF5Nhp0
         B6rmppTNSLgqixTmuTcHUmerHy57ZJxJj7JtHA8Rp31qItNVGXrDkXwBLezXO6QA2Ym+
         c7Y0NNz4pfUqtskpVYMeY1xLimF7Vw6ukLPyzNIptcaF2r4EQKe7/n+A7fi1bfCoB7GA
         2QBjmjOo2mNeLd8ez3jgLlo7e7sV+9Ru+jOwHQMZvl0b2zDagYmSbWa1RfG8C2Ite883
         4pmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688631193; x=1691223193;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pgG4Ij8rmZfqMBm2oqM6Ju2PS6yYhcktMwLW4JNMQGU=;
        b=ky7SAffHRTph7jw9xnuXhLC5xeuEsQe69LNfnr2yAZ2LfNXgMsikKgsruOgT5lqJFe
         ZtvBonNaRqgLNdPGOq1iUnsjh2N+/2JEt7HxHPQUmxjThuGemKQTYHMi0POZk2cUWfcS
         25/kUaBkyWR7uSoUZRUzMjY9+lPwKTdzBTP/sWsC+0EOFF0wCKELYdUu25jtCxk+WRi6
         nwL0gdTixFGggIRpXThsNzZxh9NFXkwS1SZhJlNydSzoKvva5yCmjF2hek8fg1tmbXWo
         gMp9YgR/7OQX9IdFDPRHCz46SU7VRx23pz1Jy8Yn5gc4Qq7vbsQuyKQU+o983j7lg71g
         hdwQ==
X-Gm-Message-State: ABy/qLZ+dNG6CNLU0vk1Iqyn3/JwJ968Tttmygyes9ZhZ7xIRxEbqdwS
	NQGyKPTx943JWHgTvkjRZs5iBccfLoaf55MYaN4=
X-Google-Smtp-Source: APBJJlEAKaFoLQ8q7jFdrQL2wgxZy73QnBJRgt25CMlyiYgd/cJg7/tYNqZpKrm9uEMQbnYiLrnmzqj57EhTmxYtRCM=
X-Received: by 2002:aca:2b04:0:b0:3a3:6ae3:bd9 with SMTP id
 i4-20020aca2b04000000b003a36ae30bd9mr923814oik.55.1688631192886; Thu, 06 Jul
 2023 01:13:12 -0700 (PDT)
MIME-Version: 1.0
References: <20221121035140.118651-1-zhouzhouyi@gmail.com> <efd3ac99-d406-fc45-60e1-73eb8bce4c67@csgroup.eu>
In-Reply-To: <efd3ac99-d406-fc45-60e1-73eb8bce4c67@csgroup.eu>
From: Zhouyi Zhou <zhouzhouyi@gmail.com>
Date: Thu, 6 Jul 2023 16:13:01 +0800
Message-ID: <CAABZP2x5H3VQXe3o+Q-ar-o2VO=yLap0WGA0JFWK+U2=rdH53A@mail.gmail.com>
Subject: Re: [PATCH linux-next][RFC]torture: avoid offline tick_do_timer_cpu
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: "dave@stgolabs.net" <dave@stgolabs.net>, "paulmck@kernel.org" <paulmck@kernel.org>, "fweisbec@gmail.com" <fweisbec@gmail.com>, "josh@joshtriplett.org" <josh@joshtriplett.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "tglx@linutronix.de" <tglx@linutronix.de>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "mingo@kernel.org" <mingo@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jul 6, 2023 at 3:09=E2=80=AFPM Christophe Leroy
<christophe.leroy@csgroup.eu> wrote:
>
>
>
> Le 21/11/2022 =C3=A0 04:51, Zhouyi Zhou a =C3=A9crit :
> > During CPU-hotplug torture (CONFIG_NO_HZ_FULL=3Dy), if we try to
> > offline tick_do_timer_cpu, the operation will fail because in
> > function tick_nohz_cpu_down:
> > ```
> > if (tick_nohz_full_running && tick_do_timer_cpu =3D=3D cpu)
> >        return -EBUSY;
> > ```
> > Above bug was first discovered in torture tests performed in PPC VM
> > of Open Source Lab of Oregon State University, and reproducable in RISC=
-V
> > and X86-64 (with additional kernel commandline cpu0_hotplug).
> >
> > In this patch, we avoid offline tick_do_timer_cpu by distribute
> > the offlining cpu among remaining cpus.
> >
> > Signed-off-by: Zhouyi Zhou <zhouzhouyi@gmail.com>
> > ---
> >   include/linux/tick.h        |  1 +
> >   kernel/time/tick-common.c   |  1 +
> >   kernel/time/tick-internal.h |  1 -
> >   kernel/torture.c            | 10 ++++++++++
> >   4 files changed, 12 insertions(+), 1 deletion(-)
> >
> > diff --git a/include/linux/tick.h b/include/linux/tick.h
> > index bfd571f18cfd..23cc0b205853 100644
> > --- a/include/linux/tick.h
> > +++ b/include/linux/tick.h
> > @@ -14,6 +14,7 @@
> >   #include <linux/rcupdate.h>
> >
> >   #ifdef CONFIG_GENERIC_CLOCKEVENTS
> > +extern int tick_do_timer_cpu __read_mostly;
> >   extern void __init tick_init(void);
> >   /* Should be core only, but ARM BL switcher requires it */
> >   extern void tick_suspend_local(void);
> > diff --git a/kernel/time/tick-common.c b/kernel/time/tick-common.c
> > index 46789356f856..87b9b9afa320 100644
> > --- a/kernel/time/tick-common.c
> > +++ b/kernel/time/tick-common.c
> > @@ -48,6 +48,7 @@ ktime_t tick_next_period;
> >    *    procedure also covers cpu hotplug.
> >    */
> >   int tick_do_timer_cpu __read_mostly =3D TICK_DO_TIMER_BOOT;
> > +EXPORT_SYMBOL_GPL(tick_do_timer_cpu);
> >   #ifdef CONFIG_NO_HZ_FULL
> >   /*
> >    * tick_do_timer_boot_cpu indicates the boot CPU temporarily owns
> > diff --git a/kernel/time/tick-internal.h b/kernel/time/tick-internal.h
> > index 649f2b48e8f0..8953dca10fdd 100644
> > --- a/kernel/time/tick-internal.h
> > +++ b/kernel/time/tick-internal.h
> > @@ -15,7 +15,6 @@
> >
> >   DECLARE_PER_CPU(struct tick_device, tick_cpu_device);
> >   extern ktime_t tick_next_period;
> > -extern int tick_do_timer_cpu __read_mostly;
> >
> >   extern void tick_setup_periodic(struct clock_event_device *dev, int b=
roadcast);
> >   extern void tick_handle_periodic(struct clock_event_device *dev);
> > diff --git a/kernel/torture.c b/kernel/torture.c
> > index 789aeb0e1159..bccbdd33dda2 100644
> > --- a/kernel/torture.c
> > +++ b/kernel/torture.c
> > @@ -33,6 +33,7 @@
> >   #include <linux/delay.h>
> >   #include <linux/stat.h>
> >   #include <linux/slab.h>
> > +#include <linux/tick.h>
> >   #include <linux/trace_clock.h>
> >   #include <linux/ktime.h>
> >   #include <asm/byteorder.h>
> > @@ -358,7 +359,16 @@ torture_onoff(void *arg)
> >                       schedule_timeout_interruptible(HZ / 10);
> >                       continue;
> >               }
> > +#ifdef CONFIG_NO_HZ_FULL
> > +             /* do not offline tick do timer cpu */
> > +             if (tick_nohz_full_running) {
>
> Can you use fonction tick_nohz_full_enabled() instead and avoid the #ifde=
f ?
Thank Christophe for your wonderful advice, I will follow your advice
next time I prepare a patch.
For this false positive report, 58d766824264 ("tick/nohz: Fix
cpu_is_hotpluggable() by checking with nohz subsystem") has beaten me
in mainline.

Thanks again
Zhouyi
>
> > +                     cpu =3D (torture_random(&rand) >> 4) % maxcpu;
> > +                     if (cpu >=3D tick_do_timer_cpu)
> > +                             cpu =3D (cpu + 1) % (maxcpu + 1);
> > +             } else
> > +#else
> >               cpu =3D (torture_random(&rand) >> 4) % (maxcpu + 1);
> > +#endif
> >               if (!torture_offline(cpu,
> >                                    &n_offline_attempts, &n_offline_succ=
esses,
> >                                    &sum_offline, &min_offline, &max_off=
line))
