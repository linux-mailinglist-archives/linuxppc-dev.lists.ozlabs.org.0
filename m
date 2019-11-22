Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CC6AD105E6C
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Nov 2019 03:00:17 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47K04Z5tF6zDr5d
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Nov 2019 13:00:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47K02c2J6NzDr4D
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Nov 2019 12:58:32 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.b="agj/iPgt"; dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 47K02b4jTMz9sPT;
 Fri, 22 Nov 2019 12:58:31 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1574387911;
 bh=XXXaZCyJ9aCPQ7u4H+s2s92nxTaQyyYfSZ2G27ef8v0=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=agj/iPgtHxO7oSJbxx/yD2TDnyC8uKeT4bh5cJ9RCdB7h+/qMdZmmqezEVSf2PCbt
 2ptOAE4VaHwYTKOYYXDQDcthaIXtVgCkOOlXSaSPxpn0UrUqXV6uIj3AwyemO8Ei2f
 9kcqAmsWQ8LvVDdQKwKAGLjJzPCOO0s1Tj60rQwIZaFrAlTQGDNe6z5ARPw6VTpw+e
 Cp3INkNNl/ssJy+XUrHMJUvGAzPWPZjsOrbZ2t0CuP1d7EeTz8q1fhqTRVdNBjrgEh
 jsGq3EzILYLWfz/LWM5NtW8ZNFmIFFGGP3nqVLJiHzIH/jq53BRziHr64vDU186ClW
 0jTWy8QhR7pqQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Christophe Leroy <christophe.leroy@c-s.fr>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>
Subject: Re: [PATCH v3 4/8] powerpc/vdso32: inline __get_datapage()
In-Reply-To: <9c9fe32df8633e6ba8e670274dc3eef82a1b5a65.1572342582.git.christophe.leroy@c-s.fr>
References: <cover.1572342582.git.christophe.leroy@c-s.fr>
 <9c9fe32df8633e6ba8e670274dc3eef82a1b5a65.1572342582.git.christophe.leroy@c-s.fr>
Date: Fri, 22 Nov 2019 12:58:28 +1100
Message-ID: <874kywbrjv.fsf@mpe.ellerman.id.au>
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
> __get_datapage() is only a few instructions to retrieve the
> address of the page where the kernel stores data to the VDSO.
>
> By inlining this function into its users, a bl/blr pair and
> a mflr/mtlr pair is avoided, plus a few reg moves.
>
> The improvement is noticeable (about 55 nsec/call on an 8xx)
>
> vdsotest before the patch:
> gettimeofday:    vdso: 731 nsec/call
> clock-gettime-realtime-coarse:    vdso: 668 nsec/call
> clock-gettime-monotonic-coarse:    vdso: 745 nsec/call
>
> vdsotest after the patch:
> gettimeofday:    vdso: 677 nsec/call
> clock-gettime-realtime-coarse:    vdso: 613 nsec/call
> clock-gettime-monotonic-coarse:    vdso: 690 nsec/call
>
> Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>

This doesn't build with gcc 4.6.3:

  /linux/arch/powerpc/kernel/vdso32/gettimeofday.S: Assembler messages:
  /linux/arch/powerpc/kernel/vdso32/gettimeofday.S:41: Error: unsupported relocation against __kernel_datapage_offset
  /linux/arch/powerpc/kernel/vdso32/gettimeofday.S:86: Error: unsupported relocation against __kernel_datapage_offset
  /linux/arch/powerpc/kernel/vdso32/gettimeofday.S:213: Error: unsupported relocation against __kernel_datapage_offset
  /linux/arch/powerpc/kernel/vdso32/gettimeofday.S:247: Error: unsupported relocation against __kernel_datapage_offset
  make[4]: *** [arch/powerpc/kernel/vdso32/gettimeofday.o] Error 1

https://travis-ci.org/linuxppc/linux/jobs/614904530


cheers

> ---
> v3: define get_datapage macro in asm/vdso_datapage.h
> ---
>  arch/powerpc/include/asm/vdso_datapage.h  | 10 ++++++++++
>  arch/powerpc/kernel/vdso32/cacheflush.S   |  9 ++++-----
>  arch/powerpc/kernel/vdso32/datapage.S     | 28 +++-------------------------
>  arch/powerpc/kernel/vdso32/gettimeofday.S | 12 +++++-------
>  4 files changed, 22 insertions(+), 37 deletions(-)
>
> diff --git a/arch/powerpc/include/asm/vdso_datapage.h b/arch/powerpc/include/asm/vdso_datapage.h
> index 2ccb938d8544..da3d2de817f6 100644
> --- a/arch/powerpc/include/asm/vdso_datapage.h
> +++ b/arch/powerpc/include/asm/vdso_datapage.h
> @@ -116,6 +116,16 @@ struct vdso_data {
>  
>  extern struct vdso_data *vdso_data;
>  
> +#else /* __ASSEMBLY__ */
> +
> +.macro get_datapage ptr, tmp
> +	bcl	20, 31, .+4
> +	mflr	\ptr
> +	addi	\ptr, \ptr, __kernel_datapage_offset - (.-4)
> +	lwz	\tmp, 0(\ptr)
> +	add	\ptr, \tmp, \ptr
> +.endm
> +
>  #endif /* __ASSEMBLY__ */
>  
>  #endif /* __KERNEL__ */
> diff --git a/arch/powerpc/kernel/vdso32/cacheflush.S b/arch/powerpc/kernel/vdso32/cacheflush.S
> index 7f882e7b9f43..d178ec8c279d 100644
> --- a/arch/powerpc/kernel/vdso32/cacheflush.S
> +++ b/arch/powerpc/kernel/vdso32/cacheflush.S
> @@ -8,6 +8,7 @@
>  #include <asm/processor.h>
>  #include <asm/ppc_asm.h>
>  #include <asm/vdso.h>
> +#include <asm/vdso_datapage.h>
>  #include <asm/asm-offsets.h>
>  
>  	.text
> @@ -24,14 +25,12 @@ V_FUNCTION_BEGIN(__kernel_sync_dicache)
>    .cfi_startproc
>  	mflr	r12
>    .cfi_register lr,r12
> -	mr	r11,r3
> -	bl	__get_datapage@local
> +	get_datapage	r10, r0
>  	mtlr	r12
> -	mr	r10,r3
>  
>  	lwz	r7,CFG_DCACHE_BLOCKSZ(r10)
>  	addi	r5,r7,-1
> -	andc	r6,r11,r5		/* round low to line bdy */
> +	andc	r6,r3,r5		/* round low to line bdy */
>  	subf	r8,r6,r4		/* compute length */
>  	add	r8,r8,r5		/* ensure we get enough */
>  	lwz	r9,CFG_DCACHE_LOGBLOCKSZ(r10)
> @@ -48,7 +47,7 @@ V_FUNCTION_BEGIN(__kernel_sync_dicache)
>  
>  	lwz	r7,CFG_ICACHE_BLOCKSZ(r10)
>  	addi	r5,r7,-1
> -	andc	r6,r11,r5		/* round low to line bdy */
> +	andc	r6,r3,r5		/* round low to line bdy */
>  	subf	r8,r6,r4		/* compute length */
>  	add	r8,r8,r5
>  	lwz	r9,CFG_ICACHE_LOGBLOCKSZ(r10)
> diff --git a/arch/powerpc/kernel/vdso32/datapage.S b/arch/powerpc/kernel/vdso32/datapage.S
> index 6c7401bd284e..1095d818f94a 100644
> --- a/arch/powerpc/kernel/vdso32/datapage.S
> +++ b/arch/powerpc/kernel/vdso32/datapage.S
> @@ -10,35 +10,13 @@
>  #include <asm/asm-offsets.h>
>  #include <asm/unistd.h>
>  #include <asm/vdso.h>
> +#include <asm/vdso_datapage.h>
>  
>  	.text
>  	.global	__kernel_datapage_offset;
>  __kernel_datapage_offset:
>  	.long	0
>  
> -V_FUNCTION_BEGIN(__get_datapage)
> -  .cfi_startproc
> -	/* We don't want that exposed or overridable as we want other objects
> -	 * to be able to bl directly to here
> -	 */
> -	.protected __get_datapage
> -	.hidden __get_datapage
> -
> -	mflr	r0
> -  .cfi_register lr,r0
> -
> -	bcl	20,31,data_page_branch
> -data_page_branch:
> -	mflr	r3
> -	mtlr	r0
> -	addi	r3, r3, __kernel_datapage_offset-data_page_branch
> -	lwz	r0,0(r3)
> -  .cfi_restore lr
> -	add	r3,r0,r3
> -	blr
> -  .cfi_endproc
> -V_FUNCTION_END(__get_datapage)
> -
>  /*
>   * void *__kernel_get_syscall_map(unsigned int *syscall_count) ;
>   *
> @@ -53,7 +31,7 @@ V_FUNCTION_BEGIN(__kernel_get_syscall_map)
>  	mflr	r12
>    .cfi_register lr,r12
>  	mr	r4,r3
> -	bl	__get_datapage@local
> +	get_datapage	r3, r0
>  	mtlr	r12
>  	addi	r3,r3,CFG_SYSCALL_MAP32
>  	cmpli	cr0,r4,0
> @@ -75,7 +53,7 @@ V_FUNCTION_BEGIN(__kernel_get_tbfreq)
>    .cfi_startproc
>  	mflr	r12
>    .cfi_register lr,r12
> -	bl	__get_datapage@local
> +	get_datapage	r3, r0
>  	lwz	r4,(CFG_TB_TICKS_PER_SEC + 4)(r3)
>  	lwz	r3,CFG_TB_TICKS_PER_SEC(r3)
>  	mtlr	r12
> diff --git a/arch/powerpc/kernel/vdso32/gettimeofday.S b/arch/powerpc/kernel/vdso32/gettimeofday.S
> index 355b537d327a..9867c7b9a25a 100644
> --- a/arch/powerpc/kernel/vdso32/gettimeofday.S
> +++ b/arch/powerpc/kernel/vdso32/gettimeofday.S
> @@ -9,6 +9,7 @@
>  #include <asm/processor.h>
>  #include <asm/ppc_asm.h>
>  #include <asm/vdso.h>
> +#include <asm/vdso_datapage.h>
>  #include <asm/asm-offsets.h>
>  #include <asm/unistd.h>
>  
> @@ -35,8 +36,7 @@ V_FUNCTION_BEGIN(__kernel_gettimeofday)
>  
>  	mr	r10,r3			/* r10 saves tv */
>  	mr	r11,r4			/* r11 saves tz */
> -	bl	__get_datapage@local	/* get data page */
> -	mr	r9, r3			/* datapage ptr in r9 */
> +	get_datapage	r9, r0
>  	cmplwi	r10,0			/* check if tv is NULL */
>  	beq	3f
>  	lis	r7,1000000@ha		/* load up USEC_PER_SEC */
> @@ -82,8 +82,7 @@ V_FUNCTION_BEGIN(__kernel_clock_gettime)
>  	mflr	r12			/* r12 saves lr */
>    .cfi_register lr,r12
>  	mr	r11,r4			/* r11 saves tp */
> -	bl	__get_datapage@local	/* get data page */
> -	mr	r9,r3			/* datapage ptr in r9 */
> +	get_datapage	r9, r0
>  	lis	r7,NSEC_PER_SEC@h	/* want nanoseconds */
>  	ori	r7,r7,NSEC_PER_SEC@l
>  	beq	cr5, .Lcoarse_clocks
> @@ -208,7 +207,7 @@ V_FUNCTION_BEGIN(__kernel_clock_getres)
>  
>  	mflr	r12
>    .cfi_register lr,r12
> -	bl	__get_datapage@local	/* get data page */
> +	get_datapage	r3, r0
>  	lwz	r5, CLOCK_HRTIMER_RES(r3)
>  	mtlr	r12
>  	li	r3,0
> @@ -242,8 +241,7 @@ V_FUNCTION_BEGIN(__kernel_time)
>    .cfi_register lr,r12
>  
>  	mr	r11,r3			/* r11 holds t */
> -	bl	__get_datapage@local
> -	mr	r9, r3			/* datapage ptr in r9 */
> +	get_datapage	r9, r0
>  
>  	lwz	r3,STAMP_XTIME+TSPEC_TV_SEC(r9)
>  
> -- 
> 2.13.3
