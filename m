Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id BD85F2F522A
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Jan 2021 19:34:05 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DGGLM06T2zDrdh
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Jan 2021 05:34:03 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DGGJX0MCPzDqmJ
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Jan 2021 05:32:27 +1100 (AEDT)
Received: by verein.lst.de (Postfix, from userid 2407)
 id A66E868B02; Wed, 13 Jan 2021 19:32:19 +0100 (CET)
Date: Wed, 13 Jan 2021 19:32:18 +0100
From: Christoph Hellwig <hch@lst.de>
To: Robin Murphy <robin.murphy@arm.com>
Subject: Re: [RFC PATCH v3 4/6] swiotlb: Add restricted DMA alloc/free support.
Message-ID: <20210113183218.GB19254@lst.de>
References: <20210106034124.30560-1-tientzu@chromium.org>
 <20210106034124.30560-5-tientzu@chromium.org> <20210113124847.GC1383@lst.de>
 <82bb75bc-11e6-ac94-9d24-7c896e3aae98@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <82bb75bc-11e6-ac94-9d24-7c896e3aae98@arm.com>
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
 xypron.glpk@gmx.de, joro@8bytes.org, rafael.j.wysocki@intel.com,
 Christoph Hellwig <hch@lst.de>, bgolaszewski@baylibre.com,
 xen-devel@lists.xenproject.org, treding@nvidia.com, devicetree@vger.kernel.org,
 will@kernel.org, konrad.wilk@oracle.com, dan.j.williams@intel.com,
 robh+dt@kernel.org, Claire Chang <tientzu@chromium.org>,
 boris.ostrovsky@oracle.com, andriy.shevchenko@linux.intel.com, jgross@suse.com,
 drinkcat@chromium.org, gregkh@linuxfoundation.org, rdunlap@infradead.org,
 linux-kernel@vger.kernel.org, tfiga@chromium.org,
 iommu@lists.linux-foundation.org, linuxppc-dev@lists.ozlabs.org,
 bauerman@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jan 13, 2021 at 06:27:08PM +0000, Robin Murphy wrote:
>> Can we hook in somewhat lower level in the dma-direct code so that all
>> the remapping in dma-direct can be reused instead of duplicated?  That
>> also becomes important if we want to use non-remapping uncached support,
>> e.g. on mips or x86, or the direct changing of the attributes that Will
>> planned to look into for arm64.
>
> Indeed, AFAICS this ought to boil down to a direct equivalent of 
> __dma_direct_alloc_pages() - other than the address there should be no 
> conceptual difference between pages from the restricted pool and those from 
> the regular page allocator, so this probably deserves to be plumbed in as 
> an alternative to that.

Yes, that's what I mean.  You managed to word it much better, though.
