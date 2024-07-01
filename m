Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AB4591E455
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Jul 2024 17:40:56 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=OpkRzEbe;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WCVck1Scbz3cfg
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Jul 2024 01:40:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=OpkRzEbe;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=naveen@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WCVc25Pzkz3cB2
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Jul 2024 01:40:18 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A4A7161418;
	Mon,  1 Jul 2024 15:40:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD6B2C116B1;
	Mon,  1 Jul 2024 15:40:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719848416;
	bh=C+yKqLrH7q9YQAjL+LWd5J1OpHHhMLMYj9nRU7lRLW4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OpkRzEbeo1RI8Pn1PXyvsiA+waQO+86R3U7/OHve7mhsVaLdLWqwJP0Vq/nKuL8XP
	 REaSq/b5W/Ej36ryx5C58BeuyQKGVFRhlWrEN0CAJ0PVxTzp/wCz2og/3Zo0w3eB9c
	 FONrTd9GtIdjfk5xlKBpY2ELGmeaFC4ZmRfn9LsrdB+/hLGT0sCRniDvneyraEmUDy
	 WLyKEHxb2h45UYZAwsaAcsBt0AS0bJYEbQqbJtHSE8P88dmjt0Z1mQ8ZhyePe8fk6v
	 eLJZUytvABQX0+WgDxvBGOSSvAlFlH90ykOTSyqU6yQiXl9tWbrJgkzn0ybJl/kpch
	 9tM32lv20qO2Q==
Date: Mon, 1 Jul 2024 21:01:46 +0530
From: Naveen N Rao <naveen@kernel.org>
To: Abhishek Dubey <adubey@linux.ibm.com>
Subject: Re: [PATCH v3] PowerPC: Replace kretprobe with rethook
Message-ID: <tbl6ayy2mq4r4zqcfkyl6oh4qe3bt7gawfuxieiwptyk3idtoy@gytyt2ziau5p>
References: <20240627132101.405665-1-adubey@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240627132101.405665-1-adubey@linux.ibm.com>
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
Cc: linuxppc-dev@lists.ozlabs.org, mhiramat@kernel.org, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Abhishek,
This patch looks good to me, except for one main change in 
trampoline_rethook_handler().

Other than that, I have a few more minor comments. Sorry, I should have 
caught that last time. But, the other change needs a new submission, so 
good to get these addressed as well.

For the subject, we generally use 'powerpc' (all lowercase):
	powerpc: Replace kretprobe with rethook

On Thu, Jun 27, 2024 at 09:21:01AM GMT, Abhishek Dubey wrote:
> This is an adaptation of commit f3a112c0c40d ("x86,rethook,kprobes:
> Replace kretprobe with rethook on x86") to PowerPC.
					     ^^^^^^^
Here too.

> 
> Replaces the kretprobe code with rethook on Power. With this patch,
> kretprobe on Power uses the rethook instead of kretprobe specific
> trampoline code.

In general, it is good to describe what is being done in the patch. So, 
rather than 'Replaces', you can start that with 'Replace kretprobe code 
with rethook on powerpc.'

The second sentence also looks redundant. It is good if you can describe 
what the patch does where possible. For instance:
  Rethook follows the existing kretprobe implementation, but separates 
  it from kprobes so that it can be used by fprobe (ftrace-based 
  function entry/exit probes). As such, this patch also enables fprobe 
  to work on powerpc. The only other change compared to the existing 
  kretprobe implementation is doing the return address fixup in 
  arch_rethook_fixup_return().

> 
> Reference to other archs:
> commit b57c2f124098 ("riscv: add riscv rethook implementation")
> commit 7b0a096436c2 ("LoongArch: Replace kretprobe with rethook")
> 
> Signed-off-by: Abhishek Dubey <adubey@linux.ibm.com>
> ---
> 
> Changes in v3:
> * Fixing return address moved to arch_rethook_fixup_return()
> * Addressed other minor comments
> * show_stack mods to show correct fn name to go in separate patch
> ---
>  arch/powerpc/Kconfig             |  1 +
>  arch/powerpc/kernel/Makefile     |  1 +
>  arch/powerpc/kernel/kprobes.c    | 65 +--------------------------
>  arch/powerpc/kernel/optprobes.c  |  2 +-
>  arch/powerpc/kernel/rethook.c    | 77 ++++++++++++++++++++++++++++++++
>  arch/powerpc/kernel/stacktrace.c |  6 ++-
>  6 files changed, 85 insertions(+), 67 deletions(-)
>  create mode 100644 arch/powerpc/kernel/rethook.c
> 
> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
> index c88c6d46a5bc..fa0b1ab3f935 100644
> --- a/arch/powerpc/Kconfig
> +++ b/arch/powerpc/Kconfig
> @@ -270,6 +270,7 @@ config PPC
>  	select HAVE_PERF_EVENTS_NMI		if PPC64
>  	select HAVE_PERF_REGS
>  	select HAVE_PERF_USER_STACK_DUMP
> +	select HAVE_RETHOOK
>  	select HAVE_REGS_AND_STACK_ACCESS_API
>  	select HAVE_RELIABLE_STACKTRACE
>  	select HAVE_RSEQ
> diff --git a/arch/powerpc/kernel/Makefile 
> b/arch/powerpc/kernel/Makefile
> index 8585d03c02d3..7dd1b523b17f 100644
> --- a/arch/powerpc/kernel/Makefile
> +++ b/arch/powerpc/kernel/Makefile
> @@ -140,6 +140,7 @@ obj-$(CONFIG_KPROBES)		+= kprobes.o
>  obj-$(CONFIG_OPTPROBES)		+= optprobes.o optprobes_head.o
>  obj-$(CONFIG_KPROBES_ON_FTRACE)	+= kprobes-ftrace.o
>  obj-$(CONFIG_UPROBES)		+= uprobes.o
> +obj-$(CONFIG_RETHOOK)           += rethook.o
>  obj-$(CONFIG_PPC_UDBG_16550)	+= legacy_serial.o udbg_16550.o
>  obj-$(CONFIG_SWIOTLB)		+= dma-swiotlb.o
>  obj-$(CONFIG_ARCH_HAS_DMA_SET_MASK) += dma-mask.o
> diff --git a/arch/powerpc/kernel/kprobes.c b/arch/powerpc/kernel/kprobes.c
> index 14c5ddec3056..f8aa91bc3b17 100644
> --- a/arch/powerpc/kernel/kprobes.c
> +++ b/arch/powerpc/kernel/kprobes.c
> @@ -228,16 +228,6 @@ static nokprobe_inline void set_current_kprobe(struct kprobe *p, struct pt_regs
>  	kcb->kprobe_saved_msr = regs->msr;
>  }
>  
> -void arch_prepare_kretprobe(struct kretprobe_instance *ri, struct pt_regs *regs)
> -{
> -	ri->ret_addr = (kprobe_opcode_t *)regs->link;
> -	ri->fp = NULL;
> -
> -	/* Replace the return addr with trampoline addr */
> -	regs->link = (unsigned long)__kretprobe_trampoline;
> -}
> -NOKPROBE_SYMBOL(arch_prepare_kretprobe);
> -
>  static int try_to_emulate(struct kprobe *p, struct pt_regs *regs)
>  {
>  	int ret;
> @@ -394,49 +384,6 @@ int kprobe_handler(struct pt_regs *regs)
>  }
>  NOKPROBE_SYMBOL(kprobe_handler);
>  
> -/*
> - * Function return probe trampoline:
> - * 	- init_kprobes() establishes a probepoint here
> - * 	- When the probed function returns, this probe
> - * 		causes the handlers to fire
> - */
> -asm(".global __kretprobe_trampoline\n"
> -	".type __kretprobe_trampoline, @function\n"
> -	"__kretprobe_trampoline:\n"
> -	"nop\n"
> -	"blr\n"
> -	".size __kretprobe_trampoline, .-__kretprobe_trampoline\n");
> -
> -/*
> - * Called when the probe at kretprobe trampoline is hit
> - */
> -static int trampoline_probe_handler(struct kprobe *p, struct pt_regs *regs)
> -{
> -	unsigned long orig_ret_address;
> -
> -	orig_ret_address = __kretprobe_trampoline_handler(regs, NULL);
> -	/*
> -	 * We get here through one of two paths:
> -	 * 1. by taking a trap -> kprobe_handler() -> here
> -	 * 2. by optprobe branch -> optimized_callback() -> opt_pre_handler() -> here
> -	 *
> -	 * When going back through (1), we need regs->nip to be setup properly
> -	 * as it is used to determine the return address from the trap.
> -	 * For (2), since nip is not honoured with optprobes, we instead setup
> -	 * the link register properly so that the subsequent 'blr' in
> -	 * __kretprobe_trampoline jumps back to the right instruction.
> -	 *
> -	 * For nip, we should set the address to the previous instruction since
> -	 * we end up emulating it in kprobe_handler(), which increments the nip
> -	 * again.
> -	 */
> -	regs_set_return_ip(regs, orig_ret_address - 4);
> -	regs->link = orig_ret_address;
> -
> -	return 0;
> -}
> -NOKPROBE_SYMBOL(trampoline_probe_handler);
> -
>  /*
>   * Called after single-stepping.  p->addr is the address of the
>   * instruction whose first byte has been replaced by the "breakpoint"
> @@ -539,19 +486,9 @@ int kprobe_fault_handler(struct pt_regs *regs, int trapnr)
>  }
>  NOKPROBE_SYMBOL(kprobe_fault_handler);
>  
> -static struct kprobe trampoline_p = {
> -	.addr = (kprobe_opcode_t *) &__kretprobe_trampoline,
> -	.pre_handler = trampoline_probe_handler
> -};
> -
> -int __init arch_init_kprobes(void)
> -{
> -	return register_kprobe(&trampoline_p);
> -}
> -
>  int arch_trampoline_kprobe(struct kprobe *p)
>  {
> -	if (p->addr == (kprobe_opcode_t *)&__kretprobe_trampoline)
> +	if (p->addr == (kprobe_opcode_t *)&arch_rethook_trampoline)
>  		return 1;
>  
>  	return 0;
> diff --git a/arch/powerpc/kernel/optprobes.c b/arch/powerpc/kernel/optprobes.c
> index 004fae2044a3..c0b351d61058 100644
> --- a/arch/powerpc/kernel/optprobes.c
> +++ b/arch/powerpc/kernel/optprobes.c
> @@ -56,7 +56,7 @@ static unsigned long can_optimize(struct kprobe *p)
>  	 * has a 'nop' instruction, which can be emulated.
>  	 * So further checks can be skipped.
>  	 */
> -	if (p->addr == (kprobe_opcode_t *)&__kretprobe_trampoline)
> +	if (p->addr == (kprobe_opcode_t *)&arch_rethook_trampoline)
>  		return addr + sizeof(kprobe_opcode_t);
>  
>  	/*
> diff --git a/arch/powerpc/kernel/rethook.c b/arch/powerpc/kernel/rethook.c
> new file mode 100644
> index 000000000000..d2453793ea5d
> --- /dev/null
> +++ b/arch/powerpc/kernel/rethook.c
> @@ -0,0 +1,77 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * PowerPC implementation of rethook. This depends on kprobes.
> + */
> +
> +#include <linux/kprobes.h>
> +#include <linux/rethook.h>
> +
> +/*
> + * Function return trampoline:
> + *     - init_kprobes() establishes a probepoint here
> + *     - When the probed function returns, this probe
> + *         causes the handlers to fire
> + */
> +asm(".global arch_rethook_trampoline\n"
> +	".type arch_rethook_trampoline, @function\n"
> +	"arch_rethook_trampoline:\n"
> +	"nop\n"
> +	"blr\n"
> +	".size arch_rethook_trampoline, .-arch_rethook_trampoline\n");
> +
> +/*
> + * Called when the probe at kretprobe trampoline is hit
> + */
> +static int trampoline_rethook_handler(struct kprobe *p, struct pt_regs *regs)
> +{
> +	unsigned long orig_ret_address;
> +
> +	orig_ret_address = rethook_trampoline_handler(regs, 0);
> +	rethook_trampoline_handler(regs, orig_ret_address);
> +	return 0;
> +}

I think we should pass in regs->gpr[1] to allow it to be verified 
against the stack pointer we saved on function entry. This can be 
simplified to:

static int trampoline_rethook_handler(struct kprobe *p, struct pt_regs *regs)
{
	return !rethook_trampoline_handler(regs, regs->gpr[1]);
}

I have tested this patch with that change. So, with that change 
included:
Reviewed-by: Naveen N Rao <naveen@kernel.org>


> +NOKPROBE_SYMBOL(trampoline_rethook_handler);
> +
> +void arch_rethook_prepare(struct rethook_node *rh, struct pt_regs *regs, bool mcount)
> +{
> +	rh->ret_addr = regs->link;
> +	rh->frame = regs->gpr[1];
> +
> +	/* Replace the return addr with trampoline addr */
> +	regs->link = (unsigned long)arch_rethook_trampoline;
> +}
> +NOKPROBE_SYMBOL(arch_rethook_prepare);
> +
> +/* This is called from rethook_trampoline_handler(). */
> +void arch_rethook_fixup_return(struct pt_regs *regs, unsigned long orig_ret_address)
> +{
> +	/*
> +	 * We get here through one of two paths:
> +	 * 1. by taking a trap -> kprobe_handler() -> here
> +	 * 2. by optprobe branch -> optimized_callback() -> opt_pre_handler() -> here
> +	 *
> +	 * When going back through (1), we need regs->nip to be setup properly
> +	 * as it is used to determine the return address from the trap.
> +	 * For (2), since nip is not honoured with optprobes, we instead setup
> +	 * the link register properly so that the subsequent 'blr' in
> +	 * __kretprobe_trampoline jumps back to the right instruction.
	  ^^^^^^^^^^^^^^^^^^^^^^^
	  arch_rethook_trampoline


Thanks!
- Naveen

> +	 *
> +	 * For nip, we should set the address to the previous instruction since
> +	 * we end up emulating it in kprobe_handler(), which increments the nip
> +	 * again.
> +	 */
> +	regs_set_return_ip(regs, orig_ret_address - 4);
> +	regs->link = orig_ret_address;
> +}
> +NOKPROBE_SYMBOL(arch_rethook_fixup_return);
> +
> +static struct kprobe trampoline_p = {
> +	.addr = (kprobe_opcode_t *) &arch_rethook_trampoline,
> +	.pre_handler = trampoline_rethook_handler
> +};
> +
> +/* rethook initializer */
> +int __init arch_init_kprobes(void)
> +{
> +	return register_kprobe(&trampoline_p);
> +}
> diff --git a/arch/powerpc/kernel/stacktrace.c b/arch/powerpc/kernel/stacktrace.c
> index e6a958a5da27..90882b5175cd 100644
> --- a/arch/powerpc/kernel/stacktrace.c
> +++ b/arch/powerpc/kernel/stacktrace.c
> @@ -21,6 +21,7 @@
>  #include <asm/processor.h>
>  #include <linux/ftrace.h>
>  #include <asm/kprobes.h>
> +#include <linux/rethook.h>
>  
>  #include <asm/paca.h>
>  
> @@ -133,12 +134,13 @@ int __no_sanitize_address arch_stack_walk_reliable(stack_trace_consume_fn consum
>  		 * arch-dependent code, they are generic.
>  		 */
>  		ip = ftrace_graph_ret_addr(task, &graph_idx, ip, stack);
> -#ifdef CONFIG_KPROBES
> +
>  		/*
>  		 * Mark stacktraces with kretprobed functions on them
>  		 * as unreliable.
>  		 */
> -		if (ip == (unsigned long)__kretprobe_trampoline)
> +#ifdef CONFIG_RETHOOK
> +		if (ip == (unsigned long)arch_rethook_trampoline)
>  			return -EINVAL;
>  #endif
>  
> -- 
> 2.44.0
> 
