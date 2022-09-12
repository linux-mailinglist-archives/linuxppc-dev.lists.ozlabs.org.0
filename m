Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5343E5B5A0A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Sep 2022 14:16:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MR5DH0nyqz3c6C
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Sep 2022 22:16:15 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=dLpNousb;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1034; helo=mail-pj1-x1034.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=dLpNousb;
	dkim-atps=neutral
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MR5Cf6Rqxz3016
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Sep 2022 22:15:41 +1000 (AEST)
Received: by mail-pj1-x1034.google.com with SMTP id q9-20020a17090a178900b0020265d92ae3so12118203pja.5
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Sep 2022 05:15:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:references:from:subject:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date;
        bh=D5LJtP/NV+6gIxAJ7Fa85AxDLNBDtNKXu3vmWiP8I5I=;
        b=dLpNousb1y2pR0XLoT/vAtY2g9qQu9CX0lDp7On/aao9wlUFusuwLiZESN8J+ZbrmF
         ImjJBOfxLz2Y62ahSvGTQmvuIeqIgMUcDNn1dtYut8HGIK4F0EJuZyFT6Yg0Apguiu2B
         LIYoJ93zryQcff7cnRZ1ZPPNh3Y2Nc6gljcYXxnyD1dWuwL+wwxZNonGfYSWjBe61aM3
         RRlCrrul6ojcEC8ZIbK15qfb/WrNj+bT20SwxLfQqwyT3xcGeVgal0gC9UypVvG5W1q7
         hjjY/3QX31JNduamjdXa8qrTedOkuFnKplw2OJfXjg+n432PU3PKhEZadM+86ajrr32Y
         s5sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:references:from:subject:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date;
        bh=D5LJtP/NV+6gIxAJ7Fa85AxDLNBDtNKXu3vmWiP8I5I=;
        b=RLSabeSBeeyjWf5/3Mbbf2JG/cbvkbhTIoNDeqFB2SjpxWMG1f/cPhwd5EukDxmPlb
         E/aDv04aEpbQcqXGGdL6C7xBOfHGT9r5lRKbk1QPBI1YPN97yXP7yL7Z9Dc+hhZ8X0Qh
         ZmNh1bgOc7wppYHed5bV6PfCoznYmGn3bk/uBHj/bK/qom2fqxG2qVpdpwSgCAae0ZuZ
         1DtBsQKuCCfXwJryvVCm4kpdmh1K2WjkIkgPErNxkrKHEsBryxvnj3HK++bpY7SmK3SN
         9+iT+/H2fi/SnIbd66oteOR6By3P3JZr/2mV+kX32NubhVMqqRfKxtMkvAXhSrQUxZ5m
         jQMQ==
X-Gm-Message-State: ACgBeo11DbUC2IsAV5J8wGaXlMpeUFPZccvrNA4YGjTjZUeJ1sgHbDXN
	Yiqza31YrqCp7qfYa+9PDs4=
X-Google-Smtp-Source: AA6agR4hUTUrvviyBMrwxuV3KLU20lUnUZs8sSTwtvwC+s3NZ9Nx5c7W4rN+MCKLnnQpkKEhjtJriA==
X-Received: by 2002:a17:90b:4d81:b0:202:d535:d324 with SMTP id oj1-20020a17090b4d8100b00202d535d324mr4202831pjb.133.1662984937563;
        Mon, 12 Sep 2022 05:15:37 -0700 (PDT)
Received: from localhost ([118.210.107.131])
        by smtp.gmail.com with ESMTPSA id a2-20020a1709027d8200b00172ea8ff334sm5857954plm.7.2022.09.12.05.15.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Sep 2022 05:15:36 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 12 Sep 2022 22:15:33 +1000
Message-Id: <CMUEYJLOTRVG.2T3T0T50LQZTS@bobo>
To: "Rohan McLure" <rmclure@linux.ibm.com>, <linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH v4 19/20] powerpc/64s: Clear gprs on interrupt routine
 entry in Book3S
From: "Nicholas Piggin" <npiggin@gmail.com>
X-Mailer: aerc 0.11.0
References: <20220824020548.62625-1-rmclure@linux.ibm.com>
 <20220824020548.62625-20-rmclure@linux.ibm.com>
In-Reply-To: <20220824020548.62625-20-rmclure@linux.ibm.com>
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

On Wed Aug 24, 2022 at 12:05 PM AEST, Rohan McLure wrote:
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
> handlers.

Ow, my heart :(

Are we not keeping a CONFIG option to rid ourselves of this vile
performance robbing thing? Are we getting rid of the whole
_TIF_RESTOREALL thing too, or does PPC32 want to keep it?

>
> Signed-off-by: Rohan McLure <rmclure@linux.ibm.com>
> ---
> V1 -> V2: Add benchmark data
> V2 -> V3: Use ZEROIZE_GPR{,S} macro renames, clarify
> interrupt_exit_user_prepare changes in summary.
> ---
>  arch/powerpc/kernel/exceptions-64s.S | 21 ++++++++-------------
>  arch/powerpc/kernel/interrupt_64.S   |  9 ++-------
>  2 files changed, 10 insertions(+), 20 deletions(-)
>
> diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/e=
xceptions-64s.S
> index a3b51441b039..038e42fb2182 100644
> --- a/arch/powerpc/kernel/exceptions-64s.S
> +++ b/arch/powerpc/kernel/exceptions-64s.S
> @@ -502,6 +502,7 @@ DEFINE_FIXED_SYMBOL(\name\()_common_real, text)
>  	std	r10,0(r1)		/* make stack chain pointer	*/
>  	std	r0,GPR0(r1)		/* save r0 in stackframe	*/
>  	std	r10,GPR1(r1)		/* save r1 in stackframe	*/
> +	ZEROIZE_GPR(0)
> =20
>  	/* Mark our [H]SRRs valid for return */
>  	li	r10,1
> @@ -538,14 +539,18 @@ END_FTR_SECTION_IFSET(CPU_FTR_HAS_PPR)
>  	ld	r10,IAREA+EX_R10(r13)
>  	std	r9,GPR9(r1)
>  	std	r10,GPR10(r1)
> +	ZEROIZE_GPRS(9, 10)

You use 9/10 right afterwards, this'd have to move down to where
you zero r11 at least.

>  	ld	r9,IAREA+EX_R11(r13)	/* move r11 - r13 to stackframe	*/
>  	ld	r10,IAREA+EX_R12(r13)
>  	ld	r11,IAREA+EX_R13(r13)
>  	std	r9,GPR11(r1)
>  	std	r10,GPR12(r1)
>  	std	r11,GPR13(r1)
> +	/* keep r12 ([H]SRR1/MSR), r13 (PACA) for interrupt routine */
> +	ZEROIZE_GPR(11)

Kernel always has to keep r13 so no need to comment that. Keeping r11,
is that for those annoying fp_unavailable etc handlers?

There's probably not much a user can do with this, given they're set
from the MSR. Use can influence some bits of its MSR though. So long
as we're being paranoid, you could add an IOPTION to retain r11 only for
the handlers that need it, or have them load it from MSR and zero it
here.

Thanks,
Nick

> =20
>  	SAVE_NVGPRS(r1)
> +	ZEROIZE_NVGPRS()
> =20
>  	.if IDAR
>  	.if IISIDE
> @@ -577,8 +582,8 @@ BEGIN_FTR_SECTION
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
> @@ -696,6 +701,7 @@ END_FTR_SECTION_IFSET(CPU_FTR_CFAR)
>  	mtlr	r9
>  	ld	r9,_CCR(r1)
>  	mtcr	r9
> +	REST_NVGPRS(r1)
>  	REST_GPRS(2, 13, r1)
>  	REST_GPR(0, r1)
>  	/* restore original r1. */
> @@ -1368,11 +1374,6 @@ ALT_MMU_FTR_SECTION_END_IFCLR(MMU_FTR_TYPE_RADIX)
>  	b	interrupt_return_srr
> =20
>  1:	bl	do_break
> -	/*
> -	 * do_break() may have changed the NV GPRS while handling a breakpoint.
> -	 * If so, we need to restore them with their updated values.
> -	 */
> -	REST_NVGPRS(r1)
>  	b	interrupt_return_srr
> =20
> =20
> @@ -1598,7 +1599,6 @@ EXC_COMMON_BEGIN(alignment_common)
>  	GEN_COMMON alignment
>  	addi	r3,r1,STACK_FRAME_OVERHEAD
>  	bl	alignment_exception
> -	REST_NVGPRS(r1) /* instruction emulation may change GPRs */
>  	b	interrupt_return_srr
> =20
> =20
> @@ -1708,7 +1708,6 @@ EXC_COMMON_BEGIN(program_check_common)
>  .Ldo_program_check:
>  	addi	r3,r1,STACK_FRAME_OVERHEAD
>  	bl	program_check_exception
> -	REST_NVGPRS(r1) /* instruction emulation may change GPRs */
>  	b	interrupt_return_srr
> =20
> =20
> @@ -2139,7 +2138,6 @@ EXC_COMMON_BEGIN(emulation_assist_common)
>  	GEN_COMMON emulation_assist
>  	addi	r3,r1,STACK_FRAME_OVERHEAD
>  	bl	emulation_assist_interrupt
> -	REST_NVGPRS(r1) /* instruction emulation may change GPRs */
>  	b	interrupt_return_hsrr
> =20
> =20
> @@ -2457,7 +2455,6 @@ EXC_COMMON_BEGIN(facility_unavailable_common)
>  	GEN_COMMON facility_unavailable
>  	addi	r3,r1,STACK_FRAME_OVERHEAD
>  	bl	facility_unavailable_exception
> -	REST_NVGPRS(r1) /* instruction emulation may change GPRs */
>  	b	interrupt_return_srr
> =20
> =20
> @@ -2485,7 +2482,6 @@ EXC_COMMON_BEGIN(h_facility_unavailable_common)
>  	GEN_COMMON h_facility_unavailable
>  	addi	r3,r1,STACK_FRAME_OVERHEAD
>  	bl	facility_unavailable_exception
> -	REST_NVGPRS(r1) /* XXX Shouldn't be necessary in practice */
>  	b	interrupt_return_hsrr
> =20
> =20
> @@ -2711,7 +2707,6 @@ EXC_COMMON_BEGIN(altivec_assist_common)
>  	addi	r3,r1,STACK_FRAME_OVERHEAD
>  #ifdef CONFIG_ALTIVEC
>  	bl	altivec_assist_exception
> -	REST_NVGPRS(r1) /* instruction emulation may change GPRs */
>  #else
>  	bl	unknown_exception
>  #endif
> diff --git a/arch/powerpc/kernel/interrupt_64.S b/arch/powerpc/kernel/int=
errupt_64.S
> index ad302ad93433..f9ee93e3a0d3 100644
> --- a/arch/powerpc/kernel/interrupt_64.S
> +++ b/arch/powerpc/kernel/interrupt_64.S
> @@ -432,9 +432,6 @@ interrupt_return_\srr\()_user: /* make backtraces mat=
ch the _kernel variant */
>  _ASM_NOKPROBE_SYMBOL(interrupt_return_\srr\()_user)
>  	addi	r3,r1,STACK_FRAME_OVERHEAD
>  	bl	interrupt_exit_user_prepare
> -	cmpdi	r3,0
> -	bne-	.Lrestore_nvgprs_\srr
> -.Lrestore_nvgprs_\srr\()_cont:
>  	std	r1,PACA_EXIT_SAVE_R1(r13) /* save r1 for restart */
>  #ifdef CONFIG_PPC_BOOK3S
>  .Linterrupt_return_\srr\()_user_rst_start:
> @@ -448,6 +445,7 @@ _ASM_NOKPROBE_SYMBOL(interrupt_return_\srr\()_user)
>  	stb	r11,PACAIRQHAPPENED(r13) # clear out possible HARD_DIS
> =20
>  .Lfast_user_interrupt_return_\srr\():
> +	REST_NVGPRS(r1)
>  #ifdef CONFIG_PPC_BOOK3S
>  	.ifc \srr,srr
>  	lbz	r4,PACASRR_VALID(r13)
> @@ -517,10 +515,6 @@ ALT_FTR_SECTION_END_IFCLR(CPU_FTR_STCX_CHECKS_ADDRES=
S)
>  	b	.	/* prevent speculative execution */
>  .Linterrupt_return_\srr\()_user_rst_end:
> =20
> -.Lrestore_nvgprs_\srr\():
> -	REST_NVGPRS(r1)
> -	b	.Lrestore_nvgprs_\srr\()_cont
> -
>  #ifdef CONFIG_PPC_BOOK3S
>  interrupt_return_\srr\()_user_restart:
>  _ASM_NOKPROBE_SYMBOL(interrupt_return_\srr\()_user_restart)
> @@ -561,6 +555,7 @@ _ASM_NOKPROBE_SYMBOL(interrupt_return_\srr\()_kernel)
>  1:
> =20
>  .Lfast_kernel_interrupt_return_\srr\():
> +	REST_NVGPRS(r1)
>  	cmpdi	cr1,r3,0
>  #ifdef CONFIG_PPC_BOOK3S
>  	.ifc \srr,srr
> --=20
> 2.34.1

