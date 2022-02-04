Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 287674A97A6
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Feb 2022 11:22:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jqs6s6z0wz3bZb
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Feb 2022 21:22:45 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=mQ1a6NqB;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ellerman.id.au (client-ip=2404:9400:2221:ea00::3;
 helo=gandalf.ozlabs.org; envelope-from=mpe@ellerman.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=mQ1a6NqB; 
 dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jqs6D6zX7z2yLK
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  4 Feb 2022 21:22:11 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Jqs694YQFz4xQp;
 Fri,  4 Feb 2022 21:22:09 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1643970129;
 bh=n/dsnLParIeDzoAdhcs84UwV8S6Ado29Z5vp88a2f1M=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=mQ1a6NqBdqBur/r8BdALGox6Oa06q/dI4R4QhuVnaAl3Qn/gCrNeJuU6j2XuJNqHZ
 HvRSMohROzxiUoVw5J7UKn1SBtNAjX6f4jORoXb/Piracprop+ZPVDHZsqrKoiihTz
 KrD4fNq9BPA2LV9gAcrdW+D9ikYssFXho+X72YMNqxAgnmDntcNVxUn71saIltkJA9
 QFbmT2/4T7vlmkL5NU3GhPbhbicay131bIB6ZEwjD5FD+aOqugExMwtK9N/ivsivkK
 B6jdpgG5GUfQb53XKPZItRohfe7rXdhdFBk+3Yy6K/JTd7NMY3ySR8nncLfufJTmqQ
 31khwlYPRDfjQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH 1/2] powerpc/signal: Fix handling of SA_RESTORER
 sigaction flag
In-Reply-To: <afe50d1db63a10fde9547ea08fe1fa68b0638aba.1624618157.git.christophe.leroy@csgroup.eu>
References: <afe50d1db63a10fde9547ea08fe1fa68b0638aba.1624618157.git.christophe.leroy@csgroup.eu>
Date: Fri, 04 Feb 2022 21:22:04 +1100
Message-ID: <87a6f7lynn.fsf@mpe.ellerman.id.au>
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
Cc: Tulio Magno Quites Machado Filho <tuliom@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy <christophe.leroy@csgroup.eu> writes:
> powerpc advertises support of SA_RESTORER sigaction flag.
>
> Make it the truth.
>
> Cc: stable@vger.kernel.org
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---
>  arch/powerpc/kernel/signal_32.c | 8 ++++++--
>  arch/powerpc/kernel/signal_64.c | 4 +++-
>  2 files changed, 9 insertions(+), 3 deletions(-)

Hi Christophe,

I dug into the history a bit on this.

The 32-bit port originally did not define SA_RESTORER in
include/asm-ppc/signal.h, but it was added in 2.1.79.

  https://github.com/mpe/linux-fullhistory/commit/4e7e9c0d54ff5725a73d2210a950f8bc0f225073

That commit added SA_RESTORER to the header, added code to get/set it in
sys_sigaction(), but didn't add any code to use it for signal delivery.


The 64-bit port was merged with SA_RESTORER already defined in
include/asm-ppc64/signal.h:

  https://github.com/mpe/linux-fullhistory/commit/c3aa9878533e724f639852c3d951e6a169e04081
  
Similarly there was code to set/get it in sys_sigaction(), but no code
to use it for signal delivery.


Later the two ports were merged, and the headers were moved and
disintegrated into uapi, so we end up today with SA_RESTORER defined in
arch/powerpc/include/uapi/asm/signal.h, but no code to use it.

So essentially we've had SA_RESTORER defined since ancient kernels, but
never actually supported using it for anything.


One problem with enabling it now is there's no way for userspace to
determine if it's on a fixed kernel or not. That makes it unusable for
userspace, unless it does version checks, or is happy to break on all
old kernels (not likely). We could solve that by defining
SA_RESTORER_FIXED or something, but that's slightly gross.

It's also described in the man page as "Not intended for application
use", ie. it's intended for use by libc. I'm not sure there's any value
in adding support for it to the kernel unless we know there's interest
from glibc/musl in using it.

So my inclination is that we should *not* add support for it, rather we
should leave it unimplemented and remove SA_RESTORER from the header.
There's precedent in riscv for not supporting it at all.

cheers



> diff --git a/arch/powerpc/kernel/signal_32.c b/arch/powerpc/kernel/signal_32.c
> index 0608581967f0..cf3da1386595 100644
> --- a/arch/powerpc/kernel/signal_32.c
> +++ b/arch/powerpc/kernel/signal_32.c
> @@ -769,7 +769,9 @@ int handle_rt_signal32(struct ksignal *ksig, sigset_t *oldset,
>  	}
>  
>  	/* Save user registers on the stack */
> -	if (tsk->mm->context.vdso) {
> +	if (ksig->ka.sa.sa_flags & SA_RESTORER) {
> +		tramp = (unsigned long)ksig->ka.sa.sa_restorer;
> +	} else if (tsk->mm->context.vdso) {
>  		tramp = VDSO32_SYMBOL(tsk->mm->context.vdso, sigtramp_rt32);
>  	} else {
>  		tramp = (unsigned long)mctx->mc_pad;
> @@ -865,7 +867,9 @@ int handle_signal32(struct ksignal *ksig, sigset_t *oldset,
>  	else
>  		unsafe_save_user_regs(regs, mctx, tm_mctx, 1, failed);
>  
> -	if (tsk->mm->context.vdso) {
> +	if (ksig->ka.sa.sa_flags & SA_RESTORER) {
> +		tramp = (unsigned long)ksig->ka.sa.sa_restorer;
> +	} else if (tsk->mm->context.vdso) {
>  		tramp = VDSO32_SYMBOL(tsk->mm->context.vdso, sigtramp32);
>  	} else {
>  		tramp = (unsigned long)mctx->mc_pad;
> diff --git a/arch/powerpc/kernel/signal_64.c b/arch/powerpc/kernel/signal_64.c
> index 1831bba0582e..fb31a334aca6 100644
> --- a/arch/powerpc/kernel/signal_64.c
> +++ b/arch/powerpc/kernel/signal_64.c
> @@ -910,7 +910,9 @@ int handle_rt_signal64(struct ksignal *ksig, sigset_t *set,
>  	tsk->thread.fp_state.fpscr = 0;
>  
>  	/* Set up to return from userspace. */
> -	if (tsk->mm->context.vdso) {
> +	if (ksig->ka.sa.sa_flags & SA_RESTORER) {
> +		regs_set_return_ip(regs, (unsigned long)ksig->ka.sa.sa_restorer);
> +	} else if (tsk->mm->context.vdso) {
>  		regs_set_return_ip(regs, VDSO64_SYMBOL(tsk->mm->context.vdso, sigtramp_rt64));
>  	} else {
>  		err |= setup_trampoline(__NR_rt_sigreturn, &frame->tramp[0]);
> -- 
> 2.25.0
