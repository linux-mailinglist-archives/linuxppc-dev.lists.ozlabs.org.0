Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 26FB87126AA
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 May 2023 14:31:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QSPR35xyzz3fJg
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 May 2023 22:30:55 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=UBlT9ISw;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.com (client-ip=2001:67c:2178:6::1d; helo=smtp-out2.suse.de; envelope-from=pmladek@suse.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=UBlT9ISw;
	dkim-atps=neutral
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QSPQ96T22z3c8v
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 May 2023 22:30:08 +1000 (AEST)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
	by smtp-out2.suse.de (Postfix) with ESMTP id 986451F8AE;
	Fri, 26 May 2023 12:29:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1685104199; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WhfCogRNdmmsvJU5CjDqdyyExEkgp9ppc07tbwxSsOg=;
	b=UBlT9ISwUDHYPeMb+a+ztXThl86vi9IDG6M9ms/XS0tVW0/E2hbhprn7RRLeyq1C45+D/b
	UHhvn1UnkoPvxRIU7hyiv3JpraRb3fXflpZJXSH2dOTVPbnALq5BAMR9pbIBcE99YuCZJK
	S6IfNcRb2vDTizhuODQNL5WRubLUMN8=
Received: from suse.cz (pmladek.tcp.ovpn2.prg.suse.de [10.100.208.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by relay2.suse.de (Postfix) with ESMTPS id 3EB022D38D;
	Fri, 26 May 2023 12:29:56 +0000 (UTC)
Date: Fri, 26 May 2023 14:29:53 +0200
From: Petr Mladek <pmladek@suse.com>
To: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH v5 14/18] watchdog/hardlockup: detect hard lockups using
 secondary (buddy) CPUs
Message-ID: <ZHCmQXECccH7ctq2@alley>
References: <20230519101840.v5.18.Ia44852044cdcb074f387e80df6b45e892965d4a1@changeid>
 <20230519101840.v5.14.I6bf789d21d0c3d75d382e7e51a804a7a51315f2c@changeid>
 <ZG-MTPSZakRDl2CP@alley>
 <CAD=FV=XNgevGRrD8cAsq03RwDX=n0i6d=4VDxWDKo-g3DQ07dA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD=FV=XNgevGRrD8cAsq03RwDX=n0i6d=4VDxWDKo-g3DQ07dA@mail.gmail.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, Ian Rogers <irogers@google.com>, ito-yuichi@fujitsu.com, Lecopzer Chen <lecopzer.chen@mediatek.com>, kgdb-bugreport@lists.sourceforge.net, ricardo.neri@intel.com, Stephane Eranian <eranian@google.com>, sparclinux@vger.kernel.org, Guenter Roeck <groeck@chromium.org>, Will Deacon <will@kernel.org>, Daniel Thompson <daniel.thompson@linaro.org>, Andi Kleen <ak@linux.intel.com>, Marc Zyngier <maz@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Matthias Kaehlcke <mka@chromium.org>, Catalin Marinas <catalin.marinas@arm.com>, Masayoshi Mizuma <msys.mizuma@gmail.com>, ravi.v.shankar@intel.com, Tzung-Bi Shih <tzungbi@chromium.org>, Colin Cross <ccross@android.com>, npiggin@gmail.com, Stephen Boyd <swboyd@chromium.org>, Pingfan Liu <kernelfans@gmail.com>, linux-arm-kernel@lists.infradead.org, Sumit Garg <sumit.garg@linaro.org>, Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, Andrew Morton <akpm@linux-found
 ation.org>, linuxppc-dev@lists.ozlabs.org, davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu 2023-05-25 13:08:04, Doug Anderson wrote:
> Hi,
> 
> On Thu, May 25, 2023 at 9:27 AM Petr Mladek <pmladek@suse.com> wrote:
> >
> > On Fri 2023-05-19 10:18:38, Douglas Anderson wrote:
> > > Implement a hardlockup detector that doesn't doesn't need any extra
> > > arch-specific support code to detect lockups. Instead of using
> > > something arch-specific we will use the buddy system, where each CPU
> > > watches out for another one. Specifically, each CPU will use its
> > > softlockup hrtimer to check that the next CPU is processing hrtimer
> > > interrupts by verifying that a counter is increasing.
> > >
> > > --- a/kernel/watchdog.c
> > > +++ b/kernel/watchdog.c
> > > @@ -85,7 +85,7 @@ __setup("nmi_watchdog=", hardlockup_panic_setup);
> > >
> > >  #endif /* CONFIG_HARDLOCKUP_DETECTOR */
> > >
> > > -#if defined(CONFIG_HARDLOCKUP_DETECTOR_PERF)
> > > +#if defined(CONFIG_HARDLOCKUP_DETECTOR_COUNTS_HRTIMER)
> > >
> > >  static DEFINE_PER_CPU(atomic_t, hrtimer_interrupts);
> > >  static DEFINE_PER_CPU(int, hrtimer_interrupts_saved);
> > > @@ -106,6 +106,14 @@ notrace void arch_touch_nmi_watchdog(void)
> > >  }
> > >  EXPORT_SYMBOL(arch_touch_nmi_watchdog);
> > >
> > > +void watchdog_hardlockup_touch_cpu(unsigned int cpu)
> > > +{
> > > +     per_cpu(watchdog_hardlockup_touched, cpu) = true;
> > > +
> > > +     /* Match with smp_rmb() in watchdog_hardlockup_check() */
> > > +     smp_wmb();
> >
> > It is great that you described where the related barrier is.
> >
> > Another important information is what exactly is synchronized.
> > And I am actually not sure what we are synchronizing here.
> >
> > My understanding is that a write barrier should synchronize
> > related writes, for example:
> >
> >         X = ...;
> >         /* Make sure that X is modified before Y */
> >         smp_wmb();
> >         Y = ...;
> >
> > And the related read barrier should synchronize the related reads,
> > for example:
> >
> >         if (test(Y)) {
> >                 /*
> >                  * Make sure that we use the updated X when
> >                  * we saw the updated Y.
> >                  */
> >                  smp_rmb();
> >                  do_something(X);
> >          }
> >
> > IMHO, we do not need any barrier here because we have only
> > one variable "watchdog_hardlockup_touched" here.
> > watchdog_hardlockup_check() will either see the updated value
> > or not. But it does not synchronize it against any other
> > variables or values.
> 
> Fair. These barriers were present in the original buddy lockup
> detector that we've been carrying in ChromeOS but that doesn't
> necessarily mean that they were there for a good reason.
> 
> Reasoning about weakly ordered memory always makes my brain hurt and I
> never feel confident at the end that I got the right answer and, of
> course, this is coupled by the fact that if I have a logic error in my
> reasoning that it might cause a rare / subtle bug. :(

Sure. Lockless code is complicated.

> When possible I
> try to write code that uses full blown locks to make it easier to
> reason about (even if less efficient),

Makes sense. There should be a good reason to use lockless code
because it is complicated to do it right and maintain.

> but that's not necessarily
> possible here. While we obviously don't just want to sprinkle barriers
> all over the code, IMO it's not a terrible sin to put a barrier in a
> case where it makes it easier to reason about the order of things.

I understand this. Well, it is always important to describe the
the reason why the barrier was added there. Even when it is wrong,
it gives a clue what was the motivation. Otherwise, it is hard
to do any changes on the code later.

I guess that it might be more problematic for you because
you probably are not the original author.

> In any case, I guess in this case I would worry about some sort of
> ordering race when enabling / disabling the buddy lockup detector. At
> the end of the buddy's watchdog_hardlockup_enable() /
> watchdog_hardlockup_disable() we adjust the "watchdog_cpus" which
> changes buddy assignments. Without a barrier, I _think_ it would be
> possible for a new CPU to notice the change in buddies without
> noticing the touch. Does that match your understanding? Now when
> reasoning about CPUs going online/offline we need to consider this
> extra case and we have to decide if there's any chance it could lead
> to a false lockup detection. With the memory barriers here, it's a
> little easier to think about.

This makes sense. I did not think about the hotplug scenario.

Well, I suggest to move the barriers into the buddy code and describe
it there. It does not make sense to use the barriers for the perf
hardlockup.

I mean something like:

diff --git a/kernel/watchdog_buddy.c b/kernel/watchdog_buddy.c
index fee45af2e5bd..ebe71dcb55e6 100644
--- a/kernel/watchdog_buddy.c
+++ b/kernel/watchdog_buddy.c
@@ -52,6 +52,13 @@ void watchdog_hardlockup_enable(unsigned int cpu)
 	if (next_cpu < nr_cpu_ids)
 		watchdog_hardlockup_touch_cpu(next_cpu);
 
+	/*
+	 * Makes sure that watchdog is touched on this CPU before
+	 * other CPUs could see it in watchdog_cpus. The counter
+	 * part is in watchdog_buddy_check_hardlockup().
+	 */
+	smp_wmb();
+
 	cpumask_set_cpu(cpu, &watchdog_cpus);
 }
 
@@ -69,6 +76,13 @@ void watchdog_hardlockup_disable(unsigned int cpu)
 	if (next_cpu < nr_cpu_ids)
 		watchdog_hardlockup_touch_cpu(next_cpu);
 
+	/*
+	 * Makes sure that watchdog is touched on the next CPU before
+	 * this CPU disappear in watchdog_cpus. The counter part is in
+	 * watchdog_buddy_check_hardlockup().
+	 */
+	smp_wmb();
+
 	cpumask_clear_cpu(cpu, &watchdog_cpus);
 }
 
@@ -89,5 +103,12 @@ void watchdog_buddy_check_hardlockup(unsigned long hrtimer_interrupts)
 	if (next_cpu >= nr_cpu_ids)
 		return;
 
+	/*
+	 * Make sure that the watchdog was touched on next CPU when
+	 * watchdog_next_cpu() returned another one because of
+	 * a change in watchdog_hardlockup_enable()/disable().
+	 */
+	smp_rmb();
+
 	watchdog_hardlockup_check(next_cpu, NULL);
 }

> Did the above convince you about keeping the barriers? If so, do you
> have any suggested comment that would make it clearer?
> 
> 
> > > +}
> > > +
> > >  static bool is_hardlockup(unsigned int cpu)
> > >  {
> > >       int hrint = atomic_read(&per_cpu(hrtimer_interrupts, cpu));
> > > @@ -443,11 +454,15 @@ static enum hrtimer_restart watchdog_timer_fn(struct hrtimer *hrtimer)
> > >       struct pt_regs *regs = get_irq_regs();
> > >       int duration;
> > >       int softlockup_all_cpu_backtrace = sysctl_softlockup_all_cpu_backtrace;
> > > +     unsigned long hrtimer_interrupts;
> > >
> > >       if (!watchdog_enabled)
> > >               return HRTIMER_NORESTART;
> > >
> > > -     watchdog_hardlockup_kick();
> > > +     hrtimer_interrupts = watchdog_hardlockup_kick();
> > > +
> > > +     /* test for hardlockups */
> >
> > I would omit the comment. It is not valid when perf detector is used.
> > And checking the buddy is clear from the function name.
> >
> > > +     watchdog_buddy_check_hardlockup(hrtimer_interrupts);
> >
> > I would personally move this into watchdog_hardlockup_kick().
> > watchdog_timer_fn() is already complex enough. And checking
> > the buddy when kicking a CPU makes sense.
> 
> Sure, I'll add that to my list of things to follow-up with.
> 
> 
> > Also I would not pass "hrtimer_interrupts". I guess that it is
> > just an optimization. It is an extra churn in the code. IMHO,
> > is is not wort it. This code does not need to be super optimized.
> 
> The main reason I did it is that "hrtimer_interrupts" is static to
> watchdog.c now. If I don't pass it in then I have to make it
> non-static and add it to the header. That also means anyone looking at
> the variable and figuring out how it is read/written needs to go
> search for other people that reference it. I feel like it's cleaner to
> just pass it in. If you feel strongly that I should change this then
> let me know, but otherwise I'll plan to leave this how I have it.

I do not have strong opinion. For me, the more important change is
to move watchdog_buddy_check_hardlockup() into
watchdog_hardlockup_kick(). watchdog_timer_fn() is already too complex.

> 
> > >       /* kick the softlockup detector */
> > >       if (completion_done(this_cpu_ptr(&softlockup_completion))) {
> > > --- a/lib/Kconfig.debug
> > > +++ b/lib/Kconfig.debug
> > > @@ -1035,10 +1035,55 @@ config BOOTPARAM_SOFTLOCKUP_PANIC
> > >
> > >         Say N if unsure.
> > >
> > > -config HARDLOCKUP_DETECTOR_PERF
> > > +# Both the "perf" and "buddy" hardlockup detectors count hrtimer
> > > +# interrupts. This config enables functions managing this common code.
> > > +config HARDLOCKUP_DETECTOR_COUNTS_HRTIMER
> > >       bool
> > >       select SOFTLOCKUP_DETECTOR
> > >
> > > +config HARDLOCKUP_DETECTOR_PERF
> > > +     bool
> > > +     depends on HAVE_HARDLOCKUP_DETECTOR_PERF
> > > +     select HARDLOCKUP_DETECTOR_COUNTS_HRTIMER
> > > +
> > > +config HARDLOCKUP_DETECTOR_BUDDY
> > > +     bool
> > > +     depends on SMP
> > > +     select HARDLOCKUP_DETECTOR_COUNTS_HRTIMER
> > > +
> > > +# For hardlockup detectors you can have one directly provided by the arch
> > > +# or use a "non-arch" one. If you're using a "non-arch" one that is
> > > +# further divided the perf hardlockup detector (which, confusingly, needs
> > > +# arch-provided perf support) and the buddy hardlockup detector (which just
> > > +# needs SMP). In either case, using the "non-arch" code conflicts with
> > > +# the NMI watchdog code (which is sometimes used directly and sometimes used
> > > +# by the arch-provided hardlockup detector).
> > > +config HAVE_HARDLOCKUP_DETECTOR_NON_ARCH
> > > +     bool
> > > +     depends on (HAVE_HARDLOCKUP_DETECTOR_PERF || SMP) && !HAVE_NMI_WATCHDOG
> > > +     default y
> > > +
> > > +config HARDLOCKUP_DETECTOR_PREFER_BUDDY
> > > +     bool "Prefer the buddy CPU hardlockup detector"
> > > +     depends on HAVE_HARDLOCKUP_DETECTOR_NON_ARCH && HAVE_HARDLOCKUP_DETECTOR_PERF && SMP
> >
> > Huh, I have big troubles to scratch my head around this check:
> >
> >        HAVE_HARDLOCKUP_DETECTOR_NON_ARCH depends on HAVE_HARDLOCKUP_DETECTOR_PERF and SMP
> >
> >        and this depends on HAVE_HARDLOCKUP_DETECTOR_NON_ARCH and again
> >                on HAVE_HARDLOCKUP_DETECTOR_PERF and SMP.
> 
> The goal is to have "HARDLOCKUP_DETECTOR_PREFER_BUDDY" to show up as
> an option if there is an option _other_ than the buddy. If there's not
> more than one hardlockup detector to pick from then there's no reason
> to ask the person configuring the kernel which one they'd prefer. At
> the moment, if you have an "arch" lockup detector then you're stuck
> with it, so you only get a choice if a "perf" detector is available
> and you've got SMP.
> 
> Ah, so I guess this could be simplified to:
> 
> depends on HAVE_HARDLOCKUP_DETECTOR_PERF && SMP

Yes, this is much better.

> OK, I'll add that to the list.
> 
> 
> > > +     help
> > > +       Say Y here to prefer the buddy hardlockup detector over the perf one.
> > > +
> > > +       With the buddy detector, each CPU uses its softlockup hrtimer
> > > +       to check that the next CPU is processing hrtimer interrupts by
> > > +       verifying that a counter is increasing.
> > > +
> > > +       This hardlockup detector is useful on systems that don't have
> > > +       an arch-specific hardlockup detector or if resources needed
> > > +       for the hardlockup detector are better used for other things.
> > > +
> > > +# This will select the appropriate non-arch hardlockdup detector
> > > +config HARDLOCKUP_DETECTOR_NON_ARCH
> > > +     bool
> > > +     depends on HAVE_HARDLOCKUP_DETECTOR_NON_ARCH
> > > +     select HARDLOCKUP_DETECTOR_BUDDY if !HAVE_HARDLOCKUP_DETECTOR_PERF || HARDLOCKUP_DETECTOR_PREFER_BUDDY
> > > +     select HARDLOCKUP_DETECTOR_PERF if HAVE_HARDLOCKUP_DETECTOR_PERF && !HARDLOCKUP_DETECTOR_PREFER_BUDDY
> > > +
> > >  #
> > >  # Enables a timestamp based low pass filter to compensate for perf based
> > >  # hard lockup detection which runs too fast due to turbo modes.
> > > @@ -1053,9 +1098,10 @@ config HARDLOCKUP_CHECK_TIMESTAMP
> > >  config HARDLOCKUP_DETECTOR
> > >       bool "Detect Hard Lockups"
> > >       depends on DEBUG_KERNEL && !S390
> >
> > Is there any reason why S390 could not or do not want to use the buddy
> > hardlockup detector.
> 
> This isn't a new dependency, but it's a good question. Looking at the
> git history, I see commit dea20a3fbdd0 ("[PATCH] Disable
> DETECT_SOFTLOCKUP for s390"). ...and it looks like the softlockup
> detector still says it's broken on s390. That would mean that the
> buddy detector is broken too.

It seems that s390 wanted to disable the watchdog completely, see
the commit  dea20a3fbdd08e5 ("[PATCH] Disable DETECT_SOFTLOCKUP for s390")
because they got too many false positives.

> 
> > > -     depends on HAVE_HARDLOCKUP_DETECTOR_PERF || HAVE_HARDLOCKUP_DETECTOR_ARCH
> > > +     depends on HAVE_HARDLOCKUP_DETECTOR_NON_ARCH || HAVE_HARDLOCKUP_DETECTOR_ARCH
> > >       select LOCKUP_DETECTOR
> > > -     select HARDLOCKUP_DETECTOR_PERF if HAVE_HARDLOCKUP_DETECTOR_PERF
> > > +     select HARDLOCKUP_DETECTOR_NON_ARCH if HAVE_HARDLOCKUP_DETECTOR_NON_ARCH
> >
> > Anyway, the configuration of the hard lockup detectors is insane and
> > this patchset makes it even worse, especially the new
> > HARDLOCKUP_DETECTOR_NON_ARCH stuff.
> >
> > It seems that sparc, powerpc and s390 are somehow special. Do you
> > still have in mind how they are distinguished using the Kconfig
> > variables?
> >
> > For example, I am pretty confused by the meaning of HAVE_NMI_WATCHDOG.
> >
> > And sparc has its own variant of
> > watchdog_hardlockup_enable()/disable(). It means that it is
> > arch-specific. Does it work with the 13th patch which made
> > watchdog_hardlockup_enable()/disable() to be watchdog-hardlockup-type
> > specific? Is is somehow related to HAVE_NMI_WATCHDOG?
> > Does this replace the entire watchdog only only the enable part?
> >
> > I think that we need to make this more straightforward. But I first
> > need to understand the existing maze of config variables.
> 
> I agree that it's confusing. I'm obviously biased, but IMO it's less
> confusing after my patchset than before. ;-) The state of the world
> before my patchset set a pretty low bar.
> 
> As far as I understand it, at an architecture-level you can choose any
> _ONE_ of the following:
> 
> a) Implement bits needed for the the "perf" hardlockup detector. x86
> has done this, some configs of powerpc do this, and arm64 now after my
> patch series. This is HAVE_HARDLOCKUP_DETECTOR_PERF.
> 
> b) Implement your own totally separate hardlockup detector that
> doesn't use any of the common "perf" code but still looks the same to
> userspace (same sysctls, etc). Only powerpc does this (in some
> configs). As per conversations in previous versions of my patch
> series, apparently powerpc's version is quite fancy and maybe someday
> people can move some of these features to the common code. This is
> HAVE_HARDLOCKUP_DETECTOR_ARCH.
> 
> c) Don't implement the full features of a hardlockup detector but
> still have the basics. In the very least, I think it doesn't support
> the sysctls "hardlockup_panic" and "hardlockup_all_cpu_backtrace". It
> doesn't support the kernel command line parameter "nmi_watchdog=". I
> don't know for sure if there are any other differences. Only sparc64
> does this. This is HAVE_NMI_WATCHDOG. Confusingly,
> HAVE_HARDLOCKUP_DETECTOR_ARCH selects HAVE_NMI_WATCHDOG.
> 
> d) Don't implement _any_ hardlockup detector of any sort. After my
> patchset you can still end up with "buddy" if you have SMP.
>
> One thing that would probably help would be to bring sparc64 to a full
> "arch" hardlockup implementation and then get rid of the special case.
> That seems a bit outside my scope, though if someone wanted to post
> patches for that I'd be willing to give them a review.

It would be nice but it might be problematic if we do not have
access to the hardware.

> I guess other than that, the best we could try to do is to rename some
> configs and/or add some subconfigs to describe certain features? Maybe
> HAVE_NMI_WATCHDOG => HAVE_HARDLOCKUP_DETECTOR_ARCH_BASIC_FEATURES
> would help? I'd love to come up with a better name for
> HAVE_HARDLOCKUP_DETECTOR_NON_ARCH but I couldn't come up with one.
> Maybe the unwieldy  "HAVE_HARDLOCKUP_DETECTOR_THAT_COUNTS_HRTIMER"?

Renaming the config variables seems to be the best solution at the moment.
IMHO, it would be nice to have something like:

  + CONFIG_HARDLOCKUP_DETECTOR for code shared by all hardlockup
    detectors

  + CONFIG_HARDLOCKUP_DETECTOR_PERF for code using kernel/watchdog_perf.c

  + CONFIG_HARDLOCKUP_DETECTOR_BUDDY for code using
	  kernel/watchdog_buddy.c

  + HAVE_HARDLOCKUP_DETECTOR_PERF set by architectures that support
	  using kernel/watchdog_perf.c

  + HAVE_HARDLOCKUP_DETECTOR_ARCH set by architectures that have
	alternative implementation of the hardlockup detector

  + CONFIG_HARDLOCKUP_DETECTOR_PREFER_BUDDY
	Allow to prefer the buddy detector when _PERF or _ARCH
	is available as well.

  + HAVE_HARDLOCKUP_PANIC
  + HAVE_HARDLOCKUP_ALL_CPU_BACKTRACE
	set when the earchitecture support these features and
	used for the sysfs interface

> If you have concrete suggestions for what would be cleaner, let me
> know and I can queue up a patch. ...or I'm happy to review a patch.

I am not sure how complicated it would be to rename the config
variables to somehing sane. I am sorry I do not have time to
prepare the patches at the moment.

I'll let Andrew to decide if he would require this cleanup to accept
the patchset.

Best Regards,
Petr
