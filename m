Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C71FB5B5996
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Sep 2022 13:47:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MR4bV6G7wz3bqC
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Sep 2022 21:47:50 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=q0csQoe5;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52e; helo=mail-pg1-x52e.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=q0csQoe5;
	dkim-atps=neutral
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com [IPv6:2607:f8b0:4864:20::52e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MR4Zt43lZz2xHZ
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Sep 2022 21:47:16 +1000 (AEST)
Received: by mail-pg1-x52e.google.com with SMTP id 8so2666029pga.8
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Sep 2022 04:47:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date;
        bh=V0rhuip69WoeRcARR8E9Y8IkRo45dW0pzLGcCu6+O+Y=;
        b=q0csQoe5+/dhVNIf1+Xu+7x+hlQuevg0t85IDkY240n4R4VxB4/IitnLvrQDe4cWrd
         b95jShx5EXSYVSjGsBVwBYcWbOrhFH3uSSGUN0z94Zr9y8HIS/xlOsZ/tM7XV48aRlH1
         rWWw/ANejdZs5FuAI7cvuvRCECN1Jxl4RNINSKyJIk2VMXcwuiD/YI6mmIgpv9uXu8ih
         zIcJwxRiz233LPTOrY3pZ5P2cEhlX19Y5AXyyxCUtBF4epdWS4sxLkhxGapjbqyRB8pm
         cL5a1XH1HTThTIFi+QTVZE81y8JGa4aS+x3yMx0biUs1F8nKHW6twOZ7OO1Toe60Uuv6
         mVqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date;
        bh=V0rhuip69WoeRcARR8E9Y8IkRo45dW0pzLGcCu6+O+Y=;
        b=MWu9lAr0mkMPmOlrRDL0CL6X08wiD79nSXq6E/ACOSC7B30UutRV/JlCugone/53NJ
         URxvYaTXi5We5eO/w97ZGTSG/ygu0QuIqIPI3GMPkuLeppGsUqvbFyrizVwtwfXP1sln
         d+5DDDKwZ/81Re9VaY1cNjho+hRRw1BJboKSYs1/2HyIm6twOpYsgzdOKT8t1ssmEsTV
         ZiuV3Q6tx4rvh6uKe/Wqi3lMs7I1d/taC6q4RKxKXsirdvT96KaFI9f9u4xD+3uFIvmV
         3PMS9ETDqukYM9ha/1oxMTaVWmU0iGScF4GHR3IdMVdv2eGQL/EIvr0IKtAlht+sMc9b
         hofg==
X-Gm-Message-State: ACgBeo0zU6y2IoiVe88EzZun/QlnDA2DnrykMswQXusrEf3joYGp3tr0
	6WKtF7d2vXrg4ea3sjKPFnQ=
X-Google-Smtp-Source: AA6agR7hTY208+UU/oADN+4RkZCUjUGtxR6CV4k92znBTMH5lAypcrrf76SJU6Y0dWZb9VuZ21MeWQ==
X-Received: by 2002:a63:5a41:0:b0:430:673e:1e13 with SMTP id k1-20020a635a41000000b00430673e1e13mr23679215pgm.435.1662983233614;
        Mon, 12 Sep 2022 04:47:13 -0700 (PDT)
Received: from localhost ([118.210.107.131])
        by smtp.gmail.com with ESMTPSA id g6-20020a17090a4b0600b001eee8998f2esm4973639pjh.17.2022.09.12.04.47.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Sep 2022 04:47:13 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 12 Sep 2022 21:47:09 +1000
Message-Id: <CMUECSS06492.2ETTR6DE3QG8P@bobo>
Subject: Re: [PATCH v4 14/20] powerpc/64s: Clear/restore caller gprs in
 syscall interrupt/return
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Rohan McLure" <rmclure@linux.ibm.com>, <linuxppc-dev@lists.ozlabs.org>
X-Mailer: aerc 0.11.0
References: <20220824020548.62625-1-rmclure@linux.ibm.com>
 <20220824020548.62625-15-rmclure@linux.ibm.com>
In-Reply-To: <20220824020548.62625-15-rmclure@linux.ibm.com>
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
> Clear user state in gprs (assign to zero) to reduce the influence of user
> registers on speculation within kernel syscall handlers. Clears occur
> at the very beginning of the sc and scv 0 interrupt handlers, with
> restores occurring following the execution of the syscall handler.
>
> Signed-off-by: Rohan McLure <rmclure@linux.ibm.com>
> ---
> V1 -> V2: Update summary
> V2 -> V3: Remove erroneous summary paragraph on syscall_exit_prepare
> V3 -> V4: Use ZEROIZE instead of NULLIFY
> ---
>  arch/powerpc/kernel/interrupt_64.S | 22 ++++++++++++++++++----
>  1 file changed, 18 insertions(+), 4 deletions(-)
>
> diff --git a/arch/powerpc/kernel/interrupt_64.S b/arch/powerpc/kernel/int=
errupt_64.S
> index 0178aeba3820..a8065209dd8c 100644
> --- a/arch/powerpc/kernel/interrupt_64.S
> +++ b/arch/powerpc/kernel/interrupt_64.S
> @@ -70,7 +70,7 @@ _ASM_NOKPROBE_SYMBOL(system_call_vectored_\name)
>  	ld	r2,PACATOC(r13)
>  	mfcr	r12
>  	li	r11,0
> -	/* Can we avoid saving r3-r8 in common case? */
> +	/* Save syscall parameters in r3-r8 */
>  	std	r3,GPR3(r1)
>  	std	r4,GPR4(r1)
>  	std	r5,GPR5(r1)
> @@ -109,6 +109,13 @@ END_FTR_SECTION_IFSET(CPU_FTR_HAS_PPR)
>  	 * but this is the best we can do.
>  	 */
> =20
> +	/*
> +	 * Zero user registers to prevent influencing speculative execution
> +	 * state of kernel code.
> +	 */
> +	ZEROIZE_GPRS(5, 12)
> +	ZEROIZE_NVGPRS()
> +
>  	/* Calling convention has r3 =3D orig r0, r4 =3D regs */
>  	mr	r3,r0

Ther's not much reason for this to go right against
system_call_exception. You could set it up above where you set r4,
and zero r0 as well with the rest of the volatiles? I guess it'll
be overwritten by mflr r0 right away... although that could be an
implementation detail not everything requires it and mcount call
gets noped out. So probably doesn't hurt to zero it, while we're
being paranoid.

Thanks,
Nick

>  	bl	system_call_exception
> @@ -139,6 +146,7 @@ BEGIN_FTR_SECTION
>  	HMT_MEDIUM_LOW
>  END_FTR_SECTION_IFSET(CPU_FTR_HAS_PPR)
> =20
> +	REST_NVGPRS(r1)
>  	cmpdi	r3,0
>  	bne	.Lsyscall_vectored_\name\()_restore_regs
> =20
> @@ -181,7 +189,6 @@ END_FTR_SECTION_IFSET(CPU_FTR_HAS_PPR)
>  	ld	r4,_LINK(r1)
>  	ld	r5,_XER(r1)
> =20
> -	REST_NVGPRS(r1)
>  	ld	r0,GPR0(r1)
>  	mtcr	r2
>  	mtctr	r3
> @@ -249,7 +256,7 @@ END_BTB_FLUSH_SECTION
>  	ld	r2,PACATOC(r13)
>  	mfcr	r12
>  	li	r11,0
> -	/* Can we avoid saving r3-r8 in common case? */
> +	/* Save syscall parameters in r3-r8 */
>  	std	r3,GPR3(r1)
>  	std	r4,GPR4(r1)
>  	std	r5,GPR5(r1)
> @@ -300,6 +307,13 @@ END_BTB_FLUSH_SECTION
>  	wrteei	1
>  #endif
> =20
> +	/*
> +	 * Zero user registers to prevent influencing speculative execution
> +	 * state of kernel code.
> +	 */
> +	ZEROIZE_GPRS(5, 12)
> +	ZEROIZE_NVGPRS()
> +
>  	/* Calling convention has r3 =3D orig r0, r4 =3D regs */
>  	mr	r3,r0
>  	bl	system_call_exception
> @@ -342,6 +356,7 @@ BEGIN_FTR_SECTION
>  	stdcx.	r0,0,r1			/* to clear the reservation */
>  END_FTR_SECTION_IFCLR(CPU_FTR_STCX_CHECKS_ADDRESS)
> =20
> +	REST_NVGPRS(r1)
>  	cmpdi	r3,0
>  	bne	.Lsyscall_restore_regs
>  	/* Zero volatile regs that may contain sensitive kernel data */
> @@ -377,7 +392,6 @@ END_FTR_SECTION_IFSET(CPU_FTR_HAS_PPR)
>  .Lsyscall_restore_regs:
>  	ld	r3,_CTR(r1)
>  	ld	r4,_XER(r1)
> -	REST_NVGPRS(r1)
>  	mtctr	r3
>  	mtspr	SPRN_XER,r4
>  	ld	r0,GPR0(r1)
> --=20
> 2.34.1

