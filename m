Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F24463A09BA
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Jun 2021 03:58:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G09J82rf1z3bv3
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Jun 2021 11:58:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=134.134.136.100; helo=mga07.intel.com;
 envelope-from=ira.weiny@intel.com; receiver=<UNKNOWN>)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G09Hn4cCDz2yWR
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Jun 2021 11:58:24 +1000 (AEST)
IronPort-SDR: pw4KEUR0Giz71MLcK/DelIJIvfKxNV2KrAUzP4v6T5H6nZzvnJ4LOmIvRoVP7d9t5rttU8CPrY
 iQyPRRxhypwQ==
X-IronPort-AV: E=McAfee;i="6200,9189,10009"; a="268841585"
X-IronPort-AV: E=Sophos;i="5.83,259,1616482800"; d="scan'208";a="268841585"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2021 18:58:20 -0700
IronPort-SDR: KYJW5Refe0V9ltnuDGlVJ6TLopiUWwZYULWIqWG34N4OkvARGXzz0Av7vRHCtdujeOQY9X1fyQ
 6/vheDgG7Nyg==
X-IronPort-AV: E=Sophos;i="5.83,259,1616482800"; d="scan'208";a="482201138"
Received: from iweiny-desk2.sc.intel.com (HELO localhost) ([10.3.52.147])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2021 18:58:19 -0700
Date: Tue, 8 Jun 2021 18:58:19 -0700
From: Ira Weiny <ira.weiny@intel.com>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 14/16] block: use memcpy_from_bvec in __blk_queue_bounce
Message-ID: <20210609015819.GU3697498@iweiny-DESK2.sc.intel.com>
References: <20210608160603.1535935-1-hch@lst.de>
 <20210608160603.1535935-15-hch@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210608160603.1535935-15-hch@lst.de>
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
Cc: Jens Axboe <axboe@kernel.dk>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Mike Snitzer <snitzer@redhat.com>, Geoff Levand <geoff@infradead.org>,
 linux-mips@vger.kernel.org, Dongsheng Yang <dongsheng.yang@easystack.cn>,
 linux-kernel@vger.kernel.org, linux-block@vger.kernel.org, dm-devel@redhat.com,
 Ilya Dryomov <idryomov@gmail.com>, linuxppc-dev@lists.ozlabs.org,
 ceph-devel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jun 08, 2021 at 06:06:01PM +0200, Christoph Hellwig wrote:
> Rewrite the actual bounce buffering loop in __blk_queue_bounce to that
> the memcpy_to_bvec helper can be used to perform the data copies.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  block/bounce.c | 21 +++++++--------------
>  1 file changed, 7 insertions(+), 14 deletions(-)
> 
> diff --git a/block/bounce.c b/block/bounce.c
> index a2fc6326b6c9..b5ad09e07bcf 100644
> --- a/block/bounce.c
> +++ b/block/bounce.c
> @@ -243,24 +243,17 @@ void __blk_queue_bounce(struct request_queue *q, struct bio **bio_orig)
>  	 * because the 'bio' is single-page bvec.
>  	 */
>  	for (i = 0, to = bio->bi_io_vec; i < bio->bi_vcnt; to++, i++) {
> -		struct page *page = to->bv_page;
> +		struct page *bounce_page;
>  
> -		if (!PageHighMem(page))
> +		if (!PageHighMem(to->bv_page))
>  			continue;
>  
> -		to->bv_page = mempool_alloc(&page_pool, GFP_NOIO);
> -		inc_zone_page_state(to->bv_page, NR_BOUNCE);
> +		bounce_page = mempool_alloc(&page_pool, GFP_NOIO);
> +		inc_zone_page_state(bounce_page, NR_BOUNCE);
>  
> -		if (rw == WRITE) {
> -			char *vto, *vfrom;
> -
> -			flush_dcache_page(page);
> -
> -			vto = page_address(to->bv_page) + to->bv_offset;
> -			vfrom = kmap_atomic(page) + to->bv_offset;
> -			memcpy(vto, vfrom, to->bv_len);
> -			kunmap_atomic(vfrom);
> -		}
> +		if (rw == WRITE)
> +			memcpy_from_bvec(page_address(bounce_page), to);

NIT: the fact that the copy is from 'to' makes my head hurt...  But I don't
see a good way to change that without declaring unnecessary variables...  :-(

The logic seems right.

Ira

> +		to->bv_page = bounce_page;
>  	}
>  
>  	trace_block_bio_bounce(*bio_orig);
> -- 
> 2.30.2
> 
