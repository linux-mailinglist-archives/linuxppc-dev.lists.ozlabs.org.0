Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 776BAF12F5
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Nov 2019 10:54:57 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 477MMf4BJYzF3mh
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Nov 2019 20:54:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 477MKP4TFGzDqPb
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 Nov 2019 20:52:57 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.b="b9gId18g"; dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 477MKM0M9xz9sP6;
 Wed,  6 Nov 2019 20:52:54 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1573033977;
 bh=izSF2AL2NQDyQCu8234O8zrZSbgYgjyqHCG8/iEWwGs=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=b9gId18gagaVywR+++g4RbfioORzpLVEpkQFDfoe6YJ+Id1Hyjjq/06ICOZfwGQ7s
 uEw327gffeKFiSAHkylzMZ/SlvyUFoOtryquxAkEd7UwW0ywC33JL/TU521FoKipgm
 nmhtWZg0/lLCyrcslap1+XDAoBZSrMxItWvQ1SmJ9RNfGuYMWc2c3X59G7Im5DKs8u
 dmxP/7vER/jwGiOjnVMTWRO07UPpgf8NEYrfqsa0inOKOjfQLe+sscQL5S6RbDv/aq
 ZbSIdMDPaAr0Z/SRZSv1GMd4yPv/NNcs1Bjn+vaWsmgj+XcmuizMxkiy294kyreFAY
 5s6eorQGvCfXg==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Dmitry Safonov <dima@arista.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 26/50] powerpc: Add show_stack_loglvl()
In-Reply-To: <20191106030542.868541-27-dima@arista.com>
References: <20191106030542.868541-1-dima@arista.com>
 <20191106030542.868541-27-dima@arista.com>
Date: Wed, 06 Nov 2019 20:52:52 +1100
Message-ID: <8736f172mj.fsf@mpe.ellerman.id.au>
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

Yes, I've had bug reports where the stacktrace is missing, which is
annoying. Thanks for trying to fix the problem.

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
> Signed-off-by: Dmitry Safonov <dima@arista.com>
> ---
>  arch/powerpc/kernel/process.c | 18 +++++++++++++-----
>  1 file changed, 13 insertions(+), 5 deletions(-)

This looks good to me.

Acked-by: Michael Ellerman <mpe@ellerman.id.au> (powerpc)

cheers


> diff --git a/arch/powerpc/kernel/process.c b/arch/powerpc/kernel/process.c
> index 639ceae7da9d..34b46680a196 100644
> --- a/arch/powerpc/kernel/process.c
> +++ b/arch/powerpc/kernel/process.c
> @@ -2028,7 +2028,8 @@ unsigned long get_wchan(struct task_struct *p)
>  
>  static int kstack_depth_to_print = CONFIG_PRINT_STACK_DEPTH;
>  
> -void show_stack(struct task_struct *tsk, unsigned long *stack)
> +void show_stack_loglvl(struct task_struct *tsk, unsigned long *stack,
> +		       const char *loglvl)
>  {
>  	unsigned long sp, ip, lr, newsp;
>  	int count = 0;
> @@ -2053,7 +2054,7 @@ void show_stack(struct task_struct *tsk, unsigned long *stack)
>  	}
>  
>  	lr = 0;
> -	printk("Call Trace:\n");
> +	printk("%sCall Trace:\n", loglvl);
>  	do {
>  		if (!validate_sp(sp, tsk, STACK_FRAME_OVERHEAD))
>  			break;
> @@ -2062,7 +2063,8 @@ void show_stack(struct task_struct *tsk, unsigned long *stack)
>  		newsp = stack[0];
>  		ip = stack[STACK_FRAME_LR_SAVE];
>  		if (!firstframe || ip != lr) {
> -			printk("["REG"] ["REG"] %pS", sp, ip, (void *)ip);
> +			printk("%s["REG"] ["REG"] %pS",
> +				loglvl, sp, ip, (void *)ip);
>  #ifdef CONFIG_FUNCTION_GRAPH_TRACER
>  			ret_addr = ftrace_graph_ret_addr(current,
>  						&ftrace_idx, ip, stack);
> @@ -2084,8 +2086,9 @@ void show_stack(struct task_struct *tsk, unsigned long *stack)
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
> @@ -2095,6 +2098,11 @@ void show_stack(struct task_struct *tsk, unsigned long *stack)
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
> 2.23.0
