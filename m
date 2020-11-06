Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E94C2A90E3
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Nov 2020 09:02:05 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CSCXQ6KMCzDrBx
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Nov 2020 19:01:58 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CSCTs6MrMzDr5s
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 Nov 2020 18:59:38 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4CSCTd0lWvz9v1cD;
 Fri,  6 Nov 2020 08:59:33 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id gWWWB16Hzzem; Fri,  6 Nov 2020 08:59:33 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4CSCTc6zq4z9v1cB;
 Fri,  6 Nov 2020 08:59:32 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id C897A8B8AD;
 Fri,  6 Nov 2020 08:59:33 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 4SbX9toBXZ7K; Fri,  6 Nov 2020 08:59:33 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 447B58B75F;
 Fri,  6 Nov 2020 08:59:33 +0100 (CET)
Subject: Re: [PATCH 02/18] powerpc: remove arguments from fault handler
 functions
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
References: <20201105143431.1874789-1-npiggin@gmail.com>
 <20201105143431.1874789-3-npiggin@gmail.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <6af9a488-3816-9744-db4b-5a3bceb1f0f0@csgroup.eu>
Date: Fri, 6 Nov 2020 08:59:26 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201105143431.1874789-3-npiggin@gmail.com>
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



Le 05/11/2020 à 15:34, Nicholas Piggin a écrit :
> Make mm fault handlers all just take the pt_regs * argument and load
> DAR/DSISR from that. Make those that return a value return long.
> 
> This is done to make the function signatures match other handlers, which
> will help with a future patch to add wrappers. Explicit arguments could
> be added for performance but that would require more wrapper macro
> variants.
> 
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>   arch/powerpc/include/asm/asm-prototypes.h |  4 ++--
>   arch/powerpc/include/asm/bug.h            |  4 ++--
>   arch/powerpc/kernel/exceptions-64e.S      |  2 --
>   arch/powerpc/kernel/exceptions-64s.S      | 14 ++------------
>   arch/powerpc/kernel/head_40x.S            | 10 +++++-----
>   arch/powerpc/kernel/head_8xx.S            |  6 +++---
>   arch/powerpc/kernel/head_book3s_32.S      |  6 ++----
>   arch/powerpc/kernel/head_booke.h          |  4 +---
>   arch/powerpc/mm/book3s64/hash_utils.c     |  8 +++++---
>   arch/powerpc/mm/book3s64/slb.c            | 11 +++++++----
>   arch/powerpc/mm/fault.c                   | 16 +++++++++-------
>   11 files changed, 38 insertions(+), 47 deletions(-)
> 
> diff --git a/arch/powerpc/include/asm/asm-prototypes.h b/arch/powerpc/include/asm/asm-prototypes.h
> index d0b832cbbec8..22c9d08fa3a4 100644
> --- a/arch/powerpc/include/asm/asm-prototypes.h
> +++ b/arch/powerpc/include/asm/asm-prototypes.h
> @@ -82,8 +82,8 @@ void kernel_bad_stack(struct pt_regs *regs);
>   void system_reset_exception(struct pt_regs *regs);
>   void machine_check_exception(struct pt_regs *regs);
>   void emulation_assist_interrupt(struct pt_regs *regs);
> -long do_slb_fault(struct pt_regs *regs, unsigned long ea);
> -void do_bad_slb_fault(struct pt_regs *regs, unsigned long ea, long err);
> +long do_slb_fault(struct pt_regs *regs);
> +void do_bad_slb_fault(struct pt_regs *regs);
>   
>   /* signals, syscalls and interrupts */
>   long sys_swapcontext(struct ucontext __user *old_ctx,
> diff --git a/arch/powerpc/include/asm/bug.h b/arch/powerpc/include/asm/bug.h
> index d714d83bbc7c..2fa0cf6c6011 100644
> --- a/arch/powerpc/include/asm/bug.h
> +++ b/arch/powerpc/include/asm/bug.h
> @@ -111,8 +111,8 @@
>   #ifndef __ASSEMBLY__
>   
>   struct pt_regs;
> -extern int do_page_fault(struct pt_regs *, unsigned long, unsigned long);
> -extern int hash__do_page_fault(struct pt_regs *, unsigned long, unsigned long);
> +extern long do_page_fault(struct pt_regs *);
> +extern long hash__do_page_fault(struct pt_regs *);

extern is pointless

>   extern void bad_page_fault(struct pt_regs *, unsigned long, int);
>   extern void _exception(int, struct pt_regs *, int, unsigned long);
>   extern void _exception_pkey(struct pt_regs *, unsigned long, int);
> diff --git a/arch/powerpc/kernel/exceptions-64e.S b/arch/powerpc/kernel/exceptions-64e.S
> index f579ce46eef2..25fa7d5a643c 100644
> --- a/arch/powerpc/kernel/exceptions-64e.S
> +++ b/arch/powerpc/kernel/exceptions-64e.S
> @@ -1011,8 +1011,6 @@ storage_fault_common:
>   	std	r14,_DAR(r1)
>   	std	r15,_DSISR(r1)
>   	addi	r3,r1,STACK_FRAME_OVERHEAD
> -	mr	r4,r14
> -	mr	r5,r15
>   	ld	r14,PACA_EXGEN+EX_R14(r13)
>   	ld	r15,PACA_EXGEN+EX_R15(r13)
>   	bl	do_page_fault
> diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
> index f830b893fe03..1f34cfd1887c 100644
> --- a/arch/powerpc/kernel/exceptions-64s.S
> +++ b/arch/powerpc/kernel/exceptions-64s.S
> @@ -1437,8 +1437,6 @@ EXC_VIRT_BEGIN(data_access, 0x4300, 0x80)
>   EXC_VIRT_END(data_access, 0x4300, 0x80)
>   EXC_COMMON_BEGIN(data_access_common)
>   	GEN_COMMON data_access
> -	ld	r4,_DAR(r1)
> -	ld	r5,_DSISR(r1)
>   	addi	r3,r1,STACK_FRAME_OVERHEAD
>   BEGIN_MMU_FTR_SECTION
>   	bl	do_hash_fault
> @@ -1491,10 +1489,9 @@ EXC_VIRT_BEGIN(data_access_slb, 0x4380, 0x80)
>   EXC_VIRT_END(data_access_slb, 0x4380, 0x80)
>   EXC_COMMON_BEGIN(data_access_slb_common)
>   	GEN_COMMON data_access_slb
> -	ld	r4,_DAR(r1)
> -	addi	r3,r1,STACK_FRAME_OVERHEAD
>   BEGIN_MMU_FTR_SECTION
>   	/* HPT case, do SLB fault */
> +	addi	r3,r1,STACK_FRAME_OVERHEAD
>   	bl	do_slb_fault
>   	cmpdi	r3,0
>   	bne-	1f
> @@ -1506,8 +1503,6 @@ MMU_FTR_SECTION_ELSE
>   ALT_MMU_FTR_SECTION_END_IFCLR(MMU_FTR_TYPE_RADIX)
>   	std	r3,RESULT(r1)
>   	RECONCILE_IRQ_STATE(r10, r11)
> -	ld	r4,_DAR(r1)
> -	ld	r5,RESULT(r1)
>   	addi	r3,r1,STACK_FRAME_OVERHEAD
>   	bl	do_bad_slb_fault
>   	b	interrupt_return
> @@ -1542,8 +1537,6 @@ EXC_VIRT_BEGIN(instruction_access, 0x4400, 0x80)
>   EXC_VIRT_END(instruction_access, 0x4400, 0x80)
>   EXC_COMMON_BEGIN(instruction_access_common)
>   	GEN_COMMON instruction_access
> -	ld	r4,_DAR(r1)
> -	ld	r5,_DSISR(r1)
>   	addi	r3,r1,STACK_FRAME_OVERHEAD
>   BEGIN_MMU_FTR_SECTION
>   	bl	do_hash_fault
> @@ -1587,10 +1580,9 @@ EXC_VIRT_BEGIN(instruction_access_slb, 0x4480, 0x80)
>   EXC_VIRT_END(instruction_access_slb, 0x4480, 0x80)
>   EXC_COMMON_BEGIN(instruction_access_slb_common)
>   	GEN_COMMON instruction_access_slb
> -	ld	r4,_DAR(r1)
> -	addi	r3,r1,STACK_FRAME_OVERHEAD
>   BEGIN_MMU_FTR_SECTION
>   	/* HPT case, do SLB fault */
> +	addi	r3,r1,STACK_FRAME_OVERHEAD
>   	bl	do_slb_fault
>   	cmpdi	r3,0
>   	bne-	1f
> @@ -1602,8 +1594,6 @@ MMU_FTR_SECTION_ELSE
>   ALT_MMU_FTR_SECTION_END_IFCLR(MMU_FTR_TYPE_RADIX)
>   	std	r3,RESULT(r1)
>   	RECONCILE_IRQ_STATE(r10, r11)
> -	ld	r4,_DAR(r1)
> -	ld	r5,RESULT(r1)
>   	addi	r3,r1,STACK_FRAME_OVERHEAD
>   	bl	do_bad_slb_fault
>   	b	interrupt_return
> diff --git a/arch/powerpc/kernel/head_40x.S b/arch/powerpc/kernel/head_40x.S
> index 44c9018aed1b..ea31f75e9692 100644
> --- a/arch/powerpc/kernel/head_40x.S
> +++ b/arch/powerpc/kernel/head_40x.S
> @@ -179,9 +179,9 @@ _ENTRY(saved_ksp_limit)
>    */
>   	START_EXCEPTION(0x0300,	DataStorage)
>   	EXCEPTION_PROLOG
> -	mfspr	r5, SPRN_ESR		/* Grab the ESR, save it, pass arg3 */
> +	mfspr	r5, SPRN_ESR		/* Grab the ESR, save it */
>   	stw	r5, _ESR(r11)
> -	mfspr	r4, SPRN_DEAR		/* Grab the DEAR, save it, pass arg2 */
> +	mfspr	r4, SPRN_DEAR		/* Grab the DEAR, save it */
>   	stw	r4, _DEAR(r11)
>   	EXC_XFER_LITE(0x300, handle_page_fault)
>   
> @@ -191,9 +191,9 @@ _ENTRY(saved_ksp_limit)
>    */
>   	START_EXCEPTION(0x0400, InstructionAccess)
>   	EXCEPTION_PROLOG
> -	mr	r4,r12			/* Pass SRR0 as arg2 */
> -	stw	r4, _DEAR(r11)
> -	li	r5,0			/* Pass zero as arg3 */
> +	li	r5,0
> +	stw	r5, _ESR(r11)		/* Zero ESR */
> +	stw	r12, _DEAR(r11)		/* SRR0 as DEAR */

I think we should avoid this, see below

>   	EXC_XFER_LITE(0x400, handle_page_fault)
>   
>   /* 0x0500 - External Interrupt Exception */
> diff --git a/arch/powerpc/kernel/head_8xx.S b/arch/powerpc/kernel/head_8xx.S
> index 9f359d3fba74..0cd95b633e2b 100644
> --- a/arch/powerpc/kernel/head_8xx.S
> +++ b/arch/powerpc/kernel/head_8xx.S
> @@ -356,14 +356,14 @@ DataStoreTLBMiss:
>   	. = 0x1300
>   InstructionTLBError:
>   	EXCEPTION_PROLOG
> -	mr	r4,r12
>   	andis.	r5,r9,DSISR_SRR1_MATCH_32S@h /* Filter relevant SRR1 bits */

Could avoid this, see below

>   	andis.	r10,r9,SRR1_ISI_NOPT@h
>   	beq+	.Litlbie
> -	tlbie	r4
> +	tlbie	r12
>   	/* 0x400 is InstructionAccess exception, needed by bad_page_fault() */
>   .Litlbie:
> -	stw	r4, _DAR(r11)
> +	stw	r12, _DAR(r11)
> +	stw	r5, _DSISR(r11)

And this

>   	EXC_XFER_LITE(0x400, handle_page_fault)
>   
>   /* This is the data TLB error on the MPC8xx.  This could be due to
> diff --git a/arch/powerpc/kernel/head_book3s_32.S b/arch/powerpc/kernel/head_book3s_32.S
> index 5eb9eedac920..81c69769cec6 100644
> --- a/arch/powerpc/kernel/head_book3s_32.S
> +++ b/arch/powerpc/kernel/head_book3s_32.S
> @@ -369,9 +369,9 @@ BEGIN_MMU_FTR_SECTION
>   	bl	hash_page
>   END_MMU_FTR_SECTION_IFSET(MMU_FTR_HPTE_TABLE)
>   #endif	/* CONFIG_VMAP_STACK */
> -1:	mr	r4,r12
>   	andis.	r5,r9,DSISR_SRR1_MATCH_32S@h /* Filter relevant SRR1 bits */
> -	stw	r4, _DAR(r11)
> +	stw	r5, _DSISR(r11)
> +	stw	r12, _DAR(r11)

And this including the andis.

>   	EXC_XFER_LITE(0x400, handle_page_fault)
>   
>   /* External interrupt */
> @@ -698,8 +698,6 @@ handle_page_fault_tramp_1:
>   #ifdef CONFIG_VMAP_STACK
>   	EXCEPTION_PROLOG_2 handle_dar_dsisr=1
>   #endif
> -	lwz	r4, _DAR(r11)
> -	lwz	r5, _DSISR(r11)
>   	/* fall through */
>   handle_page_fault_tramp_2:
>   	EXC_XFER_LITE(0x300, handle_page_fault)
> diff --git a/arch/powerpc/kernel/head_booke.h b/arch/powerpc/kernel/head_booke.h
> index 71c359d438b5..1da0c1d1b0a1 100644
> --- a/arch/powerpc/kernel/head_booke.h
> +++ b/arch/powerpc/kernel/head_booke.h
> @@ -477,9 +477,7 @@ ALT_FTR_SECTION_END_IFSET(CPU_FTR_EMB_HV)
>   	NORMAL_EXCEPTION_PROLOG(INST_STORAGE);		      \
>   	mfspr	r5,SPRN_ESR;		/* Grab the ESR and save it */	      \
>   	stw	r5,_ESR(r11);						      \
> -	mr      r4,r12;                 /* Pass SRR0 as arg2 */		      \
> -	stw	r4, _DEAR(r11);						      \
> -	li      r5,0;                   /* Pass zero as arg3 */		      \
> +	stw	r12, _DEAR(r11);	/* Pass SRR0 as arg2 */		      \

And this

>   	EXC_XFER_LITE(0x0400, handle_page_fault)
>   
>   #define ALIGNMENT_EXCEPTION						      \
> diff --git a/arch/powerpc/mm/book3s64/hash_utils.c b/arch/powerpc/mm/book3s64/hash_utils.c
> index bfa1b1966218..0f0bd4af4b2d 100644
> --- a/arch/powerpc/mm/book3s64/hash_utils.c
> +++ b/arch/powerpc/mm/book3s64/hash_utils.c
> @@ -1510,13 +1510,15 @@ int hash_page(unsigned long ea, unsigned long access, unsigned long trap,
>   }
>   EXPORT_SYMBOL_GPL(hash_page);
>   
> -int do_hash_fault(struct pt_regs *regs, unsigned long ea, unsigned long dsisr)
> +long do_hash_fault(struct pt_regs *regs)
>   {
> +	unsigned long ea = regs->dar;
> +	unsigned long dsisr = regs->dsisr;
>   	unsigned long access = _PAGE_PRESENT | _PAGE_READ;
>   	unsigned long flags = 0;
>   	struct mm_struct *mm;
>   	unsigned int region_id;
> -	int err;
> +	long err;
>   
>   	if (unlikely(dsisr & (DSISR_BAD_FAULT_64S | DSISR_DABRMATCH | DSISR_KEYFAULT)))
>   		goto _do_page_fault;
> @@ -1580,7 +1582,7 @@ int do_hash_fault(struct pt_regs *regs, unsigned long ea, unsigned long dsisr)
>   
>   	} else if (err) {
>   _do_page_fault:
> -		err = hash__do_page_fault(regs, ea, dsisr);
> +		err = hash__do_page_fault(regs);
>   	}
>   
>   	return err;
> diff --git a/arch/powerpc/mm/book3s64/slb.c b/arch/powerpc/mm/book3s64/slb.c
> index c30fcbfa0e32..cc34d50874c1 100644
> --- a/arch/powerpc/mm/book3s64/slb.c
> +++ b/arch/powerpc/mm/book3s64/slb.c
> @@ -837,8 +837,9 @@ static long slb_allocate_user(struct mm_struct *mm, unsigned long ea)
>   	return slb_insert_entry(ea, context, flags, ssize, false);
>   }
>   
> -long do_slb_fault(struct pt_regs *regs, unsigned long ea)
> +long do_slb_fault(struct pt_regs *regs)
>   {
> +	unsigned long ea = regs->dar;
>   	unsigned long id = get_region_id(ea);
>   
>   	/* IRQs are not reconciled here, so can't check irqs_disabled */
> @@ -889,13 +890,15 @@ long do_slb_fault(struct pt_regs *regs, unsigned long ea)
>   	}
>   }
>   
> -void do_bad_slb_fault(struct pt_regs *regs, unsigned long ea, long err)
> +void do_bad_slb_fault(struct pt_regs *regs)
>   {
> +	int err = regs->result;
> +
>   	if (err == -EFAULT) {
>   		if (user_mode(regs))
> -			_exception(SIGSEGV, regs, SEGV_BNDERR, ea);
> +			_exception(SIGSEGV, regs, SEGV_BNDERR, regs->dar);
>   		else
> -			bad_page_fault(regs, ea, SIGSEGV);
> +			bad_page_fault(regs, regs->dar, SIGSEGV);
>   	} else if (err == -EINVAL) {
>   		unrecoverable_exception(regs);
>   	} else {
> diff --git a/arch/powerpc/mm/fault.c b/arch/powerpc/mm/fault.c
> index e65a49f246ef..390a296b16a3 100644
> --- a/arch/powerpc/mm/fault.c
> +++ b/arch/powerpc/mm/fault.c
> @@ -549,11 +549,12 @@ static int __do_page_fault(struct pt_regs *regs, unsigned long address,
>   }
>   NOKPROBE_SYMBOL(__do_page_fault);
>   
> -int do_page_fault(struct pt_regs *regs, unsigned long address,
> -		  unsigned long error_code)
> +long do_page_fault(struct pt_regs *regs)
>   {
>   	enum ctx_state prev_state = exception_enter();
> -	int err;
> +	unsigned long address = regs->dar;
> +	unsigned long error_code = regs->dsisr;
> +	long err;

By doing something more or less like this (need to be tuned for bookE as well):

+	int is_exec = TRAP(regs) == 0x400;
+	unsigned long address = is_exec ? regs->ssr0 : regs->dar;
+	unsigned long error_code = is_exec ? (regs->ssr1 & DSISR_SRR1_MATCH_32S) : regs->dsisr;

>   
>   	err = __do_page_fault(regs, address, error_code);
>   
> @@ -580,11 +581,12 @@ int do_page_fault(struct pt_regs *regs, unsigned long address,
>   NOKPROBE_SYMBOL(do_page_fault);
>   
>   #ifdef CONFIG_PPC_BOOK3S_64
> -/* Same as do_page_fault but interrupt entry has already run in do_hash_fault */
> -int hash__do_page_fault(struct pt_regs *regs, unsigned long address,
> -		  unsigned long error_code)
> +/* Same as do_page_fault but no interrupt entry */
> +long hash__do_page_fault(struct pt_regs *regs)
>   {
> -	int err;
> +	unsigned long address = regs->dar;
> +	unsigned long error_code = regs->dsisr;
> +	long err;
>   
>   	err = __do_page_fault(regs, address, error_code);
>   	if (unlikely(err)) {
> 

There is probably also something we can simplify around get_and_save_dar_dsisr_on_stack() macro in 
head_32.h, no need to reload DAR, at least for 8xx. Maybe as a followup patch later.

Christophe
