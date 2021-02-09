Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D3D631487F
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Feb 2021 07:14:50 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DZXfv2dCjzDsdd
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Feb 2021 17:14:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DZXdL5znjzDsbP
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Feb 2021 17:13:21 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4DZXd82KbFz9vBmK;
 Tue,  9 Feb 2021 07:13:16 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id lIQPK-AhnvjE; Tue,  9 Feb 2021 07:13:16 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4DZXd81MVVz9vBmJ;
 Tue,  9 Feb 2021 07:13:16 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id DFAB88B7CA;
 Tue,  9 Feb 2021 07:13:16 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id q0LMirB_HRbU; Tue,  9 Feb 2021 07:13:16 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 5801E8B764;
 Tue,  9 Feb 2021 07:13:16 +0100 (CET)
Subject: Re: [PATCH v5 17/22] powerpc/syscall: Do not check unsupported scv
 vector on PPC32
To: Nicholas Piggin <npiggin@gmail.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Michael Ellerman <mpe@ellerman.id.au>, msuchanek@suse.de,
 Paul Mackerras <paulus@samba.org>
References: <cover.1612796617.git.christophe.leroy@csgroup.eu>
 <fc3afe1870f943b2010805fcb045b718a638b3c6.1612796617.git.christophe.leroy@csgroup.eu>
 <1612835741.qmlhg8iwmj.astroid@bobo.none>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <82c4abb1-cb52-e856-b2dd-d7c7d48bd292@csgroup.eu>
Date: Tue, 9 Feb 2021 07:13:17 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <1612835741.qmlhg8iwmj.astroid@bobo.none>
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



Le 09/02/2021 à 03:00, Nicholas Piggin a écrit :
> Excerpts from Christophe Leroy's message of February 9, 2021 1:10 am:
>> Only PPC64 has scv. No need to check the 0x7ff0 trap on PPC32.
>> For that, add a helper trap_is_unsupported_scv() similar to
>> trap_is_scv().
>>
>> And ignore the scv parameter in syscall_exit_prepare (Save 14 cycles
>> 346 => 332 cycles)
>>
>> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
>> ---
>> v5: Added a helper trap_is_unsupported_scv()
>> ---
>>   arch/powerpc/include/asm/ptrace.h | 5 +++++
>>   arch/powerpc/kernel/entry_32.S    | 1 -
>>   arch/powerpc/kernel/interrupt.c   | 7 +++++--
>>   3 files changed, 10 insertions(+), 3 deletions(-)
>>
>> diff --git a/arch/powerpc/include/asm/ptrace.h b/arch/powerpc/include/asm/ptrace.h
>> index 58f9dc060a7b..2c842b11a924 100644
>> --- a/arch/powerpc/include/asm/ptrace.h
>> +++ b/arch/powerpc/include/asm/ptrace.h
>> @@ -229,6 +229,11 @@ static inline bool trap_is_scv(struct pt_regs *regs)
>>   	return (IS_ENABLED(CONFIG_PPC_BOOK3S_64) && TRAP(regs) == 0x3000);
>>   }
>>   
>> +static inline bool trap_is_unsupported_scv(struct pt_regs *regs)
>> +{
>> +	return (IS_ENABLED(CONFIG_PPC_BOOK3S_64) && TRAP(regs) == 0x7ff0);
>> +}
> 
> This change is good.
> 
>> +
>>   static inline bool trap_is_syscall(struct pt_regs *regs)
>>   {
>>   	return (trap_is_scv(regs) || TRAP(regs) == 0xc00);
>> diff --git a/arch/powerpc/kernel/entry_32.S b/arch/powerpc/kernel/entry_32.S
>> index cffe58e63356..7c824e8928d0 100644
>> --- a/arch/powerpc/kernel/entry_32.S
>> +++ b/arch/powerpc/kernel/entry_32.S
>> @@ -344,7 +344,6 @@ transfer_to_syscall:
>>   
>>   ret_from_syscall:
>>   	addi    r4,r1,STACK_FRAME_OVERHEAD
>> -	li	r5,0
>>   	bl	syscall_exit_prepare
> 
> For this one, I think it would be nice to do the "right" thing and make
> the function prototypes different on !64S. They could then declare a
> local const bool scv = 0.
> 
> We could have syscall_exit_prepare and syscall_exit_prepare_maybe_scv
> or something like that, 64s can use the latter one and the former can be
> a wrapper that passes constant 0 for scv. Then we don't have different
> prototypes for the same function, but you just have to make the 32-bit
> version static inline and the 64-bit version exported to asm.

You can't call a static inline function from ASM, I don't understand you.

What is wrong for you really here ? Is that the fact we leave scv random, or is that the below 
IS_ENABLED() ?

I don't mind keeping the 'li r5,0' before calling the function if you find it cleaner, the real 
performance gain is with setting scv to 0 below for PPC32 (and maybe it should be set to zero for 
book3e/64 too ?).

Other solution would be to do replace (!scv) by (!scv || !IS_ENABLED(CONFIG_PPC_BOOK3S_64)) in the 
two places it is used in syscall_exit_prepare().

Any preference ?

Thanks
Christophe

>> @@ -224,6 +224,9 @@ notrace unsigned long syscall_exit_prepare(unsigned long r3,
>>   	unsigned long ti_flags;
>>   	unsigned long ret = 0;
>>   
>> +	if (IS_ENABLED(CONFIG_PPC32))
>> +		scv = 0;
>> +
>>   	CT_WARN_ON(ct_state() == CONTEXT_USER);
>>   
>>   #ifdef CONFIG_PPC64
>> -- 
>> 2.25.0
>>
>>
