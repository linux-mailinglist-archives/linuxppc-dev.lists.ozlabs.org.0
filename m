Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D84D25BD9E0
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Sep 2022 04:08:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MWlLr3Q6wz305M
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Sep 2022 12:08:04 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=P+rdfr8W;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1035; helo=mail-pj1-x1035.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=P+rdfr8W;
	dkim-atps=neutral
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MWlLF0x0Qz2xr1
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Sep 2022 12:07:32 +1000 (AEST)
Received: by mail-pj1-x1035.google.com with SMTP id p1-20020a17090a2d8100b0020040a3f75eso998038pjd.4
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Sep 2022 19:07:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date;
        bh=75rr2Ar6L4Y0FMBhXAX3I+1J6L2xqazXIs85tDwYKzo=;
        b=P+rdfr8WTIWTciEcgOqgxKTZS1dqBEw2rMq1rOdjVcgbKzfBRPSHodn7plTckrzOie
         3TZSLIpiIkNtZUMbelr2uCyy5UyEbmfvWNdA0dCy+m89eeK2zsDsReFc4rxpJG1c8FiP
         buNDzPFxlfsDgf0Bg5Gd/NxdT/d/er8JgmVZi//XcKD6jcLRacD2CLTweY/hNdsgc4Hm
         VF2uLGjqdI+VE7PBopEhmY8a3pGsRIFg+jhwKgC53ehfQei63ajiLikTefk6l8tb+LV4
         SihxWyLBmgKBT4CefQYQCxM+AuKqI3q62dvcTr5SQtMBc9VsAwxeAQHbvUGj+ktweZ7I
         RkAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date;
        bh=75rr2Ar6L4Y0FMBhXAX3I+1J6L2xqazXIs85tDwYKzo=;
        b=nH4gzCMQVN6m1nrv4txgsKzBkKy5Q79C8G+zXLHy2NNcOszPAWqxoUxC+gk4Z7zonO
         +xxImCVVNm2gRROu/9XQ06Vt/fiLx7w/JYViQx1nbKFd/rLw5twKXVbHgiDjQNP14ihg
         9LumogrdPmNFXifRmgYTX/4bBGzIACAVcad9cjmijIE45MNXtfKHga428MPcJAE+6LQs
         7Jt68ECd32MXtAFw9clZyO3pVswv7DZV8FOuDWAgPGyQ9Sg7uDm/IwtyIvvIkdwyDx6v
         fvlf6m1NAVuOygGXFuRRaQGrVo8u/q0llRCpCB0vzAEdMFRYMu6ZUsfojSfeqHjHBw52
         /I6g==
X-Gm-Message-State: ACrzQf3hx172jnTGT8nyC5MyxpGdO3RHFgPOli7sKj5stlglnzjCGIAn
	Kvrgp66xqVhaXAT92/STXHen5DmS6U8=
X-Google-Smtp-Source: AMsMyM4qTUDvRziKKuKa64QXp2R731p6SZV6O4aMQYfljUI7pD8QmQD1d1ymM8yaXbih2d0WqU5iCQ==
X-Received: by 2002:a17:90b:1b47:b0:202:f248:e1f2 with SMTP id nv7-20020a17090b1b4700b00202f248e1f2mr1313811pjb.106.1663639649354;
        Mon, 19 Sep 2022 19:07:29 -0700 (PDT)
Received: from localhost (118-208-203-28.tpgi.com.au. [118.208.203.28])
        by smtp.gmail.com with ESMTPSA id l6-20020a17090a150600b002005f5ab6a8sm7293119pja.29.2022.09.19.19.07.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Sep 2022 19:07:28 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 20 Sep 2022 12:07:23 +1000
Message-Id: <CN0V19K4UC47.3NKT93DAEOX2I@bobo>
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

Oh I would say change the title more like the interrupt patches to avoid
mentioning the restore/return because that's implicit.

e.g., "Clear user GPRs in syscall interrupt entry"

Could we have the one config option that does both this and the interrupt
zeroing?

Thanks,
Nick

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

