Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 563C0506D2F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Apr 2022 15:10:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KjPL43KZkz3bXD
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Apr 2022 23:10:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=arm.com
 (client-ip=217.140.110.172; helo=foss.arm.com;
 envelope-from=mark.rutland@arm.com; receiver=<UNKNOWN>)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by lists.ozlabs.org (Postfix) with ESMTP id 4KjPKd6BgFz2xBv
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Apr 2022 23:09:55 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 92A48106F;
 Tue, 19 Apr 2022 06:09:22 -0700 (PDT)
Received: from FVFF77S0Q05N (unknown [10.57.75.72])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4A73B3F766;
 Tue, 19 Apr 2022 06:09:19 -0700 (PDT)
Date: Tue, 19 Apr 2022 14:09:14 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: He Zhe <zhe.he@windriver.com>
Subject: Re: [PATCH RFC 1/8] stacktrace: Change callback prototype to pass
 more information
Message-ID: <Yl60euwfis+u92cA@FVFF77S0Q05N>
References: <20220418132217.1573072-1-zhe.he@windriver.com>
 <20220418132217.1573072-2-zhe.he@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220418132217.1573072-2-zhe.he@windriver.com>
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
Cc: linux-arm-kernel@lists.infradead.org, linux-s390@vger.kernel.org,
 x86@kernel.org, hpa@zytor.com, keescook@chromium.org,
 alexander.shishkin@linux.intel.com, catalin.marinas@arm.com,
 dave.hansen@linux.intel.com, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, bp@alien8.de,
 svens@linux.ibm.com, jolsa@kernel.org, namhyung@kernel.org, tglx@linutronix.de,
 borntraeger@linux.ibm.com, will@kernel.org, linux-riscv@lists.infradead.org,
 paulus@samba.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Apr 18, 2022 at 09:22:10PM +0800, He Zhe wrote:
> Currently stack_trace_consume_fn can only have pc of each frame of the
> stack. Copying-beyond-the-frame-detection also needs fp of current and
> previous frame. Other detection algorithm in the future may need more
> information of the frame.
> 
> We define a frame_info to include them all.
> 
> 
> Signed-off-by: He Zhe <zhe.he@windriver.com>
> ---
>  include/linux/stacktrace.h |  9 ++++++++-
>  kernel/stacktrace.c        | 10 +++++-----
>  2 files changed, 13 insertions(+), 6 deletions(-)
> 
> diff --git a/include/linux/stacktrace.h b/include/linux/stacktrace.h
> index 97455880ac41..5a61bfafe6f0 100644
> --- a/include/linux/stacktrace.h
> +++ b/include/linux/stacktrace.h
> @@ -10,15 +10,22 @@ struct pt_regs;
>  
>  #ifdef CONFIG_ARCH_STACKWALK
>  
> +struct frame_info {
> +	unsigned long pc;
> +	unsigned long fp;
> +	unsigned long prev_fp;
> +};

I don't think this should be exposed through a generic interface; the `fp` and
`prev_fp` values are only meaningful with arch-specific knowledge, and they're
*very* easy to misuse (e.g. when transitioning from one stack to another).
There's also a bunch of other information one may or may not want, depending on
what you're trying to achieve.

I am happy to have an arch-specific internal unwinder where we can access this
information, and *maybe* it makes sense to have a generic API that passes some
opaque token, but I don't think we should make the structure generic.

Thanks,
Mark.

> +
>  /**
>   * stack_trace_consume_fn - Callback for arch_stack_walk()
>   * @cookie:	Caller supplied pointer handed back by arch_stack_walk()
>   * @addr:	The stack entry address to consume
> + * @fi:	The frame information to consume
>   *
>   * Return:	True, if the entry was consumed or skipped
>   *		False, if there is no space left to store
>   */
> -typedef bool (*stack_trace_consume_fn)(void *cookie, unsigned long addr);
> +typedef bool (*stack_trace_consume_fn)(void *cookie, struct frame_info *fi);
>  /**
>   * arch_stack_walk - Architecture specific function to walk the stack
>   * @consume_entry:	Callback which is invoked by the architecture code for
> diff --git a/kernel/stacktrace.c b/kernel/stacktrace.c
> index 9ed5ce989415..2d0a2812e92b 100644
> --- a/kernel/stacktrace.c
> +++ b/kernel/stacktrace.c
> @@ -79,7 +79,7 @@ struct stacktrace_cookie {
>  	unsigned int	len;
>  };
>  
> -static bool stack_trace_consume_entry(void *cookie, unsigned long addr)
> +static bool stack_trace_consume_entry(void *cookie, struct frame_info *fi)
>  {
>  	struct stacktrace_cookie *c = cookie;
>  
> @@ -90,15 +90,15 @@ static bool stack_trace_consume_entry(void *cookie, unsigned long addr)
>  		c->skip--;
>  		return true;
>  	}
> -	c->store[c->len++] = addr;
> +	c->store[c->len++] = fi->pc;
>  	return c->len < c->size;
>  }
>  
> -static bool stack_trace_consume_entry_nosched(void *cookie, unsigned long addr)
> +static bool stack_trace_consume_entry_nosched(void *cookie, struct frame_info *fi)
>  {
> -	if (in_sched_functions(addr))
> +	if (in_sched_functions(fi->pc))
>  		return true;
> -	return stack_trace_consume_entry(cookie, addr);
> +	return stack_trace_consume_entry(cookie, fi);
>  }
>  
>  /**
> -- 
> 2.25.1
> 
