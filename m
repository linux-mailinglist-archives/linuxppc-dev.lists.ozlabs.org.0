Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C9D4B2C419C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Nov 2020 15:04:59 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ch2hQ2gZxzDqY2
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Nov 2020 01:04:54 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Ch2QQ3Z9DzDqv2
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Nov 2020 00:52:45 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4Ch2QH549bzB09ZG;
 Wed, 25 Nov 2020 14:52:39 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id Bt-1y3jIJI9z; Wed, 25 Nov 2020 14:52:39 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4Ch2QH3ZxfzB09ZC;
 Wed, 25 Nov 2020 14:52:39 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id DD7CE8B7D9;
 Wed, 25 Nov 2020 14:52:40 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id avaLpi-dnhGu; Wed, 25 Nov 2020 14:52:40 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 230DA8B7D3;
 Wed, 25 Nov 2020 14:52:40 +0100 (CET)
Subject: Re: [PATCH v6 10/22] powerpc/book3s64/pkeys: Store/restore userspace
 AMR/IAMR correctly on entry and exit from kernel
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au
References: <20201125051634.509286-1-aneesh.kumar@linux.ibm.com>
 <20201125051634.509286-11-aneesh.kumar@linux.ibm.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <5f7a467a-c4c7-76b1-5837-34db0f4db51e@csgroup.eu>
Date: Wed, 25 Nov 2020 14:52:37 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201125051634.509286-11-aneesh.kumar@linux.ibm.com>
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



Le 25/11/2020 à 06:16, Aneesh Kumar K.V a écrit :
> This prepare kernel to operate with a different value than userspace AMR/IAMR.
> For this, AMR/IAMR need to be saved and restored on entry and return from the
> kernel.
> 
> With KUAP we modify kernel AMR when accessing user address from the kernel
> via copy_to/from_user interfaces. We don't need to modify IAMR value in
> similar fashion.
> 
> If MMU_FTR_PKEY is enabled we need to save AMR/IAMR in pt_regs on entering
> kernel from userspace. If not we can assume that AMR/IAMR is not modified
> from userspace.
> 
> We need to save AMR if we have MMU_FTR_KUAP feature enabled and we are
> interrupted within kernel. This is required so that if we get interrupted
> within copy_to/from_user we continue with the right AMR value.
> 
> If we hae MMU_FTR_KUEP enabled we need to restore IAMR on return to userspace
> beause kernel will be running with a different IAMR value.
> 
> Reviewed-by: Sandipan Das <sandipan@linux.ibm.com>
> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> ---
>   arch/powerpc/include/asm/book3s/64/kup.h | 222 +++++++++++++++++++----
>   arch/powerpc/include/asm/ptrace.h        |   5 +-
>   arch/powerpc/kernel/asm-offsets.c        |   2 +
>   arch/powerpc/kernel/entry_64.S           |   6 +-
>   arch/powerpc/kernel/exceptions-64s.S     |   4 +-
>   arch/powerpc/kernel/syscall_64.c         |  32 +++-
>   6 files changed, 225 insertions(+), 46 deletions(-)
> 
> diff --git a/arch/powerpc/include/asm/book3s/64/kup.h b/arch/powerpc/include/asm/book3s/64/kup.h
> index 1d38eab83d48..4dbb2d53fd8f 100644
> --- a/arch/powerpc/include/asm/book3s/64/kup.h
> +++ b/arch/powerpc/include/asm/book3s/64/kup.h
> @@ -13,17 +13,46 @@
>   
>   #ifdef __ASSEMBLY__
>   
> -.macro kuap_restore_amr	gpr1, gpr2
> -#ifdef CONFIG_PPC_KUAP
> +.macro kuap_restore_user_amr gpr1
> +#if defined(CONFIG_PPC_PKEY)
>   	BEGIN_MMU_FTR_SECTION_NESTED(67)
> -	mfspr	\gpr1, SPRN_AMR
> +	/*
> +	 * AMR and IAMR are going to be different when
> +	 * returning to userspace.
> +	 */
> +	ld	\gpr1, STACK_REGS_AMR(r1)
> +	isync
> +	mtspr	SPRN_AMR, \gpr1
> +	/*
> +	 * Restore IAMR only when returning to userspace
> +	 */
> +	ld	\gpr1, STACK_REGS_IAMR(r1)
> +	mtspr	SPRN_IAMR, \gpr1
> +
> +	/* No isync required, see kuap_restore_user_amr() */
> +	END_MMU_FTR_SECTION_NESTED_IFSET(MMU_FTR_PKEY, 67)
> +#endif
> +.endm
> +
> +.macro kuap_restore_kernel_amr	gpr1, gpr2
> +#if defined(CONFIG_PPC_PKEY)
> +
> +	BEGIN_MMU_FTR_SECTION_NESTED(67)
> +	/*
> +	 * AMR is going to be mostly the same since we are
> +	 * returning to the kernel. Compare and do a mtspr.
> +	 */
>   	ld	\gpr2, STACK_REGS_AMR(r1)
> +	mfspr	\gpr1, SPRN_AMR
>   	cmpd	\gpr1, \gpr2
> -	beq	998f
> +	beq	100f
>   	isync
>   	mtspr	SPRN_AMR, \gpr2
> -	/* No isync required, see kuap_restore_amr() */
> -998:
> +	/*
> +	 * No isync required, see kuap_restore_amr()
> +	 * No need to restore IAMR when returning to kernel space.
> +	 */
> +100:
>   	END_MMU_FTR_SECTION_NESTED_IFSET(MMU_FTR_KUAP, 67)
>   #endif
>   .endm
> @@ -42,23 +71,98 @@
>   .endm
>   #endif
>   
> +/*
> + *	if (pkey) {
> + *
> + *		save AMR -> stack;
> + *		if (kuap) {
> + *			if (AMR != BLOCKED)
> + *				KUAP_BLOCKED -> AMR;
> + *		}
> + *		if (from_user) {
> + *			save IAMR -> stack;
> + *			if (kuep) {
> + *				KUEP_BLOCKED ->IAMR
> + *			}
> + *		}
> + *		return;
> + *	}
> + *
> + *	if (kuap) {
> + *		if (from_kernel) {
> + *			save AMR -> stack;
> + *			if (AMR != BLOCKED)
> + *				KUAP_BLOCKED -> AMR;
> + *		}
> + *
> + *	}
> + */
>   .macro kuap_save_amr_and_lock gpr1, gpr2, use_cr, msr_pr_cr
> -#ifdef CONFIG_PPC_KUAP
> +#if defined(CONFIG_PPC_PKEY)
> +
> +	/*
> +	 * if both pkey and kuap is disabled, nothing to do
> +	 */
> +	BEGIN_MMU_FTR_SECTION_NESTED(68)
> +	b	100f  // skip_save_amr
> +	END_MMU_FTR_SECTION_NESTED_IFCLR(MMU_FTR_PKEY | MMU_FTR_KUAP, 68)
> +
> +	/*
> +	 * if pkey is disabled and we are entering from userspace
> +	 * don't do anything.
> +	 */
>   	BEGIN_MMU_FTR_SECTION_NESTED(67)
>   	.ifnb \msr_pr_cr
> -	bne	\msr_pr_cr, 99f
> +	/*
> +	 * Without pkey we are not changing AMR outside the kernel
> +	 * hence skip this completely.
> +	 */
> +	bne	\msr_pr_cr, 100f  // from userspace
>   	.endif
> +        END_MMU_FTR_SECTION_NESTED_IFCLR(MMU_FTR_PKEY, 67)
> +
> +	/*
> +	 * pkey is enabled or pkey is disabled but entering from kernel
> +	 */
>   	mfspr	\gpr1, SPRN_AMR
>   	std	\gpr1, STACK_REGS_AMR(r1)
> -	li	\gpr2, (AMR_KUAP_BLOCKED >> AMR_KUAP_SHIFT)
> -	sldi	\gpr2, \gpr2, AMR_KUAP_SHIFT
> +
> +	/*
> +	 * update kernel AMR with AMR_KUAP_BLOCKED only
> +	 * if KUAP feature is enabled
> +	 */
> +	BEGIN_MMU_FTR_SECTION_NESTED(69)
> +	LOAD_REG_IMMEDIATE(\gpr2, AMR_KUAP_BLOCKED)
>   	cmpd	\use_cr, \gpr1, \gpr2
> -	beq	\use_cr, 99f
> -	// We don't isync here because we very recently entered via rfid
> +	beq	\use_cr, 102f
> +	/*
> +	 * We don't isync here because we very recently entered via an interrupt
> +	 */
>   	mtspr	SPRN_AMR, \gpr2
>   	isync
> -99:
> -	END_MMU_FTR_SECTION_NESTED_IFSET(MMU_FTR_KUAP, 67)
> +102:
> +	END_MMU_FTR_SECTION_NESTED_IFSET(MMU_FTR_KUAP, 69)
> +
> +	/*
> +	 * if entering from kernel we don't need save IAMR
> +	 */
> +	.ifnb \msr_pr_cr
> +	beq	\msr_pr_cr, 100f // from kernel space
> +	mfspr	\gpr1, SPRN_IAMR
> +	std	\gpr1, STACK_REGS_IAMR(r1)
> +
> +	/*
> +	 * update kernel IAMR with AMR_KUEP_BLOCKED only
> +	 * if KUEP feature is enabled
> +	 */
> +	BEGIN_MMU_FTR_SECTION_NESTED(70)
> +	LOAD_REG_IMMEDIATE(\gpr2, AMR_KUEP_BLOCKED)
> +	mtspr	SPRN_IAMR, \gpr2
> +	isync
> +	END_MMU_FTR_SECTION_NESTED_IFSET(MMU_FTR_KUEP, 70)
> +	.endif
> +
> +100: // skip_save_amr
>   #endif
>   .endm
>   
> @@ -66,22 +170,42 @@
>   
>   DECLARE_STATIC_KEY_FALSE(uaccess_flush_key);
>   
> -#ifdef CONFIG_PPC_KUAP
> +#ifdef CONFIG_PPC_PKEY
>   
>   #include <asm/mmu.h>
>   #include <asm/ptrace.h>
>   
> -static inline void kuap_restore_amr(struct pt_regs *regs, unsigned long amr)
> +static inline void kuap_restore_user_amr(struct pt_regs *regs)

While we are at changing the function's names, could we remove the _amr from the names in order to 
make it more generic and allow to re-use that name when we migrate PPC32 to C interrupt/syscall 
entries/exits ? (see 
https://patchwork.ozlabs.org/project/linuxppc-dev/patch/302a0e88e15ce4569d9619631b36248041d5ed27.1586196948.git.christophe.leroy@c-s.fr/)

> +{
> +	if (!mmu_has_feature(MMU_FTR_PKEY))
> +		return;
> +
> +	isync();
> +	mtspr(SPRN_AMR, regs->amr);
> +	mtspr(SPRN_IAMR, regs->iamr);
> +	/*
> +	 * No isync required here because we are about to rfi
> +	 * back to previous context before any user accesses
> +	 * would be made, which is a CSI.
> +	 */
> +}
> +static inline void kuap_restore_kernel_amr(struct pt_regs *regs,
> +					   unsigned long amr)
>   {
> -	if (mmu_has_feature(MMU_FTR_KUAP) && unlikely(regs->kuap != amr)) {
> -		isync();
> -		mtspr(SPRN_AMR, regs->kuap);
> -		/*
> -		 * No isync required here because we are about to RFI back to
> -		 * previous context before any user accesses would be made,
> -		 * which is a CSI.
> -		 */
> +	if (mmu_has_feature(MMU_FTR_KUAP)) {
> +		if (unlikely(regs->amr != amr)) {
> +			isync();
> +			mtspr(SPRN_AMR, regs->amr);
> +			/*
> +			 * No isync required here because we are about to rfi
> +			 * back to previous context before any user accesses
> +			 * would be made, which is a CSI.
> +			 */
> +		}
>   	}
> +	/*
> +	 * No need to restore IAMR when returning to kernel space.
> +	 */
>   }
>   
>   static inline unsigned long kuap_get_and_check_amr(void)
> @@ -95,6 +219,26 @@ static inline unsigned long kuap_get_and_check_amr(void)
>   	return 0;
>   }
>   
> +#else /* CONFIG_PPC_PKEY */
> +
> +static inline void kuap_restore_user_amr(struct pt_regs *regs)
> +{
> +}
> +
> +static inline void kuap_restore_kernel_amr(struct pt_regs *regs, unsigned long amr)
> +{
> +}
> +
> +static inline unsigned long kuap_get_and_check_amr(void)
> +{
> +	return 0;
> +}
> +
> +#endif /* CONFIG_PPC_PKEY */
> +
> +
> +#ifdef CONFIG_PPC_KUAP
> +
>   static inline void kuap_check_amr(void)
>   {
>   	if (IS_ENABLED(CONFIG_PPC_KUAP_DEBUG) && mmu_has_feature(MMU_FTR_KUAP))
> @@ -143,21 +287,6 @@ bad_kuap_fault(struct pt_regs *regs, unsigned long address, bool is_write)
>   		    (regs->kuap & (is_write ? AMR_KUAP_BLOCK_WRITE : AMR_KUAP_BLOCK_READ)),
>   		    "Bug: %s fault blocked by AMR!", is_write ? "Write" : "Read");
>   }
> -#else /* CONFIG_PPC_KUAP */
> -static inline void kuap_restore_amr(struct pt_regs *regs, unsigned long amr) { }
> -
> -static inline unsigned long kuap_get_and_check_amr(void)
> -{
> -	return 0UL;
> -}
> -
> -static inline unsigned long get_kuap(void)
> -{
> -	return AMR_KUAP_BLOCKED;
> -}
> -
> -static inline void set_kuap(unsigned long value) { }
> -#endif /* !CONFIG_PPC_KUAP */
>   
>   static __always_inline void allow_user_access(void __user *to, const void __user *from,
>   					      unsigned long size, unsigned long dir)
> @@ -174,6 +303,21 @@ static __always_inline void allow_user_access(void __user *to, const void __user
>   		BUILD_BUG();
>   }
>   
> +#else /* CONFIG_PPC_KUAP */
> +
> +static inline unsigned long get_kuap(void)
> +{
> +	return AMR_KUAP_BLOCKED;
> +}
> +
> +static inline void set_kuap(unsigned long value) { }
> +
> +static __always_inline void allow_user_access(void __user *to, const void __user *from,
> +					      unsigned long size, unsigned long dir)
> +{ }
> +
> +#endif /* !CONFIG_PPC_KUAP */
> +
>   static inline void prevent_user_access(void __user *to, const void __user *from,
>   				       unsigned long size, unsigned long dir)
>   {
> diff --git a/arch/powerpc/include/asm/ptrace.h b/arch/powerpc/include/asm/ptrace.h
> index e7f1caa007a4..f240f0cdcec2 100644
> --- a/arch/powerpc/include/asm/ptrace.h
> +++ b/arch/powerpc/include/asm/ptrace.h
> @@ -61,8 +61,11 @@ struct pt_regs
>   				unsigned long amr;
>   #endif
>   			};
> +#ifdef CONFIG_PPC_PKEY
> +			unsigned long iamr;
> +#endif
>   		};
> -		unsigned long __pad[2];	/* Maintain 16 byte interrupt stack alignment */
> +		unsigned long __pad[4];	/* Maintain 16 byte interrupt stack alignment */
>   	};
>   };
>   #endif
> diff --git a/arch/powerpc/kernel/asm-offsets.c b/arch/powerpc/kernel/asm-offsets.c
> index 418a0b314a33..76545cdc7f8a 100644
> --- a/arch/powerpc/kernel/asm-offsets.c
> +++ b/arch/powerpc/kernel/asm-offsets.c
> @@ -356,11 +356,13 @@ int main(void)
>   
>   #ifdef CONFIG_PPC_PKEY
>   	STACK_PT_REGS_OFFSET(STACK_REGS_AMR, amr);
> +	STACK_PT_REGS_OFFSET(STACK_REGS_IAMR, iamr);
>   #endif
>   #ifdef CONFIG_PPC_KUAP
>   	STACK_PT_REGS_OFFSET(STACK_REGS_KUAP, kuap);
>   #endif
>   
> +
>   #if defined(CONFIG_PPC32)
>   #if defined(CONFIG_BOOKE) || defined(CONFIG_40x)
>   	DEFINE(EXC_LVL_SIZE, STACK_EXC_LVL_FRAME_SIZE);
> diff --git a/arch/powerpc/kernel/entry_64.S b/arch/powerpc/kernel/entry_64.S
> index 2f3846192ec7..e49291594c68 100644
> --- a/arch/powerpc/kernel/entry_64.S
> +++ b/arch/powerpc/kernel/entry_64.S
> @@ -653,8 +653,8 @@ _ASM_NOKPROBE_SYMBOL(fast_interrupt_return)
>   	kuap_check_amr r3, r4
>   	ld	r5,_MSR(r1)
>   	andi.	r0,r5,MSR_PR
> -	bne	.Lfast_user_interrupt_return
> -	kuap_restore_amr r3, r4
> +	bne	.Lfast_user_interrupt_return_amr
> +	kuap_restore_kernel_amr r3, r4
>   	andi.	r0,r5,MSR_RI
>   	li	r3,0 /* 0 return value, no EMULATE_STACK_STORE */
>   	bne+	.Lfast_kernel_interrupt_return
> @@ -674,6 +674,8 @@ _ASM_NOKPROBE_SYMBOL(interrupt_return)
>   	cmpdi	r3,0
>   	bne-	.Lrestore_nvgprs
>   
> +.Lfast_user_interrupt_return_amr:
> +	kuap_restore_user_amr r3
>   .Lfast_user_interrupt_return:
>   	ld	r11,_NIP(r1)
>   	ld	r12,_MSR(r1)
> diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
> index 4d01f09ecf80..84cc23529cdb 100644
> --- a/arch/powerpc/kernel/exceptions-64s.S
> +++ b/arch/powerpc/kernel/exceptions-64s.S
> @@ -1059,7 +1059,7 @@ EXC_COMMON_BEGIN(system_reset_common)
>   	ld	r10,SOFTE(r1)
>   	stb	r10,PACAIRQSOFTMASK(r13)
>   
> -	kuap_restore_amr r9, r10
> +	kuap_restore_kernel_amr r9, r10
>   	EXCEPTION_RESTORE_REGS
>   	RFI_TO_USER_OR_KERNEL
>   
> @@ -2875,7 +2875,7 @@ EXC_COMMON_BEGIN(soft_nmi_common)
>   	ld	r10,SOFTE(r1)
>   	stb	r10,PACAIRQSOFTMASK(r13)
>   
> -	kuap_restore_amr r9, r10
> +	kuap_restore_kernel_amr r9, r10
>   	EXCEPTION_RESTORE_REGS hsrr=0
>   	RFI_TO_KERNEL
>   
> diff --git a/arch/powerpc/kernel/syscall_64.c b/arch/powerpc/kernel/syscall_64.c
> index 310bcd768cd5..60c57609d316 100644
> --- a/arch/powerpc/kernel/syscall_64.c
> +++ b/arch/powerpc/kernel/syscall_64.c
> @@ -35,7 +35,25 @@ notrace long system_call_exception(long r3, long r4, long r5,
>   	BUG_ON(!FULL_REGS(regs));
>   	BUG_ON(regs->softe != IRQS_ENABLED);
>   
> -	kuap_check_amr();
> +#ifdef CONFIG_PPC_PKEY
> +	if (mmu_has_feature(MMU_FTR_PKEY)) {
> +		unsigned long amr, iamr;
> +		/*
> +		 * When entering from userspace we mostly have the AMR/IAMR
> +		 * different from kernel default values. Hence don't compare.
> +		 */
> +		amr = mfspr(SPRN_AMR);
> +		iamr = mfspr(SPRN_IAMR);
> +		regs->amr  = amr;
> +		regs->iamr = iamr;
> +		if (mmu_has_feature(MMU_FTR_KUAP))
> +			mtspr(SPRN_AMR, AMR_KUAP_BLOCKED);
> +		if (mmu_has_feature(MMU_FTR_KUEP))
> +			mtspr(SPRN_IAMR, AMR_KUEP_BLOCKED);
> +		isync();
> +	} else
> +#endif
> +		kuap_check_amr();
>   
>   	account_cpu_user_entry();
>   
> @@ -245,6 +263,12 @@ notrace unsigned long syscall_exit_prepare(unsigned long r3,
>   
>   	account_cpu_user_exit();
>   
> +#ifdef CONFIG_PPC_BOOK3S /* BOOK3E not yet using this */
> +	/*
> +	 * We do this at the end so that we do context switch with KERNEL AMR
> +	 */
> +	kuap_restore_user_amr(regs);
> +#endif
>   	return ret;
>   }
>   
> @@ -330,6 +354,10 @@ notrace unsigned long interrupt_exit_user_prepare(struct pt_regs *regs, unsigned
>   
>   	account_cpu_user_exit();
>   
> +	/*
> +	 * We do this at the end so that we do context switch with KERNEL AMR
> +	 */
> +	kuap_restore_user_amr(regs);
>   	return ret;
>   }
>   
> @@ -400,7 +428,7 @@ notrace unsigned long interrupt_exit_kernel_prepare(struct pt_regs *regs, unsign
>   	 * which would cause Read-After-Write stalls. Hence, we take the AMR
>   	 * value from the check above.
>   	 */
> -	kuap_restore_amr(regs, amr);
> +	kuap_restore_kernel_amr(regs, amr);
>   
>   	return ret;
>   }
> 
