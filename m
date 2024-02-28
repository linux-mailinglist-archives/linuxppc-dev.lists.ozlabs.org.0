Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 82A6186ADF5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Feb 2024 12:47:28 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=PCgMa0SU;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TlCJZ148Sz3vXT
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Feb 2024 22:47:26 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=PCgMa0SU;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.dev (client-ip=91.218.175.186; helo=out-186.mta0.migadu.com; envelope-from=andrew.jones@linux.dev; receiver=lists.ozlabs.org)
Received: from out-186.mta0.migadu.com (out-186.mta0.migadu.com [91.218.175.186])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TlCHn4fMxz2yk6
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Feb 2024 22:46:45 +1100 (AEDT)
Date: Wed, 28 Feb 2024 12:46:04 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1709120768;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=BTRGxQW5N7XqhNVjZVxsJ5EAjnYvN4qy0+rCqgNzMQI=;
	b=PCgMa0SUTBA5UUU6R6YwSiShMJ/wyIg404MEvg6KRuTrLJMB1b8AXsZ35umvCO2T9vt78m
	yQGsnTgsFmTaV9l2cM6x6h/wdj1UO8VNivowrYj5cpoxry5jXljACab3W/uH+QFeuQMcXO
	hThzEYpmKrTyl0CCM+rFirpcQYO5Sq0=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Andrew Jones <andrew.jones@linux.dev>
To: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [kvm-unit-tests PATCH 04/32] powerpc: interrupt stack backtracing
Message-ID: <20240228-9b32ddf7f58dc8f75b24e33c@orel>
References: <20240226101218.1472843-1-npiggin@gmail.com>
 <20240226101218.1472843-5-npiggin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240226101218.1472843-5-npiggin@gmail.com>
X-Migadu-Flow: FLOW_OUT
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>, kvm@vger.kernel.org, Joel Stanley <joel@jms.id.au>, Paolo Bonzini <pbonzini@redhat.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Feb 26, 2024 at 08:11:50PM +1000, Nicholas Piggin wrote:
> Add support for backtracing across interrupt stacks, and
> add interrupt frame backtrace for unhandled interrupts.
> 
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>  lib/powerpc/processor.c |  4 ++-
>  lib/ppc64/asm/stack.h   |  3 +++
>  lib/ppc64/stack.c       | 55 +++++++++++++++++++++++++++++++++++++++++
>  powerpc/Makefile.ppc64  |  1 +
>  powerpc/cstart64.S      |  7 ++++--
>  5 files changed, 67 insertions(+), 3 deletions(-)
>  create mode 100644 lib/ppc64/stack.c
> 
> diff --git a/lib/powerpc/processor.c b/lib/powerpc/processor.c
> index ad0d95666..114584024 100644
> --- a/lib/powerpc/processor.c
> +++ b/lib/powerpc/processor.c
> @@ -51,7 +51,9 @@ void do_handle_exception(struct pt_regs *regs)
>  		return;
>  	}
>  
> -	printf("unhandled cpu exception %#lx at NIA:0x%016lx MSR:0x%016lx\n", regs->trap, regs->nip, regs->msr);
> +	printf("Unhandled cpu exception %#lx at NIA:0x%016lx MSR:0x%016lx\n",
> +			regs->trap, regs->nip, regs->msr);
> +	dump_frame_stack((void *)regs->nip, (void *)regs->gpr[1]);
>  	abort();
>  }
>  
> diff --git a/lib/ppc64/asm/stack.h b/lib/ppc64/asm/stack.h
> index 9734bbb8f..94fd1021c 100644
> --- a/lib/ppc64/asm/stack.h
> +++ b/lib/ppc64/asm/stack.h
> @@ -5,4 +5,7 @@
>  #error Do not directly include <asm/stack.h>. Just use <stack.h>.
>  #endif
>  
> +#define HAVE_ARCH_BACKTRACE
> +#define HAVE_ARCH_BACKTRACE_FRAME
> +
>  #endif
> diff --git a/lib/ppc64/stack.c b/lib/ppc64/stack.c
> new file mode 100644
> index 000000000..fcb7fa860
> --- /dev/null
> +++ b/lib/ppc64/stack.c
> @@ -0,0 +1,55 @@
> +#include <libcflat.h>
> +#include <asm/ptrace.h>
> +#include <stack.h>
> +
> +extern char exception_stack_marker[];
> +
> +int backtrace_frame(const void *frame, const void **return_addrs, int max_depth)
> +{
> +	static int walking;
> +	int depth = 0;
> +	const unsigned long *bp = (unsigned long *)frame;
> +	void *return_addr;
> +
> +	asm volatile("" ::: "lr"); /* Force it to save LR */
> +
> +	if (walking) {
> +		printf("RECURSIVE STACK WALK!!!\n");
> +		return 0;
> +	}
> +	walking = 1;
> +
> +	bp = (unsigned long *)bp[0];
> +	return_addr = (void *)bp[2];
> +
> +	for (depth = 0; bp && depth < max_depth; depth++) {
> +		return_addrs[depth] = return_addr;
> +		if (return_addrs[depth] == 0)
> +			break;
> +		if (return_addrs[depth] == exception_stack_marker) {
> +			struct pt_regs *regs;
> +
> +			regs = (void *)bp + STACK_FRAME_OVERHEAD;
> +			bp = (unsigned long *)bp[0];
> +			/* Represent interrupt frame with vector number */
> +			return_addr = (void *)regs->trap;
> +			if (depth + 1 < max_depth) {
> +				depth++;
> +				return_addrs[depth] = return_addr;
> +				return_addr = (void *)regs->nip;
> +			}
> +		} else {
> +			bp = (unsigned long *)bp[0];
> +			return_addr = (void *)bp[2];
> +		}
> +	}
> +
> +	walking = 0;
> +	return depth;
> +}
> +
> +int backtrace(const void **return_addrs, int max_depth)
> +{
> +	return backtrace_frame(__builtin_frame_address(0), return_addrs,
> +			       max_depth);
> +}

I'm about to post a series which has a couple treewide tracing changes
in them. Depending on which series goes first the other will need to
accommodate.

Thanks,
drew
