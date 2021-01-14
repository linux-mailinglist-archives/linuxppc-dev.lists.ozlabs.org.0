Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 38D852F5D0F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Jan 2021 10:16:01 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DGdvx0nL3zDrcY
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Jan 2021 20:15:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::d2c;
 helo=mail-io1-xd2c.google.com; envelope-from=tientzu@chromium.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256
 header.s=google header.b=nY1GnsLl; dkim-atps=neutral
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com
 [IPv6:2607:f8b0:4864:20::d2c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DGdt274WvzDrTk
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Jan 2021 20:14:18 +1100 (AEDT)
Received: by mail-io1-xd2c.google.com with SMTP id d13so6576574ioy.4
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Jan 2021 01:14:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XoX/j54i0jG8qEsxZKby76Lqj61QzippjPHzsTsj+5Y=;
 b=nY1GnsLlZi0Sxxm+zSGIGaqKpSxx6JueftrzPps7oTAcG91/bM9YfHLXW3YxSFcLzK
 y6cH1olpZ/FXA0Mp0cE9+mqoheJMPU0KT0091/GVtf67wUxU6MGGIWncH2X6oPgNN5KO
 QvrKMhyV8u8UB5lLj67P7d++Su0Uyq/z5gAtg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XoX/j54i0jG8qEsxZKby76Lqj61QzippjPHzsTsj+5Y=;
 b=nDUKTu6EgDDQ98zp5nI/SDfq5ZP9E4JJwocLkh112lgS35XL7xc0Ps8riBvYIgMgS+
 vRBBaat/zfw7NjnweiLnGJy9GwGjFhzbp6dJrXFf/Td22DjhBTKLrKEWLlx0BLvO6hrU
 Hrlb273npBtSUFjvGTybK0AoGT4sby4m//yAGhZx9D9Ye2sx/eBO2XkSmTW2TwSWjYGG
 c8YY79KfyUOekiYtRU1cBznlgWw4WziMLRnv2UAKoXahFLf0EAJkpslmkJ6THA/NxN3a
 /8npw/Og8tRoQX4rqpfNE8AUUArpSokSt5+kiKDvUF4nVR+6HIKR+VySyEKeDRidk18H
 rvng==
X-Gm-Message-State: AOAM5338q5lQsy74sG1RIjMe5qYShS+oJt1mmLphkLOxt9yAA7sTs9Gt
 dHN5w4jITGJsgopCKEtBlMh4PRFU1SjrwA==
X-Google-Smtp-Source: ABdhPJzloLYAOQdRcjBskN9dx/fHgq5qia6uCOLKfWpF0ZkdB/tUTJ4yk6jmSB267CHA8h2Lfp1gjg==
X-Received: by 2002:a92:cd46:: with SMTP id v6mr5848056ilq.149.1610615655594; 
 Thu, 14 Jan 2021 01:14:15 -0800 (PST)
Received: from mail-io1-f47.google.com (mail-io1-f47.google.com.
 [209.85.166.47])
 by smtp.gmail.com with ESMTPSA id o73sm639628ili.84.2021.01.14.01.14.15
 for <linuxppc-dev@lists.ozlabs.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Jan 2021 01:14:15 -0800 (PST)
Received: by mail-io1-f47.google.com with SMTP id d9so9787398iob.6
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Jan 2021 01:14:15 -0800 (PST)
X-Received: by 2002:a92:c206:: with SMTP id j6mr5789564ilo.189.1610615314989; 
 Thu, 14 Jan 2021 01:08:34 -0800 (PST)
MIME-Version: 1.0
References: <20210106034124.30560-1-tientzu@chromium.org>
 <20210106034124.30560-7-tientzu@chromium.org>
 <95e6dd76-5e18-e445-c351-19fba18f36de@gmail.com>
In-Reply-To: <95e6dd76-5e18-e445-c351-19fba18f36de@gmail.com>
From: Claire Chang <tientzu@chromium.org>
Date: Thu, 14 Jan 2021 17:08:24 +0800
X-Gmail-Original-Message-ID: <CALiNf29+8Yi93RacsZHr=qYBhQRwqujW6KZVVD=9xPMhpLH5pA@mail.gmail.com>
Message-ID: <CALiNf29+8Yi93RacsZHr=qYBhQRwqujW6KZVVD=9xPMhpLH5pA@mail.gmail.com>
Subject: Re: [RFC PATCH v3 6/6] of: Add plumbing for restricted DMA pool
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
Cc: heikki.krogerus@linux.intel.com, peterz@infradead.org, grant.likely@arm.com,
 paulus@samba.org, Frank Rowand <frowand.list@gmail.com>, mingo@kernel.org,
 Marek Szyprowski <m.szyprowski@samsung.com>, sstabellini@kernel.org,
 Saravana Kannan <saravanak@google.com>,
 "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>,
 Joerg Roedel <joro@8bytes.org>, " <joro@8bytes.org>,
 rafael.j.wysocki@intel.com, Christoph Hellwig <hch@lst.de>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 xen-devel@lists.xenproject.org, Thierry Reding <treding@nvidia.com>,
 linux-devicetree <devicetree@vger.kernel.org>, will@kernel.org,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, dan.j.williams@intel.com,
 linuxppc-dev@lists.ozlabs.org, Rob Herring <robh+dt@kernel.org>,
 boris.ostrovsky@oracle.com,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, jgross@suse.com,
 Nicolas Boichat <drinkcat@chromium.org>, Greg KH <gregkh@linuxfoundation.org>,
 rdunlap@infradead.org, lkml <linux-kernel@vger.kernel.org>,
 Tomasz Figa <tfiga@chromium.org>,
 "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>,
 Joerg Roedel <joro@8bytes.org>, " <iommu@lists.linux-foundation.org>,
 xypron.glpk@gmx.de, Robin Murphy <robin.murphy@arm.com>,
 bauerman@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jan 13, 2021 at 7:48 AM Florian Fainelli <f.fainelli@gmail.com> wrote:
>
> On 1/5/21 7:41 PM, Claire Chang wrote:
> > If a device is not behind an IOMMU, we look up the device node and set
> > up the restricted DMA when the restricted-dma-pool is presented.
> >
> > Signed-off-by: Claire Chang <tientzu@chromium.org>
> > ---
>
> [snip]
>
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
>
> You could have an early check for count < 0, along with an error
> message, if that is deemed useful.
>
> > +     for (i = 0; i < count; i++) {
> > +             node = of_parse_phandle(dev->of_node, "memory-region", i);
> > +             if (of_device_is_compatible(node, "restricted-dma-pool"))
>
> And you may want to add here an of_device_is_available(node). A platform
> that provides the Device Tree firmware and try to support multiple
> different SoCs may try to determine if an IOMMU is present, and if it
> is, it could be marking the restriced-dma-pool region with a 'status =
> "disabled"' property, or any variant of that scheme.

This function is called only when there is no IOMMU present (check in
drivers/of/device.c). I can still add of_device_is_available(node)
here if you think it's helpful.

>
> > +                     return of_reserved_mem_device_init_by_idx(
> > +                             dev, dev->of_node, i);
>
> This does not seem to be supporting more than one memory region, did not
> you want something like instead:
>
>                 ret = of_reserved_mem_device_init_by_idx(...);
>                 if (ret)
>                         return ret;
>

Yes. This implement only supports one restriced-dma-pool memory region
with the assumption that there is only one memory region with the
compatible string, restricted-dma-pool, in the dts. IIUC, it's similar
to shared-dma-pool.


> > +     }
> > +
> > +     return 0;
> > +}
> > diff --git a/drivers/of/device.c b/drivers/of/device.c
> > index aedfaaafd3e7..e2c7409956ab 100644
> > --- a/drivers/of/device.c
> > +++ b/drivers/of/device.c
> > @@ -182,6 +182,10 @@ int of_dma_configure_id(struct device *dev, struct device_node *np,
> >       arch_setup_dma_ops(dev, dma_start, size, iommu, coherent);
> >
> >       dev->dma_range_map = map;
> > +
> > +     if (!iommu)
> > +             return of_dma_set_restricted_buffer(dev);
> > +
> >       return 0;
> >  }
> >  EXPORT_SYMBOL_GPL(of_dma_configure_id);
> > diff --git a/drivers/of/of_private.h b/drivers/of/of_private.h
> > index d9e6a324de0a..28a2dfa197ba 100644
> > --- a/drivers/of/of_private.h
> > +++ b/drivers/of/of_private.h
> > @@ -161,12 +161,17 @@ struct bus_dma_region;
> >  #if defined(CONFIG_OF_ADDRESS) && defined(CONFIG_HAS_DMA)
> >  int of_dma_get_range(struct device_node *np,
> >               const struct bus_dma_region **map);
> > +int of_dma_set_restricted_buffer(struct device *dev);
> >  #else
> >  static inline int of_dma_get_range(struct device_node *np,
> >               const struct bus_dma_region **map)
> >  {
> >       return -ENODEV;
> >  }
> > +static inline int of_dma_get_restricted_buffer(struct device *dev)
> > +{
> > +     return -ENODEV;
> > +}
> >  #endif
> >
> >  #endif /* _LINUX_OF_PRIVATE_H */
> >
>
>
> --
> Florian
