Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 58DE64CD92E
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Mar 2022 17:35:07 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K9D3X3Dk8z3bd2
	for <lists+linuxppc-dev@lfdr.de>; Sat,  5 Mar 2022 03:35:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=lst.de
 (client-ip=213.95.11.211; helo=verein.lst.de; envelope-from=hch@lst.de;
 receiver=<UNKNOWN>)
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K9D3436SXz2x9d
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  5 Mar 2022 03:34:38 +1100 (AEDT)
Received: by verein.lst.de (Postfix, from userid 2407)
 id E2BFF68AFE; Fri,  4 Mar 2022 17:34:30 +0100 (CET)
Date: Fri, 4 Mar 2022 17:34:30 +0100
From: Christoph Hellwig <hch@lst.de>
To: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH 11/12] swiotlb: merge swiotlb-xen initialization into
 swiotlb
Message-ID: <20220304163430.GA12317@lst.de>
References: <20220301105311.885699-1-hch@lst.de>
 <20220301105311.885699-12-hch@lst.de>
 <alpine.DEB.2.22.394.2203011720150.3261@ubuntu-linux-20-04-desktop>
 <20220302081500.GB23075@lst.de>
 <alpine.DEB.2.22.394.2203021709470.3261@ubuntu-linux-20-04-desktop>
 <20220303105931.GA15137@lst.de>
 <alpine.DEB.2.22.394.2203031447120.3261@ubuntu-linux-20-04-desktop>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.22.394.2203031447120.3261@ubuntu-linux-20-04-desktop>
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

On Thu, Mar 03, 2022 at 02:49:29PM -0800, Stefano Stabellini wrote:
> On Thu, 3 Mar 2022, Christoph Hellwig wrote:
> > On Wed, Mar 02, 2022 at 05:25:10PM -0800, Stefano Stabellini wrote:
> > > Thinking more about it we actually need to drop the xen_initial_domain()
> > > check otherwise some cases won't be functional (Dom0 not 1:1 mapped, or
> > > DomU 1:1 mapped).
> > 
> > Hmm, but that would be the case even before this series, right?
> 
> Before this series we only have the xen_swiotlb_detect() check in
> xen_mm_init, we don't have a second xen_initial_domain() check.
> 
> The issue is that this series is adding one more xen_initial_domain()
> check in xen_mm_init.

In current mainline xen_mm_init calls xen_swiotlb_init unconditionally.
But xen_swiotlb_init then calls xen_swiotlb_fixup after allocating
the memory, which in turn calls xen_create_contiguous_region.
xen_create_contiguous_region fails with -EINVAL for the
!xen_initial_domain() and thus caues xen_swiotlb_fixup and
xen_swiotlb_init to unwind and return -EINVAL.

So as far as I can tell there is no change in behavior, but maybe I'm
missing something subtle?
