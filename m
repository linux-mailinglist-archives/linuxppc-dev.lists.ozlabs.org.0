Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F60C1006DE
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Nov 2019 14:54:23 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47Gr6N5054zDqS3
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Nov 2019 00:54:20 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 47Gnc35RCgzDq7j
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 Nov 2019 23:01:23 +1100 (AEDT)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 956F2B021;
 Mon, 18 Nov 2019 12:01:20 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
 id 2A7271E4AF8; Mon, 18 Nov 2019 10:46:04 +0100 (CET)
Date: Mon, 18 Nov 2019 10:46:04 +0100
From: Jan Kara <jack@suse.cz>
To: John Hubbard <jhubbard@nvidia.com>
Subject: Re: [PATCH v5 02/24] mm/gup: factor out duplicate code from four
 routines
Message-ID: <20191118094604.GC17319@quack2.suse.cz>
References: <20191115055340.1825745-1-jhubbard@nvidia.com>
 <20191115055340.1825745-3-jhubbard@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20191115055340.1825745-3-jhubbard@nvidia.com>
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

On Thu 14-11-19 21:53:18, John Hubbard wrote:
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
> ---
>  mm/gup.c | 95 ++++++++++++++++++++++++--------------------------------
>  1 file changed, 40 insertions(+), 55 deletions(-)
> 
> diff --git a/mm/gup.c b/mm/gup.c
> index 85caf76b3012..858541ea30ce 100644
> --- a/mm/gup.c
> +++ b/mm/gup.c
> @@ -1969,6 +1969,29 @@ static int __gup_device_huge_pud(pud_t pud, pud_t *pudp, unsigned long addr,
>  }
>  #endif
>  
> +static int __record_subpages(struct page *page, unsigned long addr,
> +			     unsigned long end, struct page **pages)
> +{
> +	int nr = 0;
> +	int nr_recorded_pages = 0;
> +
> +	do {
> +		pages[nr] = page;
> +		nr++;
> +		page++;
> +		nr_recorded_pages++;
> +	} while (addr += PAGE_SIZE, addr != end);
> +	return nr_recorded_pages;

nr == nr_recorded_pages so no need for both... BTW, structuring this as a
for loop would be probably more logical and shorter now:

	for (nr = 0; addr != end; addr += PAGE_SIZE)
		pages[nr++] = page++;
	return nr;

The rest of the patch looks good to me.

								Honza

-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR
