Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FC2890BFD4
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Jun 2024 01:39:16 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=eOQblwNt;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W35v45mhvz3g7h
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Jun 2024 09:39:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=eOQblwNt;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::42c; helo=mail-pf1-x42c.google.com; envelope-from=vincent.guittot@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W2GMl0lPLz30Vp
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Jun 2024 00:57:36 +1000 (AEST)
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-70436ac8882so2745275b3a.2
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 16 Jun 2024 07:57:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718549849; x=1719154649; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=rYjghgjKd1ZembdVlTN5XgkOTmluzZxorMJSTjILbTo=;
        b=eOQblwNtDdIqQMTsa8hWzRF80fmMbPUWmacq0znWwTm3BmoSCkeidSjMooMkySzNKK
         A6AWrI7Z88PCs7OuICs8rfnzb48SAyT1RhVKoMEYthR/4nTSg4p8cE5Ca99LdoeLpWzw
         x+CuS4CTbMm6o6HtX3fE+NmhiTsVijjGrRKcu4B69pZeiwE6NVSn8cKzZqrE2E/yKxdq
         ZbdxLgLqlG0BNGt1ol1uJV6ptqzSCSxcNMlvzUzYwYkU1BC3HCIDJLq/6YvXZsqZSSU3
         LU3XXnyEFBFLTNthWhTuldCfQlDvQ+oSTEHK+Xcka+vMMussmO1HtUkyRAUQE1+Lmqjw
         WjfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718549849; x=1719154649;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rYjghgjKd1ZembdVlTN5XgkOTmluzZxorMJSTjILbTo=;
        b=aQbaznJzL3HNl8CywPrP9IUg3VNuElFKHKQEncvgVo1NcbBtWBxVxOMcD02ooYDJZq
         tAtepF5EFVEU2aqavb5EPH8cUoioJ0nilOoaYfH3XjnotfM+W1sY22TTccFjxLTjqPfU
         NVXGBKIHmXFVJ4csPa9NtcEnqaaMhUkT83onPNYvpEvGPSIEthRTV1a1bnObp2TlDNzp
         +ru9eCb805IFqaSEQtCoeVuGBGLKefJX6Pu3+iuV5SfUHABiIbVZ/eMQe7sdAgETxjtr
         tTRrXSseB9FKU9Xv5a8ytc7R4cb6E2TsIGcH0hddmrF/MT+HPVobSbbC1fLbKR9/7Mxv
         69Sw==
X-Forwarded-Encrypted: i=1; AJvYcCW4kDrdDAZXLCM2qF99fNErxdkY9CDnW1J4aMUHe1er5TMHAnPxykzcbIElW1Jle4NP5NEf8sO12Xdt1/TNTXUJnk63AcwcoVNio9u0AQ==
X-Gm-Message-State: AOJu0YxAq1ihSFhrEhSXrPkgbZfHDpcKocUqhGUKKEjFP7wAEgiS0sFt
	f/U9uy/N1TstBUs95DpLmWQjSdWk2RPA6NKtYFXBt4ohz9j6RULfSKuzkaMXPIS3Z8PnqBSkZEm
	+fi3ieCCDSce0y0kJ/RXOxKtkmchRaflRwuR9Uw==
X-Google-Smtp-Source: AGHT+IHTgpoQyjqHNervCjt0EPZEZ7aZDOr+YosfkhATeXzbUFa46nGvC/JpQ1fK4xIcVu7QUZh21abUsAxqmPSmJcc=
X-Received: by 2002:a05:6a21:32a5:b0:1b8:a188:53da with SMTP id
 adf61e73a8af0-1bae7f0bb4bmr7762840637.29.1718549848620; Sun, 16 Jun 2024
 07:57:28 -0700 (PDT)
MIME-Version: 1.0
References: <20240613181613.4329-1-kprateek.nayak@amd.com> <20240614092801.GL8774@noisy.programming.kicks-ass.net>
 <CAKfTPtBTxhbmh=605TJ9sRw-nFu6w-KY7QpAxRUh5AjhQWa2ig@mail.gmail.com> <20240615012814.GP8774@noisy.programming.kicks-ass.net>
In-Reply-To: <20240615012814.GP8774@noisy.programming.kicks-ass.net>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Sun, 16 Jun 2024 16:57:17 +0200
Message-ID: <CAKfTPtD2fUBqw09QDPGgAHyvQRmcvzbq9o3FDsctw=R6HP+=CA@mail.gmail.com>
Subject: Re: [PATCH v2 00/14] Introducing TIF_NOTIFY_IPI flag
To: Peter Zijlstra <peterz@infradead.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Tue, 18 Jun 2024 09:37:51 +1000
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

On Sat, 15 Jun 2024 at 03:28, Peter Zijlstra <peterz@infradead.org> wrote:
>
> On Fri, Jun 14, 2024 at 12:48:37PM +0200, Vincent Guittot wrote:
> > On Fri, 14 Jun 2024 at 11:28, Peter Zijlstra <peterz@infradead.org> wrote:
>
> > > > Vincent [5] pointed out a case where the idle load kick will fail to
> > > > run on an idle CPU since the IPI handler launching the ILB will check
> > > > for need_resched(). In such cases, the idle CPU relies on
> > > > newidle_balance() to pull tasks towards itself.
> > >
> > > Is this the need_resched() in _nohz_idle_balance() ? Should we change
> > > this to 'need_resched() && (rq->nr_running || rq->ttwu_pending)' or
> > > something long those lines?
> >
> > It's not only this but also in do_idle() as well which exits the loop
> > to look for tasks to schedule
>
> Is that really a problem? Reading the initial email the problem seems to
> be newidle balance, not hitting schedule. Schedule should be fairly
> quick if there's nothing to do, no?

There are 2 problems:
- Because of NEED_RESCHED being set, we go through the full schedule
path for no reason and we finally do a sched_balance_newidle()
- Because of need_resched being set o wake up the cpu, we will not
kick the softirq to run the nohz idle load balance and get a chance to
pull a task on an idle CPU

>
> > > I mean, it's fairly trivial to figure out if there really is going to be
> > > work there.
> > >
> > > > Using an alternate flag instead of NEED_RESCHED to indicate a pending
> > > > IPI was suggested as the correct approach to solve this problem on the
> > > > same thread.
> > >
> > > So adding per-arch changes for this seems like something we shouldn't
> > > unless there really is no other sane options.
> > >
> > > That is, I really think we should start with something like the below
> > > and then fix any fallout from that.
> >
> > The main problem is that need_resched becomes somewhat meaningless
> > because it doesn't  only mean "I need to resched a task" and we have
> > to add more tests around even for those not using polling
>
> True, however we already had some of that by having the wakeup list,
> that made nr_running less 'reliable'.
>
> The thing is, most architectures seem to have the TIF_POLLING_NRFLAG
> bit, even if their main idle routine isn't actually using it, much of

Yes, I'm surprised that Arm arch has the TIF_POLLING_NRFLAG whereas it
has never been supported by the arch

> the idle loop until it hits the arch idle will be having it set and will
> thus tickle these cases *sometimes*.
>
> > > diff --git a/kernel/sched/core.c b/kernel/sched/core.c
> > > index 0935f9d4bb7b..cfa45338ae97 100644
> > > --- a/kernel/sched/core.c
> > > +++ b/kernel/sched/core.c
> > > @@ -5799,7 +5800,7 @@ static inline struct task_struct *
> > >  __pick_next_task(struct rq *rq, struct task_struct *prev, struct rq_flags *rf)
> > >  {
> > >         const struct sched_class *class;
> > > -       struct task_struct *p;
> > > +       struct task_struct *p = NULL;
> > >
> > >         /*
> > >          * Optimization: we know that if all tasks are in the fair class we can
> > > @@ -5810,9 +5811,11 @@ __pick_next_task(struct rq *rq, struct task_struct *prev, struct rq_flags *rf)
> > >         if (likely(!sched_class_above(prev->sched_class, &fair_sched_class) &&
> > >                    rq->nr_running == rq->cfs.h_nr_running)) {
> > >
> > > -               p = pick_next_task_fair(rq, prev, rf);
> > > -               if (unlikely(p == RETRY_TASK))
> > > -                       goto restart;
> > > +               if (rq->nr_running) {
> >
> > How do you make the diff between a spurious need_resched() because of
> > polling and a cpu becoming idle ? isn't rq->nr_running null in both
> > cases ?
>
> Bah, true. It should also check current being idle, which then makes a
> mess of things again. Still, we shouldn't be calling newidle from idle,
> that's daft.
>
> I should probably not write code at 3am, but the below horror is what
> I came up with.
>
> ---
>
> diff --git a/kernel/sched/core.c b/kernel/sched/core.c
> index 0935f9d4bb7b..cfe8d3350819 100644
> --- a/kernel/sched/core.c
> +++ b/kernel/sched/core.c
> @@ -6343,19 +6344,12 @@ pick_next_task(struct rq *rq, struct task_struct *prev, struct rq_flags *rf)
>   * Constants for the sched_mode argument of __schedule().
>   *
>   * The mode argument allows RT enabled kernels to differentiate a
> - * preemption from blocking on an 'sleeping' spin/rwlock. Note that
> - * SM_MASK_PREEMPT for !RT has all bits set, which allows the compiler to
> - * optimize the AND operation out and just check for zero.
> + * preemption from blocking on an 'sleeping' spin/rwlock.
>   */
> -#define SM_NONE                        0x0
> -#define SM_PREEMPT             0x1
> -#define SM_RTLOCK_WAIT         0x2
> -
> -#ifndef CONFIG_PREEMPT_RT
> -# define SM_MASK_PREEMPT       (~0U)
> -#else
> -# define SM_MASK_PREEMPT       SM_PREEMPT
> -#endif
> +#define SM_IDLE                        (-1)
> +#define SM_NONE                        0
> +#define SM_PREEMPT             1
> +#define SM_RTLOCK_WAIT         2
>
>  /*
>   * __schedule() is the main scheduler function.
> @@ -6396,11 +6390,12 @@ pick_next_task(struct rq *rq, struct task_struct *prev, struct rq_flags *rf)
>   *
>   * WARNING: must be called with preemption disabled!
>   */
> -static void __sched notrace __schedule(unsigned int sched_mode)
> +static void __sched notrace __schedule(int sched_mode)
>  {
>         struct task_struct *prev, *next;
>         unsigned long *switch_count;
>         unsigned long prev_state;
> +       bool preempt = sched_mode > 0;
>         struct rq_flags rf;
>         struct rq *rq;
>         int cpu;
> @@ -6409,13 +6404,13 @@ static void __sched notrace __schedule(unsigned int sched_mode)
>         rq = cpu_rq(cpu);
>         prev = rq->curr;
>
> -       schedule_debug(prev, !!sched_mode);
> +       schedule_debug(prev, preempt);
>
>         if (sched_feat(HRTICK) || sched_feat(HRTICK_DL))
>                 hrtick_clear(rq);
>
>         local_irq_disable();
> -       rcu_note_context_switch(!!sched_mode);
> +       rcu_note_context_switch(preempt);
>
>         /*
>          * Make sure that signal_pending_state()->signal_pending() below
> @@ -6449,7 +6444,12 @@ static void __sched notrace __schedule(unsigned int sched_mode)
>          * that we form a control dependency vs deactivate_task() below.
>          */
>         prev_state = READ_ONCE(prev->__state);
> -       if (!(sched_mode & SM_MASK_PREEMPT) && prev_state) {
> +       if (sched_mode == SM_IDLE) {
> +               if (!rq->nr_running) {
> +                       next = prev;
> +                       goto picked;
> +               }
> +       } else if (!preempt && prev_state) {
>                 if (signal_pending_state(prev_state, prev)) {
>                         WRITE_ONCE(prev->__state, TASK_RUNNING);
>                 } else {
> @@ -6483,6 +6483,7 @@ static void __sched notrace __schedule(unsigned int sched_mode)
>         }
>
>         next = pick_next_task(rq, prev, &rf);
> +picked:
>         clear_tsk_need_resched(prev);
>         clear_preempt_need_resched();
>  #ifdef CONFIG_SCHED_DEBUG
> @@ -6521,9 +6522,9 @@ static void __sched notrace __schedule(unsigned int sched_mode)
>                 ++*switch_count;
>
>                 migrate_disable_switch(rq, prev);
>                 psi_sched_switch(prev, next, !task_on_rq_queued(prev));
>
> -               trace_sched_switch(sched_mode & SM_MASK_PREEMPT, prev, next, prev_state);
> +               trace_sched_switch(preempt, prev, next, prev_state);
>
>                 /* Also unlocks the rq: */
>                 rq = context_switch(rq, prev, next, &rf);
> @@ -6599,7 +6601,7 @@ static void sched_update_worker(struct task_struct *tsk)
>         }
>  }
>
> -static __always_inline void __schedule_loop(unsigned int sched_mode)
> +static __always_inline void __schedule_loop(int sched_mode)
>  {
>         do {
>                 preempt_disable();
> @@ -6644,7 +6646,7 @@ void __sched schedule_idle(void)
>          */
>         WARN_ON_ONCE(current->__state);
>         do {
> -               __schedule(SM_NONE);
> +               __schedule(SM_IDLE);
>         } while (need_resched());
>  }
>
