Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C710738721F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 May 2021 08:43:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FkmfB5FSgz30Gt
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 May 2021 16:42:58 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=VtOmdjwV;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::1031;
 helo=mail-pj1-x1031.google.com; envelope-from=tientzu@chromium.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256
 header.s=google header.b=VtOmdjwV; dkim-atps=neutral
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [IPv6:2607:f8b0:4864:20::1031])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fkmdh2wBjz2yWs
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 May 2021 16:42:31 +1000 (AEST)
Received: by mail-pj1-x1031.google.com with SMTP id k5so4985595pjj.1
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 May 2021 23:42:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PDyrwk3dKvoxKjer/W/nKoHZ25xkHMzcXLNqNVSjI98=;
 b=VtOmdjwVV5WinnYM8kjIEP+f3T2dP4qhZew2qo2b8rOixnhhoKqE73hDfXFYiPhVG+
 U6BAIa1KXGyc+Nw/pBnyzHhaT1tIpO8FD1D5RuU3Fbq8THMadmNoknnSwKB9hGOx3JSo
 9OgCVPZ0ChLJsVYfXDyAbZmg8Bo+ncPHVka+o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PDyrwk3dKvoxKjer/W/nKoHZ25xkHMzcXLNqNVSjI98=;
 b=gQlpkKLTKArl6oqk3SWeoOQxWwjB2Mv1AupE0lJA8xTgAEDOmt/Wd4TrlVdkAffRMn
 WMsNhI9RH82HAAAMbC4NEygK1Qg8vlQZqwIVfb2w7EHX+KaWXzoL+FjbnCTHSZ4vT+F3
 7/ypJO/ChoY7xz85lI/dwqMxpMs/LXJ+QHJMCO64eiw2QAMQdAvIjA4EMu/2+kDl565e
 G29SNg8JVmQ4qxqmxlAi+4taUhsIeRoX54GBJX6ZcIAgFDaot1txlIulOcmMzeks/CBo
 ruTTVYRzj9BRO/7GkYSzXBuFl/tApW9S3QL3Ww/+CtB/BEW5CPY73O9xy45jLjRekJ9M
 Givw==
X-Gm-Message-State: AOAM531wh6F8JzMuEA8i8s/UcOlSfZzZqkxEQd0AkHdUYk//lAQyHl6a
 CuzuGUN5m7t0dC7fSKIQra1hbA==
X-Google-Smtp-Source: ABdhPJw/3HNuoTaSGjywqAr2hcme1ypfuSgw3ugqZ0Om4CEwcZ/8hmi6P3tglXLSkIpe+RJxzArq6w==
X-Received: by 2002:a17:902:b408:b029:ec:e879:bbd8 with SMTP id
 x8-20020a170902b408b02900ece879bbd8mr2877299plr.65.1621320149869; 
 Mon, 17 May 2021 23:42:29 -0700 (PDT)
Received: from localhost ([2401:fa00:95:205:f284:b819:54ca:c198])
 by smtp.gmail.com with UTF8SMTPSA id f21sm7240386pjt.11.2021.05.17.23.42.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 May 2021 23:42:29 -0700 (PDT)
From: Claire Chang <tientzu@chromium.org>
To: Rob Herring <robh+dt@kernel.org>, mpe@ellerman.id.au,
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Frank Rowand <frowand.list@gmail.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, boris.ostrovsky@oracle.com,
 jgross@suse.com, Christoph Hellwig <hch@lst.de>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH v7 00/15] Restricted DMA 
Date: Tue, 18 May 2021 14:42:00 +0800
Message-Id: <20210518064215.2856977-1-tientzu@chromium.org>
X-Mailer: git-send-email 2.31.1.751.gd2f1c929bd-goog
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

v7:
Fix debugfs, PageHighMem and comment style in rmem_swiotlb_device_init

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

Claire Chang (15):
  swiotlb: Refactor swiotlb init functions
  swiotlb: Refactor swiotlb_create_debugfs
  swiotlb: Add DMA_RESTRICTED_POOL
  swiotlb: Add restricted DMA pool initialization
  swiotlb: Add a new get_io_tlb_mem getter
  swiotlb: Update is_swiotlb_buffer to add a struct device argument
  swiotlb: Update is_swiotlb_active to add a struct device argument
  swiotlb: Bounce data from/to restricted DMA pool if available
  swiotlb: Move alloc_size to find_slots
  swiotlb: Refactor swiotlb_tbl_unmap_single
  dma-direct: Add a new wrapper __dma_direct_free_pages()
  swiotlb: Add restricted DMA alloc/free support.
  dma-direct: Allocate memory from restricted DMA pool if available
  dt-bindings: of: Add restricted DMA pool
  of: Add plumbing for restricted DMA pool

 .../reserved-memory/reserved-memory.txt       |  27 ++
 drivers/gpu/drm/i915/gem/i915_gem_internal.c  |   2 +-
 drivers/gpu/drm/nouveau/nouveau_ttm.c         |   2 +-
 drivers/iommu/dma-iommu.c                     |  12 +-
 drivers/of/address.c                          |  25 ++
 drivers/of/device.c                           |   3 +
 drivers/of/of_private.h                       |   5 +
 drivers/pci/xen-pcifront.c                    |   2 +-
 drivers/xen/swiotlb-xen.c                     |   2 +-
 include/linux/device.h                        |   4 +
 include/linux/swiotlb.h                       |  41 ++-
 kernel/dma/Kconfig                            |  14 +
 kernel/dma/direct.c                           |  63 +++--
 kernel/dma/direct.h                           |   9 +-
 kernel/dma/swiotlb.c                          | 242 +++++++++++++-----
 15 files changed, 356 insertions(+), 97 deletions(-)

-- 
2.31.1.751.gd2f1c929bd-goog

