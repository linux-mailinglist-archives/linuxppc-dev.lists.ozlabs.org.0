Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AB1F18A7FD
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Mar 2020 23:19:25 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48jPbG53TwzDqxX
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Mar 2020 09:19:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=will@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=HEJhPkoL; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48jPNX4vrMzDr0m
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Mar 2020 09:10:04 +1100 (AEDT)
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2E42820752;
 Wed, 18 Mar 2020 22:09:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1584569402;
 bh=KgfnX7ZnIYjuVD6XaJeA2ijPdABkLg8pgurlLh1kogI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=HEJhPkoLbELea44ApXW6LjmWEy3NzdN+AZlAxjzkba7HN4vGDtaKHRQVwAwYpfJcG
 Ox5kNQ3BOeItN30yKdh/wLq0+edeQSOCKeaDZF4ReUYYRhh8tSM6lK1GNfl8jdubaR
 ELODdye+Ixp0Hk/34KAiQVZJ+HYzrkK/RwZmCMVc=
Date: Wed, 18 Mar 2020 22:09:54 +0000
From: Will Deacon <will@kernel.org>
To: Mike Kravetz <mike.kravetz@oracle.com>
Subject: Re: [PATCH 1/4] hugetlbfs: add arch_hugetlb_valid_size
Message-ID: <20200318220954.GD8477@willie-the-truck>
References: <20200318220634.32100-1-mike.kravetz@oracle.com>
 <20200318220634.32100-2-mike.kravetz@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200318220634.32100-2-mike.kravetz@oracle.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: linux-doc@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Heiko Carstens <heiko.carstens@de.ibm.com>, linux-mm@kvack.org,
 Paul Mackerras <paulus@samba.org>, sparclinux@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 Jonathan Corbet <corbet@lwn.net>,
 Christian Borntraeger <borntraeger@de.ibm.com>, Ingo Molnar <mingo@redhat.com>,
 Longpeng <longpeng2@huawei.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Vasily Gorbik <gor@linux.ibm.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 "David S . Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Mar 18, 2020 at 03:06:31PM -0700, Mike Kravetz wrote:
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
>  arch/arm64/include/asm/hugetlb.h   |  2 ++
>  arch/arm64/mm/hugetlbpage.c        | 19 ++++++++++++++-----
>  arch/powerpc/include/asm/hugetlb.h |  3 +++
>  arch/powerpc/mm/hugetlbpage.c      | 20 +++++++++++++-------
>  arch/riscv/include/asm/hugetlb.h   |  3 +++
>  arch/riscv/mm/hugetlbpage.c        | 28 ++++++++++++++++++----------
>  arch/s390/include/asm/hugetlb.h    |  3 +++
>  arch/s390/mm/hugetlbpage.c         | 18 +++++++++++++-----
>  arch/sparc/include/asm/hugetlb.h   |  3 +++
>  arch/sparc/mm/init_64.c            | 23 ++++++++++++++++-------
>  arch/x86/include/asm/hugetlb.h     |  3 +++
>  arch/x86/mm/hugetlbpage.c          | 21 +++++++++++++++------
>  include/linux/hugetlb.h            |  7 +++++++
>  mm/hugetlb.c                       | 16 +++++++++++++---
>  14 files changed, 126 insertions(+), 43 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/hugetlb.h b/arch/arm64/include/asm/hugetlb.h
> index 2eb6c234d594..3248f35213ee 100644
> --- a/arch/arm64/include/asm/hugetlb.h
> +++ b/arch/arm64/include/asm/hugetlb.h
> @@ -59,6 +59,8 @@ extern void huge_pte_clear(struct mm_struct *mm, unsigned long addr,
>  extern void set_huge_swap_pte_at(struct mm_struct *mm, unsigned long addr,
>  				 pte_t *ptep, pte_t pte, unsigned long sz);
>  #define set_huge_swap_pte_at set_huge_swap_pte_at
> +extern bool __init arch_hugetlb_valid_size(unsigned long long size);
> +#define arch_hugetlb_valid_size arch_hugetlb_valid_size
>  
>  #include <asm-generic/hugetlb.h>
>  
> diff --git a/arch/arm64/mm/hugetlbpage.c b/arch/arm64/mm/hugetlbpage.c
> index bbeb6a5a6ba6..da30127086d0 100644
> --- a/arch/arm64/mm/hugetlbpage.c
> +++ b/arch/arm64/mm/hugetlbpage.c
> @@ -462,23 +462,32 @@ static int __init hugetlbpage_init(void)
>  }
>  arch_initcall(hugetlbpage_init);
>  
> -static __init int setup_hugepagesz(char *opt)
> +bool __init arch_hugetlb_valid_size(unsigned long long size)
>  {
> -	unsigned long ps = memparse(opt, &opt);
> -
> -	switch (ps) {
> +	switch (size) {
>  #ifdef CONFIG_ARM64_4K_PAGES
>  	case PUD_SIZE:
>  #endif
>  	case CONT_PMD_SIZE:
>  	case PMD_SIZE:
>  	case CONT_PTE_SIZE:
> +		return true;
> +	}
> +
> +	return false;
> +}
> +
> +static __init int setup_hugepagesz(char *opt)
> +{
> +	unsigned long long ps = memparse(opt, &opt);
> +
> +	if arch_hugetlb_valid_size(ps)) {

Please compile your changes if you're touching multiple architectures. You
can get cross-compiler binaries from:

https://mirrors.edge.kernel.org/pub/tools/crosstool/
https://toolchains.bootlin.com/

Will
