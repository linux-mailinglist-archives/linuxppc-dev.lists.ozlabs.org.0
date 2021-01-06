Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id F3DD52EB89A
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Jan 2021 04:46:32 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4D9ZzT5y7mzDqZR
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Jan 2021 14:46:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::1030;
 helo=mail-pj1-x1030.google.com; envelope-from=tientzu@chromium.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256
 header.s=google header.b=akatZ9qv; dkim-atps=neutral
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com
 [IPv6:2607:f8b0:4864:20::1030])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4D9Zsx4DlnzDqVC
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 Jan 2021 14:41:37 +1100 (AEDT)
Received: by mail-pj1-x1030.google.com with SMTP id v1so873625pjr.2
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 05 Jan 2021 19:41:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=U3TpLfW+vImhvH0nGRTRbZCkU/q6uvDGxQ/ffdS/DVM=;
 b=akatZ9qvuVqvk7jTIGmhjfDVt/R+fkDe7KGtuV2FiL0W9X0lfcwuxwQ5SDHkDWvo/Y
 OU4FPQJAhXwq03c8Ys0HNgl+IupiV5k8xFok85r5ImLAz1DYG9c87lF8ePniw4ZUVnDj
 udHjYJ0V3gqIMjH0S4jHAYa5kPGyqU1QS8adQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=U3TpLfW+vImhvH0nGRTRbZCkU/q6uvDGxQ/ffdS/DVM=;
 b=mpi60cjIqOSuSXEHSeGEuFb4KTnX5drFx8YajrFNv//8ITCdoeVyg8w+6IRVzTqye0
 wshTSfy8iWv0Xhf6rp4zga/GVliSjRfDnLCDB7UiLh/ZDqE4GUmssV+PuQsJ4UxeOH/9
 HlBoKbUB1wKQ7Yu86fcBlBRJZliE1Lagegf+ZpK4rmWuXMmYK+DLBGaQlM55a/bBcTHy
 VCVmpkYb8Cp5vZ+7kb7sr1EaKlw4sZ9oc+LI1il+2pCBs7ajJBunTk8npXznTVL/DVTN
 03biRYO5mN2Bvu9CBVvgYOBaRvfXUc0j2w2pq+lmw0eAzrXsXRp2H54RHeM9y08Cf5bX
 0hoQ==
X-Gm-Message-State: AOAM533a5ZfEwh4D+6ZAxmj4wAbuynV0N8+thciNstcs81H+UeNmR9VI
 AMHnxucgXFimVnNPv2XNfGbTJA==
X-Google-Smtp-Source: ABdhPJzMVJXWuHdnqMMSkgz9jt5n+Akn+pP0QJigxunJGEBd/ODEkJmP1Ra/LRA2SYqMSUv/fxQHkA==
X-Received: by 2002:a17:90a:4582:: with SMTP id
 v2mr1714522pjg.58.1609904492458; 
 Tue, 05 Jan 2021 19:41:32 -0800 (PST)
Received: from localhost ([2401:fa00:1:10:3e52:82ff:fe5e:cc9d])
 by smtp.gmail.com with ESMTPSA id v10sm544816pjr.47.2021.01.05.19.41.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Jan 2021 19:41:31 -0800 (PST)
From: Claire Chang <tientzu@chromium.org>
To: robh+dt@kernel.org, mpe@ellerman.id.au, benh@kernel.crashing.org,
 paulus@samba.org, joro@8bytes.org, will@kernel.org, frowand.list@gmail.com,
 konrad.wilk@oracle.com, boris.ostrovsky@oracle.com, jgross@suse.com,
 sstabellini@kernel.org, hch@lst.de, m.szyprowski@samsung.com,
 robin.murphy@arm.com
Subject: [RFC PATCH v3 0/6] Restricted DMA
Date: Wed,  6 Jan 2021 11:41:18 +0800
Message-Id: <20210106034124.30560-1-tientzu@chromium.org>
X-Mailer: git-send-email 2.29.2.729.g45daf8777d-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 06 Jan 2021 14:44:46 +1100
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
 mingo@kernel.org, drinkcat@chromium.org, saravanak@google.com,
 xypron.glpk@gmx.de, rafael.j.wysocki@intel.com, bgolaszewski@baylibre.com,
 xen-devel@lists.xenproject.org, treding@nvidia.com, devicetree@vger.kernel.org,
 Claire Chang <tientzu@chromium.org>, dan.j.williams@intel.com,
 andriy.shevchenko@linux.intel.com, gregkh@linuxfoundation.org,
 rdunlap@infradead.org, linux-kernel@vger.kernel.org, tfiga@chromium.org,
 iommu@lists.linux-foundation.org, linuxppc-dev@lists.ozlabs.org,
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
usually done at firmware level, e.g. in ATF on some ARM platforms).

[1a] https://googleprojectzero.blogspot.com/2017/04/over-air-exploiting-broadcoms-wi-fi_4.html
[1b] https://googleprojectzero.blogspot.com/2017/04/over-air-exploiting-broadcoms-wi-fi_11.html
[2] https://blade.tencent.com/en/advisories/qualpwn/
[3] https://www.bleepingcomputer.com/news/security/vulnerabilities-found-in-highly-popular-firmware-for-wifi-chips/

Claire Chang (6):
  swiotlb: Add io_tlb_mem struct
  swiotlb: Add restricted DMA pool
  swiotlb: Use restricted DMA pool if available
  swiotlb: Add restricted DMA alloc/free support.
  dt-bindings: of: Add restricted DMA pool
  of: Add plumbing for restricted DMA pool

 .../reserved-memory/reserved-memory.txt       |  24 +
 arch/powerpc/platforms/pseries/svm.c          |   4 +-
 drivers/iommu/dma-iommu.c                     |  12 +-
 drivers/of/address.c                          |  21 +
 drivers/of/device.c                           |   4 +
 drivers/of/of_private.h                       |   5 +
 drivers/xen/swiotlb-xen.c                     |   4 +-
 include/linux/device.h                        |   4 +
 include/linux/swiotlb.h                       |  61 +-
 kernel/dma/Kconfig                            |   1 +
 kernel/dma/direct.c                           |  20 +-
 kernel/dma/direct.h                           |  10 +-
 kernel/dma/swiotlb.c                          | 576 +++++++++++-------
 13 files changed, 514 insertions(+), 232 deletions(-)

-- 
2.29.2.729.g45daf8777d-goog

v3: 
  Using only one reserved memory region for both streaming DMA and memory
  allocation.

v2:
  Building on top of swiotlb.
  https://lore.kernel.org/patchwork/cover/1280705/

v1:
  Using dma_map_ops.
  https://lore.kernel.org/patchwork/cover/1271660/
