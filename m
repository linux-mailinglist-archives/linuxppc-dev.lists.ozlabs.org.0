Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CA0B34BD2C6
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Feb 2022 01:10:49 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K22kv0l31z3cST
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Feb 2022 11:10:47 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=LGrUJZ4U;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1;
 helo=dfw.source.kernel.org; envelope-from=mhiramat@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=LGrUJZ4U; 
 dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K22kC4fY5z303n
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Feb 2022 11:10:11 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6E6E360F63;
 Mon, 21 Feb 2022 00:10:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1134C340E8;
 Mon, 21 Feb 2022 00:10:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645402206;
 bh=UH4rwhicB3T7OCjBwUSzbQ/N6789LuIThsEDmHIKvkE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=LGrUJZ4UyaTcYs+MJIjPO1TF/cWxhUdi/e9KbXGpzrF+XKWHkvq7psOgln6vZHi+f
 B4DJr86q9X/OwhWkxRUBHPHj02KoASJO6+n1O1wYwKgw3jGy7N7/JXgwFSBT/g7Lrz
 snlkih3QKv3t6sk0Q8zDoXYR6r87nRGrcxivG8SY2sShzjg+jEFnxRghiwdnuptR+B
 DpR5hX7YplhHwObC1P+apzqKzPclFka0fCSmFqkz+7t7+90Bi+Flc85aAa3SyIvRre
 jPM5Ps9ByTaeUIxfTxQUNLzjLHMtHD+K7ycWDeT9MGvh2T+EE7ntdlx1Dzcoo36ksY
 Q4uCRLMf+0UZw==
Date: Mon, 21 Feb 2022 09:10:02 +0900
From: Masami Hiramatsu <mhiramat@kernel.org>
To: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
Subject: Re: [PATCH 1/3] powerpc/ftrace: Reserve instructions from function
 entry for ftrace
Message-Id: <20220221091002.5581c1effd557c62e06b821e@kernel.org>
In-Reply-To: <8843d65ac0878232433573d10ebee30457748624.1645096227.git.naveen.n.rao@linux.vnet.ibm.com>
References: <cover.1645096227.git.naveen.n.rao@linux.vnet.ibm.com>
 <8843d65ac0878232433573d10ebee30457748624.1645096227.git.naveen.n.rao@linux.vnet.ibm.com>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
Mime-Version: 1.0
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
Cc: Daniel Borkmann <daniel@iogearbox.net>, linux-kernel@vger.kernel.org,
 Nicholas Piggin <npiggin@gmail.com>, Steven Rostedt <rostedt@goodmis.org>,
 bpf@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 Alexei Starovoitov <alexei.starovoitov@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Naveen,

On Thu, 17 Feb 2022 17:06:23 +0530
"Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com> wrote:

> On some architectures, enabling function tracing results in multiple
> instructions being emitted at function entry. As an example, on
> powerpc64 with -mprofile-kernel, two instructions are emitted at
> function entry:
> 	mflr	r0
> 	bl	_mcount
> 
> It is desirable to nop out both these instructions when ftrace is not
> active. For that purpose, it is essential to mark both these
> instructions as belonging to ftrace so that other kernel subsystems
> (such as kprobes) do not modify these instructions.

Indeed, kprobes must handle this. However, to keep consistency of kprobes
usage with/without CONFIG_FUNCTION_TRACER, I think KPROBES_ON_FTRACE should
handle these instructions are virutal single instruction.
More specifically, it should allow user to put a kprobe on 'mflr r0' address
and the kprobes on 'bl _mcount' should return -EILSEQ. (because it is not an 
instruction boundary.) And the kprobe's ftrace handler temporarily modifies
the instruction pointer to the address of 'mflr'.

Thank you,

> 
> Add support for this by allowing architectures to override
> ftrace_cmp_recs() and to match against address ranges over and above a
> single MCOUNT_INSN_SIZE.
> 
> For powerpc32, we mark the two instructions preceding the call to
> _mcount() as belonging to ftrace.
> 
> For powerpc64, an additional aspect to consider is that functions can
> have a global entry point for setting up the TOC when invoked from other
> modules. If present, global entry point always involves two instructions
> (addis/lis and addi). To handle this, we provide a custom
> ftrace_init_nop() for powerpc64 where we identify functions having a
> global entry point and record this information in the LSB of
> dyn_ftrace->arch.mod. This information is used in ftrace_cmp_recs() to
> reserve instructions from the global entry point.
> 
> Suggested-by: Steven Rostedt <rostedt@goodmis.org>
> Signed-off-by: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>
> ---
>  arch/powerpc/include/asm/ftrace.h  |  15 ++++
>  arch/powerpc/kernel/trace/ftrace.c | 110 ++++++++++++++++++++++++++---
>  kernel/trace/ftrace.c              |   2 +
>  3 files changed, 117 insertions(+), 10 deletions(-)
> 
> diff --git a/arch/powerpc/include/asm/ftrace.h b/arch/powerpc/include/asm/ftrace.h
> index debe8c4f706260..8eb3235831633d 100644
> --- a/arch/powerpc/include/asm/ftrace.h
> +++ b/arch/powerpc/include/asm/ftrace.h
> @@ -59,6 +59,21 @@ static inline unsigned long ftrace_call_adjust(unsigned long addr)
>  struct dyn_arch_ftrace {
>  	struct module *mod;
>  };
> +
> +struct dyn_ftrace;
> +struct module *ftrace_mod_addr_get(struct dyn_ftrace *rec);
> +void ftrace_mod_addr_set(struct dyn_ftrace *rec, struct module *mod);
> +
> +#ifdef CONFIG_MPROFILE_KERNEL
> +int ftrace_init_nop(struct module *mod, struct dyn_ftrace *rec);
> +#define ftrace_init_nop ftrace_init_nop
> +#endif
> +
> +#if defined(CONFIG_MPROFILE_KERNEL) || defined(CONFIG_PPC32)
> +int ftrace_cmp_recs(const void *a, const void *b);
> +#define ftrace_cmp_recs ftrace_cmp_recs
> +#endif
> +
>  #endif /* __ASSEMBLY__ */
>  
>  #ifdef CONFIG_DYNAMIC_FTRACE_WITH_REGS
> diff --git a/arch/powerpc/kernel/trace/ftrace.c b/arch/powerpc/kernel/trace/ftrace.c
> index 80b6285769f27c..11ce9296ce3cf2 100644
> --- a/arch/powerpc/kernel/trace/ftrace.c
> +++ b/arch/powerpc/kernel/trace/ftrace.c
> @@ -428,21 +428,21 @@ int ftrace_make_nop(struct module *mod,
>  	 * We should either already have a pointer to the module
>  	 * or it has been passed in.
>  	 */
> -	if (!rec->arch.mod) {
> +	if (!ftrace_mod_addr_get(rec)) {
>  		if (!mod) {
>  			pr_err("No module loaded addr=%lx\n", addr);
>  			return -EFAULT;
>  		}
> -		rec->arch.mod = mod;
> +		ftrace_mod_addr_set(rec, mod);
>  	} else if (mod) {
> -		if (mod != rec->arch.mod) {
> +		if (mod != ftrace_mod_addr_get(rec)) {
>  			pr_err("Record mod %p not equal to passed in mod %p\n",
> -			       rec->arch.mod, mod);
> +			       ftrace_mod_addr_get(rec), mod);
>  			return -EINVAL;
>  		}
>  		/* nothing to do if mod == rec->arch.mod */
>  	} else
> -		mod = rec->arch.mod;
> +		mod = ftrace_mod_addr_get(rec);
>  
>  	return __ftrace_make_nop(mod, rec, addr);
>  #else
> @@ -451,6 +451,96 @@ int ftrace_make_nop(struct module *mod,
>  #endif /* CONFIG_MODULES */
>  }
>  
> +#define FUNC_MCOUNT_OFFSET_PPC32	8
> +#define FUNC_MCOUNT_OFFSET_PPC64_LEP	4
> +#define FUNC_MCOUNT_OFFSET_PPC64_GEP	12
> +
> +#ifdef CONFIG_MPROFILE_KERNEL
> +struct module *ftrace_mod_addr_get(struct dyn_ftrace *rec)
> +{
> +	return (struct module *)((unsigned long)rec->arch.mod & ~0x1);
> +}
> +
> +void ftrace_mod_addr_set(struct dyn_ftrace *rec, struct module *mod)
> +{
> +	rec->arch.mod = (struct module *)(((unsigned long)rec->arch.mod & 0x1) | (unsigned long)mod);
> +}
> +
> +int ftrace_init_nop(struct module *mod, struct dyn_ftrace *rec)
> +{
> +	unsigned long offset, ip = rec->ip;
> +	ppc_inst_t op1, op2;
> +	int ret;
> +
> +	if (!kallsyms_lookup_size_offset(rec->ip, NULL, &offset) ||
> +	    (offset != FUNC_MCOUNT_OFFSET_PPC64_GEP && offset != FUNC_MCOUNT_OFFSET_PPC64_LEP)) {
> +		ip -= FUNC_MCOUNT_OFFSET_PPC64_GEP;
> +		ret = copy_inst_from_kernel_nofault(&op1, (void *)ip);
> +		ret |= copy_inst_from_kernel_nofault(&op2, (void *)(ip + MCOUNT_INSN_SIZE));
> +		if (!ret &&
> +		    ((ppc_inst_val(op1) & 0xffff0000) == PPC_RAW_LIS(_R2, 0) ||
> +		     (ppc_inst_val(op1) & 0xffff0000) == PPC_RAW_ADDIS(_R2, _R12, 0)) &&
> +		    (ppc_inst_val(op2) & 0xffff0000) == PPC_RAW_ADDI(_R2, _R2, 0))
> +			ftrace_mod_addr_set(rec, (struct module *)1);
> +	} else if (offset == FUNC_MCOUNT_OFFSET_PPC64_GEP) {
> +		ftrace_mod_addr_set(rec, (struct module *)1);
> +	}
> +
> +	return ftrace_make_nop(mod, rec, MCOUNT_ADDR);
> +}
> +#else
> +struct module *ftrace_mod_addr_get(struct dyn_ftrace *rec)
> +{
> +	return rec->arch.mod;
> +}
> +
> +void ftrace_mod_addr_set(struct dyn_ftrace *rec, struct module *mod)
> +{
> +	rec->arch.mod = mod;
> +}
> +#endif /* CONFIG_MPROFILE_KERNEL */
> +
> +#if defined(CONFIG_MPROFILE_KERNEL) || defined(CONFIG_PPC32)
> +int ftrace_location_get_offset(const struct dyn_ftrace *rec)
> +{
> +	if (IS_ENABLED(CONFIG_MPROFILE_KERNEL))
> +		/*
> +		 * On ppc64le with -mprofile-kernel, function entry can have:
> +		 *   addis r2, r12, M
> +		 *   addi  r2, r2, N
> +		 *   mflr  r0
> +		 *   bl    _mcount
> +		 *
> +		 * The first two instructions are for TOC setup and represent the global entry
> +		 * point for cross-module calls, and may be missing if the function is never called
> +		 * from other modules.
> +		 */
> +		return ((unsigned long)rec->arch.mod & 0x1) ? FUNC_MCOUNT_OFFSET_PPC64_GEP :
> +							      FUNC_MCOUNT_OFFSET_PPC64_LEP;
> +	else
> +		/*
> +		 * On ppc32, function entry always has:
> +		 *   mflr r0
> +		 *   stw  r0, 4(r1)
> +		 *   bl   _mcount
> +		 */
> +		return FUNC_MCOUNT_OFFSET_PPC32;
> +}
> +
> +int ftrace_cmp_recs(const void *a, const void *b)
> +{
> +	const struct dyn_ftrace *key = a;
> +	const struct dyn_ftrace *rec = b;
> +	int offset = ftrace_location_get_offset(rec);
> +
> +	if (key->flags < rec->ip - offset)
> +		return -1;
> +	if (key->ip >= rec->ip + MCOUNT_INSN_SIZE)
> +		return 1;
> +	return 0;
> +}
> +#endif
> +
>  #ifdef CONFIG_MODULES
>  #ifdef CONFIG_PPC64
>  /*
> @@ -494,7 +584,7 @@ __ftrace_make_call(struct dyn_ftrace *rec, unsigned long addr)
>  	ppc_inst_t instr;
>  	void *ip = (void *)rec->ip;
>  	unsigned long entry, ptr, tramp;
> -	struct module *mod = rec->arch.mod;
> +	struct module *mod = ftrace_mod_addr_get(rec);
>  
>  	/* read where this goes */
>  	if (copy_inst_from_kernel_nofault(op, ip))
> @@ -561,7 +651,7 @@ __ftrace_make_call(struct dyn_ftrace *rec, unsigned long addr)
>  	int err;
>  	ppc_inst_t op;
>  	u32 *ip = (u32 *)rec->ip;
> -	struct module *mod = rec->arch.mod;
> +	struct module *mod = ftrace_mod_addr_get(rec);
>  	unsigned long tramp;
>  
>  	/* read where this goes */
> @@ -678,7 +768,7 @@ int ftrace_make_call(struct dyn_ftrace *rec, unsigned long addr)
>  	 * Being that we are converting from nop, it had better
>  	 * already have a module defined.
>  	 */
> -	if (!rec->arch.mod) {
> +	if (!ftrace_mod_addr_get(rec)) {
>  		pr_err("No module loaded\n");
>  		return -EINVAL;
>  	}
> @@ -699,7 +789,7 @@ __ftrace_modify_call(struct dyn_ftrace *rec, unsigned long old_addr,
>  	ppc_inst_t op;
>  	unsigned long ip = rec->ip;
>  	unsigned long entry, ptr, tramp;
> -	struct module *mod = rec->arch.mod;
> +	struct module *mod = ftrace_mod_addr_get(rec);
>  
>  	/* If we never set up ftrace trampolines, then bail */
>  	if (!mod->arch.tramp || !mod->arch.tramp_regs) {
> @@ -814,7 +904,7 @@ int ftrace_modify_call(struct dyn_ftrace *rec, unsigned long old_addr,
>  	/*
>  	 * Out of range jumps are called from modules.
>  	 */
> -	if (!rec->arch.mod) {
> +	if (!ftrace_mod_addr_get(rec)) {
>  		pr_err("No module loaded\n");
>  		return -EINVAL;
>  	}
> diff --git a/kernel/trace/ftrace.c b/kernel/trace/ftrace.c
> index f9feb197b2daaf..68f20cf34b0c47 100644
> --- a/kernel/trace/ftrace.c
> +++ b/kernel/trace/ftrace.c
> @@ -1510,6 +1510,7 @@ ftrace_ops_test(struct ftrace_ops *ops, unsigned long ip, void *regs)
>  	}
>  
>  
> +#ifndef ftrace_cmp_recs
>  static int ftrace_cmp_recs(const void *a, const void *b)
>  {
>  	const struct dyn_ftrace *key = a;
> @@ -1521,6 +1522,7 @@ static int ftrace_cmp_recs(const void *a, const void *b)
>  		return 1;
>  	return 0;
>  }
> +#endif
>  
>  static struct dyn_ftrace *lookup_rec(unsigned long start, unsigned long end)
>  {
> -- 
> 2.35.1
> 


-- 
Masami Hiramatsu <mhiramat@kernel.org>
