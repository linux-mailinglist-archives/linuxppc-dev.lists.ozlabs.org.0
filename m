Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id AFFBF3151BB
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Feb 2021 15:35:26 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DZlmW1x4nzDvWJ
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Feb 2021 01:35:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DZlgh6D7LzDsgM
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Feb 2021 01:31:07 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4DZlgV2BM4z9v4gr;
 Tue,  9 Feb 2021 15:31:02 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id bnKYf9L8xKhB; Tue,  9 Feb 2021 15:31:02 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4DZlgV18f4z9v4gp;
 Tue,  9 Feb 2021 15:31:02 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 86B318B7E7;
 Tue,  9 Feb 2021 15:31:03 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id oydW9FnggjEP; Tue,  9 Feb 2021 15:31:03 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id F22898B764;
 Tue,  9 Feb 2021 15:31:02 +0100 (CET)
Subject: Re: [PATCH v5 18/22] powerpc/syscall: Remove FULL_REGS verification
 in system_call_exception
To: Nicholas Piggin <npiggin@gmail.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Michael Ellerman <mpe@ellerman.id.au>, msuchanek@suse.de,
 Paul Mackerras <paulus@samba.org>
References: <cover.1612796617.git.christophe.leroy@csgroup.eu>
 <6bef4d9ba0cba50160d13e344ee4627ebdf801dc.1612796617.git.christophe.leroy@csgroup.eu>
 <1612836023.l122pe2n2b.astroid@bobo.none>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <cc1a35a4-07c3-9e64-18d6-57e497f56e33@csgroup.eu>
Date: Tue, 9 Feb 2021 15:31:02 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <1612836023.l122pe2n2b.astroid@bobo.none>
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



Le 09/02/2021 à 03:02, Nicholas Piggin a écrit :
> Excerpts from Christophe Leroy's message of February 9, 2021 1:10 am:
>> For book3s/64, FULL_REGS() is 'true' at all time, so the test voids.
>> For others, non volatile registers are saved inconditionally.
>>
>> So the verification is pointless.
>>
>> Should one fail to do it, it would anyway be caught by the
>> CHECK_FULL_REGS() in copy_thread() as we have removed the
>> special versions ppc_fork() and friends.
>>
>> null_syscall benchmark reduction 4 cycles (332 => 328 cycles)
> 
> I wonder if we rather make a CONFIG option for a bunch of these simpler
> debug checks here (and also in interrupt exit, wrappers, etc) rather
> than remove them entirely.

We can drop this patch if you prefer. Anyway, like book3s/64, once ppc32 also do interrupt 
entry/exit in C, FULL_REGS() will already return true.

Christophe


> 
> Thanks,
> Nick
> 
>>
>> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
>> ---
>>   arch/powerpc/kernel/interrupt.c | 1 -
>>   1 file changed, 1 deletion(-)
>>
>> diff --git a/arch/powerpc/kernel/interrupt.c b/arch/powerpc/kernel/interrupt.c
>> index 8fafca727b8b..55e1aa18cdb9 100644
>> --- a/arch/powerpc/kernel/interrupt.c
>> +++ b/arch/powerpc/kernel/interrupt.c
>> @@ -42,7 +42,6 @@ notrace long system_call_exception(long r3, long r4, long r5,
>>   	if (!IS_ENABLED(CONFIG_BOOKE) && !IS_ENABLED(CONFIG_40x))
>>   		BUG_ON(!(regs->msr & MSR_RI));
>>   	BUG_ON(!(regs->msr & MSR_PR));
>> -	BUG_ON(!FULL_REGS(regs));
>>   	BUG_ON(arch_irq_disabled_regs(regs));
>>   
>>   #ifdef CONFIG_PPC_PKEY
>> -- 
>> 2.25.0
>>
>>
