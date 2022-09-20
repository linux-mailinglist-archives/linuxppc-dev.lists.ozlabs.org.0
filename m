Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D63C5BD9CE
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Sep 2022 04:04:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MWlGK5YGpz3c2h
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Sep 2022 12:04:09 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=GAQeDtNh;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::436; helo=mail-pf1-x436.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=GAQeDtNh;
	dkim-atps=neutral
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MWlFh5zl0z2xgN
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Sep 2022 12:03:36 +1000 (AEST)
Received: by mail-pf1-x436.google.com with SMTP id b23so1349943pfp.9
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Sep 2022 19:03:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date;
        bh=F6Fr2SDjxmFX0Msmh++2tW2WZYEDeyUUu8xt1G6O0fE=;
        b=GAQeDtNhOvGXUG4HHoqgZSEcw+zlNOaqpa0bygZ2ljnlk3BsMH6ZbE0XCRxds5KdiR
         z9L9bZziE4vYuQyTDNbJ5fIG0qVEeqHrydNhXM8KAQ3WmJE890uBqtHWzFxNSBm6AjBH
         DwEUaV2PzLEblW8HZO0g+wDUtXXMolWP9tM1kkcNTAJjWZf2GXOSMMKRbQ+NXHXX+hQw
         C7hDzlGXPzxwvXl0nhOguvuVE/DGNGTGC4VQiNBr9TTKxboAnsZwThr5jwC7LuZAAO0L
         Qk8te6yZhCrwq5HJ1wah0+75OL01MBvU2tlziMK4SC3PALkUpoEIsG5OGuDLFIpHLYUj
         Budg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date;
        bh=F6Fr2SDjxmFX0Msmh++2tW2WZYEDeyUUu8xt1G6O0fE=;
        b=BUjb/FXRpOuRZQnfeaayHb46PQr50U/xd+SLlaZ6gCHvgfYOZ6A+764JXpLkenqrX/
         1Y9t8c9CoetdfwFvwcv9PGRSxh6DyBffvSv4FE6V4ZyaEZ589dejrXRKmNfLE3xzH2Uv
         BbT5RUR88k7/JWSVAxSl63rIAOb6pKIx6A41sLrl+xbI7FKfrva8572N6GDpVro9ES2v
         2tHkar75+U9pEcksJ4TWmVpQ3J44qb/Sx5K3RcN6LvTusG4p6qwj3c8FiLTtqJHhh9lc
         dZk7nTa34MXeIoZHFsZGeDzgA4kpA6G3L/El1PtipNy8ZQhVHDFw4d4fgovIt7ZBW9mT
         ws/A==
X-Gm-Message-State: ACrzQf2DKnc2gB7S4W+/j1yxTcJUKLXZMWcNefAzAULG29Bnt+lbtH5i
	TFMJDyeKWUi58OObiRRNLrk=
X-Google-Smtp-Source: AMsMyM5hzy1pppeaRl7v7bgzevtKoAVUu4aRqgq1y0MvKxKLMDXWqUEAfhDEySJF71Q2aSXzEAM06Q==
X-Received: by 2002:a63:5b61:0:b0:41d:3227:37b8 with SMTP id l33-20020a635b61000000b0041d322737b8mr17951337pgm.265.1663639414461;
        Mon, 19 Sep 2022 19:03:34 -0700 (PDT)
Received: from localhost (118-208-203-28.tpgi.com.au. [118.208.203.28])
        by smtp.gmail.com with ESMTPSA id y15-20020a17090264cf00b00172f4835f60sm67729pli.189.2022.09.19.19.03.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Sep 2022 19:03:33 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 20 Sep 2022 12:03:29 +1000
Message-Id: <CN0UYA40KPVY.V7SYHTJAP9KO@bobo>
Subject: Re: [PATCH 20/23] powerpc/64s: Clear/restore caller gprs in syscall
 interrupt/return
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Rohan McLure" <rmclure@linux.ibm.com>, <linuxppc-dev@lists.ozlabs.org>
X-Mailer: aerc 0.11.0
References: <20220916053300.786330-1-rmclure@linux.ibm.com>
 <20220916053300.786330-21-rmclure@linux.ibm.com>
In-Reply-To: <20220916053300.786330-21-rmclure@linux.ibm.com>
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
> Clear user state in gprs (assign to zero) to reduce the influence of user
> registers on speculation within kernel syscall handlers. Clears occur
> at the very beginning of the sc and scv 0 interrupt handlers, with
> restores occurring following the execution of the syscall handler.
>
> Signed-off-by: Rohan McLure <rmclure@linux.ibm.com>
> ---
> V1 -> V2: Update summary
> V2 -> V3: Remove erroneous summary paragraph on syscall_exit_prepare
> V3 -> V4: Use ZEROIZE instead of NULLIFY. Clear r0 also.
> V4 -> V5: Move to end of patch series.
> ---

I think it looks okay. I'll have to take a better look with the series
applied.

>  arch/powerpc/kernel/interrupt_64.S | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
>
> diff --git a/arch/powerpc/kernel/interrupt_64.S b/arch/powerpc/kernel/int=
errupt_64.S
> index 16a1b44088e7..40147558e1a6 100644
> --- a/arch/powerpc/kernel/interrupt_64.S
> +++ b/arch/powerpc/kernel/interrupt_64.S
> @@ -70,7 +70,7 @@ _ASM_NOKPROBE_SYMBOL(system_call_vectored_\name)
>  	ld	r2,PACATOC(r13)
>  	mfcr	r12
>  	li	r11,0
> -	/* Can we avoid saving r3-r8 in common case? */
> +	/* Save syscall parameters in r3-r8 */

These two comment changes could go in your system_call_exception API
change patch though.

Thanks,
Nick

>  	SAVE_GPRS(3, 8, r1)
>  	/* Zero r9-r12, this should only be required when restoring all GPRs */
>  	std	r11,GPR9(r1)
> @@ -110,6 +110,7 @@ END_FTR_SECTION_IFSET(CPU_FTR_HAS_PPR)
>  	 * Zero user registers to prevent influencing speculative execution
>  	 * state of kernel code.
>  	 */
> +	ZEROIZE_GPR(0)
>  	ZEROIZE_GPRS(5, 12)
>  	ZEROIZE_NVGPRS()
>  	bl	system_call_exception
> @@ -140,6 +141,7 @@ BEGIN_FTR_SECTION
>  	HMT_MEDIUM_LOW
>  END_FTR_SECTION_IFSET(CPU_FTR_HAS_PPR)
> =20
> +	REST_NVGPRS(r1)
>  	cmpdi	r3,0
>  	bne	.Lsyscall_vectored_\name\()_restore_regs
> =20
> @@ -243,7 +245,7 @@ END_BTB_FLUSH_SECTION
>  	ld	r2,PACATOC(r13)
>  	mfcr	r12
>  	li	r11,0
> -	/* Can we avoid saving r3-r8 in common case? */
> +	/* Save syscall parameters in r3-r8 */
>  	SAVE_GPRS(3, 8, r1)
>  	/* Zero r9-r12, this should only be required when restoring all GPRs */
>  	std	r11,GPR9(r1)
> @@ -295,6 +297,7 @@ END_BTB_FLUSH_SECTION
>  	 * Zero user registers to prevent influencing speculative execution
>  	 * state of kernel code.
>  	 */
> +	ZEROIZE_GPR(0)
>  	ZEROIZE_GPRS(5, 12)
>  	ZEROIZE_NVGPRS()
>  	bl	system_call_exception
> @@ -337,6 +340,7 @@ BEGIN_FTR_SECTION
>  	stdcx.	r0,0,r1			/* to clear the reservation */
>  END_FTR_SECTION_IFCLR(CPU_FTR_STCX_CHECKS_ADDRESS)
> =20
> +	REST_NVGPRS(r1)
>  	cmpdi	r3,0
>  	bne	.Lsyscall_restore_regs
>  	/* Zero volatile regs that may contain sensitive kernel data */
> @@ -364,7 +368,6 @@ END_FTR_SECTION_IFSET(CPU_FTR_HAS_PPR)
>  .Lsyscall_restore_regs:
>  	ld	r3,_CTR(r1)
>  	ld	r4,_XER(r1)
> -	REST_NVGPRS(r1)
>  	mtctr	r3
>  	mtspr	SPRN_XER,r4
>  	REST_GPR(0, r1)
> --=20
> 2.34.1

