Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D92D52AD49C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Nov 2020 12:20:18 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CVllL4Lp4zDqN2
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Nov 2020 22:20:14 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CVldg68BkzDqGG
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Nov 2020 22:15:13 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4CVldS2HV5z9v4hy;
 Tue, 10 Nov 2020 12:15:08 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id RcqySH6deUEQ; Tue, 10 Nov 2020 12:15:08 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4CVldS13YFz9v4WG;
 Tue, 10 Nov 2020 12:15:08 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 54A9D8B7F0;
 Tue, 10 Nov 2020 12:15:09 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 4psM0OG11Ply; Tue, 10 Nov 2020 12:15:09 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 1827A8B764;
 Tue, 10 Nov 2020 12:15:09 +0100 (CET)
Subject: Re: [PATCH 02/18] powerpc: remove arguments from fault handler
 functions
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
References: <20201105143431.1874789-1-npiggin@gmail.com>
 <20201105143431.1874789-3-npiggin@gmail.com>
 <6af9a488-3816-9744-db4b-5a3bceb1f0f0@csgroup.eu>
 <1604996406.ltcjkqarcr.astroid@bobo.none>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <3872d710-97e2-80c3-991c-7f1ffe790a3d@csgroup.eu>
Date: Tue, 10 Nov 2020 12:15:08 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.1
MIME-Version: 1.0
In-Reply-To: <1604996406.ltcjkqarcr.astroid@bobo.none>
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



Le 10/11/2020 à 09:29, Nicholas Piggin a écrit :
> Excerpts from Christophe Leroy's message of November 6, 2020 5:59 pm:
>>
>>
>> Le 05/11/2020 à 15:34, Nicholas Piggin a écrit :
>>> Make mm fault handlers all just take the pt_regs * argument and load
>>> DAR/DSISR from that. Make those that return a value return long.
>>>
>>> This is done to make the function signatures match other handlers, which
>>> will help with a future patch to add wrappers. Explicit arguments could
>>> be added for performance but that would require more wrapper macro
>>> variants.
>>>
>>> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
>>> ---

[...]

> 
>>> diff --git a/arch/powerpc/mm/fault.c b/arch/powerpc/mm/fault.c
>>> index e65a49f246ef..390a296b16a3 100644
>>> --- a/arch/powerpc/mm/fault.c
>>> +++ b/arch/powerpc/mm/fault.c
>>> @@ -549,11 +549,12 @@ static int __do_page_fault(struct pt_regs *regs, unsigned long address,
>>>    }
>>>    NOKPROBE_SYMBOL(__do_page_fault);
>>>    
>>> -int do_page_fault(struct pt_regs *regs, unsigned long address,
>>> -		  unsigned long error_code)
>>> +long do_page_fault(struct pt_regs *regs)
>>>    {
>>>    	enum ctx_state prev_state = exception_enter();
>>> -	int err;
>>> +	unsigned long address = regs->dar;
>>> +	unsigned long error_code = regs->dsisr;
>>> +	long err;
>>
>> By doing something more or less like this (need to be tuned for bookE as well):
>>
>> +	int is_exec = TRAP(regs) == 0x400;
>> +	unsigned long address = is_exec ? regs->ssr0 : regs->dar;
>> +	unsigned long error_code = is_exec ? (regs->ssr1 & DSISR_SRR1_MATCH_32S) : regs->dsisr;
> 
> Ah, I didn't see that you saved these in srr0/1 already. Hmm, not in
> pt_regs though. thread_struct (VMAP_STACK only)? exception_regs (booke
> only)? Doesn't seem so easy.

Oops yes you are right, SRR0/SRR1 are not in pt_regs. And their validity in thread struct is rather 
short ... So forget my comment.

Christophe
