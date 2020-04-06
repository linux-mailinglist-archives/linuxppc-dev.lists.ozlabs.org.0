Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 363B819FB35
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Apr 2020 19:19:27 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48wy2N3lLMzDrJF
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Apr 2020 03:19:24 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 48wxzv1g57zDqyv
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Apr 2020 03:17:12 +1000 (AEST)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 0319068BEB; Mon,  6 Apr 2020 19:17:06 +0200 (CEST)
Date: Mon, 6 Apr 2020 19:17:06 +0200
From: Christoph Hellwig <hch@lst.de>
To: Alexey Kardashevskiy <aik@ozlabs.ru>
Subject: Re: [PATCH 1/2] dma-mapping: add a dma_ops_bypass flag to struct
 device
Message-ID: <20200406171706.GA3231@lst.de>
References: <87sghz2ibh.fsf@linux.ibm.com> <20200323172256.GB31269@lst.de>
 <ffce1af6-a215-dee8-7b5c-2111f43accfd@ozlabs.ru>
 <20200324075402.GJ23447@lst.de>
 <41975da3-3a4a-fc3c-2b90-8d607cf220e6@ozlabs.ru>
 <20200325083740.GC21605@lst.de>
 <a705afc5-779d-baf4-e5d2-e2da04c82743@ozlabs.ru>
 <213b0c7d-f908-b4f4-466d-6240c3622cd6@ozlabs.ru>
 <20200406115016.GA10941@lst.de>
 <348046e7-7a38-62d6-4df0-e4a537b98926@ozlabs.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <348046e7-7a38-62d6-4df0-e4a537b98926@ozlabs.ru>
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
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 Christoph Hellwig <hch@lst.de>, Lu Baolu <baolu.lu@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Apr 06, 2020 at 11:25:09PM +1000, Alexey Kardashevskiy wrote:
> >> Do you see any serious problem with this approach? Thanks!
> > 
> > Do you have a link to the whole branch?  The github UI is unfortunately
> > unusable for that (or I'm missing something).
> 
> The UI shows the branch but since I rebased and forcepushed it, it does
> not. Here is the current one with:
> 
> https://github.com/aik/linux/commits/dma-bypass.3

Ok, so we use the core bypass without persistent memory, and then
have another bypass mode on top.  Not great, but I can't think
of anything better.  Note that your checks for the map_sg case
aren't very efficient - for one it would make sense to calculate
the limit only once, but also it would make sense to reuse the
calculted diecect mapping addresses instead of doing another pass
later on in the dma-direct code.
