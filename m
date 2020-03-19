Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DA69418ABDE
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Mar 2020 05:39:19 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48jZ1d0MbjzDrgn
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Mar 2020 15:39:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48jYCq35JtzDr7p
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Mar 2020 15:03:03 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=HH7ifyMV; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 48jYCm6mbGz9sPF;
 Thu, 19 Mar 2020 15:03:00 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1584590582;
 bh=EBGMlwir/hDpfDv8qsV3iprPq8zRRXa9meWRenlJUSg=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=HH7ifyMVB5roHXhj/gHeKqF4B40FLkcnuMbGL+/KMYQCqLhPmlI5QT5XZfKMyAIc7
 2ubbKZCKpppCeeeDMxAHxJ7VuXy20kGNTyIlz1cCrtvJkqt1WLcCzlEAiRkX7+b3kj
 9qtd1By7q0tfPXXAFhKQ1rgaPFhVh+yYjCj97kFtNLTEVc0tvF6gxf/lVf3awBeHat
 yVV2vhjdwyhQTXp7BjCP1m6ptXDNa0DqjE2vYQaEAtoyEzFA/Sb1pAuzMtCeTV11ko
 vgtSbudNyx6JAR3oUr9oscw0KJYKPTNyyT/9E8WX4l2y+VDT/EomN+66PEft1yeLCj
 napmJFPXX4ykQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Dmitry Safonov <dima@arista.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCHv2 26/50] powerpc: Add show_stack_loglvl()
In-Reply-To: <20200316143916.195608-27-dima@arista.com>
References: <20200316143916.195608-1-dima@arista.com>
 <20200316143916.195608-27-dima@arista.com>
Date: Thu, 19 Mar 2020 15:03:03 +1100
Message-ID: <87blotdma0.fsf@mpe.ellerman.id.au>
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
Cc: Petr Mladek <pmladek@suse.com>, Dmitry Safonov <dima@arista.com>,
 Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dmitry Safonov <0x7f454c46@gmail.com>, Steven Rostedt <rostedt@goodmis.org>,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 Paul Mackerras <paulus@samba.org>, Jiri Slaby <jslaby@suse.com>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 Ingo Molnar <mingo@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Dmitry Safonov <dima@arista.com> writes:
> Currently, the log-level of show_stack() depends on a platform
> realization. It creates situations where the headers are printed with
> lower log level or higher than the stacktrace (depending on
> a platform or user).
>
> Furthermore, it forces the logic decision from user to an architecture
> side. In result, some users as sysrq/kdb/etc are doing tricks with
> temporary rising console_loglevel while printing their messages.
> And in result it not only may print unwanted messages from other CPUs,
> but also omit printing at all in the unlucky case where the printk()
> was deferred.
>
> Introducing log-level parameter and KERN_UNSUPPRESSED [1] seems
> an easier approach than introducing more printk buffers.
> Also, it will consolidate printings with headers.
>
> Introduce show_stack_loglvl(), that eventually will substitute
> show_stack().
>
> Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Paul Mackerras <paulus@samba.org>
> Cc: linuxppc-dev@lists.ozlabs.org
> [1]: https://lore.kernel.org/lkml/20190528002412.1625-1-dima@arista.com/T/#u
> Acked-by: Michael Ellerman <mpe@ellerman.id.au> (powerpc)
> Signed-off-by: Dmitry Safonov <dima@arista.com>
> ---
>  arch/powerpc/kernel/process.c | 18 +++++++++++++-----
>  1 file changed, 13 insertions(+), 5 deletions(-)

Thanks for doing this, it has caused me problems in the past.

Acked-by: Michael Ellerman <mpe@ellerman.id.au> (powerpc)

cheers

> diff --git a/arch/powerpc/kernel/process.c b/arch/powerpc/kernel/process.c
> index fad50db9dcf2..c1ab7f613da4 100644
> --- a/arch/powerpc/kernel/process.c
> +++ b/arch/powerpc/kernel/process.c
> @@ -2034,7 +2034,8 @@ unsigned long get_wchan(struct task_struct *p)
>  
>  static int kstack_depth_to_print = CONFIG_PRINT_STACK_DEPTH;
>  
> -void show_stack(struct task_struct *tsk, unsigned long *stack)
> +void show_stack_loglvl(struct task_struct *tsk, unsigned long *stack,
> +		       const char *loglvl)
>  {
>  	unsigned long sp, ip, lr, newsp;
>  	int count = 0;
> @@ -2059,7 +2060,7 @@ void show_stack(struct task_struct *tsk, unsigned long *stack)
>  	}
>  
>  	lr = 0;
> -	printk("Call Trace:\n");
> +	printk("%sCall Trace:\n", loglvl);
>  	do {
>  		if (!validate_sp(sp, tsk, STACK_FRAME_OVERHEAD))
>  			break;
> @@ -2068,7 +2069,8 @@ void show_stack(struct task_struct *tsk, unsigned long *stack)
>  		newsp = stack[0];
>  		ip = stack[STACK_FRAME_LR_SAVE];
>  		if (!firstframe || ip != lr) {
> -			printk("["REG"] ["REG"] %pS", sp, ip, (void *)ip);
> +			printk("%s["REG"] ["REG"] %pS",
> +				loglvl, sp, ip, (void *)ip);
>  #ifdef CONFIG_FUNCTION_GRAPH_TRACER
>  			ret_addr = ftrace_graph_ret_addr(current,
>  						&ftrace_idx, ip, stack);
> @@ -2090,8 +2092,9 @@ void show_stack(struct task_struct *tsk, unsigned long *stack)
>  			struct pt_regs *regs = (struct pt_regs *)
>  				(sp + STACK_FRAME_OVERHEAD);
>  			lr = regs->link;
> -			printk("--- interrupt: %lx at %pS\n    LR = %pS\n",
> -			       regs->trap, (void *)regs->nip, (void *)lr);
> +			printk("%s--- interrupt: %lx at %pS\n    LR = %pS\n",
> +			       loglvl, regs->trap,
> +			       (void *)regs->nip, (void *)lr);
>  			firstframe = 1;
>  		}
>  
> @@ -2101,6 +2104,11 @@ void show_stack(struct task_struct *tsk, unsigned long *stack)
>  	put_task_stack(tsk);
>  }
>  
> +void show_stack(struct task_struct *tsk, unsigned long *stack)
> +{
> +	show_stack_loglvl(tsk, stack, KERN_DEFAULT);
> +}
> +
>  #ifdef CONFIG_PPC64
>  /* Called with hard IRQs off */
>  void notrace __ppc64_runlatch_on(void)
> -- 
> 2.25.1
