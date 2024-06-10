Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 571CA9029A3
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Jun 2024 22:04:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VyjSB2fdzz3cXs
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jun 2024 06:04:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=goodmis.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=srs0=wnj5=nm=goodmis.org=rostedt@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VyjRk35fRz30Vp
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Jun 2024 06:03:46 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2885660BC3;
	Mon, 10 Jun 2024 20:03:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E988FC2BBFC;
	Mon, 10 Jun 2024 20:03:42 +0000 (UTC)
Date: Mon, 10 Jun 2024 16:03:56 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Naveen N Rao <naveen@kernel.org>
Subject: Re: [RFC PATCH v2 2/5] powerpc/ftrace: Remove pointer to struct
 module from dyn_arch_ftrace
Message-ID: <20240610160356.70e8f7ac@gandalf.local.home>
In-Reply-To: <50b038f167f3fb94ed6074e029b6794bbe6e83a2.1718008093.git.naveen@kernel.org>
References: <cover.1718008093.git.naveen@kernel.org>
	<50b038f167f3fb94ed6074e029b6794bbe6e83a2.1718008093.git.naveen@kernel.org>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
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
Cc: Mark Rutland <mark.rutland@arm.com>, Masahiro Yamada <masahiroy@kernel.org>, Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org, Masami Hiramatsu <mhiramat@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 10 Jun 2024 14:08:15 +0530
Naveen N Rao <naveen@kernel.org> wrote:

> Pointer to struct module is only relevant for ftrace records belonging
> to kernel modules. Having this field in dyn_arch_ftrace wastes memory
> for all ftrace records belonging to the kernel. Remove the same in
> favour of looking up the module from the ftrace record address, similar
> to other architectures.
> 
> Signed-off-by: Naveen N Rao <naveen@kernel.org>
> ---
>  arch/powerpc/include/asm/ftrace.h        |  1 -
>  arch/powerpc/kernel/trace/ftrace.c       | 47 ++++++++++-----
>  arch/powerpc/kernel/trace/ftrace_64_pg.c | 73 +++++++++++-------------
>  3 files changed, 64 insertions(+), 57 deletions(-)
> 
> diff --git a/arch/powerpc/include/asm/ftrace.h b/arch/powerpc/include/asm/ftrace.h
> index 107fc5a48456..201f9d15430a 100644
> --- a/arch/powerpc/include/asm/ftrace.h
> +++ b/arch/powerpc/include/asm/ftrace.h
> @@ -26,7 +26,6 @@ unsigned long prepare_ftrace_return(unsigned long parent, unsigned long ip,
>  struct module;
>  struct dyn_ftrace;
>  struct dyn_arch_ftrace {
> -	struct module *mod;
>  };

Nice. I always hated that extra field.


>  
>  #ifdef CONFIG_DYNAMIC_FTRACE_WITH_ARGS
> diff --git a/arch/powerpc/kernel/trace/ftrace.c b/arch/powerpc/kernel/trace/ftrace.c
> index d8d6b4fd9a14..041be965485e 100644
> --- a/arch/powerpc/kernel/trace/ftrace.c
> +++ b/arch/powerpc/kernel/trace/ftrace.c
> @@ -106,20 +106,36 @@ static unsigned long find_ftrace_tramp(unsigned long ip)
>  	return 0;
>  }
>  
> +static struct module *ftrace_lookup_module(struct dyn_ftrace *rec)
> +{
> +	struct module *mod = NULL;
> +
> +#ifdef CONFIG_MODULES
> +	/*
> +	 * NOTE: __module_text_address() must be called with preemption
> +	 * disabled, but we can rely on ftrace_lock to ensure that 'mod'
> +	 * retains its validity throughout the remainder of this code.
> +	*/
> +	preempt_disable();
> +	mod = __module_text_address(rec->ip);
> +	preempt_enable();
> +
> +	if (!mod)
> +		pr_err("No module loaded at addr=%lx\n", rec->ip);
> +#endif
> +
> +	return mod;
> +}

It may look nicer to have:

#ifdef CONFIG_MODULES
static struct module *ftrace_lookup_module(struct dyn_ftrace *rec)
{
	struct module *mod = NULL;

	/*
	 * NOTE: __module_text_address() must be called with preemption
	 * disabled, but we can rely on ftrace_lock to ensure that 'mod'
	 * retains its validity throughout the remainder of this code.
	*/
	preempt_disable();
	mod = __module_text_address(rec->ip);
	preempt_enable();

	if (!mod)
		pr_err("No module loaded at addr=%lx\n", rec->ip);

	return mod;
}
#else
static inline struct module *ftrace_lookup_module(struct dyn_ftrace *rec)
{
	return NULL;
}
#endif

> +
>  static int ftrace_get_call_inst(struct dyn_ftrace *rec, unsigned long addr, ppc_inst_t *call_inst)
>  {
>  	unsigned long ip = rec->ip;
>  	unsigned long stub;
> +	struct module *mod;
>  
>  	if (is_offset_in_branch_range(addr - ip)) {
>  		/* Within range */
>  		stub = addr;
> -#ifdef CONFIG_MODULES
> -	} else if (rec->arch.mod) {
> -		/* Module code would be going to one of the module stubs */
> -		stub = (addr == (unsigned long)ftrace_caller ? rec->arch.mod->arch.tramp :
> -							       rec->arch.mod->arch.tramp_regs);
> -#endif
>  	} else if (core_kernel_text(ip)) {
>  		/* We would be branching to one of our ftrace stubs */
>  		stub = find_ftrace_tramp(ip);
> @@ -128,7 +144,16 @@ static int ftrace_get_call_inst(struct dyn_ftrace *rec, unsigned long addr, ppc_
>  			return -EINVAL;
>  		}
>  	} else {
> -		return -EINVAL;
> +		mod = ftrace_lookup_module(rec);
> +		if (mod) {
> +#ifdef CONFIG_MODULES
> +			/* Module code would be going to one of the module stubs */
> +			stub = (addr == (unsigned long)ftrace_caller ? mod->arch.tramp :
> +								       mod->arch.tramp_regs);
> +#endif

You have CONFIG_MODULES here and in ftrace_lookup_module() above, which
would always return NULL. Could you combine the above to be done in
ftrace_lookup_module() so that there's no #ifdef CONFIG_MODULES here?


> +		} else {
> +			return -EINVAL;
> +		}
>  	}
>  
>  	*call_inst = ftrace_create_branch_inst(ip, stub, 1);
> @@ -256,14 +281,6 @@ int ftrace_init_nop(struct module *mod, struct dyn_ftrace *rec)
>  	if (ret)
>  		return ret;
>  
> -	if (!core_kernel_text(ip)) {
> -		if (!mod) {
> -			pr_err("0x%lx: No module provided for non-kernel address\n", ip);
> -			return -EFAULT;
> -		}
> -		rec->arch.mod = mod;
> -	}
> -
>  	/* Nop-out the ftrace location */
>  	new = ppc_inst(PPC_RAW_NOP());
>  	addr = MCOUNT_ADDR;

-- Steve
