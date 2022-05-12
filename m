Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 52DB1524DB7
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 May 2022 15:04:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KzX6n2043z3c7Q
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 May 2022 23:04:33 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=D/Ze8kpb;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KzX6B6Dn6z2x9G
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 May 2022 23:04:02 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=D/Ze8kpb; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4KzX686K5Bz4xLb;
 Thu, 12 May 2022 23:04:00 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1652360641;
 bh=0uAQzRywcoHe5qPTXv99UHIxtB59cyjehM95bNbBvXk=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=D/Ze8kpbYRGb3QeCDS8mFRlw8WCqKkvXEfh/RzBhC2BvKw7mKfMr4bYxEGbS7XdD0
 65J/yFKK9jGe879/HsQq858opPkVlRwszM9jKV8HgjTyAjGEJzEE4mFDBBGpc3GVeE
 Ww3ebDCRmCMu8vZ/3a1+i3pJvgK4+OpCK8kxstzfJnKpygfD/5yoL/lqm3E4zQ1kMw
 1XcJOwvVv+N5K2aDWgGJ287AMx6ghdx0I0mUidtmpwV9hn4lNo7vHnuf0x3nkFXngo
 YJe+hpGN4kEDMUNkj7AJMCWeiH3U22TNK91I3h+Ovd4KePoM7TfH5yr7R+/9CtyJVe
 CZ310SBi7JwJQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Kees Cook <keescook@chromium.org>, Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH -next] powerpc: add support for syscall stack randomization
In-Reply-To: <202205100917.5480D91@keescook>
References: <20220505111932.228814-1-xiujianfeng@huawei.com>
 <1652173338.7bltwybi0c.astroid@bobo.none> <202205100917.5480D91@keescook>
Date: Thu, 12 May 2022 23:03:57 +1000
Message-ID: <87r14y7via.fsf@mpe.ellerman.id.au>
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
Cc: mark.rutland@arm.com, Xiu Jianfeng <xiujianfeng@huawei.com>,
 linux-kernel@vger.kernel.org, paulus@samba.org,
 linux-hardening@vger.kernel.org, tglx@linutronix.de,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Kees Cook <keescook@chromium.org> writes:
> On Tue, May 10, 2022 at 07:23:46PM +1000, Nicholas Piggin wrote:
...
>> 
>> I wonder why the choose is separated from the add? I guess it's to
>> avoid a data dependency for stack access on an expensive random
>> function, so that makes sense (a comment would be nice in the
>> generic code).
>
> How does this read? I can send a "real" patch if it looks good:
>
>
> diff --git a/include/linux/randomize_kstack.h b/include/linux/randomize_kstack.h
> index 1468caf001c0..ad3e80275c74 100644
> --- a/include/linux/randomize_kstack.h
> +++ b/include/linux/randomize_kstack.h
> @@ -40,8 +40,11 @@ DECLARE_PER_CPU(u32, kstack_offset);
>   */
>  #define KSTACK_OFFSET_MAX(x)	((x) & 0x3FF)
>  
> -/*
> - * These macros must be used during syscall entry when interrupts and
> +/**
> + * add_random_kstack_offset - Increase stack utilization by previously
> + *			      chosen random offset
> + *
> + * This should be used in the syscall entry path when interrupts and
 
I would say "called" rather than used, but that's a nit-pick.

>   * preempt are disabled, and after user registers have been stored to
>   * the stack.
>   */
> @@ -55,6 +58,24 @@ DECLARE_PER_CPU(u32, kstack_offset);
>  	}								\
>  } while (0)
>  
> +/**
> + * choose_random_kstack_offset - Choose the random offsset for the next
> + *				 add_random_kstack_offset()

The name "choose" tricked me into thinking the offset is used verbatim.
But it's actually xor'ed into the existing offset.

I was pretty dubious about using mftb (~= rdtsc) based on that, but the
xor makes me less worried.

Obviously you don't want to change the name now, but it would be good if
the doc comment mentioned that the value is combined with the existing
value, not used as-is.

> + * This should only be used during syscall exit when interrupts and
> + * preempt are disabled, and before user registers have been restored
> + * from the stack. This is done to frustrate attack attempts from
> + * userspace to learn the offset:
> + * - Maximize the timing uncertainty visible from userspace: if the
> + *   the offset is chosen at syscall entry, userspace has much more

You have a "the the" across the line-break there.

> + *   control over the timing between chosen offsets. "How long will we
> + *   be in kernel mode?" tends to be more difficult to know than "how
> + *   long will be be in user mode?"
> + * - Reduce the lifetime of the new offset sitting in memory during
> + *   kernel mode execution. Exposures of "thread-local" (e.g. current,
> + *   percpu, etc) memory contents tends to be easier than arbitrary
> + *   location memory exposures.
> + */
>  #define choose_random_kstack_offset(rand) do {				\
>  	if (static_branch_maybe(CONFIG_RANDOMIZE_KSTACK_OFFSET_DEFAULT,	\
>  				&randomize_kstack_offset)) {		\
>

cheers
