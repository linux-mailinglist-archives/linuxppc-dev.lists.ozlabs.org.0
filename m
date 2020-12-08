Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 416782D2D32
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Dec 2020 15:28:15 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cr2bJ1K2vzDqXg
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Dec 2020 01:28:12 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Cr2YB26BrzDqPm
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Dec 2020 01:26:20 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4Cr2Y13zvXz9txfH;
 Tue,  8 Dec 2020 15:26:13 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id cbGzgpzZcNAh; Tue,  8 Dec 2020 15:26:13 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4Cr2Y11d0nz9txfF;
 Tue,  8 Dec 2020 15:26:13 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 9FDED8B7C7;
 Tue,  8 Dec 2020 15:26:14 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id IzORe5C_uyYh; Tue,  8 Dec 2020 15:26:14 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 6C3638B7BE;
 Tue,  8 Dec 2020 15:26:13 +0100 (CET)
Subject: Re: [PATCH v3 4/5] powerpc/fault: Avoid heavy
 search_exception_tables() verification
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>,
 npiggin@gmail.com
References: <0d37490a067840f53fc5b118869917c0aec9ab87.1607416578.git.christophe.leroy@csgroup.eu>
 <731bdee26a5a5c81cd815ed624a6fb3bdef8b4db.1607416578.git.christophe.leroy@csgroup.eu>
 <0e25f03d-9f59-b963-312c-c3ae1d7953a2@linux.ibm.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <d66f9706-9e36-5b92-5a87-90ebd05587e9@csgroup.eu>
Date: Tue, 8 Dec 2020 15:26:14 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <0e25f03d-9f59-b963-312c-c3ae1d7953a2@linux.ibm.com>
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



Le 08/12/2020 à 14:00, Aneesh Kumar K.V a écrit :
> On 12/8/20 2:07 PM, Christophe Leroy wrote:
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
>>   arch/powerpc/mm/fault.c | 23 +++++++----------------
>>   1 file changed, 7 insertions(+), 16 deletions(-)
>>
>> diff --git a/arch/powerpc/mm/fault.c b/arch/powerpc/mm/fault.c
>> index 3fcd34c28e10..1770b41e4730 100644
>> --- a/arch/powerpc/mm/fault.c
>> +++ b/arch/powerpc/mm/fault.c
>> @@ -210,28 +210,19 @@ static bool bad_kernel_fault(struct pt_regs *regs, unsigned long error_code,
>>           return true;
>>       }
>> -    if (!is_exec && address < TASK_SIZE && (error_code & (DSISR_PROTFAULT | DSISR_KEYFAULT)) &&
>> -        !search_exception_tables(regs->nip)) {
>> -        pr_crit_ratelimited("Kernel attempted to access user page (%lx) - exploit attempt? (uid: 
>> %d)\n",
>> -                    address,
>> -                    from_kuid(&init_user_ns, current_uid()));
>> -    }
>> -
>>       // Kernel fault on kernel address is bad
>>       if (address >= TASK_SIZE)
>>           return true;
>> -    // Fault on user outside of certain regions (eg. copy_tofrom_user()) is bad
>> -    if (!search_exception_tables(regs->nip))
>> -        return true;
>> -
>> -    // Read/write fault in a valid region (the exception table search passed
>> -    // above), but blocked by KUAP is bad, it can never succeed.
>> -    if (bad_kuap_fault(regs, address, is_write))
>> +    // Read/write fault blocked by KUAP is bad, it can never succeed.
>> +    if (bad_kuap_fault(regs, address, is_write)) {
>> +        pr_crit_ratelimited("Kernel attempted to %s user page (%lx) - exploit attempt? (uid: %d)\n",
>> +                    is_write ? "write" : "read", address,
>> +                    from_kuid(&init_user_ns, current_uid()));
>>           return true;
>> +    }
> 
> 
> Should we update bad_kuap_fault to check for !is_kernel_addr() and error_code & (DSISIR_PROT_FAULT | 
> DSISIR_KEYFAULT). I am wondering whether we can take another fault w.r.t kernel address/user address 
> and end up reporting that as KUAP fault?

Just before this we do:

	if (address >= TASK_SIZE)
		return true;

About the error code, I don't know. Can we take a fault that is not a DSISR_PROT_FAULT |
  DSISR_KEYFAULT and that is not a KUAP fault ?

Previously (before this patch), the error code was taken into account for the call to 
search_exception_tables(), but has never been for the bad_kuap_fault().

> 
>> -    // What's left? Kernel fault on user in well defined regions (extable
>> -    // matched), and allowed by KUAP in the faulting context.
>> +    // What's left? Kernel fault on user and allowed by KUAP in the faulting context.
>>       return false;
>>   }
>>
> 
> 
> -aneesh

Christophe
