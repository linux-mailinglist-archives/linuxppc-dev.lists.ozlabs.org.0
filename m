Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D025B2F0D0D
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Jan 2021 07:58:49 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DDl125cbkzDqXL
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Jan 2021 17:58:46 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DDkzS1sLxzDqP9
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 11 Jan 2021 17:57:18 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4DDkz86g5jz9vBmm;
 Mon, 11 Jan 2021 07:57:08 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id RpWUxy8JRXa2; Mon, 11 Jan 2021 07:57:08 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4DDkz857YNz9vBmk;
 Mon, 11 Jan 2021 07:57:08 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id A8DE18B78A;
 Mon, 11 Jan 2021 07:57:13 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 8JmCnz_6i7ZZ; Mon, 11 Jan 2021 07:57:13 +0100 (CET)
Received: from [172.25.230.103] (po15451.idsi0.si.c-s.fr [172.25.230.103])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 6CF9B8B75B;
 Mon, 11 Jan 2021 07:57:13 +0100 (CET)
Subject: Re: [PATCH v1 06/15] powerpc: Remove address and errorcode arguments
 from do_break()
To: Nicholas Piggin <npiggin@gmail.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Michael Ellerman <mpe@ellerman.id.au>, Paul Mackerras <paulus@samba.org>
References: <cover.1608641532.git.christophe.leroy@csgroup.eu>
 <0246430576c2ff0aed1d35ccbd6f44e658908102.1608641533.git.christophe.leroy@csgroup.eu>
 <1609039258.ijw9vns8wh.astroid@bobo.none>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <5332bb98-0d65-c51f-8514-04d76bf448c4@csgroup.eu>
Date: Mon, 11 Jan 2021 07:57:13 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <1609039258.ijw9vns8wh.astroid@bobo.none>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 27/12/2020 à 04:25, Nicholas Piggin a écrit :
> Excerpts from Christophe Leroy's message of December 22, 2020 11:28 pm:
>> Let do_break() retrieve address and errorcode from regs.
>>
>> This simplifies the code and shouldn't impeed performance as
>> address and errorcode are likely still hot in the cache.
>>
>> Suggested-by: Nicholas Piggin <npiggin@gmail.com>
>> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
>> ---
>>   arch/powerpc/include/asm/debug.h     | 3 +--
>>   arch/powerpc/kernel/exceptions-64s.S | 2 --
>>   arch/powerpc/kernel/head_8xx.S       | 5 -----
>>   arch/powerpc/kernel/process.c        | 8 +++-----
>>   4 files changed, 4 insertions(+), 14 deletions(-)
>>
>> diff --git a/arch/powerpc/include/asm/debug.h b/arch/powerpc/include/asm/debug.h
>> index ec57daf87f40..0550eceab3ca 100644
>> --- a/arch/powerpc/include/asm/debug.h
>> +++ b/arch/powerpc/include/asm/debug.h
>> @@ -52,8 +52,7 @@ extern void do_send_trap(struct pt_regs *regs, unsigned long address,
>>   			 unsigned long error_code, int brkpt);
>>   #else
>>   
>> -extern void do_break(struct pt_regs *regs, unsigned long address,
>> -		     unsigned long error_code);
>> +void do_break(struct pt_regs *regs);
>>   #endif
>>   
>>   #endif /* _ASM_POWERPC_DEBUG_H */
>> diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
>> index cfbd1d690033..3ea067bcbb95 100644
>> --- a/arch/powerpc/kernel/exceptions-64s.S
>> +++ b/arch/powerpc/kernel/exceptions-64s.S
>> @@ -3262,8 +3262,6 @@ handle_page_fault:
>>   
>>   /* We have a data breakpoint exception - handle it */
>>   handle_dabr_fault:
>> -	ld      r4,_DAR(r1)
>> -	ld      r5,_DSISR(r1)
>>   	addi    r3,r1,STACK_FRAME_OVERHEAD
>>   	bl      do_break
>>   	/*
>> diff --git a/arch/powerpc/kernel/head_8xx.S b/arch/powerpc/kernel/head_8xx.S
>> index 52702f3db6df..81f3c984f50c 100644
>> --- a/arch/powerpc/kernel/head_8xx.S
>> +++ b/arch/powerpc/kernel/head_8xx.S
>> @@ -364,11 +364,6 @@ do_databreakpoint:
>>   	addi	r3,r1,STACK_FRAME_OVERHEAD
>>   	mfspr	r4,SPRN_BAR
>>   	stw	r4,_DAR(r11)
>> -#ifdef CONFIG_VMAP_STACK
>> -	lwz	r5,_DSISR(r11)
>> -#else
>> -	mfspr	r5,SPRN_DSISR
>> -#endif
> 
> I didn't think you can do this (at leastuntil after your patch 10). I have my
> !VMAP path doing mfspr r5,DSISR ; stw r3,_DSISR(r11);
> 

Yes you are right, I went too quick.

Christophe
