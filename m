Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8107B313B60
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Feb 2021 18:47:32 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DZD4d69tDzDvWn
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Feb 2021 04:47:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DZD2p69LczDsYv
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Feb 2021 04:45:50 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4DZD2Y6zHczB09Zd;
 Mon,  8 Feb 2021 18:45:41 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id z9XvfDdZeQx8; Mon,  8 Feb 2021 18:45:41 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4DZD2Y5dQyzB09Zc;
 Mon,  8 Feb 2021 18:45:41 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 124FA8B7B3;
 Mon,  8 Feb 2021 18:45:47 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id mulnNqzZwS1z; Mon,  8 Feb 2021 18:45:46 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 621BF8B7B2;
 Mon,  8 Feb 2021 18:45:46 +0100 (CET)
Subject: Re: [PATCH v4 20/23] powerpc/syscall: Do not check unsupported scv
 vector on PPC32
To: Nicholas Piggin <npiggin@gmail.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Michael Ellerman <mpe@ellerman.id.au>, msuchanek@suse.de,
 Paul Mackerras <paulus@samba.org>
References: <cover.1611585031.git.christophe.leroy@csgroup.eu>
 <f02af988a86f7e83b6492df7c4fa1b53bcd1919b.1611585031.git.christophe.leroy@csgroup.eu>
 <1611656145.efq1cxcpts.astroid@bobo.none>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <5ef4a309-5f31-a175-1247-d9a3083aa389@csgroup.eu>
Date: Mon, 8 Feb 2021 18:45:43 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <1611656145.efq1cxcpts.astroid@bobo.none>
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



Le 26/01/2021 à 11:16, Nicholas Piggin a écrit :
> Excerpts from Christophe Leroy's message of January 26, 2021 12:48 am:
>> Only PPC64 has scv. No need to check the 0x7ff0 trap on PPC32.
>>
>> And ignore the scv parameter in syscall_exit_prepare (Save 14 cycles
>> 346 => 332 cycles)
>>
>> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
>> ---
>>   arch/powerpc/kernel/entry_32.S | 1 -
>>   arch/powerpc/kernel/syscall.c  | 7 +++++--
>>   2 files changed, 5 insertions(+), 3 deletions(-)
>>
>> diff --git a/arch/powerpc/kernel/entry_32.S b/arch/powerpc/kernel/entry_32.S
>> index 9922a04650f7..6ae9c7bcb06c 100644
>> --- a/arch/powerpc/kernel/entry_32.S
>> +++ b/arch/powerpc/kernel/entry_32.S
>> @@ -343,7 +343,6 @@ transfer_to_syscall:
>>   
>>   ret_from_syscall:
>>   	addi    r4,r1,STACK_FRAME_OVERHEAD
>> -	li	r5,0
>>   	bl	syscall_exit_prepare
>>   #if defined(CONFIG_4xx) || defined(CONFIG_BOOKE)
>>   	/* If the process has its own DBCR0 value, load it up.  The internal
>> diff --git a/arch/powerpc/kernel/syscall.c b/arch/powerpc/kernel/syscall.c
>> index 476909b11051..30f8a397a522 100644
>> --- a/arch/powerpc/kernel/syscall.c
>> +++ b/arch/powerpc/kernel/syscall.c
>> @@ -86,7 +86,7 @@ notrace long system_call_exception(long r3, long r4, long r5,
>>   	local_irq_enable();
>>   
>>   	if (unlikely(current_thread_info()->flags & _TIF_SYSCALL_DOTRACE)) {
>> -		if (unlikely(regs->trap == 0x7ff0)) {
>> +		if (IS_ENABLED(CONFIG_PPC64) && unlikely(regs->trap == 0x7ff0)) {
>>   			/* Unsupported scv vector */
>>   			_exception(SIGILL, regs, ILL_ILLOPC, regs->nip);
>>   			return regs->gpr[3];
>> @@ -109,7 +109,7 @@ notrace long system_call_exception(long r3, long r4, long r5,
>>   		r8 = regs->gpr[8];
>>   
>>   	} else if (unlikely(r0 >= NR_syscalls)) {
>> -		if (unlikely(regs->trap == 0x7ff0)) {
>> +		if (IS_ENABLED(CONFIG_PPC64) && unlikely(regs->trap == 0x7ff0)) {
> 
> Perhaps this could be hidden behind a function like trap_is_scv()?
> 
> trap_is_unsupported_scv() ?
> 

Ok, I did that in v5

Thanks
Christophe
