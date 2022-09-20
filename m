Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A90B75BD8E9
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Sep 2022 02:52:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MWjg93kh0z3blx
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Sep 2022 10:52:05 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=HgCjSc/b;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::629; helo=mail-pl1-x629.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=HgCjSc/b;
	dkim-atps=neutral
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MWjfV58mfz2ysx
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Sep 2022 10:51:28 +1000 (AEST)
Received: by mail-pl1-x629.google.com with SMTP id w13so854883plp.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Sep 2022 17:51:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:references:from:subject:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date;
        bh=3pXbXSsQpah/dDfQB7qyLXB/X+ZylP++MO7t2nK3lQQ=;
        b=HgCjSc/bMYrk9jfGdBj67FbxvoovYR3gr14NmVjINNekEBbPkurjgK2/UdYKfaWBiF
         6HksY5nkRuKTIUI/w14zHC5LKD512Z9ufhHqXMYXEVz6RZg3R5zKykEpggeIICML58oe
         jeSaPXhaXFIUXbPhOV/ntRaQx5d6MGUsE1+W50QPPwVHVMC/6eoaefr2kTIyC94s7Q+a
         K5uKReomzmy+WSPCktoVl41AFMZvlrft25WbZWgRhvGCHHsQS2GShiua4X6N7H13poYf
         2KCVmDc4GTKFSOj2qM+1pp9cpWJ1u9hS7fZhAllQZ7tzPQl6kgWMmqdQaTIC8LC8M0ZI
         eUdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:references:from:subject:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date;
        bh=3pXbXSsQpah/dDfQB7qyLXB/X+ZylP++MO7t2nK3lQQ=;
        b=yWkXpcOeU8UAq+490Ewx55XALSt6lKfLCSKshsnxn2NSHS4+AsONi7t3QV04bCCk24
         7/2j+1Vf05R1t9ZRxUPjFtniEEV4H5VysCq+8xdXpoRBuYuCGQ8HPQCyKoi/lyCZQzQV
         xYSDx9lHRc/ZdbeHTb74MgitB/ffRpZFe+qM0yEikZWtD6o09wnTjVjT7og73MbajCik
         NNAC+c85syoprIiSxKjdZPGVUvJWL71S4Krx1oEmC6YZPo3mKxLp+NUSt09MxzM6y0+N
         mxS72jK2e05DCVEu8wLur85Fj/OT5x0OePOaa9RwHOhihBlRqTi7OuhPLRUsIRvFJXTC
         wQWg==
X-Gm-Message-State: ACrzQf1wC2iEarMwLLVTfMDm32otkIx34aTEiBh+ITBB8b1JbU2LLcog
	L5rm4G6CvtOkd6ayoWj227o=
X-Google-Smtp-Source: AMsMyM5QYzCvuFnepcvKvFakV5C5vvfiOyBW+IVzEQwI3ZgCYBpsRVATlRZtfeviLOXLAIshWL5Mvw==
X-Received: by 2002:a17:90a:d485:b0:202:e6eb:4b7f with SMTP id s5-20020a17090ad48500b00202e6eb4b7fmr949742pju.217.1663635084201;
        Mon, 19 Sep 2022 17:51:24 -0700 (PDT)
Received: from localhost (118-208-203-28.tpgi.com.au. [118.208.203.28])
        by smtp.gmail.com with ESMTPSA id b2-20020a170902d50200b0017315b11bb8sm21552853plg.213.2022.09.19.17.51.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Sep 2022 17:51:23 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 20 Sep 2022 10:51:18 +1000
Message-Id: <CN0TF0H6I6FA.AJU2XR69ZV8O@bobo>
To: "Rohan McLure" <rmclure@linux.ibm.com>, <linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH 05/23] powerpc/32: Clarify interrupt restores with
 REST_GPR macro in entry_32.S
From: "Nicholas Piggin" <npiggin@gmail.com>
X-Mailer: aerc 0.11.0
References: <20220916053300.786330-1-rmclure@linux.ibm.com>
 <20220916053300.786330-6-rmclure@linux.ibm.com>
In-Reply-To: <20220916053300.786330-6-rmclure@linux.ibm.com>
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
> Restoring the register state of the interrupted thread involves issuing
> a large number of predictable loads to the kernel stack frame. Issue the
> REST_GPR{,S} macros to clearly signal when this is happening, and bunch
> together restores at the end of the interrupt handler where the saved
> value is not consumed earlier in the handler code.
>
> Signed-off-by: Rohan McLure <rmclure@linux.ibm.com>
> Reported-by: Christophe Leroy <christophe.leroy@csgroup.eu>

Reviewed-by: Nicholas Piggin <npiggin@gmail.com>

> ---
> V2 -> V3: New patch.
> V3 -> V4: Minimise restores in the unrecoverable window between
> restoring SRR0/1 and return from interrupt.
> ---
>  arch/powerpc/kernel/entry_32.S | 33 +++++++++++++-------------------
>  1 file changed, 13 insertions(+), 20 deletions(-)
>
> diff --git a/arch/powerpc/kernel/entry_32.S b/arch/powerpc/kernel/entry_3=
2.S
> index 44dfce9a60c5..e4b694cebc44 100644
> --- a/arch/powerpc/kernel/entry_32.S
> +++ b/arch/powerpc/kernel/entry_32.S
> @@ -68,7 +68,7 @@ prepare_transfer_to_handler:
>  	lwz	r9,_MSR(r11)		/* if sleeping, clear MSR.EE */
>  	rlwinm	r9,r9,0,~MSR_EE
>  	lwz	r12,_LINK(r11)		/* and return to address in LR */
> -	lwz	r2, GPR2(r11)
> +	REST_GPR(2, r11)
>  	b	fast_exception_return
>  _ASM_NOKPROBE_SYMBOL(prepare_transfer_to_handler)
>  #endif /* CONFIG_PPC_BOOK3S_32 || CONFIG_E500 */
> @@ -144,7 +144,7 @@ ret_from_syscall:
>  	lwz	r7,_NIP(r1)
>  	lwz	r8,_MSR(r1)
>  	cmpwi	r3,0
> -	lwz	r3,GPR3(r1)
> +	REST_GPR(3, r1)
>  syscall_exit_finish:
>  	mtspr	SPRN_SRR0,r7
>  	mtspr	SPRN_SRR1,r8
> @@ -152,8 +152,8 @@ syscall_exit_finish:
>  	bne	3f
>  	mtcr	r5
> =20
> -1:	lwz	r2,GPR2(r1)
> -	lwz	r1,GPR1(r1)
> +1:	REST_GPR(2, r1)
> +	REST_GPR(1, r1)
>  	rfi
>  #ifdef CONFIG_40x
>  	b .	/* Prevent prefetch past rfi */
> @@ -165,10 +165,8 @@ syscall_exit_finish:
>  	REST_NVGPRS(r1)
>  	mtctr	r4
>  	mtxer	r5
> -	lwz	r0,GPR0(r1)
> -	lwz	r3,GPR3(r1)
> -	REST_GPRS(4, 11, r1)
> -	lwz	r12,GPR12(r1)
> +	REST_GPR(0, r1)
> +	REST_GPRS(3, 12, r1)
>  	b	1b
> =20
>  #ifdef CONFIG_44x
> @@ -260,9 +258,8 @@ fast_exception_return:
>  	beq	3f			/* if not, we've got problems */
>  #endif
> =20
> -2:	REST_GPRS(3, 6, r11)
> -	lwz	r10,_CCR(r11)
> -	REST_GPRS(1, 2, r11)
> +2:	lwz	r10,_CCR(r11)
> +	REST_GPRS(1, 6, r11)
>  	mtcr	r10
>  	lwz	r10,_LINK(r11)
>  	mtlr	r10
> @@ -277,7 +274,7 @@ fast_exception_return:
>  	mtspr	SPRN_SRR0,r12
>  	REST_GPR(9, r11)
>  	REST_GPR(12, r11)
> -	lwz	r11,GPR11(r11)
> +	REST_GPR(11, r11)
>  	rfi
>  #ifdef CONFIG_40x
>  	b .	/* Prevent prefetch past rfi */
> @@ -454,9 +451,8 @@ _ASM_NOKPROBE_SYMBOL(interrupt_return)
>  	lwz	r3,_MSR(r1);						\
>  	andi.	r3,r3,MSR_PR;						\
>  	bne	interrupt_return;					\
> -	lwz	r0,GPR0(r1);						\
> -	lwz	r2,GPR2(r1);						\
> -	REST_GPRS(3, 8, r1);						\
> +	REST_GPR(0, r1);						\
> +	REST_GPRS(2, 8, r1);						\
>  	lwz	r10,_XER(r1);						\
>  	lwz	r11,_CTR(r1);						\
>  	mtspr	SPRN_XER,r10;						\
> @@ -475,11 +471,8 @@ _ASM_NOKPROBE_SYMBOL(interrupt_return)
>  	lwz	r12,_MSR(r1);						\
>  	mtspr	exc_lvl_srr0,r11;					\
>  	mtspr	exc_lvl_srr1,r12;					\
> -	lwz	r9,GPR9(r1);						\
> -	lwz	r12,GPR12(r1);						\
> -	lwz	r10,GPR10(r1);						\
> -	lwz	r11,GPR11(r1);						\
> -	lwz	r1,GPR1(r1);						\
> +	REST_GPRS(9, 12, r1);						\
> +	REST_GPR(1, r1);						\
>  	exc_lvl_rfi;							\
>  	b	.;		/* prevent prefetch past exc_lvl_rfi */
> =20
> --=20
> 2.34.1

