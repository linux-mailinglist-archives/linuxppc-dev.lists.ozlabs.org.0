Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 714095B5914
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Sep 2022 13:15:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MR3sq2cf3z3bmK
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Sep 2022 21:15:11 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=dac9jZ5i;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62c; helo=mail-pl1-x62c.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=dac9jZ5i;
	dkim-atps=neutral
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MR3s93jxgz2xD3
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Sep 2022 21:14:35 +1000 (AEST)
Received: by mail-pl1-x62c.google.com with SMTP id f24so8264880plr.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Sep 2022 04:14:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:references:from:subject:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date;
        bh=5H2PCof2W0n7UvJX8U+/wPydBNt1XrqbTPf9MeQOa9g=;
        b=dac9jZ5iubfsXYhi9m2iuGqKl8bFQ6o3noh+5ldnm19axL4kbcfNAO2VwSWY2MHbwR
         9BfLMaSBaSY8VXf7eKK9t0EBMaN8czy6ez+Qb2pqX+Xkz24c2foDBcOWES2s8CTtmjuJ
         n4CPgzT+WILL9zg73OPTJw0lTWQ63HAQF+wUWSWnEXU8THAM+1vjKfbq40fgYOq+qgRD
         RGd1EgmOiBaUlp6h1txIrEtCD91/DJgjbBm9aeKZaw0FtC0Dpx2Stt0N0R4J/9tKqEIs
         gxE8ZTFVvYeqdgmglsakSkaRcVLrHpkfrF4N6GTAxl6uOS3Quk47Q4oB50RNdRXqWFvm
         iYLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:references:from:subject:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date;
        bh=5H2PCof2W0n7UvJX8U+/wPydBNt1XrqbTPf9MeQOa9g=;
        b=dZILQo0sX9FwFNfVAdyK9ciO1LU6lDhG3lsfBNv16IXqshVD/jdEzII/9uCRIsXXB1
         DNQOqSATH8PWF4AqGh1Q9aIj85QkjY1EYyswK56uXzfsumSLmL8XkL+pXMrE5Z9zNsT3
         7HxxHT0rkI2+doccJX3S8y2AB0lpFfcV85oGXahGuKVn61RiKuHbpgzRVYpHo5vPGgWA
         Jd8Fz+EGY3e6nDS1p0ddx0zFaTNshazr8pqkyxQR+ScDWoTBco+Y04HhvaAojlZzYhdv
         7Im2ptmrvp2UdbtWU+Rg6i+jesAN4sEWSRnxFnUFP9vEsKUUr1ivIhay21tJvumenQKd
         FDFA==
X-Gm-Message-State: ACgBeo2URhZgol250l6v5RicefJUEjSQHKn5+GPNKr0Oe2cIGn/vfiVv
	f6f2a4s8pY0CGS4aL85JNDfnnoXxHUo=
X-Google-Smtp-Source: AA6agR4PJlsO3jDUF9sSPjh7rel3DB86RfZb+Agk6EZH0PYqCkxqBN2i9PMIXR9tW7Vr28E/Yp306w==
X-Received: by 2002:a17:902:7082:b0:177:f7fc:5290 with SMTP id z2-20020a170902708200b00177f7fc5290mr18694947plk.143.1662981272478;
        Mon, 12 Sep 2022 04:14:32 -0700 (PDT)
Received: from localhost ([118.210.107.131])
        by smtp.gmail.com with ESMTPSA id f4-20020a170902ce8400b0016dc6279ab7sm5717258plg.149.2022.09.12.04.14.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Sep 2022 04:14:31 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 12 Sep 2022 21:14:28 +1000
Message-Id: <CMUDNS3IJ8L1.2PM50DMHILXT2@bobo>
To: "Rohan McLure" <rmclure@linux.ibm.com>, <linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH v4 12/20] Revert "powerpc/syscall: Save r3 in
 regs->orig_r3"
From: "Nicholas Piggin" <npiggin@gmail.com>
X-Mailer: aerc 0.11.0
References: <20220824020548.62625-1-rmclure@linux.ibm.com>
 <20220824020548.62625-13-rmclure@linux.ibm.com>
In-Reply-To: <20220824020548.62625-13-rmclure@linux.ibm.com>
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
> This reverts commit 8875f47b7681aa4e4484a9b612577b044725f839.

Can you use short hash and commit title format? Also it's no longer
just reverting that patch, so maybe just come up with a new title
for this patch and reference the two patches here?

Reviewed-by: Nicholas Piggin <npiggin@gmail.com>

Oh, I meant to say for the last patch and this one. Can you move
them to after patch 13? That way all your build and wrapper mucking
are in the first patches, and then all the zeroizing comes next.

Thanks,
Nick

>
> Save caller's original r3 state to the kernel stackframe before entering
> system_call_exception. This allows for user registers to be cleared by
> the time system_call_exception is entered, reducing the influence of
> user registers on speculation within the kernel.
>
> Prior to this commit, orig_r3 was saved at the beginning of
> system_call_exception. Instead, save orig_r3 while the user value is
> still live in r3.
>
> Also replicate this early save in 32-bit. A similar save was removed in
> commit 6f76a01173cc ("powerpc/syscall: implement system call entry/exit l=
ogic in C for PPC32")
> when 32-bit adopted system_call_exception. Revert its removal of orig_r3
> saves.
>
> Signed-off-by: Rohan McLure <rmclure@linux.ibm.com>
> ---
> V2 -> V3: New commit.
> ---
>  arch/powerpc/kernel/entry_32.S     | 1 +
>  arch/powerpc/kernel/interrupt_64.S | 2 ++
>  arch/powerpc/kernel/syscall.c      | 1 -
>  3 files changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/arch/powerpc/kernel/entry_32.S b/arch/powerpc/kernel/entry_3=
2.S
> index 1d599df6f169..44dfce9a60c5 100644
> --- a/arch/powerpc/kernel/entry_32.S
> +++ b/arch/powerpc/kernel/entry_32.S
> @@ -101,6 +101,7 @@ __kuep_unlock:
> =20
>  	.globl	transfer_to_syscall
>  transfer_to_syscall:
> +	stw	r3, ORIG_GPR3(r1)
>  	stw	r11, GPR1(r1)
>  	stw	r11, 0(r1)
>  	mflr	r12
> diff --git a/arch/powerpc/kernel/interrupt_64.S b/arch/powerpc/kernel/int=
errupt_64.S
> index ce25b28cf418..71d2d9497283 100644
> --- a/arch/powerpc/kernel/interrupt_64.S
> +++ b/arch/powerpc/kernel/interrupt_64.S
> @@ -91,6 +91,7 @@ _ASM_NOKPROBE_SYMBOL(system_call_vectored_\name)
>  	li	r11,\trapnr
>  	std	r11,_TRAP(r1)
>  	std	r12,_CCR(r1)
> +	std	r3,ORIG_GPR3(r1)
>  	addi	r10,r1,STACK_FRAME_OVERHEAD
>  	ld	r11,exception_marker@toc(r2)
>  	std	r11,-16(r10)		/* "regshere" marker */
> @@ -275,6 +276,7 @@ END_BTB_FLUSH_SECTION
>  	std	r10,_LINK(r1)
>  	std	r11,_TRAP(r1)
>  	std	r12,_CCR(r1)
> +	std	r3,ORIG_GPR3(r1)
>  	addi	r10,r1,STACK_FRAME_OVERHEAD
>  	ld	r11,exception_marker@toc(r2)
>  	std	r11,-16(r10)		/* "regshere" marker */
> diff --git a/arch/powerpc/kernel/syscall.c b/arch/powerpc/kernel/syscall.=
c
> index 81ace9e8b72b..64102a64fd84 100644
> --- a/arch/powerpc/kernel/syscall.c
> +++ b/arch/powerpc/kernel/syscall.c
> @@ -25,7 +25,6 @@ notrace long system_call_exception(long r3, long r4, lo=
ng r5,
>  	kuap_lock();
> =20
>  	add_random_kstack_offset();
> -	regs->orig_gpr3 =3D r3;
> =20
>  	if (IS_ENABLED(CONFIG_PPC_IRQ_SOFT_MASK_DEBUG))
>  		BUG_ON(irq_soft_mask_return() !=3D IRQS_ALL_DISABLED);
> --=20
> 2.34.1

