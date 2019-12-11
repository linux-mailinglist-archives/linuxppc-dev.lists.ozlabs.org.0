Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C52A611BC29
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Dec 2019 19:47:35 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47Y5X502c3zDqD3
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Dec 2019 05:47:33 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 47Y4xc1p6pzDqZx
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Dec 2019 05:21:07 +1100 (AEDT)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 4FD2668AFE; Wed, 11 Dec 2019 19:20:56 +0100 (CET)
Date: Wed, 11 Dec 2019 19:20:56 +0100
From: Christoph Hellwig <hch@lst.de>
To: Michael Roth <mdroth@linux.vnet.ibm.com>
Subject: Re: [PATCH v5 2/2] powerpc/pseries/iommu: Use dma_iommu_ops for
 Secure VM.
Message-ID: <20191211182056.GA17052@lst.de>
References: <1575681159-30356-1-git-send-email-linuxram@us.ibm.com>
 <1575681159-30356-2-git-send-email-linuxram@us.ibm.com>
 <1575681159-30356-3-git-send-email-linuxram@us.ibm.com>
 <157602860458.3810.8599908751067047456@sif>
 <be36117d-204e-bf59-287a-371103186e16@ozlabs.ru>
 <157608763756.3810.12346253559039287143@sif>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <157608763756.3810.12346253559039287143@sif>
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
Cc: andmike@us.ibm.com, mst@redhat.com, Alexey Kardashevskiy <aik@ozlabs.ru>,
 Ram Pai <linuxram@us.ibm.com>, linux-kernel@vger.kernel.org,
 leonardo@linux.ibm.com, ram.n.pai@gmail.com, cai@lca.pw, tglx@linutronix.de,
 sukadev@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org, hch@lst.de,
 bauerman@linux.ibm.com, david@gibson.dropbear.id.au
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Dec 11, 2019 at 12:07:17PM -0600, Michael Roth wrote:
> > io_tlb_start/io_tlb_end are only guaranteed to stay within 4GB and our
> > default DMA window is 1GB (KVM) or 2GB (PowerVM), ok, we can define
> > ARCH_LOW_ADDRESS_LIMIT as 1GB.
> 
> True, and limiting allocations to under 1GB might be brittle (also saw a
> patching floating around that increased IO_TLB_DEFAULT_SIZE size to 1GB,
> which obviously wouldn't work out with this approach, but not sure if
> that's still needed or not: "powerpc/svm: Increase SWIOTLB buffer size")

FYI, there is a patch out there that allocates the powerpc swiotlb
from the boottom of the memblock area instead of the top to fix a 85xx
regression.

Also the AMD folks have been asking about non-GFP_DMA32 swiotlb pools
as they have the same bounce buffer issue with SEV.  I think it is
entirely doable to have multiple swiotlb pool, I just need a volunteer
to implement that.

> 
> However that's only an issue if we insist on using an identity mapping
> in the IOMMU, which would be nice because non-IOMMU virtio would
> magically work, but since that's not a goal of this series I think we do
> have the option of mapping io_tlb_start at DMA address 0 (or
> thereabouts).
> 
> We'd probably need to modify __phys_to_dma to treat archdata.dma_offset
> as a negative offset in this case, but it seems like it would work about
> the same as with DDW offset.

Or switch to the generic version of __phys_to_dma that has a negative
offset.  We'd just need to look into a signed value for dma_pfn_offset
to allow for the existing platforms that need the current positive
offset.
