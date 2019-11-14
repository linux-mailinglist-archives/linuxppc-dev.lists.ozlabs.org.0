Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A137FC0F7
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Nov 2019 08:43:18 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47DD4367wpzF4FX
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Nov 2019 18:43:15 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 47DD1f2jKXzDq6K
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Nov 2019 18:41:10 +1100 (AEDT)
Received: by verein.lst.de (Postfix, from userid 2407)
 id EF39468AFE; Thu, 14 Nov 2019 08:41:05 +0100 (CET)
Date: Thu, 14 Nov 2019 08:41:05 +0100
From: Christoph Hellwig <hch@lst.de>
To: Robin Murphy <robin.murphy@arm.com>
Subject: Re: generic DMA bypass flag
Message-ID: <20191114074105.GC26546@lst.de>
References: <20191113133731.20870-1-hch@lst.de>
 <d27b7b29-df78-4904-8002-b697da5cb013@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d27b7b29-df78-4904-8002-b697da5cb013@arm.com>
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, linuxppc-dev@lists.ozlabs.org,
 Christoph Hellwig <hch@lst.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Nov 13, 2019 at 02:45:15PM +0000, Robin Murphy wrote:
> In all honesty, this seems silly. If we can set a per-device flag to say 
> "oh, bypass these ops and use some other ops instead", then we can just as 
> easily simply give the device the appropriate ops in the first place. 
> Because, y'know, the name of the game is "per-device ops".

Except that we can't do it _that_ easily.  The problem is that for both
the powerpc and intel case the selection is dynamic.  If a device is in
the identify domain with intel-iommu (or the equivalent on powerpc which
doesn't use the normal iommu framework), we still want to use the iommu
to be able to map memory for devices with a too small dma mask using
the iommu instead of using swiotlb bouncing.  So to "just" use the
per-device dma ops we'd need:

  a) a hook in dma_direct_supported to pick another set of ops for
     small dma masks
  b) a hook in the IOMMU ops to propagate to the direct ops for full
     64-bit masks

I looked into that for powerpc a while ago and it wasn't pretty at all.
Compared to that just checking another flag for the DMA direct calls
is relatively clean and trivial as seens in the diffstat for this series
alone.

> I don't see a great benefit to pulling legacy cruft out into common code 
> instead of just working to get rid of it in-place, when said cruft pulls in 
> the opposite direction to where we're taking the common code (i.e. it's 
> inherently based on the premise of global ops).

I'm not sure what legacy cruft it pull in.  I think it actually fits very
much into a mental model of "direct mapping is the default, to be overriden
if needed" which is pretty close to what we have at the moment.  Just
with a slightly more complicated processing of the override.
