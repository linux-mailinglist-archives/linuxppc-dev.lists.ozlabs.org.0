Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 61D4D3AACE4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Jun 2021 09:01:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G5Cd76xSVz3c0M
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Jun 2021 17:00:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G5Ccp6v2Lz2yX6
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Jun 2021 17:00:42 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
 by localhost (Postfix) with ESMTP id 4G5Cck6knBzB9Kg;
 Thu, 17 Jun 2021 09:00:38 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QJPdcHdgEBZK; Thu, 17 Jun 2021 09:00:38 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4G5Cck5nnwzB9JP;
 Thu, 17 Jun 2021 09:00:38 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id BB7508B803;
 Thu, 17 Jun 2021 09:00:38 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id v7kr536TYdhu; Thu, 17 Jun 2021 09:00:38 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 0BA158B801;
 Thu, 17 Jun 2021 09:00:37 +0200 (CEST)
Subject: Re: [PATCH v14 3/4] mm: define default MAX_PTRS_PER_* in
 include/pgtable.h
To: Daniel Axtens <dja@axtens.net>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, kasan-dev@googlegroups.com, elver@google.com,
 akpm@linux-foundation.org, andreyknvl@gmail.com
References: <20210617063956.94061-1-dja@axtens.net>
 <20210617063956.94061-4-dja@axtens.net>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <cbe77a1d-074d-4bc0-0aad-996249a6bf3a@csgroup.eu>
Date: Thu, 17 Jun 2021 09:00:35 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210617063956.94061-4-dja@axtens.net>
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
Cc: aneesh.kumar@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 17/06/2021 à 08:39, Daniel Axtens a écrit :
> Commit c65e774fb3f6 ("x86/mm: Make PGDIR_SHIFT and PTRS_PER_P4D variable")
> made PTRS_PER_P4D variable on x86 and introduced MAX_PTRS_PER_P4D as a
> constant for cases which need a compile-time constant (e.g. fixed-size
> arrays).
> 
> powerpc likewise has boot-time selectable MMU features which can cause
> other mm "constants" to vary. For KASAN, we have some static
> PTE/PMD/PUD/P4D arrays so we need compile-time maximums for all these
> constants. Extend the MAX_PTRS_PER_ idiom, and place default definitions
> in include/pgtable.h. These define MAX_PTRS_PER_x to be PTRS_PER_x unless
> an architecture has defined MAX_PTRS_PER_x in its arch headers.
> 
> Clean up pgtable-nop4d.h and s390's MAX_PTRS_PER_P4D definitions while
> we're at it: both can just pick up the default now.
> 
> Signed-off-by: Daniel Axtens <dja@axtens.net>

Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>

> 
> ---
> 
> s390 was compile tested only.
> ---
>   arch/s390/include/asm/pgtable.h     |  2 --
>   include/asm-generic/pgtable-nop4d.h |  1 -
>   include/linux/pgtable.h             | 22 ++++++++++++++++++++++
>   3 files changed, 22 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/s390/include/asm/pgtable.h b/arch/s390/include/asm/pgtable.h
> index 7c66ae5d7e32..cf05954ce013 100644
> --- a/arch/s390/include/asm/pgtable.h
> +++ b/arch/s390/include/asm/pgtable.h
> @@ -342,8 +342,6 @@ static inline int is_module_addr(void *addr)
>   #define PTRS_PER_P4D	_CRST_ENTRIES
>   #define PTRS_PER_PGD	_CRST_ENTRIES
>   
> -#define MAX_PTRS_PER_P4D	PTRS_PER_P4D
> -
>   /*
>    * Segment table and region3 table entry encoding
>    * (R = read-only, I = invalid, y = young bit):
> diff --git a/include/asm-generic/pgtable-nop4d.h b/include/asm-generic/pgtable-nop4d.h
> index ce2cbb3c380f..2f6b1befb129 100644
> --- a/include/asm-generic/pgtable-nop4d.h
> +++ b/include/asm-generic/pgtable-nop4d.h
> @@ -9,7 +9,6 @@
>   typedef struct { pgd_t pgd; } p4d_t;
>   
>   #define P4D_SHIFT		PGDIR_SHIFT
> -#define MAX_PTRS_PER_P4D	1
>   #define PTRS_PER_P4D		1
>   #define P4D_SIZE		(1UL << P4D_SHIFT)
>   #define P4D_MASK		(~(P4D_SIZE-1))
> diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
> index 9e6f71265f72..69700e3e615f 100644
> --- a/include/linux/pgtable.h
> +++ b/include/linux/pgtable.h
> @@ -1625,4 +1625,26 @@ typedef unsigned int pgtbl_mod_mask;
>   #define pte_leaf_size(x) PAGE_SIZE
>   #endif
>   
> +/*
> + * Some architectures have MMUs that are configurable or selectable at boot
> + * time. These lead to variable PTRS_PER_x. For statically allocated arrays it
> + * helps to have a static maximum value.
> + */
> +
> +#ifndef MAX_PTRS_PER_PTE
> +#define MAX_PTRS_PER_PTE PTRS_PER_PTE
> +#endif
> +
> +#ifndef MAX_PTRS_PER_PMD
> +#define MAX_PTRS_PER_PMD PTRS_PER_PMD
> +#endif
> +
> +#ifndef MAX_PTRS_PER_PUD
> +#define MAX_PTRS_PER_PUD PTRS_PER_PUD
> +#endif
> +
> +#ifndef MAX_PTRS_PER_P4D
> +#define MAX_PTRS_PER_P4D PTRS_PER_P4D
> +#endif
> +
>   #endif /* _LINUX_PGTABLE_H */
> 
