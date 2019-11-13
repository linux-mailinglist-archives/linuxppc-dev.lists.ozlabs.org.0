Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DE2BFB8AA
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Nov 2019 20:19:32 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47CvYs2sWfzF4n9
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Nov 2019 06:19:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.151; helo=mga17.intel.com;
 envelope-from=ira.weiny@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47CvWH6DVHzF73m
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Nov 2019 06:17:11 +1100 (AEDT)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 13 Nov 2019 11:17:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,301,1569308400"; d="scan'208";a="379324206"
Received: from iweiny-desk2.sc.intel.com ([10.3.52.157])
 by orsmga005.jf.intel.com with ESMTP; 13 Nov 2019 11:17:06 -0800
Date: Wed, 13 Nov 2019 11:17:06 -0800
From: Ira Weiny <ira.weiny@intel.com>
To: Jason Gunthorpe <jgg@ziepe.ca>, John Hubbard <jhubbard@nvidia.com>
Subject: Re: [PATCH v4 08/23] vfio, mm: fix get_user_pages_remote() and
 FOLL_LONGTERM
Message-ID: <20191113191705.GE12947@iweiny-DESK2.sc.intel.com>
References: <20191113042710.3997854-1-jhubbard@nvidia.com>
 <20191113042710.3997854-9-jhubbard@nvidia.com>
 <20191113130202.GA26068@ziepe.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191113130202.GA26068@ziepe.ca>
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

On Wed, Nov 13, 2019 at 09:02:02AM -0400, Jason Gunthorpe wrote:
> On Tue, Nov 12, 2019 at 08:26:55PM -0800, John Hubbard wrote:
> > As it says in the updated comment in gup.c: current FOLL_LONGTERM
> > behavior is incompatible with FAULT_FLAG_ALLOW_RETRY because of the
> > FS DAX check requirement on vmas.
> > 
> > However, the corresponding restriction in get_user_pages_remote() was
> > slightly stricter than is actually required: it forbade all
> > FOLL_LONGTERM callers, but we can actually allow FOLL_LONGTERM callers
> > that do not set the "locked" arg.
> > 
> > Update the code and comments accordingly, and update the VFIO caller
> > to take advantage of this, fixing a bug as a result: the VFIO caller
> > is logically a FOLL_LONGTERM user.
> > 
> > Also, remove an unnessary pair of calls that were releasing and
> > reacquiring the mmap_sem. There is no need to avoid holding mmap_sem
> > just in order to call page_to_pfn().
> > 
> > Also, move the DAX check ("if a VMA is DAX, don't allow long term
> > pinning") from the VFIO call site, all the way into the internals
> > of get_user_pages_remote() and __gup_longterm_locked(). That is:
> > get_user_pages_remote() calls __gup_longterm_locked(), which in turn
> > calls check_dax_vmas(). It's lightly explained in the comments as well.
> > 
> > Thanks to Jason Gunthorpe for pointing out a clean way to fix this,
> > and to Dan Williams for helping clarify the DAX refactoring.
> > 
> > Suggested-by: Jason Gunthorpe <jgg@ziepe.ca>
> > Cc: Dan Williams <dan.j.williams@intel.com>
> > Cc: Jerome Glisse <jglisse@redhat.com>
> > Cc: Ira Weiny <ira.weiny@intel.com>
> > Signed-off-by: John Hubbard <jhubbard@nvidia.com>
> >  drivers/vfio/vfio_iommu_type1.c | 25 ++-----------------------
> >  mm/gup.c                        | 27 ++++++++++++++++++++++-----
> >  2 files changed, 24 insertions(+), 28 deletions(-)
> > 
> > diff --git a/drivers/vfio/vfio_iommu_type1.c b/drivers/vfio/vfio_iommu_type1.c
> > index d864277ea16f..7301b710c9a4 100644
> > +++ b/drivers/vfio/vfio_iommu_type1.c
> > @@ -340,7 +340,6 @@ static int vaddr_get_pfn(struct mm_struct *mm, unsigned long vaddr,
> >  {
> >  	struct page *page[1];
> >  	struct vm_area_struct *vma;
> > -	struct vm_area_struct *vmas[1];
> >  	unsigned int flags = 0;
> >  	int ret;
> >  
> > @@ -348,33 +347,13 @@ static int vaddr_get_pfn(struct mm_struct *mm, unsigned long vaddr,
> >  		flags |= FOLL_WRITE;
> >  
> >  	down_read(&mm->mmap_sem);
> > -	if (mm == current->mm) {
> > -		ret = get_user_pages(vaddr, 1, flags | FOLL_LONGTERM, page,
> > -				     vmas);
> > -	} else {
> > -		ret = get_user_pages_remote(NULL, mm, vaddr, 1, flags, page,
> > -					    vmas, NULL);
> > -		/*
> > -		 * The lifetime of a vaddr_get_pfn() page pin is
> > -		 * userspace-controlled. In the fs-dax case this could
> > -		 * lead to indefinite stalls in filesystem operations.
> > -		 * Disallow attempts to pin fs-dax pages via this
> > -		 * interface.
> > -		 */
> > -		if (ret > 0 && vma_is_fsdax(vmas[0])) {
> > -			ret = -EOPNOTSUPP;
> > -			put_page(page[0]);
> > -		}
> > -	}
> > -	up_read(&mm->mmap_sem);
> > -
> > +	ret = get_user_pages_remote(NULL, mm, vaddr, 1, flags | FOLL_LONGTERM,
> > +				    page, NULL, NULL);
> >  	if (ret == 1) {
> >  		*pfn = page_to_pfn(page[0]);
> >  		return 0;
> 
> Mind the return with the lock held this needs some goto unwind

Ah yea...  retract my reviewed by...  :-(

Ira

