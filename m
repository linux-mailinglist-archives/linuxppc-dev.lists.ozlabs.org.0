Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C7C0326A1A
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Feb 2021 23:38:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DnPgY1KsJz3cy4
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Feb 2021 09:38:01 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=CZmr8bXL;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=farosas@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=CZmr8bXL; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DnPg51xb1z3cT1
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Feb 2021 09:37:36 +1100 (AEDT)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 11QMYmwU114037; Fri, 26 Feb 2021 17:37:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=DR5hlCkQgi+lU+1Wl7q0lOIFLX6KsyNXT58w/In9Ams=;
 b=CZmr8bXLeGjN2jb2BayqBPqZok9pyBQXsk9RLP8aQMMwoTySpEIy2WU1FIlB7SCBhtW/
 xYCsdrzauBvOLTdSY/tEqjoq0kaM2Z/M8LQHMqaiP6BOezNjAhKK7L7Ows/WDKvCuqmh
 KxWAJN2+NRAWEiR6ogG7H6wppTLl+5ETHlk1JkBpA/W6Ox5W9FS5Zeub9W2mRyRkPOVp
 yPSmUVZGP/7sDJZSwgN2CrAcfiBgCSaxDQ6X6mW+D8g4jEM63kRQTezVElN0HOv6o2vq
 I+oMxRG2nK2YpFXUgBZvHGN1appIO1NgDUGyCVppfy+4c/0HxSHVe8u1mBo/SNGTRte/ Fw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 36y10t1hak-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 26 Feb 2021 17:37:33 -0500
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 11QMZ7uw114494;
 Fri, 26 Feb 2021 17:37:33 -0500
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0b-001b2d01.pphosted.com with ESMTP id 36y10t1haf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 26 Feb 2021 17:37:33 -0500
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 11QMZ6Oq012206;
 Fri, 26 Feb 2021 22:37:32 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma02wdc.us.ibm.com with ESMTP id 36tt29t6qt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 26 Feb 2021 22:37:32 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 11QMbVUW11993720
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 26 Feb 2021 22:37:31 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 71778C6065;
 Fri, 26 Feb 2021 22:37:31 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BB659C6063;
 Fri, 26 Feb 2021 22:37:30 +0000 (GMT)
Received: from localhost (unknown [9.211.110.11])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTPS;
 Fri, 26 Feb 2021 22:37:30 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: Nicholas Piggin <npiggin@gmail.com>, kvm-ppc@vger.kernel.org
Subject: Re: [PATCH v2 23/37] KVM: PPC: Book3S HV P9: Implement the rest of
 the P9 path in C
In-Reply-To: <20210225134652.2127648-24-npiggin@gmail.com>
References: <20210225134652.2127648-1-npiggin@gmail.com>
 <20210225134652.2127648-24-npiggin@gmail.com>
Date: Fri, 26 Feb 2021 19:37:28 -0300
Message-ID: <87y2fawj4n.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-02-26_12:2021-02-26,
 2021-02-26 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0
 adultscore=0 mlxlogscore=999 phishscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102260166
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

Hi, thanks for this. It helped me clarify a bunch of details that I
haven't understood while reading the asm code.

Some comments below:

> Almost all logic is moved to C, by introducing a new in_guest mode that
> selects and branches very early in the interrupt handler to the P9 exit
> code.
>
> The remaining assembly is only about 160 lines of low level stack setup,
> with VCPU vs host register save and restore, plus a small shim to the
> legacy paths in the interrupt handler.
>
> There are two motivations for this, the first is just make the code more
> maintainable being in C. The second is to reduce the amount of code
> running in a special KVM mode, "realmode". I put that in quotes because
> with radix it is no longer necessarily real-mode in the MMU, but it
> still has to be treated specially because it may be in real-mode, and
> has various important registers like PID, DEC, TB, etc set to guest.
> This is hostile to the rest of Linux and can't use arbitrary kernel
> functionality or be instrumented well.
>
> This initial patch is a reasonably faithful conversion of the asm code.
> It does lack any loop to return quickly back into the guest without
> switching out of realmode in the case of unimportant or easily handled
> interrupts, as explained in the previous change, handling HV interrupts
> in real mode is not so important for P9.
>
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---

<snip>

> diff --git a/arch/powerpc/kvm/book3s_64_entry.S b/arch/powerpc/kvm/book3s_64_entry.S
> index f826c8dc2e19..cc7b76865a16 100644
> --- a/arch/powerpc/kvm/book3s_64_entry.S
> +++ b/arch/powerpc/kvm/book3s_64_entry.S
> @@ -1,10 +1,14 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
>  #include <asm/asm-offsets.h>
>  #include <asm/cache.h>
> +#include <asm/code-patching-asm.h>
>  #include <asm/exception-64s.h>
> +#include <asm/export.h>
>  #include <asm/kvm_asm.h>
>  #include <asm/kvm_book3s_asm.h>
>  #include <asm/ppc_asm.h>
>  #include <asm/reg.h>
> +#include <asm/ultravisor-api.h>
>
>  /*
>   * These are branched to from interrupt handlers in exception-64s.S which set
> @@ -13,13 +17,24 @@
>  .global	kvmppc_hcall
>  .balign IFETCH_ALIGN_BYTES
>  kvmppc_hcall:
> +	lbz	r10,HSTATE_IN_GUEST(r13)
> +	cmpwi	r10,KVM_GUEST_MODE_GUEST_HV_FAST
> +	beq	kvmppc_p9_exit_hcall
>  	ld	r10,PACA_EXGEN+EX_R13(r13)
>  	SET_SCRATCH0(r10)
>  	li	r10,0xc00
> +	li	r11,PACA_EXGEN
> +	b	1f
>
>  .global	kvmppc_interrupt
>  .balign IFETCH_ALIGN_BYTES
>  kvmppc_interrupt:
> +	std	r10,HSTATE_SCRATCH0(r13)
> +	lbz	r10,HSTATE_IN_GUEST(r13)
> +	cmpwi	r10,KVM_GUEST_MODE_GUEST_HV_FAST
> +	beq	kvmppc_p9_exit_interrupt
> +	ld	r10,HSTATE_SCRATCH0(r13)
> +	lbz	r11,HSTATE_IN_GUEST(r13)
>  	li	r11,PACA_EXGEN
>  	cmpdi	r10,0x200
>  	bgt+	1f
> @@ -114,3 +129,169 @@ END_FTR_SECTION_IFSET(CPU_FTR_HAS_PPR)
>  	GET_SCRATCH0(r13)
>  	HRFI_TO_KERNEL
>  #endif
> +
> +/* Stack frame offsets for kvmppc_hv_entry */
> +#define SFS			208
> +#define STACK_SLOT_VCPU		(SFS-8)
> +#define STACK_SLOT_NVGPRS	(SFS-152)	/* 18 gprs */
> +
> +/*
> + * void kvmppc_p9_enter_guest(struct vcpu *vcpu);
> + *
> + * Enter the guest on a ISAv3.0 or later system where we have exactly
> + * one vcpu per vcore, and both the host and guest are radix, and threads
> + * are set to "indepdent mode".
> + */
> +.balign	IFETCH_ALIGN_BYTES
> +_GLOBAL(kvmppc_p9_enter_guest)
> +EXPORT_SYMBOL_GPL(kvmppc_p9_enter_guest)
> +	mflr	r0
> +	std	r0,PPC_LR_STKOFF(r1)
> +	stdu	r1,-SFS(r1)
> +
> +	std	r1,HSTATE_HOST_R1(r13)
> +	std	r3,STACK_SLOT_VCPU(r1)

The vcpu was stored on the paca previously. I don't get the change,
could you explain?

> +
> +	mfcr	r4
> +	stw	r4,SFS+8(r1)
> +
> +	reg = 14
> +	.rept	18
> +	std	reg,STACK_SLOT_NVGPRS + ((reg - 14) * 8)(r1)
> +	reg = reg + 1
> +	.endr
> +
> +	ld	r4,VCPU_LR(r3)
> +	mtlr	r4
> +	ld	r4,VCPU_CTR(r3)
> +	mtctr	r4
> +	ld	r4,VCPU_XER(r3)
> +	mtspr	SPRN_XER,r4
> +
> +	ld	r1,VCPU_CR(r3)
> +
> +BEGIN_FTR_SECTION
> +	ld	r4,VCPU_CFAR(r3)
> +	mtspr	SPRN_CFAR,r4
> +END_FTR_SECTION_IFSET(CPU_FTR_CFAR)
> +BEGIN_FTR_SECTION
> +	ld	r4,VCPU_PPR(r3)
> +	mtspr	SPRN_PPR,r4
> +END_FTR_SECTION_IFSET(CPU_FTR_HAS_PPR)
> +
> +	reg = 4
> +	.rept	28
> +	ld	reg,__VCPU_GPR(reg)(r3)
> +	reg = reg + 1
> +	.endr
> +
> +	ld	r4,VCPU_KVM(r3)
> +	lbz	r4,KVM_SECURE_GUEST(r4)
> +	cmpdi	r4,0
> +	ld	r4,VCPU_GPR(R4)(r3)
> +	bne	.Lret_to_ultra
> +
> +	mtcr	r1
> +
> +	ld	r0,VCPU_GPR(R0)(r3)
> +	ld	r1,VCPU_GPR(R1)(r3)
> +	ld	r2,VCPU_GPR(R2)(r3)
> +	ld	r3,VCPU_GPR(R3)(r3)
> +
> +	HRFI_TO_GUEST
> +	b	.
> +
> +	/*
> +	 * Use UV_RETURN ultracall to return control back to the Ultravisor
> +	 * after processing an hypercall or interrupt that was forwarded
> +	 * (a.k.a. reflected) to the Hypervisor.
> +	 *
> +	 * All registers have already been reloaded except the ucall requires:
> +	 *   R0 = hcall result
> +	 *   R2 = SRR1, so UV can detect a synthesized interrupt (if any)
> +	 *   R3 = UV_RETURN
> +	 */
> +.Lret_to_ultra:
> +	mtcr	r1
> +	ld	r1,VCPU_GPR(R1)(r3)
> +
> +	ld	r0,VCPU_GPR(R3)(r3)
> +	mfspr	r2,SPRN_SRR1
> +	LOAD_REG_IMMEDIATE(r3, UV_RETURN)
> +	sc	2
> +
> +/*
> + * kvmppc_p9_exit_hcall and kvmppc_p9_exit_interrupt are branched to from
> + * above if the interrupt was taken for a guest that was entered via
> + * kvmppc_p9_enter_guest().
> + *
> + * This code recovers the host stack and vcpu pointer, saves all GPRs and
> + * CR, LR, CTR, XER as well as guest MSR and NIA into the VCPU, then re-
> + * establishes the host stack and registers to return from  the
> + * kvmppc_p9_enter_guest() function.
> + */
> +.balign	IFETCH_ALIGN_BYTES
> +kvmppc_p9_exit_hcall:
> +	mfspr	r11,SPRN_SRR0
> +	mfspr	r12,SPRN_SRR1
> +	li	r10,0xc00
> +	std	r10,HSTATE_SCRATCH0(r13)
> +
> +.balign	IFETCH_ALIGN_BYTES
> +kvmppc_p9_exit_interrupt:
> +	std     r1,HSTATE_SCRATCH1(r13)
> +	std     r3,HSTATE_SCRATCH2(r13)
> +	ld	r1,HSTATE_HOST_R1(r13)
> +	ld	r3,STACK_SLOT_VCPU(r1)
> +
> +	std	r9,VCPU_CR(r3)
> +
> +1:
> +	std	r11,VCPU_PC(r3)
> +	std	r12,VCPU_MSR(r3)
> +
> +	reg = 14
> +	.rept	18
> +	std	reg,__VCPU_GPR(reg)(r3)
> +	reg = reg + 1
> +	.endr
> +
> +	/* r1, r3, r9-r13 are saved to vcpu by C code */

If we just saved r1 and r3, why don't we put them in the vcpu right now?
That would avoid having the C code knowing about scratch areas.

> +	std	r0,VCPU_GPR(R0)(r3)
> +	std	r2,VCPU_GPR(R2)(r3)
> +	reg = 4
> +	.rept	5
> +	std	reg,__VCPU_GPR(reg)(r3)
> +	reg = reg + 1
> +	.endr
> +
> +	ld	r2,PACATOC(r13)
> +
> +	mflr	r4
> +	std	r4,VCPU_LR(r3)
> +	mfspr	r4,SPRN_XER
> +	std	r4,VCPU_XER(r3)
> +
> +	reg = 14
> +	.rept	18
> +	ld	reg,STACK_SLOT_NVGPRS + ((reg - 14) * 8)(r1)
> +	reg = reg + 1
> +	.endr
> +
> +	lwz	r4,SFS+8(r1)
> +	mtcr	r4
> +
> +	/*
> +	 * Flush the link stack here, before executing the first blr on the
> +	 * way out of the guest.
> +	 *
> +	 * The link stack won't match coming out of the guest anyway so the
> +	 * only cost is the flush itself. The call clobbers r0.
> +	 */
> +1:	nop
> +	patch_site 1b patch__call_kvm_flush_link_stack_2
> +
> +	addi	r1,r1,SFS
> +	ld	r0,PPC_LR_STKOFF(r1)
> +	mtlr	r0
> +	blr
> diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
> index 1997cf347d3e..28a2761515e3 100644
> --- a/arch/powerpc/kvm/book3s_hv.c
> +++ b/arch/powerpc/kvm/book3s_hv.c
> @@ -1421,6 +1421,8 @@ static int kvmppc_handle_exit_hv(struct kvm_vcpu *vcpu,
>  	 */
>  	case BOOK3S_INTERRUPT_H_DATA_STORAGE:
>  		r = RESUME_PAGE_FAULT;
> +		if (vcpu->arch.fault_dsisr == HDSISR_CANARY)
> +			r = RESUME_GUEST; /* Just retry if it's the canary */
>  		break;
>  	case BOOK3S_INTERRUPT_H_INST_STORAGE:
>  		vcpu->arch.fault_dar = kvmppc_get_pc(vcpu);
> @@ -3736,14 +3738,14 @@ static int kvmhv_p9_guest_entry(struct kvm_vcpu *vcpu, u64 time_limit,
>  		vcpu->arch.shregs.dsisr = mfspr(SPRN_DSISR);
>  		vcpu->arch.psscr = mfspr(SPRN_PSSCR_PR);
>  		mtspr(SPRN_PSSCR_PR, host_psscr);
> -
>  		/* H_CEDE has to be handled now, not later */
> -		if (trap == BOOK3S_INTERRUPT_SYSCALL && !vcpu->arch.nested &&
> +		if (trap == BOOK3S_INTERRUPT_SYSCALL &&
>  		    kvmppc_get_gpr(vcpu, 3) == H_CEDE) {
>  			kvmppc_cede(vcpu);
>  			kvmppc_set_gpr(vcpu, 3, 0);
>  			trap = 0;
>  		}
> +
>  	} else {
>  		kvmppc_xive_push_vcpu(vcpu);
>  		trap = kvmhv_load_hv_regs_and_go(vcpu, time_limit, lpcr);
> @@ -3768,9 +3770,10 @@ static int kvmhv_p9_guest_entry(struct kvm_vcpu *vcpu, u64 time_limit,
>  			}
>  		}
>  		kvmppc_xive_pull_vcpu(vcpu);
> +
> +		vcpu->arch.slb_max = 0;
>  	}
>
> -	vcpu->arch.slb_max = 0;
>  	dec = mfspr(SPRN_DEC);
>  	if (!(lpcr & LPCR_LD)) /* Sign extend if not using large decrementer */
>  		dec = (s32) dec;
> @@ -4429,11 +4432,19 @@ static int kvmppc_vcpu_run_hv(struct kvm_vcpu *vcpu)
>  		else
>  			r = kvmppc_run_vcpu(vcpu);
>
> -		if (run->exit_reason == KVM_EXIT_PAPR_HCALL &&
> -		    !(vcpu->arch.shregs.msr & MSR_PR)) {
> -			trace_kvm_hcall_enter(vcpu);
> -			r = kvmppc_pseries_do_hcall(vcpu);
> -			trace_kvm_hcall_exit(vcpu, r);
> +		if (run->exit_reason == KVM_EXIT_PAPR_HCALL) {
> +			if (unlikely(vcpu->arch.shregs.msr & MSR_PR)) {
> +				/*
> +				 * Guest userspace executed sc 1, reflect it
> +				 * back as a privileged program check interrupt.
> +				 */
> +				kvmppc_core_queue_program(vcpu, SRR1_PROGPRIV);
> +				r = RESUME_GUEST;

This is in conflict with this snippet in kvmppc_handle_exit_hv:

	case BOOK3S_INTERRUPT_SYSCALL:
	{
		/* hcall - punt to userspace */
		int i;

		/* hypercall with MSR_PR has already been handled in rmode,
		 * and never reaches here.
		 */

That function already queues some 0x700s so maybe we could move this one
in there as well.

> +			} else {
> +				trace_kvm_hcall_enter(vcpu);
> +				r = kvmppc_pseries_do_hcall(vcpu);
> +				trace_kvm_hcall_exit(vcpu, r);
> +			}
>  			kvmppc_core_prepare_to_enter(vcpu);
>  		} else if (r == RESUME_PAGE_FAULT) {
>  			srcu_idx = srcu_read_lock(&kvm->srcu);
> diff --git a/arch/powerpc/kvm/book3s_hv_interrupt.c b/arch/powerpc/kvm/book3s_hv_interrupt.c
> new file mode 100644
> index 000000000000..5a7b036c447f
> --- /dev/null
> +++ b/arch/powerpc/kvm/book3s_hv_interrupt.c
> @@ -0,0 +1,221 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +#include <linux/kernel.h>
> +#include <linux/kvm_host.h>
> +#include <asm/asm-prototypes.h>
> +#include <asm/dbell.h>
> +#include <asm/kvm_ppc.h>
> +
> +#ifdef CONFIG_KVM_BOOK3S_HV_EXIT_TIMING
> +static void __start_timing(struct kvm_vcpu *vcpu, struct kvmhv_tb_accumulator *next)
> +{
> +	struct kvmppc_vcore *vc = vcpu->arch.vcore;
> +	u64 tb = mftb() - vc->tb_offset_applied;
> +
> +	vcpu->arch.cur_activity = next;
> +	vcpu->arch.cur_tb_start = tb;
> +}
> +
> +static void __accumulate_time(struct kvm_vcpu *vcpu, struct kvmhv_tb_accumulator *next)
> +{
> +	struct kvmppc_vcore *vc = vcpu->arch.vcore;
> +	struct kvmhv_tb_accumulator *curr;
> +	u64 tb = mftb() - vc->tb_offset_applied;
> +	u64 prev_tb;
> +	u64 delta;
> +	u64 seq;
> +
> +	curr = vcpu->arch.cur_activity;
> +	vcpu->arch.cur_activity = next;
> +	prev_tb = vcpu->arch.cur_tb_start;
> +	vcpu->arch.cur_tb_start = tb;
> +
> +	if (!curr)
> +		return;
> +
> +	delta = tb - prev_tb;
> +
> +	seq = curr->seqcount;
> +	curr->seqcount = seq + 1;
> +	smp_wmb();
> +	curr->tb_total += delta;
> +	if (seq == 0 || delta < curr->tb_min)
> +		curr->tb_min = delta;
> +	if (delta > curr->tb_max)
> +		curr->tb_max = delta;
> +	smp_wmb();
> +	curr->seqcount = seq + 2;
> +}
> +
> +#define start_timing(vcpu, next) __start_timing(vcpu, next)
> +#define end_timing(vcpu) __start_timing(vcpu, NULL)
> +#define accumulate_time(vcpu, next) __accumulate_time(vcpu, next)
> +#else
> +#define start_timing(vcpu, next) do {} while (0)
> +#define end_timing(vcpu) do {} while (0)
> +#define accumulate_time(vcpu, next) do {} while (0)
> +#endif
> +
> +static inline void mfslb(unsigned int idx, u64 *slbee, u64 *slbev)
> +{
> +	asm volatile("slbmfev  %0,%1" : "=r" (*slbev) : "r" (idx));
> +	asm volatile("slbmfee  %0,%1" : "=r" (*slbee) : "r" (idx));
> +}
> +
> +static inline void mtslb(unsigned int idx, u64 slbee, u64 slbev)
> +{
> +	BUG_ON((slbee & 0xfff) != idx);
> +
> +	asm volatile("slbmte %0,%1" :: "r" (slbev), "r" (slbee));
> +}
> +
> +static inline void slb_invalidate(unsigned int ih)
> +{
> +	asm volatile("slbia %0" :: "i"(ih));
> +}
> +
> +/*
> + * Malicious or buggy radix guests may have inserted SLB entries
> + * (only 0..3 because radix always runs with UPRT=1), so these must
> + * be cleared here to avoid side-channels. slbmte is used rather
> + * than slbia, as it won't clear cached translations.
> + */
> +static void radix_clear_slb(void)
> +{
> +	u64 slbee, slbev;
> +	int i;
> +
> +	for (i = 0; i < 4; i++) {
> +		mfslb(i, &slbee, &slbev);
> +		if (unlikely(slbee || slbev)) {
> +			slbee = i;
> +			slbev = 0;
> +			mtslb(i, slbee, slbev);
> +		}
> +	}
> +}
> +
> +int __kvmhv_vcpu_entry_p9(struct kvm_vcpu *vcpu)
> +{
> +	u64 *exsave;
> +	unsigned long msr = mfmsr();
> +	int trap;
> +
> +	start_timing(vcpu, &vcpu->arch.rm_entry);
> +
> +	vcpu->arch.ceded = 0;
> +
> +	WARN_ON_ONCE(vcpu->arch.shregs.msr & MSR_HV);
> +	WARN_ON_ONCE(!(vcpu->arch.shregs.msr & MSR_ME));
> +
> +	mtspr(SPRN_HSRR0, vcpu->arch.regs.nip);
> +	mtspr(SPRN_HSRR1, (vcpu->arch.shregs.msr & ~MSR_HV) | MSR_ME);
> +
> +	/*
> +	 * On POWER9 DD2.1 and below, sometimes on a Hypervisor Data Storage
> +	 * Interrupt (HDSI) the HDSISR is not be updated at all.

s/be //

> +	 *
> +	 * To work around this we put a canary value into the HDSISR before
> +	 * returning to a guest and then check for this canary when we take a
> +	 * HDSI. If we find the canary on a HDSI, we know the hardware didn't
> +	 * update the HDSISR. In this case we return to the guest to retake the
> +	 * HDSI which should correctly update the HDSISR the second time HDSI
> +	 * entry.
> +	 *
> +	 * Just do this on all p9 processors for now.
> +	 */
> +	mtspr(SPRN_HDSISR, HDSISR_CANARY);
> +
> +	accumulate_time(vcpu, &vcpu->arch.guest_time);
> +
> +	local_paca->kvm_hstate.in_guest = KVM_GUEST_MODE_GUEST_HV_FAST;
> +	kvmppc_p9_enter_guest(vcpu);
> +	// Radix host and guest means host never runs with guest MMU state
> +	local_paca->kvm_hstate.in_guest = KVM_GUEST_MODE_NONE;
> +
> +	accumulate_time(vcpu, &vcpu->arch.rm_intr);
> +
> +	/* Get these from r11/12 and paca exsave */
> +	vcpu->arch.shregs.srr0 = mfspr(SPRN_SRR0);
> +	vcpu->arch.shregs.srr1 = mfspr(SPRN_SRR1);
> +	vcpu->arch.shregs.dar = mfspr(SPRN_DAR);
> +	vcpu->arch.shregs.dsisr = mfspr(SPRN_DSISR);
> +
> +	trap = local_paca->kvm_hstate.scratch0 & ~0x2;

Couldn't we return the trap from kvmppc_p9_enter_guest? Seems like a
nice pattern to have and avoids exposing the IVEC+0x2 magic which is hidden
in asm already.

> +	if (likely(trap > BOOK3S_INTERRUPT_MACHINE_CHECK)) {
> +		exsave = local_paca->exgen;
> +	} else if (trap == BOOK3S_INTERRUPT_SYSTEM_RESET) {
> +		exsave = local_paca->exnmi;
> +	} else { /* trap == 0x200 */
> +		exsave = local_paca->exmc;
> +	}
> +
> +	vcpu->arch.regs.gpr[1] = local_paca->kvm_hstate.scratch1;
> +	vcpu->arch.regs.gpr[3] = local_paca->kvm_hstate.scratch2;
> +	vcpu->arch.regs.gpr[9] = exsave[EX_R9/sizeof(u64)];
> +	vcpu->arch.regs.gpr[10] = exsave[EX_R10/sizeof(u64)];
> +	vcpu->arch.regs.gpr[11] = exsave[EX_R11/sizeof(u64)];
> +	vcpu->arch.regs.gpr[12] = exsave[EX_R12/sizeof(u64)];
> +	vcpu->arch.regs.gpr[13] = exsave[EX_R13/sizeof(u64)];
> +	vcpu->arch.ppr = exsave[EX_PPR/sizeof(u64)];
> +	vcpu->arch.cfar = exsave[EX_CFAR/sizeof(u64)];
> +	vcpu->arch.regs.ctr = exsave[EX_CTR/sizeof(u64)];
> +
> +	vcpu->arch.last_inst = KVM_INST_FETCH_FAILED;
> +
> +	if (unlikely(trap == BOOK3S_INTERRUPT_MACHINE_CHECK)) {
> +		vcpu->arch.fault_dar = exsave[EX_DAR/sizeof(u64)];
> +		vcpu->arch.fault_dsisr = exsave[EX_DSISR/sizeof(u64)];
> +		kvmppc_realmode_machine_check(vcpu);
> +
> +	} else if (unlikely(trap == BOOK3S_INTERRUPT_HMI)) {
> +		kvmppc_realmode_hmi_handler();
> +
> +	} else if (trap == BOOK3S_INTERRUPT_H_EMUL_ASSIST) {
> +		vcpu->arch.emul_inst = mfspr(SPRN_HEIR);
> +
> +	} else if (trap == BOOK3S_INTERRUPT_H_DATA_STORAGE) {
> +		vcpu->arch.fault_dar = exsave[EX_DAR/sizeof(u64)];
> +		vcpu->arch.fault_dsisr = exsave[EX_DSISR/sizeof(u64)];
> +		vcpu->arch.fault_gpa = mfspr(SPRN_ASDR);
> +
> +	} else if (trap == BOOK3S_INTERRUPT_H_INST_STORAGE) {
> +		vcpu->arch.fault_gpa = mfspr(SPRN_ASDR);
> +
> +	} else if (trap == BOOK3S_INTERRUPT_H_FAC_UNAVAIL) {
> +		vcpu->arch.hfscr = mfspr(SPRN_HFSCR);
> +
> +#ifdef CONFIG_PPC_TRANSACTIONAL_MEM
> +	/*
> +	 * Softpatch interrupt for transactional memory emulation cases
> +	 * on POWER9 DD2.2.  This is early in the guest exit path - we
> +	 * haven't saved registers or done a treclaim yet.
> +	 */
> +	} else if (trap == BOOK3S_INTERRUPT_HV_SOFTPATCH) {
> +		vcpu->arch.emul_inst = mfspr(SPRN_HEIR);
> +
> +		/*
> +		 * The cases we want to handle here are those where the guest
> +		 * is in real suspend mode and is trying to transition to
> +		 * transactional mode.
> +		 */
> +		if (local_paca->kvm_hstate.fake_suspend &&
> +				(vcpu->arch.shregs.msr & MSR_TS_S)) {
> +			if (kvmhv_p9_tm_emulation_early(vcpu)) {
> +				/* Prevent it being handled again. */
> +				trap = 0;
> +			}
> +		}
> +#endif
> +	}
> +
> +	radix_clear_slb();
> +
> +	__mtmsrd(msr, 0);

Isn't this the same as mtmsr(msr) ?

> +
> +	accumulate_time(vcpu, &vcpu->arch.rm_exit);
> +
> +	end_timing(vcpu);
> +
> +	return trap;
> +}
> +EXPORT_SYMBOL_GPL(__kvmhv_vcpu_entry_p9);

<snip>
