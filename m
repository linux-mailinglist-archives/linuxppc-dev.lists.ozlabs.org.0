Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 372942F4ACA
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Jan 2021 12:59:31 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DG5b158tdzDrWN
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Jan 2021 22:59:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=lst.de
 (client-ip=213.95.11.211; helo=verein.lst.de; envelope-from=hch@lst.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lst.de
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DG5Pv1nsVzDrSq
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Jan 2021 22:51:31 +1100 (AEDT)
Received: by verein.lst.de (Postfix, from userid 2407)
 id EFCD968AFE; Wed, 13 Jan 2021 12:51:26 +0100 (CET)
Date: Wed, 13 Jan 2021 12:51:26 +0100
From: Christoph Hellwig <hch@lst.de>
To: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [RFC PATCH v3 2/6] swiotlb: Add restricted DMA pool
Message-ID: <20210113115126.GB29376@lst.de>
References: <20210106034124.30560-1-tientzu@chromium.org>
 <20210106034124.30560-3-tientzu@chromium.org> <X/VrqxcaAMi65CF0@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <X/VrqxcaAMi65CF0@kroah.com>
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
Cc: heikki.krogerus@linux.intel.com, peterz@infradead.org, grant.likely@arm.com,
 paulus@samba.org, frowand.list@gmail.com, mingo@kernel.org,
 m.szyprowski@samsung.com, sstabellini@kernel.org, saravanak@google.com,
 xypron.glpk@gmx.de, joro@8bytes.org, rafael.j.wysocki@intel.com, hch@lst.de,
 bgolaszewski@baylibre.com, xen-devel@lists.xenproject.org, treding@nvidia.com,
 devicetree@vger.kernel.org, will@kernel.org, konrad.wilk@oracle.com,
 dan.j.williams@intel.com, robh+dt@kernel.org,
 Claire Chang <tientzu@chromium.org>, boris.ostrovsky@oracle.com,
 andriy.shevchenko@linux.intel.com, jgross@suse.com, drinkcat@chromium.org,
 linuxppc-dev@lists.ozlabs.org, rdunlap@infradead.org,
 linux-kernel@vger.kernel.org, tfiga@chromium.org,
 iommu@lists.linux-foundation.org, robin.murphy@arm.com, bauerman@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jan 06, 2021 at 08:50:03AM +0100, Greg KH wrote:
> > --- a/include/linux/device.h
> > +++ b/include/linux/device.h
> > @@ -413,6 +413,7 @@ struct dev_links_info {
> >   * @dma_pools:	Dma pools (if dma'ble device).
> >   * @dma_mem:	Internal for coherent mem override.
> >   * @cma_area:	Contiguous memory area for dma allocations
> > + * @dma_io_tlb_mem: Internal for swiotlb io_tlb_mem override.
> 
> Why does this have to be added here?  Shouldn't the platform-specific
> code handle it instead?

The whole code added here is pretty generic.  What we need to eventually
do, though is to add a separate dma_device instead of adding more and more
bloat to struct device.
