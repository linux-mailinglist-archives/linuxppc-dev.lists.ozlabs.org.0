Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AB2CF4C9EFC
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Mar 2022 09:15:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K7n445jKvz3c0D
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Mar 2022 19:15:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=lst.de
 (client-ip=213.95.11.211; helo=verein.lst.de; envelope-from=hch@lst.de;
 receiver=<UNKNOWN>)
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K7n3f4VPRz30gk
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Mar 2022 19:15:10 +1100 (AEDT)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 527A368BEB; Wed,  2 Mar 2022 09:15:01 +0100 (CET)
Date: Wed, 2 Mar 2022 09:15:00 +0100
From: Christoph Hellwig <hch@lst.de>
To: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH 11/12] swiotlb: merge swiotlb-xen initialization into
 swiotlb
Message-ID: <20220302081500.GB23075@lst.de>
References: <20220301105311.885699-1-hch@lst.de>
 <20220301105311.885699-12-hch@lst.de>
 <alpine.DEB.2.22.394.2203011720150.3261@ubuntu-linux-20-04-desktop>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.22.394.2203011720150.3261@ubuntu-linux-20-04-desktop>
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
Cc: linux-hyperv@vger.kernel.org, x86@kernel.org, linux-ia64@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-riscv@lists.infradead.org,
 Christoph Hellwig <hch@lst.de>, linux-s390@vger.kernel.org,
 Joerg Roedel <joro@8bytes.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 tboot-devel@lists.sourceforge.net, xen-devel@lists.xenproject.org,
 David Woodhouse <dwmw2@infradead.org>, Tom Lendacky <thomas.lendacky@amd.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 linux-arm-kernel@lists.infradead.org, Juergen Gross <jgross@suse.com>,
 Robin Murphy <robin.murphy@arm.com>, linux-mips@vger.kernel.org,
 iommu@lists.linux-foundation.org, linuxppc-dev@lists.ozlabs.org,
 Lu Baolu <baolu.lu@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Mar 01, 2022 at 06:55:47PM -0800, Stefano Stabellini wrote:
> Unrelated to this specific patch series: now that I think about it, if
> io_tlb_default_mem.nslabs is already allocated by the time xen_mm_init
> is called, wouldn't we potentially have an issue with the GFP flags used
> for the earlier allocation (e.g. GFP_DMA32 not used)? Maybe something
> for another day.

swiotlb_init allocates low memory from meblock, which is roughly
equivalent to GFP_DMA allocations, so we'll be fine.

> > @@ -143,10 +141,15 @@ static int __init xen_mm_init(void)
> >  	if (!xen_swiotlb_detect())
> >  		return 0;
> >  
> > -	rc = xen_swiotlb_init();
> >  	/* we can work with the default swiotlb */
> > -	if (rc < 0 && rc != -EEXIST)
> > -		return rc;
> > +	if (!io_tlb_default_mem.nslabs) {
> > +		if (!xen_initial_domain())
> > +			return -EINVAL;
> 
> I don't think we need this xen_initial_domain() check. It is all
> already sorted out by the xen_swiotlb_detect() check above.

Is it?

static inline int xen_swiotlb_detect(void)
{
	if (!xen_domain())
		return 0;
	if (xen_feature(XENFEAT_direct_mapped))
		return 1;
	/* legacy case */
	if (!xen_feature(XENFEAT_not_direct_mapped) && xen_initial_domain())
		return 1;
	return 0;
}

I think I'd keep it as-is for now, as my planned next step would be to
fold xen-swiotlb into swiotlb entirely.
