Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A6372AA441
	for <lists+linuxppc-dev@lfdr.de>; Sat,  7 Nov 2020 10:45:16 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CSsn51KzszDrQM
	for <lists+linuxppc-dev@lfdr.de>; Sat,  7 Nov 2020 20:45:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=csgroup.eu
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CSsld1KthzDqmY
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  7 Nov 2020 20:43:46 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4CSslK4bSVz9txgs;
 Sat,  7 Nov 2020 10:43:41 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id Wh7uzJ3QABxN; Sat,  7 Nov 2020 10:43:41 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4CSslK3n7pz9txgr;
 Sat,  7 Nov 2020 10:43:41 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id AFBCF8B776;
 Sat,  7 Nov 2020 10:43:42 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id omV7QgTch865; Sat,  7 Nov 2020 10:43:42 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 620688B75B;
 Sat,  7 Nov 2020 10:43:42 +0100 (CET)
Subject: Re: [PATCH 18/18] powerpc/64s: move power4 idle entirely to C
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
References: <20201105143431.1874789-1-npiggin@gmail.com>
 <20201105143431.1874789-19-npiggin@gmail.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <7de6fd21-da79-fe8f-5db4-f99ee0dd7d23@csgroup.eu>
Date: Sat, 7 Nov 2020 10:43:45 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201105143431.1874789-19-npiggin@gmail.com>
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



Le 05/11/2020 à 15:34, Nicholas Piggin a écrit :
> Christophe asked about doing this, most of the code is still in
> asm but maybe it's slightly nicer? I don't know if it's worthwhile.

Heu... I don't think I was asking for that, but why not, see later comments.

At first I was just asking to write the following in C:

+
+	.globl power4_idle_nap_return
+power4_idle_nap_return:
+	blr


In extenso, instead of the above do somewhere something like:

void power4_idle_nap_return(void)
{
}


> ---
>   arch/powerpc/kernel/idle.c        | 25 ++++++++++++++++++++-----
>   arch/powerpc/kernel/idle_book3s.S | 22 ----------------------
>   2 files changed, 20 insertions(+), 27 deletions(-)
> 
> diff --git a/arch/powerpc/kernel/idle.c b/arch/powerpc/kernel/idle.c
> index ae0e2632393d..849e77a45915 100644
> --- a/arch/powerpc/kernel/idle.c
> +++ b/arch/powerpc/kernel/idle.c
> @@ -72,6 +72,9 @@ int powersave_nap;
>   #ifdef CONFIG_PPC_970_NAP
>   void power4_idle(void)
>   {
> +	unsigned long msr_idle = MSR_KERNEL|MSR_EE|MSR_POW;
> +	unsigned long tmp1, tmp2;
> +
>   	if (!cpu_has_feature(CPU_FTR_CAN_NAP))
>   		return;
>   
> @@ -84,13 +87,25 @@ void power4_idle(void)
>   	if (cpu_has_feature(CPU_FTR_ALTIVEC))
>   		asm volatile("DSSALL ; sync" ::: "memory");
>   
> -	power4_idle_nap();
> -
> +	asm volatile(
> +"	ld	%0,PACA_THREAD_INFO(r13)		\n"
> +"	ld	%1,TI_LOCAL_FLAGS(%0)			\n"
> +"	ori	%1,%1,_TLF_NAPPING			\n"
> +"	std	%1,TI_LOCAL_FLAGS(%0)			\n"

Can't this just be:

	current_thread_info()->local_flags |= _TLF_NAPPING;

>   	/*
> -	 * power4_idle_nap returns with interrupts enabled (soft and hard).
> -	 * to our caller with interrupts enabled (soft and hard). Our caller
> -	 * can cope with either interrupts disabled or enabled upon return.
> +	 * NAPPING bit is set, from this point onward nap_adjust_return()
> +	 * will cause interrupts to return to power4_idle_nap_return.
>   	 */
> +"1:	sync						\n"
> +"	isync						\n"
> +"	mtmsrd	%2					\n"
> +"	isync						\n"
> +"	b	1b					\n"

And this:

	for (;;) {
		mb();
		isync();
		mtmsr(MSR_KERNEL|MSR_EE|MSR_POW);
		isync();
	}


> +"	.globl power4_idle_nap_return			\n"
> +"power4_idle_nap_return:				\n"
> +	: "=r"(tmp1), "=r"(tmp2)
> +	: "r"(msr_idle)
> +	);
>   }
>   #endif
>   

Christophe
