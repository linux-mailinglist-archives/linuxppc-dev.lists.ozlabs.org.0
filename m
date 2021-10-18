Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 86E004315D3
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Oct 2021 12:20:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HXtD76Wlqz3c5k
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Oct 2021 21:20:07 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=DzL9pIaL;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=suse.com (client-ip=195.135.220.29; helo=smtp-out2.suse.de;
 envelope-from=pmladek@suse.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256
 header.s=susede1 header.b=DzL9pIaL; dkim-atps=neutral
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HXtCT0BWrz2yPw
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 Oct 2021 21:19:31 +1100 (AEDT)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id 7CAE31FD79;
 Mon, 18 Oct 2021 10:19:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1634552366; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=iOXmerCnaJwQcxrGTYNbpRPalnhSmqAzz0pWYAYZ5Qo=;
 b=DzL9pIaLMpfOUDOV24COilkbRbw4Zz03OVIMeFIvKy0jrLRIjKjUVrYo1E6xQSlaoJiMkr
 ivmVDcSbU982BGrV4FEhvOUv2sbqZmkoH5LdMylpFwi3HCkh9B0ni8TIAluXo2q8Ds/4G7
 mK11rHw/9kXtIiS4yQX063c9dKeL93w=
Received: from suse.cz (unknown [10.100.216.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id 136C9A3BCD;
 Mon, 18 Oct 2021 10:19:23 +0000 (UTC)
Date: Mon, 18 Oct 2021 12:19:20 +0200
From: Petr Mladek <pmladek@suse.com>
To: Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [PATCH] tracing: Have all levels of checks prevent recursion
Message-ID: <YW1KKCFallDG+E01@alley>
References: <20211015110035.14813389@gandalf.local.home>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211015110035.14813389@gandalf.local.home>
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
Cc: =?utf-8?B?546L6LSH?= <yun.wang@linux.alibaba.com>,
 "Peter Zijlstra \(Intel\)" <peterz@infradead.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Paul Mackerras <paulus@samba.org>, Jisheng Zhang <jszhang@kernel.org>,
 "H. Peter Anvin" <hpa@zytor.com>, live-patching@vger.kernel.org,
 linux-riscv@lists.infradead.org, Miroslav Benes <mbenes@suse.cz>,
 Joe Lawrence <joe.lawrence@redhat.com>, Helge Deller <deller@gmx.de>,
 x86@kernel.org, linux-csky@vger.kernel.org, Ingo Molnar <mingo@redhat.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Jiri Kosina <jikos@kernel.org>,
 Nicholas Piggin <npiggin@gmail.com>, Borislav Petkov <bp@alien8.de>,
 Josh Poimboeuf <jpoimboe@redhat.com>, Thomas Gleixner <tglx@linutronix.de>,
 linux-parisc@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Masami Hiramatsu <mhiramat@kernel.org>,
 Guo Ren <guoren@kernel.org>, Colin Ian King <colin.king@canonical.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri 2021-10-15 11:00:35, Steven Rostedt wrote:
> From: "Steven Rostedt (VMware)" <rostedt@goodmis.org>
> 
> While writing an email explaining the "bit = 0" logic for a discussion on
> making ftrace_test_recursion_trylock() disable preemption, I discovered a
> path that makes the "not do the logic if bit is zero" unsafe.
> 
> Since we want to encourage architectures to implement all ftrace features,
> having them slow down due to this extra logic may encourage the
> maintainers to update to the latest ftrace features. And because this
> logic is only safe for them, remove it completely.
> 
>  [*] There is on layer of recursion that is allowed, and that is to allow
>      for the transition between interrupt context (normal -> softirq ->
>      irq -> NMI), because a trace may occur before the context update is
>      visible to the trace recursion logic.
> 
> diff --git a/include/linux/trace_recursion.h b/include/linux/trace_recursion.h
> index a9f9c5714e65..168fdf07419a 100644
> --- a/include/linux/trace_recursion.h
> +++ b/include/linux/trace_recursion.h
> @@ -165,40 +147,29 @@ static __always_inline int trace_test_and_set_recursion(unsigned long ip, unsign
>  	unsigned int val = READ_ONCE(current->trace_recursion);
>  	int bit;
>  
> -	/* A previous recursion check was made */
> -	if ((val & TRACE_CONTEXT_MASK) > max)
> -		return 0;

@max parameter is no longer used.

> -
>  	bit = trace_get_context_bit() + start;
>  	if (unlikely(val & (1 << bit))) {
>  		/*
>  		 * It could be that preempt_count has not been updated during
>  		 * a switch between contexts. Allow for a single recursion.
>  		 */
> -		bit = TRACE_TRANSITION_BIT;
> +		bit = TRACE_CTX_TRANSITION + start;

I just want to be sure that I understand it correctly.

The transition bit is the same for all contexts. It will allow one
recursion only in one context.

IMHO, the same problem (not-yet-updated preempt_count) might happen
in any transition between contexts: normal -> soft IRQ -> IRQ -> NMI.

Well, I am not sure what exacly it means "preempt_count has not been
updated during a switch between contexts."

   Is it that a function in the interrupt entry code is traced before
   preempt_count is updated?

   Or that an interrupt entry is interrupted by a higher level
   interrupt, e.g. IRQ entry code interrupted by NMI?


I guess that it is the first case. It would mean that the above
function allows one mistake (one traced funtion in an interrupt entry
code before the entry code updates preempt_count).

Do I get it correctly?
Is this what we want?


Could we please update the comment? I mean to say if it is a race
or if we trace a function that should not get traced.

>  		if (val & (1 << bit)) {
>  			do_ftrace_record_recursion(ip, pip);
>  			return -1;
>  		}
> -	} else {
> -		/* Normal check passed, clear the transition to allow it again */
> -		val &= ~(1 << TRACE_TRANSITION_BIT);
>  	}
>  
>  	val |= 1 << bit;
>  	current->trace_recursion = val;
>  	barrier();
>  
> -	return bit + 1;
> +	return bit;
>  }
>  
>  static __always_inline void trace_clear_recursion(int bit)
>  {
> -	if (!bit)
> -		return;
> -
>  	barrier();
> -	bit--;
>  	trace_recursion_clear(bit);
>  }

Otherwise, the change looks great. It simplifies that logic a lot.
I think that I start understanding it ;-)

Best Regards,
Petr
