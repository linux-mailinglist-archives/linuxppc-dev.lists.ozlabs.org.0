Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A4F9736B731
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Apr 2021 18:46:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FTW4l48mzz3bcW
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Apr 2021 02:46:31 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=FfxC6YTf;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::72a;
 helo=mail-qk1-x72a.google.com; envelope-from=tientzu@chromium.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256
 header.s=google header.b=FfxC6YTf; dkim-atps=neutral
Received: from mail-qk1-x72a.google.com (mail-qk1-x72a.google.com
 [IPv6:2607:f8b0:4864:20::72a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FTW462m3wz30Bc
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Apr 2021 02:45:58 +1000 (AEST)
Received: by mail-qk1-x72a.google.com with SMTP id k127so1523032qkc.6
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Apr 2021 09:45:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KlgosoMJOAaR/ET01AhknsNf3mj6gtcliiDg0dLL1e0=;
 b=FfxC6YTfTyKRjULzScvZeh080rowzObsgfkNkB6PbFU85WK18TorFZb3nTplFpotQN
 FCzKzeHFiWHC6SAAz0H1ZvobWir4E6RenbNbEqtrFbyTUyimRczwWol0BDixJHUTha+x
 eXWW6lC9g26ZhTBX/V5pk140gf+3zGj/JaWxQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KlgosoMJOAaR/ET01AhknsNf3mj6gtcliiDg0dLL1e0=;
 b=oqe0IYzbg+tf9btGzReFjCNiEf7gfbp3vq4D6VHRVEU3ZyvPhdEw4lWOBSPmCqrNqg
 rOAMBj9f0ic0Bxo5qjPLUwtBSMYs6pmbHOMpgc+qIgEeTOVq6luzaYH2YvaOVtHESckS
 DRGEOXTjuLZq9n9Xix5aMw/mVAATrpvkCyMwqvdGYIdFAHutufqWWCSPRQlub1fDCBK7
 eHibhTNA2tn94om7ic+KkRbEMnYhRPasunTPV1REu5l29Nb0uDChKrgAzmC4V64rarAP
 I7RxM0cKGljwRNCNy8xVZqBy5lMB9gYs8vtqKSS35/ImUzLbMiHO1ptQ/HS7SVWZZRzf
 0Afg==
X-Gm-Message-State: AOAM532Zv1A9pb9JM/VcafqfNVCKEUhJ8eNiWPsbgl7j3WG/VPoLlsS3
 AbbS8Xlk2ExFE5qfyDNJSD4icY3RXTmLQQ==
X-Google-Smtp-Source: ABdhPJzxzU+ImBzb/sTTOwXvRg6fSCzun2ybzwqmjfoGKlpov9xloSr5TGWXZaX+g4w88H9Jh+s+Jw==
X-Received: by 2002:a37:680e:: with SMTP id d14mr19009605qkc.48.1619455554938; 
 Mon, 26 Apr 2021 09:45:54 -0700 (PDT)
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com.
 [209.85.222.175])
 by smtp.gmail.com with ESMTPSA id o130sm462231qke.121.2021.04.26.09.45.54
 for <linuxppc-dev@lists.ozlabs.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Apr 2021 09:45:54 -0700 (PDT)
Received: by mail-qk1-f175.google.com with SMTP id y136so25032555qkb.1
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Apr 2021 09:45:54 -0700 (PDT)
X-Received: by 2002:a05:6638:68b:: with SMTP id
 i11mr17242768jab.90.1619455099476; 
 Mon, 26 Apr 2021 09:38:19 -0700 (PDT)
MIME-Version: 1.0
References: <20210422081508.3942748-1-tientzu@chromium.org>
 <20210422081508.3942748-17-tientzu@chromium.org>
 <03c5bc8a-3965-bf1d-01a4-97d074dfbe2b@arm.com>
In-Reply-To: <03c5bc8a-3965-bf1d-01a4-97d074dfbe2b@arm.com>
From: Claire Chang <tientzu@chromium.org>
Date: Tue, 27 Apr 2021 00:38:08 +0800
X-Gmail-Original-Message-ID: <CALiNf28ExE8OLsuDaN9nC=eAi-iG0rct_TJCCxAcWW4+_pdj2g@mail.gmail.com>
Message-ID: <CALiNf28ExE8OLsuDaN9nC=eAi-iG0rct_TJCCxAcWW4+_pdj2g@mail.gmail.com>
Subject: Re: [PATCH v5 16/16] of: Add plumbing for restricted DMA pool
To: Robin Murphy <robin.murphy@arm.com>
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
 Dan Williams <dan.j.williams@intel.com>, jani.nikula@linux.intel.com,
 Nicolas Boichat <drinkcat@chromium.org>, rodrigo.vivi@intel.com,
 Bjorn Helgaas <bhelgaas@google.com>, boris.ostrovsky@oracle.com,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, jgross@suse.com,
 chris@chris-wilson.co.uk, nouveau@lists.freedesktop.org,
 Greg KH <gregkh@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>,
 Frank Rowand <frowand.list@gmail.com>, Tomasz Figa <tfiga@chromium.org>,
 "list@263.net:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
 Jim Quinlan <james.quinlan@broadcom.com>, linuxppc-dev@lists.ozlabs.org,
 bauerman@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Apr 23, 2021 at 9:35 PM Robin Murphy <robin.murphy@arm.com> wrote:
>
> On 2021-04-22 09:15, Claire Chang wrote:
> > If a device is not behind an IOMMU, we look up the device node and set
> > up the restricted DMA when the restricted-dma-pool is presented.
> >
> > Signed-off-by: Claire Chang <tientzu@chromium.org>
> > ---
> >   drivers/of/address.c    | 25 +++++++++++++++++++++++++
> >   drivers/of/device.c     |  3 +++
> >   drivers/of/of_private.h |  5 +++++
> >   3 files changed, 33 insertions(+)
> >
> > diff --git a/drivers/of/address.c b/drivers/of/address.c
> > index 54f221dde267..fff3adfe4986 100644
> > --- a/drivers/of/address.c
> > +++ b/drivers/of/address.c
> > @@ -8,6 +8,7 @@
> >   #include <linux/logic_pio.h>
> >   #include <linux/module.h>
> >   #include <linux/of_address.h>
> > +#include <linux/of_reserved_mem.h>
> >   #include <linux/pci.h>
> >   #include <linux/pci_regs.h>
> >   #include <linux/sizes.h>
> > @@ -1109,6 +1110,30 @@ bool of_dma_is_coherent(struct device_node *np)
> >   }
> >   EXPORT_SYMBOL_GPL(of_dma_is_coherent);
> >
> > +int of_dma_set_restricted_buffer(struct device *dev)
> > +{
> > +     struct device_node *node;
> > +     int count, i;
> > +
> > +     if (!dev->of_node)
> > +             return 0;
> > +
> > +     count = of_property_count_elems_of_size(dev->of_node, "memory-region",
> > +                                             sizeof(phandle));
> > +     for (i = 0; i < count; i++) {
> > +             node = of_parse_phandle(dev->of_node, "memory-region", i);
> > +             /* There might be multiple memory regions, but only one
> > +              * restriced-dma-pool region is allowed.
> > +              */
>
> What's the use-case for having multiple regions if the restricted pool
> is by definition the only one accessible?

There might be a device coherent pool (shared-dma-pool) and
dma_alloc_attrs might allocate memory from that pool [1].
I'm not sure if it makes sense to have another device coherent pool
while using restricted DMA pool though.

[1] https://elixir.bootlin.com/linux/v5.12/source/kernel/dma/mapping.c#L435


>
> Robin.
>
> > +             if (of_device_is_compatible(node, "restricted-dma-pool") &&
> > +                 of_device_is_available(node))
> > +                     return of_reserved_mem_device_init_by_idx(
> > +                             dev, dev->of_node, i);
> > +     }
> > +
> > +     return 0;
> > +}
> > +
> >   /**
> >    * of_mmio_is_nonposted - Check if device uses non-posted MMIO
> >    * @np:     device node
> > diff --git a/drivers/of/device.c b/drivers/of/device.c
> > index c5a9473a5fb1..d8d865223e51 100644
> > --- a/drivers/of/device.c
> > +++ b/drivers/of/device.c
> > @@ -165,6 +165,9 @@ int of_dma_configure_id(struct device *dev, struct device_node *np,
> >
> >       arch_setup_dma_ops(dev, dma_start, size, iommu, coherent);
> >
> > +     if (!iommu)
> > +             return of_dma_set_restricted_buffer(dev);
> > +
> >       return 0;
> >   }
> >   EXPORT_SYMBOL_GPL(of_dma_configure_id);
> > diff --git a/drivers/of/of_private.h b/drivers/of/of_private.h
> > index d717efbd637d..e9237f5eff48 100644
> > --- a/drivers/of/of_private.h
> > +++ b/drivers/of/of_private.h
> > @@ -163,12 +163,17 @@ struct bus_dma_region;
> >   #if defined(CONFIG_OF_ADDRESS) && defined(CONFIG_HAS_DMA)
> >   int of_dma_get_range(struct device_node *np,
> >               const struct bus_dma_region **map);
> > +int of_dma_set_restricted_buffer(struct device *dev);
> >   #else
> >   static inline int of_dma_get_range(struct device_node *np,
> >               const struct bus_dma_region **map)
> >   {
> >       return -ENODEV;
> >   }
> > +static inline int of_dma_get_restricted_buffer(struct device *dev)
> > +{
> > +     return -ENODEV;
> > +}
> >   #endif
> >
> >   #endif /* _LINUX_OF_PRIVATE_H */
> >
