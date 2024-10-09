Return-Path: <linuxppc-dev+bounces-1882-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E786D996C75
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Oct 2024 15:43:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XNvH12mTgz3bZr;
	Thu, 10 Oct 2024 00:43:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=139.178.84.217
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728481405;
	cv=none; b=iuJ2K6UKLxCbv7GckXAKogTONvlqoEjWzOpzynGkZHYYGWPMOHEbDGEaxdhHGrDufpqxmGbJ5N3/qkhRp1RBmJb2OUPfw0Xjfom57VcjbmuKiCWSRL47Ma9lk2f8SsPkNqhC6k7AtLRAs3Q8iVqP2nCl9mWQVPCiPAis75FTwu8aIPG3ug3jX/Hdlf/JmU09R/qKLrCDkKCuVRrgxhQfLryRyEGYF1+TVh8HtmmeaJXrrmhuEEJ9snBsplptj8Gct9DW2rzAAj3DZ3f+lZMWq2skj3f/qPUVqtxDCP3lnv+kexLCdP8SMdMV2apWwk97SItIrbMliBaNvwKRR5G5GQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728481405; c=relaxed/relaxed;
	bh=PkwDUF/pIqI84jhwxHMCEsI4+Ihcpt/Edsv3bK/ExE8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JYBrERU4VJabLqSB9uWeaT2fDZKygWHUgcr8lL2jYp9nX93iHaUMqjqme07hB50pY1rMCwb3jJmN81PQUL1NLYUgPLM/hEBVdbvcKdhZfGOsBJtAx4pOs5gPwEZmsrT0mAYWhEiE/fuTJGTMJIViWeH+zQIND2mEhXNNR4hIXpgDCatt/7zhgusSc7a3/HkIymS4BHg2bF8F82HROKpitpKiNnB+k77VozusZ8QgSRj/zkMcvehCBBhK4Pd0xxfAJoryE2p/ZBreKWh6r673+BHLqVn0H4cf/uHIRy4hf5f3ECVjw/uzlFcB+sVMuGycIANJIxLSE4noWGje4Guakw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=goodmis.org; spf=pass (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=srs0=xvjs=rf=goodmis.org=rostedt@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=goodmis.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=srs0=xvjs=rf=goodmis.org=rostedt@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XNvGz3Pmvz30gn
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Oct 2024 00:43:23 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 84E145C5AA9;
	Wed,  9 Oct 2024 13:43:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C62A7C4CECD;
	Wed,  9 Oct 2024 13:43:16 +0000 (UTC)
Date: Wed, 9 Oct 2024 09:43:21 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: "Masami Hiramatsu (Google)" <mhiramat@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, "linux-arch@vger.kernel.org"
 <linux-arch@vger.kernel.org>, "x86@kernel.org" <x86@kernel.org>, Mathieu
 Desnoyers <mathieu.desnoyers@efficios.com>, Mark Rutland
 <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Will
 Deacon <will@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui
 <kernel@xen0n.name>, Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin
 <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, Naveen
 N Rao <naveen@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, Paul
  Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Heiko Carstens <hca@linux.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>, Alexander Gordeev
 <agordeev@linux.ibm.com>, Christian Borntraeger
 <borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>, Thomas 
 Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@kernel.org>, Borislav 
 Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>
Subject: Re: [PATCH v2 2/2] ftrace: Consolidate ftrace_regs accessor
 functions for archs using pt_regs
Message-ID: <20241009094321.3f41f8a4@gandalf.local.home>
In-Reply-To: <20241009134723.6b9eabfdc3cfee10f3757d85@kernel.org>
References: <20241008230527.674939311@goodmis.org>
	<20241008230629.118325673@goodmis.org>
	<20241009134723.6b9eabfdc3cfee10f3757d85@kernel.org>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Wed, 9 Oct 2024 13:47:23 +0900
Masami Hiramatsu (Google) <mhiramat@kernel.org> wrote:

> > --- /dev/null
> > +++ b/include/linux/ftrace_regs.h
> > @@ -0,0 +1,36 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +#ifndef _LINUX_FTRACE_TYPES_H
> > +#define _LINUX_FTRACE_TYPES_H  
>                ^^^^^^^^^^^^^^^^  Is this _LINUX_FTRACE_REGS_H?

Ah, I originally called it ftrace_types.h, but later decided that name
didn't really fit. I changed all references to it but this one.

Thanks for catching this.

> 
> 
> > +
> > +/*
> > + * For archs that just copy pt_regs in ftrace regs, it can use this default.
> > + * If an architecture does not use pt_regs, it must define all the below
> > + * accessor functions.
> > + */
> > +#ifndef HAVE_ARCH_FTRACE_REGS
> > +struct __arch_ftrace_regs {
> > +	struct pt_regs		regs;
> > +};
> > +
> > +#define arch_ftrace_regs(fregs) ((struct __arch_ftrace_regs *)(fregs))
> > +
> > +struct ftrace_regs;
> > +
> > +#define ftrace_regs_get_instruction_pointer(fregs) \
> > +	instruction_pointer(arch_ftrace_get_regs(fregs))
> > +#define ftrace_regs_get_argument(fregs, n) \
> > +	regs_get_kernel_argument(arch_ftrace_get_regs(fregs), n)
> > +#define ftrace_regs_get_stack_pointer(fregs) \
> > +	kernel_stack_pointer(arch_ftrace_get_regs(fregs))
> > +#define ftrace_regs_return_value(fregs) \
> > +	regs_return_value(arch_ftrace_get_regs(fregs))
> > +#define ftrace_regs_set_return_value(fregs, ret) \
> > +	regs_set_return_value(arch_ftrace_get_regs(fregs), ret)
> > +#define ftrace_override_function_with_return(fregs) \
> > +	override_function_with_return(arch_ftrace_get_regs(fregs))
> > +#define ftrace_regs_query_register_offset(name) \
> > +	regs_query_register_offset(name)
> > +
> > +#endif /* HAVE_ARCH_FTRACE_REGS */
> > +
> > +#endif /* _LINUX_FTRACE_TYPES_H */  
> 
> Ditto.
> 
> Others looks good to me.
> 
> Acked-by: Masami Hiramatsu (Google) <mhiramat@kernel.org>

Thanks,

I'll send a v2 with this update.

-- Steve

