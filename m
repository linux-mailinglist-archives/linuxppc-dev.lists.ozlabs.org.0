Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 325476E18A3
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Apr 2023 02:10:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PyH0V0yz7z3f8g
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Apr 2023 10:10:50 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=cOakumuv;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PyGzc2dz4z3cdj
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Apr 2023 10:10:04 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=cOakumuv;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4PyGzZ1vVRz4xFL;
	Fri, 14 Apr 2023 10:10:02 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1681431004;
	bh=Q7KsgvqsLrWieFE7M07Ww7Bl5ImVflY8xEb93QACjIM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=cOakumuv2DjMHDtWx/3C7Bm8wh4VSwSsx3518og5iYSSg0pD9S3WJFg7I+mgCDrFu
	 wZwi4kVFHfCq94qKXCqycy8qQXmrxMkDiblK2Ckw1BzF5ewdHJyhfx++hCNzaDcu0e
	 7lAN8OwhnL7WBqzzbBPCf/RcQ+PrJHBGiNKdSEMy5dYNhyLT4Rh/nDxciblhzGJc7v
	 d8JvTZTLQsad1SCrBuXuj2ZcHXLnynbCLIBIoP4+05mcYjf+FHPYGvkRV3YXF4X+Mh
	 eE7nMbDGAOv3TlCO1VKQJML9x10idZmDNRTYe9joFzNXSKh6u3CXXR0T52LP1MN8w/
	 ISD8y/0082nOg==
From: Michael Ellerman <mpe@ellerman.id.au>
To: ndesaulniers@google.com, "Borislav Petkov (AMD)" <bp@alien8.de>
Subject: Re: [PATCH 1/2] start_kernel: add no_stack_protector fn attr
In-Reply-To: <20230412-no_stackp-v1-1-46a69b507a4b@google.com>
References: <20230412-no_stackp-v1-0-46a69b507a4b@google.com>
 <20230412-no_stackp-v1-1-46a69b507a4b@google.com>
Date: Fri, 14 Apr 2023 10:09:58 +1000
Message-ID: <87r0sn9ve1.fsf@mpe.ellerman.id.au>
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
Cc: llvm@lists.linux.dev, Peter Zijlstra <peterz@infradead.org>, Tom Rix <trix@redhat.com>, x86@kernel.org, Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>, Nicholas Piggin <npiggin@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, linuxppc-dev@lists.ozlabs.org, Josh Poimboeuf <jpoimboe@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

ndesaulniers@google.com writes:
> Back during the discussion of
> commit a9a3ed1eff36 ("x86: Fix early boot crash on gcc-10, third try")
> we discussed the need for a function attribute to control the omission
> of stack protectors on a per-function basis; at the time Clang had
> support for no_stack_protector but GCC did not. This was fixed in
> gcc-11. Now that the function attribute is available, let's start using
> it.
>
> Callers of boot_init_stack_canary need to use this function attribute
> unless they're compiled with -fno-stack-protector, otherwise the canary
> stored in the stack slot of the caller will differ upon the call to
> boot_init_stack_canary. This will lead to a call to __stack_chk_fail
> then panic.
>
> Link: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=94722
> Link: https://lore.kernel.org/all/20200316130414.GC12561@hirez.programming.kicks-ass.net/
> Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
> ---
>  arch/powerpc/kernel/smp.c           |  1 +
>  include/linux/compiler_attributes.h | 12 ++++++++++++
>  init/main.c                         |  3 ++-
>  3 files changed, 15 insertions(+), 1 deletion(-)
>
> diff --git a/arch/powerpc/kernel/smp.c b/arch/powerpc/kernel/smp.c
> index 6b90f10a6c81..7d4c12b1abb7 100644
> --- a/arch/powerpc/kernel/smp.c
> +++ b/arch/powerpc/kernel/smp.c
> @@ -1603,6 +1603,7 @@ static void add_cpu_to_masks(int cpu)
>  }
>  
>  /* Activate a secondary processor. */
> +__no_stack_protector
>  void start_secondary(void *unused)
>  {
>  	unsigned int cpu = raw_smp_processor_id();

start_secondary() doesn't return, so it won't actually crash, but it
obviously makes sense for it to be marked with __no_stack_protector.

There's quite a few other places we could add __no_stack_protector
annotations in powerpc code, and then make the changes to CFLAGS to
disable stack protector conditional on GCC < 11.

So I guess this patch is fine, but there's more that could be done.

Acked-by: Michael Ellerman <mpe@ellerman.id.au> (powerpc)

cheers
