Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E96833F7AA
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Mar 2021 18:58:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F0yYl1Mrtz30Hh
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Mar 2021 04:58:03 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=lst.de
 (client-ip=213.95.11.211; helo=verein.lst.de; envelope-from=hch@lst.de;
 receiver=<UNKNOWN>)
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F0yYQ5M16z2xYd
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Mar 2021 04:57:46 +1100 (AEDT)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 6243568BFE; Wed, 17 Mar 2021 18:57:42 +0100 (CET)
Date: Wed, 17 Mar 2021 18:57:42 +0100
From: Christoph Hellwig <hch@lst.de>
To: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Subject: Re: [PATCH 12/14] swiotlb: move global variables into a new
 io_tlb_mem structure
Message-ID: <20210317175742.GA29280@lst.de>
References: <20210301074436.919889-1-hch@lst.de>
 <20210301074436.919889-13-hch@lst.de>
 <20210317134204.GA315788@konrad-char-us-oracle-com.allregionaliads.osdevelopmeniad.oraclevcn.com>
 <20210317135327.GA10797@lst.de> <YFJBvFjtZUiBQj4k@Konrads-MacBook-Pro.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YFJBvFjtZUiBQj4k@Konrads-MacBook-Pro.local>
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
Cc: Dongli Zhang <dongli.zhang@oracle.com>, iommu@lists.linux-foundation.org,
 xen-devel@lists.xenproject.org, Claire Chang <tientzu@chromium.org>,
 linuxppc-dev@lists.ozlabs.org, Christoph Hellwig <hch@lst.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Mar 17, 2021 at 01:51:56PM -0400, Konrad Rzeszutek Wilk wrote:
> On Wed, Mar 17, 2021 at 02:53:27PM +0100, Christoph Hellwig wrote:
> > On Wed, Mar 17, 2021 at 01:42:07PM +0000, Konrad Rzeszutek Wilk wrote:
> > > > -	alloc_size = PAGE_ALIGN(io_tlb_nslabs * sizeof(size_t));
> > > > -	io_tlb_alloc_size = memblock_alloc(alloc_size, PAGE_SIZE);
> > > > -	if (!io_tlb_alloc_size)
> > > > -		panic("%s: Failed to allocate %zu bytes align=0x%lx\n",
> > > > -		      __func__, alloc_size, PAGE_SIZE);
> > > 
> > > Shouldn't this be converted to:
> > > 	mem->alloc_size = memblock_alloc(alloc_size, PAGE_SIZE);
> > > 	if (...)
> > > 
> > > Seems that it got lost in the search and replace?
> > 
> > Yes, I messed that up during the rebase.  That being said it magically
> > gets fixed in the next patch..
> 
> Yes. However if someone does a bisection they are going to be mighty unhappy
> with you.

Sure, I was planning on fixing it anyway.  Just waiting for feedback
on the rest of the patches before doing a respin.
