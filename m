Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 418E4639F13
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Nov 2022 02:53:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NL7mf3VfTz3cV7
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Nov 2022 12:53:54 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=NGF6GMq5;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::634; helo=mail-pl1-x634.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=NGF6GMq5;
	dkim-atps=neutral
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NL7ll1H3sz2xkD
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Nov 2022 12:53:06 +1100 (AEDT)
Received: by mail-pl1-x634.google.com with SMTP id 4so8824318pli.0
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 27 Nov 2022 17:53:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5fd+BefqiFLjG0TKkkZfrwbakV+GNIN2krnh9wCgmNw=;
        b=NGF6GMq5K9eDueGadA3LwsXbLavrHcdzomLtNTgx0/uldeB/COC4IygiWsnAhfieGS
         G3emb4ITyjpRhvZzSUpr32N7q/cE/kRjXHlolZtJOitpR7lguT3WYkUw1Nw3Fv7MZS+9
         r59jg2V5Yj1OFZnytmbCUPECDuM7GXA8kyppSaeJT1fidOhJBYjDOjrlD9dJEYJ38Qux
         tS3TCCxaXbCsAjvOGRYIVgn0rb/PF1ZTiPz7Js/9EUU/AD5rwtHPCthGYC4M3flMAWie
         vBYJYQI3g65JLLuK3PCEIFxoWT4Oa3PauGdZat1eBOE7GAqFrpwW+8uvxB2JrtOzpmVN
         ZeUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5fd+BefqiFLjG0TKkkZfrwbakV+GNIN2krnh9wCgmNw=;
        b=u+3hWLK4Cm1cAyQzz+OWLBCAzrGTeaMZLjTVKNzsovKzwGV6ReOUTyJ6kHFGu/a3SY
         iYvlO/t9tUXImiCsnOUHDto1gtbl6bbevTyWTYm3Xa060YapgZkuvdXvly7MAlprhJsJ
         8NgqGobIND+cWBUfSat6urdAXu/GD/8a9y17grNAP0sR2cF0hvfDwa6TR0fkdT2mcUGO
         eIU74xPT0l1LHwry76YWyKCZTwHepNs6DQXllUPd4SHflfzCqdyP9BpgpI4BZFKV0ss8
         O1Gbe7MiXrBnbuUGdEaJZ4YvD682e59QRLl6TJ97UeYxMA0p1lhCdNQaTOpFnvfC5ps7
         iALg==
X-Gm-Message-State: ANoB5pleaUTeAVrg+Xx7prgsX3zP8o2uLCBVRkmkzBp/GsRUntnsG1N3
	D0kzWUKmDfJCh0IJoeUsIJuq9su0dKA=
X-Google-Smtp-Source: AA0mqf4wpCkdFvxi1tv6+g7e95rFkvxBI02YYS+6TIH6gF52by5EiwZozoYFvceNaThfz7TBymUb+w==
X-Received: by 2002:a17:90a:ff84:b0:213:1e05:f992 with SMTP id hf4-20020a17090aff8400b002131e05f992mr30871134pjb.191.1669600383404;
        Sun, 27 Nov 2022 17:53:03 -0800 (PST)
Received: from localhost ([220.240.231.60])
        by smtp.gmail.com with ESMTPSA id w8-20020a17090a1b8800b001f94d25bfabsm8440117pjc.28.2022.11.27.17.53.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 27 Nov 2022 17:53:02 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 28 Nov 2022 11:52:59 +1000
Message-Id: <CONJXTKVK6TI.36RKGDSVORBYK@bobo>
Subject: Re: [PATCH v2 2/4] powerpc/64s: Clear gprs on interrupt routine
 entry on Book3S
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Rohan McLure" <rmclure@linux.ibm.com>, <linuxppc-dev@lists.ozlabs.org>
X-Mailer: aerc 0.13.0
References: <20221107033202.1375238-1-rmclure@linux.ibm.com>
 <20221107033202.1375238-2-rmclure@linux.ibm.com>
In-Reply-To: <20221107033202.1375238-2-rmclure@linux.ibm.com>
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
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon Nov 7, 2022 at 1:32 PM AEST, Rohan McLure wrote:
> Zero user state in gprs (assign to zero) to reduce the influence of user
> registers on speculation within kernel syscall handlers. Clears occur
> at the very beginning of the sc and scv 0 interrupt handlers, with
> restores occurring following the execution of the syscall handler.
>
> Zero GPRS r0, r2-r11, r14-r31, on entry into the kernel for all
> other interrupt sources. The remaining gprs are overwritten by
> entry macros to interrupt handlers, irrespective of whether or not a
> given handler consumes these register values.
>
> Prior to this commit, r14-r31 are restored on a per-interrupt basis at
> exit, but now they are always restored on 64bit Book3S. Remove explicit
> REST_NVGPRS invocations on 64-bit Book3S. 32-bit systems do not clear
> user registers on interrupt, and continue to depend on the return value
> of interrupt_exit_user_prepare to determine whether or not to restore
> non-volatiles.
>
> The mmap_bench benchmark in selftests should rapidly invoke pagefaults.
> See ~0.8% performance regression with this mitigation, but this
> indicates the worst-case performance due to heavier-weight interrupt
> handlers. This mitigation is able to be enabled/disabled through
> CONFIG_INTERRUPT_SANITIZE_REGISTERS.

I think it looks good. You could put those macros into a .h file shared
by exceptions-64s.S and interrupt_64.S. Also interrupt_64.S could use
the HANDLER_RESTORE_NVGPRS macro to kill a few ifdefs I think? The
IMSR_R12 change *could* be done in a separate patch, if you're doing
another spin... sorry for the late feedback.

Reviewed-by: Nicholas Piggin <npiggin@gmail.com>

>
> Signed-off-by: Rohan McLure <rmclure@linux.ibm.com>
> ---
> Resubmitting patches as their own series after v6 partially merged:
> Link: https://lore.kernel.org/all/166488988686.779920.1379487010269641628=
3.b4-ty@ellerman.id.au/t/
>
> v2: REST_NVGPRS should be conditional on mitigation in scv handler. Fix
> improper multi-line preprocessor macro in interrupt_64.S
> ---
>  arch/powerpc/kernel/exceptions-64s.S | 47 +++++++++++++++++++++-----
>  arch/powerpc/kernel/interrupt_64.S   | 36 ++++++++++++++++++++
>  2 files changed, 74 insertions(+), 9 deletions(-)
>
> diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/e=
xceptions-64s.S
> index 651c36b056bd..0605018762d1 100644
> --- a/arch/powerpc/kernel/exceptions-64s.S
> +++ b/arch/powerpc/kernel/exceptions-64s.S
> @@ -21,6 +21,19 @@
>  #include <asm/feature-fixups.h>
>  #include <asm/kup.h>
> =20
> +/*
> + * macros for handling user register sanitisation
> + */
> +#ifdef CONFIG_INTERRUPT_SANITIZE_REGISTERS
> +#define SANITIZE_ZEROIZE_NVGPRS()	ZEROIZE_NVGPRS()
> +#define SANITIZE_RESTORE_NVGPRS()	REST_NVGPRS(r1)
> +#define HANDLER_RESTORE_NVGPRS()
> +#else
> +#define SANITIZE_ZEROIZE_NVGPRS()
> +#define SANITIZE_RESTORE_NVGPRS()
> +#define HANDLER_RESTORE_NVGPRS()	REST_NVGPRS(r1)
> +#endif /* CONFIG_INTERRUPT_SANITIZE_REGISTERS */
> +
>  /*
>   * Following are fixed section helper macros.
>   *
> @@ -111,6 +124,7 @@ name:
>  #define ISTACK		.L_ISTACK_\name\()	/* Set regular kernel stack */
>  #define __ISTACK(name)	.L_ISTACK_ ## name
>  #define IKUAP		.L_IKUAP_\name\()	/* Do KUAP lock */
> +#define IMSR_R12	.L_IMSR_R12_\name\()	/* Assumes MSR saved to r12 */
> =20
>  #define INT_DEFINE_BEGIN(n)						\
>  .macro int_define_ ## n name
> @@ -176,6 +190,9 @@ do_define_int n
>  	.ifndef IKUAP
>  		IKUAP=3D1
>  	.endif
> +	.ifndef IMSR_R12
> +		IMSR_R12=3D0
> +	.endif
>  .endm
> =20
>  /*
> @@ -502,6 +519,7 @@ DEFINE_FIXED_SYMBOL(\name\()_common_real, text)
>  	std	r10,0(r1)		/* make stack chain pointer	*/
>  	std	r0,GPR0(r1)		/* save r0 in stackframe	*/
>  	std	r10,GPR1(r1)		/* save r1 in stackframe	*/
> +	ZEROIZE_GPR(0)
> =20
>  	/* Mark our [H]SRRs valid for return */
>  	li	r10,1
> @@ -544,8 +562,14 @@ END_FTR_SECTION_IFSET(CPU_FTR_HAS_PPR)
>  	std	r9,GPR11(r1)
>  	std	r10,GPR12(r1)
>  	std	r11,GPR13(r1)
> +	.if !IMSR_R12
> +	ZEROIZE_GPRS(9, 12)
> +	.else
> +	ZEROIZE_GPRS(9, 11)
> +	.endif
> =20
>  	SAVE_NVGPRS(r1)
> +	SANITIZE_ZEROIZE_NVGPRS()
> =20
>  	.if IDAR
>  	.if IISIDE
> @@ -577,8 +601,8 @@ BEGIN_FTR_SECTION
>  END_FTR_SECTION_IFSET(CPU_FTR_CFAR)
>  	ld	r10,IAREA+EX_CTR(r13)
>  	std	r10,_CTR(r1)
> -	std	r2,GPR2(r1)		/* save r2 in stackframe	*/
> -	SAVE_GPRS(3, 8, r1)		/* save r3 - r8 in stackframe   */
> +	SAVE_GPRS(2, 8, r1)		/* save r2 - r8 in stackframe   */
> +	ZEROIZE_GPRS(2, 8)
>  	mflr	r9			/* Get LR, later save to stack	*/
>  	LOAD_PACA_TOC()			/* get kernel TOC into r2	*/
>  	std	r9,_LINK(r1)
> @@ -696,6 +720,7 @@ END_FTR_SECTION_IFSET(CPU_FTR_CFAR)
>  	mtlr	r9
>  	ld	r9,_CCR(r1)
>  	mtcr	r9
> +	SANITIZE_RESTORE_NVGPRS()
>  	REST_GPRS(2, 13, r1)
>  	REST_GPR(0, r1)
>  	/* restore original r1. */
> @@ -1441,7 +1466,7 @@ ALT_MMU_FTR_SECTION_END_IFCLR(MMU_FTR_TYPE_RADIX)
>  	 * do_break() may have changed the NV GPRS while handling a breakpoint.
>  	 * If so, we need to restore them with their updated values.
>  	 */
> -	REST_NVGPRS(r1)
> +	HANDLER_RESTORE_NVGPRS()
>  	b	interrupt_return_srr
> =20
> =20
> @@ -1667,7 +1692,7 @@ EXC_COMMON_BEGIN(alignment_common)
>  	GEN_COMMON alignment
>  	addi	r3,r1,STACK_FRAME_OVERHEAD
>  	bl	alignment_exception
> -	REST_NVGPRS(r1) /* instruction emulation may change GPRs */
> +	HANDLER_RESTORE_NVGPRS() /* instruction emulation may change GPRs */
>  	b	interrupt_return_srr
> =20
> =20
> @@ -1733,7 +1758,7 @@ EXC_COMMON_BEGIN(program_check_common)
>  .Ldo_program_check:
>  	addi	r3,r1,STACK_FRAME_OVERHEAD
>  	bl	program_check_exception
> -	REST_NVGPRS(r1) /* instruction emulation may change GPRs */
> +	HANDLER_RESTORE_NVGPRS() /* instruction emulation may change GPRs */
>  	b	interrupt_return_srr
> =20
> =20
> @@ -1751,6 +1776,7 @@ INT_DEFINE_BEGIN(fp_unavailable)
>  #ifdef CONFIG_KVM_BOOK3S_PR_POSSIBLE
>  	IKVM_REAL=3D1
>  #endif
> +	IMSR_R12=3D1
>  INT_DEFINE_END(fp_unavailable)
> =20
>  EXC_REAL_BEGIN(fp_unavailable, 0x800, 0x100)
> @@ -2164,7 +2190,7 @@ EXC_COMMON_BEGIN(emulation_assist_common)
>  	GEN_COMMON emulation_assist
>  	addi	r3,r1,STACK_FRAME_OVERHEAD
>  	bl	emulation_assist_interrupt
> -	REST_NVGPRS(r1) /* instruction emulation may change GPRs */
> +	HANDLER_RESTORE_NVGPRS() /* instruction emulation may change GPRs */
>  	b	interrupt_return_hsrr
> =20
> =20
> @@ -2384,6 +2410,7 @@ INT_DEFINE_BEGIN(altivec_unavailable)
>  #ifdef CONFIG_KVM_BOOK3S_PR_POSSIBLE
>  	IKVM_REAL=3D1
>  #endif
> +	IMSR_R12=3D1
>  INT_DEFINE_END(altivec_unavailable)
> =20
>  EXC_REAL_BEGIN(altivec_unavailable, 0xf20, 0x20)
> @@ -2433,6 +2460,7 @@ INT_DEFINE_BEGIN(vsx_unavailable)
>  #ifdef CONFIG_KVM_BOOK3S_PR_POSSIBLE
>  	IKVM_REAL=3D1
>  #endif
> +	IMSR_R12=3D1
>  INT_DEFINE_END(vsx_unavailable)
> =20
>  EXC_REAL_BEGIN(vsx_unavailable, 0xf40, 0x20)
> @@ -2494,7 +2522,7 @@ EXC_COMMON_BEGIN(facility_unavailable_common)
>  	GEN_COMMON facility_unavailable
>  	addi	r3,r1,STACK_FRAME_OVERHEAD
>  	bl	facility_unavailable_exception
> -	REST_NVGPRS(r1) /* instruction emulation may change GPRs */
> +	HANDLER_RESTORE_NVGPRS() /* instruction emulation may change GPRs */
>  	b	interrupt_return_srr
> =20
> =20
> @@ -2522,7 +2550,8 @@ EXC_COMMON_BEGIN(h_facility_unavailable_common)
>  	GEN_COMMON h_facility_unavailable
>  	addi	r3,r1,STACK_FRAME_OVERHEAD
>  	bl	facility_unavailable_exception
> -	REST_NVGPRS(r1) /* XXX Shouldn't be necessary in practice */
> +	/* XXX Shouldn't be necessary in practice */
> +	HANDLER_RESTORE_NVGPRS()
>  	b	interrupt_return_hsrr
> =20
> =20
> @@ -2748,7 +2777,7 @@ EXC_COMMON_BEGIN(altivec_assist_common)
>  	addi	r3,r1,STACK_FRAME_OVERHEAD
>  #ifdef CONFIG_ALTIVEC
>  	bl	altivec_assist_exception
> -	REST_NVGPRS(r1) /* instruction emulation may change GPRs */
> +	HANDLER_RESTORE_NVGPRS() /* instruction emulation may change GPRs */
>  #else
>  	bl	unknown_exception
>  #endif
> diff --git a/arch/powerpc/kernel/interrupt_64.S b/arch/powerpc/kernel/int=
errupt_64.S
> index a019ed6fc839..a262fe6964f3 100644
> --- a/arch/powerpc/kernel/interrupt_64.S
> +++ b/arch/powerpc/kernel/interrupt_64.S
> @@ -13,6 +13,20 @@
>  #include <asm/ppc_asm.h>
>  #include <asm/ptrace.h>
> =20
> +/*
> + * macros for handling user register sanitisation
> + */
> +#ifdef CONFIG_INTERRUPT_SANITIZE_REGISTERS
> +#define SANITIZE_ZEROIZE_SYSCALL_GPRS()	\
> +	ZEROIZE_GPR(0);			\
> +	ZEROIZE_GPRS(5, 12);		\
> +	ZEROIZE_NVGPRS()
> +#define SANITIZE_RESTORE_NVGPRS()	REST_NVGPRS(r1)
> +#else
> +#define SANITIZE_ZEROIZE_SYSCALL_GPRS()
> +#define SANITIZE_RESTORE_NVGPRS()
> +#endif /* CONFIG_INTERRUPT_SANITIZE_REGISTERS */
> +
>  	.align 7
> =20
>  .macro DEBUG_SRR_VALID srr
> @@ -96,6 +110,11 @@ END_FTR_SECTION_IFSET(CPU_FTR_HAS_PPR)
>  	 * but this is the best we can do.
>  	 */
> =20
> +	/*
> +	 * Zero user registers to prevent influencing speculative execution
> +	 * state of kernel code.
> +	 */
> +	SANITIZE_ZEROIZE_SYSCALL_GPRS()
>  	bl	system_call_exception
> =20
>  .Lsyscall_vectored_\name\()_exit:
> @@ -124,6 +143,7 @@ BEGIN_FTR_SECTION
>  	HMT_MEDIUM_LOW
>  END_FTR_SECTION_IFSET(CPU_FTR_HAS_PPR)
> =20
> +	SANITIZE_RESTORE_NVGPRS()
>  	cmpdi	r3,0
>  	bne	.Lsyscall_vectored_\name\()_restore_regs
> =20
> @@ -159,7 +179,9 @@ END_FTR_SECTION_IFSET(CPU_FTR_HAS_PPR)
>  	ld	r4,_LINK(r1)
>  	ld	r5,_XER(r1)
> =20
> +#ifndef CONFIG_INTERRUPT_SANITIZE_REGISTERS
>  	REST_NVGPRS(r1)
> +#endif
>  	REST_GPR(0, r1)
>  	mtcr	r2
>  	mtctr	r3
> @@ -275,6 +297,11 @@ END_BTB_FLUSH_SECTION
>  	wrteei	1
>  #endif
> =20
> +	/*
> +	 * Zero user registers to prevent influencing speculative execution
> +	 * state of kernel code.
> +	 */
> +	SANITIZE_ZEROIZE_SYSCALL_GPRS()
>  	bl	system_call_exception
> =20
>  .Lsyscall_exit:
> @@ -315,6 +342,7 @@ BEGIN_FTR_SECTION
>  	stdcx.	r0,0,r1			/* to clear the reservation */
>  END_FTR_SECTION_IFCLR(CPU_FTR_STCX_CHECKS_ADDRESS)
> =20
> +	SANITIZE_RESTORE_NVGPRS()
>  	cmpdi	r3,0
>  	bne	.Lsyscall_restore_regs
>  	/* Zero volatile regs that may contain sensitive kernel data */
> @@ -342,7 +370,9 @@ END_FTR_SECTION_IFSET(CPU_FTR_HAS_PPR)
>  .Lsyscall_restore_regs:
>  	ld	r3,_CTR(r1)
>  	ld	r4,_XER(r1)
> +#ifndef CONFIG_INTERRUPT_SANITIZE_REGISTERS
>  	REST_NVGPRS(r1)
> +#endif
>  	mtctr	r3
>  	mtspr	SPRN_XER,r4
>  	REST_GPR(0, r1)
> @@ -408,9 +438,11 @@ interrupt_return_\srr\()_user: /* make backtraces ma=
tch the _kernel variant */
>  _ASM_NOKPROBE_SYMBOL(interrupt_return_\srr\()_user)
>  	addi	r3,r1,STACK_FRAME_OVERHEAD
>  	bl	interrupt_exit_user_prepare
> +#ifndef CONFIG_INTERRUPT_SANITIZE_REGISTERS
>  	cmpdi	r3,0
>  	bne-	.Lrestore_nvgprs_\srr
>  .Lrestore_nvgprs_\srr\()_cont:
> +#endif
>  	std	r1,PACA_EXIT_SAVE_R1(r13) /* save r1 for restart */
>  #ifdef CONFIG_PPC_BOOK3S
>  .Linterrupt_return_\srr\()_user_rst_start:
> @@ -424,6 +456,7 @@ _ASM_NOKPROBE_SYMBOL(interrupt_return_\srr\()_user)
>  	stb	r11,PACAIRQHAPPENED(r13) # clear out possible HARD_DIS
> =20
>  .Lfast_user_interrupt_return_\srr\():
> +	SANITIZE_RESTORE_NVGPRS()
>  #ifdef CONFIG_PPC_BOOK3S
>  	.ifc \srr,srr
>  	lbz	r4,PACASRR_VALID(r13)
> @@ -493,9 +526,11 @@ ALT_FTR_SECTION_END_IFCLR(CPU_FTR_STCX_CHECKS_ADDRES=
S)
>  	b	.	/* prevent speculative execution */
>  .Linterrupt_return_\srr\()_user_rst_end:
> =20
> +#ifndef CONFIG_INTERRUPT_SANITIZE_REGISTERS
>  .Lrestore_nvgprs_\srr\():
>  	REST_NVGPRS(r1)
>  	b	.Lrestore_nvgprs_\srr\()_cont
> +#endif
> =20
>  #ifdef CONFIG_PPC_BOOK3S
>  interrupt_return_\srr\()_user_restart:
> @@ -585,6 +620,7 @@ _ASM_NOKPROBE_SYMBOL(interrupt_return_\srr\()_kernel)
>  	stb	r11,PACAIRQHAPPENED(r13) // clear the possible HARD_DIS
> =20
>  .Lfast_kernel_interrupt_return_\srr\():
> +	SANITIZE_RESTORE_NVGPRS()
>  	cmpdi	cr1,r3,0
>  #ifdef CONFIG_PPC_BOOK3S
>  	.ifc \srr,srr
> --=20
> 2.34.1

