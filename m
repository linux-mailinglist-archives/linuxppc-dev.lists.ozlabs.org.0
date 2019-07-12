Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E724366741
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Jul 2019 08:51:39 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45lNr93YZtzDqS5
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Jul 2019 16:51:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="O1lIrrEN"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45lNmn614TzDqRR
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Jul 2019 16:48:41 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 45lNmh6VG5z9vBJr;
 Fri, 12 Jul 2019 08:48:36 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=O1lIrrEN; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id dbcwxO5ySRsb; Fri, 12 Jul 2019 08:48:36 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 45lNmh5MYMz9vBJq;
 Fri, 12 Jul 2019 08:48:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1562914116; bh=tgkRl5MPIQccZ26fWFwpJkSD3G44XsZk5ohCUlFNZso=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=O1lIrrEN/u7zpcknRd7y1sO+fLwCQHs572GpFets5v1aXa8Gv6UMBC3JQHJJW5G7t
 rKmACiZ1/c307oSHEHCjMHgFL/OEEPEKjYi1fPksqbx9D1RP57DnE8sqsmTCr1WK1/
 pcyMhK2U6Z/hr0yu46R6LQevspItM0PgiMc9bknQ=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id A9AF08B884;
 Fri, 12 Jul 2019 08:48:37 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 3ncbz0uPIoYS; Fri, 12 Jul 2019 08:48:37 +0200 (CEST)
Received: from [172.25.230.101] (po15451.idsi0.si.c-s.fr [172.25.230.101])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 77FE48B87F;
 Fri, 12 Jul 2019 08:48:37 +0200 (CEST)
Subject: Re: [PATCH v2] powerpc/book3s/mm: Update Oops message to print the
 correct translation in use
To: Michael Ellerman <mpe@ellerman.id.au>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, npiggin@gmail.com,
 paulus@samba.org
References: <20190711145814.17970-1-aneesh.kumar@linux.ibm.com>
 <8736jbg46p.fsf@concordia.ellerman.id.au>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <a9efab7b-0c61-5224-f936-82db1039d159@c-s.fr>
Date: Fri, 12 Jul 2019 08:48:37 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <8736jbg46p.fsf@concordia.ellerman.id.au>
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 12/07/2019 à 08:25, Michael Ellerman a écrit :
> "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com> writes:
> 
>> Avoids confusion when printing Oops message like below
>>
>>   Faulting instruction address: 0xc00000000008bdb4
>>   Oops: Kernel access of bad area, sig: 11 [#1]
>>   LE PAGE_SIZE=64K MMU=Radix MMU=Hash SMP NR_CPUS=2048 NUMA PowerNV
>>
>> This was because we never clear the MMU_FTR_HPTE_TABLE feature flag
>> even if we run with radix translation. It was discussed that we should
>> look at this feature flag as an indication of the capability to run
>> hash translation and we should not clear the flag even if we run in
>> radix translation. All the code paths check for radix_enabled() check and
>> if found true consider we are running with radix translation. Follow the
>> same sequence for finding the MMU translation string to be used in Oops
>> message.
>>
>> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
>> ---
>>
>> Changes from V1:
>> * Don't clear the HPTE feature flag.
>>
>>   arch/powerpc/kernel/traps.c | 15 +++++++++++----
>>   1 file changed, 11 insertions(+), 4 deletions(-)
>>
>> diff --git a/arch/powerpc/kernel/traps.c b/arch/powerpc/kernel/traps.c
>> index 11caa0291254..b181d6860f28 100644
>> --- a/arch/powerpc/kernel/traps.c
>> +++ b/arch/powerpc/kernel/traps.c
>> @@ -250,15 +250,22 @@ static void oops_end(unsigned long flags, struct pt_regs *regs,
>>   }
>>   NOKPROBE_SYMBOL(oops_end);
>>   
>> +static char *get_mmu_str(void)
>> +{
>> +	if (early_radix_enabled())
>> +		return " MMU=Radix";
>> +	if (early_mmu_has_feature(MMU_FTR_HPTE_TABLE))
>> +		return " MMU=Hash";
>> +	return "";
>> +}
> 
> We don't change MMU once we're up, so just do this logic once and stash
> it into a static string, rather than rechecking on every oops.

Do we really have oops so often that we have to worry about that ?

Christophe

> 
> cheers
> 
>>   static int __die(const char *str, struct pt_regs *regs, long err)
>>   {
>>   	printk("Oops: %s, sig: %ld [#%d]\n", str, err, ++die_counter);
>>   
>> -	printk("%s PAGE_SIZE=%luK%s%s%s%s%s%s%s %s\n",
>> +	printk("%s PAGE_SIZE=%luK%s%s%s%s%s%s %s\n",
>>   	       IS_ENABLED(CONFIG_CPU_LITTLE_ENDIAN) ? "LE" : "BE",
>> -	       PAGE_SIZE / 1024,
>> -	       early_radix_enabled() ? " MMU=Radix" : "",
>> -	       early_mmu_has_feature(MMU_FTR_HPTE_TABLE) ? " MMU=Hash" : "",
>> +	       PAGE_SIZE / 1024, get_mmu_str(),
>>   	       IS_ENABLED(CONFIG_PREEMPT) ? " PREEMPT" : "",
>>   	       IS_ENABLED(CONFIG_SMP) ? " SMP" : "",
>>   	       IS_ENABLED(CONFIG_SMP) ? (" NR_CPUS=" __stringify(NR_CPUS)) : "",
>> -- 
>> 2.21.0
