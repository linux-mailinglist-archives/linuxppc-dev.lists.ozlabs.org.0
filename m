Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6730E7D06C
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Aug 2019 00:01:09 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45zS6l2pStzDqP3
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Aug 2019 08:01:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=suse.de
 (client-ip=195.135.220.15; helo=mx1.suse.de;
 envelope-from=nsaenzjulienne@suse.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=suse.de
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45zJBZ4wLmzDqJM
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Aug 2019 02:03:49 +1000 (AEST)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id D13F2AF9A;
 Wed, 31 Jul 2019 15:48:00 +0000 (UTC)
From: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
To: catalin.marinas@arm.com, hch@lst.de, wahrenst@gmx.net,
 marc.zyngier@arm.com, Robin Murphy <robin.murphy@arm.com>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 iommu@lists.linux-foundation.org, linux-mm@kvack.org
Subject: [PATCH 0/8] Raspberry Pi 4 DMA addressing support
Date: Wed, 31 Jul 2019 17:47:43 +0200
Message-Id: <20190731154752.16557-1-nsaenzjulienne@suse.de>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 01 Aug 2019 07:55:07 +1000
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
Cc: phill@raspberryi.org, linux-s390@vger.kernel.org, f.fainelli@gmail.com,
 mbrugger@suse.com, frowand.list@gmail.com, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, eric@anholt.net, robh+dt@kernel.org,
 linux-rpi-kernel@lists.infradead.org, akpm@linux-foundation.org,
 will@kernel.org, nsaenzjulienne@suse.de, m.szyprowski@samsung.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi all,
this series attempts to address some issues we found while bringing up
the new Raspberry Pi 4 in arm64 and it's intended to serve as a follow
up of this discussion:
https://lkml.org/lkml/2019/7/17/476

The new Raspberry Pi 4 has up to 4GB of memory but most peripherals can
only address the first GB: their DMA address range is
0xc0000000-0xfc000000 which is aliased to the first GB of physical
memory 0x00000000-0x3c000000. Note that only some peripherals have these
limitations: the ARM cores, PCIe, V3D, GENET, and 40-bit DMA channels
have a wider view of the address space.

Part of this is solved in arm32 by setting up the machine specific
'.dma_zone_size = SZ_1G', which takes care of the allocating the
coherent memory area at the right spot. Yet no buffer bouncing (needed
for dma streaming) is available at the moment, but that's a story for
another series.

Unfortunately there is no such thing as '.dma_zone_size' in arm64 also
only ZONE_DMA32 is created which is interpreted by dma-direct and the
arm64 code as if all peripherals where be able to address the first 4GB
of memory.

In the light of this, the series implements the following changes:

- Add code that parses the device-tree in oder to find the SoC's common
  DMA area.

- Create a ZONE_DMA whenever that area is needed and add the rest of the
  lower 4 GB of memory to ZONE_DMA32*.

- Create the CMA area in a place suitable for all peripherals.

- Inform dma-direct of the new runtime calculated min_mask*.

That's all.

Regards,
Nicolas

* These solutions where already discussed on the previous RFC (see link
above).

---

Nicolas Saenz Julienne (8):
  arm64: mm: use arm64_dma_phys_limit instead of calling
    max_zone_dma_phys()
  arm64: rename variables used to calculate ZONE_DMA32's size
  of/fdt: add function to get the SoC wide DMA addressable memory size
  arm64: re-introduce max_zone_dma_phys()
  arm64: use ZONE_DMA on DMA addressing limited devices
  dma-direct: turn ARCH_ZONE_DMA_BITS into a variable
  arm64: update arch_zone_dma_bits to fine tune dma-direct min mask
  mm: comment arm64's usage of 'enum zone_type'

 arch/arm64/Kconfig              |  4 ++
 arch/arm64/mm/init.c            | 78 ++++++++++++++++++++++++++-------
 arch/powerpc/include/asm/page.h |  9 ----
 arch/powerpc/mm/mem.c           | 14 +++++-
 arch/s390/include/asm/page.h    |  2 -
 arch/s390/mm/init.c             |  1 +
 drivers/of/fdt.c                | 72 ++++++++++++++++++++++++++++++
 include/linux/dma-direct.h      |  2 +
 include/linux/mmzone.h          | 21 ++++-----
 include/linux/of_fdt.h          |  2 +
 kernel/dma/direct.c             |  8 ++--
 11 files changed, 168 insertions(+), 45 deletions(-)

-- 
2.22.0

