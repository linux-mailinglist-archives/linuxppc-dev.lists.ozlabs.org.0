Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FBCBFAF07
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Nov 2019 11:54:43 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47ChMN2p5GzF5Ph
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Nov 2019 21:54:40 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 47ChGV5B1KzF6DH
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Nov 2019 21:50:26 +1100 (AEDT)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 91AAEB320;
 Wed, 13 Nov 2019 10:50:23 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
 id 550261E1498; Wed, 13 Nov 2019 11:50:23 +0100 (CET)
Date: Wed, 13 Nov 2019 11:50:23 +0100
From: Jan Kara <jack@suse.cz>
To: John Hubbard <jhubbard@nvidia.com>
Subject: Re: [PATCH v4 03/23] mm/gup: move try_get_compound_head() to top,
 fix minor issues
Message-ID: <20191113105023.GG6367@quack2.suse.cz>
References: <20191113042710.3997854-1-jhubbard@nvidia.com>
 <20191113042710.3997854-4-jhubbard@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191113042710.3997854-4-jhubbard@nvidia.com>
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

On Tue 12-11-19 20:26:50, John Hubbard wrote:
> An upcoming patch uses try_get_compound_head() more widely,
> so move it to the top of gup.c.
> 
> Also fix a tiny spelling error and a checkpatch.pl warning.
> 
> Signed-off-by: John Hubbard <jhubbard@nvidia.com>

Looks good. You can add:

Reviewed-by: Jan Kara <jack@suse.cz>

								Honza

> ---
>  mm/gup.c | 29 +++++++++++++++--------------
>  1 file changed, 15 insertions(+), 14 deletions(-)
> 
> diff --git a/mm/gup.c b/mm/gup.c
> index 199da99e8ffc..933524de6249 100644
> --- a/mm/gup.c
> +++ b/mm/gup.c
> @@ -29,6 +29,21 @@ struct follow_page_context {
>  	unsigned int page_mask;
>  };
>  
> +/*
> + * Return the compound head page with ref appropriately incremented,
> + * or NULL if that failed.
> + */
> +static inline struct page *try_get_compound_head(struct page *page, int refs)
> +{
> +	struct page *head = compound_head(page);
> +
> +	if (WARN_ON_ONCE(page_ref_count(head) < 0))
> +		return NULL;
> +	if (unlikely(!page_cache_add_speculative(head, refs)))
> +		return NULL;
> +	return head;
> +}
> +
>  /**
>   * put_user_pages_dirty_lock() - release and optionally dirty gup-pinned pages
>   * @pages:  array of pages to be maybe marked dirty, and definitely released.
> @@ -1793,20 +1808,6 @@ static void __maybe_unused undo_dev_pagemap(int *nr, int nr_start,
>  	}
>  }
>  
> -/*
> - * Return the compund head page with ref appropriately incremented,
> - * or NULL if that failed.
> - */
> -static inline struct page *try_get_compound_head(struct page *page, int refs)
> -{
> -	struct page *head = compound_head(page);
> -	if (WARN_ON_ONCE(page_ref_count(head) < 0))
> -		return NULL;
> -	if (unlikely(!page_cache_add_speculative(head, refs)))
> -		return NULL;
> -	return head;
> -}
> -
>  #ifdef CONFIG_ARCH_HAS_PTE_SPECIAL
>  static int gup_pte_range(pmd_t pmd, unsigned long addr, unsigned long end,
>  			 unsigned int flags, struct page **pages, int *nr)
> -- 
> 2.24.0
> 
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR
