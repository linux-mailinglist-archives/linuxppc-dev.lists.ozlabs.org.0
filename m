Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 17FE45B5A0C
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Sep 2022 14:17:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MR5Fx0kG3z3bSV
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Sep 2022 22:17:41 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=ST8u3LGZ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1034; helo=mail-pj1-x1034.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=ST8u3LGZ;
	dkim-atps=neutral
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MR5FK5bkvz2xGS
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Sep 2022 22:17:09 +1000 (AEST)
Received: by mail-pj1-x1034.google.com with SMTP id j6-20020a17090a694600b00200bba67dadso7931549pjm.5
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Sep 2022 05:17:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date;
        bh=Gshm9Bm50i0TZ5bTfFGU0oy19PQGQsRao6YZcDF9L6M=;
        b=ST8u3LGZXgRmD0QHpV9rCiVzfrwnqPvHRRDvfGI5j0FX1CJkNz3OFK4B5z+4AD9OZU
         O6Qvd85aFx1PojE4rsUr29Ro720QMg0Sxne4YTMdOZYcaA9u9oDq40vPm1HxjJgaYz65
         cNuDOMc1aWL1eS3t2fS0jZP1F7qHUJ+WCIyxrUMtXY4ejkT/GZDtYH9uuV0mPwilxFMu
         bCNZjYSHjnvwqf6MQxBO/3HFrzREy8XxSf+N/jzNCiWW3jIEbJ5c6Yj3QcMI0DD2luSx
         av1ZQBVuVyLzH7t/MyKG7FAJKkDqR3lgvsleN0rH0Gwxa8V43wohYF6/TrlzYuJ6lX7u
         0+rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date;
        bh=Gshm9Bm50i0TZ5bTfFGU0oy19PQGQsRao6YZcDF9L6M=;
        b=1fD7qyf9RmqQG73FbWuHj02IgBxfW7Oou+hRfz+jo7PfqIu1gMVPAikAAFt/8K9VrS
         vZFHchKFJM91WMi6j+2tjbn7tlEZ2RNqf5WxLKFJgj4nf9h7lzGl/XusHupYgYqbBJkw
         Yhu6QgpAX1BeY51hehhWA51jX+FqyCdYI999evbMB8dDFfkmfosMDn/E++duDzRUGjIT
         t7D0PI7ltaHvX7GxCn7972SWDepeOg2zfwMct099l9gB4b9aozSL1+s1rIulAuKwuljO
         0LWXAm9ejJoNiCFypf/Ken3m7cCXpdPHw748zPZ7KVRlemMfgadfnLGQKVaZgKdV4/9u
         CdXQ==
X-Gm-Message-State: ACgBeo0E4sRBDIifURWROMVR1LwJXYQWpqax8JLPuKxGbt1G8Fq01Mga
	A+QC5HgHMPyoeLzAM64iQOrFqFcoTSA=
X-Google-Smtp-Source: AA6agR6QJplj3UAJFMrKSWsu90dRdRPOiclbMofR04EFeVgvP8xfhLZKq+ACWEEO95L65GY+3pxHow==
X-Received: by 2002:a17:90b:4a43:b0:202:7706:73d7 with SMTP id lb3-20020a17090b4a4300b00202770673d7mr19979276pjb.137.1662985028023;
        Mon, 12 Sep 2022 05:17:08 -0700 (PDT)
Received: from localhost ([118.210.107.131])
        by smtp.gmail.com with ESMTPSA id r12-20020a17090a454c00b001facf455c91sm118320pjm.21.2022.09.12.05.17.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Sep 2022 05:17:07 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 12 Sep 2022 22:17:03 +1000
Message-Id: <CMUEZP8TK3TT.3ETMR61JMVNJT@bobo>
Subject: Re: [PATCH v4 17/20] powerpc/64e: Clarify register saves and clears
 with {SAVE,ZEROIZE}_GPRS
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Rohan McLure" <rmclure@linux.ibm.com>, <linuxppc-dev@lists.ozlabs.org>
X-Mailer: aerc 0.11.0
References: <20220824020548.62625-1-rmclure@linux.ibm.com>
 <20220824020548.62625-18-rmclure@linux.ibm.com>
In-Reply-To: <20220824020548.62625-18-rmclure@linux.ibm.com>
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
> The common interrupt handler prologue macro and the bad_stack
> trampolines include consecutive sequences of register saves, and some
> register clears. Neaten such instances by expanding use of the SAVE_GPRS
> macro and employing the ZEROIZE_GPR macro when appropriate.
>
> Also simplify an invocation of SAVE_GPRS targetting all non-volatile
> registers to SAVE_NVGPRS.
>
Reviewed-by: Nicholas Piggin <npiggin@gmail.com>

> Signed-off-by: Rohan Mclure <rmclure@linux.ibm.com>
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

