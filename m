Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 23CA42ED602
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Jan 2021 18:50:00 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DBYfF1Z94zDqf0
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Jan 2021 04:49:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::d33;
 helo=mail-io1-xd33.google.com; envelope-from=tientzu@chromium.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256
 header.s=google header.b=TmrbFqeM; dkim-atps=neutral
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com
 [IPv6:2607:f8b0:4864:20::d33])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DBYcQ452kzDqVm
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 Jan 2021 04:48:22 +1100 (AEDT)
Received: by mail-io1-xd33.google.com with SMTP id i18so7007380ioa.1
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 07 Jan 2021 09:48:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+0HS3c+10kITlDelN9sS9O+z0w2Ups5kLpisbgPnIuQ=;
 b=TmrbFqeMmnksB1vaMhBMwmgHvojsvOdZ6TLQjSgGvlt9aJwr9bFzrlNmZkoEKaXZrA
 BzhRl+J0o1KlSCMk8lZODbp2N6pkKBO2ZLOdx2Na4jfQSKA1o8yFNpUtcIwDAMJ6DBdH
 07WtF3X92be4zrXT7ssItC8OK2EEQXGttgp4E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+0HS3c+10kITlDelN9sS9O+z0w2Ups5kLpisbgPnIuQ=;
 b=DhjAOOzVkEl0Se3mpr3xVkcVls11Iy0ebdi6cExqE32L6iU5xxVAfE8WLDeJcZYLOB
 AC6ctALhTjcxye+AwXAf6iWAO5M9qWh7B++VQUqslWIWwROdbdMVzHJc4cdjdmwE6cvN
 2H9GHGaMRq4VgHodmqQGFWgJgz/P49N0Hcw3BzVF4nF8d6q88LJCiztdG6EefkFo+TmC
 W6L0KMmDiKqcqcJ9+YoYiNEWeL2Aj1f0FCtYc0qEGxxdh/Ozg4AlefV5M+eb7W/oHDdd
 M1vpqIhCLmrKEkAnTljaEwNoRd9RlIFVU5SveOq3oYvHSVgg5qlwUlzL0vuvUKdFxdHA
 yeOw==
X-Gm-Message-State: AOAM531N2p+4ZWrAgRk6hYM0hJ+fZfeyWKOEEQ9mbNUEjELMfQEk15E+
 AGniAREWQTqFAVQ9XYn/Ehn/CmH558twFWXy
X-Google-Smtp-Source: ABdhPJy7fsfpFulBqaOhLvBv92xPKazVWyoPKBMsm7k3K9aZu0oJY3j5fWDn4E7MNoKP6j0NY9AhMA==
X-Received: by 2002:a02:cc54:: with SMTP id i20mr8979356jaq.136.1610041699309; 
 Thu, 07 Jan 2021 09:48:19 -0800 (PST)
Received: from mail-io1-f51.google.com (mail-io1-f51.google.com.
 [209.85.166.51])
 by smtp.gmail.com with ESMTPSA id l78sm5189118ild.30.2021.01.07.09.48.18
 for <linuxppc-dev@lists.ozlabs.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Jan 2021 09:48:19 -0800 (PST)
Received: by mail-io1-f51.google.com with SMTP id n4so6936479iow.12
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 07 Jan 2021 09:48:18 -0800 (PST)
X-Received: by 2002:a92:9ada:: with SMTP id c87mr10270546ill.5.1610041194703; 
 Thu, 07 Jan 2021 09:39:54 -0800 (PST)
MIME-Version: 1.0
References: <20210106034124.30560-1-tientzu@chromium.org>
 <20210106034124.30560-6-tientzu@chromium.org>
 <20210106185757.GB109735@localhost.localdomain>
In-Reply-To: <20210106185757.GB109735@localhost.localdomain>
From: Claire Chang <tientzu@chromium.org>
Date: Fri, 8 Jan 2021 01:39:43 +0800
X-Gmail-Original-Message-ID: <CALiNf2_dV13jbHqLt-r1eK+dtOcAKBGcWQCVMQn+eL6MuOrETQ@mail.gmail.com>
Message-ID: <CALiNf2_dV13jbHqLt-r1eK+dtOcAKBGcWQCVMQn+eL6MuOrETQ@mail.gmail.com>
Subject: Re: [RFC PATCH v3 5/6] dt-bindings: of: Add restricted DMA pool
To: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
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
 dan.j.williams@intel.com, linuxppc-dev@lists.ozlabs.org,
 Rob Herring <robh+dt@kernel.org>, boris.ostrovsky@oracle.com,
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

On Thu, Jan 7, 2021 at 2:58 AM Konrad Rzeszutek Wilk
<konrad.wilk@oracle.com> wrote:
>
> On Wed, Jan 06, 2021 at 11:41:23AM +0800, Claire Chang wrote:
> > Introduce the new compatible string, restricted-dma-pool, for restricted
> > DMA. One can specify the address and length of the restricted DMA memory
> > region by restricted-dma-pool in the device tree.
> >
> > Signed-off-by: Claire Chang <tientzu@chromium.org>
> > ---
> >  .../reserved-memory/reserved-memory.txt       | 24 +++++++++++++++++++
> >  1 file changed, 24 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt b/Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt
> > index e8d3096d922c..44975e2a1fd2 100644
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
> > +          system memory corruption, the system needs to provide way to restrict
> > +          the DMA to a predefined memory region.
>
> Heya!
>
> I think I am missing something obvious here so please bear with my
> questions:
>
>  - This code adds the means of having the SWIOTLB pool tied to a specific
>    memory correct?

It doesn't affect the existing SWIOTLB. It just utilizes the existing SWIOTLB
code to create another DMA pool tied to a specific memory region for a given set
of devices. It bounces the streaming DMA (map/unmap) in and out of that region
and does the memory allocation (dma_direct_alloc) from the same region.

>
>
>  - Nothing stops the physical device from bypassing the SWIOTLB buffer.
>    That is if an errant device screwed up the length or DMA address, the
>    SWIOTLB would gladly do what the device told it do?

So the system needs to provide a way to lock down the memory access, e.g. MPU.

>
>  - This has to be combined with SWIOTLB-force-ish to always use the
>    bounce buffer, otherwise you could still do DMA without using
>    SWIOTLB (by not hitting the criteria for needing to use SWIOTLB)?

Since restricted DMA is for the devices that are not behind an IOMMU, I change
the criteria
`if (unlikely(swiotlb_force == SWIOTLB_FORCE))`
to
`if (unlikely(swiotlb_force == SWIOTLB_FORCE) || dev->dma_io_tlb_mem)`
in dma_direct_map_page().

Also, even if SWIOTLB=force, the restricted DMA pool is preferred if available
(get_io_tlb_mem in https://lore.kernel.org/patchwork/patch/1360995/).

Thanks!
