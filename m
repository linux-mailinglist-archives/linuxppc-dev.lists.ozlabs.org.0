Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F49B2609E8
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Sep 2020 07:21:45 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bltmk1JNGzDqKL
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Sep 2020 15:21:42 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bltkb6STSzDqD5
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Sep 2020 15:19:50 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4BltkT4qvvz9tyfH;
 Tue,  8 Sep 2020 07:19:45 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id mF_Z1FlHMh_F; Tue,  8 Sep 2020 07:19:45 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4BltkT3c0Rz9tyfG;
 Tue,  8 Sep 2020 07:19:45 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 48B608B793;
 Tue,  8 Sep 2020 07:19:46 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id G7-bMta_Fa-y; Tue,  8 Sep 2020 07:19:46 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 0B4918B768;
 Tue,  8 Sep 2020 07:19:44 +0200 (CEST)
Subject: Re: [RFC PATCH v2 3/3] mm: make generic pXd_addr_end() macros inline
 functions
To: Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, John Hubbard <jhubbard@nvidia.com>
References: <20200907180058.64880-1-gerald.schaefer@linux.ibm.com>
 <20200907180058.64880-4-gerald.schaefer@linux.ibm.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <4c101685-5b29-dace-9dd2-b6f0ae193a9c@csgroup.eu>
Date: Tue, 8 Sep 2020 07:19:38 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200907180058.64880-4-gerald.schaefer@linux.ibm.com>
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
Cc: Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, linux-mm <linux-mm@kvack.org>,
 Paul Mackerras <paulus@samba.org>, linux-sparc <sparclinux@vger.kernel.org>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Claudio Imbrenda <imbrenda@linux.ibm.com>, Will Deacon <will@kernel.org>,
 linux-arch <linux-arch@vger.kernel.org>,
 linux-s390 <linux-s390@vger.kernel.org>, Vasily Gorbik <gor@linux.ibm.com>,
 Richard Weinberger <richard@nod.at>, linux-x86 <x86@kernel.org>,
 Russell King <linux@armlinux.org.uk>,
 Christian Borntraeger <borntraeger@de.ibm.com>, Ingo Molnar <mingo@redhat.com>,
 Andrey Ryabinin <aryabinin@virtuozzo.com>, Jeff Dike <jdike@addtoit.com>,
 Arnd Bergmann <arnd@arndb.de>, Heiko Carstens <hca@linux.ibm.com>,
 linux-um <linux-um@lists.infradead.org>, Borislav Petkov <bp@alien8.de>,
 Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 linux-arm <linux-arm-kernel@lists.infradead.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 LKML <linux-kernel@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>,
 linux-power <linuxppc-dev@lists.ozlabs.org>, Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 07/09/2020 à 20:00, Gerald Schaefer a écrit :
> From: Alexander Gordeev <agordeev@linux.ibm.com>
> 
> Since pXd_addr_end() macros take pXd page-table entry as a
> parameter it makes sense to check the entry type on compile.
> Even though most archs do not make use of page-table entries
> in pXd_addr_end() calls, checking the type in traversal code
> paths could help to avoid subtle bugs.
> 
> Signed-off-by: Alexander Gordeev <agordeev@linux.ibm.com>
> Signed-off-by: Gerald Schaefer <gerald.schaefer@linux.ibm.com>
> ---
>   include/linux/pgtable.h | 36 ++++++++++++++++++++----------------
>   1 file changed, 20 insertions(+), 16 deletions(-)
> 
> diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
> index 67ebc22cf83d..d9e7d16c2263 100644
> --- a/include/linux/pgtable.h
> +++ b/include/linux/pgtable.h
> @@ -656,31 +656,35 @@ static inline int arch_unmap_one(struct mm_struct *mm,
>    */
>   
>   #ifndef pgd_addr_end
> -#define pgd_addr_end(pgd, addr, end)					\
> -({	unsigned long __boundary = ((addr) + PGDIR_SIZE) & PGDIR_MASK;	\
> -	(__boundary - 1 < (end) - 1)? __boundary: (end);		\
> -})
> +#define pgd_addr_end pgd_addr_end

I think that #define is pointless, usually there is no such #define for 
the default case.

> +static inline unsigned long pgd_addr_end(pgd_t pgd, unsigned long addr, unsigned long end)
> +{	unsigned long __boundary = (addr + PGDIR_SIZE) & PGDIR_MASK;
> +	return (__boundary - 1 < end - 1) ? __boundary : end;
> +}

Please use the standard layout, ie entry { and exit } alone on their 
line, and space between local vars declaration and the rest.

Also remove the leading __ in front of var names as it's not needed once 
it is not macros anymore.

f_name()
{
	some_local_var;

	do_something();
}

>   #endif
>   
>   #ifndef p4d_addr_end
> -#define p4d_addr_end(p4d, addr, end)					\
> -({	unsigned long __boundary = ((addr) + P4D_SIZE) & P4D_MASK;	\
> -	(__boundary - 1 < (end) - 1)? __boundary: (end);		\
> -})
> +#define p4d_addr_end p4d_addr_end
> +static inline unsigned long p4d_addr_end(p4d_t p4d, unsigned long addr, unsigned long end)
> +{	unsigned long __boundary = (addr + P4D_SIZE) & P4D_MASK;
> +	return (__boundary - 1 < end - 1) ? __boundary : end;
> +}
>   #endif
>   
>   #ifndef pud_addr_end
> -#define pud_addr_end(pud, addr, end)					\
> -({	unsigned long __boundary = ((addr) + PUD_SIZE) & PUD_MASK;	\
> -	(__boundary - 1 < (end) - 1)? __boundary: (end);		\
> -})
> +#define pud_addr_end pud_addr_end
> +static inline unsigned long pud_addr_end(pud_t pud, unsigned long addr, unsigned long end)
> +{	unsigned long __boundary = (addr + PUD_SIZE) & PUD_MASK;
> +	return (__boundary - 1 < end - 1) ? __boundary : end;
> +}
>   #endif
>   
>   #ifndef pmd_addr_end
> -#define pmd_addr_end(pmd, addr, end)					\
> -({	unsigned long __boundary = ((addr) + PMD_SIZE) & PMD_MASK;	\
> -	(__boundary - 1 < (end) - 1)? __boundary: (end);		\
> -})
> +#define pmd_addr_end pmd_addr_end
> +static inline unsigned long pmd_addr_end(pmd_t pmd, unsigned long addr, unsigned long end)
> +{	unsigned long __boundary = (addr + PMD_SIZE) & PMD_MASK;
> +	return (__boundary - 1 < end - 1) ? __boundary : end;
> +}
>   #endif
>   
>   /*
> 
