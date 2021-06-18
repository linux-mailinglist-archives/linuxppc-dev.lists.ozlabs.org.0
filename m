Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 610B03AC12C
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Jun 2021 05:02:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G5kHT06GDz3c2S
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Jun 2021 13:02:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.115; helo=mga14.intel.com;
 envelope-from=ira.weiny@intel.com; receiver=<UNKNOWN>)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G5kH66Nxyz2yyt
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Jun 2021 13:02:08 +1000 (AEST)
IronPort-SDR: yJJL1GT7Fn2fiqU0GSvaDAm2RqGV9sWlZ7Vvt7KDjV14wETa2/bpaLF24jRnRUIvsRUTqGr7WT
 H242ltooh6Cw==
X-IronPort-AV: E=McAfee;i="6200,9189,10018"; a="206305258"
X-IronPort-AV: E=Sophos;i="5.83,281,1616482800"; d="scan'208";a="206305258"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2021 20:01:58 -0700
IronPort-SDR: kDCIXbw7lwEjZFI+nFNOMy4qgHpPd6rsmqYlpb0ps01Z+DdBhWSAQ5G+mGTpSRcepgH2/cP20z
 fFfj3eWUWROQ==
X-IronPort-AV: E=Sophos;i="5.83,281,1616482800"; d="scan'208";a="451243562"
Received: from iweiny-desk2.sc.intel.com (HELO localhost) ([10.3.52.147])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2021 20:01:58 -0700
Date: Thu, 17 Jun 2021 20:01:57 -0700
From: Ira Weiny <ira.weiny@intel.com>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 01/18] mm: add a kunmap_local_dirty helper
Message-ID: <20210618030157.GA1905674@iweiny-DESK2.sc.intel.com>
References: <20210615132456.753241-1-hch@lst.de>
 <20210615132456.753241-2-hch@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210615132456.753241-2-hch@lst.de>
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
Cc: Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Herbert Xu <herbert@gondor.apana.org.au>, Mike Snitzer <snitzer@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, Geoff Levand <geoff@infradead.org>,
 ceph-devel@vger.kernel.org, linux-mips@vger.kernel.org,
 Dongsheng Yang <dongsheng.yang@easystack.cn>, linux-kernel@vger.kernel.org,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 dm-devel@redhat.com, linux-arch@vger.kernel.org,
 Thomas Gleixner <tglx@linutronix.de>, linuxppc-dev@lists.ozlabs.org,
 Ilya Dryomov <idryomov@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jun 15, 2021 at 03:24:39PM +0200, Christoph Hellwig wrote:
> Add a helper that calls flush_kernel_dcache_page before unmapping the
> local mapping.  flush_kernel_dcache_page is required for all pages
> potentially mapped into userspace that were written to using kmap*,
> so having a helper that does the right thing can be very convenient.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  include/linux/highmem-internal.h | 7 +++++++
>  include/linux/highmem.h          | 4 ++++
>  2 files changed, 11 insertions(+)
> 
> diff --git a/include/linux/highmem-internal.h b/include/linux/highmem-internal.h
> index 7902c7d8b55f..bd37706db147 100644
> --- a/include/linux/highmem-internal.h
> +++ b/include/linux/highmem-internal.h
> @@ -224,4 +224,11 @@ do {								\
>  	__kunmap_local(__addr);					\
>  } while (0)
>  
> +#define kunmap_local_dirty(__page, __addr)			\

I think having to store the page and addr to return to kunmap_local_dirty() is
going to be a pain in some code paths.  Not a show stopper but see below...

> +do {								\
> +	if (!PageSlab(__page))					\

Was there some clarification why the page can't be a Slab page?  Or is this
just an optimization?

> +		flush_kernel_dcache_page(__page);		\

Is this required on 32bit systems?  Why is kunmap_flush_on_unmap() not
sufficient on 64bit systems?  The normal kunmap_local() path does that.

I'm sorry but I did not see a conclusion to my query on V1. Herbert implied the
he just copied from the crypto code.[1]  I'm concerned that this _dirty() call
is just going to confuse the users of kmap even more.  So why can't we get to
the bottom of why flush_kernel_dcache_page() needs so much logic around it
before complicating the general kernel users.

I would like to see it go away if possible.

Ira

[1] https://lore.kernel.org/lkml/20210615050258.GA5208@gondor.apana.org.au/

> +	kunmap_local(__addr);					\
> +} while (0)
> +
>  #endif
> diff --git a/include/linux/highmem.h b/include/linux/highmem.h
> index 832b49b50c7b..65f548db4f2d 100644
> --- a/include/linux/highmem.h
> +++ b/include/linux/highmem.h
> @@ -93,6 +93,10 @@ static inline void kmap_flush_unused(void);
>   * On HIGHMEM enabled systems mapping a highmem page has the side effect of
>   * disabling migration in order to keep the virtual address stable across
>   * preemption. No caller of kmap_local_page() can rely on this side effect.
> + *
> + * If data is written to the returned kernel mapping, the callers needs to
> + * unmap the mapping using kunmap_local_dirty(), else kunmap_local() should
> + * be used.
>   */
>  static inline void *kmap_local_page(struct page *page);
>  
> -- 
> 2.30.2
> 
