Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4802E2F8C13
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Jan 2021 08:40:36 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DHqhp4M58zDqHR
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Jan 2021 18:40:26 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DHqfp1wylzDqHR
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 16 Jan 2021 18:38:35 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4DHqfW6kffz9tycq;
 Sat, 16 Jan 2021 08:38:27 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id dgZUTJ_DadIz; Sat, 16 Jan 2021 08:38:27 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4DHqfW5BkmzB09bR;
 Sat, 16 Jan 2021 08:38:27 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id A112D8B770;
 Sat, 16 Jan 2021 08:38:28 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id LLJ8lr1HtzWW; Sat, 16 Jan 2021 08:38:28 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 5F21C8B75B;
 Sat, 16 Jan 2021 08:38:28 +0100 (CET)
Subject: Re: [PATCH v6 17/39] powerpc/fsl_booke/32: CacheLockingException
 remove args
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
References: <20210115165012.1260253-1-npiggin@gmail.com>
 <20210115165012.1260253-18-npiggin@gmail.com>
 <1bd92a69-71ab-cc7f-fec5-e2a67830c81b@csgroup.eu>
 <1610757796.o87kxvdq5e.astroid@bobo.none>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <0d953b03-b908-0fd6-61bf-d0e461312874@csgroup.eu>
Date: Sat, 16 Jan 2021 08:38:17 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <1610757796.o87kxvdq5e.astroid@bobo.none>
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



Le 16/01/2021 à 01:43, Nicholas Piggin a écrit :
> Excerpts from Christophe Leroy's message of January 16, 2021 3:14 am:
>>
>>
>> Le 15/01/2021 à 17:49, Nicholas Piggin a écrit :
>>> Like other interrupt handler conversions, switch to getting registers
>>> from the pt_regs argument.
>>>
>>> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
>>> ---
>>>    arch/powerpc/kernel/head_fsl_booke.S | 6 +++---
>>>    arch/powerpc/kernel/traps.c          | 5 +++--
>>>    2 files changed, 6 insertions(+), 5 deletions(-)
>>>
>>> diff --git a/arch/powerpc/kernel/head_fsl_booke.S b/arch/powerpc/kernel/head_fsl_booke.S
>>> index fdd4d274c245..0d4d9a6fcca1 100644
>>> --- a/arch/powerpc/kernel/head_fsl_booke.S
>>> +++ b/arch/powerpc/kernel/head_fsl_booke.S
>>> @@ -364,12 +364,12 @@ interrupt_base:
>>>    	/* Data Storage Interrupt */
>>>    	START_EXCEPTION(DataStorage)
>>>    	NORMAL_EXCEPTION_PROLOG(DATA_STORAGE)
>>> -	mfspr	r5,SPRN_ESR		/* Grab the ESR, save it, pass arg3 */
>>> +	mfspr	r5,SPRN_ESR		/* Grab the ESR, save it3 */
>>>    	stw	r5,_ESR(r11)
>>> -	mfspr	r4,SPRN_DEAR		/* Grab the DEAR, save it, pass arg2 */
>>> +	mfspr	r4,SPRN_DEAR		/* Grab the DEAR, save it */
>>> +	stw	r4, _DEAR(r11)
>>>    	andis.	r10,r5,(ESR_ILK|ESR_DLK)@h
>>>    	bne	1f
>>> -	stw	r4, _DEAR(r11)
>>>    	EXC_XFER_LITE(0x0300, handle_page_fault)
>>>    1:
>>>    	addi	r3,r1,STACK_FRAME_OVERHEAD
>>
>> Why isn't the above done in patch 5 ?
> 
> I don't think it's required there, is it?

Ah yes, moving the 'stw' is needed only here.

But the comments changes belong to patch 5, you have done exactly similar changes there in 
kernel/head_40x.S

By the way, I think patch 17 could immediately follow patch 5 and patch 18 could follow patch 6.

> 
> Thanks,
> Nick
> 
