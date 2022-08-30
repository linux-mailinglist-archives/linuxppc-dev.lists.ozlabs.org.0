Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 924815A5B06
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Aug 2022 07:15:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MGwWC4MQkz3c66
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Aug 2022 15:15:51 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Fdm6wntX;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62f; helo=mail-pl1-x62f.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Fdm6wntX;
	dkim-atps=neutral
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MGwVV71D5z3bNj
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Aug 2022 15:15:12 +1000 (AEST)
Received: by mail-pl1-x62f.google.com with SMTP id d12so10023987plr.6
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Aug 2022 22:15:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc;
        bh=XhKRcGFjtpEYNjx5UVxLTFhZAHO2BZKIiT3oO1QLGqI=;
        b=Fdm6wntXd5tbdV80W5k4KMXE9KNwKfMvAEfSncpRlW/U1IBuQi1inAXxJr0k17+vv7
         pGAasKEPQR+AY7zu6wE7LZKD2oTU+PgBRJB0KUFC8Ay9j7p3ZG53dv0xOY1I6YZgrwfP
         j1wHe05/lShUPIcGrqvxq/xfz/lGh/ccOzusyXvlzFiVz2eGDNmUbsB8keho3p5cuoOU
         yL9lx4newuSWFSA7yYtv1lhDT19080topIrBFgr8lMTccZ0ueotc1Q00PYgKqJcBBCzA
         oViokqCc4JLay7oKb0FSo7oscJfvHeUXRYLo/s9+TJEs849IHaVfeuD7/yI8XVMhoKxU
         TdWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc;
        bh=XhKRcGFjtpEYNjx5UVxLTFhZAHO2BZKIiT3oO1QLGqI=;
        b=fqavynp0YJoTxFFobv6DmtbjX5yS8+stzBjTFS3/DS3t3jp51n165di07FVv57SR9D
         4aBQIHiCFW7b5gUPlyR/R/WLMUSFGWW4180FkI0kqPPMydDOtw6SVpzqM84ajO9gJK7H
         +JoGjxD7nztRz4fX8CxgI0IkdFuzr438rd3tiz1LUEPlDXt+apxnQQ7x9gzmQdheK9N+
         epXqvLzXOG13k9S48Cn4CMeHWJeyKYPxQnABpR0UN0A/cQ+gRqz/exB80SKCJxFBt4JY
         2qcC5uxpsg+xciqZ/4Luc1neywl2EPrC4aJbrbmyqhV7905XL0A1zaD+UUoffu/PsrlR
         ywXw==
X-Gm-Message-State: ACgBeo1/9+QRfuTh/NS4DT6GkAtK2VIYszvLSfu+//i10XBXbcfnKvtG
	JTXvwZusH9RYHsMug/MT7UY=
X-Google-Smtp-Source: AA6agR7cNE3lKQsKbjnMxacp9GEpVr61OpHZ/yFKv2lqu6VtJUrlB2O5i0A8rWiI3NoMFMwTGX2cSA==
X-Received: by 2002:a17:90b:3ec3:b0:1fa:a293:c511 with SMTP id rm3-20020a17090b3ec300b001faa293c511mr22184708pjb.156.1661836509390;
        Mon, 29 Aug 2022 22:15:09 -0700 (PDT)
Received: from localhost (110-175-65-113.tpgi.com.au. [110.175.65.113])
        by smtp.gmail.com with ESMTPSA id y11-20020a170902d64b00b0017302933b5esm8467519plh.301.2022.08.29.22.15.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Aug 2022 22:15:08 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 30 Aug 2022 15:15:03 +1000
Message-Id: <CMJ3VICKD1CI.SVFJOKYJPKZQ@bobo>
Subject: Re: [PATCH v2] powerpc: Fix irq_soft_mask_set() and
 irq_soft_mask_return() with sanitizer
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Christophe Leroy" <christophe.leroy@csgroup.eu>, "Michael Ellerman"
 <mpe@ellerman.id.au>
X-Mailer: aerc 0.11.0
References: <c0b486e782b6695092dcdb2cd340a3d44c8c266d.1661272738.git.christophe.leroy@csgroup.eu>
In-Reply-To: <c0b486e782b6695092dcdb2cd340a3d44c8c266d.1661272738.git.christophe.leroy@csgroup.eu>
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
Cc: Zhouyi
 Zhou <zhouzhouyi@gmail.com>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed Aug 24, 2022 at 2:39 AM AEST, Christophe Leroy wrote:
> In ppc, compiler based sanitizer will generate instrument instructions
> around statement WRITE_ONCE(local_paca->irq_soft_mask, mask):
>
>    0xc000000000295cb0 <+0>:	addis   r2,r12,774
>    0xc000000000295cb4 <+4>:	addi    r2,r2,16464
>    0xc000000000295cb8 <+8>:	mflr    r0
>    0xc000000000295cbc <+12>:	bl      0xc00000000008bb4c <mcount>
>    0xc000000000295cc0 <+16>:	mflr    r0
>    0xc000000000295cc4 <+20>:	std     r31,-8(r1)
>    0xc000000000295cc8 <+24>:	addi    r3,r13,2354
>    0xc000000000295ccc <+28>:	mr      r31,r13
>    0xc000000000295cd0 <+32>:	std     r0,16(r1)
>    0xc000000000295cd4 <+36>:	stdu    r1,-48(r1)
>    0xc000000000295cd8 <+40>:	bl      0xc000000000609b98 <__asan_store1+8>
>    0xc000000000295cdc <+44>:	nop
>    0xc000000000295ce0 <+48>:	li      r9,1
>    0xc000000000295ce4 <+52>:	stb     r9,2354(r31)
>    0xc000000000295ce8 <+56>:	addi    r1,r1,48
>    0xc000000000295cec <+60>:	ld      r0,16(r1)
>    0xc000000000295cf0 <+64>:	ld      r31,-8(r1)
>    0xc000000000295cf4 <+68>:	mtlr    r0
>
> If there is a context switch before "stb     r9,2354(r31)", r31 may
> not equal to r13, in such case, irq soft mask will not work.
>
> The same problem occurs in irq_soft_mask_return() with
> READ_ONCE(local_paca->irq_soft_mask).

WRITE_ONCE doesn't require address generation to be atomic with the
store so this is a bug without sanitizer too. I have seen gcc put r13
into a nvgpr before.

READ_ONCE maybe could be argued is safe in this case because data
could be stale when you use it anyway, but pointless and risky
in some cases (imagine cpu offline -> store poison value to irq soft
mask.

> This patch partially reverts commit ef5b570d3700 ("powerpc/irq: Don't
> open code irq_soft_mask helpers") with a more modern inline assembly.
>
> Reported-by: Zhouyi Zhou <zhouzhouyi@gmail.com>
> Fixes: ef5b570d3700 ("powerpc/irq: Don't open code irq_soft_mask helpers"=
)
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---
> v2: Use =3Dm constraint for stb instead of m constraint
> ---
>  arch/powerpc/include/asm/hw_irq.h | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
>
> diff --git a/arch/powerpc/include/asm/hw_irq.h b/arch/powerpc/include/asm=
/hw_irq.h
> index 26ede09c521d..815420988ef3 100644
> --- a/arch/powerpc/include/asm/hw_irq.h
> +++ b/arch/powerpc/include/asm/hw_irq.h
> @@ -113,7 +113,11 @@ static inline void __hard_RI_enable(void)
> =20
>  static inline notrace unsigned long irq_soft_mask_return(void)
>  {
> -	return READ_ONCE(local_paca->irq_soft_mask);
> +	unsigned long flags;
> +
> +	asm volatile("lbz%X1 %0,%1" : "=3Dr" (flags) : "m" (local_paca->irq_sof=
t_mask));
> +
> +	return flags;
>  }
> =20
>  /*
> @@ -140,8 +144,7 @@ static inline notrace void irq_soft_mask_set(unsigned=
 long mask)
>  	if (IS_ENABLED(CONFIG_PPC_IRQ_SOFT_MASK_DEBUG))
>  		WARN_ON(mask && !(mask & IRQS_DISABLED));
> =20
> -	WRITE_ONCE(local_paca->irq_soft_mask, mask);
> -	barrier();
> +	asm volatile("stb%X0 %1,%0" : "=3Dm" (local_paca->irq_soft_mask) : "r" =
(mask) : "memory");

This is still slightly concerning to me. Is there any guarantee that the
compiler would not use a different sequence for the address here?

Maybe explicit r13 is required.

Thanks,
Nick
