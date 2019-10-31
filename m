Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3868EEB8C5
	for <lists+linuxppc-dev@lfdr.de>; Thu, 31 Oct 2019 22:11:54 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 473ygW3K39zF4W6
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Nov 2019 08:11:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.120; helo=mga04.intel.com;
 envelope-from=ira.weiny@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 473ydV4KsNzF6Ck
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  1 Nov 2019 08:10:01 +1100 (AEDT)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 31 Oct 2019 14:09:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,253,1569308400"; d="scan'208";a="375376881"
Received: from iweiny-desk2.sc.intel.com ([10.3.52.157])
 by orsmga005.jf.intel.com with ESMTP; 31 Oct 2019 14:09:55 -0700
Date: Thu, 31 Oct 2019 14:09:55 -0700
From: Ira Weiny <ira.weiny@intel.com>
To: John Hubbard <jhubbard@nvidia.com>
Subject: Re: [PATCH 02/19] mm/gup: factor out duplicate code from four routines
Message-ID: <20191031210954.GE14771@iweiny-DESK2.sc.intel.com>
References: <20191030224930.3990755-1-jhubbard@nvidia.com>
 <20191030224930.3990755-3-jhubbard@nvidia.com>
 <20191031183549.GC14771@iweiny-DESK2.sc.intel.com>
 <75b557f7-24b2-740c-2640-2f914d131600@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <75b557f7-24b2-740c-2640-2f914d131600@nvidia.com>
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
 Christoph Hellwig <hch@lst.de>, Jonathan Corbet <corbet@lwn.net>,
 linux-rdma@vger.kernel.org, Christoph Hellwig <hch@infradead.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, Vlastimil Babka <vbabka@suse.cz>,
 =?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn.topel@intel.com>,
 linux-media@vger.kernel.org, linux-block@vger.kernel.org,
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

On Thu, Oct 31, 2019 at 11:43:37AM -0700, John Hubbard wrote:
> On 10/31/19 11:35 AM, Ira Weiny wrote:
> > On Wed, Oct 30, 2019 at 03:49:13PM -0700, John Hubbard wrote:
> ...
> >> +
> >> +static void __remove_refs_from_head(struct page *page, int refs)
> >> +{
> >> +	/* Do a get_page() first, in case refs == page->_refcount */
> >> +	get_page(page);
> >> +	page_ref_sub(page, refs);
> >> +	put_page(page);
> >> +}
> > 
> > I wonder if this is better implemented as "put_compound_head()"?  To match the
> > try_get_compound_head() call below?
> 
> Hi Ira,
> 
> Good idea, I'll rename it to that.
> 
> > 
> >> +
> >> +static int __huge_pt_done(struct page *head, int nr_recorded_pages, int *nr)
> >> +{
> >> +	*nr += nr_recorded_pages;
> >> +	SetPageReferenced(head);
> >> +	return 1;
> > 
> > When will this return anything but 1?
> > 
> 
> Never, but it saves a line at all four call sites, by having it return like that.
> 
> I could see how maybe people would prefer to just have it be a void function,
> and return 1 directly at the call sites. Since this was a lower line count I
> thought maybe it would be slightly better, but it's hard to say really.

It is a NIT perhaps but I feel like the signature of a function should stand on
it's own.  What this does is mix the meaning of this function with those
calling it.  Which IMO is not good style.

We can see what others say.

Ira

> 
> thanks,
> 
> John Hubbard
> NVIDIA
> 
