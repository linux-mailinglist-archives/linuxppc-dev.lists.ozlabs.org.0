Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D546923CDE
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Jul 2024 13:52:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WD1VT70Xwz3g4R
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Jul 2024 21:52:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=lst.de (client-ip=213.95.11.211; helo=verein.lst.de; envelope-from=hch@lst.de; receiver=lists.ozlabs.org)
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WD1V53CKyz3fy7
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Jul 2024 21:51:57 +1000 (AEST)
Received: by verein.lst.de (Postfix, from userid 2407)
	id D343968AA6; Tue,  2 Jul 2024 13:51:51 +0200 (CEST)
Date: Tue, 2 Jul 2024 13:51:51 +0200
From: Christoph Hellwig <hch@lst.de>
To: Alistair Popple <apopple@nvidia.com>
Subject: Re: [PATCH 07/13] huge_memory: Allow mappings of PUD sized pages
Message-ID: <20240702115151.GA16313@lst.de>
References: <cover.66009f59a7fe77320d413011386c3ae5c2ee82eb.1719386613.git-series.apopple@nvidia.com> <bd332b0d3971b03152b3541f97470817c5147b51.1719386613.git-series.apopple@nvidia.com> <cf572c69-a754-4d41-b9c4-7a079b25b3c3@redhat.com> <874j98gjfg.fsf@nvdebian.thelocal>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <874j98gjfg.fsf@nvdebian.thelocal>
User-Agent: Mutt/1.5.17 (2007-11-01)
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
Cc: linmiaohe@huawei.com, nvdimm@lists.linux.dev, jack@suse.cz, David Hildenbrand <david@redhat.com>, djwong@kernel.org, dave.hansen@linux.intel.com, david@fromorbit.com, peterx@redhat.com, linux-mm@kvack.org, will@kernel.org, hch@lst.de, dave.jiang@intel.com, vishal.l.verma@intel.com, linux-doc@vger.kernel.org, willy@infradead.org, jgg@ziepe.ca, catalin.marinas@arm.com, linux-ext4@vger.kernel.org, ira.weiny@intel.com, jhubbard@nvidia.com, npiggin@gmail.com, linux-cxl@vger.kernel.org, bhelgaas@google.com, dan.j.williams@intel.com, linux-arm-kernel@lists.infradead.org, tytso@mit.edu, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-xfs@vger.kernel.org, linux-fsdevel@vger.kernel.org, logang@deltatee.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jul 02, 2024 at 08:19:01PM +1000, Alistair Popple wrote:
> > (B) As long as we have subpage mapcounts, this prevents vmemmap
> >     optimizations [1]. Is that only used for device-dax for now and are
> >     there no plans to make use of that for fs-dax?
> 
> I don't have any plans to. This is purely focussed on refcounting pages
> "like normal" so we can get rid of all the DAX special casing.
> 
> > (C) We managed without so far :)
> 
> Indeed, although Christoph has asked repeatedly ([1], [2] and likely
> others) that this gets fixed and I finally got sick of it coming up
> everytime I need to touch something with ZONE_DEVICE pages :)
> 
> Also it removes the need for people to understand the special DAX page
> recounting scheme and ends up removing a bunch of cruft as a bonus:
> 
>  59 files changed, 485 insertions(+), 869 deletions(-)
> 
> And that's before I clean up all the pgmap reference handling. It also
> removes the pXX_trans_huge and pXX_leaf distinction. So we managed, but
> things could be better IMHO.

Yes.  I can't wait for this series making the finish line.  There might
be more chance for cleanups and optimizations around ZONE_DEVICE, but
this alone is a huge step forward.

