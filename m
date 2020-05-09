Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C9D0B1CBEDC
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 May 2020 10:21:30 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49K0XR73JCzDqbf
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 May 2020 18:21:27 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 49K0Vd4mQkzDqyw
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  9 May 2020 18:19:53 +1000 (AEST)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 36D5968C7B; Sat,  9 May 2020 10:19:47 +0200 (CEST)
Date: Sat, 9 May 2020 10:19:46 +0200
From: Christoph Hellwig <hch@lst.de>
To: Alexey Kardashevskiy <aik@ozlabs.ru>
Subject: Re: [PATCH 1/4] dma-mapping: move the remaining DMA API calls out
 of line
Message-ID: <20200509081946.GA21834@lst.de>
References: <20200414122506.438134-1-hch@lst.de>
 <20200414122506.438134-2-hch@lst.de>
 <c2572d30-f03c-450d-e257-3a8673b42d44@ozlabs.ru>
 <20200415061859.GA32392@lst.de>
 <5139e8e1-6389-3387-dc39-6983b08ff28d@ozlabs.ru>
 <20200417075852.GA20049@lst.de>
 <70296d53-3504-2645-4b16-0eb73b0cd0d9@ozlabs.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <70296d53-3504-2645-4b16-0eb73b0cd0d9@ozlabs.ru>
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Joerg Roedel <joro@8bytes.org>, Robin Murphy <robin.murphy@arm.com>,
 linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 linuxppc-dev@lists.ozlabs.org, Christoph Hellwig <hch@lst.de>,
 Lu Baolu <baolu.lu@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, May 05, 2020 at 02:18:37PM +1000, Alexey Kardashevskiy wrote:
> 
> 
> On 17/04/2020 17:58, Christoph Hellwig wrote:
> > On Wed, Apr 15, 2020 at 09:21:37PM +1000, Alexey Kardashevskiy wrote:
> >> And the fact they were exported leaves possibility that there is a
> >> driver somewhere relying on these symbols or distro kernel won't build
> >> because the symbol disappeared from exports (I do not know what KABI
> >> guarantees or if mainline kernel cares).
> > 
> > We absolutely do not care.  In fact for abuses of APIs that drivers
> > should not use we almost care to make them private and break people
> > abusing them.
> 
> ok :)
> 
> >> I do not care in particular but
> >> some might, a line separated with empty lines in the commit log would do.
> > 
> > I'll add a blurb for the next version.
> 
> 
> Has it gone anywhere? Thanks,

I've been hoping for the sg_buf helpers to land first, as they need
backporting and would conflict.  Do you urgently need the series?
