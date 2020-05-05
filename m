Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A21C1C6479
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 May 2020 01:24:50 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49Gwmb65HZzDql0
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 May 2020 09:24:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.helo=hall.aurel32.net (client-ip=2001:bc8:30d7:100::1;
 helo=hall.aurel32.net; envelope-from=aurelien@aurel32.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aurel32.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=aurel32.net header.i=@aurel32.net header.a=rsa-sha256
 header.s=202004.hall header.b=KzR1Fn9y; 
 dkim-atps=neutral
X-Greylist: delayed 1797 seconds by postgrey-1.36 at bilbo;
 Wed, 06 May 2020 09:23:15 AEST
Received: from hall.aurel32.net (hall.aurel32.net [IPv6:2001:bc8:30d7:100::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49Gwkq0Tw1zDqb0
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 May 2020 09:23:15 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
 ; s=202004.hall;
 h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Content-Transfer-Encoding:From:Reply-To:
 Subject:Content-ID:Content-Description:X-Debbugs-Cc;
 bh=Fw7aDfSu8Ev49U5D2tYj2n61oUrGmj01KXcwQiHtfOw=; b=KzR1Fn9yMaNCO6OrbAlStQTrCQ
 M8PJEs62EAYQDNYCKoSgP5/tizMNxmI2+LyE/2WL8MhSEsWEA4QXF2K5oQCyMw+mhtrduovWhPLrT
 R8vflig+4tkhLYP6aiwUIggsphFUOLFchvZgscq0GvDxHwU+lgCO69pMi+wK3lfF7Fdpr2K4wDrXg
 D+NzjWVnDgzqGG8X54XrgdX+TZV3W3e7bvaJ6J0tMLBLtkmF7rnCTVJLPDBeaCXhJYeWEhQZDVzKy
 +zynG2YEh6sAElR2x/Ls9zy/b9lg7Ewi6OWRJPzWwhsdfHJc8RxctIbxTEGnR/9NMarCo/P6Q6UOq
 Rd96FIbw==;
Received: from [2a01:e35:2fdd:a4e1:fe91:fc89:bc43:b814] (helo=ohm.rr44.fr)
 by hall.aurel32.net with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <aurelien@aurel32.net>)
 id 1jW6Qo-0008Qi-OU; Wed, 06 May 2020 00:52:54 +0200
Received: from aurel32 by ohm.rr44.fr with local (Exim 4.93)
 (envelope-from <aurelien@aurel32.net>)
 id 1jW6Qo-001zlp-3y; Wed, 06 May 2020 00:52:54 +0200
Date: Wed, 6 May 2020 00:52:54 +0200
From: Aurelien Jarno <aurelien@aurel32.net>
To: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: Re: [PATCH v4 7/8] powerpc/vdso32: implement clock_getres entirely
Message-ID: <20200505225254.GA471364@aurel32.net>
Mail-Followup-To: Christophe Leroy <christophe.leroy@c-s.fr>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>,
 Michael Ellerman <mpe@ellerman.id.au>, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, arnd@arndb.de
References: <cover.1575273217.git.christophe.leroy@c-s.fr>
 <37f94e47c91070b7606fb3ec3fe6fd2302a475a0.1575273217.git.christophe.leroy@c-s.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <37f94e47c91070b7606fb3ec3fe6fd2302a475a0.1575273217.git.christophe.leroy@c-s.fr>
User-Agent: Mutt/1.13.2 (2019-12-18)
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
Cc: arnd@arndb.de, linux-kernel@vger.kernel.org,
 Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi,

On 2019-12-02 07:57, Christophe Leroy wrote:
> clock_getres returns hrtimer_res for all clocks but coarse ones
> for which it returns KTIME_LOW_RES.
> 
> return EINVAL for unknown clocks.
> 
> Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
> ---
>  arch/powerpc/kernel/asm-offsets.c         |  3 +++
>  arch/powerpc/kernel/vdso32/gettimeofday.S | 19 +++++++++++--------
>  2 files changed, 14 insertions(+), 8 deletions(-)
> 
> diff --git a/arch/powerpc/kernel/asm-offsets.c b/arch/powerpc/kernel/asm-offsets.c
> index 0013197d89a6..90e53d432f2e 100644
> --- a/arch/powerpc/kernel/asm-offsets.c
> +++ b/arch/powerpc/kernel/asm-offsets.c
> @@ -413,7 +413,10 @@ int main(void)
>  	DEFINE(CLOCK_MONOTONIC, CLOCK_MONOTONIC);
>  	DEFINE(CLOCK_REALTIME_COARSE, CLOCK_REALTIME_COARSE);
>  	DEFINE(CLOCK_MONOTONIC_COARSE, CLOCK_MONOTONIC_COARSE);
> +	DEFINE(CLOCK_MAX, CLOCK_TAI);
>  	DEFINE(NSEC_PER_SEC, NSEC_PER_SEC);
> +	DEFINE(EINVAL, EINVAL);
> +	DEFINE(KTIME_LOW_RES, KTIME_LOW_RES);
>  
>  #ifdef CONFIG_BUG
>  	DEFINE(BUG_ENTRY_SIZE, sizeof(struct bug_entry));
> diff --git a/arch/powerpc/kernel/vdso32/gettimeofday.S b/arch/powerpc/kernel/vdso32/gettimeofday.S
> index 9aafacea9c4a..20ae38f3a5a3 100644
> --- a/arch/powerpc/kernel/vdso32/gettimeofday.S
> +++ b/arch/powerpc/kernel/vdso32/gettimeofday.S
> @@ -196,17 +196,20 @@ V_FUNCTION_END(__kernel_clock_gettime)
>  V_FUNCTION_BEGIN(__kernel_clock_getres)
>    .cfi_startproc
>  	/* Check for supported clock IDs */
> -	cmpwi	cr0,r3,CLOCK_REALTIME
> -	cmpwi	cr1,r3,CLOCK_MONOTONIC
> -	cror	cr0*4+eq,cr0*4+eq,cr1*4+eq
> -	bne	cr0,99f
> +	cmplwi	cr0, r3, CLOCK_MAX
> +	cmpwi	cr1, r3, CLOCK_REALTIME_COARSE
> +	cmpwi	cr7, r3, CLOCK_MONOTONIC_COARSE
> +	bgt	cr0, 99f
> +	LOAD_REG_IMMEDIATE(r5, KTIME_LOW_RES)
> +	beq	cr1, 1f
> +	beq	cr7, 1f
>  
>  	mflr	r12
>    .cfi_register lr,r12
>  	get_datapage	r3, r0
>  	lwz	r5, CLOCK_HRTIMER_RES(r3)
>  	mtlr	r12
> -	li	r3,0
> +1:	li	r3,0
>  	cmpli	cr0,r4,0
>  	crclr	cr0*4+so
>  	beqlr
> @@ -215,11 +218,11 @@ V_FUNCTION_BEGIN(__kernel_clock_getres)
>  	blr
>  
>  	/*
> -	 * syscall fallback
> +	 * invalid clock
>  	 */
>  99:
> -	li	r0,__NR_clock_getres
> -	sc
> +	li	r3, EINVAL
> +	crset	so
>  	blr
>    .cfi_endproc
>  V_FUNCTION_END(__kernel_clock_getres)

Removing the syscall fallback looks wrong, and broke access to
per-processes clocks. With this change a few glibc tests now fail.

This can be reproduced by the simple code below:

| #include <errno.h>
| #include <stdio.h>
| #include <string.h>
| #include <sys/types.h>
| #include <time.h>
| #include <unistd.h>
| 
| int main()
| {
|     struct timespec res;
|     clockid_t ci;
|     int e;
|
|     e = clock_getcpuclockid(getpid(), &ci);
|     if (e) {
|         printf("clock_getcpuclockid returned %d\n", e);
|         return e;
|     }
|     e = clock_getres (ci, &res);
|     printf("clock_getres returned %d\n", e);
|     if (e) {
|         printf("  errno: %d, %s\n", errno, strerror(errno));
|     }
|
|     return e;
| }

Without this patch or with -m64, it returns:

| clock_getres returned 0

With this patch with -m32 it returns:

| clock_getres returned -1
|   errno: 22, Invalid argument

Regards,
Aurelien

-- 
Aurelien Jarno                          GPG: 4096R/1DDD8C9B
aurelien@aurel32.net                 http://www.aurel32.net
