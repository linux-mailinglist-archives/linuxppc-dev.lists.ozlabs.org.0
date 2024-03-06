Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C3CA78734F0
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Mar 2024 11:52:46 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=SNNut5C0;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TqTmD3kGdz3wDL
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Mar 2024 21:52:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=SNNut5C0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::533; helo=mail-pg1-x533.google.com; envelope-from=vincent.guittot@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com [IPv6:2607:f8b0:4864:20::533])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TqSZl5lR5z3cNt
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 Mar 2024 20:59:25 +1100 (AEDT)
Received: by mail-pg1-x533.google.com with SMTP id 41be03b00d2f7-517ab9a4a13so5866316a12.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 06 Mar 2024 01:59:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709719163; x=1710323963; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=AEi1Mb5V0I2YDh0yKJcX6D2UIVEJm/Y+pHd4v7WChg0=;
        b=SNNut5C00HGgna/773nx00E3fP41IYkn629A1VW80uoiU6NBX/WUO2ngpgHuVQKks9
         pvXm+jo8kX1NizNniiiBFVvGtuZVziAOXB+Rm0036vN257b05uB42k0Jg/vfUQ/4WAaX
         BVlYi6SvwPsRDxaYBP3SaZheumZ1BYfZhjm80e3+2cLBDbzLmcdUg/PuDRs0kNU2IJ8V
         Jwki/OZ0keOd6b3ZgAHPMpbLcUkAwTjZ9qHW3szg/FMLUr1zyxYCQiai8WMJLeC+Bn0H
         NntisMTE8NSAcjUki34xLfDmzIjMlPpekDbjEHLodEihDrmBxI+MKCPPhyoRDa4uV0g+
         hzUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709719163; x=1710323963;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AEi1Mb5V0I2YDh0yKJcX6D2UIVEJm/Y+pHd4v7WChg0=;
        b=ZiStcKw/KoXDZCO6AeNJRSNt9jj2V0DrLcxmdA3rRtHKWT6k1xRNN1sYEHepBXRmIx
         1KEKrmfg/kAsuZerx5DggzBCQf6CPSApM3A0A3t/K150i0FhOh4ggjC6kAq+MwZU7omt
         uz9aXGAmOYcjJgP4MFVhr5yK6Ma4NV1VfXP4d04AiU0sMsHgt8PjVVe2ZNEocrnxeKsH
         oPziI+DdrvBg7wfpEIPBCGoXe+FxovfYq+SKxwsUfJb/0oDmXBMbJslw324mCj15iiCA
         sKstO65Yjo6/Xm9xfZcgXnBUloYrhTBeDjGK9q59XxrcjEqdXnjEOWvg1IEFOeSW0CmU
         xGSQ==
X-Forwarded-Encrypted: i=1; AJvYcCVBFqpNF17xwdHhrZ7RKS1fx9nU7LxBZYPDunmuZCvxto0Z/fDjNY+U07I8TyBNt6KUEgI54xlojOohyYqzfI9/ocmWYFmsJHzWn4CoCg==
X-Gm-Message-State: AOJu0YzbBCNnDPE5h1nHVej9GxRDBGxl9utMrl58LCfZI6ccfFHmYoSz
	qq/yCtkTZAbHmPO2FlIhMw+boad8yzUNKYtbsX0tu+jtfWM31P2T+3nZEmBj2KXnApAu+TnqbVl
	pLBaUmE3c8Buq13RkT5Yll/Nc8RNyiIICWgRMhw==
X-Google-Smtp-Source: AGHT+IEdNXbb2StmvXL5xE3qhXqu48Mh6g+sKzEfNb8rOFkLlGrqrgYtdKo9MB7oRfsLjfrHE0Eu/4AAFLHBuAxaoEw=
X-Received: by 2002:a05:6a20:8925:b0:1a1:4bb8:3017 with SMTP id
 i37-20020a056a20892500b001a14bb83017mr3612199pzg.61.1709719162677; Wed, 06
 Mar 2024 01:59:22 -0800 (PST)
MIME-Version: 1.0
References: <20240220171457.703-1-kprateek.nayak@amd.com>
In-Reply-To: <20240220171457.703-1-kprateek.nayak@amd.com>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Wed, 6 Mar 2024 10:59:11 +0100
Message-ID: <CAKfTPtBqPVQ5bo8HTZ=sPCUTYr48qtH61A8Z1dwCT434O7cSyQ@mail.gmail.com>
Subject: Re: [RFC PATCH 00/14] Introducing TIF_NOTIFY_IPI flag
To: K Prateek Nayak <kprateek.nayak@amd.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Wed, 06 Mar 2024 21:48:53 +1100
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
Cc: Juri Lelli <juri.lelli@redhat.com>, Rich Felker <dalias@libc.org>, "Rafael J. Wysocki" <rafael@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Linus Walleij <linus.walleij@linaro.org>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, linux-openrisc@vger.kernel.org, Guo Ren <guoren@kernel.org>, Nicholas Miehlbradt <nicholas@linux.ibm.com>, David Vernet <void@manifault.com>, "H. Peter Anvin" <hpa@zytor.com>, sparclinux@vger.kernel.org, Tony Battersby <tonyb@cybernetics.com>, Thomas Gleixner <tglx@linutronix.de>, Jonas Bonn <jonas@southpole.se>, Valentin Schneider <vschneid@redhat.com>, Yoshinori Sato <ysato@users.sourceforge.jp>, linux-sh@vger.kernel.org, Helge Deller <deller@gmx.de>, Daniel Lezcano <daniel.lezcano@linaro.org>, Russell King <linux@armlinux.org.uk>, Ard Biesheuvel <ardb@kernel.org>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Ingo Molnar <mingo@redhat.com>, Mel Gorman <mgorman@suse.de>, 
 "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Matt Turner <mattst88@gmail.com>, Josh Poimboeuf <jpoimboe@kernel.org>, Andrew Donnellan <ajd@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>, linux-pm@vger.kernel.org, Brian Gerst <brgerst@gmail.com>, Richard Henderson <richard.henderson@linaro.org>, linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>, Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>, linux-csky@vger.kernel.org, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Steven Rostedt <rostedt@goodmis.org>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Stafford Horne <shorne@gmail.com>, Dietmar Eggemann <dietmar.eggemann@arm.com>, linux-arm-kernel@lists.infradead.org, Ben Segall <bsegall@google.com>, Michal Simek <monstr@monstr.eu>, linux-parisc@vger.kernel.org, Tim Chen <tim.c.chen@linux.intel.com>, linux-kernel@vger.kernel.org, Julia Lawall <julia.lawall@inria.fr>, Dinh Nguyen <dinguyen@kernel.org>, "Gautham R. Shenoy" <gautham.shenoy@amd.com>, linux-
 alpha@vger.kernel.org, Borislav Petkov <bp@alien8.de>, Andrew Morton <akpm@linux-foundation.org>, Rick Edgecombe <rick.p.edgecombe@intel.com>, Daniel Bristot de Oliveira <bristot@redhat.com>, "David S. Miller" <davem@davemloft.net>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Al Viro <viro@zeniv.linux.org.uk>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Prateek,

Adding Julia who could be interested in this patchset. Your patchset
should trigger idle load balance instead of newly idle load balance
now when the polling is used. This was one reason for not migrating
task in idle CPU

On Tue, 20 Feb 2024 at 18:15, K Prateek Nayak <kprateek.nayak@amd.com> wrote:
>
> Hello everyone,
>
> Before jumping into the issue, let me clarify the Cc list. Everyone have
> been cc'ed on Patch 0 through Patch 3. Respective arch maintainers,
> reviewers, and committers returned by scripts/get_maintainer.pl have
> been cc'ed on the respective arch side changes. Scheduler and CPU Idle
> maintainers and reviewers have been included for the entire series. If I
> have missed anyone, please do add them. If you would like to be dropped
> from the cc list, wholly or partially, for the future iterations, please
> do let me know.
>
> With that out of the way ...
>
> Problem statement
> =================
>
> When measuring IPI throughput using a modified version of Anton
> Blanchard's ipistorm benchmark [1], configured to measure time taken to
> perform a fixed number of smp_call_function_single() (with wait set to
> 1), an increase in benchmark time was observed between v5.7 and the
> current upstream release (v6.7-rc6 at the time of encounter).
>
> Bisection pointed to commit b2a02fc43a1f ("smp: Optimize
> send_call_function_single_ipi()") as the reason behind this increase in
> runtime.
>
>
> Experiments
> ===========
>
> Since the commit cannot be cleanly reverted on top of the current
> tip:sched/core, the effects of the optimizations were reverted by:
>
> 1. Removing the check for call_function_single_prep_ipi() in
>    send_call_function_single_ipi(). With this change
>    send_call_function_single_ipi() always calls
>    arch_send_call_function_single_ipi()
>
> 2. Removing the call to flush_smp_call_function_queue() in do_idle()
>    since every smp_call_function, with (1.), would unconditionally send
>    an IPI to an idle CPU in TIF_POLLING mode.
>
> Following is the diff of the above described changes which will be
> henceforth referred to as the "revert":
>
> diff --git a/kernel/sched/idle.c b/kernel/sched/idle.c
> index 31231925f1ec..735184d98c0f 100644
> --- a/kernel/sched/idle.c
> +++ b/kernel/sched/idle.c
> @@ -332,11 +332,6 @@ static void do_idle(void)
>          */
>         smp_mb__after_atomic();
>
> -       /*
> -        * RCU relies on this call to be done outside of an RCU read-side
> -        * critical section.
> -        */
> -       flush_smp_call_function_queue();
>         schedule_idle();
>
>         if (unlikely(klp_patch_pending(current)))
> diff --git a/kernel/smp.c b/kernel/smp.c
> index f085ebcdf9e7..2ff100c41885 100644
> --- a/kernel/smp.c
> +++ b/kernel/smp.c
> @@ -111,11 +111,9 @@ void __init call_function_init(void)
>  static __always_inline void
>  send_call_function_single_ipi(int cpu)
>  {
> -       if (call_function_single_prep_ipi(cpu)) {
> -               trace_ipi_send_cpu(cpu, _RET_IP_,
> -                                  generic_smp_call_function_single_interrupt);
> -               arch_send_call_function_single_ipi(cpu);
> -       }
> +       trace_ipi_send_cpu(cpu, _RET_IP_,
> +                          generic_smp_call_function_single_interrupt);
> +       arch_send_call_function_single_ipi(cpu);
>  }
>
>  static __always_inline void
> --
>
> With the revert, the time taken to complete a fixed set of IPIs using
> ipistorm improves significantly. Following are the numbers from a dual
> socket 3rd Generation EPYC system (2 x 64C/128T) (boost on, C2 disabled)
> running ipistorm between CPU8 and CPU16:
>
> cmdline: insmod ipistorm.ko numipi=100000 single=1 offset=8 cpulist=8 wait=1
>
> (tip:sched/core at tag "sched-core-2024-01-08" for all the testing done
> below)
>
>   ==================================================================
>   Test          : ipistorm (modified)
>   Units         : Normalized runtime
>   Interpretation: Lower is better
>   Statistic     : AMean
>   ==================================================================
>   kernel:                       time [pct imp]
>   tip:sched/core                1.00 [0.00]
>   tip:sched/core + revert       0.81 [19.36]
>
> Although the revert improves ipistorm performance, it also regresses
> tbench and netperf, supporting the validity of the optimization.
> Following are netperf and tbench numbers from the same machine comparing
> vanilla tip:sched/core and the revert applied on top:
>
>   ==================================================================
>   Test          : tbench
>   Units         : Normalized throughput
>   Interpretation: Higher is better
>   Statistic     : AMean
>   ==================================================================
>   Clients:    tip[pct imp](CV)       revert[pct imp](CV)
>       1     1.00 [  0.00]( 0.24)     0.91 [ -8.96]( 0.30)
>       2     1.00 [  0.00]( 0.25)     0.92 [ -8.20]( 0.97)
>       4     1.00 [  0.00]( 0.23)     0.91 [ -9.20]( 1.75)
>       8     1.00 [  0.00]( 0.69)     0.91 [ -9.48]( 1.56)
>      16     1.00 [  0.00]( 0.66)     0.92 [ -8.49]( 2.43)
>      32     1.00 [  0.00]( 0.96)     0.89 [-11.13]( 0.96)
>      64     1.00 [  0.00]( 1.06)     0.90 [ -9.72]( 2.49)
>     128     1.00 [  0.00]( 0.70)     0.92 [ -8.36]( 1.26)
>     256     1.00 [  0.00]( 0.72)     0.97 [ -3.30]( 1.10)
>     512     1.00 [  0.00]( 0.42)     0.98 [ -1.73]( 0.37)
>    1024     1.00 [  0.00]( 0.28)     0.99 [ -1.39]( 0.43)
>
>   ==================================================================
>   Test          : netperf
>   Units         : Normalized Througput
>   Interpretation: Higher is better
>   Statistic     : AMean
>   ==================================================================
>   Clients:         tip[pct imp](CV)       revert[pct imp](CV)
>    1-clients     1.00 [  0.00]( 0.50)     0.89 [-10.51]( 0.20)
>    2-clients     1.00 [  0.00]( 1.16)     0.89 [-11.10]( 0.59)
>    4-clients     1.00 [  0.00]( 1.03)     0.89 [-10.68]( 0.38)
>    8-clients     1.00 [  0.00]( 0.99)     0.89 [-10.54]( 0.50)
>   16-clients     1.00 [  0.00]( 0.87)     0.89 [-10.92]( 0.95)
>   32-clients     1.00 [  0.00]( 1.24)     0.89 [-10.85]( 0.63)
>   64-clients     1.00 [  0.00]( 1.58)     0.90 [-10.11]( 1.18)
>   128-clients    1.00 [  0.00]( 0.87)     0.89 [-10.94]( 1.11)
>   256-clients    1.00 [  0.00]( 4.77)     1.00 [ -0.16]( 3.45)
>   512-clients    1.00 [  0.00](56.16)     1.02 [  2.10](56.05)
>
> Since a simple revert is not a viable solution, we delved deeper into
> the changes in the execution path with call_function_single_prep_ipi()
> check.
>
>
> Effects of call_function_single_prep_ipi()
> ==========================================
>
> To pull a TIF_POLLING thread out of idle to process an IPI, the sender
> sets the TIF_NEED_RESCHED bit in the idle task's thread info in
> call_function_single_prep_ipi() and avoids sending an actual IPI to the
> target. As a result, the scheduler expects a task to be enqueued when
> exiting the idle path. This is not the case with non-polling idle states
> where the idle CPU exits the non-polling idle state to process the
> interrupt, and since need_resched() returns false, soon goes back to
> idle again.
>
> When TIF_NEED_RESCHED flag is set, do_idle() will call schedule_idle(),
> a large part of which runs with local IRQ disabled. In case of ipistorm,
> when measuring IPI throughput, this large IRQ disabled section delays
> processing of IPIs. Further auditing revealed that in absence of any
> runnable tasks, pick_next_task_fair(), which is called from the
> pick_next_task() fast path, will always call newidle_balance() in this
> scenario, further increasing the time spent in the IRQ disabled section.
>
> Following is the crude visualization of the problem with relevant
> functions expanded:
> --
> CPU0                                                    CPU1
> ====                                                    ====
>                                                         do_idle() {
>                                                                 __current_set_polling();
>                                                                 ...
>                                                                 monitor(addr);
>                                                                 if (!need_resched())
>                                                                         mwait() {
>                                                                         /* Waiting */
> smp_call_function_single(CPU1, func, wait = 1) {                                ...
>         ...                                                                     ...
>         set_nr_if_polling(CPU1) {                                               ...
>                 /* Realizes CPU1 is polling */                                  ...
>                 try_cmpxchg(addr,                                               ...
>                             &val,                                               ...
>                             val | _TIF_NEED_RESCHED);                           ...
>         } /* Does not send an IPI */                                            ...
>         ...                                                             } /* mwait exit due to write at addr */
>         csd_lock_wait() {                                       }
>         /* Waiting */                                           preempt_set_need_resched();
>                 ...                                             __current_clr_polling();
>                 ...                                             flush_smp_call_function_queue() {
>                 ...                                                     func();
>         } /* End of wait */                                     }
> }                                                               schedule_idle() {
>                                                                         ...
>                                                                         local_irq_disable();
> smp_call_function_single(CPU1, func, wait = 1) {                        ...
>         ...                                                             ...
>         arch_send_call_function_single_ipi(CPU1);                       ...
>                                                 \                       ...
>                                                  \                      newidle_balance() {
>                                                   \                             ...
>                                               /* Delay */                       ...
>                                                     \                   }
>                                                      \                  ...
>                                                       \-------------->  local_irq_enable();
>                                                                         /* Processes the IPI */
> --
>
>
> Skipping newidle_balance()
> ==========================
>
> In an earlier attempt to solve the challenge of the long IRQ disabled
> section, newidle_balance() was skipped when a CPU waking up from idle
> was found to have no runnable tasks, and was transitioning back to
> idle [2]. Tim [3] and David [4] had pointed out that newidle_balance()
> may be viable for CPUs that are idling with tick enabled, where the
> newidle_balance() has the opportunity to pull tasks onto the idle CPU.
>
> Vincent [5] pointed out a case where the idle load kick will fail to
> run on an idle CPU since the IPI handler launching the ILB will check
> for need_resched(). In such cases, the idle CPU relies on
> newidle_balance() to pull tasks towards itself.

Calling newidle_balance() instead of the normal idle load balance
prevents the CPU to pull tasks from other groups

>
> Using an alternate flag instead of NEED_RESCHED to indicate a pending
> IPI was suggested as the correct approach to solve this problem on the
> same thread.
>
>
> Proposed solution: TIF_NOTIFY_IPI
> =================================
>
> Instead of reusing TIF_NEED_RESCHED bit to pull an TIF_POLLING CPU out
> of idle, TIF_NOTIFY_IPI is a newly introduced flag that
> call_function_single_prep_ipi() sets on a target TIF_POLLING CPU to
> indicate a pending IPI, which the idle CPU promises to process soon.
>
> On architectures that do not support the TIF_NOTIFY_IPI flag (this
> series only adds support for x86 and ARM processors for now),

I'm surprised that you are mentioning ARM processors because they
don't use TIF_POLLING.

> call_function_single_prep_ipi() will fallback to setting
> TIF_NEED_RESCHED bit to pull the TIF_POLLING CPU out of idle.
>
> Since the pending IPI handlers are processed before the call to
> schedule_idle() in do_idle(), schedule_idle() will only be called if the
> IPI handler have woken / migrated a new task on the idle CPU and has set
> TIF_NEED_RESCHED bit to indicate the same. This avoids running into the
> long IRQ disabled section in schedule_idle() unnecessarily, and any
> need_resched() check within a call function will accurately notify if a
> task is waiting for CPU time on the CPU handling the IPI.
>
> Following is the crude visualization of how the situation changes with
> the newly introduced TIF_NOTIFY_IPI flag:
> --
> CPU0                                                    CPU1
> ====                                                    ====
>                                                         do_idle() {
>                                                                 __current_set_polling();
>                                                                 ...
>                                                                 monitor(addr);
>                                                                 if (!need_resched_or_ipi())
>                                                                         mwait() {
>                                                                         /* Waiting */
> smp_call_function_single(CPU1, func, wait = 1) {                                ...
>         ...                                                                     ...
>         set_nr_if_polling(CPU1) {                                               ...
>                 /* Realizes CPU1 is polling */                                  ...
>                 try_cmpxchg(addr,                                               ...
>                             &val,                                               ...
>                             val | _TIF_NOTIFY_IPI);                             ...
>         } /* Does not send an IPI */                                            ...
>         ...                                                             } /* mwait exit due to write at addr */
>         csd_lock_wait() {                                       ...
>         /* Waiting */                                           preempt_fold_need_resched(); /* fold if NEED_RESCHED */
>                 ...                                             __current_clr_polling();
>                 ...                                             flush_smp_call_function_queue() {
>                 ...                                                     func(); /* Will set NEED_RESCHED if sched_ttwu_pending() */
>         } /* End of wait */                                     }
> }                                                               if (need_resched()) {
>                                                                         schedule_idle();
> smp_call_function_single(CPU1, func, wait = 1) {                }
>         ...                                                     ... /* IRQs remain enabled */
>         arch_send_call_function_single_ipi(CPU1); ----------->  /* Processes the IPI */
> --
>
> Results
> =======
>
> With the TIF_NOTIFY_IPI, the time taken to complete a fixed set of IPIs
> using ipistorm improves drastically. Following are the numbers from the
> same dual socket 3rd Generation EPYC system (2 x 64C/128T) (boost on,
> C2 disabled) running ipistorm between CPU8 and CPU16:
>
> cmdline: insmod ipistorm.ko numipi=100000 single=1 offset=8 cpulist=8 wait=1
>
>   ==================================================================
>   Test          : ipistorm (modified)
>   Units         : Normalized runtime
>   Interpretation: Lower is better
>   Statistic     : AMean
>   ==================================================================
>   kernel:                               time [pct imp]
>   tip:sched/core                        1.00 [0.00]
>   tip:sched/core + revert               0.81 [19.36]
>   tip:sched/core + TIF_NOTIFY_IPI       0.20 [80.99]
>
> Same experiment was repeated on an dual socket ARM server (2 x 64C)
> which too saw a significant improvement in the ipistorm performance:

Could you share more details about this ARM server ? Could it be an Arm64 one ?
I was not expecting any change for arm/arm64 which are not using TIF_POLLING


>
>   ==================================================================
>   Test          : ipistorm (modified)
>   Units         : Normalized runtime
>   Interpretation: Lower is better
>   Statistic     : AMean
>   ==================================================================
>   kernel:                               time [pct imp]
>   tip:sched/core                        1.00 [0.00]
>   tip:sched/core + TIF_NOTIFY_IPI       0.41 [59.29]
>
> netperf and tbench results with the patch match the results on tip on
> the dual socket 3rd Generation AMD system (2 x 64C/128T). Additionally,
> hackbench, stream, and schbench too were tested, with results from the
> patched kernel matching that of the tip.
>
>
> Future Work
> ===========
>
> Evaluate impact of newidle_balance() when scheduler tick hits an idle
> CPU. The call to newidle_balance() will be skipped with the

But it should call the normal idle load balance instead

> TIF_NOTIFY_IPI solution similar to [2]. Counter argument for the case is
> that if the idle state did not set the TIF_POLLING bit, the idle CPU
> would not have called schedule_idle() unless the IPI handler set the
> NEED_RESCHED bit.
>
>
> Links
> =====
>
> [1] https://github.com/antonblanchard/ipistorm
> [2] https://lore.kernel.org/lkml/20240119084548.2788-1-kprateek.nayak@amd.com/
> [3] https://lore.kernel.org/lkml/b4f5ac150685456cf45a342e3bb1f28cdd557a53.camel@linux.intel.com/
> [4] https://lore.kernel.org/lkml/20240123211756.GA221793@maniforge/
> [5] https://lore.kernel.org/lkml/CAKfTPtC446Lo9CATPp7PExdkLhHQFoBuY-JMGC7agOHY4hs-Pw@mail.gmail.com/
>
> This series is based on tip:sched/core at tag "sched-core-2024-01-08".
> ---
> Gautham R. Shenoy (4):
>   thread_info: Add helpers to test and clear TIF_NOTIFY_IPI
>   sched: Define a need_resched_or_ipi() helper and use it treewide
>   sched/core: Use TIF_NOTIFY_IPI to notify an idle CPU in TIF_POLLING
>     mode of pending IPI
>   x86/thread_info: Introduce TIF_NOTIFY_IPI flag
>
> K Prateek Nayak (10):
>   arm/thread_info: Introduce TIF_NOTIFY_IPI flag
>   alpha/thread_info: Introduce TIF_NOTIFY_IPI flag
>   openrisc/thread_info: Introduce TIF_NOTIFY_IPI flag
>   powerpc/thread_info: Introduce TIF_NOTIFY_IPI flag
>   sh/thread_info: Introduce TIF_NOTIFY_IPI flag
>   sparc/thread_info: Introduce TIF_NOTIFY_IPI flag
>   csky/thread_info: Introduce TIF_NOTIFY_IPI flag
>   parisc/thread_info: Introduce TIF_NOTIFY_IPI flag
>   nios2/thread_info: Introduce TIF_NOTIFY_IPI flag
>   microblaze/thread_info: Introduce TIF_NOTIFY_IPI flag
> ---
> Cc: Richard Henderson <richard.henderson@linaro.org>
> Cc: Ivan Kokshaysky <ink@jurassic.park.msu.ru>
> Cc: Matt Turner <mattst88@gmail.com>
> Cc: Russell King <linux@armlinux.org.uk>
> Cc: Guo Ren <guoren@kernel.org>
> Cc: Michal Simek <monstr@monstr.eu>
> Cc: Dinh Nguyen <dinguyen@kernel.org>
> Cc: Jonas Bonn <jonas@southpole.se>
> Cc: Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>
> Cc: Stafford Horne <shorne@gmail.com>
> Cc: "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>
> Cc: Helge Deller <deller@gmx.de>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Nicholas Piggin <npiggin@gmail.com>
> Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
> Cc: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>
> Cc: "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>
> Cc: Yoshinori Sato <ysato@users.sourceforge.jp>
> Cc: Rich Felker <dalias@libc.org>
> Cc: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
> Cc: "David S. Miller" <davem@davemloft.net>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Ingo Molnar <mingo@redhat.com>
> Cc: Borislav Petkov <bp@alien8.de>
> Cc: Dave Hansen <dave.hansen@linux.intel.com>
> Cc: "H. Peter Anvin" <hpa@zytor.com>
> Cc: "Rafael J. Wysocki" <rafael@kernel.org>
> Cc: Daniel Lezcano <daniel.lezcano@linaro.org>
> Cc: Peter Zijlstra <peterz@infradead.org>
> Cc: Juri Lelli <juri.lelli@redhat.com>
> Cc: Vincent Guittot <vincent.guittot@linaro.org>
> Cc: Dietmar Eggemann <dietmar.eggemann@arm.com>
> Cc: Steven Rostedt <rostedt@goodmis.org>
> Cc: Ben Segall <bsegall@google.com>
> Cc: Mel Gorman <mgorman@suse.de>
> Cc: Daniel Bristot de Oliveira <bristot@redhat.com>
> Cc: Valentin Schneider <vschneid@redhat.com>
> Cc: Al Viro <viro@zeniv.linux.org.uk>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Ard Biesheuvel <ardb@kernel.org>
> Cc: Andrew Donnellan <ajd@linux.ibm.com>
> Cc: Nicholas Miehlbradt <nicholas@linux.ibm.com>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Josh Poimboeuf <jpoimboe@kernel.org>
> Cc: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
> Cc: Rick Edgecombe <rick.p.edgecombe@intel.com>
> Cc: Tony Battersby <tonyb@cybernetics.com>
> Cc: Brian Gerst <brgerst@gmail.com>
> Cc: Tim Chen <tim.c.chen@linux.intel.com>
> Cc: David Vernet <void@manifault.com>
> Cc: x86@kernel.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-alpha@vger.kernel.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-csky@vger.kernel.org
> Cc: linux-openrisc@vger.kernel.org
> Cc: linux-parisc@vger.kernel.org
> Cc: linuxppc-dev@lists.ozlabs.org
> Cc: linux-sh@vger.kernel.org
> Cc: sparclinux@vger.kernel.org
> Cc: linux-pm@vger.kernel.org
> ---
>  arch/alpha/include/asm/thread_info.h      |  2 ++
>  arch/arm/include/asm/thread_info.h        |  3 ++
>  arch/csky/include/asm/thread_info.h       |  2 ++
>  arch/microblaze/include/asm/thread_info.h |  2 ++
>  arch/nios2/include/asm/thread_info.h      |  2 ++
>  arch/openrisc/include/asm/thread_info.h   |  2 ++
>  arch/parisc/include/asm/thread_info.h     |  2 ++
>  arch/powerpc/include/asm/thread_info.h    |  2 ++
>  arch/sh/include/asm/thread_info.h         |  2 ++
>  arch/sparc/include/asm/thread_info_32.h   |  2 ++
>  arch/sparc/include/asm/thread_info_64.h   |  2 ++
>  arch/x86/include/asm/mwait.h              |  2 +-
>  arch/x86/include/asm/thread_info.h        |  2 ++
>  arch/x86/kernel/process.c                 |  2 +-
>  drivers/cpuidle/cpuidle-powernv.c         |  2 +-
>  drivers/cpuidle/cpuidle-pseries.c         |  2 +-
>  drivers/cpuidle/poll_state.c              |  2 +-
>  include/linux/sched.h                     |  5 +++
>  include/linux/sched/idle.h                | 12 +++----
>  include/linux/thread_info.h               | 43 +++++++++++++++++++++++
>  kernel/sched/core.c                       | 41 ++++++++++++++++-----
>  kernel/sched/idle.c                       | 23 ++++++++----
>  22 files changed, 133 insertions(+), 26 deletions(-)
>
> --
> 2.34.1
>
