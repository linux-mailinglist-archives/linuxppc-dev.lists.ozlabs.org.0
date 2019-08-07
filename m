Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FD2584FF1
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Aug 2019 17:32:10 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 463b8l14dTzDqgM
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Aug 2019 01:32:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="sRJQtK8f"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 463ZT30ck9zDqdr
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Aug 2019 01:01:11 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 463ZSy223gz9vBn3;
 Wed,  7 Aug 2019 17:01:06 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=sRJQtK8f; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id m0nSBStJOG36; Wed,  7 Aug 2019 17:01:06 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 463ZSy0pcTz9vBn1;
 Wed,  7 Aug 2019 17:01:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1565190066; bh=KTk/jsxYEOr2RjeIKWnkX+Ltl2is2fgwnpKFsrOk8/8=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=sRJQtK8fCvFmVa5upXjuwDOGm9hGZjkc/VKJJ9WW668ZltUiWrsQqJwp1omtrCIZe
 U7GkK+wllXv3obOKwfAHc+Y8576hosyLgeH23Eus1lpYZqAynEF9J0Gf0qpsM/skE6
 Qhfn7lKU+36eYgf0PKqlrsae12jN09GVpjfSIXUE=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id B64BC8B835;
 Wed,  7 Aug 2019 17:01:07 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id lLYk9-4xDcJM; Wed,  7 Aug 2019 17:01:07 +0200 (CEST)
Received: from [172.25.230.101] (po15451.idsi0.si.c-s.fr [172.25.230.101])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 885588B832;
 Wed,  7 Aug 2019 17:01:07 +0200 (CEST)
Subject: Re: [PATCH 3/4] powerpc: support KASAN instrumentation of bitops
To: Daniel Axtens <dja@axtens.net>, aneesh.kumar@linux.ibm.com,
 bsingharora@gmail.com
References: <20190806233827.16454-1-dja@axtens.net>
 <20190806233827.16454-4-dja@axtens.net>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <b96900fd-2b43-f6b9-0d22-2d715370baf0@c-s.fr>
Date: Wed, 7 Aug 2019 17:01:07 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190806233827.16454-4-dja@axtens.net>
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
Cc: linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>,
 kasan-dev@googlegroups.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 07/08/2019 à 01:38, Daniel Axtens a écrit :
> In KASAN development I noticed that the powerpc-specific bitops
> were not being picked up by the KASAN test suite.
> 
> Instrumentation is done via the bitops-instrumented.h header. It
> requies that arch-specific versions of bitop functions are renamed
> to arch_*. Do this renaming.
> 
> For clear_bit_unlock_is_negative_byte, the current implementation
> uses the PG_waiter constant. This works because it's a preprocessor
> macro - so it's only actually evaluated in contexts where PG_waiter
> is defined. With instrumentation however, it becomes a static inline
> function, and all of a sudden we need the actual value of PG_waiter.
> Because of the order of header includes, it's not available and we
> fail to compile. Instead, manually specify that we care about bit 7.
> This is still correct: bit 7 is the bit that would mark a negative
> byte, but it does obscure the origin a little bit.
> 
> Cc: Nicholas Piggin <npiggin@gmail.com> # clear_bit_unlock_negative_byte
> Signed-off-by: Daniel Axtens <dja@axtens.net>
> ---
>   arch/powerpc/include/asm/bitops.h | 25 ++++++++++++++-----------
>   1 file changed, 14 insertions(+), 11 deletions(-)
> 
> diff --git a/arch/powerpc/include/asm/bitops.h b/arch/powerpc/include/asm/bitops.h
> index 603aed229af7..19dc16e62e6a 100644
> --- a/arch/powerpc/include/asm/bitops.h
> +++ b/arch/powerpc/include/asm/bitops.h
> @@ -86,22 +86,22 @@ DEFINE_BITOP(clear_bits, andc, "")
>   DEFINE_BITOP(clear_bits_unlock, andc, PPC_RELEASE_BARRIER)
>   DEFINE_BITOP(change_bits, xor, "")
>   
> -static __inline__ void set_bit(int nr, volatile unsigned long *addr)
> +static __inline__ void arch_set_bit(int nr, volatile unsigned long *addr)
>   {
>   	set_bits(BIT_MASK(nr), addr + BIT_WORD(nr));
>   }
>   
> -static __inline__ void clear_bit(int nr, volatile unsigned long *addr)
> +static __inline__ void arch_clear_bit(int nr, volatile unsigned long *addr)
>   {
>   	clear_bits(BIT_MASK(nr), addr + BIT_WORD(nr));
>   }
>   
> -static __inline__ void clear_bit_unlock(int nr, volatile unsigned long *addr)
> +static __inline__ void arch_clear_bit_unlock(int nr, volatile unsigned long *addr)
>   {
>   	clear_bits_unlock(BIT_MASK(nr), addr + BIT_WORD(nr));
>   }
>   
> -static __inline__ void change_bit(int nr, volatile unsigned long *addr)
> +static __inline__ void arch_change_bit(int nr, volatile unsigned long *addr)
>   {
>   	change_bits(BIT_MASK(nr), addr + BIT_WORD(nr));
>   }
> @@ -138,26 +138,26 @@ DEFINE_TESTOP(test_and_clear_bits, andc, PPC_ATOMIC_ENTRY_BARRIER,
>   DEFINE_TESTOP(test_and_change_bits, xor, PPC_ATOMIC_ENTRY_BARRIER,
>   	      PPC_ATOMIC_EXIT_BARRIER, 0)
>   
> -static __inline__ int test_and_set_bit(unsigned long nr,
> +static __inline__ int arch_test_and_set_bit(unsigned long nr,
>   				       volatile unsigned long *addr)
>   {
>   	return test_and_set_bits(BIT_MASK(nr), addr + BIT_WORD(nr)) != 0;
>   }
>   
> -static __inline__ int test_and_set_bit_lock(unsigned long nr,
> +static __inline__ int arch_test_and_set_bit_lock(unsigned long nr,
>   				       volatile unsigned long *addr)
>   {
>   	return test_and_set_bits_lock(BIT_MASK(nr),
>   				addr + BIT_WORD(nr)) != 0;
>   }
>   
> -static __inline__ int test_and_clear_bit(unsigned long nr,
> +static __inline__ int arch_test_and_clear_bit(unsigned long nr,
>   					 volatile unsigned long *addr)
>   {
>   	return test_and_clear_bits(BIT_MASK(nr), addr + BIT_WORD(nr)) != 0;
>   }
>   
> -static __inline__ int test_and_change_bit(unsigned long nr,
> +static __inline__ int arch_test_and_change_bit(unsigned long nr,
>   					  volatile unsigned long *addr)
>   {
>   	return test_and_change_bits(BIT_MASK(nr), addr + BIT_WORD(nr)) != 0;
> @@ -186,14 +186,14 @@ static __inline__ unsigned long clear_bit_unlock_return_word(int nr,
>   }
>   
>   /* This is a special function for mm/filemap.c */
> -#define clear_bit_unlock_is_negative_byte(nr, addr)			\
> -	(clear_bit_unlock_return_word(nr, addr) & BIT_MASK(PG_waiters))
> +#define arch_clear_bit_unlock_is_negative_byte(nr, addr)		\
> +	(clear_bit_unlock_return_word(nr, addr) & BIT_MASK(7))

Maybe add a comment reminding that 7 is PG_waiters ?

Christophe

>   
>   #endif /* CONFIG_PPC64 */
>   
>   #include <asm-generic/bitops/non-atomic.h>
>   
> -static __inline__ void __clear_bit_unlock(int nr, volatile unsigned long *addr)
> +static __inline__ void arch___clear_bit_unlock(int nr, volatile unsigned long *addr)
>   {
>   	__asm__ __volatile__(PPC_RELEASE_BARRIER "" ::: "memory");
>   	__clear_bit(nr, addr);
> @@ -239,6 +239,9 @@ unsigned long __arch_hweight64(__u64 w);
>   
>   #include <asm-generic/bitops/find.h>
>   
> +/* wrappers that deal with KASAN instrumentation */
> +#include <asm-generic/bitops-instrumented.h>
> +
>   /* Little-endian versions */
>   #include <asm-generic/bitops/le.h>
>   
> 
