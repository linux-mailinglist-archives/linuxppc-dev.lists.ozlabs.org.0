Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C1DF3903F18
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jun 2024 16:45:57 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=G+qsavYh;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VzBLV5fjPz3cYt
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jun 2024 00:45:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=G+qsavYh;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=naveen@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VzBKp57t0z3cTd
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Jun 2024 00:45:18 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7522260EDC;
	Tue, 11 Jun 2024 14:45:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72BAAC32789;
	Tue, 11 Jun 2024 14:45:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718117115;
	bh=mwoyy0g0DUrldvLmWop1lHm3otz8vMbEQGdLRAjtwFs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=G+qsavYhVwIR7Vzp/U3Lp09kcq/zzQ+oIBSC7iAOF8BfSJgjS1yFd5g8kzvoGBTgI
	 IQe+lM/Ewk8qm1EY/EC4YZO4yvLibSGmR7mHvxWmMtaBVBVerQVfEsJtgCEk1k6NZm
	 f3LmXQI8E8FFvoKw7QZEtF5iHr59Iej5ZInhKPLB3nHaOgL/2KGFunvHyawcx5hfGo
	 WEcEYc9hBtEiY9XWv2Oih1dX/99Ert+NZTNcAY4zckQ3lhJvEiKXTPoC3gKnLUydts
	 FRSAQdi6vjPchLfiCP/N7phImRWzP4GjBIgmBDfUfTPvrBxry6/K7cSh0AufrRL6XX
	 P71IYa52SF/ng==
Date: Tue, 11 Jun 2024 20:15:10 +0530
From: Naveen N Rao <naveen@kernel.org>
To: Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [RFC PATCH v2 2/5] powerpc/ftrace: Remove pointer to struct
 module from dyn_arch_ftrace
Message-ID: <f7wzwxnm7ersjlcagouzwbnutp4tijn6vlkyyb6htpepdyqmwn@g2txzphgj7a5>
References: <cover.1718008093.git.naveen@kernel.org>
 <50b038f167f3fb94ed6074e029b6794bbe6e83a2.1718008093.git.naveen@kernel.org>
 <20240610160356.70e8f7ac@gandalf.local.home>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240610160356.70e8f7ac@gandalf.local.home>
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
Cc: Mark Rutland <mark.rutland@arm.com>, Masahiro Yamada <masahiroy@kernel.org>, Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, linuxppc-dev@lists.ozlabs.org, Masami Hiramatsu <mhiramat@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Jun 10, 2024 at 04:03:56PM GMT, Steven Rostedt wrote:
> On Mon, 10 Jun 2024 14:08:15 +0530
> Naveen N Rao <naveen@kernel.org> wrote:
> 
> > Pointer to struct module is only relevant for ftrace records belonging
> > to kernel modules. Having this field in dyn_arch_ftrace wastes memory
> > for all ftrace records belonging to the kernel. Remove the same in
> > favour of looking up the module from the ftrace record address, similar
> > to other architectures.
> > 
> > Signed-off-by: Naveen N Rao <naveen@kernel.org>
> > ---
> >  arch/powerpc/include/asm/ftrace.h        |  1 -
> >  arch/powerpc/kernel/trace/ftrace.c       | 47 ++++++++++-----
> >  arch/powerpc/kernel/trace/ftrace_64_pg.c | 73 +++++++++++-------------
> >  3 files changed, 64 insertions(+), 57 deletions(-)
> > 
> > diff --git a/arch/powerpc/include/asm/ftrace.h b/arch/powerpc/include/asm/ftrace.h
> > index 107fc5a48456..201f9d15430a 100644
> > --- a/arch/powerpc/include/asm/ftrace.h
> > +++ b/arch/powerpc/include/asm/ftrace.h
> > @@ -26,7 +26,6 @@ unsigned long prepare_ftrace_return(unsigned long parent, unsigned long ip,
> >  struct module;
> >  struct dyn_ftrace;
> >  struct dyn_arch_ftrace {
> > -	struct module *mod;
> >  };
> 
> Nice. I always hated that extra field.

It was your complaint a while back that prompted this change :)

Though I introduce a different pointer here in the next patch. /me 
ducks.

> 
> 
> >  
> >  #ifdef CONFIG_DYNAMIC_FTRACE_WITH_ARGS
> > diff --git a/arch/powerpc/kernel/trace/ftrace.c b/arch/powerpc/kernel/trace/ftrace.c
> > index d8d6b4fd9a14..041be965485e 100644
> > --- a/arch/powerpc/kernel/trace/ftrace.c
> > +++ b/arch/powerpc/kernel/trace/ftrace.c
> > @@ -106,20 +106,36 @@ static unsigned long find_ftrace_tramp(unsigned long ip)
> >  	return 0;
> >  }
> >  
> > +static struct module *ftrace_lookup_module(struct dyn_ftrace *rec)
> > +{
> > +	struct module *mod = NULL;
> > +
> > +#ifdef CONFIG_MODULES
> > +	/*
> > +	 * NOTE: __module_text_address() must be called with preemption
> > +	 * disabled, but we can rely on ftrace_lock to ensure that 'mod'
> > +	 * retains its validity throughout the remainder of this code.
> > +	*/
> > +	preempt_disable();
> > +	mod = __module_text_address(rec->ip);
> > +	preempt_enable();
> > +
> > +	if (!mod)
> > +		pr_err("No module loaded at addr=%lx\n", rec->ip);
> > +#endif
> > +
> > +	return mod;
> > +}
> 
> It may look nicer to have:
> 
> #ifdef CONFIG_MODULES
> static struct module *ftrace_lookup_module(struct dyn_ftrace *rec)
> {
> 	struct module *mod = NULL;
> 
> 	/*
> 	 * NOTE: __module_text_address() must be called with preemption
> 	 * disabled, but we can rely on ftrace_lock to ensure that 'mod'
> 	 * retains its validity throughout the remainder of this code.
> 	*/
> 	preempt_disable();
> 	mod = __module_text_address(rec->ip);
> 	preempt_enable();
> 
> 	if (!mod)
> 		pr_err("No module loaded at addr=%lx\n", rec->ip);
> 
> 	return mod;
> }
> #else
> static inline struct module *ftrace_lookup_module(struct dyn_ftrace *rec)
> {
> 	return NULL;
> }
> #endif

I wrote this, and then I thought it will be simpler to do the version I 
posted. I will move back to this since it looks to be the preferred way.

> 
> > +
> >  static int ftrace_get_call_inst(struct dyn_ftrace *rec, unsigned long addr, ppc_inst_t *call_inst)
> >  {
> >  	unsigned long ip = rec->ip;
> >  	unsigned long stub;
> > +	struct module *mod;
> >  
> >  	if (is_offset_in_branch_range(addr - ip)) {
> >  		/* Within range */
> >  		stub = addr;
> > -#ifdef CONFIG_MODULES
> > -	} else if (rec->arch.mod) {
> > -		/* Module code would be going to one of the module stubs */
> > -		stub = (addr == (unsigned long)ftrace_caller ? rec->arch.mod->arch.tramp :
> > -							       rec->arch.mod->arch.tramp_regs);
> > -#endif
> >  	} else if (core_kernel_text(ip)) {
> >  		/* We would be branching to one of our ftrace stubs */
> >  		stub = find_ftrace_tramp(ip);
> > @@ -128,7 +144,16 @@ static int ftrace_get_call_inst(struct dyn_ftrace *rec, unsigned long addr, ppc_
> >  			return -EINVAL;
> >  		}
> >  	} else {
> > -		return -EINVAL;
> > +		mod = ftrace_lookup_module(rec);
> > +		if (mod) {
> > +#ifdef CONFIG_MODULES
> > +			/* Module code would be going to one of the module stubs */
> > +			stub = (addr == (unsigned long)ftrace_caller ? mod->arch.tramp :
> > +								       mod->arch.tramp_regs);
> > +#endif
> 
> You have CONFIG_MODULES here and in ftrace_lookup_module() above, which
> would always return NULL. Could you combine the above to be done in
> ftrace_lookup_module() so that there's no #ifdef CONFIG_MODULES here?

Yes, indeed. That will look cleaner.


Thanks,
Naveen

