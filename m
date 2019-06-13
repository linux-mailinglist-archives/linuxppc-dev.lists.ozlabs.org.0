Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E639743454
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Jun 2019 10:46:48 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45PcmQ1bL7zDrBB
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Jun 2019 18:46:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=huawei.com
 (client-ip=45.249.212.32; helo=huawei.com;
 envelope-from=thunder.leizhen@huawei.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=huawei.com
Received: from huawei.com (szxga06-in.huawei.com [45.249.212.32])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45PchK42crzDr9w
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Jun 2019 18:43:13 +1000 (AEST)
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 67F28FAF1D69440836FB;
 Thu, 13 Jun 2019 16:43:05 +0800 (CST)
Received: from HGHY4L002753561.china.huawei.com (10.133.215.186) by
 DGGEMS403-HUB.china.huawei.com (10.3.19.203) with Microsoft SMTP Server id
 14.3.439.0; Thu, 13 Jun 2019 16:42:58 +0800
From: Zhen Lei <thunder.leizhen@huawei.com>
To: Jean-Philippe Brucker <jean-philippe.brucker@arm.com>, John Garry
 <john.garry@huawei.com>, Robin Murphy <robin.murphy@arm.com>, Will Deacon
 <will.deacon@arm.com>, Joerg Roedel <joro@8bytes.org>, Jonathan Corbet
 <corbet@lwn.net>, linux-doc <linux-doc@vger.kernel.org>, Sebastian Ott
 <sebott@linux.ibm.com>, Gerald Schaefer <gerald.schaefer@de.ibm.com>,
 "Martin Schwidefsky" <schwidefsky@de.ibm.com>, Heiko Carstens
 <heiko.carstens@de.ibm.com>, Benjamin Herrenschmidt
 <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, "Michael
 Ellerman" <mpe@ellerman.id.au>, Tony Luck <tony.luck@intel.com>, Fenghua Yu
 <fenghua.yu@intel.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar
 <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, "H . Peter Anvin"
 <hpa@zytor.com>, David Woodhouse <dwmw2@infradead.org>, iommu
 <iommu@lists.linux-foundation.org>, linux-kernel
 <linux-kernel@vger.kernel.org>, linux-s390 <linux-s390@vger.kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, x86 <x86@kernel.org>,
 linux-ia64 <linux-ia64@vger.kernel.org>
Subject: [PATCH v9 0/7] iommu: enhance IOMMU default DMA mode build options
Date: Thu, 13 Jun 2019 16:42:33 +0800
Message-ID: <20190613084240.16768-1-thunder.leizhen@huawei.com>
X-Mailer: git-send-email 2.21.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.133.215.186]
X-CFilter-Loop: Reflected
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
Cc: Zhen Lei <thunder.leizhen@huawei.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

v8--> v9
1. Fix some text editing errors

v7--> v8
1. Split into multiple small patches base on ARCHs or IOMMU drivers.
2. Hide the unsupported build options on the related ARCH or IOMMU.

v6 --> v7:
1. Fix some text editing errors

v5 --> v6:
1. give up adding boot option iommu.dma_mode

v4 --> v5:
As Hanjun and Thomas Gleixner's suggestion:
1. Keep the old ARCH specific boot options no change.
2. Keep build option CONFIG_IOMMU_DEFAULT_PASSTHROUGH no change.

v4:
As Robin Murphy's suggestion:
"It's also not necessarily obvious to the user how this interacts with
IOMMU_DEFAULT_PASSTHROUGH, so if we really do go down this route, maybe it
would be better to refactor the whole lot into a single selection of something
like IOMMU_DEFAULT_MODE anyway."

In this version, I tried to normalize the IOMMU dma mode boot options for all
ARCHs. When IOMMU is enabled, there are 3 dma modes: paasthrough(bypass),
lazy(mapping but defer the IOTLB invalidation), strict. But currently each
ARCHs defined their private boot options, different with each other. For
example, to enable/disable "passthrough", ARM64 use iommu.passthrough=1/0,
X86 use iommu=pt/nopt, PPC/POWERNV use iommu=nobypass.

Zhen Lei (7):
  iommu: enhance IOMMU default DMA mode build options
  x86/dma: use IS_ENABLED() to simplify the code
  s390/pci: add support for IOMMU default DMA mode build options
  powernv/iommu: add support for IOMMU default DMA mode build options
  iommu/vt-d: add support for IOMMU default DMA mode build options
  iommu/amd: add support for IOMMU default DMA mode build options
  ia64: hide build option IOMMU_DEFAULT_PASSTHROUGH

 arch/powerpc/platforms/powernv/pci-ioda.c |  3 +-
 arch/s390/pci/pci_dma.c                   |  2 +-
 arch/x86/kernel/pci-dma.c                 |  6 +---
 drivers/iommu/Kconfig                     | 48 +++++++++++++++++++++++++------
 drivers/iommu/amd_iommu_init.c            |  2 +-
 drivers/iommu/intel-iommu.c               |  2 +-
 drivers/iommu/iommu.c                     |  3 +-
 7 files changed, 48 insertions(+), 18 deletions(-)

-- 
1.8.3


