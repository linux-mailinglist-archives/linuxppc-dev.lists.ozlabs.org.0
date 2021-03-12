Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F1273387BB
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Mar 2021 09:40:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DxfQd1dSKz3cVH
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Mar 2021 19:40:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DxfQJ09sdz3cKb
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Mar 2021 19:40:06 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4DxfQ81Fkcz9v0tv;
 Fri, 12 Mar 2021 09:40:00 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id Rn4VRcLedMso; Fri, 12 Mar 2021 09:40:00 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4DxfQ76Wftz9v0ts;
 Fri, 12 Mar 2021 09:39:59 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 6EA878B764;
 Fri, 12 Mar 2021 09:40:00 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 1daKeA9LbCwM; Fri, 12 Mar 2021 09:40:00 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id D60748B810;
 Fri, 12 Mar 2021 09:39:59 +0100 (CET)
Subject: Re: [PATCH v2 28/43] powerpc/64e: Call bad_page_fault() from
 do_page_fault()
To: Nicholas Piggin <npiggin@gmail.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Michael Ellerman <mpe@ellerman.id.au>, Paul Mackerras <paulus@samba.org>
References: <cover.1615291471.git.christophe.leroy@csgroup.eu>
 <b2878184d4c21faa8af55b60e52c83f391272112.1615291473.git.christophe.leroy@csgroup.eu>
 <1615339667.i88ve15v8a.astroid@bobo.none>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <6e5e8283-8aad-cf61-565b-03903e5d20b5@csgroup.eu>
Date: Fri, 12 Mar 2021 09:39:56 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <1615339667.i88ve15v8a.astroid@bobo.none>
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



Le 10/03/2021 à 02:29, Nicholas Piggin a écrit :
> Excerpts from Christophe Leroy's message of March 9, 2021 10:09 pm:
>> book3e/64 is the last one calling __bad_page_fault()
>> from assembly.
>>
>> Save non volatile registers before calling do_page_fault()
>> and modify do_page_fault() to call __bad_page_fault()
>> for all platforms.
>>
>> Then it can be refactored by the call of bad_page_fault()
>> which avoids the duplication of the exception table search.
> 
> This can go in with the 64e change after your series. I think it should
> be ready for the next merge window as well.

Yes, I thought it would pull more optimisation, but at the end it doesn't bring anythink, so I'll 
drop it for now and leave it to you for your series.

> 
> Thanks,
> Nick
> 
>>
>> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
>> ---
>>   arch/powerpc/kernel/exceptions-64e.S |  8 +-------
>>   arch/powerpc/mm/fault.c              | 17 ++++-------------
>>   2 files changed, 5 insertions(+), 20 deletions(-)
>>
>> diff --git a/arch/powerpc/kernel/exceptions-64e.S b/arch/powerpc/kernel/exceptions-64e.S
>> index e8eb9992a270..b60f89078a3f 100644
>> --- a/arch/powerpc/kernel/exceptions-64e.S
>> +++ b/arch/powerpc/kernel/exceptions-64e.S
>> @@ -1010,15 +1010,9 @@ storage_fault_common:
>>   	addi	r3,r1,STACK_FRAME_OVERHEAD
>>   	ld	r14,PACA_EXGEN+EX_R14(r13)
>>   	ld	r15,PACA_EXGEN+EX_R15(r13)
>> +	bl	save_nvgprs
>>   	bl	do_page_fault
>> -	cmpdi	r3,0
>> -	bne-	1f
>>   	b	ret_from_except_lite
>> -1:	bl	save_nvgprs
>> -	mr	r4,r3
>> -	addi	r3,r1,STACK_FRAME_OVERHEAD
>> -	bl	__bad_page_fault
>> -	b	ret_from_except
>>   
>>   /*
>>    * Alignment exception doesn't fit entirely in the 0x100 bytes so it
>> diff --git a/arch/powerpc/mm/fault.c b/arch/powerpc/mm/fault.c
>> index 2e54bac99a22..7bcff3fca110 100644
>> --- a/arch/powerpc/mm/fault.c
>> +++ b/arch/powerpc/mm/fault.c
>> @@ -541,24 +541,15 @@ NOKPROBE_SYMBOL(___do_page_fault);
>>   
>>   static long __do_page_fault(struct pt_regs *regs)
>>   {
>> -	const struct exception_table_entry *entry;
>>   	long err;
>>   
>>   	err = ___do_page_fault(regs, regs->dar, regs->dsisr);
>>   	if (likely(!err))
>> -		return err;
>> -
>> -	entry = search_exception_tables(regs->nip);
>> -	if (likely(entry)) {
>> -		instruction_pointer_set(regs, extable_fixup(entry));
>>   		return 0;
>> -	} else if (!IS_ENABLED(CONFIG_PPC_BOOK3E_64)) {
>> -		__bad_page_fault(regs, err);
>> -		return 0;
>> -	} else {
>> -		/* 32 and 64e handle the bad page fault in asm */
>> -		return err;
>> -	}
>> +
>> +	bad_page_fault(regs, err);
>> +
>> +	return 0;
>>   }
>>   NOKPROBE_SYMBOL(__do_page_fault);
>>   
>> -- 
>> 2.25.0
>>
>>
