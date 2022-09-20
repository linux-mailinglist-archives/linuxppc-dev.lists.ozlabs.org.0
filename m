Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EF2265BDA1A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Sep 2022 04:28:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MWlnq4Sn3z3c2s
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Sep 2022 12:27:59 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Vrg/J6wl;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1032; helo=mail-pj1-x1032.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Vrg/J6wl;
	dkim-atps=neutral
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MWln85njyz2yHc
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Sep 2022 12:27:23 +1000 (AEST)
Received: by mail-pj1-x1032.google.com with SMTP id a5-20020a17090aa50500b002008eeb040eso263192pjq.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Sep 2022 19:27:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date;
        bh=c+qBN2iCJLYSvoowI1k2CSgrVcdx10et6Ch1BuJm/Eg=;
        b=Vrg/J6wlrSAqZibHysGV7sj9K0JS+/7HKmylXTFe/uNJKs0+zFYI80bwYP9tG2mBGu
         J4FGwY4/1S8R2AxfSueFuSi6KOT1dtsyDKnR7tCoIFDAM5XdqsbItK5UMsVnSI5r3YeB
         FeDHce2aTn7Rcnwt0huVWmJAvdZN7KbF/j4ZsbAJGiKkdqhMYjEFM9mdES1o7H62oCJV
         aTbsQbmvUkCi8aTZgTbF5TAOhdVmPevmLGvP/3yUzRyrX5em5sjfvePFh0b6RpxM3TI+
         25nBXEl1btd8qaCUc1zruiOZLclBc8M24vsSRL3vTdOI0+IqzmVgqa/Rn2bYnVUMYIdN
         fXSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date;
        bh=c+qBN2iCJLYSvoowI1k2CSgrVcdx10et6Ch1BuJm/Eg=;
        b=ZmdHnbtAXMaJcY+6ZLekY0jR/rEOV+M3YNPF78NOEMR6xt7txGWF0Qgtg1tKdp6QMY
         yq1Y4LWQit0sON7vykLPMplxuZw6Nh3y4vhr+m3MwabVr1D5zeXFqcCxYRLAZqCFZz7m
         d2xkJgpBXA+V+aT4Wup3EGykNhytWicrv2pLOUUi8TUgXBNIsjgdHPl30MNMx1Vsskno
         qUCZB72nJzjR/4QfCMmmK+1eNZemfB3TnRyqPpsMJnxPFdVHTiX9kfxFEkY8f4k4sUeW
         ROpUm74AOH9cRbrQcYs+iKM5XTbWZskJZgd7A8rqMmuboSbpl1ewuMIaapYN5akGO04e
         kbBg==
X-Gm-Message-State: ACrzQf1IwRiNvnEO80vsYgoo46gTnNVPp7/CVPoF4UV0CtH1CRR9cGhy
	wkTVrKUWFoAgD7SGvqeyTw+syL9wZBk=
X-Google-Smtp-Source: AMsMyM6Y7L9bt0e8JgRryKinUT1ZZtTSMVTsEO3VlxFxfRjQ8OrN4q1DcIROHjQMb682KzyMOW72JA==
X-Received: by 2002:a17:902:e552:b0:16d:2a83:e751 with SMTP id n18-20020a170902e55200b0016d2a83e751mr2579528plf.39.1663640840890;
        Mon, 19 Sep 2022 19:27:20 -0700 (PDT)
Received: from localhost (118-208-203-28.tpgi.com.au. [118.208.203.28])
        by smtp.gmail.com with ESMTPSA id n6-20020a63e046000000b0042a93b625d4sm123842pgj.27.2022.09.19.19.27.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Sep 2022 19:27:20 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 20 Sep 2022 12:27:15 +1000
Message-Id: <CN0VGH6HLTMX.3KK2Z9RMT9N6B@bobo>
Subject: Re: [PATCH 22/23] powerpc/64s: Clear gprs on interrupt routine
 entry in Book3S
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Rohan McLure" <rmclure@linux.ibm.com>, <linuxppc-dev@lists.ozlabs.org>
X-Mailer: aerc 0.11.0
References: <20220916053300.786330-1-rmclure@linux.ibm.com>
 <20220916053300.786330-23-rmclure@linux.ibm.com>
In-Reply-To: <20220916053300.786330-23-rmclure@linux.ibm.com>
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

On Fri Sep 16, 2022 at 3:32 PM AEST, Rohan McLure wrote:
> Zero GPRS r0, r2-r11, r14-r31, on entry into the kernel for all
> other interrupt sources to limit influence of user-space values
> in potential speculation gadgets. The remaining gprs are overwritten by
> entry macros to interrupt handlers, irrespective of whether or not a
> given handler consumes these register values.
>
> Prior to this commit, r14-r31 are restored on a per-interrupt basis at
> exit, but now they are always restored. Remove explicit REST_NVGPRS
> invocations as non-volatiles must now always be restored. 32-bit systems
> do not clear user registers on interrupt, and continue to depend on the
> return value of interrupt_exit_user_prepare to determine whether or not
> to restore non-volatiles.
>
> The mmap_bench benchmark in selftests should rapidly invoke pagefaults.
> See ~0.8% performance regression with this mitigation, but this
> indicates the worst-case performance due to heavier-weight interrupt
> handlers. This mitigation is disabled by default, but enabled with
> CONFIG_INTERRUPT_SANITIZE_REGISTERS.
>
> Signed-off-by: Rohan McLure <rmclure@linux.ibm.com>
> ---
> V1 -> V2: Add benchmark data
> V2 -> V3: Use ZEROIZE_GPR{,S} macro renames, clarify
> interrupt_exit_user_prepare changes in summary.
> V4 -> V5: Configurable now with INTERRUPT_SANITIZE_REGISTERS. Zero r12
> (containing MSR) from common macro on per-interrupt basis with IOPTION.

Thanks, this is looking pretty good. I'll have a closer look at the asm
though.

Possibly here and in some of the previous patches as well there could be
some macros that hide some of the ifdefs.

e.g., SANITIZE_ZEROIZE_NVGPRS.

And HANDLER_RESTORE_NVGPRS() could do the restore if !SANITIZE, etc.

Also I just realised you're Americanising arch/powerpc. Lizzy would not
have been amused.

Thanks,
Nick

> ---
>  arch/powerpc/kernel/exceptions-64s.S | 37 ++++++++++++++++++++++++--
>  arch/powerpc/kernel/interrupt_64.S   | 10 +++++++
>  2 files changed, 45 insertions(+), 2 deletions(-)
>
> diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/e=
xceptions-64s.S
> index a3b51441b039..be5e72caada1 100644
> --- a/arch/powerpc/kernel/exceptions-64s.S
> +++ b/arch/powerpc/kernel/exceptions-64s.S
> @@ -111,6 +111,7 @@ name:
>  #define ISTACK		.L_ISTACK_\name\()	/* Set regular kernel stack */
>  #define __ISTACK(name)	.L_ISTACK_ ## name
>  #define IKUAP		.L_IKUAP_\name\()	/* Do KUAP lock */
> +#define IMSR_R12	.L_IMSR_R12_\name\()	/* Assumes MSR saved to r12 */
> =20
>  #define INT_DEFINE_BEGIN(n)						\
>  .macro int_define_ ## n name
> @@ -176,6 +177,9 @@ do_define_int n
>  	.ifndef IKUAP
>  		IKUAP=3D1
>  	.endif
> +	.ifndef IMSR_R12
> +		IMSR_R12=3D0
> +	.endif
>  .endm
> =20
>  /*
> @@ -502,6 +506,7 @@ DEFINE_FIXED_SYMBOL(\name\()_common_real, text)
>  	std	r10,0(r1)		/* make stack chain pointer	*/
>  	std	r0,GPR0(r1)		/* save r0 in stackframe	*/
>  	std	r10,GPR1(r1)		/* save r1 in stackframe	*/
> +	ZEROIZE_GPR(0)
> =20
>  	/* Mark our [H]SRRs valid for return */
>  	li	r10,1
> @@ -544,8 +549,16 @@ END_FTR_SECTION_IFSET(CPU_FTR_HAS_PPR)
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
> +#ifdef CONFIG_INTERRUPT_SANITIZE_REGISTERS
> +	ZEROIZE_NVGPRS()
> +#endif
> =20
>  	.if IDAR
>  	.if IISIDE
> @@ -577,8 +590,8 @@ BEGIN_FTR_SECTION
>  END_FTR_SECTION_IFSET(CPU_FTR_CFAR)
>  	ld	r10,IAREA+EX_CTR(r13)
>  	std	r10,_CTR(r1)
> -	std	r2,GPR2(r1)		/* save r2 in stackframe	*/
> -	SAVE_GPRS(3, 8, r1)		/* save r3 - r8 in stackframe   */
> +	SAVE_GPRS(2, 8, r1)		/* save r2 - r8 in stackframe   */
> +	ZEROIZE_GPRS(2, 8)
>  	mflr	r9			/* Get LR, later save to stack	*/
>  	ld	r2,PACATOC(r13)		/* get kernel TOC into r2	*/
>  	std	r9,_LINK(r1)
> @@ -696,6 +709,9 @@ END_FTR_SECTION_IFSET(CPU_FTR_CFAR)
>  	mtlr	r9
>  	ld	r9,_CCR(r1)
>  	mtcr	r9
> +#ifdef CONFIG_INTERRUPT_SANITIZE_REGISTERS
> +	REST_NVGPRS(r1)
> +#endif
>  	REST_GPRS(2, 13, r1)
>  	REST_GPR(0, r1)
>  	/* restore original r1. */
> @@ -1368,11 +1384,13 @@ ALT_MMU_FTR_SECTION_END_IFCLR(MMU_FTR_TYPE_RADIX)
>  	b	interrupt_return_srr
> =20
>  1:	bl	do_break
> +#ifndef CONFIG_INTERRUPT_SANITIZE_REGISTERS
>  	/*
>  	 * do_break() may have changed the NV GPRS while handling a breakpoint.
>  	 * If so, we need to restore them with their updated values.
>  	 */
>  	REST_NVGPRS(r1)
> +#endif
>  	b	interrupt_return_srr
> =20
> =20
> @@ -1598,7 +1616,9 @@ EXC_COMMON_BEGIN(alignment_common)
>  	GEN_COMMON alignment
>  	addi	r3,r1,STACK_FRAME_OVERHEAD
>  	bl	alignment_exception
> +#ifndef CONFIG_INTERRUPT_SANITIZE_REGISTERS
>  	REST_NVGPRS(r1) /* instruction emulation may change GPRs */
> +#endif
>  	b	interrupt_return_srr
> =20
> =20
> @@ -1708,7 +1728,9 @@ EXC_COMMON_BEGIN(program_check_common)
>  .Ldo_program_check:
>  	addi	r3,r1,STACK_FRAME_OVERHEAD
>  	bl	program_check_exception
> +#ifndef CONFIG_INTERRUPT_SANITIZE_REGISTERS
>  	REST_NVGPRS(r1) /* instruction emulation may change GPRs */
> +#endif
>  	b	interrupt_return_srr
> =20
> =20
> @@ -1726,6 +1748,7 @@ INT_DEFINE_BEGIN(fp_unavailable)
>  #ifdef CONFIG_KVM_BOOK3S_PR_POSSIBLE
>  	IKVM_REAL=3D1
>  #endif
> +	IMSR_R12=3D1
>  INT_DEFINE_END(fp_unavailable)
> =20
>  EXC_REAL_BEGIN(fp_unavailable, 0x800, 0x100)
> @@ -2139,7 +2162,9 @@ EXC_COMMON_BEGIN(emulation_assist_common)
>  	GEN_COMMON emulation_assist
>  	addi	r3,r1,STACK_FRAME_OVERHEAD
>  	bl	emulation_assist_interrupt
> +#ifndef CONFIG_INTERRUPT_SANITIZE_REGISTERS
>  	REST_NVGPRS(r1) /* instruction emulation may change GPRs */
> +#endif
>  	b	interrupt_return_hsrr
> =20
> =20
> @@ -2347,6 +2372,7 @@ INT_DEFINE_BEGIN(altivec_unavailable)
>  #ifdef CONFIG_KVM_BOOK3S_PR_POSSIBLE
>  	IKVM_REAL=3D1
>  #endif
> +	IMSR_R12=3D1
>  INT_DEFINE_END(altivec_unavailable)
> =20
>  EXC_REAL_BEGIN(altivec_unavailable, 0xf20, 0x20)
> @@ -2396,6 +2422,7 @@ INT_DEFINE_BEGIN(vsx_unavailable)
>  #ifdef CONFIG_KVM_BOOK3S_PR_POSSIBLE
>  	IKVM_REAL=3D1
>  #endif
> +	IMSR_R12=3D1
>  INT_DEFINE_END(vsx_unavailable)
> =20
>  EXC_REAL_BEGIN(vsx_unavailable, 0xf40, 0x20)
> @@ -2457,7 +2484,9 @@ EXC_COMMON_BEGIN(facility_unavailable_common)
>  	GEN_COMMON facility_unavailable
>  	addi	r3,r1,STACK_FRAME_OVERHEAD
>  	bl	facility_unavailable_exception
> +#ifndef CONFIG_INTERRUPT_SANITIZE_REGISTERS
>  	REST_NVGPRS(r1) /* instruction emulation may change GPRs */
> +#endif
>  	b	interrupt_return_srr
> =20
> =20
> @@ -2485,7 +2514,9 @@ EXC_COMMON_BEGIN(h_facility_unavailable_common)
>  	GEN_COMMON h_facility_unavailable
>  	addi	r3,r1,STACK_FRAME_OVERHEAD
>  	bl	facility_unavailable_exception
> +#ifndef CONFIG_INTERRUPT_SANITIZE_REGISTERS
>  	REST_NVGPRS(r1) /* XXX Shouldn't be necessary in practice */
> +#endif
>  	b	interrupt_return_hsrr
> =20
> =20
> @@ -2711,7 +2742,9 @@ EXC_COMMON_BEGIN(altivec_assist_common)
>  	addi	r3,r1,STACK_FRAME_OVERHEAD
>  #ifdef CONFIG_ALTIVEC
>  	bl	altivec_assist_exception
> +#ifndef CONFIG_INTERRUPT_SANITIZE_REGISTERS
>  	REST_NVGPRS(r1) /* instruction emulation may change GPRs */
> +#endif
>  #else
>  	bl	unknown_exception
>  #endif
> diff --git a/arch/powerpc/kernel/interrupt_64.S b/arch/powerpc/kernel/int=
errupt_64.S
> index 40147558e1a6..edad0c17e47a 100644
> --- a/arch/powerpc/kernel/interrupt_64.S
> +++ b/arch/powerpc/kernel/interrupt_64.S
> @@ -433,9 +433,11 @@ interrupt_return_\srr\()_user: /* make backtraces ma=
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
> @@ -449,6 +451,9 @@ _ASM_NOKPROBE_SYMBOL(interrupt_return_\srr\()_user)
>  	stb	r11,PACAIRQHAPPENED(r13) # clear out possible HARD_DIS
> =20
>  .Lfast_user_interrupt_return_\srr\():
> +#ifdef CONFIG_INTERRUPT_SANITIZE_REGISTERS
> +	REST_NVGPRS(r1)
> +#endif
>  #ifdef CONFIG_PPC_BOOK3S
>  	.ifc \srr,srr
>  	lbz	r4,PACASRR_VALID(r13)
> @@ -518,9 +523,11 @@ ALT_FTR_SECTION_END_IFCLR(CPU_FTR_STCX_CHECKS_ADDRES=
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
> @@ -562,6 +569,9 @@ _ASM_NOKPROBE_SYMBOL(interrupt_return_\srr\()_kernel)
>  1:
> =20
>  .Lfast_kernel_interrupt_return_\srr\():
> +#ifdef CONFIG_INTERRUPT_SANITIZE_REGISTERS
> +	REST_NVGPRS(r1)
> +#endif
>  	cmpdi	cr1,r3,0
>  #ifdef CONFIG_PPC_BOOK3S
>  	.ifc \srr,srr
> --=20
> 2.34.1

