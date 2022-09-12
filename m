Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A5FCC5B59A2
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Sep 2022 13:50:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MR4dz1Bcdz2xJ4
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Sep 2022 21:49:59 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=h/kO1JRm;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102f; helo=mail-pj1-x102f.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=h/kO1JRm;
	dkim-atps=neutral
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MR4dJ65YRz2xHZ
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Sep 2022 21:49:24 +1000 (AEST)
Received: by mail-pj1-x102f.google.com with SMTP id fs14so7769100pjb.5
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Sep 2022 04:49:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date;
        bh=yAT0ziYvM8beUCALu89qn6YTkuAST0JUVTbrnZrV83E=;
        b=h/kO1JRmNJXalvJ/c03HlLNMkEprBKcUiLQQP4CaT5Vo8T6UN7VUZdvbFPoJJ/bsCf
         saSM4fEGqLo2gzdfP6HPeY+5Vh842+6Q6BuXZ1DzIDz+ecudGIqk9lEM831aLHF2agO3
         5n3QxFB8wfsjhKcpDkmNeAbXMIAiu2g8Kj0p/5TY1QfXzyMHHDxUjxF55+yUuGJ1Admb
         /4TYc3kJXwTO+P3HcBuP/H486sxyPlQmwvp3Jd6SfzyxTk4ETpBsscQ3nE9qoh2+Mkzc
         8LGt2o73cs4vbCYpOxZX2tpSNcRLdCPQjcCZKyuGk0rshhfgoH6fSZPabmEFYUomWF/E
         qw1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date;
        bh=yAT0ziYvM8beUCALu89qn6YTkuAST0JUVTbrnZrV83E=;
        b=k7XaI97jpljNBXsvJvWdA0nKTnbL7+bEXNfCfTI4nL24l01HyZGToro9gRx22PqpUV
         ITD62xrQg2If0x+u6DCpmnzm3xQDbq5pFEgiRSxvkVrUavjIshCrPPdCFwHghU9Kg1fU
         rN4oRIik2G6utAW0dyZiIWGLdsSI9vk2q3zZjFunng5dSjIGXLzjEdTZ5VJQP+17VbPL
         YjUERgXJc/VZwbqDU6SLR5dOCocXjYrkUYlMTKYju3Ma4tfn5/N9pZq7ytq8KD7iDqD4
         BX8P7YzmVXSzHRgnPOU+g/gSiASUX/XtOXwWVajmSF5FcBHxuG5JzvaSiJ830/mmBaUa
         pK/A==
X-Gm-Message-State: ACgBeo24rtYGTf83uf+hzzM1ekHq7GhC0FAhmJ44kf0xn9mEolX58ZH3
	I6kFHiMO1wHln+lKce0IQNlUt8X2dvA=
X-Google-Smtp-Source: AA6agR4+nLiI9qng5ycSA7zKPSm1Z8oHh+4bfFFWdGgfgidgaSjLfKdOHVGwoYFlLl+4knRImhnXqQ==
X-Received: by 2002:a17:903:248:b0:172:7520:db04 with SMTP id j8-20020a170903024800b001727520db04mr26613268plh.99.1662983362642;
        Mon, 12 Sep 2022 04:49:22 -0700 (PDT)
Received: from localhost ([118.210.107.131])
        by smtp.gmail.com with ESMTPSA id u15-20020a62d44f000000b005380832c1fesm5408421pfl.10.2022.09.12.04.49.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Sep 2022 04:49:21 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 12 Sep 2022 21:49:18 +1000
Message-Id: <CMUEEG8WEDIM.1GHQCY11V524N@bobo>
Subject: Re: [PATCH v4 15/20] powerpc/64s: Use {ZEROIZE,SAVE,REST}_GPRS
 macros in sc, scv 0 handlers
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Rohan McLure" <rmclure@linux.ibm.com>, <linuxppc-dev@lists.ozlabs.org>
X-Mailer: aerc 0.11.0
References: <20220824020548.62625-1-rmclure@linux.ibm.com>
 <20220824020548.62625-16-rmclure@linux.ibm.com>
In-Reply-To: <20220824020548.62625-16-rmclure@linux.ibm.com>
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
> Use the convenience macros for saving/clearing/restoring gprs in keeping
> with syscall calling conventions. The plural variants of these macros
> can store a range of registers for concision.
>
> This works well when the user gpr value we are hoping to save is still
> live. In the syscall interrupt handlers, user register state is
> sometimes juggled between registers. Hold-off from issuing the SAVE_GPR
> macro for applicable neighbouring lines to highlight the delicate
> register save logic.
>

Reviewed-by: Nicholas Piggin <npiggin@gmail.com>

> Signed-off-by: Rohan McLure <rmclure@linux.ibm.com>
> ---
> V1 -> V2: Update summary
> V2 -> V3: Update summary regarding exclusions for the SAVE_GPR marco.
> Acknowledge new name for ZEROIZE_GPR{,S} macros.
> ---
>  arch/powerpc/kernel/interrupt_64.S | 43 ++++++----------------------
>  1 file changed, 9 insertions(+), 34 deletions(-)
>
> diff --git a/arch/powerpc/kernel/interrupt_64.S b/arch/powerpc/kernel/int=
errupt_64.S
> index a8065209dd8c..ad302ad93433 100644
> --- a/arch/powerpc/kernel/interrupt_64.S
> +++ b/arch/powerpc/kernel/interrupt_64.S
> @@ -71,12 +71,7 @@ _ASM_NOKPROBE_SYMBOL(system_call_vectored_\name)
>  	mfcr	r12
>  	li	r11,0
>  	/* Save syscall parameters in r3-r8 */
> -	std	r3,GPR3(r1)
> -	std	r4,GPR4(r1)
> -	std	r5,GPR5(r1)
> -	std	r6,GPR6(r1)
> -	std	r7,GPR7(r1)
> -	std	r8,GPR8(r1)
> +	SAVE_GPRS(3, 8, r1)
>  	/* Zero r9-r12, this should only be required when restoring all GPRs */
>  	std	r11,GPR9(r1)
>  	std	r11,GPR10(r1)
> @@ -157,17 +152,10 @@ END_FTR_SECTION_IFSET(CPU_FTR_HAS_PPR)
>  	/* Could zero these as per ABI, but we may consider a stricter ABI
>  	 * which preserves these if libc implementations can benefit, so
>  	 * restore them for now until further measurement is done. */
> -	ld	r0,GPR0(r1)
> -	ld	r4,GPR4(r1)
> -	ld	r5,GPR5(r1)
> -	ld	r6,GPR6(r1)
> -	ld	r7,GPR7(r1)
> -	ld	r8,GPR8(r1)
> +	REST_GPR(0, r1)
> +	REST_GPRS(4, 8, r1)
>  	/* Zero volatile regs that may contain sensitive kernel data */
> -	li	r9,0
> -	li	r10,0
> -	li	r11,0
> -	li	r12,0
> +	ZEROIZE_GPRS(9, 12)
>  	mtspr	SPRN_XER,r0
> =20
>  	/*
> @@ -189,7 +177,7 @@ END_FTR_SECTION_IFSET(CPU_FTR_HAS_PPR)
>  	ld	r4,_LINK(r1)
>  	ld	r5,_XER(r1)
> =20
> -	ld	r0,GPR0(r1)
> +	REST_GPR(0, r1)
>  	mtcr	r2
>  	mtctr	r3
>  	mtlr	r4
> @@ -257,12 +245,7 @@ END_BTB_FLUSH_SECTION
>  	mfcr	r12
>  	li	r11,0
>  	/* Save syscall parameters in r3-r8 */
> -	std	r3,GPR3(r1)
> -	std	r4,GPR4(r1)
> -	std	r5,GPR5(r1)
> -	std	r6,GPR6(r1)
> -	std	r7,GPR7(r1)
> -	std	r8,GPR8(r1)
> +	SAVE_GPRS(3, 8, r1)
>  	/* Zero r9-r12, this should only be required when restoring all GPRs */
>  	std	r11,GPR9(r1)
>  	std	r11,GPR10(r1)
> @@ -360,16 +343,8 @@ END_FTR_SECTION_IFCLR(CPU_FTR_STCX_CHECKS_ADDRESS)
>  	cmpdi	r3,0
>  	bne	.Lsyscall_restore_regs
>  	/* Zero volatile regs that may contain sensitive kernel data */
> -	li	r0,0
> -	li	r4,0
> -	li	r5,0
> -	li	r6,0
> -	li	r7,0
> -	li	r8,0
> -	li	r9,0
> -	li	r10,0
> -	li	r11,0
> -	li	r12,0
> +	ZEROIZE_GPR(0)
> +	ZEROIZE_GPRS(4, 12)
>  	mtctr	r0
>  	mtspr	SPRN_XER,r0
>  .Lsyscall_restore_regs_cont:
> @@ -394,7 +369,7 @@ END_FTR_SECTION_IFSET(CPU_FTR_HAS_PPR)
>  	ld	r4,_XER(r1)
>  	mtctr	r3
>  	mtspr	SPRN_XER,r4
> -	ld	r0,GPR0(r1)
> +	REST_GPR(0, r1)
>  	REST_GPRS(4, 12, r1)
>  	b	.Lsyscall_restore_regs_cont
>  .Lsyscall_rst_end:
> --=20
> 2.34.1

