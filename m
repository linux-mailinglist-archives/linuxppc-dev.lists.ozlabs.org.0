Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 679A54CB444
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Mar 2022 02:25:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K8Cwx3lw2z3bxM
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Mar 2022 12:25:53 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=fyTcnY07;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1;
 helo=ams.source.kernel.org; envelope-from=sstabellini@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=fyTcnY07; 
 dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K8CwF4g8qz30Mt
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Mar 2022 12:25:17 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 7F309B82358;
 Thu,  3 Mar 2022 01:25:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2074AC340F2;
 Thu,  3 Mar 2022 01:25:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646270712;
 bh=OIWkR7Zp9BS5KcWgPGvH+7lGxsauASKPDzT5dWHRzcg=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=fyTcnY079RGVSWj1/bqnWf9UBPrXZmiZ32cJHGCuHKFrvhhlGSoeO8XnjyAULGbxy
 xuEeYIRqhVQfty7l070VwdiiUBm+vhQMOyp1/UPCRCwJW1H8chwVFdTWSqF8JxQ7i6
 pmngu4i/qw99iSRs7nF8V/KUQPfZMnX0OhdBfoyB3K0uXmVGkSCue1VhFC37hRyoHl
 lqT9JrJPLf0sbQoGpagSmC+bBJdDfAOOQZXY1qQ2kFojarLkPJJigndyp3UGVx/CEp
 1XnqlJ8dDyOAxVpGwUR+l8DwgqcaHVrJmCy/f+O96VijhpAG5o/2FbsTqBKQIZTLrT
 qEo+TADXZ7B8A==
Date: Wed, 2 Mar 2022 17:25:10 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 11/12] swiotlb: merge swiotlb-xen initialization into
 swiotlb
In-Reply-To: <20220302081500.GB23075@lst.de>
Message-ID: <alpine.DEB.2.22.394.2203021709470.3261@ubuntu-linux-20-04-desktop>
References: <20220301105311.885699-1-hch@lst.de>
 <20220301105311.885699-12-hch@lst.de>
 <alpine.DEB.2.22.394.2203011720150.3261@ubuntu-linux-20-04-desktop>
 <20220302081500.GB23075@lst.de>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
Cc: linux-hyperv@vger.kernel.org, x86@kernel.org, linux-ia64@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, Stefano Stabellini <sstabellini@kernel.org>,
 Joerg Roedel <joro@8bytes.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 tboot-devel@lists.sourceforge.net, xen-devel@lists.xenproject.org,
 David Woodhouse <dwmw2@infradead.org>, Tom Lendacky <thomas.lendacky@amd.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 linux-arm-kernel@lists.infradead.org, Juergen Gross <jgross@suse.com>,
 linuxppc-dev@lists.ozlabs.org, linux-mips@vger.kernel.org,
 iommu@lists.linux-foundation.org, Robin Murphy <robin.murphy@arm.com>,
 Lu Baolu <baolu.lu@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 2 Mar 2022, Christoph Hellwig wrote:
> On Tue, Mar 01, 2022 at 06:55:47PM -0800, Stefano Stabellini wrote:
> > Unrelated to this specific patch series: now that I think about it, if
> > io_tlb_default_mem.nslabs is already allocated by the time xen_mm_init
> > is called, wouldn't we potentially have an issue with the GFP flags used
> > for the earlier allocation (e.g. GFP_DMA32 not used)? Maybe something
> > for another day.
> 
> swiotlb_init allocates low memory from meblock, which is roughly
> equivalent to GFP_DMA allocations, so we'll be fine.
> 
> > > @@ -143,10 +141,15 @@ static int __init xen_mm_init(void)
> > >  	if (!xen_swiotlb_detect())
> > >  		return 0;
> > >  
> > > -	rc = xen_swiotlb_init();
> > >  	/* we can work with the default swiotlb */
> > > -	if (rc < 0 && rc != -EEXIST)
> > > -		return rc;
> > > +	if (!io_tlb_default_mem.nslabs) {
> > > +		if (!xen_initial_domain())
> > > +			return -EINVAL;
> > 
> > I don't think we need this xen_initial_domain() check. It is all
> > already sorted out by the xen_swiotlb_detect() check above.
> 
> Is it?
> 
> static inline int xen_swiotlb_detect(void)
> {
> 	if (!xen_domain())
> 		return 0;
> 	if (xen_feature(XENFEAT_direct_mapped))
> 		return 1;
> 	/* legacy case */
> 	if (!xen_feature(XENFEAT_not_direct_mapped) && xen_initial_domain())
> 		return 1;
> 	return 0;
> }

It used to be that we had a

  if (!xen_initial_domain())
      return -EINVAL;

check in the initialization of swiotlb-xen on ARM. Then we replaced it
with the more sophisticated xen_swiotlb_detect().

The reason is that swiotlb-xen on ARM relies on Dom0 being 1:1 mapped
(guest physical addresses == physical addresses). Recent changes in Xen
allowed also DomUs to be 1:1 mapped. Changes still under discussion will
allow Dom0 not to be 1:1 mapped.

So, before all the Xen-side changes, knowing what was going to happen, I
introduced a clearer interface: XENFEAT_direct_mapped and
XENFEAT_not_direct_mapped tell us whether the guest (Linux) is 1:1
mapped or not. If it is 1:1 mapped then Linux can take advantage of
swiotlb-xen. Now xen_swiotlb_detect() returns true if Linux is 1:1
mapped.

Then of course there is the legacy case. That's taken care of by:

 	if (!xen_feature(XENFEAT_not_direct_mapped) && xen_initial_domain())
 		return 1;

The intention is to say that if
XENFEAT_direct_mapped/XENFEAT_not_direct_mapped are not present, then
use xen_initial_domain() like we did before.

So if xen_swiotlb_detect() returns true we know that Linux is either
dom0 (xen_initial_domain() == true) or we have very good reasons to
think we should initialize swiotlb-xen anyway
(xen_feature(XENFEAT_direct_mapped) == true).


> I think I'd keep it as-is for now, as my planned next step would be to
> fold xen-swiotlb into swiotlb entirely.

Thinking more about it we actually need to drop the xen_initial_domain()
check otherwise some cases won't be functional (Dom0 not 1:1 mapped, or
DomU 1:1 mapped).
