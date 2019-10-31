Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 75169EBAC9
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Nov 2019 00:46:51 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47426J2nwFzF4JH
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Nov 2019 10:46:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=134.134.136.24; helo=mga09.intel.com;
 envelope-from=ira.weiny@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4741wj13zPzF5Rp
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  1 Nov 2019 10:38:28 +1100 (AEDT)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 31 Oct 2019 16:38:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,253,1569308400"; d="scan'208";a="400685375"
Received: from iweiny-desk2.sc.intel.com ([10.3.52.157])
 by fmsmga005.fm.intel.com with ESMTP; 31 Oct 2019 16:38:25 -0700
Date: Thu, 31 Oct 2019 16:38:25 -0700
From: Ira Weiny <ira.weiny@intel.com>
To: John Hubbard <jhubbard@nvidia.com>
Subject: Re: [PATCH 13/19] media/v4l2-core: pin_longterm_pages (FOLL_PIN) and
 put_user_page() conversion
Message-ID: <20191031233824.GL14771@iweiny-DESK2.sc.intel.com>
References: <20191030224930.3990755-1-jhubbard@nvidia.com>
 <20191030224930.3990755-14-jhubbard@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191030224930.3990755-14-jhubbard@nvidia.com>
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

On Wed, Oct 30, 2019 at 03:49:24PM -0700, John Hubbard wrote:
> 1. Change v4l2 from get_user_pages(FOLL_LONGTERM), to
> pin_longterm_pages(), which sets both FOLL_LONGTERM and FOLL_PIN.
> 
> 2. Because all FOLL_PIN-acquired pages must be released via
> put_user_page(), also convert the put_page() call over to
> put_user_pages_dirty_lock().
> 

Reviewed-by: Ira Weiny <ira.weiny@intel.com>

> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> Signed-off-by: John Hubbard <jhubbard@nvidia.com>
> ---
>  drivers/media/v4l2-core/videobuf-dma-sg.c | 13 +++++--------
>  1 file changed, 5 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/media/v4l2-core/videobuf-dma-sg.c b/drivers/media/v4l2-core/videobuf-dma-sg.c
> index 28262190c3ab..9b9c5b37bf59 100644
> --- a/drivers/media/v4l2-core/videobuf-dma-sg.c
> +++ b/drivers/media/v4l2-core/videobuf-dma-sg.c
> @@ -183,12 +183,12 @@ static int videobuf_dma_init_user_locked(struct videobuf_dmabuf *dma,
>  	dprintk(1, "init user [0x%lx+0x%lx => %d pages]\n",
>  		data, size, dma->nr_pages);
>  
> -	err = get_user_pages(data & PAGE_MASK, dma->nr_pages,
> -			     flags | FOLL_LONGTERM, dma->pages, NULL);
> +	err = pin_longterm_pages(data & PAGE_MASK, dma->nr_pages,
> +				 flags, dma->pages, NULL);
>  
>  	if (err != dma->nr_pages) {
>  		dma->nr_pages = (err >= 0) ? err : 0;
> -		dprintk(1, "get_user_pages: err=%d [%d]\n", err,
> +		dprintk(1, "pin_longterm_pages: err=%d [%d]\n", err,
>  			dma->nr_pages);
>  		return err < 0 ? err : -EINVAL;
>  	}
> @@ -349,11 +349,8 @@ int videobuf_dma_free(struct videobuf_dmabuf *dma)
>  	BUG_ON(dma->sglen);
>  
>  	if (dma->pages) {
> -		for (i = 0; i < dma->nr_pages; i++) {
> -			if (dma->direction == DMA_FROM_DEVICE)
> -				set_page_dirty_lock(dma->pages[i]);
> -			put_page(dma->pages[i]);
> -		}
> +		put_user_pages_dirty_lock(dma->pages, dma->nr_pages,
> +					  dma->direction == DMA_FROM_DEVICE);
>  		kfree(dma->pages);
>  		dma->pages = NULL;
>  	}
> -- 
> 2.23.0
> 
