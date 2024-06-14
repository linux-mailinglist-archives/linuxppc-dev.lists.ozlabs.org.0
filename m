Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 43832909408
	for <lists+linuxppc-dev@lfdr.de>; Sat, 15 Jun 2024 00:05:43 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Fsy1Ok+B;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W1CyX0Xgrz3cGM
	for <lists+linuxppc-dev@lfdr.de>; Sat, 15 Jun 2024 08:05:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Fsy1Ok+B;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::1035; helo=mail-pj1-x1035.google.com; envelope-from=vincent.guittot@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W0wxd28CHz2yPq
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Jun 2024 20:48:51 +1000 (AEST)
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-2c3050f4c50so1655395a91.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Jun 2024 03:48:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718362129; x=1718966929; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=FJRFKVvp1PoPGBhKf/e9VTmU0CVL3sNznYNLbRBztzw=;
        b=Fsy1Ok+BcVPO4MJBVIVNU8Uepl8u51DKDNffNXkaMPD9427RsjO9mOxv+eozfbI4jz
         Lk0jtkkNXqedGwQOhipvwC+0Ey0uP3cT7lfDuN5P67RwiTcsV3n+JrojU5woSkqN+0x4
         ETze+G+8OWzoJBXCxwVTYeI/pEWWfxtgcFvBqpZu9IWY0LVUG9VK6ebTsSUsdBKcu+4b
         A+s9WsBM6gsBHRmtM0zwjjWDtyW3conyRCzPyKeFr26pQiq4tepXP0UMsA+6AjK+AInS
         CGQ84jZiH5XFZCJXaCbXAJ+PW8qtR7xoBvtFsRKkJdFMJ8mAN2ynPjJxToHOKSD10/HN
         v2Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718362129; x=1718966929;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FJRFKVvp1PoPGBhKf/e9VTmU0CVL3sNznYNLbRBztzw=;
        b=Gxt6eU+IXDUND1dJkPK0LJ3Wo5ONZKWm6HF4cCBictiOB0+8wzTZvbAL64gxrnrn4W
         +2iRTja5/FFO1+9vDm1I2OYNH+dlA/774nmDr4closr28VYWI8Bp4ysxOT903HraiukA
         FnNVmu2/xvGE4m0o2fRM4q9KWSQuFmcO6WaSGEU7IqJh/VS+p1COOOxau4S/JFY+M+uh
         lUucHPv03bMqbTX4Rnpk1SZuM2Zlcn74iQJCJM04kHddSTV09LrnVvlUGmMde9KyVeXP
         zDfPDwo76WDSQsNeHsXhgXbSjrPa6zoFOEItrFOK+oXkV3191ZJiGNicRxWjBw+8fGub
         WZvw==
X-Forwarded-Encrypted: i=1; AJvYcCXUGfOQwVbVPGN944s735t7yODR1uZsxINT4i79njR/s85jQPROwGPXBNKSxX+ur/glxXXqY3ml3Ylrl1H8qs7fFn8OiYmzNz2DM4KgCw==
X-Gm-Message-State: AOJu0YyVU0FzYpFBy6pZcQZpYGpm/26MFzSG75wY/6nOsJRH+2cq8Zh3
	hSLgJIhqeDZwW5MnBZDsg1X4IcdHXbaUuwVpO/iGGl7KWf73Z9yZPNODyClPUs/arWNYaq04vgI
	AAZ9Zqwhg3BSvLhrBuuLAJ26bxdjSw6FM9OySyQ==
X-Google-Smtp-Source: AGHT+IFBNs6asuW3ITzwrzxBuJ34dIEDrFFiB0cxCgEUXerjbV3bUVsVACrV/h+c0Xuym4jmu0bWBIKinZhT1ShFBqQ=
X-Received: by 2002:a17:90a:928a:b0:2c2:e97f:89d5 with SMTP id
 98e67ed59e1d1-2c4dbd44d6amr2419553a91.42.1718362128949; Fri, 14 Jun 2024
 03:48:48 -0700 (PDT)
MIME-Version: 1.0
References: <20240613181613.4329-1-kprateek.nayak@amd.com> <20240614092801.GL8774@noisy.programming.kicks-ass.net>
In-Reply-To: <20240614092801.GL8774@noisy.programming.kicks-ass.net>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Fri, 14 Jun 2024 12:48:37 +0200
Message-ID: <CAKfTPtBTxhbmh=605TJ9sRw-nFu6w-KY7QpAxRUh5AjhQWa2ig@mail.gmail.com>
Subject: Re: [PATCH v2 00/14] Introducing TIF_NOTIFY_IPI flag
To: Peter Zijlstra <peterz@infradead.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Sat, 15 Jun 2024 08:05:03 +1000
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
Cc: Juri Lelli <juri.lelli@redhat.com>, Rich Felker <dalias@libc.org>, Andreas Larsson <andreas@gaisler.com>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, linux-openrisc@vger.kernel.org, Guo Ren <guoren@kernel.org>, linux-csky@vger.kernel.org, David Vernet <void@manifault.com>, "H. Peter Anvin" <hpa@zytor.com>, Borislav Petkov <bp@alien8.de>, Thomas Gleixner <tglx@linutronix.de>, Kees Cook <keescook@chromium.org>, Jonas Bonn <jonas@southpole.se>, Valentin Schneider <vschneid@redhat.com>, Yoshinori Sato <ysato@users.sourceforge.jp>, linux-sh@vger.kernel.org, Helge Deller <deller@gmx.de>, "Rafael J. Wysocki" <rafael@kernel.org>, Russell King <linux@armlinux.org.uk>, Christophe Leroy <christophe.leroy@csgroup.eu>, Tony Battersby <tonyb@cybernetics.com>, Ingo Molnar <mingo@redhat.com>, sparclinux@vger.kernel.org, Mel Gorman <mgorman@suse.de>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Matt Turner <mattst88@gmail.com>, Benjamin Gray <bgray@linux.ibm.com>, Andrew Donnellan <ajd@linux.ibm.com>, "Paul E. McKenney" <paulmck@kernel.org>, Rik van Riel <riel@surriel.com>, Brian Gerst <brgerst@gmail.com>, Frederic Weisbecker <frederic@kernel.org>, Xin Li <xin3.li@intel.com>, Richard Henderson <richard.henderson@linaro.org>, linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>, Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Steven Rostedt <rostedt@goodmis.org>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Bjorn Helgaas <bhelgaas@google.com>, Stafford Horne <shorne@gmail.com>, Dietmar Eggemann <dietmar.eggemann@arm.com>, linux-arm-kernel@lists.infradead.org, Ben Segall <bsegall@google.com>, Michal Simek <monstr@monstr.eu>, Daniel Lezcano <daniel.lezcano@linaro.org>, linux-parisc@vger.kernel.org, Tim Chen <tim.c.chen@linux.intel.com>, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, Julia Lawall <julia.lawall@inria.fr>, Dinh Nguyen <dinguyen@kernel.org>, Leonardo Bras <leobras@redhat.com>, "Gautham R. Shenoy" <gautham.shenoy@amd.com>, linux-alpha@vger.kernel.org, Imran Khan <imran.f.khan@oracle.com>, K Prateek Nayak <kprateek.nayak@amd.com>, Rick Edgecombe <rick.p.edgecombe@intel.com>, Daniel Bristot de Oliveira <bristot@redhat.com>, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 14 Jun 2024 at 11:28, Peter Zijlstra <peterz@infradead.org> wrote:
>
> On Thu, Jun 13, 2024 at 06:15:59PM +0000, K Prateek Nayak wrote:
> > Effects of call_function_single_prep_ipi()
> > ==========================================
> >
> > To pull a TIF_POLLING thread out of idle to process an IPI, the sender
> > sets the TIF_NEED_RESCHED bit in the idle task's thread info in
> > call_function_single_prep_ipi() and avoids sending an actual IPI to the
> > target. As a result, the scheduler expects a task to be enqueued when
> > exiting the idle path. This is not the case with non-polling idle states
> > where the idle CPU exits the non-polling idle state to process the
> > interrupt, and since need_resched() returns false, soon goes back to
> > idle again.
> >
> > When TIF_NEED_RESCHED flag is set, do_idle() will call schedule_idle(),
> > a large part of which runs with local IRQ disabled. In case of ipistorm,
> > when measuring IPI throughput, this large IRQ disabled section delays
> > processing of IPIs. Further auditing revealed that in absence of any
> > runnable tasks, pick_next_task_fair(), which is called from the
> > pick_next_task() fast path, will always call newidle_balance() in this
> > scenario, further increasing the time spent in the IRQ disabled section.
> >
> > Following is the crude visualization of the problem with relevant
> > functions expanded:
> > --
> > CPU0                                                  CPU1
> > ====                                                  ====
> >                                                       do_idle() {
> >                                                               __current_set_polling();
> >                                                               ...
> >                                                               monitor(addr);
> >                                                               if (!need_resched())
> >                                                                       mwait() {
> >                                                                       /* Waiting */
> > smp_call_function_single(CPU1, func, wait = 1) {                              ...
> >       ...                                                                     ...
> >       set_nr_if_polling(CPU1) {                                               ...
> >               /* Realizes CPU1 is polling */                                  ...
> >               try_cmpxchg(addr,                                               ...
> >                           &val,                                               ...
> >                           val | _TIF_NEED_RESCHED);                           ...
> >       } /* Does not send an IPI */                                            ...
> >       ...                                                             } /* mwait exit due to write at addr */
> >       csd_lock_wait() {                                       }
> >       /* Waiting */                                           preempt_set_need_resched();
> >               ...                                             __current_clr_polling();
> >               ...                                             flush_smp_call_function_queue() {
> >               ...                                                     func();
> >       } /* End of wait */                                     }
> > }                                                             schedule_idle() {
> >                                                                       ...
> >                                                                       local_irq_disable();
> > smp_call_function_single(CPU1, func, wait = 1) {                      ...
> >       ...                                                             ...
> >       arch_send_call_function_single_ipi(CPU1);                       ...
> >                                               \                       ...
> >                                                \                      newidle_balance() {
> >                                                 \                             ...
> >                                             /* Delay */                       ...
> >                                                   \                   }
> >                                                    \                  ...
> >                                                     \-------------->  local_irq_enable();
> >                                                                       /* Processes the IPI */
> > --
> >
> >
> > Skipping newidle_balance()
> > ==========================
> >
> > In an earlier attempt to solve the challenge of the long IRQ disabled
> > section, newidle_balance() was skipped when a CPU waking up from idle
> > was found to have no runnable tasks, and was transitioning back to
> > idle [2]. Tim [3] and David [4] had pointed out that newidle_balance()
> > may be viable for CPUs that are idling with tick enabled, where the
> > newidle_balance() has the opportunity to pull tasks onto the idle CPU.
>
> I don't think we should be relying on this in any way shape or form.
> NOHZ can kill that tick at any time.
>
> Also, semantically, calling newidle from the idle thread is just daft.
> You're really not newly idle in that case.
>
> > Vincent [5] pointed out a case where the idle load kick will fail to
> > run on an idle CPU since the IPI handler launching the ILB will check
> > for need_resched(). In such cases, the idle CPU relies on
> > newidle_balance() to pull tasks towards itself.
>
> Is this the need_resched() in _nohz_idle_balance() ? Should we change
> this to 'need_resched() && (rq->nr_running || rq->ttwu_pending)' or
> something long those lines?

It's not only this but also in do_idle() as well which exits the loop
to look for tasks to schedule

>
> I mean, it's fairly trivial to figure out if there really is going to be
> work there.
>
> > Using an alternate flag instead of NEED_RESCHED to indicate a pending
> > IPI was suggested as the correct approach to solve this problem on the
> > same thread.
>
> So adding per-arch changes for this seems like something we shouldn't
> unless there really is no other sane options.
>
> That is, I really think we should start with something like the below
> and then fix any fallout from that.

The main problem is that need_resched becomes somewhat meaningless
because it doesn't  only mean "I need to resched a task" and we have
to add more tests around even for those not using polling

>
> diff --git a/kernel/sched/core.c b/kernel/sched/core.c
> index 0935f9d4bb7b..cfa45338ae97 100644
> --- a/kernel/sched/core.c
> +++ b/kernel/sched/core.c
> @@ -5799,7 +5800,7 @@ static inline struct task_struct *
>  __pick_next_task(struct rq *rq, struct task_struct *prev, struct rq_flags *rf)
>  {
>         const struct sched_class *class;
> -       struct task_struct *p;
> +       struct task_struct *p = NULL;
>
>         /*
>          * Optimization: we know that if all tasks are in the fair class we can
> @@ -5810,9 +5811,11 @@ __pick_next_task(struct rq *rq, struct task_struct *prev, struct rq_flags *rf)
>         if (likely(!sched_class_above(prev->sched_class, &fair_sched_class) &&
>                    rq->nr_running == rq->cfs.h_nr_running)) {
>
> -               p = pick_next_task_fair(rq, prev, rf);
> -               if (unlikely(p == RETRY_TASK))
> -                       goto restart;
> +               if (rq->nr_running) {

How do you make the diff between a spurious need_resched() because of
polling and a cpu becoming idle ? isn't rq->nr_running null in both
cases ?
In the later case, we need to call sched_balance_newidle() but not in the former

> +                       p = pick_next_task_fair(rq, prev, rf);
> +                       if (unlikely(p == RETRY_TASK))
> +                               goto restart;
> +               }
>
>                 /* Assume the next prioritized class is idle_sched_class */
>                 if (!p) {
