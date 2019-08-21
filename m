Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 41CFC97664
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Aug 2019 11:48:24 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46D2sc1Q2bzDqR0
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Aug 2019 19:48:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="U+tcv48n"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46D2qr0llyzDqw9
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Aug 2019 19:46:45 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 46D2qd2b23z9v00R;
 Wed, 21 Aug 2019 11:46:37 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=U+tcv48n; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id eqbWJsy_WSno; Wed, 21 Aug 2019 11:46:37 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 46D2qd1HFLz9v00Q;
 Wed, 21 Aug 2019 11:46:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1566380797; bh=7mO+JjiNXwk/vD+5Z1IeeOqwH0N38pazEdfGcXbElvE=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=U+tcv48nF8en/V2psZhRwefFuSe5euR7Fl06L3TyiJId9QmbwUrYyxtpp4Rm9ScSF
 PODG6JgPAsWdE56piFS9+cf5Zc96YeNnb1TNy9aWzPu9kVnrhC8M46tUR4gs8GvYON
 wlHFRIEhzHah37JapVj7VLlhzOyJczSFlfnOTLag=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id E9B2E8B7E2;
 Wed, 21 Aug 2019 11:46:38 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 8I1VFbPcY9qB; Wed, 21 Aug 2019 11:46:38 +0200 (CEST)
Received: from [172.25.230.101] (po15451.idsi0.si.c-s.fr [172.25.230.101])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 63EF98B7E0;
 Wed, 21 Aug 2019 11:46:38 +0200 (CEST)
Subject: Re: [PATCH] powerpc/vdso64: inline __get_datapage()
To: Santosh Sivaraj <santosh@fossix.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>
References: <6662919bd80773aaf339e85b14af1ea1ddbfd841.camel@kernel.crashing.org>
 <20190821092959.16066-1-santosh@fossix.org>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <3724e1ba-d0f8-7247-73c2-6d83a3dbd040@c-s.fr>
Date: Wed, 21 Aug 2019 11:46:38 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190821092959.16066-1-santosh@fossix.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: fr
Content-Transfer-Encoding: 8bit
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
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 21/08/2019 à 11:29, Santosh Sivaraj a écrit :
> __get_datapage() is only a few instructions to retrieve the
> address of the page where the kernel stores data to the VDSO.
> 
> By inlining this function into its users, a bl/blr pair and
> a mflr/mtlr pair is avoided, plus a few reg moves.
> 
> clock-gettime-monotonic: syscall: 514 nsec/call  396 nsec/call
> clock-gettime-monotonic:    libc: 25 nsec/call   24 nsec/call
> clock-gettime-monotonic:    vdso: 20 nsec/call   20 nsec/call
> clock-getres-monotonic: syscall: 347 nsec/call   372 nsec/call
> clock-getres-monotonic:    libc: 19 nsec/call    19 nsec/call
> clock-getres-monotonic:    vdso: 10 nsec/call    10 nsec/call
> clock-gettime-monotonic-coarse: syscall: 511 nsec/call   396 nsec/call
> clock-gettime-monotonic-coarse:    libc: 23 nsec/call    21 nsec/call
> clock-gettime-monotonic-coarse:    vdso: 15 nsec/call    13 nsec/call
> clock-gettime-realtime: syscall: 526 nsec/call   405 nsec/call
> clock-gettime-realtime:    libc: 24 nsec/call    23 nsec/call
> clock-gettime-realtime:    vdso: 18 nsec/call    18 nsec/call
> clock-getres-realtime: syscall: 342 nsec/call    372 nsec/call
> clock-getres-realtime:    libc: 19 nsec/call     19 nsec/call
> clock-getres-realtime:    vdso: 10 nsec/call     10 nsec/call
> clock-gettime-realtime-coarse: syscall: 515 nsec/call    373 nsec/call
> clock-gettime-realtime-coarse:    libc: 23 nsec/call     22 nsec/call
> clock-gettime-realtime-coarse:    vdso: 14 nsec/call     13 nsec/call

I think you should only put the measurements on vdso calls, and only the 
ones that are impacted by the change. For exemple, getres function 
doesn't use __get_datapage so showing it here is pointless.

gettimeofday should be shown there as it uses __get_datapage()


> 
> Based on the patch by Christophe Leroy <christophe.leroy@c-s.fr> for vdso32.
> 
> Signed-off-by: Santosh Sivaraj <santosh@fossix.org>
> ---
> 
> except for a couple of calls (1 or 2 nsec reduction), there are no
> improvements in the call times. Or is 10 nsec the minimum granularity??

Maybe the ones that show no improvements are the ones that don't use 
__get_datapage() at all ...

> 
> So I don't know if its even worth updating vdso64 except to keep vdso32 and
> vdso64 equal.

2ns on a 15ns call is 13% so it is worth it I think.

Christophe


> 
> 
>   arch/powerpc/kernel/vdso64/cacheflush.S   | 10 ++++----
>   arch/powerpc/kernel/vdso64/datapage.S     | 29 ++++-------------------
>   arch/powerpc/kernel/vdso64/datapage.h     | 10 ++++++++
>   arch/powerpc/kernel/vdso64/gettimeofday.S |  8 ++++---
>   4 files changed, 24 insertions(+), 33 deletions(-)
>   create mode 100644 arch/powerpc/kernel/vdso64/datapage.h
> 
> diff --git a/arch/powerpc/kernel/vdso64/cacheflush.S b/arch/powerpc/kernel/vdso64/cacheflush.S
> index 3f92561a64c4..30e8b0d29bea 100644
> --- a/arch/powerpc/kernel/vdso64/cacheflush.S
> +++ b/arch/powerpc/kernel/vdso64/cacheflush.S
> @@ -10,6 +10,8 @@
>   #include <asm/vdso.h>
>   #include <asm/asm-offsets.h>
>   
> +#include "datapage.h"
> +
>   	.text
>   
>   /*
> @@ -24,14 +26,12 @@ V_FUNCTION_BEGIN(__kernel_sync_dicache)
>     .cfi_startproc
>   	mflr	r12
>     .cfi_register lr,r12
> -	mr	r11,r3
> -	bl	V_LOCAL_FUNC(__get_datapage)
> +	get_datapage	r11, r0
>   	mtlr	r12
> -	mr	r10,r3
>   
>   	lwz	r7,CFG_DCACHE_BLOCKSZ(r10)
>   	addi	r5,r7,-1
> -	andc	r6,r11,r5		/* round low to line bdy */
> +	andc	r6,r3,r5		/* round low to line bdy */
>   	subf	r8,r6,r4		/* compute length */
>   	add	r8,r8,r5		/* ensure we get enough */
>   	lwz	r9,CFG_DCACHE_LOGBLOCKSZ(r10)
> @@ -48,7 +48,7 @@ V_FUNCTION_BEGIN(__kernel_sync_dicache)
>   
>   	lwz	r7,CFG_ICACHE_BLOCKSZ(r10)
>   	addi	r5,r7,-1
> -	andc	r6,r11,r5		/* round low to line bdy */
> +	andc	r6,r3,r5		/* round low to line bdy */
>   	subf	r8,r6,r4		/* compute length */
>   	add	r8,r8,r5
>   	lwz	r9,CFG_ICACHE_LOGBLOCKSZ(r10)
> diff --git a/arch/powerpc/kernel/vdso64/datapage.S b/arch/powerpc/kernel/vdso64/datapage.S
> index dc84f5ae3802..8712f57c931c 100644
> --- a/arch/powerpc/kernel/vdso64/datapage.S
> +++ b/arch/powerpc/kernel/vdso64/datapage.S
> @@ -11,34 +11,13 @@
>   #include <asm/unistd.h>
>   #include <asm/vdso.h>
>   
> +#include "datapage.h"
> +
>   	.text
>   .global	__kernel_datapage_offset;
>   __kernel_datapage_offset:
>   	.long	0
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
>   /*
>    * void *__kernel_get_syscall_map(unsigned int *syscall_count) ;
>    *
> @@ -53,7 +32,7 @@ V_FUNCTION_BEGIN(__kernel_get_syscall_map)
>   	mflr	r12
>     .cfi_register lr,r12
>   	mr	r4,r3
> -	bl	V_LOCAL_FUNC(__get_datapage)
> +	get_datapage	r3, r0
>   	mtlr	r12
>   	addi	r3,r3,CFG_SYSCALL_MAP64
>   	cmpldi	cr0,r4,0
> @@ -75,7 +54,7 @@ V_FUNCTION_BEGIN(__kernel_get_tbfreq)
>     .cfi_startproc
>   	mflr	r12
>     .cfi_register lr,r12
> -	bl	V_LOCAL_FUNC(__get_datapage)
> +	get_datapage	r3, r0
>   	ld	r3,CFG_TB_TICKS_PER_SEC(r3)
>   	mtlr	r12
>   	crclr	cr0*4+so
> diff --git a/arch/powerpc/kernel/vdso64/datapage.h b/arch/powerpc/kernel/vdso64/datapage.h
> new file mode 100644
> index 000000000000..f2f0da0f65f3
> --- /dev/null
> +++ b/arch/powerpc/kernel/vdso64/datapage.h
> @@ -0,0 +1,10 @@
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
> diff --git a/arch/powerpc/kernel/vdso64/gettimeofday.S b/arch/powerpc/kernel/vdso64/gettimeofday.S
> index 07bfe33fe874..7bcc879392cc 100644
> --- a/arch/powerpc/kernel/vdso64/gettimeofday.S
> +++ b/arch/powerpc/kernel/vdso64/gettimeofday.S
> @@ -12,6 +12,8 @@
>   #include <asm/asm-offsets.h>
>   #include <asm/unistd.h>
>   
> +#include "datapage.h"
> +
>   	.text
>   /*
>    * Exact prototype of gettimeofday
> @@ -26,7 +28,7 @@ V_FUNCTION_BEGIN(__kernel_gettimeofday)
>   
>   	mr	r11,r3			/* r11 holds tv */
>   	mr	r10,r4			/* r10 holds tz */
> -	bl	V_LOCAL_FUNC(__get_datapage)	/* get data page */
> +	get_datapage	r3, r0
>   	cmpldi	r11,0			/* check if tv is NULL */
>   	beq	2f
>   	lis	r7,1000000@ha		/* load up USEC_PER_SEC */
> @@ -71,7 +73,7 @@ V_FUNCTION_BEGIN(__kernel_clock_gettime)
>   	mflr	r12			/* r12 saves lr */
>     .cfi_register lr,r12
>   	mr	r11,r4			/* r11 saves tp */
> -	bl	V_LOCAL_FUNC(__get_datapage)	/* get data page */
> +	get_datapage	r3, r0		/* get data page */
>   	lis	r7,NSEC_PER_SEC@h	/* want nanoseconds */
>   	ori	r7,r7,NSEC_PER_SEC@l
>   	beq	cr5,70f
> @@ -218,7 +220,7 @@ V_FUNCTION_BEGIN(__kernel_time)
>     .cfi_register lr,r12
>   
>   	mr	r11,r3			/* r11 holds t */
> -	bl	V_LOCAL_FUNC(__get_datapage)
> +	get_datapage	r3, r0
>   
>   	ld	r4,STAMP_XTIME+TSPC64_TV_SEC(r3)
>   
> 
