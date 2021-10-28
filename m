Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 27BF643E2B2
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Oct 2021 15:53:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hg6TB0Q5vz3bTS
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Oct 2021 00:53:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hg6SZ0X1Qz2ypB
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Oct 2021 00:52:28 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4Hg6SS04VKz9sT4;
 Thu, 28 Oct 2021 15:52:24 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id v_WlRkqguoYP; Thu, 28 Oct 2021 15:52:23 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4Hg6SN3Tsvz9sSx;
 Thu, 28 Oct 2021 15:52:20 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 646DA8B787;
 Thu, 28 Oct 2021 15:52:20 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id t25_IpDe294L; Thu, 28 Oct 2021 15:52:20 +0200 (CEST)
Received: from [192.168.232.219] (unknown [192.168.232.219])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 277C68B763;
 Thu, 28 Oct 2021 15:52:20 +0200 (CEST)
Message-ID: <89fbff81-f70f-9e3e-eb5b-de7969b20638@csgroup.eu>
Date: Thu, 28 Oct 2021 15:52:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH] powerpc/32e: Ignore ESR in instruction storage interrupt
 handler
Content-Language: fr-FR
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
References: <20211028133043.4159501-1-npiggin@gmail.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <20211028133043.4159501-1-npiggin@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: Jacques de Laval <jacques.delaval@protonmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 28/10/2021 à 15:30, Nicholas Piggin a écrit :
> A e5500 machine running a 32-bit kernel sometimes hangs at boot,
> seemingly going into an infinite loop of instruction storage interrupts.
> The ESR SPR has a value of 0x800000 (store) when this happens, which is
> likely set by a previous store. An instruction TLB miss interrupt would
> then leave ESR unchanged, and if no PTE exists it calls directly to the
> instruction storage interrupt handler without changing ESR.
> 
> access_error() does not cause a segfault due to a store to a read-only
> vma because is_exec is true. Most subsequent fault handling does not
> check for a write fault on a read-only vma, and might do strange things
> like create a writeable PTE or call page_mkwrite on a read only vma or
> file. It's not clear what happens here to cause the infinite faulting in
> this case, a fault handler failure or low level PTE or TLB handling.
> 
> In any case this can be fixed by having the instruction storage
> interrupt zero regs->dsisr rather than storing the ESR value to it.
> 
> Link: https://lore.kernel.org/linuxppc-dev/1635306738.0z8wt7619v.astroid@bobo.none/
> Fixes: a01a3f2ddbcd ("powerpc: remove arguments from fault handler functions")

Should it go to stable as well ?

> Reported-by: Jacques de Laval <jacques.delaval@protonmail.com>
> Tested-by: Jacques de Laval <jacques.delaval@protonmail.com>
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>

Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>

> ---
>   arch/powerpc/kernel/head_booke.h | 15 ++++++++++++---
>   1 file changed, 12 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/powerpc/kernel/head_booke.h b/arch/powerpc/kernel/head_booke.h
> index e5503420b6c6..ef8d1b1c234e 100644
> --- a/arch/powerpc/kernel/head_booke.h
> +++ b/arch/powerpc/kernel/head_booke.h
> @@ -465,12 +465,21 @@ ALT_FTR_SECTION_END_IFSET(CPU_FTR_EMB_HV)
>   	bl	do_page_fault;						      \
>   	b	interrupt_return
>   
> +/*
> + * Instruction TLB Error interrupt handlers may call InstructionStorage
> + * directly without clearing ESR, so the ESR at this point may be left over
> + * from a prior interrupt.
> + *
> + * In any case, do_page_fault for BOOK3E does not use ESR and always expects
> + * dsisr to be 0. ESR_DST from a prior store in particular would confuse fault
> + * handling.
> + */
>   #define INSTRUCTION_STORAGE_EXCEPTION					      \
>   	START_EXCEPTION(InstructionStorage)				      \
> -	NORMAL_EXCEPTION_PROLOG(0x400, INST_STORAGE);		      \
> -	mfspr	r5,SPRN_ESR;		/* Grab the ESR and save it */	      \
> +	NORMAL_EXCEPTION_PROLOG(0x400, INST_STORAGE);			      \
> +	li	r5,0;			/* Store 0 in regs->esr (dsisr) */    \
>   	stw	r5,_ESR(r11);						      \
> -	stw	r12, _DEAR(r11);	/* Pass SRR0 as arg2 */		      \
> +	stw	r12, _DEAR(r11);	/* Set regs->dear (dar) to SRR0 */    \
>   	prepare_transfer_to_handler;					      \
>   	bl	do_page_fault;						      \
>   	b	interrupt_return
> 
