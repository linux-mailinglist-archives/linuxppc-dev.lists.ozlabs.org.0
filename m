Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4731337AC3A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 May 2021 18:43:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FfkJL2HJmz3bsW
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 May 2021 02:43:30 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=L/Y31OZj;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::131;
 helo=mail-il1-x131.google.com; envelope-from=tientzu@chromium.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256
 header.s=google header.b=L/Y31OZj; dkim-atps=neutral
Received: from mail-il1-x131.google.com (mail-il1-x131.google.com
 [IPv6:2607:f8b0:4864:20::131])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FfkHW6hJqz301m
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 May 2021 02:42:47 +1000 (AEST)
Received: by mail-il1-x131.google.com with SMTP id c3so17732960ils.5
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 May 2021 09:42:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=k6jrKLJf+SUK032/zz9tWYcN5Rhay3mFZvhqIWgxNBs=;
 b=L/Y31OZjVAvXas4gAOFGDpY1O+WckxTleHtLR2a6rScOLannRZ4axVg75JGljNN3EA
 40xB287W01zuvyDHYZFS2WLSs1CG9A82KNV8OVT7o92X2FrRRw8J292qbL27/DexCkE7
 qg4XvM9gaQyzYYNGyObKTqbnr0WqygwnwiYxc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=k6jrKLJf+SUK032/zz9tWYcN5Rhay3mFZvhqIWgxNBs=;
 b=gspRnvKZRjQ/lWjobxLTF2brVZxvZ/zAjAuOS1MFg5EUelZVs+21wMUzeKWexXM9ju
 rCqsXcily+CqJrkM5XJp34kGpFhFMcHBYPSPUGnJ6Nw1Kr3jdEdShw4CPnFKbO0sN4ZC
 Pv3eV/kVGcz1gtWl3mnTnEEk2m1KWPg5I8+3cRvJAyREzztu8ttxi1z7ViPrwisKzYRS
 bO8yxRJlMZZkLPutyxuF+1zBMDHf2JrNqAP0rxhQNg+VuASGZJa7cLDE6rPTzYNRR+H5
 6vq/s1kfRXidLahhFy/49bnx5wbOsuO7+ZATDpEVHhpG4hODfOXQe7zQo3OEG+9rV8ki
 tHIw==
X-Gm-Message-State: AOAM531rcY9vzZ/oaz3wbiEp/v6Q5sObw4Sn9mJWTRRzrHuuvw5uc8oF
 25N67buYjwYIxMEj5U2/vScnTFgbywIK8w==
X-Google-Smtp-Source: ABdhPJzfImaXo+GACDuyQPKqGffEV7WoP7F7ni6PyEYunp9uw04Fi5Kiwh1pEMxUuq21Ob85MgWCoQ==
X-Received: by 2002:a05:6e02:1cac:: with SMTP id
 x12mr25216409ill.43.1620751364815; 
 Tue, 11 May 2021 09:42:44 -0700 (PDT)
Received: from mail-io1-f52.google.com (mail-io1-f52.google.com.
 [209.85.166.52])
 by smtp.gmail.com with ESMTPSA id l19sm7659731ioj.11.2021.05.11.09.42.43
 for <linuxppc-dev@lists.ozlabs.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 May 2021 09:42:43 -0700 (PDT)
Received: by mail-io1-f52.google.com with SMTP id a11so18789776ioo.0
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 May 2021 09:42:43 -0700 (PDT)
X-Received: by 2002:a6b:7b08:: with SMTP id l8mr22174004iop.50.1620751352978; 
 Tue, 11 May 2021 09:42:32 -0700 (PDT)
MIME-Version: 1.0
References: <20210510095026.3477496-1-tientzu@chromium.org>
 <20210510095026.3477496-6-tientzu@chromium.org>
 <20210510150342.GD28066@lst.de>
In-Reply-To: <20210510150342.GD28066@lst.de>
From: Claire Chang <tientzu@chromium.org>
Date: Wed, 12 May 2021 00:42:22 +0800
X-Gmail-Original-Message-ID: <CALiNf2_7mHuMG5DTQD0GsriN=vuX0ytyUn4rxEmsK2iP3PKV+w@mail.gmail.com>
Message-ID: <CALiNf2_7mHuMG5DTQD0GsriN=vuX0ytyUn4rxEmsK2iP3PKV+w@mail.gmail.com>
Subject: Re: [PATCH v6 05/15] swiotlb: Add a new get_io_tlb_mem getter
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
> > +static inline struct io_tlb_mem *get_io_tlb_mem(struct device *dev)
> > +{
> > +#ifdef CONFIG_DMA_RESTRICTED_POOL
> > +     if (dev && dev->dma_io_tlb_mem)
> > +             return dev->dma_io_tlb_mem;
> > +#endif /* CONFIG_DMA_RESTRICTED_POOL */
> > +
> > +     return io_tlb_default_mem;
>
> Given that we're also looking into a not addressing restricted pool
> I'd rather always assign the active pool to dev->dma_io_tlb_mem and
> do away with this helper.

Where do you think is the proper place to do the assignment? First
time calling swiotlb_map? or in of_dma_configure_id?
