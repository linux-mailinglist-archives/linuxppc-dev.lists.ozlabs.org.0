Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D5A9384FEC
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Aug 2019 17:30:17 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 463b6Y1BwszDqb9
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Aug 2019 01:30:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="OnboGd7K"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 463ZPf6fJnzDqnw
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Aug 2019 00:58:11 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 463ZPS6L3Xz9vBmt;
 Wed,  7 Aug 2019 16:58:04 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=OnboGd7K; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id KfhgThT8rrv3; Wed,  7 Aug 2019 16:58:04 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 463ZPS56BXz9vBmK;
 Wed,  7 Aug 2019 16:58:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1565189884; bh=ZXMwBhMnE2fxHI+Z/uLlnfh3kEwMCmIcy0QbJ9cqoeM=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=OnboGd7KVOmr86q8rUHK7AbVtBz5r40WjS7ya2H4Ai+XMsgK14IMau1M+lAeFzM1T
 yV8B6J4t6J7IbGoESgD/cd+572lMgPPRlcpkWRHYbaIeOPeQpBkqm/AHlIEXW3Q0Xr
 jhmyFtPQ8XcheDXbwmWeWZumr7+mBlISy6qm8+uM=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 625DD8B832;
 Wed,  7 Aug 2019 16:58:06 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 89Fy8lsRt1wx; Wed,  7 Aug 2019 16:58:06 +0200 (CEST)
Received: from [172.25.230.101] (po15451.idsi0.si.c-s.fr [172.25.230.101])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 374988B81F;
 Wed,  7 Aug 2019 16:58:06 +0200 (CEST)
Subject: Re: [PATCH 2/4] kasan: support instrumented bitops with generic
 non-atomic bitops
To: Daniel Axtens <dja@axtens.net>, aneesh.kumar@linux.ibm.com,
 bsingharora@gmail.com
References: <20190806233827.16454-1-dja@axtens.net>
 <20190806233827.16454-3-dja@axtens.net>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <107dda59-45ce-98f4-4959-187f35514728@c-s.fr>
Date: Wed, 7 Aug 2019 16:58:06 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190806233827.16454-3-dja@axtens.net>
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
Cc: linuxppc-dev@lists.ozlabs.org, kasan-dev@googlegroups.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 07/08/2019 à 01:38, Daniel Axtens a écrit :
> Currently bitops-instrumented.h assumes that the architecture provides
> both the atomic and non-atomic versions of the bitops (e.g. both
> set_bit and __set_bit). This is true on x86, but is not always true:
> there is a generic bitops/non-atomic.h header that provides generic
> non-atomic versions. powerpc uses this generic version, so it does
> not have it's own e.g. __set_bit that could be renamed arch___set_bit.
> 
> Rearrange bitops-instrumented.h. As operations in bitops/non-atomic.h
> will already be instrumented (they use regular memory accesses), put
> the instrumenting wrappers for them behind an ifdef. Only include
> these instrumentation wrappers if non-atomic.h has not been included.

What about moving and splitting bitops-instrumented.h into:
bitops/atomic-instrumented.h
bitops/non-atomic-instrumented.h
bitops/lock-instrumented.h

I think that would be cleaner than hacking the file with the _GUARDS_ of 
another header file (is that method used anywhere else in header files ?)

Christophe

> 
> Signed-off-by: Daniel Axtens <dja@axtens.net>
> ---
>   include/asm-generic/bitops-instrumented.h | 144 ++++++++++++----------
>   1 file changed, 76 insertions(+), 68 deletions(-)
> 
> diff --git a/include/asm-generic/bitops-instrumented.h b/include/asm-generic/bitops-instrumented.h
> index ddd1c6d9d8db..2fe8f7e12a11 100644
> --- a/include/asm-generic/bitops-instrumented.h
> +++ b/include/asm-generic/bitops-instrumented.h
> @@ -29,21 +29,6 @@ static inline void set_bit(long nr, volatile unsigned long *addr)
>   	arch_set_bit(nr, addr);
>   }
>   
> -/**
> - * __set_bit - Set a bit in memory
> - * @nr: the bit to set
> - * @addr: the address to start counting from
> - *
> - * Unlike set_bit(), this function is non-atomic. If it is called on the same
> - * region of memory concurrently, the effect may be that only one operation
> - * succeeds.
> - */
> -static inline void __set_bit(long nr, volatile unsigned long *addr)
> -{
> -	kasan_check_write(addr + BIT_WORD(nr), sizeof(long));
> -	arch___set_bit(nr, addr);
> -}
> -
>   /**
>    * clear_bit - Clears a bit in memory
>    * @nr: Bit to clear
> @@ -57,21 +42,6 @@ static inline void clear_bit(long nr, volatile unsigned long *addr)
>   	arch_clear_bit(nr, addr);
>   }
>   
> -/**
> - * __clear_bit - Clears a bit in memory
> - * @nr: the bit to clear
> - * @addr: the address to start counting from
> - *
> - * Unlike clear_bit(), this function is non-atomic. If it is called on the same
> - * region of memory concurrently, the effect may be that only one operation
> - * succeeds.
> - */
> -static inline void __clear_bit(long nr, volatile unsigned long *addr)
> -{
> -	kasan_check_write(addr + BIT_WORD(nr), sizeof(long));
> -	arch___clear_bit(nr, addr);
> -}
> -
>   /**
>    * clear_bit_unlock - Clear a bit in memory, for unlock
>    * @nr: the bit to set
> @@ -116,21 +86,6 @@ static inline void change_bit(long nr, volatile unsigned long *addr)
>   	arch_change_bit(nr, addr);
>   }
>   
> -/**
> - * __change_bit - Toggle a bit in memory
> - * @nr: the bit to change
> - * @addr: the address to start counting from
> - *
> - * Unlike change_bit(), this function is non-atomic. If it is called on the same
> - * region of memory concurrently, the effect may be that only one operation
> - * succeeds.
> - */
> -static inline void __change_bit(long nr, volatile unsigned long *addr)
> -{
> -	kasan_check_write(addr + BIT_WORD(nr), sizeof(long));
> -	arch___change_bit(nr, addr);
> -}
> -
>   /**
>    * test_and_set_bit - Set a bit and return its old value
>    * @nr: Bit to set
> @@ -144,20 +99,6 @@ static inline bool test_and_set_bit(long nr, volatile unsigned long *addr)
>   	return arch_test_and_set_bit(nr, addr);
>   }
>   
> -/**
> - * __test_and_set_bit - Set a bit and return its old value
> - * @nr: Bit to set
> - * @addr: Address to count from
> - *
> - * This operation is non-atomic. If two instances of this operation race, one
> - * can appear to succeed but actually fail.
> - */
> -static inline bool __test_and_set_bit(long nr, volatile unsigned long *addr)
> -{
> -	kasan_check_write(addr + BIT_WORD(nr), sizeof(long));
> -	return arch___test_and_set_bit(nr, addr);
> -}
> -
>   /**
>    * test_and_set_bit_lock - Set a bit and return its old value, for lock
>    * @nr: Bit to set
> @@ -187,30 +128,96 @@ static inline bool test_and_clear_bit(long nr, volatile unsigned long *addr)
>   }
>   
>   /**
> - * __test_and_clear_bit - Clear a bit and return its old value
> - * @nr: Bit to clear
> + * test_and_change_bit - Change a bit and return its old value
> + * @nr: Bit to change
> + * @addr: Address to count from
> + *
> + * This is an atomic fully-ordered operation (implied full memory barrier).
> + */
> +static inline bool test_and_change_bit(long nr, volatile unsigned long *addr)
> +{
> +	kasan_check_write(addr + BIT_WORD(nr), sizeof(long));
> +	return arch_test_and_change_bit(nr, addr);
> +}
> +
> +/*
> + * If the arch is using the generic non-atomic bit ops, they are already
> + * instrumented, and we don't need to create wrappers. Only wrap if we
> + * haven't included that header.
> + */
> +#ifndef _ASM_GENERIC_BITOPS_NON_ATOMIC_H_
> +
> +/**
> + * __set_bit - Set a bit in memory
> + * @nr: the bit to set
> + * @addr: the address to start counting from
> + *
> + * Unlike set_bit(), this function is non-atomic. If it is called on the same
> + * region of memory concurrently, the effect may be that only one operation
> + * succeeds.
> + */
> +static inline void __set_bit(long nr, volatile unsigned long *addr)
> +{
> +	kasan_check_write(addr + BIT_WORD(nr), sizeof(long));
> +	arch___set_bit(nr, addr);
> +}
> +
> +/**
> + * __clear_bit - Clears a bit in memory
> + * @nr: the bit to clear
> + * @addr: the address to start counting from
> + *
> + * Unlike clear_bit(), this function is non-atomic. If it is called on the same
> + * region of memory concurrently, the effect may be that only one operation
> + * succeeds.
> + */
> +static inline void __clear_bit(long nr, volatile unsigned long *addr)
> +{
> +	kasan_check_write(addr + BIT_WORD(nr), sizeof(long));
> +	arch___clear_bit(nr, addr);
> +}
> +
> +/**
> + * __change_bit - Toggle a bit in memory
> + * @nr: the bit to change
> + * @addr: the address to start counting from
> + *
> + * Unlike change_bit(), this function is non-atomic. If it is called on the same
> + * region of memory concurrently, the effect may be that only one operation
> + * succeeds.
> + */
> +static inline void __change_bit(long nr, volatile unsigned long *addr)
> +{
> +	kasan_check_write(addr + BIT_WORD(nr), sizeof(long));
> +	arch___change_bit(nr, addr);
> +}
> +
> +/**
> + * __test_and_set_bit - Set a bit and return its old value
> + * @nr: Bit to set
>    * @addr: Address to count from
>    *
>    * This operation is non-atomic. If two instances of this operation race, one
>    * can appear to succeed but actually fail.
>    */
> -static inline bool __test_and_clear_bit(long nr, volatile unsigned long *addr)
> +static inline bool __test_and_set_bit(long nr, volatile unsigned long *addr)
>   {
>   	kasan_check_write(addr + BIT_WORD(nr), sizeof(long));
> -	return arch___test_and_clear_bit(nr, addr);
> +	return arch___test_and_set_bit(nr, addr);
>   }
>   
>   /**
> - * test_and_change_bit - Change a bit and return its old value
> - * @nr: Bit to change
> + * __test_and_clear_bit - Clear a bit and return its old value
> + * @nr: Bit to clear
>    * @addr: Address to count from
>    *
> - * This is an atomic fully-ordered operation (implied full memory barrier).
> + * This operation is non-atomic. If two instances of this operation race, one
> + * can appear to succeed but actually fail.
>    */
> -static inline bool test_and_change_bit(long nr, volatile unsigned long *addr)
> +static inline bool __test_and_clear_bit(long nr, volatile unsigned long *addr)
>   {
>   	kasan_check_write(addr + BIT_WORD(nr), sizeof(long));
> -	return arch_test_and_change_bit(nr, addr);
> +	return arch___test_and_clear_bit(nr, addr);
>   }
>   
>   /**
> @@ -237,6 +244,7 @@ static inline bool test_bit(long nr, const volatile unsigned long *addr)
>   	kasan_check_read(addr + BIT_WORD(nr), sizeof(long));
>   	return arch_test_bit(nr, addr);
>   }
> +#endif /* _ASM_GENERIC_BITOPS_NON_ATOMIC_H_ */
>   
>   #if defined(arch_clear_bit_unlock_is_negative_byte)
>   /**
> 
