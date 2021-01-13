Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BE5932F4332
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Jan 2021 05:34:17 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DFvjL4CZWzDqwL
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Jan 2021 15:34:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=chromium.org (client-ip=2a00:1450:4864:20::230;
 helo=mail-lj1-x230.google.com; envelope-from=tfiga@chromium.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256
 header.s=google header.b=cUL+OIdn; dkim-atps=neutral
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DFvgf5CLjzDqnD
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Jan 2021 15:32:43 +1100 (AEDT)
Received: by mail-lj1-x230.google.com with SMTP id y22so1036915ljn.9
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Jan 2021 20:32:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Qd8hOVRYaVRyWNGRjHwo8wnN48NoVMjkXuMdDYJPYxc=;
 b=cUL+OIdnJx4G27gKvv1kHgGhT/slNCHswvbi3BuicuPQK2CUGcm0qVdh+9o8kjC/EK
 SNX+36UrRAN9XTvqxA+bDb4zE1ip5M/Md1KqkddIPS827Ih0ruD0qLwi/Bm2QcxOkH5H
 8Ph19hD0ZaKeMRKRHdsA/toCspDEeybtcuDi8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Qd8hOVRYaVRyWNGRjHwo8wnN48NoVMjkXuMdDYJPYxc=;
 b=ONlVbDADD9PH2bzmFVszPBUZIbPVrnn4ddwjv1jkWQtU2dy54JJNa4IEGB+gHVSYee
 0ccsNZ5eGliHiONI/CIruHFUA0ZrFniquczQwoZR9480WjM/uMTDNcTGRPOCmsuZXD0j
 qmDfYJWRYAx2+oU2bHqtEJpuI+8TkGXGxqZjFoCaV+u2rnS3cjP4T6lLsKLQa88ulRCw
 mdaiA/q3a9UQbrxTAB3oMLr23v+jNH8B77D8GEMfQOoz6VWOcSXmBYIIcBP6T/ixMfln
 8mpz+ZG3DhsbApFIPYVsOWGb4hfLQ0petMoKh8I5Zik74vWUh2nXGm/YGbJRICenRAtn
 xO+w==
X-Gm-Message-State: AOAM531legbQcAyk9hv4aokKlKgqDpFGLP47ln29AD4Pn/K/Ht3q6AMQ
 q4lbMEkj55JJbZEyxsOmGLWc6iKMsIUmHUK1
X-Google-Smtp-Source: ABdhPJwcGNtGtjceoLt3as7uvZsbS1aZCu4EcamwLDW9vbISFK7m56ouxQz0grGYljHhfFqklI3EFA==
X-Received: by 2002:a2e:870e:: with SMTP id m14mr112894lji.166.1610512357621; 
 Tue, 12 Jan 2021 20:32:37 -0800 (PST)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com.
 [209.85.167.48])
 by smtp.gmail.com with ESMTPSA id v7sm55961ljk.60.2021.01.12.20.32.37
 for <linuxppc-dev@lists.ozlabs.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Jan 2021 20:32:37 -0800 (PST)
Received: by mail-lf1-f48.google.com with SMTP id s26so800021lfc.8
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Jan 2021 20:32:37 -0800 (PST)
X-Received: by 2002:adf:fa86:: with SMTP id h6mr380594wrr.103.1610511938864;
 Tue, 12 Jan 2021 20:25:38 -0800 (PST)
MIME-Version: 1.0
References: <20210106034124.30560-1-tientzu@chromium.org>
 <d7043239-12cf-3636-4726-2e3b90917dc6@gmail.com>
 <CALiNf28sU1VtGB7LeTXExkMwQiCeg8N5arqyEjw0CPZP72R4dg@mail.gmail.com>
 <78871151-947d-b085-db03-0d0bd0b55632@gmail.com>
 <CALiNf29_PmLJTVLksSHp3NFAaL52idqehSMOtatJ=jaM2Muq1g@mail.gmail.com>
 <23a09b9a-70fc-a7a8-f3ea-b0bfa60507f0@gmail.com>
 <CAAFQd5DX=AdaYSYQbxgnrYYojkM5q7EE_Qs-BYPOiNjcQWbN1A@mail.gmail.com>
 <c7f7941d-b8bd-f0f3-4e40-b899a77188bf@gmail.com>
In-Reply-To: <c7f7941d-b8bd-f0f3-4e40-b899a77188bf@gmail.com>
From: Tomasz Figa <tfiga@chromium.org>
Date: Wed, 13 Jan 2021 13:25:27 +0900
X-Gmail-Original-Message-ID: <CAAFQd5AGm4U8hD4jHmw10S7MRS1-ZUSq7eGgoUifMMyfZgP2NA@mail.gmail.com>
Message-ID: <CAAFQd5AGm4U8hD4jHmw10S7MRS1-ZUSq7eGgoUifMMyfZgP2NA@mail.gmail.com>
Subject: Re: [RFC PATCH v3 0/6] Restricted DMA
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
 Saravana Kannan <saravanak@google.com>, xypron.glpk@gmx.de,
 Joerg Roedel <joro@8bytes.org>,
 "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
 Christoph Hellwig <hch@lst.de>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 xen-devel@lists.xenproject.org, Thierry Reding <treding@nvidia.com>,
 linux-devicetree <devicetree@vger.kernel.org>, Will Deacon <will@kernel.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Dan Williams <dan.j.williams@intel.com>, linuxppc-dev@lists.ozlabs.org,
 Rob Herring <robh+dt@kernel.org>, Claire Chang <tientzu@chromium.org>,
 boris.ostrovsky@oracle.com,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, jgross@suse.com,
 Nicolas Boichat <drinkcat@chromium.org>, Greg KH <gregkh@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>, lkml <linux-kernel@vger.kernel.org>,
 "list@263.net:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
 Jim Quinlan <james.quinlan@broadcom.com>, Robin Murphy <robin.murphy@arm.com>,
 bauerman@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jan 13, 2021 at 12:56 PM Florian Fainelli <f.fainelli@gmail.com> wrote:
>
>
>
> On 1/12/2021 6:29 PM, Tomasz Figa wrote:
> > Hi Florian,
> >
> > On Wed, Jan 13, 2021 at 3:01 AM Florian Fainelli <f.fainelli@gmail.com> wrote:
> >>
> >> On 1/11/21 11:48 PM, Claire Chang wrote:
> >>> On Fri, Jan 8, 2021 at 1:59 AM Florian Fainelli <f.fainelli@gmail.com> wrote:
> >>>>
> >>>> On 1/7/21 9:42 AM, Claire Chang wrote:
> >>>>
> >>>>>> Can you explain how ATF gets involved and to what extent it does help,
> >>>>>> besides enforcing a secure region from the ARM CPU's perpsective? Does
> >>>>>> the PCIe root complex not have an IOMMU but can somehow be denied access
> >>>>>> to a region that is marked NS=0 in the ARM CPU's MMU? If so, that is
> >>>>>> still some sort of basic protection that the HW enforces, right?
> >>>>>
> >>>>> We need the ATF support for memory MPU (memory protection unit).
> >>>>> Restricted DMA (with reserved-memory in dts) makes sure the predefined memory
> >>>>> region is for PCIe DMA only, but we still need MPU to locks down PCIe access to
> >>>>> that specific regions.
> >>>>
> >>>> OK so you do have a protection unit of some sort to enforce which region
> >>>> in DRAM the PCIE bridge is allowed to access, that makes sense,
> >>>> otherwise the restricted DMA region would only be a hint but nothing you
> >>>> can really enforce. This is almost entirely analogous to our systems then.
> >>>
> >>> Here is the example of setting the MPU:
> >>> https://github.com/ARM-software/arm-trusted-firmware/blob/master/plat/mediatek/mt8183/drivers/emi_mpu/emi_mpu.c#L132
> >>>
> >>>>
> >>>> There may be some value in standardizing on an ARM SMCCC call then since
> >>>> you already support two different SoC vendors.
> >>>>
> >>>>>
> >>>>>>
> >>>>>> On Broadcom STB SoCs we have had something similar for a while however
> >>>>>> and while we don't have an IOMMU for the PCIe bridge, we do have a a
> >>>>>> basic protection mechanism whereby we can configure a region in DRAM to
> >>>>>> be PCIe read/write and CPU read/write which then gets used as the PCIe
> >>>>>> inbound region for the PCIe EP. By default the PCIe bridge is not
> >>>>>> allowed access to DRAM so we must call into a security agent to allow
> >>>>>> the PCIe bridge to access the designated DRAM region.
> >>>>>>
> >>>>>> We have done this using a private CMA area region assigned via Device
> >>>>>> Tree, assigned with a and requiring the PCIe EP driver to use
> >>>>>> dma_alloc_from_contiguous() in order to allocate from this device
> >>>>>> private CMA area. The only drawback with that approach is that it
> >>>>>> requires knowing how much memory you need up front for buffers and DMA
> >>>>>> descriptors that the PCIe EP will need to process. The problem is that
> >>>>>> it requires driver modifications and that does not scale over the number
> >>>>>> of PCIe EP drivers, some we absolutely do not control, but there is no
> >>>>>> need to bounce buffer. Your approach scales better across PCIe EP
> >>>>>> drivers however it does require bounce buffering which could be a
> >>>>>> performance hit.
> >>>>>
> >>>>> Only the streaming DMA (map/unmap) needs bounce buffering.
> >>>>
> >>>> True, and typically only on transmit since you don't really control
> >>>> where the sk_buff are allocated from, right? On RX since you need to
> >>>> hand buffer addresses to the WLAN chip prior to DMA, you can allocate
> >>>> them from a pool that already falls within the restricted DMA region, right?
> >>>>
> >>>
> >>> Right, but applying bounce buffering to RX will make it more secure.
> >>> The device won't be able to modify the content after unmap. Just like what
> >>> iommu_unmap does.
> >>
> >> Sure, however the goals of using bounce buffering equally applies to RX
> >> and TX in that this is the only layer sitting between a stack (block,
> >> networking, USB, etc.) and the underlying device driver that scales well
> >> in order to massage a dma_addr_t to be within a particular physical range.
> >>
> >> There is however room for improvement if the drivers are willing to
> >> change their buffer allocation strategy. When you receive Wi-Fi frames
> >> you need to allocate buffers for the Wi-Fi device to DMA into, and that
> >> happens ahead of the DMA transfers by the Wi-Fi device. At buffer
> >> allocation time you could very well allocate these frames from the
> >> restricted DMA region without having to bounce buffer them since the
> >> host CPU is in control over where and when to DMA into.
> >>
> >
> > That is, however, still a trade-off between saving that one copy and
> > protection from the DMA tampering with the packet contents when the
> > kernel is reading them. Notice how the copy effectively makes a
> > snapshot of the contents, guaranteeing that the kernel has a
> > consistent view of the packet, which is not true if the DMA could
> > modify the buffer contents in the middle of CPU accesses.
>
> I would say that the window just became so much narrower for the PCIe
> end-point to overwrite contents with the copy because it would have to
> happen within the dma_unmap_{page,single} time and before the copy is
> finished to the bounce buffer.

Not only. Imagine this:

a) Without bouncing:

- RX interrupt
- Pass the packet to the network stack
- Network stack validates the packet
- DMA overwrites the packet
- Network stack goes boom, because the packet changed after validation

b) With bouncing:

- RX interrupt
- Copy the packet to a DMA-inaccessible buffer
- Network stack validates the packet
- Network stack is happy, because the packet is guaranteed to stay the
same after validation

Best regards,
Tomasz
