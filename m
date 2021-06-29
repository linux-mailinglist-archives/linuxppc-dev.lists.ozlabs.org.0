Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CCAAC3B71C2
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Jun 2021 14:07:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GDjs65Xy4z2yQ9
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Jun 2021 22:07:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GDjrm2mQWz2yN8
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Jun 2021 22:07:00 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
 by localhost (Postfix) with ESMTP id 4GDjrb5W3wzB9jv;
 Tue, 29 Jun 2021 14:06:55 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zHQr_DDFz2aM; Tue, 29 Jun 2021 14:06:55 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4GDjrZ4ZgvzB9f4;
 Tue, 29 Jun 2021 14:06:54 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 7AD418B7C1;
 Tue, 29 Jun 2021 14:06:54 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id dNp7uxly07AA; Tue, 29 Jun 2021 14:06:54 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 8C9F38B7BE;
 Tue, 29 Jun 2021 14:06:53 +0200 (CEST)
Subject: Re: [PATCH] powerpc/4xx: Fix setup_kuep() on SMP
To: Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>
References: <b9c2a9add0f11754539e24c6f421bd2009327c36.1624863323.git.christophe.leroy@csgroup.eu>
 <87tulg7uh6.fsf@mpe.ellerman.id.au>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <920c4c49-5185-a0d5-0ab2-484effc307cc@csgroup.eu>
Date: Tue, 29 Jun 2021 14:06:49 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <87tulg7uh6.fsf@mpe.ellerman.id.au>
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



Le 29/06/2021 à 13:58, Michael Ellerman a écrit :
> Christophe Leroy <christophe.leroy@csgroup.eu> writes:
>> On SMP, setup_kuep() is also called from start_secondary() since
>> commit 86f46f343272 ("powerpc/32s: Initialise KUAP and KUEP in C").
>>
>> start_secondary() is not an __init function.
>>
>> Remove the __init marker from setup_kuep() and bail out when
>> not caller on the first CPU as the work is already done.
>>
>> Reported-by: kernel test robot <lkp@intel.com>
>> Fixes: 10248dcba120 ("powerpc/44x: Implement Kernel Userspace Exec Protection (KUEP)")
>> Fixes: 86f46f343272 ("powerpc/32s: Initialise KUAP and KUEP in C").
>> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
>> ---
>>   arch/powerpc/mm/nohash/44x.c | 5 ++++-
>>   1 file changed, 4 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/powerpc/mm/nohash/44x.c b/arch/powerpc/mm/nohash/44x.c
>> index 7da6d1e9fc9b..20c18bd5b9a0 100644
>> --- a/arch/powerpc/mm/nohash/44x.c
>> +++ b/arch/powerpc/mm/nohash/44x.c
>> @@ -241,8 +241,11 @@ void __init mmu_init_secondary(int cpu)
>>   #endif /* CONFIG_SMP */
>>   
>>   #ifdef CONFIG_PPC_KUEP
>> -void __init setup_kuep(bool disabled)
>> +void setup_kuep(bool disabled)
>>   {
>> +	if (smp_processor_id() != boot_cpuid)
>> +		return;
>> +
>>   	if (disabled)
>>   		patch_instruction_site(&patch__tlb_44x_kuep, ppc_inst(PPC_RAW_NOP()));
>>   	else
> 
> Building ppc44x_defconfig gives me:
> 
>    /linux/arch/powerpc/mm/nohash/44x.c: In function 'setup_kuep':
>    /linux/arch/powerpc/mm/nohash/44x.c:246:35: error: 'boot_cpuid' undeclared (first use in this function); did you mean 'boot_cpu_init'?
>      246 |         if (smp_processor_id() != boot_cpuid)
>          |                                   ^~~~~~~~~~
>          |                                   boot_cpu_init
>    /linux/arch/powerpc/mm/nohash/44x.c:246:35: note: each undeclared identifier is reported only once for each function it appears in


Seems like we need <asm/smp.h> when we don't have CONFIG_SMP.

I tested it with akebono_defconfig, looks like it has CONFIG_SMP.
