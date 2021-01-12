Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 236212F2964
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Jan 2021 08:57:26 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DFNGB46zszDqwv
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Jan 2021 18:57:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::62a;
 helo=mail-pl1-x62a.google.com; envelope-from=tientzu@chromium.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256
 header.s=google header.b=X6l/XLro; dkim-atps=neutral
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com
 [IPv6:2607:f8b0:4864:20::62a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DFND66281zDqwP
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Jan 2021 18:55:33 +1100 (AEDT)
Received: by mail-pl1-x62a.google.com with SMTP id d4so159994plh.5
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 11 Jan 2021 23:55:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=M6gti34JNoWz5z3B8Kij1up+0ymqSqmekx/99+4faKU=;
 b=X6l/XLromsTlU6NHa0DWJ/v5avCPE+tbWy6cx1R1IpoHKfbhgU6MF+gZNi4A3oZMQA
 aDXLX9RnsLGW3PS+TKQP3dv3P0XkS3dWXlHp8BVT2WpAIYitmTledVhp8sQu29+3epTn
 3vsNGErl3t1pJGKPEpwPU9LYUv1Ianz/yayzo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=M6gti34JNoWz5z3B8Kij1up+0ymqSqmekx/99+4faKU=;
 b=h6whJtvIXR+8seJ8a1U8yXGXL+I0uuW7PnmXwulvcr8m4yMCzK2oCz+e2tsc3wgEHg
 tz4cWEzXzlPdcKGErMrr4aGqBW3FLoM+sRjno/7qDMumQ9L5HDQJ44w4B8qQVZ8Hhikh
 FDq8rgiCsvt3xIkm/AW1LO83rm2oQ6riREdkwmYwVQZuUEAPnZF0nleq9usSOSWm769s
 iCD5UCzuECdgtcSyJ+BgDqiWM/PdktQpZz359zO9RyyDBxAp+HiDszoH5PH0eC2PXeHy
 X0MDpjTKNRrDI3oTmVmiBWvSiqZReAeD9IkaEPCy3XjrRYZhQWSKK9CPyurk7mRYf/uW
 27dw==
X-Gm-Message-State: AOAM533O1jO5Au5Nm6HCkLXG0ZfOFjMHzM0/rP9KruyANzzjmGGoRwhU
 oFCPeLUx0ZEhazmHB+DrKQjDUbdG74C2vy+q
X-Google-Smtp-Source: ABdhPJxMfjbVL/t0Uo7q3vPMX79pUXjsaLl6Ws03ioLFJj4vzk8MMDP1YqATyVmHix+dgrNVWMwkLg==
X-Received: by 2002:a17:90a:d806:: with SMTP id
 a6mr3266384pjv.170.1610438130813; 
 Mon, 11 Jan 2021 23:55:30 -0800 (PST)
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com.
 [209.85.215.177])
 by smtp.gmail.com with ESMTPSA id w63sm2066233pfc.20.2021.01.11.23.55.30
 for <linuxppc-dev@lists.ozlabs.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Jan 2021 23:55:30 -0800 (PST)
Received: by mail-pg1-f177.google.com with SMTP id q7so915080pgm.5
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 11 Jan 2021 23:55:30 -0800 (PST)
X-Received: by 2002:a6b:7f0b:: with SMTP id l11mr2402150ioq.34.1610437707606; 
 Mon, 11 Jan 2021 23:48:27 -0800 (PST)
MIME-Version: 1.0
References: <20210106034124.30560-1-tientzu@chromium.org>
 <d7043239-12cf-3636-4726-2e3b90917dc6@gmail.com>
 <CALiNf28sU1VtGB7LeTXExkMwQiCeg8N5arqyEjw0CPZP72R4dg@mail.gmail.com>
 <78871151-947d-b085-db03-0d0bd0b55632@gmail.com>
In-Reply-To: <78871151-947d-b085-db03-0d0bd0b55632@gmail.com>
From: Claire Chang <tientzu@chromium.org>
Date: Tue, 12 Jan 2021 15:48:16 +0800
X-Gmail-Original-Message-ID: <CALiNf29_PmLJTVLksSHp3NFAaL52idqehSMOtatJ=jaM2Muq1g@mail.gmail.com>
Message-ID: <CALiNf29_PmLJTVLksSHp3NFAaL52idqehSMOtatJ=jaM2Muq1g@mail.gmail.com>
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
 Saravana Kannan <saravanak@google.com>, Joerg Roedel <joro@8bytes.org>,
 rafael.j.wysocki@intel.com, Christoph Hellwig <hch@lst.de>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 xen-devel@lists.xenproject.org, Thierry Reding <treding@nvidia.com>,
 linux-devicetree <devicetree@vger.kernel.org>, will@kernel.org,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, dan.j.williams@intel.com,
 linuxppc-dev@lists.ozlabs.org, Rob Herring <robh+dt@kernel.org>,
 boris.ostrovsky@oracle.com,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, jgross@suse.com,
 Nicolas Boichat <drinkcat@chromium.org>, Greg KH <gregkh@linuxfoundation.org>,
 rdunlap@infradead.org, lkml <linux-kernel@vger.kernel.org>,
 Tomasz Figa <tfiga@chromium.org>,
 "list@263.net:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
 Jim Quinlan <james.quinlan@broadcom.com>, xypron.glpk@gmx.de,
 Robin Murphy <robin.murphy@arm.com>, bauerman@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Jan 8, 2021 at 1:59 AM Florian Fainelli <f.fainelli@gmail.com> wrote:
>
> On 1/7/21 9:42 AM, Claire Chang wrote:
>
> >> Can you explain how ATF gets involved and to what extent it does help,
> >> besides enforcing a secure region from the ARM CPU's perpsective? Does
> >> the PCIe root complex not have an IOMMU but can somehow be denied access
> >> to a region that is marked NS=0 in the ARM CPU's MMU? If so, that is
> >> still some sort of basic protection that the HW enforces, right?
> >
> > We need the ATF support for memory MPU (memory protection unit).
> > Restricted DMA (with reserved-memory in dts) makes sure the predefined memory
> > region is for PCIe DMA only, but we still need MPU to locks down PCIe access to
> > that specific regions.
>
> OK so you do have a protection unit of some sort to enforce which region
> in DRAM the PCIE bridge is allowed to access, that makes sense,
> otherwise the restricted DMA region would only be a hint but nothing you
> can really enforce. This is almost entirely analogous to our systems then.

Here is the example of setting the MPU:
https://github.com/ARM-software/arm-trusted-firmware/blob/master/plat/mediatek/mt8183/drivers/emi_mpu/emi_mpu.c#L132

>
> There may be some value in standardizing on an ARM SMCCC call then since
> you already support two different SoC vendors.
>
> >
> >>
> >> On Broadcom STB SoCs we have had something similar for a while however
> >> and while we don't have an IOMMU for the PCIe bridge, we do have a a
> >> basic protection mechanism whereby we can configure a region in DRAM to
> >> be PCIe read/write and CPU read/write which then gets used as the PCIe
> >> inbound region for the PCIe EP. By default the PCIe bridge is not
> >> allowed access to DRAM so we must call into a security agent to allow
> >> the PCIe bridge to access the designated DRAM region.
> >>
> >> We have done this using a private CMA area region assigned via Device
> >> Tree, assigned with a and requiring the PCIe EP driver to use
> >> dma_alloc_from_contiguous() in order to allocate from this device
> >> private CMA area. The only drawback with that approach is that it
> >> requires knowing how much memory you need up front for buffers and DMA
> >> descriptors that the PCIe EP will need to process. The problem is that
> >> it requires driver modifications and that does not scale over the number
> >> of PCIe EP drivers, some we absolutely do not control, but there is no
> >> need to bounce buffer. Your approach scales better across PCIe EP
> >> drivers however it does require bounce buffering which could be a
> >> performance hit.
> >
> > Only the streaming DMA (map/unmap) needs bounce buffering.
>
> True, and typically only on transmit since you don't really control
> where the sk_buff are allocated from, right? On RX since you need to
> hand buffer addresses to the WLAN chip prior to DMA, you can allocate
> them from a pool that already falls within the restricted DMA region, right?
>

Right, but applying bounce buffering to RX will make it more secure.
The device won't be able to modify the content after unmap. Just like what
iommu_unmap does.

> > I also added alloc/free support in this series
> > (https://lore.kernel.org/patchwork/patch/1360995/), so dma_direct_alloc() will
> > try to allocate memory from the predefined memory region.
> >
> > As for the performance hit, it should be similar to the default swiotlb.
> > Here are my experiment results. Both SoCs lack IOMMU for PCIe.
> >
> > PCIe wifi vht80 throughput -
> >
> >   MTK SoC                  tcp_tx     tcp_rx    udp_tx   udp_rx
> >   w/o Restricted DMA  244.1     134.66   312.56   350.79
> >   w/ Restricted DMA    246.95   136.59   363.21   351.99
> >
> >   Rockchip SoC           tcp_tx     tcp_rx    udp_tx   udp_rx
> >   w/o Restricted DMA  237.87   133.86   288.28   361.88
> >   w/ Restricted DMA    256.01   130.95   292.28   353.19
>
> How come you get better throughput with restricted DMA? Is it because
> doing DMA to/from a contiguous region allows for better grouping of
> transactions from the DRAM controller's perspective somehow?

I'm not sure, but actually, enabling the default swiotlb for wifi also helps the
throughput a little bit for me.

>
> >
> > The CPU usage doesn't increase too much either.
> > Although I didn't measure the CPU usage very precisely, it's ~3% with a single
> > big core (Cortex-A72) and ~5% with a single small core (Cortex-A53).
> >
> > Thanks!
> >
> >>
> >> Thanks!
> >> --
> >> Florian
>
>
> --
> Florian
