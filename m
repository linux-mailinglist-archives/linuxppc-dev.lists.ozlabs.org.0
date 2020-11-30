Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C9B5D2C7ED9
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Nov 2020 08:39:25 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CkxvG6Y8DzDrJq
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Nov 2020 18:39:22 +1100 (AEDT)
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
 header.s=pp1 header.b=Ei13LQrc; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CkxqS2tpzzDr3V
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Nov 2020 18:36:04 +1100 (AEDT)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0AU7WtSs134542
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Nov 2020 02:36:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=TGal0cRYpweyBRDyam0wu3LUTNZjQzMIJjnioV6Fm9I=;
 b=Ei13LQrcKOAk+5Z5tHg+K0fvB+Qn9Cu7/t/djDQHpsiFhbB5Jwcbdy3r1OVWswHP5N15
 67D7fyJDe9pHvh4KkNr5U3/cV3V8ptq/PWy6UAji0ybPU2ph1MGk+taRsCRqGAndBL73
 OJpLfKBdKGT5Nm6/tVgKSIETT3aAQQkQ+8SsJ1QIvvBq8wjVUa7TPvh3wIHtTBpIwIKa
 inV1NFEF5JsL/RTkpzofPErJ0al9LRGth433+nxszP+BSnVprs530EMKmuGLmfoIhvrE
 NMxeSYDru3fWv7Ci6zmua8AxQiHkpruNHRPdkiuh7qm7W40lJdyQ3Ev8fJVWx5m1rvr2 wg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 354t5bb4e2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Nov 2020 02:36:01 -0500
Received: from m0098393.ppops.net (m0098393.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 0AU7WuuQ134678
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Nov 2020 02:36:01 -0500
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0a-001b2d01.pphosted.com with ESMTP id 354t5bb4df-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 30 Nov 2020 02:36:01 -0500
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0AU7UBQi019848;
 Mon, 30 Nov 2020 07:36:00 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by ppma02wdc.us.ibm.com with ESMTP id 353e68nq9c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 30 Nov 2020 07:36:00 +0000
Received: from b03ledav001.gho.boulder.ibm.com
 (b03ledav001.gho.boulder.ibm.com [9.17.130.232])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0AU7ZxPs11207016
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 30 Nov 2020 07:35:59 GMT
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 82B256E052;
 Mon, 30 Nov 2020 07:35:59 +0000 (GMT)
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2CACD6E04E;
 Mon, 30 Nov 2020 07:35:58 +0000 (GMT)
Received: from skywalker.linux.ibm.com (unknown [9.199.58.227])
 by b03ledav001.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon, 30 Nov 2020 07:35:57 +0000 (GMT)
X-Mailer: emacs 27.1 (via feedmail 11-beta-1 I)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v3 02/19] powerpc: remove arguments from fault handler
 functions
In-Reply-To: <20201128144114.944000-3-npiggin@gmail.com>
References: <20201128144114.944000-1-npiggin@gmail.com>
 <20201128144114.944000-3-npiggin@gmail.com>
Date: Mon, 30 Nov 2020 13:05:55 +0530
Message-ID: <87tut7pa90.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-30_02:2020-11-26,
 2020-11-30 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0
 mlxscore=0 spamscore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 suspectscore=0 bulkscore=0 mlxlogscore=999 adultscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2011300048
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
Cc: Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Nicholas Piggin <npiggin@gmail.com> writes:

> Make mm fault handlers all just take the pt_regs * argument and load
> DAR/DSISR from that. Make those that return a value return long.
>
> This is done to make the function signatures match other handlers, which
> will help with a future patch to add wrappers. Explicit arguments could
> be added for performance but that would require more wrapper macro
> variants.

Reviewed-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
>
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>  arch/powerpc/include/asm/asm-prototypes.h     |  4 ++--
>  arch/powerpc/include/asm/book3s/64/mmu-hash.h |  2 +-
>  arch/powerpc/include/asm/bug.h                |  4 ++--
>  arch/powerpc/kernel/exceptions-64e.S          |  2 --
>  arch/powerpc/kernel/exceptions-64s.S          | 14 ++------------
>  arch/powerpc/kernel/head_40x.S                | 10 +++++-----
>  arch/powerpc/kernel/head_8xx.S                |  6 +++---
>  arch/powerpc/kernel/head_book3s_32.S          |  6 ++----
>  arch/powerpc/kernel/head_booke.h              |  4 +---
>  arch/powerpc/mm/book3s64/hash_utils.c         |  8 +++++---
>  arch/powerpc/mm/book3s64/slb.c                | 11 +++++++----
>  arch/powerpc/mm/fault.c                       | 16 +++++++++-------
>  12 files changed, 39 insertions(+), 48 deletions(-)
>
> diff --git a/arch/powerpc/include/asm/asm-prototypes.h b/arch/powerpc/include/asm/asm-prototypes.h
> index d0b832cbbec8..22c9d08fa3a4 100644
> --- a/arch/powerpc/include/asm/asm-prototypes.h
> +++ b/arch/powerpc/include/asm/asm-prototypes.h
> @@ -82,8 +82,8 @@ void kernel_bad_stack(struct pt_regs *regs);
>  void system_reset_exception(struct pt_regs *regs);
>  void machine_check_exception(struct pt_regs *regs);
>  void emulation_assist_interrupt(struct pt_regs *regs);
> -long do_slb_fault(struct pt_regs *regs, unsigned long ea);
> -void do_bad_slb_fault(struct pt_regs *regs, unsigned long ea, long err);
> +long do_slb_fault(struct pt_regs *regs);
> +void do_bad_slb_fault(struct pt_regs *regs);
>  
>  /* signals, syscalls and interrupts */
>  long sys_swapcontext(struct ucontext __user *old_ctx,
> diff --git a/arch/powerpc/include/asm/book3s/64/mmu-hash.h b/arch/powerpc/include/asm/book3s/64/mmu-hash.h
> index bc8c91f2d26f..e843d0b193d3 100644
> --- a/arch/powerpc/include/asm/book3s/64/mmu-hash.h
> +++ b/arch/powerpc/include/asm/book3s/64/mmu-hash.h
> @@ -453,7 +453,7 @@ static inline unsigned long hpt_hash(unsigned long vpn,
>  #define HPTE_LOCAL_UPDATE	0x1
>  #define HPTE_NOHPTE_UPDATE	0x2
>  
> -int do_hash_fault(struct pt_regs *regs, unsigned long ea, unsigned long dsisr);
> +long do_hash_fault(struct pt_regs *regs);
>  extern int __hash_page_4K(unsigned long ea, unsigned long access,
>  			  unsigned long vsid, pte_t *ptep, unsigned long trap,
>  			  unsigned long flags, int ssize, int subpage_prot);
> diff --git a/arch/powerpc/include/asm/bug.h b/arch/powerpc/include/asm/bug.h
> index c0e9b7a967a8..897bad6b6bbb 100644
> --- a/arch/powerpc/include/asm/bug.h
> +++ b/arch/powerpc/include/asm/bug.h
> @@ -111,8 +111,8 @@
>  #ifndef __ASSEMBLY__
>  
>  struct pt_regs;
> -extern int do_page_fault(struct pt_regs *, unsigned long, unsigned long);
> -int hash__do_page_fault(struct pt_regs *, unsigned long, unsigned long);
> +long do_page_fault(struct pt_regs *);
> +long hash__do_page_fault(struct pt_regs *);
>  extern void bad_page_fault(struct pt_regs *, unsigned long, int);
>  extern void _exception(int, struct pt_regs *, int, unsigned long);
>  extern void _exception_pkey(struct pt_regs *, unsigned long, int);
> diff --git a/arch/powerpc/kernel/exceptions-64e.S b/arch/powerpc/kernel/exceptions-64e.S
> index f579ce46eef2..25fa7d5a643c 100644
> --- a/arch/powerpc/kernel/exceptions-64e.S
> +++ b/arch/powerpc/kernel/exceptions-64e.S
> @@ -1011,8 +1011,6 @@ storage_fault_common:
>  	std	r14,_DAR(r1)
>  	std	r15,_DSISR(r1)
>  	addi	r3,r1,STACK_FRAME_OVERHEAD
> -	mr	r4,r14
> -	mr	r5,r15
>  	ld	r14,PACA_EXGEN+EX_R14(r13)
>  	ld	r15,PACA_EXGEN+EX_R15(r13)
>  	bl	do_page_fault
> diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
> index 336fa1fa39d1..690058043b17 100644
> --- a/arch/powerpc/kernel/exceptions-64s.S
> +++ b/arch/powerpc/kernel/exceptions-64s.S
> @@ -1438,8 +1438,6 @@ EXC_VIRT_BEGIN(data_access, 0x4300, 0x80)
>  EXC_VIRT_END(data_access, 0x4300, 0x80)
>  EXC_COMMON_BEGIN(data_access_common)
>  	GEN_COMMON data_access
> -	ld	r4,_DAR(r1)
> -	ld	r5,_DSISR(r1)
>  	addi	r3,r1,STACK_FRAME_OVERHEAD
>  BEGIN_MMU_FTR_SECTION
>  	bl	do_hash_fault
> @@ -1492,10 +1490,9 @@ EXC_VIRT_BEGIN(data_access_slb, 0x4380, 0x80)
>  EXC_VIRT_END(data_access_slb, 0x4380, 0x80)
>  EXC_COMMON_BEGIN(data_access_slb_common)
>  	GEN_COMMON data_access_slb
> -	ld	r4,_DAR(r1)
> -	addi	r3,r1,STACK_FRAME_OVERHEAD
>  BEGIN_MMU_FTR_SECTION
>  	/* HPT case, do SLB fault */
> +	addi	r3,r1,STACK_FRAME_OVERHEAD
>  	bl	do_slb_fault
>  	cmpdi	r3,0
>  	bne-	1f
> @@ -1507,8 +1504,6 @@ MMU_FTR_SECTION_ELSE
>  ALT_MMU_FTR_SECTION_END_IFCLR(MMU_FTR_TYPE_RADIX)
>  	std	r3,RESULT(r1)
>  	RECONCILE_IRQ_STATE(r10, r11)
> -	ld	r4,_DAR(r1)
> -	ld	r5,RESULT(r1)
>  	addi	r3,r1,STACK_FRAME_OVERHEAD
>  	bl	do_bad_slb_fault
>  	b	interrupt_return
> @@ -1543,8 +1538,6 @@ EXC_VIRT_BEGIN(instruction_access, 0x4400, 0x80)
>  EXC_VIRT_END(instruction_access, 0x4400, 0x80)
>  EXC_COMMON_BEGIN(instruction_access_common)
>  	GEN_COMMON instruction_access
> -	ld	r4,_DAR(r1)
> -	ld	r5,_DSISR(r1)
>  	addi	r3,r1,STACK_FRAME_OVERHEAD
>  BEGIN_MMU_FTR_SECTION
>  	bl	do_hash_fault
> @@ -1588,10 +1581,9 @@ EXC_VIRT_BEGIN(instruction_access_slb, 0x4480, 0x80)
>  EXC_VIRT_END(instruction_access_slb, 0x4480, 0x80)
>  EXC_COMMON_BEGIN(instruction_access_slb_common)
>  	GEN_COMMON instruction_access_slb
> -	ld	r4,_DAR(r1)
> -	addi	r3,r1,STACK_FRAME_OVERHEAD
>  BEGIN_MMU_FTR_SECTION
>  	/* HPT case, do SLB fault */
> +	addi	r3,r1,STACK_FRAME_OVERHEAD
>  	bl	do_slb_fault
>  	cmpdi	r3,0
>  	bne-	1f
> @@ -1603,8 +1595,6 @@ MMU_FTR_SECTION_ELSE
>  ALT_MMU_FTR_SECTION_END_IFCLR(MMU_FTR_TYPE_RADIX)
>  	std	r3,RESULT(r1)
>  	RECONCILE_IRQ_STATE(r10, r11)
> -	ld	r4,_DAR(r1)
> -	ld	r5,RESULT(r1)
>  	addi	r3,r1,STACK_FRAME_OVERHEAD
>  	bl	do_bad_slb_fault
>  	b	interrupt_return
> diff --git a/arch/powerpc/kernel/head_40x.S b/arch/powerpc/kernel/head_40x.S
> index a1ae00689e0f..3c5577ac4dc8 100644
> --- a/arch/powerpc/kernel/head_40x.S
> +++ b/arch/powerpc/kernel/head_40x.S
> @@ -179,9 +179,9 @@ _ENTRY(saved_ksp_limit)
>   */
>  	START_EXCEPTION(0x0300,	DataStorage)
>  	EXCEPTION_PROLOG
> -	mfspr	r5, SPRN_ESR		/* Grab the ESR, save it, pass arg3 */
> +	mfspr	r5, SPRN_ESR		/* Grab the ESR, save it */
>  	stw	r5, _ESR(r11)
> -	mfspr	r4, SPRN_DEAR		/* Grab the DEAR, save it, pass arg2 */
> +	mfspr	r4, SPRN_DEAR		/* Grab the DEAR, save it */
>  	stw	r4, _DEAR(r11)
>  	EXC_XFER_LITE(0x300, handle_page_fault)
>  
> @@ -191,9 +191,9 @@ _ENTRY(saved_ksp_limit)
>   */
>  	START_EXCEPTION(0x0400, InstructionAccess)
>  	EXCEPTION_PROLOG
> -	mr	r4,r12			/* Pass SRR0 as arg2 */
> -	stw	r4, _DEAR(r11)
> -	li	r5,0			/* Pass zero as arg3 */
> +	li	r5,0
> +	stw	r5, _ESR(r11)		/* Zero ESR */
> +	stw	r12, _DEAR(r11)		/* SRR0 as DEAR */
>  	EXC_XFER_LITE(0x400, handle_page_fault)
>  
>  /* 0x0500 - External Interrupt Exception */
> diff --git a/arch/powerpc/kernel/head_8xx.S b/arch/powerpc/kernel/head_8xx.S
> index ee0bfebc375f..8acd365a2be6 100644
> --- a/arch/powerpc/kernel/head_8xx.S
> +++ b/arch/powerpc/kernel/head_8xx.S
> @@ -324,14 +324,14 @@ DataStoreTLBMiss:
>  	. = 0x1300
>  InstructionTLBError:
>  	EXCEPTION_PROLOG
> -	mr	r4,r12
>  	andis.	r5,r9,DSISR_SRR1_MATCH_32S@h /* Filter relevant SRR1 bits */
>  	andis.	r10,r9,SRR1_ISI_NOPT@h
>  	beq+	.Litlbie
> -	tlbie	r4
> +	tlbie	r12
>  	/* 0x400 is InstructionAccess exception, needed by bad_page_fault() */
>  .Litlbie:
> -	stw	r4, _DAR(r11)
> +	stw	r12, _DAR(r11)
> +	stw	r5, _DSISR(r11)
>  	EXC_XFER_LITE(0x400, handle_page_fault)
>  
>  /* This is the data TLB error on the MPC8xx.  This could be due to
> diff --git a/arch/powerpc/kernel/head_book3s_32.S b/arch/powerpc/kernel/head_book3s_32.S
> index a0dda2a1f2df..7addf67832f9 100644
> --- a/arch/powerpc/kernel/head_book3s_32.S
> +++ b/arch/powerpc/kernel/head_book3s_32.S
> @@ -370,9 +370,9 @@ BEGIN_MMU_FTR_SECTION
>  	bl	hash_page
>  END_MMU_FTR_SECTION_IFSET(MMU_FTR_HPTE_TABLE)
>  #endif	/* CONFIG_VMAP_STACK */
> -1:	mr	r4,r12
>  	andis.	r5,r9,DSISR_SRR1_MATCH_32S@h /* Filter relevant SRR1 bits */
> -	stw	r4, _DAR(r11)
> +	stw	r5, _DSISR(r11)
> +	stw	r12, _DAR(r11)
>  	EXC_XFER_LITE(0x400, handle_page_fault)
>  
>  /* External interrupt */
> @@ -687,8 +687,6 @@ handle_page_fault_tramp_1:
>  #ifdef CONFIG_VMAP_STACK
>  	EXCEPTION_PROLOG_2 handle_dar_dsisr=1
>  #endif
> -	lwz	r4, _DAR(r11)
> -	lwz	r5, _DSISR(r11)
>  	/* fall through */
>  handle_page_fault_tramp_2:
>  	EXC_XFER_LITE(0x300, handle_page_fault)
> diff --git a/arch/powerpc/kernel/head_booke.h b/arch/powerpc/kernel/head_booke.h
> index 71c359d438b5..1da0c1d1b0a1 100644
> --- a/arch/powerpc/kernel/head_booke.h
> +++ b/arch/powerpc/kernel/head_booke.h
> @@ -477,9 +477,7 @@ ALT_FTR_SECTION_END_IFSET(CPU_FTR_EMB_HV)
>  	NORMAL_EXCEPTION_PROLOG(INST_STORAGE);		      \
>  	mfspr	r5,SPRN_ESR;		/* Grab the ESR and save it */	      \
>  	stw	r5,_ESR(r11);						      \
> -	mr      r4,r12;                 /* Pass SRR0 as arg2 */		      \
> -	stw	r4, _DEAR(r11);						      \
> -	li      r5,0;                   /* Pass zero as arg3 */		      \
> +	stw	r12, _DEAR(r11);	/* Pass SRR0 as arg2 */		      \
>  	EXC_XFER_LITE(0x0400, handle_page_fault)
>  
>  #define ALIGNMENT_EXCEPTION						      \
> diff --git a/arch/powerpc/mm/book3s64/hash_utils.c b/arch/powerpc/mm/book3s64/hash_utils.c
> index bfa1b1966218..0f0bd4af4b2d 100644
> --- a/arch/powerpc/mm/book3s64/hash_utils.c
> +++ b/arch/powerpc/mm/book3s64/hash_utils.c
> @@ -1510,13 +1510,15 @@ int hash_page(unsigned long ea, unsigned long access, unsigned long trap,
>  }
>  EXPORT_SYMBOL_GPL(hash_page);
>  
> -int do_hash_fault(struct pt_regs *regs, unsigned long ea, unsigned long dsisr)
> +long do_hash_fault(struct pt_regs *regs)
>  {
> +	unsigned long ea = regs->dar;
> +	unsigned long dsisr = regs->dsisr;
>  	unsigned long access = _PAGE_PRESENT | _PAGE_READ;
>  	unsigned long flags = 0;
>  	struct mm_struct *mm;
>  	unsigned int region_id;
> -	int err;
> +	long err;
>  
>  	if (unlikely(dsisr & (DSISR_BAD_FAULT_64S | DSISR_DABRMATCH | DSISR_KEYFAULT)))
>  		goto _do_page_fault;
> @@ -1580,7 +1582,7 @@ int do_hash_fault(struct pt_regs *regs, unsigned long ea, unsigned long dsisr)
>  
>  	} else if (err) {
>  _do_page_fault:
> -		err = hash__do_page_fault(regs, ea, dsisr);
> +		err = hash__do_page_fault(regs);
>  	}
>  
>  	return err;
> diff --git a/arch/powerpc/mm/book3s64/slb.c b/arch/powerpc/mm/book3s64/slb.c
> index c30fcbfa0e32..cc34d50874c1 100644
> --- a/arch/powerpc/mm/book3s64/slb.c
> +++ b/arch/powerpc/mm/book3s64/slb.c
> @@ -837,8 +837,9 @@ static long slb_allocate_user(struct mm_struct *mm, unsigned long ea)
>  	return slb_insert_entry(ea, context, flags, ssize, false);
>  }
>  
> -long do_slb_fault(struct pt_regs *regs, unsigned long ea)
> +long do_slb_fault(struct pt_regs *regs)
>  {
> +	unsigned long ea = regs->dar;
>  	unsigned long id = get_region_id(ea);
>  
>  	/* IRQs are not reconciled here, so can't check irqs_disabled */
> @@ -889,13 +890,15 @@ long do_slb_fault(struct pt_regs *regs, unsigned long ea)
>  	}
>  }
>  
> -void do_bad_slb_fault(struct pt_regs *regs, unsigned long ea, long err)
> +void do_bad_slb_fault(struct pt_regs *regs)
>  {
> +	int err = regs->result;
> +
>  	if (err == -EFAULT) {
>  		if (user_mode(regs))
> -			_exception(SIGSEGV, regs, SEGV_BNDERR, ea);
> +			_exception(SIGSEGV, regs, SEGV_BNDERR, regs->dar);
>  		else
> -			bad_page_fault(regs, ea, SIGSEGV);
> +			bad_page_fault(regs, regs->dar, SIGSEGV);
>  	} else if (err == -EINVAL) {
>  		unrecoverable_exception(regs);
>  	} else {
> diff --git a/arch/powerpc/mm/fault.c b/arch/powerpc/mm/fault.c
> index e65a49f246ef..390a296b16a3 100644
> --- a/arch/powerpc/mm/fault.c
> +++ b/arch/powerpc/mm/fault.c
> @@ -549,11 +549,12 @@ static int __do_page_fault(struct pt_regs *regs, unsigned long address,
>  }
>  NOKPROBE_SYMBOL(__do_page_fault);
>  
> -int do_page_fault(struct pt_regs *regs, unsigned long address,
> -		  unsigned long error_code)
> +long do_page_fault(struct pt_regs *regs)
>  {
>  	enum ctx_state prev_state = exception_enter();
> -	int err;
> +	unsigned long address = regs->dar;
> +	unsigned long error_code = regs->dsisr;
> +	long err;
>  
>  	err = __do_page_fault(regs, address, error_code);
>  
> @@ -580,11 +581,12 @@ int do_page_fault(struct pt_regs *regs, unsigned long address,
>  NOKPROBE_SYMBOL(do_page_fault);
>  
>  #ifdef CONFIG_PPC_BOOK3S_64
> -/* Same as do_page_fault but interrupt entry has already run in do_hash_fault */
> -int hash__do_page_fault(struct pt_regs *regs, unsigned long address,
> -		  unsigned long error_code)
> +/* Same as do_page_fault but no interrupt entry */
> +long hash__do_page_fault(struct pt_regs *regs)
>  {
> -	int err;
> +	unsigned long address = regs->dar;
> +	unsigned long error_code = regs->dsisr;
> +	long err;
>  
>  	err = __do_page_fault(regs, address, error_code);
>  	if (unlikely(err)) {
> -- 
> 2.23.0
