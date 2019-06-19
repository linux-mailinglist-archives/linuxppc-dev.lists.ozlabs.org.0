Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 783A84B140
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Jun 2019 07:16:33 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45TCq246kKzDqlQ
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Jun 2019 15:16:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45TCmx6QTbzDqjx
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Jun 2019 15:14:41 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 45TCmw4yXwz9s4V;
 Wed, 19 Jun 2019 15:14:40 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>,
 Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>,
 Ingo Molnar <mingo@kernel.org>, Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH 4/7] powerpc/ftrace: Additionally nop out the preceding
 mflr with -mprofile-kernel
In-Reply-To: <72492bc769cd6f40a536e689fc3195570d07fd5c.1560868106.git.naveen.n.rao@linux.vnet.ibm.com>
References: <cover.1560868106.git.naveen.n.rao@linux.vnet.ibm.com>
 <72492bc769cd6f40a536e689fc3195570d07fd5c.1560868106.git.naveen.n.rao@linux.vnet.ibm.com>
Date: Wed, 19 Jun 2019 15:14:40 +1000
Message-ID: <877e9idum7.fsf@concordia.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Naveen,

Sorry I meant to reply to this earlier .. :/

"Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com> writes:
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
> mflr instruction, use synchronize_rcu_tasks() to ensure all existing
> threads make progress, and then patch in the branch to _mcount(). We
> override ftrace_replace_code() with a powerpc64 variant for this
> purpose.

According to the ISA we're not allowed to patch mflr at runtime. See the
section on "CMODX".

I'm also not convinced the ordering between the two patches is
guaranteed by the ISA, given that there's possibly no isync on the other
CPU.

But I haven't had time to dig into it sorry, hopefully later in the
week?

cheers

> diff --git a/arch/powerpc/kernel/trace/ftrace.c b/arch/powerpc/kernel/trace/ftrace.c
> index 517662a56bdc..5e2b29808af1 100644
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
> @@ -863,6 +950,116 @@ void arch_ftrace_update_code(int command)
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
> +/*
> + * When enabling function tracing for -mprofile-kernel that uses a
> + * 2-instruction sequence of 'mflr r0, bl _mcount()', we use a 2 step process:
> + * 1. Patch in the 'mflr r0' instruction
> + * 1a. synchronize_rcu_tasks() to ensure that any threads that had executed
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
> -- 
> 2.22.0
