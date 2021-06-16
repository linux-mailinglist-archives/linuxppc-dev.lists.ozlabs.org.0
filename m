Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D1193A903D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Jun 2021 05:59:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G4WfC1RXhz3dvZ
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Jun 2021 13:59:31 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=g059DIGH;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::72a;
 helo=mail-qk1-x72a.google.com; envelope-from=tientzu@chromium.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256
 header.s=google header.b=g059DIGH; dkim-atps=neutral
Received: from mail-qk1-x72a.google.com (mail-qk1-x72a.google.com
 [IPv6:2607:f8b0:4864:20::72a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G4WZQ2Ppfz3d6F
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Jun 2021 13:56:14 +1000 (AEST)
Received: by mail-qk1-x72a.google.com with SMTP id d196so1213984qkg.12
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Jun 2021 20:56:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WOmuV0PXC9+eL+TwRgVOkvAj15bXYGA8vCpEhrD+JbE=;
 b=g059DIGHeCANFnvnns2yBVMKxVdn/0FkxtkHgCR2ddz4Y/AFKg+NKqmMaDLYlB4qj1
 BsArZxpOBsco7NEiA/zyZqql53JEfmdG9ukr1Ds/Ds48YXG4RGyj9judJY+lLSITQifa
 sC5ELG83uDJxvbEIx4gQavxy9fc+cCcP1s2B4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WOmuV0PXC9+eL+TwRgVOkvAj15bXYGA8vCpEhrD+JbE=;
 b=lv5CXXFhOpV8PCIf1b/HxpVsjs25AObzUBCPDA2fwsIi4JQCyB9fMSalcYGsuS7C+q
 a5bw2inTbWul8rwFU7MQPCSLPod/43ZZ9dbmgQxaCbEvmNjNcWiQXUjCwcQqZoWI0Q/I
 BefGVwIwMvnXc5RnR1c8Q1bqiR8ayHc6UCaI48BkJ/t9Qsgce6HKBY9nyVt1llrfwZav
 2ZxkYkdwiDe1sQDi6qPtAHzcO8UxFau1RggyTVy9NcPE5UD/8TLRlauqD+pRkkt/BzBK
 6JXSUyTEk7QokHbPIJKxHPp3Q+TW0tBA6W0c0GxBs6BMZClFCrPU/b1P/FXOVDGClFps
 Inhg==
X-Gm-Message-State: AOAM531lTJxioKVsOUUKqLMCm95nNZxXkmjJxxXo96LDK+EfxsYKjmMn
 HDwgYYf/wABQDfk4crAjngXO80tI0em1wQ==
X-Google-Smtp-Source: ABdhPJy5qHvJaB0qFxMYL7fTvkTLj/Qf6zItr/8RhhOAxjDv/OXqKO77ZSeTokbxwf6aAIF7mW5G7A==
X-Received: by 2002:a37:9dcf:: with SMTP id g198mr3110829qke.159.1623815769705; 
 Tue, 15 Jun 2021 20:56:09 -0700 (PDT)
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com.
 [209.85.160.177])
 by smtp.gmail.com with ESMTPSA id g15sm519107qtx.75.2021.06.15.20.56.08
 for <linuxppc-dev@lists.ozlabs.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Jun 2021 20:56:09 -0700 (PDT)
Received: by mail-qt1-f177.google.com with SMTP id v6so833693qta.9
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Jun 2021 20:56:08 -0700 (PDT)
X-Received: by 2002:a05:6638:151:: with SMTP id
 y17mr2223209jao.128.1623815758013; 
 Tue, 15 Jun 2021 20:55:58 -0700 (PDT)
MIME-Version: 1.0
References: <20210615132711.553451-1-tientzu@chromium.org>
In-Reply-To: <20210615132711.553451-1-tientzu@chromium.org>
From: Claire Chang <tientzu@chromium.org>
Date: Wed, 16 Jun 2021 11:55:47 +0800
X-Gmail-Original-Message-ID: <CALiNf29_cCNmfx7NBQQRtTGOk78VNS+fb_Ljf-fC1q1w3FRizA@mail.gmail.com>
Message-ID: <CALiNf29_cCNmfx7NBQQRtTGOk78VNS+fb_Ljf-fC1q1w3FRizA@mail.gmail.com>
Subject: Re: [PATCH v10 00/12] Restricted DMA
To: Rob Herring <robh+dt@kernel.org>, mpe@ellerman.id.au,
 Joerg Roedel <joro@8bytes.org>, 
 Will Deacon <will@kernel.org>, Frank Rowand <frowand.list@gmail.com>, 
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, boris.ostrovsky@oracle.com,
 jgross@suse.com, 
 Christoph Hellwig <hch@lst.de>, Marek Szyprowski <m.szyprowski@samsung.com>
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
 grant.likely@arm.com, paulus@samba.org, mingo@kernel.org,
 Jianxiong Gao <jxgao@google.com>, sstabellini@kernel.org,
 Saravana Kannan <saravanak@google.com>, xypron.glpk@gmx.de,
 "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>, bskeggs@redhat.com,
 linux-pci@vger.kernel.org, xen-devel@lists.xenproject.org,
 Thierry Reding <treding@nvidia.com>, intel-gfx@lists.freedesktop.org,
 matthew.auld@intel.com, linux-devicetree <devicetree@vger.kernel.org>,
 Daniel Vetter <daniel@ffwll.ch>, airlied@linux.ie,
 maarten.lankhorst@linux.intel.com, linuxppc-dev@lists.ozlabs.org,
 jani.nikula@linux.intel.com, Nicolas Boichat <drinkcat@chromium.org>,
 rodrigo.vivi@intel.com, Bjorn Helgaas <bhelgaas@google.com>,
 Dan Williams <dan.j.williams@intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Greg KH <gregkh@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>,
 lkml <linux-kernel@vger.kernel.org>, Tomasz Figa <tfiga@chromium.org>,
 "list@263.net:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
 Jim Quinlan <james.quinlan@broadcom.com>, Robin Murphy <robin.murphy@arm.com>,
 bauerman@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

v11 https://lore.kernel.org/patchwork/cover/1447216/

On Tue, Jun 15, 2021 at 9:27 PM Claire Chang <tientzu@chromium.org> wrote:
>
> This series implements mitigations for lack of DMA access control on
> systems without an IOMMU, which could result in the DMA accessing the
> system memory at unexpected times and/or unexpected addresses, possibly
> leading to data leakage or corruption.
>
> For example, we plan to use the PCI-e bus for Wi-Fi and that PCI-e bus is
> not behind an IOMMU. As PCI-e, by design, gives the device full access to
> system memory, a vulnerability in the Wi-Fi firmware could easily escalate
> to a full system exploit (remote wifi exploits: [1a], [1b] that shows a
> full chain of exploits; [2], [3]).
>
> To mitigate the security concerns, we introduce restricted DMA. Restricted
> DMA utilizes the existing swiotlb to bounce streaming DMA in and out of a
> specially allocated region and does memory allocation from the same region.
> The feature on its own provides a basic level of protection against the DMA
> overwriting buffer contents at unexpected times. However, to protect
> against general data leakage and system memory corruption, the system needs
> to provide a way to restrict the DMA to a predefined memory region (this is
> usually done at firmware level, e.g. MPU in ATF on some ARM platforms [4]).
>
> [1a] https://googleprojectzero.blogspot.com/2017/04/over-air-exploiting-broadcoms-wi-fi_4.html
> [1b] https://googleprojectzero.blogspot.com/2017/04/over-air-exploiting-broadcoms-wi-fi_11.html
> [2] https://blade.tencent.com/en/advisories/qualpwn/
> [3] https://www.bleepingcomputer.com/news/security/vulnerabilities-found-in-highly-popular-firmware-for-wifi-chips/
> [4] https://github.com/ARM-software/arm-trusted-firmware/blob/master/plat/mediatek/mt8183/drivers/emi_mpu/emi_mpu.c#L132
>
> v10:
> Address the comments in v9 to
>   - fix the dev->dma_io_tlb_mem assignment
>   - propagate swiotlb_force setting into io_tlb_default_mem->force
>   - move set_memory_decrypted out of swiotlb_init_io_tlb_mem
>   - move debugfs_dir declaration into the main CONFIG_DEBUG_FS block
>   - add swiotlb_ prefix to find_slots and release_slots
>   - merge the 3 alloc/free related patches
>   - move the CONFIG_DMA_RESTRICTED_POOL later
>
> v9:
> Address the comments in v7 to
>   - set swiotlb active pool to dev->dma_io_tlb_mem
>   - get rid of get_io_tlb_mem
>   - dig out the device struct for is_swiotlb_active
>   - move debugfs_create_dir out of swiotlb_create_debugfs
>   - do set_memory_decrypted conditionally in swiotlb_init_io_tlb_mem
>   - use IS_ENABLED in kernel/dma/direct.c
>   - fix redefinition of 'of_dma_set_restricted_buffer'
> https://lore.kernel.org/patchwork/cover/1445081/
>
> v8:
> - Fix reserved-memory.txt and add the reg property in example.
> - Fix sizeof for of_property_count_elems_of_size in
>   drivers/of/address.c#of_dma_set_restricted_buffer.
> - Apply Will's suggestion to try the OF node having DMA configuration in
>   drivers/of/address.c#of_dma_set_restricted_buffer.
> - Fix typo in the comment of drivers/of/address.c#of_dma_set_restricted_buffer.
> - Add error message for PageHighMem in
>   kernel/dma/swiotlb.c#rmem_swiotlb_device_init and move it to
>   rmem_swiotlb_setup.
> - Fix the message string in rmem_swiotlb_setup.
> https://lore.kernel.org/patchwork/cover/1437112/
>
> v7:
> Fix debugfs, PageHighMem and comment style in rmem_swiotlb_device_init
> https://lore.kernel.org/patchwork/cover/1431031/
>
> v6:
> Address the comments in v5
> https://lore.kernel.org/patchwork/cover/1423201/
>
> v5:
> Rebase on latest linux-next
> https://lore.kernel.org/patchwork/cover/1416899/
>
> v4:
> - Fix spinlock bad magic
> - Use rmem->name for debugfs entry
> - Address the comments in v3
> https://lore.kernel.org/patchwork/cover/1378113/
>
> v3:
> Using only one reserved memory region for both streaming DMA and memory
> allocation.
> https://lore.kernel.org/patchwork/cover/1360992/
>
> v2:
> Building on top of swiotlb.
> https://lore.kernel.org/patchwork/cover/1280705/
>
> v1:
> Using dma_map_ops.
> https://lore.kernel.org/patchwork/cover/1271660/
>
>
> Claire Chang (12):
>   swiotlb: Refactor swiotlb init functions
>   swiotlb: Refactor swiotlb_create_debugfs
>   swiotlb: Set dev->dma_io_tlb_mem to the swiotlb pool used
>   swiotlb: Update is_swiotlb_buffer to add a struct device argument
>   swiotlb: Update is_swiotlb_active to add a struct device argument
>   swiotlb: Use is_dev_swiotlb_force for swiotlb data bouncing
>   swiotlb: Move alloc_size to swiotlb_find_slots
>   swiotlb: Refactor swiotlb_tbl_unmap_single
>   swiotlb: Add restricted DMA pool initialization
>   swiotlb: Add restricted DMA alloc/free support
>   dt-bindings: of: Add restricted DMA pool
>   of: Add plumbing for restricted DMA pool
>
>  .../reserved-memory/reserved-memory.txt       |  36 ++-
>  drivers/base/core.c                           |   4 +
>  drivers/gpu/drm/i915/gem/i915_gem_internal.c  |   2 +-
>  drivers/gpu/drm/nouveau/nouveau_ttm.c         |   2 +-
>  drivers/iommu/dma-iommu.c                     |  12 +-
>  drivers/of/address.c                          |  33 +++
>  drivers/of/device.c                           |   3 +
>  drivers/of/of_private.h                       |   6 +
>  drivers/pci/xen-pcifront.c                    |   2 +-
>  drivers/xen/swiotlb-xen.c                     |   2 +-
>  include/linux/device.h                        |   4 +
>  include/linux/swiotlb.h                       |  40 ++-
>  kernel/dma/Kconfig                            |  14 +
>  kernel/dma/direct.c                           |  60 +++--
>  kernel/dma/direct.h                           |   8 +-
>  kernel/dma/swiotlb.c                          | 255 +++++++++++++-----
>  16 files changed, 380 insertions(+), 103 deletions(-)
>
> --
> 2.32.0.272.g935e593368-goog
>
