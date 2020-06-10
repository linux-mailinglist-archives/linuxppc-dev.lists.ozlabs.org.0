Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id CFEE01F5520
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Jun 2020 14:46:47 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49hmvn1rTzzDqnF
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Jun 2020 22:46:45 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 49hmqx3SkvzDqkw
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Jun 2020 22:43:21 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 49hmqk5w25z9v12C;
 Wed, 10 Jun 2020 14:43:14 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id EbM19PQVxJBp; Wed, 10 Jun 2020 14:43:14 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 49hmqk4w60z9v127;
 Wed, 10 Jun 2020 14:43:14 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 63EC88B83B;
 Wed, 10 Jun 2020 14:43:16 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id F_sEXnwBaA3B; Wed, 10 Jun 2020 14:43:16 +0200 (CEST)
Received: from [172.25.230.104] (po15451.idsi0.si.c-s.fr [172.25.230.104])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 284838B83A;
 Wed, 10 Jun 2020 14:43:16 +0200 (CEST)
Subject: Re: [PATCH v2 1/4] powerpc/64s: implement probe_kernel_read/write
 without touching AMR
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
References: <20200403093529.43587-1-npiggin@gmail.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <bbee54ac-63d1-3638-dce8-6a2bee66623c@csgroup.eu>
Date: Wed, 10 Jun 2020 14:41:30 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200403093529.43587-1-npiggin@gmail.com>
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

Hi Nick

Le 03/04/2020 à 11:35, Nicholas Piggin a écrit :
> There is no need to allow user accesses when probing kernel addresses.

You should have a look at 
https://github.com/torvalds/linux/commit/fa94111d94354de76c47fea6e1187d1ee91e23a7

At seems to implement a generic way of achieving what you are trying to 
do here.

Christophe

> 
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
> v2:
> - Enable for all powerpc (suggested by Christophe)
> - Fold helper function together (Christophe)
> - Rename uaccess.c to maccess.c to match kernel/maccess.c.
> 
>   arch/powerpc/include/asm/uaccess.h | 25 +++++++++++++++-------
>   arch/powerpc/lib/Makefile          |  2 +-
>   arch/powerpc/lib/maccess.c         | 34 ++++++++++++++++++++++++++++++
>   3 files changed, 52 insertions(+), 9 deletions(-)
>   create mode 100644 arch/powerpc/lib/maccess.c
> 
> diff --git a/arch/powerpc/include/asm/uaccess.h b/arch/powerpc/include/asm/uaccess.h
> index 2f500debae21..670910df3cc7 100644
> --- a/arch/powerpc/include/asm/uaccess.h
> +++ b/arch/powerpc/include/asm/uaccess.h
> @@ -341,8 +341,8 @@ raw_copy_in_user(void __user *to, const void __user *from, unsigned long n)
>   }
>   #endif /* __powerpc64__ */
>   
> -static inline unsigned long raw_copy_from_user(void *to,
> -		const void __user *from, unsigned long n)
> +static inline unsigned long
> +raw_copy_from_user_allowed(void *to, const void __user *from, unsigned long n)
>   {
>   	unsigned long ret;
>   	if (__builtin_constant_p(n) && (n <= 8)) {
> @@ -351,19 +351,19 @@ static inline unsigned long raw_copy_from_user(void *to,
>   		switch (n) {
>   		case 1:
>   			barrier_nospec();
> -			__get_user_size(*(u8 *)to, from, 1, ret);
> +			__get_user_size_allowed(*(u8 *)to, from, 1, ret);
>   			break;
>   		case 2:
>   			barrier_nospec();
> -			__get_user_size(*(u16 *)to, from, 2, ret);
> +			__get_user_size_allowed(*(u16 *)to, from, 2, ret);
>   			break;
>   		case 4:
>   			barrier_nospec();
> -			__get_user_size(*(u32 *)to, from, 4, ret);
> +			__get_user_size_allowed(*(u32 *)to, from, 4, ret);
>   			break;
>   		case 8:
>   			barrier_nospec();
> -			__get_user_size(*(u64 *)to, from, 8, ret);
> +			__get_user_size_allowed(*(u64 *)to, from, 8, ret);
>   			break;
>   		}
>   		if (ret == 0)
> @@ -371,9 +371,18 @@ static inline unsigned long raw_copy_from_user(void *to,
>   	}
>   
>   	barrier_nospec();
> -	allow_read_from_user(from, n);
>   	ret = __copy_tofrom_user((__force void __user *)to, from, n);
> -	prevent_read_from_user(from, n);
> +	return ret;
> +}
> +
> +static inline unsigned long
> +raw_copy_from_user(void *to, const void __user *from, unsigned long n)
> +{
> +	unsigned long ret;
> +
> +	allow_read_from_user(to, n);
> +	ret = raw_copy_from_user_allowed(to, from, n);
> +	prevent_read_from_user(to, n);
>   	return ret;
>   }
>   
> diff --git a/arch/powerpc/lib/Makefile b/arch/powerpc/lib/Makefile
> index b8de3be10eb4..77af10ad0b0d 100644
> --- a/arch/powerpc/lib/Makefile
> +++ b/arch/powerpc/lib/Makefile
> @@ -16,7 +16,7 @@ CFLAGS_code-patching.o += -DDISABLE_BRANCH_PROFILING
>   CFLAGS_feature-fixups.o += -DDISABLE_BRANCH_PROFILING
>   endif
>   
> -obj-y += alloc.o code-patching.o feature-fixups.o pmem.o
> +obj-y += alloc.o code-patching.o feature-fixups.o pmem.o maccess.o
>   
>   ifndef CONFIG_KASAN
>   obj-y	+=	string.o memcmp_$(BITS).o
> diff --git a/arch/powerpc/lib/maccess.c b/arch/powerpc/lib/maccess.c
> new file mode 100644
> index 000000000000..ce5465db1e2d
> --- /dev/null
> +++ b/arch/powerpc/lib/maccess.c
> @@ -0,0 +1,34 @@
> +#include <linux/mm.h>
> +#include <linux/uaccess.h>
> +
> +/*
> + * Override the generic weak linkage functions to avoid changing KUP state via
> + * the generic user access functions, as this is accessing kernel addresses.
> + */
> +long probe_kernel_read(void *dst, const void *src, size_t size)
> +{
> +	long ret;
> +	mm_segment_t old_fs = get_fs();
> +
> +	set_fs(KERNEL_DS);
> +	pagefault_disable();
> +	ret = raw_copy_from_user_allowed(dst, (__force const void __user *)src, size);
> +	pagefault_enable();
> +	set_fs(old_fs);
> +
> +	return ret ? -EFAULT : 0;
> +}
> +
> +long probe_kernel_write(void *dst, const void *src, size_t size)
> +{
> +	long ret;
> +	mm_segment_t old_fs = get_fs();
> +
> +	set_fs(KERNEL_DS);
> +	pagefault_disable();
> +	ret = raw_copy_to_user_allowed((__force void __user *)dst, src, size);
> +	pagefault_enable();
> +	set_fs(old_fs);
> +
> +	return ret ? -EFAULT : 0;
> +}
> 
