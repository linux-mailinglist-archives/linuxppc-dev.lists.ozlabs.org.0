Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A37EEBA8B
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Nov 2019 00:37:39 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4741vh5H1tzF4Yh
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Nov 2019 10:37:36 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.88; helo=mga01.intel.com;
 envelope-from=ira.weiny@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4741sD4Y1TzF6HT
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  1 Nov 2019 10:35:23 +1100 (AEDT)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 31 Oct 2019 16:35:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,253,1569308400"; d="scan'208";a="206259359"
Received: from iweiny-desk2.sc.intel.com ([10.3.52.157])
 by FMSMGA003.fm.intel.com with ESMTP; 31 Oct 2019 16:35:19 -0700
Date: Thu, 31 Oct 2019 16:35:19 -0700
From: Ira Weiny <ira.weiny@intel.com>
To: John Hubbard <jhubbard@nvidia.com>
Subject: Re: [PATCH 08/19] mm/process_vm_access: set FOLL_PIN via
 pin_user_pages_remote()
Message-ID: <20191031233519.GH14771@iweiny-DESK2.sc.intel.com>
References: <20191030224930.3990755-1-jhubbard@nvidia.com>
 <20191030224930.3990755-9-jhubbard@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191030224930.3990755-9-jhubbard@nvidia.com>
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

On Wed, Oct 30, 2019 at 03:49:19PM -0700, John Hubbard wrote:
> Convert process_vm_access to use the new pin_user_pages_remote()
> call, which sets FOLL_PIN. Setting FOLL_PIN is now required for
> code that requires tracking of pinned pages.
> 
> Also, release the pages via put_user_page*().
> 
> Also, rename "pages" to "pinned_pages", as this makes for
> easier reading of process_vm_rw_single_vec().

Ok...  but it made review a bit harder...

Reviewed-by: Ira Weiny <ira.weiny@intel.com>

> 
> Signed-off-by: John Hubbard <jhubbard@nvidia.com>
> ---
>  mm/process_vm_access.c | 28 +++++++++++++++-------------
>  1 file changed, 15 insertions(+), 13 deletions(-)
> 
> diff --git a/mm/process_vm_access.c b/mm/process_vm_access.c
> index 357aa7bef6c0..fd20ab675b85 100644
> --- a/mm/process_vm_access.c
> +++ b/mm/process_vm_access.c
> @@ -42,12 +42,11 @@ static int process_vm_rw_pages(struct page **pages,
>  		if (copy > len)
>  			copy = len;
>  
> -		if (vm_write) {
> +		if (vm_write)
>  			copied = copy_page_from_iter(page, offset, copy, iter);
> -			set_page_dirty_lock(page);
> -		} else {
> +		else
>  			copied = copy_page_to_iter(page, offset, copy, iter);
> -		}
> +
>  		len -= copied;
>  		if (copied < copy && iov_iter_count(iter))
>  			return -EFAULT;
> @@ -96,7 +95,7 @@ static int process_vm_rw_single_vec(unsigned long addr,
>  		flags |= FOLL_WRITE;
>  
>  	while (!rc && nr_pages && iov_iter_count(iter)) {
> -		int pages = min(nr_pages, max_pages_per_loop);
> +		int pinned_pages = min(nr_pages, max_pages_per_loop);
>  		int locked = 1;
>  		size_t bytes;
>  
> @@ -106,14 +105,15 @@ static int process_vm_rw_single_vec(unsigned long addr,
>  		 * current/current->mm
>  		 */
>  		down_read(&mm->mmap_sem);
> -		pages = get_user_pages_remote(task, mm, pa, pages, flags,
> -					      process_pages, NULL, &locked);
> +		pinned_pages = pin_user_pages_remote(task, mm, pa, pinned_pages,
> +						     flags, process_pages,
> +						     NULL, &locked);
>  		if (locked)
>  			up_read(&mm->mmap_sem);
> -		if (pages <= 0)
> +		if (pinned_pages <= 0)
>  			return -EFAULT;
>  
> -		bytes = pages * PAGE_SIZE - start_offset;
> +		bytes = pinned_pages * PAGE_SIZE - start_offset;
>  		if (bytes > len)
>  			bytes = len;
>  
> @@ -122,10 +122,12 @@ static int process_vm_rw_single_vec(unsigned long addr,
>  					 vm_write);
>  		len -= bytes;
>  		start_offset = 0;
> -		nr_pages -= pages;
> -		pa += pages * PAGE_SIZE;
> -		while (pages)
> -			put_page(process_pages[--pages]);
> +		nr_pages -= pinned_pages;
> +		pa += pinned_pages * PAGE_SIZE;
> +
> +		/* If vm_write is set, the pages need to be made dirty: */
> +		put_user_pages_dirty_lock(process_pages, pinned_pages,
> +					  vm_write);
>  	}
>  
>  	return rc;
> -- 
> 2.23.0
> 
