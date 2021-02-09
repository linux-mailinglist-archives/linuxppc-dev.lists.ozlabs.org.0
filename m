Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 438513148AD
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Feb 2021 07:23:39 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DZXs41FhRzDsfr
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Feb 2021 17:23:36 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::1029;
 helo=mail-pj1-x1029.google.com; envelope-from=tientzu@chromium.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256
 header.s=google header.b=favimtx+; dkim-atps=neutral
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [IPv6:2607:f8b0:4864:20::1029])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DZXq10FnDzDsdD
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Feb 2021 17:21:47 +1100 (AEDT)
Received: by mail-pj1-x1029.google.com with SMTP id nm1so978752pjb.3
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 08 Feb 2021 22:21:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=d/9o6gw27S6UN8MkYq1blVrCI9BLsI4+H00tlbC8EBE=;
 b=favimtx+6weGe8M555lmQOBhCoy54oReElTcJzpJXeVeBgHQUImtrzhR4xL2PNQ4hj
 B61sBGHNGjtqai17pbRiKkfpKFlyf3N7SfEZNhj9p694hdjwUDNvbaxplQIoX3Y2HB75
 oM9e2a4FzCjXRLbXyImmgB1sz2HO9c4H1yk+0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=d/9o6gw27S6UN8MkYq1blVrCI9BLsI4+H00tlbC8EBE=;
 b=cQ/6c1JHYlr8yCv4+ZJI5ny/QrqsjZo4WoWkjZWaI2dLejKBxP1IBYqYvbrXA71q+W
 2h2UTdeUrSN6muVhCsReMLBuAFtgmA52EiCW6zf1TnHodkHdqETsy/vcP3bJy6pWuVMu
 sm/xsaViQluA1QVkeIOd2xpr+dMPC0p7pQzllxkpFjAvFhANuo9S1G56n9ZP/wZ74ziK
 RK8Qp+bgW59AxMDxRjtIaFCS9ckEgTh+iy98vDtRJO3w3Dcn1B0XKsenmlmbWq0X+jF/
 QgHgm9X1Bk5L/dNt739KohPVbNEa/F4PXEjTrg8OG4GaQ9BvcIiwb08Ke1c5TAWI3Kyo
 KdKg==
X-Gm-Message-State: AOAM532HaoNJh92e6faYG6IllYXsBYt0OXK8ZNGWsqAHeRkrpoX+qqOt
 e6RmTAS1WiYiz3UwC4cyLHqc7w==
X-Google-Smtp-Source: ABdhPJz0oyYOZadpQA/7+OnNYsgqbz6PN7ozvQBTUr4giRuwP1fH3QYLnHESLb3E3I02eo5S/4aG/w==
X-Received: by 2002:a17:90a:4fe4:: with SMTP id
 q91mr2479504pjh.165.1612851703796; 
 Mon, 08 Feb 2021 22:21:43 -0800 (PST)
Received: from localhost ([2401:fa00:1:10:a106:46e1:a999:81df])
 by smtp.gmail.com with UTF8SMTPSA id s23sm21047537pgj.29.2021.02.08.22.21.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Feb 2021 22:21:43 -0800 (PST)
From: Claire Chang <tientzu@chromium.org>
To: Rob Herring <robh+dt@kernel.org>, mpe@ellerman.id.au,
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Frank Rowand <frowand.list@gmail.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, boris.ostrovsky@oracle.com,
 jgross@suse.com, Christoph Hellwig <hch@lst.de>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH v4 00/14] Restricted DMA
Date: Tue,  9 Feb 2021 14:21:17 +0800
Message-Id: <20210209062131.2300005-1-tientzu@chromium.org>
X-Mailer: git-send-email 2.30.0.478.g8a0d178c01-goog
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
Cc: heikki.krogerus@linux.intel.com, peterz@infradead.org, grant.likely@arm.com,
 paulus@samba.org, mingo@kernel.org, sstabellini@kernel.org,
 Saravana Kannan <saravanak@google.com>, xypron.glpk@gmx.de,
 "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 xen-devel@lists.xenproject.org, Thierry Reding <treding@nvidia.com>,
 linux-devicetree <devicetree@vger.kernel.org>, linuxppc-dev@lists.ozlabs.org,
 Nicolas Boichat <drinkcat@chromium.org>, Claire Chang <tientzu@chromium.org>,
 Dan Williams <dan.j.williams@intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Greg KH <gregkh@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>,
 lkml <linux-kernel@vger.kernel.org>,
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

Claire Chang (14):
  swiotlb: Remove external access to io_tlb_start
  swiotlb: Move is_swiotlb_buffer() to swiotlb.c
  swiotlb: Add struct swiotlb
  swiotlb: Refactor swiotlb_late_init_with_tbl
  swiotlb: Add DMA_RESTRICTED_POOL
  swiotlb: Add restricted DMA pool
  swiotlb: Update swiotlb API to gain a struct device argument
  swiotlb: Use restricted DMA pool if available
  swiotlb: Refactor swiotlb_tbl_{map,unmap}_single
  dma-direct: Add a new wrapper __dma_direct_free_pages()
  swiotlb: Add is_dev_swiotlb_force()
  swiotlb: Add restricted DMA alloc/free support.
  dt-bindings: of: Add restricted DMA pool
  of: Add plumbing for restricted DMA pool

 .../reserved-memory/reserved-memory.txt       |  24 +
 arch/powerpc/platforms/pseries/svm.c          |   4 +-
 drivers/iommu/dma-iommu.c                     |  12 +-
 drivers/of/address.c                          |  25 +
 drivers/of/device.c                           |   3 +
 drivers/of/of_private.h                       |   5 +
 drivers/xen/swiotlb-xen.c                     |   4 +-
 include/linux/device.h                        |   4 +
 include/linux/swiotlb.h                       |  32 +-
 kernel/dma/Kconfig                            |  14 +
 kernel/dma/direct.c                           |  51 +-
 kernel/dma/direct.h                           |   8 +-
 kernel/dma/swiotlb.c                          | 636 ++++++++++++------
 13 files changed, 582 insertions(+), 240 deletions(-)

-- 

v4:
  - Fix spinlock bad magic
  - Use rmem->name for debugfs entry
  - Address the comments in v3

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

2.30.0.478.g8a0d178c01-goog

