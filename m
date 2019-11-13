Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C23ECFAEC6
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Nov 2019 11:45:46 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47Ch92571szF7WB
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Nov 2019 21:45:42 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 47Ch6D5PlrzF31q
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Nov 2019 21:43:15 +1100 (AEDT)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 8E4ECB2D5;
 Wed, 13 Nov 2019 10:43:11 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
 id 7E7151E1498; Wed, 13 Nov 2019 11:43:08 +0100 (CET)
Date: Wed, 13 Nov 2019 11:43:08 +0100
From: Jan Kara <jack@suse.cz>
To: John Hubbard <jhubbard@nvidia.com>
Subject: Re: [PATCH v4 09/23] mm/gup: introduce pin_user_pages*() and FOLL_PIN
Message-ID: <20191113104308.GE6367@quack2.suse.cz>
References: <20191113042710.3997854-1-jhubbard@nvidia.com>
 <20191113042710.3997854-10-jhubbard@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20191113042710.3997854-10-jhubbard@nvidia.com>
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
 Mike Rapoport <rppt@linux.ibm.com>, Christoph Hellwig <hch@infradead.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, Vlastimil Babka <vbabka@suse.cz>,
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

On Tue 12-11-19 20:26:56, John Hubbard wrote:
> Introduce pin_user_pages*() variations of get_user_pages*() calls,
> and also pin_longterm_pages*() variations.
> 
> These variants all set FOLL_PIN, which is also introduced, and
> thoroughly documented.
> 
> The pin_longterm*() variants also set FOLL_LONGTERM, in addition
> to FOLL_PIN:
> 
>     pin_user_pages()
>     pin_user_pages_remote()
>     pin_user_pages_fast()
> 
>     pin_longterm_pages()
>     pin_longterm_pages_remote()
>     pin_longterm_pages_fast()
> 
> All pages that are pinned via the above calls, must be unpinned via
> put_user_page().
> 
> The underlying rules are:
> 
> * These are gup-internal flags, so the call sites should not directly
> set FOLL_PIN nor FOLL_LONGTERM. That behavior is enforced with
> assertions, for the new FOLL_PIN flag. However, for the pre-existing
> FOLL_LONGTERM flag, which has some call sites that still directly
> set FOLL_LONGTERM, there is no assertion yet.
> 
> * Call sites that want to indicate that they are going to do DirectIO
>   ("DIO") or something with similar characteristics, should call a
>   get_user_pages()-like wrapper call that sets FOLL_PIN. These wrappers
>   will:
>         * Start with "pin_user_pages" instead of "get_user_pages". That
>           makes it easy to find and audit the call sites.
>         * Set FOLL_PIN
> 
> * For pages that are received via FOLL_PIN, those pages must be returned
>   via put_user_page().
> 
> Thanks to Jan Kara and Vlastimil Babka for explaining the 4 cases
> in this documentation. (I've reworded it and expanded upon it.)
> 
> Reviewed-by: Mike Rapoport <rppt@linux.ibm.com>  # Documentation
> Reviewed-by: Jérôme Glisse <jglisse@redhat.com>
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: Ira Weiny <ira.weiny@intel.com>
> Signed-off-by: John Hubbard <jhubbard@nvidia.com>

Thanks for the documentation. It looks great!

> diff --git a/mm/gup.c b/mm/gup.c
> index 83702b2e86c8..4409e84dff51 100644
> --- a/mm/gup.c
> +++ b/mm/gup.c
> @@ -201,6 +201,10 @@ static struct page *follow_page_pte(struct vm_area_struct *vma,
>  	spinlock_t *ptl;
>  	pte_t *ptep, pte;
>  
> +	/* FOLL_GET and FOLL_PIN are mutually exclusive. */
> +	if (WARN_ON_ONCE((flags & (FOLL_PIN | FOLL_GET)) ==
> +			 (FOLL_PIN | FOLL_GET)))
> +		return ERR_PTR(-EINVAL);
>  retry:
>  	if (unlikely(pmd_bad(*pmd)))
>  		return no_page_table(vma, flags);

How does FOLL_PIN result in grabbing (at least normal, for now) page reference?
I didn't find that anywhere in this patch but it is a prerequisite to
converting any user to pin_user_pages() interface, right?

> +/**
> + * pin_user_pages_fast() - pin user pages in memory without taking locks
> + *
> + * Nearly the same as get_user_pages_fast(), except that FOLL_PIN is set. See
> + * get_user_pages_fast() for documentation on the function arguments, because
> + * the arguments here are identical.
> + *
> + * FOLL_PIN means that the pages must be released via put_user_page(). Please
> + * see Documentation/vm/pin_user_pages.rst for further details.
> + *
> + * This is intended for Case 1 (DIO) in Documentation/vm/pin_user_pages.rst. It
> + * is NOT intended for Case 2 (RDMA: long-term pins).
> + */
> +int pin_user_pages_fast(unsigned long start, int nr_pages,
> +			unsigned int gup_flags, struct page **pages)
> +{
> +	/* FOLL_GET and FOLL_PIN are mutually exclusive. */
> +	if (WARN_ON_ONCE(gup_flags & FOLL_GET))
> +		return -EINVAL;
> +
> +	gup_flags |= FOLL_PIN;
> +	return internal_get_user_pages_fast(start, nr_pages, gup_flags, pages);
> +}
> +EXPORT_SYMBOL_GPL(pin_user_pages_fast);

I was somewhat wondering about the number of functions you add here. So we
have:

pin_user_pages()
pin_user_pages_fast()
pin_user_pages_remote()

and then longterm variants:

pin_longterm_pages()
pin_longterm_pages_fast()
pin_longterm_pages_remote()

and obviously we have gup like:
get_user_pages()
get_user_pages_fast()
get_user_pages_remote()
... and some other gup variants ...

I think we really should have pin_* vs get_* variants as they are very
different in terms of guarantees and after conversion, any use of get_*
variant in non-mm code should be closely scrutinized. OTOH pin_longterm_*
don't look *that* useful to me and just using pin_* instead with
FOLL_LONGTERM flag would look OK to me and somewhat reduce the number of
functions which is already large enough? What do people think? I don't feel
too strongly about this but wanted to bring this up.

								Honza



-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR
