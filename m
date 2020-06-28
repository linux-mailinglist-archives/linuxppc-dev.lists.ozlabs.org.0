Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2609F20C699
	for <lists+linuxppc-dev@lfdr.de>; Sun, 28 Jun 2020 09:02:13 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49vhPs4FX8zDr3j
	for <lists+linuxppc-dev@lfdr.de>; Sun, 28 Jun 2020 17:02:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=rppt@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=Qm3qqF3d; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49vhMW6fffzDqNv
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 28 Jun 2020 17:00:07 +1000 (AEST)
Received: from kernel.org (unknown [87.71.40.38])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D042720702;
 Sun, 28 Jun 2020 06:59:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1593327604;
 bh=hu/tW2f/lIs0zzXJSvCrgwdLd0PRG2JIRHvUCcaAjqM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Qm3qqF3d78J/gFOwv6YVJb71itb3mymeRhGcaLrkXQY5dETAmGwNnfv+uXEMscIi2
 mPZsATFBdJNygr2fnTWo/ejLleXfIjFaiD5KXp/1ygh8w33HlLwG0oN/C/qRCb8sbq
 bU6JOX1KtJfeNxxfnsJIYZnBX1A1gh84k+HeVxCY=
Date: Sun, 28 Jun 2020 09:59:51 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Matthew Wilcox <willy@infradead.org>
Subject: Re: [PATCH 9/8] mm: Account PMD tables like PTE tables
Message-ID: <20200628065951.GB576120@kernel.org>
References: <20200627143453.31835-1-rppt@kernel.org>
 <20200627184642.GF25039@casper.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200627184642.GF25039@casper.infradead.org>
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
Cc: linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org,
 Peter Zijlstra <peterz@infradead.org>, linux-mips@vger.kernel.org,
 Max Filippov <jcmvbkbc@gmail.com>,
 Satheesh Rajendran <sathnaga@linux.vnet.ibm.com>, linux-csky@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-arch@vger.kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>,
 linux-hexagon@vger.kernel.org, Joerg Roedel <joro@8bytes.org>,
 Mike Rapoport <rppt@linux.ibm.com>, Abdul Haleem <abdhalee@linux.vnet.ibm.com>,
 linux-snps-arc@lists.infradead.org, linux-xtensa@linux-xtensa.org,
 Arnd Bergmann <arnd@arndb.de>, linux-s390@vger.kernel.org,
 linux-um@lists.infradead.org, Steven Rostedt <rostedt@goodmis.org>,
 linux-m68k@lists.linux-m68k.org, openrisc@lists.librecores.org,
 Andy Lutomirski <luto@kernel.org>, Stafford Horne <shorne@gmail.com>,
 linux-arm-kernel@lists.infradead.org, linux-parisc@vger.kernel.org,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, Jun 27, 2020 at 07:46:42PM +0100, Matthew Wilcox wrote:
> We account the PTE level of the page tables to the process in order to
> make smarter OOM decisions and help diagnose why memory is fragmented.
> For these same reasons, we should account pages allocated for PMDs.
> With larger process address spaces and ASLR, the number of PMDs in use
> is higher than it used to be so the inaccuracy is starting to matter.
> 
> Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>

Reviewed-by: Mike Rapoport <rppt@linux.ibm.com>

> ---
>  include/linux/mm.h | 24 ++++++++++++++++++++----
>  1 file changed, 20 insertions(+), 4 deletions(-)
> 
> diff --git a/include/linux/mm.h b/include/linux/mm.h
> index dc7b87310c10..b283e25fcffa 100644
> --- a/include/linux/mm.h
> +++ b/include/linux/mm.h
> @@ -2271,7 +2271,7 @@ static inline spinlock_t *pmd_lockptr(struct mm_struct *mm, pmd_t *pmd)
>  	return ptlock_ptr(pmd_to_page(pmd));
>  }
>  
> -static inline bool pgtable_pmd_page_ctor(struct page *page)
> +static inline bool pmd_ptlock_init(struct page *page)
>  {
>  #ifdef CONFIG_TRANSPARENT_HUGEPAGE
>  	page->pmd_huge_pte = NULL;
> @@ -2279,7 +2279,7 @@ static inline bool pgtable_pmd_page_ctor(struct page *page)
>  	return ptlock_init(page);
>  }
>  
> -static inline void pgtable_pmd_page_dtor(struct page *page)
> +static inline void pmd_ptlock_free(struct page *page)
>  {
>  #ifdef CONFIG_TRANSPARENT_HUGEPAGE
>  	VM_BUG_ON_PAGE(page->pmd_huge_pte, page);
> @@ -2296,8 +2296,8 @@ static inline spinlock_t *pmd_lockptr(struct mm_struct *mm, pmd_t *pmd)
>  	return &mm->page_table_lock;
>  }
>  
> -static inline bool pgtable_pmd_page_ctor(struct page *page) { return true; }
> -static inline void pgtable_pmd_page_dtor(struct page *page) {}
> +static inline bool pmd_ptlock_init(struct page *page) { return true; }
> +static inline void pmd_ptlock_free(struct page *page) {}
>  
>  #define pmd_huge_pte(mm, pmd) ((mm)->pmd_huge_pte)
>  
> @@ -2310,6 +2310,22 @@ static inline spinlock_t *pmd_lock(struct mm_struct *mm, pmd_t *pmd)
>  	return ptl;
>  }
>  
> +static inline bool pgtable_pmd_page_ctor(struct page *page)
> +{
> +	if (!pmd_ptlock_init(page))
> +		return false;
> +	__SetPageTable(page);
> +	inc_zone_page_state(page, NR_PAGETABLE);
> +	return true;
> +}
> +
> +static inline void pgtable_pmd_page_dtor(struct page *page)
> +{
> +	pmd_ptlock_free(page);
> +	__ClearPageTable(page);
> +	dec_zone_page_state(page, NR_PAGETABLE);
> +}
> +
>  /*
>   * No scalability reason to split PUD locks yet, but follow the same pattern
>   * as the PMD locks to make it easier if we decide to.  The VM should not be
> -- 
> 2.27.0
> 

-- 
Sincerely yours,
Mike.
