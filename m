Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E75AD368B4D
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Apr 2021 04:53:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FRJlN6Zpmz309l
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Apr 2021 12:53:52 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=HdsQJQRk;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::1035;
 helo=mail-pj1-x1035.google.com; envelope-from=tientzu@chromium.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256
 header.s=google header.b=HdsQJQRk; dkim-atps=neutral
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com
 [IPv6:2607:f8b0:4864:20::1035])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FRJkw4zh9z2xZs
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Apr 2021 12:53:25 +1000 (AEST)
Received: by mail-pj1-x1035.google.com with SMTP id
 f11-20020a17090a638bb02901524d3a3d48so416988pjj.3
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Apr 2021 19:53:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=40nhsz+kltJTf7tq6pLLkes92lT1dy5Rll207DlKzWM=;
 b=HdsQJQRkixDre+dpQSVR58nl8K7T4MbrI4XmlnSivkYb875qGKmhwngqhS/XX43exh
 bg5Ne9Oub0puKLH8FRaSSn/FCuQxwpgf1ynisAFuTF4Wvjhe+t5iF+WotV6g96hB8Oro
 fWaQA0hAXWZxawu4WTORJsnwcVbFEg+0cCZO8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=40nhsz+kltJTf7tq6pLLkes92lT1dy5Rll207DlKzWM=;
 b=EGTBnV8Nubl18vZompn4yMUapZpbQQATd8zJIe1I5EmkHq1EgGUdvCA4V6UGMwFHgl
 b2Os0ciGil9/plMujJTXwuyQ3+lDo0Qt1rIL6J/WQcP/9s6P/MJUfFd6ACMS4pP+ucRR
 HWJEg2DsYyIn2RT180v5qUMX6CE14ZTSq3fgABGGfHYcAXJ1vkI2DUelO+2wijbFX9GD
 HXJqLDx0Hiqo3u7FwH4GyTAOJWCgNlMF+c0F2dDIIksp/u31IvgE/yMlfBMtFkOy+kHm
 wCA0WZzI8LoIMtbPyNe3aofk5TXSar+aBUSx9FnD5evPuGqax2nZEsgYxfL13KIFpn2B
 HkZw==
X-Gm-Message-State: AOAM531UDwMvox1e5mqdBgAU7a+X6cchH9Dmc95pu7IVveEEgJSdAWul
 eTNJBywd6hriF0Sgjh2LAnwijMXQHmKaWg==
X-Google-Smtp-Source: ABdhPJynVnhaX5HfrTopCAvx8ISH4T7TsOizJVXalp8K0AoYziNYcsGA9gjZKA3O6Ux2BrKdz2oDwg==
X-Received: by 2002:a17:90a:f2d7:: with SMTP id
 gt23mr3224926pjb.199.1619146400883; 
 Thu, 22 Apr 2021 19:53:20 -0700 (PDT)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com.
 [209.85.210.181])
 by smtp.gmail.com with ESMTPSA id ne22sm6106272pjb.5.2021.04.22.19.53.20
 for <linuxppc-dev@lists.ozlabs.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Apr 2021 19:53:20 -0700 (PDT)
Received: by mail-pf1-f181.google.com with SMTP id y62so480691pfg.4
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Apr 2021 19:53:20 -0700 (PDT)
X-Received: by 2002:a6b:c913:: with SMTP id z19mr1627785iof.50.1619146389385; 
 Thu, 22 Apr 2021 19:53:09 -0700 (PDT)
MIME-Version: 1.0
References: <20210422081508.3942748-1-tientzu@chromium.org>
 <20210422081508.3942748-17-tientzu@chromium.org>
In-Reply-To: <20210422081508.3942748-17-tientzu@chromium.org>
From: Claire Chang <tientzu@chromium.org>
Date: Fri, 23 Apr 2021 10:52:58 +0800
X-Gmail-Original-Message-ID: <CALiNf29NzRTRB-0JbCL7=0qF0SAiER_pJ_-SCtVRA7DHCsSpEg@mail.gmail.com>
Message-ID: <CALiNf29NzRTRB-0JbCL7=0qF0SAiER_pJ_-SCtVRA7DHCsSpEg@mail.gmail.com>
Subject: Re: [PATCH v5 16/16] of: Add plumbing for restricted DMA pool
To: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
 Frank Rowand <frowand.list@gmail.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, 
 boris.ostrovsky@oracle.com, jgross@suse.com, Christoph Hellwig <hch@lst.de>, 
 Marek Szyprowski <m.szyprowski@samsung.com>
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
 grant.likely@arm.com, paulus@samba.org, mingo@kernel.org, jxgao@google.com,
 sstabellini@kernel.org, Saravana Kannan <saravanak@google.com>,
 xypron.glpk@gmx.de, "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>, bskeggs@redhat.com,
 linux-pci@vger.kernel.org, xen-devel@lists.xenproject.org,
 Thierry Reding <treding@nvidia.com>, intel-gfx@lists.freedesktop.org,
 matthew.auld@intel.com, linux-devicetree <devicetree@vger.kernel.org>,
 daniel@ffwll.ch, airlied@linux.ie, maarten.lankhorst@linux.intel.com,
 linuxppc-dev@lists.ozlabs.org, jani.nikula@linux.intel.com,
 Nicolas Boichat <drinkcat@chromium.org>, rodrigo.vivi@intel.com,
 bhelgaas@google.com, Dan Williams <dan.j.williams@intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 nouveau@lists.freedesktop.org, Greg KH <gregkh@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>, lkml <linux-kernel@vger.kernel.org>,
 Tomasz Figa <tfiga@chromium.org>,
 "list@263.net:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
 Jim Quinlan <james.quinlan@broadcom.com>, Robin Murphy <robin.murphy@arm.com>,
 bauerman@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Apr 22, 2021 at 4:17 PM Claire Chang <tientzu@chromium.org> wrote:
>
> If a device is not behind an IOMMU, we look up the device node and set
> up the restricted DMA when the restricted-dma-pool is presented.
>
> Signed-off-by: Claire Chang <tientzu@chromium.org>
> ---
>  drivers/of/address.c    | 25 +++++++++++++++++++++++++
>  drivers/of/device.c     |  3 +++
>  drivers/of/of_private.h |  5 +++++
>  3 files changed, 33 insertions(+)
>
> diff --git a/drivers/of/address.c b/drivers/of/address.c
> index 54f221dde267..fff3adfe4986 100644
> --- a/drivers/of/address.c
> +++ b/drivers/of/address.c
> @@ -8,6 +8,7 @@
>  #include <linux/logic_pio.h>
>  #include <linux/module.h>
>  #include <linux/of_address.h>
> +#include <linux/of_reserved_mem.h>
>  #include <linux/pci.h>
>  #include <linux/pci_regs.h>
>  #include <linux/sizes.h>
> @@ -1109,6 +1110,30 @@ bool of_dma_is_coherent(struct device_node *np)
>  }
>  EXPORT_SYMBOL_GPL(of_dma_is_coherent);
>
> +int of_dma_set_restricted_buffer(struct device *dev)
> +{
> +       struct device_node *node;
> +       int count, i;
> +
> +       if (!dev->of_node)
> +               return 0;
> +
> +       count = of_property_count_elems_of_size(dev->of_node, "memory-region",
> +                                               sizeof(phandle));
> +       for (i = 0; i < count; i++) {
> +               node = of_parse_phandle(dev->of_node, "memory-region", i);
> +               /* There might be multiple memory regions, but only one
> +                * restriced-dma-pool region is allowed.
> +                */
> +               if (of_device_is_compatible(node, "restricted-dma-pool") &&
> +                   of_device_is_available(node))
> +                       return of_reserved_mem_device_init_by_idx(
> +                               dev, dev->of_node, i);
> +       }
> +
> +       return 0;
> +}
> +
>  /**
>   * of_mmio_is_nonposted - Check if device uses non-posted MMIO
>   * @np:        device node
> diff --git a/drivers/of/device.c b/drivers/of/device.c
> index c5a9473a5fb1..d8d865223e51 100644
> --- a/drivers/of/device.c
> +++ b/drivers/of/device.c
> @@ -165,6 +165,9 @@ int of_dma_configure_id(struct device *dev, struct device_node *np,
>
>         arch_setup_dma_ops(dev, dma_start, size, iommu, coherent);
>
> +       if (!iommu)
> +               return of_dma_set_restricted_buffer(dev);
> +
>         return 0;
>  }
>  EXPORT_SYMBOL_GPL(of_dma_configure_id);
> diff --git a/drivers/of/of_private.h b/drivers/of/of_private.h
> index d717efbd637d..e9237f5eff48 100644
> --- a/drivers/of/of_private.h
> +++ b/drivers/of/of_private.h
> @@ -163,12 +163,17 @@ struct bus_dma_region;
>  #if defined(CONFIG_OF_ADDRESS) && defined(CONFIG_HAS_DMA)
>  int of_dma_get_range(struct device_node *np,
>                 const struct bus_dma_region **map);
> +int of_dma_set_restricted_buffer(struct device *dev);
>  #else
>  static inline int of_dma_get_range(struct device_node *np,
>                 const struct bus_dma_region **map)
>  {
>         return -ENODEV;
>  }
> +static inline int of_dma_get_restricted_buffer(struct device *dev)

This one should be of_dma_set_restricted_buffer. Sorry for the typo.

> +{
> +       return -ENODEV;
> +}
>  #endif
>
>  #endif /* _LINUX_OF_PRIVATE_H */
> --
> 2.31.1.368.gbe11c130af-goog
>
