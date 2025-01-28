Return-Path: <linuxppc-dev+bounces-5623-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 37655A20C4B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Jan 2025 15:50:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Yj7Vn3xVYz2yFQ;
	Wed, 29 Jan 2025 01:50:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1738075809;
	cv=none; b=Jka+eDIECYHKJfhlyTnakOf1OG9fIGnhKfZFMDF/Dgcxf31UxUU4RG0XlJWMcMmyEKBOgiBehJHFpe32EFXKfW/CLyhWShBlqSFRJN35kHpmF+gW3RtT7sk3IydBiYIMT59QZm4AYNFCmJWI/RQ8wfiJuicu68EbFfHtoKICaqfm4W1ikY5b9N2Em2CitmyC2igd/IybzRQTfr2DSTg+enlVWh8XB/e/KWC22m468/CWE/4AvrzjAUKhXIooncajehucV/i361sT0W/NO7QY621Zb9+ZZCmlDC+BeG9Ao/OVfn6FUInCQGf0XLaKgP5L2UijAVf3jU7+oddIBfciiA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1738075809; c=relaxed/relaxed;
	bh=v8rx29aODKZQ/QTpLQJWlW1XvZwgL4O72zf9Ps5EtdI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=czXWEL/ZQRSsbhEsQdPWIhkjMe/59Lhr4GhEGHpD9yoOiYQE5XYI4h+GQr1Q7MEjogKi0syPEgOdaJLmWv0KFXq1ex6ku7F/DKT73CSE5vjaXcVFdK4aTzLzswLin6a1jQXJnPGzPYMx0g206uLi5dwGiOUziXlxiRnu59xpLPy9gjp9qa84Mjm3h5sWiBNOn/5ixdk4kB5ObHpk+SRSCIgacPhfPahpcMo5znVzCSFH86JMTIRLbEknwe6GJ3ui8WGAS2iRRrdZRMbo9xE0tInY/N0vOdUXyOKx4pJmryayW4dGhRCTS+XQ0hFenRWdns1+Vaq0bu/TFfx+CMOGsQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Yj7Vm3tRNz2xYs
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Jan 2025 01:50:04 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4Yj6lr3jtZz9sSK;
	Tue, 28 Jan 2025 15:16:24 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0LWxEzj7XUTG; Tue, 28 Jan 2025 15:16:24 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4Yj6lr2pLWz9sSH;
	Tue, 28 Jan 2025 15:16:24 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 4E9F98B76C;
	Tue, 28 Jan 2025 15:16:24 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id 4LnEuDnMqUOR; Tue, 28 Jan 2025 15:16:24 +0100 (CET)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id D63C48B763;
	Tue, 28 Jan 2025 15:16:23 +0100 (CET)
Message-ID: <81ee3098-1e43-4b88-975a-d223bc2338e8@csgroup.eu>
Date: Tue, 28 Jan 2025 15:16:23 +0100
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] powerpc: Remove eieio in _memcpy_fromio
To: Julian Vetter <julian@outer-limits.org>, Arnd Bergmann <arnd@arndb.de>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Naveen N Rao <naveen@kernel.org>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
References: <20250128135711.1625747-1-julian@outer-limits.org>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <20250128135711.1625747-1-julian@outer-limits.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org



Le 28/01/2025 à 14:57, Julian Vetter a écrit :
> Remove the eieio() calls in _memcpy_fromio, to bring its implementation
> closer to the one from lib/iomem_copy.c. These eieio() calls don't seem
> to be necessary, because the _memcpy_toio completely omits them. Also
> the legacy code from ppc was not doing them.

What do you mean exactly by "legacy code" ?

As far as I can see they were already there before commit 68a64357d15a 
("[POWERPC] Merge 32 and 64 bits asm-powerpc/io.h"):

-static inline void eeh_memcpy_fromio(void *dest, const volatile void 
__iomem *src,
+static inline void eeh_memcpy_fromio(void *dest, const
+				     volatile void __iomem *src,
  				     unsigned long n)
  {
-	void *vsrc = (void __force *) src;
-	void *destsave = dest;
-	unsigned long nsave = n;
-
-	__asm__ __volatile__ ("sync" : : : "memory");
-	while(n && (!EEH_CHECK_ALIGN(vsrc, 4) || !EEH_CHECK_ALIGN(dest, 4))) {
-		*((u8 *)dest) = *((volatile u8 *)vsrc);
-		__asm__ __volatile__ ("eieio" : : : "memory");
-		vsrc++;
-		dest++;
-		n--;
-	}
-	while(n > 4) {
-		*((u32 *)dest) = *((volatile u32 *)vsrc);
-		__asm__ __volatile__ ("eieio" : : : "memory");
-		vsrc += 4;
-		dest += 4;
-		n -= 4;
-	}
-	while(n) {
-		*((u8 *)dest) = *((volatile u8 *)vsrc);
-		__asm__ __volatile__ ("eieio" : : : "memory");
-		vsrc++;
-		dest++;
-		n--;
-	}
-	__asm__ __volatile__ ("sync" : : : "memory");
+	_memcpy_fromio(dest, src, n);

  	/* Look for ffff's here at dest[n].  Assume that at least 4 bytes
  	 * were copied. Check all four bytes.
  	 */
-	if ((nsave >= 4) &&
-		(EEH_POSSIBLE_ERROR((*((u32 *) destsave+nsave-4)), u32))) {
-		eeh_check_failure(src, (*((u32 *) destsave+nsave-4)));
-	}
+	if (n >= 4 && EEH_POSSIBLE_ERROR(*((u32 *)(dest + n - 4)), u32))
+		eeh_check_failure(src, *((u32 *)(dest + n - 4)));
  }



> 
> Signed-off-by: Julian Vetter <julian@outer-limits.org>
> ---
>   arch/powerpc/kernel/io.c | 3 ---
>   1 file changed, 3 deletions(-)
> 
> diff --git a/arch/powerpc/kernel/io.c b/arch/powerpc/kernel/io.c
> index 6af535905984..81e5d54260a1 100644
> --- a/arch/powerpc/kernel/io.c
> +++ b/arch/powerpc/kernel/io.c
> @@ -155,21 +155,18 @@ void _memcpy_fromio(void *dest, const volatile void __iomem *src,
>          __asm__ __volatile__ ("sync" : : : "memory");
>          while(n && (!IO_CHECK_ALIGN(vsrc, 4) || !IO_CHECK_ALIGN(dest, 4))) {
>                  *((u8 *)dest) = *((volatile u8 *)vsrc);
> -               eieio();
>                  vsrc++;
>                  dest++;
>                  n--;
>          }
>          while(n >= 4) {
>                  *((u32 *)dest) = *((volatile u32 *)vsrc);
> -               eieio();
>                  vsrc += 4;
>                  dest += 4;
>                  n -= 4;
>          }
>          while(n) {
>                  *((u8 *)dest) = *((volatile u8 *)vsrc);
> -               eieio();
>                  vsrc++;
>                  dest++;
>                  n--;
> --
> 2.34.1
> 


