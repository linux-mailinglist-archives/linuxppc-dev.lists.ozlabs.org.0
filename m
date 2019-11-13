Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E21FFB7CC
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Nov 2019 19:40:43 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47Ctj44YyDzF64p
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Nov 2019 05:40:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=134.134.136.65; helo=mga03.intel.com;
 envelope-from=ira.weiny@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47CtfX1qBfzF3Bx
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Nov 2019 05:38:27 +1100 (AEDT)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 13 Nov 2019 10:38:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,301,1569308400"; d="scan'208";a="207879666"
Received: from iweiny-desk2.sc.intel.com ([10.3.52.157])
 by orsmga006.jf.intel.com with ESMTP; 13 Nov 2019 10:38:23 -0800
Date: Wed, 13 Nov 2019 10:38:23 -0800
From: Ira Weiny <ira.weiny@intel.com>
To: John Hubbard <jhubbard@nvidia.com>
Subject: Re: [PATCH v4 03/23] mm/gup: move try_get_compound_head() to top,
 fix minor issues
Message-ID: <20191113183822.GC12699@iweiny-DESK2.sc.intel.com>
References: <20191113042710.3997854-1-jhubbard@nvidia.com>
 <20191113042710.3997854-4-jhubbard@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191113042710.3997854-4-jhubbard@nvidia.com>
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
 Jonathan Corbet <corbet@lwn.net>, linux-rdma@vger.kernel.org,
 Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 Vlastimil Babka <vbabka@suse.cz>,
 =?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn.topel@intel.com>,
 linux-media@vger.kernel.org, linux-block@vger.kernel.org,
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

On Tue, Nov 12, 2019 at 08:26:50PM -0800, John Hubbard wrote:
> An upcoming patch uses try_get_compound_head() more widely,
> so move it to the top of gup.c.
> 
> Also fix a tiny spelling error and a checkpatch.pl warning.
> 
> Signed-off-by: John Hubbard <jhubbard@nvidia.com>

Simple enough...

Reviewed-by: Ira Weiny <ira.weiny@intel.com>

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
