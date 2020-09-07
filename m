Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 831A526057B
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Sep 2020 22:17:37 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Blfht41kKzDqGk
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Sep 2020 06:17:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=rppt@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=He38jwjT; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BlfgD0TBpzDq5f
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Sep 2020 06:16:07 +1000 (AEST)
Received: from kernel.org (unknown [87.71.73.56])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id BEEA721556;
 Mon,  7 Sep 2020 20:15:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1599509764;
 bh=RAEHj8xYfuFWI4Y+q/aFyLQ3Y81fPmwq73CuPlLtuLo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=He38jwjTrF8JsybKdtpkafn6I41PVh9VCu45Rcex2vcAXxwQSXaRmFllsBPIYZ+VL
 vZjgVN2gASyM9VlZJ8s1FxZ73kaEMYdfXeCRo2+tYgHnkcL0pV9msWK3FqjY2+hfQ4
 WUxdkaZyDiiR1eOPP4BI2bi8sU1hW+gyy5K8utdc=
Date: Mon, 7 Sep 2020 23:15:47 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Gerald Schaefer <gerald.schaefer@linux.ibm.com>
Subject: Re: [RFC PATCH v2 3/3] mm: make generic pXd_addr_end() macros inline
 functions
Message-ID: <20200907201547.GD1976319@kernel.org>
References: <20200907180058.64880-1-gerald.schaefer@linux.ibm.com>
 <20200907180058.64880-4-gerald.schaefer@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200907180058.64880-4-gerald.schaefer@linux.ibm.com>
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
 Dave Hansen <dave.hansen@linux.intel.com>, linux-mm <linux-mm@kvack.org>,
 Paul Mackerras <paulus@samba.org>, linux-sparc <sparclinux@vger.kernel.org>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Claudio Imbrenda <imbrenda@linux.ibm.com>, Will Deacon <will@kernel.org>,
 linux-arch <linux-arch@vger.kernel.org>,
 linux-s390 <linux-s390@vger.kernel.org>, Vasily Gorbik <gor@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Richard Weinberger <richard@nod.at>, linux-x86 <x86@kernel.org>,
 Russell King <linux@armlinux.org.uk>, Jason Gunthorpe <jgg@ziepe.ca>,
 Ingo Molnar <mingo@redhat.com>, Catalin Marinas <catalin.marinas@arm.com>,
 Andrey Ryabinin <aryabinin@virtuozzo.com>, Heiko Carstens <hca@linux.ibm.com>,
 Arnd Bergmann <arnd@arndb.de>, John Hubbard <jhubbard@nvidia.com>,
 Jeff Dike <jdike@addtoit.com>, linux-um <linux-um@lists.infradead.org>,
 Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 linux-arm <linux-arm-kernel@lists.infradead.org>,
 linux-power <linuxppc-dev@lists.ozlabs.org>,
 LKML <linux-kernel@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi,

Some style comments below.

On Mon, Sep 07, 2020 at 08:00:58PM +0200, Gerald Schaefer wrote:
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
>  include/linux/pgtable.h | 36 ++++++++++++++++++++----------------
>  1 file changed, 20 insertions(+), 16 deletions(-)
> 
> diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
> index 67ebc22cf83d..d9e7d16c2263 100644
> --- a/include/linux/pgtable.h
> +++ b/include/linux/pgtable.h
> @@ -656,31 +656,35 @@ static inline int arch_unmap_one(struct mm_struct *mm,
>   */
>  
>  #ifndef pgd_addr_end
> -#define pgd_addr_end(pgd, addr, end)					\
> -({	unsigned long __boundary = ((addr) + PGDIR_SIZE) & PGDIR_MASK;	\
> -	(__boundary - 1 < (end) - 1)? __boundary: (end);		\
> -})
> +#define pgd_addr_end pgd_addr_end
> +static inline unsigned long pgd_addr_end(pgd_t pgd, unsigned long addr, unsigned long end)
> +{	unsigned long __boundary = (addr + PGDIR_SIZE) & PGDIR_MASK;

The code should be on a separate line from the curly brace.
Besides, since this is not a macro anymore, I think it would be nicer to
use 'boundary' without underscores.
This applies to the changes below as well.

> +	return (__boundary - 1 < end - 1) ? __boundary : end;
> +}
>  #endif
>  
>  #ifndef p4d_addr_end
> -#define p4d_addr_end(p4d, addr, end)					\
> -({	unsigned long __boundary = ((addr) + P4D_SIZE) & P4D_MASK;	\
> -	(__boundary - 1 < (end) - 1)? __boundary: (end);		\
> -})
> +#define p4d_addr_end p4d_addr_end
> +static inline unsigned long p4d_addr_end(p4d_t p4d, unsigned long addr, unsigned long end)
> +{	unsigned long __boundary = (addr + P4D_SIZE) & P4D_MASK;
> +	return (__boundary - 1 < end - 1) ? __boundary : end;
> +}
>  #endif
>  
>  #ifndef pud_addr_end
> -#define pud_addr_end(pud, addr, end)					\
> -({	unsigned long __boundary = ((addr) + PUD_SIZE) & PUD_MASK;	\
> -	(__boundary - 1 < (end) - 1)? __boundary: (end);		\
> -})
> +#define pud_addr_end pud_addr_end
> +static inline unsigned long pud_addr_end(pud_t pud, unsigned long addr, unsigned long end)
> +{	unsigned long __boundary = (addr + PUD_SIZE) & PUD_MASK;
> +	return (__boundary - 1 < end - 1) ? __boundary : end;
> +}
>  #endif
>  
>  #ifndef pmd_addr_end
> -#define pmd_addr_end(pmd, addr, end)					\
> -({	unsigned long __boundary = ((addr) + PMD_SIZE) & PMD_MASK;	\
> -	(__boundary - 1 < (end) - 1)? __boundary: (end);		\
> -})
> +#define pmd_addr_end pmd_addr_end
> +static inline unsigned long pmd_addr_end(pmd_t pmd, unsigned long addr, unsigned long end)
> +{	unsigned long __boundary = (addr + PMD_SIZE) & PMD_MASK;
> +	return (__boundary - 1 < end - 1) ? __boundary : end;
> +}
>  #endif
>  
>  /*
> -- 
> 2.17.1
> 

-- 
Sincerely yours,
Mike.
