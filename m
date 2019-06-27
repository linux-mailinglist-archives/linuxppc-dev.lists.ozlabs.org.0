Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F263358544
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Jun 2019 17:10:18 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45ZNcS20X7zDqWM
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Jun 2019 01:10:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=kernel.org
 (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=srs0=021e=u2=goodmis.org=rostedt@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=goodmis.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45ZNZJ1yq2zDqJN
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Jun 2019 01:08:23 +1000 (AEST)
Received: from gandalf.local.home (cpe-66-24-58-225.stny.res.rr.com
 [66.24.58.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0FA2820659;
 Thu, 27 Jun 2019 15:08:20 +0000 (UTC)
Date: Thu, 27 Jun 2019 11:08:19 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
Subject: Re: [PATCH v2 4/7] powerpc/ftrace: Additionally nop out the
 preceding mflr with -mprofile-kernel
Message-ID: <20190627110819.4892780f@gandalf.local.home>
In-Reply-To: <841386feda429a1f0d4b7442c3ede1ed91466f92.1561634177.git.naveen.n.rao@linux.vnet.ibm.com>
References: <cover.1561634177.git.naveen.n.rao@linux.vnet.ibm.com>
 <841386feda429a1f0d4b7442c3ede1ed91466f92.1561634177.git.naveen.n.rao@linux.vnet.ibm.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
Cc: linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>,
 Masami Hiramatsu <mhiramat@kernel.org>, linuxppc-dev@lists.ozlabs.org,
 Ingo Molnar <mingo@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 27 Jun 2019 16:53:52 +0530
"Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com> wrote:

> With -mprofile-kernel, gcc emits 'mflr r0', followed by 'bl _mcount' to
> enable function tracing and profiling. So far, with dynamic ftrace, we
> used to only patch out the branch to _mcount(). However, mflr is
> executed by the branch unit that can only execute one per cycle on
> POWER9 and shared with branches, so it would be nice to avoid it where
> possible.
> 
> We cannot simply nop out the mflr either. When enabling function
> tracing, there can be a race if tracing is enabled when some thread was
> interrupted after executing a nop'ed out mflr. In this case, the thread
> would execute the now-patched-in branch to _mcount() without having
> executed the preceding mflr.
> 
> To solve this, we now enable function tracing in 2 steps: patch in the
> mflr instruction, use 'smp_call_function(isync);
> synchronize_rcu_tasks()' to ensure all existing threads make progress,
> and then patch in the branch to _mcount(). We override
> ftrace_replace_code() with a powerpc64 variant for this purpose.

You may want to explain that you do the reverse when patching it out.
That is, patch out the "bl _mcount" into a nop and then patch out the
"mflr r0". But interesting, I don't see a synchronize_rcu_tasks() call
there.


> 
> Suggested-by: Nicholas Piggin <npiggin@gmail.com>
> Reviewed-by: Nicholas Piggin <npiggin@gmail.com>
> Signed-off-by: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>
> ---
>  arch/powerpc/kernel/trace/ftrace.c | 258 ++++++++++++++++++++++++++---
>  1 file changed, 236 insertions(+), 22 deletions(-)
> 
> diff --git a/arch/powerpc/kernel/trace/ftrace.c b/arch/powerpc/kernel/trace/ftrace.c
> index 517662a56bdc..86c2b50dcaa9 100644
> --- a/arch/powerpc/kernel/trace/ftrace.c
> +++ b/arch/powerpc/kernel/trace/ftrace.c
> @@ -125,7 +125,7 @@ __ftrace_make_nop(struct module *mod,
>  {
>  	unsigned long entry, ptr, tramp;
>  	unsigned long ip = rec->ip;
> -	unsigned int op, pop;
> +	unsigned int op;
>  
>  	/* read where this goes */
>  	if (probe_kernel_read(&op, (void *)ip, sizeof(int))) {
> @@ -160,8 +160,6 @@ __ftrace_make_nop(struct module *mod,
>  
>  #ifdef CONFIG_MPROFILE_KERNEL
>  	/* When using -mkernel_profile there is no load to jump over */
> -	pop = PPC_INST_NOP;
> -
>  	if (probe_kernel_read(&op, (void *)(ip - 4), 4)) {
>  		pr_err("Fetching instruction at %lx failed.\n", ip - 4);
>  		return -EFAULT;
> @@ -169,26 +167,23 @@ __ftrace_make_nop(struct module *mod,
>  
>  	/* We expect either a mflr r0, or a std r0, LRSAVE(r1) */
>  	if (op != PPC_INST_MFLR && op != PPC_INST_STD_LR) {
> -		pr_err("Unexpected instruction %08x around bl _mcount\n", op);
> +		pr_err("Unexpected instruction %08x before bl _mcount\n", op);
>  		return -EINVAL;
>  	}
> -#else
> -	/*
> -	 * Our original call site looks like:
> -	 *
> -	 * bl <tramp>
> -	 * ld r2,XX(r1)
> -	 *
> -	 * Milton Miller pointed out that we can not simply nop the branch.
> -	 * If a task was preempted when calling a trace function, the nops
> -	 * will remove the way to restore the TOC in r2 and the r2 TOC will
> -	 * get corrupted.
> -	 *
> -	 * Use a b +8 to jump over the load.
> -	 */
>  
> -	pop = PPC_INST_BRANCH | 8;	/* b +8 */
> +	/* We should patch out the bl to _mcount first */
> +	if (patch_instruction((unsigned int *)ip, PPC_INST_NOP)) {
> +		pr_err("Patching NOP failed.\n");
> +		return -EPERM;
> +	}
>  
> +	/* then, nop out the preceding 'mflr r0' as an optimization */
> +	if (op == PPC_INST_MFLR &&
> +		patch_instruction((unsigned int *)(ip - 4), PPC_INST_NOP)) {
> +		pr_err("Patching NOP failed.\n");
> +		return -EPERM;
> +	}
> +#else
>  	/*
>  	 * Check what is in the next instruction. We can see ld r2,40(r1), but
>  	 * on first pass after boot we will see mflr r0.
> @@ -202,12 +197,25 @@ __ftrace_make_nop(struct module *mod,
>  		pr_err("Expected %08x found %08x\n", PPC_INST_LD_TOC, op);
>  		return -EINVAL;
>  	}
> -#endif /* CONFIG_MPROFILE_KERNEL */
>  
> -	if (patch_instruction((unsigned int *)ip, pop)) {
> +	/*
> +	 * Our original call site looks like:
> +	 *
> +	 * bl <tramp>
> +	 * ld r2,XX(r1)
> +	 *
> +	 * Milton Miller pointed out that we can not simply nop the branch.
> +	 * If a task was preempted when calling a trace function, the nops
> +	 * will remove the way to restore the TOC in r2 and the r2 TOC will
> +	 * get corrupted.
> +	 *
> +	 * Use a b +8 to jump over the load.
> +	 */
> +	if (patch_instruction((unsigned int *)ip, PPC_INST_BRANCH | 8)) {
>  		pr_err("Patching NOP failed.\n");
>  		return -EPERM;
>  	}
> +#endif /* CONFIG_MPROFILE_KERNEL */
>  
>  	return 0;
>  }
> @@ -421,6 +429,26 @@ static int __ftrace_make_nop_kernel(struct dyn_ftrace *rec, unsigned long addr)
>  		return -EPERM;
>  	}
>  
> +#ifdef CONFIG_MPROFILE_KERNEL

I would think you need to break this up into two parts as well, with a
synchronize_rcu_tasks() in between.

Imagine this scenario:

	<func>:
	nop <-- interrupt comes here, and preempts the task
	nop

First change.

	<func>:
	mflr	r0
	nop

Second change.

	<func>:
	mflr	r0
	bl	_mcount

Task returns from interrupt

	<func>:
	mflr	r0
	bl	_mcount <-- executes here

It never did the mflr r0, because the last command that was executed
was a nop before it was interrupted. And yes, it can be interrupted
on a nop!

-- Steve


> +	/* Nop out the preceding 'mflr r0' as an optimization */
> +	if (probe_kernel_read(&op, (void *)(ip - 4), 4)) {
> +		pr_err("Fetching instruction at %lx failed.\n", ip - 4);
> +		return -EFAULT;
> +	}
> +
> +	/* We expect either a mflr r0, or a std r0, LRSAVE(r1) */
> +	if (op != PPC_INST_MFLR && op != PPC_INST_STD_LR) {
> +		pr_err("Unexpected instruction %08x before bl _mcount\n", op);
> +		return -EINVAL;
> +	}
> +
> +	if (op == PPC_INST_MFLR &&
> +		patch_instruction((unsigned int *)(ip - 4), PPC_INST_NOP)) {
> +		pr_err("Patching NOP failed.\n");
> +		return -EPERM;
> +	}
> +#endif
> +
>  	return 0;
>  }
>  
> @@ -429,6 +457,7 @@ int ftrace_make_nop(struct module *mod,
>  {
>  	unsigned long ip = rec->ip;
>  	unsigned int old, new;
> +	int rc;
>  
>  	/*
>  	 * If the calling address is more that 24 bits away,
> @@ -439,7 +468,34 @@ int ftrace_make_nop(struct module *mod,
>  		/* within range */
>  		old = ftrace_call_replace(ip, addr, 1);
>  		new = PPC_INST_NOP;
> -		return ftrace_modify_code(ip, old, new);
> +		rc = ftrace_modify_code(ip, old, new);
> +#ifdef CONFIG_MPROFILE_KERNEL
> +		if (rc)
> +			return rc;
> +
> +		/*
> +		 * For -mprofile-kernel, we patch out the preceding 'mflr r0'
> +		 * instruction, as an optimization. It is important to nop out
> +		 * the branch to _mcount() first, as a lone 'mflr r0' is
> +		 * harmless.
> +		 */
> +		if (probe_kernel_read(&old, (void *)(ip - 4), 4)) {
> +			pr_err("Fetching instruction at %lx failed.\n", ip - 4);
> +			return -EFAULT;
> +		}
> +
> +		/* We expect either a mflr r0, or a std r0, LRSAVE(r1) */
> +		if (old != PPC_INST_MFLR && old != PPC_INST_STD_LR) {
> +			pr_err("Unexpected instruction %08x before bl _mcount\n",
> +					old);
> +			return -EINVAL;
> +		}
> +
> +		if (old == PPC_INST_MFLR)
> +			rc = patch_instruction((unsigned int *)(ip - 4),
> +					PPC_INST_NOP);
> +#endif
> +		return rc;
>  	} else if (core_kernel_text(ip))
>  		return __ftrace_make_nop_kernel(rec, addr);
>  
> @@ -567,6 +623,37 @@ __ftrace_make_call(struct dyn_ftrace *rec, unsigned long addr)
>  		return -EINVAL;
>  	}
>  
> +#ifdef CONFIG_MPROFILE_KERNEL
> +	/*
> +	 * We could end up here without having called __ftrace_make_call_prep()
> +	 * if function tracing is enabled before a module is loaded.
> +	 *
> +	 * ftrace_module_enable() --> ftrace_replace_code_rec() -->
> +	 *	ftrace_make_call() --> __ftrace_make_call()
> +	 *
> +	 * In this scenario, the previous instruction will be a NOP. It is
> +	 * safe to patch it with a 'mflr r0' since we know for a fact that
> +	 * this code is not yet being run.
> +	 */
> +	ip -= MCOUNT_INSN_SIZE;
> +
> +	/* read where this goes */
> +	if (probe_kernel_read(op, ip, MCOUNT_INSN_SIZE))
> +		return -EFAULT;
> +
> +	/*
> +	 * nothing to do if this is using the older -mprofile-kernel
> +	 * instruction sequence
> +	 */
> +	if (op[0] != PPC_INST_NOP)
> +		return 0;
> +
> +	if (patch_instruction((unsigned int *)ip, PPC_INST_MFLR)) {
> +		pr_err("Patching MFLR failed.\n");
> +		return -EPERM;
> +	}
> +#endif
> +
>  	return 0;
>  }
>  
> @@ -863,6 +950,133 @@ void arch_ftrace_update_code(int command)
>  	ftrace_modify_all_code(command);
>  }
>  
> +#ifdef CONFIG_MPROFILE_KERNEL
> +/* Returns 1 if we patched in the mflr */
> +static int __ftrace_make_call_prep(struct dyn_ftrace *rec)
> +{
> +	void *ip = (void *)rec->ip - MCOUNT_INSN_SIZE;
> +	unsigned int op[2];
> +
> +	/* read where this goes */
> +	if (probe_kernel_read(op, ip, sizeof(op)))
> +		return -EFAULT;
> +
> +	if (op[1] != PPC_INST_NOP) {
> +		pr_err("Unexpected call sequence at %p: %x %x\n",
> +							ip, op[0], op[1]);
> +		return -EINVAL;
> +	}
> +
> +	/*
> +	 * nothing to do if this is using the older -mprofile-kernel
> +	 * instruction sequence
> +	 */
> +	if (op[0] != PPC_INST_NOP)
> +		return 0;
> +
> +	if (patch_instruction((unsigned int *)ip, PPC_INST_MFLR)) {
> +		pr_err("Patching MFLR failed.\n");
> +		return -EPERM;
> +	}
> +
> +	return 1;
> +}
> +
> +static void do_isync(void *info __maybe_unused)
> +{
> +	isync();
> +}
> +
> +/*
> + * When enabling function tracing for -mprofile-kernel that uses a
> + * 2-instruction sequence of 'mflr r0, bl _mcount()', we use a 2 step process:
> + * 1. Patch in the 'mflr r0' instruction
> + * 1a. flush icache on all cpus, so that the updated instruction is seen
> + * 1b. synchronize_rcu_tasks() to ensure that any cpus that had executed
> + *     the earlier nop there make progress (and hence do not branch into
> + *     ftrace without executing the preceding mflr)
> + * 2. Patch in the branch to ftrace
> + */
> +void ftrace_replace_code(int mod_flags)
> +{
> +	int enable = mod_flags & FTRACE_MODIFY_ENABLE_FL;
> +	int schedulable = mod_flags & FTRACE_MODIFY_MAY_SLEEP_FL;
> +	int ret, failed, make_call = 0;
> +	struct ftrace_rec_iter *iter;
> +	struct dyn_ftrace *rec;
> +
> +	if (unlikely(!ftrace_enabled))
> +		return;
> +
> +	for_ftrace_rec_iter(iter) {
> +		rec = ftrace_rec_iter_record(iter);
> +
> +		if (rec->flags & FTRACE_FL_DISABLED)
> +			continue;
> +
> +		failed = 0;
> +		ret = ftrace_test_record(rec, enable);
> +		if (ret == FTRACE_UPDATE_MAKE_CALL) {
> +			failed = __ftrace_make_call_prep(rec);
> +			if (failed < 0) {
> +				ftrace_bug(failed, rec);
> +				return;
> +			} else if (failed == 1)
> +				make_call++;
> +		}
> +
> +		if (!failed) {
> +			/* We can patch the record directly */
> +			failed = ftrace_replace_code_rec(rec, enable);
> +			if (failed) {
> +				ftrace_bug(failed, rec);
> +				return;
> +			}
> +		}
> +
> +		if (schedulable)
> +			cond_resched();
> +	}
> +
> +	if (!make_call)
> +		/* No records needed patching a preceding mflr */
> +		return;
> +
> +	/* Make sure all cpus see the new instruction */
> +	smp_call_function(do_isync, NULL, 1);
> +
> +	/*
> +	 * We also need to ensure that all cpus make progress:
> +	 * - With !CONFIG_PREEMPT, we want to be sure that cpus return from
> +	 *   any interrupts they may be handling, and make progress.
> +	 * - With CONFIG_PREEMPT, we want to be additionally sure that there
> +	 *   are no pre-empted tasks that have executed the earlier nop, and
> +	 *   might end up executing the subsequently patched branch to ftrace.
> +	 */
> +	synchronize_rcu_tasks();
> +
> +	for_ftrace_rec_iter(iter) {
> +		rec = ftrace_rec_iter_record(iter);
> +
> +		if (rec->flags & FTRACE_FL_DISABLED)
> +			continue;
> +
> +		ret = ftrace_test_record(rec, enable);
> +		if (ret == FTRACE_UPDATE_MAKE_CALL)
> +			failed = ftrace_replace_code_rec(rec, enable);
> +
> +		if (failed) {
> +			ftrace_bug(failed, rec);
> +			return;
> +		}
> +
> +		if (schedulable)
> +			cond_resched();
> +	}
> +
> +}
> +#endif
> +
>  #ifdef CONFIG_PPC64
>  #define PACATOC offsetof(struct paca_struct, kernel_toc)
>  

