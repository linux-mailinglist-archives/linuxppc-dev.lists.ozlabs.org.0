Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F9875019D4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Apr 2022 19:15:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KfR1W2G6Cz3bky
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Apr 2022 03:15:43 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=EjJxbMqX;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org;
 envelope-from=srs0=6cnm=uy=paulmck-thinkpad-p17-gen-1.home=paulmck@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=EjJxbMqX; 
 dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KfR0t3TKvz2yw9
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Apr 2022 03:15:10 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5AF4F620EA;
 Thu, 14 Apr 2022 17:15:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5ECEC385A1;
 Thu, 14 Apr 2022 17:15:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649956506;
 bh=7i2l3BUOWJe3mUF9bY6cEdkjV+UfZsN+Rvm73tqWZYM=;
 h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
 b=EjJxbMqX5dxja9BuD9rg64rmCWyz/ATrWvA17CQggAVAw7biB+hLsOcsj7A9h2bjS
 AlwZIF9sTE7uPxNpGm094OlZFD6yOcHFaqKChfmYpa8UUs75M+RULMEYWnfcu5fapV
 hcLewpsFqH64Xl2vDE1Ebe85H00SOMMVOymXx6b4UzlVC/5FCvDfXP22wipohNrdlF
 eurx7myZYUdXBfRb20vQt00v46dkLdkiRVtLpaFhxOFspebZV6z7ZpUhulyOWTmTU4
 W+Rslaxz7jcLz1kX5fH+1D86mjwhn0G08F7OJ5YfexQmiGP4oYu3JjdCbTOcddEW/q
 3MNb6mJVkXomw==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
 id 5384A5C09CF; Thu, 14 Apr 2022 10:15:06 -0700 (PDT)
Date: Thu, 14 Apr 2022 10:15:06 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: Low-res tick handler device not going to ONESHOT_STOPPED when
 tick is stopped (was: rcu_sched self-detected stall on CPU)
Message-ID: <20220414171506.GP4285@paulmck-ThinkPad-P17-Gen-1>
References: <CANiq72k+5Rdj7i3Df2dcE6_OPYPXK3z5EWLKnY56sSMz4G3OvA@mail.gmail.com>
 <CAABZP2z64aYWfVSdXHaQopWc+BAbJJUGqtrju2iWER3DDTDFWg@mail.gmail.com>
 <20220406170012.GO4285@paulmck-ThinkPad-P17-Gen-1>
 <87pmls6nt7.fsf@mpe.ellerman.id.au>
 <87k0bz7i1s.fsf@mpe.ellerman.id.au>
 <1649818529.j46672mh2p.astroid@bobo.none>
 <1649829917.xni78o33uo.astroid@bobo.none>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1649829917.xni78o33uo.astroid@bobo.none>
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
Cc: frederic@kernel.org, Daniel Lezcano <daniel.lezcano@linaro.org>,
 linux-kernel@vger.kernel.org, rcu <rcu@vger.kernel.org>,
 Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 Viresh Kumar <viresh.kumar@linaro.org>, Zhouyi Zhou <zhouzhouyi@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Apr 13, 2022 at 04:10:02PM +1000, Nicholas Piggin wrote:
> Oops, fixed subject...
> 
> Excerpts from Nicholas Piggin's message of April 13, 2022 3:11 pm:
> > +Daniel, Thomas, Viresh
> > 
> > Subject: Re: rcu_sched self-detected stall on CPU
> > 
> > Excerpts from Michael Ellerman's message of April 9, 2022 12:42 am:
> >> Michael Ellerman <mpe@ellerman.id.au> writes:
> >>> "Paul E. McKenney" <paulmck@kernel.org> writes:
> >>>> On Wed, Apr 06, 2022 at 05:31:10PM +0800, Zhouyi Zhou wrote:
> >>>>> Hi
> >>>>> 
> >>>>> I can reproduce it in a ppc virtual cloud server provided by Oregon
> >>>>> State University.  Following is what I do:
> >>>>> 1) curl -l https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/snapshot/linux-5.18-rc1.tar.gz
> >>>>> -o linux-5.18-rc1.tar.gz
> >>>>> 2) tar zxf linux-5.18-rc1.tar.gz
> >>>>> 3) cp config linux-5.18-rc1/.config
> >>>>> 4) cd linux-5.18-rc1
> >>>>> 5) make vmlinux -j 8
> >>>>> 6) qemu-system-ppc64 -kernel vmlinux -nographic -vga none -no-reboot
> >>>>> -smp 2 (QEMU 4.2.1)
> >>>>> 7) after 12 rounds, the bug got reproduced:
> >>>>> (http://154.223.142.244/logs/20220406/qemu.log.txt)
> >>>>
> >>>> Just to make sure, are you both seeing the same thing?  Last I knew,
> >>>> Zhouyi was chasing an RCU-tasks issue that appears only in kernels
> >>>> built with CONFIG_PROVE_RCU=y, which Miguel does not have set.  Or did
> >>>> I miss something?
> >>>>
> >>>> Miguel is instead seeing an RCU CPU stall warning where RCU's grace-period
> >>>> kthread slept for three milliseconds, but did not wake up for more than
> >>>> 20 seconds.  This kthread would normally have awakened on CPU 1, but
> >>>> CPU 1 looks to me to be very unhealthy, as can be seen in your console
> >>>> output below (but maybe my idea of what is healthy for powerpc systems
> >>>> is outdated).  Please see also the inline annotations.
> >>>>
> >>>> Thoughts from the PPC guys?
> >>>
> >>> I haven't seen it in my testing. But using Miguel's config I can
> >>> reproduce it seemingly on every boot.
> >>>
> >>> For me it bisects to:
> >>>
> >>>   35de589cb879 ("powerpc/time: improve decrementer clockevent processing")
> >>>
> >>> Which seems plausible.
> >>>
> >>> Reverting that on mainline makes the bug go away.
> >>>
> >>> I don't see an obvious bug in the diff, but I could be wrong, or the old
> >>> code was papering over an existing bug?
> >>>
> >>> I'll try and work out what it is about Miguel's config that exposes
> >>> this vs our defconfig, that might give us a clue.
> >> 
> >> It's CONFIG_HIGH_RES_TIMERS=n which triggers the stall.
> >> 
> >> I can reproduce just with:
> >> 
> >>   $ make ppc64le_guest_defconfig
> >>   $ ./scripts/config -d HIGH_RES_TIMERS
> >> 
> >> We have no defconfigs that disable HIGH_RES_TIMERS, I didn't even
> >> realise you could disable it TBH :)
> >> 
> >> The Rust CI has it disabled because I copied that from the x86 defconfig
> >> they were using back when I added the Rust support. I think that was
> >> meant to be a stripped down fast config for CI, but the result is it's
> >> just using a badly tested combination which is not helpful.
> >> 
> >> So I'll send a patch to turn HIGH_RES_TIMERS on for the Rust CI, and we
> >> can debug this further without blocking them.
> > 
> > So we traced the problem down to possibly a misunderstanding between 
> > decrementer clock event device and core code.
> > 
> > The decrementer is only oneshot*ish*. It actually needs to either be 
> > reprogrammed or shut down otherwise it just continues to cause 
> > interrupts.
> > 
> > Before commit 35de589cb879, it was sort of two-shot. The initial 
> > interrupt at the programmed time would set its internal next_tb variable 
> > to ~0 and call the ->event_handler(). If that did not set_next_event or 
> > stop the timer, the interrupt will fire again immediately, notice 
> > next_tb is ~0, and only then stop the decrementer interrupt.
> > 
> > So that was already kind of ugly, this patch just turned it into a hang.
> > 
> > The problem happens when the tick is stopped with an event still 
> > pending, then tick_nohz_handler() is called, but it bails out because 
> > tick_stopped == 1 so the device never gets programmed again, and so it 
> > keeps firing.
> > 
> > How to fix it? Before commit a7cba02deced, powerpc's decrementer was 
> > really oneshot, but we would like to avoid doing that because it requires 
> > additional programming of the hardware on each timer interrupt. We have 
> > the ONESHOT_STOPPED state which seems to be just about what we want.
> > 
> > Did the ONESHOT_STOPPED patch just miss this case, or is there a reason 
> > we don't stop it here? This patch seems to fix the hang (not heavily
> > tested though).

This looks plausible to me based on my interactions with ticks, but it
would be good to have someone who understands that code better than I
do to look it over.

							Thanx, Paul

> > Thanks,
> > Nick
> > 
> > ---
> > diff --git a/kernel/time/tick-sched.c b/kernel/time/tick-sched.c
> > index 2d76c91b85de..7e13a55b6b71 100644
> > --- a/kernel/time/tick-sched.c
> > +++ b/kernel/time/tick-sched.c
> > @@ -1364,9 +1364,11 @@ static void tick_nohz_handler(struct clock_event_device *dev)
> >  	tick_sched_do_timer(ts, now);
> >  	tick_sched_handle(ts, regs);
> >  
> > -	/* No need to reprogram if we are running tickless  */
> > -	if (unlikely(ts->tick_stopped))
> > +	if (unlikely(ts->tick_stopped)) {
> > +		/* If we are tickless, change the clock event to stopped */
> > +		tick_program_event(KTIME_MAX, 1);
> >  		return;
> > +	}
> >  
> >  	hrtimer_forward(&ts->sched_timer, now, TICK_NSEC);
> >  	tick_program_event(hrtimer_get_expires(&ts->sched_timer), 1);
> > 
