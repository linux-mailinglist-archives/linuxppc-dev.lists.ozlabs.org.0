Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D1292C421A
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Nov 2020 15:21:16 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ch33C1qP0zDqrV
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Nov 2020 01:21:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=kw4wSp0q; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Ch2Tw2ZpDzDqpp
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Nov 2020 00:55:48 +1100 (AEDT)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0APDWI6A052339; Wed, 25 Nov 2020 08:55:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=ohBBjyD53D2zywFtvOFDZfTXwmGM4gWkNcfm+jdnmqg=;
 b=kw4wSp0qnxU8toL+FK2ONbsOTIqeke3yG02kSs2Eel6DMrcSq2Td8HKNIpmEz72TFFB+
 9VwaJcT3YfqZ4RQHN+8ETJQVqSBkmrgBDv8sFYOcY45/BGr1m33O0N1TP0eKJP4YdM0l
 nPpGBaoFTpK3Za6sUmG4B4E3DR/vmOMBgCzibnPl6yIGiiL2+jGY07N9cHXuHBFBaqjs
 7WRpX6KXZ7qy2D0RA/W0TrG5vEC2jBThYiYXmW4lUA0jKQREvvQCo9R+45DDeFeliyJ6
 1nORVjH0foBoZcN2sNMAKsUDAWRK2zulRXqEbPPMSSgd0SLfLErRrDMM0ZVu5epsHgoi 2w== 
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0a-001b2d01.pphosted.com with ESMTP id 351nrkwe6s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 25 Nov 2020 08:55:27 -0500
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0APDr4v5028169;
 Wed, 25 Nov 2020 13:55:19 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma06fra.de.ibm.com with ESMTP id 351pca026w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 25 Nov 2020 13:55:18 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 0APDtG6x49742120
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 25 Nov 2020 13:55:16 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C9D5042041;
 Wed, 25 Nov 2020 13:55:15 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7A6884204C;
 Wed, 25 Nov 2020 13:55:14 +0000 (GMT)
Received: from [9.77.195.3] (unknown [9.77.195.3])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 25 Nov 2020 13:55:14 +0000 (GMT)
Subject: Re: [PATCH v6 10/22] powerpc/book3s64/pkeys: Store/restore userspace
 AMR/IAMR correctly on entry and exit from kernel
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au
References: <20201125051634.509286-1-aneesh.kumar@linux.ibm.com>
 <20201125051634.509286-11-aneesh.kumar@linux.ibm.com>
 <5f7a467a-c4c7-76b1-5837-34db0f4db51e@csgroup.eu>
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Message-ID: <5a471282-ff4f-cfea-8d30-a0479f0385a1@linux.ibm.com>
Date: Wed, 25 Nov 2020 19:25:13 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <5f7a467a-c4c7-76b1-5837-34db0f4db51e@csgroup.eu>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-25_08:2020-11-25,
 2020-11-25 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 mlxscore=0
 clxscore=1015 mlxlogscore=999 spamscore=0 bulkscore=0 lowpriorityscore=0
 malwarescore=0 priorityscore=1501 adultscore=0 phishscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2011250080
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
Cc: Sandipan Das <sandipan@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 11/25/20 7:22 PM, Christophe Leroy wrote:
> 
> 
> Le 25/11/2020 à 06:16, Aneesh Kumar K.V a écrit :
>> This prepare kernel to operate with a different value than userspace 
>> AMR/IAMR.
>> For this, AMR/IAMR need to be saved and restored on entry and return 
>> from the
>> kernel.
>>
>> With KUAP we modify kernel AMR when accessing user address from the 
>> kernel
>> via copy_to/from_user interfaces. We don't need to modify IAMR value in
>> similar fashion.
>>
>> If MMU_FTR_PKEY is enabled we need to save AMR/IAMR in pt_regs on 
>> entering
>> kernel from userspace. If not we can assume that AMR/IAMR is not modified
>> from userspace.
>>
>> We need to save AMR if we have MMU_FTR_KUAP feature enabled and we are
>> interrupted within kernel. This is required so that if we get interrupted
>> within copy_to/from_user we continue with the right AMR value.
>>
>> If we hae MMU_FTR_KUEP enabled we need to restore IAMR on return to 
>> userspace
>> beause kernel will be running with a different IAMR value.
>>
>> Reviewed-by: Sandipan Das <sandipan@linux.ibm.com>
>> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
>> ---
>>   arch/powerpc/include/asm/book3s/64/kup.h | 222 +++++++++++++++++++----
>>   arch/powerpc/include/asm/ptrace.h        |   5 +-
>>   arch/powerpc/kernel/asm-offsets.c        |   2 +
>>   arch/powerpc/kernel/entry_64.S           |   6 +-
>>   arch/powerpc/kernel/exceptions-64s.S     |   4 +-
>>   arch/powerpc/kernel/syscall_64.c         |  32 +++-
>>   6 files changed, 225 insertions(+), 46 deletions(-)
>>
>> diff --git a/arch/powerpc/include/asm/book3s/64/kup.h 
>> b/arch/powerpc/include/asm/book3s/64/kup.h
>> index 1d38eab83d48..4dbb2d53fd8f 100644
>> --- a/arch/powerpc/include/asm/book3s/64/kup.h
>> +++ b/arch/powerpc/include/asm/book3s/64/kup.h
>> @@ -13,17 +13,46 @@
>>   #ifdef __ASSEMBLY__
>> -.macro kuap_restore_amr    gpr1, gpr2
>> -#ifdef CONFIG_PPC_KUAP
>> +.macro kuap_restore_user_amr gpr1
>> +#if defined(CONFIG_PPC_PKEY)
>>       BEGIN_MMU_FTR_SECTION_NESTED(67)
>> -    mfspr    \gpr1, SPRN_AMR
>> +    /*
>> +     * AMR and IAMR are going to be different when
>> +     * returning to userspace.
>> +     */
>> +    ld    \gpr1, STACK_REGS_AMR(r1)
>> +    isync
>> +    mtspr    SPRN_AMR, \gpr1
>> +    /*
>> +     * Restore IAMR only when returning to userspace
>> +     */
>> +    ld    \gpr1, STACK_REGS_IAMR(r1)
>> +    mtspr    SPRN_IAMR, \gpr1
>> +
>> +    /* No isync required, see kuap_restore_user_amr() */
>> +    END_MMU_FTR_SECTION_NESTED_IFSET(MMU_FTR_PKEY, 67)
>> +#endif
>> +.endm
>> +
>> +.macro kuap_restore_kernel_amr    gpr1, gpr2
>> +#if defined(CONFIG_PPC_PKEY)
>> +
>> +    BEGIN_MMU_FTR_SECTION_NESTED(67)
>> +    /*
>> +     * AMR is going to be mostly the same since we are
>> +     * returning to the kernel. Compare and do a mtspr.
>> +     */
>>       ld    \gpr2, STACK_REGS_AMR(r1)
>> +    mfspr    \gpr1, SPRN_AMR
>>       cmpd    \gpr1, \gpr2
>> -    beq    998f
>> +    beq    100f
>>       isync
>>       mtspr    SPRN_AMR, \gpr2
>> -    /* No isync required, see kuap_restore_amr() */
>> -998:
>> +    /*
>> +     * No isync required, see kuap_restore_amr()
>> +     * No need to restore IAMR when returning to kernel space.
>> +     */
>> +100:
>>       END_MMU_FTR_SECTION_NESTED_IFSET(MMU_FTR_KUAP, 67)
>>   #endif
>>   .endm
>> @@ -42,23 +71,98 @@
>>   .endm
>>   #endif
>> +/*
>> + *    if (pkey) {
>> + *
>> + *        save AMR -> stack;
>> + *        if (kuap) {
>> + *            if (AMR != BLOCKED)
>> + *                KUAP_BLOCKED -> AMR;
>> + *        }
>> + *        if (from_user) {
>> + *            save IAMR -> stack;
>> + *            if (kuep) {
>> + *                KUEP_BLOCKED ->IAMR
>> + *            }
>> + *        }
>> + *        return;
>> + *    }
>> + *
>> + *    if (kuap) {
>> + *        if (from_kernel) {
>> + *            save AMR -> stack;
>> + *            if (AMR != BLOCKED)
>> + *                KUAP_BLOCKED -> AMR;
>> + *        }
>> + *
>> + *    }
>> + */
>>   .macro kuap_save_amr_and_lock gpr1, gpr2, use_cr, msr_pr_cr
>> -#ifdef CONFIG_PPC_KUAP
>> +#if defined(CONFIG_PPC_PKEY)
>> +
>> +    /*
>> +     * if both pkey and kuap is disabled, nothing to do
>> +     */
>> +    BEGIN_MMU_FTR_SECTION_NESTED(68)
>> +    b    100f  // skip_save_amr
>> +    END_MMU_FTR_SECTION_NESTED_IFCLR(MMU_FTR_PKEY | MMU_FTR_KUAP, 68)
>> +
>> +    /*
>> +     * if pkey is disabled and we are entering from userspace
>> +     * don't do anything.
>> +     */
>>       BEGIN_MMU_FTR_SECTION_NESTED(67)
>>       .ifnb \msr_pr_cr
>> -    bne    \msr_pr_cr, 99f
>> +    /*
>> +     * Without pkey we are not changing AMR outside the kernel
>> +     * hence skip this completely.
>> +     */
>> +    bne    \msr_pr_cr, 100f  // from userspace
>>       .endif
>> +        END_MMU_FTR_SECTION_NESTED_IFCLR(MMU_FTR_PKEY, 67)
>> +
>> +    /*
>> +     * pkey is enabled or pkey is disabled but entering from kernel
>> +     */
>>       mfspr    \gpr1, SPRN_AMR
>>       std    \gpr1, STACK_REGS_AMR(r1)
>> -    li    \gpr2, (AMR_KUAP_BLOCKED >> AMR_KUAP_SHIFT)
>> -    sldi    \gpr2, \gpr2, AMR_KUAP_SHIFT
>> +
>> +    /*
>> +     * update kernel AMR with AMR_KUAP_BLOCKED only
>> +     * if KUAP feature is enabled
>> +     */
>> +    BEGIN_MMU_FTR_SECTION_NESTED(69)
>> +    LOAD_REG_IMMEDIATE(\gpr2, AMR_KUAP_BLOCKED)
>>       cmpd    \use_cr, \gpr1, \gpr2
>> -    beq    \use_cr, 99f
>> -    // We don't isync here because we very recently entered via rfid
>> +    beq    \use_cr, 102f
>> +    /*
>> +     * We don't isync here because we very recently entered via an 
>> interrupt
>> +     */
>>       mtspr    SPRN_AMR, \gpr2
>>       isync
>> -99:
>> -    END_MMU_FTR_SECTION_NESTED_IFSET(MMU_FTR_KUAP, 67)
>> +102:
>> +    END_MMU_FTR_SECTION_NESTED_IFSET(MMU_FTR_KUAP, 69)
>> +
>> +    /*
>> +     * if entering from kernel we don't need save IAMR
>> +     */
>> +    .ifnb \msr_pr_cr
>> +    beq    \msr_pr_cr, 100f // from kernel space
>> +    mfspr    \gpr1, SPRN_IAMR
>> +    std    \gpr1, STACK_REGS_IAMR(r1)
>> +
>> +    /*
>> +     * update kernel IAMR with AMR_KUEP_BLOCKED only
>> +     * if KUEP feature is enabled
>> +     */
>> +    BEGIN_MMU_FTR_SECTION_NESTED(70)
>> +    LOAD_REG_IMMEDIATE(\gpr2, AMR_KUEP_BLOCKED)
>> +    mtspr    SPRN_IAMR, \gpr2
>> +    isync
>> +    END_MMU_FTR_SECTION_NESTED_IFSET(MMU_FTR_KUEP, 70)
>> +    .endif
>> +
>> +100: // skip_save_amr
>>   #endif
>>   .endm
>> @@ -66,22 +170,42 @@
>>   DECLARE_STATIC_KEY_FALSE(uaccess_flush_key);
>> -#ifdef CONFIG_PPC_KUAP
>> +#ifdef CONFIG_PPC_PKEY
>>   #include <asm/mmu.h>
>>   #include <asm/ptrace.h>
>> -static inline void kuap_restore_amr(struct pt_regs *regs, unsigned 
>> long amr)
>> +static inline void kuap_restore_user_amr(struct pt_regs *regs)
> 
> While we are at changing the function's names, could we remove the _amr 
> from the names in order to make it more generic and allow to re-use that 
> name when we migrate PPC32 to C interrupt/syscall entries/exits ? (see 
> https://patchwork.ozlabs.org/project/linuxppc-dev/patch/302a0e88e15ce4569d9619631b36248041d5ed27.1586196948.git.christophe.leroy@c-s.fr/) 
> 

How do you suggest we rename it? kuap_restore_user is a bit ambiguous right?

-aneesh
