Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 83F0335EC24
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Apr 2021 07:22:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FKrT23Wr0z3c1Q
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Apr 2021 15:22:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FKrSj36krz2xZ0
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Apr 2021 15:22:10 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4FKrSZ3r2Lz9tvhy;
 Wed, 14 Apr 2021 07:22:06 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id QQLegraZ5N-Q; Wed, 14 Apr 2021 07:22:06 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4FKrSZ0tq1z9tvg5;
 Wed, 14 Apr 2021 07:22:06 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id E4B348B7B6;
 Wed, 14 Apr 2021 07:22:06 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id yJq5yeVH30mK; Wed, 14 Apr 2021 07:22:06 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 9D7878B75F;
 Wed, 14 Apr 2021 07:22:05 +0200 (CEST)
Subject: Re: [PATCH] mm: Define ARCH_HAS_FIRST_USER_ADDRESS
To: Anshuman Khandual <anshuman.khandual@arm.com>, linux-mm@kvack.org,
 akpm@linux-foundation.org
References: <1618368899-20311-1-git-send-email-anshuman.khandual@arm.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <f29ba8e2-3071-c963-1e9f-e8c88526ed8d@csgroup.eu>
Date: Wed, 14 Apr 2021 07:22:06 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <1618368899-20311-1-git-send-email-anshuman.khandual@arm.com>
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
Cc: linux-s390@vger.kernel.org, linux-ia64@vger.kernel.org,
 linux-parisc@vger.kernel.org, linux-xtensa@linux-xtensa.org,
 linux-sh@vger.kernel.org, linux-hexagon@vger.kernel.org, x86@kernel.org,
 linux-um@lists.infradead.org, linux-mips@vger.kernel.org,
 linux-csky@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org, openrisc@lists.librecores.org,
 linux-alpha@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-snps-arc@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 14/04/2021 à 04:54, Anshuman Khandual a écrit :
> Currently most platforms define FIRST_USER_ADDRESS as 0UL duplicating the
> same code all over. Instead define a new option ARCH_HAS_FIRST_USER_ADDRESS
> for those platforms which would override generic default FIRST_USER_ADDRESS
> value 0UL. This makes it much cleaner with reduced code.
> 
> Cc: linux-alpha@vger.kernel.org
> Cc: linux-snps-arc@lists.infradead.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-csky@vger.kernel.org
> Cc: linux-hexagon@vger.kernel.org
> Cc: linux-ia64@vger.kernel.org
> Cc: linux-m68k@lists.linux-m68k.org
> Cc: linux-mips@vger.kernel.org
> Cc: openrisc@lists.librecores.org
> Cc: linux-parisc@vger.kernel.org
> Cc: linuxppc-dev@lists.ozlabs.org
> Cc: linux-riscv@lists.infradead.org
> Cc: linux-s390@vger.kernel.org
> Cc: linux-sh@vger.kernel.org
> Cc: sparclinux@vger.kernel.org
> Cc: linux-um@lists.infradead.org
> Cc: linux-xtensa@linux-xtensa.org
> Cc: x86@kernel.org
> Cc: linux-mm@kvack.org
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
> ---
>   arch/alpha/include/asm/pgtable.h             | 1 -
>   arch/arc/include/asm/pgtable.h               | 6 ------
>   arch/arm/Kconfig                             | 1 +
>   arch/arm64/include/asm/pgtable.h             | 2 --
>   arch/csky/include/asm/pgtable.h              | 1 -
>   arch/hexagon/include/asm/pgtable.h           | 3 ---
>   arch/ia64/include/asm/pgtable.h              | 1 -
>   arch/m68k/include/asm/pgtable_mm.h           | 1 -
>   arch/microblaze/include/asm/pgtable.h        | 2 --
>   arch/mips/include/asm/pgtable-32.h           | 1 -
>   arch/mips/include/asm/pgtable-64.h           | 1 -
>   arch/nds32/Kconfig                           | 1 +
>   arch/nios2/include/asm/pgtable.h             | 2 --
>   arch/openrisc/include/asm/pgtable.h          | 1 -
>   arch/parisc/include/asm/pgtable.h            | 2 --
>   arch/powerpc/include/asm/book3s/pgtable.h    | 1 -
>   arch/powerpc/include/asm/nohash/32/pgtable.h | 1 -
>   arch/powerpc/include/asm/nohash/64/pgtable.h | 2 --
>   arch/riscv/include/asm/pgtable.h             | 2 --
>   arch/s390/include/asm/pgtable.h              | 2 --
>   arch/sh/include/asm/pgtable.h                | 2 --
>   arch/sparc/include/asm/pgtable_32.h          | 1 -
>   arch/sparc/include/asm/pgtable_64.h          | 3 ---
>   arch/um/include/asm/pgtable-2level.h         | 1 -
>   arch/um/include/asm/pgtable-3level.h         | 1 -
>   arch/x86/include/asm/pgtable_types.h         | 2 --
>   arch/xtensa/include/asm/pgtable.h            | 1 -
>   include/linux/mm.h                           | 4 ++++
>   mm/Kconfig                                   | 4 ++++
>   29 files changed, 10 insertions(+), 43 deletions(-)
> 
> diff --git a/include/linux/mm.h b/include/linux/mm.h
> index 8ba434287387..47098ccd715e 100644
> --- a/include/linux/mm.h
> +++ b/include/linux/mm.h
> @@ -46,6 +46,10 @@ extern int sysctl_page_lock_unfairness;
>   
>   void init_mm_internals(void);
>   
> +#ifndef ARCH_HAS_FIRST_USER_ADDRESS

I guess you didn't test it ..... :)

should be #ifndef CONFIG_ARCH_HAS_FIRST_USER_ADDRESS

> +#define FIRST_USER_ADDRESS	0UL
> +#endif

But why do we need a config option at all for that ?

Why not just:

#ifndef FIRST_USER_ADDRESS
#define FIRST_USER_ADDRESS	0UL
#endif

> +
>   #ifndef CONFIG_NEED_MULTIPLE_NODES	/* Don't use mapnrs, do it properly */
>   extern unsigned long max_mapnr;
>   
> diff --git a/mm/Kconfig b/mm/Kconfig
> index 24c045b24b95..373fbe377075 100644
> --- a/mm/Kconfig
> +++ b/mm/Kconfig
> @@ -806,6 +806,10 @@ config VMAP_PFN
>   
>   config ARCH_USES_HIGH_VMA_FLAGS
>   	bool
> +
> +config ARCH_HAS_FIRST_USER_ADDRESS
> +	bool
> +
>   config ARCH_HAS_PKEYS
>   	bool
>   
> 
