Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 23A2C18AD17
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Mar 2020 08:03:04 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48jdCT1CkqzDr3V
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Mar 2020 18:03:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.a=rsa-sha256
 header.s=mail header.b=kSCCxuWg; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48jd9Q3C97zDr3S
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Mar 2020 18:01:13 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 48jd9D5Wspz9v1Md;
 Thu, 19 Mar 2020 08:01:04 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=kSCCxuWg; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id a91KdXxJSw9z; Thu, 19 Mar 2020 08:01:04 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 48jd9D4MMFz9v1Mc;
 Thu, 19 Mar 2020 08:01:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1584601264; bh=f1YwOhdxX26Y+wBuzZ6KcmY62u5y/+8Hvgm0wH6ueYs=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=kSCCxuWg89EGpfCGJFvQQEKaoHe/kCd5TGb/eJd9YNW4o9nMza+I2DetAh60y0OYl
 jNWoevB3fgK3oMJ2kFYnvfR61+Z0w2UWeOnoIyGuiPFaUDv3CG1pmdSv9t5BVLTXov
 N7ub0KXLdsT/u4I32YAoSgYf0fhvDN90dndC0kTk=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 784F58B769;
 Thu, 19 Mar 2020 08:01:05 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id MWrtuWx18n7g; Thu, 19 Mar 2020 08:01:05 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id DFB5B8B798;
 Thu, 19 Mar 2020 08:01:03 +0100 (CET)
Subject: Re: [PATCH 1/4] hugetlbfs: add arch_hugetlb_valid_size
To: Mike Kravetz <mike.kravetz@oracle.com>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-doc@vger.kernel.org
References: <20200318220634.32100-1-mike.kravetz@oracle.com>
 <20200318220634.32100-2-mike.kravetz@oracle.com>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <c3071359-c5d3-4247-7f16-6f61b2fa0756@c-s.fr>
Date: Thu, 19 Mar 2020 08:00:59 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200318220634.32100-2-mike.kravetz@oracle.com>
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, Vasily Gorbik <gor@linux.ibm.com>,
 Jonathan Corbet <corbet@lwn.net>, Catalin Marinas <catalin.marinas@arm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Heiko Carstens <heiko.carstens@de.ibm.com>,
 "David S . Miller" <davem@davemloft.net>,
 Christian Borntraeger <borntraeger@de.ibm.com>, Ingo Molnar <mingo@redhat.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Paul Mackerras <paulus@samba.org>, Andrew Morton <akpm@linux-foundation.org>,
 Longpeng <longpeng2@huawei.com>, Will Deacon <will@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 18/03/2020 à 23:06, Mike Kravetz a écrit :
> The architecture independent routine hugetlb_default_setup sets up
> the default huge pages size.  It has no way to verify if the passed
> value is valid, so it accepts it and attempts to validate at a later
> time.  This requires undocumented cooperation between the arch specific
> and arch independent code.
> 
> For architectures that support more than one huge page size, provide
> a routine arch_hugetlb_valid_size to validate a huge page size.
> hugetlb_default_setup can use this to validate passed values.
> 
> arch_hugetlb_valid_size will also be used in a subsequent patch to
> move processing of the "hugepagesz=" in arch specific code to a common
> routine in arch independent code.
> 
> Signed-off-by: Mike Kravetz <mike.kravetz@oracle.com>
> ---
>   arch/arm64/include/asm/hugetlb.h   |  2 ++
>   arch/arm64/mm/hugetlbpage.c        | 19 ++++++++++++++-----
>   arch/powerpc/include/asm/hugetlb.h |  3 +++
>   arch/powerpc/mm/hugetlbpage.c      | 20 +++++++++++++-------
>   arch/riscv/include/asm/hugetlb.h   |  3 +++
>   arch/riscv/mm/hugetlbpage.c        | 28 ++++++++++++++++++----------
>   arch/s390/include/asm/hugetlb.h    |  3 +++
>   arch/s390/mm/hugetlbpage.c         | 18 +++++++++++++-----
>   arch/sparc/include/asm/hugetlb.h   |  3 +++
>   arch/sparc/mm/init_64.c            | 23 ++++++++++++++++-------
>   arch/x86/include/asm/hugetlb.h     |  3 +++
>   arch/x86/mm/hugetlbpage.c          | 21 +++++++++++++++------
>   include/linux/hugetlb.h            |  7 +++++++
>   mm/hugetlb.c                       | 16 +++++++++++++---
>   14 files changed, 126 insertions(+), 43 deletions(-)
> 

[snip]

> diff --git a/arch/powerpc/include/asm/hugetlb.h b/arch/powerpc/include/asm/hugetlb.h
> index bd6504c28c2f..3b5939016955 100644
> --- a/arch/powerpc/include/asm/hugetlb.h
> +++ b/arch/powerpc/include/asm/hugetlb.h
> @@ -64,6 +64,9 @@ static inline void arch_clear_hugepage_flags(struct page *page)
>   {
>   }
>   
> +#define arch_hugetlb_valid_size arch_hugetlb_valid_size
> +extern bool __init arch_hugetlb_valid_size(unsigned long long size);

Don't add 'extern' keyword, it is irrelevant for a function declaration.

checkpatch --strict doesn't like it either 
(https://openpower.xyz/job/snowpatch/job/snowpatch-linux-checkpatch/12318//artifact/linux/checkpatch.log)

> +
>   #include <asm-generic/hugetlb.h>
>   
>   #else /* ! CONFIG_HUGETLB_PAGE */
> diff --git a/arch/powerpc/mm/hugetlbpage.c b/arch/powerpc/mm/hugetlbpage.c
> index 33b3461d91e8..b78f660252f3 100644
> --- a/arch/powerpc/mm/hugetlbpage.c
> +++ b/arch/powerpc/mm/hugetlbpage.c
> @@ -558,7 +558,7 @@ unsigned long vma_mmu_pagesize(struct vm_area_struct *vma)
>   	return vma_kernel_pagesize(vma);
>   }
>   
> -static int __init add_huge_page_size(unsigned long long size)
> +bool __init arch_hugetlb_valid_size(unsigned long long size)
>   {
>   	int shift = __ffs(size);
>   	int mmu_psize;
> @@ -566,20 +566,26 @@ static int __init add_huge_page_size(unsigned long long size)
>   	/* Check that it is a page size supported by the hardware and
>   	 * that it fits within pagetable and slice limits. */
>   	if (size <= PAGE_SIZE || !is_power_of_2(size))
> -		return -EINVAL;
> +		return false;
>   
>   	mmu_psize = check_and_get_huge_psize(shift);
>   	if (mmu_psize < 0)
> -		return -EINVAL;
> +		return false;
>   
>   	BUG_ON(mmu_psize_defs[mmu_psize].shift != shift);
>   
> -	/* Return if huge page size has already been setup */
> -	if (size_to_hstate(size))
> -		return 0;
> +	return true;
> +}
>   
> -	hugetlb_add_hstate(shift - PAGE_SHIFT);
> +static int __init add_huge_page_size(unsigned long long size)
> +{
> +	int shift = __ffs(size);
> +
> +	if (!arch_hugetlb_valid_size(size))
> +		return -EINVAL;
>   
> +	if (!size_to_hstate(size))
> +		hugetlb_add_hstate(shift - PAGE_SHIFT);
>   	return 0;
>   }
>   

[snip]

> diff --git a/arch/x86/mm/hugetlbpage.c b/arch/x86/mm/hugetlbpage.c
> index 5bfd5aef5378..51e6208fdeec 100644
> --- a/arch/x86/mm/hugetlbpage.c
> +++ b/arch/x86/mm/hugetlbpage.c
> @@ -181,16 +181,25 @@ hugetlb_get_unmapped_area(struct file *file, unsigned long addr,
>   #endif /* CONFIG_HUGETLB_PAGE */
>   
>   #ifdef CONFIG_X86_64
> +bool __init arch_hugetlb_valid_size(unsigned long long size)
> +{
> +	if (size == PMD_SIZE)
> +		return true;
> +	else if (size == PUD_SIZE && boot_cpu_has(X86_FEATURE_GBPAGES))
> +		return true;
> +	else
> +		return false;
> +}
> +
>   static __init int setup_hugepagesz(char *opt)
>   {
> -	unsigned long ps = memparse(opt, &opt);
> -	if (ps == PMD_SIZE) {
> -		hugetlb_add_hstate(PMD_SHIFT - PAGE_SHIFT);
> -	} else if (ps == PUD_SIZE && boot_cpu_has(X86_FEATURE_GBPAGES)) {
> -		hugetlb_add_hstate(PUD_SHIFT - PAGE_SHIFT);
> +	unsigned long long ps = memparse(opt, &opt);
> +
> +	if (arch_hugetlb_valid_size(ps)) {
> +		hugetlb_add_hstate(ilog2(ps) - PAGE_SHIFT);
>   	} else {
>   		hugetlb_bad_size();
> -		printk(KERN_ERR "hugepagesz: Unsupported page size %lu M\n",
> +		printk(KERN_ERR "hugepagesz: Unsupported page size %llu M\n",
>   			ps >> 20);

Nowadays we use pr_err() instead of printk.

It would also likely allow you to have everything fit on a single line.

>   		return 0;
>   	}
> diff --git a/include/linux/hugetlb.h b/include/linux/hugetlb.h
> index b831e9fa1a26..33343eb980d0 100644
> --- a/include/linux/hugetlb.h
> +++ b/include/linux/hugetlb.h
> @@ -678,6 +678,13 @@ static inline spinlock_t *huge_pte_lockptr(struct hstate *h,
>   	return &mm->page_table_lock;
>   }
>   
> +#ifndef arch_hugetlb_valid_size
> +static inline bool arch_hugetlb_valid_size(unsigned long long size)
> +{
> +	return (size == HPAGE_SIZE);

Not sure the ( ) are necessary.

> +}
> +#endif
> +
>   #ifndef hugepages_supported
>   /*
>    * Some platform decide whether they support huge pages at boot
> diff --git a/mm/hugetlb.c b/mm/hugetlb.c
> index d8ebd876871d..2f99359b93af 100644
> --- a/mm/hugetlb.c
> +++ b/mm/hugetlb.c
> @@ -3224,12 +3224,22 @@ static int __init hugetlb_nrpages_setup(char *s)
>   }
>   __setup("hugepages=", hugetlb_nrpages_setup);
>   
> -static int __init hugetlb_default_setup(char *s)
> +static int __init default_hugepagesz_setup(char *s)
>   {
> -	default_hstate_size = memparse(s, &s);
> +	unsigned long long size;

Why unsigned long long ?

default_hstate_size is long.

I can't imagine 32 bits platforms having a hugepage with a 64 bits size.

> +	char *saved_s = s;
> +
> +	size = memparse(s, &s);

The updated s is not reused after that so you can pass NULL instead of 
&s and then you don't need the saved_s.

> +
> +	if (!arch_hugetlb_valid_size(size)) {
> +		pr_err("HugeTLB: unsupported default_hugepagesz %s\n", saved_s);
> +		return 0;
> +	}
> +
> +	default_hstate_size = size;
>   	return 1;
>   }
> -__setup("default_hugepagesz=", hugetlb_default_setup);
> +__setup("default_hugepagesz=", default_hugepagesz_setup);
>   
>   static unsigned int cpuset_mems_nr(unsigned int *array)
>   {
> 


Christophe
