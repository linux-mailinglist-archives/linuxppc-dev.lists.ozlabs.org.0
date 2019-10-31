Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CD403EB724
	for <lists+linuxppc-dev@lfdr.de>; Thu, 31 Oct 2019 19:37:58 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 473vFv5HxzzF567
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Nov 2019 05:37:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=134.134.136.100; helo=mga07.intel.com;
 envelope-from=ira.weiny@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 473vCf2nX5zF5Yq
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  1 Nov 2019 05:35:53 +1100 (AEDT)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 31 Oct 2019 11:35:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,252,1569308400"; d="scan'208";a="230963750"
Received: from iweiny-desk2.sc.intel.com ([10.3.52.157])
 by fmsmga002.fm.intel.com with ESMTP; 31 Oct 2019 11:35:49 -0700
Date: Thu, 31 Oct 2019 11:35:49 -0700
From: Ira Weiny <ira.weiny@intel.com>
To: John Hubbard <jhubbard@nvidia.com>
Subject: Re: [PATCH 02/19] mm/gup: factor out duplicate code from four routines
Message-ID: <20191031183549.GC14771@iweiny-DESK2.sc.intel.com>
References: <20191030224930.3990755-1-jhubbard@nvidia.com>
 <20191030224930.3990755-3-jhubbard@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191030224930.3990755-3-jhubbard@nvidia.com>
User-Agent: Mutt/1.11.1 (2018-12-01)
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
Cc: Michal Hocko <mhocko@suse.com>, Jan Kara <jack@suse.cz>,
 kvm@vger.kernel.org, linux-doc@vger.kernel.org,
 David Airlie <airlied@linux.ie>, Dave Chinner <david@fromorbit.com>,
 dri-devel@lists.freedesktop.org, LKML <linux-kernel@vger.kernel.org>,
 linux-mm@kvack.org, Paul Mackerras <paulus@samba.org>,
 linux-kselftest@vger.kernel.org, Shuah Khan <shuah@kernel.org>,
 Christoph Hellwig <hch@lst.de>, Jonathan Corbet <corbet@lwn.net>,
 linux-rdma@vger.kernel.org, Christoph Hellwig <hch@infradead.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, Vlastimil Babka <vbabka@suse.cz>,
 =?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn.topel@intel.com>,
 linux-media@vger.kernel.org, linux-block@vger.kernel.org,
 =?iso-8859-1?B?Suly9G1l?= Glisse <jglisse@redhat.com>,
 Al Viro <viro@zeniv.linux.org.uk>, Dan Williams <dan.j.williams@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, bpf@vger.kernel.org,
 Magnus Karlsson <magnus.karlsson@intel.com>, Jens Axboe <axboe@kernel.dk>,
 netdev@vger.kernel.org, Alex Williamson <alex.williamson@redhat.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org, "David S . Miller" <davem@davemloft.net>,
 Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Oct 30, 2019 at 03:49:13PM -0700, John Hubbard wrote:
> There are four locations in gup.c that have a fair amount of code
> duplication. This means that changing one requires making the same
> changes in four places, not to mention reading the same code four
> times, and wondering if there are subtle differences.
> 
> Factor out the common code into static functions, thus reducing the
> overall line count and the code's complexity.
> 
> Also, take the opportunity to slightly improve the efficiency of the
> error cases, by doing a mass subtraction of the refcount, surrounded
> by get_page()/put_page().
> 
> Also, further simplify (slightly), by waiting until the the successful
> end of each routine, to increment *nr.

Overall it seems like a pretty good clean up.  It did take a bit of review but
I _think_ it is correct.  A couple of comments below.

> 
> Cc: Christoph Hellwig <hch@lst.de>
> Cc: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> Signed-off-by: John Hubbard <jhubbard@nvidia.com>
> ---
>  mm/gup.c | 113 ++++++++++++++++++++++---------------------------------
>  1 file changed, 46 insertions(+), 67 deletions(-)
> 
> diff --git a/mm/gup.c b/mm/gup.c
> index 85caf76b3012..8fb0d9cdfaf5 100644
> --- a/mm/gup.c
> +++ b/mm/gup.c
> @@ -1969,6 +1969,35 @@ static int __gup_device_huge_pud(pud_t pud, pud_t *pudp, unsigned long addr,
>  }
>  #endif
>  
> +static int __record_subpages(struct page *page, unsigned long addr,
> +			     unsigned long end, struct page **pages, int nr)
> +{
> +	int nr_recorded_pages = 0;
> +
> +	do {
> +		pages[nr] = page;
> +		nr++;
> +		page++;
> +		nr_recorded_pages++;
> +	} while (addr += PAGE_SIZE, addr != end);
> +	return nr_recorded_pages;
> +}
> +
> +static void __remove_refs_from_head(struct page *page, int refs)
> +{
> +	/* Do a get_page() first, in case refs == page->_refcount */
> +	get_page(page);
> +	page_ref_sub(page, refs);
> +	put_page(page);
> +}

I wonder if this is better implemented as "put_compound_head()"?  To match the
try_get_compound_head() call below?

> +
> +static int __huge_pt_done(struct page *head, int nr_recorded_pages, int *nr)
> +{
> +	*nr += nr_recorded_pages;
> +	SetPageReferenced(head);
> +	return 1;

When will this return anything but 1?

Ira

> +}
> +
>  #ifdef CONFIG_ARCH_HAS_HUGEPD
>  static unsigned long hugepte_addr_end(unsigned long addr, unsigned long end,
>  				      unsigned long sz)
> @@ -1998,34 +2027,19 @@ static int gup_hugepte(pte_t *ptep, unsigned long sz, unsigned long addr,
>  	/* hugepages are never "special" */
>  	VM_BUG_ON(!pfn_valid(pte_pfn(pte)));
>  
> -	refs = 0;
>  	head = pte_page(pte);
> -
>  	page = head + ((addr & (sz-1)) >> PAGE_SHIFT);
> -	do {
> -		VM_BUG_ON(compound_head(page) != head);
> -		pages[*nr] = page;
> -		(*nr)++;
> -		page++;
> -		refs++;
> -	} while (addr += PAGE_SIZE, addr != end);
> +	refs = __record_subpages(page, addr, end, pages, *nr);
>  
>  	head = try_get_compound_head(head, refs);
> -	if (!head) {
> -		*nr -= refs;
> +	if (!head)
>  		return 0;
> -	}
>  
>  	if (unlikely(pte_val(pte) != pte_val(*ptep))) {
> -		/* Could be optimized better */
> -		*nr -= refs;
> -		while (refs--)
> -			put_page(head);
> +		__remove_refs_from_head(head, refs);
>  		return 0;
>  	}
> -
> -	SetPageReferenced(head);
> -	return 1;
> +	return __huge_pt_done(head, refs, nr);
>  }
>  
>  static int gup_huge_pd(hugepd_t hugepd, unsigned long addr,
> @@ -2071,30 +2085,18 @@ static int gup_huge_pmd(pmd_t orig, pmd_t *pmdp, unsigned long addr,
>  					     pages, nr);
>  	}
>  
> -	refs = 0;
>  	page = pmd_page(orig) + ((addr & ~PMD_MASK) >> PAGE_SHIFT);
> -	do {
> -		pages[*nr] = page;
> -		(*nr)++;
> -		page++;
> -		refs++;
> -	} while (addr += PAGE_SIZE, addr != end);
> +	refs = __record_subpages(page, addr, end, pages, *nr);
>  
>  	head = try_get_compound_head(pmd_page(orig), refs);
> -	if (!head) {
> -		*nr -= refs;
> +	if (!head)
>  		return 0;
> -	}
>  
>  	if (unlikely(pmd_val(orig) != pmd_val(*pmdp))) {
> -		*nr -= refs;
> -		while (refs--)
> -			put_page(head);
> +		__remove_refs_from_head(head, refs);
>  		return 0;
>  	}
> -
> -	SetPageReferenced(head);
> -	return 1;
> +	return __huge_pt_done(head, refs, nr);
>  }
>  
>  static int gup_huge_pud(pud_t orig, pud_t *pudp, unsigned long addr,
> @@ -2114,30 +2116,18 @@ static int gup_huge_pud(pud_t orig, pud_t *pudp, unsigned long addr,
>  					     pages, nr);
>  	}
>  
> -	refs = 0;
>  	page = pud_page(orig) + ((addr & ~PUD_MASK) >> PAGE_SHIFT);
> -	do {
> -		pages[*nr] = page;
> -		(*nr)++;
> -		page++;
> -		refs++;
> -	} while (addr += PAGE_SIZE, addr != end);
> +	refs = __record_subpages(page, addr, end, pages, *nr);
>  
>  	head = try_get_compound_head(pud_page(orig), refs);
> -	if (!head) {
> -		*nr -= refs;
> +	if (!head)
>  		return 0;
> -	}
>  
>  	if (unlikely(pud_val(orig) != pud_val(*pudp))) {
> -		*nr -= refs;
> -		while (refs--)
> -			put_page(head);
> +		__remove_refs_from_head(head, refs);
>  		return 0;
>  	}
> -
> -	SetPageReferenced(head);
> -	return 1;
> +	return __huge_pt_done(head, refs, nr);
>  }
>  
>  static int gup_huge_pgd(pgd_t orig, pgd_t *pgdp, unsigned long addr,
> @@ -2151,30 +2141,19 @@ static int gup_huge_pgd(pgd_t orig, pgd_t *pgdp, unsigned long addr,
>  		return 0;
>  
>  	BUILD_BUG_ON(pgd_devmap(orig));
> -	refs = 0;
> +
>  	page = pgd_page(orig) + ((addr & ~PGDIR_MASK) >> PAGE_SHIFT);
> -	do {
> -		pages[*nr] = page;
> -		(*nr)++;
> -		page++;
> -		refs++;
> -	} while (addr += PAGE_SIZE, addr != end);
> +	refs = __record_subpages(page, addr, end, pages, *nr);
>  
>  	head = try_get_compound_head(pgd_page(orig), refs);
> -	if (!head) {
> -		*nr -= refs;
> +	if (!head)
>  		return 0;
> -	}
>  
>  	if (unlikely(pgd_val(orig) != pgd_val(*pgdp))) {
> -		*nr -= refs;
> -		while (refs--)
> -			put_page(head);
> +		__remove_refs_from_head(head, refs);
>  		return 0;
>  	}
> -
> -	SetPageReferenced(head);
> -	return 1;
> +	return __huge_pt_done(head, refs, nr);
>  }
>  
>  static int gup_pmd_range(pud_t pud, unsigned long addr, unsigned long end,
> -- 
> 2.23.0
> 
> 
