Return-Path: <linuxppc-dev+bounces-12347-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F947B803F8
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Sep 2025 16:50:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cRhXF2Krdz2xnk;
	Thu, 18 Sep 2025 00:50:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1758120637;
	cv=none; b=fODVhN2YOejt+lMIosAIO0Emg/yiqBEOMMFD+dUekzdgDx2UfQAgY1nHLdJD3ZSN63Xa3ra5zDAIPLQJuS37ol4Ea2HqQT3KV97GaIYkWiWtfd+x6Ws0wbDwsSEXS4y+6R/oTcA9KnHMFWjZXqSigvUYnHcKUvOhMksSQ8jCXKxWW0KkKvPejSd0nDoN3piigLhJDtpo3714oAGmxvGerRJN3qeccQicx/2Px7wRWwdt9nDBS7acsmR5dt/+ctklTrJmheCK9jcuwpnU9LNxB2iKOIMgDnM5iqP00ZzQHgPys7ARVIPhGApC6kDoAersuAo0QOU0bmdDG7+86L4dlw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1758120637; c=relaxed/relaxed;
	bh=pr9HShFLWAZ0zqoQZZFJXZn5UK/pFrU9i8C6/j59RAk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=R05nlmGTHYYm7Vi3iWre4VI2DdvDFGJMQMoUBAqoT87NZ+RU83uIzL9ZAzGlb62qP477aKh9410TH4/yOqFskrVzhH6RTm6L4J51FulJ5fPFTEm+sr0Fgnrkt4WrMj3yu4O+DuaIRuJpRSuVEhbKwGmybuHw8NDIsAUrOaZJnP1GYjMuJytHjyF9OVdG7+yjE2rRRvs04wrH5SCZC6Au4x978R44O5ajGzq7MplTEPRLCUalV+3CTmMjYLlm+Xullb5ALGmF+RSkf5TB9b082ndBYbkGCZ8+Vki50MXD5sXYrIt+P+sqpB5fSfQ+7Hevkp1WcCAmBauW6HWtom4ddw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cRhXD1YKHz2xgQ
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Sep 2025 00:50:35 +1000 (AEST)
Received: from localhost (mailhub4.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4cRhL8185Cz9sxm;
	Wed, 17 Sep 2025 16:41:52 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JixBRAxvbto3; Wed, 17 Sep 2025 16:41:52 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4cRhL76yxbz9sxl;
	Wed, 17 Sep 2025 16:41:51 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id D0FA18B76C;
	Wed, 17 Sep 2025 16:41:51 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id VStNY412crOA; Wed, 17 Sep 2025 16:41:51 +0200 (CEST)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 452048B767;
	Wed, 17 Sep 2025 16:41:50 +0200 (CEST)
Message-ID: <41d100c5-4706-400e-a61a-46b068f1bc74@csgroup.eu>
Date: Wed, 17 Sep 2025 16:41:49 +0200
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
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 07/36] powerpc/vdso: Explicitly include asm/cputable.h
 and asm/feature-fixups.h
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
 Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>, Arnd Bergmann
 <arnd@arndb.de>, "David S. Miller" <davem@davemloft.net>,
 Andreas Larsson <andreas@gaisler.com>, Nick Alcock <nick.alcock@oracle.com>,
 John Stultz <jstultz@google.com>, Stephen Boyd <sboyd@kernel.org>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Shuah Khan <shuah@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Theodore Ts'o <tytso@mit.edu>,
 "Jason A. Donenfeld" <Jason@zx2c4.com>, Russell King
 <linux@armlinux.org.uk>, Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>,
 Nagarathnam Muthusamy <nagarathnam.muthusamy@oracle.com>,
 Shannon Nelson <sln@onemain.com>, Nicholas Piggin <npiggin@gmail.com>
Cc: linux-kernel@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev,
 linux-mips@vger.kernel.org, linux-s390@vger.kernel.org
References: <20250917-vdso-sparc64-generic-2-v3-0-3679b1bc8ee8@linutronix.de>
 <20250917-vdso-sparc64-generic-2-v3-7-3679b1bc8ee8@linutronix.de>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Content-Language: fr-FR
In-Reply-To: <20250917-vdso-sparc64-generic-2-v3-7-3679b1bc8ee8@linutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=3.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



Le 17/09/2025 à 16:00, Thomas Weißschuh a écrit :
> The usage of ASM_FTR_IFCLR(CPU_TR_ARCH_31) requires asm/cputable.h and
> asm/feature-fixups.h. Currently these headers are included transitively,
> but that transitive inclusion is about to go away.

Hum ...

That was unexpectedly added by commit 9c7bfc2dc21e ("powerpc/64s: Make 
POWER10 and later use pause_short in cpu_relax loops")

In theory, vdso/ headers shouldn't include any headers outside of vdso/


> 
> Explicitly include the headers.
> 
> Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
> ---
>   arch/powerpc/include/asm/vdso/processor.h | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/arch/powerpc/include/asm/vdso/processor.h b/arch/powerpc/include/asm/vdso/processor.h
> index 80d13207c5688d73954822aede2bbe2d0e05c054..42b64903bdf47cc5bd571fc3b5caed45e6358cb9 100644
> --- a/arch/powerpc/include/asm/vdso/processor.h
> +++ b/arch/powerpc/include/asm/vdso/processor.h
> @@ -4,6 +4,9 @@
>   
>   #ifndef __ASSEMBLY__

__ASSEMBLY__ is replaced by __ASSEMBLER__ in powerpc-next in commit 
74db6cc331b0 ("powerpc: Replace __ASSEMBLY__ with __ASSEMBLER__ in 
non-uapi headers")

>   
> +#include <asm/cputable.h>
> +#include <asm/feature-fixups.h>
> +
>   /* Macros for adjusting thread priority (hardware multi-threading) */
>   #ifdef CONFIG_PPC64
>   #define HMT_very_low()		asm volatile("or 31, 31, 31	# very low priority")
> 


