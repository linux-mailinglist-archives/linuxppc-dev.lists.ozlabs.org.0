Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8897D2C4248
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Nov 2020 15:41:30 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ch3VZ5cz6zDqtV
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Nov 2020 01:41:26 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Ch2yL6tNTzDqd7
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Nov 2020 01:16:57 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4Ch2yD5VPmzB09ZR;
 Wed, 25 Nov 2020 15:16:52 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id 64YuBe0REcDv; Wed, 25 Nov 2020 15:16:52 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4Ch2yD4S9pzB09ZL;
 Wed, 25 Nov 2020 15:16:52 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 0920A8B7DD;
 Wed, 25 Nov 2020 15:16:54 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 85R0g-darUVa; Wed, 25 Nov 2020 15:16:53 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id E4AC28B7DC;
 Wed, 25 Nov 2020 15:16:52 +0100 (CET)
Subject: Re: [PATCH v6 10/22] powerpc/book3s64/pkeys: Store/restore userspace
 AMR/IAMR correctly on entry and exit from kernel
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au
References: <20201125051634.509286-1-aneesh.kumar@linux.ibm.com>
 <20201125051634.509286-11-aneesh.kumar@linux.ibm.com>
 <5f7a467a-c4c7-76b1-5837-34db0f4db51e@csgroup.eu>
 <5a471282-ff4f-cfea-8d30-a0479f0385a1@linux.ibm.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <80677c01-8eaf-fa5f-dedd-65f2d883b8d2@csgroup.eu>
Date: Wed, 25 Nov 2020 15:16:51 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <5a471282-ff4f-cfea-8d30-a0479f0385a1@linux.ibm.com>
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
Cc: Sandipan Das <sandipan@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 25/11/2020 à 14:55, Aneesh Kumar K.V a écrit :
> On 11/25/20 7:22 PM, Christophe Leroy wrote:
>>
>>
>> Le 25/11/2020 à 06:16, Aneesh Kumar K.V a écrit :
>>> This prepare kernel to operate with a different value than userspace AMR/IAMR.
>>> For this, AMR/IAMR need to be saved and restored on entry and return from the
>>> kernel.
>>>
>>> With KUAP we modify kernel AMR when accessing user address from the kernel
>>> via copy_to/from_user interfaces. We don't need to modify IAMR value in
>>> similar fashion.
>>>
>>> If MMU_FTR_PKEY is enabled we need to save AMR/IAMR in pt_regs on entering
>>> kernel from userspace. If not we can assume that AMR/IAMR is not modified
>>> from userspace.
>>>
>>> We need to save AMR if we have MMU_FTR_KUAP feature enabled and we are
>>> interrupted within kernel. This is required so that if we get interrupted
>>> within copy_to/from_user we continue with the right AMR value.
>>>
>>> If we hae MMU_FTR_KUEP enabled we need to restore IAMR on return to userspace
>>> beause kernel will be running with a different IAMR value.
>>>
>>> Reviewed-by: Sandipan Das <sandipan@linux.ibm.com>
>>> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
>>> ---
>>>   arch/powerpc/include/asm/book3s/64/kup.h | 222 +++++++++++++++++++----
>>>   arch/powerpc/include/asm/ptrace.h        |   5 +-
>>>   arch/powerpc/kernel/asm-offsets.c        |   2 +
>>>   arch/powerpc/kernel/entry_64.S           |   6 +-
>>>   arch/powerpc/kernel/exceptions-64s.S     |   4 +-
>>>   arch/powerpc/kernel/syscall_64.c         |  32 +++-
>>>   6 files changed, 225 insertions(+), 46 deletions(-)
>>>
>>> diff --git a/arch/powerpc/include/asm/book3s/64/kup.h b/arch/powerpc/include/asm/book3s/64/kup.h
>>> index 1d38eab83d48..4dbb2d53fd8f 100644
>>> --- a/arch/powerpc/include/asm/book3s/64/kup.h
>>> +++ b/arch/powerpc/include/asm/book3s/64/kup.h
>>> @@ -13,17 +13,46 @@
>>>   #ifdef __ASSEMBLY__
>>> -.macro kuap_restore_amr    gpr1, gpr2
>>> -#ifdef CONFIG_PPC_KUAP
>>> +.macro kuap_restore_user_amr gpr1
>>> +#if defined(CONFIG_PPC_PKEY)
>>>       BEGIN_MMU_FTR_SECTION_NESTED(67)
>>> -    mfspr    \gpr1, SPRN_AMR
>>> +    /*
>>> +     * AMR and IAMR are going to be different when
>>> +     * returning to userspace.
>>> +     */
>>> +    ld    \gpr1, STACK_REGS_AMR(r1)
>>> +    isync
>>> +    mtspr    SPRN_AMR, \gpr1
>>> +    /*
>>> +     * Restore IAMR only when returning to userspace
>>> +     */
>>> +    ld    \gpr1, STACK_REGS_IAMR(r1)
>>> +    mtspr    SPRN_IAMR, \gpr1
>>> +
>>> +    /* No isync required, see kuap_restore_user_amr() */
>>> +    END_MMU_FTR_SECTION_NESTED_IFSET(MMU_FTR_PKEY, 67)
>>> +#endif
>>> +.endm
>>> +
>>> +.macro kuap_restore_kernel_amr    gpr1, gpr2
>>> +#if defined(CONFIG_PPC_PKEY)
>>> +
>>> +    BEGIN_MMU_FTR_SECTION_NESTED(67)
>>> +    /*
>>> +     * AMR is going to be mostly the same since we are
>>> +     * returning to the kernel. Compare and do a mtspr.
>>> +     */
>>>       ld    \gpr2, STACK_REGS_AMR(r1)
>>> +    mfspr    \gpr1, SPRN_AMR
>>>       cmpd    \gpr1, \gpr2
>>> -    beq    998f
>>> +    beq    100f
>>>       isync
>>>       mtspr    SPRN_AMR, \gpr2
>>> -    /* No isync required, see kuap_restore_amr() */
>>> -998:
>>> +    /*
>>> +     * No isync required, see kuap_restore_amr()
>>> +     * No need to restore IAMR when returning to kernel space.
>>> +     */
>>> +100:
>>>       END_MMU_FTR_SECTION_NESTED_IFSET(MMU_FTR_KUAP, 67)
>>>   #endif
>>>   .endm
>>> @@ -42,23 +71,98 @@
>>>   .endm
>>>   #endif
>>> +/*
>>> + *    if (pkey) {
>>> + *
>>> + *        save AMR -> stack;
>>> + *        if (kuap) {
>>> + *            if (AMR != BLOCKED)
>>> + *                KUAP_BLOCKED -> AMR;
>>> + *        }
>>> + *        if (from_user) {
>>> + *            save IAMR -> stack;
>>> + *            if (kuep) {
>>> + *                KUEP_BLOCKED ->IAMR
>>> + *            }
>>> + *        }
>>> + *        return;
>>> + *    }
>>> + *
>>> + *    if (kuap) {
>>> + *        if (from_kernel) {
>>> + *            save AMR -> stack;
>>> + *            if (AMR != BLOCKED)
>>> + *                KUAP_BLOCKED -> AMR;
>>> + *        }
>>> + *
>>> + *    }
>>> + */
>>>   .macro kuap_save_amr_and_lock gpr1, gpr2, use_cr, msr_pr_cr
>>> -#ifdef CONFIG_PPC_KUAP
>>> +#if defined(CONFIG_PPC_PKEY)
>>> +
>>> +    /*
>>> +     * if both pkey and kuap is disabled, nothing to do
>>> +     */
>>> +    BEGIN_MMU_FTR_SECTION_NESTED(68)
>>> +    b    100f  // skip_save_amr
>>> +    END_MMU_FTR_SECTION_NESTED_IFCLR(MMU_FTR_PKEY | MMU_FTR_KUAP, 68)
>>> +
>>> +    /*
>>> +     * if pkey is disabled and we are entering from userspace
>>> +     * don't do anything.
>>> +     */
>>>       BEGIN_MMU_FTR_SECTION_NESTED(67)
>>>       .ifnb \msr_pr_cr
>>> -    bne    \msr_pr_cr, 99f
>>> +    /*
>>> +     * Without pkey we are not changing AMR outside the kernel
>>> +     * hence skip this completely.
>>> +     */
>>> +    bne    \msr_pr_cr, 100f  // from userspace
>>>       .endif
>>> +        END_MMU_FTR_SECTION_NESTED_IFCLR(MMU_FTR_PKEY, 67)
>>> +
>>> +    /*
>>> +     * pkey is enabled or pkey is disabled but entering from kernel
>>> +     */
>>>       mfspr    \gpr1, SPRN_AMR
>>>       std    \gpr1, STACK_REGS_AMR(r1)
>>> -    li    \gpr2, (AMR_KUAP_BLOCKED >> AMR_KUAP_SHIFT)
>>> -    sldi    \gpr2, \gpr2, AMR_KUAP_SHIFT
>>> +
>>> +    /*
>>> +     * update kernel AMR with AMR_KUAP_BLOCKED only
>>> +     * if KUAP feature is enabled
>>> +     */
>>> +    BEGIN_MMU_FTR_SECTION_NESTED(69)
>>> +    LOAD_REG_IMMEDIATE(\gpr2, AMR_KUAP_BLOCKED)
>>>       cmpd    \use_cr, \gpr1, \gpr2
>>> -    beq    \use_cr, 99f
>>> -    // We don't isync here because we very recently entered via rfid
>>> +    beq    \use_cr, 102f
>>> +    /*
>>> +     * We don't isync here because we very recently entered via an interrupt
>>> +     */
>>>       mtspr    SPRN_AMR, \gpr2
>>>       isync
>>> -99:
>>> -    END_MMU_FTR_SECTION_NESTED_IFSET(MMU_FTR_KUAP, 67)
>>> +102:
>>> +    END_MMU_FTR_SECTION_NESTED_IFSET(MMU_FTR_KUAP, 69)
>>> +
>>> +    /*
>>> +     * if entering from kernel we don't need save IAMR
>>> +     */
>>> +    .ifnb \msr_pr_cr
>>> +    beq    \msr_pr_cr, 100f // from kernel space
>>> +    mfspr    \gpr1, SPRN_IAMR
>>> +    std    \gpr1, STACK_REGS_IAMR(r1)
>>> +
>>> +    /*
>>> +     * update kernel IAMR with AMR_KUEP_BLOCKED only
>>> +     * if KUEP feature is enabled
>>> +     */
>>> +    BEGIN_MMU_FTR_SECTION_NESTED(70)
>>> +    LOAD_REG_IMMEDIATE(\gpr2, AMR_KUEP_BLOCKED)
>>> +    mtspr    SPRN_IAMR, \gpr2
>>> +    isync
>>> +    END_MMU_FTR_SECTION_NESTED_IFSET(MMU_FTR_KUEP, 70)
>>> +    .endif
>>> +
>>> +100: // skip_save_amr
>>>   #endif
>>>   .endm
>>> @@ -66,22 +170,42 @@
>>>   DECLARE_STATIC_KEY_FALSE(uaccess_flush_key);
>>> -#ifdef CONFIG_PPC_KUAP
>>> +#ifdef CONFIG_PPC_PKEY
>>>   #include <asm/mmu.h>
>>>   #include <asm/ptrace.h>
>>> -static inline void kuap_restore_amr(struct pt_regs *regs, unsigned long amr)
>>> +static inline void kuap_restore_user_amr(struct pt_regs *regs)
>>
>> While we are at changing the function's names, could we remove the _amr from the names in order to 
>> make it more generic and allow to re-use that name when we migrate PPC32 to C interrupt/syscall 
>> entries/exits ? (see 
>> https://patchwork.ozlabs.org/project/linuxppc-dev/patch/302a0e88e15ce4569d9619631b36248041d5ed27.1586196948.git.christophe.leroy@c-s.fr/) 
>>
> 
> How do you suggest we rename it? kuap_restore_user is a bit ambiguous right?
> 

I have never been really good at finding names.

What about kuap_user_restore() and kuap_kernel_restore() ?
