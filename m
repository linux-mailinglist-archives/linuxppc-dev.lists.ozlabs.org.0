Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 212FD21E996
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Jul 2020 09:09:49 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B5WqG3MV6zDqRp
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Jul 2020 17:09:46 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B5WnJ4TVQzDqRp
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Jul 2020 17:08:03 +1000 (AEST)
Received: by verein.lst.de (Postfix, from userid 2407)
 id DFC6868CFC; Tue, 14 Jul 2020 09:07:57 +0200 (CEST)
Date: Tue, 14 Jul 2020 09:07:57 +0200
From: Christoph Hellwig <hch@lst.de>
To: Alexey Kardashevskiy <aik@ozlabs.ru>
Subject: Re: [PATCH 4/5] dma-mapping: add a dma_ops_bypass flag to struct
 device
Message-ID: <20200714070757.GA776@lst.de>
References: <20200708152449.316476-1-hch@lst.de>
 <20200708152449.316476-5-hch@lst.de>
 <9bff7460-e6fa-f765-dcb4-cc96eb86d92c@ozlabs.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9bff7460-e6fa-f765-dcb4-cc96eb86d92c@ozlabs.ru>
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
Cc: =?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn.topel@gmail.com>,
 Daniel Borkmann <daniel@iogearbox.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Joerg Roedel <joro@8bytes.org>, Robin Murphy <robin.murphy@arm.com>,
 linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 Jesper Dangaard Brouer <brouer@redhat.com>, linuxppc-dev@lists.ozlabs.org,
 Christoph Hellwig <hch@lst.de>, Lu Baolu <baolu.lu@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Jul 13, 2020 at 02:59:39PM +1000, Alexey Kardashevskiy wrote:
> 
> 
> On 09/07/2020 01:24, Christoph Hellwig wrote:
> > Several IOMMU drivers have a bypass mode where they can use a direct
> > mapping if the devices DMA mask is large enough.  Add generic support
> > to the core dma-mapping code to do that to switch those drivers to
> > a common solution.
> > 
> > Signed-off-by: Christoph Hellwig <hch@lst.de>
> > ---
> >  include/linux/device.h |  8 +++++
> >  kernel/dma/Kconfig     |  8 +++++
> >  kernel/dma/mapping.c   | 74 +++++++++++++++++++++++++++++-------------
> >  3 files changed, 68 insertions(+), 22 deletions(-)
> > 
> > diff --git a/include/linux/device.h b/include/linux/device.h
> > index 4c4af98321ebd6..1f71acf37f78d7 100644
> > --- a/include/linux/device.h
> > +++ b/include/linux/device.h
> > @@ -523,6 +523,11 @@ struct dev_links_info {
> >   *		  sync_state() callback.
> >   * @dma_coherent: this particular device is dma coherent, even if the
> >   *		architecture supports non-coherent devices.
> > + * @dma_ops_bypass: If set to %true then the dma_ops are bypassed for the
> > + *		streaming DMA operations (->map_* / ->unmap_* / ->sync_*),
> > + *		and optionall (if the coherent mask is large enough) also
> 
> 
> s/optionall/optional/g
> 
> Otherwise the series looks good and works well on powernv and pseries.
> Thanks,

Can you give a formal ACK?
