Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E024F3C5DD8
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Jul 2021 15:57:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GNlh30yHpz307n
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Jul 2021 23:57:23 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=apLKxQ3a;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=will@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=apLKxQ3a; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GNlgc0RvPz2yfq
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Jul 2021 23:56:59 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0A31561003;
 Mon, 12 Jul 2021 13:56:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1626098216;
 bh=KqwO5Vj/j6Fq4TmXSaTqESu5yHRQzrkv3vVFfvNbMGY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=apLKxQ3ase69s99n1r/hg6FOeb+BIYvcXeks3TH0kXFsiV4vt4JUCfZRcjNqqJoI+
 C/PtbYfC7V6I9+tFs23xYS40pB1IE1Ru0GO/sR7kIL+zLBxUujKnwvKpXUPJuSJZEH
 W/rAB9EgGt57/FadwbxksE14xUlBKeyWZI/Wnb4Nnt0t5RD8RNJlUOkSuzegkOaEqs
 Qc6OK9PK6WVdefs+A+PDuKLzETeUU+bVabgaTyboguU6s7wHGEC28+izJWHslIy77f
 yr0fKTdfH84fcYgWwvMeJ8lGvcnMqQz4hxapleBU2sKhQTn0GZErsyzP3AbO0nm6/5
 eLx4kI3jlwL/w==
Date: Mon, 12 Jul 2021 14:56:45 +0100
From: Will Deacon <will@kernel.org>
To: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Subject: Re: [PATCH v15 06/12] swiotlb: Use is_swiotlb_force_bounce for
 swiotlb data bouncing
Message-ID: <20210712135645.GA28881@willie-the-truck>
References: <0f7bd903-e309-94a0-21d7-f0e8e9546018@arm.com>
 <YN/7xcxt/XGAKceZ@Ryzen-9-3900X.localdomain>
 <20210705190352.GA19461@willie-the-truck>
 <20210706044848.GA13640@lst.de>
 <20210706132422.GA20327@willie-the-truck>
 <a59f771f-3289-62f0-ca50-8f3675d9b166@arm.com>
 <20210706140513.GA26498@lst.de>
 <YORsr0h7u5l9DZwh@char.us.oracle.com>
 <20210706165720.GC20750@willie-the-truck>
 <YOSMDZmtfXEKerpf@char.us.oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YOSMDZmtfXEKerpf@char.us.oracle.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: Jim Quinlan <james.quinlan@broadcom.com>, heikki.krogerus@linux.intel.com,
 linux-devicetree <devicetree@vger.kernel.org>, peterz@infradead.org,
 joonas.lahtinen@linux.intel.com, dri-devel@lists.freedesktop.org,
 chris@chris-wilson.co.uk, grant.likely@arm.com, paulus@samba.org,
 Frank Rowand <frowand.list@gmail.com>, mingo@kernel.org,
 Jianxiong Gao <jxgao@google.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Saravana Kannan <saravanak@google.com>,
 "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>, xypron.glpk@gmx.de,
 Christoph Hellwig <hch@lst.de>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>, bskeggs@redhat.com,
 linux-pci@vger.kernel.org, xen-devel@lists.xenproject.org,
 Thierry Reding <treding@nvidia.com>, matthew.auld@intel.com,
 Nicolas Boichat <drinkcat@chromium.org>, thomas.hellstrom@linux.intel.com,
 jgross@suse.com, intel-gfx@lists.freedesktop.org,
 maarten.lankhorst@linux.intel.com, jani.nikula@linux.intel.com,
 Nathan Chancellor <nathan@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 rodrigo.vivi@intel.com, Bjorn Helgaas <bhelgaas@google.com>,
 Claire Chang <tientzu@chromium.org>, Dan Williams <dan.j.williams@intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 boris.ostrovsky@oracle.com, airlied@linux.ie, linuxppc-dev@lists.ozlabs.org,
 Randy Dunlap <rdunlap@infradead.org>, Qian Cai <quic_qiancai@quicinc.com>,
 lkml <linux-kernel@vger.kernel.org>,
 "list@263.net:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
 Daniel Vetter <daniel@ffwll.ch>, Greg KH <gregkh@linuxfoundation.org>,
 Tom Lendacky <thomas.lendacky@amd.com>, Robin Murphy <robin.murphy@arm.com>,
 bauerman@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jul 06, 2021 at 12:59:57PM -0400, Konrad Rzeszutek Wilk wrote:
> On Tue, Jul 06, 2021 at 05:57:21PM +0100, Will Deacon wrote:
> > On Tue, Jul 06, 2021 at 10:46:07AM -0400, Konrad Rzeszutek Wilk wrote:
> > > On Tue, Jul 06, 2021 at 04:05:13PM +0200, Christoph Hellwig wrote:
> > > > On Tue, Jul 06, 2021 at 03:01:04PM +0100, Robin Murphy wrote:
> > > > > FWIW I was pondering the question of whether to do something along those 
> > > > > lines or just scrap the default assignment entirely, so since I hadn't got 
> > > > > round to saying that I've gone ahead and hacked up the alternative 
> > > > > (similarly untested) for comparison :)
> > > > >
> > > > > TBH I'm still not sure which one I prefer...
> > > > 
> > > > Claire did implement something like your suggestion originally, but
> > > > I don't really like it as it doesn't scale for adding multiple global
> > > > pools, e.g. for the 64-bit addressable one for the various encrypted
> > > > secure guest schemes.
> > > 
> > > Couple of things:
> > >  - I am not pushing to Linus the Claire's patchset until we have a
> > >    resolution on this. I hope you all agree that is a sensible way
> > >    forward as much as I hate doing that.
> > 
> > Sure, it's a pity but we could clearly use a bit more time to get these
> > just right and we've run out of time for 5.14.
> > 
> > I think the main question I have is how would you like to see patches for
> > 5.15? i.e. as patches on top of devel/for-linus-5.14 or something else?
> 
> Yes that would be perfect. If there are any dependencies on the rc1, I
> can rebase it on top of that.

Yes, please, rebasing would be very helpful. The broader rework of
'io_tlb_default_mem' is going to conflict quite badly otherwise.

Cheers,

Will
