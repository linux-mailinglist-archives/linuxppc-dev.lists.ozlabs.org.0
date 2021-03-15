Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FFD133B971
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Mar 2021 15:08:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DzdYR2Kpgz30D1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Mar 2021 01:08:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DzdY613Hmz2yhG
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Mar 2021 01:07:50 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4DzdXt0sbJz9tySM;
 Mon, 15 Mar 2021 15:07:42 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id LeLhekXyjsZG; Mon, 15 Mar 2021 15:07:42 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4DzdXs73cyz9tySL;
 Mon, 15 Mar 2021 15:07:41 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 025EE8B775;
 Mon, 15 Mar 2021 15:07:47 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 9MPI2H32ESTw; Mon, 15 Mar 2021 15:07:46 +0100 (CET)
Received: from [172.25.230.100] (po15451.idsi0.si.c-s.fr [172.25.230.100])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 903F68B75B;
 Mon, 15 Mar 2021 15:07:46 +0100 (CET)
Subject: Re: [PATCH 07/10] powerpc/64e/interrupt: handle bad_page_fault in C
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
References: <20210315031716.3940350-1-npiggin@gmail.com>
 <20210315031716.3940350-8-npiggin@gmail.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <6e0873c6-7102-ff8b-1552-8ce158613fd7@csgroup.eu>
Date: Mon, 15 Mar 2021 15:07:37 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210315031716.3940350-8-npiggin@gmail.com>
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
> With non-volatile registers saved on interrupt, bad_page_fault
> can now be called by do_page_fault.
> 
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>   arch/powerpc/kernel/exceptions-64e.S | 6 ------
>   arch/powerpc/mm/fault.c              | 5 +----
>   2 files changed, 1 insertion(+), 10 deletions(-)
> 
> diff --git a/arch/powerpc/kernel/exceptions-64e.S b/arch/powerpc/kernel/exceptions-64e.S
> index a059ab3542c2..b08c84e0fa56 100644
> --- a/arch/powerpc/kernel/exceptions-64e.S
> +++ b/arch/powerpc/kernel/exceptions-64e.S
> @@ -937,12 +937,6 @@ storage_fault_common:
>   	ld	r14,PACA_EXGEN+EX_R14(r13)
>   	ld	r15,PACA_EXGEN+EX_R15(r13)
>   	bl	do_page_fault
> -	cmpdi	r3,0
> -	bne-	1f
> -	b	interrupt_return
> -	mr	r4,r3
> -	addi	r3,r1,STACK_FRAME_OVERHEAD
> -	bl	__bad_page_fault

Then __bad_page_fault() can be static now.

>   	b	interrupt_return
>   
>   /*
> diff --git a/arch/powerpc/mm/fault.c b/arch/powerpc/mm/fault.c
> index 2e54bac99a22..44833660b21d 100644
> --- a/arch/powerpc/mm/fault.c
> +++ b/arch/powerpc/mm/fault.c
> @@ -552,12 +552,9 @@ static long __do_page_fault(struct pt_regs *regs)
>   	if (likely(entry)) {
>   		instruction_pointer_set(regs, extable_fixup(entry));
>   		return 0;
> -	} else if (!IS_ENABLED(CONFIG_PPC_BOOK3E_64)) {
> +	} else {
>   		__bad_page_fault(regs, err);
>   		return 0;
> -	} else {
> -		/* 32 and 64e handle the bad page fault in asm */
> -		return err;
>   	}
>   }
>   NOKPROBE_SYMBOL(__do_page_fault);
> 
