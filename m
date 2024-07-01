Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E7BF91E813
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Jul 2024 21:00:58 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=mW6vZ/EU;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WCb3W6Bl7z3fnM
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Jul 2024 05:00:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=mW6vZ/EU;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=naveen@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WCb2p61Txz3dDJ
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Jul 2024 05:00:18 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 25AF2CE1AA7;
	Mon,  1 Jul 2024 19:00:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A39E8C116B1;
	Mon,  1 Jul 2024 19:00:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719860416;
	bh=oWVPACVe2jDT+0IwJYl4c15rwjRhX4q07V6CionFsec=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mW6vZ/EUqNgYg66p2GCSh8Mz9ufCJKuEQlM21fmHWFBj+JFOfMZpaa5RMpfAJ+22X
	 OqXgXL+rdtJET6W1vVD+y/izhaUF96579K7vrtdHEfYRWVJI9/HNDQftHudKCd1CMr
	 OyTgAg6dWHq7xQTGq49qfGLeacjrbKPm2Gh7C+0IwZVM2x1A6JlKErk22iGqgho+nc
	 kziiWFfHa3Ps++77rsvvx/+0oxDLYWjHRAxzt5zRQlgam3Ps4kxhEfKcF0tDbrqWMK
	 31vOW55AVjZBJWvEE1bcJ3ZoSxx8RULar4L8Gkgca2RHtJmGFdR/hAuRwkR1+TMtZu
	 k5SLZP091tG9w==
Date: Tue, 2 Jul 2024 00:21:18 +0530
From: Naveen N Rao <naveen@kernel.org>
To: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [RFC PATCH v3 04/11] powerpc/ftrace: Remove pointer to struct
 module from dyn_arch_ftrace
Message-ID: <vtwpgnyppfwn2fdekvolkun2x64j72x4ppiqr3tqfkh2p2jwxr@ztcqpbgactai>
References: <cover.1718908016.git.naveen@kernel.org>
 <f13b5e0cb4f9961f23c8880a2f98073e41f695d8.1718908016.git.naveen@kernel.org>
 <D2E3GNRTRCOF.16TWBZIA5EZS2@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <D2E3GNRTRCOF.16TWBZIA5EZS2@gmail.com>
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

On Mon, Jul 01, 2024 at 07:27:55PM GMT, Nicholas Piggin wrote:
> On Fri Jun 21, 2024 at 4:54 AM AEST, Naveen N Rao wrote:
> > Pointer to struct module is only relevant for ftrace records belonging
> > to kernel modules. Having this field in dyn_arch_ftrace wastes memory
> > for all ftrace records belonging to the kernel. Remove the same in
> > favour of looking up the module from the ftrace record address, similar
> > to other architectures.
> 
> arm is the only one left that requires dyn_arch_ftrace after this.

Yes, but as you noticed, we add a different field in a subsequenct patch 
in this series.

> 
> >
> > Signed-off-by: Naveen N Rao <naveen@kernel.org>
> > ---
> >  arch/powerpc/include/asm/ftrace.h        |  1 -
> >  arch/powerpc/kernel/trace/ftrace.c       | 54 +++++++++++-------
> >  arch/powerpc/kernel/trace/ftrace_64_pg.c | 73 +++++++++++-------------
> >  3 files changed, 65 insertions(+), 63 deletions(-)
> >
> 
> [snip]
> 
> > @@ -106,28 +106,48 @@ static unsigned long find_ftrace_tramp(unsigned long ip)
> >  	return 0;
> >  }
> >  
> > +#ifdef CONFIG_MODULES
> > +static unsigned long ftrace_lookup_module_stub(unsigned long ip, unsigned long addr)
> > +{
> > +	struct module *mod = NULL;
> > +
> > +	/*
> > +	 * NOTE: __module_text_address() must be called with preemption
> > +	 * disabled, but we can rely on ftrace_lock to ensure that 'mod'
> > +	 * retains its validity throughout the remainder of this code.
> > +	 */
> > +	preempt_disable();
> > +	mod = __module_text_address(ip);
> > +	preempt_enable();
> 
> If 'mod' was guaranteed to exist before your patch, then it
> should do afterward too. But is it always ftrace_lock that
> protects it, or do dyn_ftrace entries pin a module in some
> cases?

We don't pin a module. It is the ftrace_lock acquired during 
delete_module() in ftrace_release_mod() that protects it.

You're right though. That comment is probably not necessary since there 
are no new users of this new function.

> 
> > @@ -555,7 +551,10 @@ __ftrace_modify_call(struct dyn_ftrace *rec, unsigned long old_addr,
> >  	ppc_inst_t op;
> >  	unsigned long ip = rec->ip;
> >  	unsigned long entry, ptr, tramp;
> > -	struct module *mod = rec->arch.mod;
> > +	struct module *mod = ftrace_lookup_module(rec);
> > +
> > +	if (!mod)
> > +		return -EINVAL;
> >  
> >  	/* If we never set up ftrace trampolines, then bail */
> >  	if (!mod->arch.tramp || !mod->arch.tramp_regs) {
> > @@ -668,14 +667,6 @@ int ftrace_modify_call(struct dyn_ftrace *rec, unsigned long old_addr,
> >  		return -EINVAL;
> >  	}
> >  
> > -	/*
> > -	 * Out of range jumps are called from modules.
> > -	 */
> > -	if (!rec->arch.mod) {
> > -		pr_err("No module loaded\n");
> > -		return -EINVAL;
> > -	}
> > -
> 
> A couple of these conversions are not _exactly_ the same (lost
> the pr_err here), maybe that's deliberate because the messages
> don't look too useful.

Indeed. Most of the earlier ones being eliminated are in 
ftrace_init_nop(). The other ones get covered by the pr_err in 
ftrace_lookup_module()/ftrace_lookup_module_stub().

> 
> Looks okay though
> 
> Reviewed-by: Nicholas Piggin <npiggin@gmail.com>


Thanks,
Naveen
