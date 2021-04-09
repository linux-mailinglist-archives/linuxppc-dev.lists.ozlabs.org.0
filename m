Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D739B359E21
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Apr 2021 14:00:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FGxXK5j24z3bmw
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Apr 2021 22:00:17 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=NhPUyg7S;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=NhPUyg7S; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FGxWh2nHpz30JL
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Apr 2021 21:59:43 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 139BYsMM092973; Fri, 9 Apr 2021 07:59:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=Us3UH84vgCH9c0G2yzSE7UHxEExA/BWhebWtzXlvFkA=;
 b=NhPUyg7STXzYk18gxsBLhMhJqxfzrMztV6uam9pEDTTok4iEnRZQUtE91SxSwWxy3HGJ
 yLlKPJGNPC0Ee5CDrzYSBq8Y5/ftfw6HQzRxqiuGsMTMxDxgpuWA3PrAw6d958xt19OM
 v42tQTXBa5dfCIsFE1u2krV7/YPifbsPRDYH/cJIRz3W5zi/I5k2i11KC6HptWMywtmJ
 G//BGBGQeBKgTTrHKrWZF/gNfgal9S1McJYf+3c4q5XgTFZ8RL0AQD7fvFcr2xWWFI3O
 ogsPAHq2jwys9x2q4M5mzidBfhNvvdSUe/259Ovul0G2lIGEar3+BmNJiEBxDT0R776m WQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37s5xubwck-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 09 Apr 2021 07:59:33 -0400
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 139BbGIa102374;
 Fri, 9 Apr 2021 07:59:32 -0400
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37s5xubwc7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 09 Apr 2021 07:59:32 -0400
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 139BvMn8027257;
 Fri, 9 Apr 2021 11:59:31 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma06ams.nl.ibm.com with ESMTP id 37rvbwae17-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 09 Apr 2021 11:59:30 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 139BxS3R50528626
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 9 Apr 2021 11:59:28 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 76D1A4C040;
 Fri,  9 Apr 2021 11:59:28 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CA0DE4C04E;
 Fri,  9 Apr 2021 11:59:26 +0000 (GMT)
Received: from [9.85.75.82] (unknown [9.85.75.82])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri,  9 Apr 2021 11:59:26 +0000 (GMT)
Subject: Re: [PATCH v3 8/9] mm/mremap: Allow arch runtime override
To: Christophe Leroy <christophe.leroy@csgroup.eu>, linux-mm@kvack.org,
 akpm@linux-foundation.org
References: <20210330060752.592769-1-aneesh.kumar@linux.ibm.com>
 <20210330060752.592769-9-aneesh.kumar@linux.ibm.com>
 <c421c3cb-6e9a-6db0-9e4b-f7a7e9a6c1cc@csgroup.eu>
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Message-ID: <955e19f7-e15c-d7cc-3cdf-0c237ae980c1@linux.ibm.com>
Date: Fri, 9 Apr 2021 17:29:25 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <c421c3cb-6e9a-6db0-9e4b-f7a7e9a6c1cc@csgroup.eu>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 9DorQKqgJJZ1T06pcYWKHZuApm7E8PSj
X-Proofpoint-ORIG-GUID: FandDaYX_mML3gi2w5LFg_53NGxCUHvh
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-09_05:2021-04-09,
 2021-04-09 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0
 malwarescore=0 mlxscore=0 spamscore=0 impostorscore=0 mlxlogscore=999
 bulkscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104090086
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
Cc: joel@joelfernandes.org, linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com,
 kaleshsingh@google.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 4/9/21 3:05 PM, Christophe Leroy wrote:
> 
> 
> Le 30/03/2021 à 08:07, Aneesh Kumar K.V a écrit :
>> Architectures like ppc64 can only support faster mremap only with radix
> 
> ... only .... only ...
> 
>> translation. Hence allow a runtime check w.r.t support for fast mremap.
>>

will fix that

>> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
>> ---
>>   arch/arc/include/asm/tlb.h     |  5 +++++
>>   arch/arm64/include/asm/tlb.h   |  6 ++++++
>>   arch/powerpc/include/asm/tlb.h |  6 ++++++
>>   arch/x86/include/asm/tlb.h     |  5 +++++
>>   mm/mremap.c                    | 14 +++++++++++++-
>>   5 files changed, 35 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/arc/include/asm/tlb.h b/arch/arc/include/asm/tlb.h
>> index 975b35d3738d..22b8cfb46cbf 100644
>> --- a/arch/arc/include/asm/tlb.h
>> +++ b/arch/arc/include/asm/tlb.h
>> @@ -9,4 +9,9 @@
>>   #include <linux/pagemap.h>
>>   #include <asm-generic/tlb.h>
>> +#define arch_supports_page_tables_move arch_supports_page_tables_move
>> +static inline bool arch_supports_page_tables_move(void)
>> +{
>> +    return true;
>> +}
> 
> I can't see why ARC arch needs that. It neither selects 
> CONFIG_HAVE_MOVE_PMD nor CONFIG_HAVE_MOVE_PUD.
> 
>

ok will fix that (I confused arch/Kconfig with arc/Kconfig )



>>   #endif /* _ASM_ARC_TLB_H */
>> diff --git a/arch/arm64/include/asm/tlb.h b/arch/arm64/include/asm/tlb.h
>> index 61c97d3b58c7..fe209efc6a10 100644
>> --- a/arch/arm64/include/asm/tlb.h
>> +++ b/arch/arm64/include/asm/tlb.h
>> @@ -94,4 +94,10 @@ static inline void __pud_free_tlb(struct mmu_gather 
>> *tlb, pud_t *pudp,
>>   }
>>   #endif
>> +#define arch_supports_page_tables_move arch_supports_page_tables_move
>> +static inline bool arch_supports_page_tables_move(void)
>> +{
>> +    return true;
>> +}
>> +
>>   #endif
>> diff --git a/arch/powerpc/include/asm/tlb.h 
>> b/arch/powerpc/include/asm/tlb.h
>> index 160422a439aa..058918a7cd3c 100644
>> --- a/arch/powerpc/include/asm/tlb.h
>> +++ b/arch/powerpc/include/asm/tlb.h
>> @@ -83,5 +83,11 @@ static inline int mm_is_thread_local(struct 
>> mm_struct *mm)
>>   }
>>   #endif
>> +#define arch_supports_page_tables_move arch_supports_page_tables_move
>> +static inline bool arch_supports_page_tables_move(void)
>> +{
>> +    return radix_enabled();
>> +}
>> +
>>   #endif /* __KERNEL__ */
>>   #endif /* __ASM_POWERPC_TLB_H */
>> diff --git a/arch/x86/include/asm/tlb.h b/arch/x86/include/asm/tlb.h
>> index 1bfe979bb9bc..62915238bb36 100644
>> --- a/arch/x86/include/asm/tlb.h
>> +++ b/arch/x86/include/asm/tlb.h
>> @@ -37,4 +37,9 @@ static inline void __tlb_remove_table(void *table)
>>       free_page_and_swap_cache(table);
>>   }
>> +#define arch_supports_page_tables_move arch_supports_page_tables_move
>> +static inline bool arch_supports_page_tables_move(void)
>> +{
>> +    return true;
>> +}
>>   #endif /* _ASM_X86_TLB_H */
>> diff --git a/mm/mremap.c b/mm/mremap.c
>> index 7ac1df8e6d51..4d812af3e44b 100644
>> --- a/mm/mremap.c
>> +++ b/mm/mremap.c
>> @@ -25,7 +25,7 @@
>>   #include <linux/userfaultfd_k.h>
>>   #include <asm/cacheflush.h>
>> -#include <asm/tlbflush.h>
>> +#include <asm/tlb.h>
>>   #include <asm/pgalloc.h>
>>   #include "internal.h"
>> @@ -221,6 +221,14 @@ static inline void flush_pte_tlb_pwc_range(struct 
>> vm_area_struct *vma,
>>   }
>>   #endif
>> +#ifndef arch_supports_page_tables_move
>> +#define arch_supports_page_tables_move arch_supports_page_tables_move
>> +static inline bool arch_supports_page_tables_move(void)
>> +{
>> +    return false;
> 
> Can you do
> 
>      return IS_ENABLED(CONFIG_HAVE_MOVE_PMD) || 
> IS_ENABLED(CONFIG_HAVE_MOVE_PUD);
> 
> And then remove the arch_supports_page_tables_move() you have added for 
> arc, arm64 and x86 ?
> 


something like below?

#ifndef arch_supports_page_tables_move
#define arch_supports_page_tables_move arch_supports_page_tables_move
static inline bool arch_supports_page_tables_move(void)
{
	return IS_ENABLED(CONFIG_HAVE_MOVE_PMD) ||
		IS_ENABLED(CONFIG_HAVE_MOVE_PUD);
}
#endif

are remove those from those arch headers.





>> +}
>> +#endif
>> +
>>   #ifdef CONFIG_HAVE_MOVE_PMD
> 
> Next step could be remove that #ifdef and the content of the matching #else
> For that we'd just need a stub version of set_pmd_at() and set_pud_at().
> 
>>   static bool move_normal_pmd(struct vm_area_struct *vma, unsigned 
>> long old_addr,
>>             unsigned long new_addr, pmd_t *old_pmd, pmd_t *new_pmd)
>> @@ -229,6 +237,8 @@ static bool move_normal_pmd(struct vm_area_struct 
>> *vma, unsigned long old_addr,
>>       struct mm_struct *mm = vma->vm_mm;
>>       pmd_t pmd;
>> +    if (!arch_supports_page_tables_move())
>> +        return false;
>>       /*
>>        * The destination pmd shouldn't be established, free_pgtables()
>>        * should have released it.
>> @@ -295,6 +305,8 @@ static bool move_normal_pud(struct vm_area_struct 
>> *vma, unsigned long old_addr,
>>       struct mm_struct *mm = vma->vm_mm;
>>       pud_t pud;
>> +    if (!arch_supports_page_tables_move())
>> +        return false;
>>       /*
>>        * The destination pud shouldn't be established, free_pgtables()
>>        * should have released it.
>>

