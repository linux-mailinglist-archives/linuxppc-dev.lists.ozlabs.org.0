Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BA1695070CD
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Apr 2022 16:41:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KjRMf6080z3bjG
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Apr 2022 00:41:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=arm.com
 (client-ip=217.140.110.172; helo=foss.arm.com;
 envelope-from=mark.rutland@arm.com; receiver=<UNKNOWN>)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by lists.ozlabs.org (Postfix) with ESMTP id 4KjRMD0hbPz2yJ5
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 Apr 2022 00:41:25 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E1E041063;
 Tue, 19 Apr 2022 07:40:52 -0700 (PDT)
Received: from FVFF77S0Q05N (unknown [10.57.75.72])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A597E3F766;
 Tue, 19 Apr 2022 07:40:49 -0700 (PDT)
Date: Tue, 19 Apr 2022 15:40:45 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: He Zhe <zhe.he@windriver.com>
Subject: Re: [PATCH RFC 2/8] arm64: stacktrace: Add arch_within_stack_frames
Message-ID: <Yl7J7aVzKiWRtrGi@FVFF77S0Q05N>
References: <20220418132217.1573072-1-zhe.he@windriver.com>
 <20220418132217.1573072-3-zhe.he@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220418132217.1573072-3-zhe.he@windriver.com>
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
Cc: linux-arm-kernel@lists.infradead.org, linux-s390@vger.kernel.org,
 x86@kernel.org, hpa@zytor.com, keescook@chromium.org,
 alexander.shishkin@linux.intel.com, catalin.marinas@arm.com,
 dave.hansen@linux.intel.com, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, bp@alien8.de,
 svens@linux.ibm.com, jolsa@kernel.org, namhyung@kernel.org, tglx@linutronix.de,
 borntraeger@linux.ibm.com, will@kernel.org, linux-riscv@lists.infradead.org,
 paulus@samba.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi,

On Mon, Apr 18, 2022 at 09:22:11PM +0800, He Zhe wrote:
> This function checks if the given address range crosses frame boundary.

I don't think that's quite true, becuase arm64's procedure call standard
(AAPCS64) doesn't give us enough information to determine this without
additional metadata from the compiler, which we simply don't have today.

Since there's a lot of confusion in this area, I've made a bit of an info dump
below, before review on the patch itself, but TBH I'm struggling to see that
this is all that useful.

On arm64, we use a calling convention called AAPCS64, (in full: "Procedure Call
Standard for the Arm® 64-bit Architecture (AArch64)"). That's maintained at:

  https://github.com/ARM-software/abi-aa

... with the latest release (as of today) at:

  https://github.com/ARM-software/abi-aa/blob/60a8eb8c55e999d74dac5e368fc9d7e36e38dda4/aapcs64/aapcs64.rst
  https://github.com/ARM-software/abi-aa/releases/download/2022Q1/aapcs64.pdf

In AAPCS64, there are two related but distinct things to be aware of:

* The "stack frame" of a function, which is the entire contiguous region of
  stack memory used by a function.

* The "frame record", which is the saved FP and LR placed *somewhere* within
  the function's stack frame. The FP points at the most recent frame record on
  the stack, and at function call boundaries points at the caller's frame
  record.

AAPCS64 doesn't say *where* a frame record is placed within a stack frame, and
there are reasons for compilers to place above and below it. So in genral, a
functionss stack frame looks like:
      
        +=========+
        |  above  |
        |---------|
        | FP | LR |
        |---------|
        |  below  |
        +=========+

... where the "above" or "below" portions might be any size (even 0 bytes).

Typical code generation today means for most functions that the "below" portion
is 0 bytes in size, but this is not guaranteed, and even today there are cases
where this is not true.

When one function calls another without a stack transition, that looks like:

        +=========+ ___
        |  above  |    \
        |---------|    |
     ,->| FP | LR |    +-- Caller's stack frame
     |  |---------|    |
     |  |  below  | ___/
     |  +=========+ ___ 
     |  |  above  |    \
     |  |---------|    |
     '--| FP | LR |    +-- Callee's stack frame
        |---------|    |
        |  below  | ___/
        +=========+

Where there's a stack transition, and the new stack is at a *lower* VA than the
old stack, that looks like:

        +=========+ ___
        |  above  |    \
        |---------|    |
     ,->| FP | LR |    +-- Caller's stack frame
     |  |---------|    |
     |  |  below  | ___/
     |  +=========+
     | 
     |  ~~~~~~~~~~~
     |  Arbitrarily 
     |  large gap,
     |  potentially
     |  including
     |  other data
     |  ~~~~~~~~~~~
     |
     |  +=========+ ___ 
     |  |  above  |    \
     |  |---------|    |
     '--| FP | LR |    +-- Callee's stack frame
        |---------|    |
        |  below  | ___/
        +=========+

Where there's a stack transition, and the new stack is at a *higher* VA than
the old stack, that looks like:

        +=========+ ___ 
        |  above  |    \
        |---------|    |
     ,--| FP | LR |    +-- Callee's stack frame
     |  |---------|    |
     |  |  below  | ___/
     |  +=========+
     |
     |  ~~~~~~~~~~~
     |  Arbitrarily 
     |  large gap,
     |  potentially
     |  including
     |  other data
     |  ~~~~~~~~~~~
     | 
     |  +=========+ ___
     |  |  above  |    \
     |  |---------|    |
     '->| FP | LR |    +-- Caller's stack frame
        |---------|    |
        |  below  | ___/
        +=========+
 
In all of these cases, we *cannot* identify the boundary between the two stack
frames, we can *only* identify where something overlaps a frame record. That
might itself be a good thing, but it's not the same thing as what you describe
in the commit message.

> It is based on the existing x86 algorithm, but implemented via stacktrace.
> This can be tested by USERCOPY_STACK_FRAME_FROM and
> USERCOPY_STACK_FRAME_TO in lkdtm.

Can you please explain *why* we'd want this?

Who do we expect to use this?

What's the overhead in practice?

Has this passed a more realistic stress test (e.g. running some userspace
applications which make intensive use of copies to/from the kernel)?

> 
> Signed-off-by: He Zhe <zhe.he@windriver.com>
> ---
>  arch/arm64/Kconfig                   |  1 +
>  arch/arm64/include/asm/thread_info.h | 12 +++++
>  arch/arm64/kernel/stacktrace.c       | 76 ++++++++++++++++++++++++++--
>  3 files changed, 85 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> index 57c4c995965f..0f52a83d7771 100644
> --- a/arch/arm64/Kconfig
> +++ b/arch/arm64/Kconfig
> @@ -165,6 +165,7 @@ config ARM64
>  	select HAVE_ARCH_TRACEHOOK
>  	select HAVE_ARCH_TRANSPARENT_HUGEPAGE
>  	select HAVE_ARCH_VMAP_STACK
> +	select HAVE_ARCH_WITHIN_STACK_FRAMES
>  	select HAVE_ARM_SMCCC
>  	select HAVE_ASM_MODVERSIONS
>  	select HAVE_EBPF_JIT
> diff --git a/arch/arm64/include/asm/thread_info.h b/arch/arm64/include/asm/thread_info.h
> index e1317b7c4525..b839ad9f2248 100644
> --- a/arch/arm64/include/asm/thread_info.h
> +++ b/arch/arm64/include/asm/thread_info.h
> @@ -58,6 +58,18 @@ void arch_setup_new_exec(void);
>  void arch_release_task_struct(struct task_struct *tsk);
>  int arch_dup_task_struct(struct task_struct *dst,
>  				struct task_struct *src);
> +/*
> + * Walks up the stack frames to make sure that the specified object is
> + * entirely contained by a single stack frame.
> + *
> + * Returns:
> + *	GOOD_FRAME	if within a frame

As above, we cannot identify this reliably.

> + *	BAD_STACK	if placed across a frame boundary (or outside stack)
> + *	NOT_STACK	unable to determine (no frame pointers, etc)

On arm64 we always have frame pointers enabled, so this is a confusing comment.
Is this a copy-paste from x86?

> + */
> +int arch_within_stack_frames(const void * const stack,
> +		const void * const stackend,
> +		const void *obj, unsigned long len);
>  
>  #endif
>  
> diff --git a/arch/arm64/kernel/stacktrace.c b/arch/arm64/kernel/stacktrace.c
> index e4103e085681..219b90c1de12 100644
> --- a/arch/arm64/kernel/stacktrace.c
> +++ b/arch/arm64/kernel/stacktrace.c
> @@ -145,12 +145,17 @@ NOKPROBE_SYMBOL(unwind_frame);
>  
>  static void notrace walk_stackframe(struct task_struct *tsk,
>  				    struct stackframe *frame,
> -				    bool (*fn)(void *, unsigned long), void *data)
> +				    stack_trace_consume_fn fn, void *data)
>  {
> +	struct frame_info fi;
> +
>  	while (1) {
>  		int ret;
>  
> -		if (!fn(data, frame->pc))
> +		fi.pc = frame->pc;
> +		fi.fp = frame->fp;
> +		fi.prev_fp = frame->prev_fp;
> +		if (!fn(data, &fi))
>  			break;
>  		ret = unwind_frame(tsk, frame);
>  		if (ret < 0)

As on my prior comment, I don't think we want to alter our generic stack walker
in this way. If we need more info, I'd prefer to expose this in layers, keeping
arch_stack_walk unchanged, but having an arm64_stack_walk that can pass some
arm64-specific data.

> @@ -159,10 +164,10 @@ static void notrace walk_stackframe(struct task_struct
> *tsk,
>  }
>  NOKPROBE_SYMBOL(walk_stackframe);
>  
> -static bool dump_backtrace_entry(void *arg, unsigned long where)
> +static bool dump_backtrace_entry(void *arg, struct frame_info *fi)
>  {
>  	char *loglvl = arg;
> -	printk("%s %pSb\n", loglvl, (void *)where);
> +	printk("%s %pSb\n", loglvl, (void *)fi->pc);
>  	return true;
>  }
>  
> @@ -210,3 +215,66 @@ noinline notrace void arch_stack_walk(stack_trace_consume_fn consume_entry,
>  
>  	walk_stackframe(task, &frame, consume_entry, cookie);
>  }
> +
> +struct arch_stack_object {
> +	unsigned long start;
> +	unsigned long len;
> +	int flag;

What is "flag" ?

> +};
> +
> +static bool arch_stack_object_check(void *data, struct frame_info *fi)
> +{
> +	struct arch_stack_object *obj = (struct arch_stack_object *)data;
> +
> +	/* Skip the frame of arch_within_stack_frames itself */
> +	if (fi->prev_fp == 0)
> +		return true;

That's not what this is skipping. The first time arch_stack_walk() is called,
it gives the PC of its caller (i.e. arch_within_stack_frames), and it's own
synthetic FP. The next time around it gives the FP of it's caller.

> +
> +	/*
> +	 * low ----------------------------------------------> high
> +	 * [saved bp][saved ip][args][local vars][saved bp][saved ip]
> +	 *                     ^----------------^
> +	 *               allow copies only within here
> +	 */

This diagram is not valid for arm64. There is no "bp" or "ip", and each stack
frame can be laid out more arbitrarily relative to the frame record.

> +	if (obj->start + obj->len <= fi->fp) {
> +		obj->flag = obj->start >=
> +			fi->prev_fp + 2 * sizeof(void *) ?
> +			GOOD_FRAME : BAD_STACK;

This check is broken in several ways if there's a stack transition, since the
placement of fp and prev_fp is legitimately arbitrary.

This would also be a lot clearer if you bailed out early rather than nesting
checks.

The best thing you can realistically do is check that the object falls entirely
within a given stack, then check that that no frames intersect the object. You
don't need prev_fp for that, since you can just check each frame record in
turn, then bail out once the object has been passed (i.e. once we've hit the
correct stack, and either seen an FP above it or transitioned to another
stack).

> +		return false;
> +	} else
> +		return true;
> +}
> +
> +/*
> + * Walks up the stack frames to make sure that the specified object is
> + * entirely contained by a single stack frame.
> + *
> + * Returns:
> + *	GOOD_FRAME	if within a frame
> + *	BAD_STACK	if placed across a frame boundary (or outside stack)
> + *	NOT_STACK	unable to determine (no frame pointers, etc)
> + */

This is the exact same comment as in the header. My comments from there apply
here, and one of the two should disappear.

> +int arch_within_stack_frames(const void * const stack,
> +		const void * const stackend,
> +		const void *obj, unsigned long len)
> +{
> +#if defined(CONFIG_FRAME_POINTER)

As above, this *cannot* be selected on arm64.

> +	struct arch_stack_object object;
> +	struct pt_regs regs;
> +
> +	if (__builtin_frame_address(1) == 0)
> +		return NOT_STACK;

When do you expect this to happen?

> +
> +	object.start = (unsigned long)obj;
> +	object.len = len;
> +	object.flag = NOT_STACK;
> +
> +	regs.regs[29] = (u64)__builtin_frame_address(1);

NAK to making a synthetic pt_regs like this. That an abuse of the existing API,
and you don't need to do this in the first place.

> +
> +	arch_stack_walk(arch_stack_object_check, (void *)&object, NULL, &regs);

A void pointer cast is not necessary.

Thanks,
Mark.

> +
> +	return object.flag;
> +#else
> +	return NOT_STACK;
> +#endif
> +}
> -- 
> 2.25.1
> 
