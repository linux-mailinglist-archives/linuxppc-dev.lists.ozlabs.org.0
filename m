Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3812E31A619
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Feb 2021 21:34:30 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DclbR3pgNzDwws
	for <lists+linuxppc-dev@lfdr.de>; Sat, 13 Feb 2021 07:34:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=farosas@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=ZwGXrc4O; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DclYz0s7kzDwrj
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 13 Feb 2021 07:33:09 +1100 (AEDT)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 11CKVgrn168992; Fri, 12 Feb 2021 15:33:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=zWIx8YlfdRkGZrx+RVHO/lu+abIC0bDmmclfcpPPjU4=;
 b=ZwGXrc4O0gfkk8gyB/+ZwMzFpF4ItXYT/8YRuZ1WOZzKPzeb1E5QBQ1AuyQZMPzaen++
 3LEIWhC6u7Agpq90scNCQMGb4uVQZNmv+uzeK1/A2IB3YMZvtas1Q2MlCfjxqtv+9qdR
 /zLzZIozd/Q482hbhRz/lA3TQQIMFdjkYFSPtC+8huwRK9mzVR5iv4FShjZuTObwxFyf
 a0aW2mgL2D4QBOwEVi5NcC9Kmfg2TGfy92C6xnPrKyjmf7pLzRgtNPSMXqDFGGWeh1bz
 d10ZZGu4/aph6Fg5/B1Byj5mNXY1UlREvIPE7NYGZ8aE6NPDfE95G9vzbj0twcnHNRKL +Q== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 36p0q683rd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 12 Feb 2021 15:33:06 -0500
Received: from m0098413.ppops.net (m0098413.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 11CKX6oq174193;
 Fri, 12 Feb 2021 15:33:06 -0500
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0b-001b2d01.pphosted.com with ESMTP id 36p0q683r7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 12 Feb 2021 15:33:06 -0500
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 11CKRdxL022638;
 Fri, 12 Feb 2021 20:33:05 GMT
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com
 [9.57.198.25]) by ppma04wdc.us.ibm.com with ESMTP id 36hjr9ysn5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 12 Feb 2021 20:33:05 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 11CKX5vx27197788
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 12 Feb 2021 20:33:05 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7F77FAC05F;
 Fri, 12 Feb 2021 20:33:05 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B5D26AC059;
 Fri, 12 Feb 2021 20:33:04 +0000 (GMT)
Received: from localhost (unknown [9.163.11.170])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTPS;
 Fri, 12 Feb 2021 20:33:04 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: Nicholas Piggin <npiggin@gmail.com>, kvm-ppc@vger.kernel.org
Subject: Re: [RFC PATCH 2/9] KVM: PPC: Book3S 64: Move GUEST_MODE_SKIP test
 into KVM
In-Reply-To: <20210202030313.3509446-3-npiggin@gmail.com>
References: <20210202030313.3509446-1-npiggin@gmail.com>
 <20210202030313.3509446-3-npiggin@gmail.com>
Date: Fri, 12 Feb 2021 17:33:02 -0300
Message-ID: <87tuqhxc01.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.737
 definitions=2021-02-12_09:2021-02-12,
 2021-02-12 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxscore=0
 adultscore=0 malwarescore=0 phishscore=0 bulkscore=0 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102120148
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
Cc: linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Nicholas Piggin <npiggin@gmail.com> writes:

> Move the GUEST_MODE_SKIP logic into KVM code. This is quite a KVM
> internal detail that has no real need to be in common handlers.

LGTM,

>
> (XXX: Need to confirm CBE handlers etc)

Do these interrupts exist only in Cell? I see that they set HSRRs and
MSR_HV, but CPU_FTRS_CELL does not contain CPU_HVMODE. So I don't get
why they use the KVM macros.

And for the instruction_breakpoint (0x1300) I think it would help if we
could at least restrict when it is built. But I don't know what
ISA/processor version it is from.

>
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>  arch/powerpc/kernel/exceptions-64s.S | 64 ----------------------------
>  arch/powerpc/kvm/book3s_64_entry.S   | 50 ++++++++++++++++++----
>  2 files changed, 42 insertions(+), 72 deletions(-)
>
> diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
> index 65659ea3cec4..e6f7fc7c61a1 100644
> --- a/arch/powerpc/kernel/exceptions-64s.S
> +++ b/arch/powerpc/kernel/exceptions-64s.S
> @@ -133,7 +133,6 @@ name:
>  #define IBRANCH_TO_COMMON	.L_IBRANCH_TO_COMMON_\name\() /* ENTRY branch to common */
>  #define IREALMODE_COMMON	.L_IREALMODE_COMMON_\name\() /* Common runs in realmode */
>  #define IMASK		.L_IMASK_\name\()	/* IRQ soft-mask bit */
> -#define IKVM_SKIP	.L_IKVM_SKIP_\name\()	/* Generate KVM skip handler */
>  #define IKVM_REAL	.L_IKVM_REAL_\name\()	/* Real entry tests KVM */
>  #define __IKVM_REAL(name)	.L_IKVM_REAL_ ## name
>  #define IKVM_VIRT	.L_IKVM_VIRT_\name\()	/* Virt entry tests KVM */
> @@ -191,9 +190,6 @@ do_define_int n
>  	.ifndef IMASK
>  		IMASK=0
>  	.endif
> -	.ifndef IKVM_SKIP
> -		IKVM_SKIP=0
> -	.endif
>  	.ifndef IKVM_REAL
>  		IKVM_REAL=0
>  	.endif
> @@ -254,15 +250,10 @@ do_define_int n
>  	.balign IFETCH_ALIGN_BYTES
>  \name\()_kvm:
>
> -	.if IKVM_SKIP
> -	cmpwi	r10,KVM_GUEST_MODE_SKIP
> -	beq	89f
> -	.else
>  BEGIN_FTR_SECTION
>  	ld	r10,IAREA+EX_CFAR(r13)
>  	std	r10,HSTATE_CFAR(r13)
>  END_FTR_SECTION_IFSET(CPU_FTR_CFAR)
> -	.endif
>
>  	ld	r10,IAREA+EX_CTR(r13)
>  	mtctr	r10
> @@ -289,27 +280,6 @@ END_FTR_SECTION_IFSET(CPU_FTR_HAS_PPR)
>  	ori	r12,r12,(IVEC)
>  	.endif
>  	b	kvmppc_interrupt
> -
> -	.if IKVM_SKIP
> -89:	mtocrf	0x80,r9
> -	ld	r10,IAREA+EX_CTR(r13)
> -	mtctr	r10
> -	ld	r9,IAREA+EX_R9(r13)
> -	ld	r10,IAREA+EX_R10(r13)
> -	ld	r11,IAREA+EX_R11(r13)
> -	ld	r12,IAREA+EX_R12(r13)
> -	.if IHSRR_IF_HVMODE
> -	BEGIN_FTR_SECTION
> -	b	kvmppc_skip_Hinterrupt
> -	FTR_SECTION_ELSE
> -	b	kvmppc_skip_interrupt
> -	ALT_FTR_SECTION_END_IFSET(CPU_FTR_HVMODE | CPU_FTR_ARCH_206)
> -	.elseif IHSRR
> -	b	kvmppc_skip_Hinterrupt
> -	.else
> -	b	kvmppc_skip_interrupt
> -	.endif
> -	.endif
>  .endm
>
>  #else
> @@ -1128,7 +1098,6 @@ INT_DEFINE_BEGIN(machine_check)
>  	ISET_RI=0
>  	IDAR=1
>  	IDSISR=1
> -	IKVM_SKIP=1
>  	IKVM_REAL=1
>  INT_DEFINE_END(machine_check)
>
> @@ -1419,7 +1388,6 @@ INT_DEFINE_BEGIN(data_access)
>  	IVEC=0x300
>  	IDAR=1
>  	IDSISR=1
> -	IKVM_SKIP=1
>  	IKVM_REAL=1
>  INT_DEFINE_END(data_access)
>
> @@ -1469,7 +1437,6 @@ INT_DEFINE_BEGIN(data_access_slb)
>  	IAREA=PACA_EXSLB
>  	IRECONCILE=0
>  	IDAR=1
> -	IKVM_SKIP=1
>  	IKVM_REAL=1
>  INT_DEFINE_END(data_access_slb)
>
> @@ -2116,7 +2083,6 @@ INT_DEFINE_BEGIN(h_data_storage)
>  	IHSRR=1
>  	IDAR=1
>  	IDSISR=1
> -	IKVM_SKIP=1
>  	IKVM_REAL=1
>  	IKVM_VIRT=1
>  INT_DEFINE_END(h_data_storage)
> @@ -2573,7 +2539,6 @@ EXC_VIRT_NONE(0x5100, 0x100)
>  INT_DEFINE_BEGIN(cbe_system_error)
>  	IVEC=0x1200
>  	IHSRR=1
> -	IKVM_SKIP=1
>  	IKVM_REAL=1
>  INT_DEFINE_END(cbe_system_error)
>
> @@ -2598,7 +2563,6 @@ EXC_VIRT_NONE(0x5200, 0x100)
>  INT_DEFINE_BEGIN(instruction_breakpoint)
>  	IVEC=0x1300
>  #ifdef CONFIG_KVM_BOOK3S_PR_POSSIBLE
> -	IKVM_SKIP=1
>  	IKVM_REAL=1
>  #endif
>  INT_DEFINE_END(instruction_breakpoint)
> @@ -2744,7 +2708,6 @@ EXC_COMMON_BEGIN(denorm_exception_common)
>  INT_DEFINE_BEGIN(cbe_maintenance)
>  	IVEC=0x1600
>  	IHSRR=1
> -	IKVM_SKIP=1
>  	IKVM_REAL=1
>  INT_DEFINE_END(cbe_maintenance)
>
> @@ -2797,7 +2760,6 @@ EXC_COMMON_BEGIN(altivec_assist_common)
>  INT_DEFINE_BEGIN(cbe_thermal)
>  	IVEC=0x1800
>  	IHSRR=1
> -	IKVM_SKIP=1
>  	IKVM_REAL=1
>  INT_DEFINE_END(cbe_thermal)
>
> @@ -3081,32 +3043,6 @@ EXPORT_SYMBOL(do_uaccess_flush)
>  MASKED_INTERRUPT
>  MASKED_INTERRUPT hsrr=1
>
> -#ifdef CONFIG_KVM_BOOK3S_64_HANDLER
> -kvmppc_skip_interrupt:
> -	/*
> -	 * Here all GPRs are unchanged from when the interrupt happened
> -	 * except for r13, which is saved in SPRG_SCRATCH0.
> -	 */
> -	mfspr	r13, SPRN_SRR0
> -	addi	r13, r13, 4
> -	mtspr	SPRN_SRR0, r13
> -	GET_SCRATCH0(r13)
> -	RFI_TO_KERNEL
> -	b	.
> -
> -kvmppc_skip_Hinterrupt:
> -	/*
> -	 * Here all GPRs are unchanged from when the interrupt happened
> -	 * except for r13, which is saved in SPRG_SCRATCH0.
> -	 */
> -	mfspr	r13, SPRN_HSRR0
> -	addi	r13, r13, 4
> -	mtspr	SPRN_HSRR0, r13
> -	GET_SCRATCH0(r13)
> -	HRFI_TO_KERNEL
> -	b	.
> -#endif
> -
>  	/*
>  	 * Relocation-on interrupts: A subset of the interrupts can be delivered
>  	 * with IR=1/DR=1, if AIL==2 and MSR.HV won't be changed by delivering
> diff --git a/arch/powerpc/kvm/book3s_64_entry.S b/arch/powerpc/kvm/book3s_64_entry.S
> index 22e34b95f478..8e7216f3c3ee 100644
> --- a/arch/powerpc/kvm/book3s_64_entry.S
> +++ b/arch/powerpc/kvm/book3s_64_entry.S
> @@ -1,9 +1,10 @@
> +#include <asm/asm-offsets.h>
>  #include <asm/cache.h>
> -#include <asm/ppc_asm.h>
> +#include <asm/exception-64s.h>
>  #include <asm/kvm_asm.h>
> -#include <asm/reg.h>
> -#include <asm/asm-offsets.h>
>  #include <asm/kvm_book3s_asm.h>
> +#include <asm/ppc_asm.h>
> +#include <asm/reg.h>
>
>  /*
>   * We come here from the first-level interrupt handlers.
> @@ -18,17 +19,50 @@ kvmppc_interrupt:
>  	 * guest R12 saved in shadow VCPU SCRATCH0
>  	 * guest R13 saved in SPRN_SCRATCH0
>  	 */
> +	std	r9,HSTATE_SCRATCH2(r13)
> +	lbz	r9,HSTATE_IN_GUEST(r13)
> +	cmpwi	r9,KVM_GUEST_MODE_SKIP
> +	beq	maybe_skip
> +no_skip:
>  #ifdef CONFIG_KVM_BOOK3S_HV_POSSIBLE
> -	std	r9, HSTATE_SCRATCH2(r13)
> -	lbz	r9, HSTATE_IN_GUEST(r13)
> -	cmpwi	r9, KVM_GUEST_MODE_HOST_HV
> +	cmpwi	r9,KVM_GUEST_MODE_HOST_HV
>  	beq	kvmppc_bad_host_intr
>  #ifdef CONFIG_KVM_BOOK3S_PR_POSSIBLE
> -	cmpwi	r9, KVM_GUEST_MODE_GUEST
> -	ld	r9, HSTATE_SCRATCH2(r13)
> +	cmpwi	r9,KVM_GUEST_MODE_GUEST
> +	ld	r9,HSTATE_SCRATCH2(r13)
>  	beq	kvmppc_interrupt_pr
>  #endif
>  	b	kvmppc_interrupt_hv
>  #else
>  	b	kvmppc_interrupt_pr
>  #endif
> +
> +maybe_skip:
> +	cmpwi	r12,0x200
> +	beq	1f
> +	cmpwi	r12,0x300
> +	beq	1f
> +	cmpwi	r12,0x380
> +	beq	1f
> +#ifdef CONFIG_KVM_BOOK3S_HV_POSSIBLE
> +	/* XXX: cbe stuff? instruction breakpoint? */
> +	cmpwi	r12,0xe02
> +	beq	2f
> +#endif
> +	b	no_skip
> +1:	mfspr	r9,SPRN_SRR0
> +	addi	r9,r9,4
> +	mtspr	SPRN_SRR0,r9
> +	ld	r12,HSTATE_SCRATCH0(r13)
> +	ld	r9,HSTATE_SCRATCH2(r13)
> +	GET_SCRATCH0(r13)
> +	RFI_TO_KERNEL
> +#ifdef CONFIG_KVM_BOOK3S_HV_POSSIBLE
> +2:	mfspr	r9,SPRN_HSRR0
> +	addi	r9,r9,4
> +	mtspr	SPRN_HSRR0,r9
> +	ld	r12,HSTATE_SCRATCH0(r13)
> +	ld	r9,HSTATE_SCRATCH2(r13)
> +	GET_SCRATCH0(r13)
> +	HRFI_TO_KERNEL
> +#endif
