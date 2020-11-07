Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4020A2AA2FE
	for <lists+linuxppc-dev@lfdr.de>; Sat,  7 Nov 2020 08:24:15 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CSpfM5g5BzDrQf
	for <lists+linuxppc-dev@lfdr.de>; Sat,  7 Nov 2020 18:24:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=iram.es
 (client-ip=130.206.19.178; helo=mx02.puc.rediris.es;
 envelope-from=paubert@iram.es; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=iram.es
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=iram.es header.i=@iram.es header.a=rsa-sha256
 header.s=DKIM header.b=KC0c+f47; dkim-atps=neutral
X-Greylist: delayed 610 seconds by postgrey-1.36 at bilbo;
 Sat, 07 Nov 2020 18:22:50 AEDT
Received: from mx02.puc.rediris.es (outbound4sev.lav.puc.rediris.es
 [130.206.19.178])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CSpcp0l1ZzDrQ0
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  7 Nov 2020 18:22:49 +1100 (AEDT)
Received: from sim.rediris.es (mta-out04.sim.rediris.es [130.206.24.46])
 by mx02.puc.rediris.es  with ESMTP id 0A77CObE028001-0A77CObG028001
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Sat, 7 Nov 2020 08:12:25 +0100
Received: from sim.rediris.es (localhost.localdomain [127.0.0.1])
 by sim.rediris.es (Postfix) with ESMTPS id AFDC598EC0;
 Sat,  7 Nov 2020 08:12:24 +0100 (CET)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by sim.rediris.es (Postfix) with ESMTP id 7092C98EF0;
 Sat,  7 Nov 2020 08:12:24 +0100 (CET)
X-Amavis-Modified: Mail body modified (using disclaimer) -
 mta-out04.sim.rediris.es
Received: from sim.rediris.es ([127.0.0.1])
 by localhost (mta-out04.sim.rediris.es [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id 4uQcKAfFvakY; Sat,  7 Nov 2020 08:12:24 +0100 (CET)
Received: from lt-gp.iram.es (52.203.223.87.dynamic.jazztel.es [87.223.203.52])
 by sim.rediris.es (Postfix) with ESMTPA id 42BA898EC0;
 Sat,  7 Nov 2020 08:12:22 +0100 (CET)
Date: Sat, 7 Nov 2020 08:12:13 +0100
From: Gabriel Paubert <paubert@iram.es>
To: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH] powerpc: add compile-time support for lbarx, lwarx
Message-ID: <20201107071213.GA30735@lt-gp.iram.es>
References: <20201107032328.2454582-1-npiggin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201107032328.2454582-1-npiggin@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-FE-Policy-ID: 2:8:0:SYSTEM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; d=iram.es; s=DKIM;
 c=relaxed/relaxed; 
 h=date:from:to:cc:subject:message-id:references:mime-version:content-type;
 bh=qpsqdhg4xvzsYJrhSSso0A2iKX67V9r1ijRw7ZJQTc8=;
 b=KC0c+f47LGvDRTc1x5bDRGsD8VwpjcJt4eJo5ECbZSBf0W1uNIBdfM6tRHW/JbWRg4sNS8MXolFp
 yUpgZfv05xm1ytgHsGwJ3VcThzcYR7JbdowtpacIdmYpw0ZMgtKCYn3RkD/qTWtpHSOPtUL1lc2Z
 //WgQ8Kx6fkpyW9758vbWadnJH+2np+s777tZa/Vxa+VOxGVYYo02xvx6b8L1RpKtGmrtIl4yXW7
 aj53g7Gnh0C/jOcND6gs/uJqjWL75nywv/jAYzGh00WHPSgT3DZa/ESlo349rmhLlGzGbMen04hB
 2oLDGnYSFn0Tey2aRVKb5J30vFiYPsWzAEB4Dw==
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, Nov 07, 2020 at 01:23:28PM +1000, Nicholas Piggin wrote:
> ISA v2.06 (POWER7 and up) as well as e6500 support lbarx and lwarx.

Hmm, lwarx exists since original Power AFAIR, s/lwarx/lharx/ perhaps?

Same for the title of the patch and the CONFIG variable.	

	Gabriel

> Add a compile option that allows code to use it, and add support in
> cmpxchg and xchg 8 and 16 bit values.
> 
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>  arch/powerpc/Kconfig                   |   3 +
>  arch/powerpc/include/asm/cmpxchg.h     | 236 ++++++++++++++++++++++++-
>  arch/powerpc/platforms/Kconfig.cputype |   5 +
>  3 files changed, 243 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
> index e9f13fe08492..d231af06f75a 100644
> --- a/arch/powerpc/Kconfig
> +++ b/arch/powerpc/Kconfig
> @@ -266,6 +266,9 @@ config PPC_BARRIER_NOSPEC
>  	default y
>  	depends on PPC_BOOK3S_64 || PPC_FSL_BOOK3E
>  
> +config PPC_LBARX_LWARX
> +	bool
> +
>  config EARLY_PRINTK
>  	bool
>  	default y
> diff --git a/arch/powerpc/include/asm/cmpxchg.h b/arch/powerpc/include/asm/cmpxchg.h
> index cf091c4c22e5..17fd996dc0d4 100644
> --- a/arch/powerpc/include/asm/cmpxchg.h
> +++ b/arch/powerpc/include/asm/cmpxchg.h
> @@ -77,10 +77,76 @@ u32 __cmpxchg_##type##sfx(volatile void *p, u32 old, u32 new)	\
>   * the previous value stored there.
>   */
>  
> +#ifndef CONFIG_PPC_LBARX_LWARX
>  XCHG_GEN(u8, _local, "memory");
>  XCHG_GEN(u8, _relaxed, "cc");
>  XCHG_GEN(u16, _local, "memory");
>  XCHG_GEN(u16, _relaxed, "cc");
> +#else
> +static __always_inline unsigned long
> +__xchg_u8_local(volatile void *p, unsigned long val)
> +{
> +	unsigned long prev;
> +
> +	__asm__ __volatile__(
> +"1:	lbarx	%0,0,%2 \n"
> +"	stbcx.	%3,0,%2 \n\
> +	bne-	1b"
> +	: "=&r" (prev), "+m" (*(volatile unsigned char *)p)
> +	: "r" (p), "r" (val)
> +	: "cc", "memory");
> +
> +	return prev;
> +}
> +
> +static __always_inline unsigned long
> +__xchg_u8_relaxed(u8 *p, unsigned long val)
> +{
> +	unsigned long prev;
> +
> +	__asm__ __volatile__(
> +"1:	lbarx	%0,0,%2\n"
> +"	stbcx.	%3,0,%2\n"
> +"	bne-	1b"
> +	: "=&r" (prev), "+m" (*p)
> +	: "r" (p), "r" (val)
> +	: "cc");
> +
> +	return prev;
> +}
> +
> +static __always_inline unsigned long
> +__xchg_u16_local(volatile void *p, unsigned long val)
> +{
> +	unsigned long prev;
> +
> +	__asm__ __volatile__(
> +"1:	lharx	%0,0,%2 \n"
> +"	sthcx.	%3,0,%2 \n\
> +	bne-	1b"
> +	: "=&r" (prev), "+m" (*(volatile unsigned short *)p)
> +	: "r" (p), "r" (val)
> +	: "cc", "memory");
> +
> +	return prev;
> +}
> +
> +static __always_inline unsigned long
> +__xchg_u16_relaxed(u16 *p, unsigned long val)
> +{
> +	unsigned long prev;
> +
> +	__asm__ __volatile__(
> +"1:	lharx	%0,0,%2\n"
> +"	sthcx.	%3,0,%2\n"
> +"	bne-	1b"
> +	: "=&r" (prev), "+m" (*p)
> +	: "r" (p), "r" (val)
> +	: "cc");
> +
> +	return prev;
> +}
> +#endif
>  
>  static __always_inline unsigned long
>  __xchg_u32_local(volatile void *p, unsigned long val)
> @@ -198,11 +264,12 @@ __xchg_relaxed(void *ptr, unsigned long x, unsigned int size)
>  	(__typeof__(*(ptr))) __xchg_relaxed((ptr),			\
>  			(unsigned long)_x_, sizeof(*(ptr)));		\
>  })
> +
>  /*
>   * Compare and exchange - if *p == old, set it to new,
>   * and return the old value of *p.
>   */
> -
> +#ifndef CONFIG_PPC_LBARX_LWARX
>  CMPXCHG_GEN(u8, , PPC_ATOMIC_ENTRY_BARRIER, PPC_ATOMIC_EXIT_BARRIER, "memory");
>  CMPXCHG_GEN(u8, _local, , , "memory");
>  CMPXCHG_GEN(u8, _acquire, , PPC_ACQUIRE_BARRIER, "memory");
> @@ -211,6 +278,173 @@ CMPXCHG_GEN(u16, , PPC_ATOMIC_ENTRY_BARRIER, PPC_ATOMIC_EXIT_BARRIER, "memory");
>  CMPXCHG_GEN(u16, _local, , , "memory");
>  CMPXCHG_GEN(u16, _acquire, , PPC_ACQUIRE_BARRIER, "memory");
>  CMPXCHG_GEN(u16, _relaxed, , , "cc");
> +#else
> +static __always_inline unsigned long
> +__cmpxchg_u8(volatile unsigned char *p, unsigned long old, unsigned long new)
> +{
> +	unsigned int prev;
> +
> +	__asm__ __volatile__ (
> +	PPC_ATOMIC_ENTRY_BARRIER
> +"1:	lbarx	%0,0,%2		# __cmpxchg_u8\n\
> +	cmpw	0,%0,%3\n\
> +	bne-	2f\n"
> +"	stbcx.	%4,0,%2\n\
> +	bne-	1b"
> +	PPC_ATOMIC_EXIT_BARRIER
> +	"\n\
> +2:"
> +	: "=&r" (prev), "+m" (*p)
> +	: "r" (p), "r" (old), "r" (new)
> +	: "cc", "memory");
> +
> +	return prev;
> +}
> +
> +static __always_inline unsigned long
> +__cmpxchg_u8_local(volatile unsigned char *p, unsigned long old,
> +			unsigned long new)
> +{
> +	unsigned int prev;
> +
> +	__asm__ __volatile__ (
> +"1:	lbarx	%0,0,%2		# __cmpxchg_u8\n\
> +	cmpw	0,%0,%3\n\
> +	bne-	2f\n"
> +"	stbcx.	%4,0,%2\n\
> +	bne-	1b"
> +	"\n\
> +2:"
> +	: "=&r" (prev), "+m" (*p)
> +	: "r" (p), "r" (old), "r" (new)
> +	: "cc", "memory");
> +
> +	return prev;
> +}
> +
> +static __always_inline unsigned long
> +__cmpxchg_u8_relaxed(u8 *p, unsigned long old, unsigned long new)
> +{
> +	unsigned long prev;
> +
> +	__asm__ __volatile__ (
> +"1:	lbarx	%0,0,%2		# __cmpxchg_u8_relaxed\n"
> +"	cmpw	0,%0,%3\n"
> +"	bne-	2f\n"
> +"	stbcx.	%4,0,%2\n"
> +"	bne-	1b\n"
> +"2:"
> +	: "=&r" (prev), "+m" (*p)
> +	: "r" (p), "r" (old), "r" (new)
> +	: "cc");
> +
> +	return prev;
> +}
> +
> +static __always_inline unsigned long
> +__cmpxchg_u8_acquire(u8 *p, unsigned long old, unsigned long new)
> +{
> +	unsigned long prev;
> +
> +	__asm__ __volatile__ (
> +"1:	lbarx	%0,0,%2		# __cmpxchg_u8_acquire\n"
> +"	cmpw	0,%0,%3\n"
> +"	bne-	2f\n"
> +"	stbcx.	%4,0,%2\n"
> +"	bne-	1b\n"
> +	PPC_ACQUIRE_BARRIER
> +	"\n"
> +"2:"
> +	: "=&r" (prev), "+m" (*p)
> +	: "r" (p), "r" (old), "r" (new)
> +	: "cc", "memory");
> +
> +	return prev;
> +}
> +
> +static __always_inline unsigned long
> +__cmpxchg_u16(volatile unsigned short *p, unsigned long old, unsigned long new)
> +{
> +	unsigned int prev;
> +
> +	__asm__ __volatile__ (
> +	PPC_ATOMIC_ENTRY_BARRIER
> +"1:	lharx	%0,0,%2		# __cmpxchg_u16\n\
> +	cmpw	0,%0,%3\n\
> +	bne-	2f\n"
> +"	sthcx.	%4,0,%2\n\
> +	bne-	1b"
> +	PPC_ATOMIC_EXIT_BARRIER
> +	"\n\
> +2:"
> +	: "=&r" (prev), "+m" (*p)
> +	: "r" (p), "r" (old), "r" (new)
> +	: "cc", "memory");
> +
> +	return prev;
> +}
> +
> +static __always_inline unsigned long
> +__cmpxchg_u16_local(volatile unsigned short *p, unsigned long old,
> +			unsigned long new)
> +{
> +	unsigned int prev;
> +
> +	__asm__ __volatile__ (
> +"1:	lharx	%0,0,%2		# __cmpxchg_u16\n\
> +	cmpw	0,%0,%3\n\
> +	bne-	2f\n"
> +"	sthcx.	%4,0,%2\n\
> +	bne-	1b"
> +	"\n\
> +2:"
> +	: "=&r" (prev), "+m" (*p)
> +	: "r" (p), "r" (old), "r" (new)
> +	: "cc", "memory");
> +
> +	return prev;
> +}
> +
> +static __always_inline unsigned long
> +__cmpxchg_u16_relaxed(u16 *p, unsigned long old, unsigned long new)
> +{
> +	unsigned long prev;
> +
> +	__asm__ __volatile__ (
> +"1:	lharx	%0,0,%2		# __cmpxchg_u16_relaxed\n"
> +"	cmpw	0,%0,%3\n"
> +"	bne-	2f\n"
> +"	sthcx.	%4,0,%2\n"
> +"	bne-	1b\n"
> +"2:"
> +	: "=&r" (prev), "+m" (*p)
> +	: "r" (p), "r" (old), "r" (new)
> +	: "cc");
> +
> +	return prev;
> +}
> +
> +static __always_inline unsigned long
> +__cmpxchg_u16_acquire(u16 *p, unsigned long old, unsigned long new)
> +{
> +	unsigned long prev;
> +
> +	__asm__ __volatile__ (
> +"1:	lharx	%0,0,%2		# __cmpxchg_u16_acquire\n"
> +"	cmpw	0,%0,%3\n"
> +"	bne-	2f\n"
> +"	sthcx.	%4,0,%2\n"
> +"	bne-	1b\n"
> +	PPC_ACQUIRE_BARRIER
> +	"\n"
> +"2:"
> +	: "=&r" (prev), "+m" (*p)
> +	: "r" (p), "r" (old), "r" (new)
> +	: "cc", "memory");
> +
> +	return prev;
> +}
> +#endif
>  
>  static __always_inline unsigned long
>  __cmpxchg_u32(volatile unsigned int *p, unsigned long old, unsigned long new)
> diff --git a/arch/powerpc/platforms/Kconfig.cputype b/arch/powerpc/platforms/Kconfig.cputype
> index c194c4ae8bc7..2f8c8d61dba4 100644
> --- a/arch/powerpc/platforms/Kconfig.cputype
> +++ b/arch/powerpc/platforms/Kconfig.cputype
> @@ -118,6 +118,7 @@ config GENERIC_CPU
>  	bool "Generic (POWER8 and above)"
>  	depends on PPC64 && CPU_LITTLE_ENDIAN
>  	select ARCH_HAS_FAST_MULTIPLIER
> +	select PPC_LBARX_LWARX
>  
>  config GENERIC_CPU
>  	bool "Generic 32 bits powerpc"
> @@ -139,16 +140,19 @@ config POWER7_CPU
>  	bool "POWER7"
>  	depends on PPC_BOOK3S_64
>  	select ARCH_HAS_FAST_MULTIPLIER
> +	select PPC_LBARX_LWARX
>  
>  config POWER8_CPU
>  	bool "POWER8"
>  	depends on PPC_BOOK3S_64
>  	select ARCH_HAS_FAST_MULTIPLIER
> +	select PPC_LBARX_LWARX
>  
>  config POWER9_CPU
>  	bool "POWER9"
>  	depends on PPC_BOOK3S_64
>  	select ARCH_HAS_FAST_MULTIPLIER
> +	select PPC_LBARX_LWARX
>  
>  config E5500_CPU
>  	bool "Freescale e5500"
> @@ -157,6 +161,7 @@ config E5500_CPU
>  config E6500_CPU
>  	bool "Freescale e6500"
>  	depends on E500
> +	select PPC_LBARX_LWARX
>  
>  config 860_CPU
>  	bool "8xx family"
> -- 
> 2.23.0
> 
 

