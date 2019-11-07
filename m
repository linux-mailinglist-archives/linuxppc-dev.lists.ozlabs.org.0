Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A800EF2569
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Nov 2019 03:29:32 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 477nRF6XxwzF5bc
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Nov 2019 13:29:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=134.134.136.31; helo=mga06.intel.com;
 envelope-from=ira.weiny@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 477nNC6KmPzF5sD
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Nov 2019 13:26:51 +1100 (AEDT)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 06 Nov 2019 18:26:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,276,1569308400"; d="scan'208";a="227685256"
Received: from iweiny-desk2.sc.intel.com ([10.3.52.157])
 by fmsmga004.fm.intel.com with ESMTP; 06 Nov 2019 18:26:48 -0800
Date: Wed, 6 Nov 2019 18:26:48 -0800
From: Ira Weiny <ira.weiny@intel.com>
To: Jason Gunthorpe <jgg@ziepe.ca>
Subject: Re: [PATCH v2 07/18] infiniband: set FOLL_PIN, FOLL_LONGTERM via
 pin_longterm_pages*()
Message-ID: <20191107022647.GC32084@iweiny-DESK2.sc.intel.com>
References: <20191103211813.213227-1-jhubbard@nvidia.com>
 <20191103211813.213227-8-jhubbard@nvidia.com>
 <20191104203346.GF30938@ziepe.ca>
 <578c1760-7221-4961-9f7d-c07c22e5c259@nvidia.com>
 <20191104205738.GH30938@ziepe.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191104205738.GH30938@ziepe.ca>
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
 Christoph Hellwig <hch@infradead.org>, Vlastimil Babka <vbabka@suse.cz>,
 =?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn.topel@intel.com>,
 linux-media@vger.kernel.org, John Hubbard <jhubbard@nvidia.com>,
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

On Mon, Nov 04, 2019 at 04:57:38PM -0400, Jason Gunthorpe wrote:
> On Mon, Nov 04, 2019 at 12:48:13PM -0800, John Hubbard wrote:
> > On 11/4/19 12:33 PM, Jason Gunthorpe wrote:
> > ...
> > >> diff --git a/drivers/infiniband/core/umem.c b/drivers/infiniband/core/umem.c
> > >> index 24244a2f68cc..c5a78d3e674b 100644
> > >> +++ b/drivers/infiniband/core/umem.c
> > >> @@ -272,11 +272,10 @@ struct ib_umem *ib_umem_get(struct ib_udata *udata, unsigned long addr,
> > >>  
> > >>  	while (npages) {
> > >>  		down_read(&mm->mmap_sem);
> > >> -		ret = get_user_pages(cur_base,
> > >> +		ret = pin_longterm_pages(cur_base,
> > >>  				     min_t(unsigned long, npages,
> > >>  					   PAGE_SIZE / sizeof (struct page *)),
> > >> -				     gup_flags | FOLL_LONGTERM,
> > >> -				     page_list, NULL);
> > >> +				     gup_flags, page_list, NULL);
> > > 
> > > FWIW, this one should be converted to fast as well, I think we finally
> > > got rid of all the blockers for that?
> > > 
> > 
> > I'm not aware of any blockers on the gup.c end, anyway. The only broken thing we
> > have there is "gup remote + FOLL_LONGTERM". But we can do "gup fast + LONGTERM". 
> 
> I mean the use of the mmap_sem here is finally in a way where we can
> just delete the mmap_sem and use _fast

Yay!  I agree if we can do this we should.

Thanks,
Ira

>  
> ie, AFAIK there is no need for the mmap_sem to be held during
> ib_umem_add_sg_table()
> 
> This should probably be a standalone patch however
> 
> Jason
