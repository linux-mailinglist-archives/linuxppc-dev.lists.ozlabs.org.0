Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 91351149577
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 Jan 2020 13:17:56 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 484Zlh6x7LzDqVZ
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 Jan 2020 23:17:52 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 484Zhh2dJdzDqK5
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 25 Jan 2020 23:15:16 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=RTA4AbD4; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 484Zhf2j3Nz9sRs;
 Sat, 25 Jan 2020 23:15:14 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1579954515;
 bh=nB61mmKQ3P/Bh6P9qi8s5DC02swBkMgHUM4/AJusMZ0=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=RTA4AbD4gSDN2H4g+4/4hKN9q4ND6fzXneYsmv0V7O9TwgYfiz4CgSEvYkJiJXGVV
 5yk/MoCHxdaw+5MoNK7ad3IRaDNr9m5/gmdTo/Jeqzg5vnGjFWTJI1TUYPWQVedCUz
 c4aDuHNiy8pv7qjQMH/NbYtNxDHjFL5JZ3SpgM5B4whskGXRCJsFSqHBoW+SrIzb5n
 FnW5MG/CpoiPmR5H8SIJtR4THSKA0cW30US+zJoA4fFKEoo/huJgXj0hh43ZVUmYD/
 g/LZXgd1PhHBwYLUMkxJuALzBkCOjS1TxJf8vq+XHnJJhhrNwPI/nHXXyXYszBPZ5u
 53MHQnIy+EQvA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Christophe Leroy <christophe.leroy@c-s.fr>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>
Subject: Re: [PATCH] powerpc/32: Add missing context synchronisation with
 CONFIG_VMAP_STACK
In-Reply-To: <872477f7c7552d3bb7baf0b302398fcd42c5fcfd.1579885334.git.christophe.leroy@c-s.fr>
References: <872477f7c7552d3bb7baf0b302398fcd42c5fcfd.1579885334.git.christophe.leroy@c-s.fr>
Date: Sat, 25 Jan 2020 23:15:13 +1100
Message-ID: <87r1znhgvi.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy <christophe.leroy@c-s.fr> writes:
> After reactivation of data translation by modifying MSR[DR], a isync
> is required to ensure the translation is effective.
>
> Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
> ---
> Rebased on powerpc/merge-test
>
> @mpe: If not too late:
> - change to head_32.h should be squashed into "powerpc/32: prepare for CONFIG_VMAP_STACK"
> - change to head_32.S should be squashed into "powerpc/32s: Enable CONFIG_VMAP_STACK"
>
> Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
> ---
>  arch/powerpc/kernel/head_32.S | 1 +
>  arch/powerpc/kernel/head_32.h | 2 ++
>  2 files changed, 3 insertions(+)
>
> diff --git a/arch/powerpc/kernel/head_32.h b/arch/powerpc/kernel/head_32.h
> index 73a035b40dbf..a6a5fbbf8504 100644
> --- a/arch/powerpc/kernel/head_32.h
> +++ b/arch/powerpc/kernel/head_32.h
> @@ -43,6 +43,7 @@
>  	.ifeq	\for_rtas
>  	li	r11, MSR_KERNEL & ~(MSR_IR | MSR_RI) /* can take DTLB miss */
>  	mtmsr	r11
> +	isync

Actually this one leads to:

  /home/michael/linux/arch/powerpc/kernel/head_8xx.S: Assembler messages:
  /home/michael/linux/arch/powerpc/kernel/head_8xx.S:151: Error: attempt to move .org backwards
  make[3]: *** [/home/michael/linux/scripts/Makefile.build:348: arch/powerpc/kernel/head_8xx.o] Error 1

For mpc885_ads_defconfig.

That's the alignment exception overflowing into the program check
handler:

/* Alignment exception */
	. = 0x600
Alignment:
	EXCEPTION_PROLOG handle_dar_dsisr=1
	save_dar_dsisr_on_stack r4, r5, r11
	li	r6, RPN_PATTERN
	mtspr	SPRN_DAR, r6	/* Tag DAR, to be used in DTLB Error */
	addi	r3,r1,STACK_FRAME_OVERHEAD
	EXC_XFER_STD(0x600, alignment_exception)

/* Program check exception */
	EXCEPTION(0x700, ProgramCheck, program_check_exception, EXC_XFER_STD)


Can't see an obvious/easy way to fix it.

cheers

>  	.endif
>  	subi	r11, r1, INT_FRAME_SIZE		/* use r1 if kernel */
>  #else
