Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E1C7E2F8490
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Jan 2021 19:38:04 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DHVL12MzFzDvW3
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Jan 2021 05:38:01 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DHSVM3gr2zDqBW
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 16 Jan 2021 04:15:04 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4DHSVC2B8Wz9v053;
 Fri, 15 Jan 2021 18:14:59 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id zt_lXqBBhdLS; Fri, 15 Jan 2021 18:14:59 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4DHSVC0c9fz9tyHt;
 Fri, 15 Jan 2021 18:14:59 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 487BA8B82F;
 Fri, 15 Jan 2021 18:14:59 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 5BYp5kKvInJg; Fri, 15 Jan 2021 18:14:59 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 28E438B82C;
 Fri, 15 Jan 2021 18:14:57 +0100 (CET)
Subject: Re: [PATCH v6 17/39] powerpc/fsl_booke/32: CacheLockingException
 remove args
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
References: <20210115165012.1260253-1-npiggin@gmail.com>
 <20210115165012.1260253-18-npiggin@gmail.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <1bd92a69-71ab-cc7f-fec5-e2a67830c81b@csgroup.eu>
Date: Fri, 15 Jan 2021 18:14:55 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210115165012.1260253-18-npiggin@gmail.com>
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



Le 15/01/2021 à 17:49, Nicholas Piggin a écrit :
> Like other interrupt handler conversions, switch to getting registers
> from the pt_regs argument.
> 
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>   arch/powerpc/kernel/head_fsl_booke.S | 6 +++---
>   arch/powerpc/kernel/traps.c          | 5 +++--
>   2 files changed, 6 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/powerpc/kernel/head_fsl_booke.S b/arch/powerpc/kernel/head_fsl_booke.S
> index fdd4d274c245..0d4d9a6fcca1 100644
> --- a/arch/powerpc/kernel/head_fsl_booke.S
> +++ b/arch/powerpc/kernel/head_fsl_booke.S
> @@ -364,12 +364,12 @@ interrupt_base:
>   	/* Data Storage Interrupt */
>   	START_EXCEPTION(DataStorage)
>   	NORMAL_EXCEPTION_PROLOG(DATA_STORAGE)
> -	mfspr	r5,SPRN_ESR		/* Grab the ESR, save it, pass arg3 */
> +	mfspr	r5,SPRN_ESR		/* Grab the ESR, save it3 */
>   	stw	r5,_ESR(r11)
> -	mfspr	r4,SPRN_DEAR		/* Grab the DEAR, save it, pass arg2 */
> +	mfspr	r4,SPRN_DEAR		/* Grab the DEAR, save it */
> +	stw	r4, _DEAR(r11)
>   	andis.	r10,r5,(ESR_ILK|ESR_DLK)@h
>   	bne	1f
> -	stw	r4, _DEAR(r11)
>   	EXC_XFER_LITE(0x0300, handle_page_fault)
>   1:
>   	addi	r3,r1,STACK_FRAME_OVERHEAD

Why isn't the above done in patch 5 ?


> diff --git a/arch/powerpc/kernel/traps.c b/arch/powerpc/kernel/traps.c
> index 639bcafbad5e..1af52a4bce1f 100644
> --- a/arch/powerpc/kernel/traps.c
> +++ b/arch/powerpc/kernel/traps.c
> @@ -2105,9 +2105,10 @@ void altivec_assist_exception(struct pt_regs *regs)
>   #endif /* CONFIG_ALTIVEC */
>   
>   #ifdef CONFIG_FSL_BOOKE
> -void CacheLockingException(struct pt_regs *regs, unsigned long address,
> -			   unsigned long error_code)
> +void CacheLockingException(struct pt_regs *regs)
>   {
> +	unsigned long error_code = regs->dsisr;
> +
>   	/* We treat cache locking instructions from the user
>   	 * as priv ops, in the future we could try to do
>   	 * something smarter
> 
