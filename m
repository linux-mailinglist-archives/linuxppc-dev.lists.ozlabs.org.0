Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EF932C41DC
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Nov 2020 15:10:58 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ch2qK2VYxzDqWS
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Nov 2020 01:10:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=hAInKD8F; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Ch2Qb22RzzDqvH
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Nov 2020 00:52:54 +1100 (AEDT)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0APDVOjE031033; Wed, 25 Nov 2020 08:52:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=KZDp7mrPhsBOZ+mrq5RIKkNH1+g4ZoU2j0nT2YwAFB4=;
 b=hAInKD8FONcw39FbS4GTULDYNieCmSmvpccXqFLC+9xy7+WjUsQX0E6asebOPZdB99L1
 dbcnrF8sTqvbvNDuWZfDqPuzj4VTWLxX2K/PXynttNTykLRunvSKXtPBrJHjfZErYSX0
 RH4AfLO5voFjwgM7sq4Ix5Y1Sr7aLtk2+1Z7KpczHz6HP5nkccsSnSdQIjorGCHUF04o
 zi5TRPQ7DFbj36F89RL6O0O6RcJUx5WjOXH0kllu2QwMPBglXUytc0Nc9GTuvZTbVUpK
 EfZvX9r+RQMEbX1dQU5SQZLGDBqoboFVgJdZkQSyYmIjEnPb2/H7+IysutO3iOb9FDur tg== 
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0b-001b2d01.pphosted.com with ESMTP id 351nr6pame-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 25 Nov 2020 08:52:41 -0500
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0APDqeSL003234;
 Wed, 25 Nov 2020 13:52:40 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma03ams.nl.ibm.com with ESMTP id 34xth8cpxn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 25 Nov 2020 13:52:40 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0APDqbDv6881810
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 25 Nov 2020 13:52:38 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B314742047;
 Wed, 25 Nov 2020 13:52:37 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C365C42045;
 Wed, 25 Nov 2020 13:52:36 +0000 (GMT)
Received: from [9.77.195.3] (unknown [9.77.195.3])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 25 Nov 2020 13:52:36 +0000 (GMT)
Subject: Re: [PATCH v6 07/22] powerpc/book3s64/kuap: Rename MMU_FTR_RADIX_KUAP
 to MMU_FTR_KUAP
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au
References: <20201125051634.509286-1-aneesh.kumar@linux.ibm.com>
 <20201125051634.509286-8-aneesh.kumar@linux.ibm.com>
 <49af7fc3-c9f0-ff2c-507e-595c3be8c8f6@csgroup.eu>
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Message-ID: <a501b386-5985-91c2-aa90-c8dc23a78422@linux.ibm.com>
Date: Wed, 25 Nov 2020 19:22:35 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <49af7fc3-c9f0-ff2c-507e-595c3be8c8f6@csgroup.eu>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-25_08:2020-11-25,
 2020-11-25 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015
 suspectscore=0 phishscore=0 priorityscore=1501 adultscore=0 spamscore=0
 impostorscore=0 bulkscore=0 mlxscore=0 mlxlogscore=999 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2011250080
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

On 11/25/20 7:13 PM, Christophe Leroy wrote:
> 
> 
> Le 25/11/2020 à 06:16, Aneesh Kumar K.V a écrit :
>> This is in preparate to adding support for kuap with hash translation.
>> In preparation for that rename/move kuap related functions to
>> non radix names. Also move the feature bit closer to MMU_FTR_KUEP.
> 
> It was obvious with MMU_FTR_RADIX_KUAP that it was only for Radix PPC64.
> Now, do we expect it to be applies on PPC32 as well or is it still for 
> PPC64 only ?

Right now this is PPC64 only. I added

+config PPC_PKEY
+	def_bool y
+	depends on PPC_BOOK3S_64
+	depends on PPC_MEM_KEYS || PPC_KUAP || PPC_KUEP

to select the base bits needed for both KUAP and MEM_KEYS. I haven't 
looked at PPC32 to see if we can implement it there also.

> 
>>
>> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
>> ---
>>   arch/powerpc/include/asm/book3s/64/kup.h | 18 +++++++++---------
>>   arch/powerpc/include/asm/mmu.h           | 14 +++++++-------
>>   arch/powerpc/mm/book3s64/pkeys.c         |  2 +-
>>   3 files changed, 17 insertions(+), 17 deletions(-)
>>
>> diff --git a/arch/powerpc/include/asm/book3s/64/kup.h 
>> b/arch/powerpc/include/asm/book3s/64/kup.h
>> index 39d2e3a0d64d..1d38eab83d48 100644
>> --- a/arch/powerpc/include/asm/book3s/64/kup.h
>> +++ b/arch/powerpc/include/asm/book3s/64/kup.h
>> @@ -24,7 +24,7 @@
>>       mtspr    SPRN_AMR, \gpr2
>>       /* No isync required, see kuap_restore_amr() */
>>   998:
>> -    END_MMU_FTR_SECTION_NESTED_IFSET(MMU_FTR_RADIX_KUAP, 67)
>> +    END_MMU_FTR_SECTION_NESTED_IFSET(MMU_FTR_KUAP, 67)
>>   #endif
>>   .endm
>> @@ -37,7 +37,7 @@
>>       sldi    \gpr2, \gpr2, AMR_KUAP_SHIFT
>>   999:    tdne    \gpr1, \gpr2
>>       EMIT_BUG_ENTRY 999b, __FILE__, __LINE__, (BUGFLAG_WARNING | 
>> BUGFLAG_ONCE)
>> -    END_MMU_FTR_SECTION_NESTED_IFSET(MMU_FTR_RADIX_KUAP, 67)
>> +    END_MMU_FTR_SECTION_NESTED_IFSET(MMU_FTR_KUAP, 67)
>>   #endif
>>   .endm
>>   #endif
>> @@ -58,7 +58,7 @@
>>       mtspr    SPRN_AMR, \gpr2
>>       isync
>>   99:
>> -    END_MMU_FTR_SECTION_NESTED_IFSET(MMU_FTR_RADIX_KUAP, 67)
>> +    END_MMU_FTR_SECTION_NESTED_IFSET(MMU_FTR_KUAP, 67)
>>   #endif
>>   .endm
>> @@ -73,7 +73,7 @@ DECLARE_STATIC_KEY_FALSE(uaccess_flush_key);
>>   static inline void kuap_restore_amr(struct pt_regs *regs, unsigned 
>> long amr)
>>   {
>> -    if (mmu_has_feature(MMU_FTR_RADIX_KUAP) && unlikely(regs->kuap != 
>> amr)) {
>> +    if (mmu_has_feature(MMU_FTR_KUAP) && unlikely(regs->kuap != amr)) {
>>           isync();
>>           mtspr(SPRN_AMR, regs->kuap);
>>           /*
>> @@ -86,7 +86,7 @@ static inline void kuap_restore_amr(struct pt_regs 
>> *regs, unsigned long amr)
>>   static inline unsigned long kuap_get_and_check_amr(void)
>>   {
>> -    if (mmu_has_feature(MMU_FTR_RADIX_KUAP)) {
>> +    if (mmu_has_feature(MMU_FTR_KUAP)) {
>>           unsigned long amr = mfspr(SPRN_AMR);
>>           if (IS_ENABLED(CONFIG_PPC_KUAP_DEBUG)) /* kuap_check_amr() */
>>               WARN_ON_ONCE(amr != AMR_KUAP_BLOCKED);
>> @@ -97,7 +97,7 @@ static inline unsigned long 
>> kuap_get_and_check_amr(void)
>>   static inline void kuap_check_amr(void)
>>   {
>> -    if (IS_ENABLED(CONFIG_PPC_KUAP_DEBUG) && 
>> mmu_has_feature(MMU_FTR_RADIX_KUAP))
>> +    if (IS_ENABLED(CONFIG_PPC_KUAP_DEBUG) && 
>> mmu_has_feature(MMU_FTR_KUAP))
>>           WARN_ON_ONCE(mfspr(SPRN_AMR) != AMR_KUAP_BLOCKED);
>>   }
>> @@ -116,7 +116,7 @@ static inline unsigned long get_kuap(void)
>>        * This has no effect in terms of actually blocking things on hash,
>>        * so it doesn't break anything.
>>        */
>> -    if (!early_mmu_has_feature(MMU_FTR_RADIX_KUAP))
>> +    if (!early_mmu_has_feature(MMU_FTR_KUAP))
>>           return AMR_KUAP_BLOCKED;
>>       return mfspr(SPRN_AMR);
>> @@ -124,7 +124,7 @@ static inline unsigned long get_kuap(void)
>>   static inline void set_kuap(unsigned long value)
>>   {
>> -    if (!early_mmu_has_feature(MMU_FTR_RADIX_KUAP))
>> +    if (!early_mmu_has_feature(MMU_FTR_KUAP))
>>           return;
>>       /*
>> @@ -139,7 +139,7 @@ static inline void set_kuap(unsigned long value)
>>   static inline bool
>>   bad_kuap_fault(struct pt_regs *regs, unsigned long address, bool 
>> is_write)
>>   {
>> -    return WARN(mmu_has_feature(MMU_FTR_RADIX_KUAP) &&
>> +    return WARN(mmu_has_feature(MMU_FTR_KUAP) &&
>>               (regs->kuap & (is_write ? AMR_KUAP_BLOCK_WRITE : 
>> AMR_KUAP_BLOCK_READ)),
>>               "Bug: %s fault blocked by AMR!", is_write ? "Write" : 
>> "Read");
>>   }
>> diff --git a/arch/powerpc/include/asm/mmu.h 
>> b/arch/powerpc/include/asm/mmu.h
>> index 255a1837e9f7..f5c7a17c198a 100644
>> --- a/arch/powerpc/include/asm/mmu.h
>> +++ b/arch/powerpc/include/asm/mmu.h
>> @@ -28,6 +28,11 @@
>>    * Individual features below.
>>    */
>> +/*
>> + * Supports KUAP (key 0 controlling userspace addresses) on radix
>> + */
>> +#define MMU_FTR_KUAP            ASM_CONST(0x00000200)
>> +
>>   /*
>>    * Support for KUEP feature.
>>    */
>> @@ -120,11 +125,6 @@
>>    */
>>   #define MMU_FTR_1T_SEGMENT        ASM_CONST(0x40000000)
>> -/*
>> - * Supports KUAP (key 0 controlling userspace addresses) on radix
>> - */
>> -#define MMU_FTR_RADIX_KUAP        ASM_CONST(0x80000000)
>> -
>>   /* MMU feature bit sets for various CPUs */
>>   #define MMU_FTRS_DEFAULT_HPTE_ARCH_V2    \
>>       MMU_FTR_HPTE_TABLE | MMU_FTR_PPCAS_ARCH_V2
>> @@ -187,10 +187,10 @@ enum {
>>   #ifdef CONFIG_PPC_RADIX_MMU
>>           MMU_FTR_TYPE_RADIX |
>>           MMU_FTR_GTSE |
>> +#endif /* CONFIG_PPC_RADIX_MMU */
>>   #ifdef CONFIG_PPC_KUAP
>> -        MMU_FTR_RADIX_KUAP |
>> +    MMU_FTR_KUAP |
>>   #endif /* CONFIG_PPC_KUAP */
>> -#endif /* CONFIG_PPC_RADIX_MMU */
>>   #ifdef CONFIG_PPC_MEM_KEYS
>>       MMU_FTR_PKEY |
>>   #endif
>> diff --git a/arch/powerpc/mm/book3s64/pkeys.c 
>> b/arch/powerpc/mm/book3s64/pkeys.c
>> index 82c722fbce52..bfc27f1f0ab0 100644
>> --- a/arch/powerpc/mm/book3s64/pkeys.c
>> +++ b/arch/powerpc/mm/book3s64/pkeys.c
>> @@ -258,7 +258,7 @@ void __init setup_kuap(bool disabled)
>>       if (smp_processor_id() == boot_cpuid) {
>>           pr_info("Activating Kernel Userspace Access Prevention\n");
>> -        cur_cpu_spec->mmu_features |= MMU_FTR_RADIX_KUAP;
>> +        cur_cpu_spec->mmu_features |= MMU_FTR_KUAP;
>>       }
>>       /*
>>

