Return-Path: <linuxppc-dev+bounces-5649-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CA416A210AC
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Jan 2025 19:20:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YjD941zwFz302W;
	Wed, 29 Jan 2025 05:20:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1738088408;
	cv=none; b=F417rluAheKF9LoxEnJj+g0DHVD3Uo5vqdObR3GaREAG+t3WcaQxjdgvvBQ4AKis0oZIGd906GZ9vyWK6l6sSmEA75ZDK54XIlkpgaU+c5Ol63vkHIVSFI1D+PNrWoyJZbUa9xg3N4aIIrYSWgAf3qSeuY9kpCZrAg3brfGSAPOtWlu3XpmkMyN2ltpCZYNldE2IsToDw7iM1xVMg9r0rwDx/yNqTCf8PqR6HumqA42IzMx0K26hnoPdcfYu4Cp4j7YNZI2kCoDsjqG5qJSp7cB0hGmnm4+0XrQThv3CAOfKrwsLymcR9EK+KWL9Pyf/XASd21odhVIY0dZE6v/Z4w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1738088408; c=relaxed/relaxed;
	bh=WM9trslWS9KYpBqNKWAwN7wDCbec9cK9CLoamIg07KE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PC8L3GhRI25jWqmhgCYxkWDuPdCc+f5Wh72NusPdoxJ7Hkqc+DvLxI6WH57aKdAPOV1Wswo1ORZrxQ+YQlpfimjoVLGLKaKZaUn/wPoGez5c33FIYuWvRKaqM/Im0UcOdc4M0lPEskOP97j7FzC52AQT8zTfOLOdinXKvqkdCpew7IcZ/yNIddVViz5bK3ScMatQomT9Gjm4Vi/vd4VxcF0ig85xsFO9H0Y1xjJvVfqCW+096OVtl7IXq5mVVJceLF5cU3AzPWRYbBn2CVIQIr/nPRqHphI5Mr+BLRF3O246KI/uBS71mTPTf3gCuQ5Fv2RUD4gF1B5Gi0I0ejk03w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YjD932FzDz2xfX
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Jan 2025 05:20:05 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4YjClw3MRNz9sRk;
	Tue, 28 Jan 2025 19:01:48 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AqCW45qW7Q5c; Tue, 28 Jan 2025 19:01:48 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4YjClw2Ndxz9sPd;
	Tue, 28 Jan 2025 19:01:48 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 3E64F8B76C;
	Tue, 28 Jan 2025 19:01:48 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id xmVN7XbT5WoL; Tue, 28 Jan 2025 19:01:48 +0100 (CET)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 953588B763;
	Tue, 28 Jan 2025 19:01:47 +0100 (CET)
Message-ID: <695b2329-65d5-4e0b-b8ce-eb622c253986@csgroup.eu>
Date: Tue, 28 Jan 2025 19:01:47 +0100
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] powerpc: fix inconsistencies in syscall error return
 handling
To: "Dmitry V. Levin" <ldv@strace.io>, Michael Ellerman <mpe@ellerman.id.au>
Cc: Alexey Gladkov <legion@kernel.org>,
 Eugene Syromyatnikov <evgsyr@gmail.com>, Oleg Nesterov <oleg@redhat.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Nicholas Piggin <npiggin@gmail.com>, Naveen N Rao <naveen@kernel.org>,
 linuxppc-dev@lists.ozlabs.org, strace-devel@lists.strace.io,
 linux-kernel@vger.kernel.org
References: <20250127181424.GB1373@strace.io>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <20250127181424.GB1373@strace.io>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org



Le 27/01/2025 à 19:14, Dmitry V. Levin a écrit :
> Since the introduction of SECCOMP_RET_TRACE support, the kernel supports
> simultaneously both the generic kernel -ERRORCODE return value ABI and
> the powerpc sc syscall return ABI for PTRACE_EVENT_SECCOMP tracers.
> This change is an attempt to address the code inconsistencies in syscall
> error return handling that were introduced as a side effect of the dual
> ABI support.
> 
> Signed-off-by: Dmitry V. Levin <ldv@strace.io>
> ---
>   arch/powerpc/kernel/ptrace/ptrace.c | 23 ++++++++++++++++++++---
>   arch/powerpc/kernel/signal.c        | 11 +++--------
>   arch/powerpc/kernel/syscall.c       |  6 +++---
>   3 files changed, 26 insertions(+), 14 deletions(-)
> 
> diff --git a/arch/powerpc/kernel/ptrace/ptrace.c b/arch/powerpc/kernel/ptrace/ptrace.c
> index 727ed4a14545..3778775bf6ba 100644
> --- a/arch/powerpc/kernel/ptrace/ptrace.c
> +++ b/arch/powerpc/kernel/ptrace/ptrace.c
> @@ -207,7 +207,7 @@ static int do_seccomp(struct pt_regs *regs)
>   	 * syscall parameter. This is different to the ptrace ABI where
>   	 * both r3 and orig_gpr3 contain the first syscall parameter.
>   	 */
> -	regs->gpr[3] = -ENOSYS;
> +	syscall_set_return_value(current, regs, -ENOSYS, 0);
>   
>   	/*
>   	 * We use the __ version here because we have already checked
> @@ -215,8 +215,18 @@ static int do_seccomp(struct pt_regs *regs)
>   	 * have already loaded -ENOSYS into r3, or seccomp has put
>   	 * something else in r3 (via SECCOMP_RET_ERRNO/TRACE).
>   	 */
> -	if (__secure_computing(NULL))
> +	if (__secure_computing(NULL)) {
> +
> +		/*
> +		 * Traditionally, both the generic kernel -ERRORCODE return
> +		 * value ABI and the powerpc sc syscall return ABI is
> +		 * supported.  For consistency, if the former is detected,
> +		 * convert it to the latter.
> +		 */
> +		if (!trap_is_scv(regs) && IS_ERR_VALUE(regs->gpr[3]))

Why !trap_is_scv(regs) ? Shouldn't this also work with scv allthough it 
should be a noop ?


> +			syscall_set_return_value(current, regs, regs->gpr[3], 0);
>   		return -1;
> +	}
>   
>   	/*
>   	 * The syscall was allowed by seccomp, restore the register
> @@ -226,6 +236,13 @@ static int do_seccomp(struct pt_regs *regs)
>   	 * allow the syscall to proceed.
>   	 */
>   	regs->gpr[3] = regs->orig_gpr3;
> +	if (!trap_is_scv(regs)) {
> +		/*
> +		 * Clear SO bit that was set in this function earlier by
> +		 * syscall_set_return_value.
> +		 */
> +		regs->ccr &= ~0x10000000L;
> +	}

Can't we use syscall_set_return_value() to do that ?

>   
>   	return 0;
>   }
> @@ -315,7 +332,7 @@ long do_syscall_trace_enter(struct pt_regs *regs)
>   	 * If we are aborting explicitly, or if the syscall number is
>   	 * now invalid, set the return value to -ENOSYS.
>   	 */
> -	regs->gpr[3] = -ENOSYS;
> +	syscall_set_return_value(current, regs, -ENOSYS, 0);
>   	return -1;
>   }
>   
> diff --git a/arch/powerpc/kernel/signal.c b/arch/powerpc/kernel/signal.c
> index aa17e62f3754..1a38d6bcaed6 100644
> --- a/arch/powerpc/kernel/signal.c
> +++ b/arch/powerpc/kernel/signal.c
> @@ -19,6 +19,7 @@
>   #include <asm/unistd.h>
>   #include <asm/debug.h>
>   #include <asm/tm.h>
> +#include <asm/syscall.h>
>   
>   #include "signal.h"
>   
> @@ -229,14 +230,8 @@ static void check_syscall_restart(struct pt_regs *regs, struct k_sigaction *ka,
>   		regs_add_return_ip(regs, -4);
>   		regs->result = 0;
>   	} else {
> -		if (trap_is_scv(regs)) {
> -			regs->result = -EINTR;
> -			regs->gpr[3] = -EINTR;
> -		} else {
> -			regs->result = -EINTR;
> -			regs->gpr[3] = EINTR;
> -			regs->ccr |= 0x10000000;
> -		}
> +		regs->result = -EINTR;
> +		syscall_set_return_value(current, regs, -EINTR, 0);
>   	}
>   }
>   
> diff --git a/arch/powerpc/kernel/syscall.c b/arch/powerpc/kernel/syscall.c
> index be159ad4b77b..2fe47191e509 100644
> --- a/arch/powerpc/kernel/syscall.c
> +++ b/arch/powerpc/kernel/syscall.c
> @@ -122,7 +122,7 @@ notrace long system_call_exception(struct pt_regs *regs, unsigned long r0)
>   		if (unlikely(trap_is_unsupported_scv(regs))) {
>   			/* Unsupported scv vector */
>   			_exception(SIGILL, regs, ILL_ILLOPC, regs->nip);
> -			return regs->gpr[3];
> +			return regs_return_value(regs);
>   		}
>   		/*
>   		 * We use the return value of do_syscall_trace_enter() as the
> @@ -133,13 +133,13 @@ notrace long system_call_exception(struct pt_regs *regs, unsigned long r0)
>   		 */
>   		r0 = do_syscall_trace_enter(regs);
>   		if (unlikely(r0 >= NR_syscalls))
> -			return regs->gpr[3];
> +			return regs_return_value(regs);
>   
>   	} else if (unlikely(r0 >= NR_syscalls)) {
>   		if (unlikely(trap_is_unsupported_scv(regs))) {
>   			/* Unsupported scv vector */
>   			_exception(SIGILL, regs, ILL_ILLOPC, regs->nip);
> -			return regs->gpr[3];
> +			return regs_return_value(regs);
>   		}
>   		return -ENOSYS;
>   	}


