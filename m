Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BABFF636942
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Nov 2022 19:50:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NHVYk4g1cz2xkx
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Nov 2022 05:50:18 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=KXwH0hNg;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=srs0=/r7r=3x=paulmck-thinkpad-p17-gen-1.home=paulmck@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=KXwH0hNg;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NHVXm3JgXz2xB5
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Nov 2022 05:49:28 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 6576961E58;
	Wed, 23 Nov 2022 18:49:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0171C433C1;
	Wed, 23 Nov 2022 18:49:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669229363;
	bh=tpvlEXVPVrB+miTHtqT8cIbtziYEcqx5Ww1qZI/3neg=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=KXwH0hNgTZ/97NITPkaJAhYFCXOp3BpOSxxLwIxnrsX47LIoZ8ojAz9LcJo8luFp1
	 13ljGCIsXWrHXqNEYpxlP+ApCXN+fnI+lpT+z1YB6BBQ9hXnJwoyWFOuvBgtx8FvfM
	 IogRDtYPbGH3kiQCE/fU3fZ6qbB8PSJuk1OAk99hZG0k7eHjr/pxVjw0sAoZTywQdt
	 jcHh/S6ih6nizeAM7DSalk+68Lna6v0CRh4ccU4qk/Cwj4R0klz6uEIQEJSG/le4t0
	 uUMmt92mgJ0NOYpqInG14h9QTtvYcwXsgLnLVBr67e2bn9wyzEjnSj72vpeX2x0qHu
	 Aur6Iz3ADHV9g==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 5DD595C0A3F; Wed, 23 Nov 2022 10:49:23 -0800 (PST)
Date: Wed, 23 Nov 2022 10:49:23 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Zhouyi Zhou <zhouzhouyi@gmail.com>
Subject: Re: [PATCH linux-next][RFC]torture: avoid offline tick_do_timer_cpu
Message-ID: <20221123184923.GD4001@paulmck-ThinkPad-P17-Gen-1>
References: <20221121035140.118651-1-zhouzhouyi@gmail.com>
 <20221122013754.GY4001@paulmck-ThinkPad-P17-Gen-1>
 <CAABZP2z5CLJg4tabNwDMopiNZTZYGC++Z9w6ZOhhGrXQHGMGUA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAABZP2z5CLJg4tabNwDMopiNZTZYGC++Z9w6ZOhhGrXQHGMGUA@mail.gmail.com>
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
Reply-To: paulmck@kernel.org
Cc: dave@stgolabs.net, josh@joshtriplett.org, linux-kernel@vger.kernel.org, fweisbec@gmail.com, tglx@linutronix.de, linuxppc-dev@lists.ozlabs.org, mingo@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Nov 23, 2022 at 10:23:11AM +0800, Zhouyi Zhou wrote:
> On Tue, Nov 22, 2022 at 9:37 AM Paul E. McKenney <paulmck@kernel.org> wrote:
> >
> > On Mon, Nov 21, 2022 at 11:51:40AM +0800, Zhouyi Zhou wrote:
> > > During CPU-hotplug torture (CONFIG_NO_HZ_FULL=y), if we try to
> > > offline tick_do_timer_cpu, the operation will fail because in
> > > function tick_nohz_cpu_down:
> > > ```
> > > if (tick_nohz_full_running && tick_do_timer_cpu == cpu)
> > >       return -EBUSY;
> > > ```
> > > Above bug was first discovered in torture tests performed in PPC VM
> > > of Open Source Lab of Oregon State University, and reproducable in RISC-V
> > > and X86-64 (with additional kernel commandline cpu0_hotplug).
> > >
> > > In this patch, we avoid offline tick_do_timer_cpu by distribute
> > > the offlining cpu among remaining cpus.
> > >
> > > Signed-off-by: Zhouyi Zhou <zhouzhouyi@gmail.com>
> >
> > Good show chasing this down!
> Thank Paul for your guidance and encouragement!
> >
> > A couple of questions below.
> The answers below.
> >
> > > ---
> > >  include/linux/tick.h        |  1 +
> > >  kernel/time/tick-common.c   |  1 +
> > >  kernel/time/tick-internal.h |  1 -
> > >  kernel/torture.c            | 10 ++++++++++
> > >  4 files changed, 12 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/include/linux/tick.h b/include/linux/tick.h
> > > index bfd571f18cfd..23cc0b205853 100644
> > > --- a/include/linux/tick.h
> > > +++ b/include/linux/tick.h
> > > @@ -14,6 +14,7 @@
> > >  #include <linux/rcupdate.h>
> > >
> > >  #ifdef CONFIG_GENERIC_CLOCKEVENTS
> > > +extern int tick_do_timer_cpu __read_mostly;
> > >  extern void __init tick_init(void);
> > >  /* Should be core only, but ARM BL switcher requires it */
> > >  extern void tick_suspend_local(void);
> > > diff --git a/kernel/time/tick-common.c b/kernel/time/tick-common.c
> > > index 46789356f856..87b9b9afa320 100644
> > > --- a/kernel/time/tick-common.c
> > > +++ b/kernel/time/tick-common.c
> > > @@ -48,6 +48,7 @@ ktime_t tick_next_period;
> > >   *    procedure also covers cpu hotplug.
> > >   */
> > >  int tick_do_timer_cpu __read_mostly = TICK_DO_TIMER_BOOT;
> > > +EXPORT_SYMBOL_GPL(tick_do_timer_cpu);
> > >  #ifdef CONFIG_NO_HZ_FULL
> > >  /*
> > >   * tick_do_timer_boot_cpu indicates the boot CPU temporarily owns
> > > diff --git a/kernel/time/tick-internal.h b/kernel/time/tick-internal.h
> > > index 649f2b48e8f0..8953dca10fdd 100644
> > > --- a/kernel/time/tick-internal.h
> > > +++ b/kernel/time/tick-internal.h
> > > @@ -15,7 +15,6 @@
> > >
> > >  DECLARE_PER_CPU(struct tick_device, tick_cpu_device);
> > >  extern ktime_t tick_next_period;
> > > -extern int tick_do_timer_cpu __read_mostly;
> > >
> > >  extern void tick_setup_periodic(struct clock_event_device *dev, int broadcast);
> > >  extern void tick_handle_periodic(struct clock_event_device *dev);
> > > diff --git a/kernel/torture.c b/kernel/torture.c
> > > index 789aeb0e1159..bccbdd33dda2 100644
> > > --- a/kernel/torture.c
> > > +++ b/kernel/torture.c
> > > @@ -33,6 +33,7 @@
> > >  #include <linux/delay.h>
> > >  #include <linux/stat.h>
> > >  #include <linux/slab.h>
> > > +#include <linux/tick.h>
> > >  #include <linux/trace_clock.h>
> > >  #include <linux/ktime.h>
> > >  #include <asm/byteorder.h>
> > > @@ -358,7 +359,16 @@ torture_onoff(void *arg)
> > >                       schedule_timeout_interruptible(HZ / 10);
> > >                       continue;
> > >               }
> > > +#ifdef CONFIG_NO_HZ_FULL
> > > +             /* do not offline tick do timer cpu */
> > > +             if (tick_nohz_full_running) {
> > > +                     cpu = (torture_random(&rand) >> 4) % maxcpu;
> > > +                     if (cpu >= tick_do_timer_cpu)
> >
> > Why is this ">=" instead of "=="?
> I use probability theory here to let the remaining cpu distribute evenly.
> Example:
> we have cpus: 0 1 2 3 4 5 6 7
> maxcpu = 7
> tick_do_timer_cpu = 2
> remaining cpus are: 0 1 3 4 5 6 7
> if the offline cpu candidate is 2, then the result cpu is 2+1
> else if the offline cpu candidate is 3, then the result cpu is 3+1
> ...
> else if the offline cpu candidate is 6, then the result cpu is 6+1
> >
> > > +                             cpu = (cpu + 1) % (maxcpu + 1);
> we could just use cpu = cpu + 1 here

But won't this get you double the occurrences of CPU 0 compared to the
other non-tick_do_timer_cpu CPUs?  You might get CPU 0 directly from
torture_random(), or torture_random() might have given you CPU 7, which
then wraps to CPU 0.

What am I missing here?

> > > +             } else
> > > +#else
> > >               cpu = (torture_random(&rand) >> 4) % (maxcpu + 1);
> > > +#endif
> >
> > What happens if the value of tick_do_timer_cpu changes between the time of
> > the check above and the call to torture_offline() below?  Alternatively,
> > how is such a change in value prevented?
> I did a preliminary research about the above question, this is quite
> complicated for me
> (because I think I must not bring locks to kernel just because our
> test frame need them),

Agreed, it would be good to avoid added locks.

> Please give me some days to perform intensive research.

No problem, in fact, please do take the time you need for this.
As you say, it is not as simple as one might think.

							Thanx, Paul

> Thanks again
> Cheers
> Zhouyi
> >
> >                                                         Thanx, Paul
> >
> > >               if (!torture_offline(cpu,
> > >                                    &n_offline_attempts, &n_offline_successes,
> > >                                    &sum_offline, &min_offline, &max_offline))
> > > --
> > > 2.34.1
> > >
