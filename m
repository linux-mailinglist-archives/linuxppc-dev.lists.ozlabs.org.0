Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3846F91E8E3
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Jul 2024 21:50:58 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=OBp+HX/y;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WCc9D0NPDz3cR1
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Jul 2024 05:50:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=OBp+HX/y;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=naveen@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WCc8W4wZ0z3c05
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Jul 2024 05:50:19 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1D36761786;
	Mon,  1 Jul 2024 19:50:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73418C116B1;
	Mon,  1 Jul 2024 19:50:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719863416;
	bh=75FCaF+2TXrWEbGwZq1W+uvM5cpS2E+grl9/TRtiU2o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OBp+HX/y45F/mtsCFcNE97O0e8xgw+wU7nCj+j+I1NESgfFGq+FJsz5yKxCSifx0F
	 RqfbL3yiGtgLpYukwwDIO3yogsPkOvv6TkFEA6IPnZvlf0CztGGHsisqFebqOzYPra
	 0JVU2P3irwZ7cp+YvpUwpuRJP2NYQMHR7JXx0EQzOnN7U1llEyVWlWAFS/l251LaHg
	 bEhJrHCfvUW6ORvLDpwMtZqtmgLcyxNBQTWGxhN0o8u9Fcn6NbGpiWkKIKZKdRYImO
	 YAJ+bU1pXQaz53ctzc/AswIytJFDgoqhs/AlmEOf+r92DoeF+e5D/Hz88IebKv1Cnx
	 S1JHB8CJjPJfQ==
Date: Tue, 2 Jul 2024 01:14:13 +0530
From: Naveen N Rao <naveen@kernel.org>
To: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [RFC PATCH v3 06/11] powerpc64/ftrace: Move ftrace sequence out
 of line
Message-ID: <u4o2qipkzzmefi6z6sp37m3ozg5zdpqvu4hxa6hb7fbwgu75k5@of7ih6towa3f>
References: <cover.1718908016.git.naveen@kernel.org>
 <63664d3bf825ca83656f84d23393ea486afb2f46.1718908016.git.naveen@kernel.org>
 <D2E4Z4J6KJUH.1NWWV6ZAW17VI@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <D2E4Z4J6KJUH.1NWWV6ZAW17VI@gmail.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, Daniel Borkmann <daniel@iogearbox.net>, Masahiro Yamada <masahiroy@kernel.org>, John Fastabend <john.fastabend@gmail.com>, Alexei Starovoitov <ast@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, Andrii Nakryiko <andrii@kernel.org>, Song Liu <song@kernel.org>, Masami Hiramatsu <mhiramat@kernel.org>, Jiri Olsa <jolsa@kernel.org>, bpf@vger.kernel.org, Christophe Leroy <christophe.leroy@csgroup.eu>, linuxppc-dev@lists.ozlabs.org, linux-trace-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Jul 01, 2024 at 08:39:03PM GMT, Nicholas Piggin wrote:
> On Fri Jun 21, 2024 at 4:54 AM AEST, Naveen N Rao wrote:
> > Function profile sequence on powerpc includes two instructions at the
> > beginning of each function:
> > 	mflr	r0
> > 	bl	ftrace_caller
> >
> > The call to ftrace_caller() gets nop'ed out during kernel boot and is
> > patched in when ftrace is enabled.
> >
> > Given the sequence, we cannot return from ftrace_caller with 'blr' as we
> > need to keep LR and r0 intact. This results in link stack imbalance when
> 
> (link stack is IBMese for "return address predictor", if that wasn't
> obvious)
> 
> > ftrace is enabled. To address that, we would like to use a three
> > instruction sequence:
> > 	mflr	r0
> > 	bl	ftrace_caller
> > 	mtlr	r0
> >
> > Further more, to support DYNAMIC_FTRACE_WITH_CALL_OPS, we need to
> > reserve two instruction slots before the function. This results in a
> > total of five instruction slots to be reserved for ftrace use on each
> > function that is traced.
> >
> > Move the function profile sequence out-of-line to minimize its impact.
> > To do this, we reserve a single nop at function entry using
> > -fpatchable-function-entry=1 and add a pass on vmlinux.o to determine
> 
> What's the need to do this on vmlinux.o rather than vmlinux? We have
> all function syms?

We want to be able to build and include another .o file to be linked 
into vmlinux. That file contains symbols (pfe_stub_text, et al) used by 
vmlinux.o

> 
> > the total number of functions that can be traced. This is then used to
> > generate a .S file reserving the appropriate amount of space for use as
> > ftrace stubs, which is built and linked into vmlinux.
> 
> An example instruction listing for the "after" case would be nice too.

Sure.

> 
> Is this all ftrace stubs in the one place? And how do you deal with
> kernel size exceeding the limit, if so?

Yes, all at the end. Ftrace init fails on bootup if text size exceeds 
branch range. I should really be putting in a post-link script to detect 
and break the build in that case.

> 
> >
> > On bootup, the stub space is split into separate stubs per function and
> > populated with the proper instruction sequence. A pointer to the
> > associated stub is maintained in dyn_arch_ftrace.
> >
> > For modules, space for ftrace stubs is reserved from the generic module
> > stub space.
> >
> > This is restricted to and enabled by default only on 64-bit powerpc.
> 
> This is cool.
> 
> [...]
> 
> > --- a/arch/powerpc/Kconfig
> > +++ b/arch/powerpc/Kconfig
> > @@ -568,6 +568,11 @@ config ARCH_USING_PATCHABLE_FUNCTION_ENTRY
> >  	def_bool $(success,$(srctree)/arch/powerpc/tools/gcc-check-fpatchable-function-entry.sh $(CC) -mlittle-endian) if PPC64 && CPU_LITTLE_ENDIAN
> >  	def_bool $(success,$(srctree)/arch/powerpc/tools/gcc-check-fpatchable-function-entry.sh $(CC) -mbig-endian) if PPC64 && CPU_BIG_ENDIAN
> >  
> > +config FTRACE_PFE_OUT_OF_LINE
> > +	def_bool PPC64 && ARCH_USING_PATCHABLE_FUNCTION_ENTRY
> > +	depends on PPC64
> > +	select ARCH_WANTS_PRE_LINK_VMLINUX
> 
> This remains powerpc specific? Maybe add a PPC_ prefix to the config
> option?
> 
> Bikeshed - should PFE be expanded to be consistent with the ARCH_
> option?

I agree. PFE isn't immediately obvious. Now that I think about it, not 
sure it really matters that this uses -fpatchable-function-entry. I'll 
call this PPC_FTRACE_SEQUENCE_OUT_OF_LINE. Suggestions welcome :)

> 
> [...]
> 
> > diff --git a/arch/powerpc/include/asm/ftrace.h b/arch/powerpc/include/asm/ftrace.h
> > index 201f9d15430a..9da1da0f87b4 100644
> > --- a/arch/powerpc/include/asm/ftrace.h
> > +++ b/arch/powerpc/include/asm/ftrace.h
> > @@ -26,6 +26,9 @@ unsigned long prepare_ftrace_return(unsigned long parent, unsigned long ip,
> >  struct module;
> >  struct dyn_ftrace;
> >  struct dyn_arch_ftrace {
> > +#ifdef CONFIG_FTRACE_PFE_OUT_OF_LINE
> > +	unsigned long pfe_stub;
> > +#endif
> >  };
> 
> Ah, we put something else in here. This is the offset to the
> stub? Maybe call it pfe_stub_offset?

Ack.

> 
> [...]
> 
> > diff --git a/arch/powerpc/kernel/trace/ftrace.c b/arch/powerpc/kernel/trace/ftrace.c
> > index 2cff37b5fd2c..9f3c10307331 100644
> > --- a/arch/powerpc/kernel/trace/ftrace.c
> > +++ b/arch/powerpc/kernel/trace/ftrace.c
> > @@ -37,7 +37,8 @@ unsigned long ftrace_call_adjust(unsigned long addr)
> >  	if (addr >= (unsigned long)__exittext_begin && addr < (unsigned long)__exittext_end)
> >  		return 0;
> >  
> > -	if (IS_ENABLED(CONFIG_ARCH_USING_PATCHABLE_FUNCTION_ENTRY))
> > +	if (IS_ENABLED(CONFIG_ARCH_USING_PATCHABLE_FUNCTION_ENTRY) &&
> > +	    !IS_ENABLED(CONFIG_FTRACE_PFE_OUT_OF_LINE))
> >  		addr += MCOUNT_INSN_SIZE;
> >  
> >  	return addr;
> 
> I don't understand what this is doing acutally (before this patch
> even). We still emit one/two patchable intsructions at entry, so
> why do we only need to adjust by zero/one instruction here?

ftrace wants the address of the instruction that calls into 
ftrace_caller. We emit 2 nops with -fpatchable-function-entry, so we 
"adjust" the ftrace location to be the second nop.

> 
> 
> > @@ -82,7 +83,7 @@ static inline int ftrace_modify_code(unsigned long ip, ppc_inst_t old, ppc_inst_
> >  {
> >  	int ret = ftrace_validate_inst(ip, old);
> >  
> > -	if (!ret)
> > +	if (!ret && !ppc_inst_equal(old, new))
> >  		ret = patch_instruction((u32 *)ip, new);
> >  
> >  	return ret;
> 
> Is this leftover debugging stuff or should it be in a different patch?

It is intentional to simplify further patching and checks. I will move 
this to a separate patch.

> 
> > @@ -132,11 +133,23 @@ static unsigned long ftrace_lookup_module_stub(unsigned long ip, unsigned long a
> >  }
> >  #endif
> >  
> > +static unsigned long ftrace_get_pfe_stub(struct dyn_ftrace *rec)
> > +{
> > +#ifdef CONFIG_FTRACE_PFE_OUT_OF_LINE
> > +	return rec->arch.pfe_stub;
> > +#else
> > +	BUILD_BUG();
> > +#endif
> > +}
> > +
> >  static int ftrace_get_call_inst(struct dyn_ftrace *rec, unsigned long addr, ppc_inst_t *call_inst)
> >  {
> >  	unsigned long ip = rec->ip;
> >  	unsigned long stub;
> >  
> > +	if (IS_ENABLED(CONFIG_FTRACE_PFE_OUT_OF_LINE))
> > +		ip = ftrace_get_pfe_stub(rec) + MCOUNT_INSN_SIZE; /* second instruction in stub */
> 
> Maybe put the ip = rec->ip; into an else case here.

Ok.

> 
> [...]
> 
> > @@ -155,6 +168,79 @@ static int ftrace_get_call_inst(struct dyn_ftrace *rec, unsigned long addr, ppc_
> >  	return 0;
> >  }
> >  
> > +static int ftrace_init_pfe_stub(struct module *mod, struct dyn_ftrace *rec)
> > +{
> > +#ifdef CONFIG_FTRACE_PFE_OUT_OF_LINE
> > +	static int pfe_stub_text_index, pfe_stub_inittext_index;
> > +	int ret = 0, pfe_stub_count, *pfe_stub_index;
> > +	ppc_inst_t inst;
> > +	struct ftrace_pfe_stub *pfe_stub, pfe_stub_template = {
> > +		.insn = {
> > +			PPC_RAW_MFLR(_R0),
> > +			PPC_RAW_NOP(),		/* bl ftrace_caller */
> > +			PPC_RAW_MTLR(_R0),
> > +			PPC_RAW_NOP()		/* b rec->ip + 4 */
> > +		}
> > +	};
> > +
> > +	WARN_ON(rec->arch.pfe_stub);
> > +
> > +	if (is_kernel_inittext(rec->ip)) {
> > +		pfe_stub = ftrace_pfe_stub_inittext;
> > +		pfe_stub_index = &pfe_stub_inittext_index;
> > +		pfe_stub_count = ftrace_pfe_stub_inittext_count;
> > +	} else if (is_kernel_text(rec->ip)) {
> > +		pfe_stub = ftrace_pfe_stub_text;
> > +		pfe_stub_index = &pfe_stub_text_index;
> > +		pfe_stub_count = ftrace_pfe_stub_text_count;
> > +#ifdef CONFIG_MODULES
> > +	} else if (mod) {
> > +		pfe_stub = mod->arch.pfe_stubs;
> > +		pfe_stub_index = &mod->arch.pfe_stub_index;
> > +		pfe_stub_count = mod->arch.pfe_stub_count;
> > +#endif
> > +	} else {
> > +		return -EINVAL;
> > +	}
> > +
> > +	pfe_stub += (*pfe_stub_index)++;
> > +
> > +	if (WARN_ON(*pfe_stub_index > pfe_stub_count))
> > +		return -EINVAL;
> > +
> > +	if (!is_offset_in_branch_range((long)rec->ip - (long)&pfe_stub->insn[0]) ||
> > +	    !is_offset_in_branch_range((long)(rec->ip + MCOUNT_INSN_SIZE) - (long)&pfe_stub->insn[3])) {
> > +		pr_err("%s: ftrace pfe stub out of range (%p -> %p).\n",
> > +					__func__, (void *)rec->ip, (void *)&pfe_stub->insn[0]);
> > +		return -EINVAL;
> > +	}
> > +
> > +	rec->arch.pfe_stub = (unsigned long)&pfe_stub->insn[0];
> > +
> > +	/* bl ftrace_caller */
> > +	if (mod)
> > +		/* We can't lookup the module since it is not fully formed yet */
> 
> What do you mean here, what would a lookup look like if we could do it?

I originally had ftrace_get_call_inst() here, which does a 
__module_text_address() lookup. It didn't work since the module is not 
yet fully loaded when this is called. I can expand the comment.

> 
> > +		inst = ftrace_create_branch_inst(ftrace_get_pfe_stub(rec) + MCOUNT_INSN_SIZE,
> > +						 mod->arch.tramp, 1);
> > +	else
> > +		ret = ftrace_get_call_inst(rec, (unsigned long)ftrace_caller, &inst);
> > +	pfe_stub_template.insn[1] = ppc_inst_val(inst);
> > +
> > +	/* b rec->ip + 4 */
> > +	if (!ret && create_branch(&inst, &pfe_stub->insn[3], rec->ip + MCOUNT_INSN_SIZE, 0))
> > +		return -EINVAL;
> > +	pfe_stub_template.insn[3] = ppc_inst_val(inst);
> > +
> > +	if (!ret)
> > +		ret = patch_instructions((u32 *)pfe_stub, (u32 *)&pfe_stub_template,
> > +					 sizeof(pfe_stub_template), false);
> > +
> > +	return ret;
> > +#else /* !CONFIG_FTRACE_PFE_OUT_OF_LINE */
> > +	BUILD_BUG();
> > +#endif
> > +}
> > +
> >  #ifdef CONFIG_DYNAMIC_FTRACE_WITH_REGS
> >  int ftrace_modify_call(struct dyn_ftrace *rec, unsigned long old_addr, unsigned long addr)
> >  {
> > @@ -167,18 +253,29 @@ int ftrace_modify_call(struct dyn_ftrace *rec, unsigned long old_addr, unsigned
> >  int ftrace_make_call(struct dyn_ftrace *rec, unsigned long addr)
> >  {
> >  	ppc_inst_t old, new;
> > -	int ret;
> > +	unsigned long ip = rec->ip;
> > +	int ret = 0;
> >  
> >  	/* This can only ever be called during module load */
> > -	if (WARN_ON(!IS_ENABLED(CONFIG_MODULES) || core_kernel_text(rec->ip)))
> > +	if (WARN_ON(!IS_ENABLED(CONFIG_MODULES) || core_kernel_text(ip)))
> >  		return -EINVAL;
> >  
> >  	old = ppc_inst(PPC_RAW_NOP());
> > -	ret = ftrace_get_call_inst(rec, addr, &new);
> > -	if (ret)
> > -		return ret;
> > +	if (IS_ENABLED(CONFIG_FTRACE_PFE_OUT_OF_LINE)) {
> > +		ip = ftrace_get_pfe_stub(rec) + MCOUNT_INSN_SIZE; /* second instruction in stub */
> > +		ret = ftrace_get_call_inst(rec, (unsigned long)ftrace_caller, &old);
> > +	}
> >  
> > -	return ftrace_modify_code(rec->ip, old, new);
> > +	ret |= ftrace_get_call_inst(rec, addr, &new);
> > +
> > +	if (!ret)
> > +		ret = ftrace_modify_code(ip, old, new);
> > +
> > +	if (!ret && IS_ENABLED(CONFIG_FTRACE_PFE_OUT_OF_LINE))
> > +		ret = ftrace_modify_code(rec->ip, ppc_inst(PPC_RAW_NOP()),
> > +			 ppc_inst(PPC_RAW_BRANCH((long)ftrace_get_pfe_stub(rec) - (long)rec->ip)));
> > +
> > +	return ret;
> >  }
> >  
> >  int ftrace_make_nop(struct module *mod, struct dyn_ftrace *rec, unsigned long addr)
> > @@ -211,6 +308,13 @@ void ftrace_replace_code(int enable)
> >  		new_addr = ftrace_get_addr_new(rec);
> >  		update = ftrace_update_record(rec, enable);
> >  
> > +		if (IS_ENABLED(CONFIG_FTRACE_PFE_OUT_OF_LINE) && update != FTRACE_UPDATE_IGNORE) {
> > +			ip = ftrace_get_pfe_stub(rec) + MCOUNT_INSN_SIZE;
> > +			ret = ftrace_get_call_inst(rec, (unsigned long)ftrace_caller, &nop_inst);
> > +			if (ret)
> > +				goto out;
> > +		}
> > +
> >  		switch (update) {
> >  		case FTRACE_UPDATE_IGNORE:
> >  		default:
> > @@ -235,6 +339,24 @@ void ftrace_replace_code(int enable)
> >  
> >  		if (!ret)
> >  			ret = ftrace_modify_code(ip, old, new);
> > +
> > +		if (!ret && IS_ENABLED(CONFIG_FTRACE_PFE_OUT_OF_LINE) &&
> > +		    (update == FTRACE_UPDATE_MAKE_NOP || update == FTRACE_UPDATE_MAKE_CALL)) {
> > +			/* Update the actual ftrace location */
> > +			call_inst = ppc_inst(PPC_RAW_BRANCH((long)ftrace_get_pfe_stub(rec) -
> > +							    (long)rec->ip));
> > +			nop_inst = ppc_inst(PPC_RAW_NOP());
> > +			ip = rec->ip;
> > +
> > +			if (update == FTRACE_UPDATE_MAKE_NOP)
> > +				ret = ftrace_modify_code(ip, call_inst, nop_inst);
> > +			else
> > +				ret = ftrace_modify_code(ip, nop_inst, call_inst);
> > +
> > +			if (ret)
> > +				goto out;
> > +		}
> > +
> >  		if (ret)
> >  			goto out;
> >  	}
> > @@ -254,7 +376,8 @@ int ftrace_init_nop(struct module *mod, struct dyn_ftrace *rec)
> >  	/* Verify instructions surrounding the ftrace location */
> >  	if (IS_ENABLED(CONFIG_ARCH_USING_PATCHABLE_FUNCTION_ENTRY)) {
> >  		/* Expect nops */
> > -		ret = ftrace_validate_inst(ip - 4, ppc_inst(PPC_RAW_NOP()));
> > +		if (!IS_ENABLED(CONFIG_FTRACE_PFE_OUT_OF_LINE))
> > +			ret = ftrace_validate_inst(ip - 4, ppc_inst(PPC_RAW_NOP()));
> >  		if (!ret)
> >  			ret = ftrace_validate_inst(ip, ppc_inst(PPC_RAW_NOP()));
> >  	} else if (IS_ENABLED(CONFIG_PPC32)) {
> > @@ -278,6 +401,10 @@ int ftrace_init_nop(struct module *mod, struct dyn_ftrace *rec)
> >  	if (ret)
> >  		return ret;
> >  
> > +	/* Set up out-of-line stub */
> > +	if (IS_ENABLED(CONFIG_FTRACE_PFE_OUT_OF_LINE))
> > +		return ftrace_init_pfe_stub(mod, rec);
> > +
> >  	/* Nop-out the ftrace location */
> >  	new = ppc_inst(PPC_RAW_NOP());
> >  	addr = MCOUNT_ADDR;
> > diff --git a/arch/powerpc/kernel/trace/ftrace_entry.S b/arch/powerpc/kernel/trace/ftrace_entry.S
> > index 244a1c7bb1e8..b1cbef24f18f 100644
> > --- a/arch/powerpc/kernel/trace/ftrace_entry.S
> > +++ b/arch/powerpc/kernel/trace/ftrace_entry.S
> > @@ -78,10 +78,6 @@
> >  
> >  	/* Get the _mcount() call site out of LR */
> >  	mflr	r7
> > -	/* Save it as pt_regs->nip */
> > -	PPC_STL	r7, _NIP(r1)
> > -	/* Also save it in B's stackframe header for proper unwind */
> > -	PPC_STL	r7, LRSAVE+SWITCH_FRAME_SIZE(r1)
> >  	/* Save the read LR in pt_regs->link */
> >  	PPC_STL	r0, _LINK(r1)
> >  
> > @@ -96,16 +92,6 @@
> >  	lwz	r5,function_trace_op@l(r3)
> >  #endif
> >  
> > -#ifdef CONFIG_LIVEPATCH_64
> > -	mr	r14, r7		/* remember old NIP */
> > -#endif
> > -
> > -	/* Calculate ip from nip-4 into r3 for call below */
> > -	subi    r3, r7, MCOUNT_INSN_SIZE
> > -
> > -	/* Put the original return address in r4 as parent_ip */
> > -	mr	r4, r0
> > -
> >  	/* Save special regs */
> >  	PPC_STL	r8, _MSR(r1)
> >  	.if \allregs == 1
> > @@ -114,17 +100,64 @@
> >  	PPC_STL	r11, _CCR(r1)
> >  	.endif
> >  
> > +#ifdef CONFIG_FTRACE_PFE_OUT_OF_LINE
> > +	/* Save our real return address locally for return */
> > +	PPC_STL	r7, STACK_INT_FRAME_MARKER(r1)
> 
> Hmm, should you be using STACK_INT_FRAME_MARKER in a
> non-INT_FRAME? I actually wanted to turn the int marker
> into a 4 byte word and move it into a reserved space in
> the frame too. Could it go in pt_regs somewhere?

I can use a nvr.

> 
> > +	/*
> > +	 * We want the ftrace location in the function, but our lr (in r7)
> > +	 * points at the 'mtlr r0' instruction in the out of line stub.  To
> > +	 * recover the ftrace location, we read the branch instruction in the
> > +	 * stub, and adjust our lr by the branch offset.
> > +	 */
> > +	lwz	r8, MCOUNT_INSN_SIZE(r7)
> > +	slwi	r8, r8, 6
> > +	srawi	r8, r8, 6
> > +	add	r3, r7, r8
> 
> Clever. Maybe a comment in ftrace_init_pfe_stub() that says to
> keep that last instruction in synch with this?

Sure.

> 
> > +	/*
> > +	 * Override our nip to point past the branch in the original function.
> > +	 * This allows reliable stack trace and the ftrace stack tracer to work as-is.
> > +	 */
> > +	add	r7, r3, MCOUNT_INSN_SIZE
> > +#else
> > +	/* Calculate ip from nip-4 into r3 for call below */
> > +	subi    r3, r7, MCOUNT_INSN_SIZE
> > +#endif
> > +
> > +	/* Save NIP as pt_regs->nip */
> > +	PPC_STL	r7, _NIP(r1)
> > +	/* Also save it in B's stackframe header for proper unwind */
> > +	PPC_STL	r7, LRSAVE+SWITCH_FRAME_SIZE(r1)
> > +#ifdef CONFIG_LIVEPATCH_64
> > +	mr	r14, r7		/* remember old NIP */
> > +#endif
> > +
> > +	/* Put the original return address in r4 as parent_ip */
> > +	mr	r4, r0
> > +
> >  	/* Load &pt_regs in r6 for call below */
> >  	addi    r6, r1, STACK_INT_FRAME_REGS
> >  .endm
> >  
> >  .macro	ftrace_regs_exit allregs
> > +#ifndef CONFIG_FTRACE_PFE_OUT_OF_LINE
> >  	/* Load ctr with the possibly modified NIP */
> >  	PPC_LL	r3, _NIP(r1)
> >  	mtctr	r3
> >  
> >  #ifdef CONFIG_LIVEPATCH_64
> >  	cmpd	r14, r3		/* has NIP been altered? */
> > +#endif
> > +#else /* !CONFIG_FTRACE_PFE_OUT_OF_LINE */
> > +#ifdef CONFIG_LIVEPATCH_64
> > +	/* Load ctr with the possibly modified NIP */
> 
> Comment doesn't apply to this leg of the ifdef AFAIKS.
> We load the original NIP into LR, and set CR0 for
> livepatch branch.

Indeed. Will update.

> 
> > +	PPC_LL	r3, _NIP(r1)
> > +
> > +	cmpd	r14, r3		/* has NIP been altered? */
> > +	bne-	1f
> > +#endif
> > +
> > +	PPC_LL	r3, STACK_INT_FRAME_MARKER(r1)
> > +1:	mtlr	r3
> >  #endif
> >  
> >  	/* Restore gprs */
> > @@ -139,7 +172,9 @@
> >  
> >  	/* Restore possibly modified LR */
> >  	PPC_LL	r0, _LINK(r1)
> > +#ifndef CONFIG_FTRACE_PFE_OUT_OF_LINE
> >  	mtlr	r0
> > +#endif
> >  
> >  #ifdef CONFIG_PPC64
> >  	/* Restore callee's TOC */
> > @@ -153,7 +188,12 @@
> >          /* Based on the cmpd above, if the NIP was altered handle livepatch */
> >  	bne-	livepatch_handler
> >  #endif
> > -	bctr			/* jump after _mcount site */
> > +	/* jump after _mcount site */
> > +#ifdef CONFIG_FTRACE_PFE_OUT_OF_LINE
> > +	blr
> > +#else
> > +	bctr
> > +#endif
> 
> Here is the crux of it all, we return here with a blr that matches
> the return address of the bl which it was called with, so the CPU
> can predict it.
> 
> I think it would be worth a comment here to explain why you go to
> so much effort to add the case that uses LR here. Because the out
> of line stub itself could pretty well have the same calling convention
> as the original mcount.

Sure. FWIW, null_syscall showed an improvement of ~22% with ftrace 
enabled with this patch going down from ~520 cycles to ~400 cycles.

> 
> Actually that's a thought too. Could you split this patch in two?
> First just the patch to add the out of line call but use the same
> calling convention as mprofile-kernel. Second which changes it to
> use the balanced call/return. Would that be a lot of extra work?

I'll check. My primary motive was to ensure there would only ever be two 
options:
- the existing -mprofile-kernel sequence, primarily for ppc32
- the new ool sequence with a third instruction to balance the link 
  stack.

Though I agree splitting this makes the code easier to follow.

> 
> >  .endm
> >  
> >  _GLOBAL(ftrace_regs_caller)
> > @@ -177,6 +217,11 @@ _GLOBAL(ftrace_stub)
> >  
> >  #ifdef CONFIG_PPC64
> >  ftrace_no_trace:
> > +#ifdef CONFIG_FTRACE_PFE_OUT_OF_LINE
> > +	REST_GPR(3, r1)
> > +	addi	r1, r1, SWITCH_FRAME_SIZE+STACK_FRAME_MIN_SIZE
> > +	blr
> > +#else
> >  	mflr	r3
> >  	mtctr	r3
> >  	REST_GPR(3, r1)
> > @@ -184,6 +229,7 @@ ftrace_no_trace:
> >  	mtlr	r0
> >  	bctr
> >  #endif
> > +#endif
> >  
> >  #ifdef CONFIG_LIVEPATCH_64
> >  	/*
> > @@ -196,9 +242,9 @@ ftrace_no_trace:
> >  	 *
> >  	 * On entry:
> >  	 *  - we have no stack frame and can not allocate one
> > -	 *  - LR points back to the original caller (in A)
> > -	 *  - CTR holds the new NIP in C
> > -	 *  - r0, r11 & r12 are free
> > +	 *  - LR/r0 points back to the original caller (in A)
> > +	 *  - CTR/LR holds the new NIP in C
> > +	 *  - r11 & r12 are free
> 
> Could you explain the added case here, e.g.,
> 
> On entry, depending on CONFIG_FTRACE_PFE_OUT_OF_LINE (=n/=y)

Sure.

> 
> >  	 */
> >  livepatch_handler:
> >  	ld	r12, PACA_THREAD_INFO(r13)
> > @@ -208,18 +254,23 @@ livepatch_handler:
> >  	addi	r11, r11, 24
> >  	std	r11, TI_livepatch_sp(r12)
> >  
> > -	/* Save toc & real LR on livepatch stack */
> > -	std	r2,  -24(r11)
> > -	mflr	r12
> > -	std	r12, -16(r11)
> > -
> >  	/* Store stack end marker */
> >  	lis     r12, STACK_END_MAGIC@h
> >  	ori     r12, r12, STACK_END_MAGIC@l
> >  	std	r12, -8(r11)
> >  
> > -	/* Put ctr in r12 for global entry and branch there */
> > +	/* Save toc & real LR on livepatch stack */
> > +	std	r2,  -24(r11)
> > +#ifndef CONFIG_FTRACE_PFE_OUT_OF_LINE
> > +	mflr	r12
> > +	std	r12, -16(r11)
> >  	mfctr	r12
> > +#else
> > +	std	r0, -16(r11)
> > +	mflr	r12
> > +	/* Put ctr in r12 for global entry and branch there */
> > +	mtctr	r12
> > +#endif
> >  	bctrl
> >  
> >  	/*
> > diff --git a/arch/powerpc/kernel/vmlinux.lds.S b/arch/powerpc/kernel/vmlinux.lds.S
> > index f420df7888a7..0aef9959f2cd 100644
> > --- a/arch/powerpc/kernel/vmlinux.lds.S
> > +++ b/arch/powerpc/kernel/vmlinux.lds.S
> > @@ -267,14 +267,13 @@ SECTIONS
> >  	.init.text : AT(ADDR(.init.text) - LOAD_OFFSET) {
> >  		_sinittext = .;
> >  		INIT_TEXT
> > -
> > +		*(.tramp.ftrace.init);
> >  		/*
> >  		 *.init.text might be RO so we must ensure this section ends on
> >  		 * a page boundary.
> >  		 */
> >  		. = ALIGN(PAGE_SIZE);
> >  		_einittext = .;
> > -		*(.tramp.ftrace.init);
> >  	} :text
> >  
> >  	/* .exit.text is discarded at runtime, not link time,
> 
> Why this change?

I should have explained in the commit log. Will add.
Without this change, core_kernel_text() test was failing in 
ftrace_init_pfe_stub() I think.

> 
> > diff --git a/arch/powerpc/tools/Makefile b/arch/powerpc/tools/Makefile
> > new file mode 100644
> > index 000000000000..9e2ba9a85baa
> > --- /dev/null
> > +++ b/arch/powerpc/tools/Makefile
> > @@ -0,0 +1,10 @@
> > +# SPDX-License-Identifier: GPL-2.0-or-later
> > +
> > +quiet_cmd_gen_ftrace_pfe_stubs = FTRACE  $@
> > +      cmd_gen_ftrace_pfe_stubs = $< $(objtree)/vmlinux.o $@
> > +
> > +targets += .arch.vmlinux.o
> > +.arch.vmlinux.o: $(srctree)/arch/powerpc/tools/gen-ftrace-pfe-stubs.sh $(objtree)/vmlinux.o FORCE
> > +	$(call if_changed,gen_ftrace_pfe_stubs)
> > +
> > +clean-files += $(objtree)/.arch.vmlinux.S $(objtree)/.arch.vmlinux.o
> > diff --git a/arch/powerpc/tools/gen-ftrace-pfe-stubs.sh b/arch/powerpc/tools/gen-ftrace-pfe-stubs.sh
> > new file mode 100755
> > index 000000000000..ec95e99aff14
> > --- /dev/null
> > +++ b/arch/powerpc/tools/gen-ftrace-pfe-stubs.sh
> > @@ -0,0 +1,48 @@
> > +#!/bin/sh
> > +# SPDX-License-Identifier: GPL-2.0-or-later
> > +
> > +# Error out on error
> > +set -e
> > +
> > +is_enabled() {
> > +	grep -q "^$1=y" include/config/auto.conf
> > +}
> > +
> > +vmlinux_o=${1}
> > +arch_vmlinux_o=${2}
> > +arch_vmlinux_S=$(dirname ${arch_vmlinux_o})/$(basename ${arch_vmlinux_o} .o).S
> > +
> > +RELOCATION=R_PPC64_ADDR64
> > +if is_enabled CONFIG_PPC32; then
> > +	RELOCATION=R_PPC_ADDR32
> > +fi
> 
> Started PPC32 support?

Yes, except perhaps the module code. The intent was to enable as much of 
it as I could so that Christophe could try and see if this would be 
useful on 32-bit. The config option is intentionally neutral.

> 
> > +
> > +num_pfe_stubs_text=$(${CROSS_COMPILE}objdump -r -j __patchable_function_entries ${vmlinux_o} |
> > +		     grep -v ".init.text" | grep "${RELOCATION}" | wc -l)
> > +num_pfe_stubs_inittext=$(${CROSS_COMPILE}objdump -r -j __patchable_function_entries ${vmlinux_o} |
> > +			 grep ".init.text" | grep "${RELOCATION}" | wc -l)
> > +
> > +cat > ${arch_vmlinux_S} <<EOF
> > +#include <asm/asm-offsets.h>
> > +#include <linux/linkage.h>
> > +
> > +.pushsection .tramp.ftrace.text,"aw"
> > +SYM_DATA(ftrace_pfe_stub_text_count, .long ${num_pfe_stubs_text})
> > +
> > +SYM_CODE_START(ftrace_pfe_stub_text)
> > +	.space ${num_pfe_stubs_text} * FTRACE_PFE_STUB_SIZE
> > +SYM_CODE_END(ftrace_pfe_stub_text)
> > +.popsection
> > +
> > +.pushsection .tramp.ftrace.init,"aw"
> > +SYM_DATA(ftrace_pfe_stub_inittext_count, .long ${num_pfe_stubs_inittext})
> > +
> > +SYM_CODE_START(ftrace_pfe_stub_inittext)
> > +	.space ${num_pfe_stubs_inittext} * FTRACE_PFE_STUB_SIZE
> > +SYM_CODE_END(ftrace_pfe_stub_inittext)
> > +.popsection
> > +EOF
> > +
> > +${CC} ${NOSTDINC_FLAGS} ${LINUXINCLUDE} ${KBUILD_CPPFLAGS} \
> > +      ${KBUILD_AFLAGS} ${KBUILD_AFLAGS_KERNEL} \
> > +      -c -o ${arch_vmlinux_o} ${arch_vmlinux_S}
> 
> Looking pretty good. I don't know the livepatch stuff well though.

Thanks for the detailed review!

- Naveen
