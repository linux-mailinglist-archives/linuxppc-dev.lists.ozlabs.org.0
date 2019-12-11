Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 25B8C11A93B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Dec 2019 11:46:28 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47Xtrx3lXNzDqkG
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Dec 2019 21:46:25 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 47Xtmf1kghzDqn2
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Dec 2019 21:42:42 +1100 (AEDT)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id D483FB178;
 Wed, 11 Dec 2019 10:42:38 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
 id F3EB81E0B23; Wed, 11 Dec 2019 11:42:36 +0100 (CET)
Date: Wed, 11 Dec 2019 11:42:36 +0100
From: Jan Kara <jack@suse.cz>
To: John Hubbard <jhubbard@nvidia.com>
Subject: Re: [PATCH v9 20/25] powerpc: book3s64: convert to pin_user_pages()
 and put_user_page()
Message-ID: <20191211104236.GM1551@quack2.suse.cz>
References: <20191211025318.457113-1-jhubbard@nvidia.com>
 <20191211025318.457113-21-jhubbard@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191211025318.457113-21-jhubbard@nvidia.com>
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

On Tue 10-12-19 18:53:13, John Hubbard wrote:
> 1. Convert from get_user_pages() to pin_user_pages().
> 
> 2. As required by pin_user_pages(), release these pages via
> put_user_page().
> 
> Cc: Jan Kara <jack@suse.cz>
> Signed-off-by: John Hubbard <jhubbard@nvidia.com>

The patch looks good to me. You can add:

Reviewed-by: Jan Kara <jack@suse.cz>

I'd just note that mm_iommu_do_alloc() has a pre-existing bug that the last
jump to 'free_exit' (at line 157) happens already after converting page
pointers to physical addresses so put_page() calls there will just crash.
But that's completely unrelated to your change. I'll send a fix separately.

								Honza

> ---
>  arch/powerpc/mm/book3s64/iommu_api.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/powerpc/mm/book3s64/iommu_api.c b/arch/powerpc/mm/book3s64/iommu_api.c
> index 56cc84520577..a86547822034 100644
> --- a/arch/powerpc/mm/book3s64/iommu_api.c
> +++ b/arch/powerpc/mm/book3s64/iommu_api.c
> @@ -103,7 +103,7 @@ static long mm_iommu_do_alloc(struct mm_struct *mm, unsigned long ua,
>  	for (entry = 0; entry < entries; entry += chunk) {
>  		unsigned long n = min(entries - entry, chunk);
>  
> -		ret = get_user_pages(ua + (entry << PAGE_SHIFT), n,
> +		ret = pin_user_pages(ua + (entry << PAGE_SHIFT), n,
>  				FOLL_WRITE | FOLL_LONGTERM,
>  				mem->hpages + entry, NULL);
>  		if (ret == n) {
> @@ -167,9 +167,8 @@ static long mm_iommu_do_alloc(struct mm_struct *mm, unsigned long ua,
>  	return 0;
>  
>  free_exit:
> -	/* free the reference taken */
> -	for (i = 0; i < pinned; i++)
> -		put_page(mem->hpages[i]);
> +	/* free the references taken */
> +	put_user_pages(mem->hpages, pinned);
>  
>  	vfree(mem->hpas);
>  	kfree(mem);
> @@ -215,7 +214,8 @@ static void mm_iommu_unpin(struct mm_iommu_table_group_mem_t *mem)
>  		if (mem->hpas[i] & MM_IOMMU_TABLE_GROUP_PAGE_DIRTY)
>  			SetPageDirty(page);
>  
> -		put_page(page);
> +		put_user_page(page);
> +
>  		mem->hpas[i] = 0;
>  	}
>  }
> -- 
> 2.24.0
> 
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR
