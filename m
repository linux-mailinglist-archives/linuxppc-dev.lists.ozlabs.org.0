Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A21B74F546E
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Apr 2022 06:59:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KYC473c1tz2x9F
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Apr 2022 14:59:51 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=iram.es header.i=@iram.es header.a=rsa-sha256 header.s=DKIM header.b=Jqc7dBJQ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=iram.es
 (client-ip=130.206.19.181; helo=mx02.puc.rediris.es;
 envelope-from=paubert@iram.es; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=iram.es header.i=@iram.es header.a=rsa-sha256
 header.s=DKIM header.b=Jqc7dBJQ; dkim-atps=neutral
Received: from mx02.puc.rediris.es (outbound6sev.lav.puc.rediris.es
 [130.206.19.181])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KYC3P3mH0z2xKK
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 Apr 2022 14:59:10 +1000 (AEST)
Received: from mta-out02.sim.rediris.es (mta-out02.sim.rediris.es
 [130.206.24.44])
 by mx02.puc.rediris.es  with ESMTP id 2364wOJZ016331-2364wOJb016331
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Wed, 6 Apr 2022 06:58:24 +0200
Received: from mta-out02.sim.rediris.es (localhost.localdomain [127.0.0.1])
 by mta-out02.sim.rediris.es (Postfix) with ESMTPS id 73FC8C15F93;
 Wed,  6 Apr 2022 06:58:23 +0200 (CEST)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by mta-out02.sim.rediris.es (Postfix) with ESMTP id E633EC15F94;
 Wed,  6 Apr 2022 06:58:22 +0200 (CEST)
X-Amavis-Modified: Mail body modified (using disclaimer) -
 mta-out02.sim.rediris.es
Received: from mta-out02.sim.rediris.es ([127.0.0.1])
 by localhost (mta-out02.sim.rediris.es [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id Yq8Lz7YkYewq; Wed,  6 Apr 2022 06:58:22 +0200 (CEST)
Received: from lt-gp.iram.es (haproxy02.sim.rediris.es [130.206.24.70])
 by mta-out02.sim.rediris.es (Postfix) with ESMTPA id 4F869C15F93;
 Wed,  6 Apr 2022 06:58:19 +0200 (CEST)
Date: Wed, 6 Apr 2022 06:58:15 +0200
From: Gabriel Paubert <paubert@iram.es>
To: Alexey Kardashevskiy <aik@ozlabs.ru>
Subject: Re: [PATCH kernel v2] powerpc/boot: Stop using RELACOUNT
Message-ID: <Yk0d54t8MPn3ocrO@lt-gp.iram.es>
References: <20220406040148.3608400-1-aik@ozlabs.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220406040148.3608400-1-aik@ozlabs.ru>
X-FE-Policy-ID: 23:8:0:SYSTEM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; d=iram.es; s=DKIM;
 c=relaxed/relaxed; 
 h=date:from:to:cc:subject:message-id:references:mime-version:content-type;
 bh=iWLqBKm0QxOTSuxivAHOgQWWkkPWqas6w3uyIKhAa28=;
 b=Jqc7dBJQbhcx4JS7THPEOkmV2hwtcCyR+OHlDv/w6Q0DRK0Wa+XFNrMdHYDrqfQRvIMvnoSeY0WO
 W/q8ntnajzYC9L4XYDXzQ8F+g93j06wGODR6tjgpnl4Vfilq/OGzih6YNIIuuaqr8DXEm/Wbvn+m
 7u3dSMvwi6vuJBCCzbtbaR5HGr/szqS0S+KDBGTxf/mHaXaVLkVHay/MCjgMQayMpYuax258jwvE
 /5lntfRvFtcdUB+86A8pS+IDEWXrjPkgOHU1EWmccFuuKc+T3laRwBHJ20J4RGfkNMKsfUzm67Qd
 1VHyUwXm8NGvEAQORXG9Y4ZSMrfDGv9fXmwEYQ==
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
Cc: Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, llvm@lists.linux.dev,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Apr 06, 2022 at 02:01:48PM +1000, Alexey Kardashevskiy wrote:
> So far the RELACOUNT tag from the ELF header was containing the exact
> number of R_PPC_RELATIVE/R_PPC64_RELATIVE relocations. However the LLVM's
> recent change [1] make it equal-or-less than the actual number which
> makes it useless.
> 
> This replaces RELACOUNT in zImage loader with a pair of RELASZ and RELAENT.
> The vmlinux relocation code is fixed in commit d79976918852
> ("powerpc/64: Add UADDR64 relocation support").
> 
> To make it more future proof, this walks through the entire .rela.dyn
> section instead of assuming that the section is sorter by a relocation
> type. Unlike d79976918852, this does not add unaligned UADDR/UADDR64
> relocations as we are likely not to see those in practice - the zImage
> is small and very arch specific so there is a smaller chance that some
> generic feature (such as PRINK_INDEX) triggers unaligned relocations.
> 
> [1] https://github.com/llvm/llvm-project/commit/da0e5b885b25cf4
> Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
> ---
> Changes:
> v2:
> * s/divd/divwu/ for ppc32
> * updated the commit log
> * named all new labels instead of numbering them
> (s/101f/.Lcheck_for_relaent/ and so on)
> ---
>  arch/powerpc/boot/crt0.S | 45 ++++++++++++++++++++++++++--------------
>  1 file changed, 29 insertions(+), 16 deletions(-)
> 
> diff --git a/arch/powerpc/boot/crt0.S b/arch/powerpc/boot/crt0.S
> index feadee18e271..e9306d862f8d 100644
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
> @@ -75,34 +76,39 @@ p_base:	mflr	r10		/* r10 now points to runtime addr of p_base */
>  	bne	11f
>  	lwz	r9,4(r12)	/* get RELA pointer in r9 */
>  	b	12f
> -11:	addis	r8,r8,(-RELACOUNT)@ha
> -	cmpwi	r8,RELACOUNT@l
> +11:	cmpwi	r8,RELASZ
> +	bne	.Lcheck_for_relaent
> +	lwz	r0,4(r12)       /* get RELASZ value in r0 */
> +	b	12f
> +.Lcheck_for_relaent:
> +	cmpwi	r8,RELAENT
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
> +	divwu   r0,r0,r14       /* RELASZ / RELAENT */
>  	mtctr	r0
>  2:	lbz	r0,4+3(r9)	/* ELF32_R_INFO(reloc->r_info) */
>  	cmpwi	r0,22		/* R_PPC_RELATIVE */
> -	bne	3f
> +	bne	.Lnext
>  	lwz	r12,0(r9)	/* reloc->r_offset */
>  	lwz	r0,8(r9)	/* reloc->r_addend */
>  	add	r0,r0,r11
>  	stwx	r0,r11,r12
> -	addi	r9,r9,12
> +.Lnext:	add	r9,r9,r14
>  	bdnz	2b
>  
>  	/* Do a cache flush for our text, in case the loader didn't */
> @@ -160,32 +166,39 @@ p_base:	mflr	r10		/* r10 now points to runtime addr of p_base */
>  	bne	10f
>  	ld	r13,8(r11)       /* get RELA pointer in r13 */
>  	b	11f
> -10:	addis	r12,r12,(-RELACOUNT)@ha
> -	cmpdi	r12,RELACOUNT@l
> -	bne	11f
> -	ld	r8,8(r11)       /* get RELACOUNT value in r8 */
> +10:	cmpwi   r12,RELASZ
> +	bne	.Lcheck_for_relaent
> +	lwz	r8,8(r11)	/* get RELASZ pointer in r8 */
> +	b	11f
> +.Lcheck_for_relaent:
> +	cmpwi	r12,RELAENT
> +	bne     11f
> +	lwz     r14,8(r11)      /* get RELAENT pointer in r14 */
>  11:	addi	r11,r11,16
>  	b	9b
>  12:
> -	cmpdi	r13,0            /* check we have both RELA and RELACOUNT */
> +	cmpdi	r13,0            /* check we have both RELA, RELASZ, RELAENT*/
>  	cmpdi	cr1,r8,0
>  	beq	3f
>  	beq	cr1,3f
> +	cmpdi	r14,0
> +	beq	3f
>  
>  	/* Calcuate the runtime offset. */
>  	subf	r13,r13,r9
>  
>  	/* Run through the list of relocations and process the
>  	 * R_PPC64_RELATIVE ones. */
> +	divd    r8,r8,r14       /* RELASZ / RELAENT */

While you are at it, this one should also be divdu.

I really wished IBM had used explicit signed/unsigned indication in the
mnemonics (divds, divdu, divws, divwu) instead. Fortunately very little
assemby code uses these instructions nowadays.


>  	mtctr	r8
>  13:	ld	r0,8(r9)        /* ELF64_R_TYPE(reloc->r_info) */
>  	cmpdi	r0,22           /* R_PPC64_RELATIVE */
> -	bne	3f
> +	bne	.Lnext
>  	ld	r12,0(r9)        /* reloc->r_offset */
>  	ld	r0,16(r9)       /* reloc->r_addend */
>  	add	r0,r0,r13
>  	stdx	r0,r13,r12
> -	addi	r9,r9,24
> +.Lnext:	add	r9,r9,r14
>  	bdnz	13b
>  
>  	/* Do a cache flush for our text, in case the loader didn't */
> -- 
> 2.30.2

	Cheers,
	Gabriel
 

