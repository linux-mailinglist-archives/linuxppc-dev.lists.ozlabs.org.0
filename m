Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A4E092F5CDF
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Jan 2021 10:08:06 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DGdkq0JDZzDrfg
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Jan 2021 20:08:03 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::533;
 helo=mail-pg1-x533.google.com; envelope-from=tientzu@chromium.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256
 header.s=google header.b=X7SGbsqs; dkim-atps=neutral
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com
 [IPv6:2607:f8b0:4864:20::533])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DGdj26Jk0zDrSt
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Jan 2021 20:06:25 +1100 (AEDT)
Received: by mail-pg1-x533.google.com with SMTP id c132so3357324pga.3
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Jan 2021 01:06:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=r2clGFKfMvWdEL24a/hrPW/SoKgcT/5YZOK8G2tupLA=;
 b=X7SGbsqsGRlUtP0PJCg54RJ4TAlmaAHUG3xPdqjVb0oScLVfStGatbndpS03GsNgnP
 Ay7KF7sGV28MuK8UBUQD50tmV7MICCg9iHgn3dDmdiN2V0+w2jb02zv0Fvhtiq/Aou7X
 FWO4E0ky5/69bheieFiKWNwRnHzuorBEbyewE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=r2clGFKfMvWdEL24a/hrPW/SoKgcT/5YZOK8G2tupLA=;
 b=Gd61tGkguUhlAH4sIiabTpr9WsuPVcsxZHkl7jJNd0/hXm6m4MGz3Ueb8wLVDwR+YC
 l4qKgScG12ssWUYga2IhJwD2JMLyYP0TP76VHpfrT/6ze1i94AmQwNonTLHV931p0auz
 DaYxicKPjli0uL6h4ceISN+ZkLEsnJFxE8E4tfamC6upZAOQxeI/FsvFapjTowNKXry4
 OUAXZO9H9S9ESeQAFgs4Zk51iZBeY/B+VjA837nV/fMzg4HzcLaCft758S9K7yeDt/2Q
 y0ZYiATxMKr7EuTigl1+XrgtAw6i4UkVM8SuLQRU8HKO1SXMHkXrLWcb5mRscJsq/r4l
 MSjQ==
X-Gm-Message-State: AOAM530HKkBkv+htot0BefAiHVxHJGYmCSJo9F45zwNWOWLl6owPiFRs
 xoPDcwGovGuBNA85poNlLxMEYlL6RF0YJw==
X-Google-Smtp-Source: ABdhPJzyzlE8Xnu/OJ9/un9GfMJLp8FZoZVBENYc9jchcJUWe5UK2LW3aeHwKifMtY/KoxqIwAHxAA==
X-Received: by 2002:aa7:99c9:0:b029:1ae:7bed:df12 with SMTP id
 v9-20020aa799c90000b02901ae7beddf12mr6688481pfi.53.1610615181741; 
 Thu, 14 Jan 2021 01:06:21 -0800 (PST)
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com.
 [209.85.215.173])
 by smtp.gmail.com with ESMTPSA id n10sm4729311pfu.176.2021.01.14.01.06.20
 for <linuxppc-dev@lists.ozlabs.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Jan 2021 01:06:21 -0800 (PST)
Received: by mail-pg1-f173.google.com with SMTP id q7so3347357pgm.5
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Jan 2021 01:06:20 -0800 (PST)
X-Received: by 2002:a92:ce8f:: with SMTP id r15mr4926327ilo.303.1610615178346; 
 Thu, 14 Jan 2021 01:06:18 -0800 (PST)
MIME-Version: 1.0
References: <20210106034124.30560-1-tientzu@chromium.org>
 <20210106034124.30560-3-tientzu@chromium.org>
 <20210113124209.GA1383@lst.de>
In-Reply-To: <20210113124209.GA1383@lst.de>
From: Claire Chang <tientzu@chromium.org>
Date: Thu, 14 Jan 2021 17:06:07 +0800
X-Gmail-Original-Message-ID: <CALiNf2-a6JpbeyfCoGdjFAbguxwW5kn1r_Oq6yr+k1rGum7O8Q@mail.gmail.com>
Message-ID: <CALiNf2-a6JpbeyfCoGdjFAbguxwW5kn1r_Oq6yr+k1rGum7O8Q@mail.gmail.com>
Subject: Re: [RFC PATCH v3 2/6] swiotlb: Add restricted DMA pool
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
Cc: heikki.krogerus@linux.intel.com, peterz@infradead.org, grant.likely@arm.com,
 paulus@samba.org, Frank Rowand <frowand.list@gmail.com>, mingo@kernel.org,
 Marek Szyprowski <m.szyprowski@samsung.com>, sstabellini@kernel.org,
 Saravana Kannan <saravanak@google.com>,
 "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>,
 Joerg Roedel <joro@8bytes.org>, " <joro@8bytes.org>,
 rafael.j.wysocki@intel.com, Bartosz Golaszewski <bgolaszewski@baylibre.com>,
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

On Wed, Jan 13, 2021 at 8:42 PM Christoph Hellwig <hch@lst.de> wrote:
>
> > +#ifdef CONFIG_SWIOTLB
> > +     struct io_tlb_mem       *dma_io_tlb_mem;
> >  #endif
>
> Please add a new config option for this code instead of always building
> it when swiotlb is enabled.
>
> > +static int swiotlb_init_io_tlb_mem(struct io_tlb_mem *mem, phys_addr_t start,
> > +                                size_t size)
>
> Can you split the refactoring in swiotlb.c into one or more prep
> patches?
>
> > +static int rmem_swiotlb_device_init(struct reserved_mem *rmem,
> > +                                 struct device *dev)
> > +{
> > +     struct io_tlb_mem *mem = rmem->priv;
> > +     int ret;
> > +
> > +     if (dev->dma_io_tlb_mem)
> > +             return -EBUSY;
> > +
> > +     if (!mem) {
> > +             mem = kzalloc(sizeof(*mem), GFP_KERNEL);
> > +             if (!mem)
> > +                     return -ENOMEM;
>
> What is the calling convention here that allows for a NULL and non-NULL
> private data?

Since multiple devices can share the same pool, the private data,
io_tlb_mem struct, will be initialized by the first device attached to
it.
This is similar to rmem_dma_device_init() in kernel/dma/coherent.c.
I'll add a comment for it in next version.
