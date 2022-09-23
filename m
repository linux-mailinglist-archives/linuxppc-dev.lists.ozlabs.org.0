Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 101675E755F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Sep 2022 10:02:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MYl4j09Byz3cj7
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Sep 2022 18:02:45 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=kEqQvozf;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::431; helo=mail-pf1-x431.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=kEqQvozf;
	dkim-atps=neutral
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MYl420chxz3c6X
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Sep 2022 18:02:08 +1000 (AEST)
Received: by mail-pf1-x431.google.com with SMTP id l65so11673500pfl.8
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Sep 2022 01:02:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:references:subject:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date;
        bh=289XXjvdyvLnF8KX8Pv+XWrwMbTGd7NpL7xn2GTxxF0=;
        b=kEqQvozfSCttnsRlwvYYEcSxXGRqKuwRpp1yrF0k3RdyZQ1MJ00saXN1SDZJohCRAm
         cPukUc65Fj1KGX8SVtB5OKBUfOaSH7axKrVpYc5bXUj5f1C1ie/p97uLGLc626WTkVWj
         Z1jJFl0fXjNUABBL9kEj7fTgjQhY08nuY2u8te81Xsc8ouODvt30Zo23Dr71RFUrMxdJ
         jlofs1d5KFMchexh/YFXPFGXer+3321kUPUfHWvNhZBkH6VDuOE0CdKjwExgWY+s82xS
         PnJpBVL5ltcjVXOz44y6K5Gx0Ezx6Mu1Uq2JMa77LnwQi0ovZ+Zk/qFhe5zLygTx6b4d
         65mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:references:subject:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date;
        bh=289XXjvdyvLnF8KX8Pv+XWrwMbTGd7NpL7xn2GTxxF0=;
        b=BmxeGwsQLFZNDVCl9RnVYLDPI6nu2JXETyTAG3kZTodZp5Fdr+scT/tFWLTCQw5hGh
         O734VQP/UapVtxVU4BU0yZoT28KBd5WxDErz0JKj/ds91x1KUl9W3iyYL5/02MHc4n7M
         EazO8dLg0eTBJnvrRjcxXbwTeslznroiqc4UssZ0bmMK+Mv9/0i9r5k2Dsdu8Pa8mYz3
         P6yhCklfqNtV+ORi3TeYpy09xKMXXI64VDhcJXZOrczc/BNXDzvDeltVo8zHTqMVAJcl
         GM8aNGiNX9Wdjd4o13ECnR9Spv0/wbQcKmyMgoVIxF/BPAyDbB7CbUgkXl3M10AoHY5J
         iBqw==
X-Gm-Message-State: ACrzQf2nuvXTZbaGDbpnz1dYVgR/u6aeewzs++nzMMyL6+MoNP97ZygR
	EidTwSa8osnxB4Wp60lZAWA=
X-Google-Smtp-Source: AMsMyM5dQIYWteMB48Zevyr5JRisYZyqg1HO1w4NuR4azr0VVGHOQQUEaws/9LJ1K/GpiMV5QFpo4g==
X-Received: by 2002:a63:1d62:0:b0:439:61fa:eb4b with SMTP id d34-20020a631d62000000b0043961faeb4bmr6685578pgm.275.1663920125953;
        Fri, 23 Sep 2022 01:02:05 -0700 (PDT)
Received: from localhost (27-32-155-116.static.tpgi.com.au. [27.32.155.116])
        by smtp.gmail.com with ESMTPSA id g6-20020aa79dc6000000b00540b3be3bf6sm5768969pfq.196.2022.09.23.01.02.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Sep 2022 01:02:05 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 23 Sep 2022 18:02:01 +1000
Message-Id: <CN3MGF4GO42K.22AHRCY1C91N2@bobo>
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Rohan McLure" <rmclure@linux.ibm.com>, <linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH v6 22/25] powerpc/64s: Clear user GPRs in syscall
 interrupt entry
X-Mailer: aerc 0.11.0
References: <20220921065605.1051927-1-rmclure@linux.ibm.com>
 <20220921065605.1051927-23-rmclure@linux.ibm.com>
In-Reply-To: <20220921065605.1051927-23-rmclure@linux.ibm.com>
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

On Wed Sep 21, 2022 at 4:56 PM AEST, Rohan McLure wrote:
> Clear user state in gprs (assign to zero) to reduce the influence of user
> registers on speculation within kernel syscall handlers. Clears occur
> at the very beginning of the sc and scv 0 interrupt handlers, with
> restores occurring following the execution of the syscall handler.
>
> Signed-off-by: Rohan McLure <rmclure@linux.ibm.com>
> ---
> V2: Update summary
> V3: Remove erroneous summary paragraph on syscall_exit_prepare
> V4: Use ZEROIZE instead of NULLIFY. Clear r0 also.
> V5: Move to end of patch series.
> V6: Include clears which were previously in the syscall wrapper patch.
> Move comment on r3-r8 register save to when we alter the calling
> convention for system_call_exception.

The series looks good to here, I just need to find a bit more time to
look at the code and do some tests with the next few patches. I don't
see much problem with them, looks a lot better now with fewer ifdefs
so that's good. Possibly you could share some of those new sanitize
macros in a header file but that's a minor nit.

Coud we have this zeroize also under the same config option as the
next? I figure if we care about speculative security we want both,
and if we don't we need neither.

Thanks,
Nick

> ---
>  arch/powerpc/kernel/interrupt_64.S | 17 ++++++++++++++++-
>  1 file changed, 16 insertions(+), 1 deletion(-)
>
> diff --git a/arch/powerpc/kernel/interrupt_64.S b/arch/powerpc/kernel/int=
errupt_64.S
> index a5dd78bdbe6d..40147558e1a6 100644
> --- a/arch/powerpc/kernel/interrupt_64.S
> +++ b/arch/powerpc/kernel/interrupt_64.S
> @@ -106,6 +106,13 @@ END_FTR_SECTION_IFSET(CPU_FTR_HAS_PPR)
>  	 * but this is the best we can do.
>  	 */
> =20
> +	/*
> +	 * Zero user registers to prevent influencing speculative execution
> +	 * state of kernel code.
> +	 */
> +	ZEROIZE_GPR(0)
> +	ZEROIZE_GPRS(5, 12)
> +	ZEROIZE_NVGPRS()
>  	bl	system_call_exception
> =20
>  .Lsyscall_vectored_\name\()_exit:
> @@ -134,6 +141,7 @@ BEGIN_FTR_SECTION
>  	HMT_MEDIUM_LOW
>  END_FTR_SECTION_IFSET(CPU_FTR_HAS_PPR)
> =20
> +	REST_NVGPRS(r1)
>  	cmpdi	r3,0
>  	bne	.Lsyscall_vectored_\name\()_restore_regs
> =20
> @@ -285,6 +293,13 @@ END_BTB_FLUSH_SECTION
>  	wrteei	1
>  #endif
> =20
> +	/*
> +	 * Zero user registers to prevent influencing speculative execution
> +	 * state of kernel code.
> +	 */
> +	ZEROIZE_GPR(0)
> +	ZEROIZE_GPRS(5, 12)
> +	ZEROIZE_NVGPRS()
>  	bl	system_call_exception
> =20
>  .Lsyscall_exit:
> @@ -325,6 +340,7 @@ BEGIN_FTR_SECTION
>  	stdcx.	r0,0,r1			/* to clear the reservation */
>  END_FTR_SECTION_IFCLR(CPU_FTR_STCX_CHECKS_ADDRESS)
> =20
> +	REST_NVGPRS(r1)
>  	cmpdi	r3,0
>  	bne	.Lsyscall_restore_regs
>  	/* Zero volatile regs that may contain sensitive kernel data */
> @@ -352,7 +368,6 @@ END_FTR_SECTION_IFSET(CPU_FTR_HAS_PPR)
>  .Lsyscall_restore_regs:
>  	ld	r3,_CTR(r1)
>  	ld	r4,_XER(r1)
> -	REST_NVGPRS(r1)
>  	mtctr	r3
>  	mtspr	SPRN_XER,r4
>  	REST_GPR(0, r1)
> --=20
> 2.34.1

