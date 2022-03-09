Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1075B4D3965
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Mar 2022 20:02:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KDM5c6bH8z3bc4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Mar 2022 06:02:44 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=padBPJSw;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1;
 helo=dfw.source.kernel.org; envelope-from=nathan@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=padBPJSw; 
 dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KDM4y13qGz30hj
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Mar 2022 06:02:09 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 592A4617CF;
 Wed,  9 Mar 2022 19:02:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B078C340E8;
 Wed,  9 Mar 2022 19:02:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646852526;
 bh=AcspJPuA9dNvJicZK/m3TDHAU3/5ThUWIdTSCDAT74c=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=padBPJSwctZLSS5FlBkT17NAXaJT6Jme+aHd6O9qpHWjAaoXMOfsrF1s4MlXpCilJ
 g01VVX3j2ShVXz6lWLD+AdKeHafB58+XgrqzN/jFfLBO0N0Ve46+4FIlxlJ38xqe+X
 zPh7SlnB3e1bfqDey4YXVAUjy3VKs+NuMLQ/KNnE796RIY9oRhO19jL2d0oK2TxIAN
 bqOadgOZCAI0rIKOK4oVOyKjmXvvZTMFpSnmcNhguGyYA9zYB3zwAeTTRrqC97AgMm
 zN8iUX7QMCce5auwQTv8tu398rvPbjZftWkwj90zSuo6cGNMQ8/5Kf8MD4sh3ETXVQ
 mZDbmdqKFog6g==
Date: Wed, 9 Mar 2022 12:01:59 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Fangrui Song <maskray@google.com>
Subject: Re: [PATCH] powerpc: Replace ppc64 DT_RELACOUNT usage with
 DT_RELASZ/24
Message-ID: <Yij5p+TanPYnUM5V@dev-arch.thelio-3990X>
References: <20220309055118.1551013-1-maskray@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220309055118.1551013-1-maskray@google.com>
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>, llvm@lists.linux.dev,
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Mar 08, 2022 at 09:51:18PM -0800, Fangrui Song wrote:
> DT_RELACOUNT is an ELF dynamic tag inherited from SunOS indicating the
> number of R_*_RELATIVE relocations. It is optional but {ld.lld,ld.lld}

                                                         ^ ld.{bfd,lld} ?

> -z combreloc always creates it (if non-zero) to slightly speed up glibc
> ld.so relocation resolving by avoiding R_*R_PPC64_RELATIVE type
> comparison. The tag is otherwise nearly unused in the wild and I'd
> recommend that software avoids using it.
> 
> lld>=14.0.0 (since commit da0e5b885b25cf4ded0fa89b965dc6979ac02ca9)
> underestimates DT_RELACOUNT for ppc64 when position-independent long
> branch thunks are used. Correcting it needs non-trivial arch-specific
> complexity which I'd prefer to avoid. Since our code always compares the
> relocation type with R_PPC64_RELATIVE, replacing every occurrence of
> DT_RELACOUNT with DT_RELASZ/sizeof(Elf64_Rela)=DT_RELASZ/24 is a correct
> alternative.
> 
> DT_RELASZ is in practice bounded by an uint32_t. Dividing x by 24 can be
> implemented as (uint32_t)(x*0xaaaaaaab) >> 4.
> 
> Link: https://github.com/ClangBuiltLinux/linux/issues/1581
> Reported-by: Nathan Chancellor <nathan@kernel.org>
> Signed-off-by: Fangrui Song <maskray@google.com>

Thank you a lot for the fix! I tested this with several different
configurations with tip of tree LLVM and they all booted in QEMU. I also
tested one configuration with GCC 5.4 (we support GCC 5.x as a minimum)
and it booted as well.

Tested-by: Nathan Chancellor <nathan@kernel.org>

> ---
>  arch/powerpc/boot/crt0.S       | 28 +++++++++++++++++-----------
>  arch/powerpc/kernel/reloc_64.S | 15 +++++++++------
>  2 files changed, 26 insertions(+), 17 deletions(-)
> 
> diff --git a/arch/powerpc/boot/crt0.S b/arch/powerpc/boot/crt0.S
> index feadee18e271..1c96ebe7ef1a 100644
> --- a/arch/powerpc/boot/crt0.S
> +++ b/arch/powerpc/boot/crt0.S
> @@ -8,7 +8,7 @@
>  #include "ppc_asm.h"
>  
>  RELA = 7
> -RELACOUNT = 0x6ffffff9
> +RELASZ = 8
>  
>  	.data
>  	/* A procedure descriptor used when booting this as a COFF file.
> @@ -65,7 +65,7 @@ p_base:	mflr	r10		/* r10 now points to runtime addr of p_base */
>  	subf	r11,r11,r12	/* runtime - linktime offset */
>  
>  	/* The dynamic section contains a series of tagged entries.
> -	 * We need the RELA and RELACOUNT entries. */
> +	 * We need the RELA and RELASZ entries. */
>  	li	r9,0
>  	li	r0,0
>  9:	lwz	r8,0(r12)	/* get tag */
> @@ -75,18 +75,21 @@ p_base:	mflr	r10		/* r10 now points to runtime addr of p_base */
>  	bne	11f
>  	lwz	r9,4(r12)	/* get RELA pointer in r9 */
>  	b	12f
> -11:	addis	r8,r8,(-RELACOUNT)@ha
> -	cmpwi	r8,RELACOUNT@l
> +11:	cmpwi	r8,RELASZ
>  	bne	12f
> -	lwz	r0,4(r12)	/* get RELACOUNT value in r0 */
> +	lwz	r0,4(r12)	/* get RELASZ / 24 in r0 */
> +	lis     r8,0xaaaa
> +	ori     r8,r8,0xaaab
> +	mulhwu  r0,r0,r8
> +	srwi    r0,r0,4
>  12:	addi	r12,r12,8
>  	b	9b
>  
>  	/* The relocation section contains a list of relocations.
>  	 * We now do the R_PPC_RELATIVE ones, which point to words
>  	 * which need to be initialized with addend + offset.
> -	 * The R_PPC_RELATIVE ones come first and there are RELACOUNT
> -	 * of them. */
> +	 * The R_PPC_RELATIVE ones come first and there are at most
> +         * RELASZ/24 of them. */
>  10:	/* skip relocation if we don't have both */
>  	cmpwi	r0,0
>  	beq	3f
> @@ -160,14 +163,17 @@ p_base:	mflr	r10		/* r10 now points to runtime addr of p_base */
>  	bne	10f
>  	ld	r13,8(r11)       /* get RELA pointer in r13 */
>  	b	11f
> -10:	addis	r12,r12,(-RELACOUNT)@ha
> -	cmpdi	r12,RELACOUNT@l
> +10:	cmpdi	r12,RELASZ
>  	bne	11f
> -	ld	r8,8(r11)       /* get RELACOUNT value in r8 */
> +	ld	r8,8(r11)       /* get RELASZ / 24 in r8 */
> +	lis     r0,0xaaaa
> +	ori     r0,r0,0xaaab
> +	mulhwu  r8,r8,r0
> +	srwi    r8,r8,4
>  11:	addi	r11,r11,16
>  	b	9b
>  12:
> -	cmpdi	r13,0            /* check we have both RELA and RELACOUNT */
> +	cmpdi	r13,0            /* check we have both RELA and RELASZ */
>  	cmpdi	cr1,r8,0
>  	beq	3f
>  	beq	cr1,3f
> diff --git a/arch/powerpc/kernel/reloc_64.S b/arch/powerpc/kernel/reloc_64.S
> index 02d4719bf43a..362be759609f 100644
> --- a/arch/powerpc/kernel/reloc_64.S
> +++ b/arch/powerpc/kernel/reloc_64.S
> @@ -8,7 +8,7 @@
>  #include <asm/ppc_asm.h>
>  
>  RELA = 7
> -RELACOUNT = 0x6ffffff9
> +RELASZ = 8
>  R_PPC64_RELATIVE = 22
>  
>  /*
> @@ -27,7 +27,7 @@ _GLOBAL(relocate)
>  	add	r10,r10,r12	/* r10 has runtime addr of _stext */
>  
>  	/*
> -	 * Scan the dynamic section for the RELA and RELACOUNT entries.
> +	 * Scan the dynamic section for the RELA and RELASZ entries.
>  	 */
>  	li	r7,0
>  	li	r8,0
> @@ -38,13 +38,16 @@ _GLOBAL(relocate)
>  	bne	2f
>  	ld	r7,8(r11)	/* get RELA pointer in r7 */
>  	b	3f
> -2:	addis	r6,r6,(-RELACOUNT)@ha
> -	cmpdi	r6,RELACOUNT@l
> +2:	cmpdi	r6,RELASZ
>  	bne	3f
> -	ld	r8,8(r11)	/* get RELACOUNT value in r8 */
> +	ld	r8,8(r11)	/* get RELA / 24 in r8 */
> +	lis     r0,0xaaaa
> +	ori     r0,r0,0xaaab
> +	mulhwu  r8,r8,r0
> +	srwi    r8,r8,4
>  3:	addi	r11,r11,16
>  	b	1b
> -4:	cmpdi	r7,0		/* check we have both RELA and RELACOUNT */
> +4:	cmpdi	r7,0		/* check we have both RELA and RELASZ */
>  	cmpdi	cr1,r8,0
>  	beq	6f
>  	beq	cr1,6f
> -- 
> 2.35.1.616.g0bdcbb4464-goog
> 
