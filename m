Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EBDA49EA4F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Jan 2022 19:24:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jl8B70Clfz3cCg
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Jan 2022 05:24:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=arm.com
 (client-ip=217.140.110.172; helo=foss.arm.com;
 envelope-from=mark.rutland@arm.com; receiver=<UNKNOWN>)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by lists.ozlabs.org (Postfix) with ESMTP id 4Jl89c6RQjz30NB
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Jan 2022 05:23:45 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 92C8A1FB;
 Thu, 27 Jan 2022 10:23:42 -0800 (PST)
Received: from FVFF77S0Q05N (unknown [10.57.14.34])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B871C3F7D7;
 Thu, 27 Jan 2022 10:23:40 -0800 (PST)
Date: Thu, 27 Jan 2022 18:23:28 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [PATCH] ftrace: Have architectures opt-in for mcount build time
 sorting
Message-ID: <YfLjIOlGfFmbh1Zv@FVFF77S0Q05N>
References: <20220127114249.03b1b52b@gandalf.local.home>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220127114249.03b1b52b@gandalf.local.home>
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
Cc: Kees Cook <keescook@chromium.org>, LKML <linux-kernel@vger.kernel.org>,
 Ingo Molnar <mingo@kernel.org>, Sachin Sant <sachinp@linux.ibm.com>,
 Russell King <linux@armlinux.org.uk>,
 Andrew Morton <akpm@linux-foundation.org>, Yinan Liu <yinan@linux.alibaba.com>,
 linuxppc-dev@lists.ozlabs.org, Ard Biesheuvel <ardb@kernel.org>,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jan 27, 2022 at 11:42:49AM -0500, Steven Rostedt wrote:
> From: "Steven Rostedt (Google)" <rostedt@goodmis.org>
> 
> First S390 complained that the sorting of the mcount sections at build
> time caused the kernel to crash on their architecture. Now PowerPC is
> complaining about it too. And also ARM64 appears to be having issues.
> 
> It may be necessary to also update the relocation table for the values
> in the mcount table. Not only do we have to sort the table, but also
> update the relocations that may be applied to the items in the table.
> 
> If the system is not relocatable, then it is fine to sort, but if it is,
> some architectures may have issues (although x86 does not as it shifts all
> addresses the same).
> 
> Add a HAVE_BUILDTIME_MCOUNT_SORT that an architecture can set to say it is
> safe to do the sorting at build time.
> 
> Also update the config to compile in build time sorting in the sorttable
> code in scripts/ to depend on CONFIG_BUILDTIME_MCOUNT_SORT.
> 
> Link: https://lore.kernel.org/all/944D10DA-8200-4BA9-8D0A-3BED9AA99F82@linux.ibm.com/
> 
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Yinan Liu <yinan@linux.alibaba.com>
> Cc: Ard Biesheuvel <ardb@kernel.org>
> Cc: Kees Cook <keescook@chromium.org>
> Cc: linuxppc-dev@lists.ozlabs.org
> Reported-by: Sachin Sant <sachinp@linux.ibm.com>
> Tested-by: Sachin Sant <sachinp@linux.ibm.com>
> Fixes: 72b3942a173c ("scripts: ftrace - move the sort-processing in ftrace_init")
> Signed-off-by: Steven Rostedt (Google) <rostedt@goodmis.org>

Thanks for this; the rationale and patch makes sense to me. As previously, I
understand that:

* For arch/arm, the build-time sort should be safe as the 32-bit kernel isn't
  virtually relocatable, and so the sort affects the final values, and will not
  be clobbered later.

* For arch/x86, the build time sort should be safe as the mcount_loc will be
  initialazed with values consistent with the default load address, and the
  boot-time relocation will add the same offset to all values, so there's no
  need to sort the relocs.

So enabling this for arch/arm and arch/x86 makes sense to me.

Similarly, I understand that for arm64 the build-time sort isn't sound due to
not adjusting the relocations, and so it needs to be disabled there (for now at
least).

I gave this patch a spin on arm64 atop v5.17-rc1, using GCC 11.1.0 from the
kernel.org crosstool page:

  https://mirrors.edge.kernel.org/pub/tools/crosstool/

... with this applied, I'm no longer seeing a number of ftrace selftest
failures and ftrace internal bugs I previously reported at:

  https://lore.kernel.org/all/YfKGKWW5UfZ15kCW@FVFF77S0Q05N/

It looks like there's a trivial bit of whitespace damage in the patch (noted
below), but regardless:

  Reviewed-by: Mark Rutland <mark.rutland@arm.com>
  Tested-by: Mark Rutland <mark.rutlad@arm.com> [arm64]



As a heads-up, with this issue out of the way I'm hitting some unrelated issues
when running the ftrace selftests on arm64, which I'll look into. Quick summary
on those below, but I'll start new threads once I've got more detail.

* The duplicate events test seems to fail consistently:

  [15] Generic dynamic event - check if duplicate events are caught       [FAIL]

* I intermittently see a hang when running the tests. I previously hit that
  when originally trying to bisect this issue (and IIRC that bisected down to
  some RCU changes, but I need to re-run that). When the tests hang I
  magic-srsrq + L tells me:

  [  271.938438] sysrq: Show Blocked State
  [  271.939245] task:ftracetest      state:D stack:    0 pid: 5687 ppid:  5627 flags:0x00000200
  [  271.940961] Call trace:
  [  271.941472]  __switch_to+0x104/0x160
  [  271.942213]  __schedule+0x2b0/0x6e0
  [  271.942933]  schedule+0x5c/0xf0
  [  271.943586]  schedule_timeout+0x184/0x1c4
  [  271.944410]  wait_for_completion+0x8c/0x12c
  [  271.945274]  __wait_rcu_gp+0x184/0x190
  [  271.946047]  synchronize_rcu_tasks_rude+0x48/0x70
  [  271.947007]  update_ftrace_function+0xa4/0xec
  [  271.947897]  __unregister_ftrace_function+0xa4/0xf0
  [  271.948898]  unregister_ftrace_function+0x34/0x70
  [  271.949857]  wakeup_tracer_reset+0x4c/0x100
  [  271.950713]  tracing_set_tracer+0xd0/0x2b0
  [  271.951552]  tracing_set_trace_write+0xe8/0x150
  [  271.952477]  vfs_write+0xfc/0x284
  [  271.953171]  ksys_write+0x7c/0x110
  [  271.953874]  __arm64_sys_write+0x2c/0x40
  [  271.954678]  invoke_syscall+0x5c/0x130
  [  271.955442]  el0_svc_common.constprop.0+0x108/0x130
  [  271.956435]  do_el0_svc+0x74/0x90
  [  271.957124]  el0_svc+0x2c/0x90
  [  271.957757]  el0t_64_sync_handler+0xa8/0x12c
  [  271.958629]  el0t_64_sync+0x1a0/0x1a4

> ---
>  arch/arm/Kconfig     | 1 +
>  arch/x86/Kconfig     | 1 +
>  kernel/trace/Kconfig | 8 +++++++-
>  scripts/Makefile     | 2 +-
>  4 files changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
> index c2724d986fa0..5256ebe57451 100644
> --- a/arch/arm/Kconfig
> +++ b/arch/arm/Kconfig
> @@ -82,6 +82,7 @@ config ARM
>  	select HAVE_EBPF_JIT if !CPU_ENDIAN_BE32
>  	select HAVE_CONTEXT_TRACKING
>  	select HAVE_C_RECORDMCOUNT
> +	select HAVE_BUILDTIME_MCOUNT_SORT
>  	select HAVE_DEBUG_KMEMLEAK if !XIP_KERNEL
>  	select HAVE_DMA_CONTIGUOUS if MMU
>  	select HAVE_DYNAMIC_FTRACE if !XIP_KERNEL && !CPU_ENDIAN_BE32 && MMU
> diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
> index 7399327d1eff..46080dea5dba 100644
> --- a/arch/x86/Kconfig
> +++ b/arch/x86/Kconfig
> @@ -186,6 +186,7 @@ config X86
>  	select HAVE_CONTEXT_TRACKING_OFFSTACK	if HAVE_CONTEXT_TRACKING
>  	select HAVE_C_RECORDMCOUNT
>  	select HAVE_OBJTOOL_MCOUNT		if STACK_VALIDATION
> +	select HAVE_BUILDTIME_MCOUNT_SORT
>  	select HAVE_DEBUG_KMEMLEAK
>  	select HAVE_DMA_CONTIGUOUS
>  	select HAVE_DYNAMIC_FTRACE
> diff --git a/kernel/trace/Kconfig b/kernel/trace/Kconfig
> index 752ed89a293b..7e5b92090faa 100644
> --- a/kernel/trace/Kconfig
> +++ b/kernel/trace/Kconfig
> @@ -70,10 +70,16 @@ config HAVE_C_RECORDMCOUNT
>  	help
>  	  C version of recordmcount available?
>  
> +config HAVE_BUILDTIME_MCOUNT_SORT
> +       bool
> +       help
> +         An architecture selects this if it sorts the mcount_loc section
> +	 at build time.

Whitespace damage here? The second line has a tab, the first doesn't.

Thanks,
Mark.

> +
>  config BUILDTIME_MCOUNT_SORT
>         bool
>         default y
> -       depends on BUILDTIME_TABLE_SORT && !S390
> +       depends on HAVE_BUILDTIME_MCOUNT_SORT
>         help
>           Sort the mcount_loc section at build time.
>  
> diff --git a/scripts/Makefile b/scripts/Makefile
> index b082d2f93357..cedc1f0e21d8 100644
> --- a/scripts/Makefile
> +++ b/scripts/Makefile
> @@ -32,7 +32,7 @@ HOSTCFLAGS_sorttable.o += -I$(srctree)/tools/arch/x86/include
>  HOSTCFLAGS_sorttable.o += -DUNWINDER_ORC_ENABLED
>  endif
>  
> -ifdef CONFIG_DYNAMIC_FTRACE
> +ifdef CONFIG_BUILDTIME_MCOUNT_SORT
>  HOSTCFLAGS_sorttable.o += -DMCOUNT_SORT_ENABLED
>  endif
>  
> -- 
> 2.33.0
> 
