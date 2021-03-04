Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A26332D5FD
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Mar 2021 16:08:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DrvQW1C1Zz3dFw
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Mar 2021 02:08:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=arm.com
 (client-ip=217.140.110.172; helo=foss.arm.com;
 envelope-from=mark.rutland@arm.com; receiver=<UNKNOWN>)
X-Greylist: delayed 631 seconds by postgrey-1.36 at boromir;
 Fri, 05 Mar 2021 02:08:16 AEDT
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by lists.ozlabs.org (Postfix) with ESMTP id 4DrvPr6vBpz3d32
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 Mar 2021 02:08:15 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B40671FB;
 Thu,  4 Mar 2021 06:57:36 -0800 (PST)
Received: from C02TD0UTHF1T.local (unknown [10.57.53.210])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E80F43F766;
 Thu,  4 Mar 2021 06:57:33 -0800 (PST)
Date: Thu, 4 Mar 2021 14:57:30 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: Marco Elver <elver@google.com>
Subject: Re: [PATCH v1] powerpc: Include running function as first entry in
 save_stack_trace() and friends
Message-ID: <20210304145730.GC54534@C02TD0UTHF1T.local>
References: <e2e8728c4c4553bbac75a64b148e402183699c0c.1614780567.git.christophe.leroy@csgroup.eu>
 <CANpmjNOvgbUCf0QBs1J-mO0yEPuzcTMm7aS1JpPB-17_LabNHw@mail.gmail.com>
 <1802be3e-dc1a-52e0-1754-a40f0ea39658@csgroup.eu>
 <YD+o5QkCZN97mH8/@elver.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YD+o5QkCZN97mH8/@elver.google.com>
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
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 LKML <linux-kernel@vger.kernel.org>, broonie@kernel.org,
 Paul Mackerras <paulus@samba.org>, kasan-dev <kasan-dev@googlegroups.com>,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

[adding Mark Brown]

On Wed, Mar 03, 2021 at 04:20:43PM +0100, Marco Elver wrote:
> On Wed, Mar 03, 2021 at 03:52PM +0100, Christophe Leroy wrote:
> > Le 03/03/2021 ï¿½ 15:38, Marco Elver a ï¿½critï¿½:
> > > On Wed, 3 Mar 2021 at 15:09, Christophe Leroy
> > > <christophe.leroy@csgroup.eu> wrote:
> > > > 
> > > > It seems like all other sane architectures, namely x86 and arm64
> > > > at least, include the running function as top entry when saving
> > > > stack trace.
> > > > 
> > > > Functionnalities like KFENCE expect it.
> > > > 
> > > > Do the same on powerpc, it allows KFENCE to properly identify the faulting
> > > > function as depicted below. Before the patch KFENCE was identifying
> > > > finish_task_switch.isra as the faulting function.
> > > > 
> > > > [   14.937370] ==================================================================
> > > > [   14.948692] BUG: KFENCE: invalid read in test_invalid_access+0x54/0x108
> > > > [   14.948692]
> > > > [   14.956814] Invalid read at 0xdf98800a:
> > > > [   14.960664]  test_invalid_access+0x54/0x108
> > > > [   14.964876]  finish_task_switch.isra.0+0x54/0x23c
> > > > [   14.969606]  kunit_try_run_case+0x5c/0xd0
> > > > [   14.973658]  kunit_generic_run_threadfn_adapter+0x24/0x30
> > > > [   14.979079]  kthread+0x15c/0x174
> > > > [   14.982342]  ret_from_kernel_thread+0x14/0x1c
> > > > [   14.986731]
> > > > [   14.988236] CPU: 0 PID: 111 Comm: kunit_try_catch Tainted: G    B             5.12.0-rc1-01537-g95f6e2088d7e-dirty #4682
> > > > [   14.999795] NIP:  c016ec2c LR: c02f517c CTR: c016ebd8
> > > > [   15.004851] REGS: e2449d90 TRAP: 0301   Tainted: G    B              (5.12.0-rc1-01537-g95f6e2088d7e-dirty)
> > > > [   15.015274] MSR:  00009032 <EE,ME,IR,DR,RI>  CR: 22000004  XER: 00000000
> > > > [   15.022043] DAR: df98800a DSISR: 20000000
> > > > [   15.022043] GPR00: c02f517c e2449e50 c1142080 e100dd24 c084b13c 00000008 c084b32b c016ebd8
> > > > [   15.022043] GPR08: c0850000 df988000 c0d10000 e2449eb0 22000288
> > > > [   15.040581] NIP [c016ec2c] test_invalid_access+0x54/0x108
> > > > [   15.046010] LR [c02f517c] kunit_try_run_case+0x5c/0xd0
> > > > [   15.051181] Call Trace:
> > > > [   15.053637] [e2449e50] [c005a68c] finish_task_switch.isra.0+0x54/0x23c (unreliable)
> > > > [   15.061338] [e2449eb0] [c02f517c] kunit_try_run_case+0x5c/0xd0
> > > > [   15.067215] [e2449ed0] [c02f648c] kunit_generic_run_threadfn_adapter+0x24/0x30
> > > > [   15.074472] [e2449ef0] [c004e7b0] kthread+0x15c/0x174
> > > > [   15.079571] [e2449f30] [c001317c] ret_from_kernel_thread+0x14/0x1c
> > > > [   15.085798] Instruction dump:
> > > > [   15.088784] 8129d608 38e7ebd8 81020280 911f004c 39000000 995f0024 907f0028 90ff001c
> > > > [   15.096613] 3949000a 915f0020 3d40c0d1 3d00c085 <8929000a> 3908adb0 812a4b98 3d40c02f
> > > > [   15.104612] ==================================================================
> > > > 
> > > > Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> > > 
> > > Acked-by: Marco Elver <elver@google.com>
> > > 
> > > Thank you, I think this looks like the right solution. Just a question below:
> > > 
> > ...
> > 
> > > > @@ -59,23 +70,26 @@ void save_stack_trace(struct stack_trace *trace)
> > > > 
> > > >          sp = current_stack_frame();
> > > > 
> > > > -       save_context_stack(trace, sp, current, 1);
> > > > +       save_context_stack(trace, sp, (unsigned long)save_stack_trace, current, 1);
> > > 
> > > This causes ip == save_stack_trace and also below for
> > > save_stack_trace_tsk. Does this mean save_stack_trace() is included in
> > > the trace? Looking at kernel/stacktrace.c, I think the library wants
> > > to exclude itself from the trace, as it does '.skip = skipnr + 1' (and
> > > '.skip   = skipnr + (current == tsk)' for the _tsk variant).
> > > 
> > > If the arch-helper here is included, should this use _RET_IP_ instead?
> > > 
> > 
> > Don't really know, I was inspired by arm64 which has:
> > 
> > void arch_stack_walk(stack_trace_consume_fn consume_entry, void *cookie,
> > 		     struct task_struct *task, struct pt_regs *regs)
> > {
> > 	struct stackframe frame;
> > 
> > 	if (regs)
> > 		start_backtrace(&frame, regs->regs[29], regs->pc);
> > 	else if (task == current)
> > 		start_backtrace(&frame,
> > 				(unsigned long)__builtin_frame_address(0),
> > 				(unsigned long)arch_stack_walk);
> > 	else
> > 		start_backtrace(&frame, thread_saved_fp(task),
> > 				thread_saved_pc(task));
> > 
> > 	walk_stackframe(task, &frame, consume_entry, cookie);
> > }
> > 
> > But looking at x86 you may be right, so what should be done really ?
> 
> x86:
> 
> [    2.843292] calling stack_trace_save:
> [    2.843705]  test_func+0x6c/0x118
> [    2.844184]  do_one_initcall+0x58/0x270
> [    2.844618]  kernel_init_freeable+0x1da/0x23a
> [    2.845110]  kernel_init+0xc/0x166
> [    2.845494]  ret_from_fork+0x22/0x30
> 
> [    2.867525] calling stack_trace_save_tsk:
> [    2.868017]  test_func+0xa9/0x118
> [    2.868530]  do_one_initcall+0x58/0x270
> [    2.869003]  kernel_init_freeable+0x1da/0x23a
> [    2.869535]  kernel_init+0xc/0x166
> [    2.869957]  ret_from_fork+0x22/0x30
> 
> arm64:
> 
> [    3.786911] calling stack_trace_save:
> [    3.787147]  stack_trace_save+0x50/0x78
> [    3.787443]  test_func+0x84/0x13c
> [    3.787738]  do_one_initcall+0x5c/0x310
> [    3.788099]  kernel_init_freeable+0x214/0x294
> [    3.788363]  kernel_init+0x18/0x164
> [    3.788585]  ret_from_fork+0x10/0x30
> 
> [    3.803615] calling stack_trace_save_tsk:
> [    3.804266]  stack_trace_save_tsk+0x9c/0x100
> [    3.804541]  test_func+0xc4/0x13c
> [    3.804803]  do_one_initcall+0x5c/0x310
> [    3.805031]  kernel_init_freeable+0x214/0x294
> [    3.805284]  kernel_init+0x18/0x164
> [    3.805505]  ret_from_fork+0x10/0x30
> 
> +Cc arm64 folks.
> 
> So I think the arm64 version also has a bug, because I think a user of
> <linux/stacktrace.h> really doesn't care about the library function
> itself. And from reading kernel/stacktrace.c I think it wants to exclude
> itself entirely.
>
> It's a shame that <linux/stacktrace.h> isn't better documented, but I'm
> pretty sure that including the library functions in the trace is not
> useful.

I agree this behaviour isn't desireable, and that the lack of
documentation is unfortunate.

It looks like GCC is happy to give us the function-entry-time FP if we use
__builtin_frame_address(1), and assuming clang is similarly happy we can do:

| diff --git a/arch/arm64/kernel/stacktrace.c b/arch/arm64/kernel/stacktrace.c
| index ad20981dfda4..5dfbf915eb7f 100644
| --- a/arch/arm64/kernel/stacktrace.c
| +++ b/arch/arm64/kernel/stacktrace.c
| @@ -203,8 +203,8 @@ void arch_stack_walk(stack_trace_consume_fn consume_entry, void *cookie,
|                 start_backtrace(&frame, regs->regs[29], regs->pc);
|         else if (task == current)
|                 start_backtrace(&frame,
| -                               (unsigned long)__builtin_frame_address(0),
| -                               (unsigned long)arch_stack_walk);
| +                               (unsigned long)__builtin_frame_address(1),
| +                               (unsigned long)__builtin_return_address(0));
|         else
|                 start_backtrace(&frame, thread_saved_fp(task),
|                                 thread_saved_pc(task));

... such that arch_stack_walk() will try to avoid including itself in a
trace, and so the existing skipping should (w/ caveats below) skip
stack_trace_save() or stack_trace_save_tsk().

If that works for you, I can spin that as a patch, though we'll need to
check that doesn't introduce a new fencepost error elsewhere.

The bigger problem here is that skipping is dodgy to begin with, and
this is still liable to break in some cases. One big concern is that
(especially with LTO) we cannot guarantee the compiler will not inline
or outline functions, causing the skipp value to be too large or too
small. That's liable to happen to callers, and in theory (though
unlikely in practice), portions of arch_stack_walk() or
stack_trace_save() could get outlined too.

Unless we can get some strong guarantees from compiler folk such that we
can guarantee a specific function acts boundary for unwinding (and
doesn't itself get split, etc), the only reliable way I can think to
solve this requires an assembly trampoline. Whatever we do is liable to
need some invasive rework.

Thanks,
Mark.
