Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 88B872ED60E
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Jan 2021 18:52:01 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DBYhZ2qhFzDqsK
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Jan 2021 04:51:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::431;
 helo=mail-pf1-x431.google.com; envelope-from=tientzu@chromium.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256
 header.s=google header.b=GM+iTlQ3; dkim-atps=neutral
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com
 [IPv6:2607:f8b0:4864:20::431])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DBYfy5qcCzDqVm
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 Jan 2021 04:50:34 +1100 (AEDT)
Received: by mail-pf1-x431.google.com with SMTP id s21so4295439pfu.13
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 07 Jan 2021 09:50:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6Eoqk68P1Bcb0VR3W1zmVx5ceWjyA10pZm4KhVQJdAs=;
 b=GM+iTlQ3BQkvH1ob8TdUxcmAsi46pi2mtWELHUgZFyyPO+EndHkxYi6Efkg3O18Tku
 edQt8UB0Llti6Epm5pi7gQD7Rvjj2XwfVndg2ehauNbNVLy3PAXR8NhD8ppHMDSgrEjB
 eTe/tAn9d2RFhHsPSUNMdpOJeoKvJtOqJ4IiU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6Eoqk68P1Bcb0VR3W1zmVx5ceWjyA10pZm4KhVQJdAs=;
 b=ShRqOd47IERluRfBzRR9vXszo4QNNfvFCY6W8GXs9RW7AzMkIsxA+xDmpl6kVZS5T5
 6aM03t2bDnHcicC/Za9OuQNUCG5QI8/gF3MlLfLTsULM0MoTUmTlIACGkcEIO8/HDEz8
 SGKuNg/BXJ8Q9Xd/VGHIwUu+Ayd/HlMXf/MoMCyccRP8XZ6s+H+omqLfUpsf4TKcsCvL
 0Jv2v3B4GpmELWxdBRX7BJYL6c2Fw7fVV9IoEgOhw87eKG5XQNKM+5cwN3Co+BsNx3ET
 NJnfeJKfjSpCipE9spcjS6rEPKTY6vsRqNMTiljfysLiBQhnej4fqg7hbhWNFwsIfxhO
 WMwQ==
X-Gm-Message-State: AOAM530WFcThzoBi+HRoQilV+U9evznhnM4sqnQMu3cXn1bG+AVFzCYB
 SRBHTBJ9U9BeCZodK2nwh49B6kNw+omRR20u
X-Google-Smtp-Source: ABdhPJwoU+tCntWzw5rsgPuOtB9mHahRbpR6RYUAoOKdve/SQAiGp49jf8tRLRR7YZ7EH823mYrN/w==
X-Received: by 2002:a63:ac19:: with SMTP id v25mr2970671pge.258.1610041830893; 
 Thu, 07 Jan 2021 09:50:30 -0800 (PST)
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com.
 [209.85.215.174])
 by smtp.gmail.com with ESMTPSA id 145sm6176227pfu.8.2021.01.07.09.50.30
 for <linuxppc-dev@lists.ozlabs.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Jan 2021 09:50:30 -0800 (PST)
Received: by mail-pg1-f174.google.com with SMTP id q7so3540731pgm.5
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 07 Jan 2021 09:50:30 -0800 (PST)
X-Received: by 2002:a92:d592:: with SMTP id a18mr8620iln.64.1610041335740;
 Thu, 07 Jan 2021 09:42:15 -0800 (PST)
MIME-Version: 1.0
References: <20210106034124.30560-1-tientzu@chromium.org>
 <d7043239-12cf-3636-4726-2e3b90917dc6@gmail.com>
In-Reply-To: <d7043239-12cf-3636-4726-2e3b90917dc6@gmail.com>
From: Claire Chang <tientzu@chromium.org>
Date: Fri, 8 Jan 2021 01:42:04 +0800
X-Gmail-Original-Message-ID: <CALiNf28sU1VtGB7LeTXExkMwQiCeg8N5arqyEjw0CPZP72R4dg@mail.gmail.com>
Message-ID: <CALiNf28sU1VtGB7LeTXExkMwQiCeg8N5arqyEjw0CPZP72R4dg@mail.gmail.com>
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
 Saravana Kannan <saravanak@google.com>,
 "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>,
 Joerg Roedel <joro@8bytes.org>, " <joro@8bytes.org>,
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
 "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>,
 Joerg Roedel <joro@8bytes.org>, " <iommu@lists.linux-foundation.org>,
 Jim Quinlan <james.quinlan@broadcom.com>, xypron.glpk@gmx.de,
 Robin Murphy <robin.murphy@arm.com>, bauerman@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jan 7, 2021 at 2:48 AM Florian Fainelli <f.fainelli@gmail.com> wrote:
>
> Hi,
>
> First of all let me say that I am glad that someone is working on a
> upstream solution for this issue, would appreciate if you could CC and
> Jim Quinlan on subsequent submissions.

Sure!

>
> On 1/5/21 7:41 PM, Claire Chang wrote:
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
> > usually done at firmware level, e.g. in ATF on some ARM platforms).
>
> Can you explain how ATF gets involved and to what extent it does help,
> besides enforcing a secure region from the ARM CPU's perpsective? Does
> the PCIe root complex not have an IOMMU but can somehow be denied access
> to a region that is marked NS=0 in the ARM CPU's MMU? If so, that is
> still some sort of basic protection that the HW enforces, right?

We need the ATF support for memory MPU (memory protection unit).
Restricted DMA (with reserved-memory in dts) makes sure the predefined memory
region is for PCIe DMA only, but we still need MPU to locks down PCIe access to
that specific regions.

>
> On Broadcom STB SoCs we have had something similar for a while however
> and while we don't have an IOMMU for the PCIe bridge, we do have a a
> basic protection mechanism whereby we can configure a region in DRAM to
> be PCIe read/write and CPU read/write which then gets used as the PCIe
> inbound region for the PCIe EP. By default the PCIe bridge is not
> allowed access to DRAM so we must call into a security agent to allow
> the PCIe bridge to access the designated DRAM region.
>
> We have done this using a private CMA area region assigned via Device
> Tree, assigned with a and requiring the PCIe EP driver to use
> dma_alloc_from_contiguous() in order to allocate from this device
> private CMA area. The only drawback with that approach is that it
> requires knowing how much memory you need up front for buffers and DMA
> descriptors that the PCIe EP will need to process. The problem is that
> it requires driver modifications and that does not scale over the number
> of PCIe EP drivers, some we absolutely do not control, but there is no
> need to bounce buffer. Your approach scales better across PCIe EP
> drivers however it does require bounce buffering which could be a
> performance hit.

Only the streaming DMA (map/unmap) needs bounce buffering.
I also added alloc/free support in this series
(https://lore.kernel.org/patchwork/patch/1360995/), so dma_direct_alloc() will
try to allocate memory from the predefined memory region.

As for the performance hit, it should be similar to the default swiotlb.
Here are my experiment results. Both SoCs lack IOMMU for PCIe.

PCIe wifi vht80 throughput -

  MTK SoC                  tcp_tx     tcp_rx    udp_tx   udp_rx
  w/o Restricted DMA  244.1     134.66   312.56   350.79
  w/ Restricted DMA    246.95   136.59   363.21   351.99

  Rockchip SoC           tcp_tx     tcp_rx    udp_tx   udp_rx
  w/o Restricted DMA  237.87   133.86   288.28   361.88
  w/ Restricted DMA    256.01   130.95   292.28   353.19

The CPU usage doesn't increase too much either.
Although I didn't measure the CPU usage very precisely, it's ~3% with a single
big core (Cortex-A72) and ~5% with a single small core (Cortex-A53).

Thanks!

>
> Thanks!
> --
> Florian
