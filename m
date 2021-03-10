Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D3B9C3349E8
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Mar 2021 22:41:52 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DwlsB6HGgz3d6N
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Mar 2021 08:41:50 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=eDXX9I0r;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=robh+dt@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=eDXX9I0r; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dwlrl1bClz30Jd
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Mar 2021 08:41:26 +1100 (AEDT)
Received: by mail.kernel.org (Postfix) with ESMTPSA id A1FF064FE7
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Mar 2021 21:40:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1615412454;
 bh=lljbEm8y6jNcxvIMoB+J261BTyFdid0U0j/1mSpgrns=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=eDXX9I0rBca4D2age7wm+DtVv6geacxhoDXnt5SysKVhym9aYBoOULiDV+ts4rOLP
 jxqSr5B0vX0/o/NShM/j+kwlnb4hGRATSr0mEhy2fTgb4b/f9TFkN0sucrguP/wUnN
 VpsdkpA2+bkS7oY10zU2zq+j59iH8lNhIYLI61shYJGWLghrHuyig30tcjLo3fTgbB
 3DEVFLncbcg+C2B9HtVOo3SUvsmkNa+xgZXWZi3ZI5a2G3Gno+oUiLdB0wFYwj7D9V
 li5Sma9VH3O9evfauK7N3UwWSXURG5BK+1LBH0BYK5Vbx589vAqinspwZjQAwTmkXH
 mjJKT2LCYnF3Q==
Received: by mail-qk1-f170.google.com with SMTP id x10so18546082qkm.8
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Mar 2021 13:40:54 -0800 (PST)
X-Gm-Message-State: AOAM531pLRl1TKT2RMDnIWEO3FGv9giLeWB3gIjmcPj8lVchodXAA8+y
 iccF0NeGKOYXXXtZ6f1uN4TB8Tx4mZuYCEqilw==
X-Google-Smtp-Source: ABdhPJwvOHv4sjXRoS+j4qWhL9MVaGJgYMXKyxBDilpUrwUXgxjhTnULwJ7kIho0KdWOn0m+qzW6exxxNwLS3x7GxZU=
X-Received: by 2002:a05:620a:1001:: with SMTP id
 z1mr4659415qkj.364.1615412453005; 
 Wed, 10 Mar 2021 13:40:53 -0800 (PST)
MIME-Version: 1.0
References: <20210209062131.2300005-1-tientzu@chromium.org>
 <20210209062131.2300005-14-tientzu@chromium.org>
 <20210310160747.GA29834@willie-the-truck>
In-Reply-To: <20210310160747.GA29834@willie-the-truck>
From: Rob Herring <robh+dt@kernel.org>
Date: Wed, 10 Mar 2021 14:40:41 -0700
X-Gmail-Original-Message-ID: <CAL_JsqJE6A4awYCvqzw3qk2uAJEKgkSOKbk9tPaMKup8zes8cA@mail.gmail.com>
Message-ID: <CAL_JsqJE6A4awYCvqzw3qk2uAJEKgkSOKbk9tPaMKup8zes8cA@mail.gmail.com>
Subject: Re: [PATCH v4 13/14] dt-bindings: of: Add restricted DMA pool
To: Will Deacon <will@kernel.org>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Peter Zijlstra <peterz@infradead.org>, Grant Likely <grant.likely@arm.com>,
 Paul Mackerras <paulus@samba.org>, Frank Rowand <frowand.list@gmail.com>,
 Ingo Molnar <mingo@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Saravana Kannan <saravanak@google.com>, Joerg Roedel <joro@8bytes.org>,
 "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
 Christoph Hellwig <hch@lst.de>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Thierry Reding <treding@nvidia.com>,
 linux-devicetree <devicetree@vger.kernel.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Dan Williams <dan.j.williams@intel.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Nicolas Boichat <drinkcat@chromium.org>, Claire Chang <tientzu@chromium.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Juergen Gross <jgross@suse.com>, Greg KH <gregkh@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>, lkml <linux-kernel@vger.kernel.org>,
 "list@263.net:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
 Jim Quinlan <james.quinlan@broadcom.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Robin Murphy <robin.murphy@arm.com>,
 Thiago Jung Bauermann <bauerman@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Mar 10, 2021 at 9:08 AM Will Deacon <will@kernel.org> wrote:
>
> Hi Claire,
>
> On Tue, Feb 09, 2021 at 02:21:30PM +0800, Claire Chang wrote:
> > Introduce the new compatible string, restricted-dma-pool, for restricted
> > DMA. One can specify the address and length of the restricted DMA memory
> > region by restricted-dma-pool in the reserved-memory node.
> >
> > Signed-off-by: Claire Chang <tientzu@chromium.org>
> > ---
> >  .../reserved-memory/reserved-memory.txt       | 24 +++++++++++++++++++
> >  1 file changed, 24 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt b/Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt
> > index e8d3096d922c..fc9a12c2f679 100644
> > --- a/Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt
> > +++ b/Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt
> > @@ -51,6 +51,20 @@ compatible (optional) - standard definition
> >            used as a shared pool of DMA buffers for a set of devices. It can
> >            be used by an operating system to instantiate the necessary pool
> >            management subsystem if necessary.
> > +        - restricted-dma-pool: This indicates a region of memory meant to be
> > +          used as a pool of restricted DMA buffers for a set of devices. The
> > +          memory region would be the only region accessible to those devices.
> > +          When using this, the no-map and reusable properties must not be set,
> > +          so the operating system can create a virtual mapping that will be used
> > +          for synchronization. The main purpose for restricted DMA is to
> > +          mitigate the lack of DMA access control on systems without an IOMMU,
> > +          which could result in the DMA accessing the system memory at
> > +          unexpected times and/or unexpected addresses, possibly leading to data
> > +          leakage or corruption. The feature on its own provides a basic level
> > +          of protection against the DMA overwriting buffer contents at
> > +          unexpected times. However, to protect against general data leakage and
> > +          system memory corruption, the system needs to provide way to lock down
> > +          the memory access, e.g., MPU.
>
> As far as I can tell, these pools work with both static allocations (which
> seem to match your use-case where firmware has preconfigured the DMA ranges)
> but also with dynamic allocations where a 'size' property is present instead
> of the 'reg' property and the kernel is responsible for allocating the
> reservation during boot. Am I right and, if so, is that deliberate?

I believe so. I'm not keen on having size only reservations in DT.
Yes, we allowed that already, but that's back from the days of needing
large CMA carveouts to be reserved early in boot. I've read that the
kernel is much better now at contiguous allocations, so do we really
need this in DT anymore?

> I ask because I think that would potentially be useful to us for the
> Protected KVM work, where we need to bounce virtio memory accesses via
> guest-determined windows because the guest memory is generally inaccessible
> to the host. We've been hacking this using a combination of "swiotlb=force"
> and set_memory_{decrypted,encrypted}() but it would be much better to
> leverage the stuff you have here.
>
> Also:
>
> > +
> > +             restricted_dma_mem_reserved: restricted_dma_mem_reserved {
> > +                     compatible = "restricted-dma-pool";
> > +                     reg = <0x50000000 0x400000>;
> > +             };
> >       };
> >
> >       /* ... */
> > @@ -138,4 +157,9 @@ one for multimedia processing (named multimedia-memory@77000000, 64MiB).
> >               memory-region = <&multimedia_reserved>;
> >               /* ... */
> >       };
> > +
> > +     pcie_device: pcie_device@0,0 {
> > +             memory-region = <&restricted_dma_mem_reserved>;
> > +             /* ... */
> > +     };
>
> I find this example a bit weird, as I didn't think we usually had DT nodes
> for PCI devices; rather they are discovered as a result of probing config
> space. Is the idea that you have one reserved memory region attached to the
> RC and all the PCI devices below that share the region, or is there a need
> for a mapping mechanism?

We can have DT nodes for PCI. AIUI, IBM power systems always do. For
FDT, it's only if there are extra non-discoverable resources. It's
particularly fun when it's resources which need to be enabled for the
PCI device to be discovered. That seems to be a growing problem as PCI
becomes more common on embedded systems.

Rob
