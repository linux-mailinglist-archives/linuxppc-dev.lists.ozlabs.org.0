Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DC874392CDE
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 May 2021 13:38:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FrQmk0Qlrz309V
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 May 2021 21:38:14 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=J39qajy3;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::12c;
 helo=mail-il1-x12c.google.com; envelope-from=tientzu@chromium.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256
 header.s=google header.b=J39qajy3; dkim-atps=neutral
Received: from mail-il1-x12c.google.com (mail-il1-x12c.google.com
 [IPv6:2607:f8b0:4864:20::12c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FrQmF3FqHz2xYf
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 May 2021 21:37:48 +1000 (AEST)
Received: by mail-il1-x12c.google.com with SMTP id c2so3169249ilo.11
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 May 2021 04:37:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XepQkdRFyf5QwVg1KdPLbhegPooaNHd/1JiifJ+YyHM=;
 b=J39qajy3UJ3qAzWqGeZGEnwMoSI9LW5BjibS8fd+Acudu4FxBAXa2OhDGjuMcgqW0/
 wo/z5L5WO21v6biwP7ZKEgtIJf223PVujpTOF4zDsL3aPOmxJx+dxaS3A0oSwB4zv/i6
 Jb0bh8tNiRStD2FZiusMVkFxa8G1teBBpM9vg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XepQkdRFyf5QwVg1KdPLbhegPooaNHd/1JiifJ+YyHM=;
 b=cp4NBVPI4Fpp+7mS9gQ+iqYj/bnT3WpYmCBuywIm8KnM2HpEYlHgUF7PGN5mwE6Md9
 iYnk6bONT1wryI2mZ4xzDNugGRvRBO3navNHvzU0Y0RhrydKRgKkDEYqPXYlahsd4nR9
 Gg/7xRMbm5SJ4kaAKZVDywZ8U8EUB9qQ/GxCdKFem5q6ufrvVeLn4WZZYEB5nzKllSUG
 UppLwdq0nh5IwAak3LUxJKJaFebPOgG5P1nQVl+RHkPzQbVqhoa6079Sh6TO0jgB0Qxz
 HWQMR1oHRbKWL9LLaiAOd5V/se04JgWYekCe6WknVPFmdvTA13ySwZNv1pSn9loQPEf1
 5DGw==
X-Gm-Message-State: AOAM530DQ79RITr9iDdFhgDi2+NlV7U77xFmXrxlE9nN9UwvpffJ6Jjr
 pV0q44M+2bbGR/FCGwajE/WTiXcGzca7NQ==
X-Google-Smtp-Source: ABdhPJxljurjOdA1HXRL4uoYgRPpFb6NG7P0HZy0OYDyxWQiTtOi78xKGyjZr1eaLQ7CbpZ54QmUoQ==
X-Received: by 2002:a92:ca0a:: with SMTP id j10mr2592905ils.154.1622115463566; 
 Thu, 27 May 2021 04:37:43 -0700 (PDT)
Received: from mail-il1-f177.google.com (mail-il1-f177.google.com.
 [209.85.166.177])
 by smtp.gmail.com with ESMTPSA id s10sm1072711ilu.34.2021.05.27.04.37.43
 for <linuxppc-dev@lists.ozlabs.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 May 2021 04:37:43 -0700 (PDT)
Received: by mail-il1-f177.google.com with SMTP id m1so3780782ilg.10
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 May 2021 04:37:43 -0700 (PDT)
X-Received: by 2002:a05:6e02:e42:: with SMTP id
 l2mr2536928ilk.189.1622114971302; 
 Thu, 27 May 2021 04:29:31 -0700 (PDT)
MIME-Version: 1.0
References: <20210518064215.2856977-1-tientzu@chromium.org>
 <20210518064215.2856977-15-tientzu@chromium.org>
 <20210526121322.GA19313@willie-the-truck>
 <20210526155321.GA19633@willie-the-truck>
In-Reply-To: <20210526155321.GA19633@willie-the-truck>
From: Claire Chang <tientzu@chromium.org>
Date: Thu, 27 May 2021 19:29:20 +0800
X-Gmail-Original-Message-ID: <CALiNf2_sVXnb97++yWusB5PWz8Pzfn9bCKZc6z3tY4bx6-nW8w@mail.gmail.com>
Message-ID: <CALiNf2_sVXnb97++yWusB5PWz8Pzfn9bCKZc6z3tY4bx6-nW8w@mail.gmail.com>
Subject: Re: [PATCH v7 14/15] dt-bindings: of: Add restricted DMA pool
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
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
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

On Wed, May 26, 2021 at 11:53 PM Will Deacon <will@kernel.org> wrote:
>
> On Wed, May 26, 2021 at 01:13:22PM +0100, Will Deacon wrote:
> > On Tue, May 18, 2021 at 02:42:14PM +0800, Claire Chang wrote:
> > > @@ -138,4 +160,9 @@ one for multimedia processing (named multimedia-memory@77000000, 64MiB).
> > >             memory-region = <&multimedia_reserved>;
> > >             /* ... */
> > >     };
> > > +
> > > +   pcie_device: pcie_device@0,0 {
> > > +           memory-region = <&restricted_dma_mem_reserved>;
> > > +           /* ... */
> > > +   };
> >
> > I still don't understand how this works for individual PCIe devices -- how
> > is dev->of_node set to point at the node you have above?
> >
> > I tried adding the memory-region to the host controller instead, and then
> > I see it crop up in dmesg:
> >
> >   | pci-host-generic 40000000.pci: assigned reserved memory node restricted_dma_mem_reserved
> >
> > but none of the actual PCI devices end up with 'dma_io_tlb_mem' set, and
> > so the restricted DMA area is not used. In fact, swiotlb isn't used at all.
> >
> > What am I missing to make this work with PCIe devices?
>
> Aha, looks like we're just missing the logic to inherit the DMA
> configuration. The diff below gets things working for me.

I guess what was missing is the reg property in the pcie_device node.
Will update the example dts.
