Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D2E233AD22
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Mar 2021 09:15:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DzTkK1VwGz302k
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Mar 2021 19:15:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DzTjz44K7z2xfj
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Mar 2021 19:15:01 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4DzTjm6bsfz9tyDQ;
 Mon, 15 Mar 2021 09:14:52 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id Ve3cfPsdp8mN; Mon, 15 Mar 2021 09:14:52 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4DzTjm2QW6z9tyDP;
 Mon, 15 Mar 2021 09:14:52 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 144598B777;
 Mon, 15 Mar 2021 09:14:57 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id Pr23mMRympGp; Mon, 15 Mar 2021 09:14:57 +0100 (CET)
Received: from [172.25.230.100] (po15451.idsi0.si.c-s.fr [172.25.230.100])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id ADFD78B776;
 Mon, 15 Mar 2021 09:14:56 +0100 (CET)
Subject: Re: [PATCH 10/10] powerpc: move norestart trap flag to bit 0
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
References: <20210315031716.3940350-1-npiggin@gmail.com>
 <20210315031716.3940350-11-npiggin@gmail.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <99f15df0-dc86-4601-066f-a6c067ece8bf@csgroup.eu>
Date: Mon, 15 Mar 2021 09:14:51 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210315031716.3940350-11-npiggin@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: fr
Content-Transfer-Encoding: 8bit
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
Cc: Scott Wood <oss@buserror.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 15/03/2021 à 04:17, Nicholas Piggin a écrit :
> Compact the trap flags down to use the low 4 bits of regs.trap.
> 
> A few 64e interrupt trap numbers set bit 4. Although they tended to be
> trivial so it wasn't a real problem[1], it is not the right thing to do,
> and confusing.
> 
> [*] E.g., 0x310 hypercall goes to unknown_exception, which prints
>      regs->trap directly so 0x310 will appear fine, and only the syscall
>      interrupt will test norestart, so it won't be confused by 0x310.
> 
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>   arch/powerpc/include/asm/ptrace.h | 14 ++++++++++----
>   1 file changed, 10 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/powerpc/include/asm/ptrace.h b/arch/powerpc/include/asm/ptrace.h
> index 91194fdd5d01..6a04abfe5eb6 100644
> --- a/arch/powerpc/include/asm/ptrace.h
> +++ b/arch/powerpc/include/asm/ptrace.h
> @@ -185,15 +185,21 @@ static inline void regs_set_return_value(struct pt_regs *regs, unsigned long rc)
>   #define current_pt_regs() \
>   	((struct pt_regs *)((unsigned long)task_stack_page(current) + THREAD_SIZE) - 1)
>   
> +/*
> + * The 4 low bits (0xf) are available as flags to overload the trap word,
> + * because interrupt vectors have minimum alignment of 0x10. TRAP_FLAGS_MASK
> + * must cover the bits used as flags, including bit 0 which is used as the
> + * "norestart" bit.
> + */
>   #ifdef __powerpc64__
> -#define TRAP_FLAGS_MASK		0x10
> +#define TRAP_FLAGS_MASK		0x1
>   #define TRAP(regs)		((regs)->trap & ~TRAP_FLAGS_MASK)
>   #else
>   /*
>    * On 4xx we use bit 1 in the trap word to indicate whether the exception
>    * is a critical exception (1 means it is).
>    */
> -#define TRAP_FLAGS_MASK		0x1E
> +#define TRAP_FLAGS_MASK		0xf

Could we set 0xf for all and remove the ifdef __powerpc64__ ?

>   #define TRAP(regs)		((regs)->trap & ~TRAP_FLAGS_MASK)
>   #define IS_CRITICAL_EXC(regs)	(((regs)->trap & 2) != 0)
>   #define IS_MCHECK_EXC(regs)	(((regs)->trap & 4) != 0)
> @@ -222,12 +228,12 @@ static inline bool trap_is_syscall(struct pt_regs *regs)
>   
>   static inline bool trap_norestart(struct pt_regs *regs)
>   {
> -	return regs->trap & 0x10;
> +	return regs->trap & 0x1;
>   }
>   
>   static inline void set_trap_norestart(struct pt_regs *regs)
>   {
> -	regs->trap |= 0x10;
> +	regs->trap |= 0x1;
>   }
>   
>   #define arch_has_single_step()	(1)
> 

While we are playing with ->trap, in mm/book3s64/hash_utils.c there is an if (regs->trap == 0x400). 
Should be TRAP(regs) == 0x400 ?

Christophe
