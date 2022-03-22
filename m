Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 836064E3678
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Mar 2022 03:13:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KMw4g2gKDz305T
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Mar 2022 13:13:07 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=eqkqGeOn;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KMw4302XNz2xDv
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Mar 2022 13:12:35 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=eqkqGeOn; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4KMw406J8Zz4xRB;
 Tue, 22 Mar 2022 13:12:32 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1647915153;
 bh=VrsAZ8mvV1uh7ywmcB2hdmMWnciPkfES8N/XT7t7kMQ=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=eqkqGeOn1ZV1YgDZItMqoc+7LCX0LVGor0zckN5iVCGzm5wv9znmcBXBCkPK4m3Q9
 jYSZAvPSfBdCvuOKYAG+rxpqgGPaKq63rAf3ZJva6R+zLHgocd5e2g9/i8xEDwhLfQ
 mHW4+XKTjtKvQlDjoVH2FYamvkDez8Uflj29Bd3yin8lrR4Qzp9cXNO57jSmBdH5qw
 TjcRV4gBzxWyuT2vNx4CrW+w/IL3JKO1EFH2UPRlJPNTAWqhzxUI82D/ddVOwBxu1c
 NJ5fqaxRmhXWhZS66E2bNPj1FN0uenlScnoFKINxoornwkWYUPgDX99PV+BuOOcQ2h
 jYE/pjj+WJRTA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Alexey Kardashevskiy <aik@ozlabs.ru>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH kernel] powerpc/boot: Stop using RELACOUNT
In-Reply-To: <20220321071026.918262-1-aik@ozlabs.ru>
References: <20220321071026.918262-1-aik@ozlabs.ru>
Date: Tue, 22 Mar 2022 13:12:27 +1100
Message-ID: <87fsnahh10.fsf@mpe.ellerman.id.au>
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>, Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Fangrui Song <maskray@google.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Alexey Kardashevskiy <aik@ozlabs.ru> writes:
> So far the RELACOUNT tag from the ELF header was containing the exact
> number of R_PPC_RELATIVE/R_PPC64_RELATIVE relocations. However the LLVM's
> recent change [1] make it equal-or-less than the actual number which
> makes it useless.
>
> This replaces RELACOUNT in zImage loader with a pair of RELASZ and RELAENT.
> The vmlinux relocation code is fixed in [2].

That's committed so you can say:
  in commit d79976918852 ("powerpc/64: Add UADDR64 relocation support")

> To make it more future proof, this walks through the entire .rela.dyn
> section instead of assuming that the section is sorter by a relocation
> type. Unlike [1], this does not add unaligned UADDR/UADDR64 relocations
                ^
                that should be 2?

> as in hardly possible to see those in arch-specific zImage.

I don't quite parse that. Is it true we can never see them in zImage?
Maybe it's true that we don't see them in practice.

> [1] https://github.com/llvm/llvm-project/commit/da0e5b885b25cf4
> [2] https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git/commit/?h=next&id=d799769188529a
> Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
> ---
>  arch/powerpc/boot/crt0.S | 43 +++++++++++++++++++++++++---------------
>  1 file changed, 27 insertions(+), 16 deletions(-)
>
> diff --git a/arch/powerpc/boot/crt0.S b/arch/powerpc/boot/crt0.S
> index feadee18e271..6ea3417da3b7 100644
> --- a/arch/powerpc/boot/crt0.S
> +++ b/arch/powerpc/boot/crt0.S
> @@ -8,7 +8,8 @@
>  #include "ppc_asm.h"
>  
>  RELA = 7
> -RELACOUNT = 0x6ffffff9
> +RELASZ = 8
> +RELAENT = 9
>  
>  	.data
>  	/* A procedure descriptor used when booting this as a COFF file.
> @@ -75,34 +76,38 @@ p_base:	mflr	r10		/* r10 now points to runtime addr of p_base */
>  	bne	11f
>  	lwz	r9,4(r12)	/* get RELA pointer in r9 */
>  	b	12f
> -11:	addis	r8,r8,(-RELACOUNT)@ha
> -	cmpwi	r8,RELACOUNT@l
> +11:	cmpwi	r8,RELASZ
> +	bne	111f
> +	lwz	r0,4(r12)       /* get RELASZ value in r0 */
> +	b	12f
> +111:	cmpwi	r8,RELAENT

Can you use named local labels for new labels you introduce?

This could be .Lcheck_for_relaent: perhaps.

>  	bne	12f
> -	lwz	r0,4(r12)	/* get RELACOUNT value in r0 */
> +	lwz     r14,4(r12)      /* get RELAENT value in r14 */
>  12:	addi	r12,r12,8
>  	b	9b
>  
>  	/* The relocation section contains a list of relocations.
>  	 * We now do the R_PPC_RELATIVE ones, which point to words
> -	 * which need to be initialized with addend + offset.
> -	 * The R_PPC_RELATIVE ones come first and there are RELACOUNT
> -	 * of them. */
> +	 * which need to be initialized with addend + offset */
>  10:	/* skip relocation if we don't have both */
>  	cmpwi	r0,0
>  	beq	3f
>  	cmpwi	r9,0
>  	beq	3f
> +	cmpwi	r14,0
> +	beq	3f
>  
>  	add	r9,r9,r11	/* Relocate RELA pointer */
> +	divd    r0,r0,r14       /* RELASZ / RELAENT */

This is in the 32-bit portion isn't it. AFAIK 32-bit CPUs don't
implement divd. I'm not sure why the toolchain allowed it. I would
expect it to trap if run on real 32-bit hardware.

>  	mtctr	r0
>  2:	lbz	r0,4+3(r9)	/* ELF32_R_INFO(reloc->r_info) */
>  	cmpwi	r0,22		/* R_PPC_RELATIVE */
> -	bne	3f
> +	bne	22f
>  	lwz	r12,0(r9)	/* reloc->r_offset */
>  	lwz	r0,8(r9)	/* reloc->r_addend */
>  	add	r0,r0,r11
>  	stwx	r0,r11,r12
> -	addi	r9,r9,12
> +22:	add	r9,r9,r14
>  	bdnz	2b
>  
>  	/* Do a cache flush for our text, in case the loader didn't */

cheers
