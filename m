Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E24B147886
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Jan 2020 07:21:42 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 483pv72v71zDqc4
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Jan 2020 17:21:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.a=rsa-sha256
 header.s=mail header.b=B3tYO+IX; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 483psH4xJ0zDqZX
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Jan 2020 17:20:02 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 483ps90bGsz9tyN9;
 Fri, 24 Jan 2020 07:19:57 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=B3tYO+IX; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id 7SaMKq5HTQxC; Fri, 24 Jan 2020 07:19:57 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 483ps86TpLz9tyN8;
 Fri, 24 Jan 2020 07:19:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1579846796; bh=YJFbIn49LUjyyL3eY69FHgX3OucyQp9C2UfhkfTmtGk=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=B3tYO+IX1eaGa/tBM5MzdTzu2zt8MRpIpEtXSMGdWQSInxAYOQWO2r5q5jwAKlYEq
 /9deN/rqdg0kfFOEOQFqyujuPtq3Qcesi2Cbx1dKZnYuj1PEzJBM++qSOF8j+78ezD
 Kf0+NoQ4sJZ5XhDHwEcfySKha7HUOJ7xrGb45QEk=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id A8EDA8B83B;
 Fri, 24 Jan 2020 07:19:57 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id O_VMfi4oHwrT; Fri, 24 Jan 2020 07:19:57 +0100 (CET)
Received: from [172.25.230.111] (po15451.idsi0.si.c-s.fr [172.25.230.111])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 790B98B768;
 Fri, 24 Jan 2020 07:19:57 +0100 (CET)
Subject: Re: [PATCH 1/2] powerpc/irq: don't use current_stack_pointer() in
 check_stack_overflow()
To: Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>
References: <bae3e75a0c7f9037e4012ee547842c04cd527931.1575871613.git.christophe.leroy@c-s.fr>
 <87d0b9iez3.fsf@mpe.ellerman.id.au>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <f4196f83-82ac-4df0-8c15-267a2c6c07ba@c-s.fr>
Date: Fri, 24 Jan 2020 07:19:57 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <87d0b9iez3.fsf@mpe.ellerman.id.au>
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



Le 24/01/2020 à 06:46, Michael Ellerman a écrit :
> Christophe Leroy <christophe.leroy@c-s.fr> writes:
> 
>> current_stack_pointer() doesn't return the stack pointer, but the
>> caller's stack frame. See commit bfe9a2cfe91a ("powerpc: Reimplement
>> __get_SP() as a function not a define") and commit acf620ecf56c
>> ("powerpc: Rename __get_SP() to current_stack_pointer()") for details.
>>
>> The purpose of check_stack_overflow() is to verify that the stack has
>> not overflowed.
>>
>> To really know whether the stack pointer is still within boundaries,
>> the check must be done directly on the value of r1.
>>
>> Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
>> ---
>>   arch/powerpc/kernel/irq.c | 5 ++---
>>   1 file changed, 2 insertions(+), 3 deletions(-)
>>
>> diff --git a/arch/powerpc/kernel/irq.c b/arch/powerpc/kernel/irq.c
>> index bb34005ff9d2..4d468d835558 100644
>> --- a/arch/powerpc/kernel/irq.c
>> +++ b/arch/powerpc/kernel/irq.c
>> @@ -599,9 +599,8 @@ u64 arch_irq_stat_cpu(unsigned int cpu)
>>   static inline void check_stack_overflow(void)
>>   {
>>   #ifdef CONFIG_DEBUG_STACKOVERFLOW
>> -	long sp;
>> -
>> -	sp = current_stack_pointer() & (THREAD_SIZE-1);
>> +	register unsigned long r1 asm("r1");
>> +	long sp = r1 & (THREAD_SIZE - 1);
> 
> This appears to work but seems to be "unsupported" by GCC, and clang
> actually complains about it:
> 
>    /linux/arch/powerpc/kernel/irq.c:603:12: error: variable 'r1' is uninitialized when used here [-Werror,-Wuninitialized]
>            long sp = r1 & (THREAD_SIZE - 1);
>                      ^~
> 
> The GCC docs say:
> 
>    The only supported use for this feature is to specify registers for
>    input and output operands when calling Extended asm (see Extended
>    Asm).
> 
> https://gcc.gnu.org/onlinedocs/gcc-9.1.0/gcc/Local-Register-Variables.html#Local-Register-Variables
> 
> 
> If I do this it seems to work, but feels a little dicey:
> 
> 	asm ("" : "=r" (r1));
> 	sp = r1 & (THREAD_SIZE - 1);


Or we could do add in asm/reg.h what we have in boot/reg.h:

register void *__stack_pointer asm("r1");
#define get_sp()	(__stack_pointer)

And use get_sp()

I'll try it.

Christophe
