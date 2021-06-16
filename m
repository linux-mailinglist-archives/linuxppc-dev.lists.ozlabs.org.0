Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DE7CD3A91E7
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Jun 2021 08:22:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G4ZqP4Kgpz3byN
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Jun 2021 16:22:41 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=j4wZwZXG;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::52d;
 helo=mail-pg1-x52d.google.com; envelope-from=tientzu@chromium.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256
 header.s=google header.b=j4wZwZXG; dkim-atps=neutral
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com
 [IPv6:2607:f8b0:4864:20::52d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G4Zpt5mNjz3078
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Jun 2021 16:22:13 +1000 (AEST)
Received: by mail-pg1-x52d.google.com with SMTP id e33so1136627pgm.3
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Jun 2021 23:22:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=A32xrBsbPeovZovK0BkQExsY3Uwla9z4m9ISmWRwQ4Q=;
 b=j4wZwZXG0R+C6l3S1lrI7hGfaXnSn19RNS7vjtBQrNkqQDWqcJYOFHNXcmfHG27B/8
 9aIXslwTNUvPH8Zu9ziKFpRmStSai2lGKBLvJ5nxUEUYOJhpYqgSmlnaKMnwWUxuddAC
 y3ulIbRnmS1EEccw/JXXUr9ZpvGNblmdteF58=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=A32xrBsbPeovZovK0BkQExsY3Uwla9z4m9ISmWRwQ4Q=;
 b=g+6tfDCh09UIbSCyyZhDc5qlJbM7ogIIqYH9mxEiwPp9bgGkFKaIcZhZ0Bu86bi4+B
 PuKGoBjpbPKMHGH+wSiFMS8AN4MLnVLSJdBg4mkX2E1e/tIkR/mE0p+f2lw9rEI/J+nj
 PLXcT+MjP+7WMwEiHwCcc7cl1Urz/DVWsUds6ERAjBx0wcnO5W2Lh1KXIuZaDUJ3GYK4
 6UGvwKPYhuSbQXcXo6WhVYejl60+1HLeSN9+tAbvMwJqOI0zOTgJb6WjOhhTjcKONZMs
 yi57pBL3XpVYjxINNxvK1brBPWUpelFy9mpzDyhRowho92qrLdCGIJKPrp3+Y5HDUiHb
 Kz6Q==
X-Gm-Message-State: AOAM531kJNJwn3+NEV5Be16WaeP+/dwBJRZzqxWzwzka+J8/fqoJiy3H
 4P46kIrTWV9cgyfKMn4QCjuOdw==
X-Google-Smtp-Source: ABdhPJw+JiP7kSBYYLgC3gcIAQAiyi2/aeKU3DP+AZEyvB31JMim//viADi8ocyrGRpTYSK2qvoyug==
X-Received: by 2002:a63:e245:: with SMTP id y5mr3404254pgj.171.1623824529065; 
 Tue, 15 Jun 2021 23:22:09 -0700 (PDT)
Received: from localhost ([2401:fa00:95:205:3d52:f252:7393:1992])
 by smtp.gmail.com with UTF8SMTPSA id u23sm1279056pgk.38.2021.06.15.23.22.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Jun 2021 23:22:08 -0700 (PDT)
From: Claire Chang <tientzu@chromium.org>
To: Rob Herring <robh+dt@kernel.org>, mpe@ellerman.id.au,
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Frank Rowand <frowand.list@gmail.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, boris.ostrovsky@oracle.com,
 jgross@suse.com, Christoph Hellwig <hch@lst.de>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH v12 00/12] Restricted DMA
Date: Wed, 16 Jun 2021 14:21:45 +0800
Message-Id: <20210616062157.953777-1-tientzu@chromium.org>
X-Mailer: git-send-email 2.32.0.272.g935e593368-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
 grant.likely@arm.com, paulus@samba.org, mingo@kernel.org, jxgao@google.com,
 sstabellini@kernel.org, Saravana Kannan <saravanak@google.com>,
 xypron.glpk@gmx.de, "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>, bskeggs@redhat.com,
 linux-pci@vger.kernel.org, xen-devel@lists.xenproject.org,
 Thierry Reding <treding@nvidia.com>, intel-gfx@lists.freedesktop.org,
 matthew.auld@intel.com, linux-devicetree <devicetree@vger.kernel.org>,
 daniel@ffwll.ch, airlied@linux.ie, maarten.lankhorst@linux.intel.com,
 linuxppc-dev@lists.ozlabs.org, jani.nikula@linux.intel.com,
 Nicolas Boichat <drinkcat@chromium.org>, rodrigo.vivi@intel.com,
 bhelgaas@google.com, tientzu@chromium.org,
 Dan Williams <dan.j.williams@intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Greg KH <gregkh@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>,
 lkml <linux-kernel@vger.kernel.org>, tfiga@chromium.org,
 "list@263.net:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
 Jim Quinlan <james.quinlan@broadcom.com>, Robin Murphy <robin.murphy@arm.com>,
 bauerman@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This series implements mitigations for lack of DMA access control on
systems without an IOMMU, which could result in the DMA accessing the
system memory at unexpected times and/or unexpected addresses, possibly
leading to data leakage or corruption.

For example, we plan to use the PCI-e bus for Wi-Fi and that PCI-e bus is
not behind an IOMMU. As PCI-e, by design, gives the device full access to
system memory, a vulnerability in the Wi-Fi firmware could easily escalate
to a full system exploit (remote wifi exploits: [1a], [1b] that shows a
full chain of exploits; [2], [3]).

To mitigate the security concerns, we introduce restricted DMA. Restricted
DMA utilizes the existing swiotlb to bounce streaming DMA in and out of a
specially allocated region and does memory allocation from the same region.
The feature on its own provides a basic level of protection against the DMA
overwriting buffer contents at unexpected times. However, to protect
against general data leakage and system memory corruption, the system needs
to provide a way to restrict the DMA to a predefined memory region (this is
usually done at firmware level, e.g. MPU in ATF on some ARM platforms [4]).

[1a] https://googleprojectzero.blogspot.com/2017/04/over-air-exploiting-broadcoms-wi-fi_4.html
[1b] https://googleprojectzero.blogspot.com/2017/04/over-air-exploiting-broadcoms-wi-fi_11.html
[2] https://blade.tencent.com/en/advisories/qualpwn/
[3] https://www.bleepingcomputer.com/news/security/vulnerabilities-found-in-highly-popular-firmware-for-wifi-chips/
[4] https://github.com/ARM-software/arm-trusted-firmware/blob/master/plat/mediatek/mt8183/drivers/emi_mpu/emi_mpu.c#L132

v12:
Split is_dev_swiotlb_force into is_swiotlb_force_bounce (patch 06/12) and
is_swiotlb_for_alloc (patch 09/12)

v11:
- Rebase against swiotlb devel/for-linus-5.14
- s/mempry/memory/g
- exchange the order of patch 09/12 and 10/12
https://lore.kernel.org/patchwork/cover/1447216/

v10:
Address the comments in v9 to
  - fix the dev->dma_io_tlb_mem assignment
  - propagate swiotlb_force setting into io_tlb_default_mem->force
  - move set_memory_decrypted out of swiotlb_init_io_tlb_mem
  - move debugfs_dir declaration into the main CONFIG_DEBUG_FS block
  - add swiotlb_ prefix to find_slots and release_slots
  - merge the 3 alloc/free related patches
  - move the CONFIG_DMA_RESTRICTED_POOL later
https://lore.kernel.org/patchwork/cover/1446882/

v9:
Address the comments in v7 to
  - set swiotlb active pool to dev->dma_io_tlb_mem
  - get rid of get_io_tlb_mem
  - dig out the device struct for is_swiotlb_active
  - move debugfs_create_dir out of swiotlb_create_debugfs
  - do set_memory_decrypted conditionally in swiotlb_init_io_tlb_mem
  - use IS_ENABLED in kernel/dma/direct.c
  - fix redefinition of 'of_dma_set_restricted_buffer'
https://lore.kernel.org/patchwork/cover/1445081/

v8:
- Fix reserved-memory.txt and add the reg property in example.
- Fix sizeof for of_property_count_elems_of_size in
  drivers/of/address.c#of_dma_set_restricted_buffer.
- Apply Will's suggestion to try the OF node having DMA configuration in
  drivers/of/address.c#of_dma_set_restricted_buffer.
- Fix typo in the comment of drivers/of/address.c#of_dma_set_restricted_buffer.
- Add error message for PageHighMem in
  kernel/dma/swiotlb.c#rmem_swiotlb_device_init and move it to
  rmem_swiotlb_setup.
- Fix the message string in rmem_swiotlb_setup.
https://lore.kernel.org/patchwork/cover/1437112/

v7:
Fix debugfs, PageHighMem and comment style in rmem_swiotlb_device_init
https://lore.kernel.org/patchwork/cover/1431031/

v6:
Address the comments in v5
https://lore.kernel.org/patchwork/cover/1423201/

v5:
Rebase on latest linux-next
https://lore.kernel.org/patchwork/cover/1416899/

v4:
- Fix spinlock bad magic
- Use rmem->name for debugfs entry
- Address the comments in v3
https://lore.kernel.org/patchwork/cover/1378113/

v3:
Using only one reserved memory region for both streaming DMA and memory
allocation.
https://lore.kernel.org/patchwork/cover/1360992/

v2:
Building on top of swiotlb.
https://lore.kernel.org/patchwork/cover/1280705/

v1:
Using dma_map_ops.
https://lore.kernel.org/patchwork/cover/1271660/


Claire Chang (12):
  swiotlb: Refactor swiotlb init functions
  swiotlb: Refactor swiotlb_create_debugfs
  swiotlb: Set dev->dma_io_tlb_mem to the swiotlb pool used
  swiotlb: Update is_swiotlb_buffer to add a struct device argument
  swiotlb: Update is_swiotlb_active to add a struct device argument
  swiotlb: Use is_swiotlb_force_bounce for swiotlb data bouncing
  swiotlb: Move alloc_size to swiotlb_find_slots
  swiotlb: Refactor swiotlb_tbl_unmap_single
  swiotlb: Add restricted DMA alloc/free support
  swiotlb: Add restricted DMA pool initialization
  dt-bindings: of: Add restricted DMA pool
  of: Add plumbing for restricted DMA pool

 .../reserved-memory/reserved-memory.txt       |  36 ++-
 drivers/base/core.c                           |   4 +
 drivers/gpu/drm/i915/gem/i915_gem_internal.c  |   2 +-
 drivers/gpu/drm/nouveau/nouveau_ttm.c         |   2 +-
 drivers/iommu/dma-iommu.c                     |  12 +-
 drivers/of/address.c                          |  33 +++
 drivers/of/device.c                           |   3 +
 drivers/of/of_private.h                       |   6 +
 drivers/pci/xen-pcifront.c                    |   2 +-
 drivers/xen/swiotlb-xen.c                     |   2 +-
 include/linux/device.h                        |   4 +
 include/linux/swiotlb.h                       |  51 +++-
 kernel/dma/Kconfig                            |  14 +
 kernel/dma/direct.c                           |  59 +++--
 kernel/dma/direct.h                           |   8 +-
 kernel/dma/swiotlb.c                          | 249 +++++++++++++-----
 16 files changed, 385 insertions(+), 102 deletions(-)

-- 
2.32.0.272.g935e593368-goog

