Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D52AA2137BC
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Jul 2020 11:32:24 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49yqVt0Ff1zDqW2
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Jul 2020 19:32:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49yqSj0zzWzDqS1
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Jul 2020 19:30:28 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06393kxl150239; Fri, 3 Jul 2020 05:30:21 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 321ng1tgef-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 03 Jul 2020 05:30:20 -0400
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 06394HCW152994;
 Fri, 3 Jul 2020 05:30:20 -0400
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0a-001b2d01.pphosted.com with ESMTP id 321ng1tgdg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 03 Jul 2020 05:30:20 -0400
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0639GSVp005318;
 Fri, 3 Jul 2020 09:30:18 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma03fra.de.ibm.com with ESMTP id 31wwr8bbka-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 03 Jul 2020 09:30:18 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0639UGRJ60948668
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 3 Jul 2020 09:30:16 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 652F34203F;
 Fri,  3 Jul 2020 09:30:16 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7341842045;
 Fri,  3 Jul 2020 09:30:14 +0000 (GMT)
Received: from [9.79.210.163] (unknown [9.79.210.163])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri,  3 Jul 2020 09:30:14 +0000 (GMT)
Subject: Re: [PATCH v4 24/41] powerpc/book3s64/pkeys: Store/restore userspace
 AMR correctly on entry and exit from kernel
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org,
 mpe@ellerman.id.au
References: <20200615061430.770174-1-aneesh.kumar@linux.ibm.com>
 <20200615061430.770174-25-aneesh.kumar@linux.ibm.com>
 <1593766495.dqos6wxr3o.astroid@bobo.none>
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Message-ID: <83a38d37-099a-7b98-1262-c16b4f5a0cc4@linux.ibm.com>
Date: Fri, 3 Jul 2020 15:00:13 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <1593766495.dqos6wxr3o.astroid@bobo.none>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-03_03:2020-07-02,
 2020-07-03 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015
 cotscore=-2147483648 phishscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 malwarescore=0 mlxlogscore=999 bulkscore=0 mlxscore=0
 adultscore=0 spamscore=0 suspectscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2007030068
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
Cc: linuxram@us.ibm.com, bauerman@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 7/3/20 2:48 PM, Nicholas Piggin wrote:
> Excerpts from Aneesh Kumar K.V's message of June 15, 2020 4:14 pm:
>> This prepare kernel to operate with a different value than userspace AMR.
>> For this, AMR needs to be saved and restored on entry and return from the
>> kernel.
>>
>> With KUAP we modify kernel AMR when accessing user address from the kernel
>> via copy_to/from_user interfaces.
>>
>> If MMU_FTR_KEY is enabled we always use the key mechanism to implement KUAP
>> feature. If MMU_FTR_KEY is not supported and if we support MMU_FTR_KUAP
>> (radix translation on POWER9), we can skip restoring AMR on return
>> to userspace. Userspace won't be using AMR in that specific config.
>>
>> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
>> ---
>>   arch/powerpc/include/asm/book3s/64/kup.h | 141 ++++++++++++++++++-----
>>   arch/powerpc/kernel/entry_64.S           |   6 +-
>>   arch/powerpc/kernel/exceptions-64s.S     |   4 +-
>>   arch/powerpc/kernel/syscall_64.c         |  26 ++++-
>>   4 files changed, 144 insertions(+), 33 deletions(-)
>>
>> diff --git a/arch/powerpc/include/asm/book3s/64/kup.h b/arch/powerpc/include/asm/book3s/64/kup.h
>> index e6ee1c34842f..6979cd1a0003 100644
>> --- a/arch/powerpc/include/asm/book3s/64/kup.h
>> +++ b/arch/powerpc/include/asm/book3s/64/kup.h
>> @@ -13,18 +13,47 @@
>>   
>>   #ifdef __ASSEMBLY__
>>   
>> -.macro kuap_restore_amr	gpr1, gpr2
>> -#ifdef CONFIG_PPC_KUAP
>> +.macro kuap_restore_user_amr gpr1
>> +#if defined(CONFIG_PPC_MEM_KEYS)
>>   	BEGIN_MMU_FTR_SECTION_NESTED(67)
>> -	mfspr	\gpr1, SPRN_AMR
>> +	/*
>> +	 * AMR is going to be different when
>> +	 * returning to userspace.
>> +	 */
>> +	ld	\gpr1, STACK_REGS_KUAP(r1)
>> +	isync
>> +	mtspr	SPRN_AMR, \gpr1
>> +
>> +	/* No isync required, see kuap_restore_user_amr() */
>> +	END_MMU_FTR_SECTION_NESTED_IFSET(MMU_FTR_PKEY , 67)
>> +#endif
>> +.endm
>> +
>> +.macro kuap_restore_kernel_amr	gpr1, gpr2
>> +#if defined(CONFIG_PPC_MEM_KEYS)
>> +	BEGIN_MMU_FTR_SECTION_NESTED(67)
>> +	b	99f  // handle_pkey_restore_amr
>> +	END_MMU_FTR_SECTION_NESTED_IFSET(MMU_FTR_PKEY , 67)
>> +
>> +	BEGIN_MMU_FTR_SECTION_NESTED(68)
>> +	b	99f  // handle_kuap_restore_amr
>> +	MMU_FTR_SECTION_ELSE_NESTED(68)
>> +	b	100f  // skip_restore_amr
>> +	ALT_MMU_FTR_SECTION_END_NESTED_IFSET(MMU_FTR_KUAP, 68)
>> +
>> +99:
>> +	/*
>> +	 * AMR is going to be mostly the same since we are
>> +	 * returning to the kernel. Compare and do a mtspr.
>> +	 */
>>   	ld	\gpr2, STACK_REGS_KUAP(r1)
>> +	mfspr	\gpr1, SPRN_AMR
>>   	cmpd	\gpr1, \gpr2
>> -	beq	998f
>> +	beq	100f
>>   	isync
>>   	mtspr	SPRN_AMR, \gpr2
>>   	/* No isync required, see kuap_restore_amr() */
>> -998:
>> -	END_MMU_FTR_SECTION_NESTED_IFSET(MMU_FTR_KUAP, 67)
>> +100:  // skip_restore_amr
> 
> Can't you code it like this? (_IFCLR requires none of the bits to be
> set)
> 
> BEGIN_MMU_FTR_SECTION_NESTED(67)
> 	b	99f	// nothing using AMR, no need to restore
> END_MMU_FTR_SECTION_NESTED_IFCLR(MMU_FTR_PKEY | MMU_FTR_KUAP, 67)
> 
> That saves you a branch in the common case of using AMR. Similar
> for others.



Yes i could switch to that. The code is taking extra 200 cycles even 
with KUAP/KUEP disabled and no keys being used on hash. I am yet to 
analyze this closely. So will rework things based on that analysis.

> 
>> @@ -69,22 +133,40 @@
>>   
>>   extern u64 default_uamor;
>>   
>> -static inline void kuap_restore_amr(struct pt_regs *regs, unsigned long amr)
>> +static inline void kuap_restore_user_amr(struct pt_regs *regs)
>>   {
>> -	if (mmu_has_feature(MMU_FTR_KUAP) && unlikely(regs->kuap != amr)) {
>> -		isync();
>> -		mtspr(SPRN_AMR, regs->kuap);
>> -		/*
>> -		 * No isync required here because we are about to RFI back to
>> -		 * previous context before any user accesses would be made,
>> -		 * which is a CSI.
>> -		 */
>> +	if (!mmu_has_feature(MMU_FTR_PKEY))
>> +		return;
> 
> If you have PKEY but not KUAP, do you still have to restore?
> 


Yes, because user space pkey is now set on the exit path. This is needed 
to handle things like exec/fork().


>> +
>> +	isync();
>> +	mtspr(SPRN_AMR, regs->kuap);
>> +	/*
>> +	 * No isync required here because we are about to rfi
>> +	 * back to previous context before any user accesses
>> +	 * would be made, which is a CSI.
>> +	 */
>> +}
>> +
>> +static inline void kuap_restore_kernel_amr(struct pt_regs *regs,
>> +					   unsigned long amr)
>> +{
>> +	if (mmu_has_feature(MMU_FTR_KUAP) || mmu_has_feature(MMU_FTR_PKEY)) {
>> +
>> +		if (unlikely(regs->kuap != amr)) {
>> +			isync();
>> +			mtspr(SPRN_AMR, regs->kuap);
>> +			/*
>> +			 * No isync required here because we are about to rfi
>> +			 * back to previous context before any user accesses
>> +			 * would be made, which is a CSI.
>> +			 */
>> +		}
>>   	}
>>   }
>>   
>>   static inline unsigned long kuap_get_and_check_amr(void)
>>   {
>> -	if (mmu_has_feature(MMU_FTR_KUAP)) {
>> +	if (mmu_has_feature(MMU_FTR_KUAP) || mmu_has_feature(MMU_FTR_PKEY)) {
>>   		unsigned long amr = mfspr(SPRN_AMR);
>>   		if (IS_ENABLED(CONFIG_PPC_KUAP_DEBUG)) /* kuap_check_amr() */
>>   			WARN_ON_ONCE(amr != AMR_KUAP_BLOCKED);
> 
> We could do a static key that's based on this condition, but that can
> wait for another day.
> 
>>   
>>   static inline void kuap_check_amr(void)
>>   {
>> -	if (IS_ENABLED(CONFIG_PPC_KUAP_DEBUG) && mmu_has_feature(MMU_FTR_KUAP))
>> +	if (IS_ENABLED(CONFIG_PPC_KUAP_DEBUG) &&
>> +	    (mmu_has_feature(MMU_FTR_KUAP) || mmu_has_feature(MMU_FTR_PKEY)))
>>   		WARN_ON_ONCE(mfspr(SPRN_AMR) != AMR_KUAP_BLOCKED);
>>   }
>>   
>>   #else /* CONFIG_PPC_MEM_KEYS */
>>   
>> -static inline void kuap_restore_amr(struct pt_regs *regs, unsigned long amr)
>> +static inline void kuap_restore_user_amr(struct pt_regs *regs)
>> +{
>> +}
>> +
>> +static inline void kuap_restore_kernel_amr(struct pt_regs *regs, unsigned long amr)
>>   {
>>   }
>>   
>> @@ -113,6 +200,7 @@ static inline unsigned long kuap_get_and_check_amr(void)
>>   {
>>   	return 0;
>>   }
>> +
>>   #endif /* CONFIG_PPC_MEM_KEYS */
>>   
>>   
>> @@ -187,7 +275,6 @@ bad_kuap_fault(struct pt_regs *regs, unsigned long address, bool is_write)
>>   		    "Bug: %s fault blocked by AMR!", is_write ? "Write" : "Read");
>>   }
>>   #endif /* CONFIG_PPC_KUAP */
>> -
>>   #endif /* __ASSEMBLY__ */
>>   
>>   #endif /* _ASM_POWERPC_BOOK3S_64_KUP_H */
> 
> Unnecessary hunks.


will remove

> 
>> diff --git a/arch/powerpc/kernel/entry_64.S b/arch/powerpc/kernel/entry_64.S
>> index 9d49338e0c85..a087cbe0b17d 100644
>> --- a/arch/powerpc/kernel/entry_64.S
>> +++ b/arch/powerpc/kernel/entry_64.S
>> @@ -481,8 +481,8 @@ _ASM_NOKPROBE_SYMBOL(fast_interrupt_return)
>>   	kuap_check_amr r3, r4
>>   	ld	r5,_MSR(r1)
>>   	andi.	r0,r5,MSR_PR
>> -	bne	.Lfast_user_interrupt_return
>> -	kuap_restore_amr r3, r4
>> +	bne	.Lfast_user_interrupt_return_amr
>> +	kuap_restore_kernel_amr r3, r4
>>   	andi.	r0,r5,MSR_RI
>>   	li	r3,0 /* 0 return value, no EMULATE_STACK_STORE */
>>   	bne+	.Lfast_kernel_interrupt_return
>> @@ -502,6 +502,8 @@ _ASM_NOKPROBE_SYMBOL(interrupt_return)
>>   	cmpdi	r3,0
>>   	bne-	.Lrestore_nvgprs
>>   
>> +.Lfast_user_interrupt_return_amr:
>> +	kuap_restore_user_amr r3
>>   .Lfast_user_interrupt_return:
>>   	ld	r11,_NIP(r1)
>>   	ld	r12,_MSR(r1)
>> diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
>> index e70ebb5c318c..8226af444d77 100644
>> --- a/arch/powerpc/kernel/exceptions-64s.S
>> +++ b/arch/powerpc/kernel/exceptions-64s.S
>> @@ -971,7 +971,7 @@ EXC_COMMON_BEGIN(system_reset_common)
>>   	ld	r10,SOFTE(r1)
>>   	stb	r10,PACAIRQSOFTMASK(r13)
>>   
>> -	kuap_restore_amr r9, r10
>> +	kuap_restore_kernel_amr r9, r10
>>   	EXCEPTION_RESTORE_REGS
>>   	RFI_TO_USER_OR_KERNEL
>>   
>> @@ -2784,7 +2784,7 @@ EXC_COMMON_BEGIN(soft_nmi_common)
>>   	ld	r10,SOFTE(r1)
>>   	stb	r10,PACAIRQSOFTMASK(r13)
>>   
>> -	kuap_restore_amr r9, r10
>> +	kuap_restore_kernel_amr r9, r10
>>   	EXCEPTION_RESTORE_REGS hsrr=0
>>   	RFI_TO_KERNEL
>>   
>> diff --git a/arch/powerpc/kernel/syscall_64.c b/arch/powerpc/kernel/syscall_64.c
>> index 7e560a01afa4..fded67982fbe 100644
>> --- a/arch/powerpc/kernel/syscall_64.c
>> +++ b/arch/powerpc/kernel/syscall_64.c
>> @@ -35,7 +35,21 @@ notrace long system_call_exception(long r3, long r4, long r5,
>>   	BUG_ON(!FULL_REGS(regs));
>>   	BUG_ON(regs->softe != IRQS_ENABLED);
>>   
>> -	kuap_check_amr();
>> +#ifdef CONFIG_PPC_MEM_KEYS
>> +	if (mmu_has_feature(MMU_FTR_PKEY)) {
>> +		unsigned long amr;
>> +		/*
>> +		 * When entering from userspace we mostly have the AMR
>> +		 * different from kernel default values. Hence don't compare.
>> +		 */
>> +		amr = mfspr(SPRN_AMR);
>> +		regs->kuap = amr;
>> +		if (mmu_has_feature(MMU_FTR_KUAP))
>> +			mtspr(SPRN_AMR, AMR_KUAP_BLOCKED);
>> +		isync();
> 
> isync should be inside the if(). Again do pkeys need to save this if
> KUAP is not being used? I haven't really looked at how all that works,
> but what's changing for the PKEY && !KUAP case?
> 

There is no SPR switch in context switch now and all the AMR/IAMR 
handling is now in the exit to userspace.


> This would be nice if it could all go into a wrapper function rather
> than ifdef.
> 

will do

>> +	} else
>> +#endif
>> +		kuap_check_amr();
>>   
>>   	account_cpu_user_entry();
>>   
>> @@ -222,6 +236,10 @@ notrace unsigned long syscall_exit_prepare(unsigned long r3,
>>   
>>   	account_cpu_user_exit();
>>   
>> +	/*
>> +	 * We do this at the end so that we do context switch with KERNEL AMR
>> +	 */
>> +	kuap_restore_user_amr(regs);
>>   	return ret;
> 
> Comment doesn't make sense, newline required before return.


Ok the detail there was we need to make sure we restore AMR towrads the 
end and make sure all the kernel code continue to run with KERNEL AMR 
value. There is a schedule() call in there with _TIF_NEED_RESCHED. But 
those details are not really relevant. That was me tracking down some 
issues and writing comment around that part of the code. The only real 
detail is switch to userspace AMR in the end.



> 
>>   }
>>   
>> @@ -306,6 +324,10 @@ notrace unsigned long interrupt_exit_user_prepare(struct pt_regs *regs, unsigned
>>   
>>   	account_cpu_user_exit();
>>   
>> +	/*
>> +	 * We do this at the end so that we do context switch with KERNEL AMR
>> +	 */
>> +	kuap_restore_user_amr(regs);
> 
> Duplicated comments I prefer to just have like this instead of trying to
> keep them in sync. Can complete the circular reference by having a
> 
> * similarly in interrupt_exit_user_prepare
> 
> in the main comment, but if they come close to one another in the same
> file it's not so important to keep them together.
> 
>   +	kuap_restore_user_amr(regs); /* see syscall_exit_prepare */
> 
>>   	return ret;
>>   }
>>   
>> @@ -376,7 +398,7 @@ notrace unsigned long interrupt_exit_kernel_prepare(struct pt_regs *regs, unsign
>>   	 * which would cause Read-After-Write stalls. Hence, we take the AMR
>>   	 * value from the check above.
>>   	 */
>> -	kuap_restore_amr(regs, amr);
>> +	kuap_restore_kernel_amr(regs, amr);
>>   
>>   	return ret;
>>   }
>> -- 
>> 2.26.2
>>
>>


-aneesh
