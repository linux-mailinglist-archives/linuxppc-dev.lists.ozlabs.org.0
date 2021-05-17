Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 019B2382DE5
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 May 2021 15:50:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FkL9j6bYMz3bsM
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 May 2021 23:50:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FkL9C6LQxz2yXK
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 May 2021 23:49:48 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4FkL95650Mz9sYS;
 Mon, 17 May 2021 15:49:45 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rxVfR63A_GZR; Mon, 17 May 2021 15:49:45 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4FkL9557THz9sYR;
 Mon, 17 May 2021 15:49:45 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 92B9F8B79C;
 Mon, 17 May 2021 15:49:45 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id JY-ZS7QhtC_k; Mon, 17 May 2021 15:49:45 +0200 (CEST)
Received: from [172.25.230.103] (po15451.idsi0.si.c-s.fr [172.25.230.103])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 35CF58B7A5;
 Mon, 17 May 2021 15:49:45 +0200 (CEST)
Subject: Re: [PATCH 01/14] powerpc: remove interrupt exit helpers unused
 argument
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
References: <20210315220402.260594-1-npiggin@gmail.com>
 <20210315220402.260594-2-npiggin@gmail.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <ad170627-499a-5b8f-2d5d-197a157c33d7@csgroup.eu>
Date: Mon, 17 May 2021 15:49:06 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210315220402.260594-2-npiggin@gmail.com>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 15/03/2021 à 23:03, Nicholas Piggin a écrit :
> The msr argument is not used, remove it.

And why not use it instead of re-reading regs->msr ?

> 
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>   arch/powerpc/include/asm/asm-prototypes.h | 4 ++--
>   arch/powerpc/kernel/interrupt.c           | 4 ++--
>   2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/powerpc/include/asm/asm-prototypes.h b/arch/powerpc/include/asm/asm-prototypes.h
> index 1c7b75834e04..95492655462e 100644
> --- a/arch/powerpc/include/asm/asm-prototypes.h
> +++ b/arch/powerpc/include/asm/asm-prototypes.h
> @@ -71,8 +71,8 @@ void __init machine_init(u64 dt_ptr);
>   #endif
>   long system_call_exception(long r3, long r4, long r5, long r6, long r7, long r8, unsigned long r0, struct pt_regs *regs);
>   notrace unsigned long syscall_exit_prepare(unsigned long r3, struct pt_regs *regs, long scv);
> -notrace unsigned long interrupt_exit_user_prepare(struct pt_regs *regs, unsigned long msr);
> -notrace unsigned long interrupt_exit_kernel_prepare(struct pt_regs *regs, unsigned long msr);
> +notrace unsigned long interrupt_exit_user_prepare(struct pt_regs *regs);
> +notrace unsigned long interrupt_exit_kernel_prepare(struct pt_regs *regs);
>   
>   long ppc_fadvise64_64(int fd, int advice, u32 offset_high, u32 offset_low,
>   		      u32 len_high, u32 len_low);
> diff --git a/arch/powerpc/kernel/interrupt.c b/arch/powerpc/kernel/interrupt.c
> index 96ca27ef68ae..efeeefe6ee8f 100644
> --- a/arch/powerpc/kernel/interrupt.c
> +++ b/arch/powerpc/kernel/interrupt.c
> @@ -359,7 +359,7 @@ notrace unsigned long syscall_exit_prepare(unsigned long r3,
>   	return ret;
>   }
>   
> -notrace unsigned long interrupt_exit_user_prepare(struct pt_regs *regs, unsigned long msr)
> +notrace unsigned long interrupt_exit_user_prepare(struct pt_regs *regs)
>   {
>   	unsigned long ti_flags;
>   	unsigned long flags;
> @@ -443,7 +443,7 @@ notrace unsigned long interrupt_exit_user_prepare(struct pt_regs *regs, unsigned
>   
>   void preempt_schedule_irq(void);
>   
> -notrace unsigned long interrupt_exit_kernel_prepare(struct pt_regs *regs, unsigned long msr)
> +notrace unsigned long interrupt_exit_kernel_prepare(struct pt_regs *regs)
>   {
>   	unsigned long flags;
>   	unsigned long ret = 0;
> 
