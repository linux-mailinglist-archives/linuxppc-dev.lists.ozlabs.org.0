Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 54ABE389E32
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 May 2021 08:48:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fm0g41cN9z308q
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 May 2021 16:48:00 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=XZhu4NB3;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::12b;
 helo=mail-il1-x12b.google.com; envelope-from=tientzu@chromium.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256
 header.s=google header.b=XZhu4NB3; dkim-atps=neutral
Received: from mail-il1-x12b.google.com (mail-il1-x12b.google.com
 [IPv6:2607:f8b0:4864:20::12b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fm0fb1fZRz2xgF
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 May 2021 16:47:32 +1000 (AEST)
Received: by mail-il1-x12b.google.com with SMTP id k4so10633096ili.4
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 May 2021 23:47:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=e/NSxqpkIDrHAb8EdngT+J5y92xOhsZUELUZeumbo14=;
 b=XZhu4NB364LO5HgzFR5xaRq+2+Ny8I/tbuM557W/djcP2WZR5/YY1P3k16G0KqQZ5g
 9wOC75EFGAaEHt77aJ4y5qFZynUNK1/otklqj7so1biOf1FGROrwm/ILpXyxkwLvM+aC
 k3452c8bAQ6BEmJklQOi+zYSoBDbgxiFQQFO0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=e/NSxqpkIDrHAb8EdngT+J5y92xOhsZUELUZeumbo14=;
 b=bqdb97gE477wtWInbk0JpypxWsKCNBNc3OzjA3hU3PPzCUnQoDQgxJFlheMlwyhI5s
 proBa0b899KT5a4sszycV85TsHUV8dKV6FZHPgkjJhnoDHbhxde2SjEKr1ZLwzi/wcWA
 CfoPj4qelbLN8Y/RdqqJDe73++dOSuWIYZlfpoF5s77JhuYiMG+1VXU2Kk4Uj56Vb74x
 a4FGHdNVgJhPY/zs3qVx/rDXpHytLn7w67gq/wjpD5ZU1aec3eUdszrQzKtKoPj2bVZZ
 4DZqpPkuNJsR4V5+X/GPiStKw776FRLB0I+TI8xnaPl78vJimAALAg3Wu8Q5izWVcL7G
 eRYg==
X-Gm-Message-State: AOAM533ZWYrqUFEowSivhTPY29BK6n2GCN7aW8b/I9mPQKwirH5wpoJ+
 Trd8S8eHlSvRgkxdz1UOpY0oGcQr+2mAvw==
X-Google-Smtp-Source: ABdhPJymZaFbAb986xsWZWZ987Z4lqcVHTvssDcJzFHXrgrYVRPzgIedb9epB+/uboAO/zWp4VqP1A==
X-Received: by 2002:a05:6e02:5ac:: with SMTP id
 k12mr4024018ils.173.1621493248147; 
 Wed, 19 May 2021 23:47:28 -0700 (PDT)
Received: from mail-io1-f54.google.com (mail-io1-f54.google.com.
 [209.85.166.54])
 by smtp.gmail.com with ESMTPSA id i13sm1938657ila.46.2021.05.19.23.47.27
 for <linuxppc-dev@lists.ozlabs.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 May 2021 23:47:27 -0700 (PDT)
Received: by mail-io1-f54.google.com with SMTP id z24so15507527ioi.3
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 May 2021 23:47:27 -0700 (PDT)
X-Received: by 2002:a05:6638:14ce:: with SMTP id
 l14mr3931980jak.90.1621492759440; 
 Wed, 19 May 2021 23:39:19 -0700 (PDT)
MIME-Version: 1.0
References: <20210518064215.2856977-1-tientzu@chromium.org>
 <20210518064215.2856977-5-tientzu@chromium.org>
 <ae050c36-8179-e465-84f0-e46c361bd71e@gmail.com>
In-Reply-To: <ae050c36-8179-e465-84f0-e46c361bd71e@gmail.com>
From: Claire Chang <tientzu@chromium.org>
Date: Thu, 20 May 2021 14:39:08 +0800
X-Gmail-Original-Message-ID: <CALiNf29jpi7=UKFPc7TK8wiNbq6TL=Uj-Mvmj9HRvOLnr-r_Ow@mail.gmail.com>
Message-ID: <CALiNf29jpi7=UKFPc7TK8wiNbq6TL=Uj-Mvmj9HRvOLnr-r_Ow@mail.gmail.com>
Subject: Re: [PATCH v7 04/15] swiotlb: Add restricted DMA pool initialization
To: Florian Fainelli <f.fainelli@gmail.com>
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
Cc: heikki.krogerus@linux.intel.com, thomas.hellstrom@linux.intel.com,
 peterz@infradead.org, joonas.lahtinen@linux.intel.com,
 dri-devel@lists.freedesktop.org, chris@chris-wilson.co.uk,
 grant.likely@arm.com, paulus@samba.org, Frank Rowand <frowand.list@gmail.com>,
 mingo@kernel.org, Marek Szyprowski <m.szyprowski@samsung.com>,
 sstabellini@kernel.org, Saravana Kannan <saravanak@google.com>,
 Joerg Roedel <joro@8bytes.org>,
 "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
 Christoph Hellwig <hch@lst.de>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>, bskeggs@redhat.com,
 linux-pci@vger.kernel.org, xen-devel@lists.xenproject.org,
 Thierry Reding <treding@nvidia.com>, intel-gfx@lists.freedesktop.org,
 matthew.auld@intel.com, linux-devicetree <devicetree@vger.kernel.org>,
 Jianxiong Gao <jxgao@google.com>, Daniel Vetter <daniel@ffwll.ch>,
 Will Deacon <will@kernel.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 maarten.lankhorst@linux.intel.com, airlied@linux.ie,
 Dan Williams <dan.j.williams@intel.com>, linuxppc-dev@lists.ozlabs.org,
 jani.nikula@linux.intel.com, Rob Herring <robh+dt@kernel.org>,
 rodrigo.vivi@intel.com, Bjorn Helgaas <bhelgaas@google.com>,
 boris.ostrovsky@oracle.com,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, jgross@suse.com,
 Nicolas Boichat <drinkcat@chromium.org>, Greg KH <gregkh@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>, lkml <linux-kernel@vger.kernel.org>,
 Tomasz Figa <tfiga@chromium.org>,
 "list@263.net:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
 Jim Quinlan <james.quinlan@broadcom.com>, xypron.glpk@gmx.de,
 Robin Murphy <robin.murphy@arm.com>, bauerman@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, May 20, 2021 at 2:54 AM Florian Fainelli <f.fainelli@gmail.com> wrote:
>
>
>
> On 5/17/2021 11:42 PM, Claire Chang wrote:
> > Add the initialization function to create restricted DMA pools from
> > matching reserved-memory nodes.
> >
> > Signed-off-by: Claire Chang <tientzu@chromium.org>
> > ---
> >  include/linux/device.h  |  4 +++
> >  include/linux/swiotlb.h |  3 +-
> >  kernel/dma/swiotlb.c    | 76 +++++++++++++++++++++++++++++++++++++++++
> >  3 files changed, 82 insertions(+), 1 deletion(-)
> >
> > diff --git a/include/linux/device.h b/include/linux/device.h
> > index 38a2071cf776..4987608ea4ff 100644
> > --- a/include/linux/device.h
> > +++ b/include/linux/device.h
> > @@ -416,6 +416,7 @@ struct dev_links_info {
> >   * @dma_pools:       Dma pools (if dma'ble device).
> >   * @dma_mem: Internal for coherent mem override.
> >   * @cma_area:        Contiguous memory area for dma allocations
> > + * @dma_io_tlb_mem: Internal for swiotlb io_tlb_mem override.
> >   * @archdata:        For arch-specific additions.
> >   * @of_node: Associated device tree node.
> >   * @fwnode:  Associated device node supplied by platform firmware.
> > @@ -521,6 +522,9 @@ struct device {
> >  #ifdef CONFIG_DMA_CMA
> >       struct cma *cma_area;           /* contiguous memory area for dma
> >                                          allocations */
> > +#endif
> > +#ifdef CONFIG_DMA_RESTRICTED_POOL
> > +     struct io_tlb_mem *dma_io_tlb_mem;
> >  #endif
> >       /* arch specific additions */
> >       struct dev_archdata     archdata;
> > diff --git a/include/linux/swiotlb.h b/include/linux/swiotlb.h
> > index 216854a5e513..03ad6e3b4056 100644
> > --- a/include/linux/swiotlb.h
> > +++ b/include/linux/swiotlb.h
> > @@ -72,7 +72,8 @@ extern enum swiotlb_force swiotlb_force;
> >   *           range check to see if the memory was in fact allocated by this
> >   *           API.
> >   * @nslabs:  The number of IO TLB blocks (in groups of 64) between @start and
> > - *           @end. This is command line adjustable via setup_io_tlb_npages.
> > + *           @end. For default swiotlb, this is command line adjustable via
> > + *           setup_io_tlb_npages.
> >   * @used:    The number of used IO TLB block.
> >   * @list:    The free list describing the number of free entries available
> >   *           from each index.
> > diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
> > index b849b01a446f..1d8eb4de0d01 100644
> > --- a/kernel/dma/swiotlb.c
> > +++ b/kernel/dma/swiotlb.c
> > @@ -39,6 +39,13 @@
> >  #ifdef CONFIG_DEBUG_FS
> >  #include <linux/debugfs.h>
> >  #endif
> > +#ifdef CONFIG_DMA_RESTRICTED_POOL
> > +#include <linux/io.h>
> > +#include <linux/of.h>
> > +#include <linux/of_fdt.h>
> > +#include <linux/of_reserved_mem.h>
> > +#include <linux/slab.h>
> > +#endif
> >
> >  #include <asm/io.h>
> >  #include <asm/dma.h>
> > @@ -690,3 +697,72 @@ static int __init swiotlb_create_default_debugfs(void)
> >  late_initcall(swiotlb_create_default_debugfs);
> >
> >  #endif
> > +
> > +#ifdef CONFIG_DMA_RESTRICTED_POOL
> > +static int rmem_swiotlb_device_init(struct reserved_mem *rmem,
> > +                                 struct device *dev)
> > +{
> > +     struct io_tlb_mem *mem = rmem->priv;
> > +     unsigned long nslabs = rmem->size >> IO_TLB_SHIFT;
> > +
> > +     if (dev->dma_io_tlb_mem)
> > +             return 0;
> > +
> > +     /*
> > +      * Since multiple devices can share the same pool, the private data,
> > +      * io_tlb_mem struct, will be initialized by the first device attached
> > +      * to it.
> > +      */
> > +     if (!mem) {
> > +             mem = kzalloc(struct_size(mem, slots, nslabs), GFP_KERNEL);
> > +             if (!mem)
> > +                     return -ENOMEM;
> > +
> > +             if (PageHighMem(pfn_to_page(PHYS_PFN(rmem->base)))) {
> > +                     kfree(mem);
> > +                     return -EINVAL;
>
> This could probably deserve a warning here to indicate that the reserved
> area must be accessible within the linear mapping as I would expect a
> lot of people to trip over that.

Ok. Will add it.

>
> Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
> --
> Florian
