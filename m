Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 008753338AC
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Mar 2021 10:26:00 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DwRX603KPz3d61
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Mar 2021 20:25:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=lst.de
 (client-ip=213.95.11.211; helo=verein.lst.de; envelope-from=hch@lst.de;
 receiver=<UNKNOWN>)
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DwRWn1zz2z30K4
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Mar 2021 20:25:41 +1100 (AEDT)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 2657568B05; Wed, 10 Mar 2021 10:25:34 +0100 (CET)
Date: Wed, 10 Mar 2021 10:25:33 +0100
From: Christoph Hellwig <hch@lst.de>
To: Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH 14/17] iommu: remove DOMAIN_ATTR_DMA_USE_FLUSH_QUEUE
Message-ID: <20210310092533.GA6819@lst.de>
References: <20210301084257.945454-1-hch@lst.de>
 <20210301084257.945454-15-hch@lst.de>
 <1658805c-ed28-b650-7385-a56fab3383e3@arm.com> <20210310091501.GC5928@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210310091501.GC5928@lst.de>
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
Cc: kvm@vger.kernel.org, Will Deacon <will@kernel.org>,
 Joerg Roedel <joro@8bytes.org>, linuxppc-dev@lists.ozlabs.org,
 dri-devel@lists.freedesktop.org, Li Yang <leoyang.li@nxp.com>,
 iommu@lists.linux-foundation.org, netdev@vger.kernel.org,
 David Woodhouse <dwmw2@infradead.org>, linux-arm-kernel@lists.infradead.org,
 virtualization@lists.linux-foundation.org, freedreno@lists.freedesktop.org,
 Christoph Hellwig <hch@lst.de>, linux-arm-msm@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Mar 10, 2021 at 10:15:01AM +0100, Christoph Hellwig wrote:
> On Thu, Mar 04, 2021 at 03:25:27PM +0000, Robin Murphy wrote:
> > On 2021-03-01 08:42, Christoph Hellwig wrote:
> >> Use explicit methods for setting and querying the information instead.
> >
> > Now that everyone's using iommu-dma, is there any point in bouncing this 
> > through the drivers at all? Seems like it would make more sense for the x86 
> > drivers to reflect their private options back to iommu_dma_strict (and 
> > allow Intel's caching mode to override it as well), then have 
> > iommu_dma_init_domain just test !iommu_dma_strict && 
> > domain->ops->flush_iotlb_all.
> 
> Hmm.  I looked at this, and kill off ->dma_enable_flush_queue for
> the ARM drivers and just looking at iommu_dma_strict seems like a
> very clear win.
> 
> OTOH x86 is a little more complicated.  AMD and intel defaul to lazy
> mode, so we'd have to change the global iommu_dma_strict if they are
> initialized.  Also Intel has not only a "static" option to disable
> lazy mode, but also a "dynamic" one where it iterates structure.  So
> I think on the get side we're stuck with the method, but it still
> simplifies the whole thing.

Actually... Just mirroring the iommu_dma_strict value into
struct iommu_domain should solve all of that with very little
boilerplate code. 
