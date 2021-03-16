Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 235AB33CE88
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Mar 2021 08:22:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F04Vj0mhvz30Pl
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Mar 2021 18:22:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F04VM5Swpz303M
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Mar 2021 18:22:02 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4F04VG5T5dz9v01x;
 Tue, 16 Mar 2021 08:21:58 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id A7mVO4PeVniJ; Tue, 16 Mar 2021 08:21:58 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4F04VG3M6kz9v01w;
 Tue, 16 Mar 2021 08:21:58 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 3F6CA8B788;
 Tue, 16 Mar 2021 08:21:59 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id qrUXsUkLu3Qg; Tue, 16 Mar 2021 08:21:59 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id EFC458B782;
 Tue, 16 Mar 2021 08:21:58 +0100 (CET)
Subject: Re: [PATCH 12/14] powerpc/64s: system call avoid setting MSR[RI]
 until we set MSR[EE]
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
References: <20210315220402.260594-1-npiggin@gmail.com>
 <20210315220402.260594-13-npiggin@gmail.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <722aeb8d-507f-6702-dd79-26242f987e3e@csgroup.eu>
Date: Tue, 16 Mar 2021 08:21:54 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210315220402.260594-13-npiggin@gmail.com>
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



Le 15/03/2021 à 23:04, Nicholas Piggin a écrit :
> This extends the MSR[RI]=0 window a little further into the system
> call in order to pair RI and EE enabling with a single mtmsrd.

Time ago, I proposed to delay that on PPC32 and Michael objected, see 
https://patchwork.ozlabs.org/project/linuxppc-dev/patch/9f9dd859d571e324c7412ed9db9da8cfba678257.1548956511.git.christophe.leroy@c-s.fr/


> 
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>   arch/powerpc/kernel/exceptions-64s.S | 2 --
>   arch/powerpc/kernel/interrupt_64.S   | 6 +++---
>   2 files changed, 3 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
> index bd0c82ac9de5..2f14ac3c377c 100644
> --- a/arch/powerpc/kernel/exceptions-64s.S
> +++ b/arch/powerpc/kernel/exceptions-64s.S
> @@ -1999,8 +1999,6 @@ END_FTR_SECTION_IFSET(CPU_FTR_REAL_LE)
>   	mtctr	r10
>   	bctr
>   	.else
> -	li	r10,MSR_RI
> -	mtmsrd 	r10,1			/* Set RI (EE=0) */
>   #ifdef CONFIG_RELOCATABLE
>   	__LOAD_HANDLER(r10, system_call_common)
>   	mtctr	r10
> diff --git a/arch/powerpc/kernel/interrupt_64.S b/arch/powerpc/kernel/interrupt_64.S
> index f28f41a1a85a..eef61800f734 100644
> --- a/arch/powerpc/kernel/interrupt_64.S
> +++ b/arch/powerpc/kernel/interrupt_64.S
> @@ -311,10 +311,10 @@ END_BTB_FLUSH_SECTION
>   	 * nothing pending. system_call_exception() will call
>   	 * trace_hardirqs_off().
>   	 */
> -	li	r11,IRQS_ALL_DISABLED
> -	li	r12,PACA_IRQ_HARD_DIS
> +	li	r11,IRQS_DISABLED
> +	li	r12,-1 /* Set MSR_EE and MSR_RI */
>   	stb	r11,PACAIRQSOFTMASK(r13)
> -	stb	r12,PACAIRQHAPPENED(r13)
> +	mtmsrd	r12,1
>   
>   	ENTER_KERNEL_SECURITY_FALLBACK
>   
> 
