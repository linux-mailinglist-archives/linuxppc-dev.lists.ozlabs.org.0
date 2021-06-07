Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B9E2939D378
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Jun 2021 05:29:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FyzQ70nlYz308j
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Jun 2021 13:29:51 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=lXhSyF7u;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::544;
 helo=mail-pg1-x544.google.com; envelope-from=tientzu@chromium.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256
 header.s=google header.b=lXhSyF7u; dkim-atps=neutral
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FyzPZ1RFgz2yXb
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  7 Jun 2021 13:29:19 +1000 (AEST)
Received: by mail-pg1-x544.google.com with SMTP id t9so12774072pgn.4
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 06 Jun 2021 20:29:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zXJrYShxgIyQHo1wYCS3F9rVjXIqXzIl9+OOmY4aJuc=;
 b=lXhSyF7uZrXQiHjN4kEdhtrYYO4eYXTtv+MmIVlkaYfrDj3gFF3i6zdq9V6t5fEQPA
 Q41l6xsOf6kbnxwhiHTDBcVDInxTuXTZ4PeJVzQkTroJzwWh+Feq2JO3lXBrruik9rJE
 v5bJs9UlwmvhYXAJ0FNY04iCN48TAqVGzZPFU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zXJrYShxgIyQHo1wYCS3F9rVjXIqXzIl9+OOmY4aJuc=;
 b=Cekzfnk0WXy7/m6mZWTRsCm1uwlcjnMDwziebk7iLTHG3fKCBxMY57lYfcBTOB2bQE
 ViCbaedO4uEwJAYGIvvtckwGDBoWCxDVdwjcxeHEqe3gPLJc1jlKvjtT+1DXKem53wYT
 dTfdeN5pb+BHAVwCDzEF6nplKOjjue9q5OP7zeDsYfzm93C2hjJTWha9zYmElolAoDqK
 BTwOiAsoVmyeKe9avAor+sgvffBuuSDQH4rdmAqiJUo7o/9EWFJlzWKfSNzB4M060VMa
 SoCRrvsNVIqYQMRA181/fWUyAcnpFUZ3F0hO4YcDo0K9zou6CZKEguYxqEYf3V5WwLqB
 J2lQ==
X-Gm-Message-State: AOAM530a6DOmQS7untopZRsQ0ETSiG8VrG+xJsfBSXVvI5v2BhZNLwDa
 igS0aCjaiVwogRVDBbd6J4lTo+A+PwZvoQ==
X-Google-Smtp-Source: ABdhPJy2GmyXbvpZ8z1tifNaSbSA3BscBZ3W1Uxc21BJXoVQH2tyNzEp076QrjWPR8OQeeueqY2qpQ==
X-Received: by 2002:a65:6118:: with SMTP id z24mr15818828pgu.325.1623036556206; 
 Sun, 06 Jun 2021 20:29:16 -0700 (PDT)
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com.
 [209.85.215.172])
 by smtp.gmail.com with ESMTPSA id p16sm6986126pgl.60.2021.06.06.20.29.15
 for <linuxppc-dev@lists.ozlabs.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 06 Jun 2021 20:29:16 -0700 (PDT)
Received: by mail-pg1-f172.google.com with SMTP id n12so12725515pgs.13
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 06 Jun 2021 20:29:15 -0700 (PDT)
X-Received: by 2002:a05:6e02:1a44:: with SMTP id
 u4mr1746214ilv.64.1623036543940; 
 Sun, 06 Jun 2021 20:29:03 -0700 (PDT)
MIME-Version: 1.0
References: <20210527125845.1852284-1-tientzu@chromium.org>
 <20210604174818.GC3703@willie-the-truck>
In-Reply-To: <20210604174818.GC3703@willie-the-truck>
From: Claire Chang <tientzu@chromium.org>
Date: Mon, 7 Jun 2021 11:28:53 +0800
X-Gmail-Original-Message-ID: <CALiNf29=z2uBM1ZA_GTu04iFS2dJwH0npdGvid1PL5KQM_HrxA@mail.gmail.com>
Message-ID: <CALiNf29=z2uBM1ZA_GTu04iFS2dJwH0npdGvid1PL5KQM_HrxA@mail.gmail.com>
Subject: Re: [PATCH v8 00/15] Restricted DMA
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

On Sat, Jun 5, 2021 at 1:48 AM Will Deacon <will@kernel.org> wrote:
>
> Hi Claire,
>
> On Thu, May 27, 2021 at 08:58:30PM +0800, Claire Chang wrote:
> > This series implements mitigations for lack of DMA access control on
> > systems without an IOMMU, which could result in the DMA accessing the
> > system memory at unexpected times and/or unexpected addresses, possibly
> > leading to data leakage or corruption.
> >
> > For example, we plan to use the PCI-e bus for Wi-Fi and that PCI-e bus is
> > not behind an IOMMU. As PCI-e, by design, gives the device full access to
> > system memory, a vulnerability in the Wi-Fi firmware could easily escalate
> > to a full system exploit (remote wifi exploits: [1a], [1b] that shows a
> > full chain of exploits; [2], [3]).
> >
> > To mitigate the security concerns, we introduce restricted DMA. Restricted
> > DMA utilizes the existing swiotlb to bounce streaming DMA in and out of a
> > specially allocated region and does memory allocation from the same region.
> > The feature on its own provides a basic level of protection against the DMA
> > overwriting buffer contents at unexpected times. However, to protect
> > against general data leakage and system memory corruption, the system needs
> > to provide a way to restrict the DMA to a predefined memory region (this is
> > usually done at firmware level, e.g. MPU in ATF on some ARM platforms [4]).
> >
> > [1a] https://googleprojectzero.blogspot.com/2017/04/over-air-exploiting-broadcoms-wi-fi_4.html
> > [1b] https://googleprojectzero.blogspot.com/2017/04/over-air-exploiting-broadcoms-wi-fi_11.html
> > [2] https://blade.tencent.com/en/advisories/qualpwn/
> > [3] https://www.bleepingcomputer.com/news/security/vulnerabilities-found-in-highly-popular-firmware-for-wifi-chips/
> > [4] https://github.com/ARM-software/arm-trusted-firmware/blob/master/plat/mediatek/mt8183/drivers/emi_mpu/emi_mpu.c#L132
> >
> > v8:
> > - Fix reserved-memory.txt and add the reg property in example.
> > - Fix sizeof for of_property_count_elems_of_size in
> >   drivers/of/address.c#of_dma_set_restricted_buffer.
> > - Apply Will's suggestion to try the OF node having DMA configuration in
> >   drivers/of/address.c#of_dma_set_restricted_buffer.
> > - Fix typo in the comment of drivers/of/address.c#of_dma_set_restricted_buffer.
> > - Add error message for PageHighMem in
> >   kernel/dma/swiotlb.c#rmem_swiotlb_device_init and move it to
> >   rmem_swiotlb_setup.
> > - Fix the message string in rmem_swiotlb_setup.
>
> Thanks for the v8. It works for me out of the box on arm64 under KVM, so:
>
> Tested-by: Will Deacon <will@kernel.org>
>
> Note that something seems to have gone wrong with the mail threading, so
> the last 5 patches ended up as a separate thread for me. Probably worth
> posting again with all the patches in one place, if you can.

Thanks for testing.

Christoph also added some comments in v7, so I'll prepare v9.

>
> Cheers,
>
> Will
