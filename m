Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D3960637082
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Nov 2022 03:37:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NHhwM5Hnmz3ccn
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Nov 2022 13:37:07 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=fmRPP/9+;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::534; helo=mail-pg1-x534.google.com; envelope-from=zhouzhouyi@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=fmRPP/9+;
	dkim-atps=neutral
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com [IPv6:2607:f8b0:4864:20::534])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NHhvK5lgmz3bjy
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Nov 2022 13:36:11 +1100 (AEDT)
Received: by mail-pg1-x534.google.com with SMTP id q1so416757pgl.11
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Nov 2022 18:36:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=IoZeOQle8hx3JAaTxBcRrnc25CuwWVzHGU38qnJStQo=;
        b=fmRPP/9+3dN0JjqTIm9g1c2B6Z3uU2JLKRr6oCsOAJDaFqJapGqXKHeM3FloJU5su1
         rCU0Te9003vii76XKW75jg2sBCrFenJNReHQphopTrxvy6Imjg+95LcMiUs/q0DenSG8
         b2HjkPCK88SiUMQFZRCqN6ZI1uL17bV3VMkjiIlNhlni6cToYMRAY44rJAh8q6dOakFP
         eTUe1hW/Zft470Js7MzB0vt1Xs+6TPsq8txALbOIuqPdjNmzoYA9gD3d3p2vsJNuE+fg
         p9LGNNAUaoDy9xA++VHQo4pmOSlcuFIniAkqdbqzy27Jmqi7YHF1L7qHiqnXBWSyCReg
         QMDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IoZeOQle8hx3JAaTxBcRrnc25CuwWVzHGU38qnJStQo=;
        b=sGamhHS8v91jdjnJevCXaGbzuqYre/1qCGmc4qOmFNf+YDSiIVO/TTRZfanre8LJbf
         NVdEd5WMNk7uq7ylpqQDGkQqzi5pjvlJWExm9DEYki1VTG1xfAe8jn7q+tst4jnG00Yu
         qY0d2ec2l4qeqUH7lc0JLR7doDAYDcLkOdUPdUM50rJ/VB7e4OiKU8+qq3piaSAWD/Jl
         240DZmkAKKe3IpAEYRA+Y9Kj4AZvEQWwTPvsAS5K5/kfKQv7ZhMCmCHpil3oSdaD7FY4
         A+Tbb27LlePpaj6v2wm4kOcJbwBBOdH5zhCzxUsCoNydAqC8MDtvMjQody1v85KfmNr1
         Me9A==
X-Gm-Message-State: ANoB5pmpN+qPPgy5dVVY2D/8sLjSGoRvCTMoRh6cNVamI9Xc9zC5eZGS
	m3p6Lwtw8IldtzRKG92/BYRrmn+i6NIJb4bTi0I=
X-Google-Smtp-Source: AA0mqf609wV9P/+NXIhdxfsUeDSb7iXSKvhV/GqyroV00aNt5S+48HISHVokOGCFJBZtrq8L2uREubX9J1armGQB4yQ=
X-Received: by 2002:a65:45ce:0:b0:44b:2928:f868 with SMTP id
 m14-20020a6545ce000000b0044b2928f868mr19438528pgr.384.1669257368783; Wed, 23
 Nov 2022 18:36:08 -0800 (PST)
MIME-Version: 1.0
References: <20221121035140.118651-1-zhouzhouyi@gmail.com> <20221122013754.GY4001@paulmck-ThinkPad-P17-Gen-1>
 <CAABZP2z5CLJg4tabNwDMopiNZTZYGC++Z9w6ZOhhGrXQHGMGUA@mail.gmail.com> <20221123184923.GD4001@paulmck-ThinkPad-P17-Gen-1>
In-Reply-To: <20221123184923.GD4001@paulmck-ThinkPad-P17-Gen-1>
From: Zhouyi Zhou <zhouzhouyi@gmail.com>
Date: Thu, 24 Nov 2022 10:35:57 +0800
Message-ID: <CAABZP2y8iXZ=H_gGWUSUZHb+sHayyE-HdHewKjN3vA7BfDguAw@mail.gmail.com>
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

On Thu, Nov 24, 2022 at 2:49 AM Paul E. McKenney <paulmck@kernel.org> wrote:
>
> On Wed, Nov 23, 2022 at 10:23:11AM +0800, Zhouyi Zhou wrote:
> > On Tue, Nov 22, 2022 at 9:37 AM Paul E. McKenney <paulmck@kernel.org> wrote:
> > >
> > > On Mon, Nov 21, 2022 at 11:51:40AM +0800, Zhouyi Zhou wrote:
> > > > During CPU-hotplug torture (CONFIG_NO_HZ_FULL=y), if we try to
> > > > offline tick_do_timer_cpu, the operation will fail because in
> > > > function tick_nohz_cpu_down:
> > > > ```
> > > > if (tick_nohz_full_running && tick_do_timer_cpu == cpu)
> > > >       return -EBUSY;
> > > > ```
> > > > Above bug was first discovered in torture tests performed in PPC VM
> > > > of Open Source Lab of Oregon State University, and reproducable in RISC-V
> > > > and X86-64 (with additional kernel commandline cpu0_hotplug).
> > > >
> > > > In this patch, we avoid offline tick_do_timer_cpu by distribute
> > > > the offlining cpu among remaining cpus.
> > > >
> > > > Signed-off-by: Zhouyi Zhou <zhouzhouyi@gmail.com>
> > >
> > > Good show chasing this down!
> > Thank Paul for your guidance and encouragement!
> > >
> > > A couple of questions below.
> > The answers below.
> > >
> > > > ---
> > > >  include/linux/tick.h        |  1 +
> > > >  kernel/time/tick-common.c   |  1 +
> > > >  kernel/time/tick-internal.h |  1 -
> > > >  kernel/torture.c            | 10 ++++++++++
> > > >  4 files changed, 12 insertions(+), 1 deletion(-)
> > > >
> > > > diff --git a/include/linux/tick.h b/include/linux/tick.h
> > > > index bfd571f18cfd..23cc0b205853 100644
> > > > --- a/include/linux/tick.h
> > > > +++ b/include/linux/tick.h
> > > > @@ -14,6 +14,7 @@
> > > >  #include <linux/rcupdate.h>
> > > >
> > > >  #ifdef CONFIG_GENERIC_CLOCKEVENTS
> > > > +extern int tick_do_timer_cpu __read_mostly;
> > > >  extern void __init tick_init(void);
> > > >  /* Should be core only, but ARM BL switcher requires it */
> > > >  extern void tick_suspend_local(void);
> > > > diff --git a/kernel/time/tick-common.c b/kernel/time/tick-common.c
> > > > index 46789356f856..87b9b9afa320 100644
> > > > --- a/kernel/time/tick-common.c
> > > > +++ b/kernel/time/tick-common.c
> > > > @@ -48,6 +48,7 @@ ktime_t tick_next_period;
> > > >   *    procedure also covers cpu hotplug.
> > > >   */
> > > >  int tick_do_timer_cpu __read_mostly = TICK_DO_TIMER_BOOT;
> > > > +EXPORT_SYMBOL_GPL(tick_do_timer_cpu);
> > > >  #ifdef CONFIG_NO_HZ_FULL
> > > >  /*
> > > >   * tick_do_timer_boot_cpu indicates the boot CPU temporarily owns
> > > > diff --git a/kernel/time/tick-internal.h b/kernel/time/tick-internal.h
> > > > index 649f2b48e8f0..8953dca10fdd 100644
> > > > --- a/kernel/time/tick-internal.h
> > > > +++ b/kernel/time/tick-internal.h
> > > > @@ -15,7 +15,6 @@
> > > >
> > > >  DECLARE_PER_CPU(struct tick_device, tick_cpu_device);
> > > >  extern ktime_t tick_next_period;
> > > > -extern int tick_do_timer_cpu __read_mostly;
> > > >
> > > >  extern void tick_setup_periodic(struct clock_event_device *dev, int broadcast);
> > > >  extern void tick_handle_periodic(struct clock_event_device *dev);
> > > > diff --git a/kernel/torture.c b/kernel/torture.c
> > > > index 789aeb0e1159..bccbdd33dda2 100644
> > > > --- a/kernel/torture.c
> > > > +++ b/kernel/torture.c
> > > > @@ -33,6 +33,7 @@
> > > >  #include <linux/delay.h>
> > > >  #include <linux/stat.h>
> > > >  #include <linux/slab.h>
> > > > +#include <linux/tick.h>
> > > >  #include <linux/trace_clock.h>
> > > >  #include <linux/ktime.h>
> > > >  #include <asm/byteorder.h>
> > > > @@ -358,7 +359,16 @@ torture_onoff(void *arg)
> > > >                       schedule_timeout_interruptible(HZ / 10);
> > > >                       continue;
> > > >               }
> > > > +#ifdef CONFIG_NO_HZ_FULL
> > > > +             /* do not offline tick do timer cpu */
> > > > +             if (tick_nohz_full_running) {
> > > > +                     cpu = (torture_random(&rand) >> 4) % maxcpu;
by examine the beginning code of torture_onoff, I see if we has 8
cpus, then maxcpu = 7 (not 8) here,
then cpu is distributed evenly among 0, 1, 2, 3, 4, 5, 6
if we happens to get 6, then cpu+1 below results in 7
> > > > +                     if (cpu >= tick_do_timer_cpu)
> > >
> > > Why is this ">=" instead of "=="?
> > I use probability theory here to let the remaining cpu distribute evenly.
> > Example:
> > we have cpus: 0 1 2 3 4 5 6 7
> > maxcpu = 7
> > tick_do_timer_cpu = 2
> > remaining cpus are: 0 1 3 4 5 6 7
> > if the offline cpu candidate is 2, then the result cpu is 2+1
> > else if the offline cpu candidate is 3, then the result cpu is 3+1
> > ...
> > else if the offline cpu candidate is 6, then the result cpu is 6+1
> > >
> > > > +                             cpu = (cpu + 1) % (maxcpu + 1);
> > we could just use cpu = cpu + 1 here
>
> But won't this get you double the occurrences of CPU 0 compared to the
> other non-tick_do_timer_cpu CPUs?  You might get CPU 0 directly from
> torture_random(), or torture_random() might have given you CPU 7, which
> then wraps to CPU 0.
I think torture_random won't give me CPU 7 as illustrated above,
my code is a little tricky, please correct me if I am wrong.
>
> What am I missing here?
>
> > > > +             } else
> > > > +#else
> > > >               cpu = (torture_random(&rand) >> 4) % (maxcpu + 1);
> > > > +#endif
> > >
> > > What happens if the value of tick_do_timer_cpu changes between the time of
> > > the check above and the call to torture_offline() below?  Alternatively,
> > > how is such a change in value prevented?
> > I did a preliminary research about the above question, this is quite
> > complicated for me
> > (because I think I must not bring locks to kernel just because our
> > test frame need them),
>
> Agreed, it would be good to avoid added locks.
>
> > Please give me some days to perform intensive research.
>
> No problem, in fact, please do take the time you need for this.
> As you say, it is not as simple as one might think.
Thanks Paul for your constant encouragement and guidance!
I improved a lot during the process of learning.

Cheers
Zhouyi
>
>                                                         Thanx, Paul
>
> > Thanks again
> > Cheers
> > Zhouyi
> > >
> > >                                                         Thanx, Paul
> > >
> > > >               if (!torture_offline(cpu,
> > > >                                    &n_offline_attempts, &n_offline_successes,
> > > >                                    &sum_offline, &min_offline, &max_offline))
> > > > --
> > > > 2.34.1
> > > >
