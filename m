Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6946B5BD8F1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Sep 2022 02:55:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MWjlS2df0z3c1M
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Sep 2022 10:55:48 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=PNPfHS8J;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::533; helo=mail-pg1-x533.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=PNPfHS8J;
	dkim-atps=neutral
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com [IPv6:2607:f8b0:4864:20::533])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MWjkr2Vvvz2ymS
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Sep 2022 10:55:16 +1000 (AEST)
Received: by mail-pg1-x533.google.com with SMTP id u69so984322pgd.2
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Sep 2022 17:55:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date;
        bh=fH0/q/pKdaiicww3KhO53VbREOyggrvrk9NKyjuEthU=;
        b=PNPfHS8JNgT2gHWBVyyjiPimFjasQw/D15XhwDU8Fy8G7StzT2H//+5pFL0yuS17UE
         ppMEhue+3jDiqD9e24TKfaEO57riIph0JJQIk7SLdZD8cdRtqDIUKUX6XWeksfiFaRHM
         lW9uPy9XGjNWebfFRaCP9B4Km+VnmfYiO1G9akcIS9X1Fckw/VmyFzbldvBpop0mf3zH
         PCXVHRZSqHQe3nUdRP3LScrEH+ZZKQjtggdKiTaYy/AulSQl2EQVsjuRBiJuvIXExmHn
         xsUHFmc4A25NrkgCoP+mP4l+cIjXbxeOgTtu4prjIbbusZwT3mJEPozkOUgjKXhhLWt7
         pV0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date;
        bh=fH0/q/pKdaiicww3KhO53VbREOyggrvrk9NKyjuEthU=;
        b=F4ezXxECXPzqjW4JikiR7fTOnb4kWPCopUxK/nVbn4x3dsMblAelHvpATEiy8b5rLr
         vGzNk4ntz7lZbwUU+BQkyTGeyZHwwfoDyQ1lYMpEc8osEMW57HEMkhsaUSBcr6mjcAF3
         TgWTxLbZjQZPL7V0PUTzk/CVa//KpjB9wcV99vW3fjgGxxjU+4LII3YLYOIItTyeKhr/
         g1UYloqNV3TGsMqlsBhF77JuzcJAJQXmCRQyUZE/wMWRAi42UVhRfZDQaN1Pqa/ViKFT
         A1WX+iLlqanvjEBcGGLKm5abb9GMTd7jF672zUSfKpLKN07RnAeRTQ4+S9nO+9CJRNZF
         YFYQ==
X-Gm-Message-State: ACrzQf0Vd/DP+O3qra7Yd6cj1AQEjXDDt7iCo8CNNzdhIqQBR5UBFsfe
	fgqqBM6cMdMXzJgW+3H1FHk=
X-Google-Smtp-Source: AMsMyM5c8Bhfj2gor0/H7eCle/sOBUf8K4pif5rpU0JNFamoutwy3/QVwRwkuZA/4cFbNl8qsAeGyg==
X-Received: by 2002:a63:b957:0:b0:434:c30d:84b0 with SMTP id v23-20020a63b957000000b00434c30d84b0mr18205414pgo.293.1663635313087;
        Mon, 19 Sep 2022 17:55:13 -0700 (PDT)
Received: from localhost (118-208-203-28.tpgi.com.au. [118.208.203.28])
        by smtp.gmail.com with ESMTPSA id a13-20020a170902eccd00b001785a72d285sm25604plh.48.2022.09.19.17.55.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Sep 2022 17:55:12 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 20 Sep 2022 10:55:07 +1000
Message-Id: <CN0THXMEUWOI.12LUWMU7XXNL9@bobo>
Subject: Re: [PATCH 06/23] powerpc/64e: Clarify register saves and clears
 with {SAVE,ZEROIZE}_GPRS
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Rohan McLure" <rmclure@linux.ibm.com>, <linuxppc-dev@lists.ozlabs.org>
X-Mailer: aerc 0.11.0
References: <20220916053300.786330-1-rmclure@linux.ibm.com>
 <20220916053300.786330-7-rmclure@linux.ibm.com>
In-Reply-To: <20220916053300.786330-7-rmclure@linux.ibm.com>
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
> The common interrupt handler prologue macro and the bad_stack
> trampolines include consecutive sequences of register saves, and some
> register clears. Neaten such instances by expanding use of the SAVE_GPRS
> macro and employing the ZEROIZE_GPR macro when appropriate.
>
> Also simplify an invocation of SAVE_GPRS targetting all non-volatile
> registers to SAVE_NVGPRS.
>
> Signed-off-by: Rohan Mclure <rmclure@linux.ibm.com>
> Reported-by: Nicholas Piggin <npiggin@gmail.com>
> ---
> V3 -> V4: New commit.
> ---
>  arch/powerpc/kernel/exceptions-64e.S | 27 +++++++++++---------------
>  1 file changed, 11 insertions(+), 16 deletions(-)
>
> diff --git a/arch/powerpc/kernel/exceptions-64e.S b/arch/powerpc/kernel/e=
xceptions-64e.S
> index 67dc4e3179a0..48c640ca425d 100644
> --- a/arch/powerpc/kernel/exceptions-64e.S
> +++ b/arch/powerpc/kernel/exceptions-64e.S
> @@ -216,17 +216,14 @@ END_FTR_SECTION_IFSET(CPU_FTR_EMB_HV)
>  	mtlr	r10
>  	mtcr	r11
> =20
> -	ld	r10,GPR10(r1)
> -	ld	r11,GPR11(r1)
> -	ld	r12,GPR12(r1)
> +	REST_GPRS(10, 12, r1)
>  	mtspr	\scratch,r0
> =20
>  	std	r10,\paca_ex+EX_R10(r13);
>  	std	r11,\paca_ex+EX_R11(r13);
>  	ld	r10,_NIP(r1)
>  	ld	r11,_MSR(r1)
> -	ld	r0,GPR0(r1)
> -	ld	r1,GPR1(r1)
> +	REST_GPRS(0, 1, r1)

I'm hesitant to have a multi reg restore that also clobbers the base
register. It works if we always restore in order, and there might never
be a good reason to change that, but it's possibly a bit easier to miss
when you're looking at the code.

Otherwise,

Reviewed-by: Nicholas Piggin <npiggin@gmail.com>

>  	mtspr	\srr0,r10
>  	mtspr	\srr1,r11
>  	ld	r10,\paca_ex+EX_R10(r13)
> @@ -372,16 +369,15 @@ ret_from_mc_except:
>  /* Core exception code for all exceptions except TLB misses. */
>  #define EXCEPTION_COMMON_LVL(n, scratch, excf)				    \
>  exc_##n##_common:							    \
> -	std	r0,GPR0(r1);		/* save r0 in stackframe */	    \
> -	std	r2,GPR2(r1);		/* save r2 in stackframe */	    \
> -	SAVE_GPRS(3, 9, r1);		/* save r3 - r9 in stackframe */    \
> +	SAVE_GPR(0, r1);		/* save r0 in stackframe */	    \
> +	SAVE_GPRS(2, 9, r1);		/* save r2 - r9 in stackframe */    \
>  	std	r10,_NIP(r1);		/* save SRR0 to stackframe */	    \
>  	std	r11,_MSR(r1);		/* save SRR1 to stackframe */	    \
>  	beq	2f;			/* if from kernel mode */	    \
>  2:	ld	r3,excf+EX_R10(r13);	/* get back r10 */		    \
>  	ld	r4,excf+EX_R11(r13);	/* get back r11 */		    \
>  	mfspr	r5,scratch;		/* get back r13 */		    \
> -	std	r12,GPR12(r1);		/* save r12 in stackframe */	    \
> +	SAVE_GPR(12, r1);		/* save r12 in stackframe */	    \
>  	ld	r2,PACATOC(r13);	/* get kernel TOC into r2 */	    \
>  	mflr	r6;			/* save LR in stackframe */	    \
>  	mfctr	r7;			/* save CTR in stackframe */	    \
> @@ -390,7 +386,7 @@ exc_##n##_common:							    \
>  	lwz	r10,excf+EX_CR(r13);	/* load orig CR back from PACA	*/  \
>  	lbz	r11,PACAIRQSOFTMASK(r13); /* get current IRQ softe */	    \
>  	ld	r12,exception_marker@toc(r2);				    \
> -	li	r0,0;							    \
> +	ZEROIZE_GPR(0);							    \
>  	std	r3,GPR10(r1);		/* save r10 to stackframe */	    \
>  	std	r4,GPR11(r1);		/* save r11 to stackframe */	    \
>  	std	r5,GPR13(r1);		/* save it to stackframe */	    \
> @@ -1056,15 +1052,14 @@ bad_stack_book3e:
>  	mfspr	r11,SPRN_ESR
>  	std	r10,_DEAR(r1)
>  	std	r11,_ESR(r1)
> -	std	r0,GPR0(r1);		/* save r0 in stackframe */	    \
> -	std	r2,GPR2(r1);		/* save r2 in stackframe */	    \
> -	SAVE_GPRS(3, 9, r1);		/* save r3 - r9 in stackframe */    \
> +	SAVE_GPR(0, r1);		/* save r0 in stackframe */	    \
> +	SAVE_GPRS(2, 9, r1);		/* save r2 - r9 in stackframe */    \
>  	ld	r3,PACA_EXGEN+EX_R10(r13);/* get back r10 */		    \
>  	ld	r4,PACA_EXGEN+EX_R11(r13);/* get back r11 */		    \
>  	mfspr	r5,SPRN_SPRG_GEN_SCRATCH;/* get back r13 XXX can be wrong */ \
>  	std	r3,GPR10(r1);		/* save r10 to stackframe */	    \
>  	std	r4,GPR11(r1);		/* save r11 to stackframe */	    \
> -	std	r12,GPR12(r1);		/* save r12 in stackframe */	    \
> +	SAVE_GPR(12, r1);		/* save r12 in stackframe */	    \
>  	std	r5,GPR13(r1);		/* save it to stackframe */	    \
>  	mflr	r10
>  	mfctr	r11
> @@ -1072,12 +1067,12 @@ bad_stack_book3e:
>  	std	r10,_LINK(r1)
>  	std	r11,_CTR(r1)
>  	std	r12,_XER(r1)
> -	SAVE_GPRS(14, 31, r1)
> +	SAVE_NVGPRS(r1)
>  	lhz	r12,PACA_TRAP_SAVE(r13)
>  	std	r12,_TRAP(r1)
>  	addi	r11,r1,INT_FRAME_SIZE
>  	std	r11,0(r1)
> -	li	r12,0
> +	ZEROIZE_GPR(12)
>  	std	r12,0(r11)
>  	ld	r2,PACATOC(r13)
>  1:	addi	r3,r1,STACK_FRAME_OVERHEAD
> --=20
> 2.34.1

