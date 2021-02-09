Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 959433151DA
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Feb 2021 15:43:06 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DZlxK6McMzDvVj
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Feb 2021 01:43:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DZlj22NS9zDsmv
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Feb 2021 01:32:21 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4DZlhv0RfBz9v4gr;
 Tue,  9 Feb 2021 15:32:15 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id fOs53EM4PmCr; Tue,  9 Feb 2021 15:32:14 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4DZlht6RVKz9v4gp;
 Tue,  9 Feb 2021 15:32:14 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 489CD8B764;
 Tue,  9 Feb 2021 15:32:16 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id t8r2w_52bFFl; Tue,  9 Feb 2021 15:32:16 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id BCB058B7E7;
 Tue,  9 Feb 2021 15:32:15 +0100 (CET)
Subject: Re: [PATCH v5 19/22] powerpc/syscall: Optimise checks in beginning of
 system_call_exception()
To: Nicholas Piggin <npiggin@gmail.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Michael Ellerman <mpe@ellerman.id.au>, msuchanek@suse.de,
 Paul Mackerras <paulus@samba.org>
References: <cover.1612796617.git.christophe.leroy@csgroup.eu>
 <3e48bb439357c6f72ae4343bf93bd29f0980eeb1.1612796617.git.christophe.leroy@csgroup.eu>
 <1612836170.502t0sssvi.astroid@bobo.none>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <bd96ae5e-d4f7-8b3c-7617-adc15ab9e73e@csgroup.eu>
Date: Tue, 9 Feb 2021 15:32:15 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <1612836170.502t0sssvi.astroid@bobo.none>
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



Le 09/02/2021 à 03:06, Nicholas Piggin a écrit :
> Excerpts from Christophe Leroy's message of February 9, 2021 1:10 am:
>> Combine all tests of regs->msr into a single logical one.
> 
> Okay by me unless we choose to do the config option and put these all
> under it. I think I would prefer that because sometimes the registers
> are in a state you can't easily see what the values in the expression
> were. In this case it doesn't matter so much because they should be in
> regs in the interrupt frame.

Yes indeed. I reword the commit log and tell that.

> 
> Thanks,
> Nick
> 
>>
>> Before the patch:
>>
>>     0:	81 6a 00 84 	lwz     r11,132(r10)
>>     4:	90 6a 00 88 	stw     r3,136(r10)
>>     8:	69 60 00 02 	xori    r0,r11,2
>>     c:	54 00 ff fe 	rlwinm  r0,r0,31,31,31
>>    10:	0f 00 00 00 	twnei   r0,0
>>    14:	69 63 40 00 	xori    r3,r11,16384
>>    18:	54 63 97 fe 	rlwinm  r3,r3,18,31,31
>>    1c:	0f 03 00 00 	twnei   r3,0
>>    20:	69 6b 80 00 	xori    r11,r11,32768
>>    24:	55 6b 8f fe 	rlwinm  r11,r11,17,31,31
>>    28:	0f 0b 00 00 	twnei   r11,0
>>
>> After the patch:
>>
>>     0:	81 6a 00 84 	lwz     r11,132(r10)
>>     4:	90 6a 00 88 	stw     r3,136(r10)
>>     8:	7d 6b 58 f8 	not     r11,r11
>>     c:	71 6b c0 02 	andi.   r11,r11,49154
>>    10:	0f 0b 00 00 	twnei   r11,0
>>
>> 6 cycles less on powerpc 8xx (328 => 322 cycles).
>>
>> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
>> ---
>>   arch/powerpc/kernel/interrupt.c | 10 +++++++---
>>   1 file changed, 7 insertions(+), 3 deletions(-)
>>
>> diff --git a/arch/powerpc/kernel/interrupt.c b/arch/powerpc/kernel/interrupt.c
>> index 55e1aa18cdb9..8c38e8c95be2 100644
>> --- a/arch/powerpc/kernel/interrupt.c
>> +++ b/arch/powerpc/kernel/interrupt.c
>> @@ -28,6 +28,7 @@ notrace long system_call_exception(long r3, long r4, long r5,
>>   				   unsigned long r0, struct pt_regs *regs)
>>   {
>>   	syscall_fn f;
>> +	unsigned long expected_msr;
>>   
>>   	regs->orig_gpr3 = r3;
>>   
>> @@ -39,10 +40,13 @@ notrace long system_call_exception(long r3, long r4, long r5,
>>   
>>   	trace_hardirqs_off(); /* finish reconciling */
>>   
>> +	expected_msr = MSR_PR;
>>   	if (!IS_ENABLED(CONFIG_BOOKE) && !IS_ENABLED(CONFIG_40x))
>> -		BUG_ON(!(regs->msr & MSR_RI));
>> -	BUG_ON(!(regs->msr & MSR_PR));
>> -	BUG_ON(arch_irq_disabled_regs(regs));
>> +		expected_msr |= MSR_RI;
>> +	if (IS_ENABLED(CONFIG_PPC32))
>> +		expected_msr |= MSR_EE;
>> +	BUG_ON((regs->msr & expected_msr) ^ expected_msr);
>> +	BUG_ON(IS_ENABLED(CONFIG_PPC64) && arch_irq_disabled_regs(regs));
>>   
>>   #ifdef CONFIG_PPC_PKEY
>>   	if (mmu_has_feature(MMU_FTR_PKEY)) {
>> -- 
>> 2.25.0
>>
>>
