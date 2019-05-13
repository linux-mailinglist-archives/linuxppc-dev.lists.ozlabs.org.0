Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D50C11AF1D
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 May 2019 05:26:13 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 452R6q05CzzDqHG
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 May 2019 13:26:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 452R5Y16DqzDqFv
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 May 2019 13:25:05 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 452R5X74Skz9s4V;
 Mon, 13 May 2019 13:25:04 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [RFC PATCH] powerpc/64/ftrace: mprofile-kernel patch out mflr
In-Reply-To: <20190413015940.31170-1-npiggin@gmail.com>
References: <20190413015940.31170-1-npiggin@gmail.com>
Date: Mon, 13 May 2019 13:25:04 +1000
Message-ID: <871s13ujcf.fsf@concordia.ellerman.id.au>
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
Cc: Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Nicholas Piggin <npiggin@gmail.com> writes:
> The new mprofile-kernel mcount sequence is
>
>   mflr	r0
>   bl	_mcount
>
> Dynamic ftrace patches the branch instruction with a noop, but leaves
> the mflr. mflr is executed by the branch unit that can only execute one
> per cycle on POWER9 and shared with branches, so it would be nice to
> avoid it where possible.
>
> This patch is a hacky proof of concept to nop out the mflr. Can we do
> this or are there races or other issues with it?

There's a race, isn't there?

We have a function foo which currently has tracing disabled, so the mflr
and bl are nop'ed out.

  CPU 0			CPU 1
  ==================================
  bl foo
  nop (ie. not mflr)
  -> interrupt
  something else	enable tracing for foo
  ...			patch mflr and branch
  <- rfi
  bl _mcount

So we end up in _mcount() but with r0 not populated.

Or else what am I missing?

cheers


> diff --git a/arch/powerpc/kernel/trace/ftrace.c b/arch/powerpc/kernel/trace/ftrace.c
> index 52ee24fd353f..ecc75baef23e 100644
> --- a/arch/powerpc/kernel/trace/ftrace.c
> +++ b/arch/powerpc/kernel/trace/ftrace.c
> @@ -172,6 +172,19 @@ __ftrace_make_nop(struct module *mod,
>  		pr_err("Unexpected instruction %08x around bl _mcount\n", op);
>  		return -EINVAL;
>  	}
> +
> +	if (patch_instruction((unsigned int *)ip, pop)) {
> +		pr_err("Patching NOP failed.\n");
> +		return -EPERM;
> +	}
> +
> +	if (op == PPC_INST_MFLR) {
> +		if (patch_instruction((unsigned int *)(ip - 4), pop)) {
> +			pr_err("Patching NOP failed.\n");
> +			return -EPERM;
> +		}
> +	}
> +
>  #else
>  	/*
>  	 * Our original call site looks like:
> @@ -202,13 +215,14 @@ __ftrace_make_nop(struct module *mod,
>  		pr_err("Expected %08x found %08x\n", PPC_INST_LD_TOC, op);
>  		return -EINVAL;
>  	}
> -#endif /* CONFIG_MPROFILE_KERNEL */
>  
>  	if (patch_instruction((unsigned int *)ip, pop)) {
>  		pr_err("Patching NOP failed.\n");
>  		return -EPERM;
>  	}
>  
> +#endif /* CONFIG_MPROFILE_KERNEL */
> +
>  	return 0;
>  }
>  
> @@ -421,6 +435,20 @@ static int __ftrace_make_nop_kernel(struct dyn_ftrace *rec, unsigned long addr)
>  		return -EPERM;
>  	}
>  
> +#ifdef CONFIG_MPROFILE_KERNEL
> +	if (probe_kernel_read(&op, (void *)(ip - 4), 4)) {
> +		pr_err("Fetching instruction at %lx failed.\n", ip - 4);
> +		return -EFAULT;
> +	}
> +
> +	if (op == PPC_INST_MFLR) {
> +		if (patch_instruction((unsigned int *)(ip - 4), PPC_INST_NOP)) {
> +			pr_err("Patching NOP failed.\n");
> +			return -EPERM;
> +		}
> +	}
> +#endif
> +
>  	return 0;
>  }
>  
> @@ -437,9 +465,20 @@ int ftrace_make_nop(struct module *mod,
>  	 */
>  	if (test_24bit_addr(ip, addr)) {
>  		/* within range */
> +		int rc;
> +
>  		old = ftrace_call_replace(ip, addr, 1);
>  		new = PPC_INST_NOP;
> -		return ftrace_modify_code(ip, old, new);
> +		rc = ftrace_modify_code(ip, old, new);
> +		if (rc)
> +			return rc;
> +#ifdef CONFIG_MPROFILE_KERNEL
> +		old = PPC_INST_MFLR;
> +		new = PPC_INST_NOP;
> +		ftrace_modify_code(ip - 4, old, new);
> +		/* old mprofile kernel will error because no mflr */
> +#endif
> +		return rc;
>  	} else if (core_kernel_text(ip))
>  		return __ftrace_make_nop_kernel(rec, addr);
>  
> @@ -562,6 +601,20 @@ __ftrace_make_call(struct dyn_ftrace *rec, unsigned long addr)
>  		return -EINVAL;
>  	}
>  
> +#ifdef CONFIG_MPROFILE_KERNEL
> +	if (probe_kernel_read(op, (ip - 4), 4)) {
> +		pr_err("Fetching instruction at %lx failed.\n", (unsigned long)(ip - 4));
> +		return -EFAULT;
> +	}
> +
> +	if (op[0] == PPC_INST_NOP) {
> +		if (patch_instruction((ip - 4), PPC_INST_MFLR)) {
> +			pr_err("Patching mflr failed.\n");
> +			return -EINVAL;
> +		}
> +	}
> +#endif
> +
>  	if (patch_branch(ip, tramp, BRANCH_SET_LINK)) {
>  		pr_err("REL24 out of range!\n");
>  		return -EINVAL;
> @@ -650,6 +703,20 @@ static int __ftrace_make_call_kernel(struct dyn_ftrace *rec, unsigned long addr)
>  		return -EINVAL;
>  	}
>  
> +#ifdef CONFIG_MPROFILE_KERNEL
> +	if (probe_kernel_read(&op, (ip - 4), 4)) {
> +		pr_err("Fetching instruction at %lx failed.\n", (unsigned long)(ip - 4));
> +		return -EFAULT;
> +	}
> +
> +	if (op == PPC_INST_NOP) {
> +		if (patch_instruction((ip - 4), PPC_INST_MFLR)) {
> +			pr_err("Patching mflr failed.\n");
> +			return -EINVAL;
> +		}
> +	}
> +#endif
> +
>  	if (patch_branch(ip, tramp, BRANCH_SET_LINK)) {
>  		pr_err("Error patching branch to ftrace tramp!\n");
>  		return -EINVAL;
> @@ -670,6 +737,12 @@ int ftrace_make_call(struct dyn_ftrace *rec, unsigned long addr)
>  	 */
>  	if (test_24bit_addr(ip, addr)) {
>  		/* within range */
> +#ifdef CONFIG_MPROFILE_KERNEL
> +		old = PPC_INST_NOP;
> +		new = PPC_INST_MFLR;
> +		ftrace_modify_code(ip - 4, old, new);
> +		/* old mprofile-kernel sequence will error because no nop */
> +#endif
>  		old = PPC_INST_NOP;
>  		new = ftrace_call_replace(ip, addr, 1);
>  		return ftrace_modify_code(ip, old, new);
> -- 
> 2.20.1
