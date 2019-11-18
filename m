Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DEE4C100726
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Nov 2019 15:15:40 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47GrZx6wB2zDqTG
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Nov 2019 01:15:37 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 47Gnc95rHZzDqQq
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 Nov 2019 23:01:29 +1100 (AEDT)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id E731CB061;
 Mon, 18 Nov 2019 12:01:20 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
 id 7EC421E4B09; Mon, 18 Nov 2019 11:16:58 +0100 (CET)
Date: Mon, 18 Nov 2019 11:16:58 +0100
From: Jan Kara <jack@suse.cz>
To: John Hubbard <jhubbard@nvidia.com>
Subject: Re: [PATCH v5 11/24] goldish_pipe: convert to pin_user_pages() and
 put_user_page()
Message-ID: <20191118101658.GG17319@quack2.suse.cz>
References: <20191115055340.1825745-1-jhubbard@nvidia.com>
 <20191115055340.1825745-12-jhubbard@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191115055340.1825745-12-jhubbard@nvidia.com>
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

On Thu 14-11-19 21:53:27, John Hubbard wrote:
> 1. Call the new global pin_user_pages_fast(), from pin_goldfish_pages().
> 
> 2. As required by pin_user_pages(), release these pages via
> put_user_page(). In this case, do so via put_user_pages_dirty_lock().
> 
> That has the side effect of calling set_page_dirty_lock(), instead
> of set_page_dirty(). This is probably more accurate.
> 
> As Christoph Hellwig put it, "set_page_dirty() is only safe if we are
> dealing with a file backed page where we have reference on the inode it
> hangs off." [1]
> 
> Another side effect is that the release code is simplified because
> the page[] loop is now in gup.c instead of here, so just delete the
> local release_user_pages() entirely, and call
> put_user_pages_dirty_lock() directly, instead.
> 
> [1] https://lore.kernel.org/r/20190723153640.GB720@lst.de
> 
> Reviewed-by: Ira Weiny <ira.weiny@intel.com>
> Signed-off-by: John Hubbard <jhubbard@nvidia.com>

Looks good to me. You can add:

Reviewed-by: Jan Kara <jack@suse.cz>

								Honza

> ---
>  drivers/platform/goldfish/goldfish_pipe.c | 17 +++--------------
>  1 file changed, 3 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/platform/goldfish/goldfish_pipe.c b/drivers/platform/goldfish/goldfish_pipe.c
> index 7ed2a21a0bac..635a8bc1b480 100644
> --- a/drivers/platform/goldfish/goldfish_pipe.c
> +++ b/drivers/platform/goldfish/goldfish_pipe.c
> @@ -274,7 +274,7 @@ static int pin_goldfish_pages(unsigned long first_page,
>  		*iter_last_page_size = last_page_size;
>  	}
>  
> -	ret = get_user_pages_fast(first_page, requested_pages,
> +	ret = pin_user_pages_fast(first_page, requested_pages,
>  				  !is_write ? FOLL_WRITE : 0,
>  				  pages);
>  	if (ret <= 0)
> @@ -285,18 +285,6 @@ static int pin_goldfish_pages(unsigned long first_page,
>  	return ret;
>  }
>  
> -static void release_user_pages(struct page **pages, int pages_count,
> -			       int is_write, s32 consumed_size)
> -{
> -	int i;
> -
> -	for (i = 0; i < pages_count; i++) {
> -		if (!is_write && consumed_size > 0)
> -			set_page_dirty(pages[i]);
> -		put_page(pages[i]);
> -	}
> -}
> -
>  /* Populate the call parameters, merging adjacent pages together */
>  static void populate_rw_params(struct page **pages,
>  			       int pages_count,
> @@ -372,7 +360,8 @@ static int transfer_max_buffers(struct goldfish_pipe *pipe,
>  
>  	*consumed_size = pipe->command_buffer->rw_params.consumed_size;
>  
> -	release_user_pages(pipe->pages, pages_count, is_write, *consumed_size);
> +	put_user_pages_dirty_lock(pipe->pages, pages_count,
> +				  !is_write && *consumed_size > 0);
>  
>  	mutex_unlock(&pipe->lock);
>  	return 0;
> -- 
> 2.24.0
> 
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR
