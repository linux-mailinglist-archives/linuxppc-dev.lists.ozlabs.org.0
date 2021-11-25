Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C2C245D85D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Nov 2021 11:43:07 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J0Dx521Pbz3cBK
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Nov 2021 21:43:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J0Dwf3YXjz2ynj
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Nov 2021 21:42:39 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4J0DwY21xqz9sSF;
 Thu, 25 Nov 2021 11:42:37 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nw29zLpg9ntr; Thu, 25 Nov 2021 11:42:37 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4J0DwY0pwpz9sRt;
 Thu, 25 Nov 2021 11:42:37 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id F23758B77A;
 Thu, 25 Nov 2021 11:42:36 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id glwMjUd7MNY6; Thu, 25 Nov 2021 11:42:36 +0100 (CET)
Received: from [192.168.203.227] (unknown [192.168.203.227])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 485A28B763;
 Thu, 25 Nov 2021 11:42:36 +0100 (CET)
Message-ID: <3f3578d4-168e-54ef-a3a7-cb7ec2aed43c@csgroup.eu>
Date: Thu, 25 Nov 2021 11:42:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v2 9/9] powerpc: Simplify and move arch_randomize_brk()
Content-Language: fr-FR
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>,
 alex@ghiti.fr
References: <cover.1637828367.git.christophe.leroy@csgroup.eu>
 <4c5a2b18774552c2226573f7069ffeee71ad77cb.1637828367.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <4c5a2b18774552c2226573f7069ffeee71ad77cb.1637828367.git.christophe.leroy@csgroup.eu>
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
Cc: linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 25/11/2021 à 09:23, Christophe Leroy a écrit :
> arch_randomize_brk() is only needed for hash on book3s/64, for other
> platforms the one provided by the default mmap layout is good enough.
> 
> Move it to hash_utils.c and use randomize_page() like the generic one.
> 
> And properly opt out the radix case instead of making an assumption
> on mmu_highuser_ssize.
> 
> Also change to a 32M range like most other architectures instead of 8M.
> 
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---
> v2: New
> ---
>   arch/powerpc/kernel/process.c         | 40 ---------------------------
>   arch/powerpc/mm/book3s64/hash_utils.c | 18 ++++++++++++
>   include/linux/sizes.h                 |  2 ++
>   3 files changed, 20 insertions(+), 40 deletions(-)
> 
> diff --git a/arch/powerpc/kernel/process.c b/arch/powerpc/kernel/process.c
> index 406d7ee9e322..f1f2f17543d6 100644
> --- a/arch/powerpc/kernel/process.c
> +++ b/arch/powerpc/kernel/process.c
> @@ -2274,43 +2274,3 @@ unsigned long arch_align_stack(unsigned long sp)
>   		sp -= get_random_int() & ~PAGE_MASK;
>   	return sp & ~0xf;
>   }
> -
> -static inline unsigned long brk_rnd(void)
> -{
> -        unsigned long rnd = 0;
> -
> -	/* 8MB for 32bit, 1GB for 64bit */
> -	if (is_32bit_task())
> -		rnd = (get_random_long() % (1UL<<(23-PAGE_SHIFT)));
> -	else
> -		rnd = (get_random_long() % (1UL<<(30-PAGE_SHIFT)));
> -
> -	return rnd << PAGE_SHIFT;
> -}
> -
> -unsigned long arch_randomize_brk(struct mm_struct *mm)
> -{
> -	unsigned long base = mm->brk;
> -	unsigned long ret;
> -
> -#ifdef CONFIG_PPC_BOOK3S_64
> -	/*
> -	 * If we are using 1TB segments and we are allowed to randomise
> -	 * the heap, we can put it above 1TB so it is backed by a 1TB
> -	 * segment. Otherwise the heap will be in the bottom 1TB
> -	 * which always uses 256MB segments and this may result in a
> -	 * performance penalty. We don't need to worry about radix. For
> -	 * radix, mmu_highuser_ssize remains unchanged from 256MB.
> -	 */
> -	if (!is_32bit_task() && (mmu_highuser_ssize == MMU_SEGSIZE_1T))
> -		base = max_t(unsigned long, mm->brk, 1UL << SID_SHIFT_1T);
> -#endif
> -
> -	ret = PAGE_ALIGN(base + brk_rnd());
> -
> -	if (ret < mm->brk)
> -		return mm->brk;
> -
> -	return ret;
> -}
> -
> diff --git a/arch/powerpc/mm/book3s64/hash_utils.c b/arch/powerpc/mm/book3s64/hash_utils.c
> index 1d09d4aeddbf..3521fad6a479 100644
> --- a/arch/powerpc/mm/book3s64/hash_utils.c
> +++ b/arch/powerpc/mm/book3s64/hash_utils.c
> @@ -37,6 +37,7 @@
>   #include <linux/cpu.h>
>   #include <linux/pgtable.h>
>   #include <linux/debugfs.h>
> +#include <linux/random.h>

Also need <linux/elf-randomize.h> to get the declaration of 
arch_randomize_brk() and make sparse happy :)

Michael can you add it if you apply this version ?

Thanks

>   
>   #include <asm/interrupt.h>
>   #include <asm/processor.h>
> @@ -2072,3 +2073,20 @@ void __init print_system_hash_info(void)
>   	if (htab_hash_mask)
>   		pr_info("htab_hash_mask    = 0x%lx\n", htab_hash_mask);
>   }
> +
> +unsigned long arch_randomize_brk(struct mm_struct *mm)
> +{
> +	/*
> +	 * If we are using 1TB segments and we are allowed to randomise
> +	 * the heap, we can put it above 1TB so it is backed by a 1TB
> +	 * segment. Otherwise the heap will be in the bottom 1TB
> +	 * which always uses 256MB segments and this may result in a
> +	 * performance penalty.
> +	 */
> +	if (is_32bit_task())
> +		return randomize_page(mm->brk, SZ_32M);
> +	else if (!radix_enabled() && mmu_highuser_ssize == MMU_SEGSIZE_1T)
> +		return randomize_page(max_t(unsigned long, mm->brk, SZ_1T), SZ_1G);
> +	else
> +		return randomize_page(mm->brk, SZ_1G);
> +}
> diff --git a/include/linux/sizes.h b/include/linux/sizes.h
> index 1ac79bcee2bb..84aa448d8bb3 100644
> --- a/include/linux/sizes.h
> +++ b/include/linux/sizes.h
> @@ -47,6 +47,8 @@
>   #define SZ_8G				_AC(0x200000000, ULL)
>   #define SZ_16G				_AC(0x400000000, ULL)
>   #define SZ_32G				_AC(0x800000000, ULL)
> +
> +#define SZ_1T				_AC(0x10000000000, ULL)
>   #define SZ_64T				_AC(0x400000000000, ULL)
>   
>   #endif /* __LINUX_SIZES_H__ */
> 
