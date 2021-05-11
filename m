Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6235437AC3D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 May 2021 18:43:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FfkJq3193z3c1T
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 May 2021 02:43:55 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=jF9yywwe;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::42a;
 helo=mail-pf1-x42a.google.com; envelope-from=tientzu@chromium.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256
 header.s=google header.b=jF9yywwe; dkim-atps=neutral
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com
 [IPv6:2607:f8b0:4864:20::42a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FfkHf2KPtz301X
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 May 2021 02:42:54 +1000 (AEST)
Received: by mail-pf1-x42a.google.com with SMTP id q2so16434594pfh.13
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 May 2021 09:42:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Ll12iwWOH+g7rF+Qcvmc/ZPVWK50RY5A+TnwOnViek8=;
 b=jF9yywweDau5byF0sr7SVkFA9hoYDaWzF8iy+wyA9wHf9oOaCvA+67rLL4jVjSY9gn
 QoY25mdgO7IV1eEXpAEk5s63+vTygeFS39HRXfLrmhNXD74fIDm9qeLodCWWHbiJG3ic
 G2KrYNbeLupAhGANRLweLDvdOuGV9VrSQUJi8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Ll12iwWOH+g7rF+Qcvmc/ZPVWK50RY5A+TnwOnViek8=;
 b=R5SdXiP6La6USYH3HnEVHEgwfslNSAja7sQtOlEd/cEHr4S+7waiSySgqfa+N0f8tG
 olOeRRl+7DlQm9efSJwdjE+A3X5l8LPm+pSRPdSdcBMrxbih6pEcO2SzRMNgQxMa9DqK
 HAWZkCx1g58q1gcPVzrvZBHo2r5O9FLxQBy/5EfEgcxBIubHPk2bdvcCTzMzdKo3wYSI
 +C7da8hl/M2bATgtVVbMSAB+ji8tmqan3LEX6V4ltLl24vbmkf3AOBudJ8ukJ8Qd63Xa
 sWwY3lLBiEfx3k2v72b7ECQBQaId/3WWj7b4JYXdAX7CsmFCaORViw5QDr64yZVCOj5b
 FY5Q==
X-Gm-Message-State: AOAM530cVTrP7LI9Qr5jOQANa2FaAglYUcs3bBGl/YYW0OgRM5dCUI+y
 Shi/Slx5KNw9P75tZFJdkHFH5bASGWAAKw==
X-Google-Smtp-Source: ABdhPJyF7ubGPp+Wac6vlhaR+ThUtEiOfg2yBshg2qWeXLDlHsWkh4/JQSjDaJCscnAa5IdK0R4tRQ==
X-Received: by 2002:a63:610b:: with SMTP id v11mr31161382pgb.291.1620751371560; 
 Tue, 11 May 2021 09:42:51 -0700 (PDT)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com.
 [209.85.210.172])
 by smtp.gmail.com with ESMTPSA id t19sm14680253pjs.23.2021.05.11.09.42.50
 for <linuxppc-dev@lists.ozlabs.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 May 2021 09:42:51 -0700 (PDT)
Received: by mail-pf1-f172.google.com with SMTP id c17so16499654pfn.6
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 May 2021 09:42:50 -0700 (PDT)
X-Received: by 2002:a05:6e02:e82:: with SMTP id
 t2mr17831684ilj.18.1620751359226; 
 Tue, 11 May 2021 09:42:39 -0700 (PDT)
MIME-Version: 1.0
References: <20210510095026.3477496-1-tientzu@chromium.org>
 <20210510095026.3477496-5-tientzu@chromium.org>
 <20210510150256.GC28066@lst.de>
In-Reply-To: <20210510150256.GC28066@lst.de>
From: Claire Chang <tientzu@chromium.org>
Date: Wed, 12 May 2021 00:42:28 +0800
X-Gmail-Original-Message-ID: <CALiNf28jgAU7zN4pwgPKgaecM-KXRHHqwHj4sPXVf_3M0-goMQ@mail.gmail.com>
Message-ID: <CALiNf28jgAU7zN4pwgPKgaecM-KXRHHqwHj4sPXVf_3M0-goMQ@mail.gmail.com>
Subject: Re: [PATCH v6 04/15] swiotlb: Add restricted DMA pool initialization
To: Christoph Hellwig <hch@lst.de>
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
 Nicolas Boichat <drinkcat@chromium.org>, nouveau@lists.freedesktop.org,
 Greg KH <gregkh@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>,
 lkml <linux-kernel@vger.kernel.org>, Tomasz Figa <tfiga@chromium.org>,
 "list@263.net:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
 Jim Quinlan <james.quinlan@broadcom.com>, xypron.glpk@gmx.de,
 Robin Murphy <robin.murphy@arm.com>, bauerman@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, May 10, 2021 at 11:03 PM Christoph Hellwig <hch@lst.de> wrote:
>
> > +#ifdef CONFIG_DMA_RESTRICTED_POOL
> > +#include <linux/io.h>
> > +#include <linux/of.h>
> > +#include <linux/of_fdt.h>
> > +#include <linux/of_reserved_mem.h>
> > +#include <linux/slab.h>
> > +#endif
>
> I don't think any of this belongs into swiotlb.c.  Marking
> swiotlb_init_io_tlb_mem non-static and having all this code in a separate
> file is probably a better idea.

Will do in the next version.

>
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
>
> This is not the normal kernel comment style.

Will fix this in the next version.

>
> > +#ifdef CONFIG_ARM
> > +             if (!PageHighMem(pfn_to_page(PHYS_PFN(rmem->base)))) {
> > +                     kfree(mem);
> > +                     return -EINVAL;
> > +             }
> > +#endif /* CONFIG_ARM */
>
> And this is weird.  Why would ARM have such a restriction?  And if we have
> such rstrictions it absolutely belongs into an arch helper.

Now I think the CONFIG_ARM can just be removed?
The goal here is to make sure we're using linear map and can safely
use phys_to_dma/dma_to_phys.

>
> > +             swiotlb_init_io_tlb_mem(mem, rmem->base, nslabs, false);
> > +
> > +             rmem->priv = mem;
> > +
> > +#ifdef CONFIG_DEBUG_FS
> > +             if (!debugfs_dir)
> > +                     debugfs_dir = debugfs_create_dir("swiotlb", NULL);
> > +
> > +             swiotlb_create_debugfs(mem, rmem->name, debugfs_dir);
>
> Doesn't the debugfs_create_dir belong into swiotlb_create_debugfs?  Also
> please use IS_ENABLEd or a stub to avoid ifdefs like this.

Will move it into swiotlb_create_debugfs and use IS_ENABLED in the next version.
