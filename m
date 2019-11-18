Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F18D1006D1
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Nov 2019 14:52:06 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47Gr3l3zk7zDqS2
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Nov 2019 00:52:03 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 47GnXz1XRzzDqSQ
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 Nov 2019 22:58:43 +1100 (AEDT)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 67C34AE68;
 Mon, 18 Nov 2019 11:58:37 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
 id 912131E4B0C; Mon, 18 Nov 2019 12:58:29 +0100 (CET)
Date: Mon, 18 Nov 2019 12:58:29 +0100
From: Jan Kara <jack@suse.cz>
To: John Hubbard <jhubbard@nvidia.com>
Subject: Re: [PATCH v5 17/24] mm/gup: track FOLL_PIN pages
Message-ID: <20191118115829.GJ17319@quack2.suse.cz>
References: <20191115055340.1825745-1-jhubbard@nvidia.com>
 <20191115055340.1825745-18-jhubbard@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20191115055340.1825745-18-jhubbard@nvidia.com>
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
 Jonathan Corbet <corbet@lwn.net>, linux-rdma@vger.kernel.org,
 Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 Vlastimil Babka <vbabka@suse.cz>,
 =?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn.topel@intel.com>,
 linux-media@vger.kernel.org, Shuah Khan <shuah@kernel.org>,
 linux-block@vger.kernel.org,
 =?iso-8859-1?B?Suly9G1l?= Glisse <jglisse@redhat.com>,
 Al Viro <viro@zeniv.linux.org.uk>, Dan Williams <dan.j.williams@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, bpf@vger.kernel.org,
 Magnus Karlsson <magnus.karlsson@intel.com>, Jens Axboe <axboe@kernel.dk>,
 netdev@vger.kernel.org, Alex Williamson <alex.williamson@redhat.com>,
 Daniel Vetter <daniel@ffwll.ch>, linux-fsdevel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 "David S . Miller" <davem@davemloft.net>,
 Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu 14-11-19 21:53:33, John Hubbard wrote:
> Add tracking of pages that were pinned via FOLL_PIN.
> 
> As mentioned in the FOLL_PIN documentation, callers who effectively set
> FOLL_PIN are required to ultimately free such pages via put_user_page().
> The effect is similar to FOLL_GET, and may be thought of as "FOLL_GET
> for DIO and/or RDMA use".
> 
> Pages that have been pinned via FOLL_PIN are identifiable via a
> new function call:
> 
>    bool page_dma_pinned(struct page *page);
> 
> What to do in response to encountering such a page, is left to later
> patchsets. There is discussion about this in [1].
						^^ missing this reference
in the changelog...

> This also changes a BUG_ON(), to a WARN_ON(), in follow_page_mask().
> 
> Suggested-by: Jan Kara <jack@suse.cz>
> Suggested-by: J�r�me Glisse <jglisse@redhat.com>
> Signed-off-by: John Hubbard <jhubbard@nvidia.com>
> ---
> diff --git a/include/linux/mm.h b/include/linux/mm.h
> index 6588d2e02628..db872766480f 100644
> --- a/include/linux/mm.h
> +++ b/include/linux/mm.h
> @@ -1054,6 +1054,8 @@ static inline __must_check bool try_get_page(struct page *page)
>  	return true;
>  }
>  
> +__must_check bool user_page_ref_inc(struct page *page);
> +
>  static inline void put_page(struct page *page)
>  {
>  	page = compound_head(page);
> @@ -1071,29 +1073,70 @@ static inline void put_page(struct page *page)
>  		__put_page(page);
>  }
>  
> -/**
> - * put_user_page() - release a gup-pinned page
> - * @page:            pointer to page to be released
> +/*
> + * GUP_PIN_COUNTING_BIAS, and the associated functions that use it, overload
> + * the page's refcount so that two separate items are tracked: the original page
> + * reference count, and also a new count of how many get_user_pages() calls were
							^^ pin_user_pages()

> + * made against the page. ("gup-pinned" is another term for the latter).
> + *
> + * With this scheme, get_user_pages() becomes special: such pages are marked
			^^^ pin_user_pages()

> + * as distinct from normal pages. As such, the put_user_page() call (and its
> + * variants) must be used in order to release gup-pinned pages.
> + *
> + * Choice of value:
>   *
> - * Pages that were pinned via pin_user_pages*() must be released via either
> - * put_user_page(), or one of the put_user_pages*() routines. This is so that
> - * eventually such pages can be separately tracked and uniquely handled. In
> - * particular, interactions with RDMA and filesystems need special handling.
> + * By making GUP_PIN_COUNTING_BIAS a power of two, debugging of page reference
> + * counts with respect to get_user_pages() and put_user_page() becomes simpler,
				^^^ pin_user_pages()

> + * due to the fact that adding an even power of two to the page refcount has
> + * the effect of using only the upper N bits, for the code that counts up using
> + * the bias value. This means that the lower bits are left for the exclusive
> + * use of the original code that increments and decrements by one (or at least,
> + * by much smaller values than the bias value).
>   *
> - * put_user_page() and put_page() are not interchangeable, despite this early
> - * implementation that makes them look the same. put_user_page() calls must
> - * be perfectly matched up with pin*() calls.
> + * Of course, once the lower bits overflow into the upper bits (and this is
> + * OK, because subtraction recovers the original values), then visual inspection
> + * no longer suffices to directly view the separate counts. However, for normal
> + * applications that don't have huge page reference counts, this won't be an
> + * issue.
> + *
> + * Locking: the lockless algorithm described in page_cache_get_speculative()
> + * and page_cache_gup_pin_speculative() provides safe operation for
> + * get_user_pages and page_mkclean and other calls that race to set up page
> + * table entries.
>   */
...
> @@ -2070,9 +2191,16 @@ static int gup_hugepte(pte_t *ptep, unsigned long sz, unsigned long addr,
>  	page = head + ((addr & (sz-1)) >> PAGE_SHIFT);
>  	refs = __record_subpages(page, addr, end, pages + *nr);
>  
> -	head = try_get_compound_head(head, refs);
> -	if (!head)
> -		return 0;
> +	if (flags & FOLL_PIN) {
> +		head = page;
> +		if (unlikely(!user_page_ref_inc(head)))
> +			return 0;
> +		head = page;

Why do you assign 'head' twice? Also the refcounting logic is repeated
several times so perhaps you can factor it out in to a helper function or
even move it to __record_subpages()?

> +	} else {
> +		head = try_get_compound_head(head, refs);
> +		if (!head)
> +			return 0;
> +	}
>  
>  	if (unlikely(pte_val(pte) != pte_val(*ptep))) {
>  		put_compound_head(head, refs);

So this will do the wrong thing for FOLL_PIN. We took just one "pin"
reference there but here we'll release 'refs' normal references AFAICT.
Also the fact that you take just one pin reference for each huge page
substantially changes how GUP refcounting works in the huge page case.
Currently, FOLL_GET users can be completely agnostic of huge pages. So you
can e.g. GUP whole 2 MB page, submit it as 2 different bios and then
drop page references from each bio completion function. With your new
FOLL_PIN behavior you cannot do that and I believe it will be a problem for
some users. So I think you have to maintain the behavior that you increase
the head->_refcount by (refs * GUP_PIN_COUNTING_BIAS) here.

								Honza
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR
