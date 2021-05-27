Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A423D392CD2
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 May 2021 13:35:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FrQjd5wyqz308L
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 May 2021 21:35:33 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=p4bPfFCD;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=will@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=p4bPfFCD; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FrQjB0y6nz2yYv
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 May 2021 21:35:09 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2886A6113B;
 Thu, 27 May 2021 11:35:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1622115307;
 bh=awWFyuDtGzTSFYuKnqnAwD8I2u8LvxPLkIedgwXpacY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=p4bPfFCD5PrcmECQ/JmYfkoIQvGIdlvd3Xmt5WsLHiji5zjF5hUpY/7jV/AEVHJHW
 CB6f9oBS2X3aNGgQ3+WcdNwOGV1gPRmBycO/zJJUoapgziqu+7IL5STMx1dAhYz3+T
 0bM7UEMZILv76zqCaWO+pWXqjNmfb4VQ6CH4Qz9dn7I0OepvY2P5/VxhAaiFsn1JPd
 ce1hSAg7oNQpoYW+JbRsJjBqIARt3uf0TgyQ8bjr7saHdzXTBfM/jxaDHBHbhfTQ4Z
 nDFzJaE8tdL5MVg6406RffF7r/1Of9XzA/MNxWJkmUtb6zscbeJZBFAuG32Qt3uWbG
 DCkceG/OoqRLg==
Date: Thu, 27 May 2021 12:34:57 +0100
From: Will Deacon <will@kernel.org>
To: Claire Chang <tientzu@chromium.org>
Subject: Re: [PATCH v7 14/15] dt-bindings: of: Add restricted DMA pool
Message-ID: <20210527113456.GA22019@willie-the-truck>
References: <20210518064215.2856977-1-tientzu@chromium.org>
 <20210518064215.2856977-15-tientzu@chromium.org>
 <20210526121322.GA19313@willie-the-truck>
 <20210526155321.GA19633@willie-the-truck>
 <CALiNf2_sVXnb97++yWusB5PWz8Pzfn9bCKZc6z3tY4bx6-nW8w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CALiNf2_sVXnb97++yWusB5PWz8Pzfn9bCKZc6z3tY4bx6-nW8w@mail.gmail.com>
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
 Frank Rowand <frowand.list@gmail.com>, Christoph Hellwig <hch@lst.de>,
 Jianxiong Gao <jxgao@google.com>, sstabellini@kernel.org,
 Saravana Kannan <saravanak@google.com>,
 "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>, mingo@kernel.org,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>, bskeggs@redhat.com,
 linux-pci@vger.kernel.org, xen-devel@lists.xenproject.org,
 Thierry Reding <treding@nvidia.com>, matthew.auld@intel.com,
 Nicolas Boichat <drinkcat@chromium.org>, thomas.hellstrom@linux.intel.com,
 jgross@suse.com, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 intel-gfx@lists.freedesktop.org, maarten.lankhorst@linux.intel.com,
 Robin Murphy <robin.murphy@arm.com>, jani.nikula@linux.intel.com,
 Rob Herring <robh+dt@kernel.org>, rodrigo.vivi@intel.com,
 Bjorn Helgaas <bhelgaas@google.com>, Dan Williams <dan.j.williams@intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 boris.ostrovsky@oracle.com, airlied@linux.ie,
 Greg KH <gregkh@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>,
 lkml <linux-kernel@vger.kernel.org>,
 "list@263.net:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
 Daniel Vetter <daniel@ffwll.ch>, xypron.glpk@gmx.de,
 linuxppc-dev@lists.ozlabs.org, bauerman@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, May 27, 2021 at 07:29:20PM +0800, Claire Chang wrote:
> On Wed, May 26, 2021 at 11:53 PM Will Deacon <will@kernel.org> wrote:
> >
> > On Wed, May 26, 2021 at 01:13:22PM +0100, Will Deacon wrote:
> > > On Tue, May 18, 2021 at 02:42:14PM +0800, Claire Chang wrote:
> > > > @@ -138,4 +160,9 @@ one for multimedia processing (named multimedia-memory@77000000, 64MiB).
> > > >             memory-region = <&multimedia_reserved>;
> > > >             /* ... */
> > > >     };
> > > > +
> > > > +   pcie_device: pcie_device@0,0 {
> > > > +           memory-region = <&restricted_dma_mem_reserved>;
> > > > +           /* ... */
> > > > +   };
> > >
> > > I still don't understand how this works for individual PCIe devices -- how
> > > is dev->of_node set to point at the node you have above?
> > >
> > > I tried adding the memory-region to the host controller instead, and then
> > > I see it crop up in dmesg:
> > >
> > >   | pci-host-generic 40000000.pci: assigned reserved memory node restricted_dma_mem_reserved
> > >
> > > but none of the actual PCI devices end up with 'dma_io_tlb_mem' set, and
> > > so the restricted DMA area is not used. In fact, swiotlb isn't used at all.
> > >
> > > What am I missing to make this work with PCIe devices?
> >
> > Aha, looks like we're just missing the logic to inherit the DMA
> > configuration. The diff below gets things working for me.
> 
> I guess what was missing is the reg property in the pcie_device node.
> Will update the example dts.

Thanks. I still think something like my diff makes sense, if you wouldn't mind including
it, as it allows restricted DMA to be used for situations where the PCIe
topology is not static.

Perhaps we should prefer dev->of_node if it exists, but then use the node
of the host bridge's parent node otherwise?

Will
