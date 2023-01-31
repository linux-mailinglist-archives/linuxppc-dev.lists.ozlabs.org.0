Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C2728682621
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 Jan 2023 09:05:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P5czN4FFHz3ccg
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 Jan 2023 19:05:04 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=Rvpx8cHz;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P5cyR33RNz2xrD
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 31 Jan 2023 19:04:15 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=Rvpx8cHz;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4P5cyP6mlxz4x1S;
	Tue, 31 Jan 2023 19:04:13 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1675152254;
	bh=iiCiAoCzDZpzO4m//p4xEnCPoub9jaFKFmMItf3K708=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Rvpx8cHzXuY3PAzo6rRAd3CVb91pxqWIYK6DQYtqYVLnpNVJpsdi9CzfjbEPXTQBH
	 b7j7MOusIj+0k5nytd2xflYaIj/r73/IsrLh07bIHJGDErieCjHEpGaD/duf8fTlLn
	 hRO1tsWKTKqnRGHcgIz4hEMNpKsfAp4LrqDY+jF8rS6xqdFZsEDOT+ZyFZSz1qjNoa
	 6GE6MfpaEunFtC3VXoIiZdRajTqVV+mtqMvBNUEuiBMBK+OSQZG4eVqYFd2s6UEUwl
	 Gd2C2mbi0vgInYLr/zT4taWSfcAP9q8sY8D1qubAiCQ8WFqk8UWtOKUgya1LKKMOlh
	 +iZZgCAOFk9Gw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Nicholas Miehlbradt <nicholas@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v2] powerpc: Implement arch_within_stack_frames
In-Reply-To: <20230119053127.17782-1-nicholas@linux.ibm.com>
References: <20230119053127.17782-1-nicholas@linux.ibm.com>
Date: Tue, 31 Jan 2023 19:04:12 +1100
Message-ID: <87fsbrf7ur.fsf@mpe.ellerman.id.au>
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
Cc: Nicholas Miehlbradt <nicholas@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Nicholas Miehlbradt <nicholas@linux.ibm.com> writes:
> Walks the stack when copy_{to,from}_user address is in the stack to
> ensure that the object being copied is entirely within a single stack
> frame.

... and that it exists above the parameter save area, so is not pointing
at any stack metadata right?

> Substatially similar to the x86 implementation except using the back
        ^
        n
> chain to traverse the stack and identify stack frame boundaries.

The x86 version does use the back chain (frame pointer) doesn't it?
Possibly this comment is just out of date now?

> Signed-off-by: Nicholas Miehlbradt <nicholas@linux.ibm.com>
> ---
> v2: Rename PARAMETER_SAVE_OFFSET to STACK_FRAME_PARAMS
>     Add definitions of STACK_FRAME_PARAMS for PPC32 and remove dependancy on PPC64
>     Ignore the current stack frame and start with it's parent, similar to x86
>
> v1: https://lore.kernel.org/linuxppc-dev/20221214044252.1910657-1-nicholas@linux.ibm.com/
> ---
>  arch/powerpc/Kconfig                   |  1 +
>  arch/powerpc/include/asm/thread_info.h | 36 ++++++++++++++++++++++++++
>  2 files changed, 37 insertions(+)
>
> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
> index 2ca5418457ed..97ca54773521 100644
> --- a/arch/powerpc/Kconfig
> +++ b/arch/powerpc/Kconfig
> @@ -198,6 +198,7 @@ config PPC
>  	select HAVE_ARCH_KASAN_VMALLOC		if HAVE_ARCH_KASAN
>  	select HAVE_ARCH_KFENCE			if ARCH_SUPPORTS_DEBUG_PAGEALLOC
>  	select HAVE_ARCH_RANDOMIZE_KSTACK_OFFSET
> +	select HAVE_ARCH_WITHIN_STACK_FRAMES
>  	select HAVE_ARCH_KGDB
>  	select HAVE_ARCH_MMAP_RND_BITS
>  	select HAVE_ARCH_MMAP_RND_COMPAT_BITS	if COMPAT
> diff --git a/arch/powerpc/include/asm/thread_info.h b/arch/powerpc/include/asm/thread_info.h
> index af58f1ed3952..c5dce5f239c1 100644
> --- a/arch/powerpc/include/asm/thread_info.h
> +++ b/arch/powerpc/include/asm/thread_info.h
> @@ -186,6 +186,42 @@ static inline bool test_thread_local_flags(unsigned int flags)
>  #define is_elf2_task() (0)
>  #endif
>  
> +#if defined(CONFIG_PPC64_ELF_ABI_V1)
> +#define STACK_FRAME_PARAMS 48
> +#elif defined(CONFIG_PPC64_ELF_ABI_V2)
> +#define STACK_FRAME_PARAMS 32
> +#elif defined(CONFIG_PPC32)
> +#define STACK_FRAME_PARAMS 8
> +#endif

Can you please put those in ppc_asm.h?

There's an ifdef starting around line 187 where they should fit nicely,
it has the __STK_PARAM macros already. The ppc32 case is at line 245.

In a subsequent patch we could make the __STK_PARAM macros use your new
#defines for the offsets.

> +
> +/*
> + * Walks up the stack frames to make sure that the specified object is
> + * entirely contained by a single stack frame.
> + *
> + * Returns:
> + *	GOOD_FRAME	if within a frame
> + *	BAD_STACK	if placed across a frame boundary (or outside stack)
> + */
> +static inline int arch_within_stack_frames(const void * const stack,
> +					   const void * const stackend,
> +					   const void *obj, unsigned long len)
> +{
> +	const void *params;
> +	const void *frame;
> +
> +	params = *(const void * const *)current_stack_pointer + STACK_FRAME_PARAMS;
> +	frame = **(const void * const * const *)current_stack_pointer;
> +
> +	while (stack <= frame && frame < stackend) {
> +		if (obj + len <= frame)
> +			return obj >= params ? GOOD_FRAME : BAD_STACK;
> +		params = frame + STACK_FRAME_PARAMS;
> +		frame = *(const void * const *)frame;
> +	}

I think the logic here is OK, but the variable naming makes it a bit
hard to follow.

Normally the stack pointer points at the lowest address of a frame, so
the "params" of that frame are at a higher address.

But here we have "frame" pointing at the caller frame (higher address)
as we check that obj sits above the params of the callee frame (lower
address).

So "params" and "frame" are different frames. I can't immediately come
up with a naming that makes it clearer though.

I think it could also be helped with a comment using some ASCII art :)

cheers
