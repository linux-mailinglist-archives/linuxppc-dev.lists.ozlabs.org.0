Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C901B8734F5
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Mar 2024 11:54:10 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=IAxtS/ql;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TqTnr4LjNz3wGD
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Mar 2024 21:54:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=IAxtS/ql;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::42e; helo=mail-pf1-x42e.google.com; envelope-from=vincent.guittot@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TqTDz1RK5z3dV7
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 Mar 2024 21:29:05 +1100 (AEDT)
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-6e6419cd4ddso1274953b3a.2
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 06 Mar 2024 02:29:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709720943; x=1710325743; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=pbEDDUpDwixN7ee9G378S21uFFpj/jAUkLZnJV6WsYI=;
        b=IAxtS/qlWwXq5HNRozaZUcRkcntnCCuh0smV/00JsAT9LqFhumDFUcgtV3kNcLCUlb
         dAgqc84u45J87MKRUoq/9EZeSK/cwTJjummABxyDrch8QYSZ2JXrgC284A6gyNUJzOLo
         45RBqU/ELc82QmcJn70ZE5EHMMAQI1BaKR7gVwixoJf6y3HfZ1O4t1u7gnpFGf7nGtgA
         wkdi3E3arADEPlJ08elsaAktM1PloLhvtSe7oHRZwWDRgiZsIj8/CZv8x2u6vGMczGXX
         vPFfdZoyU6XMBX1YW6PU1cQRVLbvVotx46/ZvUkNVEManujs5W1xOkyMWQUn18Ze+QEI
         zpuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709720943; x=1710325743;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pbEDDUpDwixN7ee9G378S21uFFpj/jAUkLZnJV6WsYI=;
        b=L18McfPxpYS8WI1GrfUvd1YtPCa6XfCmIYjEo24F0rDSi3uFXHQJEh2Ai3VPlDxlJy
         0gtitBDd9TXg6eycPHlERIAK6ljj17/H5oxep8oAR0zoaJQBJpnm4ZY9cDfvg1sQqxyI
         CfdfCRUk/jVd4JKgIetxaee8iwXokD7VAVDZYSDVmzsHW75Ylw+fwCKIeurscgGSx5Xa
         MOjMGOe8zEg9u5aP/rChDn/NxqLNBzVIfaKf+W6zjZalQGmpivFJ0x5iiCTNQPWw6A/X
         laOsgXcAFovgJ3LwXKnuA0MCnXy1W9SlIZzXtQCGQHtw6hW4MQnps12rm9FnjaQ/MjR/
         tzpQ==
X-Forwarded-Encrypted: i=1; AJvYcCV6/rk040W0qqJTzrf7zesjlHz/5+Nqx/42PEZytv5iecW74mdhXEraa3ZoQvi/QdU4COfC+0Cq8IdcjvO6He6Sedpe31Cw4kustmO8Hg==
X-Gm-Message-State: AOJu0Yxm0n61/5cscCOHOPbmzspy2NcIFOCmkV667M103KhFrUGyXpM1
	FEfGQ8Fms0BDR1UTZOl6agK0Il+XIYipkICAqLqNYk6vwT688oVI5JFvdRB457+VXCO/pbRmMA3
	SUmzptPjJEewah8pdJBbUqDgVeNhwzpZJuRr0Tg==
X-Google-Smtp-Source: AGHT+IH+Co7wnYCaVbcXoiOExnp9w7t/+wCnTVwTyg+qbqeg7aWO86bz6NfNRw5NaJtVGJUHBv9nijoH3pab6TDOIWw=
X-Received: by 2002:a05:6a20:8f0c:b0:1a1:4cd2:4398 with SMTP id
 b12-20020a056a208f0c00b001a14cd24398mr4593260pzk.8.1709720943091; Wed, 06 Mar
 2024 02:29:03 -0800 (PST)
MIME-Version: 1.0
References: <20240220171457.703-1-kprateek.nayak@amd.com> <CAKfTPtBqPVQ5bo8HTZ=sPCUTYr48qtH61A8Z1dwCT434O7cSyQ@mail.gmail.com>
 <bf7b4e37-51cf-50d6-dc8e-626f29b5bdd8@amd.com>
In-Reply-To: <bf7b4e37-51cf-50d6-dc8e-626f29b5bdd8@amd.com>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Wed, 6 Mar 2024 11:28:51 +0100
Message-ID: <CAKfTPtCbofSw5eyMNtimRC_ZT66w4727h0w5v73R7bnsQ54ong@mail.gmail.com>
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

On Wed, 6 Mar 2024 at 11:18, K Prateek Nayak <kprateek.nayak@amd.com> wrote:
>
> Hello Vincent,
>
> Thank you for taking a look at the series.
>
> On 3/6/2024 3:29 PM, Vincent Guittot wrote:
> > Hi Prateek,
> >
> > Adding Julia who could be interested in this patchset. Your patchset
> > should trigger idle load balance instead of newly idle load balance
> > now when the polling is used. This was one reason for not migrating
> > task in idle CPU
>
> Thank you.
>
> >
> > On Tue, 20 Feb 2024 at 18:15, K Prateek Nayak <kprateek.nayak@amd.com> wrote:
> >>
> >> Hello everyone,
> >>
> >> [..snip..]
> >>
> >>
> >> Skipping newidle_balance()
> >> ==========================
> >>
> >> In an earlier attempt to solve the challenge of the long IRQ disabled
> >> section, newidle_balance() was skipped when a CPU waking up from idle
> >> was found to have no runnable tasks, and was transitioning back to
> >> idle [2]. Tim [3] and David [4] had pointed out that newidle_balance()
> >> may be viable for CPUs that are idling with tick enabled, where the
> >> newidle_balance() has the opportunity to pull tasks onto the idle CPU.
> >>
> >> Vincent [5] pointed out a case where the idle load kick will fail to
> >> run on an idle CPU since the IPI handler launching the ILB will check
> >> for need_resched(). In such cases, the idle CPU relies on
> >> newidle_balance() to pull tasks towards itself.
> >
> > Calling newidle_balance() instead of the normal idle load balance
> > prevents the CPU to pull tasks from other groups
>
> Thank you for the correction.
>
> >
> >>
> >> Using an alternate flag instead of NEED_RESCHED to indicate a pending
> >> IPI was suggested as the correct approach to solve this problem on the
> >> same thread.
> >>
> >>
> >> Proposed solution: TIF_NOTIFY_IPI
> >> =================================
> >>
> >> Instead of reusing TIF_NEED_RESCHED bit to pull an TIF_POLLING CPU out
> >> of idle, TIF_NOTIFY_IPI is a newly introduced flag that
> >> call_function_single_prep_ipi() sets on a target TIF_POLLING CPU to
> >> indicate a pending IPI, which the idle CPU promises to process soon.
> >>
> >> On architectures that do not support the TIF_NOTIFY_IPI flag (this
> >> series only adds support for x86 and ARM processors for now),
> >
> > I'm surprised that you are mentioning ARM processors because they
> > don't use TIF_POLLING.
>
> Yup I just realised that after Linus Walleij pointed it out on the
> thread.
>
> >
> >> call_function_single_prep_ipi() will fallback to setting
> >> TIF_NEED_RESCHED bit to pull the TIF_POLLING CPU out of idle.
> >>
> >> Since the pending IPI handlers are processed before the call to
> >> schedule_idle() in do_idle(), schedule_idle() will only be called if the
> >> IPI handler have woken / migrated a new task on the idle CPU and has set
> >> TIF_NEED_RESCHED bit to indicate the same. This avoids running into the
> >> long IRQ disabled section in schedule_idle() unnecessarily, and any
> >> need_resched() check within a call function will accurately notify if a
> >> task is waiting for CPU time on the CPU handling the IPI.
> >>
> >> Following is the crude visualization of how the situation changes with
> >> the newly introduced TIF_NOTIFY_IPI flag:
> >> --
> >> CPU0                                                    CPU1
> >> ====                                                    ====
> >>                                                         do_idle() {
> >>                                                                 __current_set_polling();
> >>                                                                 ...
> >>                                                                 monitor(addr);
> >>                                                                 if (!need_resched_or_ipi())
> >>                                                                         mwait() {
> >>                                                                         /* Waiting */
> >> smp_call_function_single(CPU1, func, wait = 1) {                                ...
> >>         ...                                                                     ...
> >>         set_nr_if_polling(CPU1) {                                               ...
> >>                 /* Realizes CPU1 is polling */                                  ...
> >>                 try_cmpxchg(addr,                                               ...
> >>                             &val,                                               ...
> >>                             val | _TIF_NOTIFY_IPI);                             ...
> >>         } /* Does not send an IPI */                                            ...
> >>         ...                                                             } /* mwait exit due to write at addr */
> >>         csd_lock_wait() {                                       ...
> >>         /* Waiting */                                           preempt_fold_need_resched(); /* fold if NEED_RESCHED */
> >>                 ...                                             __current_clr_polling();
> >>                 ...                                             flush_smp_call_function_queue() {
> >>                 ...                                                     func(); /* Will set NEED_RESCHED if sched_ttwu_pending() */
> >>         } /* End of wait */                                     }
> >> }                                                               if (need_resched()) {
> >>                                                                         schedule_idle();
> >> smp_call_function_single(CPU1, func, wait = 1) {                }
> >>         ...                                                     ... /* IRQs remain enabled */
> >>         arch_send_call_function_single_ipi(CPU1); ----------->  /* Processes the IPI */
> >> --
> >>
> >> Results
> >> =======
> >>
> >> With the TIF_NOTIFY_IPI, the time taken to complete a fixed set of IPIs
> >> using ipistorm improves drastically. Following are the numbers from the
> >> same dual socket 3rd Generation EPYC system (2 x 64C/128T) (boost on,
> >> C2 disabled) running ipistorm between CPU8 and CPU16:
> >>
> >> cmdline: insmod ipistorm.ko numipi=100000 single=1 offset=8 cpulist=8 wait=1
> >>
> >>   ==================================================================
> >>   Test          : ipistorm (modified)
> >>   Units         : Normalized runtime
> >>   Interpretation: Lower is better
> >>   Statistic     : AMean
> >>   ==================================================================
> >>   kernel:                               time [pct imp]
> >>   tip:sched/core                        1.00 [0.00]
> >>   tip:sched/core + revert               0.81 [19.36]
> >>   tip:sched/core + TIF_NOTIFY_IPI       0.20 [80.99]
> >>
> >> Same experiment was repeated on an dual socket ARM server (2 x 64C)
> >> which too saw a significant improvement in the ipistorm performance:
> >
> > Could you share more details about this ARM server ? Could it be an Arm64 one ?
> > I was not expecting any change for arm/arm64 which are not using TIF_POLLING
>
> I looked at the lscpu output and it said It was an "aarch64" server with
> model name "Neoverse-N1". Let me go back and test it once again just to
> be sure I did not catch a one off behavior (Might be a while since I
> have limited access to this machine) I'll also add a debug
> WARN_ON_ONCE() to see if "TIF_NOTIF_IPI" is being set.
>
> >
> >
> >>
> >>   ==================================================================
> >>   Test          : ipistorm (modified)
> >>   Units         : Normalized runtime
> >>   Interpretation: Lower is better
> >>   Statistic     : AMean
> >>   ==================================================================
> >>   kernel:                               time [pct imp]
> >>   tip:sched/core                        1.00 [0.00]
> >>   tip:sched/core + TIF_NOTIFY_IPI       0.41 [59.29]
> >>
> >> netperf and tbench results with the patch match the results on tip on
> >> the dual socket 3rd Generation AMD system (2 x 64C/128T). Additionally,
> >> hackbench, stream, and schbench too were tested, with results from the
> >> patched kernel matching that of the tip.
> >>
> >>
> >> Future Work
> >> ===========
> >>
> >> Evaluate impact of newidle_balance() when scheduler tick hits an idle
> >> CPU. The call to newidle_balance() will be skipped with the
> >
> > But it should call the normal idle load balance instead
>
> Yup, but the frequency of normal idle balance will be lower than the
> frequency at which a newidle balance is being triggered currently if
> tick is not disabled right? Please correct me if I'm wrong.

No it should be the same. When a cpu is idle, we do some periodic idle
load balance either directly on the CPU if it has not stopped its tick
or we wakes up one idle CPU to run the idle load balance of all idle
cpus which stopped their tick.

The newidle balance happens when the cpu becomes idle, i.e. when the
current thread is going to sleep and before idle thread becomes the
current.

The newidle balance has some restrictions compared to idle load balance

>
> >
> >> TIF_NOTIFY_IPI solution similar to [2]. Counter argument for the case is
> >> that if the idle state did not set the TIF_POLLING bit, the idle CPU
> >> would not have called schedule_idle() unless the IPI handler set the
> >> NEED_RESCHED bit.
> >>
> >>
> >> Links
> >> =====
> >>
> >> [1] https://github.com/antonblanchard/ipistorm
> >> [2] https://lore.kernel.org/lkml/20240119084548.2788-1-kprateek.nayak@amd.com/
> >> [3] https://lore.kernel.org/lkml/b4f5ac150685456cf45a342e3bb1f28cdd557a53.camel@linux.intel.com/
> >> [4] https://lore.kernel.org/lkml/20240123211756.GA221793@maniforge/
> >> [5] https://lore.kernel.org/lkml/CAKfTPtC446Lo9CATPp7PExdkLhHQFoBuY-JMGC7agOHY4hs-Pw@mail.gmail.com/
> >>
> >> This series is based on tip:sched/core at tag "sched-core-2024-01-08".
> >> [..snip..]
> >>
>
> --
> Thanks and Regards,
> Prateek
