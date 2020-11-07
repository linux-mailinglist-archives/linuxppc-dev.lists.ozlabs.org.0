Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B8072AA3CC
	for <lists+linuxppc-dev@lfdr.de>; Sat,  7 Nov 2020 09:17:10 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CSqqR5rBjzDrSq
	for <lists+linuxppc-dev@lfdr.de>; Sat,  7 Nov 2020 19:17:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=csgroup.eu
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CSqnp5BvpzDrMs
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  7 Nov 2020 19:15:30 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4CSqnR0Kr5z9txmm;
 Sat,  7 Nov 2020 09:15:23 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id loCA553UyAtl; Sat,  7 Nov 2020 09:15:22 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4CSqnQ6Lfbz9txml;
 Sat,  7 Nov 2020 09:15:22 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id E5F648B776;
 Sat,  7 Nov 2020 09:15:23 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id QomfiunwPIzC; Sat,  7 Nov 2020 09:15:23 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 7AAC88B75B;
 Sat,  7 Nov 2020 09:15:23 +0100 (CET)
Subject: Re: [PATCH] powerpc: add compile-time support for lbarx, lwarx
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
References: <20201107032328.2454582-1-npiggin@gmail.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <311a1f6d-01ca-e35f-d145-3c643fb40f74@csgroup.eu>
Date: Sat, 7 Nov 2020 09:15:21 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201107032328.2454582-1-npiggin@gmail.com>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 07/11/2020 à 04:23, Nicholas Piggin a écrit :
> ISA v2.06 (POWER7 and up) as well as e6500 support lbarx and lwarx.
> Add a compile option that allows code to use it, and add support in
> cmpxchg and xchg 8 and 16 bit values.

Do you mean lharx ? Because lwarx exists on all powerpcs I think.

> 
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>   arch/powerpc/Kconfig                   |   3 +
>   arch/powerpc/include/asm/cmpxchg.h     | 236 ++++++++++++++++++++++++-
>   arch/powerpc/platforms/Kconfig.cputype |   5 +
>   3 files changed, 243 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
> index e9f13fe08492..d231af06f75a 100644
> --- a/arch/powerpc/Kconfig
> +++ b/arch/powerpc/Kconfig
> @@ -266,6 +266,9 @@ config PPC_BARRIER_NOSPEC
>   	default y
>   	depends on PPC_BOOK3S_64 || PPC_FSL_BOOK3E
>   
> +config PPC_LBARX_LWARX
> +	bool

s/LWARX/LHARX/ ?

And maybe better with PPC_HAS_LBARX_LWARX ?

> +
>   config EARLY_PRINTK
>   	bool
>   	default y
> diff --git a/arch/powerpc/include/asm/cmpxchg.h b/arch/powerpc/include/asm/cmpxchg.h
> index cf091c4c22e5..17fd996dc0d4 100644
> --- a/arch/powerpc/include/asm/cmpxchg.h
> +++ b/arch/powerpc/include/asm/cmpxchg.h
> @@ -77,10 +77,76 @@ u32 __cmpxchg_##type##sfx(volatile void *p, u32 old, u32 new)	\
>    * the previous value stored there.
>    */
>   
> +#ifndef CONFIG_PPC_LBARX_LWARX
>   XCHG_GEN(u8, _local, "memory");
>   XCHG_GEN(u8, _relaxed, "cc");
>   XCHG_GEN(u16, _local, "memory");
>   XCHG_GEN(u16, _relaxed, "cc");
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

That's a lot of code duplication. Could we use some macro, in the same spirit as what is done in 
arch/powerpc/include/asm/io.h for in_be16(), in_be32(), in_be64() and friends ?

>   
>   static __always_inline unsigned long
>   __xchg_u32_local(volatile void *p, unsigned long val)
> @@ -198,11 +264,12 @@ __xchg_relaxed(void *ptr, unsigned long x, unsigned int size)
>   	(__typeof__(*(ptr))) __xchg_relaxed((ptr),			\
>   			(unsigned long)_x_, sizeof(*(ptr)));		\
>   })
> +
>   /*
>    * Compare and exchange - if *p == old, set it to new,
>    * and return the old value of *p.
>    */
> -
> +#ifndef CONFIG_PPC_LBARX_LWARX
>   CMPXCHG_GEN(u8, , PPC_ATOMIC_ENTRY_BARRIER, PPC_ATOMIC_EXIT_BARRIER, "memory");
>   CMPXCHG_GEN(u8, _local, , , "memory");
>   CMPXCHG_GEN(u8, _acquire, , PPC_ACQUIRE_BARRIER, "memory");
> @@ -211,6 +278,173 @@ CMPXCHG_GEN(u16, , PPC_ATOMIC_ENTRY_BARRIER, PPC_ATOMIC_EXIT_BARRIER, "memory");
>   CMPXCHG_GEN(u16, _local, , , "memory");
>   CMPXCHG_GEN(u16, _acquire, , PPC_ACQUIRE_BARRIER, "memory");
>   CMPXCHG_GEN(u16, _relaxed, , , "cc");
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

That's a lot of code duplication. Could we use some macro, in the same spirit as what is done in 
arch/powerpc/include/asm/io.h for in_be16(), in_be32(), in_be64() and friends ?

>   
>   static __always_inline unsigned long
>   __cmpxchg_u32(volatile unsigned int *p, unsigned long old, unsigned long new)
> diff --git a/arch/powerpc/platforms/Kconfig.cputype b/arch/powerpc/platforms/Kconfig.cputype
> index c194c4ae8bc7..2f8c8d61dba4 100644
> --- a/arch/powerpc/platforms/Kconfig.cputype
> +++ b/arch/powerpc/platforms/Kconfig.cputype
> @@ -118,6 +118,7 @@ config GENERIC_CPU
>   	bool "Generic (POWER8 and above)"
>   	depends on PPC64 && CPU_LITTLE_ENDIAN
>   	select ARCH_HAS_FAST_MULTIPLIER
> +	select PPC_LBARX_LWARX

s/LWARX/LHARX/ ?

>   
>   config GENERIC_CPU
>   	bool "Generic 32 bits powerpc"
> @@ -139,16 +140,19 @@ config POWER7_CPU
>   	bool "POWER7"
>   	depends on PPC_BOOK3S_64
>   	select ARCH_HAS_FAST_MULTIPLIER
> +	select PPC_LBARX_LWARX
>   
>   config POWER8_CPU
>   	bool "POWER8"
>   	depends on PPC_BOOK3S_64
>   	select ARCH_HAS_FAST_MULTIPLIER
> +	select PPC_LBARX_LWARX
>   
>   config POWER9_CPU
>   	bool "POWER9"
>   	depends on PPC_BOOK3S_64
>   	select ARCH_HAS_FAST_MULTIPLIER
> +	select PPC_LBARX_LWARX
>   
>   config E5500_CPU
>   	bool "Freescale e5500"
> @@ -157,6 +161,7 @@ config E5500_CPU
>   config E6500_CPU
>   	bool "Freescale e6500"
>   	depends on E500
> +	select PPC_LBARX_LWARX
>   
>   config 860_CPU
>   	bool "8xx family"
> 

Christophe
