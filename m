Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E26B344C4B
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Mar 2021 17:50:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F40qM3cVBz30Qp
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Mar 2021 03:50:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F40q23YTkz2xfm
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Mar 2021 03:50:03 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4F40pq3YHkz9txkX;
 Mon, 22 Mar 2021 17:49:55 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id g_KnKQSA1Ofv; Mon, 22 Mar 2021 17:49:55 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4F40pq2JdCz9txkB;
 Mon, 22 Mar 2021 17:49:55 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 03E5F8B7A3;
 Mon, 22 Mar 2021 17:50:01 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id xBNVr42Tsd28; Mon, 22 Mar 2021 17:50:00 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 77CE98B79C;
 Mon, 22 Mar 2021 17:50:00 +0100 (CET)
Subject: Re: [RFC PATCH 6/8] powerpc/mm/book3s64/hash: drop pre 2.06 tlbiel
 for clang
To: Nicholas Piggin <npiggin@gmail.com>, Daniel Axtens <dja@axtens.net>,
 linuxppc-dev@lists.ozlabs.org, llvmlinux@lists.linuxfoundation.org
References: <20210225031006.1204774-1-dja@axtens.net>
 <20210225031006.1204774-7-dja@axtens.net>
 <1616118111.i881ydq4h2.astroid@bobo.none>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <7f7cafb5-e6c4-5015-5285-9f9ca25e52fb@csgroup.eu>
Date: Mon, 22 Mar 2021 17:49:59 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <1616118111.i881ydq4h2.astroid@bobo.none>
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



Le 19/03/2021 à 03:01, Nicholas Piggin a écrit :
> Excerpts from Daniel Axtens's message of February 25, 2021 1:10 pm:
>> The llvm integrated assembler does not recognise the ISA 2.05 tlbiel
>> version. Eventually do this more smartly.
> 
> The whole thing with TLBIE and TLBIEL in this file seems a bit too
> clever. We should have PPC_TLBIE* macros for all of them.

I was expecting to drop PPC_* macros as much as possible taking into account the later binutils 
support most of them (https://github.com/linuxppc/issues/issues/350). Was not expecting to go the 
other direction.

See following series for an exemple of why we would want to get rid of PPC_* macros.

https://patchwork.ozlabs.org/project/linuxppc-dev/list/?series=231583&state=*

Christophe

> 
> Thanks,
> Nick
> 
>>
>> Signed-off-by: Daniel Axtens <dja@axtens.net>
>> ---
>>   arch/powerpc/mm/book3s64/hash_native.c | 10 ++++++++++
>>   1 file changed, 10 insertions(+)
>>
>> diff --git a/arch/powerpc/mm/book3s64/hash_native.c b/arch/powerpc/mm/book3s64/hash_native.c
>> index 52e170bd95ae..c5937f69a452 100644
>> --- a/arch/powerpc/mm/book3s64/hash_native.c
>> +++ b/arch/powerpc/mm/book3s64/hash_native.c
>> @@ -267,9 +267,14 @@ static inline void __tlbiel(unsigned long vpn, int psize, int apsize, int ssize)
>>   		va |= ssize << 8;
>>   		sllp = get_sllp_encoding(apsize);
>>   		va |= sllp << 5;
>> +#if 0
>>   		asm volatile(ASM_FTR_IFSET("tlbiel %0", "tlbiel %0,0", %1)
>>   			     : : "r" (va), "i" (CPU_FTR_ARCH_206)
>>   			     : "memory");
>> +#endif
>> +		asm volatile("tlbiel %0"
>> +			     : : "r" (va)
>> +			     : "memory");
>>   		break;
>>   	default:
>>   		/* We need 14 to 14 + i bits of va */
>> @@ -286,9 +291,14 @@ static inline void __tlbiel(unsigned long vpn, int psize, int apsize, int ssize)
>>   		 */
>>   		va |= (vpn & 0xfe);
>>   		va |= 1; /* L */
>> +#if 0
>>   		asm volatile(ASM_FTR_IFSET("tlbiel %0", "tlbiel %0,1", %1)
>>   			     : : "r" (va), "i" (CPU_FTR_ARCH_206)
>>   			     : "memory");
>> +#endif
>> +		asm volatile("tlbiel %0"
>> +			     : : "r" (va)
>> +			     : "memory");
>>   		break;
>>   	}
>>   	trace_tlbie(0, 1, va, 0, 0, 0, 0);
>> -- 
>> 2.27.0
>>
>>
