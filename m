Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 087D236B72D
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Apr 2021 18:46:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FTW4G4jN5z30Dv
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Apr 2021 02:46:06 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=ctSitjX8;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::102d;
 helo=mail-pj1-x102d.google.com; envelope-from=tientzu@chromium.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256
 header.s=google header.b=ctSitjX8; dkim-atps=neutral
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FTW3q5VR5z2yR4
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Apr 2021 02:45:41 +1000 (AEST)
Received: by mail-pj1-x102d.google.com with SMTP id
 gq23-20020a17090b1057b0290151869af68bso5528395pjb.4
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Apr 2021 09:45:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=w+xLIOm1aUR+ojar7SxT7aE31iJaS6lTTL9NFfLTdqs=;
 b=ctSitjX8LR7O2ZMk4lsR8Irz6egx7wTYNYpP5lwZVohPuAIjgk70gq0rLgnAswDS5J
 OwrGL0fnjKjd/25GMaUPOEt1BY6NfF//O6cQPXnTolYLDRghV+Gs0xVvNzh51W3LGUxd
 u8ZH2pOBpUkLUeomCja6RAPBZaNGl3ag01nF0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=w+xLIOm1aUR+ojar7SxT7aE31iJaS6lTTL9NFfLTdqs=;
 b=RJFC8w3k8dmJtbuAiJGAH6BN+E3qi0F4LqISi8bIlUWjVP1KlIh6Er4ZenEjxc7CXQ
 i8bNAXdmyBy4r90PwFdAGwpizOcKdnRavKvPOvjGOeYSdRy5wLKi2OydmYdttWzjBIjF
 XiZU2BZzqivTysXnxno+akkYOKJc0bKbWZ+UAjZGX52Un9zmUQ8EOtS3uMdelIBCvRm8
 gBU8RV2EuyxlAkNN9O9Bq3tJuInb4mTRcW0TKA1dy0TLBFYcQe8pLmZRzrUDZUZq4Oj/
 IW9D5cxvUu387a4ghNmRkjdm2rHe0+XEPRPdrcUDm2Sc2MKU4hcXLdNOykLZmrGetcEv
 vRag==
X-Gm-Message-State: AOAM532EDKs/yYqxEOqA9lGTF6PUKoGJkCfK5wqLLL7d7YBXtJUxrzYR
 Kl3YSXdwTRovTdWIErShja6xMDyKrVUs4w==
X-Google-Smtp-Source: ABdhPJwDiMkDoeOJcvcFgrFd16m54l4Dur7kQiB94Io1fxUz/OmEZrIflXL5PL9Oet5VPN1o/a5oyg==
X-Received: by 2002:a17:90a:f0d5:: with SMTP id
 fa21mr22223988pjb.59.1619455537350; 
 Mon, 26 Apr 2021 09:45:37 -0700 (PDT)
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com.
 [209.85.215.170])
 by smtp.gmail.com with ESMTPSA id i22sm12137386pgj.90.2021.04.26.09.45.36
 for <linuxppc-dev@lists.ozlabs.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Apr 2021 09:45:37 -0700 (PDT)
Received: by mail-pg1-f170.google.com with SMTP id j7so31015223pgi.3
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Apr 2021 09:45:36 -0700 (PDT)
X-Received: by 2002:a5d:8c82:: with SMTP id g2mr15143365ion.34.1619455049397; 
 Mon, 26 Apr 2021 09:37:29 -0700 (PDT)
MIME-Version: 1.0
References: <20210422081508.3942748-1-tientzu@chromium.org>
 <20210422081508.3942748-6-tientzu@chromium.org>
 <c9abca62-328d-d0d6-a8a6-a67475171f92@arm.com>
In-Reply-To: <c9abca62-328d-d0d6-a8a6-a67475171f92@arm.com>
From: Claire Chang <tientzu@chromium.org>
Date: Tue, 27 Apr 2021 00:37:18 +0800
X-Gmail-Original-Message-ID: <CALiNf2_tffc65PhLxCr3-+gmVYKGO2HjYiJVkBNa5U5HYdi9pg@mail.gmail.com>
Message-ID: <CALiNf2_tffc65PhLxCr3-+gmVYKGO2HjYiJVkBNa5U5HYdi9pg@mail.gmail.com>
Subject: Re: [PATCH v5 05/16] swiotlb: Add restricted DMA pool initialization
To: Steven Price <steven.price@arm.com>
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
 dri-devel@lists.freedesktop.org, lkml <linux-kernel@vger.kernel.org>,
 grant.likely@arm.com, paulus@samba.org, Will Deacon <will@kernel.org>,
 mingo@kernel.org, Marek Szyprowski <m.szyprowski@samsung.com>,
 sstabellini@kernel.org, Saravana Kannan <saravanak@google.com>,
 xypron.glpk@gmx.de, Joerg Roedel <joro@8bytes.org>,
 "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
 Christoph Hellwig <hch@lst.de>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>, bskeggs@redhat.com,
 linux-pci@vger.kernel.org, xen-devel@lists.xenproject.org,
 Thierry Reding <treding@nvidia.com>, intel-gfx@lists.freedesktop.org,
 matthew.auld@intel.com, linux-devicetree <devicetree@vger.kernel.org>,
 Jianxiong Gao <jxgao@google.com>, Daniel Vetter <daniel@ffwll.ch>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 maarten.lankhorst@linux.intel.com, airlied@linux.ie,
 Dan Williams <dan.j.williams@intel.com>, linuxppc-dev@lists.ozlabs.org,
 jani.nikula@linux.intel.com, Nicolas Boichat <drinkcat@chromium.org>,
 rodrigo.vivi@intel.com, Bjorn Helgaas <bhelgaas@google.com>,
 boris.ostrovsky@oracle.com,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, jgross@suse.com,
 chris@chris-wilson.co.uk, nouveau@lists.freedesktop.org,
 Greg KH <gregkh@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>,
 Frank Rowand <frowand.list@gmail.com>, Tomasz Figa <tfiga@chromium.org>,
 "list@263.net:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
 Jim Quinlan <james.quinlan@broadcom.com>, Robin Murphy <robin.murphy@arm.com>,
 bauerman@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Apr 23, 2021 at 7:34 PM Steven Price <steven.price@arm.com> wrote:
>
> On 22/04/2021 09:14, Claire Chang wrote:
> > Add the initialization function to create restricted DMA pools from
> > matching reserved-memory nodes.
> >
> > Signed-off-by: Claire Chang <tientzu@chromium.org>
> > ---
> >   include/linux/device.h  |  4 +++
> >   include/linux/swiotlb.h |  3 +-
> >   kernel/dma/swiotlb.c    | 80 +++++++++++++++++++++++++++++++++++++++++
> >   3 files changed, 86 insertions(+), 1 deletion(-)
> >
> > diff --git a/include/linux/device.h b/include/linux/device.h
> > index 38a2071cf776..4987608ea4ff 100644
> > --- a/include/linux/device.h
> > +++ b/include/linux/device.h
> > @@ -416,6 +416,7 @@ struct dev_links_info {
> >    * @dma_pools:      Dma pools (if dma'ble device).
> >    * @dma_mem:        Internal for coherent mem override.
> >    * @cma_area:       Contiguous memory area for dma allocations
> > + * @dma_io_tlb_mem: Internal for swiotlb io_tlb_mem override.
> >    * @archdata:       For arch-specific additions.
> >    * @of_node:        Associated device tree node.
> >    * @fwnode: Associated device node supplied by platform firmware.
> > @@ -521,6 +522,9 @@ struct device {
> >   #ifdef CONFIG_DMA_CMA
> >       struct cma *cma_area;           /* contiguous memory area for dma
> >                                          allocations */
> > +#endif
> > +#ifdef CONFIG_DMA_RESTRICTED_POOL
> > +     struct io_tlb_mem *dma_io_tlb_mem;
> >   #endif
> >       /* arch specific additions */
> >       struct dev_archdata     archdata;
> > diff --git a/include/linux/swiotlb.h b/include/linux/swiotlb.h
> > index 216854a5e513..03ad6e3b4056 100644
> > --- a/include/linux/swiotlb.h
> > +++ b/include/linux/swiotlb.h
> > @@ -72,7 +72,8 @@ extern enum swiotlb_force swiotlb_force;
> >    *          range check to see if the memory was in fact allocated by this
> >    *          API.
> >    * @nslabs: The number of IO TLB blocks (in groups of 64) between @start and
> > - *           @end. This is command line adjustable via setup_io_tlb_npages.
> > + *           @end. For default swiotlb, this is command line adjustable via
> > + *           setup_io_tlb_npages.
> >    * @used:   The number of used IO TLB block.
> >    * @list:   The free list describing the number of free entries available
> >    *          from each index.
> > diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
> > index 57a9adb920bf..ffbb8724e06c 100644
> > --- a/kernel/dma/swiotlb.c
> > +++ b/kernel/dma/swiotlb.c
> > @@ -39,6 +39,13 @@
> >   #ifdef CONFIG_DEBUG_FS
> >   #include <linux/debugfs.h>
> >   #endif
> > +#ifdef CONFIG_DMA_RESTRICTED_POOL
> > +#include <linux/io.h>
> > +#include <linux/of.h>
> > +#include <linux/of_fdt.h>
> > +#include <linux/of_reserved_mem.h>
> > +#include <linux/slab.h>
> > +#endif
> >
> >   #include <asm/io.h>
> >   #include <asm/dma.h>
> > @@ -681,3 +688,76 @@ static int __init swiotlb_create_default_debugfs(void)
> >   late_initcall(swiotlb_create_default_debugfs);
> >
> >   #endif
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
> > +     /* Since multiple devices can share the same pool, the private data,
> > +      * io_tlb_mem struct, will be initialized by the first device attached
> > +      * to it.
> > +      */
> > +     if (!mem) {
> > +             mem = kzalloc(struct_size(mem, slots, nslabs), GFP_KERNEL);
> > +             if (!mem)
> > +                     return -ENOMEM;
> > +#ifdef CONFIG_ARM
> > +             if (!PageHighMem(pfn_to_page(PHYS_PFN(rmem->base)))) {
> > +                     kfree(mem);
> > +                     return -EINVAL;
> > +             }
> > +#endif /* CONFIG_ARM */
> > +             swiotlb_init_io_tlb_mem(mem, rmem->base, nslabs, false);
> > +
> > +             rmem->priv = mem;
> > +     }
> > +
> > +#ifdef CONFIG_DEBUG_FS
> > +     if (!io_tlb_default_mem->debugfs)
> > +             io_tlb_default_mem->debugfs =
> > +                     debugfs_create_dir("swiotlb", NULL);
>
> At this point it's possible for io_tlb_default_mem to be NULL, leading
> to a splat.

Thanks for pointing this out.

>
> But even then if it's not and we have the situation where debugfs==NULL
> then the debugfs_create_dir() here will cause a subsequent attempt in
> swiotlb_create_debugfs() to fail (directory already exists) leading to
> mem->debugfs being assigned an error value. I suspect the creation of
> the debugfs directory needs to be separated from io_tlb_default_mem
> being set.

debugfs creation should move into the if (!mem) {...} above to avoid
duplication.
I think having a separated struct dentry pointer for the default
debugfs should be enough?

if (!debugfs)
    debugfs = debugfs_create_dir("swiotlb", NULL);
swiotlb_create_debugfs(mem, rmem->name, debugfs);

>
> Other than that I gave this series a go with our prototype of Arm's
> Confidential Computer Architecture[1] - since the majority of the
> guest's memory is protected from the host the restricted DMA pool allows
> (only) a small area to be shared with the host.
>
> After fixing (well hacking round) the above it all seems to be working
> fine with virtio drivers.
>
> Thanks,
>
> Steve
>
> [1]
> https://www.arm.com/why-arm/architecture/security-features/arm-confidential-compute-architecture
