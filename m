Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 010845B0B43
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Sep 2022 19:14:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MN84s5dmtz3c7g
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Sep 2022 03:14:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MN84S3ggbz2xH8
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Sep 2022 03:14:14 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4MN84L5M6hz9skw;
	Wed,  7 Sep 2022 19:14:10 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7kdPumlQzlwn; Wed,  7 Sep 2022 19:14:10 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4MN84L3XW8z9sks;
	Wed,  7 Sep 2022 19:14:10 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 4A5A68B78B;
	Wed,  7 Sep 2022 19:14:10 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id kmKhgH32Dr2b; Wed,  7 Sep 2022 19:14:10 +0200 (CEST)
Received: from [192.168.232.239] (unknown [192.168.232.239])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 009E18B763;
	Wed,  7 Sep 2022 19:14:09 +0200 (CEST)
Message-ID: <fc904a84-0b64-476e-c0ff-963eb3c1e73b@csgroup.eu>
Date: Wed, 7 Sep 2022 19:14:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH v2] powerpc: add compile-time support for lbarx, lharx
Content-Language: fr-FR
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
References: <20210623032838.825897-1-npiggin@gmail.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <20210623032838.825897-1-npiggin@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 23/06/2021 à 05:28, Nicholas Piggin a écrit :
> ISA v2.06 (POWER7 and up) as well as e6500 support lbarx and lharx.
> Add a compile option that allows code to use it, and add support in
> cmpxchg and xchg 8 and 16 bit values without shifting and masking.

Is this this patch still relevant ?

If so, it should be rebased because it badly conflicts.

Thanks
Christophe

> 
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
> v2: Fixed lwarx->lharx typo, switched to PPC_HAS_
> 
>   arch/powerpc/Kconfig                   |   3 +
>   arch/powerpc/include/asm/cmpxchg.h     | 236 ++++++++++++++++++++++++-
>   arch/powerpc/lib/sstep.c               |  21 +--
>   arch/powerpc/platforms/Kconfig.cputype |   5 +
>   4 files changed, 254 insertions(+), 11 deletions(-)
> 
> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
> index 088dd2afcfe4..dc17f4d51a79 100644
> --- a/arch/powerpc/Kconfig
> +++ b/arch/powerpc/Kconfig
> @@ -278,6 +278,9 @@ config PPC_BARRIER_NOSPEC
>   	default y
>   	depends on PPC_BOOK3S_64 || PPC_FSL_BOOK3E
>   
> +config PPC_HAS_LBARX_LHARX
> +	bool
> +
>   config EARLY_PRINTK
>   	bool
>   	default y
> diff --git a/arch/powerpc/include/asm/cmpxchg.h b/arch/powerpc/include/asm/cmpxchg.h
> index cf091c4c22e5..28fbd57db1ec 100644
> --- a/arch/powerpc/include/asm/cmpxchg.h
> +++ b/arch/powerpc/include/asm/cmpxchg.h
> @@ -77,10 +77,76 @@ u32 __cmpxchg_##type##sfx(volatile void *p, u32 old, u32 new)	\
>    * the previous value stored there.
>    */
>   
> +#ifndef CONFIG_PPC_HAS_LBARX_LHARX
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
> +#ifndef CONFIG_PPC_HAS_LBARX_LHARX
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
>   
>   static __always_inline unsigned long
>   __cmpxchg_u32(volatile unsigned int *p, unsigned long old, unsigned long new)
> diff --git a/arch/powerpc/platforms/Kconfig.cputype b/arch/powerpc/platforms/Kconfig.cputype
> index f998e655b570..3a03c8ce1e95 100644
> --- a/arch/powerpc/platforms/Kconfig.cputype
> +++ b/arch/powerpc/platforms/Kconfig.cputype
> @@ -131,6 +131,7 @@ config GENERIC_CPU
>   	bool "Generic (POWER8 and above)"
>   	depends on PPC64 && CPU_LITTLE_ENDIAN
>   	select ARCH_HAS_FAST_MULTIPLIER
> +	select PPC_HAS_LBARX_LHARX
>   
>   config GENERIC_CPU
>   	bool "Generic 32 bits powerpc"
> @@ -152,16 +153,19 @@ config POWER7_CPU
>   	bool "POWER7"
>   	depends on PPC_BOOK3S_64
>   	select ARCH_HAS_FAST_MULTIPLIER
> +	select PPC_HAS_LBARX_LHARX
>   
>   config POWER8_CPU
>   	bool "POWER8"
>   	depends on PPC_BOOK3S_64
>   	select ARCH_HAS_FAST_MULTIPLIER
> +	select PPC_HAS_LBARX_LHARX
>   
>   config POWER9_CPU
>   	bool "POWER9"
>   	depends on PPC_BOOK3S_64
>   	select ARCH_HAS_FAST_MULTIPLIER
> +	select PPC_HAS_LBARX_LHARX
>   
>   config E5500_CPU
>   	bool "Freescale e5500"
> @@ -170,6 +174,7 @@ config E5500_CPU
>   config E6500_CPU
>   	bool "Freescale e6500"
>   	depends on E500
> +	select PPC_HAS_LBARX_LHARX
>   
>   config 860_CPU
>   	bool "8xx family"
