Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7266182ABE
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Aug 2019 07:14:32 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 462jVY1HSmzDqfF
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Aug 2019 15:14:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=lst.de
 (client-ip=213.95.11.211; helo=verein.lst.de; envelope-from=hch@lst.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lst.de
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 462jSg0KgTzDqcQ
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  6 Aug 2019 15:12:49 +1000 (AEST)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 8410D68B05; Tue,  6 Aug 2019 07:12:42 +0200 (CEST)
Date: Tue, 6 Aug 2019 07:12:42 +0200
From: Christoph Hellwig <hch@lst.de>
To: Gavin Li <gavinli@thegavinli.com>
Subject: Re: [PATCH 1/2] dma-mapping: fix page attributes for dma_mmap_*
Message-ID: <20190806051242.GA13269@lst.de>
References: <20190805080145.5694-1-hch@lst.de>
 <20190805080145.5694-2-hch@lst.de>
 <CAP_+7SzPdNCMKuuXMjHjpCzxsey2YWR_e6mTAWtNSZ6kKBvKFw@mail.gmail.com>
 <CA+GxvY5C_rrukCzC5K-h72bePyW8PS_Rfj3uxh-K6UrcAextUQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+GxvY5C_rrukCzC5K-h72bePyW8PS_Rfj3uxh-K6UrcAextUQ@mail.gmail.com>
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
Cc: Gavin Li <git@thegavinli.com>, Shawn Anastasio <shawn@anastas.io>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 Russell King <linux@armlinux.org.uk>, linux-mips@vger.kernel.org,
 Paul Burton <paul.burton@mips.com>, Catalin Marinas <catalin.marinas@arm.com>,
 James Hogan <jhogan@kernel.org>, Will Deacon <will@kernel.org>,
 Christoph Hellwig <hch@lst.de>, linux-arm-kernel@lists.infradead.org,
 Robin Murphy <robin.murphy@arm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Aug 05, 2019 at 07:55:44PM -0700, Gavin Li wrote:
> >         /* create a coherent mapping */
> >         ret = dma_common_contiguous_remap(page, size, VM_USERMAP,
> > -                       arch_dma_mmap_pgprot(dev, PAGE_KERNEL, attrs),
> > +                       dma_pgprot(dev, PAGE_KERNEL, attrs),
> >                         __builtin_return_address(0));
> >         if (!ret) {
> >                 __dma_direct_free_pages(dev, size, page);
> 
> Is dma_common_contiguous_remap() still necessary in the
> DMA_ATTR_NON_CONSISTENT case? I would presume it would be fine to just
> return a linearly mapped address in that case.

It would not be required for a real DMA_ATTR_NON_CONSISTENT
implementation.  But only parisc and mips actually properly implement
DMA_ATTR_NON_CONSISTENT, everyone ignores it.  Given that the API is
a little ill defined and I have a better replacement in the pipeline
I don't want to start implementing it for other architectures now.
