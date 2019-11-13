Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FA47FB84C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Nov 2019 20:03:47 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47CvCh40JxzF3YY
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Nov 2019 06:03:44 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 47Cv960SmBzF6xS
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Nov 2019 06:01:24 +1100 (AEDT)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 13 Nov 2019 11:01:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,301,1569308400"; d="scan'208";a="355563182"
Received: from iweiny-desk2.sc.intel.com ([10.3.52.157])
 by orsmga004.jf.intel.com with ESMTP; 13 Nov 2019 11:01:18 -0800
Date: Wed, 13 Nov 2019 11:01:17 -0800
From: Ira Weiny <ira.weiny@intel.com>
To: John Hubbard <jhubbard@nvidia.com>
Subject: Re: [PATCH v4 20/23] mm/gup_benchmark: use proper FOLL_WRITE flags
 instead of hard-coding "1"
Message-ID: <20191113190116.GA12947@iweiny-DESK2.sc.intel.com>
References: <20191113042710.3997854-1-jhubbard@nvidia.com>
 <20191113042710.3997854-21-jhubbard@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191113042710.3997854-21-jhubbard@nvidia.com>
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

On Tue, Nov 12, 2019 at 08:27:07PM -0800, John Hubbard wrote:
> Fix the gup benchmark flags to use the symbolic FOLL_WRITE,
> instead of a hard-coded "1" value.
> 
> Also, clean up the filtering of gup flags a little, by just doing
> it once before issuing any of the get_user_pages*() calls. This
> makes it harder to overlook, instead of having little "gup_flags & 1"
> phrases in the function calls.
> 
> Signed-off-by: John Hubbard <jhubbard@nvidia.com>

Reviewed-by: Ira Weiny <ira.weiny@intel.com>

> ---
>  mm/gup_benchmark.c                         | 9 ++++++---
>  tools/testing/selftests/vm/gup_benchmark.c | 6 +++++-
>  2 files changed, 11 insertions(+), 4 deletions(-)
> 
> diff --git a/mm/gup_benchmark.c b/mm/gup_benchmark.c
> index 7dd602d7f8db..7fc44d25eca7 100644
> --- a/mm/gup_benchmark.c
> +++ b/mm/gup_benchmark.c
> @@ -48,18 +48,21 @@ static int __gup_benchmark_ioctl(unsigned int cmd,
>  			nr = (next - addr) / PAGE_SIZE;
>  		}
>  
> +		/* Filter out most gup flags: only allow a tiny subset here: */
> +		gup->flags &= FOLL_WRITE;
> +
>  		switch (cmd) {
>  		case GUP_FAST_BENCHMARK:
> -			nr = get_user_pages_fast(addr, nr, gup->flags & 1,
> +			nr = get_user_pages_fast(addr, nr, gup->flags,
>  						 pages + i);
>  			break;
>  		case GUP_LONGTERM_BENCHMARK:
>  			nr = get_user_pages(addr, nr,
> -					    (gup->flags & 1) | FOLL_LONGTERM,
> +					    gup->flags | FOLL_LONGTERM,
>  					    pages + i, NULL);
>  			break;
>  		case GUP_BENCHMARK:
> -			nr = get_user_pages(addr, nr, gup->flags & 1, pages + i,
> +			nr = get_user_pages(addr, nr, gup->flags, pages + i,
>  					    NULL);
>  			break;
>  		default:
> diff --git a/tools/testing/selftests/vm/gup_benchmark.c b/tools/testing/selftests/vm/gup_benchmark.c
> index 485cf06ef013..389327e9b30a 100644
> --- a/tools/testing/selftests/vm/gup_benchmark.c
> +++ b/tools/testing/selftests/vm/gup_benchmark.c
> @@ -18,6 +18,9 @@
>  #define GUP_LONGTERM_BENCHMARK	_IOWR('g', 2, struct gup_benchmark)
>  #define GUP_BENCHMARK		_IOWR('g', 3, struct gup_benchmark)
>  
> +/* Just the flags we need, copied from mm.h: */
> +#define FOLL_WRITE	0x01	/* check pte is writable */
> +
>  struct gup_benchmark {
>  	__u64 get_delta_usec;
>  	__u64 put_delta_usec;
> @@ -85,7 +88,8 @@ int main(int argc, char **argv)
>  	}
>  
>  	gup.nr_pages_per_call = nr_pages;
> -	gup.flags = write;
> +	if (write)
> +		gup.flags |= FOLL_WRITE;
>  
>  	fd = open("/sys/kernel/debug/gup_benchmark", O_RDWR);
>  	if (fd == -1)
> -- 
> 2.24.0
> 
