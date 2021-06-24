Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DC46F3B3391
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Jun 2021 18:07:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G9lQF52KGz3c6v
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Jun 2021 02:07:17 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=V1DUMk4p;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::d29;
 helo=mail-io1-xd29.google.com; envelope-from=tientzu@chromium.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256
 header.s=google header.b=V1DUMk4p; dkim-atps=neutral
Received: from mail-io1-xd29.google.com (mail-io1-xd29.google.com
 [IPv6:2607:f8b0:4864:20::d29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G9lPl46W6z2xYx
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Jun 2021 02:06:48 +1000 (AEST)
Received: by mail-io1-xd29.google.com with SMTP id s19so8895851ioc.3
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Jun 2021 09:06:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OUC0E76X92PmzUvBM3M58z5qjgzPKxJvrlMYIlH3t/A=;
 b=V1DUMk4pWXUrJHEg/9Kd4ukoLxbJGeXfb8ZAhSFnF6RVbF8t2Z5J1ymG4niuoHNq4v
 lR13PRE87YP1jrN3LaPEaViS+9EA9qGG/k81iCPvzgmr34ySIt4SvvmFKyoWhdSPE98X
 KaxkIr3Pk6gTC5BkELMIeQJS2sWcVoDywrhkk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OUC0E76X92PmzUvBM3M58z5qjgzPKxJvrlMYIlH3t/A=;
 b=MYLVKcFlVjAJQxOnSkSJeLpiRbo3bHMgqKz3tiZD0ITIm3mvNmyihxPaiGv8FsGUrV
 rCEh+2KKyDmd+e7poQxlKAW/vkHFLBAEyaKRc0n3AFybRYUbvi5HCYb47cpKzB+oquJS
 Qj8nQnpoS/T9Zc/+wJGU0rIrRJ17gUXS83NOGwnCqMVNpz3hMZJDTf7R2w9XC4WGmWDB
 K1U6/ZGpoE9bWYmcQBAIE737M1WRfIdUSUeJuW/E4q9DW3aqHYFdur6fHCWtPQz7L6fL
 w2PVLhUKWyaTsOd+6e4yAygjqBBGHjHuaFyWTvr6p9s5877HaDRq28tcGMCRdPS95aH4
 1wCw==
X-Gm-Message-State: AOAM5336R3uFfyRgcRMB6DVraSMCI1bH9kMe+atPqvNUvi+S0ObFEJeB
 ZxrHSTSFdn2JnCh1Ft/H5bE/SWsTQ20pzw==
X-Google-Smtp-Source: ABdhPJy2H1MKX/CHaVDIHmKD1c0l0WSAJZ+64c6jXoWJqnj5BGwCNNdyD2G8iTW66rRSsSaXANs83A==
X-Received: by 2002:a6b:f20c:: with SMTP id q12mr4662783ioh.72.1624550804493; 
 Thu, 24 Jun 2021 09:06:44 -0700 (PDT)
Received: from mail-il1-f181.google.com (mail-il1-f181.google.com.
 [209.85.166.181])
 by smtp.gmail.com with ESMTPSA id j8sm1965468ilq.34.2021.06.24.09.06.44
 for <linuxppc-dev@lists.ozlabs.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Jun 2021 09:06:44 -0700 (PDT)
Received: by mail-il1-f181.google.com with SMTP id s19so6890359ilj.1
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Jun 2021 09:06:44 -0700 (PDT)
X-Received: by 2002:a92:9509:: with SMTP id y9mr4122371ilh.18.1624550347935;
 Thu, 24 Jun 2021 08:59:07 -0700 (PDT)
MIME-Version: 1.0
References: <76c3343d-72e5-9df3-8924-5474ee698ef4@quicinc.com>
 <20210623183736.GA472@willie-the-truck>
 <19d4c7a2-744d-21e0-289c-a576e1f0e6f3@quicinc.com>
 <20210624054315.GA25381@lst.de>
 <CALiNf288ZLMhY3E8E3N+z9rkwi1viWNLm1wwMEwT4rNwh3FfwQ@mail.gmail.com>
 <364e6715-eafd-fc4a-e0af-ce2a042756b4@arm.com>
 <20210624111855.GA1382@willie-the-truck>
 <452155d2-c98e-23f6-86d6-3a2ff2e74783@arm.com>
 <20210624114829.GB1382@willie-the-truck>
 <43ec9dd6-12c0-98ec-8d5d-b2904292721e@quicinc.com>
 <YNSq56zyJ7EYdTcI@char.us.oracle.com>
In-Reply-To: <YNSq56zyJ7EYdTcI@char.us.oracle.com>
From: Claire Chang <tientzu@chromium.org>
Date: Thu, 24 Jun 2021 23:58:57 +0800
X-Gmail-Original-Message-ID: <CALiNf2_WCVodEZJz9PaCTgk_c8LpOAcD4=YZTLDMVyorJs3ESQ@mail.gmail.com>
Message-ID: <CALiNf2_WCVodEZJz9PaCTgk_c8LpOAcD4=YZTLDMVyorJs3ESQ@mail.gmail.com>
Subject: Re: [PATCH v14 06/12] swiotlb: Use is_swiotlb_force_bounce for
 swiotlb data bouncing
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
Cc: heikki.krogerus@linux.intel.com,
 linux-devicetree <devicetree@vger.kernel.org>, peterz@infradead.org,
 joonas.lahtinen@linux.intel.com, dri-devel@lists.freedesktop.org,
 chris@chris-wilson.co.uk, grant.likely@arm.com, paulus@samba.org,
 Frank Rowand <frowand.list@gmail.com>, mingo@kernel.org,
 Jianxiong Gao <jxgao@google.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Saravana Kannan <saravanak@google.com>, Joerg Roedel <joro@8bytes.org>,
 "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
 Christoph Hellwig <hch@lst.de>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>, bskeggs@redhat.com,
 linux-pci@vger.kernel.org, xen-devel@lists.xenproject.org,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Dan Williams <dan.j.williams@intel.com>, matthew.auld@intel.com,
 Nicolas Boichat <drinkcat@chromium.org>, thomas.hellstrom@linux.intel.com,
 Jim Quinlan <james.quinlan@broadcom.com>, Will Deacon <will@kernel.org>,
 intel-gfx@lists.freedesktop.org, maarten.lankhorst@linux.intel.com,
 jani.nikula@linux.intel.com, Rob Herring <robh+dt@kernel.org>,
 rodrigo.vivi@intel.com, Bjorn Helgaas <bhelgaas@google.com>,
 boris.ostrovsky@oracle.com,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, jgross@suse.com,
 airlied@linux.ie, Thierry Reding <treding@nvidia.com>,
 linuxppc-dev@lists.ozlabs.org, Randy Dunlap <rdunlap@infradead.org>,
 Qian Cai <quic_qiancai@quicinc.com>, Greg KH <gregkh@linuxfoundation.org>,
 lkml <linux-kernel@vger.kernel.org>,
 "list@263.net:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
 Daniel Vetter <daniel@ffwll.ch>, xypron.glpk@gmx.de,
 Tom Lendacky <thomas.lendacky@amd.com>, Robin Murphy <robin.murphy@arm.com>,
 bauerman@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jun 24, 2021 at 11:56 PM Konrad Rzeszutek Wilk
<konrad.wilk@oracle.com> wrote:
>
> On Thu, Jun 24, 2021 at 10:10:51AM -0400, Qian Cai wrote:
> >
> >
> > On 6/24/2021 7:48 AM, Will Deacon wrote:
> > > Ok, diff below which attempts to tackle the offset issue I mentioned as
> > > well. Qian Cai -- please can you try with these changes?
> >
> > This works fine.
>
> Cool. Let me squash this patch in #6 and rebase the rest of them.
>
> Claire, could you check the devel/for-linus-5.14 say by end of today to
> double check that I didn't mess anything up please?

I just submitted v15 here
(https://lore.kernel.org/patchwork/cover/1451322/) in case it's
helpful.
I'll double check of course. Thanks for the efforts!

>
> Will,
>
> Thank you for generating the fix! I am going to run it on x86 and Xen
> to make sure all is good (granted last time I ran devel/for-linus-5.14
> on that setup I didn't see any errors so I need to double check
> I didn't do something silly like run a wrong kernel).
>
>
> >
> > >
> > > Will
> > >
> > > --->8
> > >
> > > diff --git a/include/linux/swiotlb.h b/include/linux/swiotlb.h
> > > index 175b6c113ed8..39284ff2a6cd 100644
> > > --- a/include/linux/swiotlb.h
> > > +++ b/include/linux/swiotlb.h
> > > @@ -116,7 +116,9 @@ static inline bool is_swiotlb_buffer(struct device *dev, phys_addr_t paddr)
> > >
> > >  static inline bool is_swiotlb_force_bounce(struct device *dev)
> > >  {
> > > -       return dev->dma_io_tlb_mem->force_bounce;
> > > +       struct io_tlb_mem *mem = dev->dma_io_tlb_mem;
> > > +
> > > +       return mem && mem->force_bounce;
> > >  }
> > >
> > >  void __init swiotlb_exit(void);
> > > diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
> > > index 44be8258e27b..0ffbaae9fba2 100644
> > > --- a/kernel/dma/swiotlb.c
> > > +++ b/kernel/dma/swiotlb.c
> > > @@ -449,6 +449,7 @@ static int swiotlb_find_slots(struct device *dev, phys_addr_t orig_addr,
> > >                 dma_get_min_align_mask(dev) & ~(IO_TLB_SIZE - 1);
> > >         unsigned int nslots = nr_slots(alloc_size), stride;
> > >         unsigned int index, wrap, count = 0, i;
> > > +       unsigned int offset = swiotlb_align_offset(dev, orig_addr);
> > >         unsigned long flags;
> > >
> > >         BUG_ON(!nslots);
> > > @@ -497,7 +498,7 @@ static int swiotlb_find_slots(struct device *dev, phys_addr_t orig_addr,
> > >         for (i = index; i < index + nslots; i++) {
> > >                 mem->slots[i].list = 0;
> > >                 mem->slots[i].alloc_size =
> > > -                       alloc_size - ((i - index) << IO_TLB_SHIFT);
> > > +                       alloc_size - (offset + ((i - index) << IO_TLB_SHIFT));
> > >         }
> > >         for (i = index - 1;
> > >              io_tlb_offset(i) != IO_TLB_SEGSIZE - 1 &&
> > >
