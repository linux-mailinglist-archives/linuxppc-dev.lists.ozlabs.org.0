Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CCCC97133
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Aug 2019 06:39:51 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Cw1b13TszDrPt
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Aug 2019 14:39:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=permerror (mailfrom)
 smtp.mailfrom=kernel.crashing.org (client-ip=63.228.1.57;
 helo=gate.crashing.org; envelope-from=benh@kernel.crashing.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=kernel.crashing.org
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46CvzG5QzWzDqwy
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Aug 2019 14:37:46 +1000 (AEST)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id x7L4bSwZ013162;
 Tue, 20 Aug 2019 23:37:29 -0500
Message-ID: <6662919bd80773aaf339e85b14af1ea1ddbfd841.camel@kernel.crashing.org>
Subject: Re: [PATCH] powerpc/vdso32: inline __get_datapage()
From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
To: Christophe Leroy <christophe.leroy@c-s.fr>, Paul Mackerras
 <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Wed, 21 Aug 2019 14:37:28 +1000
In-Reply-To: <65f1ed51b9cff219b9380c81d88353570cafdfd3.1565966871.git.christophe.leroy@c-s.fr>
References: <65f1ed51b9cff219b9380c81d88353570cafdfd3.1565966871.git.christophe.leroy@c-s.fr>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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

On Fri, 2019-08-16 at 14:48 +0000, Christophe Leroy wrote:
> __get_datapage() is only a few instructions to retrieve the
> address of the page where the kernel stores data to the VDSO.
> 
> By inlining this function into its users, a bl/blr pair and
> a mflr/mtlr pair is avoided, plus a few reg moves.
> 
> The improvement is noticeable (about 55 nsec/call on an 8xx)

Interesting... would be worth doing the same on vdso64 no ?

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
> ---
>  arch/powerpc/kernel/vdso32/cacheflush.S   | 10 +++++-----
>  arch/powerpc/kernel/vdso32/datapage.S     | 29 ++++-----------------
> --------
>  arch/powerpc/kernel/vdso32/datapage.h     | 12 ++++++++++++
>  arch/powerpc/kernel/vdso32/gettimeofday.S | 11 +++++------
>  4 files changed, 26 insertions(+), 36 deletions(-)
>  create mode 100644 arch/powerpc/kernel/vdso32/datapage.h
> 
> diff --git a/arch/powerpc/kernel/vdso32/cacheflush.S
> b/arch/powerpc/kernel/vdso32/cacheflush.S
> index 7f882e7b9f43..e9453837e4ee 100644
> --- a/arch/powerpc/kernel/vdso32/cacheflush.S
> +++ b/arch/powerpc/kernel/vdso32/cacheflush.S
> @@ -10,6 +10,8 @@
>  #include <asm/vdso.h>
>  #include <asm/asm-offsets.h>
>  
> +#include "datapage.h"
> +
>  	.text
>  
>  /*
> @@ -24,14 +26,12 @@ V_FUNCTION_BEGIN(__kernel_sync_dicache)
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
> @@ -48,7 +48,7 @@ V_FUNCTION_BEGIN(__kernel_sync_dicache)
>  
>  	lwz	r7,CFG_ICACHE_BLOCKSZ(r10)
>  	addi	r5,r7,-1
> -	andc	r6,r11,r5		/* round low to line bdy */
> +	andc	r6,r3,r5		/* round low to line bdy */
>  	subf	r8,r6,r4		/* compute length */
>  	add	r8,r8,r5
>  	lwz	r9,CFG_ICACHE_LOGBLOCKSZ(r10)
> diff --git a/arch/powerpc/kernel/vdso32/datapage.S
> b/arch/powerpc/kernel/vdso32/datapage.S
> index 6984125b9fc0..d480d2d4a3fe 100644
> --- a/arch/powerpc/kernel/vdso32/datapage.S
> +++ b/arch/powerpc/kernel/vdso32/datapage.S
> @@ -11,34 +11,13 @@
>  #include <asm/unistd.h>
>  #include <asm/vdso.h>
>  
> +#include "datapage.h"
> +
>  	.text
>  	.global	__kernel_datapage_offset;
>  __kernel_datapage_offset:
>  	.long	0
>  
> -V_FUNCTION_BEGIN(__get_datapage)
> -  .cfi_startproc
> -	/* We don't want that exposed or overridable as we want other
> objects
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
> @@ -53,7 +32,7 @@ V_FUNCTION_BEGIN(__kernel_get_syscall_map)
>  	mflr	r12
>    .cfi_register lr,r12
>  	mr	r4,r3
> -	bl	__get_datapage@local
> +	get_datapage	r3, r0
>  	mtlr	r12
>  	addi	r3,r3,CFG_SYSCALL_MAP32
>  	cmpli	cr0,r4,0
> @@ -74,7 +53,7 @@ V_FUNCTION_BEGIN(__kernel_get_tbfreq)
>    .cfi_startproc
>  	mflr	r12
>    .cfi_register lr,r12
> -	bl	__get_datapage@local
> +	get_datapage	r3, r0
>  	lwz	r4,(CFG_TB_TICKS_PER_SEC + 4)(r3)
>  	lwz	r3,CFG_TB_TICKS_PER_SEC(r3)
>  	mtlr	r12
> diff --git a/arch/powerpc/kernel/vdso32/datapage.h
> b/arch/powerpc/kernel/vdso32/datapage.h
> new file mode 100644
> index 000000000000..ad96256be090
> --- /dev/null
> +++ b/arch/powerpc/kernel/vdso32/datapage.h
> @@ -0,0 +1,12 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +
> +.macro get_datapage ptr, tmp
> +	bcl	20,31,888f
> +888:
> +	mflr	\ptr
> +	addi	\ptr, \ptr, __kernel_datapage_offset - 888b
> +	lwz	\tmp, 0(\ptr)
> +	add	\ptr, \tmp, \ptr
> +.endm
> +
> +
> diff --git a/arch/powerpc/kernel/vdso32/gettimeofday.S
> b/arch/powerpc/kernel/vdso32/gettimeofday.S
> index e10098cde89c..91a58f01dcd5 100644
> --- a/arch/powerpc/kernel/vdso32/gettimeofday.S
> +++ b/arch/powerpc/kernel/vdso32/gettimeofday.S
> @@ -12,6 +12,8 @@
>  #include <asm/asm-offsets.h>
>  #include <asm/unistd.h>
>  
> +#include "datapage.h"
> +
>  /* Offset for the low 32-bit part of a field of long type */
>  #ifdef CONFIG_PPC64
>  #define LOPART	4
> @@ -35,8 +37,7 @@ V_FUNCTION_BEGIN(__kernel_gettimeofday)
>  
>  	mr	r10,r3			/* r10 saves tv */
>  	mr	r11,r4			/* r11 saves tz */
> -	bl	__get_datapage@local	/* get data page */
> -	mr	r9, r3			/* datapage ptr in r9 */
> +	get_datapage	r9, r0
>  	cmplwi	r10,0			/* check if tv is NULL */
>  	beq	3f
>  	lis	r7,1000000@ha		/* load up USEC_PER_SEC */
> @@ -82,8 +83,7 @@ V_FUNCTION_BEGIN(__kernel_clock_gettime)
>  	mflr	r12			/* r12 saves lr */
>    .cfi_register lr,r12
>  	mr	r11,r4			/* r11 saves tp */
> -	bl	__get_datapage@local	/* get data page */
> -	mr	r9,r3			/* datapage ptr in r9 */
> +	get_datapage	r9, r0
>  	lis	r7,NSEC_PER_SEC@h	/* want nanoseconds */
>  	ori	r7,r7,NSEC_PER_SEC@l
>  	beq	cr5,70f
> @@ -235,8 +235,7 @@ V_FUNCTION_BEGIN(__kernel_time)
>    .cfi_register lr,r12
>  
>  	mr	r11,r3			/* r11 holds t */
> -	bl	__get_datapage@local
> -	mr	r9, r3			/* datapage ptr in r9 */
> +	get_datapage	r9, r0
>  
>  	lwz	r3,STAMP_XTIME+TSPEC_TV_SEC(r9)
>  

