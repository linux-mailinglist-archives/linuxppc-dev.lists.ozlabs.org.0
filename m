Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B10E11021F9
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Nov 2019 11:21:38 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47HMLR6mYwzDqJ2
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Nov 2019 21:21:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=suse.cz
 (client-ip=195.135.220.15; helo=mx1.suse.de; envelope-from=jack@suse.cz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=suse.cz
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47HMHq60JxzDqCV
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Nov 2019 21:19:18 +1100 (AEDT)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 737CFAE87;
 Tue, 19 Nov 2019 10:19:13 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
 id D586A1E47E5; Tue, 19 Nov 2019 11:19:10 +0100 (CET)
Date: Tue, 19 Nov 2019 11:19:10 +0100
From: Jan Kara <jack@suse.cz>
To: John Hubbard <jhubbard@nvidia.com>
Subject: Re: [PATCH v6 02/24] mm/gup: factor out duplicate code from four
 routines
Message-ID: <20191119101910.GC25605@quack2.suse.cz>
References: <20191119081643.1866232-1-jhubbard@nvidia.com>
 <20191119081643.1866232-3-jhubbard@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20191119081643.1866232-3-jhubbard@nvidia.com>
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
Cc: Michal Hocko <mhocko@suse.com>, Jan Kara <jack@suse.cz>,
 kvm@vger.kernel.org, linux-doc@vger.kernel.org,
 David Airlie <airlied@linux.ie>, Dave Chinner <david@fromorbit.com>,
 dri-devel@lists.freedesktop.org, LKML <linux-kernel@vger.kernel.org>,
 linux-mm@kvack.org, Paul Mackerras <paulus@samba.org>,
 linux-kselftest@vger.kernel.org, Ira Weiny <ira.weiny@intel.com>,
 Christoph Hellwig <hch@lst.de>, Jonathan Corbet <corbet@lwn.net>,
 linux-rdma@vger.kernel.org, Christoph Hellwig <hch@infradead.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, Vlastimil Babka <vbabka@suse.cz>,
 =?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn.topel@intel.com>,
 linux-media@vger.kernel.org, Shuah Khan <shuah@kernel.org>,
 linux-block@vger.kernel.org,
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

On Tue 19-11-19 00:16:21, John Hubbard wrote:
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
> 
> Reviewed-by: Jérôme Glisse <jglisse@redhat.com>
> Cc: Jan Kara <jack@suse.cz>
> Cc: Ira Weiny <ira.weiny@intel.com>
> Cc: Christoph Hellwig <hch@lst.de>
> Cc: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> Signed-off-by: John Hubbard <jhubbard@nvidia.com>

Looks good to me now! You can add:

Reviewed-by: Jan Kara <jack@suse.cz>

								Honza

> ---
>  mm/gup.c | 91 ++++++++++++++++++++++----------------------------------
>  1 file changed, 36 insertions(+), 55 deletions(-)
> 
> diff --git a/mm/gup.c b/mm/gup.c
> index 85caf76b3012..f3c7d6625817 100644
> --- a/mm/gup.c
> +++ b/mm/gup.c
> @@ -1969,6 +1969,25 @@ static int __gup_device_huge_pud(pud_t pud, pud_t *pudp, unsigned long addr,
>  }
>  #endif
>  
> +static int __record_subpages(struct page *page, unsigned long addr,
> +			     unsigned long end, struct page **pages)
> +{
> +	int nr;
> +
> +	for (nr = 0; addr != end; addr += PAGE_SIZE)
> +		pages[nr++] = page++;
> +
> +	return nr;
> +}
> +
> +static void put_compound_head(struct page *page, int refs)
> +{
> +	/* Do a get_page() first, in case refs == page->_refcount */
> +	get_page(page);
> +	page_ref_sub(page, refs);
> +	put_page(page);
> +}
> +
>  #ifdef CONFIG_ARCH_HAS_HUGEPD
>  static unsigned long hugepte_addr_end(unsigned long addr, unsigned long end,
>  				      unsigned long sz)
> @@ -1998,32 +2017,20 @@ static int gup_hugepte(pte_t *ptep, unsigned long sz, unsigned long addr,
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
> +	refs = __record_subpages(page, addr, end, pages + *nr);
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
> +		put_compound_head(head, refs);
>  		return 0;
>  	}
>  
> +	*nr += refs;
>  	SetPageReferenced(head);
>  	return 1;
>  }
> @@ -2071,28 +2078,19 @@ static int gup_huge_pmd(pmd_t orig, pmd_t *pmdp, unsigned long addr,
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
> +	refs = __record_subpages(page, addr, end, pages + *nr);
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
> +		put_compound_head(head, refs);
>  		return 0;
>  	}
>  
> +	*nr += refs;
>  	SetPageReferenced(head);
>  	return 1;
>  }
> @@ -2114,28 +2112,19 @@ static int gup_huge_pud(pud_t orig, pud_t *pudp, unsigned long addr,
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
> +	refs = __record_subpages(page, addr, end, pages + *nr);
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
> +		put_compound_head(head, refs);
>  		return 0;
>  	}
>  
> +	*nr += refs;
>  	SetPageReferenced(head);
>  	return 1;
>  }
> @@ -2151,28 +2140,20 @@ static int gup_huge_pgd(pgd_t orig, pgd_t *pgdp, unsigned long addr,
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
> +	refs = __record_subpages(page, addr, end, pages + *nr);
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
> +		put_compound_head(head, refs);
>  		return 0;
>  	}
>  
> +	*nr += refs;
>  	SetPageReferenced(head);
>  	return 1;
>  }
> -- 
> 2.24.0
> 
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR
