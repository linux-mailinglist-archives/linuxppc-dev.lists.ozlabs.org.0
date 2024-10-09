Return-Path: <linuxppc-dev+bounces-1866-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E1B2E995EB8
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Oct 2024 06:47:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XNgNp2StYz2xs8;
	Wed,  9 Oct 2024 15:47:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:4641:c500::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728449258;
	cv=none; b=EpIjVsbB53u/6D8cyV8Mi0Fu+J9LVo9HInw2H67fSpgP4ouzp6PbkNxzHsZRcV4NEx58JmJs3zMbXH5upG9CLuuKRpfFm7E62k3GcxZPdn6M96HZXzaeXCBUVZjhMVM1oTjMnZD28/z/VPenXY0gJ5Go0PQ74Hh7OS06REH7pjnD1Ga8zyLmWVvZWwCSNQKsu5lnWVGTlyReN4vbTXjSqxDyV3OvPParFv+CBzc9Z0bMLn6ryUFTSDi/0gu0TNaJUgvOJ8WDx1KKq2yHrxMeyL9YdJkbOljc1APcddQa/SZUDdKHPpWeoFaqqTjs3aHC1o6T/uhgN5O8nkBWsoUO+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728449258; c=relaxed/relaxed;
	bh=jgMZ27PwTY3eDO4GeEngl2UUha8XuB0q7bmi3nOE1bQ=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=RVAEGpNnU2XnFZ+CVpNlyF8SHATUqt/C0jsQEnLGSabvqRNct1pa5pnIeW5atgkt9y5ien+HpVwdNvS/ASVyX4zj5+WOSW/xxmdPP7vmnNlvAxO11WQIJ+l2yqMClcJWPNoTMOKuuHR/MgP+JFWlav2s5UDyulUKPftJtU5188pbJZngbcfbHjGwNbHAQHHg6ZG2tCvL5hsoAqJy5PNoRDu2CJwkYqkngnVoZTS42ghPG4QeWRVn8tD85YLuUttkwoTd8fPMswwSvlI2CZ/zVhjGFKnydxzQYRTRDL0QPSMv2xbSQLzkc0r/odePFdzGOZylsiKjfvZ0gjw4GHqXIA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=EDGoMpOY; dkim-atps=neutral; spf=pass (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=mhiramat@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=EDGoMpOY;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=mhiramat@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XNgNn1531z2xjv
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Oct 2024 15:47:37 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E3F815C5D58;
	Wed,  9 Oct 2024 04:47:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B71A1C4CEC5;
	Wed,  9 Oct 2024 04:47:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728449251;
	bh=Rh5JEjNWNPJbbmE3p7YdaRt8fQ2xkEBNTyOBbR090RM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=EDGoMpOYHzc07KqxTSXKk9zd6GgiavTBs6X85buPIREpbkAwIR0gbeem4qdvHbO4I
	 Nn0Irc7BHuHV2zSAAwMOKN67YzUYskkCusfF07zFdSB8sqtyQymXoT30/2Qb0Qe43E
	 jCPX7zPLYCE1yokGvkf1y70t2QD4u1dVIfM/MP2BgEjINRHhRe3xuZh1ExmfnPLQ/R
	 bWfguiNZmmb7SZRqOJV9waeP0oPAX5fHOhT6hokdmliTdTZvZGnE6z8ZywaxFtDebl
	 cz1Pa8y0gqtF/EOeKBXVF8OgTUzuzfuRRyIK/r+LFZ5V25IILs3UVuWGKgLlWcrFhZ
	 fCY7gyk+pj4ww==
Date: Wed, 9 Oct 2024 13:47:23 +0900
From: Masami Hiramatsu (Google) <mhiramat@kernel.org>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, "linux-arch@vger.kernel.org"
 <linux-arch@vger.kernel.org>, "x86@kernel.org" <x86@kernel.org>, Masami
 Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers
 <mathieu.desnoyers@efficios.com>, Mark Rutland <mark.rutland@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>, Naveen N Rao
 <naveen@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, Paul 
 Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Heiko Carstens <hca@linux.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>, Alexander Gordeev
 <agordeev@linux.ibm.com>, Christian Borntraeger
 <borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>, Thomas 
 Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@kernel.org>, Borislav 
 Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>
Subject: Re: [PATCH v2 2/2] ftrace: Consolidate ftrace_regs accessor
 functions for archs using pt_regs
Message-Id: <20241009134723.6b9eabfdc3cfee10f3757d85@kernel.org>
In-Reply-To: <20241008230629.118325673@goodmis.org>
References: <20241008230527.674939311@goodmis.org>
	<20241008230629.118325673@goodmis.org>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Tue, 08 Oct 2024 19:05:29 -0400
Steven Rostedt <rostedt@goodmis.org> wrote:

> From: Steven Rostedt <rostedt@goodmis.org>
> 
> Most architectures use pt_regs within ftrace_regs making a lot of the
> accessor functions just calls to the pt_regs internally. Instead of
> duplication this effort, use a HAVE_ARCH_FTRACE_REGS for architectures
> that have their own ftrace_regs that is not based on pt_regs and will
> define all the accessor functions, and for the architectures that just use
> pt_regs, it will leave it undefined, and the default accessor functions
> will be used.
> 
> Note, this will also make it easier to add new accessor functions to
> ftrace_regs as it will mean having to touch less architectures.
> 
> Suggested-by: Masami Hiramatsu (Google) <mhiramat@kernel.org>
> Signed-off-by: Steven Rostedt (Google) <rostedt@goodmis.org>
> ---
>  arch/arm64/include/asm/ftrace.h     |  1 +
>  arch/loongarch/include/asm/ftrace.h | 25 +-------------------
>  arch/powerpc/include/asm/ftrace.h   | 26 +--------------------
>  arch/riscv/include/asm/ftrace.h     |  1 +
>  arch/s390/include/asm/ftrace.h      | 26 +--------------------
>  arch/x86/include/asm/ftrace.h       | 21 +----------------
>  include/linux/ftrace.h              | 32 ++++++-------------------
>  include/linux/ftrace_regs.h         | 36 +++++++++++++++++++++++++++++
>  8 files changed, 49 insertions(+), 119 deletions(-)
>  create mode 100644 include/linux/ftrace_regs.h
> 
> diff --git a/arch/arm64/include/asm/ftrace.h b/arch/arm64/include/asm/ftrace.h
> index bbb69c7751b9..5ccff4de7f09 100644
> --- a/arch/arm64/include/asm/ftrace.h
> +++ b/arch/arm64/include/asm/ftrace.h
> @@ -54,6 +54,7 @@ extern void return_to_handler(void);
>  unsigned long ftrace_call_adjust(unsigned long addr);
>  
>  #ifdef CONFIG_DYNAMIC_FTRACE_WITH_ARGS
> +#define HAVE_ARCH_FTRACE_REGS
>  struct dyn_ftrace;
>  struct ftrace_ops;
>  struct ftrace_regs;
> diff --git a/arch/loongarch/include/asm/ftrace.h b/arch/loongarch/include/asm/ftrace.h
> index 0e15d36ce251..8f13eaeaa325 100644
> --- a/arch/loongarch/include/asm/ftrace.h
> +++ b/arch/loongarch/include/asm/ftrace.h
> @@ -43,43 +43,20 @@ void prepare_ftrace_return(unsigned long self_addr, unsigned long *parent);
>  
>  #ifdef CONFIG_HAVE_DYNAMIC_FTRACE_WITH_ARGS
>  struct ftrace_ops;
> -struct ftrace_regs;
> -#define arch_ftrace_regs(fregs) ((struct __arch_ftrace_regs *)(fregs))
>  
> -struct __arch_ftrace_regs {
> -	struct pt_regs regs;
> -};
> +#include <linux/ftrace_regs.h>
>  
>  static __always_inline struct pt_regs *arch_ftrace_get_regs(struct ftrace_regs *fregs)
>  {
>  	return &arch_ftrace_regs(fregs)->regs;
>  }
>  
> -static __always_inline unsigned long
> -ftrace_regs_get_instruction_pointer(struct ftrace_regs *fregs)
> -{
> -	return instruction_pointer(&arch_ftrace_regs(fregs)->regs);
> -}
> -
>  static __always_inline void
>  ftrace_regs_set_instruction_pointer(struct ftrace_regs *fregs, unsigned long ip)
>  {
>  	instruction_pointer_set(&arch_ftrace_regs(fregs)->regs, ip);
>  }
>  
> -#define ftrace_regs_get_argument(fregs, n) \
> -	regs_get_kernel_argument(&arch_ftrace_regs(fregs)->regs, n)
> -#define ftrace_regs_get_stack_pointer(fregs) \
> -	kernel_stack_pointer(&arch_ftrace_regs(fregs)->regs)
> -#define ftrace_regs_return_value(fregs) \
> -	regs_return_value(&arch_ftrace_regs(fregs)->regs)
> -#define ftrace_regs_set_return_value(fregs, ret) \
> -	regs_set_return_value(&arch_ftrace_regs(fregs)->regs, ret)
> -#define ftrace_override_function_with_return(fregs) \
> -	override_function_with_return(&arch_ftrace_regs(fregs)->regs)
> -#define ftrace_regs_query_register_offset(name) \
> -	regs_query_register_offset(name)
> -
>  #define ftrace_graph_func ftrace_graph_func
>  void ftrace_graph_func(unsigned long ip, unsigned long parent_ip,
>  		       struct ftrace_ops *op, struct ftrace_regs *fregs);
> diff --git a/arch/powerpc/include/asm/ftrace.h b/arch/powerpc/include/asm/ftrace.h
> index e299fd47d201..0edfb874eb02 100644
> --- a/arch/powerpc/include/asm/ftrace.h
> +++ b/arch/powerpc/include/asm/ftrace.h
> @@ -32,12 +32,7 @@ struct dyn_arch_ftrace {
>  int ftrace_init_nop(struct module *mod, struct dyn_ftrace *rec);
>  #define ftrace_init_nop ftrace_init_nop
>  
> -struct ftrace_regs;
> -#define arch_ftrace_regs(fregs) ((struct __arch_ftrace_regs *)(fregs))
> -
> -struct __arch_ftrace_regs {
> -	struct pt_regs regs;
> -};
> +#include <linux/ftrace_regs.h>
>  
>  static __always_inline struct pt_regs *arch_ftrace_get_regs(struct ftrace_regs *fregs)
>  {
> @@ -52,25 +47,6 @@ ftrace_regs_set_instruction_pointer(struct ftrace_regs *fregs,
>  	regs_set_return_ip(&arch_ftrace_regs(fregs)->regs, ip);
>  }
>  
> -static __always_inline unsigned long
> -ftrace_regs_get_instruction_pointer(struct ftrace_regs *fregs)
> -{
> -	return instruction_pointer(&arch_ftrace_regs(fregs)->regs);
> -}
> -
> -#define ftrace_regs_get_argument(fregs, n) \
> -	regs_get_kernel_argument(&arch_ftrace_regs(fregs)->regs, n)
> -#define ftrace_regs_get_stack_pointer(fregs) \
> -	kernel_stack_pointer(&arch_ftrace_regs(fregs)->regs)
> -#define ftrace_regs_return_value(fregs) \
> -	regs_return_value(&arch_ftrace_regs(fregs)->regs)
> -#define ftrace_regs_set_return_value(fregs, ret) \
> -	regs_set_return_value(&arch_ftrace_regs(fregs)->regs, ret)
> -#define ftrace_override_function_with_return(fregs) \
> -	override_function_with_return(&arch_ftrace_regs(fregs)->regs)
> -#define ftrace_regs_query_register_offset(name) \
> -	regs_query_register_offset(name)
> -
>  struct ftrace_ops;
>  
>  #define ftrace_graph_func ftrace_graph_func
> diff --git a/arch/riscv/include/asm/ftrace.h b/arch/riscv/include/asm/ftrace.h
> index c6bcdff105b5..3d66437a1029 100644
> --- a/arch/riscv/include/asm/ftrace.h
> +++ b/arch/riscv/include/asm/ftrace.h
> @@ -125,6 +125,7 @@ int ftrace_init_nop(struct module *mod, struct dyn_ftrace *rec);
>  
>  #ifdef CONFIG_DYNAMIC_FTRACE_WITH_ARGS
>  #define arch_ftrace_get_regs(regs) NULL
> +#define HAVE_ARCH_FTRACE_REGS
>  struct ftrace_ops;
>  struct ftrace_regs;
>  #define arch_ftrace_regs(fregs) ((struct __arch_ftrace_regs *)(fregs))
> diff --git a/arch/s390/include/asm/ftrace.h b/arch/s390/include/asm/ftrace.h
> index 1498d0a9c762..fc97d75dc752 100644
> --- a/arch/s390/include/asm/ftrace.h
> +++ b/arch/s390/include/asm/ftrace.h
> @@ -51,12 +51,7 @@ static inline unsigned long ftrace_call_adjust(unsigned long addr)
>  	return addr;
>  }
>  
> -struct ftrace_regs;
> -#define arch_ftrace_regs(fregs) ((struct __arch_ftrace_regs *)(fregs))
> -
> -struct __arch_ftrace_regs {
> -	struct pt_regs regs;
> -};
> +#include <linux/ftrace_regs.h>
>  
>  static __always_inline struct pt_regs *arch_ftrace_get_regs(struct ftrace_regs *fregs)
>  {
> @@ -84,12 +79,6 @@ static __always_inline unsigned long fgraph_ret_regs_frame_pointer(struct fgraph
>  }
>  #endif /* CONFIG_FUNCTION_GRAPH_TRACER */
>  
> -static __always_inline unsigned long
> -ftrace_regs_get_instruction_pointer(const struct ftrace_regs *fregs)
> -{
> -	return arch_ftrace_regs(fregs)->regs.psw.addr;
> -}
> -
>  static __always_inline void
>  ftrace_regs_set_instruction_pointer(struct ftrace_regs *fregs,
>  				    unsigned long ip)
> @@ -97,19 +86,6 @@ ftrace_regs_set_instruction_pointer(struct ftrace_regs *fregs,
>  	arch_ftrace_regs(fregs)->regs.psw.addr = ip;
>  }
>  
> -#define ftrace_regs_get_argument(fregs, n) \
> -	regs_get_kernel_argument(&arch_ftrace_regs(fregs)->regs, n)
> -#define ftrace_regs_get_stack_pointer(fregs) \
> -	kernel_stack_pointer(&arch_ftrace_regs(fregs)->regs)
> -#define ftrace_regs_return_value(fregs) \
> -	regs_return_value(&arch_ftrace_regs(fregs)->regs)
> -#define ftrace_regs_set_return_value(fregs, ret) \
> -	regs_set_return_value(&arch_ftrace_regs(fregs)->regs, ret)
> -#define ftrace_override_function_with_return(fregs) \
> -	override_function_with_return(&arch_ftrace_regs(fregs)->regs)
> -#define ftrace_regs_query_register_offset(name) \
> -	regs_query_register_offset(name)
> -
>  #ifdef CONFIG_DYNAMIC_FTRACE_WITH_DIRECT_CALLS
>  /*
>   * When an ftrace registered caller is tracing a function that is
> diff --git a/arch/x86/include/asm/ftrace.h b/arch/x86/include/asm/ftrace.h
> index 87943f7a299b..8f02d28c571a 100644
> --- a/arch/x86/include/asm/ftrace.h
> +++ b/arch/x86/include/asm/ftrace.h
> @@ -33,12 +33,8 @@ static inline unsigned long ftrace_call_adjust(unsigned long addr)
>  }
>  
>  #ifdef CONFIG_HAVE_DYNAMIC_FTRACE_WITH_ARGS
> -struct ftrace_regs;
> -#define arch_ftrace_regs(fregs) ((struct __arch_ftrace_regs *)(fregs))
>  
> -struct __arch_ftrace_regs {
> -	struct pt_regs		regs;
> -};
> +#include <linux/ftrace_regs.h>
>  
>  static __always_inline struct pt_regs *
>  arch_ftrace_get_regs(struct ftrace_regs *fregs)
> @@ -52,21 +48,6 @@ arch_ftrace_get_regs(struct ftrace_regs *fregs)
>  #define ftrace_regs_set_instruction_pointer(fregs, _ip)	\
>  	do { arch_ftrace_regs(fregs)->regs.ip = (_ip); } while (0)
>  
> -#define ftrace_regs_get_instruction_pointer(fregs) \
> -	arch_ftrace_regs(fregs)->regs.ip)
> -
> -#define ftrace_regs_get_argument(fregs, n) \
> -	regs_get_kernel_argument(&arch_ftrace_regs(fregs)->regs, n)
> -#define ftrace_regs_get_stack_pointer(fregs) \
> -	kernel_stack_pointer(&arch_ftrace_regs(fregs)->regs)
> -#define ftrace_regs_return_value(fregs) \
> -	regs_return_value(&arch_ftrace_regs(fregs)->regs)
> -#define ftrace_regs_set_return_value(fregs, ret) \
> -	regs_set_return_value(&arch_ftrace_regs(fregs)->regs, ret)
> -#define ftrace_override_function_with_return(fregs) \
> -	override_function_with_return(&arch_ftrace_regs(fregs)->regs)
> -#define ftrace_regs_query_register_offset(name) \
> -	regs_query_register_offset(name)
>  
>  struct ftrace_ops;
>  #define ftrace_graph_func ftrace_graph_func
> diff --git a/include/linux/ftrace.h b/include/linux/ftrace.h
> index f7d4f152f84d..c96f9b0eb86e 100644
> --- a/include/linux/ftrace.h
> +++ b/include/linux/ftrace.h
> @@ -113,6 +113,8 @@ static inline int ftrace_mod_get_kallsym(unsigned int symnum, unsigned long *val
>  
>  #ifdef CONFIG_FUNCTION_TRACER
>  
> +#include <linux/ftrace_regs.h>
> +
>  extern int ftrace_enabled;
>  
>  /**
> @@ -150,14 +152,11 @@ struct ftrace_regs {
>  #define ftrace_regs_size()	sizeof(struct __arch_ftrace_regs)
>  
>  #ifndef CONFIG_HAVE_DYNAMIC_FTRACE_WITH_ARGS
> -
> -struct __arch_ftrace_regs {
> -	struct pt_regs		regs;
> -};
> -
> -struct ftrace_regs;
> -#define arch_ftrace_regs(fregs) ((struct __arch_ftrace_regs *)(fregs))
> -
> +/*
> + * Architectures that define HAVE_DYNAMIC_FTRACE_WITH_ARGS must define their own
> + * arch_ftrace_get_regs() where it only returns pt_regs *if* it is fully
> + * populated. It should return NULL otherwise.
> + */
>  static inline struct pt_regs *arch_ftrace_get_regs(struct ftrace_regs *fregs)
>  {
>  	return &arch_ftrace_regs(fregs)->regs;
> @@ -191,23 +190,6 @@ static __always_inline bool ftrace_regs_has_args(struct ftrace_regs *fregs)
>  	return ftrace_get_regs(fregs) != NULL;
>  }
>  
> -#ifndef CONFIG_HAVE_DYNAMIC_FTRACE_WITH_ARGS
> -#define ftrace_regs_get_instruction_pointer(fregs) \
> -	instruction_pointer(ftrace_get_regs(fregs))
> -#define ftrace_regs_get_argument(fregs, n) \
> -	regs_get_kernel_argument(ftrace_get_regs(fregs), n)
> -#define ftrace_regs_get_stack_pointer(fregs) \
> -	kernel_stack_pointer(ftrace_get_regs(fregs))
> -#define ftrace_regs_return_value(fregs) \
> -	regs_return_value(ftrace_get_regs(fregs))
> -#define ftrace_regs_set_return_value(fregs, ret) \
> -	regs_set_return_value(ftrace_get_regs(fregs), ret)
> -#define ftrace_override_function_with_return(fregs) \
> -	override_function_with_return(ftrace_get_regs(fregs))
> -#define ftrace_regs_query_register_offset(name) \
> -	regs_query_register_offset(name)
> -#endif
> -
>  typedef void (*ftrace_func_t)(unsigned long ip, unsigned long parent_ip,
>  			      struct ftrace_ops *op, struct ftrace_regs *fregs);
>  
> diff --git a/include/linux/ftrace_regs.h b/include/linux/ftrace_regs.h
> new file mode 100644
> index 000000000000..1cdd4bfa440b
> --- /dev/null
> +++ b/include/linux/ftrace_regs.h
> @@ -0,0 +1,36 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#ifndef _LINUX_FTRACE_TYPES_H
> +#define _LINUX_FTRACE_TYPES_H
               ^^^^^^^^^^^^^^^^  Is this _LINUX_FTRACE_REGS_H?


> +
> +/*
> + * For archs that just copy pt_regs in ftrace regs, it can use this default.
> + * If an architecture does not use pt_regs, it must define all the below
> + * accessor functions.
> + */
> +#ifndef HAVE_ARCH_FTRACE_REGS
> +struct __arch_ftrace_regs {
> +	struct pt_regs		regs;
> +};
> +
> +#define arch_ftrace_regs(fregs) ((struct __arch_ftrace_regs *)(fregs))
> +
> +struct ftrace_regs;
> +
> +#define ftrace_regs_get_instruction_pointer(fregs) \
> +	instruction_pointer(arch_ftrace_get_regs(fregs))
> +#define ftrace_regs_get_argument(fregs, n) \
> +	regs_get_kernel_argument(arch_ftrace_get_regs(fregs), n)
> +#define ftrace_regs_get_stack_pointer(fregs) \
> +	kernel_stack_pointer(arch_ftrace_get_regs(fregs))
> +#define ftrace_regs_return_value(fregs) \
> +	regs_return_value(arch_ftrace_get_regs(fregs))
> +#define ftrace_regs_set_return_value(fregs, ret) \
> +	regs_set_return_value(arch_ftrace_get_regs(fregs), ret)
> +#define ftrace_override_function_with_return(fregs) \
> +	override_function_with_return(arch_ftrace_get_regs(fregs))
> +#define ftrace_regs_query_register_offset(name) \
> +	regs_query_register_offset(name)
> +
> +#endif /* HAVE_ARCH_FTRACE_REGS */
> +
> +#endif /* _LINUX_FTRACE_TYPES_H */

Ditto.

Others looks good to me.

Acked-by: Masami Hiramatsu (Google) <mhiramat@kernel.org>

Thank you!


> -- 
> 2.45.2
> 
> 


-- 
Masami Hiramatsu (Google) <mhiramat@kernel.org>

