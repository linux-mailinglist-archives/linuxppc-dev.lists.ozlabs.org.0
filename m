Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E0D62759C1
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Sep 2020 16:18:38 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BxKzH2yhwzDqPw
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Sep 2020 00:18:35 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BxKnw5YG7zDqSt
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Sep 2020 00:10:26 +1000 (AEST)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 851E86736F; Wed, 23 Sep 2020 16:10:20 +0200 (CEST)
Date: Wed, 23 Sep 2020 16:10:20 +0200
From: Christoph Hellwig <hch@lst.de>
To: Alexey Kardashevskiy <aik@ozlabs.ru>
Subject: Re: [PATCH kernel] powerpc/dma: Fix dma_map_ops::get_required_mask
Message-ID: <20200923141020.GA12374@lst.de>
References: <20200908015106.79661-1-aik@ozlabs.ru>
 <20200908054416.GA13585@lst.de>
 <94353228-2262-cfa1-7177-7eed2288ca63@ozlabs.ru>
 <20200908121937.GA31559@lst.de>
 <1746dd66810.27bb.1ca38dd7e845b990cd13d431eb58563d@ozlabs.ru>
 <20200909075849.GA12282@lst.de>
 <0a7a992f-ad2e-e76a-7bee-1ed4ed607748@ozlabs.ru>
 <20200915065022.GA19658@lst.de>
 <93424419-3476-fc07-8a83-8d9d39062810@ozlabs.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <93424419-3476-fc07-8a83-8d9d39062810@ozlabs.ru>
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
Cc: Oliver OHalloran <oliveroh@au1.ibm.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 Christoph Hellwig <hch@lst.de>,
 =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Sep 22, 2020 at 12:26:18PM +1000, Alexey Kardashevskiy wrote:
> > Well, the original intent of dma_get_required_mask is to return the
> > mask that the driver then uses to figure out what to set, so what aacraid
> > does fits that use case. 
> 
> What was the original intent exactly? The driver asks for the minimum or
> maximum DMA mask the platform supports?
> 
> As for now, we (ppc64/powernv) can do:
> 1. bypass (==64bit)
> 2. a DMA window which used to be limited by 2GB but not anymore.
> 
> I can understand if the driver asked for required mask in expectation to
> receive "less or equal than 32bit" and "more than 32 bit" and choose.
> And this probably was the intent as at the time when the bug was
> introduced, the window was always smaller than 4GB.
> 
> But today the window is bigger than than (44 bits now, or a similar
> value, depends on max page order) so the returned mask is >32. Which
> still enables that DAC in aacraid but I suspect this is accidental.

I think for powernv returning 64-bit always would make a lot of sense.
AFAIK all of powernv is PCIe and not legacy PCI, so returning anything
less isn't going to help to optimize anything.

> > Of course that idea is pretty bogus for
> > PCIe devices.
> 
> Why? From the PHB side, there are windows. From the device side, there
> are many crippled devices, like, no GPU I saw in last years supported
> more than 48bit.

Yes, but dma_get_required_mask is misnamed - the mask is not required,
it is the optimal mask.  Even if the window is smaller we handle it
some way, usually by using swiotlb, or by iommu tricks in your case.

> > I suspect the right fix is to just not query dma_get_required_mask for
> > PCIe devices in aacraid (and other drivers that do something similar).
> 
> May be, if you write nice and big comment next to
> dma_get_required_mask() explaining exactly what it does, then I will
> realize I am getting this all wrong and we will move to fixing the
> drivers :)

Yes, it needs a comment or two, and probaby be renamed to
dma_get_optimal_dma_mask, and a cleanup of most users.  I've added it
to my ever growing TODO list, but I would not be unhappy if someone
else gives it a spin.
