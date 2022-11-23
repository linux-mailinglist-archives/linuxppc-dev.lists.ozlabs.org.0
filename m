Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E280A634DCB
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Nov 2022 03:24:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NH4h25xNNz3dvn
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Nov 2022 13:24:18 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=LJY60C9h;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::636; helo=mail-pl1-x636.google.com; envelope-from=zhouzhouyi@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=LJY60C9h;
	dkim-atps=neutral
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NH4g1601Rz3cMw
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Nov 2022 13:23:24 +1100 (AEDT)
Received: by mail-pl1-x636.google.com with SMTP id p12so15408426plq.4
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Nov 2022 18:23:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=MhsEomGEcHS0ITrqbixOcvOCHqtbhvqSM8S3bsVjuhw=;
        b=LJY60C9hm82Ajktbt56J964gyIfZ54hQakqP+9JsoTzhGcASSBupESEzfFhC1ztM2s
         HiL53/9c/jaw0PF9LDHlu1OHxtZ2zagtdcaTeGlcX8TOV3lPjekZupUIO/wpULT7kaSl
         mbMKtQWl6b3azlYxFblm+q1LmMXohPIsnCVnd32al1eRsrrMQiEFVe3ADMw2hy8agotb
         nRcNg3zkbYFf/w5Nlc/4VEKUYEu/hebU4TbfMGgCe8p5AmeG+YsSCzYCLWe/2OD//+nv
         pJr2gzQe/jsJiCFB3Ev7gSgUq58EUZcR/M5Xn0R/pbnBVn70C58QPMrcHmBOp1LwiV5s
         +VTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MhsEomGEcHS0ITrqbixOcvOCHqtbhvqSM8S3bsVjuhw=;
        b=mYP/B+9t6hZQRKJGg7QPT07YBe0gurd0QXSJ2Bw9klRAt5g4OU++xf2BbmUL2hH4uE
         q26hp5P/clwSwXu1YcHgsnmvJMcCh+1Q0b9Pu1e4FAjOUdoWqe9WD7q+2LQAjNI3tA7P
         Nh0nUOHoUjKyaxc4OHEwvH/yuGsnF+KGa1a1bJs8bvT0bmhlJIBu3aVxeykUwQ921GZw
         HSlWTBG7HFM0r7QX6/WZt/iLIjU540HGhcE1GHqaKQJIvR5Sh2dIkua1A7sro5+VTXvA
         zlLHh8Qg/NYZboDPLzQXkMUdkacHnVIprP1w1QZSgPVV41O1+SgiKMVqzm1krxOZLRY4
         R9AA==
X-Gm-Message-State: ANoB5plfA/NnbPpFuOipwb7KTvYKamEI1DrAoX+JNyYivSVNv7EmmV1G
	0lagoRmMUBdWQrkgWTIHqLhkbl/O7KA3xTbFG2Q=
X-Google-Smtp-Source: AA0mqf5DzRfWvrQG/Bl7rr76l1lOWBNm9IPBe18oEPOXIHBRs4mQ59hc13n+lkHpHP9XCgc3CCVrsr6dKZEPIGA4J0Y=
X-Received: by 2002:a17:90a:9403:b0:218:6a4e:e44a with SMTP id
 r3-20020a17090a940300b002186a4ee44amr29392875pjo.6.1669170202991; Tue, 22 Nov
 2022 18:23:22 -0800 (PST)
MIME-Version: 1.0
References: <20221121035140.118651-1-zhouzhouyi@gmail.com> <20221122013754.GY4001@paulmck-ThinkPad-P17-Gen-1>
In-Reply-To: <20221122013754.GY4001@paulmck-ThinkPad-P17-Gen-1>
From: Zhouyi Zhou <zhouzhouyi@gmail.com>
Date: Wed, 23 Nov 2022 10:23:11 +0800
Message-ID: <CAABZP2z5CLJg4tabNwDMopiNZTZYGC++Z9w6ZOhhGrXQHGMGUA@mail.gmail.com>
Subject: Re: [PATCH linux-next][RFC]torture: avoid offline tick_do_timer_cpu
To: paulmck@kernel.org
Content-Type: text/plain; charset="UTF-8"
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
Cc: dave@stgolabs.net, josh@joshtriplett.org, linux-kernel@vger.kernel.org, fweisbec@gmail.com, tglx@linutronix.de, linuxppc-dev@lists.ozlabs.org, mingo@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Nov 22, 2022 at 9:37 AM Paul E. McKenney <paulmck@kernel.org> wrote:
>
> On Mon, Nov 21, 2022 at 11:51:40AM +0800, Zhouyi Zhou wrote:
> > During CPU-hotplug torture (CONFIG_NO_HZ_FULL=y), if we try to
> > offline tick_do_timer_cpu, the operation will fail because in
> > function tick_nohz_cpu_down:
> > ```
> > if (tick_nohz_full_running && tick_do_timer_cpu == cpu)
> >       return -EBUSY;
> > ```
> > Above bug was first discovered in torture tests performed in PPC VM
> > of Open Source Lab of Oregon State University, and reproducable in RISC-V
> > and X86-64 (with additional kernel commandline cpu0_hotplug).
> >
> > In this patch, we avoid offline tick_do_timer_cpu by distribute
> > the offlining cpu among remaining cpus.
> >
> > Signed-off-by: Zhouyi Zhou <zhouzhouyi@gmail.com>
>
> Good show chasing this down!
Thank Paul for your guidance and encouragement!
>
> A couple of questions below.
The answers below.
>
> > ---
> >  include/linux/tick.h        |  1 +
> >  kernel/time/tick-common.c   |  1 +
> >  kernel/time/tick-internal.h |  1 -
> >  kernel/torture.c            | 10 ++++++++++
> >  4 files changed, 12 insertions(+), 1 deletion(-)
> >
> > diff --git a/include/linux/tick.h b/include/linux/tick.h
> > index bfd571f18cfd..23cc0b205853 100644
> > --- a/include/linux/tick.h
> > +++ b/include/linux/tick.h
> > @@ -14,6 +14,7 @@
> >  #include <linux/rcupdate.h>
> >
> >  #ifdef CONFIG_GENERIC_CLOCKEVENTS
> > +extern int tick_do_timer_cpu __read_mostly;
> >  extern void __init tick_init(void);
> >  /* Should be core only, but ARM BL switcher requires it */
> >  extern void tick_suspend_local(void);
> > diff --git a/kernel/time/tick-common.c b/kernel/time/tick-common.c
> > index 46789356f856..87b9b9afa320 100644
> > --- a/kernel/time/tick-common.c
> > +++ b/kernel/time/tick-common.c
> > @@ -48,6 +48,7 @@ ktime_t tick_next_period;
> >   *    procedure also covers cpu hotplug.
> >   */
> >  int tick_do_timer_cpu __read_mostly = TICK_DO_TIMER_BOOT;
> > +EXPORT_SYMBOL_GPL(tick_do_timer_cpu);
> >  #ifdef CONFIG_NO_HZ_FULL
> >  /*
> >   * tick_do_timer_boot_cpu indicates the boot CPU temporarily owns
> > diff --git a/kernel/time/tick-internal.h b/kernel/time/tick-internal.h
> > index 649f2b48e8f0..8953dca10fdd 100644
> > --- a/kernel/time/tick-internal.h
> > +++ b/kernel/time/tick-internal.h
> > @@ -15,7 +15,6 @@
> >
> >  DECLARE_PER_CPU(struct tick_device, tick_cpu_device);
> >  extern ktime_t tick_next_period;
> > -extern int tick_do_timer_cpu __read_mostly;
> >
> >  extern void tick_setup_periodic(struct clock_event_device *dev, int broadcast);
> >  extern void tick_handle_periodic(struct clock_event_device *dev);
> > diff --git a/kernel/torture.c b/kernel/torture.c
> > index 789aeb0e1159..bccbdd33dda2 100644
> > --- a/kernel/torture.c
> > +++ b/kernel/torture.c
> > @@ -33,6 +33,7 @@
> >  #include <linux/delay.h>
> >  #include <linux/stat.h>
> >  #include <linux/slab.h>
> > +#include <linux/tick.h>
> >  #include <linux/trace_clock.h>
> >  #include <linux/ktime.h>
> >  #include <asm/byteorder.h>
> > @@ -358,7 +359,16 @@ torture_onoff(void *arg)
> >                       schedule_timeout_interruptible(HZ / 10);
> >                       continue;
> >               }
> > +#ifdef CONFIG_NO_HZ_FULL
> > +             /* do not offline tick do timer cpu */
> > +             if (tick_nohz_full_running) {
> > +                     cpu = (torture_random(&rand) >> 4) % maxcpu;
> > +                     if (cpu >= tick_do_timer_cpu)
>
> Why is this ">=" instead of "=="?
I use probability theory here to let the remaining cpu distribute evenly.
Example:
we have cpus: 0 1 2 3 4 5 6 7
maxcpu = 7
tick_do_timer_cpu = 2
remaining cpus are: 0 1 3 4 5 6 7
if the offline cpu candidate is 2, then the result cpu is 2+1
else if the offline cpu candidate is 3, then the result cpu is 3+1
...
else if the offline cpu candidate is 6, then the result cpu is 6+1
>
> > +                             cpu = (cpu + 1) % (maxcpu + 1);
we could just use cpu = cpu + 1 here
> > +             } else
> > +#else
> >               cpu = (torture_random(&rand) >> 4) % (maxcpu + 1);
> > +#endif
>
> What happens if the value of tick_do_timer_cpu changes between the time of
> the check above and the call to torture_offline() below?  Alternatively,
> how is such a change in value prevented?
I did a preliminary research about the above question, this is quite
complicated for me
(because I think I must not bring locks to kernel just because our
test frame need them),
Please give me some days to perform intensive research.

Thanks again
Cheers
Zhouyi
>
>                                                         Thanx, Paul
>
> >               if (!torture_offline(cpu,
> >                                    &n_offline_attempts, &n_offline_successes,
> >                                    &sum_offline, &min_offline, &max_offline))
> > --
> > 2.34.1
> >
