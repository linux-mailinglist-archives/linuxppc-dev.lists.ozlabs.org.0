Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CE4273387CB
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Mar 2021 09:41:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DxfRf5mhbz3dDs
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Mar 2021 19:41:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DxfRJ5nsBz3cGd
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Mar 2021 19:41:00 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4DxfRF1DSgz9v0v7;
 Fri, 12 Mar 2021 09:40:57 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id Gn7TlhMAF9ZL; Fri, 12 Mar 2021 09:40:57 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4DxfRD60Dgz9v0v4;
 Fri, 12 Mar 2021 09:40:56 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 6EE928B764;
 Fri, 12 Mar 2021 09:40:57 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id io9eXAHyt1an; Fri, 12 Mar 2021 09:40:57 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id B9F538B80F;
 Fri, 12 Mar 2021 09:40:56 +0100 (CET)
Subject: Re: [PATCH v2 02/43] powerpc/traps: Declare unrecoverable_exception()
 as __noreturn
To: Nicholas Piggin <npiggin@gmail.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Michael Ellerman <mpe@ellerman.id.au>, Paul Mackerras <paulus@samba.org>
References: <cover.1615291471.git.christophe.leroy@csgroup.eu>
 <f097a1071254e8f6875588f8fb9771467824a569.1615291471.git.christophe.leroy@csgroup.eu>
 <1615339022.cb2m6h66vl.astroid@bobo.none>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <9e96b084-1914-f82e-5577-183bb7082d18@csgroup.eu>
Date: Fri, 12 Mar 2021 09:40:53 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <1615339022.cb2m6h66vl.astroid@bobo.none>
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



Le 10/03/2021 à 02:22, Nicholas Piggin a écrit :
> Excerpts from Christophe Leroy's message of March 9, 2021 10:09 pm:
>> unrecoverable_exception() is never expected to return, most callers
>> have an infiniteloop in case it returns.
>>
>> Ensure it really never returns by terminating it with a BUG(), and
>> declare it __no_return.
>>
>> It always GCC to really simplify functions calling it. In the exemple
>> below, it avoids the stack frame in the likely fast path and avoids
>> code duplication for the exit.
>>
>> With this patch:
> 
> [snip]
> 
> Nice.
> 
>> diff --git a/arch/powerpc/kernel/traps.c b/arch/powerpc/kernel/traps.c
>> index a44a30b0688c..d5c9d9ddd186 100644
>> --- a/arch/powerpc/kernel/traps.c
>> +++ b/arch/powerpc/kernel/traps.c
>> @@ -2170,11 +2170,15 @@ DEFINE_INTERRUPT_HANDLER(SPEFloatingPointRoundException)
>>    * in the MSR is 0.  This indicates that SRR0/1 are live, and that
>>    * we therefore lost state by taking this exception.
>>    */
>> -void unrecoverable_exception(struct pt_regs *regs)
>> +void __noreturn unrecoverable_exception(struct pt_regs *regs)
>>   {
>>   	pr_emerg("Unrecoverable exception %lx at %lx (msr=%lx)\n",
>>   		 regs->trap, regs->nip, regs->msr);
>>   	die("Unrecoverable exception", regs, SIGABRT);
>> +	/* die() should not return */
>> +	WARN(true, "die() unexpectedly returned");
>> +	for (;;)
>> +		;
>>   }
> 
> I don't think the WARN should be added because that will cause another
> interrupt after something is already badly wrong, so this might just
> make it harder to debug.
> 
> For example if die() is falling through for some reason, we warn and
> cause a program check here, and that might also be unrecoverable so it
> might come through here and fall through again and warn again, etc.
> 
> Putting the infinite loop is good enough I think (and better than there
> was previously).

Ok, dropped the WARN()

> 
> Otherwise
> 
> Reviewed-by: Nicholas Piggin <npiggin@gmail.com>
> 
> Thanks,
> Nick
> 
