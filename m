Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 52E7749FD03
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Jan 2022 16:43:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JlhZG27T8z3c7f
	for <lists+linuxppc-dev@lfdr.de>; Sat, 29 Jan 2022 02:43:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=arm.com
 (client-ip=217.140.110.172; helo=foss.arm.com;
 envelope-from=mark.rutland@arm.com; receiver=<UNKNOWN>)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by lists.ozlabs.org (Postfix) with ESMTP id 4JlhYm31Blz30Mn
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 29 Jan 2022 02:43:05 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E493712FC;
 Fri, 28 Jan 2022 07:43:01 -0800 (PST)
Received: from FVFF77S0Q05N (unknown [10.57.13.45])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4654F3F793;
 Fri, 28 Jan 2022 07:42:59 -0800 (PST)
Date: Fri, 28 Jan 2022 15:42:48 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: Sven Schnelle <svens@linux.ibm.com>
Subject: Re: ftrace hangs waiting for rcu (was: Re: [PATCH] ftrace: Have
 architectures opt-in for mcount build time sorting)
Message-ID: <YfQCohKWJg9H+uID@FVFF77S0Q05N>
References: <20220127114249.03b1b52b@gandalf.local.home>
 <YfLjIOlGfFmbh1Zv@FVFF77S0Q05N> <yt9dy231yq90.fsf_-_@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <yt9dy231yq90.fsf_-_@linux.ibm.com>
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
Cc: Kees Cook <keescook@chromium.org>, "Paul E. McKenney" <paulmck@kernel.org>,
 hca@linux.ibm.com, LKML <linux-kernel@vger.kernel.org>,
 Steven Rostedt <rostedt@goodmis.org>, Ingo Molnar <mingo@kernel.org>,
 linux-s390@vgr.kernel.org, Sachin Sant <sachinp@linux.ibm.com>,
 Russell King <linux@armlinux.org.uk>,
 Andrew Morton <akpm@linux-foundation.org>, Yinan Liu <yinan@linux.alibaba.com>,
 linuxppc-dev@lists.ozlabs.org, Ard Biesheuvel <ardb@kernel.org>,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Sven,

On Thu, Jan 27, 2022 at 07:42:35PM +0100, Sven Schnelle wrote:
> Mark Rutland <mark.rutland@arm.com> writes:
> 
> > * I intermittently see a hang when running the tests. I previously hit that
> >   when originally trying to bisect this issue (and IIRC that bisected down to
> >   some RCU changes, but I need to re-run that). When the tests hang I
> >   magic-srsrq + L tells me:
> >
> >   [  271.938438] sysrq: Show Blocked State
> >   [  271.939245] task:ftracetest      state:D stack:    0 pid: 5687 ppid:  5627 flags:0x00000200
> >   [  271.940961] Call trace:
> >   [  271.941472]  __switch_to+0x104/0x160
> >   [  271.942213]  __schedule+0x2b0/0x6e0
> >   [  271.942933]  schedule+0x5c/0xf0
> >   [  271.943586]  schedule_timeout+0x184/0x1c4
> >   [  271.944410]  wait_for_completion+0x8c/0x12c
> >   [  271.945274]  __wait_rcu_gp+0x184/0x190
> >   [  271.946047]  synchronize_rcu_tasks_rude+0x48/0x70
> >   [  271.947007]  update_ftrace_function+0xa4/0xec
> >   [  271.947897]  __unregister_ftrace_function+0xa4/0xf0
> >   [  271.948898]  unregister_ftrace_function+0x34/0x70
> >   [  271.949857]  wakeup_tracer_reset+0x4c/0x100
> >   [  271.950713]  tracing_set_tracer+0xd0/0x2b0
> >   [  271.951552]  tracing_set_trace_write+0xe8/0x150
> >   [  271.952477]  vfs_write+0xfc/0x284
> >   [  271.953171]  ksys_write+0x7c/0x110
> >   [  271.953874]  __arm64_sys_write+0x2c/0x40
> >   [  271.954678]  invoke_syscall+0x5c/0x130
> >   [  271.955442]  el0_svc_common.constprop.0+0x108/0x130
> >   [  271.956435]  do_el0_svc+0x74/0x90
> >   [  271.957124]  el0_svc+0x2c/0x90
> >   [  271.957757]  el0t_64_sync_handler+0xa8/0x12c
> >   [  271.958629]  el0t_64_sync+0x1a0/0x1a4

On arm64 I bisected this down to:

  7a30871b6a27de1a ("rcu-tasks: Introduce ->percpu_enqueue_shift for dynamic queue selection")

Which was going wrong because ilog2() rounds down, and so the shift was wrong
for any nr_cpus that was not a power-of-two. Paul had already fixed that in
rcu-next, and just sent a pull request to Linus:

  https://lore.kernel.org/lkml/20220128143251.GA2398275@paulmck-ThinkPad-P17-Gen-1/

With that applied, I no longer see these hangs.

Does your s390 test machine have a non-power-of-two nr_cpus, and does that fix
the issue for you?

On arm64 the startup tests didn't seem to trigger the hang, but I was able to
trigger the hang fairly reliably with the ftrace selftests, e.g.

  $ for N in $(seq 1 10); do ./ftracetest test.d/00basic/basic2.tc; done

... which prior to the fix, would hang between runs 2 to 5.

Thanks,
Mark.

> that's interesting. On s390 i'm seeing the same problem in CI, but with
> the startup ftrace tests. So that's likely not arm64 spacific.
> 
> On s390, the last messages from ftrace are [    5.663568] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 19112604462750000 ns
> [    5.667099] futex hash table entries: 65536 (order: 12, 16777216 bytes, vmalloc)
> [    5.739549] Running postponed tracer tests:
> [    5.740662] Testing tracer function: PASSED
> [    6.194635] Testing dynamic ftrace: PASSED
> [    6.471213] Testing dynamic ftrace ops #1: 
> [    6.558445] (1 0 1 0 0) 
> [    6.558458] (1 1 2 0 0) 
> [    6.699135] (2 1 3 0 764347) 
> [    6.699252] (2 2 4 0 766466) 
> [    6.759857] (3 2 4 0 1159604)
> [..] hangs here
> 
> The backtrace looks like this, which is very similar to the one above:
> 
> crash> bt 1
> PID: 1      TASK: 80e68100          CPU: 133  COMMAND: "swapper/0"
>  #0 [380004df808] __schedule at cda39f0e
>  #1 [380004df880] schedule at cda3a488
>  #2 [380004df8b0] schedule_timeout at cda41ef6
>  #3 [380004df978] wait_for_completion at cda3bd0a
>  #4 [380004df9d8] __wait_rcu_gp at ccdddd92
>  #5 [380004dfa30] synchronize_rcu_tasks_generic at ccdde0aa
>  #6 [380004dfad8] ftrace_shutdown at cce7b050
>  #7 [380004dfb18] unregister_ftrace_function at cce7b192
>  #8 [380004dfb50] trace_selftest_ops at cda1e0fa
>  #9 [380004dfba0] run_tracer_selftest at cda1e4f2
> #10 [380004dfc00] trace_selftest_startup_function at ce74355c
> #11 [380004dfc58] run_tracer_selftest at cda1e2fc
> #12 [380004dfc98] init_trace_selftests at ce742d30
> #13 [380004dfcd0] do_one_initcall at cccdca16
> #14 [380004dfd68] do_initcalls at ce72e776
> #15 [380004dfde0] kernel_init_freeable at ce72ea60
> #16 [380004dfe50] kernel_init at cda333fe
> #17 [380004dfe68] __ret_from_fork at cccdf920
> #18 [380004dfe98] ret_from_fork at cda444ca
> 
> I didn't had success reproducing it so far, but it is good to know that
> this also happens when running the ftrace testsuite.
> 
> I have several crashdumps, so i could try to pull out some information
> if someone tells me what to look for.
> 
> Thanks,
> Sven
