Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D4BC90BD0A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Jun 2024 23:43:53 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=eheeYZhh;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W33Kx6rB7z3gH1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Jun 2024 07:43:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=eheeYZhh;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:40e1:4800::1; helo=sin.source.kernel.org; envelope-from=mhiramat@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W33KG0bQ6z3gFK
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Jun 2024 07:43:14 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id EC2E9CE12FF;
	Mon, 17 Jun 2024 21:43:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E114BC2BD10;
	Mon, 17 Jun 2024 21:43:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718660590;
	bh=4Ku2hbQon9F/SdivMKNbn4SQ1F/J67e33VohQwd1J7E=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=eheeYZhhFGTuZRdYNMzruO2BlXD3P+/ETD0hxbY4V3AsJ73tGug49q85TCb945NEd
	 4dc+7ewjv+pyLDXKgJ9pz/zlFTLY9LUj/NXURwU7FG/e+wQS/GHi9usFIbsCriDjj/
	 vqitquV5KE8NDPvjpA/mbEpTfxITQqeTUN9DHuBbN6TppJd37oH1v/hoDMZjePMbU/
	 yAG8GC9myNWBSUjEbPp/GH110yOU44ej/oljvrGmg5v040LSnAOf7p8PpyLK8Inkym
	 mv+0RKKhnjMgaBTPNOomGsCr54x6TIwWyoJh0uCzdepz4NpljR9PbXiUbWTVXnapky
	 mmy1t5K/Ylctw==
Date: Tue, 18 Jun 2024 06:43:06 +0900
From: Masami Hiramatsu (Google) <mhiramat@kernel.org>
To: Naveen N Rao <naveen@kernel.org>
Subject: Re: [PATCH v2] PowerPC: Replace kretprobe with rethook
Message-Id: <20240618064306.14c2d3c601b0ca91d99839f0@kernel.org>
In-Reply-To: <otk7igwnrzfbjfeoikswr7p2kh6wgz6bsqnaejv57kkt4euse4@d57z7me2ajqr>
References: <20240610154509.446807-1-adubey@linux.ibm.com>
	<otk7igwnrzfbjfeoikswr7p2kh6wgz6bsqnaejv57kkt4euse4@d57z7me2ajqr>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
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
Cc: linuxppc-dev@lists.ozlabs.org, mhiramat@kernel.org, npiggin@gmail.com, Abhishek Dubey <adubey@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 17 Jun 2024 18:28:07 +0530
Naveen N Rao <naveen@kernel.org> wrote:

> Hi Abhishek,
> 
> On Mon, Jun 10, 2024 at 11:45:09AM GMT, Abhishek Dubey wrote:
> > This is an adaptation of commit f3a112c0c40d ("x86,rethook,kprobes:
> > Replace kretprobe with rethook on x86") to PowerPC.
> > 
> > Replaces the kretprobe code with rethook on Power. With this patch,
> > kretprobe on Power uses the rethook instead of kretprobe specific
> > trampoline code.
> > 
> > Reference to other archs:
> > commit b57c2f124098 ("riscv: add riscv rethook implementation")
> > commit 7b0a096436c2 ("LoongArch: Replace kretprobe with rethook")
> > 
> > Signed-off-by: Abhishek Dubey <adubey@linux.ibm.com>
> > ---
> >  arch/powerpc/Kconfig             |  1 +
> >  arch/powerpc/kernel/Makefile     |  1 +
> >  arch/powerpc/kernel/kprobes.c    | 65 +----------------------------
> >  arch/powerpc/kernel/optprobes.c  |  2 +-
> >  arch/powerpc/kernel/rethook.c    | 71 ++++++++++++++++++++++++++++++++
> >  arch/powerpc/kernel/stacktrace.c | 10 +++--
> >  6 files changed, 81 insertions(+), 69 deletions(-)
> >  create mode 100644 arch/powerpc/kernel/rethook.c
> 
> Thanks for implementing this - it is looking good, but please find a few 
> small suggestions below.
> 
> > 
> > diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
> > index c88c6d46a5bc..fa0b1ab3f935 100644
> > --- a/arch/powerpc/Kconfig
> > +++ b/arch/powerpc/Kconfig
> > @@ -270,6 +270,7 @@ config PPC
> >  	select HAVE_PERF_EVENTS_NMI		if PPC64
> >  	select HAVE_PERF_REGS
> >  	select HAVE_PERF_USER_STACK_DUMP
> > +	select HAVE_RETHOOK
> >  	select HAVE_REGS_AND_STACK_ACCESS_API
> >  	select HAVE_RELIABLE_STACKTRACE
> >  	select HAVE_RSEQ
> > diff --git a/arch/powerpc/kernel/Makefile b/arch/powerpc/kernel/Makefile
> > index 8585d03c02d3..7dd1b523b17f 100644
> > --- a/arch/powerpc/kernel/Makefile
> > +++ b/arch/powerpc/kernel/Makefile
> > @@ -140,6 +140,7 @@ obj-$(CONFIG_KPROBES)		+= kprobes.o
> >  obj-$(CONFIG_OPTPROBES)		+= optprobes.o optprobes_head.o
> >  obj-$(CONFIG_KPROBES_ON_FTRACE)	+= kprobes-ftrace.o
> >  obj-$(CONFIG_UPROBES)		+= uprobes.o
> > +obj-$(CONFIG_RETHOOK)           += rethook.o
> >  obj-$(CONFIG_PPC_UDBG_16550)	+= legacy_serial.o udbg_16550.o
> >  obj-$(CONFIG_SWIOTLB)		+= dma-swiotlb.o
> >  obj-$(CONFIG_ARCH_HAS_DMA_SET_MASK) += dma-mask.o
> > diff --git a/arch/powerpc/kernel/kprobes.c b/arch/powerpc/kernel/kprobes.c
> > index 14c5ddec3056..f8aa91bc3b17 100644
> > --- a/arch/powerpc/kernel/kprobes.c
> > +++ b/arch/powerpc/kernel/kprobes.c
> > @@ -228,16 +228,6 @@ static nokprobe_inline void set_current_kprobe(struct kprobe *p, struct pt_regs
> >  	kcb->kprobe_saved_msr = regs->msr;
> >  }
> >  
> > -void arch_prepare_kretprobe(struct kretprobe_instance *ri, struct pt_regs *regs)
> > -{
> > -	ri->ret_addr = (kprobe_opcode_t *)regs->link;
> > -	ri->fp = NULL;
> > -
> > -	/* Replace the return addr with trampoline addr */
> > -	regs->link = (unsigned long)__kretprobe_trampoline;
> > -}
> > -NOKPROBE_SYMBOL(arch_prepare_kretprobe);
> > -
> >  static int try_to_emulate(struct kprobe *p, struct pt_regs *regs)
> >  {
> >  	int ret;
> > @@ -394,49 +384,6 @@ int kprobe_handler(struct pt_regs *regs)
> >  }
> >  NOKPROBE_SYMBOL(kprobe_handler);
> >  
> > -/*
> > - * Function return probe trampoline:
> > - * 	- init_kprobes() establishes a probepoint here
> > - * 	- When the probed function returns, this probe
> > - * 		causes the handlers to fire
> > - */
> > -asm(".global __kretprobe_trampoline\n"
> > -	".type __kretprobe_trampoline, @function\n"
> > -	"__kretprobe_trampoline:\n"
> > -	"nop\n"
> > -	"blr\n"
> > -	".size __kretprobe_trampoline, .-__kretprobe_trampoline\n");
> > -
> > -/*
> > - * Called when the probe at kretprobe trampoline is hit
> > - */
> > -static int trampoline_probe_handler(struct kprobe *p, struct pt_regs *regs)
> > -{
> > -	unsigned long orig_ret_address;
> > -
> > -	orig_ret_address = __kretprobe_trampoline_handler(regs, NULL);
> > -	/*
> > -	 * We get here through one of two paths:
> > -	 * 1. by taking a trap -> kprobe_handler() -> here
> > -	 * 2. by optprobe branch -> optimized_callback() -> opt_pre_handler() -> here
> > -	 *
> > -	 * When going back through (1), we need regs->nip to be setup properly
> > -	 * as it is used to determine the return address from the trap.
> > -	 * For (2), since nip is not honoured with optprobes, we instead setup
> > -	 * the link register properly so that the subsequent 'blr' in
> > -	 * __kretprobe_trampoline jumps back to the right instruction.
> > -	 *
> > -	 * For nip, we should set the address to the previous instruction since
> > -	 * we end up emulating it in kprobe_handler(), which increments the nip
> > -	 * again.
> > -	 */
> > -	regs_set_return_ip(regs, orig_ret_address - 4);
> > -	regs->link = orig_ret_address;
> > -
> > -	return 0;
> > -}
> > -NOKPROBE_SYMBOL(trampoline_probe_handler);
> > -
> >  /*
> >   * Called after single-stepping.  p->addr is the address of the
> >   * instruction whose first byte has been replaced by the "breakpoint"
> > @@ -539,19 +486,9 @@ int kprobe_fault_handler(struct pt_regs *regs, int trapnr)
> >  }
> >  NOKPROBE_SYMBOL(kprobe_fault_handler);
> >  
> > -static struct kprobe trampoline_p = {
> > -	.addr = (kprobe_opcode_t *) &__kretprobe_trampoline,
> > -	.pre_handler = trampoline_probe_handler
> > -};
> > -
> > -int __init arch_init_kprobes(void)
> > -{
> > -	return register_kprobe(&trampoline_p);
> > -}
> > -
> >  int arch_trampoline_kprobe(struct kprobe *p)
> >  {
> > -	if (p->addr == (kprobe_opcode_t *)&__kretprobe_trampoline)
> > +	if (p->addr == (kprobe_opcode_t *)&arch_rethook_trampoline)
> >  		return 1;
> >  
> >  	return 0;
> > diff --git a/arch/powerpc/kernel/optprobes.c b/arch/powerpc/kernel/optprobes.c
> > index 004fae2044a3..c0b351d61058 100644
> > --- a/arch/powerpc/kernel/optprobes.c
> > +++ b/arch/powerpc/kernel/optprobes.c
> > @@ -56,7 +56,7 @@ static unsigned long can_optimize(struct kprobe *p)
> >  	 * has a 'nop' instruction, which can be emulated.
> >  	 * So further checks can be skipped.
> >  	 */
> > -	if (p->addr == (kprobe_opcode_t *)&__kretprobe_trampoline)
> > +	if (p->addr == (kprobe_opcode_t *)&arch_rethook_trampoline)
> >  		return addr + sizeof(kprobe_opcode_t);
> >  
> >  	/*
> > diff --git a/arch/powerpc/kernel/rethook.c b/arch/powerpc/kernel/rethook.c
> > new file mode 100644
> > index 000000000000..7386f602c9ab
> > --- /dev/null
> > +++ b/arch/powerpc/kernel/rethook.c
> > @@ -0,0 +1,71 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +/*
> > + * PowerPC implementation of rethook. This depends on kprobes.
> > + */
> > +
> > +#include <linux/kprobes.h>
> > +#include <linux/rethook.h>
> > +
> > +/*
> > + * Function return trampoline:
> > + *     - init_kprobes() establishes a probepoint here
> > + *     - When the probed function returns, this probe
> > + *         causes the handlers to fire
> > + */
> > +asm(".global arch_rethook_trampoline\n"
> > +	".type arch_rethook_trampoline, @function\n"
> > +	"arch_rethook_trampoline:\n"
> > +	"nop\n"
> > +	"blr\n"
> > +	".size arch_rethook_trampoline, .-arch_rethook_trampoline\n");
> > +
> > +/*
> > + * Called when the probe at kretprobe trampoline is hit
> > + */
> > +static int trampoline_rethook_handler(struct kprobe *p, struct pt_regs *regs)
> > +{
> > +	unsigned long orig_ret_address;
> > +
> > +	orig_ret_address = rethook_trampoline_handler(regs, 0);
> > +	/*
> > +	 * We get here through one of two paths:
> > +	 * 1. by taking a trap -> kprobe_handler() -> here
> > +	 * 2. by optprobe branch -> optimized_callback() -> opt_pre_handler() -> here
> > +	 *
> > +	 * When going back through (1), we need regs->nip to be setup properly
> > +	 * as it is used to determine the return address from the trap.
> > +	 * For (2), since nip is not honoured with optprobes, we instead setup
> > +	 * the link register properly so that the subsequent 'blr' in
> > +	 * __kretprobe_trampoline jumps back to the right instruction.
> > +	 *
> > +	 * For nip, we should set the address to the previous instruction since
> > +	 * we end up emulating it in kprobe_handler(), which increments the nip
> > +	 * again.
> > +	 */
> > +	regs_set_return_ip(regs, orig_ret_address - 4);
> > +	regs->link = orig_ret_address;
> 
> I think we can move these into arch_rethook_fixup_return(), so 
> trampoline_rethook_handler() can simply invoke 
> rethook_trampoline_handler().
> 
> > +
> > +	return 0;
> > +}
> > +NOKPROBE_SYMBOL(trampoline_rethook_handler);
> > +
> > +void arch_rethook_prepare(struct rethook_node *rh, struct pt_regs *regs, bool mcount)
> > +{
> > +	rh->ret_addr = regs->link;
> > +	rh->frame = 0;
> 
> There is additional code to validate our assumption with a frame pointer 
> set, so I think we should set this to regs->gpr[1].

Additonal note: If this sets regs->gpr[1], pass it to rethook_trampoline_handler()
too, so that it can find correct frame.

BTW, it seems powerpc does not use kretprobe/rethook shadow stack for
stack unwinding yet, is that right?

Thanks!

> 
> > +
> > +	/* Replace the return addr with trampoline addr */
> > +	regs->link = (unsigned long)arch_rethook_trampoline;
> > +}
> > +NOKPROBE_SYMBOL(arch_rethook_prepare);
> > +
> > +static struct kprobe trampoline_p = {
> > +	.addr = (kprobe_opcode_t *) &arch_rethook_trampoline,
> > +	.pre_handler = trampoline_rethook_handler
> > +};
> > +
> > +/* rethook initializer */
> > +int arch_init_kprobes(void)
> 
> Needs __init annotation.
> 
> > +{
> > +	return register_kprobe(&trampoline_p);
> > +}
> > diff --git a/arch/powerpc/kernel/stacktrace.c b/arch/powerpc/kernel/stacktrace.c
> > index e6a958a5da27..a31648b45956 100644
> > --- a/arch/powerpc/kernel/stacktrace.c
> > +++ b/arch/powerpc/kernel/stacktrace.c
> > @@ -21,6 +21,7 @@
> >  #include <asm/processor.h>
> >  #include <linux/ftrace.h>
> >  #include <asm/kprobes.h>
> > +#include <linux/rethook.h>
> >  
> >  #include <asm/paca.h>
> >  
> > @@ -133,14 +134,15 @@ int __no_sanitize_address arch_stack_walk_reliable(stack_trace_consume_fn consum
> >  		 * arch-dependent code, they are generic.
> >  		 */
> >  		ip = ftrace_graph_ret_addr(task, &graph_idx, ip, stack);
> > -#ifdef CONFIG_KPROBES
> > +
> >  		/*
> >  		 * Mark stacktraces with kretprobed functions on them
> >  		 * as unreliable.
> >  		 */
> > -		if (ip == (unsigned long)__kretprobe_trampoline)
> > -			return -EINVAL;
> > -#endif
> > +		#ifdef CONFIG_RETHOOK
> 
> The #ifdef usually starts at column 0, and there is no need to indent 
> the below code.
> 
> - Naveen
> 
> > +			if (ip == (unsigned long)arch_rethook_trampoline)
> > +				return -EINVAL;
> > +		#endif
> >  
> >  		if (!consume_entry(cookie, ip))
> >  			return -EINVAL;
> > -- 
> > 2.44.0
> > 


-- 
Masami Hiramatsu (Google) <mhiramat@kernel.org>
