Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F3EA2D2DE1
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Dec 2020 16:09:22 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cr3Vl3tkhzDqcn
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Dec 2020 02:09:19 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Cr3St3CVdzDqTk
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Dec 2020 02:07:36 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4Cr3Sg3cv5zB09b2;
 Tue,  8 Dec 2020 16:07:31 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id UYOh8aFLsijv; Tue,  8 Dec 2020 16:07:31 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4Cr3Sg2BXlzB09b1;
 Tue,  8 Dec 2020 16:07:31 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id B88228B7C8;
 Tue,  8 Dec 2020 16:07:32 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id kjdz0ODqg8li; Tue,  8 Dec 2020 16:07:32 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 10FDB8B7BE;
 Tue,  8 Dec 2020 16:07:32 +0100 (CET)
Subject: Re: [PATCH v3 4/5] powerpc/fault: Avoid heavy
 search_exception_tables() verification
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>,
 npiggin@gmail.com
References: <0d37490a067840f53fc5b118869917c0aec9ab87.1607416578.git.christophe.leroy@csgroup.eu>
 <731bdee26a5a5c81cd815ed624a6fb3bdef8b4db.1607416578.git.christophe.leroy@csgroup.eu>
 <87lfe8qrik.fsf@linux.ibm.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <b532a9c6-97de-031d-f880-901a117cc95c@csgroup.eu>
Date: Tue, 8 Dec 2020 16:07:32 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <87lfe8qrik.fsf@linux.ibm.com>
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



Le 08/12/2020 à 15:52, Aneesh Kumar K.V a écrit :
> Christophe Leroy <christophe.leroy@csgroup.eu> writes:
> 
>> search_exception_tables() is an heavy operation, we have to avoid it.
>> When KUAP is selected, we'll know the fault has been blocked by KUAP.
>> Otherwise, it behaves just as if the address was already in the TLBs
>> and no fault was generated.
>>
>> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
>> Reviewed-by: Nicholas Piggin <npiggin@gmail.com>
>> ---
>> v3: rebased
>> v2: Squashed with the preceeding patch which was re-ordering tests that get removed in this patch.
>> ---
>>   arch/powerpc/mm/fault.c | 23 +++++++----------------
>>   1 file changed, 7 insertions(+), 16 deletions(-)
>>
>> diff --git a/arch/powerpc/mm/fault.c b/arch/powerpc/mm/fault.c
>> index 3fcd34c28e10..1770b41e4730 100644
>> --- a/arch/powerpc/mm/fault.c
>> +++ b/arch/powerpc/mm/fault.c
>> @@ -210,28 +210,19 @@ static bool bad_kernel_fault(struct pt_regs *regs, unsigned long error_code,
>>   		return true;
>>   	}
>>   
>> -	if (!is_exec && address < TASK_SIZE && (error_code & (DSISR_PROTFAULT | DSISR_KEYFAULT)) &&
>> -	    !search_exception_tables(regs->nip)) {
>> -		pr_crit_ratelimited("Kernel attempted to access user page (%lx) - exploit attempt? (uid: %d)\n",
>> -				    address,
>> -				    from_kuid(&init_user_ns, current_uid()));
>> -	}
>> -
>>   	// Kernel fault on kernel address is bad
>>   	if (address >= TASK_SIZE)
>>   		return true;
>>   
>> -	// Fault on user outside of certain regions (eg. copy_tofrom_user()) is bad
>> -	if (!search_exception_tables(regs->nip))
>> -		return true;
>> -
>> -	// Read/write fault in a valid region (the exception table search passed
>> -	// above), but blocked by KUAP is bad, it can never succeed.
>> -	if (bad_kuap_fault(regs, address, is_write))
>> +	// Read/write fault blocked by KUAP is bad, it can never succeed.
>> +	if (bad_kuap_fault(regs, address, is_write)) {
>> +		pr_crit_ratelimited("Kernel attempted to %s user page (%lx) - exploit attempt? (uid: %d)\n",
>> +				    is_write ? "write" : "read", address,
>> +				    from_kuid(&init_user_ns, current_uid()));
>>   		return true;
>> +	}
> 
> 
> With this I am wondering whether the WARN() in bad_kuap_fault() is
> needed. A direct access of userspace address will trigger this, whereas
> previously we used bad_kuap_fault() only to identify incorrect restore
> of AMR register (ie, to identify kernel bugs). Hence a WARN() there was
> useful. We loose that differentiation now?

Yes, I wanted to remove the WARN(), see 
https://patchwork.ozlabs.org/project/linuxppc-dev/patch/cc9129bdda1dbc2f0a09cf45fece7d0b0e690784.1605541983.git.christophe.leroy@csgroup.eu/
but I understood from Michael that maybe it was not a good idea, so I left it aside for now when 
rebasing to v3.

Yes previously we were able to differentiate between a direct access of userspace and a valid access 
triggering a KUAP fault, but at the cost of the heavy search_exception_tables().
The issue was reported by Nick through https://github.com/linuxppc/issues/issues/317

Should be perform the search_exception_tables() once we have hit the KUAP fault and WARN() only in 
that case ?

I was wondering also if we should keep the WARN() only when CONFIG_PPC_KUAP_DEBUG is set ?

> 
> 
>>   
>> -	// What's left? Kernel fault on user in well defined regions (extable
>> -	// matched), and allowed by KUAP in the faulting context.
>> +	// What's left? Kernel fault on user and allowed by KUAP in the faulting context.
>>   	return false;
>>   }
>>   
>> -- 
>> 2.25.0
