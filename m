Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BFC5710236F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Nov 2019 12:40:47 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47HP5l56W3zDqg8
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Nov 2019 22:40:43 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 47HP2Y4VZNzDqNj
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Nov 2019 22:37:56 +1100 (AEDT)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 8BC3DBCC5;
 Tue, 19 Nov 2019 11:37:52 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
 id 1D7961E47E5; Tue, 19 Nov 2019 12:37:46 +0100 (CET)
Date: Tue, 19 Nov 2019 12:37:46 +0100
From: Jan Kara <jack@suse.cz>
To: John Hubbard <jhubbard@nvidia.com>
Subject: Re: [PATCH v6 17/24] mm/gup: track FOLL_PIN pages
Message-ID: <20191119113746.GD25605@quack2.suse.cz>
References: <20191119081643.1866232-1-jhubbard@nvidia.com>
 <20191119081643.1866232-18-jhubbard@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191119081643.1866232-18-jhubbard@nvidia.com>
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

On Tue 19-11-19 00:16:36, John Hubbard wrote:
> @@ -2025,6 +2149,20 @@ static int __record_subpages(struct page *page, unsigned long addr,
>  	return nr;
>  }
>  
> +static bool __pin_compound_head(struct page *head, int refs, unsigned int flags)
> +{

I don't quite like the proliferation of names starting with __. I don't
think there's a good reason for that, particularly in this case. Also 'pin'
here is somewhat misleading as we already use term "pin" for the particular
way of pinning the page. We could have grab_compound_head() or maybe
nail_compound_head() :), but you're native speaker so you may come up with
better word.

> +	if (flags & FOLL_PIN) {
> +		if (unlikely(!try_pin_compound_head(head, refs)))
> +			return false;
> +	} else {
> +		head = try_get_compound_head(head, refs);
> +		if (!head)
> +			return false;
> +	}
> +
> +	return true;
> +}
> +
>  static void put_compound_head(struct page *page, int refs)
>  {
>  	/* Do a get_page() first, in case refs == page->_refcount */

put_compound_head() needs similar treatment as undo_dev_pagemap(), doesn't
it?

> @@ -968,7 +973,18 @@ struct page *follow_devmap_pmd(struct vm_area_struct *vma, unsigned long addr,
>  	if (!*pgmap)
>  		return ERR_PTR(-EFAULT);
>  	page = pfn_to_page(pfn);
> -	get_page(page);
> +
> +	if (flags & FOLL_GET)
> +		get_page(page);
> +	else if (flags & FOLL_PIN) {
> +		/*
> +		 * try_pin_page() is not actually expected to fail here because
> +		 * we hold the pmd lock so no one can unmap the pmd and free the
> +		 * page that it points to.
> +		 */
> +		if (unlikely(!try_pin_page(page)))
> +			page = ERR_PTR(-EFAULT);
> +	}

This pattern is rather common. So maybe I'd add a helper grab_page(page,
flags) doing

	if (flags & FOLL_GET)
		get_page(page);
	else if (flags & FOLL_PIN)
		return try_pin_page(page);
	return true;

Otherwise the patch looks good to me now.

								Honza
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR
