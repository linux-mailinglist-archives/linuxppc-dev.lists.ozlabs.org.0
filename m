Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7338C29D150
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Oct 2020 18:24:27 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CLwRW2B92zDqTP
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Oct 2020 04:24:23 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CLwNs27ZBzDqTP
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Oct 2020 04:22:05 +1100 (AEDT)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 8D0A568BEB; Wed, 28 Oct 2020 18:22:01 +0100 (CET)
Date: Wed, 28 Oct 2020 18:22:01 +0100
From: Christoph Hellwig <hch@lst.de>
To: Alexey Kardashevskiy <aik@ozlabs.ru>
Subject: Re: [PATCH kernel v3 1/2] dma: Allow mixing bypass and mapped DMA
 operation
Message-ID: <20201028172201.GB10015@lst.de>
References: <20201028070030.60643-1-aik@ozlabs.ru>
 <20201028070030.60643-2-aik@ozlabs.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201028070030.60643-2-aik@ozlabs.ru>
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
Cc: iommu@lists.linux-foundation.org, linuxppc-dev@lists.ozlabs.org,
 Christoph Hellwig <hch@lst.de>, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Oct 28, 2020 at 06:00:29PM +1100, Alexey Kardashevskiy wrote:
> At the moment we allow bypassing DMA ops only when we can do this for
> the entire RAM. However there are configs with mixed type memory
> where we could still allow bypassing IOMMU in most cases;
> POWERPC with persistent memory is one example.
> 
> This adds an arch hook to determine where bypass can still work and
> we invoke direct DMA API. The following patch checks the bus limit
> on POWERPC to allow or disallow direct mapping.
> 
> This adds a CONFIG_ARCH_HAS_DMA_SET_MASK config option to make arch_xxxx
> hooks no-op by default.
> 
> Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
> ---
>  kernel/dma/mapping.c | 24 ++++++++++++++++++++----
>  kernel/dma/Kconfig   |  4 ++++
>  2 files changed, 24 insertions(+), 4 deletions(-)
> 
> diff --git a/kernel/dma/mapping.c b/kernel/dma/mapping.c
> index 51bb8fa8eb89..a0bc9eb876ed 100644
> --- a/kernel/dma/mapping.c
> +++ b/kernel/dma/mapping.c
> @@ -137,6 +137,18 @@ static inline bool dma_map_direct(struct device *dev,
>  	return dma_go_direct(dev, *dev->dma_mask, ops);
>  }
>  
> +#ifdef CONFIG_ARCH_HAS_DMA_MAP_DIRECT
> +bool arch_dma_map_page_direct(struct device *dev, phys_addr_t addr);
> +bool arch_dma_unmap_page_direct(struct device *dev, dma_addr_t dma_handle);
> +bool arch_dma_map_sg_direct(struct device *dev, struct scatterlist *sg, int nents);
> +bool arch_dma_unmap_sg_direct(struct device *dev, struct scatterlist *sg, int nents);
> +#else
> +#define arch_dma_map_page_direct(d, a) (0)
> +#define arch_dma_unmap_page_direct(d, a) (0)
> +#define arch_dma_map_sg_direct(d, s, n) (0)
> +#define arch_dma_unmap_sg_direct(d, s, n) (0)
> +#endif

A bunch of overly long lines here.  Except for that this looks ok to me.
If you want me to queue up the series I can just fix it up.
