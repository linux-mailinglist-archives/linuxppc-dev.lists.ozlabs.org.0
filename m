Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C1D5B392E45
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 May 2021 14:49:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FrSMS6N88z303t
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 May 2021 22:49:56 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=XnDncQEf;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::430;
 helo=mail-pf1-x430.google.com; envelope-from=tientzu@chromium.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256
 header.s=google header.b=XnDncQEf; dkim-atps=neutral
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com
 [IPv6:2607:f8b0:4864:20::430])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FrSLy4Yf4z2yZ2
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 May 2021 22:49:27 +1000 (AEST)
Received: by mail-pf1-x430.google.com with SMTP id e17so503132pfl.5
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 May 2021 05:49:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=t9nQbEpq5kzp2vshpX/2KDY0MEdzNS47SlLJX4RAhzA=;
 b=XnDncQEfy0WK93TP5b5iaOvQy6p3tli5hK7U2lnqkRYfpimdp+9WScU0B/bVffV6lu
 KHvuv/cILlR7hwxjPwG4fSm8TLb0M0uiiQtfQGCy1lJiDeCNSlZdr9ro+4UoS7qK25VN
 Vwx6crrIG7NXb3xhmTS0AaKdDSprMjL64yAgA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=t9nQbEpq5kzp2vshpX/2KDY0MEdzNS47SlLJX4RAhzA=;
 b=gEWK1yuOlNs3HiuXEMuD/JoMQBI47qgF0KupjsfxBSVok88MS01qACwjbhnpIz8b04
 AjRqDcVQeTgBOsnSZqp4F3i2QPzbF812XSwiOZdSgHNlWCryxjNp6x4/3z1VCXYRFdmq
 ObTQJ4RmWRFXf4W0d45WJ2xwPA2BY98G1tYavoOP5RVc4uOlk2uaN4Lw99fAZ+G9N9PC
 R+AV5mEw3GIGREj2QDAa2MrSY1ax+j9TAFblkMenRkPET9nzoRiF/h1a/RYirzgAmTOc
 RYUTDOTtgt4VetrhVw4ebLRiYHMtRNGgPwe4kHPMQMbRK71ETiOBclPK9wc4LgikighK
 hmhg==
X-Gm-Message-State: AOAM532yQeRAqCDuQb6x9FhEubfwTmI7fdBcJ94dfHq+9ip00rROxJ8A
 rTwA9OXalCMzJUGlmxdATJLXRxCtUv0OCQ==
X-Google-Smtp-Source: ABdhPJzCqhespfk0eJzKl74zVKWDHZkNVlNtWVzxu9Fm7gafWtJpfxPxUBCnzrJKnTW0nyB64Pb2rw==
X-Received: by 2002:a63:f74b:: with SMTP id f11mr3534645pgk.327.1622119763748; 
 Thu, 27 May 2021 05:49:23 -0700 (PDT)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com.
 [209.85.210.174])
 by smtp.gmail.com with ESMTPSA id x203sm1958223pfc.86.2021.05.27.05.49.22
 for <linuxppc-dev@lists.ozlabs.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 May 2021 05:49:23 -0700 (PDT)
Received: by mail-pf1-f174.google.com with SMTP id d78so483579pfd.10
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 May 2021 05:49:22 -0700 (PDT)
X-Received: by 2002:a92:2907:: with SMTP id l7mr2908573ilg.64.1622119750871;
 Thu, 27 May 2021 05:49:10 -0700 (PDT)
MIME-Version: 1.0
References: <20210518064215.2856977-1-tientzu@chromium.org>
 <20210518064215.2856977-15-tientzu@chromium.org>
 <20210526121322.GA19313@willie-the-truck>
 <20210526155321.GA19633@willie-the-truck>
 <CALiNf2_sVXnb97++yWusB5PWz8Pzfn9bCKZc6z3tY4bx6-nW8w@mail.gmail.com>
 <20210527113456.GA22019@willie-the-truck>
In-Reply-To: <20210527113456.GA22019@willie-the-truck>
From: Claire Chang <tientzu@chromium.org>
Date: Thu, 27 May 2021 20:48:59 +0800
X-Gmail-Original-Message-ID: <CALiNf2_Qk5DmZSJO+jv=m5V-VFtmL9j0v66UY6qKmM-2pr3tRQ@mail.gmail.com>
Message-ID: <CALiNf2_Qk5DmZSJO+jv=m5V-VFtmL9j0v66UY6qKmM-2pr3tRQ@mail.gmail.com>
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

On Thu, May 27, 2021 at 7:35 PM Will Deacon <will@kernel.org> wrote:
>
> On Thu, May 27, 2021 at 07:29:20PM +0800, Claire Chang wrote:
> > On Wed, May 26, 2021 at 11:53 PM Will Deacon <will@kernel.org> wrote:
> > >
> > > On Wed, May 26, 2021 at 01:13:22PM +0100, Will Deacon wrote:
> > > > On Tue, May 18, 2021 at 02:42:14PM +0800, Claire Chang wrote:
> > > > > @@ -138,4 +160,9 @@ one for multimedia processing (named multimedia-memory@77000000, 64MiB).
> > > > >             memory-region = <&multimedia_reserved>;
> > > > >             /* ... */
> > > > >     };
> > > > > +
> > > > > +   pcie_device: pcie_device@0,0 {
> > > > > +           memory-region = <&restricted_dma_mem_reserved>;
> > > > > +           /* ... */
> > > > > +   };
> > > >
> > > > I still don't understand how this works for individual PCIe devices -- how
> > > > is dev->of_node set to point at the node you have above?
> > > >
> > > > I tried adding the memory-region to the host controller instead, and then
> > > > I see it crop up in dmesg:
> > > >
> > > >   | pci-host-generic 40000000.pci: assigned reserved memory node restricted_dma_mem_reserved
> > > >
> > > > but none of the actual PCI devices end up with 'dma_io_tlb_mem' set, and
> > > > so the restricted DMA area is not used. In fact, swiotlb isn't used at all.
> > > >
> > > > What am I missing to make this work with PCIe devices?
> > >
> > > Aha, looks like we're just missing the logic to inherit the DMA
> > > configuration. The diff below gets things working for me.
> >
> > I guess what was missing is the reg property in the pcie_device node.
> > Will update the example dts.
>
> Thanks. I still think something like my diff makes sense, if you wouldn't mind including
> it, as it allows restricted DMA to be used for situations where the PCIe
> topology is not static.
>
> Perhaps we should prefer dev->of_node if it exists, but then use the node
> of the host bridge's parent node otherwise?

Sure. Let me add in the next version.

>
> Will
