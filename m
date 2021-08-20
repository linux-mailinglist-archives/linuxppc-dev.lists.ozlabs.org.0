Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 58F123F27DE
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Aug 2021 09:50:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GrYhb1xjlz3cVr
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Aug 2021 17:50:23 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=Z88hVJCh;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ellerman.id.au (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=mpe@ellerman.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=Z88hVJCh; 
 dkim-atps=neutral
Received: from ozlabs.org (ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GrYgt35Bpz3bNq
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Aug 2021 17:49:45 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4GrYgn1dHhz9sW5;
 Fri, 20 Aug 2021 17:49:41 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1629445784;
 bh=J88K3uaWPTCJyDGiM5or1YoD8rBCAEgZEcryK0u/Zo8=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=Z88hVJChPLNbFu7va+/1tqYNPa130kSyesJQV170fqBHtyrBHgsoYQ2vG7jWAFenK
 UnM2Xa2WgoEuieSkc1ZLVVCug9f3+zRWbhv+8Kwz9lJ0T0OnirC7rGiJCfhmiQugbk
 Gsb7MIcErTNH7IqyHIXf4NSUrbbL24pfQhAXgxRcFTJzWh3imrJnTVx0viKKp/yGsL
 l2OmzlfcafH3m4gmgvP4ByLj0MCm/9nnxFrtr8KESxwRDR7p6qbKr/nDLbVfTi5zPT
 FKKzWNEL1TGEoS3kCLjjXXVT5+f+vjk1mCNrPw4HFdJEtcPLwmj4uEVdYODVh2zgGX
 +3YZnoSC4+cKQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Kees Cook <keescook@chromium.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 57/63] powerpc/signal32: Use struct_group() to zero
 spe regs
In-Reply-To: <20210818060533.3569517-58-keescook@chromium.org>
References: <20210818060533.3569517-1-keescook@chromium.org>
 <20210818060533.3569517-58-keescook@chromium.org>
Date: Fri, 20 Aug 2021 17:49:35 +1000
Message-ID: <877dggeesw.fsf@mpe.ellerman.id.au>
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
Cc: Kees Cook <keescook@chromium.org>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-staging@lists.linux.dev,
 linux-wireless@vger.kernel.org, "Gustavo
 A. R. Silva" <gustavoars@kernel.org>, linux-hardening@vger.kernel.org,
 linux-block@vger.kernel.org, clang-built-linux@googlegroups.com,
 netdev@vger.kernel.org, Paul Mackerras <paulus@samba.org>,
 dri-devel@lists.freedesktop.org, Sudeep Holla <sudeep.holla@arm.com>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 linux-kbuild@vger.kernel.org, kernel test robot <lkp@intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Kees Cook <keescook@chromium.org> writes:
> In preparation for FORTIFY_SOURCE performing compile-time and run-time
> field bounds checking for memset(), avoid intentionally writing across
> neighboring fields.
>
> Add a struct_group() for the spe registers so that memset() can correctly reason
> about the size:
>
>    In function 'fortify_memset_chk',
>        inlined from 'restore_user_regs.part.0' at arch/powerpc/kernel/signal_32.c:539:3:
>>> include/linux/fortify-string.h:195:4: error: call to '__write_overflow_field' declared with attribute warning: detected write beyond size of field (1st parameter); maybe use struct_group()? [-Werror=attribute-warning]
>      195 |    __write_overflow_field();
>          |    ^~~~~~~~~~~~~~~~~~~~~~~~
>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> Cc: Paul Mackerras <paulus@samba.org>
> Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
> Cc: Sudeep Holla <sudeep.holla@arm.com>
> Cc: linuxppc-dev@lists.ozlabs.org
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Kees Cook <keescook@chromium.org>
> ---
>  arch/powerpc/include/asm/processor.h | 6 ++++--
>  arch/powerpc/kernel/signal_32.c      | 6 +++---
>  2 files changed, 7 insertions(+), 5 deletions(-)
>
> diff --git a/arch/powerpc/include/asm/processor.h b/arch/powerpc/include/asm/processor.h
> index f348e564f7dd..05dc567cb9a8 100644
> --- a/arch/powerpc/include/asm/processor.h
> +++ b/arch/powerpc/include/asm/processor.h
> @@ -191,8 +191,10 @@ struct thread_struct {
>  	int		used_vsr;	/* set if process has used VSX */
>  #endif /* CONFIG_VSX */
>  #ifdef CONFIG_SPE
> -	unsigned long	evr[32];	/* upper 32-bits of SPE regs */
> -	u64		acc;		/* Accumulator */
> +	struct_group(spe,
> +		unsigned long	evr[32];	/* upper 32-bits of SPE regs */
> +		u64		acc;		/* Accumulator */
> +	);
>  	unsigned long	spefscr;	/* SPE & eFP status */
>  	unsigned long	spefscr_last;	/* SPEFSCR value on last prctl
>  					   call or trap return */
> diff --git a/arch/powerpc/kernel/signal_32.c b/arch/powerpc/kernel/signal_32.c
> index 0608581967f0..77b86caf5c51 100644
> --- a/arch/powerpc/kernel/signal_32.c
> +++ b/arch/powerpc/kernel/signal_32.c
> @@ -532,11 +532,11 @@ static long restore_user_regs(struct pt_regs *regs,
>  	regs_set_return_msr(regs, regs->msr & ~MSR_SPE);
>  	if (msr & MSR_SPE) {
>  		/* restore spe registers from the stack */
> -		unsafe_copy_from_user(current->thread.evr, &sr->mc_vregs,
> -				      ELF_NEVRREG * sizeof(u32), failed);
> +		unsafe_copy_from_user(&current->thread.spe, &sr->mc_vregs,
> +				      sizeof(current->thread.spe), failed);

This makes me nervous, because the ABI is that we copy ELF_NEVRREG *
sizeof(u32) bytes, not whatever sizeof(current->thread.spe) happens to
be.

ie. if we use sizeof an inadvertent change to the fields in
thread_struct could change how many bytes we copy out to userspace,
which would be an ABI break.

And that's not that hard to do, because it's not at all obvious that the
size and layout of fields in thread_struct affects the user ABI.

At the same time we don't want to copy the right number of bytes but
the wrong content, so from that point of view using sizeof is good :)

The way we handle it in ptrace is to have BUILD_BUG_ON()s to verify that
things match up, so maybe we should do that here too.

ie. add:

	BUILD_BUG_ON(sizeof(current->thread.spe) == ELF_NEVRREG * sizeof(u32));


Not sure if you are happy doing that as part of this patch. I can always
do it later if not.

cheers
