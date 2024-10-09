Return-Path: <linuxppc-dev+bounces-1892-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D5EB996FC0
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Oct 2024 17:31:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XNxgX1dq4z3bZs;
	Thu, 10 Oct 2024 02:31:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728487880;
	cv=none; b=Fz4pNEkGfGq3t+VJMJpGO+bzkI28fW33lXpIIVu/6x6yNW+jTz+3EvxvK3FHE8k1+LpkGYcy6V5w8w271mr41cu/E4K02dzFF3BtrBEsQWPiKAryeuAG4AR5jNBvQCKw1nSZlPDCKx1f2r+lywDjqZQW36kcNTS25kXrTRBmHkC/cDNPFMl7HhJRkBSIlVx9kdwCE7sDKAEKTiP926ZFPEAF3EXe+cH78AiFwFvr1YSyQ1oY40T0NHdKxM8n+gt3dtukRC1c0gVFrWA5mbs1JKcKfoukf8UEil2kmlYAvsX7P0VnGIt2sKawbRt5sX772bP3cf8RJyPWs8I+alLm7w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728487880; c=relaxed/relaxed;
	bh=29ufVT6PRbaj8hyxVtX0V4U4NH6etxZAwPGFGR6GTpU=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dfqC5clu2I7KzA7/y22hRM/uOy5AoIIYWu7nDRQEWyxp0E4GbhQK5Ja6dGdaFxfQFH4CM5fa6kxHZu1Su/2JnBucGcqO4550pJLzBp3XczD3nmS7cNRbpYv+KvKFYKQSlrPTVUxtusXAVWwln92yGeHZ4fIfCdmvK3ziSxoW3kNprm/rD++KxvC8/QbgxEaNKfbqv9Zw1VOKYfUyNtgKSUbO+iHSmisk+RhNTBCpJr2Se8iwe32e7GMrLoXEsZk24jtrlesburNIknMQxmw6Yq09zoBBOWv8Uw2COo8VtIrGh6zdLuUDpM5dfgyMWAOC6BN0l2nvq6TuLIpRTcb3vg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=goodmis.org; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=srs0=xvjs=rf=goodmis.org=rostedt@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=goodmis.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=srs0=xvjs=rf=goodmis.org=rostedt@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XNxgV0ZcRz2yQj
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Oct 2024 02:31:18 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 19D2FA441CC;
	Wed,  9 Oct 2024 15:31:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35537C4CEC3;
	Wed,  9 Oct 2024 15:31:09 +0000 (UTC)
Date: Wed, 9 Oct 2024 11:31:14 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, "linux-arch@vger.kernel.org"
 <linux-arch@vger.kernel.org>, "x86@kernel.org" <x86@kernel.org>
Cc: Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers
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
Message-ID: <20241009113114.1da0d84d@gandalf.local.home>
In-Reply-To: <20241008230629.118325673@goodmis.org>
References: <20241008230527.674939311@goodmis.org>
	<20241008230629.118325673@goodmis.org>
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
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org



Loongarch maintainers, please note the below comments!


On Tue, 08 Oct 2024 19:05:29 -0400
Steven Rostedt <rostedt@goodmis.org> wrote:


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

The above function is incorrect. I know I just added the comment about how
it is to work below, but if pt_regs is not fully filled, then
arch_ftrace_get_regs() must return NULL.

This is because if a callback is registered with ftrace, and forgets to add
the FTRACE_OPS_FL_SAVE_REGS flag, then when it does:

	regs = ftrace_get_regs(fregs);

it should get NULL and not a partially filled pt_regs set. Because the API
is that ftrace_get_regs() will return either a full pt_regs (where the
caller can know that it has all the correct registers) or NULL where it
does not have any registers.

It's an all or nothing approach.

You can see x86 has:

static __always_inline struct pt_regs *
arch_ftrace_get_regs(struct ftrace_regs *fregs)
{
	/* Only when FL_SAVE_REGS is set, cs will be non zero */
	if (!arch_ftrace_regs(fregs)->regs.cs)
		return NULL;
	return &arch_ftrace_regs(fregs)->regs;
}

Where it checks if regs.cs is set to determine if it has all the regs or
not.

Please do something similar for your architecture.

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
> 


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

I'm adding the above comment to help other architectures know of this requirement.

>  static inline struct pt_regs *arch_ftrace_get_regs(struct ftrace_regs *fregs)
>  {
>  	return &arch_ftrace_regs(fregs)->regs;


-- Steve

